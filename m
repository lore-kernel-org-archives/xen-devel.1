Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E05A8C61DC6
	for <xen-devel@archiver.kernel.org>; Thu, 27 Aug 2026 15:22:42 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1400987.1636764 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzbvy-0006D5-7B; Thu, 27 Aug 2026 15:22:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1400987.1636764; Thu, 27 Aug 2026 15:22:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzbvx-00068R-6Q; Thu, 27 Aug 2026 15:22:29 +0000
Received: by outflank-mailman (input) for mailman id 1400987;
 Thu, 27 Aug 2026 15:22:23 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wzbvr-000523-7h
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2026 15:22:23 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wzbvq-00C7F4-JT
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2026 17:22:22 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a90562c-e002-0a2a0a5209dd-0a2a4505e5e4-4
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 17:22:22 +0200
Received: from [209.85.128.51] (helo=mail-wm1-f51.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a90562e-4cb1-0a2a45050019-d1558033b90c-3
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 17:22:22 +0200
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-499b2981a7bso9943945e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 08:22:22 -0700 (PDT)
Received: from fedora (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49b4b2d6b30sm57441155e9.14.2026.08.27.08.22.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Aug 2026 08:22:21 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1787844142; x=1788448942; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NbUDvsGLg78NddOCawoOaUli56hcmNzHbJnJ/eb+qqM=;
        b=MZ7uBruKJkJV7cwslMDci3jqcDi0ku1svcuUoRtCs08kCJOhBXyHYADQRcr6xeDPoN
         h9l11Jdrnt8q3SOoQVIBexjLqv2rXNejarY92N6TmdMltwREd02BFqUlY/7M5UP6OGP4
         IgopEKWZivmSZ/5TAVCUSDqHladNsSPURmiXasB55o2ao1G77Ww1JXd7+hZuP02oay4g
         wlx1pnoV7vPzk2pvAMUgI/xVxVgAo2oinpahbO9WbuIUqKkEt5u2c2TgunTiZqzrE3C9
         HZMTMcwNOte3lfKiGdXbp9ZRTEfYfbRELuvs5Dy9EDcSVwb7kJjWl+6j15yf6+jq/psQ
         jKyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787844142; x=1788448942;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NbUDvsGLg78NddOCawoOaUli56hcmNzHbJnJ/eb+qqM=;
        b=MwzO4kHOZbEpEAsemTCQjwBbryrSc2ncGhG2mTLyoWRxubwXcCPgb3XcCXGexhu0U1
         y5EOpn2HqnqhU+DC/nD6H8ruRfXP+4PTHQIujYTSPadSqcqbKG0gOCNi0lD9cIDYewBl
         VYBdihVbItubjo0Y4p+kQKwWAIqfJfBhbppCOwOnoGVI4s6uyDjQI84+0ezIrI+sLMiB
         hMDmDuex8y8D7J0iwsJPqViwuCnJYUXmJ/xv1EnTGQnAlYyLprgEZtSG2MuCB34HKfF4
         PYaYn50202f1zGXmOk5vDqf5Zc2V7VCvoZPNUFLqZZjSdhvgB4GyscD6IjLxHUZAopnp
         7I0w==
X-Gm-Message-State: AFuF++lH6AfKYhL+mHmj/j7nN/v0VNca4Yaf1RwvLaRLkMdBDAOKfVXG
	2MjzmCkabWL0dt8wxHWy1cWcC44qChYJZzJhidMC51hFE7Sf+hIxli89vCzXLw==
X-Gm-Gg: AR+sD12CHx8e8bHuzS33HJnn7fhvDFHuczigpO/aI6RlYl5oUigK/rgBWoazGViATYY
	iuvSRvagV1R0O2po4nV9eAuBLP9OYpm27JONX7TnITFmrNzUTEx1hr/3uTm/8bt22CY9ghgfepC
	tNyVq/okA6eiLUgTZUR1cxas/d6EDeip9maaUDIiVLIjI0uZrNjrWIOL/D7cUh+8yoS5UdCLYrc
	oFGOu7ZRHLTHpHYvuLtd92ZDmX2f3mSWZMH3OSQJkt0aXhk0Iu7uBLY1x239+VmToZwWs8ZawSP
	a5ds/7EkIZJ7SRBVeRwqAgyPFc/JZ25jMQJ8siUF5QZufHXKli/Rfjtt+Oanc5Iuq9AqOyY6KlL
	t5Yrfqt7tyGDkcfIGXKG3ij3nNm+NQfNXe9Koqihtsta00BRdLy6KLP6F1EU5cJZdyd7xDGCO7B
	hZRbIczDRu3WHLT5wCVQCDhyOE51DMad4/OK3et9+NlR0BwDJISCieVJD8MS4+hCuAu8XZHeTt5
	SNG4uFWUG1D/4l2aaTjo2rj8JSXLEoQ
X-Received: by 2002:a05:600c:6088:b0:499:a277:e8b5 with SMTP id 5b1f17b1804b1-499dc6f3248mr202823325e9.3.1787844141903;
        Thu, 27 Aug 2026 08:22:21 -0700 (PDT)
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
Subject: [PATCH v2 27/39] xen/riscv: introduce arch_move_irqs()
Date: Thu, 27 Aug 2026 17:21:11 +0200
Message-ID: <df3d3e1be48d9e46e4884c8573550b242efe26db.1787838835.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1787838835.git.oleksii.kurochko@gmail.com>
References: <cover.1787838835.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c201ff/1787844142-251182A1-AA301120/10/73395122804
X-purgate-type: spam
X-purgate-size: 4235

When migrating a vCPU between pCPUs the hypervisor must also migrate
the associated virtual interrupt state. arch_move_irqs() is the
per-arch hook called by generic code to trigger that.

Replace the static inline BUG_ON placeholder in asm/irq.h with a real
implementation in intc.c dispatching through a new move_irqs vintc_ops
callback. Wire it up in vAPLIC, which delegates to imsic_migrate_vcpu()
which itself still a stub to be implemented in follow-up patches.

Note that technically ASSERT() in arch_move_irqs() could be skipped as
it will be anyway NULL pointer dereference (and a trap will occur) if
something isn't properly initialized but sometimes it is harder to
find place where NULL pointer derefence happened as it isn't
guaraunted that all necessary registers will be filled with something
useful.
As at the moment I don't find any case when ->move_irqs() could be
skipped, the check that ->move_irq isn't NULL is added to ASSERT()
instead of adding "if ( ...->move_irq) vitnc->ops->move_irqs(v)".

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in v2:
 - New patch.
---
---
 xen/arch/riscv/imsic.c             | 5 +++++
 xen/arch/riscv/include/asm/imsic.h | 2 ++
 xen/arch/riscv/include/asm/intc.h  | 3 +++
 xen/arch/riscv/include/asm/irq.h   | 5 +----
 xen/arch/riscv/intc.c              | 8 ++++++++
 xen/arch/riscv/vaplic.c            | 1 +
 6 files changed, 20 insertions(+), 4 deletions(-)

diff --git a/xen/arch/riscv/imsic.c b/xen/arch/riscv/imsic.c
index 3787f270d8e3..b0c4a9e2d728 100644
--- a/xen/arch/riscv/imsic.c
+++ b/xen/arch/riscv/imsic.c
@@ -686,3 +686,8 @@ int __init vimsic_make_domu_dt_node(struct kernel_info *kinfo,
 
     return fdt_end_node(fdt);
 }
+
+void imsic_migrate_vcpu(struct vcpu *v)
+{
+    BUG_ON("unimplemented");
+}
diff --git a/xen/arch/riscv/include/asm/imsic.h b/xen/arch/riscv/include/asm/imsic.h
index 73129c3c9ea7..57d8c729ac0d 100644
--- a/xen/arch/riscv/include/asm/imsic.h
+++ b/xen/arch/riscv/include/asm/imsic.h
@@ -112,4 +112,6 @@ int vimsic_make_domu_dt_node(struct kernel_info *kinfo, unsigned int *phandle);
 void imsic_ctxt_switch_from(struct vcpu *v);
 void imsic_ctxt_switch_to(struct vcpu *v);
 
+void imsic_migrate_vcpu(struct vcpu *v);
+
 #endif /* ASM_RISCV_IMSIC_H */
diff --git a/xen/arch/riscv/include/asm/intc.h b/xen/arch/riscv/include/asm/intc.h
index 62e1410156c7..b5ab39aa2b39 100644
--- a/xen/arch/riscv/include/asm/intc.h
+++ b/xen/arch/riscv/include/asm/intc.h
@@ -70,6 +70,9 @@ struct vintc_ops {
 
     /* Restore vINTC state of the vCPU being switched in */
     void (*ctxt_switch_to)(struct vcpu *v);
+
+    /* Move interrupts of vCPU to a different pCPU */
+    void (*move_irqs)(struct vcpu *v);
 };
 
 struct vintc {
diff --git a/xen/arch/riscv/include/asm/irq.h b/xen/arch/riscv/include/asm/irq.h
index 66067747dc0f..314b8ee0e00c 100644
--- a/xen/arch/riscv/include/asm/irq.h
+++ b/xen/arch/riscv/include/asm/irq.h
@@ -41,10 +41,7 @@ struct irq_desc *irq_to_desc(unsigned int irq);
 struct cpu_user_regs;
 struct dt_device_node;
 
-static inline void arch_move_irqs(struct vcpu *v)
-{
-    BUG_ON("unimplemented");
-}
+void arch_move_irqs(struct vcpu *v);
 
 int platform_get_irq(const struct dt_device_node *device, int index);
 
diff --git a/xen/arch/riscv/intc.c b/xen/arch/riscv/intc.c
index 9fff501b9c25..b3a16ae9be67 100644
--- a/xen/arch/riscv/intc.c
+++ b/xen/arch/riscv/intc.c
@@ -192,3 +192,11 @@ void vintc_ctxt_switch_to(struct vcpu *v)
 
     ops->ctxt_switch_to(v);
 }
+
+/* Move vCPU's IRQs from one pCPU to another */
+void arch_move_irqs(struct vcpu *v)
+{
+    const struct vintc_ops *ops = v->domain->arch.vintc->ops;
+
+    ops->move_irqs(v);
+}
diff --git a/xen/arch/riscv/vaplic.c b/xen/arch/riscv/vaplic.c
index 6c60fe2baf0c..0c75ba2fb2fe 100644
--- a/xen/arch/riscv/vaplic.c
+++ b/xen/arch/riscv/vaplic.c
@@ -429,6 +429,7 @@ static const struct vintc_ops vintc_ops = {
      */
     .ctxt_switch_from = imsic_ctxt_switch_from,
     .ctxt_switch_to = imsic_ctxt_switch_to,
+    .move_irqs = imsic_migrate_vcpu,
 };
 
 int domain_vaplic_init(struct domain *d)
-- 
2.55.0


