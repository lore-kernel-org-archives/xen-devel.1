Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 802ABC61DC4
	for <xen-devel@archiver.kernel.org>; Thu, 27 Aug 2026 15:22:59 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1401003.1636798 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzbw8-00080f-46; Thu, 27 Aug 2026 15:22:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1401003.1636798; Thu, 27 Aug 2026 15:22:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzbw6-0007sH-E8; Thu, 27 Aug 2026 15:22:38 +0000
Received: by outflank-mailman (input) for mailman id 1401003;
 Thu, 27 Aug 2026 15:22:29 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wzbvw-00061F-Kk
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2026 15:22:28 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wzbvw-009l5h-0d
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2026 17:22:28 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a905633-8faa-0a2a0a5109dd-0a2a450293fc-2
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 17:22:27 +0200
Received: from [209.85.221.47] (helo=mail-wr1-f47.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a905633-6ca4-0a2a45020019-d155dd2fe4a8-3
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 17:22:27 +0200
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-482ea739de2so825835f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 08:22:27 -0700 (PDT)
Received: from fedora (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49b4b2d6b30sm57441155e9.14.2026.08.27.08.22.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Aug 2026 08:22:27 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1787844147; x=1788448947; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MsgUegOsMRroKwEVJzn4qlUJHeFHlyzxMsZorMiGJUg=;
        b=jPKv+VZHqmrXQ+wpOBzC1pIZ/Pt26uOUJUyXJ1vl+t0XreALz24dW2NBUNpzodbYk7
         OpncygdQOzqwR4i4MtkPuk0DYK7AKQukvR86sM+vl0eDsC1t+ciYL/WjfaxbyTs1zw09
         Y1+DKsaUel00H6im69YGz/dtOOKK+z4coUaDApDujtcuHXZOfuQ4mhbXjhHyXEXnjopq
         06+haSQ+U0uXN3NgmUuLUjQ8QCmQAez4SR7XeyfQs4vO3/cj+3HPzvk3XpSCg2xsPI8u
         fp3EFTAKU7tRZc7y/UpcgGnnezyW60CnNtHTUTCKRZkYCFPOOFYfANCOAe3pSulw+mlB
         8MZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787844147; x=1788448947;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MsgUegOsMRroKwEVJzn4qlUJHeFHlyzxMsZorMiGJUg=;
        b=WT6Wphmgp62vSNds/iwho8MzHlVROaGRixlnXXYzj7MsWemZZN9Vuu9ygyYgKt5XuU
         zkL7pRvuT7tq+qR4N53WPp0PwyxzhSYk6ppCq0V1nC6byPs+ZMK+p7AQca/AKigXlGsa
         oRD3XbAUTEC9LSqMNZvuFQHxSavPj5vyEpNwlddK9ozYPKbVxHsqMVlX8DCPXFbsfQf8
         ICXzo82va0VEA41Q79+XFwKXr9mn14AKA6Z/9W6KtmVU9CTTZVFP2+E4UPbS9ot2kKIL
         1J+sa7zd3z3oPbz0eBrht7xXjMe59DXmNiwBE6lKeu0ugcIUq/Kwp2K9zZbQ3XQ/DhoU
         mLLw==
X-Gm-Message-State: AFuF++m97P6sBAtGqzk1mXjD8IeMR1vcnk1T2gsFmLK94m1ffT/Z75mB
	3OxpF2UFASheffBpngjqA1cRxdkT3UiZDYPghWK3Flg2PZkxVbWmh2RiqnZHmQ==
X-Gm-Gg: AR+sD13RzE6bni9GV0QMN5wZfgRqVT7UjaSFo0UUwh0btxunTVCEV11EDfBi7yNafed
	PMWT5WE7pXV9INWyJXl2hwUF9h6FLk0N6OgtyjnWVzi6Jjsm1wNIBURDrT6DthkxYYx1Tna++L4
	VWRMnul7YT2wR6GDlTXTQWTLQq7fCS1LGfHOtJJ+40vtvBIooN3C5/gau9nNQJY39UV3Qk86qIB
	X7o+1WyfPwKtlwSimQRCrwpC1ncQupiI1ZDeaT4zmiAn79GjzAHt6tDP5cFjspTyl5wn7U6sHjn
	IQNvsEr1bwgvs4rpxyA+QvvrqWAYahhdgUhilcYORdv765K6BoQnbFLpFC1qURDU2vzDQQhFlcp
	7wY/O845GCrf2YiuHor08mN8PQGxZvgNBxrxKNdy1kYmdFDN2fKRTan/1YPSBrQjLJPyc/yU/13
	u8Tw0PVBu9vPXBr8Sp5JDwqiRiIv75O+4JbXFxXgDzX6faidFzea1puKjYUeyy74M2gM5uljVJr
	LPTVS8R5cguQCdrLyfRGiwwEXO58BqZPDGpR0nK+ec=
X-Received: by 2002:a05:600c:8b75:b0:499:db6d:bc97 with SMTP id 5b1f17b1804b1-499dc6a4a85mr194824605e9.0.1787844147329;
        Thu, 27 Aug 2026 08:22:27 -0700 (PDT)
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
Subject: [PATCH v2 31/39] xen/riscv: implement APLIC-hart sync barrier for vCPU migration
Date: Thu, 27 Aug 2026 17:21:15 +0200
Message-ID: <3d953b6e7f221f4cf4143454076466fab38b6236.1787838835.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1787838835.git.oleksii.kurochko@gmail.com>
References: <cover.1787838835.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-720697/1787844147-F3CBA2AC-1E57114B/10/73395122804
X-purgate-type: spam
X-purgate-size: 4460

During migration of a virtual hart to a different guest interrupt file,
straggler MSIs from the APLIC could arrive at the old interrupt file
after the switch.

genmsi is used despite not supporting guest interrupt files because the
AIA spec guarantees that all MSIs previously sent from the APLIC to the
same hart are visible at the hart's IMSIC before the extempore MSI from
genmsi becomes visible.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in v2:
 - New patch.
---
---
 xen/arch/riscv/aplic.c             | 26 ++++++++++++++++++++++++++
 xen/arch/riscv/imsic.c             | 12 ++++++++++++
 xen/arch/riscv/include/asm/aplic.h |  3 +++
 xen/arch/riscv/include/asm/imsic.h |  8 ++++++++
 4 files changed, 49 insertions(+)

diff --git a/xen/arch/riscv/aplic.c b/xen/arch/riscv/aplic.c
index 0af13f28e467..cb11d6aeaaa9 100644
--- a/xen/arch/riscv/aplic.c
+++ b/xen/arch/riscv/aplic.c
@@ -27,7 +27,9 @@
 #include <asm/imsic.h>
 #include <asm/intc.h>
 #include <asm/io.h>
+#include <asm/processor.h>
 #include <asm/riscv_encoding.h>
+#include <asm/smp.h>
 
 static struct aplic_priv aplic = {
     .lock = SPIN_LOCK_UNLOCKED,
@@ -205,6 +207,30 @@ void aplic_hw_write_reg(unsigned int offset, uint32_t value)
     spin_unlock_irqrestore(&aplic.lock, flags);
 }
 
+/*
+ * As needed, synchronize with all IOMMUs and APLICs to ensure that no
+ * straggler MSIs will arrive at the old interrupt file after this step.
+ */
+void aplic_genmsi_barrier(void)
+{
+    const struct imsic_config *imsic = imsic_get_config();
+    unsigned int cpu = smp_processor_id();
+    unsigned long flags;
+    uint32_t val;
+
+    val = MASK_INSR(aplic_hart_field(cpu), APLIC_TARGET_HART_IDX) |
+          (imsic->sync_id & APLIC_TARGET_EIID);
+
+    spin_lock_irqsave(&aplic.lock, flags);
+
+    writel(val, &aplic.regs->genmsi);
+
+    while ( readl(&aplic.regs->genmsi) & APLIC_GENMSI_BUSY )
+        cpu_relax();
+
+    spin_unlock_irqrestore(&aplic.lock, flags);
+}
+
 static void __init aplic_init_hw_interrupts(void)
 {
     unsigned int i;
diff --git a/xen/arch/riscv/imsic.c b/xen/arch/riscv/imsic.c
index 516f0105352a..5de45949610d 100644
--- a/xen/arch/riscv/imsic.c
+++ b/xen/arch/riscv/imsic.c
@@ -195,6 +195,15 @@ void imsic_irq_enable(unsigned int irq)
      */
     ASSERT(!local_irq_is_enabled());
 
+    if ( irq == imsic_cfg.sync_id )
+    {
+        printk(XENLOG_WARNING
+               "irq%u is reserved for APLIC sync so shouldn't be set by %s\n",
+               irq, __func__);
+
+        return;
+    }
+
     spin_lock(&imsic_cfg.lock);
     /*
      * There is no irq - 1 here (look at aplic_set_irq_type()) because:
@@ -377,6 +386,9 @@ static int __init imsic_parse_node(const struct dt_device_node *node,
         return -ENOENT;
     }
 
+    /* Reserve last identity for APLIC-to-hart synchronization */
+    imsic_cfg.sync_id = imsic_cfg.nr_ids;
+
     /* Compute base address */
     *nr_mmios = 0;
     rc = dt_device_get_address(node, *nr_mmios, &base_addr, NULL);
diff --git a/xen/arch/riscv/include/asm/aplic.h b/xen/arch/riscv/include/asm/aplic.h
index 8564f5954b6b..e4f4dfd241cc 100644
--- a/xen/arch/riscv/include/asm/aplic.h
+++ b/xen/arch/riscv/include/asm/aplic.h
@@ -88,6 +88,7 @@
 #define APLIC_SETIPNUM_LE               0x2000
 
 #define APLIC_GENMSI                    0x3000
+#define APLIC_GENMSI_BUSY               BIT(12, U)
 
 #define APLIC_TARGET_BASE               0x3004
 #define APLIC_TARGET_LAST               0x3ffc
@@ -178,4 +179,6 @@ void aplic_reconfigure_target(const struct vcpu *v,
                               unsigned int old_guest_file_id,
                               unsigned int old_cpu);
 
+void aplic_genmsi_barrier(void);
+
 #endif /* ASM_RISCV_APLIC_H */
diff --git a/xen/arch/riscv/include/asm/imsic.h b/xen/arch/riscv/include/asm/imsic.h
index 57d8c729ac0d..6ea2e4b8ca12 100644
--- a/xen/arch/riscv/include/asm/imsic.h
+++ b/xen/arch/riscv/include/asm/imsic.h
@@ -68,6 +68,14 @@ struct imsic_config {
     /* Number off interrupt identities */
     unsigned int nr_ids;
 
+    /*
+     * Interrupt identity reserved exclusively for APLIC-to-hart
+     * synchronization.
+     *
+     * Must not be allocated to any interrupt source.
+     */
+    unsigned int sync_id;
+
     /* MSI */
     const struct imsic_msi *msi;
 
-- 
2.55.0


