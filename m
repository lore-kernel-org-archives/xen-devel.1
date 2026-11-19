Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E499606A32F
	for <xen-devel@archiver.kernel.org>; Thu, 19 Nov 2026 11:46:26 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1496165.1694828 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xU0ah-00040n-Cp; Thu, 19 Nov 2026 11:46:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1496165.1694828; Thu, 19 Nov 2026 11:46:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xU0ah-00040g-8A; Thu, 19 Nov 2026 11:46:11 +0000
Received: by outflank-mailman (input) for mailman id 1496165;
 Thu, 19 Nov 2026 11:46:10 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <abdelkareem.abdelsaamad@citrix.com>)
 id 1xU0ag-00040a-FC
 for xen-devel@lists.xenproject.org; Thu, 19 Nov 2026 11:46:10 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xU0af-007zmu-Ra
 for xen-devel@lists.xenproject.org; Thu, 19 Nov 2026 12:46:09 +0100
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <abdelkareem.abdelsaamad@citrix.com>)
 id 6afee179-2eae-0a2a0a5409dd-0a2a450b8756-42
 for <xen-devel@lists.xenproject.org>; Thu, 19 Nov 2026 12:46:09 +0100
Received: from [160.101.131.9] (helo=na1pdmzitismtp02.tibco.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <abdelkareem.abdelsaamad@citrix.com>)
 id 6afee180-b7e8-0a2a450b0019-a0658309b762-3
 for <xen-devel@lists.xenproject.org>; Thu, 19 Nov 2026 12:46:09 +0100
Received: from fedora.eng.citrite.net (unknown [10.113.40.46])
 by na1pdmzitismtp02.tibco.com (Postfix) with ESMTPS id 8890C8539ADF;
 Thu, 19 Nov 2026 06:44:39 -0500 (EST)
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
	ross.lagerwall@citrix.com,
	stephen.cheng@citrix.com,
	Abdelkareem Abdelsaamad <abdelkareem.abdelsaamad@citrix.com>
Subject: [PATCH v3] x86/nsvm: Fix L2 VINTR intercept merging when only Xen intercepts L1
Date: Thu, 19 Nov 2026 11:46:03 +0000
Message-ID: <2881c5131f6689a01564ea5a2d6fb7884477313e.1795088176.git.abdelkareem.abdelsaamad@citrix.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-42698a/1795088769-AA8D99EA-26138264/0/0
X-purgate-type: clean
X-purgate-size: 4000
X-Spam-Status: No, score=-21.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

When nesting SVM, if the L1 hypervisor has not requested a virtual interrupt
(VINTR) intercept for L2 while enabling the V_INTR_MASKING for the L2, Xen
should not force one. In such configuration, L2 execution should remain
isolated from the L1 VINTR state, and there should be no expectation that L2
execution results in an L1 VINTR becoming deliverable.

Currently, if Xen intercepts the VINTR for its own L1 management, this
intercept may unexpectedly cause an intercept during L2 execution under this
configuration. This breaks the expected transparency of L1 configuration and
introduces unnecessary VMEXIT. Later, when Xen handles this forced
VMEXIT_VINTR, it can result in losing L1's pending virtual interrupt for L2.
This occurs because when the intercept is determined to be requested solely by
the host (returning NESTEDHVM_VMEXIT_HOST), svm_vmexit_handler clears the
executing L2 VMCB's fields, in particular clearing the L1 set V_IRQ.

There is still an edge case where L1 might pend receiving IRQ and still expects
L2 to receive the L1 IRQ (i.e., when L1 clears the V_INTR_MASKING while its
EFLAGS.IF is not set).

Fix this by ensuring the L2 VINTR intercept bit in the L2 execution VMCB
correctly reflects the L1's configuration for its guest.

Signed-off-by: Abdelkareem Abdelsaamad <abdelkareem.abdelsaamad@citrix.com>
---
Changes in v3:
- Fix the commit message description.
- Add a comment explaining the check.

Changes in v2:
- Rephrased the commit message description.
- Adjusted the condition to account for cleared L2 V_INTR_MASKING.
- Rebased on master.
---
Testing:
 - Setup (using a custom XTF nested virtualization test), on top of the series
   https://lore.kernel.org/xen-devel/cover.1790146987.git.chunjie.zhu@citrix.com/
   https://lore.kernel.org/xen-devel/cover.1794482561.git.chunjie.zhu@citrix.com/
   1. An L1 maskable interrupt is triggered while L1 has physical interrupts
      disabled (via the CLI), leaving the interrupt pending.
   2. Xen enables L1's VINTR_INTERCEPT to catch the next available VINTR
      window.
   3. L2 is launched via VMRUN and configured with
      * An injected virtual interrupt on a distinct vector from
        the pending L1 interrupt.(i.e., L1 sets L2's VMCB V_INTR_VECTOR, V_IRQ
        and V_INTR_PRIO).
      * L1 clears L2 VMCB VINTR_INTERCEPT.
      * L1 also configures L2 with L2 EFLAGS.IF = 0 or 1, L2 vGIF unmasked, and
        L2 V_INTR_MASKING enabled.
      * L2 is executing (sti;nop;hlt;)

   Results:
     - Current Behaviour: The L2 injected vector is not triggered. L1 sees
       L2's VMCB V_IRQ_PENDING is cleared upon VMEXIT_HLT.
     - New Behaviour: The L2 injected vector is triggered in the L2 and no
       unnecessary VMEXIT_VINTR occurs in Xen while executing L2.

 - CI tests:
https://gitlab.com/xen-project/people/aabdelsa/xen/-/pipelines/3074834879
---
 xen/arch/x86/hvm/svm/nestedsvm.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/xen/arch/x86/hvm/svm/nestedsvm.c b/xen/arch/x86/hvm/svm/nestedsvm.c
index 81cae929dd..b40a6b56ce 100644
--- a/xen/arch/x86/hvm/svm/nestedsvm.c
+++ b/xen/arch/x86/hvm/svm/nestedsvm.c
@@ -403,6 +403,15 @@ static int nsvm_vmcb_prepare4vmrun(struct vcpu *v, struct cpu_user_regs *regs)
     n2vmcb->_general2_intercepts =
         n1vmcb->_general2_intercepts | ns_vmcb->_general2_intercepts;
 
+    /*
+     * Xen's VINTR intercept only works together with its dummy V_IRQ, which
+     * remains set in the L1 VMCB.  With V_INTR_MASKING set, L2 cannot unmask
+     * L1's interrupts, so the intercept is not needed here.
+     */
+    if ( ns_vmcb->_vintr.vintr_masking &&
+         !(ns_vmcb->_general1_intercepts & GENERAL1_INTERCEPT_VINTR) )
+        n2vmcb->_general1_intercepts &= ~GENERAL1_INTERCEPT_VINTR;
+
     /* Nested Pause Filter */
     if ( ns_vmcb->_general1_intercepts & GENERAL1_INTERCEPT_PAUSE )
         n2vmcb->_pause_filter_count =
-- 
2.53.0


