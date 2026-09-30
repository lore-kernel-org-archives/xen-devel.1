Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5564ECA5FCC
	for <xen-devel@archiver.kernel.org>; Wed, 30 Sep 2026 16:25:02 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1437593.1656682 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBx6y-0002AZ-5l; Wed, 30 Sep 2026 16:24:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1437593.1656682; Wed, 30 Sep 2026 16:24:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBx6w-00025K-QO; Wed, 30 Sep 2026 16:24:50 +0000
Received: by outflank-mailman (input) for mailman id 1437593;
 Wed, 30 Sep 2026 16:24:44 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xBx6p-0000Uh-6u
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2026 16:24:43 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xBx6o-00Ghe4-IY
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2026 18:24:42 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6abd37c1-bab6-0a2a0a5309dd-0a2a450c92c8-12
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 18:24:42 +0200
Received: from [74.125.225.141] (helo=mail-wm2-f13.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6abd37c8-f479-0a2a450c0019-4a7de18dd6f9-3
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 18:24:40 +0200
Received: by mail-wm2-f13.google.com with SMTP id
 5b1f17b1804b1-49b912df756so43185765e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 09:24:40 -0700 (PDT)
Received: from fedora (user-109-243-71-234.play-internet.pl. [109.243.71.234])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a01cd43e66sm14620485e9.2.2026.09.30.09.24.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Sep 2026 09:24:39 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1790785480; x=1791390280; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GNE5X/4Zf+qRtsg8ZwPjb8BLew6qY5/EJ1Wcmse8ACc=;
        b=cQljBzn3dpG7QSBQfNVRwU9dS3gF4vsvm0WmZHi5miQth6qiJiWBjJaLxxY7pPvGWA
         d3PJdgaI+13gh3aCPShcuBuQzvTJE7eiTgm2xqtkQX7X6r9jdURrd0JFnjtwka/6ZuJQ
         E1KrExdpta5Y6EX1RtfjmX/ypdfmXqEHRkplP/t5SPus8wEVYCFhZRJZUXcTdsYW/eyF
         TElgrF9uurmJuccdMtYfuJIvZUjZORbr0lWagYwufqf5zv4RsaNEYiaIIC7cm14Jz0dw
         hDjsQYvwvvv4EA5Pa6H5vn1aj0fL7dGQPMWmk9YZc8KFa1pEVE0uGDNjnB3k6GU0moWR
         5m4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790785480; x=1791390280;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GNE5X/4Zf+qRtsg8ZwPjb8BLew6qY5/EJ1Wcmse8ACc=;
        b=MtzR2ZtQuhLQAWLWDt/T18ilBLbSzSiyYxbVE4Ls6bWjCfj8wKConXdSQVt6iVTTOQ
         wqkg6o6uPtY1+pVVN/u//38wXQ2SjLZwKnNvsVKcfy91ctjtT6CJ9oTTPgsxVVJZj9Ki
         ELObnShw3rFXdE5nceaNMLhisjLPfRVpnSeteQudttqWWyyHDHBoU2AapmxF8lmmnSg0
         U2I1nvmPkMpqCE+m4HIXpGj3ZAEc7T+oTniOA19D6gBy3cyWe2SD0QV4D0EUPHAdsdUL
         YP5xP5cheEFiC+UjvBhfDrsyCedz6c/QqVAnDpGsCaCikkwE6ShKbDSBf2eTGxuA24+C
         79ow==
X-Gm-Message-State: AFuF++mD+eqyKoj9Ps9HI0XfIJR6WikUojjjVtK3lT04SxTFeLkhp7ni
	6JjScPtfhsBqqt2Pvhg9vC9SfcWX3Pe431pXw9+l5URecm5w8c1pWDexnqh30A==
X-Gm-Gg: AYBFou22Cdbz03QbNMEzumQL9HgpBAdKc7/CL8QyWESU5nbnAXsCZXSgd3n5sUKS/mL
	Bjk47Xyzhgu9S2WJmw4Pq6S9ylxvWk+YH5tFK9JGt8rikkQMTtx9mWFkPt1/tPoe5ikW/ndxiMF
	9oXx5G5Kj6SdI/JZpUf5c0glkxupwdIo1k8w6bPo0ZD6KeBBBTMhwHmpMNdHoT2hS+LWXrWDTVz
	833Y2DTWWv5wbMByvF74kw/7NnKrTc/hQeb0koSXWG03kkW42PID5hkozgyOd5Ytbswgy+IedST
	NBvh9dJFzDZOYtYp8ozOTfVY1vl5uOW1KSqC9/zSHY75b+rjDN5bUQmyMi3DgoDU3YkwhkObenS
	0Nofz/umpjcKzHLG/k8HR2aaohvr39pdNWdy/oYyckXO5GqVuABVBwWrzBUp/B1zjZxsmguiidj
	zIqLCqZXMKMdCGUIQn/wpihfvNR/VZcdxxCmCfVO33Lv3jRjx/ab15Pq0Sk6Gp5RwU7Xnw0Vs6r
	CrSCdE5SYzW7HMXAf8Z/cfcjJgVUVIeL0eqfcF8
X-Received: by 2002:a05:600c:1912:b0:4a0:1d24:dee3 with SMTP id 5b1f17b1804b1-4a01d24e165mr15376665e9.17.1790785480052;
        Wed, 30 Sep 2026 09:24:40 -0700 (PDT)
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
Subject: [PATCH v3 35/39] xen/riscv: wake up a descheduled vCPU on a guest external interrupt
Date: Wed, 30 Sep 2026 18:23:54 +0200
Message-ID: <4e78b90482e23b049774eb00b19422d8c147970a.1790779209.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1790779209.git.oleksii.kurochko@gmail.com>
References: <cover.1790779209.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d25034/1790785480-51F33A5B-7DBD3334/10/73395122804
X-purgate-type: spam
X-purgate-size: 11985

While a vCPU is running, MSIs written to its h/w IMSIC guest interrupt
file are delivered straight to VS-mode. Once the vCPU is descheduled
nobody observes that file anymore, so a guest blocked on such an
interrupt would stay blocked until some unrelated event happens to
schedule it again.

Let Xen observe the file in that window: on deschedule set the vCPU's
bit in HGEIE, which turns an interrupt pending in its VS-file into an
HS-level SGEI, and clear the bit again on schedule-in. HGEIP only
reports an interrupt file number, so to find the vCPU to kick, keep a
per-pCPU owners[] array indexed by file number and updated in
vgein_assign()/vgein_release() together with the VGEIN bitmap. The SGEI
handler clears the HGEIE bits it has seen before kicking their owners,
so that the interrupt doesn't keep firing until the vCPU is switched in.

The same applies to a vCPU which is migrated to another pCPU while it
isn't running. Its old interrupt file is released during the migration,
and the vCPU isn't switched in on the new pCPU until something wakes it
up, so nothing would observe the new interrupt file. Hence arm HGEIE for
the new interrupt file on the new pCPU in imsic_migrate_vcpu(), and
clear the bit of the old one in imsic_vsfile_local_read_clear(), which
already runs on the pCPU owning it.

SGEIs are enabled per vCPU through v->arch.hie: vcpu_csr_init() sets
IRQ_S_GEXT in it and csr_regs_ctxt_switch_to() loads it into the CSR.

vgein_release() is only called on vCPU migration: a vCPU going away
also has to free its VGEIN slot and drop the owners[] entry, but there
is no vCPU teardown path to hook it into yet.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in v3:
 - Drop the unrelated cpu_callback() change.
 - Read HGEIP and HGEIE in separate statements (MISRA C Rule 13.2).
 - Check that guest interrupt file ID 0 isn't reported once, ahead of
   the loop in hgei_interrupt(), instead of on every iteration.
 - Drop the VGEIN_DEBUG print from hgei_interrupt().
 - Explain in imsic_ctxt_switch_from() why setting the HGEIE bit last
   doesn't lose an interrupt.
 - Initialise hie with BIT(IRQ_S_GEXT, UL) and explain why SGEIs are
   enabled.
 - Arm HGEIE of the new interrupt file on v->processor, as the
   new_vsfile_cpu local variable is gone from imsic_migrate_vcpu().
 - Describe in the commit message why HGEIE is armed for a vCPU which
   is migrated while it isn't running.
 - Correct the commit message: vgein_release() is called on vCPU
   migration.
---
Changes in v2:
 - New patch.
---
---
 xen/arch/riscv/aia.c                | 38 ++++++++++++++++++
 xen/arch/riscv/domain.c             |  7 ++++
 xen/arch/riscv/imsic.c              | 62 ++++++++++++++++++++++++++++-
 xen/arch/riscv/include/asm/aia.h    |  2 +
 xen/arch/riscv/include/asm/domain.h |  1 +
 xen/arch/riscv/traps.c              |  7 +++-
 6 files changed, 115 insertions(+), 2 deletions(-)

diff --git a/xen/arch/riscv/aia.c b/xen/arch/riscv/aia.c
index 1aca07c2f70f..d961c5c12239 100644
--- a/xen/arch/riscv/aia.c
+++ b/xen/arch/riscv/aia.c
@@ -18,6 +18,13 @@ struct vgein_ctrl {
     /* The least-significant bits are implemented first, apart from bit 0 */
     unsigned long bmp;
     spinlock_t lock;
+    /*
+     * Guest interrupt file IDs run from 1 to geilen inclusive (0 means that
+     * no guest external interrupt source is selected), and geilen can never
+     * exceed BITS_PER_LONG - 1, so indexing this array by the ID directly
+     * always fits.
+     */
+    struct vcpu *owners[BITS_PER_LONG];
     unsigned int geilen;
 };
 
@@ -138,7 +145,10 @@ unsigned int vgein_assign(struct vcpu *v)
     if ( vgein_id > vgein->geilen )
         vgein_id = 0;
     else
+    {
         __set_bit(vgein_id, bmp);
+        vgein->owners[vgein_id] = v;
+    }
 
     spin_unlock_irqrestore(&vgein->lock, flags);
 
@@ -161,6 +171,7 @@ void vgein_release(struct vcpu *v, unsigned int vgein_id, unsigned int cpu)
     spin_lock_irqsave(&vgein->lock, flags);
     if ( !__test_and_clear_bit(vgein_id, &vgein->bmp) )
         ASSERT_UNREACHABLE();
+    vgein->owners[vgein_id] = NULL;
     spin_unlock_irqrestore(&vgein->lock, flags);
 
 #ifdef VGEIN_DEBUG
@@ -168,3 +179,30 @@ void vgein_release(struct vcpu *v, unsigned int vgein_id, unsigned int cpu)
             __func__, v, vgein_id, cpu, vgein->bmp);
 #endif
 }
