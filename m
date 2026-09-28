Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E6F1C9830E
	for <xen-devel@archiver.kernel.org>; Mon, 28 Sep 2026 02:39:14 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1435632.1654439 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xB1GN-0001P6-33; Mon, 28 Sep 2026 02:38:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1435632.1654439; Mon, 28 Sep 2026 02:38:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xB1GM-0001NJ-U4; Mon, 28 Sep 2026 02:38:42 +0000
Received: by outflank-mailman (input) for mailman id 1435632;
 Mon, 28 Sep 2026 02:38:42 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <zhangzheng@iscas.ac.cn>) id 1xB1GM-0001Md-46
 for xen-devel@lists.xenproject.org; Mon, 28 Sep 2026 02:38:42 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xB1GL-007jIb-8Y
 for xen-devel@lists.xenproject.org; Mon, 28 Sep 2026 04:38:41 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <zhangzheng@iscas.ac.cn>)
 id 6ab9d2f0-bab6-0a2a0a5309dd-0a2a450cd010-16
 for <xen-devel@lists.xenproject.org>; Mon, 28 Sep 2026 04:38:41 +0200
Received: from [159.226.251.21] (helo=cstnet.cn)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <zhangzheng@iscas.ac.cn>)
 id 6ab9d32e-f479-0a2a450c0019-9fe2fb15b492-3
 for <xen-devel@lists.xenproject.org>; Mon, 28 Sep 2026 04:38:40 +0200
Received: from iscas-ws (unknown [36.110.52.2])
 by APP-01 (Coremail) with SMTP id qwCowAAH3fAl07lqgMQ+CQ--.323S3;
 Mon, 28 Sep 2026 10:38:31 +0800 (CST)
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
Authentication-Results: eu.smtp.expurgate.cloud; none
From: Zhang Zheng <zhangzheng@iscas.ac.cn>
To: xen-devel@lists.xenproject.org
Cc: Zhang Zheng <zhangzheng@iscas.ac.cn>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Baptiste Le Duc <baptiste.le-duc@vates.tech>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v1 1/1] xen/riscv: replace SBI early console with 8250 UART
Date: Mon, 28 Sep 2026 10:38:53 +0800
Message-ID: <20260928023857.1030884-2-zhangzheng@iscas.ac.cn>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260928023857.1030884-1-zhangzheng@iscas.ac.cn>
References: <20260928023857.1030884-1-zhangzheng@iscas.ac.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qwCowAAH3fAl07lqgMQ+CQ--.323S3
X-Coremail-Antispam: 1UD129KBjvAXoW3uw1xWw4rWF15Zw1DXFWkJFb_yoW8JF43to
	ZYvrs2qw1Sqr43ur4fuw13tay8XrsagrsrX342yF45ZFy8Jr1rJF1vgwn0v34jyF1xtryr
	GFW7uanxZF4DXFn5n29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
	AaLaJ3UjIYCTnIWjp_UUUO27AC8VAFwI0_Wr0E3s1l1xkIjI8I6I8E6xAIw20EY4v20xva
	j40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l82xGYIkIc2x26280x7IE14v26r18M28IrcIa0x
	kI8VCY1x0267AKxVW8JVW5JwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84AC
	jcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j6r4UJw
	A2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s1l
	e2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI
	8IcVAFwI0_JF0_Jw1lYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8JwAC
	jcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2Y2ka0x
	kIwI1lc7CjxVAaw2AFwI0_Jw0_GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_
	Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1V
	AY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAI
	cVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42
	IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIev
	Ja73UjIFyTuYvjfUb3ktUUUUU
X-Originating-IP: [36.110.52.2]
X-CM-SenderInfo: x2kd0wx2kh0w46lvutnvoduhdfq/
X-purgate-ID: tlsNG-d25034/1790563121-032D8A5B-D724822E/0/0
X-purgate-type: clean
X-purgate-size: 13612

As noted by the TODO, the legacy SBI console extension is planned
for deprecation. Replace it with direct access to UART MMIO.

