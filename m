Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D2BDC44520
	for <xen-devel@archiver.kernel.org>; Mon, 20 Jul 2026 16:02:43 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1367141.1616962 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wlqRu-0007p5-5a; Mon, 20 Jul 2026 16:02:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1367141.1616962; Mon, 20 Jul 2026 16:02:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wlqRu-0007ot-19; Mon, 20 Jul 2026 16:02:34 +0000
Received: by outflank-mailman (input) for mailman id 1367141;
 Mon, 20 Jul 2026 16:02:33 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wlqRs-0007lt-UM
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2026 16:02:33 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wlqRs-00CH1I-B9
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2026 18:02:32 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a5e4689-bab6-0a2a0a5309dd-0a2a4509c2b8-44
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 18:02:32 +0200
Received: from [209.85.128.48] (helo=mail-wm1-f48.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a5e4696-be1a-0a2a45090019-d1558030ec90-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 18:02:30 +0200
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-4954dff6536so18969255e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 09:02:30 -0700 (PDT)
Received: from fedora (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49563eee22esm31331765e9.1.2026.07.20.09.02.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jul 2026 09:02:29 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1784563350; x=1785168150; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=95JUHHq/5jrJxxszZoslZE37QJAheVrmKqmo8lETBtM=;
        b=K6w2vaHaXjei1FACGN2RTODgtdjuQ2bjxoDTtso/IB52z2gaqRBtG1WC/GVsA883st
         50uUmzUeCY6UUjs97Xx8kQYrTSgW8vSLLow5pLvSYvO3cmjXNqPKndIHYy9zoRAyacuj
         ELzipRIhBYP0VBd6uGDam828rtajmon6FQWBDr0q/envCACQ6AajZeg8CKRtVBo8SdaY
         4rTAYA52BxpXxXpe9afZ9RrD7BRhm4iiQjFlgLzp6INIJIH/gbDcDyUM9CSYDKN0v1u3
         VIUe/2qyN6amLdPXQfh9v+wdhxByKWIsJJHymowo65sowXIYguU+5qmUX8FFcTbEOab+
         bGRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784563350; x=1785168150;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=95JUHHq/5jrJxxszZoslZE37QJAheVrmKqmo8lETBtM=;
        b=i5Hc4jsvCVDU5SlrqqTGq7t+pPLW4eWwZkxw6aPXoMvu+q8AQ8wS71TbVeUNsUd2Wl
         W/B7lhJ9ZuW6wT7SEpAczYpw1vZBfv6+Eu4H6mq0d+WREo0xHca8NonbnWldtc5fBInn
         CzClMTciVflY7KESNob4+kXrm9ilgLHlSwPOyo0qP9rQc5iPzLuGdOifc+5+Ao7/siko
         ifQI+zvXD8wwWe9nxYE5Hm1KRRHlyrDOimJbCne9iMIrelfi5690YjVFe07vywZVItlH
         lOm9Z85hScTOqQaJp83vTVaF5RfThx4xY6kIYxztFCdm0Cj9zGqndatzQQiztIwmKV4F
         95LA==
X-Gm-Message-State: AOJu0Yx8RudOX6Bm2ZiMSroSly8bUqk9JBjpi0zOfTRN9dE7G63XIPU6
	tU0acPKiFWtAzmIctV/siqkXcbjEEHDzVGPwoRtfV+OENk19RNdENQOVdshEnA==
X-Gm-Gg: AfdE7clSvLL7DNy9B4iDVlOEYGLkNuzs3BbR+wb2i2D6FNxhq3HvEQkq3Ng+kY5CeAm
	4nFAywVoiwuAZrHrzHd0sycNOFmaDraYGcFHa/hSq0ritqLof/2hpM3F1xlwToscjU/82K/Lmrc
	J8wXGQqnJMDdxO2aetq2T4+2FLfr1AeHo+6DA5TaTqTGWTrLD++J2tlQAi0y2qenqhV0XWpv4Nf
	0pei65J6CvL8ZHgEGTMCsMMfT0sqguiTN8EuQ+NlHyVTNAzUspMbgJThLtpk+pHu9HY5E09S1/n
	m1b0HK4mr9pIwvc4rd5XfK2rOug+Jru/RX+ynm1euwUsnWfg/mV0K1+6T98k/iT2jFyrcGT5nVs
	x1RJOA0GLKPMKF9Al65YRGygm5Mktl4SuNcXn/BVCYUjOFzM0xqETUyTKWbW1GOWB6SXfgiT67Y
	46taUT1B7JmY6tRhEM+MwjOFOGNbzDhlG6jg+JTKVGqXL/mxU=
X-Received: by 2002:a05:600c:45d5:b0:490:9782:3eb8 with SMTP id 5b1f17b1804b1-4954a40843dmr159978425e9.25.1784563350054;
        Mon, 20 Jul 2026 09:02:30 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
	Baptiste Le Duc <baptiste.le-duc@vates.tech>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v1 02/17] xen/riscv: add basic VGEIN management for AIA guests
Date: Mon, 20 Jul 2026 18:02:00 +0200
Message-ID: <b141b8d976719bb9b76147cacfd5842fb7aac74e.1784560663.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1784560663.git.oleksii.kurochko@gmail.com>
References: <cover.1784560663.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-bad1c0/1784563350-BD4C3034-C916A1DD/10/73395122804
X-purgate-type: spam
X-purgate-size: 8758

It was decided to add support for IMSIC from the start instead of having APLIC
operate in direct delivery mode, as it requires a trap-and-emulation approach,
which is not optimal from a performance standpoint.

AIA provides a hardware-accelerated mechanism for delivering external
interrupts to domains via "guest interrupt files" located in IMSIC.
A single physical hart can implement multiple such files (up to GEILEN),
allowing several virtual harts to receive interrupts directly from hardware.

Introduce per-CPU tracking of guest interrupt file identifiers (VGEIN)
for systems implementing AIA specification. Each CPU maintains
a bitmap describing which guest interrupt files are currently in use.

Add helpers to initialize the bitmap based on the number of available
guest interrupt files (GEILEN), assign a VGEIN to a vCPU, and release it
when no longer needed. When assigning a VGEIN, the corresponding value
is written to the VGEIN field of the guest hstatus register so that
VS-level external interrupts are delivered from the selected interrupt
file.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in v3:
 - Rephrase per-CPU comment from "Bitmap for each physical cpus..." to
   "VGEIN control structure for each physical CPU...".
 - Use %u for cpu in printk("cpu%u.geilen=%u\n").
 - Fix missing \n in "AIA: failed to init vgein for CPU%u\n".
 - Shorten dprintk message to "vgein_init() failed: %d\n".
 - Use %u instead of %d for v->processor in gprintk() calls.
 - Drop update of ->hstatus in vgein_{assign,release} and let the caller
   to do that. For example, it could be useful in the case of migration
   vCPU from one pCPU to another and so vcpu->hstatus will be updated as a
   last step of this process.
 - Fill ->owners in vgein_{assign,release} just from the start.
---
Changes in v2:
 - add static for defintion of vgein_bmp;
 - Drop declarartion of vgein_bmp from aia.h.
 - Move declaration of 'struct vgein_bmp' from aia.h to aia.c as all the
   management is inside aia.c.
 - Instead of decrement of vgein->geilen just update the wait how it is
   initialized.
 - Return -EOPNOTSUPP in vgein_init() instead of BUG_ON().
 - Use %u to print unsigned int.
 - make bmp field in vgein_bmp not a pointer.
 - allocate owners dynamically.
 - Drop unnessary blank lines.
 - use find_first_zero_bit() instead of bitmap_weight() to find a free slot
   for vgein number.
 - Drop the section number for the comment.
 - Start to search from bitnum 1 for free vgein_id, as bitnum 0 is reserved to
   tell that no guest extrenal interrupt number is used. Thereby drop vgein_id++
   at the end of vgein_assign().
 - s/bitmap_set/__set_bit.
 - s/bitmap_clear/__clear_bit.
 - as vgein_init() is needed to be invoked once per CPU being brought up, drop
   __init for it.
 - Return vgein_id == 0 if vgein_id is higher then maximun supported by h/w
   VGEIN.
 - Add check in vgein_relase() that vgein is 0 and if it is there is nothing
   is needed to do.
 - Use gdprintk instead of printk() in vgein_{assign,release}.
 - Add the claryfing comment above geilen field.
 - Drop ASSERT in vgein_assign() and return just vgein_id = 0 in the case when
   there is no aviablable h/w VGEINs.
 - Make vgein_init() static.
---
---
 xen/arch/riscv/aia.c             | 145 +++++++++++++++++++++++++++++++
 xen/arch/riscv/include/asm/aia.h |   8 ++
 2 files changed, 153 insertions(+)

diff --git a/xen/arch/riscv/aia.c b/xen/arch/riscv/aia.c
index e31c9c2d24b6..4f7f46f58f0b 100644
--- a/xen/arch/riscv/aia.c
+++ b/xen/arch/riscv/aia.c
@@ -1,11 +1,33 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 
+#include <xen/bitmap.h>
+#include <xen/cpu.h>
 #include <xen/errno.h>
 #include <xen/init.h>
 #include <xen/sections.h>
+#include <xen/sched.h>
+#include <xen/spinlock.h>
 #include <xen/types.h>
+#include <xen/xvmalloc.h>
 
+#include <asm/aia.h>
 #include <asm/cpufeature.h>
+#include <asm/csr.h>
+#include <asm/current.h>
+
+struct vgein_ctrl {
+    unsigned long bmp;
+    spinlock_t lock;
+    struct vcpu **owners;
+    /* The least-significant bits are implemented first, apart from bit 0 */
+    unsigned int geilen;
+};
+
+/*
+ * VGEIN control structure for each physical CPU to track which VS (guest)
+ * interrupt file IDs are in use.
+ */
+static DEFINE_PER_CPU(struct vgein_ctrl, vgein);
 
 static bool __ro_after_init _aia_usable;
 
@@ -14,10 +36,133 @@ bool aia_usable(void)
     return _aia_usable;
 }
 
