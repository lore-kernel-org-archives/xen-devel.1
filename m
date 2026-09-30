Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF456CA5FCC
	for <xen-devel@archiver.kernel.org>; Wed, 30 Sep 2026 16:24:56 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1437573.1656625 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBx6k-0007nm-JP; Wed, 30 Sep 2026 16:24:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1437573.1656625; Wed, 30 Sep 2026 16:24:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBx6j-0007lM-Qx; Wed, 30 Sep 2026 16:24:37 +0000
Received: by outflank-mailman (input) for mailman id 1437573;
 Wed, 30 Sep 2026 16:24:35 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xBx6g-0007Bo-PU
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2026 16:24:34 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xBx6g-00GhY9-5f
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2026 18:24:34 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6abd37b7-8faa-0a2a0a5109dd-0a2a4503edf2-26
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 18:24:34 +0200
Received: from [74.125.225.140] (helo=mail-wm2-f12.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6abd37c2-fae8-0a2a45030019-4a7de18cadb0-3
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 18:24:34 +0200
Received: by mail-wm2-f12.google.com with SMTP id
 5b1f17b1804b1-49fff6f0f87so28363315e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 09:24:34 -0700 (PDT)
Received: from fedora (user-109-243-71-234.play-internet.pl. [109.243.71.234])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a01cd43e66sm14620485e9.2.2026.09.30.09.24.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Sep 2026 09:24:33 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1790785473; x=1791390273; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GGo8JiaU4BGz4uAdTLdDhy5gCB3LLQOQjuYwzTzEnoI=;
        b=k6fqbtpux/NDhRVRKsMn28O/hV2gEz7tv9KgY47imlYF+EOFCYMCa7+CNoaqoldRTI
         kd2yrJ3oQuRAUk6+MwdXNjRlYYx7Ub3BpW2eATAiiq2t/o9NBodPj7qGXToUvXlGe/GV
         rzaI9RkjZWJ665JFmRvUjS89v58En9azA1ZoE7puwBQW1K2tFLnA37Pr3lBCNbEcm97Q
         cpm5CaJHtiWgiR9KqRJTyUiJDI09Wdiu+J+AHW+st18YkaqUgnnrpcPeVA3rdTUr677m
         M3M2z20ux1fZH3AL61cY8FIOviMDy4AaObrOl7gnR44vD0e+b9WOnkoxPO1Tz3x/cA2E
         pNxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790785473; x=1791390273;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GGo8JiaU4BGz4uAdTLdDhy5gCB3LLQOQjuYwzTzEnoI=;
        b=FWjTvmS+4Px1YNerx3fmPs+Y8SSjhJx1FFQixwhw3fln1AhSipHpeI5KZ2HiSQnxaA
         dTgpndJ+i0teupRf4Zm8gTrs2Lc6W/CKxDorGPD6jli+3ctnxus4h+ILkuoPLvzuselL
         fzhzEDuA25XH8ZdHmVmyyq8urobLHEaFgTHBgs+JoalDbI+9i/focN8uf3xOq2rk+EYU
         ULA/vTelIwI859VHs8xCh2XDAxwlNCIDV4/nNl62Ddk6ErXd+PeQEVBuDb66Pnnq6yDd
         lR20yHhaP5Dcu0PY3MKRzXqfsw2Etl4RqxagcOsUFydJGP8/Prf9NHVg25PztRqPTCTn
         7sWw==
X-Gm-Message-State: AFuF++kvzxcDj/erxjx3fQ8AR0xsAt/qDns7S2+BwOg618+r0IvIPFhR
	sA7VWkzWl6E7RDqvGsUxavk8Sb8+uW4g9uRwyJ4tCzZQdiqVGwrCD2fA9FjDww==
X-Gm-Gg: AYBFou2Pw3WSKipqugnckOEEcZIwywCthuAjFq3+dkQV4Ft55lVV8Mr/bnMBPq+mfqX
	MX+WGZ0dl7rNdVT+ZW5ElmDZTM6eHpKgsqCmaPdIhbMLfRGRakWNuVOTPEPWP2/agOYQnqCfQOT
	G0e+TeMhiRj61RqKi8H00qsvwo1D61x9afxMGmjrzQ/Cqf1YCH8SHZCRJazBcVK44ydAAet2jQe
	7MWmiko3U3/PDaQA5ZCMDnyvyDvOX6ycuoQr2PH9D2GNdlaXx8HaLUYV5bgsoMu5XfoyU3rnLv/
	zO3RgvkH2GbDkLb/xRUDKcn//fA5xDvPztV8wCr5fdVmU32T/nIDCiimc9hLpsv8jXwk2WT/Tac
	Tb3ImFdC/swpPmStpOf4VtZQ2vLcqqjio1DfCLW5X8Hmv9Xk6xwcGVCehaDbJKtS7TzpZsIRBiM
	kiIcFK4Gqz88ttZXum9wzYrd/kjH9WCf/+4BQ6rpM9T+77qucBhwCT3N/MC0ppELG48uS/Nvcqj
	eo8J42Gpqb23Gw4FPcdlbGNzmwpe0UsiW7Pl7Wk
X-Received: by 2002:a05:600c:4e41:b0:4a0:1723:2d90 with SMTP id 5b1f17b1804b1-4a01ad7d018mr28681705e9.4.1790785473389;
        Wed, 30 Sep 2026 09:24:33 -0700 (PDT)
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
Subject: [PATCH v3 29/39] xen/riscv: prepare new IMSIC VS-file
Date: Wed, 30 Sep 2026 18:23:48 +0200
Message-ID: <7f00946a6b1b67e79f94e3c665f8f0ce9d5d0e5a.1790779209.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1790779209.git.oleksii.kurochko@gmail.com>
References: <cover.1790779209.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-33051d/1790785474-75EFF4E9-E575293E/10/73395122804
X-purgate-type: spam
X-purgate-size: 12026

Implement the first steps of migrating a vCPU to a different guest
interrupt file: take an interrupt file on the vCPU's new pCPU with
vgein_assign() and bring it to a clean state by setting eidelivery and
eithreshold to 0 and zeroing all implemented interrupt-pending and
interrupt-enable bits (the eip and eie arrays).

An IMSIC VS-file is reachable only through hstatus.VGEIN of the hart it
belongs to, so the clearing is done by that hart, through
imsic_call_on_cpu(). The helper doing it temporarily retargets
hstatus.VGEIN and vsiselect, which belong to whatever vCPU is running
there, and restores both before returning.

vgein_assign() is only a stub for now. Software interrupt files aren't
supported, so a vCPU which can't be given a hardware one hits a BUG_ON(),
and the BUG_ON("unimplemented") at the end of imsic_migrate_vcpu() stays,
as the migration functionality isn't complete yet.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in v3:
 - Split the switchcase comment so each part sits above the macros it
   describes.
 - Drop imsic_switchcase_ret() as it has no users in this patch.
 - Drop the unused mrif member from struct imsic_vsfile_data.
 - Leave the trailing semicolon of the switchcase macros to their users.
 - Use __VA_ARGS__ instead of the GNU ##__VA_ARGS__ extension and
   parenthesize ireg in the switchcase expansion pyramid.
 - Make imsic_call_on_cpu() take struct imsic_vsfile_data * instead of
   void *.
 - Explain in imsic_vsfile_local_clear() why hstatus and vsiselect are
   saved and restored: the file is reached by retargeting hstatus.VGEIN,
   imsic_vs_csr_write() alters vsiselect, and both belong to the vCPU
   running on the pCPU.
 - Introduce imsic_eix_write64() to write a whole 64-bit EIx group,
   documenting the EIx register layout on RV32 vs RV64 above it, which
   lets the #ifdef CONFIG_RISCV_32 in imsic_vsfile_local_clear() go.
 - Drop the unclear "Latch the pCPU" comment.
 - Drop the redundant parentheses around the arguments of
   imsic_vs_csr_write() as they are passed to csr_*() as whole expressions.
 - Add missing break after ASSERT_UNREACHABLE() in the default case of
   imsic_eix_write().
 - Compute the number of EIx groups once in imsic_parse_node() and keep it
   in imsic_cfg.nr_eix instead of recalculating it on each migration.
 - Drop the introduction of BITS_PER_TYPE() in xen/include/xen/config.h as
   plain 64 is used instead.
 - Minor style and wording fixes: "} while (0)" in imsic_vs_csr_write(),
   no "\n" in the BUG_ON() message of vgein_assign(), and the extra args of
   the switchcase expansion pyramid are no longer described as optional.
 - Rewrite the commit message: it described saving eidelivery/eithreshold
   of the old interrupt file, which isn't done here, and adding the
   BUG_ON("unimplemented") placeholder, which is already present.
 - Drop the new_vsfile_{hgei,cpu} locals: vsfile_data.hgei and v->processor
   serve the same purpose.
---
Changes in v2:
 - New patch.
---
---
 xen/arch/riscv/aia.c               |   9 ++
 xen/arch/riscv/imsic.c             | 159 +++++++++++++++++++++++++++++
 xen/arch/riscv/include/asm/aia.h   |   4 +
 xen/arch/riscv/include/asm/imsic.h |   7 ++
 4 files changed, 179 insertions(+)

diff --git a/xen/arch/riscv/aia.c b/xen/arch/riscv/aia.c
index e31c9c2d24b6..229ab4b8678e 100644
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
+    BUG_ON("unimplemented");
+
+    return 0;
+}
diff --git a/xen/arch/riscv/imsic.c b/xen/arch/riscv/imsic.c
index 2f0bb29ae639..f1e44dc56bb8 100644
--- a/xen/arch/riscv/imsic.c
+++ b/xen/arch/riscv/imsic.c
@@ -26,6 +26,7 @@
 #include <xen/spinlock.h>
 #include <xen/xvmalloc.h>
 
