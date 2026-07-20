Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10079C44524
	for <xen-devel@archiver.kernel.org>; Mon, 20 Jul 2026 16:00:35 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1366948.1616747 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wlqPl-0004RU-6s; Mon, 20 Jul 2026 16:00:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1366948.1616747; Mon, 20 Jul 2026 16:00:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wlqPl-0004RJ-3R; Mon, 20 Jul 2026 16:00:21 +0000
Received: by outflank-mailman (input) for mailman id 1366948;
 Mon, 20 Jul 2026 16:00:19 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wlqPj-0004Dz-Q0
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2026 16:00:19 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wlqPj-001mbV-6s
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2026 18:00:19 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a5e460b-2eae-0a2a0a5409dd-0a2a4506bcec-16
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 18:00:19 +0200
Received: from [209.85.128.52] (helo=mail-wm1-f52.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a5e4612-195a-0a2a45060019-d1558034c9d6-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 18:00:19 +0200
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-493b966dd74so43738535e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 09:00:19 -0700 (PDT)
Received: from fedora (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47f63edd7d3sm30084673f8f.25.2026.07.20.09.00.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jul 2026 09:00:17 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1784563218; x=1785168018; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EKkncs/MVbSUd+vQGpfC/FsRQ3Kf/ToKIui4GZQixqs=;
        b=bqZ17V+bGIXKY7/QgylU6GScGT+lx4r2hAaL0vxNJ4ONrrRZFyvLI0PHmvO6u2YdsF
         Bj9xI4fQP7YrK0S4fd7UMrgm4X/MxVHyhoL+Z5mKbDzCy+AJbWjpCrX2nl5o9n7kLCH5
         nSTrX09wgzBATrYu52OkbgspmCSc2nw3n69B76T2sKnaMxk5riHuFU3IU4CXfu/34J2R
         63IkdI94YPRybF35HpMou4g5OawwZqckYKMeFTUpOnV0w5ul6Kv7ArEQeOiqhPJeQZTZ
         afAT3ddIEnFBBoDJBYn5SkXSuhyVZszQeiqUbqVmP/JLTyThNSuVnjHVLdEfNzto4XY4
         lpyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784563218; x=1785168018;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EKkncs/MVbSUd+vQGpfC/FsRQ3Kf/ToKIui4GZQixqs=;
        b=mMcRJQg6VkGwZednnWLoLeuCFLY3aJGWxvFP2cy7Td3sVTCCYvgwvOJy+DAPfMNJ+v
         bB31E11YtjLISrONv0pZxo19QfUFObXm9J5hq3lzlrOSHPJ2mNHKmBFuKTjwDpGYQuSG
         DYQPL2Y1eutbewuwFNAcN23eBGHI1kTAw0ID//WesxAeP1APO9jntQRcU4F+EwZCM0Bu
         2dpnNYEAU2vQvfch01YpqZHzuyK+ELAkSIhX2/aIq2n0vLHTOd/4ftMGZYfFkr3oG9eO
         ZYA5R2psk2pOtVeUiyQJ/UgfW4cz2xA4YZLqZ4DvWCcGoX4xm8lXpjR6Q/zQb9TNalJ8
         Fpdg==
X-Gm-Message-State: AOJu0YzhWXRPE5ckCHf+TOyYR7askEb5TDatN4LHr6dIl4PV4pvBafv2
	QJdCnKBtpCKE0TGgi08oqkbBXZLCuYSqKhAHlupAzZLsOdUWgEzlhbnImWuAyg==
X-Gm-Gg: AfdE7cmc3+jGIDst6L/48WSlxamtt7uhC5cMxtQPT5aWJITYkzKk8Xy0KMfLCpTNelV
	MnRcJKysVEJQ3wJJbF8jXAu5NML1KcbANCc4H0dG3K4H3zGD4+lmY9fgL9hnWQC0xxYDLCfUIqO
	ETQJtc4VyACzfxKCPK2m72Jg23VCYDclBs5JE3Ins0qg7vItZW1/Nlbsh/KzTJ0NAli1H5Xdcb6
	us9flHhqnBByfBUr3LNNGw/PZ09ZTj9yIpg8cJbydSL/quEOS3SpbBKQkr+W6JkYNWK2z4PUcXL
	bEW9tZ8L+ns2IjqmvpqAaL/uk0tpPa6OZiXkk9LbYdbYsBTl0TnwMHm0gauHv86Hepsr7tIH+Fh
	/YHtwl4qM0gCwj47hlUM/pw1nS2/nAcy/qbSrKVSzYNHluO208jw+H165BkolcvhqP67c68ViwM
	mhVrXfAXwGWFzwg9F+kXIVe3lOcAzooZzOXHs6BsW1ZivZYP4=
X-Received: by 2002:a05:600c:3b8e:b0:495:4bf3:2150 with SMTP id 5b1f17b1804b1-4954bf3216amr178623735e9.8.1784563218062;
        Mon, 20 Jul 2026 09:00:18 -0700 (PDT)
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
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Timothy Pearson <tpearson@raptorengineering.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: [PATCH v6 02/23] xen/dom0less: turn max_init_domid into a common variable
Date: Mon, 20 Jul 2026 17:59:43 +0200
Message-ID: <7dac805d42b3adb6df3cdd1c2be4f0e511f30439.1784559209.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1784559209.git.oleksii.kurochko@gmail.com>
References: <cover.1784559209.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-16d1c6/1784563219-F4C0777B-0E330D7F/10/73395122804
X-purgate-type: spam
X-purgate-size: 5823

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
Changes in v6:
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
2.54.0


