Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FEE5606A32D
	for <xen-devel@archiver.kernel.org>; Fri, 13 Nov 2026 15:49:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XWjznyZ/
Received: from list by lists.xenproject.org with outflank-mailman.1487731.1690059 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRtWr-0003fw-BE; Fri, 13 Nov 2026 15:49:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1487731.1690059; Fri, 13 Nov 2026 15:49:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRtWq-0003ca-GX; Fri, 13 Nov 2026 15:49:28 +0000
Received: by outflank-mailman (input) for mailman id 1487731;
 Fri, 13 Nov 2026 15:49:26 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xRtWn-0003Bg-UK
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2026 15:49:26 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xRtWn-004T1N-AI
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2026 16:49:25 +0100
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6af73177-2eae-0a2a0a5409dd-0a2a4505c60e-32
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 16:49:25 +0100
Received: from [209.85.128.49] (helo=mail-wm1-f49.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6af73185-4cb1-0a2a45050019-d1558031b91a-3
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 16:49:25 +0100
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-4a208d93758so17595245e9.3
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 07:49:25 -0800 (PST)
Received: from fedora (user-109-243-65-71.play-internet.pl. [109.243.65.71])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-49c5f1c0e0dsm5786493f8f.15.2026.11.13.07.49.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Nov 2026 07:49:24 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20260707 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794584965; x=1795189765; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+BeDvZCizvnIb2SxmU/wvnLMgBhRBWgRE1O1l+oMlto=;
        b=XWjznyZ//JNrAF/RScPlJWKhBo8/wUE7fsJccPQ7gNNalzSiyLolihZ/YMroO8jn5B
         pTDVZtJyHMMmkq85yKdy4DHsOjoZ8Ox/A1PsqO11n9kPriysRolCyp+8tdgBIL2l8YIo
         Ez9VoM6DtVs4egnVSa1ZRf1okuQ1uKdAP5qhkH3QznAH6Vp7/L7I8UjaX0jrm7T3W5lT
         NAwRIyklLEdAE+td/tRAuR8W4xJSuvC5xKayJGdZ/5Nx+jG9+aPGuk/peIQS0KuQ85E8
         ID7mdEO5f9tg4zg7/v0gYns9f4zPP3wqWcVnp4LFHZ2roOAEUgyQbIHUnshmTr2+24JB
         U55g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794584965; x=1795189765;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+BeDvZCizvnIb2SxmU/wvnLMgBhRBWgRE1O1l+oMlto=;
        b=Vx9+ph8E6i+V+fB7R0L4uGXXgy0BtZ0QXPcW9mpRKoHtRFZ6UeVVIu9PkX+TMjubq7
         Ic2e8MsmsAi4rGAZJq2JHj+BZhj6Zct6SOpkPq4Ej8AeW/zl4gFXXlUpK0RIcboUai9f
         5Tm8ucWXOrSAQjN0TraJUkZTkxLpZ1gsnFt9IP+UxEXM4bWw/vlkPhmZ6M9LIxWsr5eT
         j7LLP65vX+OnvbIncdhavmVYDm7+eH+gUNbDizVmknJp6YTkyyxxs8T5LroweN3F4QnG
         ouKS/qO0QVCFTQJlIX9oXepv3EGNkK9k6W3zwI4RPQ85ZPAvN0JwK0q5cJoy84RkjcJC
         OP7g==
X-Gm-Message-State: APuU4Z84D6f7X+wuY0NY4hMvfRyz/ceQKe+u3Nlhevc3wnIVrOokVYK0
	3XafZ59xI+xwXlq4e+UH+HseUk21sssbRewuy/xGhRGvqwDhYN8M5n92x9q/cA==
X-Gm-Gg: AYBFou1qBUdinXsUdl5PLVqn4fd8UJ8N9qKSHQJVbKNTgcm61cy57wCfNNqD/JBYZCS
	f1lstRzYRNff0V1y6653Q5j6afYbk+KbLuxc53gBqho/P+DW4eZaN7GEumJDIYP1J1TyEPKQI4x
	Z77dj4mbz5SnqsfHT4vkxr5GL8YJdoh/E3C9phUH/stp5iz9qd4yO3xROW3TcuNJVRCEZpETYzL
	V/AmrGAYxe/RWspH+hYP1p+6n2y/1Cn5eECY3u0d+v6cWFfVv/i1bLQ6Kmjptn0oX2vaPPNTHeU
	aoK1zOGueJI7HMiLEYedgVEvD+nNzIo9Odqg0h50SpXrm1DggWlIG8KL1fj3EF/ucdFsM9pe+gm
	WNzwZT71yf0oi0SBiVJMRS+OFb2fdEbeB4RgPE93vzUxM4qh11JRkbNMjUe5dZPFZix2rFfXUVX
	IllhcphcKQ1c43XNN70fGDKX6A4GF3quRxNslTSSXptlxZ0ApE22JjFOUyXCAoSyLoMehITOc1j
	DgHy8DTJc+0geDt26Sz1Y+VtAM/NZr0XoEv+DlMuYrVyyI/zlbZbATqWEyDMlb52EN5IKdgJ/Ge
	4Sr0WudUwhY8eNd1SzSQV51JtqVum/jOK1qvy04y6sS/SPDndF0uPcM5UfAiaLcb+Gir
X-Received: by 2002:a05:600c:621b:b0:4bb:5f95:c014 with SMTP id 5b1f17b1804b1-4bb5f95c108mr5033015e9.19.1794584964580;
        Fri, 13 Nov 2026 07:49:24 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Baptiste Le Duc <baptiste.le-duc@vates.tech>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v4 16/42] xen/riscv: implement trap redirection to a guest
