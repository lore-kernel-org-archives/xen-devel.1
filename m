Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C3A8606A323
	for <xen-devel@archiver.kernel.org>; Fri, 13 Nov 2026 15:49:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MyDa14PJ
Received: from list by lists.xenproject.org with outflank-mailman.1487718.1689998 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRtWg-0001nZ-0I; Fri, 13 Nov 2026 15:49:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1487718.1689998; Fri, 13 Nov 2026 15:49:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRtWf-0001l5-MI; Fri, 13 Nov 2026 15:49:17 +0000
Received: by outflank-mailman (input) for mailman id 1487718;
 Fri, 13 Nov 2026 15:49:16 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xRtWe-0001Qr-9S
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2026 15:49:16 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xRtWd-004Sxq-Ld
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2026 16:49:15 +0100
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6af7316c-2eae-0a2a0a5409dd-0a2a450abfba-30
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 16:49:15 +0100
Received: from [209.85.221.50] (helo=mail-wr1-f50.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6af7317b-f2d2-0a2a450a0019-d155dd32b893-3
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 16:49:15 +0100
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-48fd2e38825so796833f8f.2
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 07:49:15 -0800 (PST)
Received: from fedora (user-109-243-65-71.play-internet.pl. [109.243.65.71])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-49c5f1c0e0dsm5786493f8f.15.2026.11.13.07.49.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Nov 2026 07:49:14 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20260707 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794584955; x=1795189755; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y5oMbHdD5MFwLVDcnucCBMJRUm1ubQhqDJvtQh3pXv0=;
        b=MyDa14PJkHqKmO+rGaczZarZnOatbOaPS+NCeOj5sTa5lHty4rCw+T4dVJ1S05Ld5m
         KrlgOCbAYrOz2X3GsSIWll1+6H2dGkfyUdiSrIjrR/Y7UsBQ5/UYuIuasGwsGiE2B+2v
         99Hi5y779hzT0QtM3axtehWwBnKsxJiYFFh9oz4PETyi10hFHPux0UULHA8CUdrtPZXC
         S/zah7nlQNtAp5xAbHRS9hxnoZeuDMIR8Nbjni5vs6+S1pqAKj2tmHDehfeRuTMXjr6u
         ItpSq4V6i+fbQ3uC9W5IMw9ltquDK3XZZOE8b8Pfsg36G5LYC+QydyflhIdTA8HqcgbT
         ViXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794584955; x=1795189755;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Y5oMbHdD5MFwLVDcnucCBMJRUm1ubQhqDJvtQh3pXv0=;
        b=FIsgiqSSNhMB4BYKCqaYMEQIKNfc9YdqEzfOt1/3UFrTAKfM8JwPCr5+RE07HupzzO
         HTApJox/Prsh3ONz951RLMgIwSpJJDExngXcte9+MUl/6HlmM6YoJ0ABQiSumNgZP5g2
         mCYrGdNmSvzrGBJYjQGfFyCzdSsXnGMWCbideW2Gv7jt9QzwkznyNlBQi2LqYfblwph3
         fYKa4R24FpYonGrPlMiTvUKXh8brBaGRbGLzCSD/O0pKmGUiq1GJ/4J79Q/RyfIco3Dc
         mCR/6jX5LXwVghk+slCoBQ+4g/s+AkcHXzFzHwu3qDTqnnG2J4/StgAfea1Uaw/T/iGR
         H1Eg==
X-Gm-Message-State: APuU4Z+I1Ehu1YPaQDjV5//G95HUo7LeStQhEWEdhlQQ35/DtdbG9PqO
	Iw70K8eAM9Z2puv7b1GLGHiY1XdIJkaqkwEsHxegWa08Fjycgf5kNc6OYwcK3w==
X-Gm-Gg: AYBFou0YDuOyApfPa9FNxAciHP4lOCAbMV5A4lw2ivD+iU7Itejh7md2Ae0ishhgg+y
	4r5PVKzKYhs/oKos5r9rkowqvt1aLl/d90+qM+7TGjEjiXn62cWQwk72oM5+OUFEz0QqkHJ947K
	jATzzgdmBVdVl/5sC+J/+g0/CekJtTrVlJOx9HCi95mjQpwljtbVeEQwhENwDF5znoAldnANKb3
	16kILJ2VmxYCYpdgRu2R7572dlP7psbsmSXIdOhD8LqbPLb4JkH5E8lla1JC3UaYE1VICCD0Ty5
	nwQ4kxid24zRmjP8xdNcZ2CRuBFrLP7B26pID5i0DIv4Qx4hwWaV6RhsCdNP1NVu3u+SUUU2zLf
	QzAHMpFf5Wt7DRuXqgGn3m/eCMFubXZroWw8HiDdqlokts21BhjXRX6JZO0u+0hg2CB2KLyfSfd
	/PdJbx5WZIQ4R+tw2Eolx659XCQBZm9mM2/+s5uZfn15naqrewNXn64FQ0YMDRsnlKtKXrE++4r
	omfI5oyzBQJ1fVqIMpkXMBB1vy7dV5RlLrhmNMZc6YRtnIBLML2YoMdncpjxaTUIr46/kdL0pJ4
	UwRgD+NeC3r5s2yTDVH+wUjF7C+B/Ue17XhUgbe8Rj0ZWydtRVoarmnHWlj3P9n+8N+f
X-Received: by 2002:a05:6000:29cf:b0:48e:6159:8274 with SMTP id ffacd0b85a97d-49c713ae351mr4319866f8f.27.1794584954881;
        Fri, 13 Nov 2026 07:49:14 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Baptiste Le Duc <baptiste.le-duc@vates.tech>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v4 08/42] xen/riscv: distinguish h/w and virtual vINTC sources
