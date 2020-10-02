Return-Path: <SRS0=mHc1=DJ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E199BC4363C
	for <xen-devel@archiver.kernel.org>; Fri,  2 Oct 2020 17:33:41 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 709A820795
	for <xen-devel@archiver.kernel.org>; Fri,  2 Oct 2020 17:33:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="QAcJKzMx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 709A820795
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.2284.6812 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kOOvu-0001ml-FA; Fri, 02 Oct 2020 17:33:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 2284.6812; Fri, 02 Oct 2020 17:33:26 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kOOvu-0001me-Be; Fri, 02 Oct 2020 17:33:26 +0000
Received: by outflank-mailman (input) for mailman id 2284;
 Fri, 02 Oct 2020 17:33:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iJBK=DJ=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kOOvt-0001mY-KR
 for xen-devel@lists.xenproject.org; Fri, 02 Oct 2020 17:33:25 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fd031275-61be-42a9-a50c-9373a991b7fc;
 Fri, 02 Oct 2020 17:33:24 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=iJBK=DJ=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
	id 1kOOvt-0001mY-KR
	for xen-devel@lists.xenproject.org; Fri, 02 Oct 2020 17:33:25 +0000
X-Inumbo-ID: fd031275-61be-42a9-a50c-9373a991b7fc
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id fd031275-61be-42a9-a50c-9373a991b7fc;
	Fri, 02 Oct 2020 17:33:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1601660004;
  h=from:to:cc:subject:date:message-id:mime-version;
  bh=5ijSWnf0ZluClQuPI9UzrQI0WNYZ7aTO7Rm1qkH0l7g=;
  b=QAcJKzMxsbPE7YscW9TiVgPBFCyrSiiEjyakN06KX9Z4hSp1JcIgIJ7x
   p8HZYqjXT/bmaX/r085zgCqJOo14pkfMhzyeag6NFRS7jPN+1OnMt7Rgi
   DR/WVoZDaUjqmtgwlU04VWyd5pjp+qiD27FjWEirHPJf5fUzJeX6nq7zY
   c=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: iSvM/BbexMhPgj/TdHXXgsohZGzUu3Yb9HHZJr8+Lavk26K0iouKVKdTETpvQTe3RG8+B1gho5
 toQH15h7EEi+/+3xIvCOXltWI5+7cerioS5JgIW90++y1OsA7Ervp4z7brfjzEtkhimels+61i
 EHLKPF9tnRX6QdLiKKoN+yAs7le2gULZ3CTKX7NxQBvwHwHnxkU3afJM1Nt4sxmMt6rwZxKn5F
 h2V61e6XWR5RK2gKHYjSCV6FmvXca6+reCXvjORk5U51F9VLP9sBoTd9EYpPiMXebx2CtV6UQg
 gIk=
X-SBRS: None
X-MesageID: 28183010
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,328,1596513600"; 
   d="scan'208";a="28183010"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson
	<iwj@xenproject.org>, Wei Liu <wl@xen.org>, Anthony PERARD
	<anthony.perard@citrix.com>
Subject: [PATCH] tools/libxl: Work around libvirt breakage in libxl__cpuid_legacy()
Date: Fri, 2 Oct 2020 18:32:59 +0100
Message-ID: <20201002173259.19702-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain

OSSTest reports that libvirt is reliably regressed.

The only possible option is a side effect of using libxl_defbool_val(), which
can only be the assert() within.  Unfortunately, libvirt actually crashes in
__vfscanf_internal() while presuambly trying to render some form of error.

Opencode the check without the assert() to unblock staging, while we
investigate what is going on with libvirt.  This will want reverting at some
point in the future.

Not-really-fixes: bfcc97c08c ("tools/cpuid: Plumb nested_virt down into xc_cpuid_apply_policy()" reliably breaks libvirt.)
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Ian Jackson <iwj@xenproject.org>
CC: Wei Liu <wl@xen.org>
CC: Anthony PERARD <anthony.perard@citrix.com>
---
 tools/libs/light/libxl_cpuid.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/tools/libs/light/libxl_cpuid.c b/tools/libs/light/libxl_cpuid.c
index 08e85dcffb..16c077cceb 100644
--- a/tools/libs/light/libxl_cpuid.c
+++ b/tools/libs/light/libxl_cpuid.c
@@ -422,7 +422,15 @@ void libxl__cpuid_legacy(libxl_ctx *ctx, uint32_t domid, bool restore,
 {
     bool pae = true;
     bool itsc;
-    bool nested_virt = libxl_defbool_val(info->nested_hvm);
+
+    /*
+     * Gross hack.  Using libxl_defbool_val() here causes libvirt to crash in
+     * __vfscanf_internal(), which is probably collateral damage from a side
+     * effect of the assert().
+     *
+     * Unblock things for now by opencoding without the assert.
+     */
+    bool nested_virt = info->nested_hvm.val > 0;
 
     /*
      * For PV guests, PAE is Xen-controlled (it is the 'p' that differentiates
-- 
2.11.0


