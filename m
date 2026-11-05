Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F843606A31B
	for <xen-devel@archiver.kernel.org>; Thu,  5 Nov 2026 15:04:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FV/I76O9
Received: from list by lists.xenproject.org with outflank-mailman.1474908.1681775 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOz0B-0001D7-Mn; Thu, 05 Nov 2026 15:03:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1474908.1681775; Thu, 05 Nov 2026 15:03:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOz0B-0001D0-Jz; Thu, 05 Nov 2026 15:03:43 +0000
Received: by outflank-mailman (input) for mailman id 1474908;
 Thu, 05 Nov 2026 15:03:42 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xOz09-0001Cu-Pz
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 15:03:42 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOz09-00AzKr-2r
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 16:03:41 +0100
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6aec9abe-2eae-0a2a0a5409dd-0a2a4506e05a-38
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 16:03:41 +0100
Received: from [209.85.128.48] (helo=mail-wm1-f48.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6aec9acc-195a-0a2a45060019-d1558030adcb-3
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 16:03:40 +0100
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-4a2d6cf958bso9787635e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 07:03:40 -0800 (PST)
Received: from fedora (user-109-243-65-71.play-internet.pl. [109.243.65.71])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4b57317cb8esm74121585e9.13.2026.11.05.07.03.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Nov 2026 07:03:39 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20260707 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793891020; x=1794495820; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nvr6HpEMBVSx7QqUJgJUbyrp9h4N4e79BJPbeAyxw1s=;
        b=FV/I76O9z0APFCb/cAFYOOfjMiEgVjInJP1L6am0JCNQRE4HL6/AbLh+q5l4/kN0S+
         a1dLiCbd2+jfDqu1LHAYET82GQIOG52O3adBhnLSEBgLLFuUdRcBnWH8YS694fpoxGUT
         PNk75glt8IqFNOqa1loy/9NkFCB7v6YArnwHbkP7e2hQnAyIjLs2/r/OZYeOArR48EuO
         npgtKazN9IVee1kFhd2OFMj7fU1UPk27HxQhgRXn6IakxVBLar1b1Ef3x+RDevRv/YnM
         Ztk61r1XruNmZSby0hv+zEGh/HNEZhiIuug/SHh9YX6p5NbdroRlkMlGW8EYqQMNa1Ak
         nTyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793891020; x=1794495820;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nvr6HpEMBVSx7QqUJgJUbyrp9h4N4e79BJPbeAyxw1s=;
        b=lPURRxDP5hqhPqDwkWcg5/nsjpcALDKgMpdrabv23BvqbfKkh5odotYjRDfoKVQQT1
         +WofKwaopKT2Ve78lKqD47CRUhGRWbEgcMUJpR0zQM2YrCXMHpTK5moliVekpxs/t+u5
         b1+jaNV6CESmQCovwA7++mVPgsHHohKuC3hEYuSYfmqSwqL/K4NauyfkecnmmKvD31ct
         TB2Ly9H34gajhTGBJ6HFMFVkK6nCgz+p2nD0nfW+28FZ6oeARBwMAgfvNZSzoK5cjTKC
         KW0OIn23euCNw9OsOQCZBIgcZXyzg+fAHxDSeqami3gUNlO7XPU2U2z6zHk/lyoem9ZI
         E58Q==
X-Gm-Message-State: APuU4Z+oviT4ENUJI2U45zFjsQ6yQ9caYFv6ssxhHIX+OXjk4J9YhXzL
	8S85GNxU2x/KxTwJ9nu8Q5u8EYKlbcbTex6sVe8sdD2+OuXy4rQYxK6aJYnZog==
X-Gm-Gg: AYBFou2mVFbwdRqyIqtO1qf2Q+0YumzNZLJcU0Fb6hiaS9qU7RPlk2KBkl9rFc2W0b3
	8v1YVXuO2/oX5VlkG2Ti40jLnvFx0pNY4aFH88FZ64/9IFUgj6ZQ34gALokknDIVr6TgAxWcx0/
	tqaixdSzL9pF0kMe2hCCAiMXvgkUwBVAAFeRGNxgYQZVEr21FoOwX08Oq7zpNMCzKPcKc3yCqMg
	XoZBI/5Ko8nb7woZMP/4JwTDefrEgAkmVmdKmaBzx4oEPGZJWwL7+XThZ5uWbYwddn4Iwd+bIys
	X67LmUcy2BaskggETCcN4rjiZCOlIuosJse5JZOKtQV/dDqJeYoJ2NySuepYao690TEOKiJRVKl
	LWS9b0+HuVkWwMh6K5/oQSbdyQzwb/FUv0+koD/US8BydO28yj7CEp6O23azsiZce+rRu98LdC2
	+iYUKNB5eQIDcNNDD2AOfLY28FuPrahSKOrj7ItLbkQCWgBEVzAzipgyjtJc8BsnBT9TQZBt+0s
	W+2a41VUIIRQWFO84M8A7Izcvzxn7Agztc4PbrjzsMnjH0gTGRek8tEHhzrn4ixXm8wyAzQBAth
	nveqA0EK/liSrQ2DNNRNxXFiOZHKttnVYttmwkoJcHgz2rVPuft+cw+zPyafhStFV1cj
X-Received: by 2002:a05:600c:4ece:b0:4a2:40:8d2c with SMTP id 5b1f17b1804b1-4ac17b2c396mr411580545e9.26.1793891019977;
        Thu, 05 Nov 2026 07:03:39 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Baptiste Le Duc <baptiste.le-duc@vates.tech>,
	Connor Davis <connojdavis@gmail.com>,
	Tamas K Lengyel <tamas@tklengyel.com>,
	Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v1] xen/riscv: align header inclusion guards with CODING_STYLE
