Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5BA2C9830D
	for <xen-devel@archiver.kernel.org>; Fri, 25 Sep 2026 09:21:38 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1433547.1654042 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xA27Q-00008d-P4; Fri, 25 Sep 2026 09:21:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1433547.1654042; Fri, 25 Sep 2026 09:21:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xA27Q-00008W-MX; Fri, 25 Sep 2026 09:21:24 +0000
Received: by outflank-mailman (input) for mailman id 1433547;
 Fri, 25 Sep 2026 09:21:23 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <abdelkareem.abdelsaamad@citrix.com>)
 id 1xA27P-000079-95
 for xen-devel@lists.xenproject.org; Fri, 25 Sep 2026 09:21:23 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xA27O-00HFBh-ML
 for xen-devel@lists.xenproject.org; Fri, 25 Sep 2026 11:21:22 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <abdelkareem.abdelsaamad@citrix.com>)
 id 6ab63d12-8faa-0a2a0a5109dd-0a2a450c9272-2
 for <xen-devel@lists.xenproject.org>; Fri, 25 Sep 2026 11:21:22 +0200
Received: from [160.101.131.8] (helo=na1pdmzitismtp01.tibco.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <abdelkareem.abdelsaamad@citrix.com>)
 id 6ab63d11-f479-0a2a450c0019-a06583089efa-3
 for <xen-devel@lists.xenproject.org>; Fri, 25 Sep 2026 11:21:22 +0200
Received: from fedora.eng.citrite.net (unknown [10.113.40.46])
 by na1pdmzitismtp01.tibco.com (Postfix) with ESMTP id 3754E4717F7B;
 Fri, 25 Sep 2026 05:19:17 -0400 (EDT)
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
	roger.pau@xenproject.org,
	jason.andryuk@amd.com,
	teddy.astie@vates.tech,
	Abdelkareem Abdelsaamad <abdelkareem.abdelsaamad@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>
Subject: [PATCH v5] x86/nSVM: Check injected event consistency
Date: Fri, 25 Sep 2026 10:15:30 +0100
Message-ID: <216f0de990dd180c8336837e86bf5860e37b9c50.1790326132.git.abdelkareem.abdelsaamad@citrix.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d25034/1790328082-5113AA5B-6D65903D/0/0
X-purgate-type: clean
X-purgate-size: 16003

On the AMD platforms, allowing a VMRUN instruction with a malformed VMCB has
debugging complications, security and performance implications. The APM
volume #2 15.20 (40332—Rev. 4.10—July 2026) states the two possibilities that
VMRUN will immediately exit with VMEXIT_INVALID due to the injected event.
These are
• Reserved values of TYPE have been specified.
• TYPE = 3 (exception) has been specified with a vector that does not
  correspond to an exception (this includes vector 2, which is an NMI, not
  an exception).

Furthermore, reading through the APM shows that the exception vector validity
can also depend on the guest mode, the CPU generation and the
microarchitectural constraints. Some vectors are only valid starting with the
specific CPU generation that introduced the corresponding feature, the guest
mode or whether the guest opted-in for specific CPU capability. The Upstream
KVM introduced a similar consistency check that reflects on this dependency
with the commit
7e79f71bca5c ("KVM: nSVM: Add missing consistency check for EVENTINJ").
However, the KVM implementation did allow the Overflow (X86_EXC_OF) and the
BOUND Range (X86_EXC_BR) vectors injection in 64-bit mode. According to the APM
Volume #2 and Volume #3 (40332—Rev. 4.10—July 2026), injecting these exceptions
while the guest is in 64-bit mode is invalid and triggers an immediate
VMEXIT_INVALID. This architectural mismatch in the KVM implementation was
reported here:
https://lore.kernel.org/all/20260803225402.2324595-1-abdelkareem.abdelsaamad@citrix.com/

To verify the hardware behaviour with the various vectors, A case-by-case
testing on 64-bit mode Windows guest is performed. The hardware exception event
is manually injected at the end of svm_vmexit_handler and the consequence
is observed:
 - If VMEXIT_INVALID is triggered, the injection is invalid.
 - If a guest triple fault is triggered, the event passed the hardware checks
   and completed the event delivery. It is valid.

Extend the VMCB validation to check for the VMCB event injection inconsistency.