Date: Fri, 13 Nov 2026 16:48:29 +0100
Message-ID: <9074e1ac1d1fcf89668681080bec771dce48209c.1794562488.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <cover.1794562488.git.oleksii.kurochko@gmail.com>
References: <cover.1794562488.git.oleksii.kurochko@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-4011c0/1794584955-508CDCFC-DDD22C13/10/73395122804
X-purgate-type: spam
X-purgate-size: 8194
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

A vIRQ of a domain's vINTC is either a h/w source, one a physical IRQ is
routed to by route_irq_to_guest(), or a virtual source, whose line is
driven by the emulator of a device in Xen and whose state exists in the
vINTC only. used_irqs only tells that a vIRQ is taken, not which of the
two it is, whereas they have to be told apart: only a h/w source has a
physical IRQ to release when the domain goes away, and h/w registers to
keep in line with the guest's view.

Track the h/w sources in a new hw_irqs bitmap, the subset of used_irqs
a h/w IRQ is routed to. intc_route_irq_to_guest() sets the vIRQ's bit
there, so it now takes the domain and the vIRQ, and
domain_vintc_deinit() releases the h/w sources only.

An IRQ shared between devices is routed to the domain once per device,
so vintc_reserve_virq() legitimately fails with -EEXIST for all but the
first of them. map_irq_to_domain() now accepts -EEXIST only for a vIRQ
which is a h/w source already, so that a vIRQ reserved for a virtual
source can't be taken over by a h/w IRQ.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
More context on why the two kinds of sources have to be told apart is
given by the patches relying on hw_irqs:
 - "xen/riscv: implement virtual APLIC MMIO emulation", the next one,
   which accesses the registers of a source in the h/w APLIC only for a
   h/w source;
 - "xen/riscv: introduce vaplic_reconfigure_target()", which retargets
   the h/w sources only;
 - the patches introducing virtual sources to vAPLIC:
   "xen/riscv: emulate vAPLIC sourcecfg[], setie[] and domaincfg.IE",
   "xen/riscv: emulate target[] of virtual vAPLIC sources",
   "xen/riscv: emulate the pending bits and MSIs of virtual vAPLIC
   sources" and "xen/riscv: drive the line of a virtual vAPLIC source".
---
Changes in v4:
 - New patch.
---
---
 xen/arch/riscv/device.c           | 17 ++++++++++++-----
 xen/arch/riscv/include/asm/intc.h |  5 ++++-
 xen/arch/riscv/intc.c             | 26 +++++++++++++++++++-------
 xen/arch/riscv/irq.c              |  2 +-
 4 files changed, 36 insertions(+), 14 deletions(-)