Date: Thu,  5 Nov 2026 16:03:36 +0100
Message-ID: <20261105150336.25751-1-oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-16d1c6/1793891020-F4A0477B-AEF422B6/10/73395122804
X-purgate-type: spam
X-purgate-size: 36386
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Commit 7abea85c9f12 ("CODING_STYLE: Updated header guard
recommendations") changed the recommended naming of inclusion guards
for arch-specific headers to <arch>_<something>_H. Most RISC-V headers
still use the ASM__RISCV__<FILENAME>_H form required by the previous
rules, and a few use ASM_RISCV_<FILENAME>_H, which follows neither.

Rename the guards to RISCV_<SOMETHING>_H. While doing so, also fix two
guards which don't match their file names: extable.h used
ASM__RISCV__ASM_EXTABLE_H and intc.h used the misspelt
ASM__RISCV__INTERRUPT_CONTOLLER_H. For riscv_encoding.h, don't repeat
the architecture name and use RISCV_ENCODING_H.

No functional change.

Assisted-by: Claude-Code:claude-opus-5-5
Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/arch/riscv/aplic-priv.h                 | 6 +++---
 xen/arch/riscv/include/asm/acpi.h           | 6 +++---
 xen/arch/riscv/include/asm/aplic.h          | 6 +++---
 xen/arch/riscv/include/asm/asm.h            | 6 +++---
 xen/arch/riscv/include/asm/atomic.h         | 6 +++---
 xen/arch/riscv/include/asm/bitops.h         | 6 +++---
 xen/arch/riscv/include/asm/bug.h            | 6 +++---
 xen/arch/riscv/include/asm/cache.h          | 6 +++---
 xen/arch/riscv/include/asm/cmpxchg.h        | 6 +++---
 xen/arch/riscv/include/asm/config.h         | 6 +++---
 xen/arch/riscv/include/asm/cpufeature.h     | 6 +++---
 xen/arch/riscv/include/asm/csr.h            | 6 +++---
 xen/arch/riscv/include/asm/current.h        | 6 +++---
 xen/arch/riscv/include/asm/domain.h         | 6 +++---
 xen/arch/riscv/include/asm/early_printk.h   | 6 +++---
 xen/arch/riscv/include/asm/event.h          | 6 +++---
 xen/arch/riscv/include/asm/extable.h        | 6 +++---
 xen/arch/riscv/include/asm/fence.h          | 6 +++---
 xen/arch/riscv/include/asm/fixmap.h         | 6 +++---
 xen/arch/riscv/include/asm/flushtlb.h       | 6 +++---
 xen/arch/riscv/include/asm/guest-layout.h   | 6 +++---
 xen/arch/riscv/include/asm/guest_access.h   | 6 +++---
 xen/arch/riscv/include/asm/guest_atomics.h  | 6 +++---
 xen/arch/riscv/include/asm/imsic.h          | 6 +++---
 xen/arch/riscv/include/asm/insn-defs.h      | 6 +++---
 xen/arch/riscv/include/asm/intc.h           | 6 +++---
 xen/arch/riscv/include/asm/io.h             | 6 +++---
 xen/arch/riscv/include/asm/irq.h            | 6 +++---
 xen/arch/riscv/include/asm/mm-types.h       | 6 +++---
 xen/arch/riscv/include/asm/mm.h             | 6 +++---
 xen/arch/riscv/include/asm/monitor.h        | 6 +++---
 xen/arch/riscv/include/asm/nospec.h         | 6 +++---
 xen/arch/riscv/include/asm/p2m.h            | 6 +++---
 xen/arch/riscv/include/asm/page-bits.h      | 6 +++---
 xen/arch/riscv/include/asm/page.h           | 6 +++---
 xen/arch/riscv/include/asm/paging.h         | 6 +++---
 xen/arch/riscv/include/asm/pmap.h           | 6 +++---
 xen/arch/riscv/include/asm/processor.h      | 6 +++---
 xen/arch/riscv/include/asm/regs.h           | 6 +++---
 xen/arch/riscv/include/asm/riscv_encoding.h | 4 ++--
 xen/arch/riscv/include/asm/sbi.h            | 6 +++---
 xen/arch/riscv/include/asm/setup.h          | 6 +++---
 xen/arch/riscv/include/asm/smp.h            | 4 ++--
 xen/arch/riscv/include/asm/spinlock.h       | 6 +++---
 xen/arch/riscv/include/asm/string.h         | 6 +++---
 xen/arch/riscv/include/asm/system.h         | 6 +++---
 xen/arch/riscv/include/asm/time.h           | 6 +++---
 xen/arch/riscv/include/asm/traps.h          | 6 +++---
 xen/arch/riscv/include/asm/types.h          | 6 +++---
 xen/arch/riscv/include/asm/vaplic.h         | 6 +++---
 xen/arch/riscv/include/asm/vmid.h           | 6 +++---
 xen/arch/riscv/include/asm/vsbi.h           | 4 ++--
 xen/arch/riscv/include/asm/vtimer.h         | 6 +++---
 53 files changed, 156 insertions(+), 156 deletions(-)

diff --git a/xen/arch/riscv/aplic-priv.h b/xen/arch/riscv/aplic-priv.h
index 35100d3a64fe..009020c83fb9 100644
--- a/xen/arch/riscv/aplic-priv.h
+++ b/xen/arch/riscv/aplic-priv.h
@@ -11,8 +11,8 @@
  * Copyright (c) Vates.
  */
 
-#ifndef ASM_RISCV_APLIC_PRIV_H
-#define ASM_RISCV_APLIC_PRIV_H
+#ifndef RISCV_APLIC_PRIV_H
+#define RISCV_APLIC_PRIV_H
 
 #include <xen/spinlock.h>
 #include <xen/types.h>
@@ -47,4 +47,4 @@ struct aplic_priv {
  */
 extern unsigned int guest_aplic_num_sources;
 
-#endif /* ASM_RISCV_APLIC_PRIV_H */
+#endif /* RISCV_APLIC_PRIV_H */
diff --git a/xen/arch/riscv/include/asm/acpi.h b/xen/arch/riscv/include/asm/acpi.h
index 0c553bd6b8fa..8c769b2c0bd9 100644
--- a/xen/arch/riscv/include/asm/acpi.h
+++ b/xen/arch/riscv/include/asm/acpi.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 
-#ifndef ASM__RISCV__ACPI_H
-#define ASM__RISCV__ACPI_H
+#ifndef RISCV_ACPI_H
+#define RISCV_ACPI_H
 
-#endif /* ASM__RISCV__ACPI_H */
+#endif /* RISCV_ACPI_H */
diff --git a/xen/arch/riscv/include/asm/aplic.h b/xen/arch/riscv/include/asm/aplic.h
index a2af55d54fc0..51be469b69e5 100644
--- a/xen/arch/riscv/include/asm/aplic.h
+++ b/xen/arch/riscv/include/asm/aplic.h
@@ -8,8 +8,8 @@
  * Copyright (c) Microchip.
  */
 
-#ifndef ASM_RISCV_APLIC_H
-#define ASM_RISCV_APLIC_H
+#ifndef RISCV_APLIC_H
+#define RISCV_APLIC_H
 
 #include <xen/types.h>
 
@@ -141,4 +141,4 @@ struct aplic_regs {
     uint32_t target[1023];      /* 0x3004 */
 };
 
-#endif /* ASM_RISCV_APLIC_H */
+#endif /* RISCV_APLIC_H */
diff --git a/xen/arch/riscv/include/asm/asm.h b/xen/arch/riscv/include/asm/asm.h
index e147b6f05388..a663db4c23e4 100644
--- a/xen/arch/riscv/include/asm/asm.h
+++ b/xen/arch/riscv/include/asm/asm.h
@@ -3,8 +3,8 @@
  * Copyright (C) 2015 Regents of the University of California
  */
 
-#ifndef ASM__RISCV__ASM_H
-#define ASM__RISCV__ASM_H
+#ifndef RISCV_ASM_H
+#define RISCV_ASM_H
 
 #ifdef __ASSEMBLER__
 #include <xen/linkage.h>
@@ -52,4 +52,4 @@
 #error "Unexpected __SIZEOF_SHORT__"
 #endif
 
-#endif /* ASM__RISCV__ASM_H */
+#endif /* RISCV_ASM_H */
diff --git a/xen/arch/riscv/include/asm/atomic.h b/xen/arch/riscv/include/asm/atomic.h
index 8e0425cea0b9..3a0184d35dcd 100644
--- a/xen/arch/riscv/include/asm/atomic.h
+++ b/xen/arch/riscv/include/asm/atomic.h
@@ -19,8 +19,8 @@
  * Copyright (C) 2024 Vates SAS
  */
 
-#ifndef ASM__RISCV__ATOMIC_H
-#define ASM__RISCV__ATOMIC_H
+#ifndef RISCV_ATOMIC_H
+#define RISCV_ATOMIC_H
 
 #include <xen/atomic.h>
 
@@ -266,7 +266,7 @@ ATOMIC_OPS()
 #undef ATOMIC_OPS
 #undef ATOMIC_OP
 
-#endif /* ASM__RISCV__ATOMIC_H */
+#endif /* RISCV_ATOMIC_H */
 
 /*
  * Local variables:
diff --git a/xen/arch/riscv/include/asm/bitops.h b/xen/arch/riscv/include/asm/bitops.h
index 72a4a8c155d6..471eb07bd287 100644
--- a/xen/arch/riscv/include/asm/bitops.h
+++ b/xen/arch/riscv/include/asm/bitops.h
@@ -1,8 +1,8 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 /* Copyright (C) 2012 Regents of the University of California */
 
-#ifndef ASM__RISCV__BITOPS_H
-#define ASM__RISCV__BITOPS_H
+#ifndef RISCV_BITOPS_H
+#define RISCV_BITOPS_H
 
 #include <asm/system.h>
 
@@ -132,7 +132,7 @@ static inline void clear_bit(int nr, volatile void *p)
 
 #define arch_hweightl(x) __builtin_popcountl(x)
 
-#endif /* ASM__RISCV__BITOPS_H */
+#endif /* RISCV_BITOPS_H */
 
 /*
  * Local variables:
diff --git a/xen/arch/riscv/include/asm/bug.h b/xen/arch/riscv/include/asm/bug.h
index c2cdc2dc2a46..8834dcea8197 100644
--- a/xen/arch/riscv/include/asm/bug.h
+++ b/xen/arch/riscv/include/asm/bug.h
@@ -4,8 +4,8 @@
  * Copyright (C) 2021-2023 Vates
  *
  */
-#ifndef ASM__RISCV__BUG_H
-#define ASM__RISCV__BUG_H
+#ifndef RISCV_BUG_H
+#define RISCV_BUG_H
 
 #ifndef __ASSEMBLER__
 
@@ -15,4 +15,4 @@
 
 #endif /* !__ASSEMBLER__ */
 
-#endif /* ASM__RISCV__BUG_H */
+#endif /* RISCV_BUG_H */
diff --git a/xen/arch/riscv/include/asm/cache.h b/xen/arch/riscv/include/asm/cache.h
index d4cf1ac8e2cd..6b8dff48b76f 100644
--- a/xen/arch/riscv/include/asm/cache.h
+++ b/xen/arch/riscv/include/asm/cache.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 
-#ifndef ASM__RISCV__CACHE_H
-#define ASM__RISCV__CACHE_H
+#ifndef RISCV_CACHE_H
+#define RISCV_CACHE_H
 
-#endif /* ASM__RISCV__CACHE_H */
+#endif /* RISCV_CACHE_H */
diff --git a/xen/arch/riscv/include/asm/cmpxchg.h b/xen/arch/riscv/include/asm/cmpxchg.h
index d47ebaffcef0..12268d0babd9 100644
--- a/xen/arch/riscv/include/asm/cmpxchg.h
+++ b/xen/arch/riscv/include/asm/cmpxchg.h
@@ -1,8 +1,8 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 /* Copyright (C) 2014 Regents of the University of California */
 
-#ifndef ASM__RISCV__CMPXCHG_H
-#define ASM__RISCV__CMPXCHG_H
+#ifndef RISCV_CMPXCHG_H
+#define RISCV_CMPXCHG_H
 
 #include <xen/bitops.h>
 #include <xen/compiler.h>
@@ -230,7 +230,7 @@ static always_inline unsigned long __cmpxchg(volatile void *ptr,
               sizeof(*(ptr))); \
 })
 
