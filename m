Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFC27606A32D
	for <xen-devel@archiver.kernel.org>; Fri, 13 Nov 2026 15:50:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=epmgl28V
Received: from list by lists.xenproject.org with outflank-mailman.1487777.1690158 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRtXH-0008Op-Ra; Fri, 13 Nov 2026 15:49:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1487777.1690158; Fri, 13 Nov 2026 15:49:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRtXF-0008FY-OL; Fri, 13 Nov 2026 15:49:53 +0000
Received: by outflank-mailman (input) for mailman id 1487777;
 Fri, 13 Nov 2026 15:49:42 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xRtX3-0005vZ-97
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2026 15:49:41 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xRtX2-0079QB-Ks
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2026 16:49:40 +0100
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6af73183-8faa-0a2a0a5109dd-0a2a450a8adc-46
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 16:49:40 +0100
Received: from [209.85.221.41] (helo=mail-wr1-f41.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6af73194-f2d2-0a2a450a0019-d155dd29d1c5-3
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 16:49:40 +0100
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-48e46e449e8so1106218f8f.3
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 07:49:40 -0800 (PST)
Received: from fedora (user-109-243-65-71.play-internet.pl. [109.243.65.71])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-49c5f1c0e0dsm5786493f8f.15.2026.11.13.07.49.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Nov 2026 07:49:39 -0800 (PST)
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
        d=gmail.com; s=20260707; t=1794584980; x=1795189780; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F2KB5W1zeX222FYmJezpVX5Bgh4JdmAy9x4+yNDwOvI=;
        b=epmgl28VY2y7ZE+Bsjob4vnaIXmK/0bM3ImrZQ9I+gmefWIALg9ZaWktNAfmjq1CY2
         In+/5Jxw808cR4hUs7e3NbJ/DQjvEZHS6t787Hz2QcXBQ+q9YI4Z9cGZFQ/OAVh2HQka
         Z7gR6r41GpYwN4tIoVCoFkn6WkWA4JP7fqgoujjpzQdIepibM0zwx7YFh2LEix5RLIMC
         xO/0Sz1WMzPcgCY0MWt8OBPmR9GPpH5Pr7KkGaZaNWAxHteoCy1GxFMvQBwHkEmgxqIM
         KFs4Ok2KZVeyq+4KveLL74iyTJpkvfTrORzSjJIokt2U22pekj6i7F2LS6G0NrxAR7UU
         LaRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794584980; x=1795189780;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=F2KB5W1zeX222FYmJezpVX5Bgh4JdmAy9x4+yNDwOvI=;
        b=Xyp6c9gJkdHrd9r338p/yAk2p0wQz1d4QFcS4FEm7J3YWIByF078TlR/EN6vDJGJ4e
         GIrFEEUm4+IwdpHtgfwrivaerio/E66+AAwP5pLguWo/4ScyZrnx3q56Uudgb3iVgtM2
         Dnm8xFeoG17aPiNPcD1NuVFZ5MU0gnJHwNH5Tsp9q3adm9o9Ij4iCUmd1azdI/I0FhA+
         VB3YAwft4ukv7aLkQBpa0xmKJggoCc486AXZJHFps614GnJEdUgTImuqjQobnAzi9yGJ
         ahnblM0qiE4nrpZUafNUm+xgWE2nU3ibcEdzuniozYDZ9hgn9hLKJnjAniH3lGEpbQU4
         JfPw==
X-Gm-Message-State: APuU4Z821jhoFFY71pa3O7LehttmiGrMn6jHcDmowQGZVaIyheC5qx/n
	IJkfu2QXXDbmXJAlKn+A9i9u50pGWajm4NMhSz2slR711R/rZnXzPB4dgA5OOw==
X-Gm-Gg: AYBFou3aHrKDPtVy5XhG18mTVA9Li/48C4iG+uDUV/T9SxIW/psQMuV/2sWu12qStid
	KRPQDrgZqJwMt4SWbeDGqHt50IBl8qoX8T7Rs+FJfc1ceVKSiz+Zu9s60kwoqa3ZOLxISKvtC1E
	BN7b2G/LOHsM+yXVf3n9jwn9Vl+RrzPnAFdiKpaLR8UseeGEDMoeAxYUCrZhcqGsmwUY74SMnzB
	01zHNM2jnGOnQYzDm+ZhBQb+mCDUpXkpvWmog3K1iWV6hkxRTwKd+gV4h8KI3YdiKhK4yMWbiR+
	3wOQqdKZPB/x0ouMGaqACDXJuOlcuvU9VFzyVH9YLPoZ3o6P+hw/YwgZ1Pqf53KJgXNzQaMyfwf
	8f5vboPwf3aJZgthnLh2acuodOSMLK9ksVcAy5W+X98UlccBy2fjLXu67BYQCo4HQ6es8jxnEUD
	8uj/ZtP2w/ZPZboSEuDWFqM1xbwJr9yzNXlTCKEr73XIM6Tnq/Xz5oDF+XOM7qTLjdm7DJs5NKm
	ws1s+2YGZGw46thWK7N4/N3iIw5hTFkCCNUYEbO3cGvbJJx/i2JJ9uCKB2kCC+ZE2Bw6jUxYS+W
	HxD0PrAr/QnJvWtqNKFpr1D4UPfZXeT4pkVJGocAYGDSurwwRHK1GS6gNLWHHdQPpM7W
X-Received: by 2002:a05:6000:3108:b0:492:7efe:3fc4 with SMTP id ffacd0b85a97d-49c711b7ee1mr6785845f8f.21.1794584979684;
        Fri, 13 Nov 2026 07:49:39 -0800 (PST)
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
Subject: [PATCH v4 28/42] xen/riscv: introduce IMSIC h/w interrupt file attaching to vcpu
Date: Fri, 13 Nov 2026 16:48:49 +0100
Message-ID: <76f940e802db7ac8c4b02c3891678c3e5acb6971.1794562488.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <cover.1794562488.git.oleksii.kurochko@gmail.com>
References: <cover.1794562488.git.oleksii.kurochko@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-4011c0/1794584980-595C3CFC-0F4CD0F0/10/73395122804
X-purgate-type: spam
X-purgate-size: 16935
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Introduce imsic_vsfile_attach() to give a vCPU a working guest
interrupt file.

A guest (VS) interrupt file has to be backed by one of the hardware
guest interrupt files of the pCPU the vCPU runs on, so that pCPU has to
be known first. arch_vcpu_create() is therefore not a suitable place:
the pCPU assigned to a vCPU can still change before the vCPU is first
scheduled, which would mean taking another file and remapping the
guest's IMSIC page to it. Call imsic_vsfile_attach() from
continue_new_vcpu() instead, i.e. when the vCPU is scheduled for the
first time; as that isn't an __init context, neither is
imsic_vsfile_attach().

imsic_vsfile_acquire() assigns the file with vgein_assign(), clears it,
maps it into the guest's G-stage and records it in the vCPU's IMSIC
state. The clearing is needed as the file may still hold the state of
its previous owner, and has to be done by the hart the file belongs to,
as an IMSIC VS-file is reachable only through that hart's hstatus.VGEIN.
A vCPU gets its file on the pCPU it runs on, so imsic_vsfile_local_clear()
is called directly, with IRQs disabled for the time hstatus.VGEIN selects
the file.

A vCPU which can't be given a h/w guest interrupt file crashes its
domain, as s/w guest interrupt files aren't supported yet. If the file
can't be mapped into the guest, the guest external interrupt number
taken for it is released again rather than leaked.

imsic_update_state() records the vCPU's guest interrupt file id together
with the pCPU owning the file. The two are read as a pair, so they are
updated under vsfile_lock as a single unit.

The relevant translation tables at all IOMMUs would also have to be
updated, so that MSIs which devices send to the vCPU's interrupt file at
its guest-physical address reach the h/w guest interrupt file backing
it, but that is skipped for now as there is no IOMMU support for RISC-V.

The guest may program the vAPLIC target register of a h/w source for a
vCPU which hasn't run yet. That vCPU has no h/w guest interrupt file
yet, so there is nothing to point the h/w target register at, and
vaplic_target_write() only stores the value. Hence imsic_vsfile_attach()
calls vaplic_reconfigure_target(), which writes the stored value to the
h/w APLIC, pointing it at the newly acquired file.

The vCPU has never run at that point, so the freshly acquired and zeroed
file is all the interrupt state it has, and hstatus.VGEIN can be pointed
at it right away.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in v4:
 - s/HSTATUS.VGEIN/hstatus.VGEIN/ in a comment.
 - Reword the commit message paragraph on reconfiguring the vAPLIC
   target registers on the first attach.
 - Move ahead of the vCPU migration patches, so that the attach no longer
   has to be fitted into the finished migration code: imsic_vsfile_move()
   and its first_attach argument are gone, and imsic_vsfile_attach() is
   a plain sequence of its own.
 - Take over imsic_vsfile_acquire() and imsic_update_state() from
   "xen/riscv: remap interrupts to new IMSIC VS-file", and the clearing of
   the file, together with the helpers it needs, from "xen/riscv: prepare
   new IMSIC VS-file", which is gone. They come with the changes made to
   them in v4: imsic_eix_check() and imsic_vs_csr_write() used directly
   instead of the switchcase expansion pyramid, and the switch of
   hstatus.VGEIN factored out into imsic_vsfile_select() and
   imsic_vsfile_deselect().
 - Move the IOMMU TODO into imsic_vsfile_acquire(), next to the G-stage
   mapping it is the counterpart of.
 - Introduce imsic_vsfile_set_vgein(), to be shared with
   imsic_migrate_vcpu().
 - Clear the file with a direct call: the file is taken on the pCPU the
   vCPU runs on, so imsic_call_on_cpu() is left to "xen/riscv: remap
   interrupts to new IMSIC VS-file", which first needs another pCPU.
   Give imsic_vsfile_local_clear() a typed pointer, drop its cf_check.
---
Changes in v3:
 - imsic_update_state() is now implemented by "xen/riscv: remap
   interrupts to new IMSIC VS-file".
 - Share the code of imsic_vsfile_attach() and imsic_migrate_vcpu() in
   imsic_vsfile_move(), whose first_attach argument skips the part moving
   state out of the old file.
 - Call vaplic_reconfigure_target() on the first attach as well, so that
   vAPLIC targets the guest wrote for the vCPU before it got its file reach
   the h/w.
 - Replace panic() for a vCPU left without a h/w file by domain_crash():
   it can only happen to a vCPU whose first imsic_vsfile_acquire() failed
   and crashed its domain, and such a vCPU can still be migrated.
 - imsic_vsfile_acquire(), together with the vgein_release() on a
   mapping failure, is now introduced by "xen/riscv: remap interrupts to
   new IMSIC VS-file", without the cpu argument (the file is always
   taken on v->processor).
 - Include asm/imsic.h for imsic_vsfile_attach().
 - Drop imsic_nr_eix() in favour of imsic_cfg.nr_eix.
 - Drop vcpu_set_vgein(): with the code shared in imsic_vsfile_move(),
   hstatus.VGEIN is updated in one place only.
 - Rework the commit message: drop the stale vcpu_aia_init() name and
   the claim that the IMSIC state has no concurrent readers yet.