Date: Fri, 13 Nov 2026 16:48:37 +0100
Message-ID: <b573c78f3f216519fa028df21531e39279eb8e10.1794562488.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <cover.1794562488.git.oleksii.kurochko@gmail.com>
References: <cover.1794562488.git.oleksii.kurochko@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c201ff/1794584965-F5CA82A1-879A29BB/10/73395122804
X-purgate-type: spam
X-purgate-size: 5496
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Two kinds of traps can't or shouldn't be handled by the hypervisor and
have to be reflected to the guest's own S-mode trap handler instead:
- Traps Xen takes on the guest's behalf, such as those taken by the
  hlv/hlvx sequences Xen uses to access guest memory.
- Access faults handle_guest_page_fault() injects for a guest-page
  fault that can never become an emulated access.

Implement trap_redirect(), until now a BUG_ON() placeholder, for that
purpose. It makes the trap appear to the guest as if it had been taken
directly in VS-mode: the trap information is transferred to the guest's
virtual supervisor CSRs and the vCPU is resumed at its exception vector in
supervisor mode, following the trap entry rules of the RISC-V privileged
specification.

The implementation is based on kvm_riscv_vcpu_trap_redirect() from Linux,
with a few deviations:
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

STVEC_MODE_DIRECT and STVEC_MODE_VECTORED are unused for now and are
added only for completeness alongside STVEC_MODE_MASK.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Reviewed-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>
---
Changes in v4:
 - Add extra tab to definition of STVEC_MODE_MASK.
 - Add Reviewed-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>.
---
Changes in v3:
 - Update the commit message.
 - Drop STVEC_BASE_MASK for now and use ~STVEC_MODE_MASK instead.
---
Changes in v2:
 - Add new defines STVEC_*. The STVEC_MODE_DIRECT/_VECTORED values are
   currently unused and were included because riscv encoding header is a
   spec mirror full of unused encodings.
 - Use STVEC_BASE_MASK instead of open-coding it.
 - Rename riscv_vcpu_trap_redirect() to trap_redirect(): unlike its KVM
   counterpart the function takes no vCPU argument, it implicitly operates
   on current, so "vcpu" in the name describes nothing.
---
 xen/arch/riscv/include/asm/riscv_encoding.h |  5 +++
 xen/arch/riscv/traps.c                      | 50 ++++++++++++++++++++-
 2 files changed, 54 insertions(+), 1 deletion(-)

diff --git a/xen/arch/riscv/include/asm/riscv_encoding.h b/xen/arch/riscv/include/asm/riscv_encoding.h
index 887edce6b604..fa26f5a2eb86 100644
--- a/xen/arch/riscv/include/asm/riscv_encoding.h
+++ b/xen/arch/riscv/include/asm/riscv_encoding.h
@@ -107,6 +107,11 @@
 #define SIP_SSIP			MIP_SSIP
 #define SIP_STIP			MIP_STIP
 
+/* stvec/vstvec: MODE is bits [1:0], BASE is bits [XLEN-1:2] */
+#define STVEC_MODE_MASK			_UL(0x3)
+#define STVEC_MODE_DIRECT		_UL(0x0)
+#define STVEC_MODE_VECTORED		_UL(0x1)
+
 #define PRV_U				_UL(0)
 #define PRV_S				_UL(1)
 #define PRV_M				_UL(3)
diff --git a/xen/arch/riscv/traps.c b/xen/arch/riscv/traps.c
index db8873d1e43f..3672774271ff 100644
--- a/xen/arch/riscv/traps.c
+++ b/xen/arch/riscv/traps.c
@@ -310,5 +310,53 @@ enum mc_disposition arch_do_multicall_call(struct mc_state *state)
 
 void trap_redirect(const struct trap_info *trap)
 {
-    BUG_ON("unimplemented");
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
+     * vstvec's MODE field is not part of the address. Exceptions always
+     * target BASE regardless of MODE, so mask it off explicitly instead of
+     * relying on the hardwired zero bit of sepc to drop it.
+     */
+    regs->sepc = csr_read(CSR_VSTVEC) & ~STVEC_MODE_MASK;
+
+    /* Set Guest privilege mode to supervisor */
+    regs->sstatus |= SSTATUS_SPP;
 }
-- 
2.56.1