-#endif /* ASM__RISCV__CMPXCHG_H */
+#endif /* RISCV_CMPXCHG_H */
 
 /*
  * Local variables:
diff --git a/xen/arch/riscv/include/asm/config.h b/xen/arch/riscv/include/asm/config.h
index fd69057826e1..8d43ee76da5f 100644
--- a/xen/arch/riscv/include/asm/config.h
+++ b/xen/arch/riscv/include/asm/config.h
@@ -1,7 +1,7 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 
-#ifndef ASM__RISCV__CONFIG_H
-#define ASM__RISCV__CONFIG_H
+#ifndef RISCV_CONFIG_H
+#define RISCV_CONFIG_H
 
 #include <xen/const.h>
 #include <xen/page-size.h>
@@ -164,7 +164,7 @@ extern unsigned long phys_offset; /* = load_start - XEN_VIRT_START */
 #error "Define KERNEL_LOAD_ADDR_ALIGNMENT"
 #endif
 
-#endif /* ASM__RISCV__CONFIG_H */
+#endif /* RISCV_CONFIG_H */
 /*
  * Local variables:
  * mode: C
diff --git a/xen/arch/riscv/include/asm/cpufeature.h b/xen/arch/riscv/include/asm/cpufeature.h
index b0a23be18e6f..d42189e8ebe7 100644
--- a/xen/arch/riscv/include/asm/cpufeature.h
+++ b/xen/arch/riscv/include/asm/cpufeature.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
-#ifndef ASM__RISCV__CPUFEATURE_H
-#define ASM__RISCV__CPUFEATURE_H
+#ifndef RISCV_CPUFEATURE_H
+#define RISCV_CPUFEATURE_H
 
 #ifndef __ASSEMBLER__
 
@@ -57,7 +57,7 @@ bool riscv_isa_extension_available(const unsigned long *isa_bitmap,
 
 #endif /* __ASSEMBLER__ */
 
-#endif /* ASM__RISCV__CPUFEATURE_H */
+#endif /* RISCV_CPUFEATURE_H */
 
 /*
  * Local variables:
diff --git a/xen/arch/riscv/include/asm/csr.h b/xen/arch/riscv/include/asm/csr.h
index 888d6a2a86d6..a805f7ed0ba1 100644
--- a/xen/arch/riscv/include/asm/csr.h
+++ b/xen/arch/riscv/include/asm/csr.h
@@ -3,8 +3,8 @@
  * Copyright (C) 2015 Regents of the University of California
  */
 
-#ifndef ASM__RISCV__CSR_H
-#define ASM__RISCV__CSR_H
+#ifndef RISCV_CSR_H
+#define RISCV_CSR_H
 
 #include <xen/const.h>
 
