Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6FDE606A335
	for <xen-devel@archiver.kernel.org>; Thu, 12 Nov 2026 05:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HPRBAdhJ
Received: from list by lists.xenproject.org with outflank-mailman.1485120.1688413 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRNXW-0003sf-6E; Thu, 12 Nov 2026 05:40:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1485120.1688413; Thu, 12 Nov 2026 05:40:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRNXW-0003s8-3T; Thu, 12 Nov 2026 05:40:02 +0000
Received: by outflank-mailman (input) for mailman id 1485120;
 Thu, 12 Nov 2026 05:40:01 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ma.mandourr@gmail.com>) id 1xRNXU-0003hn-Uf
 for xen-devel@lists.xenproject.org; Thu, 12 Nov 2026 05:40:00 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xRNXT-005j5y-TS
 for xen-devel@lists.xenproject.org; Thu, 12 Nov 2026 06:39:59 +0100
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ma.mandourr@gmail.com>)
 id 6af55112-8faa-0a2a0a5109dd-0a2a45029530-18
 for <xen-devel@lists.xenproject.org>; Thu, 12 Nov 2026 06:39:59 +0100
Received: from [209.85.216.49] (helo=mail-pj1-f49.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <ma.mandourr@gmail.com>)
 id 6af5512e-6ca4-0a2a45020019-d155d831c553-3
 for <xen-devel@lists.xenproject.org>; Thu, 12 Nov 2026 06:39:59 +0100
