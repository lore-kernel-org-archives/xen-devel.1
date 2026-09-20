Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26A46C982CC
	for <xen-devel@archiver.kernel.org>; Sun, 20 Sep 2026 03:33:43 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1426641.1649645 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x88Ii-0005Vn-EE; Sun, 20 Sep 2026 03:33:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1426641.1649645; Sun, 20 Sep 2026 03:33:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x88Ii-0005Vf-9P; Sun, 20 Sep 2026 03:33:12 +0000
Received: by outflank-mailman (input) for mailman id 1426641;
 Sun, 20 Sep 2026 03:33:11 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <lin.liu01@citrix.com>) id 1x88Ih-0005VZ-03
 for xen-devel@lists.xenproject.org; Sun, 20 Sep 2026 03:33:11 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x88Ig-00F0tH-DK
 for xen-devel@lists.xenproject.org; Sun, 20 Sep 2026 05:33:10 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <lin.liu01@citrix.com>)
 id 6aaf53d7-bab6-0a2a0a5309dd-0a2a450caee4-16
 for <xen-devel@lists.xenproject.org>; Sun, 20 Sep 2026 05:33:10 +0200
Received: from [160.101.131.9] (helo=na1pdmzitismtp02.tibco.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <lin.liu01@citrix.com>)
 id 6aaf53f5-f479-0a2a450c0019-a0658309e718-3
 for <xen-devel@lists.xenproject.org>; Sun, 20 Sep 2026 05:33:10 +0200
Received: from xenrt10716048 (unknown [10.113.40.46])
 by na1pdmzitismtp02.tibco.com (Postfix) with ESMTP id 8188383DA34E;
 Sat, 19 Sep 2026 23:30:57 -0400 (EDT)
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
Subject: [PATCH] x86/nSVM: Don't clear TLB_CONTROL on #VMEXIT
Date: Sun, 20 Sep 2026 03:33:06 +0000
Message-ID: <cf664749ee96e217cfb9a15e4e99ee1b8add3745.1789875186.git.lin.liu01@citrix.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d25034/1789875190-77AD4A5B-42AF16B1/0/0
X-purgate-type: clean
X-purgate-size: 1119

nsvm_vmcb_prepare4vmexit() zeroes TLB_CONTROL in the L1-provided VMCB.
That VMCB is mapped writable, so the store lands in L1's memory and L1
sees a field it wrote come back as 0.

APM vol 2 rev 3.45 15.16.1 (p.550): "The VMRUN instruction reads, but
does not change, the value of the TLB_CONTROL field."

Fixes: 9a779e4fc161 ("Implement SVM specific part for Nested Virtualization")
Assisted-by: Claude:claude-opus-5
Signed-off-by: Lin Liu <lin.liu01@citrix.com>
---
 xen/arch/x86/hvm/svm/nestedsvm.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/xen/arch/x86/hvm/svm/nestedsvm.c b/xen/arch/x86/hvm/svm/nestedsvm.c
index a8b15d6eae..1ac2e57b3b 100644
--- a/xen/arch/x86/hvm/svm/nestedsvm.c
+++ b/xen/arch/x86/hvm/svm/nestedsvm.c
@@ -991,9 +991,6 @@ nsvm_vmcb_prepare4vmexit(struct vcpu *v, struct cpu_user_regs *regs)
     /* ASID */
     /* vmcb_set_asid(ns_vmcb, vmcb_get_asid(n2vmcb)); */
 
-    /* TLB control */
-    ns_vmcb->tlb_control = 0;
-
     /* Virtual Interrupts */
     ns_vmcb->_vintr = n2vmcb->_vintr;
     if ( !svm->ns_hostflags.fields.vintrmask )
-- 
2.52.0