---
Changes in v2:
 - Update vcpu_aia_init() to catch sw interrupt file and update some
   debug messages in it.
 - Add vgein_release() if IMSIC h/w mapping failed.
 - imsic_update_state(): store v->processor rather than
   cpuid_to_hartid(), as ->vsfile_cpu is consumed as a Xen CPU id
   (aplic_hart_field(), cpumask_of()) and its NR_CPUS sentinel lives in
   that numbering space.
 - Drop parentheses around guest_file_id ? ... in imsic_update_state().
 - Rename vcpu_aia_init to imsic_vsfile_attach() and move the code to
   imsic.c.
---
---
 xen/arch/riscv/domain.c            |   3 +
 xen/arch/riscv/imsic.c             | 221 +++++++++++++++++++++++++++++
 xen/arch/riscv/include/asm/imsic.h |   9 ++
 xen/arch/riscv/vaplic.c            |   3 +-
 4 files changed, 235 insertions(+), 1 deletion(-)

diff --git a/xen/arch/riscv/domain.c b/xen/arch/riscv/domain.c
index 65d582aa8fe0..1b2ab7ab468c 100644
--- a/xen/arch/riscv/domain.c
+++ b/xen/arch/riscv/domain.c
@@ -13,6 +13,7 @@
 #include <asm/csr.h>
 #include <asm/current.h>
 #include <asm/gpr-num.h>
