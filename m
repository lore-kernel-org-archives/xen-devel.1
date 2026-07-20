Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E45A6C44520
	for <xen-devel@archiver.kernel.org>; Mon, 20 Jul 2026 16:03:16 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1367174.1617074 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wlqSF-0003Hh-GL; Mon, 20 Jul 2026 16:02:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1367174.1617074; Mon, 20 Jul 2026 16:02:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wlqSF-0003Fr-4b; Mon, 20 Jul 2026 16:02:55 +0000
Received: by outflank-mailman (input) for mailman id 1367174;
 Mon, 20 Jul 2026 16:02:53 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wlqSD-0002sb-Ap
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2026 16:02:53 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wlqSC-00HTbS-Nt
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2026 18:02:52 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a5e46a9-bab6-0a2a0a5309dd-0a2a4505a2b6-14
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 18:02:52 +0200
Received: from [209.85.128.47] (helo=mail-wm1-f47.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a5e46ac-4cb1-0a2a45050019-d155802fa44c-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 18:02:52 +0200
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-493f6de72faso27885415e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 09:02:52 -0700 (PDT)
Received: from fedora (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49563eee22esm31331765e9.1.2026.07.20.09.02.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jul 2026 09:02:50 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784563372; x=1785168172; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=opjQ/V98n1m+LO4UkRjC+2s0sDwL1tKpI+4Ef5yOWXM=;
        b=IbovyweIPOsFvVVuVwmBMJyhoX7KA+qKg19TjQOgh3I2isljsn4VrDzJmZXR+QjhWL
         IGqOACqQ7ANQcw8G40tJk5stU6mJM63zCS9bAAvOwYtkcScTzu+SxKqJySnhsPyRrfpE
         PUXWzou/AhJwKy8N3rbLGLsS3aVuCRW0ovgui0HOoGpS1hIc5pE4XQneenJvMDYEYksg
         bcafDxUG+o18KAzs+xCKGTtbinlxTPYazhbv8mhl0Eq9g2NIHLJp+NRbMVsLObGyX3yC
         O+kotpyLE3UP04NFS68UDpuDqACbkN1exMp2jwDYmlladu4yebmbABusuOz6XnLKwTmY
         yNrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784563372; x=1785168172;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=opjQ/V98n1m+LO4UkRjC+2s0sDwL1tKpI+4Ef5yOWXM=;
        b=lcQkLPr8OMbdEqg5I5lGTKYMOcaJ5zFhs54cLREKU4J9wwCPD1kfSlL9DDXSRCXGN4
         UrwAlYewJvfr+hYLILEWpilel+gl/BNX8sGZ2f3wQi9/MmjKuJaEWjS/zje79sagQ2vG
         LgRpWGqjYzw0gX8unflEDt/uFgvKV0DzV+r8rrM6AhsNKz13kizZHfivTlHJ6W6JJtZ7
         bBLvfOAAhzS/fP3sXgvvnb5UGYe++65VnJhmUoolbs74/484QmjhwN1/ZQBbf3AcQSAP
         zabVNWxZn0eYTyaj/PyWLeuIixu7VqMDnJ/rMMSs7+sU5w8cHMKN+DizFxpsGnvys5FT
         JowA==
X-Gm-Message-State: AOJu0Yx+lnv4cZQdMjkw2wcCLhflfuAqaifyA12W+KwgeLI7LdupLK98
	53gsOxqRzP37axhKAIcdnLN1irykTe4W6GIxbkQ/H1SJ3EA+nFDgh8x7TmIqEw==
X-Gm-Gg: AfdE7ck3iVtW/oRrdLsoZiAvvnd3L6DwIHgYIV1lnqMVCnKd6abCiEbCfEWQ0boKWEB
	NdT2prMdhUz8fWUVqkeyYuwec88nSrdx82RdoY1N7GOIeTHjAjvXGJp+eBLV/zvJHsAncyTxaId
	NdzBJrP4v+AJBwFzqcHYyoF6ZgSxlu6gkrAVh4vMGVMupaVxcSE1PP8ljdCIJL1a5rdNZKYRG9+
	yhgKFtR4ft8SsBGEdoxI3n6Nu+dSEh9u8ooHyyjAs46MG/Le/YvhpfTctqyw7vbxLe7lo/PoKFL
	vVVDI0A08xexorNb9KiHX5JRLI10Mo0erQIUFl8X3zNEVtC7qCCRwWfWkApAvDVzW1l/vuBiAH6
	iX43k0lmclf6QRLHP8TQBBpePPk1TiqyCRgNdwJ8c9opd7rgA7bY9biZN+aoSjR6zHMRcg+EVFY
	pWH7o62eViWfnEHM/478zDh/qNrETIdG/yS7v+lL7v6k0xbzeru2PvoHaEjA==
X-Received: by 2002:a05:600c:4e8b:b0:495:501a:fcf8 with SMTP id 5b1f17b1804b1-495501afdc8mr118793605e9.9.1784563371874;
        Mon, 20 Jul 2026 09:02:51 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
	Baptiste Le Duc <baptiste.le-duc@vates.tech>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v1 15/17] xen/riscv: implement trap redirection to a guest
Date: Mon, 20 Jul 2026 18:02:13 +0200
Message-ID: <8b14a7926e42c7e3308dc7f730334fed56210d81.1784560663.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1784560663.git.oleksii.kurochko@gmail.com>
References: <cover.1784560663.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c201ff/1784563372-738BE2A1-FD30314F/10/73395122804
X-purgate-type: spam
X-purgate-size: 4493

Some traps taken by Xen on behalf of a guest can't or shouldn't be
handled by the hypervisor and must be forwarded to the guest's own
S-mode exception handler instead: e.g. when riscv_vcpu_unpriv_read()
faults while accessing guest memory, or when emulation hits a condition
only the guest kernel can resolve.

Introduce riscv_vcpu_trap_redirect() for that purpose. It makes the
trap appear to the guest as if it had been taken directly in VS-mode:
the trap information is transferred to the guest's virtual supervisor
CSRs and the vCPU is resumed at its exception vector in supervisor
mode, following the trap entry rules of the RISC-V privileged
specification.

The implementation is based on kvm_riscv_vcpu_trap_redirect() from
Linux, with a few deviations:
 - The function reads and writes physical VS-mode CSRs, so it is only
   meaningful for the currently running vCPU. Instead of taking a
   struct vcpu argument, it always operates on current.
 - The MODE field of vstvec is masked off explicitly when computing the
   exception target PC (exceptions always vector to BASE), rather than
   relying on the hardwired zero bit of sepc to drop it on VM entry.
 - Assertions document the preconditions: the trap must have been taken
   from virtualized mode (hstatus.SPV set), and only synchronous
   exceptions may be redirected - interrupts must be injected via hvip
   instead, so that the hardware performs VS-mode trap entry itself,
   respecting vsstatus.SIE and vectored vstvec dispatch.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/arch/riscv/guestcopy.c                | 54 +++++++++++++++++++++++
 xen/arch/riscv/include/asm/guest_access.h |  2 +
 2 files changed, 56 insertions(+)

diff --git a/xen/arch/riscv/guestcopy.c b/xen/arch/riscv/guestcopy.c
index 57844bc442f6..6dc7a2e3a7ae 100644
--- a/xen/arch/riscv/guestcopy.c
+++ b/xen/arch/riscv/guestcopy.c
@@ -205,3 +205,57 @@ unsigned long riscv_vcpu_unpriv_read(bool read_insn,
 
     return val;
 }
+
+/* Redirect trap to Guest. */
+void riscv_vcpu_trap_redirect(const struct trap_info *trap)
+{
+    struct cpu_user_regs *regs = vcpu_guest_cpu_user_regs(current);
+    unsigned long vsstatus = csr_read(CSR_VSSTATUS);
+
+    /*
+     * Redirecting a trap makes sense only if the trap was taken from
+     * virtualized mode, i.e. sret is going to return to VS-mode.
+     */
+    ASSERT(regs->hstatus & HSTATUS_SPV);
+
+    /*
+     * Only synchronous exceptions can be redirected. Interrupts must be
+     * injected via hvip instead, so that the hardware itself performs
+     * VS-mode trap entry, respecting vsstatus.SIE and the vectored
+     * dispatch (BASE + 4 * cause) if vstvec is configured so.
+     */
+    ASSERT(!(trap->scause & CAUSE_IRQ_FLAG));
+
+    /* Change Guest SSTATUS.SPP bit */
+    vsstatus &= ~SSTATUS_SPP;
+    if ( regs->sstatus & SSTATUS_SPP )
+        vsstatus |= SSTATUS_SPP;
+
+    /* Change Guest SSTATUS.SPIE bit */
+    vsstatus &= ~SSTATUS_SPIE;
+    if ( vsstatus & SSTATUS_SIE )
+        vsstatus |= SSTATUS_SPIE;
+
+    /* Clear Guest SSTATUS.SIE bit */
+    vsstatus &= ~SSTATUS_SIE;
+
+    /* Update Guest SSTATUS */
+    csr_write(CSR_VSSTATUS, vsstatus);
+
+    /* Update Guest SCAUSE, STVAL, and SEPC */
+    csr_write(CSR_VSCAUSE, trap->scause);
+    csr_write(CSR_VSTVAL, trap->stval);
+    csr_write(CSR_VSEPC, trap->sepc);
+
+    /*
+     * Set Guest PC to Guest exception vector.
+     *
+     * vstvec[1:0] is the vector MODE, not part of the address. Exceptions
+     * always target BASE regardless of MODE, so mask it off explicitly
+     * instead of relying on the hardwired zero bit of sepc to drop it.
+     */
+    regs->sepc = csr_read(CSR_VSTVEC) & ~0x3UL;
+
+    /* Set Guest privilege mode to supervisor */
+    regs->sstatus |= SSTATUS_SPP;
+}
diff --git a/xen/arch/riscv/include/asm/guest_access.h b/xen/arch/riscv/include/asm/guest_access.h
index 153ec6ce26d1..d96cbc833d27 100644
--- a/xen/arch/riscv/include/asm/guest_access.h
+++ b/xen/arch/riscv/include/asm/guest_access.h
@@ -31,6 +31,8 @@ unsigned long riscv_vcpu_unpriv_read(bool read_insn,
                                      unsigned long guest_addr,
                                      struct trap_info *trap);
 
+void riscv_vcpu_trap_redirect(const struct trap_info *trap);
+
 #endif /* ASM__RISCV__GUEST_ACCESS_H */
 /*
  * Local variables:
-- 
2.54.0


