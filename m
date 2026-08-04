Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7537EC55184
	for <xen-devel@archiver.kernel.org>; Tue,  4 Aug 2026 15:48:47 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1382279.1625719 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrHNd-0001U4-QT; Tue, 04 Aug 2026 15:48:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1382279.1625719; Tue, 04 Aug 2026 15:48:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrHNd-0001SR-Cl; Tue, 04 Aug 2026 15:48:37 +0000
Received: by outflank-mailman (input) for mailman id 1382279;
 Tue, 04 Aug 2026 15:48:35 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wrHNb-00010v-Fh
 for xen-devel@lists.xenproject.org; Tue, 04 Aug 2026 15:48:35 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wrHNa-009Gcw-SF
 for xen-devel@lists.xenproject.org; Tue, 04 Aug 2026 17:48:34 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a7209c5-bab6-0a2a0a5309dd-0a2a4509cbee-26
 for <xen-devel@lists.xenproject.org>; Tue, 04 Aug 2026 17:48:34 +0200
Received: from [209.85.128.49] (helo=mail-wm1-f49.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a7209d2-be1a-0a2a45090019-d1558031d14e-3
 for <xen-devel@lists.xenproject.org>; Tue, 04 Aug 2026 17:48:34 +0200
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-4955158f26aso23065955e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 04 Aug 2026 08:48:34 -0700 (PDT)
Received: from fedora (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49949fcb46esm116430355e9.5.2026.08.04.08.48.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Aug 2026 08:48:33 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1785858514; x=1786463314; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pNfWXKz7OiThFTVcFdBZ62/fmTIqtlbdTWRNjBnnGpc=;
        b=Dk6uZXJA6qAlrAEqZEzvjVa6D3gz9tyNKvBzDAAAQgXzM6TrstVeX6i/Kx9Wtd8slt
         wBrXRXMnQ2B13Pu0HJoZhB2VtqgBgIJE81v7HYSoRc07qMi6JG325CgQCJ3G/4tfJKrN
         t7115Sh2s5NnvwkimPGnReFyoFTBguMWT3T+THso8gnCSNKj/FTnijMed0ZTRX9eycV5
         7XvyPUDv/2Fc2JIF6uvwXqKF2sCiK76hrC72/w4uAJ05CVYD1g50Kv8/TgzgB5U9QRsV
         rZz61yeDNVn/rOsD8q3WtFQVU7sJ0niKRxEl5PHsLuJeEHeJDuoWfWY9wMgZ/vtst+Ya
         YbMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785858514; x=1786463314;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pNfWXKz7OiThFTVcFdBZ62/fmTIqtlbdTWRNjBnnGpc=;
        b=MhObpbTaYk2WRVx5jlNxzYZs/0plYNqVlwgVwDV4c3VDQcsyXCulswdVzZ/r/YdYpp
         s6GAqCyiBKQI5u2DqC5MzUWLXAbLvNB3F+rFfmgcXzAiwaB/fUvh3e/7g5TufJIhwoWq
         yHP+cKBcPIg9+9d6tOB2zOrGYS9sONw/vRi2e6DsZTBQekkjX9jEqzTnRMaCEQ8DkJvM
         TsFkisdP2VYZMmR+ns4XnjGTyNcE/rR01DaPAD71OwOPfZhWQafUA9MgHZztOUd37ZhI
         IytT0INBabW+9+HSI5rkrsOaIRTHpHKQE8/GDb1wcDvosMoEb33C3pxZBb6m8GJ4/0fd
         w/Mg==
X-Gm-Message-State: AOJu0YzATc0rCfseCtAQKT5WMH+OLSjzsvczPd2qiQCGrd2gG2am8F/3
	gR5/JGurlyDywMau3twEd4dCT5EvOWvBf4KaRbc1ghwrjfvWYiTM72t4AmWOyw==
X-Gm-Gg: AR+sD127y/ABlsbUx3uvRb3z4y9MRGbMBC+31svGRHtDi543iAuj8l27akIMYknTjCm
	5HyGXBcLijvg565hfdsZNxfm3bZOqaCHGu+PA8iROrenPlmtvsFDKXhkKMlx2GXMI1tUdxUaN7B
	HF1/qYwvbTMu7K4PBR76PyWeZEkD11KBVoANxiUIOqAqTa0XKEBHHqyjkw8EIIbXGD2O2WWvq0p
	DM4QRBaxuD8Th0V/kZ3gzcWvUIRxCYN4gA2nYfJvoZ4JUc3j9tEi6e1UShbqOM9u/Le0qaxCV05
	f+0/ixr1K6oGVT5rIGb5zHWvgDFfgqLHb8omPy3Q0rbctSrIFkwaf8POQRs7guoAmL38myJg7Z9
	RFBvNBYBJbw1U/hUrMOHycZFwqLUXVbmog9tG4bL5jU09EscHD+F4iejAWKnpZl5x7MeUGI3Hpi
	FNXt7hbUSv/ZkHDudYEDhnTjP/ydpwCu0wpTHzVCm8R4e+yesBeA0pyKyc4P+sfjI5jcsxEj2JR
	DcYVHK070iqgP6yzxkEF9MBHuRISipnZg==
X-Received: by 2002:a05:600c:c113:b0:495:4689:1e98 with SMTP id 5b1f17b1804b1-4980c674e1dmr306196645e9.10.1785858514288;
        Tue, 04 Aug 2026 08:48:34 -0700 (PDT)
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
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v7 13/20] xen/riscv: introduce (de)initialization helpers for vINTC
Date: Tue,  4 Aug 2026 17:48:03 +0200
Message-ID: <30c9d0f24a2e9b8ffafebb33a832ff0d61671544.1785836421.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1785836421.git.oleksii.kurochko@gmail.com>
References: <cover.1785836421.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-bad1c0/1785858514-FCE14034-DB5ECD08/10/73395122804
X-purgate-type: spam
X-purgate-size: 3635

Add common helpers domain_vintc_init() and domain_vintc_deinit() to
allocate and deallocate a virtual interrupt controller (vINTC)
structure and initialize basic virtual interrupt controller registers.

domain_vintc_deinit() isn't called at the moment as arch_domain_destroy()
is implemented as stub at the moment.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes in v6-7:
 - Nothing changed. Only rebase.
---
Changes in v5:
 - s/printk/printk_once().
 - Add Acked-by: Jan Beulich <jbeulich@suse.com>.
---
Changes in v4:
 - Drop the comment from domain_vintc_init() about guests receiving a
   virtual interrupt controller that mirrors the host hardware as there
   can (and eventually should) be alternatives.
 - Finish renaming intc_version to intc_variant in domain_vintc_(de)init()
   (enum intc_variant, info->hw_variant, local variable) started in the
   prev patch.
---
Changes in v3:
 - Drop redundant printk() from domain_vintc_deinit()'s default case to
   avoid duplicate messages when init fails.
 - Add a comment to domain_vintc_init() clarifying that guests currently
   receive a virtual interrupt controller that mirrors the host hardware.
---
Changes in v2:
 - Drop __init for domain_vintc_(de)init().
 - Update the commit message.
---
---
 xen/arch/riscv/domain.c           |  3 +++
 xen/arch/riscv/include/asm/intc.h |  3 +++
 xen/arch/riscv/intc.c             | 35 +++++++++++++++++++++++++++++++
 3 files changed, 41 insertions(+)

diff --git a/xen/arch/riscv/domain.c b/xen/arch/riscv/domain.c
index 45712d305975..4db9c28662c7 100644
--- a/xen/arch/riscv/domain.c
+++ b/xen/arch/riscv/domain.c
@@ -308,6 +308,9 @@ int arch_domain_create(struct domain *d,
     if ( (rc = p2m_init(d, config)) != 0)
         goto fail;
 
+    if ( (rc = domain_vintc_init(d)) )
+        goto fail;
+
     return rc;
 
  fail:
diff --git a/xen/arch/riscv/include/asm/intc.h b/xen/arch/riscv/include/asm/intc.h
index 875728885292..6fc0e620e937 100644
--- a/xen/arch/riscv/include/asm/intc.h
+++ b/xen/arch/riscv/include/asm/intc.h
@@ -79,4 +79,7 @@ void intc_route_irq_to_xen(struct irq_desc *desc, unsigned int priority);
 
 void intc_handle_external_irqs(struct cpu_user_regs *regs);
 
+int domain_vintc_init(struct domain *d);
+void domain_vintc_deinit(struct domain *d);
+
 #endif /* ASM__RISCV__INTERRUPT_CONTOLLER_H */
diff --git a/xen/arch/riscv/intc.c b/xen/arch/riscv/intc.c
index 2864a896b677..f5c8af6ddea4 100644
--- a/xen/arch/riscv/intc.c
+++ b/xen/arch/riscv/intc.c
@@ -11,6 +11,7 @@
 
 #include <asm/aia.h>
 #include <asm/intc.h>
+#include <asm/vaplic.h>
 
 static const struct intc_hw_operations *__ro_after_init intc_hw_ops;
 
@@ -83,3 +84,37 @@ int __init make_intc_domU_node(struct kernel_info *kinfo)
 
     return vintc->init_ops->make_domu_dt_node(kinfo);
 }
+
+int domain_vintc_init(struct domain *d)
+{
+    int ret = -EOPNOTSUPP;
+    const enum intc_variant variant = intc_hw_ops->info->hw_variant;
+
+    switch ( variant )
+    {
+    case INTC_APLIC:
+        ret = domain_vaplic_init(d);
+        break;
+
+    default:
+        printk_once("vintc (variant:%d) isn't implemented\n", variant);
+        break;
+    }
+
+    return ret;
+}
+
+void domain_vintc_deinit(struct domain *d)
+{
+    const enum intc_variant variant = intc_hw_ops->info->hw_variant;
+
+    switch ( variant )
+    {
+    case INTC_APLIC:
+        domain_vaplic_deinit(d);
+        break;
+
+    default:
+        break;
+    }
+}
-- 
2.55.0


