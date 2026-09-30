Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 119DBCA5FC7
	for <xen-devel@archiver.kernel.org>; Wed, 30 Sep 2026 16:24:37 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1437553.1656542 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBx6U-0004wb-Pw; Wed, 30 Sep 2026 16:24:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1437553.1656542; Wed, 30 Sep 2026 16:24:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBx6U-0004ud-Ke; Wed, 30 Sep 2026 16:24:22 +0000
Received: by outflank-mailman (input) for mailman id 1437553;
 Wed, 30 Sep 2026 16:24:21 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xBx6T-0004aW-Iu
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2026 16:24:21 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xBx6S-00GhYY-Vg
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2026 18:24:20 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6abd37a9-bab6-0a2a0a5309dd-0a2a4509a632-12
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 18:24:20 +0200
Received: from [74.125.225.140] (helo=mail-wm2-f12.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6abd37b4-be1a-0a2a45090019-4a7de18cc578-3
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 18:24:20 +0200
Received: by mail-wm2-f12.google.com with SMTP id
 5b1f17b1804b1-49ccf3ca626so34552515e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 09:24:20 -0700 (PDT)
Received: from fedora (user-109-243-71-234.play-internet.pl. [109.243.71.234])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a01cd43e66sm14620485e9.2.2026.09.30.09.24.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Sep 2026 09:24:19 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1790785460; x=1791390260; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OYQQ7ScvSr55sK1nXTa6WzNLNd6SqlC9eeJ4PcwjlZo=;
        b=Uy0L+mEA4lfTMMG7o1T8t6XYnMYP9gCru5DNEDNpoy7v5cBow9UrTHVTZdW+ktITtV
         bYubq2SMJKX8LXPR4k9My7qlZ+Wtb/AtyyF99jDwCpa4JJo8VzoV1i5A11NXiY10zgWd
         Ml4QaQIERG1c6ehSSJkJHpSODXf1R4jeBRbbwaQuReCyWHBaUtiP8wsrTraDIrLhgKal
         n1ZCGkKB0uk1BhpXhd8ak+rJh7o4mzIM1AIM1i7o8FPKRlWKuo+DYHvE/+xaMqpJlIv1
         Xal2cxS+mD4JGv/8GRox/aW/LVz5mq1YyvhWuxDsM9CUVZ1N4jjmQp9fcf7QDw+0omeb
         yyFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790785460; x=1791390260;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OYQQ7ScvSr55sK1nXTa6WzNLNd6SqlC9eeJ4PcwjlZo=;
        b=q3DLQ47c1FXx8vMofN45NWPdbX0xxE/G+33LqYu5V9MKxU8lFsoWU59RKAUg6G5sPp
         0i1pUn51iLzW8QKWPLvW9bnFLqhB8fX/yFCSzHe1js0VgXHTKHwY6qmVlMCzvLumEvE8
         o8VqBjN8p7b0tryDcCf9QOLtEpasG1afE1tSoEqhfTF+N+kycoOMwxBYCLu0VNwnvtB7
         uYUah+4MfRztoaqg3PDe/LBzajC8d9QADW/yQQrIJc6ktsh3yGAISo6FqSFO8kZeSzFL
         F4Ke/Uqij2Ufpgj7Myh5hqkwWgMRZUVZk1e/Use5Q0rms7U9A+Ck6cI0W4CgmeEVUVgq
         Me9A==
X-Gm-Message-State: AFuF++lHVbSWLtuvcKgHu9UQzUYR/BvT5nnCJx75uOsVD9/9b+lTQxhh
	5LWcR/WeTcD0cd6jz4x+VrzDXsU7l/bgfwscX0thkh3NjKQfo4IV5tV9gFZ4AA==
X-Gm-Gg: AYBFou25qv+uqX701I51VQsuJwkwJypCJSUk+HgNXr/1V40T5BoJY9Ty40hD1NMRgtB
	aiYNiBKnZnMkKOc7QO7SRNd65ttS6jon/4GDbLDWCup4Jzwy5UbfVUNmuaeTPwSxz+icSOxDEZY
	xK1m9y1PNa2Qd/QH95PK7yQ2Bm6RV6JSsjYUwWj7sFl1CeJU/8AePcRyZQKW9g56N+Jbrcs+dBU
	+X6tPwzF4QG+T6DQnd6ehE3+CQ0qnQxPkYxDGtfa1xegvz0a7V/mInJf0lVWMr/UFLKunBYXYSl
	ljvS3ScyZRrjz6hPb736ZzmGgCMpSQnLRrsszGFlz42X7vh3Av4Wc7SABxIBIzHKigw9sXpe39C
	Tot8bWl8bRN+asIRZnZE36fUwBirPxg47dWXi+z8MNz9JikNkXUpydkdofrdaSfjB7aCuj5SYFA
	g4y1v9jy9cfQZaEN6IfUspCMtsZuBju/PWAA+W0vvPBzwWwvSv6bbm1CxOntpHiIyhT2Q2bd1K+
	Q3Q7dSr/stnAnHK+/UqP0Ia7YqBsN2+7YAuhxzAtQ==
X-Received: by 2002:a05:600c:4514:b0:49f:ffed:2cb with SMTP id 5b1f17b1804b1-4a01aff3298mr35624915e9.6.1790785460170;
        Wed, 30 Sep 2026 09:24:20 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
	Baptiste Le Duc <baptiste.le-duc@vates.tech>,
	Zheng Zhang <zhangzheng@iscas.ac.cn>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v3 18/39] xen/riscv: implement trap redirection to a guest
Date: Wed, 30 Sep 2026 18:23:37 +0200
Message-ID: <109f3a920a2f5e58de5889ac2bcb834cc7ce967a.1790779209.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1790779209.git.oleksii.kurochko@gmail.com>
References: <cover.1790779209.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-bad1c0/1790785460-BD0CD034-B656A627/10/73395122804
X-purgate-type: spam
X-purgate-size: 5325

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
index 2dbfd4d16067..b01da95f7ece 100644
--- a/xen/arch/riscv/include/asm/riscv_encoding.h
+++ b/xen/arch/riscv/include/asm/riscv_encoding.h
@@ -107,6 +107,11 @@
 #define SIP_SSIP			MIP_SSIP
 #define SIP_STIP			MIP_STIP
 
+/* stvec/vstvec: MODE is bits [1:0], BASE is bits [XLEN-1:2] */
+#define STVEC_MODE_MASK		_UL(0x3)
+#define STVEC_MODE_DIRECT		_UL(0x0)
+#define STVEC_MODE_VECTORED		_UL(0x1)
+
 #define PRV_U				_UL(0)
 #define PRV_S				_UL(1)
 #define PRV_M				_UL(3)
diff --git a/xen/arch/riscv/traps.c b/xen/arch/riscv/traps.c
index 4b9ec246e4c9..08aae2e5280b 100644
--- a/xen/arch/riscv/traps.c
+++ b/xen/arch/riscv/traps.c
@@ -293,5 +293,53 @@ enum mc_disposition arch_do_multicall_call(struct mc_state *state)
 /* Redirect trap to Guest. */
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
2.55.0


