Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83E9CC61DC6
	for <xen-devel@archiver.kernel.org>; Thu, 27 Aug 2026 15:22:47 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1400999.1636782 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzbw3-0007BO-8s; Thu, 27 Aug 2026 15:22:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1400999.1636782; Thu, 27 Aug 2026 15:22:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzbw1-00077w-Oh; Thu, 27 Aug 2026 15:22:33 +0000
Received: by outflank-mailman (input) for mailman id 1400999;
 Thu, 27 Aug 2026 15:22:27 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wzbvu-0005cy-CM
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2026 15:22:26 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wzbvt-009l31-N4
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2026 17:22:25 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a905621-2eae-0a2a0a5409dd-0a2a450aa854-32
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 17:22:25 +0200
Received: from [209.85.128.43] (helo=mail-wm1-f43.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a905631-f2d2-0a2a450a0019-d155802bc51e-3
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 17:22:25 +0200
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-49b8ce9b733so6304285e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 08:22:25 -0700 (PDT)
Received: from fedora (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49b4b2d6b30sm57441155e9.14.2026.08.27.08.22.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Aug 2026 08:22:24 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1787844145; x=1788448945; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EO1Ejgjh8QKw8eND0v67zM6XR+OCktbAr5444WUjCzU=;
        b=eX9TupMYkkwd1S5hj0axk4capGcfTbriEGYblcLUmOia0XcE1WcUB/1uCtdkWf5aX5
         o2BY097AVb/MTUgsVXR3BzqANy7yZJ8yamSu2EqS0BDTwfOw4EFNqb4EKO/KMQSkfhEK
         JbK21SxsWXIDGphCp8fnM4GbvlSG93jR6/+WHdCssG8CTvlsKKhM2EV01Ay+Pa/BIzQm
         VuZmk6L7i96cZcwI0S2jTO8ir0ms/lt5qSO5jfzVq1D+P4niqTx666u2unJ3Xh6r753b
         AsYNbG5NGJ3yFgyYYh186TR9sBIpcjHxe7u99Ig7hUO20KsjvTh+GMEYK22h6idGZK0h
         nNfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787844145; x=1788448945;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EO1Ejgjh8QKw8eND0v67zM6XR+OCktbAr5444WUjCzU=;
        b=lE/YjgK5fNY1agNq5k249yXz4EXUxyWsr9f2DlhVP5ej8RHqvHEOERefa099yLi8oo
         Boe7ZbTNN8LeJ9/8cRzj4rBo82tHLPTiLyMlxJNZwbaqA5WSbL9NWOitkOkLKT8LAxnq
         IlZjZ+O2nBosyZruDYCfxjVr5RhSJd/fH6m2hTSj6RGX9SpIWqCyIiNy9LHhUZmpqUcc
         olKh8sDy3JjMZnDz+UStwwsrsoBnZLOCH6g1cP/xfhFWAWxWIg4utlbUDIh89AUJdAW+
         oP+SngrJCwpVAj0HCKi3wQVeJ08an40M/YRO2gtPIWJYz8Ku0EgnhiDHvEKO784GWMNB
         mz2w==
X-Gm-Message-State: AFuF++lkpL6fOdKFH/5ojpylTk/T1WPqR38pLSHuUnDYXksDVlRQBwLU
	3qv6Kj2x0Bc1lv8nX5EWgfbIrzmcLdXWRYg2uyz9cpBPLOkUWruWSvs5sjhOEg==
X-Gm-Gg: AR+sD10GRHaUqpDpgL3TxjBm8Xj2+UjEcZyeeLDaK/g6HvXIIOv4IDGA53SW7Z7gtvA
	GNEGK9oJ2I5gNmXvnga44q6UaLZ3pYnkqr49lTDqpQjw1Y+AvUNw41TipvsWB37wFNws6b8h5Us
	VXiV1wRMX72HRzoCs0p+DqQB9akRmJVWn1u2DznxGqLJDzd5uOSJFi8Jh7s+74R+WxpHzeK44qq
	hmhtdusX+mG+c581Yn5395efvbyh3ILZ7GjAsPzaxbfLd+Ep4bH5WzXndpwILzT4FhfDu+cZ1fJ
	6n3a9/h+bPjMUwPntEJGwnaY/oXCdP7Xkydn0QwARNC1URHv3AVHpp3mj3T8eTEdFE9YAcl0m4N
	jXCu4FZsqARG6ROqkCSDCdwY+qneAgihnoSEmiKcDVXJFIGttB+xP0ZSeToZ5qcVoHa+ia+MGoV
	pCqR81ATZUMg5wx3pgeYePbMm2GN2tsOD88sIcqWJVSB0eQwjc+5zZfbFuVb0ky1kQFJgQy6r8S
	4AqIsNwzD9WLD15QFBt7FtCdGbbsPNBxuF9oAVs9vw=
X-Received: by 2002:a05:600c:5252:b0:49b:9113:e04a with SMTP id 5b1f17b1804b1-49b9113e19amr17929015e9.1.1787844144750;
        Thu, 27 Aug 2026 08:22:24 -0700 (PDT)
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
Subject: [PATCH v2 29/39] xen/riscv: introduce aplic_reconfigure_target()
Date: Thu, 27 Aug 2026 17:21:13 +0200
Message-ID: <d90832888c1bcb08146a6c36591ac0c31b8b0ce1.1787838835.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1787838835.git.oleksii.kurochko@gmail.com>
References: <cover.1787838835.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-4011c0/1787844145-516C6CFC-3D451505/10/73395122804
X-purgate-type: spam
X-purgate-size: 2895

When a vCPU is migrated to a different pCPU, its IMSIC guest interrupt
file changes. Any APLIC interrupt previously configured to deliver an
MSI to the old interrupt file must be retargeted to the new one.

Implement aplic_reconfigure_target() to scan all interrupts allocated
to the domain and update their APLIC TARGET registers accordingly.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in v2:
 - New patch.
---
---
 xen/arch/riscv/aplic.c             | 42 ++++++++++++++++++++++++++++++
 xen/arch/riscv/include/asm/aplic.h |  4 +++
 2 files changed, 46 insertions(+)

diff --git a/xen/arch/riscv/aplic.c b/xen/arch/riscv/aplic.c
index b4c419755ac3..0af13f28e467 100644
--- a/xen/arch/riscv/aplic.c
+++ b/xen/arch/riscv/aplic.c
@@ -138,6 +138,48 @@ uint32_t aplic_msi_target_gen(const struct vcpu *target_vcpu,
     return base_val;
 }
 
+void aplic_reconfigure_target(const struct vcpu *v,
+                              unsigned int old_guest_file_id,
+                              unsigned int old_cpu)
+{
+    const struct vintc *vintc = v->domain->arch.vintc;
+    const unsigned long *auth_irq_bmp = vintc->used_irqs;
+    unsigned long old_hart_field = aplic_hart_field(old_cpu);
+    unsigned long flags;
+    unsigned int irqn;
+
+    /* Support only MSI mode at the moment */
+    BUG_ON(!aplic_msi_mode());
+
+    spin_lock_irqsave(&aplic.lock, flags);
+
+    bitmap_for_each ( irqn, auth_irq_bmp, vintc->nr_virqs )
+    {
+        volatile uint32_t __iomem *ptarget;
+        uint32_t target_val;
+        unsigned int guest_index, hart_index;
+
+        if ( !irqn )
+            continue;
+
+        ptarget = &aplic.regs->target[irqn - 1];
+        target_val = readl(ptarget);
+
+        guest_index = MASK_EXTR(target_val, APLIC_TARGET_GUEST_IDX);
+        hart_index = MASK_EXTR(target_val, APLIC_TARGET_HART_IDX);
+
+        if ( (guest_index != old_guest_file_id) ||
+             (hart_index != old_hart_field) )
+            continue;
+
+        target_val = aplic_msi_target_gen(v, target_val);
+
+        writel(target_val, ptarget);
+    }
+
+    spin_unlock_irqrestore(&aplic.lock, flags);
+}
+
 uint32_t aplic_hw_read_reg(unsigned int offset)
 {
     unsigned long flags;
diff --git a/xen/arch/riscv/include/asm/aplic.h b/xen/arch/riscv/include/asm/aplic.h
index d629e1c83887..8564f5954b6b 100644
--- a/xen/arch/riscv/include/asm/aplic.h
+++ b/xen/arch/riscv/include/asm/aplic.h
@@ -174,4 +174,8 @@ struct aplic_regs {
 uint32_t aplic_hw_read_reg(unsigned int offset);
 void aplic_hw_write_reg(unsigned int offset, uint32_t value);
 
+void aplic_reconfigure_target(const struct vcpu *v,
+                              unsigned int old_guest_file_id,
+                              unsigned int old_cpu);
+
 #endif /* ASM_RISCV_APLIC_H */
-- 
2.55.0


