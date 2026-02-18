Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 881BCE9A04B
	for <xen-devel@archiver.kernel.org>; Wed, 18 Feb 2026 14:48:30 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1235660.1538592 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vsiqk-0007UE-BS; Wed, 18 Feb 2026 14:48:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1235660.1538592; Wed, 18 Feb 2026 14:48:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vsiqk-0007U7-86; Wed, 18 Feb 2026 14:48:22 +0000
Received: by outflank-mailman (input) for mailman id 1235660;
 Wed, 18 Feb 2026 14:48:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oIww=AW=citrix.com=abdelkareem.abdelsaamad@srs-se1.protection.inumbo.net>)
 id 1vsiqi-0007Sy-Oy
 for xen-devel@lists.xenproject.org; Wed, 18 Feb 2026 14:48:20 +0000
Received: from na1pdmzitismtp01.tibco.com (na1pdmzitismtp01.corp.cloud.com
 [160.101.131.8]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d9ffa53a-0cd8-11f1-9ccf-f158ae23cfc8;
 Wed, 18 Feb 2026 15:48:14 +0100 (CET)
Received: from fedora.eng.citrite.net (unknown [10.113.40.46])
 by na1pdmzitismtp01.tibco.com (Postfix) with ESMTP id CD85C414750A;
 Wed, 18 Feb 2026 09:47:56 -0500 (EST)
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
X-Inumbo-ID: d9ffa53a-0cd8-11f1-9ccf-f158ae23cfc8
From: Abdelkareem Abdelsaamad <abdelkareem.abdelsaamad@citrix.com>
To: andrew.cooper3@citrix.com,
	xen-devel@lists.xenproject.org
Cc: roger.pau@citrix.com,
	teddy.astie@vates.tech,
	jbeulich@suse.com,
	jason.andryuk@amd.com,
	Abdelkareem Abdelsaamad <abdelkareem.abdelsaamad@citrix.com>
Subject: [PATCH v4 2/2] x86/svm: Use the virtual NMI when available
Date: Wed, 18 Feb 2026 14:48:01 +0000
Message-ID: <b4c0009eeee03b855321954135a37ef08290f640.1771424278.git.abdelkareem.abdelsaamad@citrix.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1771424278.git.abdelkareem.abdelsaamad@citrix.com>
References: <cover.1771424278.git.abdelkareem.abdelsaamad@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

With the Virtual NMI (vNMI), the pending NMI is simply stuffed into the VMCB
and handed off to the hardware. There is no need for the artificial tracking
of the NMI handling completion with the IRET instruction interception.

Adjust the svm_inject_nmi to rather inject the NMIs using the vNMI Hardware
accelerated feature when the AMD platform supports the vNMI.

Signed-off-by: Abdelkareem Abdelsaamad <abdelkareem.abdelsaamad@citrix.com>
---
 xen/arch/x86/hvm/svm/intr.c | 8 ++++++++
 xen/arch/x86/hvm/svm/svm.c  | 1 +
 xen/arch/x86/hvm/svm/vmcb.c | 2 ++
 3 files changed, 11 insertions(+)

diff --git a/xen/arch/x86/hvm/svm/intr.c b/xen/arch/x86/hvm/svm/intr.c
index 6453a46b85..996362f8a6 100644
--- a/xen/arch/x86/hvm/svm/intr.c
+++ b/xen/arch/x86/hvm/svm/intr.c
@@ -33,6 +33,14 @@ static void svm_inject_nmi(struct vcpu *v)
     u32 general1_intercepts = vmcb_get_general1_intercepts(vmcb);
     intinfo_t event;
 
+    if ( vmcb->_vintr.fields.vnmi_enable )
+    {
+        if ( !vmcb->_vintr.fields.vnmi_pending )
+            vmcb->_vintr.fields.vnmi_pending = 1;
+
+        return;
+    }
+
     event.raw = 0;
     event.v = true;
     event.type = X86_ET_NMI;
diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index 18ba837738..815565c33f 100644
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -2524,6 +2524,7 @@ const struct hvm_function_table * __init start_svm(void)
     P(cpu_has_tsc_ratio, "TSC Rate MSR");
     P(cpu_has_svm_sss, "NPT Supervisor Shadow Stack");
     P(cpu_has_svm_spec_ctrl, "MSR_SPEC_CTRL virtualisation");
+    P(cpu_has_svm_vnmi, "Virtual NMI");
     P(cpu_has_svm_bus_lock, "Bus Lock Filter");
 #undef P
 
diff --git a/xen/arch/x86/hvm/svm/vmcb.c b/xen/arch/x86/hvm/svm/vmcb.c
index e583ef8548..e90bbac332 100644
--- a/xen/arch/x86/hvm/svm/vmcb.c
+++ b/xen/arch/x86/hvm/svm/vmcb.c
@@ -184,6 +184,8 @@ static int construct_vmcb(struct vcpu *v)
     if ( default_xen_spec_ctrl == SPEC_CTRL_STIBP )
         v->arch.msrs->spec_ctrl.raw = SPEC_CTRL_STIBP;
 
+    vmcb->_vintr.fields.vnmi_enable = cpu_has_svm_vnmi;
+
     return 0;
 }
 
-- 
2.52.0


