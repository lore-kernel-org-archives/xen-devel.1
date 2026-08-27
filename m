Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B96DEC61DC4
	for <xen-devel@archiver.kernel.org>; Thu, 27 Aug 2026 15:22:49 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1401007.1636803 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzbw8-0008CI-BZ; Thu, 27 Aug 2026 15:22:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1401007.1636803; Thu, 27 Aug 2026 15:22:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzbw7-000871-L8; Thu, 27 Aug 2026 15:22:39 +0000
Received: by outflank-mailman (input) for mailman id 1401007;
 Thu, 27 Aug 2026 15:22:31 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wzbvy-0006J9-6x
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2026 15:22:30 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wzbvx-003O3L-Fa
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2026 17:22:29 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a905626-e002-0a2a0a5209dd-0a2a4501aa5e-20
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 17:22:29 +0200
Received: from [209.85.128.47] (helo=mail-wm1-f47.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a905635-5984-0a2a45010019-d155802fd877-3
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 17:22:29 +0200
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-49b0d78a801so11444405e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 08:22:29 -0700 (PDT)
Received: from fedora (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49b4b2d6b30sm57441155e9.14.2026.08.27.08.22.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Aug 2026 08:22:28 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1787844149; x=1788448949; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C2iZ2nZklExeYYf8IYKOjHglR9wLR44Pru73TEFSVXg=;
        b=cGh7ElNUuJ48dZeu0lrP3my/bRF92JulA0y/hp9Ny/x+eugzHE1IjtCaOH3NL/ZbI9
         gTnUotRAYc4ByegxBH+Ed1qGXCc8pdh2HUNcDCe6088T4WUEPctjqQYMqDPmulI10UVQ
         K9o4XEM6mueR2gKVwmrg+S0yAC86M0hiZQH7xyxphRAIRq8fS81J5RckaRErtr/SjLcM
         kl4ZcWDKCq10/lG5112WUvoxlHcF2dPZmv/m3F9x7EDjf7akFNokHZ1N1zE6/8aC2I4Z
         ibwoATCWox2Z1ADXRVCAE2ujS1pNiq3QY2rka1stwFd/m+uXKyDqNvQmrrgJDlDUZBWw
         XA+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787844149; x=1788448949;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=C2iZ2nZklExeYYf8IYKOjHglR9wLR44Pru73TEFSVXg=;
        b=dWP8bvbdlcTPIg83EEqigmlD/OrBNr7iar3q1rUkSXiU9rpdbGsnJD64kzlJTk0DAm
         icCqa5v+75QmhKa89od/TLHFl7+YRsZeM0R0z30+HGL9FXuj8rFsJeXLkFF5F9uO6Qb5
         cJ4EzSjWfnYSPbtWo4C7mWxObV6ORahZzWNp5nPYCiP5bQ0vdR1vnLaREzMu5u1kXBRd
         PC1zBiBtGhAUfzX80AdQIsYafgCo6iV4asIH87t00g8m3GxUzlfnXdE2zgLuPSaGZgvc
         kvMhtPeJ5BODFAfvBpjf2PdOAfzQxqAD+5ORCSbIxYBOgl28Y9LBh6Vbfwn4LiIZKUR6
         eeZw==
X-Gm-Message-State: AFuF++mu+iY4bgMLRyMm2Ac/n2thMnxQB1zyYtVTd13GvOT26dd/4hmd
	uJUUbNUsKiV+5w/6/XsF6vlskN9YZbD7+xq6TDB9abK4Ib9OgteyzRT+0OlcFg==
X-Gm-Gg: AR+sD12OPMj5p2Et7/ytT/g17gRCPPXyqonoFP8ZExKkrDmtvp8vAZc4HCKx1x1caLB
	1FIljpVhIoWHF7+JZcbyzXTEpDZlvNvXbeGBuRB/Zvsl2uCecmlhKQbmyx3DaMSboZ+wA75k0rp
	CILS2/ZWQHC2SbfvPxlMMQmtOYPEaD1ipf+cZc9QeXfSG2bsTtXXHIRPTxX703WkdH+k5mDoyQG
	trTXPpuryRL75HwxZX5/mR52vaVEbFQhzF/I/nDmyFKoy/mpsLFLgAG1ClSRokjI95z3Dvg3X58
	j9Xn4IOpMYFrgOCqyd1bMnI1LszmjyD1ShomGr4epGbpNHY4ZhEvA2+Z8sdRlMLcCkLULx8c6r1
	0JNA/H+Aiq61eNkgxF8uyEn1x0SpsMZ9iz2GnzlEIMLVUk6Lz2JO5wdQB3xBngoJwH2Jn0UgISr
	EkIjwLOpy0c7Q74goNyDUN1jOzF/4KlpbPL5S0Co/gDxN4oYPv4Wl3KgwC6Xyp1wM3uL707xpu1
	8euq9+E3yvEPZK3Uo3llnZ0z464RGHA
X-Received: by 2002:a05:600c:860b:b0:499:726a:a017 with SMTP id 5b1f17b1804b1-499dc6e0040mr198008185e9.1.1787844148669;
        Thu, 27 Aug 2026 08:22:28 -0700 (PDT)
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
Subject: [PATCH v2 32/39] xen/riscv: remap interrupts to new IMSIC VS-file
Date: Thu, 27 Aug 2026 17:21:16 +0200
Message-ID: <948e94b6610586b84626c98da033d301335dc7b0.1787838835.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1787838835.git.oleksii.kurochko@gmail.com>
References: <cover.1787838835.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d62444/1787844149-BD87F757-2926A577/10/73395122804
X-purgate-type: spam
X-purgate-size: 8276

After new IMSIC VS-file is zeroed-out it is necessary to do G-stage remaping
fo new IMSIC VS-file. Also, if any interrupts at an APLIC are forwarded by
MSIs to the old interrupt file, reconfigure the APLIC to send them to the
new interrupt file.

Generally it is needed also to modify the relevant translation tables at
all IOMMUs so that MSIs for this virtual interrupt file are now sent to
the new physical interrupt file but it is skipped for now there is no IOMMU
support for RISC-V.

Synchronize with APLIC to ensure that no straggler MSIs will arrive at
the old interrupt file by using of aplic_genmsi_barrier().

Technically there is no need for read_lock_irqsave() and
read_unlock_irqrestore() around reading of ->guest_file_id, as a write
cannot happen in parallel: any update to ->guest_file_id for a vCPU
will happen either in imsic_migrate_vcpu() itself or before the vCPU
first gains control (in continue_new_vcpu()), so there is no concurrent
access to it in imsic_migrate_vcpu(). The lock is added here for
potential future cases.

Keep BUG_ON("unimplemented") placeholder in imsic_migrate_vcpu() to guard
against silent incorrect behaviour or unexpected panics in guest VMs until
the function is fully implemented.

imsic_map_guest_file() and imsic_update_state() are stubs for now and will
be introduced later in a separate patch.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in v2:
 - New patch.
---
---
 xen/arch/riscv/imsic.c             | 103 +++++++++++++++++++++++++++++
 xen/arch/riscv/include/asm/imsic.h |   3 +
 2 files changed, 106 insertions(+)

diff --git a/xen/arch/riscv/imsic.c b/xen/arch/riscv/imsic.c
index 5de45949610d..5e9f6995e443 100644
--- a/xen/arch/riscv/imsic.c
+++ b/xen/arch/riscv/imsic.c
@@ -27,6 +27,7 @@
 #include <xen/xvmalloc.h>
 
 #include <asm/aia.h>
+#include <asm/aplic.h>
 #include <asm/imsic.h>
 
 #define IMSIC_HART_SIZE(guest_bits) (BIT(guest_bits, U) * IMSIC_MMIO_PAGE_SZ)
@@ -60,6 +61,12 @@ static unsigned int __ro_after_init guest_num_msis;
 #define IMSIC_DISABLE_EITHRESHOLD   1
 #define IMSIC_ENABLE_EITHRESHOLD    0
 
+#define imsic_csr_read(c)           \
+({                                  \
+    csr_write(CSR_SISELECT, (c));   \
+    csr_read(CSR_SIREG);            \
+})
+
 #define imsic_csr_write(c, v)   \
 do {                            \
     csr_write(CSR_SISELECT, c); \
@@ -141,6 +148,11 @@ unsigned int vcpu_guest_file_id(const struct vcpu *v)
     return ACCESS_ONCE(v->arch.vimsic_state->guest_file_id);
 }
 
+void imsic_update_state(struct vcpu *v, unsigned int guest_file_id)
+{
+    BUG_ON("unimplemented\n");
+}
+
 void __init imsic_ids_local_delivery(bool enable)
 {
     if ( enable )
@@ -242,6 +254,15 @@ void imsic_irq_disable(unsigned int irq)
     spin_unlock(&imsic_cfg.lock);
 }
 
+static bool imsic_local_is_pending(unsigned int id)
+{
+    unsigned long isel =
+        (id / BITS_PER_LONG) * (BITS_PER_LONG / IMSIC_EIPx_BITS) + IMSIC_EIP0;
+    unsigned long bit = BIT(id % BITS_PER_LONG, UL);
+
+    return !!(imsic_csr_read(isel) & bit);
+}
+
 /* Callers aren't intended to changed imsic_cfg so return const. */
 const struct imsic_config *imsic_get_config(void)
 {
@@ -436,6 +457,11 @@ void cf_check imsic_ctxt_switch_to(struct vcpu *v)
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
@@ -497,6 +523,27 @@ static void imsic_call_on_cpu(unsigned int cpu, void (*func)(void *),
         on_selected_cpus(cpumask_of(cpu), func, data, 1);
 }
 
+/*
+ * Ensure that all the MSIs the APLIC has already generated for the hart this
+ * runs on have really reached the hart's IMSIC.
+ *
+ * The barrier is the one described by the AIA specification in
+ * "Synchronizing interactions between a hart and the APLIC": ask the APLIC to
+ * send an MSI to the hart itself and wait until it shows up as pending in the
+ * hart's own interrupt file. As it says nothing about MSIs on their way to
+ * any other hart, it has to be executed by the pCPU owning the interrupt file
+ * the MSIs were being sent to.
+ */
+static void cf_check imsic_aplic_sync(void *data)
+{
+    imsic_local_eix_update(imsic_cfg.sync_id, 1, true, false);
+
+    aplic_genmsi_barrier();
+
+    while ( !imsic_local_is_pending(imsic_cfg.sync_id) )
+        cpu_relax();
+}
+
 static void cf_check imsic_vsfile_local_clear(void *data)
 {
     unsigned int i;
@@ -837,6 +884,10 @@ void imsic_migrate_vcpu(struct vcpu *v)
     struct imsic_vsfile_data vsfile_data = {
         .nr_eix = nr_hw_eix,
     };
+    struct vimsic_state *imsic_state = v->arch.vimsic_state;
+    unsigned long flags;
+    unsigned int old_vsfile_id;
+    unsigned int old_vsfile_cpu;
 
     /*
      * The scheduler can mark a freshly created vCPU's unit as migrated and
@@ -848,8 +899,22 @@ void imsic_migrate_vcpu(struct vcpu *v)
     if ( v->arch.last_cpu == NR_CPUS )
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
+    if ( old_vsfile_cpu == NR_CPUS )
+        panic("IMSIC SW-file isn't supported\n");
+
     /*
      * At this point, all interrupt producers are still using the old IMSIC
+     * VS-file so we first move all interrupt producers to the new IMSIC
      * VS-file.
      */
 
@@ -870,5 +935,43 @@ void imsic_migrate_vcpu(struct vcpu *v)
     /* Zero-out new IMSIC VS-file */
     imsic_call_on_cpu(new_vsfile_cpu, imsic_vsfile_local_clear, &vsfile_data);
 
+    /* Update G-stage mapping for the new IMSIC VS-file */
+    if ( imsic_map_guest_file(v, new_vsfile_hgei) )
+    {
+        domain_crash(v->domain, "Migration to hw interrupt file failed\n");
+
+        return;
+    }
+
+    imsic_update_state(v, new_vsfile_hgei);
+
+    /*
+     * TODO: Modify the relevant translation tables at all IOMMUs so that MSIs
+     *       for this virtual interrupt file are now sent to the new physical
+     *       interrupt file.
+     */
+    if ( iommu_enabled )
+        printk_once("IMSIC: IOMMU MSI retargeting is not implemented\n");
+
+    /*
+     * If any interrupts at an APLIC are forwarded by MSIs to the old interrupt
+     * file, reconfigure the APLIC to send them to the new interrupt file.
+     */
+    aplic_reconfigure_target(v, old_vsfile_id, old_vsfile_cpu);
+
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
+
     BUG_ON("unimplemented");
 }
diff --git a/xen/arch/riscv/include/asm/imsic.h b/xen/arch/riscv/include/asm/imsic.h
index 6ea2e4b8ca12..6395b539c52d 100644
--- a/xen/arch/riscv/include/asm/imsic.h
+++ b/xen/arch/riscv/include/asm/imsic.h
@@ -114,12 +114,15 @@ void imsic_ids_local_delivery(bool enable);
 int vcpu_imsic_init(struct vcpu *v);
 void vcpu_imsic_deinit(struct vcpu *v);
 unsigned int vcpu_guest_file_id(const struct vcpu *v);
+void imsic_update_state(struct vcpu *v, unsigned int guest_file_id);
 
 int vimsic_make_domu_dt_node(struct kernel_info *kinfo, unsigned int *phandle);
 
 void imsic_ctxt_switch_from(struct vcpu *v);
 void imsic_ctxt_switch_to(struct vcpu *v);
 
+int imsic_map_guest_file(struct vcpu *v, unsigned int vsfile_id);
+
 void imsic_migrate_vcpu(struct vcpu *v);
 
 #endif /* ASM_RISCV_IMSIC_H */
-- 
2.55.0


