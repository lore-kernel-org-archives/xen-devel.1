Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30030C55838
	for <xen-devel@archiver.kernel.org>; Thu,  6 Aug 2026 05:12:57 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1384160.1627227 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrqP8-0004CW-7W; Thu, 06 Aug 2026 05:12:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1384160.1627227; Thu, 06 Aug 2026 05:12:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrqP8-0004CP-4t; Thu, 06 Aug 2026 05:12:30 +0000
Received: by outflank-mailman (input) for mailman id 1384160;
 Thu, 06 Aug 2026 03:17:43 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <chunjie.zhu@citrix.com>) id 1wroc3-0005Wp-Gj
 for xen-devel@lists.xenproject.org; Thu, 06 Aug 2026 03:17:43 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wroc2-006J3Y-Gc
 for xen-devel@lists.xenproject.org; Thu, 06 Aug 2026 05:17:42 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <chunjie.zhu@citrix.com>)
 id 6a73fcb9-bab6-0a2a0a5309dd-0a2a4508b712-12
 for <xen-devel@lists.xenproject.org>; Thu, 06 Aug 2026 05:17:42 +0200
Received: from [160.101.131.8] (helo=na1pdmzitismtp01.tibco.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <chunjie.zhu@citrix.com>)
 id 6a73fcd5-f659-0a2a45080019-a06583088c6e-3
 for <xen-devel@lists.xenproject.org>; Thu, 06 Aug 2026 05:17:42 +0200
Received: from eddie6.eng.citrite.net (unknown [10.113.40.46])
 by na1pdmzitismtp01.tibco.com (Postfix) with ESMTP id EE706448DDE0;
 Wed,  5 Aug 2026 23:16:02 -0400 (EDT)
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
From: Chunjie Zhu <chunjie.zhu@citrix.com>
To: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Jason Andryuk <jason.andryuk@amd.com>,
	Teddy Astie <teddy.astie@vates.tech>
Cc: Chunjie Zhu <chunjie.zhu@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: [PATCH] x86/svm: mandatory update VMCB nextrip for soft interrupts
Date: Thu,  6 Aug 2026 03:17:24 +0000
Message-ID: <20260806031732.10242-1-chunjie.zhu@citrix.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c1860d/1785986262-DFAD487B-04C0ABD2/0/0
X-purgate-type: clean
X-purgate-size: 1068

Signed-off-by: Chunjie Zhu <chunjie.zhu@citrix.com>
---
 xen/arch/x86/hvm/svm/nestedsvm.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/hvm/svm/nestedsvm.c b/xen/arch/x86/hvm/svm/nestedsvm.c
index b06124c2c9ed..815713b8b506 100644
--- a/xen/arch/x86/hvm/svm/nestedsvm.c
+++ b/xen/arch/x86/hvm/svm/nestedsvm.c
@@ -449,7 +449,14 @@ static int nsvm_vmcb_prepare4vmrun(struct vcpu *v, struct cpu_user_regs *regs)
     n2vmcb->virt_ext.bytes =
         n1vmcb->virt_ext.bytes | ns_vmcb->virt_ext.bytes;
 
-    /* NextRIP - only evaluated on #VMEXIT. */
+    /* next_rip is consumed on VMRUN as the return address pushed on the
+     * stack·for·injected·soft·exceptions/interrupts. This assignment
+     * statement must be enforced, otherwise, it might cause vcpu wedge.
+     *
+     * APM Vol.2 Event Injection does not specifies what happens if NEXTRIP
+     * holds an invalid/garbage value.
+     */
+    n2vmcb->nextrip = ns_vmcb->nextrip;
 
     /*
      * VMCB Save State Area
-- 
2.34.1