Signed-off-by: Zhang Zheng <zhangzheng@iscas.ac.cn>
---
 xen/arch/riscv/Kconfig.debug              | 53 ++++++++++++++++++++--
 xen/arch/riscv/configs/tiny64_defconfig   |  2 +
 xen/arch/riscv/early_printk.c             | 37 +++++++---------
 xen/arch/riscv/include/asm/early_printk.h | 12 +++++
 xen/arch/riscv/include/asm/fixmap.h       |  6 ++-
 xen/arch/riscv/include/asm/sbi.h          |  7 ---
 xen/arch/riscv/mm.c                       | 41 +++++++++++++----
 xen/arch/riscv/riscv64/Makefile           |  1 +
 xen/arch/riscv/riscv64/debug-8250.inc     | 51 +++++++++++++++++++++
 xen/arch/riscv/riscv64/debug.S            | 54 +++++++++++++++++++++++
 xen/arch/riscv/sbi.c                      |  5 ---
 11 files changed, 223 insertions(+), 46 deletions(-)
 create mode 100644 xen/arch/riscv/riscv64/debug-8250.inc
 create mode 100644 xen/arch/riscv/riscv64/debug.S

diff --git a/xen/arch/riscv/Kconfig.debug b/xen/arch/riscv/Kconfig.debug
index 608c9ff832..51536e7151 100644
--- a/xen/arch/riscv/Kconfig.debug
+++ b/xen/arch/riscv/Kconfig.debug
@@ -1,5 +1,50 @@
+choice
+	bool "Early printk"
+	optional
+	help
+	  You may want to enable early printk if you are debugging code
+	  that executes before the console is initialized.
+
+	  Note that selecting this option will limit Xen to a single UART
+	  definition. Attempting to boot the Xen image on a different
+	  platform will not work, so this option should not be enabled
+	  for Xen images that are intended to be portable.
+
+	  Choose one of the UART drivers for early printk, then specify
+	  parameters such as the base address.
+
+	config EARLY_UART_CHOICE_8250
+		select EARLY_UART_8250
+		bool "Early printk via 8250 UART"
+		help
+		  Say Y here if you wish early printk to direct its output
+		  to an already configured 8250-compatible UART.
+
+endchoice
+
+config EARLY_UART_8250
+	select EARLY_PRINTK
+	bool
+
 config EARLY_PRINTK
-    bool "Enable early printk"
-    default DEBUG
-    help
-      Enables early printk debug messages
+	bool
+
+config EARLY_UART_BASE_ADDRESS
+	depends on EARLY_UART_8250
+	hex "Early printk, physical base address of debug UART"
+
+config EARLY_UART_8250_REG_SHIFT
+	depends on EARLY_UART_8250
+	int "Early printk, left-shift to apply to the register offsets within the 8250 UART"
+	default 0
+	range 0 4
+	help
+	  EARLY_UART_8250_REG_SHIFT is, optionally, the left-shift to
+	  apply to the register offsets within the UART with early
+	  printk.
+
+	  Default to 0.
+
+config EARLY_PRINTK_INC
+	string
+	default "debug-8250.inc" if EARLY_UART_8250
diff --git a/xen/arch/riscv/configs/tiny64_defconfig b/xen/arch/riscv/configs/tiny64_defconfig
index 2399f7b918..438db66551 100644
--- a/xen/arch/riscv/configs/tiny64_defconfig
+++ b/xen/arch/riscv/configs/tiny64_defconfig
@@ -10,3 +10,5 @@ CONFIG_DEBUG=y
 CONFIG_DEBUG_INFO=y
 CONFIG_EXPERT=y
 CONFIG_QEMU_PLATFORM=y
+CONFIG_EARLY_UART_CHOICE_8250=y
+CONFIG_EARLY_UART_BASE_ADDRESS=0x10000000
diff --git a/xen/arch/riscv/early_printk.c b/xen/arch/riscv/early_printk.c
index 634141354c..bb2dc6c719 100644
--- a/xen/arch/riscv/early_printk.c
+++ b/xen/arch/riscv/early_printk.c
@@ -1,42 +1,37 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 /*
- * RISC-V early printk using SBI
+ * RISC-V early printk
  *
  * Copyright (C) 2021 Bobby Eshleman <bobbyeshleman@gmail.com>
  */