+
+void hgei_interrupt(void)
+{
+    unsigned long hgei_mask, flags;
+    struct vgein_ctrl *vgein = &this_cpu(vgein);
+
+    hgei_mask = csr_read(CSR_HGEIP);
+    hgei_mask &= csr_read(CSR_HGEIE);
+
+    csr_clear(CSR_HGEIE, hgei_mask);
+
+    spin_lock_irqsave(&vgein->lock, flags);
+
+    /*
+     * Bit 0 of HGEIP/HGEIE is read-only zero: guest interrupt file ID 0
+     * means that no guest external interrupt source is selected.
+     */
+    ASSERT(!(hgei_mask & 1));
+
+    for_each_set_bit ( guest_file_id, hgei_mask )
+    {
+        if ( vgein->owners[guest_file_id] )
+            vcpu_kick(vgein->owners[guest_file_id]);
+    }
+
+    spin_unlock_irqrestore(&vgein->lock, flags);
+}
diff --git a/xen/arch/riscv/domain.c b/xen/arch/riscv/domain.c
index f60f871aba98..6cb762bee33c 100644
--- a/xen/arch/riscv/domain.c
+++ b/xen/arch/riscv/domain.c
@@ -130,6 +130,12 @@ static void vcpu_csr_init(struct vcpu *v)
         v->arch.hstateen0 = (hstateen0 & csr_masks.hstateen0) |
                             csr_masks.ro_one.hstateen0;
     }
