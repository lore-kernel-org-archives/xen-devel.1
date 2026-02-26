Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5828FCE07B
	for <xen-devel@archiver.kernel.org>; Thu, 26 Feb 2026 13:21:52 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1241662.1542653 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vvbJG-0000uC-Ur; Thu, 26 Feb 2026 13:21:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1241662.1542653; Thu, 26 Feb 2026 13:21:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vvbJG-0000u2-SB; Thu, 26 Feb 2026 13:21:42 +0000
Received: by outflank-mailman (input) for mailman id 1241662;
 Thu, 26 Feb 2026 13:21:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KVeQ=A6=citrix.com=abdelkareem.abdelsaamad@srs-se1.protection.inumbo.net>)
 id 1vvbJE-0000S3-LU
 for xen-devel@lists.xenproject.org; Thu, 26 Feb 2026 13:21:40 +0000
Received: from na1pdmzitismtp01.tibco.com (na1pdmzitismtp01.corp.cloud.com
 [160.101.131.8]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 14539194-1316-11f1-9ccf-f158ae23cfc8;
 Thu, 26 Feb 2026 14:21:38 +0100 (CET)
Received: from fedora.eng.citrite.net (unknown [10.113.40.46])
 by na1pdmzitismtp01.tibco.com (Postfix) with ESMTP id 270DF428102C;
 Thu, 26 Feb 2026 08:21:17 -0500 (EST)
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
X-Inumbo-ID: 14539194-1316-11f1-9ccf-f158ae23cfc8
From: Abdelkareem Abdelsaamad <abdelkareem.abdelsaamad@citrix.com>
To: andrew.cooper3@citrix.com,
	xen-devel@lists.xenproject.org
Cc: roger.pau@citrix.com,
	teddy.astie@vates.tech,
	jbeulich@suse.com,
	jason.andryuk@amd.com,
	Abdelkareem Abdelsaamad <abdelkareem.abdelsaamad@citrix.com>
Subject: [PATCH v5 2/2] x86/svm: Use the virtual NMI when available
Date: Thu, 26 Feb 2026 13:20:43 +0000
Message-ID: <29068558780bd9c6182d7bd74b357acc44409bfe.1772109484.git.abdelkareem.abdelsaamad@citrix.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1772109484.git.abdelkareem.abdelsaamad@citrix.com>
References: <cover.1772109484.git.abdelkareem.abdelsaamad@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

With the Virtual NMI (vNMI), the pending NMI is simply stuffed into the VMCB
and handed off to the hardware. There is no need for the artificial tracking
of the NMI handling completion with the IRET instruction interception.

Adjust the svm_inject_nmi to rather inject the NMIs using the vNMI Hardware
accelerated feature when the AMD platform supports the vNMI.

Signed-off-by: Abdelkareem Abdelsaamad <abdelkareem.abdelsaamad@citrix.com>
---
 xen/arch/x86/hvm/svm/intr.c | 6 ++++++
 xen/arch/x86/hvm/svm/svm.c  | 1 +
 xen/arch/x86/hvm/svm/vmcb.c | 2 ++
 3 files changed, 9 insertions(+)

diff --git a/xen/arch/x86/hvm/svm/intr.c b/xen/arch/x86/hvm/svm/intr.c
index 6453a46b85..112a393211 100644
--- a/xen/arch/x86/hvm/svm/intr.c
+++ b/xen/arch/x86/hvm/svm/intr.c
@@ -33,6 +33,12 @@ static void svm_inject_nmi(struct vcpu *v)
     u32 general1_intercepts = vmcb_get_general1_intercepts(vmcb);
     intinfo_t event;
 
+    if ( vmcb->_vintr.fields.vnmi_enable )
+    {
+        vmcb->_vintr.fields.vnmi_pending = 1;
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