While at it, extend the svm_vmcb_isvalid usage to the non-nested VMEXIT_INVALID
debugging. Clean up svm_vmcb_isvalid by dropping the unused `verbose` parameter
and by correcting the misleading boolean return value to properly reflect the
validation status.

Signed-off-by: Abdelkareem Abdelsaamad <abdelkareem.abdelsaamad@citrix.com>
---
Changes in v5:
- Drop the rejection of injected events when the VALID bit is not set. The
  testing confirms no VMEXIT_INVALID is triggired in such case.
- Reject the X86_EXC_BP (#BP) and the X86_EXC_OF (#OF) exception vectors when
  injected into SEV-ES guests to respect architectural constraints.
- Reject X86_EXC_VC (#VC) event injection entirely, as testing confirms manual
  injection of the VMM Communication exception unconditionally triggers
  a VMEXIT_INVALID.
- Separate X86_EXC_HV (#HV) into its own explicit case block with a dedicated
  architectural comment.
- Extend the use of svm_vmcb_isvalid() to non-nested VMEXIT_INVALID debugging
  to improve error diagnostics, and clean up the internal logic of the
  function.
- Promote the vmcb_injected_type and the vmcb_injected_vector to unsigned int
  type.
- Add an inline comment explaining the purpose and architectural backing of the
  new vmcb_valid_event_inj_types_mask.

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
            Injected Event Type: 0x7.
   2) Inject event with the exception value (3) and the vector value (2) for
      NMI. The hypervisor logs show the message
      (XEN) [  645.157277] d2v0[nsvm_vmcb_prepare4vmrun]: eventinj: Invalid
            exception type: 0x3 vector: 0x2.
   3) Inject event with the exception value (3) and the vector value (21) for
      the X86_EXC_CP (Control-Flow Protection).
      Without the changes included:
          On the Naples host, where the vector was not yet known to the
          hardware. VMRUN immediately triggers VMEXIT_INVALID.
   4) To perform more detailed bare-metal testing, I set up a testing matrix
      using a XenServer Windows 10 64-bit VM and manually injected the
      various events according to the testing matrix below:
      ----------------------------------------------------------------------------------------------------------
     |    Exception Vector      |        AMD Naples       |        AMD Genoa         |    Testing Conditions    |
     |--------------------------|-------------------------|--------------------------|--------------------------|
     |    - X86_EXC_OF          |      VMEXIT_INVALID     |      VMEXIT_INVALID      | - Verified that 64bit    |
     |    - X86_EXC_BR          |                         |                          | mode is active before    |
     |                          |                         |                          | injecting the event.     |
     |--------------------------|-------------------------|--------------------------|--------------------------|
     |                          |                         |                          | - Verified that the      |
     |                          |                         |                          | Genoa host does not have |
     |    - X86_EXC_CP          |    Guest Triple fault   |      VMEXIT_INVALID      | guest_cr[4] X86_CR4_CET  |
     |                          |                         |                          | set and the VMCB does not|
     |                          |                         |                          | have CR4 X86_CR4_CET set |
     |--------------------------|-------------------------|--------------------------|--------------------------|
     |                          |                         |                          | - APM states only valid  |
     |     - X86_EXC_HV         |      VMEXIT_INVALID     |       VMEXIT_INVALID     | to inject into VMSAs that|
     |                          |                         |                          | execute with Restricted  |
     |                          |                         |                          | Injection.               |
     |--------------------------|-------------------------|--------------------------|--------------------------|
     |    - X86_EXC_DE          |                         |                          | - Verified that hosts    |
     |    - X86_EXC_DB          |                         |                          | do not have guest_cr[4]  |
     |    - X86_EXC_UD          |                         |                          | X86_CR4_OSXMMEXCPT set   |
     |    - X86_EXC_BP          |                         |                          | and the VMCB does not    |
     |    - X86_EXC_NM          |                         |                          | have CR4                 |
     |    - X86_EXC_DF          |                         |                          | X86_CR4_OSXMMEXCPT set   |
     |    - X86_EXC_TS          |    Guest Triple fault   |    Guest Triple fault    | with the vector          |
     |    - X86_EXC_NP          |                         |                          | X86_EXC_XM.              |
     |    - X86_EXC_SX          |                         |                          | with the vector          |
     |                          |                         |                          | X86_EXC_MC.              |
     |--------------------------|-------------------------|--------------------------|--------------------------|
     |    - X86_EXC_CSO         |                         |                          |                          |
     |    - X86_EXC_SPV         |                         |                          |                          |
     |    - X86_EXC_VE          |      VMEXIT_INVALID     |    VMEXIT_INVALID        |                          |
     |    - X86_EXC_VC          |                         |                          |                          |
      ----------------------------------------------------------------------------------------------------------
 - CI tests:
