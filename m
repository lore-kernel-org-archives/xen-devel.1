Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36F55C79FBD
	for <xen-devel@archiver.kernel.org>; Wed,  9 Sep 2026 15:08:45 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1413249.1643482 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4JuH-0000pp-Tm; Wed, 09 Sep 2026 15:08:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1413249.1643482; Wed, 09 Sep 2026 15:08:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4JuH-0000pg-QR; Wed, 09 Sep 2026 15:08:13 +0000
Received: by outflank-mailman (input) for mailman id 1413249;
 Wed, 09 Sep 2026 15:08:12 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1x4JuG-0000p1-Oo
 for xen-devel@lists.xenproject.org; Wed, 09 Sep 2026 15:08:12 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x4JuG-00Cu0U-5R
 for xen-devel@lists.xenproject.org; Wed, 09 Sep 2026 17:08:12 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6aa17648-e002-0a2a0a5209dd-0a2a450ad012-42
 for <xen-devel@lists.xenproject.org>; Wed, 09 Sep 2026 17:08:12 +0200
Received: from [209.85.218.42] (helo=mail-ej1-f42.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6aa1765c-f2d2-0a2a450a0019-d155da2ad51d-3
 for <xen-devel@lists.xenproject.org>; Wed, 09 Sep 2026 17:08:12 +0200
Received: by mail-ej1-f42.google.com with SMTP id
 a640c23a62f3a-c2938116fefso119849366b.1
 for <xen-devel@lists.xenproject.org>; Wed, 09 Sep 2026 08:08:12 -0700 (PDT)
Received: from fedora (IW396200.net.t-com.hr. [195.29.234.54])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c261f673000sm709991666b.24.2026.09.09.08.08.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Sep 2026 08:08:10 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1788966492; x=1789571292; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SGIWlTbDaP0A9QeYN/SYThh0YL+nKcmDxCzTgmCJBSs=;
        b=Vcy9qTzC5oyzOybAnphld3Lmoj0cnx8KFsgD5lvb/mRMRzB0z6mJCpJhxoS8EWtjl9
         4mcFF77O+crTHEDO2lTZ0a0FoBSJDU8svU7G/ypCq+wQfuuZZpA1YfevjLVhJyJ8682s
         XRllNBpLrNwT/UzsckzmHpQidXqL94YM0PU/38KCmq2J+DLHcjj/6SMpAA09v/AOGlb5
         efZxt0JVXs4WKAsOXlMbzXqf+zrzJCFnBvtPybO7toVQ029Sa3aK3c2FTG1IgN8xwImD
         IjJa/VYU9mlNKC9EYRN4QzF8Mv0Ky2Nw6oKQ/RGo6Y8mkswEnvkqyH5F5wJW4teFTyjE
         4oMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788966492; x=1789571292;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SGIWlTbDaP0A9QeYN/SYThh0YL+nKcmDxCzTgmCJBSs=;
        b=USoYzmgAYOKNoA6HM4Tw/FsYxzlnXgZtWYCyabBvX5VxW8kCWa9fQm0XlJOlVt1L8q
         0oxNYaOcprID5O6Of3lX9mp3pTZTpieXOy/i8TWMTd2qLc5vTfkywgRSoj4Tu8Sm6zYx
         f7lD+aqJqUHyHoK1iHubOXgFw+byvmrGbCgyDOapgXH7hrzAirifqXEgbyuQN1TIvbVW
         YbeMxkqDwbYCmxUeGAbHHZkIzlo2VHm9Yn4ovvrZ6zf//vBsF2AigPlN34gWjEQTC2yF
         hbIgfg8OyITWuN+JS3wCfyzM71BcsTcik+UHOEwZqrwiN77Z/3E3aSfu1/BagBN8DiQe
         NGbQ==
X-Gm-Message-State: AFuF++m6OCp+o5UDFOjsmA73Ye/1qB3WN51B6piBqZS+AHuoyKkL/vdg
	NR5YVk2INqToACt/S5BWIcbL7pgdF4w65w0OCSGbbhuVnOhi+Sf7PW0GdHJ6QgH9
X-Gm-Gg: AYBFou3bHmF/MWzVIzVxGZ43UsR5mmG9xgGO1aAW6DTJeFJ+QWi3MGAIujm2kw17cmv
	4F1jN69O1sSjfSmB5X0fSsNUks5cAVbM9RuPBR33LOqU7LJYBsBvmvSTWxVskhotnhFAq90xoRz
	t+9cxK1HJXjgfv1G7u5taqVSX7naArWDurHhcdsxy9qS4uq1kIhdnGf9yblayqWiNDsdsy1nPoT
	MRoglJIR5hKC8lSBmr/fwSK0X4tb/w9KUY1T20Sck6YJZN1a9icveLM6R0s2A67SdpLIul6i+8x
	sXAi4sUhmp386Q+TeoYDXSf5OZ/KN+lnHiaKqMze35nDqfKOsbREGlmhx3Dw/+PwABG1i2Wygry
	H+9tLVZQPbBkiDzEs1MQ9ZEWLVpYp5zfiIL6RlVqjZuuKQWP6tPECzUF7ECpCOa/D3CZqioZn5I
	qoDbhsJzjydy0smIYAur3Mn9orrTK2UZjqK9/WlieN4iXeMYD2TKeVEncwE3EhU6j7dwQf7/fRo
	O0uiwtjOziBICfcpoQ=
X-Received: by 2002:a17:907:805:b0:c29:3a1b:ec7a with SMTP id a640c23a62f3a-c293a1bf1bfmr147233566b.10.1788966491349;
        Wed, 09 Sep 2026 08:08:11 -0700 (PDT)
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
Subject: [PATCH v9 02/20] xen/dom0less: turn max_init_domid into a common variable
Date: Wed,  9 Sep 2026 17:07:20 +0200
Message-ID: <4d2919b7b191d6fa91c11043e7f08de228012852.1788876411.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1788876411.git.oleksii.kurochko@gmail.com>
References: <cover.1788876411.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-4011c0/1788966492-59BC0CFC-D7DEA16E/10/73395122804
X-purgate-type: spam
X-purgate-size: 6771

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
of relying on asm/setup.h, and drop the now unneeded <asm/setup.h>
include.

Place the definition in xen/common/domid.c rather than in dom0less-
build.c. The latter is built as dom0less-build.init.o, i.e. the whole
object is relocated into the .init.* sections and freed after boot,
whereas max_init_domid must outlive boot because it is read at runtime
by the console serial-input switcher. domid.c is always linked (obj-y)
and resides in regular (non-init) sections, so it is a correct home for
the variable. It is marked __ro_after_init since it is only updated
while creating boot-time domains and read-only afterwards, and guarded
by CONFIG_DOM0LESS_BOOT as domid.c itself is unconditional.

While at it, make <xen/dom0less-build.h> self-contained: it includes
<public/xen.h>, which uses the fixed-width types provided by
<xen/types.h>, so include the latter explicitly rather than relying on
the includer having pulled it in first. This becomes necessary as soon
as <xen/dom0less-build.h> comes first in an alphabetically sorted
include list, as it now does in domid.c.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>
---
Changes in v9:
 - Sort the includes in domid.c alphabetically ("dom0less" before
   "domain") and add <xen/types.h> to <xen/dom0less-build.h>, which the
   re-ordering requires.
 - Drop the leftover <asm/setup.h> include from console.c as nothing from it
   depends in console.c anymore.
 - Add Reviewed-by: Michal Orzel <michal.orzel@amd.com>.
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
 xen/drivers/char/console.c         | 2 +-
 xen/include/xen/dom0less-build.h   | 8 ++++++++
 8 files changed, 14 insertions(+), 11 deletions(-)

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
index b0258e477c1a..c0cb025609b8 100644
--- a/xen/common/domid.c
+++ b/xen/common/domid.c
@@ -8,8 +8,13 @@
  * Copyright 2025 Ford Motor Company
  */
 
+#include <xen/dom0less-build.h>
 #include <xen/domain.h>
 
+#ifdef CONFIG_DOM0LESS_BOOT
+domid_t __ro_after_init max_init_domid;
+#endif
+
 static DEFINE_SPINLOCK(domid_lock);
 static DECLARE_BITMAP(domid_bitmap, DOMID_FIRST_RESERVED);
 
diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
index fcacf37c52f0..e4df0bbc2eec 100644
--- a/xen/drivers/char/console.c
+++ b/xen/drivers/char/console.c
@@ -30,7 +30,7 @@
 #include <xen/early_printk.h>
 #include <xen/warning.h>
 #include <xen/pv_console.h>
-#include <asm/setup.h>
+#include <xen/dom0less-build.h>
 #include <xen/sections.h>
 #include <xen/consoled.h>
 
diff --git a/xen/include/xen/dom0less-build.h b/xen/include/xen/dom0less-build.h
index 4118dec76c0a..75bfaa185fa6 100644
--- a/xen/include/xen/dom0less-build.h
+++ b/xen/include/xen/dom0less-build.h
@@ -4,6 +4,9 @@
 #define XEN_DOM0LESS_BUILD_H
 
 #include <xen/stdbool.h>
+#include <xen/types.h>
+
+#include <public/xen.h>
 
 struct domain;
 
@@ -13,6 +16,9 @@ struct boot_domain;
 struct dt_device_node;
 struct kernel_info;
 
+/* Highest domain ID assigned to a boot-time (dom0less) domain. */
+extern domid_t max_init_domid;
+
 /*
  * List of possible features for dom0less domUs
  *
@@ -72,6 +78,8 @@ static inline bool is_dom0less_mode(void)
 }
 static inline void set_xs_domain(struct domain *d) {}
 
+#define max_init_domid 0
+
 #endif /* CONFIG_DOM0LESS_BOOT */
 
 #endif /* __ASM_GENERIC_DOM0LESS_BUILD_H__ */
-- 
2.55.0


