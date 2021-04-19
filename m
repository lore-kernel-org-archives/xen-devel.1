Return-Path: <SRS0=K98N=JQ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5F5CC43460
	for <xen-devel@archiver.kernel.org>; Mon, 19 Apr 2021 14:46:06 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 73E0D611CE
	for <xen-devel@archiver.kernel.org>; Mon, 19 Apr 2021 14:46:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 73E0D611CE
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.113025.215408 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lYV9x-0002GD-K9; Mon, 19 Apr 2021 14:45:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 113025.215408; Mon, 19 Apr 2021 14:45:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lYV9x-0002Fw-Fm; Mon, 19 Apr 2021 14:45:57 +0000
Received: by outflank-mailman (input) for mailman id 113025;
 Mon, 19 Apr 2021 14:45:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3l5R=JQ=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lYV9v-0002EE-SH
 for xen-devel@lists.xenproject.org; Mon, 19 Apr 2021 14:45:55 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id bcd3ca13-4f37-475a-9f8d-1e47120a74bc;
 Mon, 19 Apr 2021 14:45:50 +0000 (UTC)
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
X-Inumbo-ID: bcd3ca13-4f37-475a-9f8d-1e47120a74bc
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1618843550;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=nOQSoQs1TITAXQmOKdz/0x9ELGXH9h+Z3/1L3J87LV0=;
  b=htRE/+2ZyEt6LPHJCye49qBiCA/RBO1FsRrGUZ83+HMo4vPPgFLc1Vjg
   h+ouAYNFkhlXkK7vRN4rTDxUTzszJ1POFrpowDqpGdGLx4eJrFS4TkZ0H
   RQlOIbosbg2ZU7aAVr+nGiVU+aHBHcqXePFyV6fg0PNry5vIL8Z1TsYgj
   8=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: lmefLMuL0TWaSLNn1CmkCHo/heNOMhdehFGMFTk3fL0AGWjO/ypUVFnX3L9Z29NcV1HGFykjDU
 /FQCdATxDkRUPwoOkRu9Do7yUMa4crmEeDkETeb29Ss1Gfrhsm2D+KZARpbi2wYxc7bCiZJYPw
 49uMmbRJHnU1FvAxdBtQjawxmAk+H9Sh1ZpbscuppUeYk5sAerRzxYVnltWEMkrUlBfdn1k3f4
 2b8ULalUCc9ysXLBRhWQ3mtExvkb726pbfacSi69l63WQmhDgxFD+rvyNwVyvBA/qNep5kOI4Y
 gmo=
X-SBRS: 5.1
X-MesageID: 41896377
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:4tO3i6Gau51hla97pLqEDseALOonbusQ8zAX/mpaICY1TuWzkc
 eykPMHkSLugDEKV3063fyGMq+MQXTTnKQFh7U5F7GkQQXgpS+UPJhvhLGSpAHINiXi+odmpM
 RdWodkDtmYNzdHpOLbxCX9LNo62tmA98mT9IPj5lNgVxtjZa0lzyoRMHf4LmRMSANLBYU0Gf
 Onj6ItzVfNRV0tYtmmHX5AZuDfprTw5evbSCQbDB0q4hTmt1OVwYP9eiL34j4uFxdGwbIv6g
 H+4mnE2pk=
X-IronPort-AV: E=Sophos;i="5.82,234,1613451600"; 
   d="scan'208";a="41896377"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH] x86/pv: Fold adjacent paths in dom0_construct_pv()
Date: Mon, 19 Apr 2021 15:45:40 +0100
Message-ID: <20210419144540.546-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

This removes a visually-werid layout of conditionals.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
---
 xen/arch/x86/pv/dom0_build.c | 17 +++++++----------
 1 file changed, 7 insertions(+), 10 deletions(-)

diff --git a/xen/arch/x86/pv/dom0_build.c b/xen/arch/x86/pv/dom0_build.c
index e0801a9e6d..0ea906d6f8 100644
--- a/xen/arch/x86/pv/dom0_build.c
+++ b/xen/arch/x86/pv/dom0_build.c
@@ -615,9 +615,14 @@ int __init dom0_construct_pv(struct domain *d,
     {
         v->arch.pv.failsafe_callback_cs = FLAT_COMPAT_KERNEL_CS;
         v->arch.pv.event_callback_cs    = FLAT_COMPAT_KERNEL_CS;
-    }
 
-    if ( !compat )
+        /* Monitor table already created by switch_compat(). */
+        l4start = l4tab = __va(pagetable_get_paddr(v->arch.guest_table));
+        /* See public/xen.h on why the following is needed. */
+        maddr_to_page(mpt_alloc)->u.inuse.type_info = PGT_l3_page_table;
+        l3start = __va(mpt_alloc); mpt_alloc += PAGE_SIZE;
+    }
+    else
     {
         maddr_to_page(mpt_alloc)->u.inuse.type_info = PGT_l4_page_table;
         l4start = l4tab = __va(mpt_alloc); mpt_alloc += PAGE_SIZE;
@@ -626,14 +631,6 @@ int __init dom0_construct_pv(struct domain *d,
                           d, INVALID_MFN, true);
         v->arch.guest_table = pagetable_from_paddr(__pa(l4start));
     }
-    else
-    {
-        /* Monitor table already created by switch_compat(). */
-        l4start = l4tab = __va(pagetable_get_paddr(v->arch.guest_table));
-        /* See public/xen.h on why the following is needed. */
-        maddr_to_page(mpt_alloc)->u.inuse.type_info = PGT_l3_page_table;
-        l3start = __va(mpt_alloc); mpt_alloc += PAGE_SIZE;
-    }
 
     l4tab += l4_table_offset(v_start);
     pfn = alloc_spfn;
-- 
2.11.0


