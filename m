Return-Path: <SRS0=rAmU=GC=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CDEEC433E0
	for <xen-devel@archiver.kernel.org>; Wed, 30 Dec 2020 19:36:21 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D77E622242
	for <xen-devel@archiver.kernel.org>; Wed, 30 Dec 2020 19:36:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D77E622242
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.60245.105617 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kuhGG-0003mV-Nw; Wed, 30 Dec 2020 19:35:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 60245.105617; Wed, 30 Dec 2020 19:35:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kuhGG-0003mO-L6; Wed, 30 Dec 2020 19:35:56 +0000
Received: by outflank-mailman (input) for mailman id 60245;
 Wed, 30 Dec 2020 19:35:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=F8On=GC=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kuhGF-0003mJ-5b
 for xen-devel@lists.xenproject.org; Wed, 30 Dec 2020 19:35:55 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e0c166cc-5119-43c1-9d9b-53adb90db94d;
 Wed, 30 Dec 2020 19:35:53 +0000 (UTC)
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
X-Inumbo-ID: e0c166cc-5119-43c1-9d9b-53adb90db94d
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1609356953;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=aVkhF2nw9dU6WVxFGut4OlYQbrrCDmVSzhxlhz6QfRA=;
  b=bA3ngfEtBx77W/w9dKM4QQPEjoHVaAe4KQD9HxGR/HdJucaTHmded/3k
   4gJXjKOBqePDHm21qbg6YhMtfLkls8a44sXYghtLW/J35kHRzsbZGFGA1
   tbmyn14dQ2uWh43zQR0gdBXKUgfVlV99dn2U9o+Tj1A2mvJah+Sol/+lq
   0=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: mYKhCpP1c5YOjRU5DGgtJMG8PaD52xHH5JLEAaVMJUNXaDg1af3EuF9o1s6+xkYghEgHTZv3FY
 PMq9lYWVQC3gSUwLIOpGDlXimb1wuPuWomdWDrAMDEvglP+9sS6tdGI3U1XniI/iN8uqVxhqFd
 8j0yc0DvoZuwcq3KGqm110e3B5JE/wFmC4DoiYtYE83T6m1gwPilG3Wq6pgG55//rGYpKa/Qa7
 pcSgluZsLz8RfQacz20MT1vUhNdky/ULQ2bs2Mdfnu6wgBukCm2/poX89s6f6pALN4A+nWdlg1
 fxU=
X-SBRS: 5.2
X-MesageID: 34532738
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.78,462,1599537600"; 
   d="scan'208";a="34532738"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH] x86/svm: Clean up MSR_K8_VM_CR definitions
Date: Wed, 30 Dec 2020 19:35:25 +0000
Message-ID: <20201230193525.12290-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Drop the unused shift number, and reposition the constants into the cleaned-up
section.  Rename VM_CR_SVM_DISABLE to be closer to its APM definition.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>

This is cleanup to help a forthcoming Trenchboot change, which will use more
bits in the MSR.
---
 xen/arch/x86/hvm/svm/svm.c      | 2 +-
 xen/include/asm-x86/msr-index.h | 8 +++-----
 2 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index 0854fcfc14..b819897a4a 100644
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -1586,7 +1586,7 @@ static int _svm_cpu_up(bool bsp)
 
     /* Check whether SVM feature is disabled in BIOS */
     rdmsrl(MSR_K8_VM_CR, msr_content);
-    if ( msr_content & K8_VMCR_SVME_DISABLE )
+    if ( msr_content & VM_CR_SVM_DISABLE )
     {
         printk("CPU%d: AMD SVM Extension is disabled in BIOS.\n", cpu);
         return -EINVAL;
diff --git a/xen/include/asm-x86/msr-index.h b/xen/include/asm-x86/msr-index.h
index 3e0c6c8476..ff583cf0ed 100644
--- a/xen/include/asm-x86/msr-index.h
+++ b/xen/include/asm-x86/msr-index.h
@@ -116,6 +116,9 @@
 #define  PASID_PASID_MASK                   0x000fffff
 #define  PASID_VALID                        (_AC(1, ULL) << 31)
 
+#define MSR_K8_VM_CR                        0xc0010114
+#define  VM_CR_SVM_DISABLE                  (_AC(1, ULL) <<  4)
+
 /*
  * Legacy MSR constants in need of cleanup.  No new MSRs below this comment.
  */
@@ -297,7 +300,6 @@
 #define MSR_K8_PSTATE6			0xc001006A
 #define MSR_K8_PSTATE7			0xc001006B
 #define MSR_K8_ENABLE_C1E		0xc0010055
-#define MSR_K8_VM_CR			0xc0010114
 #define MSR_K8_VM_HSAVE_PA		0xc0010117
 
 #define MSR_AMD_FAM15H_EVNTSEL0		0xc0010200
@@ -318,10 +320,6 @@
 #define MSR_K8_FEATURE_MASK		0xc0011004
 #define MSR_K8_EXT_FEATURE_MASK		0xc0011005
 
-/* MSR_K8_VM_CR bits: */
-#define _K8_VMCR_SVME_DISABLE		4
-#define K8_VMCR_SVME_DISABLE		(1 << _K8_VMCR_SVME_DISABLE)
-
 /* AMD64 MSRs */
 #define MSR_AMD64_NB_CFG		0xc001001f
 #define AMD64_NB_CFG_CF8_EXT_ENABLE_BIT	46
-- 
2.11.0


