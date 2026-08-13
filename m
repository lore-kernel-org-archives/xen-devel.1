Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BF64C5CFEB
	for <xen-devel@archiver.kernel.org>; Thu, 13 Aug 2026 15:00:10 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1390159.1630703 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wuWuT-000818-Nc; Thu, 13 Aug 2026 14:59:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1390159.1630703; Thu, 13 Aug 2026 14:59:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wuWuT-000811-Jj; Thu, 13 Aug 2026 14:59:57 +0000
Received: by outflank-mailman (input) for mailman id 1390159;
 Thu, 13 Aug 2026 14:59:56 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <abdelkareem.abdelsaamad@citrix.com>)
 id 1wuWuS-00080v-M2
 for xen-devel@lists.xenproject.org; Thu, 13 Aug 2026 14:59:56 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wuWuR-001Kgn-Rt
 for xen-devel@lists.xenproject.org; Thu, 13 Aug 2026 16:59:55 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <abdelkareem.abdelsaamad@citrix.com>)
 id 6a7ddbd5-2eae-0a2a0a5409dd-0a2a450aa06a-46
 for <xen-devel@lists.xenproject.org>; Thu, 13 Aug 2026 16:59:55 +0200
Received: from [160.101.131.8] (helo=na1pdmzitismtp01.tibco.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <abdelkareem.abdelsaamad@citrix.com>)
 id 6a7ddbea-f2d2-0a2a450a0019-a0658308e3c8-3
 for <xen-devel@lists.xenproject.org>; Thu, 13 Aug 2026 16:59:55 +0200
Received: from fedora.eng.citrite.net (unknown [10.113.40.46])
 by na1pdmzitismtp01.tibco.com (Postfix) with ESMTP id 61CE544DC0E4;
 Thu, 13 Aug 2026 10:58:12 -0400 (EDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; none
From: Abdelkareem Abdelsaamad <abdelkareem.abdelsaamad@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	roger.pau@citrix.com,
	jason.andryuk@amd.com,
	teddy.astie@vates.tech,
	Abdelkareem Abdelsaamad <abdelkareem.abdelsaamad@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>
Subject: [PATCH v1] x86/nSVM: Expose the FlushByASID CPU Capability to L1 guests
Date: Thu, 13 Aug 2026 15:56:18 +0100
Message-ID: <05107cae0af8ea9cd66c133200296d3f667c8295.1786630293.git.abdelkareem.abdelsaamad@citrix.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-4011c0/1786633195-520C1CFC-785A0ED8/0/0
X-purgate-type: clean
X-purgate-size: 2359

On the AMD platforms, the Xen hypervisor requires the FlushByASID CPU
capability to support HVM nested virtualization (see start_nested_svm).
Consequently, the L1 hypervisor must report FlushByASID CPU capability support
when intercepting CPUID instruction for the CPU feature from the L2 guest to
support nested virtualization levels beyond L1. Extend the exposed HVM CPU
policy to surface this CPU feature support for the guests.

While at it remove the dangling `exitinfo1 = ns_vmcb->exitinfo1;` assignment
inside the nested exit handling of svm_vmexit_handler().

Signed-off-by: Abdelkareem Abdelsaamad <abdelkareem.abdelsaamad@citrix.com>
---
Testing:
 - Using a locally developed XTF test to call cpuid_edx(0x8000000aU);
   - without the change, EDX returns 0x4AB (the FlushByASID 6th bit is not
     set).
   - with the change, EDX returns 0x4EB (the FlushByASID 6th bit set).
 - CI tests:
https://gitlab.com/xen-project/people/aabdelsa/xen/-/pipelines/2757859821
---
 xen/arch/x86/cpu-policy.c  | 1 +
 xen/arch/x86/hvm/svm/svm.c | 1 -
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/x86/cpu-policy.c b/xen/arch/x86/cpu-policy.c
index eddcd9778f..48a3185eed 100644
--- a/xen/arch/x86/cpu-policy.c
+++ b/xen/arch/x86/cpu-policy.c
@@ -843,6 +843,7 @@ static void __init calculate_hvm_max_policy(void)
         p->extd.raw[0xa].d &= ((1u << SVM_FEATURE_NPT) |
                                (1u << SVM_FEATURE_LBRV) |
                                (1u << SVM_FEATURE_NRIPS) |
+                               (1u << SVM_FEATURE_FLUSHBYASID) |
                                (1u << SVM_FEATURE_PAUSEFILTER) |
                                (1u << SVM_FEATURE_DECODEASSISTS));
         /* Enable features which are always emulated. */
diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index 38c61db1d7..2f62981305 100644
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -2561,7 +2561,6 @@ void asmlinkage svm_vmexit_handler(void)
          * nestedsvm_check_intercepts() expects to have the correct
          * exitinfo1 value there.
          */
-        exitinfo1 = ns_vmcb->exitinfo1;
         ns_vmcb->exitinfo1 = vmcb->exitinfo1;
         nsret = nestedsvm_check_intercepts(v, regs, exit_reason);
         switch ( nsret )
-- 
2.53.0


