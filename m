Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF87CC61DB9
	for <xen-devel@archiver.kernel.org>; Thu, 27 Aug 2026 15:23:04 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1401034.1636866 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzbwO-0002x1-5p; Thu, 27 Aug 2026 15:22:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1401034.1636866; Thu, 27 Aug 2026 15:22:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzbwM-0002q2-Nn; Thu, 27 Aug 2026 15:22:54 +0000
Received: by outflank-mailman (input) for mailman id 1401034;
 Thu, 27 Aug 2026 15:22:40 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wzbw7-00084E-DC
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2026 15:22:39 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wzbw6-00GwJA-P4
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2026 17:22:38 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a90563b-bab6-0a2a0a5309dd-0a2a4507d6aa-6
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 17:22:38 +0200
Received: from [209.85.128.47] (helo=mail-wm1-f47.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a90563e-b4ea-0a2a45070019-d155802fe169-3
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 17:22:38 +0200
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-49554ebb87dso21865525e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 08:22:38 -0700 (PDT)
Received: from fedora (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49b4b2d6b30sm57441155e9.14.2026.08.27.08.22.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Aug 2026 08:22:37 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1787844158; x=1788448958; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ectEPOeVMacpPQ0PahqNUgVXssdptDzQr1HvL6IKR+M=;
        b=Ot+G2rScBjlquD70Hjnbz6Whkebbq9oaCxDsmguGYYJCL6cEgWyku9DLlDbep2EbpE
         kJnvnCuEyh565YoDpyfy7nv78KyT/5d6dRNhGST9Hx5GNG35AlgGJ9EPEFdoynh//DuT
         MRsnYg9V3+vnpnA/Q0xTMR7sH3loqNQRSv9BCM+6UsTUCgiG/aX1skp7BkNifnVpW8vf
         PuWmAU/PIDe70YhMILsBQjgy+D4P2WxXFMxcHdzF0r8rXyM+9sVXiwCEwJptVLRH+Utm
         T7Tsb+PZzLuhHV/4xA/zId5OlAFMQl6/eLt3+YhTzmcgE4NkgNaHbCjrlsQO6prUsj2j
         Cp7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787844158; x=1788448958;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ectEPOeVMacpPQ0PahqNUgVXssdptDzQr1HvL6IKR+M=;
        b=Mbe3JlHAjiTrc06wbHE9pw929tOGHBMh3yrrYBf/2+tdLP3MmfclAf5N+OLcuKaKS+
         3h5YMbl814arkWIsk5ZjhAu19fMr4BzOjvSC+g0+TrETt8+g7ILHZc23OC3c0xOBKm9R
         YWmkQhhpX90KQ6dWWRq8AlhCrUJea5MzhnmcH8T9HQj5mFCBAa2/jdHb2Wr77cdEgoUf
         9fI5Nr/2BDSLwXwZ4gy+1ki3EJ+/U0+WFVIJn/0onz5ME/BdxwgDIaQ+JGTtGetS/f8G
         jd6yCFUBUCe7VA3dHNzSLlDzdekLon7Sam1gZ+xfYvr5nqSCJc+86/oL+nYSMPxxbp/u
         Wxmg==
X-Gm-Message-State: AFuF++kExVWEa9e6YEH2PvwPR4V/pOQ+YexwustxeNhEOxS20a6x8xbF
	uGjasOCWQsSe8nEsMor7SKOrxsSIf1asT45QntH52qngxbDd5JpVlkWrlsUhHg==
X-Gm-Gg: AR+sD11z1AdFeGUu0Hfv/wdpa/URoQmZR2NiJ8SLbhwMmFkvp3r8xlWKBLrqfvNeG+C
	MYUe4fRiUV72No1V07GVnTDEQiWY3muDwDZ/V8KylkZhcYcCx99aAo0a5zJ9umW8HR9zqHcpo3Q
	p12jlQQdXdvnSsiiyYaTHXS3SO1xaGrU8nglysdMfL41C8BL5GEmIDIvwoIc4L43fAXoGJnc4Ub
	d9054xyK+Qm6pcZYpxpth3AxHsu6iMI7Ykj1t7wvapNOW1e0hxzbJtZTcI9o7SqBQxIj58HTLap
	tMMWaHKq9p7d4bAzXDswH2higGrkqhvMSfeIKv6Kai6g93MvDZGj9B6yI2D2PmjeW23mxjI/h1R
	hgcaDOfZyhAL+gGep7ksSCY1Y+zW64Z2IMsQ+X8S5/HfoV5inNFSqEEGDrl/nfj9HIpSQZL14Y5
	Y0j37L1+KQnAX6aJ/qfbBN0e6ifVtMGm3dB2yWIYdXTfnoro3yCdhPDjblwMTthBoKDOwc0WAMe
	bFPK8LgGqyg1fAYz1tFrl3ueGUxxlwKZrG0c2e/Y+M=
X-Received: by 2002:a05:600c:4592:b0:499:b402:6c0 with SMTP id 5b1f17b1804b1-499dc6eac3bmr188356345e9.3.1787844158052;
        Thu, 27 Aug 2026 08:22:38 -0700 (PDT)
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
Subject: [PATCH v2 39/39] xen/riscv: introduce IMSIC h/w interrupt file attaching to vcpu
Date: Thu, 27 Aug 2026 17:21:23 +0200
Message-ID: <4df9cf63943d0f371c8a25c6c9e84adbd3083a61.1787838835.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1787838835.git.oleksii.kurochko@gmail.com>
References: <cover.1787838835.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ef75cf/1787844158-360C5AE4-AB5AF2C0/10/73395122804
X-purgate-type: spam
X-purgate-size: 9880

Introduce imsic_vsfile_attach() to initialize the AIA-related state needed
for a vCPU to have a working guest interrupt file.

A guest (VS) interrupt file must be mapped to one of a pCPU's
hardware interrupt files (if they exist), so the pCPU a vCPU will actually
run on needs to be known first. arch_vcpu_create() is therefore not a
suitable place to call vcpu_aia_init(), since the pCPU assigned to a
vCPU can still change before it is first scheduled. To avoid
reassigning the VS interrupt file id and remapping it to a different
pCPU's hardware interrupt file, imsic_vsfile_attach() is called from a
later point in the scheduling path (e.g. continue_new_vcpu()). Since
it will end up being called from a non-__init context, it is not
itself marked __init.

Introduce imsic_update_state() to update a vCPU's guest IMSIC state
(the guest interrupt file id and the pCPU whose hardware interrupt
file it is mapped to) as a single consistent unit. This state can be
read concurrently, e.g. by a future helper that checks whether a
vCPU has a pending IMSIC interrupt, though no such consumer exists
yet at this stage, so it is protected by a lock.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in v2:
 - Update vcpu_aia_init() to catch sw interrupt file and update some debug
   messages in it.
 - Add vgein_release() if IMSIC h/w mapping failed.
 - imsic_update_state(): store v->processor rather than cpuid_to_hartid(),
   as ->vsfile_cpu is consumed as a Xen CPU id (aplic_hart_field(),
   cpumask_of()) and its NR_CPUS sentinel lives in that numbering space.
 - Drop parantethis aroud guest_file_id ? ... in imsic_update_state().
 - Rename vcpu_aia_init to imsic_vsfile_attach() and move the code to
   imsic.c.
---
---
 xen/arch/riscv/domain.c            |   2 +
 xen/arch/riscv/imsic.c             | 146 +++++++++++++++++++++++------
 xen/arch/riscv/include/asm/imsic.h |   2 +
 3 files changed, 121 insertions(+), 29 deletions(-)

diff --git a/xen/arch/riscv/domain.c b/xen/arch/riscv/domain.c
index 0782148b7207..15b6bfffa97d 100644
--- a/xen/arch/riscv/domain.c
+++ b/xen/arch/riscv/domain.c
@@ -155,6 +155,8 @@ static void continue_new_vcpu(struct vcpu *prev)
         reset_stack_and_jump(idle_loop);
     else
     {
+        imsic_vsfile_attach(current);
+
         /*
          * During a context switch to a new vCPU, interrupts must be disabled
          * to guarantee that the vCPU's CSR state can be safely restored into
diff --git a/xen/arch/riscv/imsic.c b/xen/arch/riscv/imsic.c
index 374a21ace15f..ad638d748517 100644
--- a/xen/arch/riscv/imsic.c
+++ b/xen/arch/riscv/imsic.c
@@ -212,7 +212,14 @@ unsigned int vcpu_guest_file_id(const struct vcpu *v)
 
 void imsic_update_state(struct vcpu *v, unsigned int guest_file_id)
 {
-    BUG_ON("unimplemented\n");
+    unsigned long flags;
+    struct vimsic_state *vimsic_state = v->arch.vimsic_state;
+    unsigned int cpu = guest_file_id ? v->processor : NR_CPUS;
+
+    write_lock_irqsave(&vimsic_state->vsfile_lock, flags);
+    vimsic_state->guest_file_id = guest_file_id;
+    vimsic_state->vsfile_cpu = cpu;
+    write_unlock_irqrestore(&vimsic_state->vsfile_lock, flags);
 }
 
 void __init imsic_ids_local_delivery(bool enable)
@@ -640,6 +647,16 @@ struct imsic_vsfile_data {
     struct imsic_mrif *mrif;
 };
 
+/*
+ * Number of 64-bit EIx groups needed to cover all the interrupt identities an
+ * IMSIC interrupt file provides, which are 0 (never valid, but it still
+ * occupies a bit) up to and including imsic_cfg.nr_ids.
+ */
+static unsigned int imsic_nr_eix(void)
+{
+    return DIV_ROUND_UP(imsic_cfg.nr_ids + 1, BITS_PER_TYPE(uint64_t));
+}
+
 /*
  * Execute func() on the pCPU which owns the IMSIC interrupt file func() is
  * going to work with.
@@ -1138,20 +1155,90 @@ static void cf_check imsic_vsfile_local_update(void *data)
     csr_write(CSR_VSISELECT, old_vsiselect);
 }
 
+/*
+ * Point the vCPU's HSTATUS.VGEIN at the guest interrupt file it has been
+ * given. It is applied to the hart when the vCPU's context is restored.
+ */
+static void vcpu_set_vgein(struct vcpu *v, unsigned int vsfile_id)
+{
+    unsigned long hstatus = vcpu_guest_cpu_user_regs(v)->hstatus;
+
+    hstatus &= ~HSTATUS_VGEIN;
+    hstatus |= MASK_INSR(vsfile_id, HSTATUS_VGEIN);
+
+    vcpu_guest_cpu_user_regs(v)->hstatus = hstatus;
+}
+
+/*
+ * Take a h/w guest interrupt file of 'cpu' for the vCPU: zero the file out,
+ * map it into the domain's G-stage at the vCPU's virtual IMSIC page and
+ * record the new location in the per-vCPU IMSIC state.
+ *
+ * HSTATUS.VGEIN is deliberately left alone: the vCPU may be pointed at the
+ * file only when the file already holds the vCPU's interrupt state, which in
+ * the case of imsic_migrate_vcpu() happens only after the old file has been
+ * moved to the new one. Thereby it is up to the caller to call
+ * vcpu_set_vgein() at the right moment.
+ *
+ * Returns the id of the taken interrupt file, or 0 if none could be taken, in
+ * which case the domain is crashed.
+ */
+static unsigned int imsic_vsfile_acquire(struct vcpu *v, unsigned int cpu)
+{
+    struct imsic_vsfile_data vsfile_data = { .nr_eix = imsic_nr_eix() };
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
-    unsigned int new_vsfile_hgei;
+    unsigned int new_vsfile_id;
     unsigned int new_vsfile_cpu;
-    unsigned int nr_hw_eix = DIV_ROUND_UP(imsic_cfg.nr_ids + 1,
-                                          BITS_PER_TYPE(uint64_t));
-    struct imsic_vsfile_data vsfile_data = {
-        .nr_eix = nr_hw_eix,
-    };
+    unsigned int nr_hw_eix = imsic_nr_eix();
     struct vimsic_state *imsic_state = v->arch.vimsic_state;
     unsigned long flags;
     unsigned int old_vsfile_id;
     unsigned int old_vsfile_cpu;
     struct imsic_mrif tmrif = { };
+    struct imsic_vsfile_data vsfile_data = {
+        .nr_eix = nr_hw_eix,
+        .mrif = &tmrif,
+    };
 
     /*
      * The scheduler can mark a freshly created vCPU's unit as migrated and
@@ -1189,25 +1276,10 @@ void imsic_migrate_vcpu(struct vcpu *v)
      */
     new_vsfile_cpu = v->processor;
 
-    new_vsfile_hgei = vgein_assign(v);
-
-    /* We don't support SW interrupt files at the moment. */
-    BUG_ON(!new_vsfile_hgei);
-
-    vsfile_data.hgei = new_vsfile_hgei;
-
-    /* Zero-out new IMSIC VS-file */
-    imsic_call_on_cpu(new_vsfile_cpu, imsic_vsfile_local_clear, &vsfile_data);
-
-    /* Update G-stage mapping for the new IMSIC VS-file */
-    if ( imsic_map_guest_file(v, new_vsfile_hgei) )
-    {
-        domain_crash(v->domain, "Migration to hw interrupt file failed\n");
-
+    /* Zero-out, map and start to use the new IMSIC VS-file */
+    new_vsfile_id = imsic_vsfile_acquire(v, new_vsfile_cpu);
+    if ( !new_vsfile_id )
         return;
-    }
-
-    imsic_update_state(v, new_vsfile_hgei);
 
     /*
      * TODO: Modify the relevant translation tables at all IOMMUs so that MSIs
@@ -1245,7 +1317,7 @@ void imsic_migrate_vcpu(struct vcpu *v)
     vgein_release(v, old_vsfile_id, old_vsfile_cpu);
 
     /* Restore register state in the new IMSIC VS-file */
-    vsfile_data.mrif = &tmrif;
+    vsfile_data.hgei = new_vsfile_id;
     imsic_call_on_cpu(new_vsfile_cpu, imsic_vsfile_local_update, &vsfile_data);
 
     /*
@@ -1262,7 +1334,23 @@ void imsic_migrate_vcpu(struct vcpu *v)
         imsic_call_on_cpu(new_vsfile_cpu, imsic_local_hgeie_set, &vsfile_data);
 
     /* Set VCPU HSTATUS.VGEIN to new IMSIC VS-file */
-    vcpu_guest_cpu_user_regs(v)->hstatus &= ~HSTATUS_VGEIN;
-    vcpu_guest_cpu_user_regs(v)->hstatus |=
-            MASK_INSR(new_vsfile_hgei, HSTATUS_VGEIN);
+    vcpu_set_vgein(v, new_vsfile_id);
+}
+
+void imsic_vsfile_attach(struct vcpu *v)
+{
+    unsigned int new_vsfile_id;
+
+    if ( !aia_usable() )
+        return;
+
+    new_vsfile_id = imsic_vsfile_acquire(v, v->processor);
+    if ( !new_vsfile_id )
+        return;
+
+    /*
+     * The vCPU has never run yet, so the just zeroed out file is all the
+     * interrupt state it has and HSTATUS.VGEIN can be pointed at it at once.
+     */
+    vcpu_set_vgein(v, new_vsfile_id);
 }
diff --git a/xen/arch/riscv/include/asm/imsic.h b/xen/arch/riscv/include/asm/imsic.h
index 6395b539c52d..f0edf0bff5d9 100644
--- a/xen/arch/riscv/include/asm/imsic.h
+++ b/xen/arch/riscv/include/asm/imsic.h
@@ -125,4 +125,6 @@ int imsic_map_guest_file(struct vcpu *v, unsigned int vsfile_id);
 
 void imsic_migrate_vcpu(struct vcpu *v);
 
+void imsic_vsfile_attach(struct vcpu *v);
+
 #endif /* ASM_RISCV_IMSIC_H */
-- 
2.55.0


