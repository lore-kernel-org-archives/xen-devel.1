Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39DDDC9833E
	for <xen-devel@archiver.kernel.org>; Mon, 28 Sep 2026 10:24:11 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1435869.1654641 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xB8WU-0000kH-Kr; Mon, 28 Sep 2026 10:23:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1435869.1654641; Mon, 28 Sep 2026 10:23:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xB8WU-0000kA-Hj; Mon, 28 Sep 2026 10:23:50 +0000
Received: by outflank-mailman (input) for mailman id 1435869;
 Mon, 28 Sep 2026 10:23:48 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <lin.liu01@citrix.com>) id 1xB8WS-0000k4-Pz
 for xen-devel@lists.xenproject.org; Mon, 28 Sep 2026 10:23:48 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xB8WR-008xiZ-Bc
 for xen-devel@lists.xenproject.org; Mon, 28 Sep 2026 12:23:47 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <lin.liu01@citrix.com>)
 id 6aba402b-2eae-0a2a0a5409dd-0a2a4504de3a-14
 for <xen-devel@lists.xenproject.org>; Mon, 28 Sep 2026 12:23:47 +0200
Received: from [160.101.131.8] (helo=na1pdmzitismtp01.tibco.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <lin.liu01@citrix.com>)
 id 6aba4031-b57f-0a2a45040019-a0658308c4fe-3
 for <xen-devel@lists.xenproject.org>; Mon, 28 Sep 2026 12:23:46 +0200
Received: from xenrt10716048 (unknown [10.113.40.46])
 by na1pdmzitismtp01.tibco.com (Postfix) with ESMTP id 4A1FB45047C0;
 Mon, 28 Sep 2026 06:21:40 -0400 (EDT)
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
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>,
	Lin Liu <lin.liu01@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Jason Andryuk <jason.andryuk@amd.com>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: [PATCH v2] x86/nSVM: Save L2's CR0, CR4 and EFER on #VMEXIT, not Xen's
Date: Mon, 28 Sep 2026 10:23:43 +0000
Message-ID: <33c6c6e2838745be1de15874856812bb68e671cc.1790587806.git.lin.liu01@citrix.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ebf023/1790591026-C06DAB50-D6736136/0/0
X-purgate-type: clean
X-purgate-size: 1649

nsvm_vmcb_prepare4vmexit() copies CR0, CR4 and EFER out of the shadow
VMCB, but Xen does not run L2 with L2's own values: svm_update_guest_cr()
ORs in HVM_CR4_HOST_MASK and, under shadow paging, CR0.PG|WP, and
svm_update_guest_efer() forces EFER.SVME.  Hardware writes back what L2
ran with, so L1 reads Xen's bits back as L2's.  Save the shadowed values
instead.

CR4 leaks CR4.MCE under HAP.  EFER is observable on a VMRUN rejected for
SVME=0: L1 gets back a VMCB with the bit it deliberately cleared.  CR0 is
a no-op today, since nested virt requires HAP, and is changed for
consistency.

Fixes: 9a779e4fc161 ("Implement SVM specific part for Nested Virtualization")
Assisted-by: Claude:claude-opus-5
Signed-off-by: Lin Liu <lin.liu01@citrix.com>
---
Changes in v2:
- also save CR0 and EFER, as requested by Jan Beulich and Ross Lagerwall

 xen/arch/x86/hvm/svm/nestedsvm.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/hvm/svm/nestedsvm.c b/xen/arch/x86/hvm/svm/nestedsvm.c
index 81579370b8..2e3b70345b 100644
--- a/xen/arch/x86/hvm/svm/nestedsvm.c
+++ b/xen/arch/x86/hvm/svm/nestedsvm.c
@@ -1079,11 +1079,11 @@ nsvm_vmcb_prepare4vmexit(struct vcpu *v, struct cpu_user_regs *regs)
     ns_vmcb->_cpl = n2vmcb->_cpl;
 
     /* EFER */
-    ns_vmcb->_efer = n2vmcb->_efer;
+    ns_vmcb->_efer = v->arch.hvm.guest_efer;
 
     /* CRn */
-    ns_vmcb->_cr4 = n2vmcb->_cr4;
-    ns_vmcb->_cr0 = n2vmcb->_cr0;
+    ns_vmcb->_cr4 = v->arch.hvm.guest_cr[4];
+    ns_vmcb->_cr0 = v->arch.hvm.guest_cr[0];
 
     /* DRn */
     ns_vmcb->_dr7 = n2vmcb->_dr7;
-- 
2.52.0


