Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B396E606A31E
	for <xen-devel@archiver.kernel.org>; Mon, 19 Oct 2026 19:55:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=xenproject.org header.i=@xenproject.org header.a=rsa-sha256 header.s=20200302mail header.b=EN4gmx/0
Received: from list by lists.xenproject.org with outflank-mailman.1454847.1668478 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xItSB-0006F2-3X; Mon, 19 Oct 2026 19:55:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1454847.1668478; Mon, 19 Oct 2026 19:55:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xItS9-0006AJ-Rr; Mon, 19 Oct 2026 19:55:25 +0000
Received: by outflank-mailman (input) for mailman id 1454847;
 Mon, 19 Oct 2026 19:55:16 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <gwd@xenproject.org>) id 1xItRz-0003iE-TE
 for xen-devel@lists.xenproject.org; Mon, 19 Oct 2026 19:55:15 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.98.2)
 (envelope-from <gwd@xenproject.org>) id 1xItRz-000000022yu-2vQR;
 Mon, 19 Oct 2026 19:55:15 +0000
Received: from [217.155.165.12] (helo=Georges-MacBook-Pro-2.tail87ea19.ts.net)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_CHACHA20_POLY1305_SHA256 (Exim 4.98.2)
 (envelope-from <gwd@xenproject.org>) id 1xItGp-00000001FjN-0OtQ;
 Mon, 19 Oct 2026 19:43:43 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From;
	bh=aVhlCyy1J7G7Zme04HVYXzoAzI/t0O7TFZbPngGRa5g=; b=EN4gmx/0hUfhB7xCXkyaw9ale0
	t0EUyoIuGCLpJcLAxcWCGGsWJFwh1lV7D1AcYkl4wkuKzTrc8r+JAhVjQoiPt4Qa8+KAqZOQ4VGVS
	MSd19vyuoGn1n9CaL/F+WcMN5aB11vvtTSETYnkIc5OOFc8TvD3GVjgVDejlCjvBq2BE=;
From: George Dunlap <gwd@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Jason Andryuk <jason.andryuk@amd.com>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: [PATCH v4 26/30] x86/svm: clear the VMCB clean bits in svm_ctxt_switch_from()
Date: Mon, 19 Oct 2026 20:42:57 +0100
Message-ID: <20261019-asi-hvm-v4-26-b68b66652266@xenproject.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261019-asi-hvm-v4-0-b68b66652266@xenproject.org>
References: <20261019-asi-hvm-v4-0-b68b66652266@xenproject.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-19.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

A VMCB's clean bits must all be clear when its vCPU next runs after a
deschedule, as other VMCBs run on the pCPU in the meantime.
svm_ctxt_switch_to() clears them as the vCPU is scheduled in; clear them
in svm_ctxt_switch_from() instead, as it is scheduled out.

This is equivalent.  While the vCPU is descheduled, accessors reaching
its VMCB only ever clear clean bits: svm_vmexit_handler(), which sets
them all, runs only in the vCPU's own context.  So do the nested-SVM
paths that change the active VMCB, nsvm_vcpu_hostrestore() and
nsvm_vcpu_vmentry(), and they clear the incoming VMCB's clean bits
themselves.

This prepares for moving VMCBs off always-mapped memory:
svm_ctxt_switch_to() runs before write_ptbase(), where the incoming
vCPU's VMCB will not be mapped.

Assisted-by: Claude Code:claude-fable-5, Claude Code:claude-opus-5-5
Signed-off-by: George Dunlap <gwd@xenproject.org>
---
Changes in v4:
- New in this version.
---
 xen/arch/x86/hvm/svm/svm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index 241843d8c0..4e19df9865 100644
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -919,6 +919,8 @@ static void cf_check svm_ctxt_switch_from(struct vcpu *v)
     svm_save_dr(v);
     svm_tsc_ratio_save(v);
 
+    v->arch.hvm.svm.vmcb->cleanbits.raw = 0;
+
     svm_sync_vmcb(v, vmcb_needs_vmload);
     svm_vmload_pa(per_cpu(host_vmcb, cpu));
 
@@ -938,7 +940,6 @@ static void cf_check svm_ctxt_switch_from(struct vcpu *v)
 
 static void cf_check svm_ctxt_switch_to(struct vcpu *v)
 {
-    struct vmcb_struct *vmcb = v->arch.hvm.svm.vmcb;
     int cpu = smp_processor_id();
 
     /*
@@ -956,7 +957,6 @@ static void cf_check svm_ctxt_switch_to(struct vcpu *v)
 
     svm_restore_dr(v);
 
-    vmcb->cleanbits.raw = 0;
     svm_tsc_ratio_load(v);
 
     if ( cpu_has_msr_tsc_aux )
-- 
2.55.0