+
+    /*
+     * Enable SGEIs, so that a guest interrupt file marked in HGEIE while
+     * the vCPU is descheduled can raise an interrupt to Xen.
+     */
+    v->arch.hie = BIT(IRQ_S_GEXT, UL);
 }
 
 static void continue_new_vcpu(struct vcpu *prev)
@@ -386,6 +392,7 @@ static void csr_regs_ctxt_switch_to(struct vcpu *n)
     csr_write(CSR_HEDELEG, n->arch.hedeleg);
     csr_write(CSR_HIDELEG, n->arch.hideleg);
     csr_write(CSR_HVIP, n->arch.hvip);
+    csr_write(CSR_HIE, n->arch.hie);
     csr_write64(CSR_HENVCFG, n->arch.henvcfg);
     csr_write(CSR_HCOUNTEREN, n->arch.hcounteren);
     csr_write64(CSR_HTIMEDELTA, n->arch.htimedelta);
diff --git a/xen/arch/riscv/imsic.c b/xen/arch/riscv/imsic.c
index e35688f98bb1..40d2eff14d07 100644
--- a/xen/arch/riscv/imsic.c
+++ b/xen/arch/riscv/imsic.c
@@ -555,12 +555,37 @@ void cf_check imsic_ctxt_switch_from(struct vcpu *p)
 
     write_lock_irqsave(&imsic_state->vsfile_lock, flags);
     imsic_state->vsfile_cpu = p->processor;
