Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A17EACD4F24
	for <xen-devel@archiver.kernel.org>; Tue, 12 May 2026 17:10:05 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1307274.1578983 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wMqc5-0005fJ-1v; Tue, 12 May 2026 17:09:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1307274.1578983; Tue, 12 May 2026 17:09:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wMqc4-0005ef-VH; Tue, 12 May 2026 17:09:44 +0000
Received: by outflank-mailman (input) for mailman id 1307274;
 Tue, 12 May 2026 17:09:43 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <xakep.amatop@gmail.com>) id 1wMqc3-0005XT-D3
 for xen-devel@lists.xenproject.org; Tue, 12 May 2026 17:09:43 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wMqc2-00HVXc-Q6
 for xen-devel@lists.xenproject.org; Tue, 12 May 2026 19:09:42 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6a035eaa-5cb7-0a2a0a5109dd-0a2a450a84bc-40
 for <xen-devel@lists.xenproject.org>; Tue, 12 May 2026 19:09:42 +0200
Received: from [209.85.128.50] (helo=mail-wm1-f50.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6a035ed6-56b3-0a2a450a0019-d1558032c817-3
 for <xen-devel@lists.xenproject.org>; Tue, 12 May 2026 19:09:42 +0200
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-4891e5b9c1fso53835975e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 12 May 2026 10:09:42 -0700 (PDT)
Received: from EPUAKYIW02F7.. ([45.12.26.18]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48fc8cccf90sm10838845e9.0.2026.05.12.10.09.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 May 2026 10:09:41 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1778605782; x=1779210582; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j/x0rT1oB7OVwr8zqPawvId6h6lac1Z+SScMfAw/LeE=;
        b=aX1Lyq+Px+KI01SjPa6ASdPvaDCV/EOHsqRaNMl06VQxpdbqvQWd02AgwMkqMUFcaE
         QjGWmpMj0NPkzYPpRpCQ+DrHGByu8Sk/yKTpuY5mXYONiC+44b7JmILgKehRzmo3IaSn
         7/D2dx8IsHA0mESVHeqyVTxfYdq5O9Pjhn3xoydCPAnXah49o7UEbHeV7mIa9ojyUvyL
         LxzeBVqwJhMXENYiKWfHeRfSUKR0PhtoBv4903Yqm+xlMpFSUo5FfpPjcATIphlqRG1R
         DbnNLqoOJiAzzieB859na/lp7dO03blR8fE7mGXzMcFMTST3Dvgo8t0r26Iwx1wBVacS
         af3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778605782; x=1779210582;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=j/x0rT1oB7OVwr8zqPawvId6h6lac1Z+SScMfAw/LeE=;
        b=aeQ4Rj46u2cWh1zbJ1jzHjetGELiYlHLwHcpmqcAKstVWSdLj7xV7N/vtooYvQYnEP
         nvIY/TEQSC5dS+/eJU0qu1Uzhv2DHKagQPa07DtVlil375VTTuUokGQDxjaVL9tg7Ru2
         tlEDD2xj6aaJFdIYHUuOxZFSLjHbpY2F4AjzvSA8jvul/Dzyz4Cjvgc4w9uf3txlalqG
         BeqiojUtHduk4L7oszvWtUc1+hlwq8WiVqQ1nmFTwmDuBT+14yS8ZtjuUruvZk1sQUov
         wvQ9BduhU4vkYclLZIpz3hFWBB8nZxzGip7SUM803AJddvHKnzzjORoI/3rr5lkJnvi6
         /G1Q==
X-Gm-Message-State: AOJu0YxUHd8GDsKxtPMdf8k9kKkY/jYllYsKeolYdqkK9o1sykOfvP27
	pbmjw+FJ3J+WqcKl1xMPMipa4pCXfHuMY7ScH+YfLXTM0uBmKtEVVDTYrDhd1g==
X-Gm-Gg: Acq92OFAOmArw3ZTNgdlkcGi+Ur/uQ6qPV5dTLUpGSUGVBmHceW8xBkqcEFaBcAFxeD
	xul8tT2nAz1uSM4DNaXqKQIWbDlarM4KzBKjPE7MnV14pGvoRFGrtkUbsQEW5zTGs5fc0H9bntI
	lUqpyFO7dIm9AKK9zN+ZljStyvHMz4DIh9G8rjF8mIFlRzHE9yeORKJkeSeN83t7lZLDpmKIehv
	PzGLFiln+/phqyD6/pfK52EONEy7JXn3onCFMbnDx2OpkBOHS/+uhmK5EDXlP2yTdECS61KIwo3
	IZRjFSTUpboLmuMxvzYfIhLpN//a27fh92XRtwqyQaYMh+f/M6w68jEDdJ/NTtdN5BAqsiqMp1O
	d/Rgcpe70CzEauyg70SAIymnVUzBEmZpUF5L6lQAig4lqi47CJ1NZg3fVa8Yj2HTIYozkkHi+pM
	krQ6aqSy9QiMu8RK1L2VXsRZiM8g==
X-Received: by 2002:a05:600c:a11a:b0:48e:635a:18d2 with SMTP id 5b1f17b1804b1-48e8fe4dc0bmr45550805e9.2.1778605781824;
        Tue, 12 May 2026 10:09:41 -0700 (PDT)
From: Mykola Kvach <xakep.amatop@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Mykola Kvach <mykola_kvach@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Julien Grall <jgrall@amazon.com>,
	Luca Fancellu <luca.fancellu@arm.com>
Subject: [PATCH v9 01/13] xen/arm: Add suspend and resume timer helpers
Date: Tue, 12 May 2026 20:07:08 +0300
Message-ID: <178c6b2d729d6d341e3647cb63f36af9df6c3301.1778605274.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1778605274.git.mykola_kvach@epam.com>
References: <cover.1778605274.git.mykola_kvach@epam.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-4011c0/1778605782-6FF598B7-1695E299/0/0
X-purgate-type: clean
X-purgate-size: 5064

From: Mirela Simonovic <mirela.simonovic@aggios.com>

Timer interrupts must be disabled while the system is suspended to prevent
spurious wake-ups. Suspending timers in Xen consists of disabling the
physical timer and the hypervisor timer on the current CPU. The virtual
timer does not need explicit handling here, as it is already disabled on
vCPU context switch and its state is restored per-vCPU on the next context
restore.

Resuming consists of raising TIMER_SOFTIRQ, which prompts the generic
timer code to reprogram the hypervisor timer with the correct timeout.

Xen does not use or expose the physical timer, so it remains disabled
across suspend/resume.

Introduce a new helper, disable_phys_hyp_timers(), to encapsulate disabling
of the physical and hypervisor timers.

Signed-off-by: Mirela Simonovic <mirela.simonovic@aggios.com>
Signed-off-by: Saeed Nowshadi <saeed.nowshadi@xilinx.com>
Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
Acked-by: Julien Grall <jgrall@amazon.com>
Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>
---
Changes in V7:
  - Dropped EL1/EL2 wording; use "physical timer" and "hypervisor timer"
  - Renamed helper to disable_phys_hyp_timers() to reflect its actual scope
  - Clarified virtual timer handling (disabled on vCPU switch-out, restored
    on context restore) and added comments in suspend/resume paths
  - Added resume comment explaining which timers are restored by
    TIMER_SOFTIRQ
---
 xen/arch/arm/include/asm/time.h |  5 ++++
 xen/arch/arm/time.c             | 44 ++++++++++++++++++++++++++++-----
 2 files changed, 43 insertions(+), 6 deletions(-)

diff --git a/xen/arch/arm/include/asm/time.h b/xen/arch/arm/include/asm/time.h
index c194dbb9f5..9313b157ea 100644
--- a/xen/arch/arm/include/asm/time.h
+++ b/xen/arch/arm/include/asm/time.h
@@ -105,6 +105,11 @@ void preinit_xen_time(void);
 
 void force_update_vcpu_system_time(struct vcpu *v);
 
+#ifdef CONFIG_SYSTEM_SUSPEND
+void time_suspend(void);
+void time_resume(void);
+#endif /* CONFIG_SYSTEM_SUSPEND */
+
 #endif /* __ARM_TIME_H__ */
 /*
  * Local variables:
diff --git a/xen/arch/arm/time.c b/xen/arch/arm/time.c
index 6955b2788f..fff8e4aca6 100644
--- a/xen/arch/arm/time.c
+++ b/xen/arch/arm/time.c
@@ -296,6 +296,14 @@ static void check_timer_irq_cfg(unsigned int irq, const char *which)
 static DEFINE_PER_CPU_READ_MOSTLY(struct irqaction, irq_hyp);
 static DEFINE_PER_CPU_READ_MOSTLY(struct irqaction, irq_virt);
 
+/* Disable physical and hypervisor timers on the current CPU */
+static inline void disable_phys_hyp_timers(void)
+{
+    WRITE_SYSREG(0, CNTP_CTL_EL0);    /* Physical timer disabled */
+    WRITE_SYSREG(0, CNTHP_CTL_EL2);   /* Hypervisor's timer disabled */
+    isb();
+}
+
 /* Set up the timer interrupt on this CPU */
 void init_timer_interrupt(void)
 {
@@ -306,9 +314,7 @@ void init_timer_interrupt(void)
     WRITE_SYSREG64(0, CNTVOFF_EL2);     /* No VM-specific offset */
     /* Do not let the VMs program the physical timer, only read the physical counter */
     WRITE_SYSREG(CNTHCTL_EL2_EL1PCTEN, CNTHCTL_EL2);
-    WRITE_SYSREG(0, CNTP_CTL_EL0);    /* Physical timer disabled */
-    WRITE_SYSREG(0, CNTHP_CTL_EL2);   /* Hypervisor's timer disabled */
-    isb();
+    disable_phys_hyp_timers();
 
     hyp_action->name = "hyptimer";
     hyp_action->handler = htimer_interrupt;
@@ -333,9 +339,7 @@ void init_timer_interrupt(void)
  */
 static void deinit_timer_interrupt(void)
 {
-    WRITE_SYSREG(0, CNTP_CTL_EL0);    /* Disable physical timer */
-    WRITE_SYSREG(0, CNTHP_CTL_EL2);   /* Disable hypervisor's timer */
-    isb();
+    disable_phys_hyp_timers();
 
     release_irq(timer_irq[TIMER_HYP_PPI], NULL);
     release_irq(timer_irq[TIMER_VIRT_PPI], NULL);
@@ -375,6 +379,34 @@ void domain_set_time_offset(struct domain *d, int64_t time_offset_seconds)
     /* XXX update guest visible wallclock time */
 }
 
+#ifdef CONFIG_SYSTEM_SUSPEND
+
+void time_suspend(void)
+{
+    /* CNTV already disabled by virt_timer_save() during vcpu context switch. */
+    disable_phys_hyp_timers();
+}
+
+void time_resume(void)
+{
+    /*
+     * Raising TIMER_SOFTIRQ triggers generic timer code to reprogram the
+     * hypervisor timer with the correct timeout (not known here).
+     *
+     * Xen doesn't use or expose the physical timer, so it remains disabled
+     * across suspend/resume.
+     *
+     * The virtual timer state is restored per-vCPU on the next context switch.
+     *
+     * No further action is needed to restore timekeeping after power down,
+     * since the system counter is unaffected. See ARM DDI 0487 L.a, D12.1.2
+     * "The system counter must be implemented in an always-on power domain."
+     */
+    raise_softirq(TIMER_SOFTIRQ);
+}
+
+#endif /* CONFIG_SYSTEM_SUSPEND */
+
 static int cpu_time_callback(struct notifier_block *nfb,
                              unsigned long action,
                              void *hcpu)
-- 
2.43.0


