Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D678CA5FC4
	for <xen-devel@archiver.kernel.org>; Wed, 30 Sep 2026 16:24:53 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1437579.1656644 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBx6o-0000AQ-EK; Wed, 30 Sep 2026 16:24:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1437579.1656644; Wed, 30 Sep 2026 16:24:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBx6n-0008Uj-Gx; Wed, 30 Sep 2026 16:24:41 +0000
Received: by outflank-mailman (input) for mailman id 1437579;
 Wed, 30 Sep 2026 16:24:37 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xBx6j-0007a7-2N
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2026 16:24:37 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xBx6i-006O0j-EW
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2026 18:24:36 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6abd37b9-2eae-0a2a0a5409dd-0a2a4508b85c-16
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 18:24:36 +0200
Received: from [74.125.225.98] (helo=mail-wr2-f34.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6abd37c4-f659-0a2a45080019-4a7de162a94e-3
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 18:24:36 +0200
Received: by mail-wr2-f34.google.com with SMTP id
 ffacd0b85a97d-48affb828f1so1009642f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 09:24:36 -0700 (PDT)
Received: from fedora (user-109-243-71-234.play-internet.pl. [109.243.71.234])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a01cd43e66sm14620485e9.2.2026.09.30.09.24.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Sep 2026 09:24:35 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1790785476; x=1791390276; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Kw3g/wSbFjxVE7ZYTroGknebkWPXGwoRkZfsFvlSlNI=;
        b=TsPojjt1V61HODQjTojCizhsvHGGRBpMFSzUEBQeMK+2oRyjyUMJHIRAHWiWClOwGT
         KwtlzmscgWR1DVxCgu5KzoAA2R82WKXqKR0i+mW2luQGCklnMSOReTYM+DVrYtbz/1iA
         Ou+U31DSOwVokToAP0XpN0uEHjkDMUI93iFt3s2ZCJ0DQTlTE51W5qnT5dSmQD2DzDZU
         kChWhxqVUm150t3GdSXIaoB8DNtziZ43PHlN4MH90Zcg6BMgHXok3031NNpz2F+dWRdj
         cNcb2qTOCYKH+FAL0B8gnTq2LpEcpwJyBwtBFAjfZgwTQAZSl6PJomhleUdtR9Txa75h
         Q/lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790785476; x=1791390276;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Kw3g/wSbFjxVE7ZYTroGknebkWPXGwoRkZfsFvlSlNI=;
        b=y8Y4kxPoi1jN2gHFmMi+elLN/mZnVBvcoTBvqWkQ+XAELikg8kkWCcGXijxrlaNLCt
         eR5/6puBRKaFaDbIixH57hHIRadie5PVjw657n3qbYw+SbKba3QpVeJO7eDyr4I+vde4
         wuWPeP/h8lDnJs/Q9g2Dw/6nW+fuYAWlVxVhc91xpmgt7glUs08UwGtj5y1+rkfAi67t
         qRlfHvvscbk1zajYHY+b0xspxUobU2yVAOwueKPLOpgn78N+RIpa3XKLRksHuB0dDLeN
         CMuEj+rXHC9o5EQO2PL8AzOoA8cyl+c0hIhp4twV2LkDTkg6dsVXV8IlT4wtmbNbaUQW
         X/kw==
X-Gm-Message-State: AFuF++kcw/qf6Kht98KBjr9BVFncSuSPL6Crqn2R1CT8E+WeRElLmLxA
	9IjoPbzfCBL2x88ZOECZ1yCP2xaTRvuXba/4bArpe9JaCaNlp/w2DhLvzPItqg==
X-Gm-Gg: AYBFou0PYOoTSrWN/oOaYv6mgYMiSfO/4xePjWukzQFAALl1L2uFyMSy9CABGAfv/wa
	JSkxUFjuUOp9smZyK1/o+ge4Hye1upflU13Zp9VvxFhP8lx5g1JHEbPAaVSmcIynd30PDesu/ni
	S6yi9zbEu9HzJvtYcPHLSV9SmnWkY07HxEhuAoy+P80zEl90FgixJmzcIq0irEtBPhhbCxx11kz
	uBt4Eqx2i4jS4ur75vHVQ+W9/Yvwj4lOv0eZo5ZkbR/Q9fzd28KUywpvp+q/PKLRekdzgqEmeRY
	1B038aAUvnlRVRfAnfFEA8P9EHSM7zFFXrzw7RBxzMfeCoRpYvVfppj1Gjo1TKssn3WSlBkewDa
	pzlus42dhnINK2JDB+1fHe5fr7OhMM/c19WXMDSMjGR+0xDHW8ouFCQi5fBGS+wW6+sg7WK8M6g
	88gHhsoGb6O66Q199oLu2ghI0zydJooRqOndOqi6YUTKOdbV6awn90Ho5Y0S6+Yem2E2wCHu0wY
	JQ0mfmvoz0Tl+aMcyAJ3dXDs7zzf6DpxNSrRen8
X-Received: by 2002:a05:600c:6206:b0:4a0:857:a3a5 with SMTP id 5b1f17b1804b1-4a01b11114dmr34079965e9.16.1790785475771;
        Wed, 30 Sep 2026 09:24:35 -0700 (PDT)
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
Subject: [PATCH v3 31/39] xen/riscv: remap interrupts to new IMSIC VS-file
Date: Wed, 30 Sep 2026 18:23:50 +0200
Message-ID: <45011daea86267b8f4b707bc7de6357b0712fb08.1790779209.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1790779209.git.oleksii.kurochko@gmail.com>
References: <cover.1790779209.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c1860d/1790785476-CE54487B-A1E4B30D/10/73395122804
X-purgate-type: spam
X-purgate-size: 11923

Once the new IMSIC VS-file has been zeroed out, it has to be mapped into
the guest's G-stage in place of the old one. Also, if any interrupts at an
APLIC are forwarded by MSIs to the old interrupt file, reconfigure the
APLIC to send them to the new interrupt file.

Taking a h/w guest interrupt file (assigning it, zeroing it out, mapping
it into G-stage and recording it in the vCPU's IMSIC state) is factored
out into imsic_vsfile_acquire().

The relevant translation tables at all IOMMUs would also have to be
updated so that MSIs for this virtual interrupt file are sent to the new
physical interrupt file, but that is skipped for now as there is no IOMMU
support for RISC-V.

Synchronize with the APLIC to ensure that no straggler MSIs will arrive at
the old interrupt file by running imsic_aplic_sync() on the pCPU which owns
that file.

If the new file can't be mapped into the guest, release the guest
external interrupt number imsic_vsfile_acquire() took for it instead of
leaking it. vgein_release() takes the pCPU explicitly instead of relying
on v->processor, as on migration v->processor already refers to the new
pCPU while the number to be released may belong to the old one.

Keep BUG_ON("unimplemented") placeholder in imsic_migrate_vcpu() to guard
against silent incorrect behaviour or unexpected panics in guest VMs until
the function is fully implemented.

Implement imsic_update_state(), which records the vCPU's guest
interrupt file id together with the pCPU owning the file. The two are
read as a pair, e.g. by imsic_migrate_vcpu() and the IMSIC context
switch hooks, so they are updated under vsfile_lock as a single unit.

imsic_map_guest_file() and vgein_release() are stubs for now.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
imsic_vsfile_acquire() isn't introduced already by "xen/riscv: prepare new
IMSIC VS-file": there, taking the new file is just vgein_assign() and zeroing
the file out. What makes it worth a helper of its own, mapping the file into
the guest, recording it in the vCPU's IMSIC state and releasing it again with
vgein_release() if the mapping fails, only comes with this patch. The helper
is also shared with the first attach of a h/w file in "xen/riscv: introduce
IMSIC h/w interrupt file attaching to vcpu".
---
Changes in v3:
 - Update the commit message.
 - Move imsic_aplic_sync() and imsic_local_is_pending() to "xen/riscv:
   implement APLIC-IMSIC-hart sync barrier for vCPU migration" and only
   call the helper here.
 - compare old_vsfile_cpu against CPU_NONE instead of NR_CPUS.
 - Call vaplic_reconfigure_target() instead of aplic_reconfigure_target().
 - Update the comment at the start of the migration: at that point the new
   IMSIC VS-file is only being prepared, the interrupt producers are moved
   to it later.
 - Factor taking a h/w guest interrupt file (assign, zero out, map into
   G-stage and record in the per-vCPU IMSIC state) out of
   imsic_migrate_vcpu() into imsic_vsfile_acquire(), introduced here
   instead of in "xen/riscv: introduce IMSIC h/w interrupt file attaching
   to vcpu".
 - Crash the domain instead of BUG_ON()ing when no h/w guest interrupt
   file is free, and report which file could not be mapped.
 - Introduce the vgein_release() stub here, together with its first
   user: release the h/w guest interrupt file taken by
   imsic_vsfile_acquire() if mapping it into the guest fails. Drop the
   stray "\n" from its BUG_ON().
 - Clarify the comment ahead of imsic_vsfile_acquire() on why setting
   hstatus.VGEIN is left to the caller.
 - Implement imsic_update_state() here instead of leaving it a stub until
   "xen/riscv: introduce IMSIC h/w interrupt file attaching to vcpu": all
   it needs, vsfile_lock and CPU_NONE, is available already. The s/w
   IMSIC VS-file is recorded with vsfile_cpu == CPU_NONE rather than
   NR_CPUS.
 - Make imsic_update_state() static and drop its declaration from
   asm/imsic.h: imsic_vsfile_acquire() is its only user.
---
Changes in v2:
 - New patch.
---
---
 xen/arch/riscv/aia.c               |   5 ++
 xen/arch/riscv/imsic.c             | 130 +++++++++++++++++++++++++++--
 xen/arch/riscv/include/asm/aia.h   |   1 +
 xen/arch/riscv/include/asm/imsic.h |   2 +
 4 files changed, 130 insertions(+), 8 deletions(-)

diff --git a/xen/arch/riscv/aia.c b/xen/arch/riscv/aia.c
index 229ab4b8678e..bd35078b7354 100644
--- a/xen/arch/riscv/aia.c
+++ b/xen/arch/riscv/aia.c
@@ -30,3 +30,8 @@ unsigned int vgein_assign(struct vcpu *v)
 
     return 0;
 }
+
+void vgein_release(struct vcpu *v, unsigned int vgein_id, unsigned int cpu)
+{
+    BUG_ON("unimplemented");
+}
diff --git a/xen/arch/riscv/imsic.c b/xen/arch/riscv/imsic.c
index 8e0273eab902..47854264edf3 100644
--- a/xen/arch/riscv/imsic.c
+++ b/xen/arch/riscv/imsic.c
@@ -29,6 +29,7 @@
 #include <asm/aia.h>
 #include <asm/aplic.h>
 #include <asm/imsic.h>
+#include <asm/vaplic.h>
 
 #define IMSIC_HART_SIZE(guest_bits) (BIT(guest_bits, U) * IMSIC_MMIO_PAGE_SZ)
 
@@ -156,6 +157,18 @@ unsigned int vcpu_guest_file_id(const struct vcpu *v)
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
@@ -462,6 +475,11 @@ void cf_check imsic_ctxt_switch_to(struct vcpu *n)
     /* Nothing to do */
 }
 
