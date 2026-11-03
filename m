Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68C9F606A332
	for <xen-devel@archiver.kernel.org>; Tue,  3 Nov 2026 16:16:07 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1470193.1678932 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOHAr-0004Uw-Mg; Tue, 03 Nov 2026 16:15:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1470193.1678932; Tue, 03 Nov 2026 16:15:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOHAr-0004Up-Jc; Tue, 03 Nov 2026 16:15:49 +0000
Received: by outflank-mailman (input) for mailman id 1470193;
 Tue, 03 Nov 2026 16:15:48 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <abdelkareem.abdelsaamad@citrix.com>)
 id 1xOHAq-0004Uj-8e
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2026 16:15:48 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOHAp-0049mk-Kq
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2026 17:15:47 +0100
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <abdelkareem.abdelsaamad@citrix.com>)
 id 6aea08a4-8faa-0a2a0a5109dd-0a2a4506c424-36
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 17:15:47 +0100
Received: from [160.101.131.9] (helo=na1pdmzitismtp02.tibco.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <abdelkareem.abdelsaamad@citrix.com>)
 id 6aea08b2-195a-0a2a45060019-a0658309824e-3
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 17:15:47 +0100
Received: from fedora (unknown [10.113.40.46])
 by na1pdmzitismtp02.tibco.com (Postfix) with ESMTPS id A75FC83FA633;
 Tue,  3 Nov 2026 11:14:42 -0500 (EST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; none
From: Abdelkareem Abdelsaamad <abdelkareem.abdelsaamad@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	roger@xenproject.org,
	jason.andryuk@amd.com,
	teddy.astie@vates.tech,
	Abdelkareem Abdelsaamad <abdelkareem.abdelsaamad@citrix.com>
Subject: [PATCH] x86/nsvm: Fix L2 VINTR intercept merging when only Xen intercepts L1
Date: Tue,  3 Nov 2026 16:15:35 +0000
Message-ID: <f191a87071f790867eddd24dc3a7c823095c12e6.1793709558.git.abdelkareem.abdelsaamad@citrix.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-16d1c6/1793722547-F7ECC77B-3D533719/0/0
X-purgate-type: clean
X-purgate-size: 3431
X-Spam-Status: No, score=-21.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

When nesting SVM, if the L1 hypervisor has not requested a virtual interrupt
(VINTR) intercept for L2, Xen should not force one. L2 execution should remain
isolated from the L1 VINTR state, and there should be no expectation that L2
execution results in an L1 VINTR becoming deliverable.

Currently, if Xen intercepts the VINTR for its own L1 management, this
intercept incorrectly forces an intercept during L2 execution even when L1
intended for L2 to run without it. This breaks the expected transparency of L1
configuration and introduces unnecessary VMEXITs.

Furthermore, handling this forced VMEXIT_VINTR can cause a pending L1 virtual
interrupt to be incorrectly delivered to L2. This occurs because when the
intercept is determined to be requested solely by the host
(returning NESTEDHVM_VMEXIT_HOST), svm_vmexit_handler does not switch to the
correct VMCB context before evaluating the interrupt injection.

Fix this by ensuring the L2 VINTR intercept bit in the L2 execution VMCB solely
reflects the L1's explicit configuration for its guest, independent of Xen's
internal L1 intercept state.

Signed-off-by: Abdelkareem Abdelsaamad <abdelkareem.abdelsaamad@citrix.com>
---
Testing:
 - Test setup using a custom XTF nested virtualization setup:
   1. An L1 maskable interrupt is triggered while L1 has physical interrupts 
      disabled (via the CLI), leaving the interrupt pending.
   2. L2 is launched via VMRUN with an active, deliverable virtual interrupt 
      configured in its VMCB (L2 EFLAGS.IF = 1, L2 vGIF is unmasked,
      V_IRQ_PENDING is set and L2 V_IRQ is injected on a distinct vector from
      the pending L1 interrupt).
   3. Xen enables L1's VINTR_INTERCEPT to catch the next available VINTR 
      window. L2's VINTR_INTERCEPT is kept cleared.

   Results:
     - Old Behaviour: If the pending L1 maskable interrupt vector has no 
       handler mapped in the L2 IDT, L2 immediately crashes. Otherwise, 
       the L1 maskable interrupt is incorrectly leaked and delivered into 
       the L2 guest.
     - New Behaviour: The L1 maskable interrupt is securely withheld from L2 
       and correctly delivered back to the L1 context upon the next window.

   Note on Test scenario:
   I think the same window race can also result when having an injected L1
   maskable interrupt handler that temporarily raise the TPR to block
   lower-priority interrupts, with the intention to be lowering the TPR
   asynchronously later, then executing the L2 VMRUN in between.

 - CI tests:
https://gitlab.com/xen-project/people/aabdelsa/xen/-/pipelines/3022355946
---
 xen/arch/x86/hvm/svm/nestedsvm.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/xen/arch/x86/hvm/svm/nestedsvm.c b/xen/arch/x86/hvm/svm/nestedsvm.c
index 128008321d..51006d0f3e 100644
--- a/xen/arch/x86/hvm/svm/nestedsvm.c
+++ b/xen/arch/x86/hvm/svm/nestedsvm.c
@@ -403,6 +403,9 @@ static int nsvm_vmcb_prepare4vmrun(struct vcpu *v, struct cpu_user_regs *regs)
     n2vmcb->_general2_intercepts =
         n1vmcb->_general2_intercepts | ns_vmcb->_general2_intercepts;
 
+    if ( !(ns_vmcb->_general1_intercepts & GENERAL1_INTERCEPT_VINTR) )
+        n2vmcb->_general1_intercepts = ~GENERAL1_INTERCEPT_VINTR;
+
     /* Nested Pause Filter */
     if ( ns_vmcb->_general1_intercepts & GENERAL1_INTERCEPT_PAUSE )
         n2vmcb->_pause_filter_count =
-- 
2.53.0


