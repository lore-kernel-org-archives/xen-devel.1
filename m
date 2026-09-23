Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4061C982FA
	for <xen-devel@archiver.kernel.org>; Wed, 23 Sep 2026 09:51:51 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1430009.1652631 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9JdP-0004Jn-Pc; Wed, 23 Sep 2026 09:51:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1430009.1652631; Wed, 23 Sep 2026 09:51:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9JdP-0004Jg-Mz; Wed, 23 Sep 2026 09:51:27 +0000
Received: by outflank-mailman (input) for mailman id 1430009;
 Wed, 23 Sep 2026 09:51:26 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <lin.liu01@citrix.com>) id 1x9JdO-0004Ja-Oe
 for xen-devel@lists.xenproject.org; Wed, 23 Sep 2026 09:51:26 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x9JdN-005kew-Q7
 for xen-devel@lists.xenproject.org; Wed, 23 Sep 2026 11:51:25 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <lin.liu01@citrix.com>)
 id 6ab3a11d-e002-0a2a0a5209dd-0a2a4501d596-2
 for <xen-devel@lists.xenproject.org>; Wed, 23 Sep 2026 11:51:25 +0200
Received: from [160.101.131.8] (helo=na1pdmzitismtp01.tibco.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <lin.liu01@citrix.com>)
 id 6ab3a116-5984-0a2a45010019-a0658308e986-3
 for <xen-devel@lists.xenproject.org>; Wed, 23 Sep 2026 11:51:19 +0200
Received: from xenrt10716048 (unknown [10.113.40.46])
 by na1pdmzitismtp01.tibco.com (Postfix) with ESMTP id B6AB845A9FF8;
 Wed, 23 Sep 2026 05:49:14 -0400 (EDT)
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
Cc: Lin Liu <lin.liu01@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Jason Andryuk <jason.andryuk@amd.com>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: [PATCH] x86/nSVM: Save L2's CR4 on #VMEXIT, not Xen's
Date: Wed, 23 Sep 2026 09:51:15 +0000
Message-ID: <a5702b9bc1d354dac5778deacbc397e76530408a.1790069475.git.lin.liu01@citrix.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d62444/1790157079-C4B45757-6EC62B25/0/0
X-purgate-type: clean
X-purgate-size: 1111

Xen leaks the host's CR4 bits to L1.

nsvm_vmcb_prepare4vmrun() constructs the shadow VMCB's CR4 via
hvm_set_cr4(), and svm_update_guest_cr() ORs in HVM_CR4_HOST_MASK.
nsvm_vmcb_prepare4vmexit() then copies CR4 back out of the shadow VMCB
instead of the value kept in v->arch.hvm.guest_cr[4], so L1 reads back
Xen's bits - under HAP, CR4.MCE.

Fixes: 9a779e4fc161 ("Implement SVM specific part for Nested Virtualization")
Assisted-by: Claude:claude-opus-5
Signed-off-by: Lin Liu <lin.liu01@citrix.com>
---
 xen/arch/x86/hvm/svm/nestedsvm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/x86/hvm/svm/nestedsvm.c b/xen/arch/x86/hvm/svm/nestedsvm.c
index a8b15d6eae..8d99b0affc 100644
--- a/xen/arch/x86/hvm/svm/nestedsvm.c
+++ b/xen/arch/x86/hvm/svm/nestedsvm.c
@@ -1082,7 +1082,7 @@ nsvm_vmcb_prepare4vmexit(struct vcpu *v, struct cpu_user_regs *regs)
     ns_vmcb->_efer = n2vmcb->_efer;
 
     /* CRn */
-    ns_vmcb->_cr4 = n2vmcb->_cr4;
+    ns_vmcb->_cr4 = v->arch.hvm.guest_cr[4];
     ns_vmcb->_cr0 = n2vmcb->_cr0;
 
     /* DRn */
-- 
2.52.0