-#include <asm/early_printk.h>
-#include <asm/sbi.h>
+#include <xen/early_printk.h>
 
-/*
- * When the MMU is off during early boot, any C function called has to
- * use PC-relative rather than absolute address because the physical address
- * may not match the virtual address.
- *
- * To guarantee PC-relative address cmodel=medany should be used
- */
 #ifndef __riscv_cmodel_medany
 #error "early_*() can be called from head.S with MMU-off"
 #endif
 
-/*
- * TODO:
- *   sbi_console_putchar is already planned for deprecation
- *   so it should be reworked to use UART directly.
-*/
+void early_putch(char c);
+void early_flush(void);
+
 void early_puts(const char *s, size_t nr)
 {
     while ( nr-- > 0 )
     {
-        sbi_console_putchar(*s);
+        if ( *s == '\n' )
+            early_putch('\r');
+        early_putch(*s);
         s++;
     }
+
+    early_flush();
 }
 
 void early_printk(const char *str)
 {
-    while ( *str )
-    {
-        early_puts(str, 1);
-        str++;
-    }
+    const char *end = str;
+
+    while ( *end )
+        end++;
+
+    early_puts(str, end - str);
 }
diff --git a/xen/arch/riscv/include/asm/early_printk.h b/xen/arch/riscv/include/asm/early_printk.h
index 2750045bdd..e4c95ed7b4 100644
--- a/xen/arch/riscv/include/asm/early_printk.h
+++ b/xen/arch/riscv/include/asm/early_printk.h
@@ -3,6 +3,7 @@
 #ifndef ASM__RISCV__EARLY_PRINTK_H
 #define ASM__RISCV__EARLY_PRINTK_H
 
+#ifndef __ASSEMBLER__
 #include <xen/early_printk.h>
 
 #ifdef CONFIG_EARLY_PRINTK
@@ -10,5 +11,16 @@ void early_printk(const char *str);
 #else
 static inline void early_printk(const char *s) {};
 #endif
+#endif
+
+#ifdef CONFIG_EARLY_PRINTK
+
+#include <xen/page-size.h>
+#include <asm/fixmap.h>
+
+/* need to add the uart address offset in page to the fixmap address */
+#define EARLY_UART_VIRTUAL_ADDRESS \
+    (FIXMAP_ADDR(FIX_CONSOLE) + (CONFIG_EARLY_UART_BASE_ADDRESS & ~PAGE_MASK))
+#endif
 
 #endif /* ASM__RISCV__EARLY_PRINTK_H */
diff --git a/xen/arch/riscv/include/asm/fixmap.h b/xen/arch/riscv/include/asm/fixmap.h
index 085d135c15..66a78bb19d 100644
--- a/xen/arch/riscv/include/asm/fixmap.h
+++ b/xen/arch/riscv/include/asm/fixmap.h
@@ -17,8 +17,12 @@
 #define FIX_PMAP_BEGIN (0) /* Start of PMAP */
 #define FIX_PMAP_END (FIX_PMAP_BEGIN + NUM_FIX_PMAP - 1) /* End of PMAP */
 #define FIX_MISC (FIX_PMAP_END + 1)  /* Ephemeral mappings of hardware */
-
+#ifdef CONFIG_EARLY_PRINTK
+#define FIX_CONSOLE (FIX_MISC + 1) /* Early UART mapping */
+#define FIX_LAST FIX_CONSOLE
+#else
 #define FIX_LAST FIX_MISC
+#endif
 
 #define FIXADDR_START FIXMAP_ADDR(0)
 #define FIXADDR_TOP FIXMAP_ADDR(FIX_LAST + 1)
diff --git a/xen/arch/riscv/include/asm/sbi.h b/xen/arch/riscv/include/asm/sbi.h
index 1952868e96..d043fc7632 100644
--- a/xen/arch/riscv/include/asm/sbi.h
+++ b/xen/arch/riscv/include/asm/sbi.h
@@ -75,13 +75,6 @@ struct sbiret sbi_ecall(unsigned long ext, unsigned long fid,
                         unsigned long arg2, unsigned long arg3,
                         unsigned long arg4, unsigned long arg5);
 