+static int vgein_init(unsigned int cpu)
+{
+    struct vgein_ctrl *vgein = &per_cpu(vgein, cpu);
+
+    csr_write(CSR_HGEIE, -1UL);
+    vgein->geilen = flsl(csr_read(CSR_HGEIE) >> 1);
+    csr_write(CSR_HGEIE, 0);
+
+    printk("cpu%u.geilen=%u\n", cpu, vgein->geilen);
+
+    if ( !vgein->geilen )
+        return -EOPNOTSUPP;
+
+    vgein->owners = xvzalloc_array(struct vcpu *, vgein->geilen);
+    if ( !vgein->owners )
+        return -ENOMEM;
+
+    spin_lock_init(&vgein->lock);
+
+    return 0;
+}
+
+static int cf_check cpu_callback(struct notifier_block *nfb, unsigned long action,
+                        void *hcpu)
+{
+    unsigned int cpu = (unsigned long)hcpu;
+    int rc = 0;
+
+    switch ( action )
+    {
+    case CPU_STARTING:
+        rc = vgein_init(cpu);
+        if ( rc )
+            printk("AIA: failed to init vgein for CPU%u\n", cpu);
+        break;
+    }
+
+    return notifier_from_errno(rc);
+}
+
+static struct notifier_block cpu_nfb = {
+    .notifier_call = cpu_callback,
+};
+
 void __init aia_init(void)
 {
+    int rc;
+
     if ( !riscv_isa_extension_available(NULL, RISCV_ISA_EXT_ssaia) )
+    {
+        dprintk(XENLOG_WARNING, "SSAIA isn't present in riscv,isa\n");
         return;
+    }
+
+    if ( (rc = vgein_init(0)) )
+    {
+        dprintk(XENLOG_ERR, "vgein_init() failed: %d\n", rc);
+        return;
+    }
 
     _aia_usable = true;
+
+    register_cpu_notifier(&cpu_nfb);
+}
+
+unsigned int vgein_assign(struct vcpu *v)
+{
+    unsigned int vgein_id;
+    struct vgein_ctrl *vgein = &per_cpu(vgein, v->processor);
+    unsigned long *bmp = &vgein->bmp;
+    unsigned long flags;
+
+    if ( !vgein->geilen )
+        return 0;
+
+    spin_lock_irqsave(&vgein->lock, flags);
+    /*
+     * The vgein_id shouldn't be zero, as it will indicate that no guest
+     * external interrupt source is selected for VS-level external interrupts
+     * according to RISC-V privileged spec:
+     *   Hypervisor Status Register (hstatus) in RISC-V privileged spec:
+     *
+     *   The VGEIN (Virtual Guest External Interrupt Number) field selects
+     *   a guest external interrupt source for VS-level external interrupts.
+     *   VGEIN is a WLRL field that must be able to hold values between zero
+     *   and the maximum guest external interrupt number (known as GEILEN),
+     *   inclusive.
+     *   When VGEIN=0, no guest external interrupt source is selected for
+     *   VS-level external interrupts.
+     *
+     * So start to search from bit number 1.
+     */
+    vgein_id = find_next_zero_bit(bmp, vgein->geilen + 1, 1);
+
+    if ( vgein_id > vgein->geilen )
+        vgein_id = 0;
+    else
+    {
+        __set_bit(vgein_id, bmp);
+        vgein->owners[vgein_id] = v;
+    }
+
+    spin_unlock_irqrestore(&vgein->lock, flags);
+
+#ifdef VGEIN_DEBUG
+    gprintk(XENLOG_DEBUG, "%s: %pv: vgein_id(%u), xen_cpu%u_bmp=%#lx\n",
+           __func__, v, vgein_id, v->processor, *bmp);
+#endif
+
+    return vgein_id;
+}
+
+void vgein_release(struct vcpu *v, unsigned int vgein_id)
+{
+    unsigned long flags;
+    struct vgein_ctrl *vgein = &per_cpu(vgein, v->processor);
+
+    if ( !vgein_id )
+        return;
+
+    spin_lock_irqsave(&vgein->lock, flags);
+    __clear_bit(vgein_id, &vgein->bmp);
+    vgein->owners[vgein_id] = NULL;
+    spin_unlock_irqrestore(&vgein->lock, flags);
+
+#ifdef VGEIN_DEBUG
+    gprintk(XENLOG_DEBUG, "%s: vgein_id(%u), xen_cpu%u_bmp=%#lx\n",
+           __func__, vgein_id, v->processor, vgein->bmp);
+#endif
 }
diff --git a/xen/arch/riscv/include/asm/aia.h b/xen/arch/riscv/include/asm/aia.h
index aaa4bf91fc75..c67be0069a1d 100644
--- a/xen/arch/riscv/include/asm/aia.h
+++ b/xen/arch/riscv/include/asm/aia.h
@@ -3,8 +3,16 @@
 #ifndef RISCV_AIA_H
 #define RISCV_AIA_H
 
+#include <xen/percpu.h>
+#include <xen/spinlock.h>
+
+struct vcpu;
+
 bool aia_usable(void);
 
 void aia_init(void);
 
+unsigned int vgein_assign(struct vcpu *v);
+void vgein_release(struct vcpu *v, unsigned int vgein_id);
+
 #endif /* RISCV_AIA_H */
-- 
2.54.0


