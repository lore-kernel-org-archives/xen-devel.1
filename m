Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1074AEF48C9
	for <xen-devel@archiver.kernel.org>; Fri, 13 Feb 2026 16:29:34 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1231318.1536568 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqw2m-0007Zb-5V; Fri, 13 Feb 2026 16:29:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1231318.1536568; Fri, 13 Feb 2026 16:29:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqw2l-0007YT-Or; Fri, 13 Feb 2026 16:29:23 +0000
Received: by outflank-mailman (input) for mailman id 1231318;
 Fri, 13 Feb 2026 16:29:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HtAj=AR=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vqw2k-0005Wn-5Y
 for xen-devel@lists.xenproject.org; Fri, 13 Feb 2026 16:29:22 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 25e5c8fd-08f9-11f1-9ccf-f158ae23cfc8;
 Fri, 13 Feb 2026 17:29:20 +0100 (CET)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-4833115090dso10076225e9.3
 for <xen-devel@lists.xenproject.org>; Fri, 13 Feb 2026 08:29:20 -0800 (PST)
Received: from fedora (user-109-243-67-101.play-internet.pl. [109.243.67.101])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4834d5ebd1bsm303288185e9.6.2026.02.13.08.29.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Feb 2026 08:29:18 -0800 (PST)
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
X-Inumbo-ID: 25e5c8fd-08f9-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771000159; x=1771604959; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U12wg7j2L+OzyyqYL/Nhiy8muuFfmghvCXhWj5eSfXY=;
        b=HNzZqAzJCc5molMLJ+UjmCnCZMeS5Q0NGdGy6uVA2NuPfj3K2+GOLQV9kG9+J6R2Ue
         LWLfyvlLD39VYBoqFLlMhfbQQ9e70FcQuGWQ3GPNj9LWDFqeyuT6OM34731tpTImifLb
         Iu1MVS6YrBlKUH8B8I5ZtNkK/+LqNpmWbEBxNMjCZDDeEPSLrEbMKwJZe63Wj0YVWbho
         SZtzbIxlBG4QHbdMbqj1569je3l2J95R4NeVlwvpVtLxMYKmpJ//p9RNCogG8oK9KNtl
         dKR5jpFrhRlzX7RQdAdmeEfB25eyCuSm9ZTEhlx5+xEIn9PeYgXS38NqyE+KQ2BJ+NBs
         jUHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771000159; x=1771604959;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=U12wg7j2L+OzyyqYL/Nhiy8muuFfmghvCXhWj5eSfXY=;
        b=HsyyMfYopeonN2VQbx+MmRK9BbVFS+6KDgOLy/gZfKMKebhNxeHVcOugEiFS4stRPW
         vt06E+5jbM93d16oWoNCO7YIW6aBaRNXDofrFDiEVAfvzZ9BcguT0l9Il24Q2vdDY+Z4
         bpRmU2XvvrMvTuKwAiV9SApkMHyUUsdviu8ze1n4y2IIvDEc4/KHIOyYrA0spB+pzln1
         /iT9vlPsmOTn9sq5KW9zWArBcts5ce0Jfj2F3FcP7H2pZe8DnEo6kDixjKw4Fms3koWd
         fJ6ExGXpLpG6vEDHr34P5e1GZuFd/xJc4EvWaQpz94C+pRHjoCtoP8xwQBwo9/CYAC0J
         FRtw==
X-Gm-Message-State: AOJu0YyQ+SRxNxVBN43DIAHKNRLR7rJ+8vlNffmgZjNohdM4JHKHzmbn
	NFRIC7WbfY5kiG86gpmv4kYfwrez1aHhhqJbNsUVl8DcXbj+YniVgTkvU3RCDTkk
X-Gm-Gg: AZuq6aL5tOANSs5otA4dii4d3eoWJr2RPT0ciPQ5F2aC0z1qmU6HEmduiK5/BcOAH3f
	zoLVoEmbuUFD9WQ2rEfyig6OnEeHJplmpWZjNCgfe8hgMcmTmLriroAW6OHJrzpmcS4SX/U6XRJ
	VuQuqcI/eTuxkY1TusqHi7HjjsqQP9a3KQh7KLneYFoSZmnNqPM+US9xPqQW1oeFw4+NmP7CXYL
	vA4jxbZIxqu/qaHyi8tWb0V1Xq4yd1+ogUN8Yb/ix0pWnBzXS/2SEWB3k0ouTcMjgthxMkgSTcw
	bPSXS+bjRyrUJtRnDkBnohfIvUkegzj8DGNi/UyenTvga/pgOeTNgo6fgl/obWIzCJTcpwOXEt4
	/kSEVo2C7luaf+5bgJoVlCvcenmnuiulASiKSqqiro+O5IHPbcLp9dcF63kiB1iEGWxGBxWJ+AY
	aFRrnIlbGtomWJw8MP4IFBohsYRgmHO5VnXlwndRCVdtcWspUKwbJ/QAoaX1NzKlp1GZU2vQ==
