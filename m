Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF58AC5AC7A
	for <xen-devel@archiver.kernel.org>; Fri,  7 Aug 2026 16:02:41 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1386132.1628258 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wsN1N-0000dC-Pa; Fri, 07 Aug 2026 16:02:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1386132.1628258; Fri, 07 Aug 2026 16:02:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wsN1N-0000d5-MA; Fri, 07 Aug 2026 16:02:09 +0000
Received: by outflank-mailman (input) for mailman id 1386132;
 Fri, 07 Aug 2026 16:02:09 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <abdelkareem.abdelsaamad@citrix.com>)
 id 1wsN1N-0000cx-3K
 for xen-devel@lists.xenproject.org; Fri, 07 Aug 2026 16:02:09 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wsN1K-007QSw-N5
 for xen-devel@lists.xenproject.org; Fri, 07 Aug 2026 18:02:06 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <abdelkareem.abdelsaamad@citrix.com>)
 id 6a760178-e002-0a2a0a5209dd-0a2a450ae87e-14
 for <xen-devel@lists.xenproject.org>; Fri, 07 Aug 2026 18:02:06 +0200
Received: from [160.101.131.8] (helo=na1pdmzitismtp01.tibco.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <abdelkareem.abdelsaamad@citrix.com>)
 id 6a76017d-f2d2-0a2a450a0019-a0658308b224-3
 for <xen-devel@lists.xenproject.org>; Fri, 07 Aug 2026 18:02:06 +0200
Received: from fedora.eng.citrite.net (unknown [10.113.40.46])
 by na1pdmzitismtp01.tibco.com (Postfix) with ESMTP id 8E8D444BFF9D;
 Fri,  7 Aug 2026 12:00:25 -0400 (EDT)
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
Subject: [PATCH v3] x86/nSVM: Check the L1 IOPM_BASE assigned physical address
Date: Fri,  7 Aug 2026 16:58:43 +0100
Message-ID: <f97fdc50622e4db559ce059091d0ebf2028e2f2e.1786114518.git.abdelkareem.abdelsaamad@citrix.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-4011c0/1786118526-506CECFC-4DBDBEBC/0/0
X-purgate-type: clean
X-purgate-size: 4957

The Xen nested virtualization code maps the physical address assigned by the L1
guests, for IOPM_BASE, directly to valid host address without sanity checks.
Add sanity checks to verify the L1 assigned address is a valid guest address.
This check also makes the bahavior compliant with the Hardware handling of the
assigned addresses. The hardware is expected to trigger VMEXIT_INVALID with
IOPM_BASE address greater than or qual to the maximum supported physical
address, see the APM volume #2 (40332—Rev. 4.40—July 2026).

While at it, clean up the code. Remove the unused bool viopm and the
svm_vcpu::ns_oiomap_pa. Change nsvm_vmrun_permissionmap return error from
literal 1 to NSVM_ERROR_VVMCB.

Signed-off-by: Abdelkareem Abdelsaamad <abdelkareem.abdelsaamad@citrix.com>
---
Changes in V3:
- Switch to using gfn_valid() instead of domain_get_maximum_gpfn() to align
  with what is told to the guest in the CPUID.
- Change nsvm_vmrun_permissionmap return error from literal 1 to 
  NSVM_ERROR_VVMCB.
- Remove parentheses (IOPM_PAGES_COUNT - 1).
Changes in V2:
- Rename IOPM_MAX_PAGES_DIFF and MSRPM_MAX_PAGES_DIFF constants to
  IOPM_PAGES_COUNT and MSRPM_PAGES_COUNT.
- Drop the 2-pages for domain check.
- Change the IOPM and MSRPM boundary checks.
- Use gaddr_to_gfn instead of open-coding >> PAGE_SHIFT.
- Use __func__ instead of hardcoding raw function names.
---
Testing:
 - Using a locally developed XTF nested virt setup, I manually tested VMRUN
   instruction handling with the address value (0xffffffffffffffffUL) assigned
   to VMCB::iopm_base_pa:
   - Without the changes the address is mapped by the Xen code to the address
     0x604b634000 and it completes the execution without any reported errors.
   - With the changes, the VMRUN execution fails and VMEXIT_INVALID is reported
     back in the ns_vmexit.exitcode.
 - CI tests:
