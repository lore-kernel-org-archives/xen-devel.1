Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 739D6606A327
	for <xen-devel@archiver.kernel.org>; Fri, 13 Nov 2026 15:50:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yfQWscuD
Received: from list by lists.xenproject.org with outflank-mailman.1487848.1690273 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRtXk-0005bk-3y; Fri, 13 Nov 2026 15:50:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1487848.1690273; Fri, 13 Nov 2026 15:50:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRtXi-0005UV-VQ; Fri, 13 Nov 2026 15:50:22 +0000
Received: by outflank-mailman (input) for mailman id 1487848;
 Fri, 13 Nov 2026 15:50:05 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xRtXQ-0001yh-MW
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2026 15:50:04 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xRtXQ-0079Te-2B
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2026 16:50:04 +0100
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6af731a1-8faa-0a2a0a5109dd-0a2a450ce3a0-24
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 16:50:04 +0100
Received: from [209.85.221.49] (helo=mail-wr1-f49.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6af731ab-f479-0a2a450c0019-d155dd31a9fe-3
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 16:50:04 +0100
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-49d64a88222so261827f8f.1
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 07:50:03 -0800 (PST)
Received: from fedora (user-109-243-65-71.play-internet.pl. [109.243.65.71])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-49c5f1c0e0dsm5786493f8f.15.2026.11.13.07.50.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Nov 2026 07:50:03 -0800 (PST)
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
        d=gmail.com; s=20260707; t=1794585003; x=1795189803; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1phAdTser7xdPa2cMKLZrQgayiGNvL7sQNP/0200f3E=;
        b=yfQWscuDPGXv5RryVqYljMK69mqiTwYHhdmA/UJ/a8jBM+MWHPDFbTO5mOfzfsDXY5
         NzL01Q14l3zr5snIwLQHbRKjiTSPFBg3gu/G3Knj6toSi6IaFQbgl+u+AuI9jlmJd91D
         rMmVG7WIEHN+vSH+MrKLpIcTN25QbqkG4PL4XK7+rS2CvuNkXrGsFqrTd+xlLQ29hVG2
         VR1uyGOvxbAce13Xvf0T8DnbexeDatbTZoh8JJHfSv6OIXXeacAXR2YFGeq+9yd2N1X6
         czTVhM5NlgSYd4vC+WVXKw8JF9GFb+GoxEHzDnWJ1UJPuNUT/+Qu0PTmZFKohPeiyq5y
         ZHbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794585003; x=1795189803;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1phAdTser7xdPa2cMKLZrQgayiGNvL7sQNP/0200f3E=;
        b=fENMlBgMlUMa/AXa//OYWxq3i6Q0WHUN/PDLbna74ypWA1K0hJuyGSLdTVGK6EdsuE
         W21bDaV4azydhR2rJR30H3u8OBS0mjPvUeSH6utZZOEDdknmqRFr+skrOMfrzb92pUZc
         433C1cCELBGh5Wh/5u+G1GfDfct/JfTo9yjSocRplXWK2QlwFlVcLaQcMiEmxInxg+0t
         xEwFbq1YQFb53gjMz4e20V8GRbph0y0bYtsHhdbc/PP36X0pJw7UzdEZqHysZvU6NNJr
         c8KR0LuWOLQLk0OGvjcAB9JNaXjZOSzOOWJQMoztzJ0iJTfBN8AwbdrnYteFd02CFeD8
         rPIw==
X-Gm-Message-State: APuU4Z+c+f8QQb+H6uMILSGqiZbjVMVkRDuVQwYfn/F+qzWo0J915TmS
	7N+loW4WJL1/FXzC1DHHBK1el0RKRGaZACxqQX88Cu+y1GMPUc17MrVAt1JBaA==
X-Gm-Gg: AYBFou3nlwZeNBSvTfALKy9P7AIsy9N507aUdLloYZ1ANRllRG3hXBE0HOrZTpA8+tm
	eGTK2xmshQuPFEWcFmoq4jP2oXDr8QzFGxBii6y4Jbp8vCCciuqBIe2EpBWJNQuw0lfiyDy4GZa
	ymRD8KtlE0H53rLomDS0jL5guiuEOwt2Sw+yI+FyeBAP+GuFFUAIW3Fw4Qm881iKMne600dL6Kk
	4EjInfBnV+AyTLkyxuOn0oThId8fBpuqz9UUqWT+pZfdMX+fZJkVQWnrC+dEB5j2AefH+oLLq14
	sdOvhz6bhdnZC8RAS7lG5n07sui5XeGIOZ9z0mgTGdmy0+YozHAJPvvmimrfvsDYRTYpLkVy1dG
	l8v7b4/uqRZfVREsvb4fOwgtjvqjS9v1R/RWLa+2sVSgj0KqShSdYHZFiQGz84jNVDu3VPbkPbF
	u5YBxkpfjUW4K/GTX5l6Gk2Lg8FKvOoNh1ZZe7R03ZNsMwALNq4lGm1N+SBai+0YngvpLz1SOmp
	BKVvCfks4avdpn6dtpBgY24EKW0TDstgrtDXXq9K3BwBzHntr2Hkj04+Dm5VuU7FNGcEZ1x8o0i
	npF7m2KyxCDxZl4bOZH1e6gP7R6j2wFV23XU1xY0CJoo0U2fY+WMFDyms6IN82FHjneH
X-Received: by 2002:a05:6000:4718:b0:48e:d7c:4bc3 with SMTP id ffacd0b85a97d-49b0287cd7dmr13168704f8f.21.1794585003369;
        Fri, 13 Nov 2026 07:50:03 -0800 (PST)
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
Subject: [PATCH v4 42/42] xen/riscv: drive the line of a virtual vAPLIC source
Date: Fri, 13 Nov 2026 16:49:03 +0100
Message-ID: <70f87fade42409998447e02dc395ddc5bca2b089.1794562488.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <cover.1794562488.git.oleksii.kurochko@gmail.com>
References: <cover.1794562488.git.oleksii.kurochko@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d25034/1794585004-52331A5B-16E8CF51/10/73395122804
X-purgate-type: spam
X-purgate-size: 6521
X-Spam-Status: No, score=-20.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The line of a virtual vAPLIC source is driven by the emulator of a device
in Xen, but nothing lets such an emulator do it yet: vaplic_source.level is
never set.

Introduce vintc_set_irq_level(), which an emulator calls whenever the level
of its interrupt line changes, and implement it for vAPLIC as a new
vintc_ops.set_irq_level callback.

vAPLIC supports MSI delivery mode only, where, according to the AIA spec, a
low-to-high transition of the rectified input value of a source makes it
pending, whether it is edge- or level-sensitive, and the pending bit of a
level-sensitive source is cleared whenever the value is low. A source made
pending and enabled gets its MSI right away, through vaplic_forward_msis().

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
All the patches connected to virtual interrupts support for vAPLIC/vIMSIC
were tested on [1]. This branch is based on Denis M's framework which should
be soon sent to ML. Note that in [1] RISC-V is only draft version and
it has been ported in a quick way just to verify virtual interrupts are
working.

[1] https://gitlab.com/xen-project/people/olkur/xen/-/tree/riscv-vuart-support-wip?ref_type=heads
---
Changes in v4:
 - New patch.
---
---
 xen/arch/riscv/include/asm/intc.h   |  9 +++++
 xen/arch/riscv/include/asm/vaplic.h |  8 ++---
 xen/arch/riscv/intc.c               | 14 ++++++++
 xen/arch/riscv/vaplic.c             | 51 +++++++++++++++++++++++++++++
 4 files changed, 77 insertions(+), 5 deletions(-)

diff --git a/xen/arch/riscv/include/asm/intc.h b/xen/arch/riscv/include/asm/intc.h
index d188a45b3fe1..a332838bea17 100644
--- a/xen/arch/riscv/include/asm/intc.h
+++ b/xen/arch/riscv/include/asm/intc.h
@@ -8,6 +8,8 @@
 #ifndef RISCV_INTC_H
 #define RISCV_INTC_H
 
+#include <xen/types.h>
+
 struct dt_device_node;
 
 enum intc_variant {
@@ -79,6 +81,10 @@ struct vintc_ops {
      * guest.
      */
     void (*enter_guest)(struct vcpu *v);
+
+    /* Set the level of the line of a virtual source */
+    void (*set_irq_level)(const struct domain *d, unsigned int virq,
+                          bool level);
 };
 
 struct vintc {
@@ -114,4 +120,7 @@ void vintc_ctxt_switch_to(struct vcpu *n);
 
 void vintc_enter_guest(struct vcpu *v);
 
+void vintc_set_irq_level(const struct domain *d, unsigned int virq,
+                         bool level);
+
 #endif /* RISCV_INTC_H */
diff --git a/xen/arch/riscv/include/asm/vaplic.h b/xen/arch/riscv/include/asm/vaplic.h
index f2c768e84b11..1d5b9840be6c 100644
--- a/xen/arch/riscv/include/asm/vaplic.h
+++ b/xen/arch/riscv/include/asm/vaplic.h
@@ -41,11 +41,9 @@ struct vaplic_source {
     uint32_t sourcecfg;
 
     /*
-     * Level of the line of a virtual source, protected by vaplic->lock.
-     *
-     * TODO: nothing drives it yet. The emulator of a device with an interrupt
-     * line will have to, and to call vaplic_forward_msis() for a source a
-     * change of the level makes pending.
+     * Level of the line of a virtual source, as the emulator of the device
+     * in Xen drives it through vintc_set_irq_level(). Protected by
+     * vaplic->lock.
      */
     bool level;
 };
diff --git a/xen/arch/riscv/intc.c b/xen/arch/riscv/intc.c
index 449f6b252414..630c6d2ae730 100644
--- a/xen/arch/riscv/intc.c
+++ b/xen/arch/riscv/intc.c
@@ -224,3 +224,17 @@ void vintc_enter_guest(struct vcpu *v)
     if ( ops->enter_guest )
         ops->enter_guest(v);
 }
+
+/*
+ * Set the level of the line of virtual source @virq of @d. To be used by the
+ * emulator of a device in Xen, the line of which is connected to @virq: such
+ * a source has to be reserved with vintc_reserve_virq(), and no h/w IRQ may be
+ * routed to it.
+ */
+void vintc_set_irq_level(const struct domain *d, unsigned int virq,
+                         bool level)
+{
+    const struct vintc_ops *ops = d->arch.vintc->ops;
+
+    ops->set_irq_level(d, virq, level);
+}
diff --git a/xen/arch/riscv/vaplic.c b/xen/arch/riscv/vaplic.c
index ba0a867f6988..023f5116ec93 100644
--- a/xen/arch/riscv/vaplic.c
+++ b/xen/arch/riscv/vaplic.c
@@ -779,6 +779,56 @@ static void vaplic_ip_write(const struct domain *d, unsigned int word_idx,
     spin_unlock_irqrestore(&vaplic->lock, flags);
 }
 
+/*
+ * Set the level of the line of virtual source @virq of @d, as the emulator of
+ * the device in Xen driving it does.
+ */
+static void cf_check vaplic_set_irq_level(const struct domain *d,
+                                          unsigned int virq, bool level)
+{
+    struct vaplic *vaplic = to_vaplic(d);
+    struct vaplic_source *src;
+    unsigned int word_idx;
+    unsigned long flags;
+    uint32_t bit;
+    bool was_high;
+
+    /* Only a virtual source of @d has its line driven by an emulator. */
+    if ( !vaplic_is_assigned(d, virq) || vaplic_is_hw_source(d, virq) )
+    {
+        ASSERT_UNREACHABLE();
+        return;
+    }
+
+    virq = array_index_nospec(virq, d->arch.vintc->nr_virqs);
+    src = &vaplic->regs.sources[virq];
+    word_idx = virq / IRQS_PER_WORD;
+    bit = BIT(virq % IRQS_PER_WORD, U);
+
+    spin_lock_irqsave(&vaplic->lock, flags);
+
+    was_high = vaplic_rectified_input(src);
+    src->level = level;
+
+    /*
+     * According to the AIA spec, in MSI delivery mode a low-to-high
+     * transition of the rectified input value sets the pending bit of an
+     * edge- as well as of a level-sensitive source, and the pending bit of a
+     * level-sensitive one is cleared whenever the value is low. Neither
+     * happens to an inactive or a Detached source, whose rectified input
+     * value is always low.
+     */
+    if ( !was_high && vaplic_rectified_input(src) )
+        vaplic->regs.ip[word_idx] |= bit;
+    else if ( vaplic_is_level(src) && !vaplic_rectified_input(src) )
+        vaplic->regs.ip[word_idx] &= ~bit;
+
+    /* An enabled source the new level has made pending gets its MSI now. */
+    vaplic_forward_msis(d, word_idx, bit);
+
+    spin_unlock_irqrestore(&vaplic->lock, flags);
+}
+
 static uint32_t vaplic_genmsi_read(const struct domain *d)
 {
     /*
@@ -1189,6 +1239,7 @@ static const struct vintc_ops vintc_ops = {
      * by the vCPU itself. It moves it on its way to the guest instead.
      */
     .enter_guest = imsic_migrate_vcpu,
+    .set_irq_level = vaplic_set_irq_level,
 };
 
 int domain_vaplic_init(struct domain *d)
-- 
2.56.1


