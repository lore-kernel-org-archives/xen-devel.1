Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66FE3FC592F
	for <xen-devel@archiver.kernel.org>; Thu, 26 Feb 2026 11:51:50 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1241455.1542510 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vvZu1-0006xl-1i; Thu, 26 Feb 2026 11:51:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1241455.1542510; Thu, 26 Feb 2026 11:51:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vvZu0-0006xS-R9; Thu, 26 Feb 2026 11:51:32 +0000
Received: by outflank-mailman (input) for mailman id 1241455;
 Thu, 26 Feb 2026 11:51:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1Tft=A6=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vvZtz-0006E8-MR
 for xen-devel@lists.xenproject.org; Thu, 26 Feb 2026 11:51:31 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7da961ba-1309-11f1-b164-2bf370ae4941;
 Thu, 26 Feb 2026 12:51:31 +0100 (CET)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4836d4c26d3so5243045e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 26 Feb 2026 03:51:31 -0800 (PST)
Received: from fedora (user-109-243-67-101.play-internet.pl. [109.243.67.101])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483bd68826asm220079295e9.0.2026.02.26.03.51.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Feb 2026 03:51:29 -0800 (PST)
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
X-Inumbo-ID: 7da961ba-1309-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772106690; x=1772711490; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tg5etO1tk6Lt3f6BDEvCCqmunpQhCPFEnQLjlhq8TEw=;
        b=lNRRXncDpZcQ3C2vN5pa2w/2+0Z8u1zGEAb4OuHBWJv06bQlAHifJ/ACPExfc6bG2n
         5ErLJ+Av0ngAKC5PAiawHxdjfM/l4owiu6MyWggf7uYGMi+2nmclJEn93RqouHDwFQPt
         lnt/0gqGLFRvXFPyyt8sPwuBkGxft99O9zd65mc6kMifiKNrTggX0riAQ7nRtxfPhOsx
         BhABLhTifrcqR5GNT1BH3kCqjd+061CEofJkvOunbnC/965bYnu13ZNNIOa2WjIMikXP
         9/45/MvxvsitcuSscvb/iD2J/p7Igtgqfh0QZNc6S4MQGXaEzUrVLVOC+0SE7pWXQu6p
         kX/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772106690; x=1772711490;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Tg5etO1tk6Lt3f6BDEvCCqmunpQhCPFEnQLjlhq8TEw=;
        b=sLpo5od1yn2VbIUfQuClNBpzZpNhado7s8zor7WMtTbSozQjfCBAcnQFtHjh90vg71
         1O+oP/n9Y8Djx/ScoQasbhXXN0zfGBqXULRuHF0ujmeYQyxEgV/DdbJ4E5BdCgu4N4eu
         AytAICl5sx+vzUvV8qf1HmAY8hZ69XC++oXvje8P94pwufV3+u4QWYh+EItgHIfaPYQe
         be8CqobEHpzvoTjGPvoFxA4Dv8dJuCR/ZDv6EmKF/wtD2k1UkZVCMam7NORLqJw47A3e
         lLZEXoRXj0UqfFbYxdCH8IuZVOdklBVkhd8bwDxacCXNJF3uFGSpLLAYMZgLrQ9cSJeH
         311A==
X-Gm-Message-State: AOJu0YyolOfMAr0NYLwnfOgQsn4bKKSBGvVpQ+6hvguIn+4jMRu5T0A7
	mOcTkObFzm3ZFN+6a4Z0mCaKRM6lk90aUE2czhGkVyjgPH1zbSGi3/rbWFpnKA==