X-Received: by 2002:a05:600c:4745:b0:483:6bb1:117 with SMTP id 5b1f17b1804b1-48373a7591amr33578375e9.32.1771000159094;
        Fri, 13 Feb 2026 08:29:19 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v4 08/16] xen/riscv: introduce basic vtimer infrastructure for guests
Date: Fri, 13 Feb 2026 17:28:54 +0100
Message-ID: <7426e2d974bfe67786c67709d487c7f64c22ae58.1770999383.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1770999383.git.oleksii.kurochko@gmail.com>
References: <cover.1770999383.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Lay the groundwork for guest timer support by introducing a per-vCPU
virtual timer backed by Xen’s common timer infrastructure.

The virtual timer is programmed in response to the guest SBI
sbi_set_timer() call and injects a virtual supervisor timer interrupt
into the vCPU when it expires.

While a dedicated struct vtimer is not strictly required at present,
it is expected to become necessary once SSTC support is introduced.
In particular, it will need to carry additional state such as whether
SSTC is enabled, the next compare value (e.g. for the VSTIMECMP CSR)
to be saved and restored across context switches, and time delta state
(e.g. HTIMEDELTA) required for use cases such as migration. Introducing
struct vtimer now avoids a later refactoring.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in v4:
 - Add vcpu_timer_destroy() to void arch_vcpu_destroy().
---
Changes in v3:
 - use one container_of() to get vcpu instead of two container_of()s.
---
Changes in v2:
 - Drop domain_vtimer_init() as it does nothing.
 - Drop "struct vcpu *v;" from struct vtimer as it could be taken
   from arch_vcpu using container_of().
 - Drop vtimer_initialized, use t->status == TIMER_STATUS_invalid
   instead to understand if timer was or wasn't initialized.
 - Drop inclusion of xen/domain.h as xen/sched.h already includes it.
 - s/ xen/time.h/ xen.timer.h in vtimer.c.
 - Drop ULL in if-conidtion in vtimer_set_timer() as with the cast
   it isn't necessary to have suffix ULL.
 - Add migrate timer to vtimer_set_timer() to be sure that vtimer
   will occur on pCPU it was ran, so the signalling to that vCPU
   will (commonly) be cheaper.
 - Check if the timeout has already expired and just inject the event
   in vtimer_vtimer_set_timer().
 - Drop const for ticks argument of vtimer_set_timer().
 - Merge two patches to one:
   - xen/riscv: introduce vtimer
   - xen/riscv: introduce vtimer_set_timer() and vtimer_expired()
---
 xen/arch/riscv/Makefile             |  1 +
 xen/arch/riscv/domain.c             | 10 +++-
 xen/arch/riscv/include/asm/domain.h |  3 ++
 xen/arch/riscv/include/asm/vtimer.h | 20 ++++++++
 xen/arch/riscv/vtimer.c             | 71 +++++++++++++++++++++++++++++
 5 files changed, 103 insertions(+), 2 deletions(-)
 create mode 100644 xen/arch/riscv/include/asm/vtimer.h
 create mode 100644 xen/arch/riscv/vtimer.c

diff --git a/xen/arch/riscv/Makefile b/xen/arch/riscv/Makefile
index bc47e83b26d7..ffbd7062e214 100644
--- a/xen/arch/riscv/Makefile
+++ b/xen/arch/riscv/Makefile
@@ -22,6 +22,7 @@ obj-y += traps.o
 obj-y += vmid.o
 obj-y += vm_event.o
 obj-y += vsbi/
+obj-y += vtimer.o
 
 $(TARGET): $(TARGET)-syms
 	$(OBJCOPY) -O binary -S $< $@
diff --git a/xen/arch/riscv/domain.c b/xen/arch/riscv/domain.c
index 35d8d5db02d0..45a7f0d1da7e 100644
--- a/xen/arch/riscv/domain.c
+++ b/xen/arch/riscv/domain.c
@@ -11,6 +11,7 @@
 #include <asm/csr.h>
 #include <asm/riscv_encoding.h>
 #include <asm/setup.h>
+#include <asm/vtimer.h>
 
 struct csr_masks __ro_after_init csr_masks;
 
@@ -108,11 +109,14 @@ int arch_vcpu_create(struct vcpu *v)
 
     vcpu_csr_init(v);
 