+#include <asm/imsic.h>
 #include <asm/intc.h>
 #include <asm/mmio.h>
 #include <asm/riscv_encoding.h>
@@ -265,6 +266,8 @@ static void continue_new_vcpu(struct vcpu *prev)
 
     vcpu_set_vsxl(current);
 
+    imsic_vsfile_attach(current);
+
     /*
      * return_to_new_vcpu() sets up hstatus.SPV, sstatus.SPP and sepc so
      * that sret enters the guest in VS-mode. A trap taken in HS-mode
diff --git a/xen/arch/riscv/imsic.c b/xen/arch/riscv/imsic.c
index a17aae7b6ffa..bc757ef62636 100644
--- a/xen/arch/riscv/imsic.c
+++ b/xen/arch/riscv/imsic.c
@@ -25,8 +25,10 @@
 #include <xen/spinlock.h>
 #include <xen/xvmalloc.h>
 
+#include <asm/aia.h>
 #include <asm/imsic.h>
 #include <asm/p2m.h>
+#include <asm/vaplic.h>
 
 #define IMSIC_HART_SIZE(guest_bits) (BIT(guest_bits, U) * IMSIC_MMIO_PAGE_SZ)
 
@@ -77,11 +79,51 @@ do {                            \
     csr_clear(CSR_SIREG, v);    \
 } while (0)
 
+#define imsic_vs_csr_write(c, v)    \
+do {                                \
+    csr_write(CSR_VSISELECT, c);    \
+    csr_write(CSR_VSIREG, v);       \
+} while (0)
+
+/*
+ * On RV64 a 64-bit EIx group is the even-numbered register alone, whereas on
+ * RV32 it is split into the even-numbered (low half) and the following
+ * odd-numbered (high half) register. ireg names the first, even-numbered
+ * register of such a group, among eip0..eip63 or eie0..eie63.
+ */
+static void imsic_eix_check(unsigned int ireg)
+{
+    ASSERT(!(ireg & 1));
+    ASSERT((ireg >= IMSIC_EIP0 && ireg < IMSIC_EIP0 + 64) ||
+           (ireg >= IMSIC_EIE0 && ireg < IMSIC_EIE0 + 64));
+}
+
+/* Write a whole 64-bit EIx group (see imsic_eix_check()). */
+static void imsic_eix_write64(unsigned int ireg, uint64_t val)
+{
+    imsic_eix_check(ireg);
+    imsic_vs_csr_write(ireg, val);
+    if ( IS_ENABLED(CONFIG_RISCV_32) )
+        imsic_vs_csr_write(ireg + 1, val >> 32);
+}
+
 unsigned int vcpu_guest_file_id(const struct vcpu *v)
 {
     return ACCESS_ONCE(v->arch.vimsic_state->guest_file_id);
 }
 