@@ -128,4 +128,4 @@ static always_inline bool csr_read_safe(unsigned long csr,
 
 #endif /* __ASSEMBLER__ */
 
-#endif /* ASM__RISCV__CSR_H */
+#endif /* RISCV_CSR_H */
diff --git a/xen/arch/riscv/include/asm/current.h b/xen/arch/riscv/include/asm/current.h
index 78ec52fd8a35..06683d7ae060 100644
--- a/xen/arch/riscv/include/asm/current.h
+++ b/xen/arch/riscv/include/asm/current.h
@@ -1,7 +1,7 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 
-#ifndef ASM__RISCV__CURRENT_H
-#define ASM__RISCV__CURRENT_H
+#ifndef RISCV_CURRENT_H
+#define RISCV_CURRENT_H
 
 #include <xen/bug.h>
 #include <xen/cache.h>
@@ -62,4 +62,4 @@ DECLARE_PER_CPU(struct vcpu *, curr_vcpu);
 
 #endif /* __ASSEMBLER__ */
 
-#endif /* ASM__RISCV__CURRENT_H */
+#endif /* RISCV_CURRENT_H */
diff --git a/xen/arch/riscv/include/asm/domain.h b/xen/arch/riscv/include/asm/domain.h
index e035b33ddfdc..98e5e72e58ba 100644
--- a/xen/arch/riscv/include/asm/domain.h
+++ b/xen/arch/riscv/include/asm/domain.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
-#ifndef ASM__RISCV__DOMAIN_H
-#define ASM__RISCV__DOMAIN_H
+#ifndef RISCV_DOMAIN_H
+#define RISCV_DOMAIN_H
 
 #include <xen/mm.h>
 #include <xen/spinlock.h>
@@ -128,7 +128,7 @@ int vcpu_unset_interrupt(struct vcpu *v, unsigned int irq);
 void vcpu_sync_interrupts(struct vcpu *curr);
 void vcpu_flush_interrupts(struct vcpu *curr);
 
-#endif /* ASM__RISCV__DOMAIN_H */
+#endif /* RISCV_DOMAIN_H */
 
 /*
  * Local variables:
diff --git a/xen/arch/riscv/include/asm/early_printk.h b/xen/arch/riscv/include/asm/early_printk.h
index 2750045bdd80..240b7f539a04 100644
--- a/xen/arch/riscv/include/asm/early_printk.h
+++ b/xen/arch/riscv/include/asm/early_printk.h
@@ -1,7 +1,7 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 
-#ifndef ASM__RISCV__EARLY_PRINTK_H
-#define ASM__RISCV__EARLY_PRINTK_H
+#ifndef RISCV_EARLY_PRINTK_H
+#define RISCV_EARLY_PRINTK_H
 
 #include <xen/early_printk.h>
 
@@ -11,4 +11,4 @@ void early_printk(const char *str);
 static inline void early_printk(const char *s) {};
 #endif
 
-#endif /* ASM__RISCV__EARLY_PRINTK_H */
+#endif /* RISCV_EARLY_PRINTK_H */
diff --git a/xen/arch/riscv/include/asm/event.h b/xen/arch/riscv/include/asm/event.h
index 116434c665c0..a1fc0bc6fd7a 100644
--- a/xen/arch/riscv/include/asm/event.h
+++ b/xen/arch/riscv/include/asm/event.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
-#ifndef ASM__RISCV__EVENT_H
-#define ASM__RISCV__EVENT_H
+#ifndef RISCV_EVENT_H
+#define RISCV_EVENT_H
 
 #include <xen/lib.h>
 
@@ -29,7 +29,7 @@ static inline enum virq_type arch_get_virq_type(unsigned int virq)
     return VIRQ_GLOBAL;
 }
 
-#endif /* ASM__RISCV__EVENT_H */
+#endif /* RISCV_EVENT_H */
 /*
  * Local variables:
  * mode: C
diff --git a/xen/arch/riscv/include/asm/extable.h b/xen/arch/riscv/include/asm/extable.h
index c0128a91818f..0209b2f3bfa5 100644
--- a/xen/arch/riscv/include/asm/extable.h
+++ b/xen/arch/riscv/include/asm/extable.h
@@ -1,7 +1,7 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 
-#ifndef ASM__RISCV__ASM_EXTABLE_H
-#define ASM__RISCV__ASM_EXTABLE_H
+#ifndef RISCV_EXTABLE_H
+#define RISCV_EXTABLE_H
 
 #ifdef __ASSEMBLER__
 
@@ -55,4 +55,4 @@ bool fixup_exception(struct cpu_user_regs *regs);
 
 #endif /* __ASSEMBLY__ */
 
-#endif /* ASM__RISCV__ASM_EXTABLE_H */
+#endif /* RISCV_EXTABLE_H */
diff --git a/xen/arch/riscv/include/asm/fence.h b/xen/arch/riscv/include/asm/fence.h
index edfaac49cd9c..f5dd3096e5f0 100644
--- a/xen/arch/riscv/include/asm/fence.h
+++ b/xen/arch/riscv/include/asm/fence.h
@@ -1,9 +1,9 @@
 /* SPDX-License-Identifier: GPL-2.0-or-later */
-#ifndef ASM__RISCV__FENCE_H
-#define ASM__RISCV__FENCE_H
+#ifndef RISCV_FENCE_H
+#define RISCV_FENCE_H
 
 #define RISCV_ACQUIRE_BARRIER   "\tfence r , rw\n"
 #define RISCV_RELEASE_BARRIER   "\tfence rw, w\n"
 #define RISCV_FULL_BARRIER      "\tfence rw, rw\n"
 
-#endif	/* ASM__RISCV__FENCE_H */
+#endif	/* RISCV_FENCE_H */
diff --git a/xen/arch/riscv/include/asm/fixmap.h b/xen/arch/riscv/include/asm/fixmap.h
index 085d135c15d4..7e907c3d1c03 100644
--- a/xen/arch/riscv/include/asm/fixmap.h
+++ b/xen/arch/riscv/include/asm/fixmap.h
@@ -2,8 +2,8 @@
 /*
  * fixmap.h: compile-time virtual memory allocation
  */
-#ifndef ASM__RISCV__FIXMAP_H
-#define ASM__RISCV__FIXMAP_H
+#ifndef RISCV_FIXMAP_H
+#define RISCV_FIXMAP_H
 
 #include <xen/bug.h>
 #include <xen/page-size.h>
@@ -48,4 +48,4 @@ static inline unsigned int virt_to_fix(vaddr_t vaddr)
 
 #endif /* __ASSEMBLER__ */
 
-#endif /* ASM__RISCV__FIXMAP_H */
+#endif /* RISCV_FIXMAP_H */
diff --git a/xen/arch/riscv/include/asm/flushtlb.h b/xen/arch/riscv/include/asm/flushtlb.h
index b0112d416dbe..e1d17430da5f 100644
--- a/xen/arch/riscv/include/asm/flushtlb.h
+++ b/xen/arch/riscv/include/asm/flushtlb.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
-#ifndef ASM__RISCV__FLUSHTLB_H
-#define ASM__RISCV__FLUSHTLB_H
+#ifndef RISCV_FLUSHTLB_H
+#define RISCV_FLUSHTLB_H
 
 #include <xen/bug.h>
 #include <xen/cpumask.h>
@@ -53,7 +53,7 @@ static inline void arch_flush_tlb_mask(const cpumask_t *mask)
     sbi_remote_hfence_gvma(mask, 0, 0);
 }
 