Received: by mail-pj1-f49.google.com with SMTP id
 98e67ed59e1d1-3ac78f4c10bso2040497a91.1
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 21:39:59 -0800 (PST)
Received: from cs-arch-srv04.cmpt.sfu.ca (cs-arch-srv04.cmpt.sfu.ca.
 [142.58.10.48]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3b197c8aae8sm2718109a91.14.2026.11.11.21.39.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Nov 2026 21:39:57 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20260707 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794461998; x=1795066798; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=UTurnFPFeSTNzOL1j7FGTs7ghAwGXevqTOEMLjH5zYs=;
        b=HPRBAdhJyaQn1VmgpBmCNtqOeMcPVKGN9APZem5ocY4rRpELAeyC4kbSA0/RFzpkdW
         H1uGxJ8dtxiJSvCiUkoz8PnutlnxmOM8YR3u+XOGzB4RxfqrvpafPMU3DjKvgJTC+7XB
         X/RexaKrYZkYzaPyXFt+3YXqZ9MJmxC+lHPJ+CsI2u0ToOsR8yEaxPxRRQxb30iTHMfL
         Ft5TuuHE4/EalmQqWPZEeT3CHrwhViv8+ibkHd8LC6SnlJbp8xGVB3rx2IDpSZApKnr0
         q/iOTgj1dbkxZfhk6AznYehKWNvwjeB+6HUrZPzDYWpCFDA5rrDm2gSwxgLGiCbudvo1
         e9bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794461998; x=1795066798;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UTurnFPFeSTNzOL1j7FGTs7ghAwGXevqTOEMLjH5zYs=;
        b=G1csegfupZ55o3ULHtctDSgsyOY4aS0zeLyIaaI4Gu1RSsBCtFuL43hg4Wy46uLn/H
         dkaxq6dbgslojynQJRsB/dAHcmqwQe+CWdqvH9FgOqVu/e4QuzQjzbXkSKNG31kIWeMv
         BBnvg3/D0lwQ+T9UrXiAmZ5HpzxAkd/775tMiU2yw0r1Ut8vXqpujYGxPVAR/lKgh4Gx
         hWQUVUj5F5WwVBWMWx8/DJpMHGWhz6NGiFMSyqO2UyF3/odJYPcYB7rj79ElfTNGnaWA
         tESF3UREi2e6PsQtcm0rjVYauq42Kb0VNBCoBMK8kOsogJG0LKEPUpvbC1V/NE7aOPuB
         0qQA==
X-Gm-Message-State: APuU4Z/vXXUkEfIzgpS/VMLeC1nK06HFC9LHOwHzmXjqMnzg+dTVM30L
	Wdn2D3UbCxWciVyGpz6LJCvaoBtvlyg/47qgZrbBaKA/jexlbR9QpM1PZhLvIQ==
X-Gm-Gg: AYBFou2dRqyDz2iXFG9ycZrAIfo9f+lvGZHhhiz+y1/r44j7iL0Rm+RLXd18EAxtpb+
	Ye4P1AI1EEQXTmG7TrMVGLguK5AIcDX62xdmA2Ad0mORaCaDsoBs4prUOX866Nn1V+zovaFxqE5
	5jyQJDBCdygc8UUKn2lbwIud3SgmXE0ODf8i+dmDHQWt1O/AElguybEx8buwH/6sYDhPu5RjK5t
	qxOlwmTp0AspmigBf/R2h5knBaw8ZKcuZLZgjXoc3Rr+9seVgVeEBfDgdlMUjGvGp+t2Nw4ESLn
	x5H0stFI7pGZBYQRclrscFn+MKfMnCzVVeFAQ1vcHjtOVVMiQMRUJO3Okr8M2GdHLNjRFnFSZjx
	a1OWlE0mitt68dOxKeJ+r7Fci7XBeUxHBBPFuLzA4F5mC78B2SX/aChbZVQPyzhrM4f+LWiuPF+
	5Qe/s0UFxSICBiqmPpK7FGzlGM4LLm7asg/FI8k112BSQ9UnAawuNCdMPhp1VJBl+dkNggoJnbd
	NzuwlByqawfjw9FIt3ovhtn2337eCTxw/16r0mjTsBIAeDe4jikjn2+g9R8KFoXvRGhhsDJwwH5
	OSn3RNd22HKoWBlh26vayUmC2fBz+zKaG9Bq6edm2avQhNHfVT0ckSWjO3ITvvBvGxpMxPISC0p
	bAi4UJzoL6e0BU+Mc1j3lGSGJsNmW0O4PpvmktuT93PMkypsgcgOAH0xUzxCQ8JmFUaVcnAl0sF
	hNJVtSEaTNnQ==
X-Received: by 2002:a17:90b:4a88:b0:3ac:9d14:feb1 with SMTP id 98e67ed59e1d1-3b182fe6d1dmr4248352a91.43.1794461997638;
        Wed, 11 Nov 2026 21:39:57 -0800 (PST)
From: Mahmoud Abumandour <ma.mandourr@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Teddy Astie <teddy.astie@vates.tech>,
	Mahmoud Abumandour <ma.mandourr@gmail.com>
Subject: [PATCH] x86/nestedhvm: load host state at virtual VM exit as the SDM does
Date: Wed, 11 Nov 2026 21:39:56 -0800
Message-Id: <20261112053956.1070108-1-ma.mandourr@gmail.com>
X-Mailer: git-send-email 2.25.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-720697/1794461999-30FCE2AC-17516D8B/0/0
X-purgate-type: clean
X-purgate-size: 2408
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

load_vvmcs_host_state() leaves the GDTR and IDTR limits at L1's earlier
values instead of 0xffff, and zeroes the VM-entry interruption-information
field, of which a VM exit clears only the valid bit. It also never brings
L1's EFER up to date. With "load IA32_EFER" L1 keeps L2's EFER.SCE and
EFER.NXE instead of HOST_EFER's, and without it L1 gets its own earlier
EFER back instead of keeping L2's.

Fixes: 9390642b7fa5 ("Nested VMX: Switch shadow/virtual VMCS between n1/n2 guests.")
Signed-off-by: Mahmoud Abumandour <ma.mandourr@gmail.com>
---
 xen/arch/x86/hvm/vmx/vvmx.c | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/hvm/vmx/vvmx.c b/xen/arch/x86/hvm/vmx/vvmx.c
index 29e48387a1..fc2cf08fef 100644
--- a/xen/arch/x86/hvm/vmx/vvmx.c
+++ b/xen/arch/x86/hvm/vmx/vvmx.c
@@ -1317,9 +1317,24 @@ static void load_vvmcs_host_state(struct vcpu *v)
     if ( rc == X86EMUL_EXCEPTION )
         hvm_inject_hw_exception(X86_EXC_GP, 0);
 
+    /* SDM 28.5.2 (Loading Host Segment and Descriptor-Table Registers). */
+    __vmwrite(GUEST_GDTR_LIMIT, 0xffff);
+    __vmwrite(GUEST_IDTR_LIMIT, 0xffff);
+
     control = get_vvmcs(v, VM_EXIT_CONTROLS);
     if ( control & VM_EXIT_LOAD_HOST_PAT )
         hvm_set_guest_pat(v, get_vvmcs(v, HOST_PAT));
+
+    /*
+     * LMA and LME follow "host address-space size" (virtual_vmexit()); the
+     * other bits are HOST_EFER's with "load IA32_EFER", and L2's without.
+     */
+    if ( control & VM_EXIT_LOAD_HOST_EFER )
+        v->arch.hvm.guest_efer =
+            (get_vvmcs(v, HOST_EFER) & ~(EFER_LMA | EFER_LME)) |
+            (v->arch.hvm.guest_efer & (EFER_LMA | EFER_LME));
+    hvm_update_guest_efer(v);
+
     if ( control & VM_EXIT_LOAD_PERF_GLOBAL_CTRL )
     {
         rc = hvm_msr_write_intercept(MSR_CORE_PERF_GLOBAL_CTRL,
@@ -1330,7 +1345,9 @@ static void load_vvmcs_host_state(struct vcpu *v)
 
     hvm_set_tsc_offset(v, v->arch.hvm.cache_tsc_offset);
 
-    set_vvmcs(v, VM_ENTRY_INTR_INFO, 0);
+    /* A VM exit clears only the valid bit of this entry control. */
+    set_vvmcs(v, VM_ENTRY_INTR_INFO,
+              get_vvmcs(v, VM_ENTRY_INTR_INFO) & ~INTR_INFO_VALID_MASK);
 
     if ( v->arch.hvm.vmx.exec_control & CPU_BASED_ACTIVATE_MSR_BITMAP )
         __vmwrite(MSR_BITMAP, virt_to_maddr(v->arch.hvm.vmx.msr_bitmap));
-- 
2.25.1