+    if ( (rc = vcpu_vtimer_init(v)) )
+        goto fail;
+
     /*
-     * As the vtimer and interrupt controller (IC) are not yet implemented,
+     * As interrupt controller (IC) is not yet implemented,
      * return an error.
      *
-     * TODO: Drop this once the vtimer and IC are implemented.
+     * TODO: Drop this once IC is implemented.
      */
     rc = -EOPNOTSUPP;
     goto fail;
@@ -126,6 +130,8 @@ int arch_vcpu_create(struct vcpu *v)
 
 void arch_vcpu_destroy(struct vcpu *v)
 {
+    vcpu_timer_destroy(v);
+
     vfree((void *)&v->arch.cpu_info[1] - STACK_SIZE);
 }
 
diff --git a/xen/arch/riscv/include/asm/domain.h b/xen/arch/riscv/include/asm/domain.h
index 5d25a884eea6..3da2387cb197 100644
--- a/xen/arch/riscv/include/asm/domain.h
+++ b/xen/arch/riscv/include/asm/domain.h
@@ -8,6 +8,7 @@
 #include <public/hvm/params.h>
 
 #include <asm/p2m.h>
+#include <asm/vtimer.h>
 
 struct vcpu_vmid {
     uint64_t generation;
@@ -49,6 +50,8 @@ struct arch_vcpu {
 
     struct cpu_info *cpu_info;
 
+    struct vtimer vtimer;
+
     register_t hcounteren;
     register_t hedeleg;
     register_t henvcfg;
diff --git a/xen/arch/riscv/include/asm/vtimer.h b/xen/arch/riscv/include/asm/vtimer.h
new file mode 100644
index 000000000000..0d1555511755
--- /dev/null
+++ b/xen/arch/riscv/include/asm/vtimer.h
@@ -0,0 +1,20 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * (c) 2023-2024 Vates
+ */
+
+#ifndef ASM__RISCV__VTIMER_H
+#define ASM__RISCV__VTIMER_H
+
+#include <xen/timer.h>
+
+struct vtimer {
+    struct timer timer;
+};
+
+int vcpu_vtimer_init(struct vcpu *v);
+void vcpu_timer_destroy(struct vcpu *v);
+
+void vtimer_set_timer(struct vtimer *t, uint64_t ticks);
+
+#endif /* ASM__RISCV__VTIMER_H */
diff --git a/xen/arch/riscv/vtimer.c b/xen/arch/riscv/vtimer.c
new file mode 100644
index 000000000000..32d142bcdfcd
--- /dev/null
+++ b/xen/arch/riscv/vtimer.c
@@ -0,0 +1,71 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#include <xen/sched.h>
+#include <xen/timer.h>
+
+#include <asm/vtimer.h>
+
+static void vtimer_expired(void *data)
+{
+    struct vtimer *t = data;
+    struct vcpu *v = container_of(t, struct vcpu, arch.vtimer);
+
+    vcpu_set_interrupt(v, IRQ_VS_TIMER);
+}
+
+int vcpu_vtimer_init(struct vcpu *v)
+{
+    struct vtimer *t = &v->arch.vtimer;
+
+    init_timer(&t->timer, vtimer_expired, t, v->processor);
+
+    return 0;
+}
+
+void vcpu_timer_destroy(struct vcpu *v)
+{
+    struct vtimer *t = &v->arch.vtimer;
+
+    if ( t->timer.status == TIMER_STATUS_invalid )
+        return;
+
+    kill_timer(&v->arch.vtimer.timer);
+}
+
+void vtimer_set_timer(struct vtimer *t, const uint64_t ticks)
+{
+    struct vcpu *v = container_of(t, struct vcpu, arch.vtimer);
+    s_time_t expires = ticks_to_ns(ticks - boot_clock_cycles);
+
+    vcpu_unset_interrupt(v, IRQ_VS_TIMER);
+
+    /*
+     * According to the RISC-V sbi spec:
+     *   If the supervisor wishes to clear the timer interrupt without
+     *   scheduling the next timer event, it can either request a timer
+     *   interrupt infinitely far into the future (i.e., (uint64_t)-1),
+     *   or it can instead mask the timer interrupt by clearing sie.STIE CSR
+     *   bit.
+     */
+    if ( ticks == ((uint64_t)~0) )
+    {
+        stop_timer(&t->timer);
+
+        return;
+    }
+
+    if ( expires < NOW() )
+    {
+        /*
+         * Simplify the logic if the timeout has already expired and just
+         * inject the event.
+         */
+        stop_timer(&t->timer);
+        vcpu_set_interrupt(v, IRQ_VS_TIMER);
+
+        return;
+    }
+
+    migrate_timer(&t->timer, smp_processor_id());
+    set_timer(&t->timer, expires);
+}
-- 
2.52.0