+#include <asm/aia.h>
 #include <asm/imsic.h>
 
 #define IMSIC_HART_SIZE(guest_bits) (BIT(guest_bits, U) * IMSIC_MMIO_PAGE_SZ)
@@ -77,6 +78,72 @@ do {                            \
     csr_clear(CSR_SIREG, v);    \
 } while (0)
 
+#define imsic_vs_csr_write(c, v)    \
+do {                                \
+    csr_write(CSR_VSISELECT, c);    \
+    csr_write(CSR_VSIREG, v);       \
+} while (0)
+
+/*
+ * Leaf macros for the switchcase expansion pyramid below:
+ * imsic_switchcase_break(ireg, op, v) - emit "case ireg: op(ireg, v); break"
+ */
+#define imsic_switchcase_break(ireg, op, v) \
+    case ireg:                              \
+        op(ireg, v);                        \
+        break
+
+/*
+ * Generic switchcase expansion pyramid.
+ * F is the per-operation leaf macro, ireg is the base register index.
+ * Extra args (e.g. an operation and/or a value) are forwarded to F via
+ * __VA_ARGS__.
+ */
+#define imsic_switchcase_2(F, ireg, ...)             \
+    F((ireg) + 0, __VA_ARGS__);                      \
+    F((ireg) + 1, __VA_ARGS__)
+#define imsic_switchcase_4(F, ireg, ...)             \
+    imsic_switchcase_2(F, (ireg) + 0, __VA_ARGS__);  \
+    imsic_switchcase_2(F, (ireg) + 2, __VA_ARGS__)
+#define imsic_switchcase_8(F, ireg, ...)             \
+    imsic_switchcase_4(F, (ireg) + 0, __VA_ARGS__);  \
+    imsic_switchcase_4(F, (ireg) + 4, __VA_ARGS__)
+#define imsic_switchcase_16(F, ireg, ...)            \
+    imsic_switchcase_8(F, (ireg) + 0, __VA_ARGS__);  \
+    imsic_switchcase_8(F, (ireg) + 8, __VA_ARGS__)
+#define imsic_switchcase_32(F, ireg, ...)            \
+    imsic_switchcase_16(F, (ireg) + 0, __VA_ARGS__); \
+    imsic_switchcase_16(F, (ireg) + 16, __VA_ARGS__)
+#define imsic_switchcase_64(F, ireg, ...)            \
+    imsic_switchcase_32(F, (ireg) + 0, __VA_ARGS__); \
+    imsic_switchcase_32(F, (ireg) + 32, __VA_ARGS__)
+
+static void imsic_eix_write(unsigned int ireg, unsigned long val)
+{
+    switch ( ireg )
+    {
+    imsic_switchcase_64(imsic_switchcase_break, IMSIC_EIP0,
+                        imsic_vs_csr_write, val);
+    imsic_switchcase_64(imsic_switchcase_break, IMSIC_EIE0,
+                        imsic_vs_csr_write, val);
+    default:
+        ASSERT_UNREACHABLE();
+        break;
+    }
+}
+
+/*
+ * On RV64 a 64-bit EIx group is the even-numbered register alone, whereas on
+ * RV32 it is split into the even-numbered (low half) and the following
+ * odd-numbered (high half) register.
+ */
+static void imsic_eix_write64(unsigned int ireg, uint64_t val)
+{
+    imsic_eix_write(ireg, val);
+    if ( IS_ENABLED(CONFIG_RISCV_32) )
+        imsic_eix_write(ireg + 1, val >> 32);
+}
+
 unsigned int vcpu_guest_file_id(const struct vcpu *v)
 {
     return ACCESS_ONCE(v->arch.vimsic_state->guest_file_id);
@@ -318,6 +385,8 @@ static int __init imsic_parse_node(const struct dt_device_node *node,
         return -ENOENT;
     }
 
+    imsic_cfg.nr_eix = DIV_ROUND_UP(imsic_cfg.nr_ids + 1, 64);
+
     /* Compute base address */
     *nr_mmios = 0;
     rc = dt_device_get_address(node, *nr_mmios, &base_addr, NULL);
@@ -389,6 +458,79 @@ int cf_check vcpu_imsic_init(struct vcpu *v)
     return 0;
 }
 