-#endif /* ASM__RISCV__FLUSHTLB_H */
+#endif /* RISCV_FLUSHTLB_H */
 
 /*
  * Local variables:
diff --git a/xen/arch/riscv/include/asm/guest-layout.h b/xen/arch/riscv/include/asm/guest-layout.h
index ceed9125e7e2..52d1f2e108ea 100644
--- a/xen/arch/riscv/include/asm/guest-layout.h
+++ b/xen/arch/riscv/include/asm/guest-layout.h
@@ -1,5 +1,5 @@
-#ifndef ASM_RISCV_GUEST_LAYOUT_H
-#define ASM_RISCV_GUEST_LAYOUT_H
+#ifndef RISCV_GUEST_LAYOUT_H
+#define RISCV_GUEST_LAYOUT_H
 
 #include <public/xen.h>
 
@@ -44,4 +44,4 @@
 #define GUEST_MAGIC_BASE  _UL(0x79000000)
 #define GUEST_MAGIC_SIZE  _UL(0x00200000)
 
-#endif /* ASM_RISCV_GUEST_LAYOUT_H */
+#endif /* RISCV_GUEST_LAYOUT_H */
diff --git a/xen/arch/riscv/include/asm/guest_access.h b/xen/arch/riscv/include/asm/guest_access.h
index 8d679319ded0..e94aa838a3e7 100644
--- a/xen/arch/riscv/include/asm/guest_access.h
+++ b/xen/arch/riscv/include/asm/guest_access.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
-#ifndef ASM__RISCV__GUEST_ACCESS_H
-#define ASM__RISCV__GUEST_ACCESS_H
+#ifndef RISCV_GUEST_ACCESS_H
+#define RISCV_GUEST_ACCESS_H
 
 #include <xen/types.h>
 
@@ -25,7 +25,7 @@ unsigned long raw_clear_guest(void *to, unsigned int len);
 unsigned long copy_to_guest_phys(struct domain *d, paddr_t gpa, void *buf,
                                  unsigned long len);
 
-#endif /* ASM__RISCV__GUEST_ACCESS_H */
+#endif /* RISCV_GUEST_ACCESS_H */
 /*
  * Local variables:
  * mode: C
diff --git a/xen/arch/riscv/include/asm/guest_atomics.h b/xen/arch/riscv/include/asm/guest_atomics.h
index 22a7551804f9..1909e667214b 100644
--- a/xen/arch/riscv/include/asm/guest_atomics.h
+++ b/xen/arch/riscv/include/asm/guest_atomics.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
-#ifndef ASM__RISCV__GUEST_ATOMICS_H
-#define ASM__RISCV__GUEST_ATOMICS_H
+#ifndef RISCV_GUEST_ATOMICS_H
+#define RISCV_GUEST_ATOMICS_H
 
 #include <xen/bug.h>
 
@@ -32,7 +32,7 @@ guest_testop(test_and_change_bit)
 
 #define guest_test_bit(d, nr, p) ((void)(d), test_bit(nr, p))
 
-#endif /* ASM__RISCV__GUEST_ATOMICS_H */
+#endif /* RISCV_GUEST_ATOMICS_H */
 
 /*
  * Local variables:
diff --git a/xen/arch/riscv/include/asm/imsic.h b/xen/arch/riscv/include/asm/imsic.h
index 2425430ed116..639ee327dc67 100644
--- a/xen/arch/riscv/include/asm/imsic.h
+++ b/xen/arch/riscv/include/asm/imsic.h
@@ -8,8 +8,8 @@
  * (c) Microchip Technology Inc.
  */
 
-#ifndef ASM_RISCV_IMSIC_H
-#define ASM_RISCV_IMSIC_H
+#ifndef RISCV_IMSIC_H
+#define RISCV_IMSIC_H
 
 #include <xen/rwlock.h>
 #include <xen/spinlock.h>
@@ -96,4 +96,4 @@ unsigned int vcpu_guest_file_id(const struct vcpu *v);
 
 int vimsic_make_domu_dt_node(struct kernel_info *kinfo, unsigned int *phandle);
 
-#endif /* ASM_RISCV_IMSIC_H */
+#endif /* RISCV_IMSIC_H */
diff --git a/xen/arch/riscv/include/asm/insn-defs.h b/xen/arch/riscv/include/asm/insn-defs.h
index 61aaa202fd13..1bcdbfde3fc7 100644
--- a/xen/arch/riscv/include/asm/insn-defs.h
+++ b/xen/arch/riscv/include/asm/insn-defs.h
@@ -1,10 +1,10 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 
-#ifndef ASM_RISCV_INSN_DEFS_H
-#define ASM_RISCV_INSN_DEFS_H
+#ifndef RISCV_INSN_DEFS_H
+#define RISCV_INSN_DEFS_H
 
 #define HFENCE_VVMA(vaddr, asid) \
     asm volatile ( "hfence.vvma %z0, %z1" \
                   :: "rJ" (vaddr), "rJ" (asid) : "memory" )
 
-#endif /* ASM_RISCV_INSN_DEFS_H */
+#endif /* RISCV_INSN_DEFS_H */
diff --git a/xen/arch/riscv/include/asm/intc.h b/xen/arch/riscv/include/asm/intc.h
index 1bfba7c6155b..909317335769 100644
--- a/xen/arch/riscv/include/asm/intc.h
+++ b/xen/arch/riscv/include/asm/intc.h
@@ -5,8 +5,8 @@
  * (c) 2024 Vates
  */
 
-#ifndef ASM__RISCV__INTERRUPT_CONTOLLER_H
-#define ASM__RISCV__INTERRUPT_CONTOLLER_H
+#ifndef RISCV_INTC_H
+#define RISCV_INTC_H
 
 struct dt_device_node;
 
@@ -91,4 +91,4 @@ void domain_vintc_deinit(struct domain *d);
 
 int vintc_reserve_virq(const struct domain *d, unsigned int virq);
 
-#endif /* ASM__RISCV__INTERRUPT_CONTOLLER_H */
+#endif /* RISCV_INTC_H */
diff --git a/xen/arch/riscv/include/asm/io.h b/xen/arch/riscv/include/asm/io.h
index 9aeafd6b3b1f..547c144b983a 100644
--- a/xen/arch/riscv/include/asm/io.h
+++ b/xen/arch/riscv/include/asm/io.h
@@ -35,8 +35,8 @@
  * Copyright (C) 2024 Vates
  */
 
-#ifndef ASM__RISCV__IO_H
-#define ASM__RISCV__IO_H
+#ifndef RISCV_IO_H
+#define RISCV_IO_H
 
 #include <xen/macros.h>
 #include <xen/types.h>
@@ -151,7 +151,7 @@ static inline uint64_t __raw_readq(const volatile void __iomem *addr)
 #define writel(v, c)    ({ __io_bw(); writel_cpu(v, c); __io_aw(); })
 #define writeq(v, c)    ({ __io_bw(); writeq_cpu(v, c); __io_aw(); })
 
