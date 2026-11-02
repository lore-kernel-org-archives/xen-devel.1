Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 566CB606A326
	for <xen-devel@archiver.kernel.org>; Mon,  2 Nov 2026 13:46:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=google header.b=ucJH/tYB
Received: from list by lists.xenproject.org with outflank-mailman.1468224.1677320 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xNsMl-0001EV-O3; Mon, 02 Nov 2026 13:46:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1468224.1677320; Mon, 02 Nov 2026 13:46:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xNsMl-0001EK-LT; Mon, 02 Nov 2026 13:46:27 +0000
Received: by outflank-mailman (input) for mailman id 1468224;
 Mon, 02 Nov 2026 13:46:26 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xNsMk-0001DU-9m
 for xen-devel@lists.xenproject.org; Mon, 02 Nov 2026 13:46:26 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xNsMj-0051s4-Fi
 for xen-devel@lists.xenproject.org; Mon, 02 Nov 2026 14:46:25 +0100
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6ae89426-e002-0a2a0a5209dd-0a2a4509d446-36
 for <xen-devel@lists.xenproject.org>; Mon, 02 Nov 2026 14:46:25 +0100
Received: from [209.85.128.51] (helo=mail-wm1-f51.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6ae89431-be1a-0a2a45090019-d1558033d848-3
 for <xen-devel@lists.xenproject.org>; Mon, 02 Nov 2026 14:46:25 +0100
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-4a210470b49so24328515e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 02 Nov 2026 05:46:25 -0800 (PST)
Received: from localhost.localdomain (host-78-146-248-75.as13285.net.
 [78.146.248.75]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4abea533a1esm189367275e9.1.2026.11.02.05.46.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Nov 2026 05:46:23 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=citrix.com header.i="@citrix.com" header.h="Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1793627185; x=1794231985; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8bUDBLldb4ga8Z+0NByVHPMWmCV6UWEX+0YvHC8VfxI=;
        b=ucJH/tYBRmnDSlKdXEciU8Tv4D+tObji/O6ct8gCBM96DykTlKY+znyYm9KcVsxbt4
         4XhjZOfbdA1hDntDE6Enf03riWUIMTX/7E+yj0gPrS+54aNXdPv8Pr8xx9jES86fHWoG
         hpu8S8/sfwEwrmkLxQ7mZffeJGZWnSBc9wBlY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793627185; x=1794231985;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8bUDBLldb4ga8Z+0NByVHPMWmCV6UWEX+0YvHC8VfxI=;
        b=al96AfpYzXq5Eq1cK6zoPHjWU2LyKqzQZsavHj2gmg/HrzuLr9PN4dL6h/ufs+qMWe
         WMIDM8JoBW1hhFMpQARLGmQUcmMKpGF1fBCumaL5WbN+D/p1orZakXPKtNR3avG8vaDl
         ZHTL2lfDTYdSy3w4VyUb4HcSrwVNMcOslGPTPtqMxj28uidyTtzPr5rxUFxRbgM7d3QN
         /QLuoatQQiUFuM5i5Iv/+kDXT2HrImp5lu73WfwFEEsxmS/0zUq5nBOQsZLeI8VBjuwu
         WF9x7C2PSxI/1I+6Y7TMcTbfxhU+hpINAGOnPV0yuFWICfmGYY3/gWRvTovDj6LS7aql
         J7rw==
X-Gm-Message-State: AFq9FYIOyeyKPzW4kohiBn+Xjlnk9T7CGWcYUF5QuAeHM7WM2mR2opZf
	MxGRqhF6dZStDEfQ5ynHay3f3kzRW4n+KnyAb8+0R4jtI3AksrBb5SmnPBLkfhwICJpYFTEOL0w
	KHVNnONc=
X-Gm-Gg: AYBFou0iwo85Us7PLuXj6FzqgEGXf0JMV6ImZTeOeRPQTV5hsst0VEw4XWmyqFONTDg
	fRgFiKLgpiAmnrpmRe+0jp1OL8qr1Tr9jsDrHCGSLjwz0krhCPKdquytFPeW7i6ZgSXdmuEUKzb
	SZXRTlDExncmV1BKxCGN8e+QDXvDVQNxkH9x/1ybf7gzrEmeOWZXhEpx9G1hF4c4YspA1pwjSdh
	TPsbSvovG3uFhuOaMY+Ne9XIG1b/rHf3X4dfoE7TkNZRjNSDES7PztE/Wh7bwrn5qcJGqteHNNX
	aIeMWi2J78uuzqoSrEnyXZRiiZlBSoKHKF3SN+WGXp/POnnSz5m1Dk5yIJ5ibKndxCwRmqOiGWe
	9cqJnmS0utvHmIxPivImi8GlBnAQAnm+Bbwe8cV5xR5wx8Vtug4Ld2ItFthGDBrGs5BzL7K+vUH
	XVJZwxcrm47Gb4lG+u8upOSaab8YXm554rMdI0TEL0o5HxX0zcoGfe9qz8NcVdTZLcNFzJyNZrL
	vPXbozhGUACMPUVfnOzafpzOWFmvyiuMDcJh7dRlMny6X57XqHRJUFBbcXfRGRSE/Ofuk5/D/d6
	+/nGfGI79iJuUoO8zxis5M6YCndgap6BKblqE0NAjsr3xv3lw5Uj3tiNICscujWnciBMGjTW0MD
	hFQk=
X-Received: by 2002:a05:600c:4714:b0:4a6:30c3:1114 with SMTP id 5b1f17b1804b1-4ac180f1c7amr231799815e9.12.1793627184603;
        Mon, 02 Nov 2026 05:46:24 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Teddy Astie <teddy.astie@vates.tech>,
	Jason Andryuk <jason.andryuk@amd.com>
Subject: [PATCH] x86/svm: Adjust vNMI handling to update the cleanbit
Date: Mon,  2 Nov 2026 13:46:21 +0000
Message-Id: <20261102134621.1693316-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-bad1c0/1793627185-BC8C9034-B545D655/10/78276251493
X-purgate-type: spam
X-purgate-size: 2970
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Despite prior information to the contrary, APM Vol2 revision 3.46 October 2026
has been adjusted to state that the vNMI fields in vINTR are covered by the
TPR cleanbit.

Adjust svm_inject_nmi() and svm_set_interrupt_shadow() to use vmcb_set_vintr()
rather than writing into the VMCB directly.

In svm_inject_nmi(), fix an inefficiency from the introduction of vNMI.  Move
the reading of vmcb_get_general1_intercepts() to the point at which it is
used; tt does not need reading on the case that vNMIs are enabled.

Fixes: 86a203ab8d38 ("x86/svm: Support vNMI on capable hardware")
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <jbeulich@suse.com>
CC: Roger Pau Monné <roger@xenproject.org>
CC: Teddy Astie <teddy.astie@vates.tech>
CC: Jason Andryuk <jason.andryuk@amd.com>
---
 xen/arch/x86/hvm/svm/intr.c | 9 ++++++---
 xen/arch/x86/hvm/svm/svm.c  | 8 ++++++--
 2 files changed, 12 insertions(+), 5 deletions(-)

diff --git a/xen/arch/x86/hvm/svm/intr.c b/xen/arch/x86/hvm/svm/intr.c
index 4b0debfa9a2e..2224f1834741 100644
--- a/xen/arch/x86/hvm/svm/intr.c
+++ b/xen/arch/x86/hvm/svm/intr.c
@@ -30,12 +30,14 @@
 static void svm_inject_nmi(struct vcpu *v)
 {
     struct vmcb_struct *vmcb = v->arch.hvm.svm.vmcb;
-    u32 general1_intercepts = vmcb_get_general1_intercepts(vmcb);
+    vintr_t vintr = vmcb_get_vintr(vmcb);
+    uint32_t general1_intercepts;
     intinfo_t event;
 
-    if ( vmcb->_vintr.fields.vnmi_enable )
+    if ( vintr.fields.vnmi_enable )
     {
-        vmcb->_vintr.fields.vnmi_pending = true;
+        vintr.fields.vnmi_pending = true;
+        vmcb_set_vintr(vmcb, vintr);
         return;
     }
 
@@ -51,6 +53,7 @@ static void svm_inject_nmi(struct vcpu *v)
      * SVM does not virtualise the NMI mask, so we emulate it by intercepting
      * the next IRET and blocking NMI injection until the intercept triggers.
      */
+    general1_intercepts = vmcb_get_general1_intercepts(vmcb);
     vmcb_set_general1_intercepts(
         vmcb, general1_intercepts | GENERAL1_INTERCEPT_IRET);
 }
diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index 1628c5e0ae05..57779806bf6a 100644
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -511,12 +511,16 @@ static void cf_check svm_set_interrupt_shadow(
 {
     struct vmcb_struct *vmcb = v->arch.hvm.svm.vmcb;
     bool block_nmi = intr_shadow & HVM_INTR_SHADOW_NMI;
+    vintr_t vintr = vmcb_get_vintr(vmcb);
 
     vmcb->int_stat.intr_shadow =
         !!(intr_shadow & (HVM_INTR_SHADOW_MOV_SS|HVM_INTR_SHADOW_STI));
 
-    if ( vmcb->_vintr.fields.vnmi_enable )
-        vmcb->_vintr.fields.vnmi_blocking = block_nmi;
+    if ( vintr.fields.vnmi_enable )
+    {
+        vintr.fields.vnmi_blocking = block_nmi;
+        vmcb_set_vintr(vmcb, vintr);
+    }
     else
     {
         uint32_t gen1 = vmcb_get_general1_intercepts(vmcb);
-- 
2.39.5


