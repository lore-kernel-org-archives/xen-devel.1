Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EBDBEE20B1
	for <xen-devel@archiver.kernel.org>; Fri,  6 Feb 2026 15:56:47 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1223378.1530914 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1voOC5-0000cS-Oh; Fri, 06 Feb 2026 15:56:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1223378.1530914; Fri, 06 Feb 2026 15:56:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1voOC5-0000cL-M1; Fri, 06 Feb 2026 15:56:29 +0000
Received: by outflank-mailman (input) for mailman id 1223378;
 Fri, 06 Feb 2026 15:56:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) id 1voOC3-0000ag-Sl
 for xen-devel@lists.xenproject.org; Fri, 06 Feb 2026 15:56:27 +0000
Received: from na1pdmzitismtp01.tibco.com (na1pdmzitismtp01.tibco.com
 [160.101.131.8]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 648cf790-0374-11f1-b161-2bf370ae4941;
 Fri, 06 Feb 2026 16:56:27 +0100 (CET)
Received: from fedora.eng.citrite.net (unknown [10.113.40.46])
 by na1pdmzitismtp01.tibco.com (Postfix) with ESMTP id 1EAB842B8E1C;
 Fri,  6 Feb 2026 10:56:15 -0500 (EST)
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
X-Inumbo-ID: 648cf790-0374-11f1-b161-2bf370ae4941
From: Abdelkareem@tibco.com, Abdelsaamad@tibco.com,
	abdelkareem.abdelsaamad@citrix.com
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com,
	roger.pau@citrix.com,
	Abdelkareem Abdelsaamad <abdelkareem.abdelsaamad@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Jason Andryuk <jason.andryuk@amd.com>
Subject: [PATCH 1/3] svm/vnmi: introduce the vnmi bit support in the cpuid feature set
Date: Fri,  6 Feb 2026 15:53:15 +0000
Message-ID: <2111928538087e6600cc89fd2d666e2be0007906.1770389605.git.abdelkareem.abdelsaamad@citrix.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1770389605.git.abdelkareem.abdelsaamad@citrix.com>
References: <cover.1770389605.git.abdelkareem.abdelsaamad@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Abdelkareem Abdelsaamad <abdelkareem.abdelsaamad@citrix.com>

Introduce the cpuid bit for SVM vNMI feature support in for the x86\AMD
platforms.

Signed-off-by: Abdelkareem Abdelsaamad <abdelkareem.abdelsaamad@citrix.com>
---
 xen/arch/x86/hvm/svm/svm.c         | 2 ++
 xen/arch/x86/include/asm/hvm/hvm.h | 4 +++-
 xen/arch/x86/include/asm/hvm/svm.h | 2 ++
 3 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index 18ba837738..e451937b04 100644
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -2524,6 +2524,7 @@ const struct hvm_function_table * __init start_svm(void)
     P(cpu_has_tsc_ratio, "TSC Rate MSR");
     P(cpu_has_svm_sss, "NPT Supervisor Shadow Stack");
     P(cpu_has_svm_spec_ctrl, "MSR_SPEC_CTRL virtualisation");
+    P(cpu_has_svm_vnmi, "Virtual NMI");
     P(cpu_has_svm_bus_lock, "Bus Lock Filter");
 #undef P
 
@@ -2533,6 +2534,7 @@ const struct hvm_function_table * __init start_svm(void)
     svm_function_table.caps.hap = cpu_has_svm_npt;
     svm_function_table.caps.hap_superpage_2mb = true;
     svm_function_table.caps.hap_superpage_1gb = cpu_has_page1gb;
+    svm_function_table.caps.vNMI = cpu_has_svm_vnmi;
 
     return &svm_function_table;
 }
diff --git a/xen/arch/x86/include/asm/hvm/hvm.h b/xen/arch/x86/include/asm/hvm/hvm.h
index 7d9774df59..ad17ea73e9 100644
--- a/xen/arch/x86/include/asm/hvm/hvm.h
+++ b/xen/arch/x86/include/asm/hvm/hvm.h
@@ -115,7 +115,9 @@ struct hvm_function_table {
              virtual_intr_delivery:1,
 
              /* Nested virt capabilities */
-             nested_virt:1;
+             nested_virt:1,
+             /* virtual NMI support */
+             vNMI:1;
     } caps;
 
     /*
diff --git a/xen/arch/x86/include/asm/hvm/svm.h b/xen/arch/x86/include/asm/hvm/svm.h
index 15f0268be7..a35a61273b 100644
--- a/xen/arch/x86/include/asm/hvm/svm.h
+++ b/xen/arch/x86/include/asm/hvm/svm.h
@@ -37,6 +37,7 @@ extern u32 svm_feature_flags;
 #define SVM_FEATURE_VGIF          16 /* Virtual GIF */
 #define SVM_FEATURE_SSS           19 /* NPT Supervisor Shadow Stacks */
 #define SVM_FEATURE_SPEC_CTRL     20 /* MSR_SPEC_CTRL virtualisation */
+#define SVM_FEATURE_VNMI          25 /* Virtual NMI */
 #define SVM_FEATURE_BUS_LOCK      29 /* Bus Lock Threshold */
 
 static inline bool cpu_has_svm_feature(unsigned int feat)
@@ -57,6 +58,7 @@ static inline bool cpu_has_svm_feature(unsigned int feat)
 #define cpu_has_svm_vloadsave cpu_has_svm_feature(SVM_FEATURE_VLOADSAVE)
 #define cpu_has_svm_sss       cpu_has_svm_feature(SVM_FEATURE_SSS)
 #define cpu_has_svm_spec_ctrl cpu_has_svm_feature(SVM_FEATURE_SPEC_CTRL)
+#define cpu_has_svm_vnmi      cpu_has_svm_feature(SVM_FEATURE_VNMI)
 #define cpu_has_svm_bus_lock  cpu_has_svm_feature(SVM_FEATURE_BUS_LOCK)
 
 #define MSR_INTERCEPT_NONE    0
-- 
2.52.0