-#endif /* ASM__RISCV__IO_H */
+#endif /* RISCV_IO_H */
 
 /*
  * Local variables:
diff --git a/xen/arch/riscv/include/asm/irq.h b/xen/arch/riscv/include/asm/irq.h
index 57e814d90cf4..2eb68a5baf04 100644
--- a/xen/arch/riscv/include/asm/irq.h
+++ b/xen/arch/riscv/include/asm/irq.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
-#ifndef ASM__RISCV__IRQ_H
-#define ASM__RISCV__IRQ_H
+#ifndef RISCV_IRQ_H
+#define RISCV_IRQ_H
 
 #include <xen/bug.h>
 #include <xen/device_tree.h>
@@ -57,7 +57,7 @@ int route_irq_to_guest(struct domain *d, unsigned int virq,
 
 int release_guest_irq(const struct domain *d, unsigned int virq);
 
-#endif /* ASM__RISCV__IRQ_H */
+#endif /* RISCV_IRQ_H */
 
 /*
  * Local variables:
diff --git a/xen/arch/riscv/include/asm/mm-types.h b/xen/arch/riscv/include/asm/mm-types.h
index fa512064b808..a04e8f8b179d 100644
--- a/xen/arch/riscv/include/asm/mm-types.h
+++ b/xen/arch/riscv/include/asm/mm-types.h
@@ -1,8 +1,8 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 
-#ifndef ASM_RISCV_MM_TYPES_H
-#define ASM_RISCV_MM_TYPES_H
+#ifndef RISCV_MM_TYPES_H
+#define RISCV_MM_TYPES_H
 
 typedef unsigned long pte_attr_t;
 
-#endif /* ASM_RISCV_MM_TYPES_H */
+#endif /* RISCV_MM_TYPES_H */
diff --git a/xen/arch/riscv/include/asm/mm.h b/xen/arch/riscv/include/asm/mm.h
index 1ac66283ec9b..bb7c96e7d2a1 100644
--- a/xen/arch/riscv/include/asm/mm.h
+++ b/xen/arch/riscv/include/asm/mm.h
@@ -1,7 +1,7 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 
-#ifndef ASM__RISCV__MM_H
-#define ASM__RISCV__MM_H
+#ifndef RISCV_MM_H
+#define RISCV_MM_H
 
 #include <public/xen.h>
 #include <xen/bug.h>
@@ -349,4 +349,4 @@ void setup_fixmap_mappings(void);
 
 void *early_fdt_map(paddr_t fdt_paddr);
 
-#endif /* ASM__RISCV__MM_H */
+#endif /* RISCV_MM_H */
diff --git a/xen/arch/riscv/include/asm/monitor.h b/xen/arch/riscv/include/asm/monitor.h
index fb3d3e8e3ac6..54e08cab8b8f 100644
--- a/xen/arch/riscv/include/asm/monitor.h
+++ b/xen/arch/riscv/include/asm/monitor.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
-#ifndef ASM__RISCV__MONITOR_H
-#define ASM__RISCV__MONITOR_H
+#ifndef RISCV_MONITOR_H
+#define RISCV_MONITOR_H
 
 #include <xen/bug.h>
 
@@ -14,7 +14,7 @@ static inline uint32_t arch_monitor_get_capabilities(struct domain *d)
     return 0;
 }
 
-#endif /* ASM__RISCV__MONITOR_H */
+#endif /* RISCV_MONITOR_H */
 
 /*
  * Local variables:
diff --git a/xen/arch/riscv/include/asm/nospec.h b/xen/arch/riscv/include/asm/nospec.h
index f9b0241c98f3..c969a9898ffd 100644
--- a/xen/arch/riscv/include/asm/nospec.h
+++ b/xen/arch/riscv/include/asm/nospec.h
@@ -1,8 +1,8 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 /* Copyright (C) 2024 Vates */
 
-#ifndef ASM__RISCV__NOSPEC_H
-#define ASM__RISCV__NOSPEC_H
+#ifndef RISCV_NOSPEC_H
+#define RISCV_NOSPEC_H
 
 static inline bool evaluate_nospec(bool condition)
 {
@@ -13,7 +13,7 @@ static inline void block_speculation(void)
 {
 }
 
-#endif /* ASM__RISCV__NOSPEC_H */
+#endif /* RISCV_NOSPEC_H */
 
 /*
  * Local variables:
diff --git a/xen/arch/riscv/include/asm/p2m.h b/xen/arch/riscv/include/asm/p2m.h
index 0d1dace1a0d8..c0538281517f 100644
--- a/xen/arch/riscv/include/asm/p2m.h
+++ b/xen/arch/riscv/include/asm/p2m.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
-#ifndef ASM__RISCV__P2M_H
-#define ASM__RISCV__P2M_H
+#ifndef RISCV_P2M_H
+#define RISCV_P2M_H
 
 #include <xen/bitops.h>
 #include <xen/errno.h>
@@ -264,7 +264,7 @@ void p2m_ctxt_switch_from(struct vcpu *p);
 void p2m_ctxt_switch_to(struct vcpu *n);
 void p2m_handle_vmenter(void);
 
-#endif /* ASM__RISCV__P2M_H */
+#endif /* RISCV_P2M_H */
 
 /*
  * Local variables:
diff --git a/xen/arch/riscv/include/asm/page-bits.h b/xen/arch/riscv/include/asm/page-bits.h
index 788c7d951811..73b9f6378c2c 100644
--- a/xen/arch/riscv/include/asm/page-bits.h
+++ b/xen/arch/riscv/include/asm/page-bits.h
@@ -1,7 +1,7 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 
-#ifndef ASM__RISCV__PAGE_BITS_H
-#define ASM__RISCV__PAGE_BITS_H
+#ifndef RISCV_PAGE_BITS_H
+#define RISCV_PAGE_BITS_H
 
 #define PAGE_SHIFT              12 /* 4 KiB Pages */
 #define PADDR_BITS              56 /* 44-bit PPN */
@@ -16,4 +16,4 @@
 
 #define PTE_PPN_SHIFT           10
 
-#endif /* ASM__RISCV__PAGE_BITS_H */
+#endif /* RISCV_PAGE_BITS_H */
diff --git a/xen/arch/riscv/include/asm/page.h b/xen/arch/riscv/include/asm/page.h
index f9e59e61de30..7a2ac2be4df1 100644
--- a/xen/arch/riscv/include/asm/page.h
+++ b/xen/arch/riscv/include/asm/page.h
@@ -1,7 +1,7 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 
-#ifndef ASM__RISCV__PAGE_H
-#define ASM__RISCV__PAGE_H
+#ifndef RISCV_PAGE_H
+#define RISCV_PAGE_H
 
 #ifndef __ASSEMBLER__
 
@@ -253,4 +253,4 @@ pte_t pt_walk(vaddr_t va, unsigned int *pte_level);
 
 #endif /* __ASSEMBLER__ */
 
-#endif /* ASM__RISCV__PAGE_H */
+#endif /* RISCV_PAGE_H */
diff --git a/xen/arch/riscv/include/asm/paging.h b/xen/arch/riscv/include/asm/paging.h
index 103384723dc5..4f667aa0e749 100644
--- a/xen/arch/riscv/include/asm/paging.h
+++ b/xen/arch/riscv/include/asm/paging.h
@@ -1,5 +1,5 @@
-#ifndef ASM_RISCV_PAGING_H
-#define ASM_RISCV_PAGING_H
+#ifndef RISCV_PAGING_H
+#define RISCV_PAGING_H
 
 #include <asm-generic/paging.h>
 
@@ -18,4 +18,4 @@ void paging_free_page(struct domain *d, struct page_info *pg);
 
 struct page_info *paging_alloc_page(struct domain *d);
 
-#endif /* ASM_RISCV_PAGING_H */
+#endif /* RISCV_PAGING_H */
diff --git a/xen/arch/riscv/include/asm/pmap.h b/xen/arch/riscv/include/asm/pmap.h
index 146dd29f958a..842c40ab6a94 100644
--- a/xen/arch/riscv/include/asm/pmap.h
+++ b/xen/arch/riscv/include/asm/pmap.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0 */
-#ifndef ASM__RISCV__PMAP_H
-#define ASM__RISCV__PMAP_H
+#ifndef RISCV_PMAP_H
+#define RISCV_PMAP_H
 
 #include <xen/bug.h>
 #include <xen/init.h>
@@ -33,4 +33,4 @@ static inline void __init arch_pmap_unmap(unsigned int slot)
     flush_tlb_one_local(FIXMAP_ADDR(slot));
 }
 