https://gitlab.com/xen-project/people/aabdelsa/xen/-/pipelines/2741283982
---
 xen/arch/x86/hvm/svm/nestedsvm.c         | 17 +++++++++++++----
 xen/arch/x86/include/asm/hvm/svm-types.h |  2 +-
 2 files changed, 14 insertions(+), 5 deletions(-)

diff --git a/xen/arch/x86/hvm/svm/nestedsvm.c b/xen/arch/x86/hvm/svm/nestedsvm.c
index b06124c2c9..e895cf12c4 100644
--- a/xen/arch/x86/hvm/svm/nestedsvm.c
+++ b/xen/arch/x86/hvm/svm/nestedsvm.c
@@ -18,6 +18,7 @@
 
 #define NSVM_ERROR_VVMCB        1
 #define NSVM_ERROR_VMENTRY      2
+#define IOPM_PAGES_COUNT        3
 
 int nestedsvm_vmcb_map(struct vcpu *v, uint64_t vmcbaddr)
 {
@@ -282,7 +283,7 @@ static int nsvm_vcpu_hostrestore(struct vcpu *v, struct cpu_user_regs *regs)
     return 0;
 }
 
-static int nsvm_vmrun_permissionmap(struct vcpu *v, bool viopm)
+static int nsvm_vmrun_permissionmap(struct vcpu *v)
 {
     struct svm_vcpu *arch_svm = &v->arch.hvm.svm;
     struct nestedsvm *svm = &vcpu_nestedsvm(v);
@@ -294,6 +295,15 @@ static int nsvm_vmrun_permissionmap(struct vcpu *v, bool viopm)
     enum hvm_translation_result ret;
     unsigned long *ns_viomap;
     bool ioport_80 = true, ioport_ed = true;
+    gfn_t ns_iopm_end =
+        gfn_add(gaddr_to_gfn(ns_vmcb->_iopm_base_pa), IOPM_PAGES_COUNT - 1);
+
+    if ( !gfn_valid(v->domain, ns_iopm_end) )
+    {
+        gdprintk(XENLOG_ERR, "%s invalid _iopm_base_pa address (%#"PRIx64")\n",
+                 __func__, ns_vmcb->_iopm_base_pa);
+        return NSVM_ERROR_VVMCB;
+    }
 
     ns_msrpm_ptr = (unsigned long *)svm->ns_cached_msrpm;
 
@@ -302,13 +312,12 @@ static int nsvm_vmrun_permissionmap(struct vcpu *v, bool viopm)
     if ( ret != HVMTRANS_okay )
     {
         gdprintk(XENLOG_ERR, "hvm_copy_from_guest_phys msrpm %u\n", ret);
-        return 1;
+        return NSVM_ERROR_VVMCB;
     }
 
     /* Check l1 guest io permission map and get a shadow one based on
      * if l1 guest intercepts io ports 0x80 and/or 0xED.
      */
-    svm->ns_oiomap_pa = svm->ns_iomap_pa;
     svm->ns_iomap_pa = ns_vmcb->_iopm_base_pa;
 
     ns_viomap = hvm_map_guest_frame_ro(svm->ns_iomap_pa >> PAGE_SHIFT, 0);
@@ -418,7 +427,7 @@ static int nsvm_vmcb_prepare4vmrun(struct vcpu *v, struct cpu_user_regs *regs)
     n2vmcb->_tsc_offset = n1vmcb->_tsc_offset + ns_vmcb->_tsc_offset;
 
     /* Nested IO permission bitmaps */
-    rc = nsvm_vmrun_permissionmap(v, clean.iopm);
+    rc = nsvm_vmrun_permissionmap(v);
     if ( rc )
         return rc;
 
diff --git a/xen/arch/x86/include/asm/hvm/svm-types.h b/xen/arch/x86/include/asm/hvm/svm-types.h
index 8acadb9dcc..beab9a3af2 100644
--- a/xen/arch/x86/include/asm/hvm/svm-types.h
+++ b/xen/arch/x86/include/asm/hvm/svm-types.h
@@ -51,7 +51,7 @@ struct nestedsvm {
     unsigned long *ns_merged_msrpm;
 
     /* guest physical address of virtual io permission map */
-    paddr_t ns_iomap_pa, ns_oiomap_pa;
+    paddr_t ns_iomap_pa;
     /* Shadow io permission map */
     unsigned long *ns_iomap;
 
-- 
2.53.0


