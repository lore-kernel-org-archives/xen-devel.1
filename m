Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA9F3C61DC4
	for <xen-devel@archiver.kernel.org>; Thu, 27 Aug 2026 15:23:07 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1401025.1636841 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzbwH-0001b4-RE; Thu, 27 Aug 2026 15:22:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1401025.1636841; Thu, 27 Aug 2026 15:22:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzbwG-0001Wq-Dn; Thu, 27 Aug 2026 15:22:48 +0000
Received: by outflank-mailman (input) for mailman id 1401025;
 Thu, 27 Aug 2026 15:22:36 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wzbw3-0007Lt-GE
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2026 15:22:35 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wzbw2-003O3L-SN
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2026 17:22:34 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a905626-e002-0a2a0a5209dd-0a2a4501aa5e-26
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 17:22:34 +0200
Received: from [209.85.128.52] (helo=mail-wm1-f52.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a90563a-5984-0a2a45010019-d1558034c120-3
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 17:22:34 +0200
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-49b8687630fso5778555e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 08:22:34 -0700 (PDT)
Received: from fedora (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49b4b2d6b30sm57441155e9.14.2026.08.27.08.22.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Aug 2026 08:22:33 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1787844154; x=1788448954; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2bqWbi5fbwW7bQ22v8Kh1i+e8YYjZtzF8u1P+wqOQN0=;
        b=SdHcURTH82LQCd068xWLy7cZNwdfsWxdUUBqjmYJ7xvAuk1hICfQ5CrrcATRQSAn4D
         IviPGuNbX2rBnk8jlxV3b8RcSoM+vDI73V/li2vDAJhLtugzLSt9mP8BDEuFXTqPB4hE
         iaAMuZDnsNPZAxbU0O22TiFgPB6O9EpLubUByH0kmXa/t4aGC/966WFuGDSX7gazx2X3
         p1m1hJtPu3P8UMIvSFBgV8FqryItame7eriCfQWy2hCi2l+zvFluGZ4OpvXhDzrbmtAQ
         xwVwyKGl8urRtibpnaa0HUc56ZnKmilexR7d/WT7HstBx/hSI63uKqPdWqoSQ6JPqAMt
         AVlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787844154; x=1788448954;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2bqWbi5fbwW7bQ22v8Kh1i+e8YYjZtzF8u1P+wqOQN0=;
        b=hFsk3rA/T+xE1OpVrwv7i1nzc1MUZpdwlYcfdjmPS3Bpy7zG+2jLJcSdPDgPd917bq
         oQlm93dPsJOzxfCxrcU0grLuSS8Ox3crbkWgNJvGpPS1QyY4yB1yfEAvRPIHVZ/TN6tN
         S6M9vjRs+Kvqu7f7Jpa+FkSZhen0mhgzyXfmt9fN3GfLPRE5G53fcQItHmzJs0seJYW4
         PfaqrbUtpbWowYAI0oOCXXIqA+whVwaiTLwRL1iQqrgcXVgdWvKESy6XnGAhjm7StDuA
         frEhj56oAInS9GkSxiitaxrG1wvRKNqHR1+ADinwqcGZ6nplayPtChtshQiaUCi6Bya2
         y2Rw==
X-Gm-Message-State: AFuF++nJ4BfP4B37+WC2h+vHgQtOwPme+r6SBWznovVT2pswYp5m7D+Z
	GXfJ9CZqNztFd/N28+n04eSTsT30Olv+ZsQ8ETq2ey4OH45NrM4z5+ajodcNow==
X-Gm-Gg: AR+sD130JRvKkZhfYFsMvFP9dCLO6dCk3XE0OOhCM4wROq++DvKLglmnEp31eHilqRt
	bt2G0dXML3sdAufPpcqwmlkf3+PPBJ6BhqcDA6a+eyONHLa3v7irRLKPTOA35b92hZWBBvpY1bw
	gscibEz2s7DOT6hszx5SWF5nkJp1ftTUf8AfMzoVTEQnOeo3LG0aW2gawM7aQxoVGLNpjo4W8K2
	GoXvM+1dXowWiIBRZcqwlvTEM3alHVXSkYfmlftABcPRKkjqr9tYx/1F6ooIpkKXKxWK8rwMSvR
	Jk4gnboT/pntS3WM/V/WuZ0XzEMFGOxWYioN7Fh105whLcN29PBAyRKJhDmox1r65NGwc7pHrHK
	a4vxqJTu5Ysg9ElI81AHY+6tzz+gsac1bcVm5Q+fqdycsvRPaKyOcF+MJQD7GkgWMs6FzP6jFbV
	9ax305TM1/A8JqBOZIK/tWMR6TmOBCF2IDvaek6TptXXT5n1OqNKkOXv8eABY6wPzGHmtziU2f+
	uFxfK5k/uCYoSu6sz+6rUx8CAfPh3Mw
X-Received: by 2002:a05:600c:a43:b0:497:fecd:5b00 with SMTP id 5b1f17b1804b1-499dc717e27mr174641215e9.9.1787844154137;
        Thu, 27 Aug 2026 08:22:34 -0700 (PDT)
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
Subject: [PATCH v2 36/39] xen/riscv: wake up a descheduled vCPU on a guest external interrupt
Date: Thu, 27 Aug 2026 17:21:20 +0200
Message-ID: <ed5a8b4d8137d9ce2f291956d19fbeaf61cce7a9.1787838835.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1787838835.git.oleksii.kurochko@gmail.com>
References: <cover.1787838835.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d62444/1787844154-BEA66757-6A65D1A5/10/73395122804
X-purgate-type: spam
X-purgate-size: 10845

While a vCPU is running, MSIs written to its h/w IMSIC guest interrupt
file are delivered straight to VS-mode. Once the vCPU is descheduled
nobody observes that file anymore, so a guest blocked on such an
interrupt would stay blocked until some unrelated event happens to
schedule it again.

Let Xen observe the file in that window: on deschedule set the vCPU's
bit in HGEIE, which turns an interrupt pending in its VS-file into an
HS-level SGEI, and clear the bit again on schedule-in. HGEIP only
reports a file number, so to get from it back to a vCPU keep an
owners[] map per pCPU, filled by vgein_{assign,release} alongside the
VGEIN bitmap, and kick the vCPU it points at.

v->arch.hie is only initialized here and is written to the CSR later,
on the context switch to the vCPU.

vgein_release() still has no caller: a vCPU going away has to both free
its VGEIN slot and drop the owners[] entry, but there is no vCPU
teardown path to hook it into yet. vgein_deinit() only covers a pCPU
going offline.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in v2:
 - New patch.
---
---
 xen/arch/riscv/aia.c                | 52 +++++++++++++++++++++++++--
 xen/arch/riscv/domain.c             |  3 ++
 xen/arch/riscv/imsic.c              | 55 ++++++++++++++++++++++++++++-
 xen/arch/riscv/include/asm/aia.h    |  2 ++
 xen/arch/riscv/include/asm/domain.h |  1 +
 xen/arch/riscv/traps.c              |  7 +++-
 6 files changed, 115 insertions(+), 5 deletions(-)

diff --git a/xen/arch/riscv/aia.c b/xen/arch/riscv/aia.c
index 1aca07c2f70f..9642a9796ead 100644
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
 
@@ -62,23 +69,25 @@ static int cf_check cpu_callback(struct notifier_block *nfb,
                                  unsigned long action, void *hcpu)
 {
     unsigned int cpu = (unsigned long)hcpu;
-    int rc = 0;
 
     switch ( action )
     {
     case CPU_STARTING:
-        rc = vgein_init();
+    {
+        int rc = vgein_init();
+
         if ( rc )
             printk(XENLOG_ERR "AIA: failed to init vgein for CPU%u: %d\n",
                    cpu, rc);
         break;
+    }
 
     case CPU_DYING:
         vgein_deinit();
         break;
     }
 
-    return notifier_from_errno(rc);
+    return NOTIFY_DONE;
 }
 
 static struct notifier_block cpu_nfb = {
@@ -138,7 +147,10 @@ unsigned int vgein_assign(struct vcpu *v)
     if ( vgein_id > vgein->geilen )
         vgein_id = 0;
     else
+    {
         __set_bit(vgein_id, bmp);
+        vgein->owners[vgein_id] = v;
+    }
 
     spin_unlock_irqrestore(&vgein->lock, flags);
 
@@ -161,6 +173,7 @@ void vgein_release(struct vcpu *v, unsigned int vgein_id, unsigned int cpu)
     spin_lock_irqsave(&vgein->lock, flags);
     if ( !__test_and_clear_bit(vgein_id, &vgein->bmp) )
         ASSERT_UNREACHABLE();
+    vgein->owners[vgein_id] = NULL;
     spin_unlock_irqrestore(&vgein->lock, flags);
 
 #ifdef VGEIN_DEBUG
@@ -168,3 +181,36 @@ void vgein_release(struct vcpu *v, unsigned int vgein_id, unsigned int cpu)
             __func__, v, vgein_id, cpu, vgein->bmp);
 #endif
 }
+
+void hgei_interrupt(void)
+{
+    unsigned long hgei_mask, flags;
+    struct vgein_ctrl *vgein = &this_cpu(vgein);
+
+    hgei_mask = csr_read(CSR_HGEIP) & csr_read(CSR_HGEIE);
+    csr_clear(CSR_HGEIE, hgei_mask);
+
+    spin_lock_irqsave(&vgein->lock, flags);
+
+    for_each_set_bit ( guest_file_id, hgei_mask )
+    {
+        /*
+         * guest_file_id shouldn't be zero, as it will indicate that no
+         * guest external interrupt source is selected for VS-level external
+         * interrupts.
+         */
+        ASSERT(guest_file_id);
+
+        if ( vgein->owners[guest_file_id] )
+        {
+#ifdef VGEIN_DEBUG
+            gprintk(XENLOG_DEBUG, "%s: kick ->%pv, hgei_mask(%#lx)\n",
+                    __func__, vgein->owners[guest_file_id], hgei_mask);
+#endif
+
+            vcpu_kick(vgein->owners[guest_file_id]);
+        }
+    }
+
+    spin_unlock_irqrestore(&vgein->lock, flags);
+}
diff --git a/xen/arch/riscv/domain.c b/xen/arch/riscv/domain.c
index 2dfe4c2e72ce..29181968224c 100644
--- a/xen/arch/riscv/domain.c
+++ b/xen/arch/riscv/domain.c
@@ -136,6 +136,8 @@ static void vcpu_csr_init(struct vcpu *v)
         v->arch.hstateen0 = (hstateen0 & csr_masks.hstateen0) |
                             csr_masks.ro_one.hstateen0;
     }
