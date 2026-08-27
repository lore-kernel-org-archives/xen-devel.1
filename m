Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4160FC61DCD
	for <xen-devel@archiver.kernel.org>; Thu, 27 Aug 2026 15:19:59 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1400811.1636368 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzbt5-0003Sf-Ui; Thu, 27 Aug 2026 15:19:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1400811.1636368; Thu, 27 Aug 2026 15:19:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzbt5-0003SY-Rx; Thu, 27 Aug 2026 15:19:31 +0000
Received: by outflank-mailman (input) for mailman id 1400811;
 Thu, 27 Aug 2026 15:19:30 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wzbt4-0003MP-BT
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2026 15:19:30 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wzbt3-004jSy-Ok
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2026 17:19:29 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a90557b-bab6-0a2a0a5309dd-0a2a450a977c-26
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 17:19:29 +0200
Received: from [209.85.128.48] (helo=mail-wm1-f48.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a905581-f2d2-0a2a450a0019-d1558030ecc5-3
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 17:19:29 +0200
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-49b0d8bc2aaso14134165e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 08:19:29 -0700 (PDT)
Received: from fedora (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-482e28f5d01sm10049148f8f.32.2026.08.27.08.19.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Aug 2026 08:19:27 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1787843969; x=1788448769; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MsTBeA0ZGq8F3SZViAsXelexLz0mB7PPbJbFhEx+BOM=;
        b=KLfVNLQotvj9GJahZDKXe9Gk85p3LD8yXzeiQVkFJpdkxbx/D5wDYwyX/pc6pDisgV
         ehc55BNamBHdNOHKgIzEngzLTted4Domrkw6mdpbixKZDwTBy1iiUl3WPgi9dq5AoOU9
         xh39Bg6R3R2xLsDohxC7tre9tncfmx0bwgOuqZ48f/FkrLZUoqAmB3tp8rEgn4JPWujE
         5zUQAjWutK5K3E3GeKD0kJv9eP6H8UnaGhhn6li7sIzAlm/V6JZ9GaacRn/qhPx+6kWj
         36Li74HzOK8dzOxO3q4YMhdrmbSSBua3eSi52sv8wZ+1B4Cz43fHCac/UXsGuylqGsO8
         ZQhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787843969; x=1788448769;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MsTBeA0ZGq8F3SZViAsXelexLz0mB7PPbJbFhEx+BOM=;
        b=r6tY8HENr36MF+ctLQGuyswg6u0G3RctLJ7oNTSJptph130K2QdQLFYLXsYcY+JZLq
         pL0EynJ81bNX7/mDGu/iasQ1WNir89ATaBDylwzRnmns9EIACn3EqeOvekTSFcZ3ZysZ
         QeVw2YZPtDoHUjz8imOZgmIeh6gYXbxDiGqDZXUZFgRQG5aQyeU66H8oYv2rbF7nGydB
         c8Q9O6vNPvARhcLJTt0QGqwlvNY+n3tpjSXIHH/W3cdN7rdOT1zGSuOSIhCr6VkQeuNH
         MTjV6TAiCmd9iLMTqo+SLkBEUpUx2YNnZ3NnovD6hlkSvQWQTEAhA5d03TDy/kL2W4X0
         eLTw==
X-Gm-Message-State: AFuF++n6aagAZi+pqFbfMWLHbQ6TssAYMYsI/9eP2PmwYLUd/tSnIMdX
	Flj2n5BrDFKv6Yuor6q3XeCAsQc6W4Tm9eQtCObSe8eiTPV59ainTV4qam/7XQ==
X-Gm-Gg: AR+sD10C+pwPRLUjcnBNbKlibsnRpxILDX5nHpwRpTUaLCfbyB22jOtw8sdEmvZqnql
	3fedk174XjgT/vg1FWgO6nnTsXqp/vEkae2r5ZiH9mypks9JbqkYKDlf7fg9iw2EH1pDDP3aWT4
	pEjzQJj3AfJOtK1qaHykQ26A8bNPzb7cNGYix6K55DdeeJTPPdqJJJh9978tX6sAHCanxmh0oCJ
	WpXWvoRZxODfVFzQNANt9qzNqVtGHLMddZ3MK/x71DTlgHWcibOWmx6XhHKzGcHGDhX1UJuSmO9
	5W/B6ZaDwzp/BrsCWpqAnObsFeC+kOzdJTOv5QfLncdYNFrWICQa1ryITg1cOjgw5X1MvlgkdA1
	e/sovbrxGGEm2oQb/cnaPkGXlGVLHcemWh/nzu9KrWd5CYF0ySTd1GjOrNOCkCIOa+nNJFCdRsj
	vhyhZ900Whu74E4gApMSFO4/nRI+mFBl4PJDm+iZ3/Z0QG3wGnUJ2Y7iLMXag49r0qb83bYBD07
	T+Z0jNcKQSeUCPaXzY4+NMGEWhj7I+m
X-Received: by 2002:a05:600c:3144:b0:499:79b9:e220 with SMTP id 5b1f17b1804b1-499dc72548dmr187369945e9.10.1787843968764;
        Thu, 27 Aug 2026 08:19:28 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
	Baptiste Le Duc <baptiste.le-duc@vates.tech>,
	Zheng Zhang <zhangzheng@iscas.ac.cn>,
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
Subject: [PATCH v8 02/20] xen/dom0less: turn max_init_domid into a common variable
Date: Thu, 27 Aug 2026 17:18:55 +0200
Message-ID: <5a74a964b763e8444579a3c0d455e23160be8893.1787836900.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1787836900.git.oleksii.kurochko@gmail.com>
References: <cover.1787836900.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-4011c0/1787843969-583CCCFC-87C1DADB/10/73395122804
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
Changes in v6-8:
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
index fcacf37c52f0..61e92491e40a 100644
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


