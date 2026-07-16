Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2FF6C44512
	for <xen-devel@archiver.kernel.org>; Thu, 16 Jul 2026 15:40:14 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1364273.1615577 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wkOBw-00058o-Fz; Thu, 16 Jul 2026 15:40:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1364273.1615577; Thu, 16 Jul 2026 15:40:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wkOBw-00058J-AI; Thu, 16 Jul 2026 15:40:04 +0000
Received: by outflank-mailman (input) for mailman id 1364273;
 Thu, 16 Jul 2026 15:40:03 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <abdelkareem.abdelsaamad@citrix.com>)
 id 1wkOBv-0004tD-8v
 for xen-devel@lists.xenproject.org; Thu, 16 Jul 2026 15:40:03 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wkOBu-00HGFE-M4
 for xen-devel@lists.xenproject.org; Thu, 16 Jul 2026 17:40:02 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <abdelkareem.abdelsaamad@citrix.com>)
 id 6a58fb4c-bab6-0a2a0a5309dd-0a2a450ca33e-14
 for <xen-devel@lists.xenproject.org>; Thu, 16 Jul 2026 17:40:02 +0200
Received: from [160.101.131.8] (helo=na1pdmzitismtp01.tibco.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <abdelkareem.abdelsaamad@citrix.com>)
 id 6a58fb51-f479-0a2a450c0019-a0658308d896-3
 for <xen-devel@lists.xenproject.org>; Thu, 16 Jul 2026 17:40:02 +0200
Received: from fedora.eng.citrite.net (unknown [10.113.40.46])
 by na1pdmzitismtp01.tibco.com (Postfix) with ESMTP id 50F164416332;
 Thu, 16 Jul 2026 11:38:33 -0400 (EDT)
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
	Abdelkareem Abdelsaamad <abdelkareem.abdelsaamad@citrix.com>
Subject: [PATCH v2] nSVM: Check injected event consistency
Date: Thu, 16 Jul 2026 16:37:42 +0100
Message-ID: <d7f21b51072743e5fb8743db53148231fef6fbb7.1784190077.git.abdelkareem.abdelsaamad@citrix.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d25034/1784216402-5073FA5B-53E9A89A/0/0
X-purgate-type: clean
X-purgate-size: 5031

On the AMD platforms, allowing a VMRUN instruction with a malformed VMCB has
debugging complications, security and performance implications. The APM volume
2 15.20 [1] states two possibilities that result in a VMRUN exit with
VMEXIT_INVALID due to injected events. These are either
• Reserved values of TYPE have been specified.
• TYPE = 3 (exception) has been specified with a vector that does not
  correspond to an exception (this includes vector 2, which is an NMI, not
  an exception).
Extend the VMCB checks to check for such inconsistency.

The collection of the invalid exception vectors are picked from the upstream KVM
commit ("7e79f71bca5c" KVM: nSVM: Add missing consistency check for EVENTINJ).

[1] https://docs.amd.com/v/u/en-US/24593_3.44_APM_Vol2

Signed-off-by: Abdelkareem Abdelsaamad <abdelkareem.abdelsaamad@citrix.com>
---
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
      (XEN) [  645.155609] d2v0[nsvm_vmcb_prepare4vmrun]: eventinj: Invalid Injected
            Event Type: (0x7)
   2) Inject event with the exception value (3) and the vector value (2) for NMI.
      The hypervisor logs show the message
      (XEN) [  645.157277] d2v0[nsvm_vmcb_prepare4vmrun]: eventinj: Invalid Injected Event.
             Exception type: (0x3), with a vector: (0x2) does not belong to an exception

 - CI tests:
https://gitlab.com/xen-project/people/aabdelsa/xen/-/pipelines/2682300446
---
 xen/arch/x86/hvm/svm/vmcb.c | 40 +++++++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/xen/arch/x86/hvm/svm/vmcb.c b/xen/arch/x86/hvm/svm/vmcb.c
index 975a1eaef8..c31d2a6f58 100644
--- a/xen/arch/x86/hvm/svm/vmcb.c
+++ b/xen/arch/x86/hvm/svm/vmcb.c
@@ -320,6 +320,31 @@ void svm_vmcb_dump(const char *from, const struct vmcb_struct *vmcb)
     svm_dump_sel("  TR", &vmcb->tr);
 }
 
+static bool is_valid_svm_vmcb_injected_exception_vector(
+    const struct vmcb_struct *vmcb, uint8_t vmcb_injected_vector)
+{
+    return ( (vmcb_injected_vector == X86_EXC_DE) ||
+             (vmcb_injected_vector == X86_EXC_DB) ||
+             (vmcb_injected_vector == X86_EXC_BP) ||
+             (vmcb_injected_vector == X86_EXC_OF) ||
+             (vmcb_injected_vector == X86_EXC_BR) ||
+             (vmcb_injected_vector == X86_EXC_UD) ||
+             (vmcb_injected_vector == X86_EXC_NM) ||
+             (vmcb_injected_vector == X86_EXC_DF) ||
+             (vmcb_injected_vector == X86_EXC_TS) ||
+             (vmcb_injected_vector == X86_EXC_NP) ||
+             (vmcb_injected_vector == X86_EXC_SS) ||
+             (vmcb_injected_vector == X86_EXC_GP) ||
+             (vmcb_injected_vector == X86_EXC_PF) ||
+             (vmcb_injected_vector == X86_EXC_MF) ||
+             (vmcb_injected_vector == X86_EXC_AC) ||
+             (vmcb_injected_vector == X86_EXC_MC) ||
+             (vmcb_injected_vector == X86_EXC_XM) ||
+             (vmcb_injected_vector == X86_EXC_HV) ||
+             (vmcb_injected_vector == X86_EXC_SX) ||
+             (vmcb_get_sev_es(vmcb) && vmcb_injected_vector == X86_EXC_VC) );
+}
+
 bool svm_vmcb_isvalid(
     const char *from, const struct vmcb_struct *vmcb, const struct vcpu *v,
     bool verbose)
@@ -330,6 +355,12 @@ bool svm_vmcb_isvalid(
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
@@ -392,6 +423,15 @@ bool svm_vmcb_isvalid(
         PRINTF("eventinj: MBZ bits are set (%#"PRIx64")\n",
                vmcb->event_inj.raw);
 
+    if ( !((1 << vmcb_injected_type) & vmcb_valid_event_inj_types_mask) )
+        PRINTF("eventinj: Invalid Injected Event Type: (%#"PRIx8")\n",
+               vmcb_injected_type);
+
+    if ( (vmcb_injected_type == X86_ET_HW_EXC) &&
+         !is_valid_svm_vmcb_injected_exception_vector(vmcb, vmcb_injected_vector) )
+        PRINTF("eventinj: Invalid Injected Event. Exception type: (%#"PRIx8"),"
+               " with a vector: (%#"PRIx8") does not belong to an exception\n",
+               vmcb_injected_type, vmcb_injected_vector);
 #undef PRINTF
     return ret;
 }
-- 
2.53.0