X-Gm-Gg: ATEYQzxwilM9iPkPpr/07BgtFcqZWiParMBkcvV2BhLeSXIcABUeAI8J2VZbKkITcZZ
	vz5fVjqfAJssvhvTt+08/ZVkzP/JhOAoh48AYA1giCEKTP+lYxP320wUGEmwAM+E2mw4t41Xvtg
	s2WVvGZfreYxLoLRxak88RVKPy+RNg1Qp5XGVuY+tbhfCrdMZXEI21GhajIVzKPS2C+Yve9mFVT
	N6r5N8rXsks42AfxGjypZor8Z/akBtgS3ERGbJwSgSEv4ZI17CfFFW+pjlutGubmRUCvAoeLL5y
	1klZC5VTU5HFoIbOnD1a+f0nW8nJiT9mZhT+F4L+m5OywlyUNXgf4Tg+9l81yJIvLgP7NMy2pX0
	TEduWjh7TJIL0YQjrMu7GXRpnlA/O5e4fP6yFpmZRj458Qs4RRbeyzOl/SLvK0CBWAp5Gop03ZO
	yRqVwo3+OJoTQi7jH0KNHYAdsz6ZheW+FZfEJYKtJUhS7ynfcKu2qDtSrKfDrSyHzrmA==
X-Received: by 2002:a05:600c:8b02:b0:47d:5e02:14e5 with SMTP id 5b1f17b1804b1-483a95a86eamr340717315e9.5.1772106690170;
        Thu, 26 Feb 2026 03:51:30 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>
Subject: [PATCH v6 05/14] xen/time: move ticks<->ns helpers to common code
Date: Thu, 26 Feb 2026 12:51:05 +0100
Message-ID: <545c2af877d519b1186c79fd6108d33e7e52cd3b.1772016457.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1772016457.git.oleksii.kurochko@gmail.com>
References: <cover.1772016457.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ticks_to_ns() and ns_to_ticks() are not architecture-specific, so provide a
common implementation that is more resilient to overflow than the historical
Arm version. This is not a practical issue for Arm, as the latest ARM ARM
that timer frequency should be fixed at 1 GHz and older platforms used much
lower rates, which is shy of 32-bit overflow. As the helpers are declared
as static inline, they should not affect x86, which does not use them.

On Arm, these helpers were historically implemented as out-of-line functions
because the counter frequency was originally defined as static and unavailable
to headers [1]. Later changes [2] removed this restriction, but the helpers
remained unchanged. Now they can be implemented as static inline without any
issues.

Centralising the helpers avoids duplication and removes subtle differences
between architectures while keeping the implementation simple.

Drop redundant <asm/time.h> includes where <xen/time.h> already pulls it in.

No functional change is intended.

[1] ddee56dc2994 arm: driver for the generic timer for ARMv7
[2] 096578b4e489 xen: move XEN_SYSCTL_physinfo, XEN_SYSCTL_numainfo and
                      XEN_SYSCTL_topologyinfo to common code

Suggested-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
Changes in v4-v6:
 - Nothing changed. Only rebase.
---
Changes in v3:
 - Add Reviewed-by: Jan Beulich <jbeulich@suse.com>.
---
Changes in v2:
 - Move ns_to_ticks() and ticks_to_ns() to common code.
---
 xen/arch/arm/include/asm/time.h   |  3 ---
 xen/arch/arm/time.c               | 11 -----------
 xen/arch/arm/vtimer.c             |  2 +-
 xen/arch/riscv/include/asm/time.h |  5 -----
 xen/arch/riscv/time.c             |  1 +
 xen/include/xen/time.h            | 11 +++++++++++
 6 files changed, 13 insertions(+), 20 deletions(-)

diff --git a/xen/arch/arm/include/asm/time.h b/xen/arch/arm/include/asm/time.h
index 49ad8c1a6d47..c194dbb9f52d 100644
--- a/xen/arch/arm/include/asm/time.h
+++ b/xen/arch/arm/include/asm/time.h
@@ -101,9 +101,6 @@ extern void init_timer_interrupt(void);
 /* Counter value at boot time */
 extern uint64_t boot_count;
 
-extern s_time_t ticks_to_ns(uint64_t ticks);
-extern uint64_t ns_to_ticks(s_time_t ns);
-
 void preinit_xen_time(void);
 
 void force_update_vcpu_system_time(struct vcpu *v);