+
+    v->arch.hie = MIP_SGEIP;
 }
 
 static void continue_new_vcpu(struct vcpu *prev)
@@ -398,6 +400,7 @@ static void restore_csr_regs(struct vcpu *vcpu)
     csr_write(CSR_HEDELEG, vcpu->arch.hedeleg);
     csr_write(CSR_HIDELEG, vcpu->arch.hideleg);
     csr_write(CSR_HVIP, vcpu->arch.hvip);
+    csr_write(CSR_HIE, vcpu->arch.hie);
     csr_write64(CSR_HENVCFG, vcpu->arch.henvcfg);
     csr_write(CSR_HCOUNTEREN, vcpu->arch.hcounteren);
     csr_write64(CSR_HTIMEDELTA, vcpu->arch.htimedelta);
diff --git a/xen/arch/riscv/imsic.c b/xen/arch/riscv/imsic.c
index d7b137a1f559..07152066116a 100644
--- a/xen/arch/riscv/imsic.c
+++ b/xen/arch/riscv/imsic.c
@@ -510,12 +510,31 @@ void cf_check imsic_ctxt_switch_from(struct vcpu *v)
 
     write_lock_irqsave(&imsic_state->vsfile_lock, flags);
     imsic_state->vsfile_cpu = v->processor;
