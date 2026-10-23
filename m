Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 452CB606A31B
	for <xen-devel@archiver.kernel.org>; Fri, 23 Oct 2026 13:33:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=xenproject.org header.i=@xenproject.org header.a=rsa-sha256 header.s=20200302mail header.b=vphwwyHw
Received: from list by lists.xenproject.org with outflank-mailman.1459273.1671265 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xKFOg-00029k-Tj; Fri, 23 Oct 2026 13:33:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1459273.1671265; Fri, 23 Oct 2026 13:33:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xKFOg-00029d-QW; Fri, 23 Oct 2026 13:33:26 +0000
Received: by outflank-mailman (input) for mailman id 1459273;
 Fri, 23 Oct 2026 13:33:25 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger@xenproject.org>) id 1xKFOf-00029X-Nl
 for xen-devel@lists.xenproject.org; Fri, 23 Oct 2026 13:33:25 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.98.2)
 (envelope-from <roger@xenproject.org>) id 1xKFOf-00000009CNX-2ZzA;
 Fri, 23 Oct 2026 13:33:25 +0000
Received: from 224.pool85-54-217.dynamic.orange.es ([85.54.217.224]
 helo=localhost) by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <roger@xenproject.org>) id 1xKFOf-0000000Ccbq-0y6g;
 Fri, 23 Oct 2026 13:33:25 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From;
	bh=mguQbioMgtMh+Hd/Llm9Ull5AdKxQv7LibED4N9dzC4=; b=vphwwyHwktwkR/i37udhfAMaNk
	ZxdZtOk+5sQCc9oWfMBF02zknv6eauES7LXgtJVKnUJTzhUWzow3sqRmLSk0EZUTCx1zPsNuQgjAd
	7kjlIjPgc4hZBTNzHh3x7SBVjHBGGSaZ/irAsnzTr0tvirLyqLWUe0fIpoHacz+8RQ8w=;
From: Roger Pau Monne <roger@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger@xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH] xen/vcpu: ensure no write when runstate handler is NULL
Date: Fri, 23 Oct 2026 15:33:16 +0200
Message-ID: <20261023133316.64204-1-roger@xenproject.org>
X-Mailer: git-send-email 2.55.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-19.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Both the normal and the compat versions of
VCPUOP_register_runstate_memory_area allow registering a NULL handler as a
way to signal deregistration of the previous area, and
update_runstate_area() will skip the update when the handler is NULL.

However when handling the VCPUOP_register_runstate_memory_area hypercall
itself there's an unconditional attempt to update the newly registered
runstate area, without taking into account whether it points to NULL.  Skip
such update if the user-provided handle is NULL.

Signed-off-by: Roger Pau Monné <roger@xenproject.org>
---
 xen/arch/x86/x86_64/domain.c | 4 ++++
 xen/common/domain.c          | 4 ++++
 2 files changed, 8 insertions(+)

diff --git a/xen/arch/x86/x86_64/domain.c b/xen/arch/x86/x86_64/domain.c
index a02d4f569ee5..e4d49cbbfeb6 100644
--- a/xen/arch/x86/x86_64/domain.c
+++ b/xen/arch/x86/x86_64/domain.c
@@ -58,6 +58,10 @@ compat_vcpu_op(int cmd, unsigned int vcpuid, XEN_GUEST_HANDLE_PARAM(void) arg)
         rc = 0;
         guest_from_compat_handle(v->runstate_guest.compat, area.addr.h);
 
+        /* NULL handle is deregistering the address. */
+        if ( compat_handle_is_null(area.addr.h) )
+            break;
+
         if ( v == current )
         {
             XLAT_vcpu_runstate_info(&info, &v->runstate);
diff --git a/xen/common/domain.c b/xen/common/domain.c
index 6b52713518da..30a17b8b7edb 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -2330,6 +2330,10 @@ long common_vcpu_op(int cmd, struct vcpu *v, XEN_GUEST_HANDLE_PARAM(void) arg)
         rc = 0;
         runstate_guest(v) = area.addr.h;
 
+        /* NULL handle is deregistering the address. */
+        if ( guest_handle_is_null(area.addr.h) )
+            break;
+
         if ( v == current )
         {
             __copy_to_guest(runstate_guest(v), &v->runstate, 1);
-- 
2.55.0