https://gitlab.com/xen-project/people/aabdelsa/xen/-/pipelines/2881691847
---
 xen/arch/x86/hvm/svm/nestedsvm.c |  8 +--
 xen/arch/x86/hvm/svm/svm.c       |  1 +
 xen/arch/x86/hvm/svm/vmcb.c      | 90 ++++++++++++++++++++++++++++++--
 xen/arch/x86/hvm/svm/vmcb.h      |  2 +-
 4 files changed, 91 insertions(+), 10 deletions(-)

diff --git a/xen/arch/x86/hvm/svm/nestedsvm.c b/xen/arch/x86/hvm/svm/nestedsvm.c
index 81579370b8..bb3511622d 100644
--- a/xen/arch/x86/hvm/svm/nestedsvm.c
+++ b/xen/arch/x86/hvm/svm/nestedsvm.c
@@ -595,15 +595,15 @@ static int nsvm_vmcb_prepare4vmrun(struct vcpu *v, struct cpu_user_regs *regs)
     /* Cleanbits */
     n2vmcb->cleanbits.raw = 0;
 
-    rc = svm_vmcb_isvalid(__func__, ns_vmcb, v, true);
-    if ( rc )
+    rc = svm_vmcb_isvalid(__func__, ns_vmcb, v);
+    if ( !rc )
     {
         gdprintk(XENLOG_ERR, "virtual vmcb invalid\n");
         return NSVM_ERROR_VVMCB;
     }
 
