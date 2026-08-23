Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 786B6C5DF81
	for <xen-devel@archiver.kernel.org>; Sun, 23 Aug 2026 16:16:02 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1398491.1634736 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wyAr8-0006pu-UI; Sun, 23 Aug 2026 16:15:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1398491.1634736; Sun, 23 Aug 2026 16:15:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wyAr8-0006pm-RK; Sun, 23 Aug 2026 16:15:34 +0000
Received: by outflank-mailman (input) for mailman id 1398491;
 Sun, 23 Aug 2026 16:15:33 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <abdelkareem.abdelsaamad@citrix.com>)
 id 1wyAr7-0006pg-HG
 for xen-devel@lists.xenproject.org; Sun, 23 Aug 2026 16:15:33 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wyAr6-005Vxn-E4
 for xen-devel@lists.xenproject.org; Sun, 23 Aug 2026 18:15:32 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <abdelkareem.abdelsaamad@citrix.com>)
 id 6a8b1c75-8faa-0a2a0a5109dd-0a2a4509b824-22
 for <xen-devel@lists.xenproject.org>; Sun, 23 Aug 2026 18:15:32 +0200
Received: from [160.101.131.9] (helo=na1pdmzitismtp02.tibco.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <abdelkareem.abdelsaamad@citrix.com>)
 id 6a8b1ca3-be1a-0a2a45090019-a0658309d838-3
 for <xen-devel@lists.xenproject.org>; Sun, 23 Aug 2026 18:15:32 +0200
Received: from fedora.eng.citrite.net (unknown [10.113.40.46])
 by na1pdmzitismtp02.tibco.com (Postfix) with ESMTP id 88F7D8355FC0;
 Sun, 23 Aug 2026 12:13:33 -0400 (EDT)
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
	roger@xenproject.org,
	jason.andryuk@amd.com,
	teddy.astie@vates.tech,
	Abdelkareem Abdelsaamad <abdelkareem.abdelsaamad@citrix.com>
Subject: [PATCH v4] x86/nSVM: Check injected event consistency
Date: Sun, 23 Aug 2026 17:11:24 +0100
Message-ID: <88078b2a2eb1f741a39562fc493330e6ee26c61c.1787497752.git.abdelkareem.abdelsaamad@citrix.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-bad1c0/1787501732-FD06B034-BE789805/0/0
X-purgate-type: clean
X-purgate-size: 6647

On the AMD platforms, allowing a VMRUN instruction with a malformed VMCB has
debugging complications, security and performance implications. The APM
volume #2 15.20 (40332-Rev. 4.10-July 2026) states the two possibilities that
result in a VMRUN exit with VMEXIT_INVALID due to the injected event. These are
• Reserved values of TYPE have been specified.
• TYPE = 3 (exception) has been specified with a vector that does not
  correspond to an exception (this includes vector 2, which is an NMI, not
  an exception).

Extend the VMCB validation to check for such inconsistency.

The collection of the invalid exception vectors are ported from the upstream
KVM commit
("7e79f71bca5c" KVM: nSVM: Add missing consistency check for EVENTINJ). Adjust
the checks from the commit to align with the APM Volume #2 and Volume #3
(40332—Rev. 4.10—July 2026) for the X86_EXC_OF and X86_EXC_BR vectors which
should not be valid on the x86 64-bit (long mode) platforms. The adjustment is
posted to the KVM mailing commit patch thread
https://lore.kernel.org/all/20260803225402.2324595-1-abdelkareem.abdelsaamad@citrix.com/

Injecting the vector X86_EXC_HV is also found to trigger VMEXIT_INVALID with
the Xen hypervisor. Drop the X86_EXC_HV vector from the permitted vectors.

Signed-off-by: Abdelkareem Abdelsaamad <abdelkareem.abdelsaamad@citrix.com>
---
Changes in v4:
- Reject the injected events with the valid bit not set.
- Fix the APM revision details.
- Rename the is_valid_svm_vmcb_injected_exception_vector to the shorter
  is_valid_injected_exception_vector.
- Address coding style comments regarding !! operator usage for boolean
  returns, concise debug messaging for reserved vectors, and blank lines
  between non-fall-through case blocks.
- Drop the X86_EXC_HV from the permitted vectors.

Changes in v3:
- Restricted X86_EXC_OF (4) and X86_EXC_BR (5) vector injections to
  non-64-bit guests to prevent impossible guest-mode state injections
  per AMD APM Volumes 2 & 3.
- Refactored exception vector validation from if-conditions to a switch
  statement to improve readability and extensibility.
- Restricted X86_EXC_CP (21) vector injection to guests with enabled CET
  to prevent VMRUN failures on hardware without CET support.

Changes in v2:
- Remove the redundant SVM_EVENT_INJ_TYPE_MASK and SVM_EVENT_INJ_VEC_MASK
  constants.
- Correct the Injected Event Type consistency check to disallow the injection
  of reserved type 1 events.