-/**
- * Writes given character to the console device.
- *
- * @param ch The data to be written to the console.
- */
-void sbi_console_putchar(int ch);
-
 void sbi_shutdown(void);
 
 /*
diff --git a/xen/arch/riscv/mm.c b/xen/arch/riscv/mm.c
index 610d111945..8480e61de2 100644
--- a/xen/arch/riscv/mm.c
+++ b/xen/arch/riscv/mm.c
@@ -76,6 +76,27 @@ stage1_pgtbl_nonroot[PGTBL_INITIAL_COUNT * PAGETABLE_ENTRIES];
 pte_t __section(".bss.page_aligned") __aligned(PAGE_SIZE)
 xen_fixmap[PAGETABLE_ENTRIES];
 
+#ifdef CONFIG_EARLY_PRINTK
+static void __init setup_early_uart_mapping(void)
+{
+    pte_t *pgtbl = stage1_pgtbl_root;
+    unsigned int i;
+
+    /* Add UART to the fixmap table. */
+    xen_fixmap[pt_index(0, EARLY_UART_VIRTUAL_ADDRESS)] =
+        paddr_to_pte(CONFIG_EARLY_UART_BASE_ADDRESS & PAGE_MASK,
+                     PAGE_HYPERVISOR_RW);
+
+    for ( i = HYP_PT_ROOT_LEVEL; i > 1; i-- )
+        pgtbl = (pte_t *)pte_to_paddr(
+            pgtbl[pt_index(i, FIXMAP_ADDR(0))]);
+
+    /* Map fixmap into the initial page tables. */
+    pgtbl[pt_index(1, FIXMAP_ADDR(0))] =
+        paddr_to_pte((paddr_t)xen_fixmap, PTE_TABLE);
+}
+#endif
+
 #define HANDLE_PGTBL(curr_lvl_num)                                          \
     index = pt_index(curr_lvl_num, page_addr);                              \
     if ( pte_is_valid(pgtbl[index]) )                                       \
@@ -243,18 +264,18 @@ void __init setup_fixmap_mappings(void)
         pte = &pte[pt_index(i, FIXMAP_ADDR(0))];
     }
 
-    BUG_ON(pte_is_valid(*pte));
-
-    tmp = paddr_to_pte(virt_to_maddr(&xen_fixmap), PTE_TABLE);
-    write_pte(pte, tmp);
+    if ( pte_is_valid(*pte) )
+        BUG_ON(pte_to_paddr(*pte) != virt_to_maddr(xen_fixmap));
+    else
+    {
+        tmp = paddr_to_pte(virt_to_maddr(xen_fixmap), PTE_TABLE);
+        write_pte(pte, tmp);
+    }
 
     RISCV_FENCE(rw, rw);
     sfence_vma();
 