-#endif /* ASM__RISCV__PMAP_H */
+#endif /* RISCV_PMAP_H */
diff --git a/xen/arch/riscv/include/asm/processor.h b/xen/arch/riscv/include/asm/processor.h
index b1745c107100..007c22d2e611 100644
--- a/xen/arch/riscv/include/asm/processor.h
+++ b/xen/arch/riscv/include/asm/processor.h
@@ -7,8 +7,8 @@
  *
  */
 
-#ifndef ASM__RISCV__PROCESSOR_H
-#define ASM__RISCV__PROCESSOR_H
+#ifndef RISCV_PROCESSOR_H
+#define RISCV_PROCESSOR_H
 
 #ifndef __ASSEMBLER__
 
@@ -94,7 +94,7 @@ static inline void sfence_vma(void)
 
 #endif /* __ASSEMBLER__ */
 
-#endif /* ASM__RISCV__PROCESSOR_H */
+#endif /* RISCV_PROCESSOR_H */
 
 /*
  * Local variables:
diff --git a/xen/arch/riscv/include/asm/regs.h b/xen/arch/riscv/include/asm/regs.h
index 531958f3d748..24674d37cfe4 100644
--- a/xen/arch/riscv/include/asm/regs.h
+++ b/xen/arch/riscv/include/asm/regs.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
-#ifndef ASM__RISCV__REGS_H
-#define ASM__RISCV__REGS_H
+#ifndef RISCV_REGS_H
+#define RISCV_REGS_H
 
 #ifndef __ASSEMBLER__
 
@@ -17,7 +17,7 @@ static inline bool guest_mode(const struct cpu_user_regs *r)
 
 #endif /* __ASSEMBLER__ */
 
-#endif /* ASM__RISCV__REGS_H */
+#endif /* RISCV_REGS_H */
 
 /*
  * Local variables:
diff --git a/xen/arch/riscv/include/asm/riscv_encoding.h b/xen/arch/riscv/include/asm/riscv_encoding.h
index 647268e6d0d4..e55be8c1757a 100644
--- a/xen/arch/riscv/include/asm/riscv_encoding.h
+++ b/xen/arch/riscv/include/asm/riscv_encoding.h
@@ -6,8 +6,8 @@
  *   Anup Patel <anup.patel@wdc.com>
  */
 
-#ifndef ASM__RISCV__RISCV_ENCODING_H
-#define ASM__RISCV__RISCV_ENCODING_H
+#ifndef RISCV_ENCODING_H
+#define RISCV_ENCODING_H
 
 #define _UL(X) _AC(X, UL)
 #define _ULL(X) _AC(X, ULL)
diff --git a/xen/arch/riscv/include/asm/sbi.h b/xen/arch/riscv/include/asm/sbi.h
index 1952868e963c..2a245d0b4206 100644
--- a/xen/arch/riscv/include/asm/sbi.h
+++ b/xen/arch/riscv/include/asm/sbi.h
@@ -9,8 +9,8 @@
  * Copyright (c) 2019 Western Digital Corporation or its affiliates.
  */
 
-#ifndef ASM__RISCV__SBI_H
-#define ASM__RISCV__SBI_H
+#ifndef RISCV_SBI_H
+#define RISCV_SBI_H
 
 #include <xen/cpumask.h>
 
