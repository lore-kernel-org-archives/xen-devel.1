Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 596D2C53200
	for <xen-devel@archiver.kernel.org>; Wed, 29 Jul 2026 14:41:26 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1376091.1623051 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wp5Sw-0004E5-07; Wed, 29 Jul 2026 14:41:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1376091.1623051; Wed, 29 Jul 2026 14:41:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wp5Sv-0004Dy-Ta; Wed, 29 Jul 2026 14:41:01 +0000
Received: by outflank-mailman (input) for mailman id 1376091;
 Wed, 29 Jul 2026 14:41:00 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <abdelkareem.abdelsaamad@citrix.com>)
 id 1wp5Su-0004Dr-L0
 for xen-devel@lists.xenproject.org; Wed, 29 Jul 2026 14:41:00 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wp5Su-00EgJK-1k
 for xen-devel@lists.xenproject.org; Wed, 29 Jul 2026 16:41:00 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <abdelkareem.abdelsaamad@citrix.com>)
 id 6a6a10ef-5cb7-0a2a0a5109dd-0a2a4507c79e-16
 for <xen-devel@lists.xenproject.org>; Wed, 29 Jul 2026 16:40:59 +0200
Received: from [160.101.131.9] (helo=na1pdmzitismtp02.tibco.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <abdelkareem.abdelsaamad@citrix.com>)
 id 6a6a10fa-b4ea-0a2a45070019-a0658309add0-3
 for <xen-devel@lists.xenproject.org>; Wed, 29 Jul 2026 16:40:59 +0200
Received: from fedora.eng.citrite.net (unknown [10.113.40.46])
 by na1pdmzitismtp02.tibco.com (Postfix) with ESMTP id 6597D83093B8;
 Wed, 29 Jul 2026 10:39:13 -0400 (EDT)
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
Subject: [PATCH v2] x86/nSVM: Check the L1 IOPM_BASE and MSRPM_BASE assigned physical addresses
Date: Wed, 29 Jul 2026 15:38:09 +0100
Message-ID: <966e58864089efbe30e9b900f09005fe13c74729.1785335079.git.abdelkareem.abdelsaamad@citrix.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ef75cf/1785336059-A5EC6AE4-8EF146E4/0/0
X-purgate-type: clean
X-purgate-size: 4872

The Xen nested virtualization code maps the physical addresses assigned by
the L1 guests, for IOPM_BASE and MSRPM_BASE, directly to valid host addresses
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
Changes in v2:
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
https://gitlab.com/xen-project/people/aabdelsa/xen/-/pipelines/2715620521
---
 xen/arch/x86/hvm/svm/nestedsvm.c         | 25 +++++++++++++++++++++---
 xen/arch/x86/include/asm/hvm/svm-types.h |  2 +-
 2 files changed, 23 insertions(+), 4 deletions(-)

diff --git a/xen/arch/x86/hvm/svm/nestedsvm.c b/xen/arch/x86/hvm/svm/nestedsvm.c
index b06124c2c9..134c7039af 100644
--- a/xen/arch/x86/hvm/svm/nestedsvm.c
+++ b/xen/arch/x86/hvm/svm/nestedsvm.c
@@ -18,6 +18,8 @@
 
 #define NSVM_ERROR_VVMCB        1
 #define NSVM_ERROR_VMENTRY      2
+#define IOPM_PAGES_COUNT        3
+#define MSRPM_PAGES_COUNT       2
 
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
@@ -294,6 +296,24 @@ static int nsvm_vmrun_permissionmap(struct vcpu *v, bool viopm)
     enum hvm_translation_result ret;
     unsigned long *ns_viomap;
     bool ioport_80 = true, ioport_ed = true;
+    gfn_t ns_iopm_end =
+        gfn_add(gaddr_to_gfn(ns_vmcb->_iopm_base_pa), (IOPM_PAGES_COUNT - 1));
+    gfn_t ns_msrpm_end =
+        gfn_add(gaddr_to_gfn(ns_vmcb->_msrpm_base_pa), (MSRPM_PAGES_COUNT - 1));
+
+    if ( gfn_x(ns_iopm_end) > domain_get_maximum_gpfn(v->domain) )
+    {
+        gdprintk(XENLOG_ERR, "%s invalid _iopm_base_pa address (%#"PRIx64")\n",
+                 __func__, ns_vmcb->_iopm_base_pa);
+        return 1;
+    }
+
+    if ( gfn_x(ns_msrpm_end) > domain_get_maximum_gpfn(v->domain) )
+    {
+        gdprintk(XENLOG_ERR, "%s invalid _msrpm_base_pa address (%#"PRIx64")\n",
+                 __func__, ns_vmcb->_msrpm_base_pa);
+        return 1;
+    }
 
     ns_msrpm_ptr = (unsigned long *)svm->ns_cached_msrpm;
 
@@ -308,7 +328,6 @@ static int nsvm_vmrun_permissionmap(struct vcpu *v, bool viopm)
     /* Check l1 guest io permission map and get a shadow one based on
      * if l1 guest intercepts io ports 0x80 and/or 0xED.
      */
-    svm->ns_oiomap_pa = svm->ns_iomap_pa;
     svm->ns_iomap_pa = ns_vmcb->_iopm_base_pa;
 
     ns_viomap = hvm_map_guest_frame_ro(svm->ns_iomap_pa >> PAGE_SHIFT, 0);
@@ -418,7 +437,7 @@ static int nsvm_vmcb_prepare4vmrun(struct vcpu *v, struct cpu_user_regs *regs)
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