+    /*
+     * Start to observe the VS-file from HS-mode: while the vCPU isn't
+     * running an interrupt pending in its VS-file is reported through HGEIP
+     * instead of being delivered to VS-mode, which lets Xen wake the vCPU up.
+     */
+    csr_set(CSR_HGEIE, BIT(imsic_state->guest_file_id, UL));
     write_unlock_irqrestore(&imsic_state->vsfile_lock, flags);
 }
 
 void cf_check imsic_ctxt_switch_to(struct vcpu *v)
 {
-    /* Nothing to do */
+    struct vimsic_state *imsic_state = v->arch.vimsic_state;
+    unsigned long flags;
+
+    /* A s/w VS-file is never observed through HGEIP. */
+    if ( !vcpu_guest_file_id(v) )
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
@@ -646,6 +665,12 @@ static void cf_check imsic_vsfile_local_read_clear(void *data)
     struct imsic_mrif *mrif = idata->mrif;
     unsigned long new_hstatus, old_hstatus, old_vsiselect;
 
+    /*
+     * The HGEIE bit imsic_ctxt_switch_from() armed belongs to the old owner
+     * only.
+     */
+    csr_clear(CSR_HGEIE, BIT(idata->hgei, UL));
+
     old_vsiselect = csr_read(CSR_VSISELECT);
     old_hstatus = csr_read(CSR_HSTATUS);
     new_hstatus = old_hstatus & ~HSTATUS_VGEIN;
@@ -991,6 +1016,21 @@ int __init vimsic_make_domu_dt_node(struct kernel_info *kinfo,
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
@@ -1144,6 +1184,19 @@ void imsic_migrate_vcpu(struct vcpu *v)
     vsfile_data.mrif = &tmrif;
     imsic_call_on_cpu(new_vsfile_cpu, imsic_vsfile_local_update, &vsfile_data);
 
+    /*
+     * A vCPU which isn't going to run right away (a cpupool move, or a
+     * migration of a vCPU which isn't runnable) is never switched in, so
+     * nobody would arm HGEIE for the new interrupt file and the state just
+     * restored into it would stay invisible to Xen until the vCPU is switched
+     * out the next time, losing the wake up it is meant to cause.
+     *
+     * For a vCPU which is about to run imsic_ctxt_switch_to() clears the bit
+     * anyway, as interrupts are then delivered to the vCPU directly.
+     */
+    if ( !v->is_running )
+        imsic_call_on_cpu(new_vsfile_cpu, imsic_local_hgeie_set, &vsfile_data);
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
index 23e301782068..6d5eafdf5522 100644
--- a/xen/arch/riscv/include/asm/domain.h
+++ b/xen/arch/riscv/include/asm/domain.h
@@ -72,6 +72,7 @@ struct arch_vcpu {
     register_t hvip;
     uint64_t   hviprio1;
     uint64_t   hviprio2;
+    register_t hie;
 
     register_t vsatp;
     register_t vscause;
diff --git a/xen/arch/riscv/traps.c b/xen/arch/riscv/traps.c
index f5f83fce10ba..b08cf2ff2e31 100644
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