+int imsic_map_guest_file(struct vcpu *v, unsigned int vsfile_id)
+{
+    return -EOPNOTSUPP;
+}
+
 int cf_check vcpu_imsic_init(struct vcpu *v)
 {
     struct vimsic_state *imsic_state;
@@ -882,11 +900,71 @@ int __init vimsic_make_domu_dt_node(struct kernel_info *kinfo,
     return fdt_end_node(fdt);
 }
 
+/*
+ * Take a h/w guest interrupt file on the pCPU @v runs on and make it the
+ * vCPU's one.
+ *
+ * hstatus.VGEIN is deliberately left alone: it must only point at a file
+ * which already holds the vCPU's interrupt state. The file taken here is
+ * zeroed, so for imsic_migrate_vcpu() hstatus.VGEIN can only be updated once
+ * the state of the old file has been copied into it. Hence it is up to the
+ * caller to set hstatus.VGEIN at the right moment.
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
+    imsic_call_on_cpu(cpu, imsic_vsfile_local_clear, &vsfile_data);
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
+    imsic_update_state(v, vsfile_id);
+
+    return vsfile_id;
+}
+
 void imsic_migrate_vcpu(struct vcpu *v)
 {
     struct imsic_vsfile_data vsfile_data = {
         .nr_eix = imsic_cfg.nr_eix,
     };
+    struct vimsic_state *imsic_state = v->arch.vimsic_state;
+    unsigned long flags;
+    unsigned int old_vsfile_id;
+    unsigned int old_vsfile_cpu;
 
     /*
      * The scheduler can mark a freshly created vCPU's unit as migrated and
@@ -898,21 +976,57 @@ void imsic_migrate_vcpu(struct vcpu *v)
     if ( v->arch.last_cpu == CPU_NONE )
         return;
 
+    read_lock_irqsave(&imsic_state->vsfile_lock, flags);
+    old_vsfile_id = imsic_state->guest_file_id;
+    old_vsfile_cpu = imsic_state->vsfile_cpu;
+    read_unlock_irqrestore(&imsic_state->vsfile_lock, flags);
+
+    /*
+     * We don't support SW interrupt files at the moment. Bail out before
+     * anything is touched, as the old file has no owning pCPU in that case
+     * and there is nothing to retarget the producers away from.
+     */
+    if ( old_vsfile_cpu == CPU_NONE )
+        panic("IMSIC SW-file isn't supported\n");
+
     /*
      * At this point, all interrupt producers are still using the old IMSIC
-     * VS-file.
+     * VS-file. Allocate and clear the new one before redirecting anything
+     * to it.
      */
 
-    vsfile_data.hgei = vgein_assign(v);
+    /* Zero-out, map and start to use the new IMSIC VS-file */
+    vsfile_data.hgei = imsic_vsfile_acquire(v);
+    if ( !vsfile_data.hgei )
+        return;
 
-    /* We don't support SW interrupt files at the moment. */
-    BUG_ON(!vsfile_data.hgei);
+    /*
+     * TODO: Modify the relevant translation tables at all IOMMUs so that MSIs
+     *       for this virtual interrupt file are now sent to the new physical
+     *       interrupt file.
+     */
+    if ( iommu_enabled )
+        printk_once("IMSIC: IOMMU MSI retargeting is not implemented\n");
 
-    /* Zero-out new IMSIC VS-file */
-    imsic_call_on_cpu(v->processor, imsic_vsfile_local_clear, &vsfile_data);
+    /*
+     * If any interrupts at an APLIC are forwarded by MSIs to the old interrupt
+     * file, reconfigure the APLIC to send them to the new interrupt file.
+     */
+    vaplic_reconfigure_target(v);
 
-    /* Avoid an unused-function error until the barrier has a user. */
-    (void)imsic_aplic_sync;
+    /*
+     * Synchronizing interactions between a hart and the APLIC.
+     *
+     * The MSIs to be flushed are the ones still on their way to the old
+     * interrupt file, so the barrier has to be done by the pCPU which owns
+     * that file.
+     */
+    imsic_call_on_cpu(old_vsfile_cpu, imsic_aplic_sync, NULL);
+
+    /*
+     * At this point, all interrupt producers have been moved
+     * to the new IMSIC VS-file.
+     */
 
     BUG_ON("unimplemented");
 }
