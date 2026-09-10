Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A80C4C79FB9
	for <xen-devel@archiver.kernel.org>; Thu, 10 Sep 2026 07:39:59 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1413940.1643889 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4ZNu-0007Q1-Lf; Thu, 10 Sep 2026 07:39:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1413940.1643889; Thu, 10 Sep 2026 07:39:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4ZNu-0007Pu-J9; Thu, 10 Sep 2026 07:39:50 +0000
Received: by outflank-mailman (input) for mailman id 1413940;
 Thu, 10 Sep 2026 06:18:54 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <lin.liu01@citrix.com>) id 1x4Y7a-0002Vu-Qn
 for xen-devel@lists.xenproject.org; Thu, 10 Sep 2026 06:18:54 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x4Y7X-004ngE-AN
 for xen-devel@lists.xenproject.org; Thu, 10 Sep 2026 08:18:51 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <lin.liu01@citrix.com>)
 id 6aa24bc7-2eae-0a2a0a5409dd-0a2a4506d066-12
 for <xen-devel@lists.xenproject.org>; Thu, 10 Sep 2026 08:18:51 +0200
Received: from [160.101.131.8] (helo=na1pdmzitismtp01.tibco.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <lin.liu01@citrix.com>)
 id 6aa24bca-195a-0a2a45060019-a0658308e172-3
 for <xen-devel@lists.xenproject.org>; Thu, 10 Sep 2026 08:18:51 +0200
Received: from xenrt10716048 (unknown [10.113.40.46])
 by na1pdmzitismtp01.tibco.com (Postfix) with ESMTP id D45B0455F60E;
 Thu, 10 Sep 2026 02:16:53 -0400 (EDT)
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
From: Lin Liu <lin.liu01@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Jason Andryuk <jason.andryuk@amd.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	Abdelkareem Abdelsaamad <abdelkareem.abdelsaamad@citrix.com>,
	Lin Liu <lin.liu01@citrix.com>
Subject: [PATCH] x86/nSVM: Validate the L1 MSRPM physical address range
Date: Thu, 10 Sep 2026 06:18:43 +0000
Message-ID: <ae1d0feb918df7b64281cb9fed876eb97f626470.1789020882.git.lin.liu01@citrix.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-16d1c6/1789021131-FE67277B-EBEBBB5A/0/0
X-purgate-type: clean
X-purgate-size: 2357

8c36d5a500 ("x86/nSVM: Validate the L1 IOPM physical address range") added
this check for the IOPM.  The MSRPM requires a check as well.

"The MSR or IOIO intercept tables extend to a physical address that is
greater than or equal to the maximum supported physical address" is illegal
VMCB state.  Refer to APM vol.2 15.5.

Assisted-by: Claude:claude-opus-5
Signed-off-by: Lin Liu <lin.liu01@citrix.com>
---
 xen/arch/x86/hvm/svm/nestedsvm.c | 20 +++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/xen/arch/x86/hvm/svm/nestedsvm.c b/xen/arch/x86/hvm/svm/nestedsvm.c
index 5adb1bd72c..3614473702 100644
--- a/xen/arch/x86/hvm/svm/nestedsvm.c
+++ b/xen/arch/x86/hvm/svm/nestedsvm.c
@@ -283,6 +283,12 @@ static int nsvm_vcpu_hostrestore(struct vcpu *v, struct cpu_user_regs *regs)
     return 0;
 }
 
+static bool nsvm_perm_map_valid(const struct vcpu *v, uint64_t base,
+                                unsigned int last)
+{
+    return gfn_valid(v->domain, gfn_add(gaddr_to_gfn(base), PFN_DOWN(last)));
+}
+
 static int nsvm_vmrun_permissionmap(struct vcpu *v)
 {
     struct svm_vcpu *arch_svm = &v->arch.hvm.svm;
@@ -295,18 +301,22 @@ static int nsvm_vmrun_permissionmap(struct vcpu *v)
     enum hvm_translation_result ret;
     unsigned long *ns_viomap;
     bool ioport_80 = true, ioport_ed = true;
-    /* IOPM is structured as a linear array of 64K+3 bits. */
-    gfn_t ns_iopm_end =
-        gfn_add(gaddr_to_gfn(ns_vmcb->_iopm_base_pa),
-                PFN_DOWN((0x10000 + 3) / 8));
 
-    if ( !gfn_valid(v->domain, ns_iopm_end) )
+    /* IOPM is structured as a linear array of 64K+3 bits. */
+    if ( !nsvm_perm_map_valid(v, ns_vmcb->_iopm_base_pa, (0x10000 + 3) / 8) )
     {
         gdprintk(XENLOG_ERR, "%s invalid _iopm_base_pa address (%#"PRIx64")\n",
                  __func__, ns_vmcb->_iopm_base_pa);
         return NSVM_ERROR_VVMCB;
     }
 
+    if ( !nsvm_perm_map_valid(v, ns_vmcb->_msrpm_base_pa, MSRPM_SIZE - 1) )
+    {
+        gdprintk(XENLOG_ERR, "%s invalid _msrpm_base_pa address (%#"PRIx64")\n",
+                 __func__, ns_vmcb->_msrpm_base_pa);
+        return NSVM_ERROR_VVMCB;
+    }
+
     ns_msrpm_ptr = (unsigned long *)svm->ns_cached_msrpm;
 
     ret = hvm_copy_from_guest_phys(svm->ns_cached_msrpm,
-- 
2.52.0


