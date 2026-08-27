Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A48F6C61DC4
	for <xen-devel@archiver.kernel.org>; Thu, 27 Aug 2026 15:22:07 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1400930.1636620 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzbvQ-0008QC-K4; Thu, 27 Aug 2026 15:21:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1400930.1636620; Thu, 27 Aug 2026 15:21:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzbvQ-0008Pv-E8; Thu, 27 Aug 2026 15:21:56 +0000
Received: by outflank-mailman (input) for mailman id 1400930;
 Thu, 27 Aug 2026 15:21:55 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wzbvP-0008My-O3
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2026 15:21:55 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wzbvP-009ksf-4Q
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2026 17:21:55 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a9055fd-2eae-0a2a0a5409dd-0a2a45029cdc-30
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 17:21:55 +0200
Received: from [209.85.128.42] (helo=mail-wm1-f42.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a905612-6ca4-0a2a45020019-d155802addd0-3
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 17:21:55 +0200
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-499ac87c92bso20713995e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 08:21:55 -0700 (PDT)
Received: from fedora (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49b4b2d6b30sm57441155e9.14.2026.08.27.08.21.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Aug 2026 08:21:53 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1787844114; x=1788448914; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/P8xZRmILVBwvtPdkB4I0aQ1y0MycS9Llx86VOjksHY=;
        b=FD4vFwDRDUqPDdZWTlz2kaoaO6aDNVb32rh0cNcXc/RFPyc0XY9SoAhKiX8g4GEV00
         uzhFNZBjQnWhE0FShkjB1chUoiqI0EWulGlWp6sAVJ12xyyBwdConyiKTGmLERzsMSVA
         yMBl3N4l24f9Vk43S9ROF9qb2LYnjHyri0OUoajBOif114JO77m9zWgLMNqG9AZ9glU9
         /DtAEtssEW+Ckpg/C6QPYslm0lX8IJnSZSoE+scvaWiZOjMEJHp6ZHVoq1/Y0miNTGUj
         UWTbbEdXwLu5d0BuIX/zWgzglTfK8c2VcnGibyReWlJYi0F+ZC6P/3p8sWYgIJVwNrBD
         kI7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787844114; x=1788448914;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/P8xZRmILVBwvtPdkB4I0aQ1y0MycS9Llx86VOjksHY=;
        b=dZbLfdc7GVM3U0lXaG8gQvjGVY66p/M0keepWnMbAQB1oheShZpQxgnIe3L1Ua1rKG
         n5UYc6sI+eN+IgP9jUq41eaFatt/jUth9av3vA+rG1c33mmE5dtRHPDwujnJplREdGL4
         FmDhkJTFFAW1bdYt8WOl9uc2eravHyjKK/WN4F9KOE9DW0nMAYeQwpD5WZGF1dFk7DQu
         aCyf2wlcs9GmgrW9noAUdyPF8JLwPVMMM1xEoMSw2tWW6Ner75Pn741stsQsUEE5EPH/
         KVVAlX8F+nsd348u4MJrOLBkyDahWg5Ov0F0wA31t5iboBG8+b+gKxz0gR3ccNYCk2OA
         YSow==
X-Gm-Message-State: AFuF++myjZrdQgMCJcxjFooqi8iI8N+OO5c46LES/bi8QwnFnBkeOYGZ
	SLzmJLWF/S2dHdjFxNHMC8NMkioHPFjHRmkRBdgwPCA4z1BJIujXB6jmpatzEQ==
X-Gm-Gg: AR+sD10S7JlFcL0jpbnSKIyZh8EQ7sNFVxaFKDHohMPBkxqDQcY+sKps9QqwiDPBjJe
	z4fosNQT+qLoI26SxIPZ3vxfycy+fVl4yk1sCTSU/dV49Y2pvMg9dHK/0LDzGrSDYeBHyUzGf1H
	oEEsEMAKqBdqmYFOLVYDjFTliZk6kjzD+zBbCb3XWr9OMsqGNvDTOLwkvXMmi6pqDNVnpXnSbDu
	Lknk0EkRLFVZTgv+an6SzoQ6G5W0LKfJUzfNDYGRaw19STNaQaw/enSLmzyfyFYdVdZPYuS7nJ1
	TfNiCI0TUpRU2btaqR2KB5z5LWy6JajDUVgphTxw6SR+7REsoXLg2hvd7Ap4rqBBB6Fd+l7pgwi
	NOtyKCPANXSpSsJg7Ys5i9lB976pKrRhjV3bAsLNeyZGE/q+wTlc7U/BTKfX1dmtHUSEb/zBDv1
	OUJrFJSlSPbeL+KdARwmqu2TMG4MoQzdsbVKC/qFt9Sz0Q4mDOwrHlAJQA45b8tqFqtFikgZ1ER
	drd79WSYBhtefbxrbEr1Ftvq1QzmqvW
X-Received: by 2002:a05:600c:34c3:b0:495:4d88:e630 with SMTP id 5b1f17b1804b1-499dc720bd2mr214670815e9.10.1787844113604;
        Thu, 27 Aug 2026 08:21:53 -0700 (PDT)
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
Subject: [PATCH v2 10/39] xen/riscv: build the target hart index via aplic_hart_field()
Date: Thu, 27 Aug 2026 17:20:54 +0200
Message-ID: <3c7418d64a730ec5e4b2cfd0ecfbbbc6fe0bf7d8.1787838835.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1787838835.git.oleksii.kurochko@gmail.com>
References: <cover.1787838835.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-720697/1787844115-F2CB22AC-6949A792/10/73395122804
X-purgate-type: spam
X-purgate-size: 4299

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

aplic_hart_field() already extracts them that way, and is what the vAPLIC
target path uses, so call it here as well and insert the result with
MASK_INSR(APLIC_TARGET_HART_IDX) instead of a bare shift, which keeps the
value from spilling out of the 14-bit field. This also drops the last
in-tree duplicate of the AIA hart index formula. So drop defintion of
APLIC_TARGET_HART_IDX_SHIFT.

No functional change on a single-group platform whose hart ids match
their CPU ids and whose IMSIC regset holds one file per hart.

Fixes: d4676a1398bc ("xen/riscv: implementation of aplic and imsic operations")
Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in v2:
 - New patch.
---
---
 xen/arch/riscv/aplic.c             | 30 ++++++------------------------
 xen/arch/riscv/include/asm/aplic.h |  1 -
 2 files changed, 6 insertions(+), 25 deletions(-)

diff --git a/xen/arch/riscv/aplic.c b/xen/arch/riscv/aplic.c
index 66ba4986a9ff..319a954f6f3c 100644
--- a/xen/arch/riscv/aplic.c
+++ b/xen/arch/riscv/aplic.c
@@ -325,9 +325,7 @@ static unsigned int aplic_get_cpu_from_mask(const cpumask_t *cpumask)
 static void cf_check aplic_set_irq_affinity(struct irq_desc *desc, const cpumask_t *mask)
 {
     unsigned int cpu;
-    uint64_t group_index, base_ppn;
-    uint32_t hhxw, lhxw, hhxs, value;
-    const struct imsic_config *imsic = aplic.imsic_cfg;
+    uint32_t value;
 
     /*
      * TODO: Currently, APLIC is supported only with MSI interrupts.
@@ -340,27 +338,11 @@ static void cf_check aplic_set_irq_affinity(struct irq_desc *desc, const cpumask
 
     ASSERT(spin_is_locked(&desc->lock));
 
-    cpu = cpuid_to_hartid(aplic_get_cpu_from_mask(mask));
-    hhxw = imsic->group_index_bits;
-    lhxw = imsic->hart_index_bits;
-    /*
-     * Although this variable is used only once in the calculation of
-     * group_index, and it might seem that hhxs could be defined as:
-     *   hhxs = imsic->group_index_shift - IMSIC_MMIO_PAGE_SHIFT;
-     * and then the addition of IMSIC_MMIO_PAGE_SHIFT could be omitted
-     * when calculating the group index.
-     * It was done intentionally this way to follow the formula from
-     * the AIA specification for calculating the MSI address.
-     */
-    hhxs = imsic->group_index_shift - IMSIC_MMIO_PAGE_SHIFT * 2;
-    base_ppn = imsic->msi[cpu].base_addr >> IMSIC_MMIO_PAGE_SHIFT;
-
-    /* Update hart and EEID in the target register */
-    group_index = (base_ppn >> (hhxs + IMSIC_MMIO_PAGE_SHIFT)) &
-                  (BIT(hhxw, UL) - 1);
-    value = desc->irq;
-    value |= cpu << APLIC_TARGET_HART_IDX_SHIFT;
-    value |= group_index << (lhxw + APLIC_TARGET_HART_IDX_SHIFT);
+    cpu = aplic_get_cpu_from_mask(mask);
+
+    /* Update hart index and EIID in the target register */
+    value = MASK_INSR(aplic_hart_field(cpu), APLIC_TARGET_HART_IDX) |
+            (desc->irq & APLIC_TARGET_EIID);
 
     spin_lock(&aplic.lock);
 
diff --git a/xen/arch/riscv/include/asm/aplic.h b/xen/arch/riscv/include/asm/aplic.h
index babba386071f..d629e1c83887 100644
--- a/xen/arch/riscv/include/asm/aplic.h
+++ b/xen/arch/riscv/include/asm/aplic.h
@@ -92,7 +92,6 @@
 #define APLIC_TARGET_BASE               0x3004
 #define APLIC_TARGET_LAST               0x3ffc
 #define  APLIC_TARGET_HART_IDX          GENMASK(31, 18)
-#define  APLIC_TARGET_HART_IDX_SHIFT    18
 #define  APLIC_TARGET_GUEST_IDX         GENMASK(17, 12)
 /* Bit 11 is reserved and reads as zero */
 #define  APLIC_TARGET_EIID              GENMASK(10, 0)
-- 
2.55.0


