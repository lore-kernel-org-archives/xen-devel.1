Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A035CA5FC7
	for <xen-devel@archiver.kernel.org>; Wed, 30 Sep 2026 16:25:00 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1437581.1656654 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBx6r-0000qp-Po; Wed, 30 Sep 2026 16:24:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1437581.1656654; Wed, 30 Sep 2026 16:24:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBx6q-0000kn-Fl; Wed, 30 Sep 2026 16:24:44 +0000
Received: by outflank-mailman (input) for mailman id 1437581;
 Wed, 30 Sep 2026 16:24:39 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xBx6k-0007wE-NU
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2026 16:24:38 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xBx6k-00GhYY-3a
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2026 18:24:38 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6abd37a9-bab6-0a2a0a5309dd-0a2a4509a632-42
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 18:24:38 +0200
Received: from [74.125.225.140] (helo=mail-wm2-f12.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6abd37c5-be1a-0a2a45090019-4a7de18cdc36-3
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 18:24:38 +0200
Received: by mail-wm2-f12.google.com with SMTP id
 5b1f17b1804b1-49ce364488dso7625935e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 09:24:38 -0700 (PDT)
Received: from fedora (user-109-243-71-234.play-internet.pl. [109.243.71.234])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a01cd43e66sm14620485e9.2.2026.09.30.09.24.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Sep 2026 09:24:36 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1790785477; x=1791390277; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+8B775fti7/8ttx95ogjutn04uKNKtBQ3/cfwHm0TQU=;
        b=Ykk2y5T5sgwW4BrIbsp41Lp5cu3CNA1ZI1znxPziGTmFIEZDIETEv0NdfvdiVJ4NLg
         xQ/9yOss7vORewhmQFNlESJiWRTVBcbCVY7EcbJ4/UM8a5c7vNr/6TyboBBbrqL6fESG
         8zr1yypC6ldtH5UhULUlC/XEjyqQLdWTKaPcVAflnQwAQHX5FgQA3Ksq6X2ktJhYJBkd
         h9GwYbwQ8cVBD0j1GCEAC65lnbUvk06xKFvFlyrp1yd2UDIYAyLp61P02wl+8EaeWrkp
         6SsuQvmnvdNHKUc+gxfrdKr2pEupHIiJOckANR91h1XfOIalnqp1/nDxu4A5d9eqqqP5
         WHcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790785477; x=1791390277;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+8B775fti7/8ttx95ogjutn04uKNKtBQ3/cfwHm0TQU=;
        b=XPrqzO2VB0rfY5DY87KXkfBB6n/onBSq4TY8I2onO1GC+7hMtddEwiFWhXDY3PovTZ
         7btbth7SEin/WfvKdR40gbMNTluKHB5wl6JLIwluDjCBR6xg6MfQ38ZzNv7uZhd4TUuS
         GHpDZSUsDydWm+5aqxVWqCppfDy7qocUPDCiFqdOsgcx9P7eNK4a5tCk1eBkggTDrbjF
         eoh5Snqh0FJUBuVa8IG6JzhzBpY0r6A2i/QCW2BSN6yhilN6fxLWhGUexXzSP+2TZ/4P
         hqW5cGRDcMHfJiBI1+vp1B/tEb17/scaSSlsqlObHPRSoVrPBwwmKNcsm/yCiTyQsXum
         npuQ==
X-Gm-Message-State: AFuF++mq+CHo0xYFESIM3WvY42xOuMjmX3l2O8Bha4/s92344qF+KgYU
	OHs2o+Kr+flUZGyLrDgrim6kKetmImmONKgh2H5/9cPIZDVfP+DH5jO/TEqGXg==
X-Gm-Gg: AYBFou3t3romLe+Leg/m/7kSmHWk4FUNXYfldNlgvbiXnQ+ptju6uy1VZtYp8kbJeVK
	uAhmTPYJRaariJC2osDJYN/EVQEe/+rZObREKTMd7ZVadtnATSPSHGqnPEQNafI23Y/rI8fq6lw
	owjWq/l0GsVHpwBCRLJEwkoj83tA1qUzap85b1iwfny9QIuUIGTmtWakK4c2jEJFyqsyk8ogvwD
	c/39Yx/04GS4L6tfQ8T5cKIsV66Xbkm8gYJ1C9wDHKNpY5C3EbJ9/L+pkkQz61rtPDtD4ERHB4+
	q44G01JpxKvazDZijgWbc3UB5eD/cBitlNhVNJyRHFNWH/ypL2/D5+1sx+OkCEKDLjHVAABWeyf
	AEjrwDc+ivAvQ3O3YTHJKKj1Hetrlsyz2e7zit4ZFoNCtg3xL0rGFp3w7y+BYGq96JRIPOXMieY
	QFcwwssHjNtILtF+hjkUOTpvZuOn9DuMyqWy8ajswapNj8TcBtKPCd0cyWMZd300f3pTGKgxhNk
	RgWCQBkjTHaY4620703aDV9gHawBgCRPGnw3vuNVw==
X-Received: by 2002:a05:600c:83ca:b0:49e:6581:7baf with SMTP id 5b1f17b1804b1-4a01eaf59c6mr3169915e9.2.1790785476847;
        Wed, 30 Sep 2026 09:24:36 -0700 (PDT)
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
Subject: [PATCH v3 32/39] xen/riscv: save and clear the old IMSIC VS-file on vCPU migration
Date: Wed, 30 Sep 2026 18:23:51 +0200
Message-ID: <e2cf140c63b1f1cff8e63988f82fff7e2b063c84.1790779209.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1790779209.git.oleksii.kurochko@gmail.com>
References: <cover.1790779209.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-bad1c0/1790785478-BF8D1034-5439D328/10/73395122804
X-purgate-type: spam
X-purgate-size: 10576

When a vCPU migrates to another pCPU, its guest interrupt file has to
move as well: the eidelivery, eithreshold and eip/eie state of the old
IMSIC VS-file has to be carried over to the newly acquired one.

Once all interrupt producers have been retargeted to the new VS-file,
so that nothing can reach the old one anymore, read the state of the
old one and clear it at the same time. This has to be done on the pCPU
owning the old VS-file, as a guest interrupt file is only accessible
through vsiselect/vsireg with hstatus.VGEIN selecting it. After that
the old VS-file is no longer in use and its guest external interrupt
number can be released.

The state is saved into struct imsic_mrif. Its eix[] array follows the
layout of a memory-resident interrupt file (MRIF) as defined by the AIA
specification: pairs of 64-bit interrupt-pending and interrupt-enable
doublewords, each pair covering 64 interrupt identities. eithreshold
and eidelivery aren't part of an MRIF and are stored next to it as they
belong to the interrupt file state too. Using the MRIF layout allows
the same structure to hold the interrupt file of a vCPU which doesn't
own a guest interrupt file, which is how the AIA specification
describes MRIFs being used by a hypervisor.

Here the structure is only a temporary copy of a guest interrupt file:
it is filled and consumed by Xen alone and its address is never given
to an IOMMU, so no MSI is ever recorded into it. Hence plain
(non-atomic) accesses are sufficient and it can live on the stack.

The saved state still has to be restored into the new VS-file, so keep
the BUG_ON("unimplemented") placeholder at the end of
imsic_migrate_vcpu() to avoid silently losing the guest's interrupt
state.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in v3:
 - Reword the commit message: explain why the MRIF layout is used and
   why the copy isn't an MSI target, drop references to later patches.
 - Compare vsfile_cpu against CPU_NONE instead of NR_CPUS.
 - Introduce imsic_switchcase_ret() here, together with its first user,
   drop its unused variadic form and leave the trailing semicolon to
   its users.
 - Introduce the mrif member of struct imsic_vsfile_data here, together
   with its first user.
 - Initialise vsfile_data.mrif in imsic_migrate_vcpu() with a compound
   literal instead of adding a separate tmrif local variable, so the MRIF
   the old interrupt file is dumped into is visibly the one later
   restored from.
 - Drop the redundant parentheses around the arguments of
   imsic_vs_csr_swap() and its unnecessary local variable.
 - Use plain 64 instead of BITS_PER_TYPE(uint64_t) for the number of
   interrupt identities covered by an EIx group, and explain in the
   comment ahead of IMSIC_MAX_EIX where it comes from (the MRIF layout
   from the AIA spec).
 - Keep each EIx group of the MRIF as a uint64_t and introduce
   imsic_eix_swap64() to swap a whole group, which lets the
   #ifdef CONFIG_RISCV_32 in imsic_vsfile_local_read_clear() go.
 - Add missing break after ASSERT_UNREACHABLE() in the default case of
   imsic_eix_swap().
 - Use MASK_INSR() to set HSTATUS.VGEIN in
   imsic_vsfile_local_read_clear().
 - Explain in imsic_vsfile_local_read_clear() why hstatus and vsiselect
   are saved and restored.
 - Reword the comment on why no atomic accessors are needed to store
   the values into the MRIF.
 - Take the number of EIx groups from vsfile_data.nr_eix, as the
   nr_hw_eix local variable is gone from imsic_migrate_vcpu().
 - Move the vgein_release() stub to "xen/riscv: remap interrupts to new
   IMSIC VS-file", where it gains its first user.
---
Changes in v2:
 - New patch.
---
---
 xen/arch/riscv/imsic.c | 124 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 124 insertions(+)

diff --git a/xen/arch/riscv/imsic.c b/xen/arch/riscv/imsic.c
index 47854264edf3..2c4838b6b228 100644
--- a/xen/arch/riscv/imsic.c
+++ b/xen/arch/riscv/imsic.c
@@ -57,6 +57,28 @@ static unsigned int __ro_after_init guest_num_msis;
  */
 #define GUEST_IMSIC_MAX_MSIS 255U
 
+/*
+ * The interrupt identities an IMSIC interrupt file provides are 0 (which is
+ * never valid, but still occupies a bit) up to IMSIC_MAX_ID inclusive, so
+ * IMSIC_MAX_ID + 1 bits have to be covered.
+ *
+ * Each EIx group covers 64 identities, matching the memory-resident interrupt
+ * file (MRIF) layout from the AIA spec, where pending and enable bits are
+ * stored as pairs of 64-bit doublewords.
+ */
+#define IMSIC_MAX_EIX DIV_ROUND_UP(IMSIC_MAX_ID + 1, 64)
+
+struct imsic_mrif_eix {
+    uint64_t eip;
+    uint64_t eie;
+};
+
+struct imsic_mrif {
+    struct imsic_mrif_eix eix[IMSIC_MAX_EIX];
+    unsigned long eithreshold;
+    unsigned long eidelivery;
+};
+
 #define IMSIC_DISABLE_EIDELIVERY    0
 #define IMSIC_ENABLE_EIDELIVERY     1
 #define IMSIC_DISABLE_EITHRESHOLD   1
@@ -86,6 +108,12 @@ do {                            \
     csr_clear(CSR_SIREG, v);    \
 } while (0)
 
+#define imsic_vs_csr_swap(c, v)     \
+({                                  \
+    csr_write(CSR_VSISELECT, c);    \
+    csr_swap(CSR_VSIREG, v);        \
+})
+
 #define imsic_vs_csr_write(c, v)    \
 do {                                \
     csr_write(CSR_VSISELECT, c);    \
@@ -95,12 +123,17 @@ do {                                \
 /*
  * Leaf macros for the switchcase expansion pyramid below:
  * imsic_switchcase_break(ireg, op, v) - emit "case ireg: op(ireg, v); break"
+ * imsic_switchcase_ret(ireg, op, v) - emit "case ireg: return op(ireg, v)"
  */
 #define imsic_switchcase_break(ireg, op, v) \
     case ireg:                              \
         op(ireg, v);                        \
         break
 
+#define imsic_switchcase_ret(ireg, op, v)   \
+    case ireg:                              \
+        return op(ireg, v)
+
 /*
  * Generic switchcase expansion pyramid.
  * F is the per-operation leaf macro, ireg is the base register index.
@@ -126,6 +159,22 @@ do {                                \
     imsic_switchcase_32(F, (ireg) + 0, __VA_ARGS__); \
     imsic_switchcase_32(F, (ireg) + 32, __VA_ARGS__)
 
+static unsigned long imsic_eix_swap(unsigned int ireg, unsigned long val)
+{
+    switch ( ireg )
+    {
+    imsic_switchcase_64(imsic_switchcase_ret, IMSIC_EIP0,
+                        imsic_vs_csr_swap, val);
+    imsic_switchcase_64(imsic_switchcase_ret, IMSIC_EIE0,
+                        imsic_vs_csr_swap, val);
+    default:
+        ASSERT_UNREACHABLE();
+        break;
+    }
+
+    return 0;
+}
+
 static void imsic_eix_write(unsigned int ireg, unsigned long val)
 {
     switch ( ireg )
@@ -152,6 +201,17 @@ static void imsic_eix_write64(unsigned int ireg, uint64_t val)
         imsic_eix_write(ireg + 1, val >> 32);
 }
 
+/* Swap a whole 64-bit EIx group, laid out as described above. */
+static uint64_t imsic_eix_swap64(unsigned int ireg, uint64_t val)
+{
+    uint64_t old = imsic_eix_swap(ireg, val);
+
+    if ( IS_ENABLED(CONFIG_RISCV_32) )
+        old |= (uint64_t)imsic_eix_swap(ireg + 1, val >> 32) << 32;
+
+    return old;
+}
+
 unsigned int vcpu_guest_file_id(const struct vcpu *v)
 {
     return ACCESS_ONCE(v->arch.vimsic_state->guest_file_id);
@@ -514,6 +574,8 @@ struct imsic_vsfile_data {
     unsigned int hgei;
     /* Number of 64-bit EIx groups to cover, see imsic_cfg.nr_eix. */
     unsigned int nr_eix;
+    /* Where the interrupt file state is saved to or restored from. */
+    struct imsic_mrif *mrif;
 };
 
 /*
@@ -598,6 +660,60 @@ static void cf_check imsic_vsfile_local_clear(void *data)
     csr_write(CSR_VSISELECT, old_vsiselect);
 }
 
+static void cf_check imsic_vsfile_local_read_clear(void *data)
+{
+    unsigned int i;
+    const struct imsic_vsfile_data *idata = data;
+    struct imsic_mrif *mrif = idata->mrif;
+    unsigned long new_hstatus, old_hstatus, old_vsiselect;
+
+    /*
+     * The file is reached by retargeting hstatus.VGEIN, and
+     * imsic_vs_csr_swap() alters vsiselect. Both belong to the vCPU running
+     * on this pCPU, so restore them before returning.
+     */
+    old_vsiselect = csr_read(CSR_VSISELECT);
+    old_hstatus = csr_read(CSR_HSTATUS);
+    new_hstatus = old_hstatus & ~HSTATUS_VGEIN;
+    new_hstatus |= MASK_INSR(idata->hgei, HSTATUS_VGEIN);
+    csr_write(CSR_HSTATUS, new_hstatus);
+
+    /*
+     * No atomic accessors are needed to store the values into the MRIF here,
+     * as imsic_vsfile_read_clear() is always called with a pointer to a
+     * temporary MRIF on the stack.
+     */
+
+    mrif->eidelivery = imsic_vs_csr_swap(IMSIC_EIDELIVERY, 0);
+    mrif->eithreshold = imsic_vs_csr_swap(IMSIC_EITHRESHOLD, 0);
+    for ( i = 0; i < idata->nr_eix; i++ )
+    {
+        mrif->eix[i].eip = imsic_eix_swap64(IMSIC_EIP0 + i * 2, 0);
+        mrif->eix[i].eie = imsic_eix_swap64(IMSIC_EIE0 + i * 2, 0);
+    }
+
+    csr_write(CSR_HSTATUS, old_hstatus);
+    csr_write(CSR_VSISELECT, old_vsiselect);
+}
+
+static void imsic_vsfile_read_clear(unsigned int vsfile_id,
+                                    unsigned int vsfile_cpu,
+                                    unsigned int nr_eix,
+                                    struct imsic_mrif *mrif)
+{
+    struct imsic_vsfile_data idata = {
+        .hgei = vsfile_id,
+        .nr_eix = nr_eix,
+        .mrif = mrif,
+    };
+
+    /* We can only read clear if we have an IMSIC VS-file */
+    if ( vsfile_cpu == CPU_NONE || !vsfile_id )
+        return;
+
+    imsic_call_on_cpu(vsfile_cpu, imsic_vsfile_local_read_clear, &idata);
+}
+
 void cf_check vcpu_imsic_deinit(struct vcpu *v)
 {
     XVFREE(v->arch.vimsic_state);
@@ -960,6 +1076,7 @@ void imsic_migrate_vcpu(struct vcpu *v)
 {
     struct imsic_vsfile_data vsfile_data = {
         .nr_eix = imsic_cfg.nr_eix,
+        .mrif = &(struct imsic_mrif){ },
     };
     struct vimsic_state *imsic_state = v->arch.vimsic_state;
     unsigned long flags;
@@ -1028,5 +1145,12 @@ void imsic_migrate_vcpu(struct vcpu *v)
      * to the new IMSIC VS-file.
      */
 
+    /* Read and clear register state from old IMSIC VS-file */
+    imsic_vsfile_read_clear(old_vsfile_id, old_vsfile_cpu, vsfile_data.nr_eix,
+                            vsfile_data.mrif);
+
+    /* Free-up old IMSIC VS-file */
+    vgein_release(v, old_vsfile_id, old_vsfile_cpu);
+
     BUG_ON("unimplemented");
 }
-- 
2.55.0