+static void imsic_update_state(struct vcpu *v, unsigned int guest_file_id)
+{
+    unsigned long flags;
+    struct vimsic_state *vimsic_state = v->arch.vimsic_state;
+    unsigned int cpu = guest_file_id ? v->processor : CPU_NONE;
+
+    write_lock_irqsave(&vimsic_state->vsfile_lock, flags);
+    vimsic_state->guest_file_id = guest_file_id;
+    vimsic_state->vsfile_cpu = cpu;
+    write_unlock_irqrestore(&vimsic_state->vsfile_lock, flags);
+}
+
 void __init imsic_ids_local_delivery(bool enable)
 {
     if ( enable )
@@ -318,6 +360,8 @@ static int __init imsic_parse_node(const struct dt_device_node *node,
         return -ENOENT;
     }
 
+    imsic_cfg.nr_eix = DIV_ROUND_UP(imsic_cfg.nr_ids + 1, 64);
+
     /* Compute base address */
     *nr_mmios = 0;
     rc = dt_device_get_address(node, *nr_mmios, &base_addr, NULL);
@@ -435,6 +479,77 @@ int cf_check vcpu_imsic_init(struct vcpu *v)
     return 0;
 }
 
+/*
+ * Arguments of the imsic_vsfile_local_*() helpers, which work on a guest
+ * interrupt file of the pCPU they run on.
+ */
+struct imsic_vsfile_data {
+    /* Guest interrupt file to work on, i.e. the hstatus.VGEIN selecting it. */
+    unsigned int hgei;
+    /* Number of 64-bit EIx groups to cover, see imsic_cfg.nr_eix. */
+    unsigned int nr_eix;
+};
+
+/* The state of this hart imsic_vsfile_select() changes. */
+struct imsic_vsfile_ctx {
+    unsigned long hstatus;
+    unsigned long vsiselect;
+};
+
+/*
+ * vsiselect/vsireg only reach the guest interrupt file selected by
+ * hstatus.VGEIN, so point VGEIN at file @hgei of this hart for the accesses
+ * which follow. hstatus and vsiselect hold the state of the vCPU running on
+ * this pCPU: save them into @ctx, for imsic_vsfile_deselect() to restore.
+ */
+static void imsic_vsfile_select(unsigned int hgei,
+                                struct imsic_vsfile_ctx *ctx)
+{
+    unsigned long hstatus;
+
+    ctx->vsiselect = csr_read(CSR_VSISELECT);
+    ctx->hstatus = csr_read(CSR_HSTATUS);
+
+    hstatus = ctx->hstatus & ~HSTATUS_VGEIN;
+    hstatus |= MASK_INSR(hgei, HSTATUS_VGEIN);
+    csr_write(CSR_HSTATUS, hstatus);
+}
+
+static void imsic_vsfile_deselect(const struct imsic_vsfile_ctx *ctx)
+{
+    csr_write(CSR_HSTATUS, ctx->hstatus);
+    csr_write(CSR_VSISELECT, ctx->vsiselect);
+}
+
+static void imsic_vsfile_local_clear(const struct imsic_vsfile_data *idata)
+{
+    unsigned int i;
+    struct imsic_vsfile_ctx ctx;
+    unsigned long flags;
+
+    /* We can only zero-out if we have a IMSIC VS-file */
+    if ( !idata->hgei )
+        return;
+
+    /* Nothing on this pCPU is to run with the file selected meanwhile. */
+    local_irq_save(flags);
+
+    imsic_vsfile_select(idata->hgei, &ctx);
+
+    imsic_vs_csr_write(IMSIC_EIDELIVERY, 0);
+    imsic_vs_csr_write(IMSIC_EITHRESHOLD, 0);
+
+    for ( i = 0; i < idata->nr_eix; i++ )
+    {
+        imsic_eix_write64(IMSIC_EIP0 + i * 2, 0);
+        imsic_eix_write64(IMSIC_EIE0 + i * 2, 0);
+    }
+
+    imsic_vsfile_deselect(&ctx);
+
+    local_irq_restore(flags);
+}
+
 void cf_check vcpu_imsic_deinit(struct vcpu *v)
 {
     XVFREE(v->arch.vimsic_state);
@@ -736,3 +851,109 @@ int __init vimsic_make_domu_dt_node(struct kernel_info *kinfo,
 
     return fdt_end_node(fdt);
 }
+
+/*
+ * Take a h/w guest interrupt file on the pCPU @v runs on and make it the
+ * vCPU's one.
+ *
+ * hstatus.VGEIN is deliberately left alone: it must only point at a file
+ * which already holds the vCPU's interrupt state, and the file taken here is
+ * zeroed, which is all the state only a vCPU which hasn't run yet has. Hence
+ * it is up to the caller to set hstatus.VGEIN at the right moment, see
+ * imsic_vsfile_set_vgein().
+ *
+ * Returns the id of the file, or 0, with the domain crashed, if none could be
+ * taken.
+ */
+static unsigned int imsic_vsfile_acquire(struct vcpu *v)
+{
+    unsigned int cpu = v->processor;
+    struct imsic_vsfile_data vsfile_data = { .nr_eix = imsic_cfg.nr_eix };
+    unsigned int vsfile_id;
+    int rc;
+
+    /* @v gets a file of the pCPU it runs on, which clears it below. */
+    ASSERT(cpu == smp_processor_id());
+
+    vsfile_id = vgein_assign(v);
+    if ( !vsfile_id )
+    {
+        /*
+         * vgein_assign() returns 0 when no free h/w guest interrupt file is
+         * available. s/w guest interrupt files aren't supported yet, so such
+         * a vCPU can't be run.
+         */
+        domain_crash(v->domain,
+                     "%pv: no free h/w guest interrupt file on CPU%u\n",
+                     v, cpu);
+        return 0;
+    }
+
+    vsfile_data.hgei = vsfile_id;
+
+    /* The file could still hold the state of its previous owner */
+    imsic_vsfile_local_clear(&vsfile_data);
+
+    rc = imsic_map_guest_file(v, vsfile_id);
+    if ( rc )
+    {
+        vgein_release(v, vsfile_id, cpu);
+
+        /* Can't continue w/o correctly mapped IMSIC interrupt file */
+        domain_crash(v->domain,
+                     "%pv: failed to map h/w guest interrupt file %u: %d\n",
+                     v, vsfile_id, rc);
+        return 0;
+    }
+
+    /*
+     * TODO: Modify the relevant translation tables at all IOMMUs so that MSIs
+     *       for this virtual interrupt file are sent to this physical one.
+     */
+    if ( iommu_enabled )
+        printk_once("IMSIC: IOMMU MSI retargeting is not implemented\n");
+
+    imsic_update_state(v, vsfile_id);
+
+    return vsfile_id;
+}
+
+/* Make guest interrupt file @hgei the source of @v's VS-level interrupts. */
+static void imsic_vsfile_set_vgein(struct vcpu *v, unsigned int hgei)
+{
+    struct cpu_user_regs *regs = vcpu_guest_cpu_user_regs(v);
+
+    regs->hstatus &= ~HSTATUS_VGEIN;
+    regs->hstatus |= MASK_INSR(hgei, HSTATUS_VGEIN);
+}
+
+/*
+ * Give a vCPU which is about to run for the first time its first h/w guest
+ * interrupt file, on the pCPU it runs on.
+ */
+void imsic_vsfile_attach(struct vcpu *v)
+{
+    unsigned int hgei;
+
+    if ( !aia_usable() )
+        return;
+
+    ASSERT(v->arch.vimsic_state->vsfile_cpu == CPU_NONE);
+
+    /* Zero-out, map and start to use the IMSIC VS-file */
+    hgei = imsic_vsfile_acquire(v);
+    if ( !hgei )
+        return;
+
+    /*
+     * A target the guest has programmed for the vCPU so far reached only the
+     * stored copy, as there was no file to point the h/w register at.
+     */
+    vaplic_reconfigure_target(v);
+
+    /*
+     * The vCPU has never run yet, so the just zeroed out file is all the
+     * interrupt state it has and hstatus.VGEIN can be pointed at it at once.
+     */
+    imsic_vsfile_set_vgein(v, hgei);
+}
diff --git a/xen/arch/riscv/include/asm/imsic.h b/xen/arch/riscv/include/asm/imsic.h
index 0f68e8e89496..be45a11cce22 100644
--- a/xen/arch/riscv/include/asm/imsic.h
+++ b/xen/arch/riscv/include/asm/imsic.h
@@ -55,6 +55,13 @@ struct imsic_config {
     /* Number off interrupt identities */
     unsigned int nr_ids;
 
+    /*
+     * Number of 64-bit EIx groups needed to cover all the interrupt
+     * identities, which are 0 (never valid, but it still occupies a bit) up
+     * to and including nr_ids.
+     */
+    unsigned int nr_eix;
+
     /* MSI */
     const struct imsic_msi *msi;
 
@@ -98,4 +105,6 @@ int vimsic_make_domu_dt_node(struct kernel_info *kinfo, unsigned int *phandle);
 
 int imsic_map_guest_file(struct vcpu *v, unsigned int vsfile_id);
 
+void imsic_vsfile_attach(struct vcpu *v);
+
 #endif /* RISCV_IMSIC_H */
diff --git a/xen/arch/riscv/vaplic.c b/xen/arch/riscv/vaplic.c
index 42489bf299b9..464a8a142798 100644
--- a/xen/arch/riscv/vaplic.c
+++ b/xen/arch/riscv/vaplic.c
@@ -153,7 +153,8 @@ static void vaplic_target_write(const struct domain *d, unsigned int irqn,
      * The h/w register names the hart and the guest interrupt file MSIs are
      * sent to, and there is none of either until the target vCPU is given a
      * h/w guest interrupt file, so until then only the stored copy is
-     * updated.
+     * updated. imsic_vsfile_attach() writes it to the h/w, through
+     * vaplic_reconfigure_target(), once there is such a file.
      *
      * TODO: once s/w guest interrupt files are supported, a vCPU using one
      * still needs its MSIs, so the h/w register will have to be written for
-- 
2.56.1