-    rc = svm_vmcb_isvalid(__func__, n2vmcb, v, true);
-    if ( rc )
+    rc = svm_vmcb_isvalid(__func__, n2vmcb, v);
+    if ( !rc )
     {
         gdprintk(XENLOG_ERR, "n2vmcb invalid\n");
         return NSVM_ERROR_VMENTRY;
diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index 71e48351f2..ebdeb95dbf 100644
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -2619,6 +2619,7 @@ void asmlinkage svm_vmexit_handler(void)
 
     if ( unlikely(exit_reason == VMEXIT_INVALID) )
     {
+        svm_vmcb_isvalid(__func__, vmcb, v);
         gdprintk(XENLOG_ERR, "invalid VMCB state:\n");
         svm_vmcb_dump(__func__, vmcb);
         domain_crash(v->domain);
diff --git a/xen/arch/x86/hvm/svm/vmcb.c b/xen/arch/x86/hvm/svm/vmcb.c
index a6f09672a7..50bec50fc5 100644
--- a/xen/arch/x86/hvm/svm/vmcb.c
+++ b/xen/arch/x86/hvm/svm/vmcb.c
@@ -327,20 +327,91 @@ void svm_vmcb_dump(const char *from, const struct vmcb_struct *vmcb)
     svm_dump_sel("  TR", &vmcb->tr);
 }
 
+static bool is_valid_injected_exception_vector(const struct vmcb_struct *vmcb,
+    uint8_t vmcb_injected_vector, const struct vcpu *v)
+{
+    switch ( vmcb_injected_vector )
+    {
+    case X86_EXC_DE:
+    case X86_EXC_DB:
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
+    /*
+     * Exception vectors 3 and 4 may not be injected into SEV-ES guests.
+     * If this is attempted, the VMRUN will fail with a VMEXIT_INVALID
+     * error code.
+     * See the APM Volume #2 15.35.8 (40332—Rev. 4.10—July 2026).
+     */
+    case X86_EXC_BP:
+        return !vmcb_get_sev_es(vmcb);
+
+    /*
+     * If the VMM attempts to inject an event that is impossible for the
+     * guest mode (e.g., a #BR exception when the guest is in 64-bit mode),
+     * the event injection will fail... VMRUN will immediately exit with
+     * VMEXIT_INVALID.
+     * See the APM Volume #2 15.20 (40332—Rev. 4.10—July 2026).
+     */
+    case X86_EXC_OF:
+        return ( (!(vmcb_get_efer(vmcb) & EFER_LMA) || !vmcb->cs.l) &&
+                 !vmcb_get_sev_es(vmcb) );
+
+    case X86_EXC_BR:
+        return !(vmcb_get_efer(vmcb) & EFER_LMA) || !vmcb->cs.l;
+
+    case X86_EXC_CP:
+    {
+        unsigned long guest_valid_cr4 = hvm_cr4_guest_valid_bits(v->domain);
+        return guest_valid_cr4 & X86_CR4_CET;
+    }
+
+    /*
+     * X86_EXC_HV vector is reserved for SNP guests use. Only allowed to be
+     * injected into VMSAs that execute with Restricted Injection.
+     * See the APM Volume #2 15.36 (40332—Rev. 4.10—July 2026).
+     */
+    case X86_EXC_HV:
+    default:
+        return false;
+    }
+}
+
 bool svm_vmcb_isvalid(
-    const char *from, const struct vmcb_struct *vmcb, const struct vcpu *v,
-    bool verbose)
+    const char *from, const struct vmcb_struct *vmcb, const struct vcpu *v)
 {
-    bool ret = false; /* ok */
+    bool ret = true; /* ok */
     unsigned long cr0 = vmcb_get_cr0(vmcb);
     unsigned long cr3 = vmcb_get_cr3(vmcb);
     unsigned long cr4 = vmcb_get_cr4(vmcb);
     unsigned long valid;
     uint64_t efer = vmcb_get_efer(vmcb);
+    unsigned int vmcb_injected_type = vmcb->event_inj.type;
+    unsigned int vmcb_injected_vector = vmcb->event_inj.vector;
+    /*
+     * Represent the nonreserved and accoridngly valid guest exception or
+     * interrupt type.
+     * See the APM Volume #2 15.20 (40332—Rev. 4.10—July 2026).
+     */
+    unsigned long vmcb_valid_event_inj_types_mask = (1 << X86_ET_INTR) |
+                                                    (1 << X86_ET_NMI) |
+                                                    (1 << X86_ET_HW_EXC) |
+                                                    (1 << X86_ET_SW_INT);
 
 #define PRINTF(fmt, args...) do { \
-    if ( !verbose ) return true; \
-    ret = true; \
+    ret = false; \
     printk(XENLOG_GUEST "%pv[%s]: " fmt, v, from, ## args); \
 } while (0)
 
@@ -399,6 +470,15 @@ bool svm_vmcb_isvalid(
         PRINTF("eventinj: MBZ bits are set (%#"PRIx64")\n",
                vmcb->event_inj.raw);
 
+    if ( !((1ul << vmcb_injected_type) & vmcb_valid_event_inj_types_mask) )
+        PRINTF("eventinj: Invalid Injected Event Type: %#x\n",
+               vmcb_injected_type);
+
+    if ( (vmcb_injected_type == X86_ET_HW_EXC) &&
+         !is_valid_injected_exception_vector(vmcb, vmcb_injected_vector, v) )
+        PRINTF("eventinj: Invalid exception type: %#x vector: %#x\n",
+               vmcb_injected_type, vmcb_injected_vector);
+
 #undef PRINTF
     return ret;
 }
diff --git a/xen/arch/x86/hvm/svm/vmcb.h b/xen/arch/x86/hvm/svm/vmcb.h
index 3760f71a86..78ace19b27 100644
--- a/xen/arch/x86/hvm/svm/vmcb.h
+++ b/xen/arch/x86/hvm/svm/vmcb.h
@@ -565,7 +565,7 @@ void svm_destroy_vmcb(struct vcpu *v);
 void setup_vmcb_dump(void);
 void svm_vmcb_dump(const char *from, const struct vmcb_struct *vmcb);
 bool svm_vmcb_isvalid(const char *from, const struct vmcb_struct *vmcb,
-                      const struct vcpu *v, bool verbose);
+                      const struct vcpu *v);
 
 /*
  * VMCB accessor functions.
-- 
2.53.0


