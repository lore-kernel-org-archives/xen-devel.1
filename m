Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BAF0C531F9
	for <xen-devel@archiver.kernel.org>; Tue, 28 Jul 2026 11:44:48 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1372414.1619762 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wogEY-0002C5-7y; Tue, 28 Jul 2026 11:44:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1372414.1619762; Tue, 28 Jul 2026 11:44:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wogEY-0002By-5P; Tue, 28 Jul 2026 11:44:30 +0000
Received: by outflank-mailman (input) for mailman id 1372414;
 Tue, 28 Jul 2026 11:44:28 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <abdelkareem.abdelsaamad@citrix.com>)
 id 1wogEW-0002Bs-Iv
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2026 11:44:28 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wogEV-00B68W-R7
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2026 13:44:27 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <abdelkareem.abdelsaamad@citrix.com>)
 id 6a689615-e002-0a2a0a5209dd-0a2a4503d6be-24
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 13:44:27 +0200
Received: from [160.101.131.9] (helo=na1pdmzitismtp02.tibco.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <abdelkareem.abdelsaamad@citrix.com>)
 id 6a68961a-fae8-0a2a45030019-a0658309e664-3
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 13:44:27 +0200
Received: from fedora.eng.citrite.net (unknown [10.113.40.46])
 by na1pdmzitismtp02.tibco.com (Postfix) with ESMTP id B84CB82E7CE4;
 Tue, 28 Jul 2026 07:42:41 -0400 (EDT)
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
Subject: [PATCH v1] x86/nSVM: Check the L1 IOPM_BASE and MSRPM_BASE assigned physical addresses
Date: Tue, 28 Jul 2026 12:41:39 +0100
Message-ID: <8f7c6601af60656025e5aeb0d2e8e1359d8c58f9.1785231704.git.abdelkareem.abdelsaamad@citrix.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-33051d/1785239067-6F8C54E9-FCDCE5B0/0/0
X-purgate-type: clean
X-purgate-size: 4579

The Xen nested virtualization code maps the physical addresses assigned by
the L1 guests, for IOPM_BASE and MSRPM_BASE directly to valid host addresses
without sanity checks. Add sanity checks to verify the L1 assigned addresses
are valid guest addresses. This check also makes the bahavior compliant with
the Hardware handling of the assigned addresses. The hardware is expected to
cause VMEXIT_INVALID with IOPM_BASE and MSRPM_BASE addresses greater than or
equal to the maximum supported physical address, see[1].

While at it, clean up the code. Remove the unused bool viopm and the
svm_vcpu::ns_oiomap_pa. 

[1] https://docs.amd.com/v/u/en-US/24593_3.44_APM_Vol2

Signed-off-by: Abdelkareem Abdelsaamad <abdelkareem.abdelsaamad@citrix.com>
---
Testing:
 - Using a locally developed XTF nested virt setup, I manually tested VMRUN
   instruction handling with the address value (0xffffffffffffffffUL) assigned
   to VMCB::iopm_base_pa:
   - Without the changes the address is mapped by the Xen code to the address
     0x604b634000 and it completes the execution without any reported errors.
   - With the changes, the VMRUN execution fails VMEXIT_INVALID is reported
     back in the ns_vmexit.exitcode.
 - CI tests:
https://gitlab.com/xen-project/people/aabdelsa/xen/-/pipelines/2709640880
---
 xen/arch/x86/hvm/svm/nestedsvm.c         | 24 +++++++++++++++++++++---
 xen/arch/x85/include/asm/hvm/svm-types.h |  2 +-
 2 files changed, 22 insertions(+), 4 deletions(-)

diff --git a/xen/arch/x86/hvm/svm/nestedsvm.c b/xen/arch/x86/hvm/svm/nestedsvm.c
index b06124c2c9..25b91a6b07 100644
--- a/xen/arch/x86/hvm/svm/nestedsvm.c
+++ b/xen/arch/x86/hvm/svm/nestedsvm.c
@@ -18,6 +18,8 @@
 
 #define NSVM_ERROR_VVMCB        1
 #define NSVM_ERROR_VMENTRY      2
+#define IOPM_MAX_PAGES_DIFF     2
+#define MSRPM_MAX_PAGES_DIFF    1
 
 int nestedsvm_vmcb_map(struct vcpu *v, uint64_t vmcbaddr)
 {
@@ -282,7 +284,7 @@ static int nsvm_vcpu_hostrestore(struct vcpu *v, struct cpu_user_regs *regs)
     return 0;
 }
 
-static int nsvm_vmrun_permissionmap(struct vcpu *v, bool viopm)
+static int nsvm_vmrun_permissionmap(struct vcpu *v)
 {
     struct svm_vcpu *arch_svm = &v->arch.hvm.svm;
     struct nestedsvm *svm = &vcpu_nestedsvm(v);
@@ -295,6 +297,23 @@ static int nsvm_vmrun_permissionmap(struct vcpu *v, bool viopm)
     unsigned long *ns_viomap;
     bool ioport_80 = true, ioport_ed = true;
 
+    if ( (domain_get_maximum_gpfn(v->domain) < IOPM_MAX_PAGES_DIFF) ||
+         (gfn_x(_gfn(ns_vmcb->_iopm_base_pa >> PAGE_SHIFT)) >
+          (domain_get_maximum_gpfn(v->domain) - IOPM_MAX_PAGES_DIFF)) )
+    {
+        gdprintk(XENLOG_ERR, "nsvm_vmrun_permissionmap invalid _iopm_base_pa"
+                 " address (%#"PRIx64")\n", ns_vmcb->_iopm_base_pa);
+        return 1;
+    }
+
+    if ( (gfn_x(_gfn(ns_vmcb->_msrpm_base_pa >> PAGE_SHIFT)) >
+          (domain_get_maximum_gpfn(v->domain) - MSRPM_MAX_PAGES_DIFF)) )
+    {
+        gdprintk(XENLOG_ERR, "nsvm_vmrun_permissionmap invalid _msrpm_base_pa"
+                " address (%#"PRIx64")\n", ns_vmcb->_msrpm_base_pa);
+        return 1;
+    }
+
     ns_msrpm_ptr = (unsigned long *)svm->ns_cached_msrpm;
 
     ret = hvm_copy_from_guest_phys(svm->ns_cached_msrpm,
@@ -308,7 +327,6 @@ static int nsvm_vmrun_permissionmap(struct vcpu *v, bool viopm)
     /* Check l1 guest io permission map and get a shadow one based on
      * if l1 guest intercepts io ports 0x80 and/or 0xED.
      */
-    svm->ns_oiomap_pa = svm->ns_iomap_pa;
     svm->ns_iomap_pa = ns_vmcb->_iopm_base_pa;
 
     ns_viomap = hvm_map_guest_frame_ro(svm->ns_iomap_pa >> PAGE_SHIFT, 0);
@@ -418,7 +436,7 @@ static int nsvm_vmcb_prepare4vmrun(struct vcpu *v, struct cpu_user_regs *regs)
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


