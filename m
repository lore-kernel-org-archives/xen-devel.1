Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4957A606A31A
	for <xen-devel@archiver.kernel.org>; Wed, 28 Oct 2026 23:31:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=xenproject.org header.i=@xenproject.org header.a=rsa-sha256 header.s=20200302mail header.b=psZXujfR
Received: from list by lists.xenproject.org with outflank-mailman.1463812.1674784 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xMD6y-0003y0-SN; Wed, 28 Oct 2026 23:31:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1463812.1674784; Wed, 28 Oct 2026 23:31:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xMD6x-0003nU-85; Wed, 28 Oct 2026 23:31:15 +0000
Received: by outflank-mailman (input) for mailman id 1463812;
 Wed, 28 Oct 2026 23:30:37 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <gwd@xenproject.org>) id 1xMD6L-0004A9-FZ
 for xen-devel@lists.xenproject.org; Wed, 28 Oct 2026 23:30:37 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.98.2)
 (envelope-from <gwd@xenproject.org>) id 1xMD6L-00000000pRX-2TfM;
 Wed, 28 Oct 2026 23:30:37 +0000
Received: from [217.155.165.12] (helo=Mac.fritz.box.net)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_CHACHA20_POLY1305_SHA256 (Exim 4.98.2)
 (envelope-from <gwd@xenproject.org>) id 1xMCjm-00000001KpM-0PHd;
 Wed, 28 Oct 2026 23:07:18 +0000
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
	bh=78UJyNn4VY/h+N1P7RYObuj4ivXfajt4ZYGSI254v8U=; b=psZXujfReIZ3ehIb5LClc4d9JS
	FmiH8crUB/DVU6qThT8cPtrvSs0b11qR+IP1ik0r5R/fz9O0TJqlgqv/v6THkhh3WxDoEIuatdKa4
	6WMESDMEXkgZ7TaqEHo06Q8wP82pqcBEGalQR93IopuT2LdamLzwQjrbKYfyEgo5AUqg=;
From: George Dunlap <gwd@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: [PATCH v5 40/45] x86/mpx: Map/unmap xsave area in read_bndcfgu()
Date: Wed, 28 Oct 2026 23:05:54 +0000
Message-ID: <20261028-asi-hvm-v5-40-13b908e0df0b@xenproject.org>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261028-asi-hvm-v5-0-13b908e0df0b@xenproject.org>
References: <20261028-asi-hvm-v5-0-13b908e0df0b@xenproject.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-19.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Alejandro Vallejo <alejandro.vallejo@cloud.com>

The BNDCSR read executes XSAVE into the local idle vCPU's save area as
scratch space and pulls BNDCFGU out of the result.  Fetch that buffer
through the VCPU_MAP_XSAVE_AREA() seam rather than a raw dereference,
so the function is indifferent to where vCPU save areas live.  This
was the last raw access to another vCPU's save-area pointer outside
the seam.

No functional change.

Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Assisted-by: Claude Code:claude-fable-5
Signed-off-by: George Dunlap <gwd@xenproject.org>

---
Revived from "x86: Address Space Isolation FPU preparations" v3 patch
09/12 (<20250110132823.24348-10-alejandro.vallejo@cloud.com>; no v4
was ever posted).

Changes in v5:
- New in this version.

Changes since the previously posted version:
 - Constified the vcpu pointer, as requested by Jan Beulich on the
   original thread (the xstate pointer itself stays mutable: the
   asm()s write through it, as Jan noted in withdrawing that half of
   the request).
 - Expanded the commit message.
---
 xen/arch/x86/xstate.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/xstate.c b/xen/arch/x86/xstate.c
index 8336414c52..2eae3f098d 100644
--- a/xen/arch/x86/xstate.c
+++ b/xen/arch/x86/xstate.c
@@ -1023,9 +1023,10 @@ int handle_xsetbv(u32 index, u64 new_bv)
 
 uint64_t read_bndcfgu(void)
 {
+    uint64_t bndcfgu = 0;
     unsigned long cr0 = read_cr0();
-    struct xsave_struct *xstate
-        = idle_vcpu[smp_processor_id()]->arch.xsave_area;
+    const struct vcpu *v = idle_vcpu[smp_processor_id()];
+    struct xsave_struct *xstate = VCPU_MAP_XSAVE_AREA(v);
     const struct xstate_bndcsr *bndcsr;
 
     ASSERT(cpu_has_mpx);
@@ -1051,7 +1052,12 @@ uint64_t read_bndcfgu(void)
     if ( cr0 & X86_CR0_TS )
         write_cr0(cr0);
 
-    return xstate->xsave_hdr.xstate_bv & X86_XCR0_BNDCSR ? bndcsr->bndcfgu : 0;
+    if ( xstate->xsave_hdr.xstate_bv & X86_XCR0_BNDCSR )
+        bndcfgu = bndcsr->bndcfgu;
+
+    VCPU_UNMAP_XSAVE_AREA(v, xstate);
+
+    return bndcfgu;
 }
 
 void xstate_set_init(uint64_t mask)
-- 
2.56.0