@@ -145,4 +145,4 @@ int sbi_remote_hfence_gvma_vmid(const cpumask_t *cpu_mask, vaddr_t start,
  */
 int sbi_init(void);
 
-#endif /* ASM__RISCV__SBI_H */
+#endif /* RISCV_SBI_H */
diff --git a/xen/arch/riscv/include/asm/setup.h b/xen/arch/riscv/include/asm/setup.h
index 73ce2f293348..8eee8a746335 100644
--- a/xen/arch/riscv/include/asm/setup.h
+++ b/xen/arch/riscv/include/asm/setup.h
@@ -1,7 +1,7 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 
-#ifndef ASM__RISCV__SETUP_H
-#define ASM__RISCV__SETUP_H
+#ifndef RISCV_SETUP_H
+#define RISCV_SETUP_H
 
 #include <xen/types.h>
 
@@ -11,7 +11,7 @@ void copy_from_paddr(void *dst, paddr_t paddr, unsigned long len);
 
 void init_csr_masks(void);
 
-#endif /* ASM__RISCV__SETUP_H */
+#endif /* RISCV_SETUP_H */
 
 /*
  * Local variables:
diff --git a/xen/arch/riscv/include/asm/smp.h b/xen/arch/riscv/include/asm/smp.h
index 5dbacf1f9d2d..78f67b917195 100644
--- a/xen/arch/riscv/include/asm/smp.h
+++ b/xen/arch/riscv/include/asm/smp.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
-#ifndef ASM__RISCV__SMP_H
-#define ASM__RISCV__SMP_H
+#ifndef RISCV_SMP_H
+#define RISCV_SMP_H
 
 #include <xen/cpumask.h>
 #include <xen/macros.h>
diff --git a/xen/arch/riscv/include/asm/spinlock.h b/xen/arch/riscv/include/asm/spinlock.h
index 4a607eba520d..1b43ed06365e 100644
--- a/xen/arch/riscv/include/asm/spinlock.h
+++ b/xen/arch/riscv/include/asm/spinlock.h
@@ -1,5 +1,5 @@
-#ifndef ASM__RISCV__SPINLOCK_H
-#define ASM__RISCV__SPINLOCK_H
+#ifndef RISCV_SPINLOCK_H
+#define RISCV_SPINLOCK_H
 
 #define arch_lock_acquire_barrier() smp_mb()
 #define arch_lock_release_barrier() smp_mb()
@@ -12,4 +12,4 @@
     arch_lock_signal();             \
 })
 
-#endif /* ASM__RISCV__SPINLOCK_H */
+#endif /* RISCV_SPINLOCK_H */
diff --git a/xen/arch/riscv/include/asm/string.h b/xen/arch/riscv/include/asm/string.h
index a20af81f677d..8dde5c48807b 100644
--- a/xen/arch/riscv/include/asm/string.h
+++ b/xen/arch/riscv/include/asm/string.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 
-#ifndef ASM__RISCV__STRING_H
-#define ASM__RISCV__STRING_H
+#ifndef RISCV_STRING_H
+#define RISCV_STRING_H
 
-#endif /* ASM__RISCV__STRING_H */
+#endif /* RISCV_STRING_H */
diff --git a/xen/arch/riscv/include/asm/system.h b/xen/arch/riscv/include/asm/system.h
index f33af64fd2ec..cb382487751c 100644
--- a/xen/arch/riscv/include/asm/system.h
+++ b/xen/arch/riscv/include/asm/system.h
@@ -1,7 +1,7 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 
-#ifndef ASM__RISCV__SYSTEM_H
-#define ASM__RISCV__SYSTEM_H
+#ifndef RISCV_SYSTEM_H
+#define RISCV_SYSTEM_H
 
 #include <xen/stdbool.h>
 
@@ -78,7 +78,7 @@ static inline bool local_irq_is_enabled(void)
 
 #endif /* __ASSEMBLER__ */
 
-#endif /* ASM__RISCV__SYSTEM_H */
+#endif /* RISCV_SYSTEM_H */
 
 /*
  * Local variables:
diff --git a/xen/arch/riscv/include/asm/time.h b/xen/arch/riscv/include/asm/time.h
index 4d68900151a7..0e5b96a8631c 100644
--- a/xen/arch/riscv/include/asm/time.h
+++ b/xen/arch/riscv/include/asm/time.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
-#ifndef ASM__RISCV__TIME_H
-#define ASM__RISCV__TIME_H
+#ifndef RISCV_TIME_H
+#define RISCV_TIME_H
 
 #include <xen/bug.h>
 #include <xen/muldiv64.h>
@@ -29,7 +29,7 @@ void preinit_xen_time(void);
 
 extern int (* __ro_after_init set_xen_timer)(uint64_t deadline);
 
-#endif /* ASM__RISCV__TIME_H */
+#endif /* RISCV_TIME_H */
 
 /*
  * Local variables:
diff --git a/xen/arch/riscv/include/asm/traps.h b/xen/arch/riscv/include/asm/traps.h
index 21fa3c3259b3..08c6215e931a 100644
--- a/xen/arch/riscv/include/asm/traps.h
+++ b/xen/arch/riscv/include/asm/traps.h
@@ -1,7 +1,7 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 
-#ifndef ASM__RISCV__TRAPS_H
-#define ASM__RISCV__TRAPS_H
+#ifndef RISCV_TRAPS_H
+#define RISCV_TRAPS_H
 
 #include <asm/processor.h>
 
@@ -13,4 +13,4 @@ void trap_init(void);
 
 #endif /* __ASSEMBLER__ */
 
-#endif /* ASM__RISCV__TRAPS_H */
+#endif /* RISCV_TRAPS_H */
diff --git a/xen/arch/riscv/include/asm/types.h b/xen/arch/riscv/include/asm/types.h
index d801596a2013..b0d4c62aef36 100644
--- a/xen/arch/riscv/include/asm/types.h
+++ b/xen/arch/riscv/include/asm/types.h
@@ -1,7 +1,7 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 
-#ifndef ASM__RISCV__TYPES_H
-#define ASM__RISCV__TYPES_H
+#ifndef RISCV_TYPES_H
+#define RISCV_TYPES_H
 
 #if defined(CONFIG_RISCV_32)
 
@@ -25,7 +25,7 @@ typedef u64 register_t;
 
 #endif
 
-#endif /* ASM__RISCV__TYPES_H */
+#endif /* RISCV_TYPES_H */
 /*
  * Local variables:
  * mode: C
diff --git a/xen/arch/riscv/include/asm/vaplic.h b/xen/arch/riscv/include/asm/vaplic.h
index 96080bfbc23b..dcbe0d59a886 100644
--- a/xen/arch/riscv/include/asm/vaplic.h
+++ b/xen/arch/riscv/include/asm/vaplic.h
@@ -7,8 +7,8 @@
  * Copyright (c) Microchip.
  */
 
-#ifndef ASM__RISCV__VAPLIC_H
-#define ASM__RISCV__VAPLIC_H
+#ifndef RISCV_VAPLIC_H
+#define RISCV_VAPLIC_H
 
 #include <xen/kernel.h>
 #include <xen/types.h>
@@ -31,4 +31,4 @@ struct vaplic {
 int domain_vaplic_init(struct domain *d);
 void domain_vaplic_deinit(struct domain *d);
 
-#endif /* ASM__RISCV__VAPLIC_H */
+#endif /* RISCV_VAPLIC_H */
diff --git a/xen/arch/riscv/include/asm/vmid.h b/xen/arch/riscv/include/asm/vmid.h
index 1c500c4aff70..2b4fc0df8e63 100644
--- a/xen/arch/riscv/include/asm/vmid.h
+++ b/xen/arch/riscv/include/asm/vmid.h
@@ -1,7 +1,7 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 
-#ifndef ASM_RISCV_VMID_H
-#define ASM_RISCV_VMID_H
+#ifndef RISCV_VMID_H
+#define RISCV_VMID_H
 
 struct vcpu;
 struct vcpu_vmid;
@@ -11,4 +11,4 @@ bool vmid_handle_vmenter(struct vcpu_vmid *vmid);
 void vmid_flush_vcpu(struct vcpu *v);
 void vmid_flush_hart(void);
 
-#endif /* ASM_RISCV_VMID_H */
+#endif /* RISCV_VMID_H */
diff --git a/xen/arch/riscv/include/asm/vsbi.h b/xen/arch/riscv/include/asm/vsbi.h
index fa0cad604e8b..c5902fa0728d 100644
--- a/xen/arch/riscv/include/asm/vsbi.h
+++ b/xen/arch/riscv/include/asm/vsbi.h
@@ -1,7 +1,7 @@
 /* SPDX-License-Identifier:  GPL-2.0-only */
 
-#ifndef ASM_RISCV_VSBI_H
-#define ASM_RISCV_VSBI_H
+#ifndef RISCV_VSBI_H
+#define RISCV_VSBI_H
 
 struct cpu_user_regs;
 
diff --git a/xen/arch/riscv/include/asm/vtimer.h b/xen/arch/riscv/include/asm/vtimer.h
index b4d48d1a1732..950795be12f3 100644
--- a/xen/arch/riscv/include/asm/vtimer.h
+++ b/xen/arch/riscv/include/asm/vtimer.h
@@ -1,7 +1,7 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 
-#ifndef ASM__RISCV__VTIMER_H
-#define ASM__RISCV__VTIMER_H
+#ifndef RISCV_VTIMER_H
+#define RISCV_VTIMER_H
 
 #include <xen/timer.h>
 
@@ -17,4 +17,4 @@ void vtimer_set_timer(struct vtimer *t, uint64_t ticks);
 void vtimer_ctxt_switch_from(struct vcpu *p);
 void vtimer_ctxt_switch_to(struct vcpu *n);
 
-#endif /* ASM__RISCV__VTIMER_H */
+#endif /* RISCV_VTIMER_H */

base-commit: 2043d22b7e926f508cc23391b4c75325fa7211e9
-- 
2.56.0