diff --git a/xen/arch/riscv/include/asm/aia.h b/xen/arch/riscv/include/asm/aia.h
index 53a1efb042f8..8e4eb2f6b14e 100644
--- a/xen/arch/riscv/include/asm/aia.h
+++ b/xen/arch/riscv/include/asm/aia.h
@@ -10,5 +10,6 @@ bool aia_usable(void);
 void aia_init(void);
 
 unsigned int vgein_assign(struct vcpu *v);
+void vgein_release(struct vcpu *v, unsigned int vgein_id, unsigned int cpu);
 
 #endif /* RISCV_AIA_H */
diff --git a/xen/arch/riscv/include/asm/imsic.h b/xen/arch/riscv/include/asm/imsic.h
index f86407e21765..e08b041eebbd 100644
--- a/xen/arch/riscv/include/asm/imsic.h
+++ b/xen/arch/riscv/include/asm/imsic.h
@@ -114,6 +114,8 @@ int vimsic_make_domu_dt_node(struct kernel_info *kinfo, unsigned int *phandle);
 void imsic_ctxt_switch_from(struct vcpu *p);
 void imsic_ctxt_switch_to(struct vcpu *n);
 
+int imsic_map_guest_file(struct vcpu *v, unsigned int vsfile_id);
+
 void imsic_migrate_vcpu(struct vcpu *v);
 
 #endif /* ASM_RISCV_IMSIC_H */
-- 
2.55.0


