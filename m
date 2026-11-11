Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F9F7606A31C
	for <xen-devel@archiver.kernel.org>; Wed, 11 Nov 2026 17:15:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=xenproject.org header.i=@xenproject.org header.a=rsa-sha256 header.s=20200302mail header.b=fgqkU0Bn
Received: from list by lists.xenproject.org with outflank-mailman.1484428.1687738 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRBuJ-0007qR-9N; Wed, 11 Nov 2026 17:14:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1484428.1687738; Wed, 11 Nov 2026 17:14:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRBuJ-0007qK-6q; Wed, 11 Nov 2026 17:14:47 +0000
Received: by outflank-mailman (input) for mailman id 1484428;
 Wed, 11 Nov 2026 17:14:46 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <gwd@xenproject.org>) id 1xRBuI-0007q9-4S
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2026 17:14:46 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.98.2)
 (envelope-from <gwd@xenproject.org>) id 1xRBuH-00000008UXv-1vLw;
 Wed, 11 Nov 2026 17:14:45 +0000
Received: from [217.155.165.12]
 (helo=4b664947-eb84-4a1c-9b91-21fc87073f93.fritz.box.net)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_CHACHA20_POLY1305_SHA256 (Exim 4.98.2)
 (envelope-from <gwd@xenproject.org>) id 1xRBuH-0000000FCa8-2sIG;
 Wed, 11 Nov 2026 17:14:45 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From;
	bh=fgoZGcBdYHUqOg9maa78GDVmQKMaog+TgDYIaaX+ybc=; b=fgqkU0BngJki1RBMHzgwdIb55S
	R3ON0IptGU/ecYrz1Owz3NycdFVHf9264zJjAcJDh8twZu3r+V+W6M/UEs9nMpIuxEZc4prtzBWLM
	3/74TiX3vYbNDvHC87cYEnyxZUzrUrpnFridLkVReec67ack0TFXoCqcnmBBnumGk/Qo=;
From: George Dunlap <gwd@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v2 1/2] tools/libs/guest: re-read dominfo after changing a PV guest's width on restore
Date: Wed, 11 Nov 2026 17:14:40 +0000
Message-ID: <20261111171441.23101-1-gwd@xenproject.org>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-19.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The x86 PV restore code reads the domain's information once, when the
stream starts, and keeps it in ctx->dominfo.  When the X86_PV_INFO
record gives a width other than the domain's, handle_x86_pv_info()
changes it with XEN_DOMCTL_set_address_size, and then refreshes only
the guest's width and page-table levels.

Since 8a9255405ca6 ("x86/domain: adjust limitation on shared_info
allocation below 4G"), making a domain 32-bit may replace a
shared_info page (if the originally allocated page was above 4GiB).
The shared_info_frame read when the stream started will refer to a
freed page.  handle_shared_info() maps that frame to write the
SHARED_INFO record, and process_start_info() puts it in the guest's
start_info.  Xen holds no reference to the replaced page by then, so
the mapping fails, and with it the restore of any 32-bit PV guest
whose shared_info page was moved.

Re-read the domain's information after changing its width.

Fixes: 8a9255405ca6 ("x86/domain: adjust limitation on shared_info allocation below 4G")
Assisted-by: Claude Code:claude-opus-5-5
Signed-off-by: George Dunlap <gwd@xenproject.org>
---
Not tested end to end: no 32-bit PV guest here can suspend.  Restore's
steps replayed from dom0 on staging, on an Intel box (create a PV
domain, read its info, make it 32-bit, populate 1GiB, then map the
frame read first): that map fails with -EBUSY every time, while the
frame read after the switch maps.  Build-tested.
---
 tools/libs/guest/xg_sr_restore_x86_pv.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/tools/libs/guest/xg_sr_restore_x86_pv.c b/tools/libs/guest/xg_sr_restore_x86_pv.c
index 876748c11e..b72cacd000 100644
--- a/tools/libs/guest/xg_sr_restore_x86_pv.c
+++ b/tools/libs/guest/xg_sr_restore_x86_pv.c
@@ -646,6 +646,12 @@ static int handle_x86_pv_info(struct xc_sr_context *ctx,
         }
 
         /* Domain's information changed, better to refresh. */
+        if ( xc_domain_getinfo_single(xch, ctx->domid, &ctx->dominfo) < 0 )
+        {
+            PERROR("Failed to refresh dominfo for d%d", ctx->domid);
+            return -1;
+        }
+
         rc = x86_pv_domain_info(ctx);
         if ( rc != 0 )
         {
-- 
2.56.0