+    /*
+     * Start to observe the VS-file from HS-mode: while the vCPU isn't
+     * running an interrupt pending in its VS-file is reported through HGEIP
+     * instead of being delivered to VS-mode, which lets Xen wake the vCPU up.
+     *
+     * An MSI is recorded in the VS-file's eip[] array until the guest claims
+     * it, and HGEIP isn't latched but reflects whether the file currently
+     * has a pending-and-enabled interrupt. Hence an interrupt which arrived
+     * before this point raises an SGEI as soon as the bit is set in HGEIE;
+     * nothing is lost in between.
+     */
+    csr_set(CSR_HGEIE, BIT(imsic_state->guest_file_id, UL));
     write_unlock_irqrestore(&imsic_state->vsfile_lock, flags);
 }
 
 void cf_check imsic_ctxt_switch_to(struct vcpu *n)
 {
-    /* Nothing to do */
+    struct vimsic_state *imsic_state = n->arch.vimsic_state;
+    unsigned long flags;
+
+    /* A s/w VS-file is never observed through HGEIP. */
+    if ( !vcpu_guest_file_id(n) )
+        return;
+
+    /*
+     * The vCPU is about to run, so hstatus.VGEIN delivers the VS-file's
+     * interrupts to it directly and there is nothing left for Xen to observe.
+     */
+    read_lock_irqsave(&imsic_state->vsfile_lock, flags);
+    csr_clear(CSR_HGEIE, BIT(imsic_state->guest_file_id, UL));
+    read_unlock_irqrestore(&imsic_state->vsfile_lock, flags);
 }
 
 int imsic_map_guest_file(struct vcpu *v, unsigned int vsfile_id)
@@ -695,6 +720,12 @@ static void cf_check imsic_vsfile_local_read_clear(void *data)
     struct imsic_mrif *mrif = idata->mrif;
     unsigned long new_hstatus, old_hstatus, old_vsiselect;
 
