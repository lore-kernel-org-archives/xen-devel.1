Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 210C8C44515
	for <xen-devel@archiver.kernel.org>; Mon, 20 Jul 2026 16:03:00 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1367166.1617053 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wlqSB-0002WN-DU; Mon, 20 Jul 2026 16:02:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1367166.1617053; Mon, 20 Jul 2026 16:02:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wlqSB-0002Vb-3T; Mon, 20 Jul 2026 16:02:51 +0000
Received: by outflank-mailman (input) for mailman id 1367166;
 Mon, 20 Jul 2026 16:02:49 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wlqS8-00028v-NL
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2026 16:02:48 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wlqS8-007AIH-3f
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2026 18:02:48 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a5e468a-e002-0a2a0a5209dd-0a2a4505d2c2-46
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 18:02:48 +0200
Received: from [209.85.221.42] (helo=mail-wr1-f42.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a5e46a7-4cb1-0a2a45050019-d155dd2aace0-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 18:02:48 +0200
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-47f703a9e5dso520767f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 09:02:47 -0700 (PDT)
Received: from fedora (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49563eee22esm31331765e9.1.2026.07.20.09.02.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jul 2026 09:02:46 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1784563367; x=1785168167; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hF0EPypo37qwTT5HP45kbII8Abg9/xZofbCDxXGst1A=;
        b=ElxYcvlglDoP6BCX3FjwxdcIOcdUZ1iwxqlsN3mkMzJeBaLnkeA6S4+KczUEnm07rH
         KUnfikERamzMYJZZO4nfqIOal7Wue22Ic1KVPQf4d0MHQwhpt3zT0jtl0UpGfrwHZxPQ
         lENIgGZ+/H40CabkNgIrZadx2OHUVSnnSnkW+VqpdncRGent3MnyPb7EozJ7oVCK1Qjp
         4m4CyCwJSzJXqEapc+d4PltVHihnrr2d3fzRXRAx/wXDE1741JvUMwgRLKi1fR0Y2fdJ
         AD2qqWxnGSOirXdP7qlfaJZXQgqZk/peSY8XLZymvTbZllw69ObgRsPlWcWv+Bo8tDbq
         Gj/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784563367; x=1785168167;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hF0EPypo37qwTT5HP45kbII8Abg9/xZofbCDxXGst1A=;
        b=o43C2D1SCOFuWzxH+Js/Z+stpaQSqDMqUQQJaE/cqVCMMKjTcLvQo0Ja4Qpj9yuoMe
         EYsO9lVwwx1taNyQ7D1dxju10A/NOOmw//B9IIYGYVAvlQwZLCqFwG2R+ecK+T8HdP4a
         muEsmaolFfLz1VK+kb88IVcQ1ySWetH9rtynV6ghumBF2cgtwsj7h/J2i9QJOxqpOsjP
         5PEOXQfdlDJwshZRNQy2lv93pbgPsQf938ofmoZcFxKszhCOR3iW3hBZnLfTKwXzBrZV
         e/PG1Tf0KfwhVxCa1NP1xW52zj/vvnE9UmSfOyTKtkHKNll5NidOxl4jxuwot1BhpF+Q
         KUvQ==
X-Gm-Message-State: AOJu0YxnwbTiviWIWvisHL2oMn8aT+xjdy80flpa0m1DZWVeV/wrAr0i
	BDWHXZnu0w9dR8j9iBrS42CPOtfYgUsS+5OFxolRZjWs+5e2Fj2WA7m6x7IhAA==
X-Gm-Gg: AfdE7cnPpnoE7MsTkmx34AE4RsTiX9kdSiX3KJielifJQwmRBZYcEGT9elVQTsAZ79B
	USVuGM5X8Sdi6Xdjh0T12wry3cRPpjq1tt7H/tA2iNgTlrwS36ye0LNEtxe6iwjMf6uhevhHrwK
	yHAKrfkt4c1Xdb1ClWFQRtdZVQld0yjuK8cQ0pB8oOgbTR0a+viCXyk5Sk4yFFD4vQSQD4Yq9py
	sIciz7cjhuaucI5/toDtNUjV4SFvjvoGu6KD8eZGIDEViZiTWJga2YEEb1tpwRqcGJtZS+9SVvW
	wdNppcYarx3sRBAiRHwTVQzMKf5s4c7wWGRM/5MXFqBQR5GGbD2bNRMsQAnhMXPDaZCiFofxFEp
	rtfAlM5Cm/ogt1A/eZIshE26OhU6zcJX84vZrBh0kq3yfj4ZZdHjKDnUKXVn7PQkExMTE41Qhh1
	aUL+VQtAGzd0/SYsjlyim7bKAgkkCmqJgB8a+SvZ+NCo1E8ak=
X-Received: by 2002:a7b:c344:0:b0:494:282:106c with SMTP id 5b1f17b1804b1-4954a3f5295mr124904515e9.16.1784563367334;
        Mon, 20 Jul 2026 09:02:47 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
	Baptiste Le Duc <baptiste.le-duc@vates.tech>,
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
Subject: [PATCH v1 12/17] xen/riscv: extend exception tables with type and data fields
Date: Mon, 20 Jul 2026 18:02:10 +0200
Message-ID: <1eb9050ff6632f91682151471440990bd718ed90.1784560663.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1784560663.git.oleksii.kurochko@gmail.com>
References: <cover.1784560663.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c201ff/1784563368-F52A32A1-5D3BFB3C/10/73395122804
X-purgate-type: spam
X-purgate-size: 10163

Extend the RISC-V exception table format to include a type and
auxiliary data field.

The existing format only supports simple fixups. Some use cases require
additional context from the fault (e.g. capturing trap information),
which cannot be expressed with the current EX_TYPE_FIXUP entries.

Introduce a generic ASM_EXTABLE_RAW() helper to describe entries with a
handler type and associated data. Reimplement ASM_EXTABLE() in terms of
it using EX_TYPE_FIXUP for compatibility.

Add EX_TYPE_TRAP_INFO to allow handlers to retrieve trap state
(sepc/scause/stval) and pass it to the fixup path. The data field is
used to encode which GPR contains a pointer to a struct trap_info.

Provide ASM_EXTABLE_TRAP_INFO() as a convenience wrapper for this case.

Also add gpr-num.h, providing symbolic GPR numbers for use in assembly
and inline asm. This is derived from Linux 6.16 with minor adjustments such
as using .irp instead of open-coding the same using a set of .equ.

Update the exception handling code to dispatch based on the entry type.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/arch/riscv/extable.c               | 60 ++++++++++++++++++++++++-
 xen/arch/riscv/include/asm/extable.h   | 62 ++++++++++++++++++--------
 xen/arch/riscv/include/asm/gpr-num.h   | 33 ++++++++++++++
 xen/arch/riscv/include/asm/processor.h |  2 +
 xen/arch/riscv/include/asm/traps.h     |  6 +++
 5 files changed, 143 insertions(+), 20 deletions(-)
 create mode 100644 xen/arch/riscv/include/asm/gpr-num.h

diff --git a/xen/arch/riscv/extable.c b/xen/arch/riscv/extable.c
index 77e5e9e89439..e0ced0537182 100644
--- a/xen/arch/riscv/extable.c
+++ b/xen/arch/riscv/extable.c
@@ -7,8 +7,10 @@
 #include <xen/sort.h>
 #include <xen/virtual_region.h>
 
+#include <asm/csr.h>
 #include <asm/extable.h>
 #include <asm/processor.h>
+#include <asm/traps.h>
 
 #define EX_FIELD(ptr, field) ((unsigned long)&(ptr)->field + (ptr)->field)
 
@@ -33,6 +35,12 @@ static void __init cf_check swap_ex(void *a, void *b)
 
     x->fixup = y->fixup + delta;
     y->fixup = tmp.fixup - delta;
+
+    x->type = y->type;
+    y->type = tmp.type;
+
+    x->data = y->data;
+    y->data = tmp.data;
 }
 
 static int cf_check cmp_ex(const void *a, const void *b)
@@ -60,6 +68,40 @@ static void ex_handler_fixup(const struct exception_table_entry *ex,
     regs->sepc = ex_fixup(ex);
 }
 
+static inline unsigned long regs_get_gpr(struct cpu_user_regs *regs,
+                                         unsigned int offset)
+{
+    /*
+     * The GPR number -> offset arithmetic below relies on x0..x31 being
+     * laid out at the start of struct cpu_user_regs in architectural
+     * order.
+     */
+    BUILD_BUG_ON(offsetof(struct cpu_user_regs, ra) !=
+                 sizeof(unsigned long));
+    BUILD_BUG_ON(offsetof(struct cpu_user_regs, t6) !=
+                 31 * sizeof(unsigned long));
+
+    if ( unlikely(!offset || (offset > MAX_REG_OFFSET)) )
+        return 0;
+
+    return *(unsigned long *)((unsigned long)regs + offset);
+}
+
+static void ex_handler_trap_info(const struct exception_table_entry *ex,
+                                 struct cpu_user_regs *regs)
+{
+    struct trap_info *trap_info =
+        (struct trap_info *)regs_get_gpr(regs, ex->data * sizeof(unsigned long));
+
+    BUG_ON(!trap_info);
+
+    trap_info->sepc = csr_read(CSR_SEPC);
+    trap_info->scause = csr_read(CSR_SCAUSE);
+    trap_info->stval = csr_read(CSR_STVAL);
+
+    regs->sepc = ex_fixup(ex);
+}
+
 bool fixup_exception(struct cpu_user_regs *regs)
 {
     unsigned long pc = regs->sepc;
@@ -78,7 +120,23 @@ bool fixup_exception(struct cpu_user_regs *regs)
     if ( !ex )
         return false;
 
-    ex_handler_fixup(ex, regs);
+    switch ( ex->type )
+    {
+    case EX_TYPE_FIXUP:
+        ex_handler_fixup(ex, regs);
+        break;
+
+    case EX_TYPE_TRAP_INFO:
+        ex_handler_trap_info(ex, regs);
+        break;
+
+    default:
+        printk(XENLOG_ERR
+               "Unsupported exception table entry type %u for pc %#lx\n",
+               ex->type, pc);
+
+        return false;
+    }
 
     return true;
 }
diff --git a/xen/arch/riscv/include/asm/extable.h b/xen/arch/riscv/include/asm/extable.h
index c0128a91818f..287ce962b5cf 100644
--- a/xen/arch/riscv/include/asm/extable.h
+++ b/xen/arch/riscv/include/asm/extable.h
@@ -3,17 +3,24 @@
 #ifndef ASM__RISCV__ASM_EXTABLE_H
 #define ASM__RISCV__ASM_EXTABLE_H
 
+#include <asm/gpr-num.h>
+
+#define EX_TYPE_FIXUP 0
+#define EX_TYPE_TRAP_INFO 1
+
 #ifdef __ASSEMBLER__
 
-#define ASM_EXTABLE(insn, fixup) \
-    .pushsection .ex_table, "a"; \
-    .balign     4;               \
-    .word       (insn) - .;      \
-    .word       (fixup) - .;     \
-    .popsection
+#define ASM_EXTABLE_RAW(insn, fixup, type, data)    \
+    .pushsection .ex_table, "a";                    \
+    .balign     4;                                  \
+    .long       ((insn) - .);                       \
+    .long       ((fixup) - .);                      \
+    .short      (type);                             \
+    .short      (data);                             \
+    .popsection;
 
-.macro asm_extable, insn, fixup
-    ASM_EXTABLE(\insn, \fixup)
+.macro _asm_extable, insn, fixup
+    ASM_EXTABLE_RAW(\insn, \fixup, EX_TYPE_FIXUP, 0)
 .endm
 
 #else /* __ASSEMBLER__ */
@@ -23,20 +30,36 @@
 
 struct cpu_user_regs;
 
-#define ASM_EXTABLE(insn, fixup)      \
-    ".pushsection .ex_table, \"a\"\n" \
-    ".balign    4\n"                  \
-    ".word      (" #insn " - .)\n"    \
-    ".word      (" #fixup " - .)\n"   \
+#define ASM_EXTABLE_RAW(insn, fixup, type, data)    \
+    ".pushsection .ex_table, \"a\"\n"               \
+    ".balign    4\n"                                \
+    ".long      ((" insn ") - .)\n"                 \
+    ".long      ((" fixup ") - .)\n"                \
+    ".short      (" type ")\n"                      \
+    ".short      (" data ")\n"                      \
     ".popsection\n"
 
+#define ASM_EXTABLE(insn, fixup)    \
+    ASM_EXTABLE_RAW(#insn, #fixup, __stringify(EX_TYPE_FIXUP), "0")
+
+#define EX_TRAP_INFO_REG(gpr)   \
+    "(.L_gpr_num_" #gpr ")"
+
+#define ASM_EXTABLE_TRAP_INFO(insn, fixup, data)                    \
+    DEFINE_ASM_GPR_NUMS                                             \
+    ASM_EXTABLE_RAW(#insn, #fixup, __stringify(EX_TYPE_TRAP_INFO),  \
+                    EX_TRAP_INFO_REG(data))
+
 /*
- * The exception table consists of pairs of relative offsets: the first
- * is the relative offset to an instruction that is allowed to fault,
- * and the second is the relative offset at which the program should
- * continue. No general-purpose registers are modified by the exception
- * handling mechanism itself, so it is up to the fixup code to handle
- * any necessary state cleanup.
+ * Each exception table entry consists of two relative offsets and a
+ * handler description: `insn` is the relative offset to an instruction
+ * that is allowed to fault, `fixup` is the relative offset at which the
+ * program should continue, `type` selects how the exception is handled
+ * (EX_TYPE_*), and `data` holds auxiliary information for the handler
+ * (e.g. for EX_TYPE_TRAP_INFO, the number of the GPR that contains a
+ * pointer to a struct trap_info). No general-purpose registers are
+ * modified by the exception handling mechanism itself, so it is up to
+ * the fixup code to handle any necessary state cleanup.
  *
  * The exception table and fixup code live out of line with the main
  * instruction path. This means when everything is well, we don't even
@@ -45,6 +68,7 @@ struct cpu_user_regs;
  */
 struct exception_table_entry {
     int32_t insn, fixup;
+    uint16_t type, data;
 };
 
 extern struct exception_table_entry __start___ex_table[];
diff --git a/xen/arch/riscv/include/asm/gpr-num.h b/xen/arch/riscv/include/asm/gpr-num.h
new file mode 100644
index 000000000000..1578f55cbd97
--- /dev/null
+++ b/xen/arch/riscv/include/asm/gpr-num.h
@@ -0,0 +1,33 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef RISCV_GPR_NUM_H
+#define RISCV_GPR_NUM_H
+
+/* GPR ABI names, in register-number order (x0 .. x31). */
+#define GPR_ABI_NAMES                   \
+    zero, ra, sp, gp, tp, t0, t1, t2,   \
+    s0, s1, a0, a1, a2, a3, a4, a5,     \
+    a6, a7, s2, s3, s4, s5, s6, s7,     \
+    s8, s9, s10, s11, t3, t4, t5, t6
+
+#ifdef __ASSEMBLER__
+
+    .equ    .L_gpr_num, 0
+    .irp    name, GPR_ABI_NAMES
+    .equ    .L_gpr_num_\name, .L_gpr_num
+    .equ    .L_gpr_num, .L_gpr_num + 1
+    .endr
+
+#else /* __ASSEMBLER__ */
+
+#include <xen/stringify.h>
+
+#define DEFINE_ASM_GPR_NUMS                         \
+"   .equ    .L_gpr_num, 0\n"                        \
+"   .irp    name, " __stringify(GPR_ABI_NAMES) "\n" \
+"   .equ    .L_gpr_num_\\name, .L_gpr_num\n"        \
+"   .equ    .L_gpr_num, .L_gpr_num + 1\n"           \
+"   .endr\n"
+
+#endif /* __ASSEMBLER__ */
+
+#endif /* RISCV_GPR_NUM_H */
diff --git a/xen/arch/riscv/include/asm/processor.h b/xen/arch/riscv/include/asm/processor.h
index 6b89df4a2d4f..a5ccfa61bb9f 100644
--- a/xen/arch/riscv/include/asm/processor.h
+++ b/xen/arch/riscv/include/asm/processor.h
@@ -54,6 +54,8 @@ struct cpu_user_regs
     unsigned long pregs;
 };
 
+#define MAX_REG_OFFSET offsetof(struct cpu_user_regs, t6)
+
 /* TODO: need to implement */
 #define cpu_to_core(cpu)   0
 #define cpu_to_socket(cpu) 0
diff --git a/xen/arch/riscv/include/asm/traps.h b/xen/arch/riscv/include/asm/traps.h
index 21fa3c3259b3..8d4ab664bca9 100644
--- a/xen/arch/riscv/include/asm/traps.h
+++ b/xen/arch/riscv/include/asm/traps.h
@@ -7,6 +7,12 @@
 
 #ifndef __ASSEMBLER__
 
+struct trap_info {
+    register_t sepc;
+    register_t scause;
+    register_t stval;
+};
+
 void do_trap(struct cpu_user_regs *cpu_regs);
 void handle_trap(void);
 void trap_init(void);
-- 
2.54.0


