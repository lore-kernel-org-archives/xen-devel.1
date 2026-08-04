Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3982FC55ABF
	for <xen-devel@archiver.kernel.org>; Tue,  4 Aug 2026 15:48:39 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1382262.1625614 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrHNP-0006xa-Mz; Tue, 04 Aug 2026 15:48:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1382262.1625614; Tue, 04 Aug 2026 15:48:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrHNP-0006x3-GR; Tue, 04 Aug 2026 15:48:23 +0000
Received: by outflank-mailman (input) for mailman id 1382262;
 Tue, 04 Aug 2026 15:48:23 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wrHNO-0006uJ-Sj
 for xen-devel@lists.xenproject.org; Tue, 04 Aug 2026 15:48:22 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wrHNO-009Gcw-9m
 for xen-devel@lists.xenproject.org; Tue, 04 Aug 2026 17:48:22 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a7209c5-bab6-0a2a0a5309dd-0a2a4509cbee-2
 for <xen-devel@lists.xenproject.org>; Tue, 04 Aug 2026 17:48:22 +0200
Received: from [209.85.128.43] (helo=mail-wm1-f43.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a7209c6-be1a-0a2a45090019-d155802ba947-3
 for <xen-devel@lists.xenproject.org>; Tue, 04 Aug 2026 17:48:22 +0200
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-4954a9e8490so6653095e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 04 Aug 2026 08:48:22 -0700 (PDT)
Received: from fedora (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49949fcb46esm116430355e9.5.2026.08.04.08.48.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Aug 2026 08:48:21 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1785858502; x=1786463302; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eQRAf5Du6pYWboeiDXqOeIZI6NQJ2iFJlkGQQHsxk/w=;
        b=M4Hnq68nWPuVsC7lwgbAoKk1HmzP+ekLiazSJ9amNCGZrUyd5PPFNyX4ZACZhyInPB
         +FPOcowBJDZvRU6z43RqtTb8wOZXe1LM685hOsXwkbT6xY329trAZuihjeobWc6m3MKW
         y3QQYIN+8S937Xn7IVM/4lUsRywVLRPxXl7PaFtb90k3zIrs2eqS2MCghJKQZtfQzK3c
         sIVnSqsCnz0bqNndrHGG4sPNpli+AFMnZORD2ylnLg6jpT0QWLHZ0IOWfq7NWPceq+0t
         N7jG/aj0tUDzTPm8Y0hKHUMJAzZimT2lDxACqPjtA1z4cMgBY8VSfTZpB9UyXDo/nxHc
         JNLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785858502; x=1786463302;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eQRAf5Du6pYWboeiDXqOeIZI6NQJ2iFJlkGQQHsxk/w=;
        b=oIekdbC+hCOxA0FU1+lFisS8TfuYcEW3ikZSnXYdJmsbl9rWolqudbhAmXWGMBx3Bm
         IrR9k4U2EweMJ73p5qg1XCe4y6aWpeNibKE/GIGOQO1M/AUYh8JXnePYqwYjhVc2ZaMw
         rujDOie4q+83coloujMuHnAtOjaS8zLJJ9pCrI7qnRNsP34IQADK8G6GlIDJOHVBeRaF
         Rfgn8tw5hYfGMo61rJYbaEqOoxn3LuqOlQqA1iKBuLEnbRrgkCnlRXmSeI3Bnoebbf0O
         XCpsW4/L1mDP6Jl95qkh7O6f9Z8oACi5FiG3K0f0OsL3Xp40BQvW/2BopPzEPFt4dCVq
         kVeQ==
X-Gm-Message-State: AOJu0Yzo339f+YbOXfILuBoS12MiOE/viBqYPXB71j9zMh7aj+ky2JY6
	fN2UiHKXahhUzozcqbWnnF51XDwAl485uvoguhLk+Ywz4EQxTU8HS1VUXKrVjQ==
X-Gm-Gg: AR+sD100IJ8y2i4hca2J14u2pOK/D7zXXYUqTTQNuqtmEsyGitmNSSIsWe1nMjC+K5A
	VxPFDRxjIUoK12QeTltI43lg3wvWiBrfoGUK2puunVJkRdMkSKMemUlJX1vpKrXd8B/DWwqQh1e
	aA8czR96T+f09XUbP5kgq2cLk2LsX0s6KD1Ar2JrZ3zSEl2ZLHCF9QPAF+KVUQQPTZe4TE/ZuWZ
	7L+yx0gsdVlVeKkwPHeY0SE0/+/ALW2yuhB3jydRpk/uO+wUariM2JBpqsWc3GTqzK0gm8lACy2
	OjsPPhS/iwatyvc1ImUiv8dKoGVN++a41NCtkFLTwWh5gM43roQkYfF6DqcNfVE0sgzcMMVtkhw
	rRwlmDUdQ42FCNzYGnrrzHfN6+sQYC/UScNIqZOxMxXYg56sXXgS1QIYzzyVLGoxvxPdvH+WsBR
	rJxf1TT2/7ylNlo8xnU1hGLGspKJKwePDy0ZAo0RDuGYsOFrQ3r1jGGlTmRDBTRkj0xIEFiXSio
	I6UZmZU5Q19aHIVRImmTZzCatp2tj+FWw==
X-Received: by 2002:a05:600c:3ba6:b0:495:3a52:71b1 with SMTP id 5b1f17b1804b1-4994e374ad3mr1342475e9.5.1785858501675;
        Tue, 04 Aug 2026 08:48:21 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
	Baptiste Le Duc <baptiste.le-duc@vates.tech>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Timothy Pearson <tpearson@raptorengineering.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: [PATCH v7 02/20] xen/dom0less: turn max_init_domid into a common variable
Date: Tue,  4 Aug 2026 17:47:52 +0200
Message-ID: <6cd23822f5427a67f8f77300b09bc78d65a1d317.1785836421.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1785836421.git.oleksii.kurochko@gmail.com>
References: <cover.1785836421.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-bad1c0/1785858502-BE6DA034-95C89CCA/10/73395122804
X-purgate-type: spam
X-purgate-size: 5825

Until now every architecture carried its own notion of max_init_domid:
Arm defined a real variable (declared in asm/setup.h, defined in
setup.c), while ppc, riscv and x86 each provided a "#define
max_init_domid (0)" stub in their asm/setup.h. This duplicated the same
declaration across all arches and placed a purely dom0less concept in
arch setup headers.

Now that the dom0less build code lives in common (xen/common/
device-tree/dom0less-build.c sets max_init_domid, and the console
serial-input switcher reads it), there is no reason for the symbol to be
per-arch. Provide a single declaration in <xen/dom0less-build.h>, with
the !CONFIG_DOM0LESS_BOOT stub kept there as well, so there is one source
of truth and the arch headers no longer need to mention it. Update
console.c to include <xen/dom0less-build.h> for the declaration instead
of relying on asm/setup.h.

Place the definition in xen/common/domid.c rather than in dom0less-
build.c. The latter is built as dom0less-build.init.o, i.e. the whole
object is relocated into the .init.* sections and freed after boot,
whereas max_init_domid must outlive boot because it is read at runtime
by the console serial-input switcher. domid.c is always linked (obj-y)
and resides in regular (non-init) sections, so it is a correct home for
the variable. It is marked __ro_after_init since it is only updated
while creating boot-time domains and read-only afterwards, and guarded
by CONFIG_DOM0LESS_BOOT as domid.c itself is unconditional.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
Changes in v6-7:
 - Nothing changed. Only rebase.
---
Changes in v5:
 - Add Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
Changes in v4:
 - New patch.
---
---
 xen/arch/arm/include/asm/setup.h   | 2 --
 xen/arch/arm/setup.c               | 2 --
 xen/arch/ppc/include/asm/setup.h   | 2 --
 xen/arch/riscv/include/asm/setup.h | 2 --
 xen/arch/x86/include/asm/setup.h   | 2 --
 xen/common/domid.c                 | 5 +++++
 xen/drivers/char/console.c         | 1 +
 xen/include/xen/dom0less-build.h   | 7 +++++++
 8 files changed, 13 insertions(+), 10 deletions(-)

diff --git a/xen/arch/arm/include/asm/setup.h b/xen/arch/arm/include/asm/setup.h
index 0adfa4993a8f..2af780512540 100644
--- a/xen/arch/arm/include/asm/setup.h
+++ b/xen/arch/arm/include/asm/setup.h
@@ -25,8 +25,6 @@ struct map_range_data
     struct rangeset *irq_ranges;
 };
 
-extern domid_t max_init_domid;
-
 void copy_from_paddr(void *dst, paddr_t paddr, unsigned long len);
 
 size_t estimate_efi_size(unsigned int mem_nr_banks);
diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
index 6310a47d68b6..86532d0a35b6 100644
--- a/xen/arch/arm/setup.c
+++ b/xen/arch/arm/setup.c
@@ -62,8 +62,6 @@ struct cpuinfo_arm __read_mostly system_cpuinfo;
 bool __read_mostly acpi_disabled;
 #endif
 
-domid_t __read_mostly max_init_domid;
-
 static __used void noreturn init_done(void)
 {
     /* Must be done past setting system_state. */
diff --git a/xen/arch/ppc/include/asm/setup.h b/xen/arch/ppc/include/asm/setup.h
index e4f64879b68c..956fa6985adb 100644
--- a/xen/arch/ppc/include/asm/setup.h
+++ b/xen/arch/ppc/include/asm/setup.h
@@ -1,6 +1,4 @@
 #ifndef __ASM_PPC_SETUP_H__
 #define __ASM_PPC_SETUP_H__
 
-#define max_init_domid (0)
-
 #endif /* __ASM_PPC_SETUP_H__ */
diff --git a/xen/arch/riscv/include/asm/setup.h b/xen/arch/riscv/include/asm/setup.h
index 2215894cfbb1..73ce2f293348 100644
--- a/xen/arch/riscv/include/asm/setup.h
+++ b/xen/arch/riscv/include/asm/setup.h
@@ -5,8 +5,6 @@
 
 #include <xen/types.h>
 
-#define max_init_domid (0)
-
 void setup_mm(void);
 
 void copy_from_paddr(void *dst, paddr_t paddr, unsigned long len);
diff --git a/xen/arch/x86/include/asm/setup.h b/xen/arch/x86/include/asm/setup.h
index b01e83a8ed9f..5925c5f39cff 100644
--- a/xen/arch/x86/include/asm/setup.h
+++ b/xen/arch/x86/include/asm/setup.h
@@ -68,6 +68,4 @@ extern bool opt_dom0_verbose;
 extern bool opt_dom0_cpuid_faulting;
 extern bool opt_dom0_msr_relaxed;
 
-#define max_init_domid (0)
-
 #endif
diff --git a/xen/common/domid.c b/xen/common/domid.c
index b0258e477c1a..cd46cf952be6 100644
--- a/xen/common/domid.c
+++ b/xen/common/domid.c
@@ -9,6 +9,11 @@
  */
 
 #include <xen/domain.h>
+#include <xen/dom0less-build.h>
+
+#ifdef CONFIG_DOM0LESS_BOOT
+domid_t __ro_after_init max_init_domid;
+#endif
 
 static DEFINE_SPINLOCK(domid_lock);
 static DECLARE_BITMAP(domid_bitmap, DOMID_FIRST_RESERVED);
diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
index ea4e3ff34178..4c735cc04c67 100644
--- a/xen/drivers/char/console.c
+++ b/xen/drivers/char/console.c
@@ -31,6 +31,7 @@
 #include <xen/warning.h>
 #include <xen/pv_console.h>
 #include <asm/setup.h>
+#include <xen/dom0less-build.h>
 #include <xen/sections.h>
 #include <xen/consoled.h>
 
diff --git a/xen/include/xen/dom0less-build.h b/xen/include/xen/dom0less-build.h
index 4118dec76c0a..8d4da16d1f0a 100644
--- a/xen/include/xen/dom0less-build.h
+++ b/xen/include/xen/dom0less-build.h
@@ -5,6 +5,8 @@
 
 #include <xen/stdbool.h>
 
+#include <public/xen.h>
+
 struct domain;
 
 #ifdef CONFIG_DOM0LESS_BOOT
@@ -13,6 +15,9 @@ struct boot_domain;
 struct dt_device_node;
 struct kernel_info;
 
+/* Highest domain ID assigned to a boot-time (dom0less) domain. */
+extern domid_t max_init_domid;
+
 /*
  * List of possible features for dom0less domUs
  *
@@ -72,6 +77,8 @@ static inline bool is_dom0less_mode(void)
 }
 static inline void set_xs_domain(struct domain *d) {}
 
+#define max_init_domid 0
+
 #endif /* CONFIG_DOM0LESS_BOOT */
 
 #endif /* __ASM_GENERIC_DOM0LESS_BUILD_H__ */
-- 
2.55.0


