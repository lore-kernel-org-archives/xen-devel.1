Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD53DFCE07D
	for <xen-devel@archiver.kernel.org>; Thu, 26 Feb 2026 13:21:50 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1241660.1542633 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vvbJE-0000SL-IC; Thu, 26 Feb 2026 13:21:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1241660.1542633; Thu, 26 Feb 2026 13:21:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vvbJE-0000SE-Fh; Thu, 26 Feb 2026 13:21:40 +0000
Received: by outflank-mailman (input) for mailman id 1241660;
 Thu, 26 Feb 2026 13:21:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KVeQ=A6=citrix.com=abdelkareem.abdelsaamad@srs-se1.protection.inumbo.net>)
 id 1vvbJD-0000S3-0z
 for xen-devel@lists.xenproject.org; Thu, 26 Feb 2026 13:21:39 +0000
Received: from na1pdmzitismtp01.tibco.com (na1pdmzitismtp01.corp.cloud.com
 [160.101.131.8]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1351fd05-1316-11f1-9ccf-f158ae23cfc8;
 Thu, 26 Feb 2026 14:21:36 +0100 (CET)
Received: from fedora.eng.citrite.net (unknown [10.113.40.46])
 by na1pdmzitismtp01.tibco.com (Postfix) with ESMTP id 79281428102B;
 Thu, 26 Feb 2026 08:21:15 -0500 (EST)
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
X-Inumbo-ID: 1351fd05-1316-11f1-9ccf-f158ae23cfc8
From: Abdelkareem Abdelsaamad <abdelkareem.abdelsaamad@citrix.com>
To: andrew.cooper3@citrix.com,
	xen-devel@lists.xenproject.org
Cc: roger.pau@citrix.com,
	teddy.astie@vates.tech,
	jbeulich@suse.com,
	jason.andryuk@amd.com,
	Abdelkareem Abdelsaamad <abdelkareem.abdelsaamad@citrix.com>
Subject: [PATCH v5 1/2] x86/svm: Add Enumerations for the SVM virtual NMI
Date: Thu, 26 Feb 2026 13:20:42 +0000
Message-ID: <a3dd02ed3a01c5aaae804bc69f494de2a47a75f0.1772105933.git.abdelkareem.abdelsaamad@citrix.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1772105933.git.abdelkareem.abdelsaamad@citrix.com>
References: <cover.1772105933.git.abdelkareem.abdelsaamad@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce the cpuid bit for the SVM vNMI feature support for the x86\AMD
platforms. The feature support is indicated by the CPUID
Fn8000_000A_EDX[25] = 1.

Add defines for the three SVM's Virtual NMI (vNMI) managements bits in the
VMCB structure's vintr_t:

vintr_t(11) - Virtual NMI is pending.
vintr_t(12) - Virtual NMI is masked.
vintr_t(26) - Enable NMI virtualization.

Signed-off-by: Abdelkareem Abdelsaamad <abdelkareem.abdelsaamad@citrix.com>
Reviewed-by: Teddy Astie <teddy.astie@vates.tech>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
 xen/arch/x86/hvm/svm/vmcb.h        | 8 ++++++--
 xen/arch/x86/include/asm/hvm/svm.h | 2 ++
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/hvm/svm/vmcb.h b/xen/arch/x86/hvm/svm/vmcb.h
index 69f6047394..13ccfd3ff9 100644
--- a/xen/arch/x86/hvm/svm/vmcb.h
+++ b/xen/arch/x86/hvm/svm/vmcb.h
@@ -336,13 +336,17 @@ typedef union
         u64 tpr:          8;
         u64 irq:          1;
         u64 vgif:         1;
-        u64 rsvd0:        6;
+        u64 :             1;
+        u64 vnmi_pending: 1;
+        u64 vnmi_blocking:1;
+        u64 :             3;
         u64 prio:         4;
         u64 ign_tpr:      1;
         u64 rsvd1:        3;
         u64 intr_masking: 1;
         u64 vgif_enable:  1;
-        u64 rsvd2:        6;
+        u64 vnmi_enable:  1;
+        u64 :             5;
         u64 vector:       8;
         u64 rsvd3:       24;
     } fields;
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