-    /*
-     * We only need the zeroeth table allocated, but not the PTEs set, because
-     * set_fixmap() will set them on the fly.
-     */
+    /* Remaining fixmap entries are populated on demand by set_fixmap(). */
 }
 
 /*
@@ -314,6 +335,10 @@ void __init setup_initial_pagetables(void)
                           linker_end,
                           load_start);
 
+#ifdef CONFIG_EARLY_PRINTK
+    setup_early_uart_mapping();
+#endif
+
     if ( linker_start == load_start )
         return;
 
diff --git a/xen/arch/riscv/riscv64/Makefile b/xen/arch/riscv/riscv64/Makefile
index 3340058c08..a35968ead7 100644
--- a/xen/arch/riscv/riscv64/Makefile
+++ b/xen/arch/riscv/riscv64/Makefile
@@ -1 +1,2 @@
+obj-$(CONFIG_EARLY_PRINTK) += debug.o
 obj-y += head.o
diff --git a/xen/arch/riscv/riscv64/debug-8250.inc b/xen/arch/riscv/riscv64/debug-8250.inc
new file mode 100644
index 0000000000..5918e74cbd
--- /dev/null
+++ b/xen/arch/riscv/riscv64/debug-8250.inc
@@ -0,0 +1,51 @@
+/* SPDX-License-Identifier: GPL-2.0-only
+ *
+ * xen/arch/riscv/riscv64/debug-8250.inc
+ *
+ * 8250 specific debug code
+ *
+ * Copyright (c) 2013 Applied Micro.
+ * Copyright (c) 2026 Zheng Zhang.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ */
+
+#include <xen/8250-uart.h>
+
+/*
+ * UART wait UART to be ready to transmit
+ * xb: register which contains the UART base address
+ * c: scratch register
+ */
+.macro early_uart_ready xb c
+1:
+        lbu     \c, (UART_LSR << CONFIG_EARLY_UART_8250_REG_SHIFT)(\xb)
+        andi    \c, \c, UART_LSR_THRE
+        xori    \c, \c, UART_LSR_THRE
+        bnez    \c, 1b
+.endm
+
+/*
+ * UART transmit character
+ * xb: register which contains the UART base address
+ * wt: register which contains the character to transmit
+ */
+.macro early_uart_transmit xb wt
+        /* UART_THR transmit holding */
+        sb      \wt, (UART_THR << CONFIG_EARLY_UART_8250_REG_SHIFT)(\xb)
+.endm
+
+/*
+ * Local variables:
+ * mode: ASM
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/arch/riscv/riscv64/debug.S b/xen/arch/riscv/riscv64/debug.S
new file mode 100644
index 0000000000..4e7465e1d8
--- /dev/null
+++ b/xen/arch/riscv/riscv64/debug.S
@@ -0,0 +1,54 @@
+/* SPDX-License-Identifier: GPL-2.0-only
+ *
+ * xen/arch/riscv/riscv64/debug.S
+ *
+ * Wrapper for early printk
+ *
+ * Julien Grall <julien.grall@linaro.org>
+ * Copyright (c) 2013 Linaro Limited.
+ * Copyright (c) 2026 Zheng Zhang.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ */
+
+#include <asm/asm.h>
+#include <asm/early_printk.h>
+#include <asm/riscv_encoding.h>
+
+#include CONFIG_EARLY_PRINTK_INC
+
+.macro early_uart_base bs, c
+        li      \bs, CONFIG_EARLY_UART_BASE_ADDRESS
+        csrr    \c, CSR_SATP
+        beqz    \c, 1f
+        li      \bs, EARLY_UART_VIRTUAL_ADDRESS
+1:
+.endm
+
+/* Print the character in a0. */
+FUNC(early_putch)
+        early_uart_base t0, t1
+        early_uart_ready t0, t1
+        andi    a0, a0, 0xff
+        early_uart_transmit t0, a0
+        ret
+END(early_putch)
+
+/* Wait until both the transmit FIFO and shift register are empty. */
+FUNC(early_flush)
+        early_uart_base t0, t1
+1:
+        lbu     t1, (UART_LSR << CONFIG_EARLY_UART_8250_REG_SHIFT)(t0)
+        andi    t1, t1, (UART_LSR_THRE | UART_LSR_TEMT)
+        xori    t1, t1, (UART_LSR_THRE | UART_LSR_TEMT)
+        bnez    t1, 1b
+        ret
+END(early_flush)
diff --git a/xen/arch/riscv/sbi.c b/xen/arch/riscv/sbi.c
index 3576e26033..bca3ebdca5 100644
--- a/xen/arch/riscv/sbi.c
+++ b/xen/arch/riscv/sbi.c
@@ -72,11 +72,6 @@ static int sbi_err_map_xen_errno(int err)
     };
 }
 
-void sbi_console_putchar(int ch)
-{
-    sbi_ecall(SBI_EXT_0_1_CONSOLE_PUTCHAR, 0, ch, 0, 0, 0, 0, 0);
-}
-
 void sbi_shutdown(void)
 {
     sbi_ecall(SBI_EXT_0_1_SHUTDOWN, 0, 0, 0, 0, 0, 0, 0);
-- 
2.54.0


