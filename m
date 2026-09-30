Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 308F1CA5FC7
	for <xen-devel@archiver.kernel.org>; Wed, 30 Sep 2026 16:20:02 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1437481.1656419 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBx28-0007HN-GE; Wed, 30 Sep 2026 16:19:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1437481.1656419; Wed, 30 Sep 2026 16:19:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBx28-0007Gy-7L; Wed, 30 Sep 2026 16:19:52 +0000
Received: by outflank-mailman (input) for mailman id 1437481;
 Wed, 30 Sep 2026 16:19:50 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xBx26-0006xa-HT
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2026 16:19:50 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xBx25-0008es-UT
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2026 18:19:49 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6abd36a3-8faa-0a2a0a5109dd-0a2a4507c56a-2
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 18:19:49 +0200
Received: from [74.125.225.141] (helo=mail-wm2-f13.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6abd36a5-b4ea-0a2a45070019-4a7de18df63e-3
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 18:19:49 +0200
Received: by mail-wm2-f13.google.com with SMTP id
 5b1f17b1804b1-49ff9642c57so10087755e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 09:19:49 -0700 (PDT)
Received: from fedora (user-109-243-71-234.play-internet.pl. [109.243.71.234])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a01eb60804sm2807245e9.1.2026.09.30.09.19.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Sep 2026 09:19:48 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1790785189; x=1791389989; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PlfN5CBy9cV3u57McoKXQYsgCREbvWm+6jvR2D7bz88=;
        b=aMwZ+fAH8OdyTgiLvN+pwOp0tvkJ6xNdohBOzT6Z0vZmdP2IvLydmE5I9aYvdI0PsR
         ow1i2jxi1yExPV27a0Rx9aea5uVXlHZGC3TzmAPB3OQ9cnG15Nr6MwCQ9tCpxFnuk8yk
         t83ESck2reSP4gsMCYFk5IxMhpKttOMlGUeedAYhR5JvEAGb6Oe8M2yGjt4XnSPCbRg0
         tznY9aGTGTSr9d5LaJeJMmemnoZRR6Y8158ION3vuvp35Nh3/H6pGEe9F3KiAV10/+Ut
         f5u3UNOyEnshDtTlqGbed3BiPqmEshojQMTE0NiAM4pu8wzB37WF50ZgMbeOtKgtrnyq
         8TXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790785189; x=1791389989;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PlfN5CBy9cV3u57McoKXQYsgCREbvWm+6jvR2D7bz88=;
        b=phxEcwBHdpcb70zPvHnsB5+SKWDJY5VKRGHVlw7bG90zoC5CYF7bGKR4o3nJ+6vPri
         Nr6kkqhTMFq2du3lk2ZXZnHp6gCUpPwy2F1BuaF5zIslvDQ6jl43BPhnkNyXTqoYw/0N
         CVcx7adWSI11gkg/lGEs/8c6ben1oVnot4EmUVMQLczWtGnhoqwLhmhlal1GK8GeRJJh
         um8uc7m1WmM4kEYzN9emoI+/26S+APs0GOj2SYlGgkTBEmiG1guW0jTiKZ12KO8FkW/K
         2dcozqbOjdLKzHp0QAWnyVM+dBeu9j97Z4+SEEw3/SeTuskIBzQ4QphGjgPMK4F3OFmE
         EdBg==
X-Gm-Message-State: AFuF++liX7+HW7ULQe+VMkPXyxmhgbNh0rSxv/P0/krOl+Yhr0uonlO3
	9NEdZnNhJtYCh3QPgeF0Y9Gdp+irUKtpVLr8/7mgtz8u7lD6CSSkmCYzLTC7+Q==
X-Gm-Gg: AYBFou2or+4zNKsYBfvYVe8xq7akKWr7++neSoYMNSEBPdiN/qcR86tUnpsF+3u76J+
	g4l1YLIVRIG/O/QyHvKukPHSA/Fr+ynk3iJq0OwnOGG5v3D00yqW+NKx6C13LcRLmNJNX7RL9Vj
	XWI2ANkVCmiphF149KMyqTDEmakcjX5wa6lNe9VioNYmOmcXi/MAs+tUyFikkdpR7B1DMjhYx/X
	urg4INByss3Qe1WvN1K6vKgFV9987QiO5QvzvIj+3U4uHP0knLYC+ym/gmChx0WRYEY5m3Jg7rI
	kqG0/8V34znY17nvDm7nFLGLVYh1ZbPMLoYdq/4/kH8HGZOSXIs974kuMIQXYtu1avoRHXf8GzT
	M8bEH6gyhqnZttwJ4LlZsIkJjiWC8V+Nst/ULjrlBvPebUkq+z1i4TeW65jD1VTbVfwBEQ+vBW9
	Zx3491HGPSKAXIWtHRRT2cj/mzT31kpHE3Gz6v+n74Og3SxqK5ytovR+HYGyW7XOzx+VB54it7R
	1LvH/IisWE14KSfOCqlHjLaOrEH2GRcgwqk6CaH
X-Received: by 2002:a05:600c:4ba3:b0:49f:fefc:7d01 with SMTP id 5b1f17b1804b1-4a01eb1339emr1588995e9.15.1790785189193;
        Wed, 30 Sep 2026 09:19:49 -0700 (PDT)
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
Subject: [PATCH v3 09/39] xen/riscv: build the target hart index via aplic_hart_index()
Date: Wed, 30 Sep 2026 18:18:51 +0200
Message-ID: <ba71bd0de931eab1205a1139e160f40b72bda421.1790779209.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1790779209.git.oleksii.kurochko@gmail.com>
References: <cover.1790779209.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ef75cf/1790785189-370DDAE4-389A3620/10/73395122804
X-purgate-type: spam
X-purgate-size: 5239

aplic_set_irq_affinity() open-coded the packing of the group and hart
indices into the target register, and got two things wrong along the
way:

 - imsic_config.msi[] is indexed by logical CPU id, but the index was
   run through cpuid_to_hartid() first. On any platform where the two
   spaces differ this picks another CPU's interrupt file, or reads past
   the array;

 - the same hart id was then used verbatim as the low hart index, and
   the group index was derived from msi[].base_addr alone. The hart
   index bits live in msi[].offset, the base address only covers the
   MMIO regset, which may hold the files of several harts. Both indices
   have to come out of base_addr + offset.

aplic_hart_index() already extracts them that way, and is what the vAPLIC
target path uses, so call it here as well and insert the result with
MASK_INSR(APLIC_TARGET_HART_IDX) instead of a bare shift, which keeps the
value from spilling out of the 14-bit field. This drops the last in-tree
duplicate of the AIA hart index formula, and with it the last user of
APLIC_TARGET_HART_IDX_SHIFT, which is removed.

desc->irq is used as the EIID as is. Assert that it is a valid APLIC
source, which also guarantees that it fits the EIID field.

No functional change on a single-group platform whose hart ids match
their CPU ids and whose IMSIC regset holds one file per hart.

Fixes: d4676a1398bc ("xen/riscv: implementation of aplic and imsic operations")
Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in v3:
 - s/aplic_hart_field/aplic_hart_index/ (in the subject too) following the
   rename of the helper in "xen/riscv: implement virtual APLIC MMIO
   emulation".
 - Don't mask desc->irq with APLIC_TARGET_EIID. Instead, bound it by
   the APLIC source range rather than NR_IRQS, which will also have to
   cover device MSIs: add a BUILD_BUG_ON() that ARRAY_SIZE(target) fits
   the EIID field and an ASSERT() that desc->irq is a valid APLIC source
   (1..num_irqs), which also covers the target[desc->irq - 1] index.
---
Changes in v2:
 - New patch.
---
---
 xen/arch/riscv/aplic.c             | 33 ++++++++++--------------------
 xen/arch/riscv/include/asm/aplic.h |  1 -
 2 files changed, 11 insertions(+), 23 deletions(-)

diff --git a/xen/arch/riscv/aplic.c b/xen/arch/riscv/aplic.c
index febc451760bf..62bbcc9afacf 100644
--- a/xen/arch/riscv/aplic.c
+++ b/xen/arch/riscv/aplic.c
@@ -335,9 +335,7 @@ static unsigned int aplic_get_cpu_from_mask(const cpumask_t *cpumask)
 static void cf_check aplic_set_irq_affinity(struct irq_desc *desc, const cpumask_t *mask)
 {
     unsigned int cpu;
-    uint64_t group_index, base_ppn;
-    uint32_t hhxw, lhxw, hhxs, value;
-    const struct imsic_config *imsic = aplic.imsic_cfg;
+    uint32_t value;
 
     /*
      * TODO: Currently, APLIC is supported only with MSI interrupts.
@@ -350,27 +348,18 @@ static void cf_check aplic_set_irq_affinity(struct irq_desc *desc, const cpumask
 
     ASSERT(spin_is_locked(&desc->lock));
 
-    cpu = cpuid_to_hartid(aplic_get_cpu_from_mask(mask));
-    hhxw = imsic->group_index_bits;
-    lhxw = imsic->hart_index_bits;
+    cpu = aplic_get_cpu_from_mask(mask);
+
     /*
-     * Although this variable is used only once in the calculation of
-     * group_index, and it might seem that hhxs could be defined as:
-     *   hhxs = imsic->group_index_shift - IMSIC_MMIO_PAGE_SHIFT;
-     * and then the addition of IMSIC_MMIO_PAGE_SHIFT could be omitted
-     * when calculating the group index.
-     * It was done intentionally this way to follow the formula from
-     * the AIA specification for calculating the MSI address.
+     * desc->irq is used as the EIID as-is, which is only valid for APLIC
+     * sources: they are numbered 1..num_irqs, with at most ARRAY_SIZE(target).
      */
-    hhxs = imsic->group_index_shift - IMSIC_MMIO_PAGE_SHIFT * 2;
-    base_ppn = imsic->msi[cpu].base_addr >> IMSIC_MMIO_PAGE_SHIFT;
-
-    /* Update hart and EEID in the target register */
-    group_index = (base_ppn >> (hhxs + IMSIC_MMIO_PAGE_SHIFT)) &
-                  (BIT(hhxw, UL) - 1);
-    value = desc->irq;
-    value |= cpu << APLIC_TARGET_HART_IDX_SHIFT;
-    value |= group_index << (lhxw + APLIC_TARGET_HART_IDX_SHIFT);
+    BUILD_BUG_ON(ARRAY_SIZE(aplic.regs->target) >
+                 MASK_EXTR(~0U, APLIC_TARGET_EIID));
+    ASSERT(desc->irq && desc->irq <= aplic_info.num_irqs);
+
+    value = MASK_INSR(aplic_hart_index(cpu), APLIC_TARGET_HART_IDX) |
+            desc->irq;
 
     spin_lock(&aplic.lock);
 
diff --git a/xen/arch/riscv/include/asm/aplic.h b/xen/arch/riscv/include/asm/aplic.h
index 664bda2cb7eb..9018936ca95a 100644
--- a/xen/arch/riscv/include/asm/aplic.h
+++ b/xen/arch/riscv/include/asm/aplic.h
@@ -98,7 +98,6 @@
 #define APLIC_TARGET_BASE               0x3004
 #define APLIC_TARGET_LAST               0x3ffc
 #define  APLIC_TARGET_HART_IDX          GENMASK(31, 18)
-#define  APLIC_TARGET_HART_IDX_SHIFT    18
 #define  APLIC_TARGET_GUEST_IDX         GENMASK(17, 12)
 /* Bit 11 is reserved and reads as zero */
 #define  APLIC_TARGET_EIID              GENMASK(10, 0)
-- 
2.55.0


