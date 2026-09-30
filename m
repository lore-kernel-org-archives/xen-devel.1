Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83F0ACA5FCB
	for <xen-devel@archiver.kernel.org>; Wed, 30 Sep 2026 16:24:54 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1437569.1656607 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBx6g-00079u-FB; Wed, 30 Sep 2026 16:24:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1437569.1656607; Wed, 30 Sep 2026 16:24:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBx6g-00078p-9k; Wed, 30 Sep 2026 16:24:34 +0000
Received: by outflank-mailman (input) for mailman id 1437569;
 Wed, 30 Sep 2026 16:24:31 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xBx6d-0006bj-I3
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2026 16:24:31 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xBx6c-00GhY9-Um
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2026 18:24:30 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6abd37b7-8faa-0a2a0a5109dd-0a2a4503edf2-20
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 18:24:30 +0200
Received: from [74.125.225.140] (helo=mail-wm2-f12.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6abd37be-fae8-0a2a45030019-4a7de18ca154-3
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 18:24:30 +0200
Received: by mail-wm2-f12.google.com with SMTP id
 5b1f17b1804b1-49b912d3920so41824955e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 09:24:30 -0700 (PDT)
Received: from fedora (user-109-243-71-234.play-internet.pl. [109.243.71.234])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a01cd43e66sm14620485e9.2.2026.09.30.09.24.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Sep 2026 09:24:29 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1790785470; x=1791390270; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yPmng9jKZGj6nVECSBy4KvK2s0Y8gEQ54EyuBKvdWAM=;
        b=A+C3VPsgv4uff47yf7kkdcm/JV4eSdysbjLUXEhSXE5ituQZm/T5F6goPSi2zB18Nb
         hryW5wnfgEoPgp3GwD3OC8I+CE9olBrSpaVCjk+Ds+fjgfeDqKXv+DVAy2mSn2M6UH1G
         i+KezGsthSh2t7R3OlktepQi+Bu2Z/hw5VX+W2i8bcB9BTNfdnVvVMhC4nm7aiH2Df/K
         6xhcfg6RJPfYcBgmjkvyRalJLClGW61TuecaHVASHYvsOwAmuh+dEZK3/aP+Fa9fnkOQ
         y3xhhOYh4/lP2aKEXSbArBiJ+gKIu1IMeR/iQX80DZXhDUx6uW6vxHNOHOROv3jGZevX
         0BOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790785470; x=1791390270;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yPmng9jKZGj6nVECSBy4KvK2s0Y8gEQ54EyuBKvdWAM=;
        b=U5MQ7S6pQf3awojF72CD7fRooL0HDp3nR+uhJbVuCnE+OlC3hOd5nH7XqN+YZsOn7n
         qslkm+KGFBNT/9N7oMtelwsR4oBpbPAbUZ64oPVkxvyAGYHXrMuBaBNUvNNIoZv08yTN
         cQWB5yOEsGhyI/wBGXpBaYR9pZuQTdBV4FxBRrqtrW1XuhDr6JtUG/HVIBvMRpLh4fuU
         Zw5CmFq9CgP8m0zxY2ncJNtdQJy3oYwk8Y9GytGI87WT1dVajnrGxGrbPNdNY0dqLtgP
         zmySmuUq4ibaUKK4dGFeYGYoLwCMEKsmPPFuLBi07hqzAb0SNmST1lEx+Uyb/mgh1GfX
         LuPA==
X-Gm-Message-State: AFuF++mhShtn+rFfc9pO54CDYIsxinNkMRDZLnA3r5sbMuxohj/WgrUN
	X9kUiIjPg3WZc5EOTmLBEfoMyUlPBKMuTEG0xQAo4rW5YsaPVXHnaCwijA0OBQ==
X-Gm-Gg: AYBFou32cD/E6sqJka6WFXVzwaCh/SVVPUde7Z1oa551G5mWDqEnWu/4iCOV1llIS80
	eVF4GJMsuSQzuRbeEXhfMOG+CRBG8Rg590Rd0Y3JwhY+Cai4Q2JUovxBnEomlC/JEWZzJm7x/09
	86KQ1ZccQFrd+HFD1qj/5rBzGiQdyJS9x3YAZQaPRH2XE4zlk0HjOrVkxOwMAoOmFQq9xpkTsKf
	0eyYx4DWEYapbeLf0dD2R/LbvO6oQydBzJlgJociUnPJWHgP8ir36j7lEKatl4saBUbTsvMx0qR
	YeSMDQUGYhz710avO3ZOE7sa2doykLdEUtKDjZzFzQozQZ0C7YQFJfTldPGjObcJYQ0jC7jDhe7
	XFGqfe+aBsb4v8wSdfhfStOeBs6P1Cs1ThkxRotJPCPYZucCWHBXEbv7UjjJ8pRRe4TQjO4sbqQ
	JGgm0nf4yOzCvmrOLbA4g6Ti8w7VV8dcHK1rLjseuJ7nHItJDEkRLoKYo0MgNjU/6AmZEQc3qGE
	EYpOaSzKfCaOBCiHRxRLxyTEdUBH03uD1WtuFbY
X-Received: by 2002:a05:600c:3b1a:b0:49e:81db:4926 with SMTP id 5b1f17b1804b1-4a01aff3cdamr35109285e9.5.1790785470265;
        Wed, 30 Sep 2026 09:24:30 -0700 (PDT)
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
Subject: [PATCH v3 26/39] xen/riscv: introduce arch_move_irqs()
Date: Wed, 30 Sep 2026 18:23:45 +0200
Message-ID: <e804c3af5774676bc70732eafcaf7ee6dedde156.1790779209.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1790779209.git.oleksii.kurochko@gmail.com>
References: <cover.1790779209.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-33051d/1790785470-75A814E9-DEF6315C/10/78276251493
X-purgate-type: spam
X-purgate-size: 3955

When migrating a vCPU between pCPUs the hypervisor must also migrate
the associated virtual interrupt state. arch_move_irqs() is the
per-arch hook called by generic code to trigger that.

Replace the static inline BUG_ON placeholder in asm/irq.h with a real
implementation in intc.c dispatching through a new move_irqs vintc_ops
callback. Wire it up in vAPLIC, which delegates to imsic_migrate_vcpu(),
only a stub for now.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>
---
Changes in v3:
 - Update the commit message: drop the two last paragraphs as they are
   stale.
 - Add Acked-by: Jan Beulich <jbeulich@suse.com>.
 - Add Reviewed-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>.
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
index d633f59db20d..c5fcdcf13b00 100644
--- a/xen/arch/riscv/imsic.c
+++ b/xen/arch/riscv/imsic.c
@@ -690,3 +690,8 @@ int __init vimsic_make_domu_dt_node(struct kernel_info *kinfo,
 
     return fdt_end_node(fdt);
 }
+
+void imsic_migrate_vcpu(struct vcpu *v)
+{
+    BUG_ON("unimplemented");
+}
diff --git a/xen/arch/riscv/include/asm/imsic.h b/xen/arch/riscv/include/asm/imsic.h
index 5463fb4c31b2..22ce90e2e9b3 100644
--- a/xen/arch/riscv/include/asm/imsic.h
+++ b/xen/arch/riscv/include/asm/imsic.h
@@ -99,4 +99,6 @@ int vimsic_make_domu_dt_node(struct kernel_info *kinfo, unsigned int *phandle);
 void imsic_ctxt_switch_from(struct vcpu *p);
 void imsic_ctxt_switch_to(struct vcpu *n);
 
+void imsic_migrate_vcpu(struct vcpu *v);
+
 #endif /* ASM_RISCV_IMSIC_H */
diff --git a/xen/arch/riscv/include/asm/intc.h b/xen/arch/riscv/include/asm/intc.h
index 59e12f3d3c6d..a22b46dae06c 100644
--- a/xen/arch/riscv/include/asm/intc.h
+++ b/xen/arch/riscv/include/asm/intc.h
@@ -70,6 +70,9 @@ struct vintc_ops {
 
     /* Restore vINTC state of the vCPU being switched in */
     void (*ctxt_switch_to)(struct vcpu *n);
+
+    /* Move interrupts of vCPU to a different pCPU */
+    void (*move_irqs)(struct vcpu *v);
 };
 
 struct vintc {
diff --git a/xen/arch/riscv/include/asm/irq.h b/xen/arch/riscv/include/asm/irq.h
index 57e814d90cf4..311af1d16fbb 100644
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
index 53ba2b04ab53..a51eec251563 100644
--- a/xen/arch/riscv/intc.c
+++ b/xen/arch/riscv/intc.c
@@ -192,3 +192,11 @@ void vintc_ctxt_switch_to(struct vcpu *n)
 
     ops->ctxt_switch_to(n);
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
index 4d87fdb5be42..601b79aae430 100644
--- a/xen/arch/riscv/vaplic.c
+++ b/xen/arch/riscv/vaplic.c
@@ -462,6 +462,7 @@ static const struct vintc_ops vintc_ops = {
      */
     .ctxt_switch_from = imsic_ctxt_switch_from,
     .ctxt_switch_to = imsic_ctxt_switch_to,
+    .move_irqs = imsic_migrate_vcpu,
 };
 
 int domain_vaplic_init(struct domain *d)
-- 
2.55.0