diff --git a/xen/arch/riscv/device.c b/xen/arch/riscv/device.c
index fc41c075c772..4c1e18b83c3a 100644
--- a/xen/arch/riscv/device.c
+++ b/xen/arch/riscv/device.c
@@ -25,14 +25,21 @@ int __overlay_init map_irq_to_domain(struct domain *d, unsigned int irq,
     {
         /*
          * -EEXIST merely means that the IRQ has already been reserved, which
-         * legitimately happens when the IRQ is shared between devices. Any
-         * other failure has to be fatal: the IRQ would otherwise be routed to
-         * the domain without domain_vintc_deinit() ever releasing it again.
+         * legitimately happens when the IRQ is shared between devices: the
+         * vIRQ is then a h/w source already, route_irq_to_guest() having
+         * connected it to the IRQ for the first of them. A vIRQ reserved for
+         * a virtual source, whose line an emulator in Xen drives, mustn't be
+         * taken over by a h/w IRQ, though. Any other failure has to be fatal
+         * too: the IRQ would otherwise be routed to the domain without
+         * domain_vintc_deinit() ever releasing it again.
          */
         res = vintc_reserve_virq(d, irq);
-        if ( res && (res != -EEXIST) )
+        if ( res == -EEXIST && test_bit(irq, d->arch.vintc->hw_irqs) )
+            res = 0;
+        if ( res )
         {
-            printk(XENLOG_ERR "Unable to reserve vIRQ %u for %pd\n", irq, d);
+            printk(XENLOG_ERR "Unable to reserve vIRQ %u for %pd: %d\n",
+                   irq, d, res);
             return res;
         }
 
diff --git a/xen/arch/riscv/include/asm/intc.h b/xen/arch/riscv/include/asm/intc.h
index 909317335769..7a31c6a298a0 100644
--- a/xen/arch/riscv/include/asm/intc.h
+++ b/xen/arch/riscv/include/asm/intc.h
@@ -69,6 +69,8 @@ struct vintc_ops {
 struct vintc {
     unsigned int nr_virqs;
     unsigned long *used_irqs;
+    /* Sources of used_irqs a h/w IRQ is routed to; the rest are virtual. */
+    unsigned long *hw_irqs;
     /* Callbacks invoked during domain construction only. */
     const struct vintc_init_ops *init_ops;
     /* Runtime callbacks used for the lifetime of the guest. */
@@ -82,7 +84,8 @@ void register_intc_ops(const struct intc_hw_init_ops *init_ops);
 void intc_init(void);
 
 void intc_route_irq_to_xen(struct irq_desc *desc, unsigned int priority);
-int intc_route_irq_to_guest(struct irq_desc *desc, unsigned int priority);
+int intc_route_irq_to_guest(const struct domain *d, unsigned int virq,
+                            struct irq_desc *desc, unsigned int priority);
 
 void intc_handle_external_irqs(struct cpu_user_regs *regs);
 
diff --git a/xen/arch/riscv/intc.c b/xen/arch/riscv/intc.c
index 810d126e263d..ac9c798ec36b 100644
--- a/xen/arch/riscv/intc.c
+++ b/xen/arch/riscv/intc.c
@@ -82,19 +82,25 @@ void intc_route_irq_to_xen(struct irq_desc *desc, unsigned int priority)
     intc_set_irq_priority(desc, priority);
 }
 
-int intc_route_irq_to_guest(struct irq_desc *desc,
-                            unsigned int priority)
+int intc_route_irq_to_guest(const struct domain *d, unsigned int virq,
+                            struct irq_desc *desc, unsigned int priority)
 {
     ASSERT(spin_is_locked(&desc->lock));
 
     ASSERT(intc_hw_ops->guest_irq_type);
 
+    /* The caller has reserved @virq, see vintc_reserve_virq(). */
+    ASSERT(virq < d->arch.vintc->nr_virqs);
+
     desc->handler = intc_hw_ops->guest_irq_type;
     desc->status |= IRQ_GUEST;
 
     intc_set_irq_type(desc, desc->arch.type);
     intc_set_irq_priority(desc, priority);
 
+    /* Connect @virq to the h/w IRQ: it isn't a virtual source. */
+    set_bit(virq, d->arch.vintc->hw_irqs);
+
     return 0;
 }
 
@@ -126,7 +132,10 @@ int domain_vintc_init(struct domain *d)
         d->arch.vintc->used_irqs =
             xvzalloc_array(unsigned long,
                            BITS_TO_LONGS(d->arch.vintc->nr_virqs));
-        if ( !d->arch.vintc->used_irqs )
+        d->arch.vintc->hw_irqs =
+            xvzalloc_array(unsigned long,
+                           BITS_TO_LONGS(d->arch.vintc->nr_virqs));
+        if ( !d->arch.vintc->used_irqs || !d->arch.vintc->hw_irqs )
             ret = -ENOMEM;
     }
 
@@ -140,17 +149,19 @@ void domain_vintc_deinit(struct domain *d)
     if ( !d->arch.vintc )
         return;
 
-    if ( d->arch.vintc->used_irqs )
+    if ( d->arch.vintc->hw_irqs )
     {
         unsigned int virq;
 
+        /* A virtual source has no h/w IRQ routed to the domain to release. */
         for ( virq = 0; virq < d->arch.vintc->nr_virqs; virq++ )
-            if ( test_bit(virq, d->arch.vintc->used_irqs) )
+            if ( test_bit(virq, d->arch.vintc->hw_irqs) )
                 release_guest_irq(d, virq);
-
-        XVFREE(d->arch.vintc->used_irqs);
     }
 
+    XVFREE(d->arch.vintc->used_irqs);
+    XVFREE(d->arch.vintc->hw_irqs);
+
     switch ( variant )
     {
     case INTC_APLIC:
@@ -169,6 +180,7 @@ void domain_vintc_deinit(struct domain *d)
  * Returns 0 on success, -EEXIST if @virq has already been reserved, which
  * legitimately happens when an IRQ is shared between devices, and -ERANGE if
  * @virq is outside the range of the interrupt sources the vINTC provides.
+ * A virtual source can't be shared, so for one -EEXIST is a failure.
  */
 int __overlay_init vintc_reserve_virq(const struct domain *d,
                                       unsigned int virq)
diff --git a/xen/arch/riscv/irq.c b/xen/arch/riscv/irq.c
index 9fc5a1bb703c..1b07b811b1fd 100644
--- a/xen/arch/riscv/irq.c
+++ b/xen/arch/riscv/irq.c
@@ -463,7 +463,7 @@ int route_irq_to_guest(struct domain *d, unsigned int virq,
     if ( retval )
         goto out;
 
-    retval = intc_route_irq_to_guest(desc, IRQ_NO_PRIORITY);
+    retval = intc_route_irq_to_guest(d, virq, desc, IRQ_NO_PRIORITY);
     if ( retval )
     {
         struct irqaction *action = irq_detach_action(desc, info);
-- 
2.56.1


