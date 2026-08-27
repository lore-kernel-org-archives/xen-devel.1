Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DAF1C61DC6
	for <xen-devel@archiver.kernel.org>; Thu, 27 Aug 2026 15:22:25 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1400957.1636703 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzbvi-0003Bk-D2; Thu, 27 Aug 2026 15:22:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1400957.1636703; Thu, 27 Aug 2026 15:22:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzbvh-0003Ag-VB; Thu, 27 Aug 2026 15:22:13 +0000
Received: by outflank-mailman (input) for mailman id 1400957;
 Thu, 27 Aug 2026 15:22:12 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wzbvg-0002lu-4b
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2026 15:22:12 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wzbvf-009kzH-HN
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2026 17:22:11 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a90561e-2eae-0a2a0a5409dd-0a2a4502cbb6-14
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 17:22:11 +0200
Received: from [209.85.221.48] (helo=mail-wr1-f48.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a905623-6ca4-0a2a45020019-d155dd30cc50-3
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 17:22:11 +0200
Received: by mail-wr1-f48.google.com with SMTP id
 ffacd0b85a97d-47f633e6058so1725209f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 08:22:11 -0700 (PDT)
Received: from fedora (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49b4b2d6b30sm57441155e9.14.2026.08.27.08.22.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Aug 2026 08:22:10 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1787844131; x=1788448931; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hXEgdEjyT/o0vCdnbINLyc8KPk5JZJDfyvEdU7D5Poc=;
        b=BxEoe+UMB0VfJSkdycFds8Wq3UrmN4n63H7Tw+6S6yzRnLnf2QzGBjnJfp1PSNw8DI
         1eiMNg4zlE63UI8C+nuXTNQXdoSJTyINPJ5ShGqbENnozrMHycRwgj59EX9mjXh+YBr9
         8dLrNoBsqy9RbXtteoimzhWSsZRhbusLwQc6HOY8kWxXmc5aZDTPBs+I+gEs6kYING/x
         5/jbSwvdgQaYTOdME4r8vvYJHb3HuuNMbYXuI2NOt/G3hou8/F8RudLxEAHot46oBiAz
         OeKJrbbAyUnY24EGndtfSVFciMfrDKZ88n/XXnQ+NkWeK2wHFpFoGRMbOKMRa3RcZeaM
         1qCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787844131; x=1788448931;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hXEgdEjyT/o0vCdnbINLyc8KPk5JZJDfyvEdU7D5Poc=;
        b=d5owGGnuIlxYEjAjUw24ZK6Q/WNA9ecdaetIyEhNCBEN4iRcU+EClCxRdAD5smWxyH
         Wjp8nKRGJ6OvDIBY0lnNb7FhKBWIxAjXOUKMX/7cyACtKi8F9hn6/AAVZp1W/nxgG8sG
         6AjdByWvpU2ZkOMmdKIb2vPhtagenoS7dGXNN/vavWjm64J9PJ9UWiCChSduOZREah1W
         xXIOq5yss7zTgubTLjwhLagsarym2MagF6sfePknoF9MJw23UjwkO7ciVvs7xV4BhQyp
         knKuWHSwD6QHAYdvfGSZoTXwFd5fuQk6GnyY++4ZXLsFO8wY17HEAuCypYWUnEDoigMh
         UtDQ==
X-Gm-Message-State: AFuF++lEU1zZ+32Qno9q+sy3OKY3NIoXsgtGVumS0fkM7r3FJVgLhTzM
	k2anMxsxP2bjUxYiIZsBGRZ79ijDfLZ7C4MnMYbSbVVd0epRuXobTkkZDBHJUQ==
X-Gm-Gg: AR+sD13Up3sTGJ5BCBbeKOrdNamreOlK6Km8mdcz/RDB7YW1ISwqvtAbVPTZ9nB3UIZ
	XD5WRfiJpM1M/fNyjTlNNk6J1NJV4LwiYnWjz0ldZ3nJJgds3/TlWpHhjoDpksfv0CIUTgH2Jq7
	3rpEPA/IdDfJctGXpMaYnnABRM30An59HWdbMij8E4o7J42YyTGbVCwTFwvfH/5QQ088Qs+urGb
	NH6Lv8Pb+g4sZreFzRk3bQwUOVDR2ar8sBqr6Si6yXz9pGJi/kANJdMV+YxiMPmoqGlGWQqhX3Z
	BfLnMuOfMCTZe071sEuHPV2oTZdqHeWUziNuowNQW/ArgRKnX0j5ILejQ7jxDAlBOgxWEeN2HLV
	vLw2nA5C1yUsiLRQqCqpNhrwsG3MY3OdVqZTo90eKmpxr62n6l2DwKOvailIMWRm2YF6kaM6krN
	DngNvoicRW20W2neuO0fQ+8IXRyp9pGdaV4yF9zui/Ih5rGck+evYMAgAr8kk4D1+fOEar/7FSH
	wvtL26qiSNCm6XkCdD/EQ6eBi/NUoLbhw==
X-Received: by 2002:a05:600c:3b8b:b0:499:7a19:408b with SMTP id 5b1f17b1804b1-499dc722993mr205648655e9.11.1787844130383;
        Thu, 27 Aug 2026 08:22:10 -0700 (PDT)
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
Subject: [PATCH v2 19/39] xen/riscv: implement trap redirection to a guest
Date: Thu, 27 Aug 2026 17:21:03 +0200
Message-ID: <583b0a190bad7121eae9bc99bd1e13dc1743efe4.1787838835.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1787838835.git.oleksii.kurochko@gmail.com>
References: <cover.1787838835.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-720697/1787844131-309C32AC-D8EDFA32/10/73395122804
X-purgate-type: spam
X-purgate-size: 5239

Some traps taken by Xen on behalf of a guest can't or shouldn't be handled
by the hypervisor and have to be reflected to the guest's own S-mode trap
handler instead: the access faults which handle_guest_page_fault() injects
for a fault that can never become an emulated access, and, later on, a
fault taken by the hlv/hlvx sequences of riscv_read_guest() while
accessing guest memory on a vCPU's behalf.

Implement trap_redirect(), until now a BUG_ON() placeholder, for that
purpose. It makes the trap appear to the guest as if it had been taken
directly in VS-mode: the trap information is transferred to the guest's
virtual supervisor CSRs and the vCPU is resumed at its exception vector in
supervisor mode, following the trap entry rules of the RISC-V privileged
specification.

Add the STVEC_* definitions needed to tell the BASE and MODE fields of
vstvec apart.

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

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
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
 xen/arch/riscv/include/asm/riscv_encoding.h |  6 +++
 xen/arch/riscv/traps.c                      | 50 ++++++++++++++++++++-
 2 files changed, 55 insertions(+), 1 deletion(-)

diff --git a/xen/arch/riscv/include/asm/riscv_encoding.h b/xen/arch/riscv/include/asm/riscv_encoding.h
index 2d2e7e11b3ef..b2071f47587c 100644
--- a/xen/arch/riscv/include/asm/riscv_encoding.h
+++ b/xen/arch/riscv/include/asm/riscv_encoding.h
@@ -109,6 +109,12 @@
 #define SIP_SSIP			MIP_SSIP
 #define SIP_STIP			MIP_STIP
 
+/* stvec/vstvec: MODE is bits [1:0], BASE is bits [XLEN-1:2] */
+#define STVEC_MODE_MASK			_UL(0x3)
+#define STVEC_MODE_DIRECT		_UL(0x0)
+#define STVEC_MODE_VECTORED		_UL(0x1)
+#define STVEC_BASE_MASK			(~STVEC_MODE_MASK)
+
 #define PRV_U				_UL(0)
 #define PRV_S				_UL(1)
 #define PRV_M				_UL(3)
diff --git a/xen/arch/riscv/traps.c b/xen/arch/riscv/traps.c
index 9cd37d943be1..8372f34497ad 100644
--- a/xen/arch/riscv/traps.c
+++ b/xen/arch/riscv/traps.c
@@ -294,5 +294,53 @@ enum mc_disposition arch_do_multicall_call(struct mc_state *state)
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
+    regs->sepc = csr_read(CSR_VSTVEC) & STVEC_BASE_MASK;
+
+    /* Set Guest privilege mode to supervisor */
+    regs->sstatus |= SSTATUS_SPP;
 }
-- 
2.55.0


