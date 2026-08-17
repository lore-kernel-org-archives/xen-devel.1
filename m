Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45F48C5B572
	for <xen-devel@archiver.kernel.org>; Mon, 17 Aug 2026 17:04:18 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1393142.1632036 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ww0ke-0001GI-3k; Mon, 17 Aug 2026 17:03:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1393142.1632036; Mon, 17 Aug 2026 17:03:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ww0ke-0001GB-0g; Mon, 17 Aug 2026 17:03:56 +0000
Received: by outflank-mailman (input) for mailman id 1393142;
 Mon, 17 Aug 2026 17:03:54 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <abdelkareem.abdelsaamad@citrix.com>)
 id 1ww0kc-0001G5-S6
 for xen-devel@lists.xenproject.org; Mon, 17 Aug 2026 17:03:54 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1ww0kb-009Cj2-Nl
 for xen-devel@lists.xenproject.org; Mon, 17 Aug 2026 19:03:53 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <abdelkareem.abdelsaamad@citrix.com>)
 id 6a833ed9-e002-0a2a0a5209dd-0a2a450ae7b6-42
 for <xen-devel@lists.xenproject.org>; Mon, 17 Aug 2026 19:03:53 +0200
Received: from [160.101.131.9] (helo=na1pdmzitismtp02.tibco.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <abdelkareem.abdelsaamad@citrix.com>)
 id 6a833ef8-f2d2-0a2a450a0019-a0658309d3f2-3
 for <xen-devel@lists.xenproject.org>; Mon, 17 Aug 2026 19:03:53 +0200
Received: from fedora.eng.citrite.net (unknown [10.113.40.46])
 by na1pdmzitismtp02.tibco.com (Postfix) with ESMTP id B578A82E3127;
 Mon, 17 Aug 2026 13:01:57 -0400 (EDT)
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
Subject: [PATCH v4] x86/nSVM: Validate the L1 IOPM physical address range
Date: Mon, 17 Aug 2026 17:59:56 +0100
Message-ID: <8302fc9800d6d5ffe8341ccf1a5f8cc0ee19540c.1786984508.git.abdelkareem.abdelsaamad@citrix.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-4011c0/1786986233-536D6CFC-77FDC0BC/0/0
X-purgate-type: clean
X-purgate-size: 5216

The Xen nested virtualization code does not validate that the physical address
range assigned by the L1 guest, for IOPM, resides within the valid guest
physical memory. Add a sanity check to properly validate the IOPM is in the
valid L1 guest address range. This check also makes the behaviour compliant
with the hardware handling of the assigned address. The hardware is expected to
trigger VMEXIT_INVALID if the address of the last byte in the IOPM is greater
than or equal to the maximum supported physical address, see the APM
volume #2 (40332—Rev. 4.40—July 2026).

While at it, clean up the code. Remove the unused bool viopm and the
svm_vcpu::ns_oiomap_pa. Change nsvm_vmrun_permissionmap return error from
literal 1 to NSVM_ERROR_VVMCB.

Signed-off-by: Abdelkareem Abdelsaamad <abdelkareem.abdelsaamad@citrix.com>
---
Changes in V4:
- Replace the IOPM_PAGES_COUNT constant with an expression calculating the
  actual page span of the IO permission map.
- Rephrase the commit message to better describe the changes.
Changes in V3:
- Switch to using gfn_valid() instead of domain_get_maximum_gpfn() to align
  with what is told to the guest in the CPUID.
- Drop MSRPM validation as it is already validated.
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
https://gitlab.com/xen-project/people/aabdelsa/xen/-/pipelines/2766682638
---
 xen/arch/x86/hvm/svm/nestedsvm.c         | 18 ++++++++++++++----
 xen/arch/x86/include/asm/hvm/svm-types.h |  2 +-
 2 files changed, 15 insertions(+), 5 deletions(-)

diff --git a/xen/arch/x86/hvm/svm/nestedsvm.c b/xen/arch/x86/hvm/svm/nestedsvm.c
index b06124c2c9..b176e6000a 100644
--- a/xen/arch/x86/hvm/svm/nestedsvm.c
+++ b/xen/arch/x86/hvm/svm/nestedsvm.c
@@ -282,7 +282,7 @@ static int nsvm_vcpu_hostrestore(struct vcpu *v, struct cpu_user_regs *regs)
     return 0;
 }
 
-static int nsvm_vmrun_permissionmap(struct vcpu *v, bool viopm)
+static int nsvm_vmrun_permissionmap(struct vcpu *v)
 {
     struct svm_vcpu *arch_svm = &v->arch.hvm.svm;
     struct nestedsvm *svm = &vcpu_nestedsvm(v);
@@ -294,6 +294,17 @@ static int nsvm_vmrun_permissionmap(struct vcpu *v, bool viopm)
     enum hvm_translation_result ret;
     unsigned long *ns_viomap;
     bool ioport_80 = true, ioport_ed = true;
+    /* IOPM is structured as a linear array of 64K+3 bits. */
+    const unsigned long nr_iopm_additional_pages = PFN_DOWN((0x10000 + 8) / 8 - 1);
+    gfn_t ns_iopm_end =
+        gfn_add(gaddr_to_gfn(ns_vmcb->_iopm_base_pa), nr_iopm_additional_pages);
+
+    if ( !gfn_valid(v->domain, ns_iopm_end) )
+    {
+        gdprintk(XENLOG_ERR, "%s invalid _iopm_base_pa address (%#"PRIx64")\n",
+                 __func__, ns_vmcb->_iopm_base_pa);
+        return NSVM_ERROR_VVMCB;
+    }
 
     ns_msrpm_ptr = (unsigned long *)svm->ns_cached_msrpm;
 
@@ -302,13 +313,12 @@ static int nsvm_vmrun_permissionmap(struct vcpu *v, bool viopm)
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
@@ -418,7 +428,7 @@ static int nsvm_vmcb_prepare4vmrun(struct vcpu *v, struct cpu_user_regs *regs)
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