+    /*
+     * The HGEIE bit imsic_ctxt_switch_from() armed belongs to the old owner
+     * only.
+     */
+    csr_clear(CSR_HGEIE, BIT(idata->hgei, UL));
+
     /*
      * The file is reached by retargeting hstatus.VGEIN, and
      * imsic_vs_csr_swap() alters vsiselect. Both belong to the vCPU running
@@ -1044,6 +1075,21 @@ int __init vimsic_make_domu_dt_node(struct kernel_info *kinfo,
     return fdt_end_node(fdt);
 }
 
+/*
+ * Start to observe the interrupt file from HS-mode, the same way
+ * imsic_ctxt_switch_from() does it for a vCPU which is switched out.
+ *
+ * The counterpart, clearing the bit of the interrupt file which is left
+ * behind, is done by imsic_vsfile_local_read_clear(), which already runs on
+ * the pCPU owning that file.
+ */
+static void cf_check imsic_local_hgeie_set(void *data)
+{
+    const struct imsic_vsfile_data *idata = data;
+
+    csr_set(CSR_HGEIE, BIT(idata->hgei, UL));
+}
+
 static void cf_check imsic_vsfile_local_update(void *data)
 {
     unsigned int i;
@@ -1225,6 +1271,20 @@ void imsic_migrate_vcpu(struct vcpu *v)
     /* Restore register state in the new IMSIC VS-file */
     imsic_call_on_cpu(v->processor, imsic_vsfile_local_update, &vsfile_data);
 
+    /*
+     * imsic_ctxt_switch_from() armed HGEIE for the old interrupt file only.
+     * Unless the vCPU is being switched in right now (a migration done by
+     * sched_context_switch(), where is_running is already set), arm it for
+     * the new file too: a blocked vCPU would otherwise never be woken up by
+     * an interrupt pending in the new file, be it restored from the old one
+     * or arriving later.
+     *
+     * For a vCPU which is being switched in, imsic_ctxt_switch_to() clears the
+     * bit anyway, as interrupts are then delivered to the vCPU directly.
+     */
+    if ( !v->is_running )
+        imsic_call_on_cpu(v->processor, imsic_local_hgeie_set, &vsfile_data);
+
     /* Set VCPU HSTATUS.VGEIN to new IMSIC VS-file */
     vcpu_guest_cpu_user_regs(v)->hstatus &= ~HSTATUS_VGEIN;
     vcpu_guest_cpu_user_regs(v)->hstatus |=
diff --git a/xen/arch/riscv/include/asm/aia.h b/xen/arch/riscv/include/asm/aia.h
index 8e4eb2f6b14e..6a05bdd8c236 100644
--- a/xen/arch/riscv/include/asm/aia.h
+++ b/xen/arch/riscv/include/asm/aia.h
@@ -12,4 +12,6 @@ void aia_init(void);
 unsigned int vgein_assign(struct vcpu *v);
 void vgein_release(struct vcpu *v, unsigned int vgein_id, unsigned int cpu);
 
+void hgei_interrupt(void);
+
 #endif /* RISCV_AIA_H */
diff --git a/xen/arch/riscv/include/asm/domain.h b/xen/arch/riscv/include/asm/domain.h
index c33d83836f2e..a3fa637b40da 100644
--- a/xen/arch/riscv/include/asm/domain.h
+++ b/xen/arch/riscv/include/asm/domain.h
@@ -69,6 +69,7 @@ struct arch_vcpu {
     register_t hstateen0;
     uint64_t   htimedelta;
     register_t hvip;
+    register_t hie;
 
     register_t vsatp;
     register_t vscause;
diff --git a/xen/arch/riscv/traps.c b/xen/arch/riscv/traps.c
index dc938bae5b00..cf18f5185ff4 100644
--- a/xen/arch/riscv/traps.c
+++ b/xen/arch/riscv/traps.c
@@ -12,9 +12,10 @@
 #include <xen/sched.h>
 #include <xen/softirq.h>
 
-#include <asm/extable.h>
+#include <asm/aia.h>
 #include <asm/cpufeature.h>
 #include <asm/emulate.h>
+#include <asm/extable.h>
 #include <asm/intc.h>
 #include <asm/processor.h>
 #include <asm/riscv_encoding.h>
@@ -273,6 +274,10 @@ void do_trap(struct cpu_user_regs *cpu_regs)
                 timer_interrupt();
                 break;
 
+            case IRQ_S_GEXT:
+                hgei_interrupt();
+                break;
+
             default:
                 intr_handled = false;
                 break;
-- 
2.55.0