---
Testing:
 - Using a locally developed XTF nested virt setup, I manually tested VMRUN
   instruction handling with a malformed VMCB:
   1) Inject event with the type (7).
      The hypervisor logs show the message
      (XEN) [  645.155609] d2v0[nsvm_vmcb_prepare4vmrun]: eventinj: Invalid
            Injected Event Type: (0x7)
   2) Inject event with the exception value (3) and the vector value (2) for
      NMI. The hypervisor logs show the message
      (XEN) [  645.157277] d2v0[nsvm_vmcb_prepare4vmrun]: eventinj: Invalid
            exception type: (0x3) vector: (0x2) for the platform. 
   3) Inject event with the exception value (3) and the vector value (21) for
      the X86_EXC_CP (Control-Flow Protection).
      Without the changes included:
          On the Naples host, where the vector was not yet known to the
          hardware. VMRUN immediately triggers VMEXIT_INVALID.
          On the Genoa host, VMRUN immediately triggers VMEXIT_VMMCALL.
      With the changes included:
          On the Naples host and the Genoa host, VMEXIT_INVALID is reported back
          without VMRUN execution.

 - CI tests:
https://gitlab.com/xen-project/people/aabdelsa/xen/-/pipelines/2783297011
---
 xen/arch/x86/hvm/svm/vmcb.c | 58 +++++++++++++++++++++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/xen/arch/x86/hvm/svm/vmcb.c b/xen/arch/x86/hvm/svm/vmcb.c
index 975a1eaef8..f983179dc8 100644
--- a/xen/arch/x86/hvm/svm/vmcb.c
+++ b/xen/arch/x86/hvm/svm/vmcb.c
@@ -320,6 +320,44 @@ void svm_vmcb_dump(const char *from, const struct vmcb_struct *vmcb)
     svm_dump_sel("  TR", &vmcb->tr);
 }
 
+static bool is_valid_injected_exception_vector(const struct vmcb_struct *vmcb,
+    uint8_t vmcb_injected_vector)
+{
+    switch ( vmcb_injected_vector )
+    {
+    case X86_EXC_DE:
+    case X86_EXC_DB:
+    case X86_EXC_BP:
+    case X86_EXC_UD:
+    case X86_EXC_NM:
+    case X86_EXC_DF:
+    case X86_EXC_TS:
+    case X86_EXC_NP:
+    case X86_EXC_SS:
+    case X86_EXC_GP:
+    case X86_EXC_PF:
+    case X86_EXC_MF:
+    case X86_EXC_AC:
+    case X86_EXC_MC:
+    case X86_EXC_XM:
+    case X86_EXC_SX:
+        return true;
+
+    case X86_EXC_OF:
+    case X86_EXC_BR:
+        return !(vmcb_get_efer(vmcb) & EFER_LMA) || !vmcb->cs.l;
+
+    case X86_EXC_VC:
+        return vmcb_get_sev_es(vmcb);
+
+    case X86_EXC_CP:
+        return vmcb_get_cr4(vmcb) & X86_CR4_CET;
+
+    default:
+        return false;
+    }
+}
+
 bool svm_vmcb_isvalid(
     const char *from, const struct vmcb_struct *vmcb, const struct vcpu *v,
     bool verbose)
@@ -330,6 +368,12 @@ bool svm_vmcb_isvalid(
     unsigned long cr4 = vmcb_get_cr4(vmcb);
     unsigned long valid;
     uint64_t efer = vmcb_get_efer(vmcb);
+    uint8_t vmcb_injected_type = vmcb->event_inj.type;
+    uint8_t vmcb_injected_vector = vmcb->event_inj.vector;
+    uint8_t vmcb_valid_event_inj_types_mask = (1 << X86_ET_EXT_INTR) |
+                                              (1 << X86_ET_NMI) |
+                                              (1 << X86_ET_HW_EXC) |
+                                              (1 << X86_ET_SW_INT);
 
 #define PRINTF(fmt, args...) do { \
     if ( !verbose ) return true; \
@@ -392,6 +436,20 @@ bool svm_vmcb_isvalid(
         PRINTF("eventinj: MBZ bits are set (%#"PRIx64")\n",
                vmcb->event_inj.raw);
 
+    if ( !vmcb->event_inj.v )
+        PRINTF("eventinj: valid bit is not set (%#"PRIx64")\n",
+               vmcb->event_inj.raw);
+
+    if ( !((1 << vmcb_injected_type) & vmcb_valid_event_inj_types_mask) )
+        PRINTF("eventinj: Invalid Injected Event Type: (%#"PRIx8")\n",
+               vmcb_injected_type);
+
+    if ( (vmcb_injected_type == X86_ET_HW_EXC) &&
+         !is_valid_injected_exception_vector(vmcb, vmcb_injected_vector) )
+        PRINTF("eventinj: Invalid exception type: (%#"PRIx8") vector: "
+               "(%#"PRIx8") for the platform\n",
+               vmcb_injected_type, vmcb_injected_vector);
+
 #undef PRINTF
     return ret;
 }
-- 
2.53.0