diff --git a/xen/arch/arm/time.c b/xen/arch/arm/time.c
index cc3fcf47b66a..a12912a106a0 100644
--- a/xen/arch/arm/time.c
+++ b/xen/arch/arm/time.c
@@ -27,7 +27,6 @@
 #include <asm/cpufeature.h>
 #include <asm/platform.h>
 #include <asm/system.h>
-#include <asm/time.h>
 #include <asm/vgic.h>
 
 uint64_t __read_mostly boot_count;
@@ -47,16 +46,6 @@ unsigned int timer_get_irq(enum timer_ppi ppi)
     return timer_irq[ppi];
 }
 
-/*static inline*/ s_time_t ticks_to_ns(uint64_t ticks)
-{
-    return muldiv64(ticks, SECONDS(1), 1000 * cpu_khz);
-}
-
-/*static inline*/ uint64_t ns_to_ticks(s_time_t ns)
-{
-    return muldiv64(ns, 1000 * cpu_khz, SECONDS(1));
-}
-
 static __initdata struct dt_device_node *timer;
 
 #ifdef CONFIG_ACPI
diff --git a/xen/arch/arm/vtimer.c b/xen/arch/arm/vtimer.c
index d2124b175521..2e85ff2b6e62 100644
--- a/xen/arch/arm/vtimer.c
+++ b/xen/arch/arm/vtimer.c
@@ -12,13 +12,13 @@
 #include <xen/lib.h>
 #include <xen/perfc.h>
 #include <xen/sched.h>
+#include <xen/time.h>
 #include <xen/timer.h>
 
 #include <asm/cpregs.h>
 #include <asm/div64.h>
 #include <asm/irq.h>
 #include <asm/regs.h>
-#include <asm/time.h>
 #include <asm/vgic.h>
 #include <asm/vreg.h>
 #include <asm/vtimer.h>
diff --git a/xen/arch/riscv/include/asm/time.h b/xen/arch/riscv/include/asm/time.h
index 1e7801e2ea0e..be3875b9984e 100644
--- a/xen/arch/riscv/include/asm/time.h
+++ b/xen/arch/riscv/include/asm/time.h
@@ -24,11 +24,6 @@ static inline cycles_t get_cycles(void)
     return csr_read(CSR_TIME);
 }
 
-static inline s_time_t ticks_to_ns(uint64_t ticks)
-{
-    return muldiv64(ticks, MILLISECS(1), cpu_khz);
-}
-
 void preinit_xen_time(void);
 
 #endif /* ASM__RISCV__TIME_H */
diff --git a/xen/arch/riscv/time.c b/xen/arch/riscv/time.c
index e962f8518d78..2c7af0a5d63b 100644
--- a/xen/arch/riscv/time.c
+++ b/xen/arch/riscv/time.c
@@ -4,6 +4,7 @@
 #include <xen/init.h>
 #include <xen/lib.h>
 #include <xen/sections.h>
+#include <xen/time.h>
 #include <xen/types.h>
 
 unsigned long __ro_after_init cpu_khz; /* CPU clock frequency in kHz. */
diff --git a/xen/include/xen/time.h b/xen/include/xen/time.h
index fe0d7a578a99..2185dd26a439 100644
--- a/xen/include/xen/time.h
+++ b/xen/include/xen/time.h
@@ -8,6 +8,7 @@
 #ifndef __XEN_TIME_H__
 #define __XEN_TIME_H__
 
+#include <xen/muldiv64.h>
 #include <xen/types.h>
 #include <public/xen.h>
 
@@ -75,6 +76,16 @@ extern void send_timer_event(struct vcpu *v);
 
 void domain_set_time_offset(struct domain *d, int64_t time_offset_seconds);
 
+static inline s_time_t ticks_to_ns(uint64_t ticks)
+{
+    return muldiv64(ticks, MILLISECS(1), cpu_khz);
+}
+
+static inline uint64_t ns_to_ticks(s_time_t ns)
+{
+    return muldiv64(ns, cpu_khz, MILLISECS(1));
+}
+
 #include <asm/time.h>
 
 #endif /* __XEN_TIME_H__ */
-- 
2.53.0