+/*
+ * The imsic_vsfile_local_*() helpers have to run on the pCPU owning the
+ * interrupt file, so they are called through imsic_call_on_cpu(), which
+ * passes them a single pointer. Their arguments are bundled here.
+ */
+struct imsic_vsfile_data {
+    /* Guest interrupt file to work on, i.e. the hstatus.VGEIN selecting it. */
+    unsigned int hgei;
+    /* Number of 64-bit EIx groups to cover, see imsic_cfg.nr_eix. */
+    unsigned int nr_eix;
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
+                              struct imsic_vsfile_data *data)
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
+    /*
+     * The file is reached by retargeting hstatus.VGEIN, and
+     * imsic_vs_csr_write() alters vsiselect. Both belong to the vCPU running
+     * on this pCPU, so restore them before returning.
+     */
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
+        imsic_eix_write64(IMSIC_EIP0 + i * 2, 0);
+        imsic_eix_write64(IMSIC_EIE0 + i * 2, 0);
+    }
+
+    csr_write(CSR_HSTATUS, old_hstatus);
+    csr_write(CSR_VSISELECT, old_vsiselect);
+}
+
 void cf_check vcpu_imsic_deinit(struct vcpu *v)
 {
     XVFREE(v->arch.vimsic_state);
@@ -693,6 +835,10 @@ int __init vimsic_make_domu_dt_node(struct kernel_info *kinfo,
 
 void imsic_migrate_vcpu(struct vcpu *v)
 {
+    struct imsic_vsfile_data vsfile_data = {
+        .nr_eix = imsic_cfg.nr_eix,
+    };
+
     /*
      * The scheduler can mark a freshly created vCPU's unit as migrated and
      * invoke this before the vCPU has ever run (see the migrated branch in
@@ -703,5 +849,18 @@ void imsic_migrate_vcpu(struct vcpu *v)
     if ( v->arch.last_cpu == CPU_NONE )
         return;
 
+    /*
+     * At this point, all interrupt producers are still using the old IMSIC
+     * VS-file.
+     */
+
+    vsfile_data.hgei = vgein_assign(v);
+
+    /* We don't support SW interrupt files at the moment. */
+    BUG_ON(!vsfile_data.hgei);
+
+    /* Zero-out new IMSIC VS-file */
+    imsic_call_on_cpu(v->processor, imsic_vsfile_local_clear, &vsfile_data);
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
diff --git a/xen/arch/riscv/include/asm/imsic.h b/xen/arch/riscv/include/asm/imsic.h
index 22ce90e2e9b3..8130d125f5c3 100644
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
 
-- 
2.55.0


