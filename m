Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3983606A323
	for <xen-devel@archiver.kernel.org>; Fri, 13 Nov 2026 15:50:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=D8Q1KIqp
Received: from list by lists.xenproject.org with outflank-mailman.1487807.1690198 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRtXR-0001pC-26; Fri, 13 Nov 2026 15:50:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1487807.1690198; Fri, 13 Nov 2026 15:50:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRtXP-0001fP-5W; Fri, 13 Nov 2026 15:50:03 +0000
Received: by outflank-mailman (input) for mailman id 1487807;
 Fri, 13 Nov 2026 15:49:49 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xRtXA-0007IK-3i
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2026 15:49:48 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xRtX9-000WGx-Fo
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2026 16:49:47 +0100
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6af7319b-e002-0a2a0a5209dd-0a2a4502e344-0
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 16:49:47 +0100
Received: from [209.85.221.52] (helo=mail-wr1-f52.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6af7319b-6ca4-0a2a45020019-d155dd34c032-3
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 16:49:47 +0100
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-491aaed7565so496124f8f.2
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 07:49:47 -0800 (PST)
Received: from fedora (user-109-243-65-71.play-internet.pl. [109.243.65.71])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-49c5f1c0e0dsm5786493f8f.15.2026.11.13.07.49.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Nov 2026 07:49:45 -0800 (PST)
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
        d=gmail.com; s=20260707; t=1794584987; x=1795189787; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hIWkQSYwSrZkLcTiMfLtZ8dV1/Bzd7k6oHaH8mbpBvU=;
        b=D8Q1KIqpeEZ7zmRJ4vxdgZTZk/EhXqRTDlBiqackIjyFftKeWHubdMNG6W0AKEyc+j
         BF+YCmOQu8dbvPpcC2hXReEraA+8jAS0Ds3qu4xLSkXdU93f0zKKwqR1JKSMXm3dPKnc
         RrZgl8ZhS8fOXx9aFKl1OdKr346R5cmpSg8u8AHbdQ/Ic7BiuOi9KN4DsVb0RdO/97gA
         P99aoTMWGZTX8Whdyleztzjx9gytAG23AAE+/5u5PGGGxR8zAyDqLN7zXO8/hdrx7d1R
         eEYULGgAQCX72Odb/ZNiarQScDjBNLz9GdliTSvslFySPbt2behOoYGOZ46SjjbsPCV9
         8DEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794584987; x=1795189787;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hIWkQSYwSrZkLcTiMfLtZ8dV1/Bzd7k6oHaH8mbpBvU=;
        b=An5ruzQ1EWFiZ5LiuzMoMt3MclO0/0jbt955rgG25qG6gebyBel4zd0boF7ziJBhQn
         5P8vBV/wiGCdoaDBNxwdgfQ1fGg3BBPchNIk1eBoKPd7Di9SnCrP1zYVL5E06fuNltTh
         gtr/SqJw4fYEF3uLHm5WkzHF58ZW8DnqK9qWlDYkl62XnWo+6qMPc6JEJZsX6TtWEKR+
         oox6KFkoFmRWMVuFomEYM6OqmPcas/JKUPVgprWcUFlcv/ZYiJyijAGTHj6aX1aq5aQ2
         YHW4qGzFOn0hqp6DLGPzwuV6GbModk2Ok71sUNICNgDmEonXGBnrMqMXZPhPgEA80SlY
         eTYw==
X-Gm-Message-State: APuU4Z+YXroPQ9kbsl/cUKZhiZzhx76YAzU72vtIACieNXU4qWgDMfDA
	nS7nOWeyDm1Ci8ZHwh3MuGT5VuesloYJMsSD+/p05UE+EiEAimDx5eCT5bMKFA==
X-Gm-Gg: AYBFou1qulEL+yvrO+9S8PbzKyZm+cUkS75BraTeUk9mzhTlrNzTtuaaBA2EGWG2/5z
	A9WM6+zhIb2PqR8k3S1af51FMkmRQaociNp6QxuVnpFj1JdQ5eNVKIKyVeOvSL8zVpnpk+mSvHe
	2x2056Y8qakNDxdNtkCJVLHsBC+VYTxABZiuNhlu4vTAIwodRqQOj19K/j/wWIlrHTcLbvd4YkJ
	5mCeKWLQv09jqy+NiOFIz6Je31lOOv8EMPdQmnxOUUg+cuzlt+8806HBx4AIXGTcBsJyHuyA6cQ
	2KO2/j9e8GrmAH98Zb9vUWcnaX6PMWWlT50JymfK/Zxinbn21etYSeGjkSBWLUIrCFFbSrjlLvm
	sEmyWniBOPaFWQiYgZJvyCyYe6flJ7Iif0pkQ/JP29UVj8PPMIp3t0/c8daG5l29ErxORQSd59H
	D0ENhHYC0Y8dUzSYgn9qx/mOM5IjY1UqTy4ZkjQyAk1U0NIA2rC/TJs8TKrui4s3LWdKZPBrDDx
	jNLMFogky0r1MUgZv+acE5ElV9dDBb9mq0jQNu8/jSjjdIz55ZYz1YJpkMhmLVJNoMGCoTl+wZy
	gmiV1g0Wu2TKsAaZmi63Ttkn2mgTvi/5pQM/h/M4deFJk5eC74FT20Ry+9S4t9LxVIzgPsdV5/b
	9bxHr4DRIBiY+Tg==
X-Received: by 2002:a05:6000:2dc3:b0:48b:1a0:5630 with SMTP id ffacd0b85a97d-49c72f7b8d7mr7247820f8f.41.1794584986705;
        Fri, 13 Nov 2026 07:49:46 -0800 (PST)
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
Subject: [PATCH v4 33/42] xen/riscv: save and clear the old IMSIC VS-file on vCPU migration
Date: Fri, 13 Nov 2026 16:48:54 +0100
Message-ID: <11f506187b5771d2a498c3ed5bc97a9221f5259e.1794562488.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <cover.1794562488.git.oleksii.kurochko@gmail.com>
References: <cover.1794562488.git.oleksii.kurochko@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-720697/1794584987-F10A02AC-46CE3254/10/73395122804
X-purgate-type: spam
X-purgate-size: 11381
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

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

The synchronization with the APLIC has to be done by that very pCPU
too, right before, so do both from the new imsic_vsfile_local_drain(),
in a single IPI: the move is done by the vCPU on its way back to the
guest, which each IPI delays.

imsic_ctxt_switch_from() armed HGEIE for the old VS-file when the vCPU
was switched out, but once the file is left there is nothing for Xen to
observe in it. Hence clear its bit with the new
imsic_local_hgeie_clear(), from imsic_vsfile_local_read_clear(), which
already runs on the pCPU owning the file.

The state is saved into struct imsic_mrif. Its eix[] array follows the
layout of a memory-resident interrupt file (MRIF) as defined by the AIA
specification: pairs of 64-bit interrupt-pending and interrupt-enable
doublewords, each pair covering 64 interrupt identities. eithreshold and
eidelivery aren't part of an MRIF and are stored next to it as they
belong to the interrupt file state too. Using the MRIF layout allows the
same structure to hold the interrupt file of a vCPU which doesn't own a
hardware guest interrupt file, which is how the AIA specification
describes MRIFs being used by a hypervisor.

Here the structure is only a temporary copy of a guest interrupt file:
it is filled and consumed by Xen alone and its address is never given
to an IOMMU, so no MSI is ever recorded into it. Hence plain
(non-atomic) accesses are sufficient and it can live on the stack.

The saved state still has to be restored into the new VS-file, so keep
the BUG_ON("unimplemented") placeholder at the end of
imsic_vsfile_move() to avoid silently losing the guest's interrupt
state.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in v4:
 - Drop imsic_switchcase_ret() and imsic_eix_swap(), following the
   removal of the switchcase expansion pyramid: imsic_eix_swap64() uses
   imsic_vs_csr_swap() directly.
 - Name imsic_eix_check() in the comment above imsic_eix_swap64() rather
   than saying "above".
 - Use imsic_vsfile_select() and imsic_vsfile_deselect().
 - Say "hardware guest interrupt file" in the commit message, to make
   clear which vCPUs an MRIF can serve.
 - Clear the HGEIE bit of the old interrupt file in
   imsic_vsfile_local_read_clear(), through the new
   imsic_local_hgeie_clear(), moved here from "xen/riscv: wake up a
   descheduled vCPU on a guest external interrupt".
 - Save and clear the old file in imsic_vsfile_move(), which now does
   the move for imsic_migrate_vcpu().
 - Synchronize with the APLIC and save and clear the old file in a
   single IPI, from the new imsic_vsfile_local_drain(), which replaces
   imsic_vsfile_read_clear(). imsic_vsfile_local_read_clear(), no longer
   an IPI callback itself, takes a typed pointer and drops cf_check.
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
 xen/arch/riscv/imsic.c | 118 +++++++++++++++++++++++++++++++++++++----
 1 file changed, 107 insertions(+), 11 deletions(-)

diff --git a/xen/arch/riscv/imsic.c b/xen/arch/riscv/imsic.c
index 690a83fd6866..c705b287c7ff 100644
--- a/xen/arch/riscv/imsic.c
+++ b/xen/arch/riscv/imsic.c
@@ -58,6 +58,28 @@ static unsigned int __ro_after_init guest_num_msis;
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
@@ -87,6 +109,12 @@ do {                            \
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
@@ -115,6 +143,19 @@ static void imsic_eix_write64(unsigned int ireg, uint64_t val)
         imsic_vs_csr_write(ireg + 1, val >> 32);
 }
 
+/* Swap a whole 64-bit EIx group (see imsic_eix_check()). */
+static uint64_t imsic_eix_swap64(unsigned int ireg, uint64_t val)
+{
+    uint64_t old;
+
+    imsic_eix_check(ireg);
+    old = imsic_vs_csr_swap(ireg, val);
+    if ( IS_ENABLED(CONFIG_RISCV_32) )
+        old |= (uint64_t)imsic_vs_csr_swap(ireg + 1, val >> 32) << 32;
+
+    return old;
+}
+
 unsigned int vcpu_guest_file_id(const struct vcpu *v)
 {
     return ACCESS_ONCE(v->arch.vimsic_state->guest_file_id);
@@ -574,6 +615,8 @@ struct imsic_vsfile_data {
     unsigned int hgei;
     /* Number of 64-bit EIx groups to cover, see imsic_cfg.nr_eix. */
     unsigned int nr_eix;
+    /* Where the interrupt file state is saved to or restored from. */
+    struct imsic_mrif *mrif;
 };
 
 /* The state of this hart imsic_vsfile_select() changes. */
@@ -692,6 +735,56 @@ static void imsic_vsfile_local_clear(const struct imsic_vsfile_data *idata)
     local_irq_restore(flags);
 }
 
+/*
+ * Stop observing an interrupt file which a vCPU leaves when it moves to
+ * another pCPU, by clearing the bit imsic_ctxt_switch_from() set.
+ */
+static void imsic_local_hgeie_clear(unsigned int hgei)
+{
+    csr_clear(CSR_HGEIE, BIT(hgei, UL));
+}
+
+static void
+imsic_vsfile_local_read_clear(const struct imsic_vsfile_data *idata)
+{
+    unsigned int i;
+    struct imsic_mrif *mrif = idata->mrif;
+    struct imsic_vsfile_ctx ctx;
+
+    imsic_local_hgeie_clear(idata->hgei);
+
+    imsic_vsfile_select(idata->hgei, &ctx);
+
+    /*
+     * No atomic accessors are needed to store the values into the MRIF here,
+     * as imsic_vsfile_move() always passes it a pointer to a temporary MRIF
+     * on the stack.
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
+    imsic_vsfile_deselect(&ctx);
+}
+
+/*
+ * Make sure that the MSIs already sent to the interrupt file @data names have
+ * arrived there, then save and clear the file. Both have to be done by the
+ * pCPU owning the file, and doing them together takes a single IPI.
+ */
+static void cf_check imsic_vsfile_local_drain(void *data)
+{
+    const struct imsic_vsfile_data *idata = data;
+
+    imsic_aplic_sync(data);
+    imsic_vsfile_local_read_clear(idata);
+}
+
 void cf_check vcpu_imsic_deinit(struct vcpu *v)
 {
     XVFREE(v->arch.vimsic_state);
@@ -1129,6 +1222,7 @@ static void imsic_vsfile_move(struct vcpu *v)
 {
     struct imsic_vsfile_data vsfile_data = {
         .nr_eix = imsic_cfg.nr_eix,
+        .mrif = &(struct imsic_mrif){ },
     };
     struct vimsic_state *imsic_state = v->arch.vimsic_state;
     unsigned long flags;
@@ -1161,18 +1255,20 @@ static void imsic_vsfile_move(struct vcpu *v)
     vaplic_reconfigure_target(v);
 
     /*
-     * Synchronizing interactions between a hart and the APLIC.
-     *
-     * The MSIs to be flushed are the ones still on their way to the old
-     * interrupt file, so the barrier has to be done by the pCPU which owns
-     * that file.
-     */
-    imsic_call_on_cpu(old_vsfile_cpu, imsic_aplic_sync, NULL);
-
-    /*
-     * At this point, all interrupt producers have been moved
-     * to the new IMSIC VS-file.
+     * Synchronize with the APLIC, so that no straggler MSI reaches the old
+     * interrupt file anymore, then read and clear the old file's register
+     * state into the MRIF. Both have to be done by the pCPU owning the old
+     * file.
      */
+    imsic_call_on_cpu(old_vsfile_cpu, imsic_vsfile_local_drain,
+                      &(struct imsic_vsfile_data){
+                          .hgei = old_vsfile_id,
+                          .nr_eix = vsfile_data.nr_eix,
+                          .mrif = vsfile_data.mrif,
+                      });
+
+    /* Free-up old IMSIC VS-file */
+    vgein_release(v, old_vsfile_id, old_vsfile_cpu);
 
     BUG_ON("unimplemented");
 }
-- 
2.56.1


