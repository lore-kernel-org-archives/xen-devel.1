Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39BA4C61DC4
	for <xen-devel@archiver.kernel.org>; Thu, 27 Aug 2026 15:22:46 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1401000.1636789 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzbw4-0007RM-Qi; Thu, 27 Aug 2026 15:22:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1401000.1636789; Thu, 27 Aug 2026 15:22:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzbw3-0007NH-JT; Thu, 27 Aug 2026 15:22:35 +0000
Received: by outflank-mailman (input) for mailman id 1401000;
 Thu, 27 Aug 2026 15:22:28 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wzbvv-0005pb-G6
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2026 15:22:27 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wzbvu-00C7F4-Sj
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2026 17:22:26 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a90562c-e002-0a2a0a5209dd-0a2a4505e5e4-12
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 17:22:26 +0200
Received: from [209.85.128.53] (helo=mail-wm1-f53.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a905632-4cb1-0a2a45050019-d1558035e460-3
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 17:22:26 +0200
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-4953de5be0aso17665605e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 08:22:26 -0700 (PDT)
Received: from fedora (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49b4b2d6b30sm57441155e9.14.2026.08.27.08.22.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Aug 2026 08:22:25 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1787844146; x=1788448946; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pjeR4g3eAicMAUdV6Amf67usumS/lrCxP1G6haAdnIE=;
        b=axi1JGDG3EF5PNUSuc5s9fUUiLXudV9YdTEwI+9c8r1eiB8drQUem+nKttoc57JTTC
         UXG7m1lNRaZpDf56X+eBrqnmFGcYMemfp646NEOuttSyPoLYGeT+wOTJbMiyAgAaZVZB
         /Y+ruXQH8VhBf0mFNB53Rx+Z4pYInSwjGJYa5I6xAgrnQE4M2N8g3WcTweZLcfL6ZsuJ
         FNJIUE/PmRptDdwDK1puebZxbOxvQMc4I6gde+rw2CSCbeoyrSRWV0QPsMAEbYwvFuZd
         ETrLnn7+NQ/KDXN9LEE117GLG1jf0ATl1GiP9HixQ3RjY5ym7RjDorn5/FKKqLgNn+OK
         le8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787844146; x=1788448946;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pjeR4g3eAicMAUdV6Amf67usumS/lrCxP1G6haAdnIE=;
        b=UR3qM/1iSMKDuKumLzzKlpCt/Uqv+B3BVNsMZ5bOV3/jaYp8aXVZMQb6o4QR+ZhFR5
         RvOD8yUmJng67Sfn2fECPClhTSiS/YcKlO52ZOxw5ACHaSIG9EP95ZX82HiAPwLak7Ih
         ykMgwmw5bmXOWShoKqsBT9alSqb/3dfg3MdtiMdKKLRF797QGNit/uTTvW6kgJDMci5e
         QNK7+JgN9fen3Yx2wLaC5oo5Pyl0Esug4pDt1itoWCRJP1CSFClZJQqda9UVOlXAAhd2
         kX19KTA2TJjagcrSGOEUjmqg+u8EJt9RAQ8zY945h0ltPoy/v3gJ3Y3IQBiqzTL0EftS
         8Vuw==
X-Gm-Message-State: AFuF++npbIIXdBjKxwGQGG2PaOqmyfk9Ydx9peqqUQIeT24wFlCVh+el
	qUhS47yL2TzWfHVIJe/abffMxk+iz55CYxVmrzczrxWkCQoyVqTWNTEdaT8/fg==
X-Gm-Gg: AR+sD10w/6SNFDhUJZMvzXBPZa9DI6ikKZIkH3xWO34SMUAmIo4NwSAgWYOWsZ3xLXE
	RmvpuMlHPMo1Ckl/B8Veceqnv448wE5xmTHVXu/jxH9X8/l9Y+JLVhQzrIJnck6qpLMfA6RahPD
	rjFScpkbgAqWZDP3K8cXlrJdypStvmdz6G08SCdJ4zyJugFfbOKz80AzvFq2Z886Mg9Wn3A14Z4
	mVMyzjDh4T0pdbyzxdFajjAIUTFoH5HBSvXimxuOnROXnh5BgsZ2f/EnYttVZao5wxY22wEP56t
	9AglgNWTNTyLpQ2VR5L+yagvIuR5ds69wHutWYpHjyVx+8hpUmd302tBk/C8xi56I7OGNjVNYpu
	QcIM8F1wOmLtPnwHSEcslKwmVy3z51t+OewAJb03ZNhV0XB6baBtj4XY7AK45tc2iTKHTS+3jDM
	oc6Z5XZr7JlDSwPWswHRWegSiCy3A88LcwzwC0OoV9OTa4MC9haUcI4cRAPXPf3q1PJjv9Xm8wc
	BADIw1i7q5zXvVJ/FOPBLQrkVku7y2u
X-Received: by 2002:a05:600c:34c3:b0:499:afe2:e4d0 with SMTP id 5b1f17b1804b1-499dc70d263mr195585985e9.8.1787844146120;
        Thu, 27 Aug 2026 08:22:26 -0700 (PDT)
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
Subject: [PATCH v2 30/39] xen/riscv: prepare new IMSIC VS-file
Date: Thu, 27 Aug 2026 17:21:14 +0200
Message-ID: <440bc07dfb72d09da72b49ded6f78dc1f54a3ad5.1787838835.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1787838835.git.oleksii.kurochko@gmail.com>
References: <cover.1787838835.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c201ff/1787844146-F52A32A1-A3BF8177/10/73395122804
X-purgate-type: spam
X-purgate-size: 9361

Implement first steps of migration a vCPU to a different guest interrupt file
procedure:
- At the old interrupt file, save to memory the values of registers
  eidelivery and eithreshold, and set eidelivery = 0.
- At the new interrupt file, set eidelivery = 0, and zero all
  implemented interrupt-pending bits (the eip array).

The following steps will be introduced in follow-up patches.

Add a BUG_ON("unimplemented") placeholder in imsic_migrate_vcpu() to guard
against silent incorrect behaviour or unexpected panics in guest VMs until
the function is fully implemented.

vgein_assign() will be introduced later in a separate patch, for not it is
only stub.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in v2:
 - New patch.
---
---
 xen/arch/riscv/aia.c             |   9 ++
 xen/arch/riscv/imsic.c           | 159 +++++++++++++++++++++++++++++++
 xen/arch/riscv/include/asm/aia.h |   4 +
 xen/include/xen/config.h         |   1 +
 4 files changed, 173 insertions(+)

diff --git a/xen/arch/riscv/aia.c b/xen/arch/riscv/aia.c
index e31c9c2d24b6..75c82bcfa1b3 100644
--- a/xen/arch/riscv/aia.c
+++ b/xen/arch/riscv/aia.c
@@ -1,8 +1,10 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 
+#include <xen/bug.h>
 #include <xen/errno.h>
 #include <xen/init.h>
 #include <xen/sections.h>
+#include <xen/sched.h>
 #include <xen/types.h>
 
 #include <asm/cpufeature.h>
@@ -21,3 +23,10 @@ void __init aia_init(void)
 
     _aia_usable = true;
 }
+
+unsigned int vgein_assign(struct vcpu *v)
+{
+    BUG_ON("unimplemented\n");
+
+    return 0;
+}
diff --git a/xen/arch/riscv/imsic.c b/xen/arch/riscv/imsic.c
index ad7fbe708bfd..516f0105352a 100644
--- a/xen/arch/riscv/imsic.c
+++ b/xen/arch/riscv/imsic.c
@@ -26,6 +26,7 @@
 #include <xen/spinlock.h>
 #include <xen/xvmalloc.h>
 
+#include <asm/aia.h>
 #include <asm/imsic.h>
 
 #define IMSIC_HART_SIZE(guest_bits) (BIT(guest_bits, U) * IMSIC_MMIO_PAGE_SZ)
@@ -77,6 +78,64 @@ do {                            \
     csr_clear(CSR_SIREG, v);    \
 } while (0)
 
+#define imsic_vs_csr_write(c, v)    \
+do {                                \
+    csr_write(CSR_VSISELECT, (c));  \
+    csr_write(CSR_VSIREG, (v));     \
+} while ( 0 )
+
+/*
+ * Generic switchcase expansion pyramid.
+ * F is the per-operation leaf macro, ireg is the base register index.
+ * Optional extra args (e.g. an operation and/or a value) are forwarded to F
+ * via __VA_ARGS__.
+ *
+ * imsic_switchcase_break(ireg, op, v) - emit "case ireg: op(ireg,v); break;"
+ * imsic_switchcase_ret(ireg, op, ...) - emit "case ireg: return op(ireg[,v]);"
+ *   The variadic tail is optional so the same leaf works for both read (no v)
+ *   and swap (with v).
+ */
+#define imsic_switchcase_break(ireg, op, v) \
+    case ireg:                              \
+        op(ireg, v);                        \
+        break;
+
+#define imsic_switchcase_ret(ireg, op, ...) \
+    case ireg:                              \
+        return op(ireg, ##__VA_ARGS__);
+
+#define imsic_switchcase_2(F, ireg, ...)    \
+    F(ireg + 0, ##__VA_ARGS__)              \
+    F(ireg + 1, ##__VA_ARGS__)
+#define imsic_switchcase_4(F, ireg, ...)    \
+    imsic_switchcase_2(F, ireg + 0, ##__VA_ARGS__)  \
+    imsic_switchcase_2(F, ireg + 2, ##__VA_ARGS__)
+#define imsic_switchcase_8(F, ireg, ...)    \
+    imsic_switchcase_4(F, ireg + 0, ##__VA_ARGS__)  \
+    imsic_switchcase_4(F, ireg + 4, ##__VA_ARGS__)
+#define imsic_switchcase_16(F, ireg, ...)   \
+    imsic_switchcase_8(F, ireg + 0, ##__VA_ARGS__)  \
+    imsic_switchcase_8(F, ireg + 8, ##__VA_ARGS__)
+#define imsic_switchcase_32(F, ireg, ...)   \
+    imsic_switchcase_16(F, ireg + 0, ##__VA_ARGS__) \
+    imsic_switchcase_16(F, ireg + 16, ##__VA_ARGS__)
+#define imsic_switchcase_64(F, ireg, ...)   \
+    imsic_switchcase_32(F, ireg + 0, ##__VA_ARGS__) \
+    imsic_switchcase_32(F, ireg + 32, ##__VA_ARGS__)
+
+static void imsic_eix_write(unsigned int ireg, unsigned long val)
+{
+    switch ( ireg )
+    {
+    imsic_switchcase_64(imsic_switchcase_break, IMSIC_EIP0,
+                        imsic_vs_csr_write, val)
+    imsic_switchcase_64(imsic_switchcase_break, IMSIC_EIE0,
+                        imsic_vs_csr_write, val)
+    default:
+        ASSERT_UNREACHABLE();
+    }
+}
+
 unsigned int vcpu_guest_file_id(const struct vcpu *v)
 {
     return ACCESS_ONCE(v->arch.vimsic_state->guest_file_id);
@@ -389,6 +448,76 @@ int cf_check vcpu_imsic_init(struct vcpu *v)
     return 0;
 }
 
+/*
+ * Arguments of the imsic_vsfile_local_*() helpers, which are executed by the
+ * pCPU owning the interrupt file, thereby through imsic_call_on_cpu().
+ */
+struct imsic_vsfile_data {
+    unsigned int hgei;
+    unsigned int nr_eix;
+    struct imsic_mrif *mrif;
+};
+
+/*
+ * Execute func() on the pCPU which owns the IMSIC interrupt file func() is
+ * going to work with.
+ *
+ * An IMSIC VS-file is reachable only through hstatus.VGEIN of the hart the
+ * file belongs to, and a guest interrupt file index is meaningless on any
+ * other hart, so such work always has to be done by that very hart.
+ *
+ * The local case runs with IRQs disabled to provide func() with the same
+ * environment it is given when it is called from the function call IPI
+ * handler.
+ */
+static void imsic_call_on_cpu(unsigned int cpu, void (*func)(void *),
+                              void *data)
+{
+    if ( cpu == smp_processor_id() )
+    {
+        unsigned long flags;
+
+        local_irq_save(flags);
+        func(data);
+        local_irq_restore(flags);
+    }
+    else
+        on_selected_cpus(cpumask_of(cpu), func, data, 1);
+}
+
+static void cf_check imsic_vsfile_local_clear(void *data)
+{
+    unsigned int i;
+    const struct imsic_vsfile_data *idata = data;
+    unsigned long new_hstatus, old_hstatus, old_vsiselect;
+
+    /* We can only zero-out if we have a IMSIC VS-file */
+    if ( !idata->hgei )
+        return;
+
+    old_vsiselect = csr_read(CSR_VSISELECT);
+    old_hstatus = csr_read(CSR_HSTATUS);
+    new_hstatus = old_hstatus & ~HSTATUS_VGEIN;
+    new_hstatus |= MASK_INSR(idata->hgei, HSTATUS_VGEIN);
+    csr_write(CSR_HSTATUS, new_hstatus);
+
+    imsic_vs_csr_write(IMSIC_EIDELIVERY, 0);
+    imsic_vs_csr_write(IMSIC_EITHRESHOLD, 0);
+
+    for ( i = 0; i < idata->nr_eix; i++ )
+    {
+        imsic_eix_write(IMSIC_EIP0 + i * 2, 0);
+        imsic_eix_write(IMSIC_EIE0 + i * 2, 0);
+#ifdef CONFIG_RISCV_32
+        imsic_eix_write(IMSIC_EIP0 + i * 2 + 1, 0);
+        imsic_eix_write(IMSIC_EIE0 + i * 2 + 1, 0);
+#endif
+    }
+
+    csr_write(CSR_HSTATUS, old_hstatus);
+    csr_write(CSR_VSISELECT, old_vsiselect);
+}
+
 void cf_check vcpu_imsic_deinit(struct vcpu *v)
 {
     XVFREE(v->arch.vimsic_state);
@@ -689,6 +818,14 @@ int __init vimsic_make_domu_dt_node(struct kernel_info *kinfo,
 
 void imsic_migrate_vcpu(struct vcpu *v)
 {
+    unsigned int new_vsfile_hgei;
+    unsigned int new_vsfile_cpu;
+    unsigned int nr_hw_eix = DIV_ROUND_UP(imsic_cfg.nr_ids + 1,
+                                          BITS_PER_TYPE(uint64_t));
+    struct imsic_vsfile_data vsfile_data = {
+        .nr_eix = nr_hw_eix,
+    };
+
     /*
      * The scheduler can mark a freshly created vCPU's unit as migrated and
      * invoke this before the vCPU has ever run (see the migrated branch in
@@ -699,5 +836,27 @@ void imsic_migrate_vcpu(struct vcpu *v)
     if ( v->arch.last_cpu == NR_CPUS )
         return;
 
+    /*
+     * At this point, all interrupt producers are still using the old IMSIC
+     * VS-file.
+     */
+
+    /*
+     * Latch the pCPU the new interrupt file is taken from: vgein_assign()
+     * allocates it from v->processor's pool of guest interrupt files, and
+     * only that hart can access the file afterwards.
+     */
+    new_vsfile_cpu = v->processor;
+
+    new_vsfile_hgei = vgein_assign(v);
+
+    /* We don't support SW interrupt files at the moment. */
+    BUG_ON(!new_vsfile_hgei);
+
+    vsfile_data.hgei = new_vsfile_hgei;
+
+    /* Zero-out new IMSIC VS-file */
+    imsic_call_on_cpu(new_vsfile_cpu, imsic_vsfile_local_clear, &vsfile_data);
+
     BUG_ON("unimplemented");
 }
diff --git a/xen/arch/riscv/include/asm/aia.h b/xen/arch/riscv/include/asm/aia.h
index aaa4bf91fc75..53a1efb042f8 100644
--- a/xen/arch/riscv/include/asm/aia.h
+++ b/xen/arch/riscv/include/asm/aia.h
@@ -3,8 +3,12 @@
 #ifndef RISCV_AIA_H
 #define RISCV_AIA_H
 
+struct vcpu;
+
 bool aia_usable(void);
 
 void aia_init(void);
 
+unsigned int vgein_assign(struct vcpu *v);
+
 #endif /* RISCV_AIA_H */
diff --git a/xen/include/xen/config.h b/xen/include/xen/config.h
index dddc8e1920fe..0e29976e8203 100644
--- a/xen/include/xen/config.h
+++ b/xen/include/xen/config.h
@@ -100,6 +100,7 @@
 #define BITS_PER_INT    (BITS_PER_BYTE * __SIZEOF_INT__)
 #define BITS_PER_LONG   (BITS_PER_BYTE * BYTES_PER_LONG)
 #define BITS_PER_LLONG  (BITS_PER_BYTE * __SIZEOF_LONG_LONG__)
+#define BITS_PER_TYPE(type) (sizeof(type) * BITS_PER_BYTE)
 
 /* It is assumed that sizeof(void *) == __alignof(void *) */
 #define POINTER_ALIGN   __SIZEOF_POINTER__
-- 
2.55.0


