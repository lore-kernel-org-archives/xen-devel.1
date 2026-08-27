Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B310C61DC4
	for <xen-devel@archiver.kernel.org>; Thu, 27 Aug 2026 15:22:18 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1400948.1636682 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzbve-0002N5-9r; Thu, 27 Aug 2026 15:22:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1400948.1636682; Thu, 27 Aug 2026 15:22:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzbvd-0002JO-Ug; Thu, 27 Aug 2026 15:22:09 +0000
Received: by outflank-mailman (input) for mailman id 1400948;
 Thu, 27 Aug 2026 15:22:07 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wzbvb-0001rn-N1
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2026 15:22:07 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wzbvb-003NwR-3C
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2026 17:22:07 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a905614-8faa-0a2a0a5109dd-0a2a450ad1c4-38
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 17:22:07 +0200
Received: from [209.85.128.47] (helo=mail-wm1-f47.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a90561e-f2d2-0a2a450a0019-d155802fe9a1-3
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 17:22:07 +0200
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-499840a2575so14645945e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 08:22:06 -0700 (PDT)
Received: from fedora (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49b4b2d6b30sm57441155e9.14.2026.08.27.08.22.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Aug 2026 08:22:05 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1787844126; x=1788448926; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2N6LBS4AguM6wfsTAnPZmCDQNz8fb1CS3bfzOT9MwgA=;
        b=Qdv18KoVWzS0MZlAwrMNSzfDIjJy8dAvyAPN1R58WTbiyflVRF98V7JYdDLkG0uyJj
         UfFa1eizQ50t/NpJXC4AC8hVcP7UNgMXYuq4HyZ+yw8wtJWQ+8bpo9H3cOWsYv46roXZ
         4xbwsWNphvlOi1awKFXJT5GJmn1T/u5zV9PKyijGMGMVtwLOELgJXRTzekNrWdK6KZQA
         SSxMQAsnnX38+cLZ6dxKRSlmUwOzRBdWW+7WVIe9DtdCXQCto+UcREYjJbxSumm94tYO
         cJqv3XRGh2Md5UROBBNrBapfpT/N8PVsVqH1dcStAPBjvzsvubHwQ+jFcH+v0btVgzol
         AC+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787844126; x=1788448926;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2N6LBS4AguM6wfsTAnPZmCDQNz8fb1CS3bfzOT9MwgA=;
        b=RttG/UaM2OnR8Jj5TR3kjf/wbMSwA2bhhESQW+W6WyDnRn4w6zp7JGXSUIJiUxw2/9
         i8sNXESma0xjdXnm73axshohhpVDjBbfLAWzWsDz44s5dMahfgrwlQrvVrf1QShBNyn1
         joG9ee8j7/WHxVvaEeZD38ioCGPZiiMhO2ByiwS3LajUAhWm0/P5c0crxvW9tlfQT3C0
         ziUT/WGGzeYOaQjQKEP7y9Oq8uTuh/MsExr6r8Ml1E+s3pndyiKx9zyrrDGAh8zjLTth
         L0KtXxH5vF22cS7eQxI6npl6sSPz5VeUMWJYoaPTRZcTy9rhKUNM4Y5WYOWfreUg+4I7
         yV6g==
X-Gm-Message-State: AFuF++ltRGjLl8YGrCzeBMiTDRTjWWgxa/U+RRiXe29cX7bgYkaJ9w5e
	RUlK/WRvjeR29KFxj+LTtYEN/tmaIB1EsOOtBo2dQUMA2OHcnvs9wB/+UpWm1A==
X-Gm-Gg: AR+sD13sfAHIrSJgh7e26WhKpeORHVW3RTz5Y9ulMrWzhNwswCDFPyTR2Eie3dmiOnr
	OV0VcQqBtc/c+QC+Fs87XUadQMELHG50dUqFdIyemfQtQZb85EgFdAa4kDMnzrDz0D6zM18BZ2q
	dAgdH6O6zHfwFVbuCllUYMqxn9FmaqXvD9bJK89PWonttmEdBumZnkGEyhqm8J1Tq1iMMJvV/Zn
	YFCVWGOap7s0K8ydG6f7X0sODvzPPR6jP1yhBiv6BzZejj8p7u85XVP9MlZTqa2ioCWSa+sZ2Jb
	H83iU4cyMv7QAwnAcPnHsSHGSLX+Ob69gZBEfsiW8amamSh1n/jjQaVUiMaHgV7hmx1KQyeDw1m
	D9S9VrOVWYwJWXQW9P2uFCE30wiEc23KeGqnonLJkGpD6DNKbp/Jv4u0OPTLWqKQChsUzWpUZsz
	F76Nn4/b36K9gx8cvaMfpCr0AS3PVXJ0Kp9iYpNw46qF2W9+FvK+qtMC0rAu8bCuXrfr46AxmJI
	pANs70eRNp5lKlwSXYvQ0qND9sHPNFL
X-Received: by 2002:a05:600c:19c9:b0:499:5a50:b022 with SMTP id 5b1f17b1804b1-499dc6f5916mr184759595e9.3.1787844126241;
        Thu, 27 Aug 2026 08:22:06 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
	Baptiste Le Duc <baptiste.le-duc@vates.tech>,
	Zheng Zhang <zhangzheng@iscas.ac.cn>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2 16/39] xen/riscv: extend exception tables with type and data fields
Date: Thu, 27 Aug 2026 17:21:00 +0200
Message-ID: <8aef9dfabe1d485abe4c48fd7499e09dbd8e0c27.1787838835.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1787838835.git.oleksii.kurochko@gmail.com>
References: <cover.1787838835.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-4011c0/1787844127-536D6CFC-5493F82D/10/73395122804
X-purgate-type: spam
X-purgate-size: 13807

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
Changes in v2:
 - regs_get_gpr(): take a GPR number instead of a byte offset, dropping the
   multiplication at the call site. A non-multiple-of-8 offset is now
   unrepresentable.
 - regs_get_gpr(): ASSERT(num < 32) instead of a range check returning 0,
   which isn't usable as an error indicator. No num == 0 check: reading x0
   is harmless out of context, and a NULL trap_info is caught by the
   existing BUG_ON() where the dereference happens.
 - regs_get_gpr(): index the register frame as an array, constify regs and
   drop the pointless inline.
 - Anchor the first BUILD_BUG_ON() at offsetof(..., zero) == 0 rather than
   at ra, pinning both ends of the x0..x31 range.
 - Drop MAX_REG_OFFSET; asm/processor.h is no longer touched by this patch.
 - ex_handler_trap_info(): use regs->sepc and the cause passed down from
   do_trap() instead of re-reading CSR_SEPC/CSR_SCAUSE; fixup_exception()
   gains a cause parameter. stval stays a CSR read as do_trap() doesn't
   read it.
 - asm/extable.h: revert the .word -> .long change, the extra parens and the
   stray semicolon after .popsection; use .half for the new type and data
   fields to match .word.
 - Make GPR_LIST() the single source of the ABI-name -> register-number
   mapping, and check struct cpu_user_regs against it at build time, so the
   two can no longer diverge.
 - Add the explanatory comment above sturc cpu_user_regs to explain an
   ordering of x0-x31 registers.
---
---
 xen/arch/riscv/extable.c               | 70 +++++++++++++++++++++++++-
 xen/arch/riscv/include/asm/extable.h   | 64 +++++++++++++++--------
 xen/arch/riscv/include/asm/gpr-num.h   | 37 ++++++++++++++
 xen/arch/riscv/include/asm/processor.h | 14 +++++-
 xen/arch/riscv/include/asm/traps.h     |  6 +++
 xen/arch/riscv/traps.c                 |  2 +-
 6 files changed, 169 insertions(+), 24 deletions(-)
 create mode 100644 xen/arch/riscv/include/asm/gpr-num.h

diff --git a/xen/arch/riscv/extable.c b/xen/arch/riscv/extable.c
index 5b89c4278c65..6470198d0117 100644
--- a/xen/arch/riscv/extable.c
+++ b/xen/arch/riscv/extable.c
@@ -6,8 +6,10 @@
 #include <xen/sort.h>
 #include <xen/virtual_region.h>
 
+#include <asm/csr.h>
 #include <asm/extable.h>
 #include <asm/processor.h>
+#include <asm/traps.h>
 
 #define EX_FIELD(ptr, field) ((unsigned long)&(ptr)->field + (ptr)->field)
 
@@ -32,6 +34,12 @@ static void __init cf_check swap_ex(void *a, void *b)
 
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
@@ -59,7 +67,49 @@ static void ex_handler_fixup(const struct exception_table_entry *ex,
     regs->sepc = ex_fixup(ex);
 }
 
-bool fixup_exception(struct cpu_user_regs *regs)
+#define CHECK_GPR_INDEX(num, name)                      \
+    BUILD_BUG_ON(offsetof(struct cpu_user_regs, name)   \
+                 != (num) * sizeof(unsigned long));
+
+static unsigned long regs_get_gpr(const struct cpu_user_regs *regs,
+                                  unsigned int num)
+{
+    /*
+     * The GPR number -> struct index mapping below relies on x0..x31 being
+     * laid out at the start of struct cpu_user_regs in architectural order,
+     * matching the register numbers GPR_LIST() hands to the assembler.
+     */
+    GPR_LIST(CHECK_GPR_INDEX)
+
+    ASSERT(num < 32);
+
+    return ((const unsigned long *)regs)[num];
+}
+
+#undef CHECK_GPR_INDEX
+
+static void ex_handler_trap_info(const struct exception_table_entry *ex,
+                                 struct cpu_user_regs *regs,
+                                 unsigned long cause)
+{
+    struct trap_info *trap_info =
+        (struct trap_info *)regs_get_gpr(regs, ex->data);
+
+    BUG_ON(!trap_info);
+
+    /*
+     * Only stval still needs a CSR read: sepc and scause were already
+     * captured by the trap entry path and do_trap() respectively. Latch
+     * trap_info->sepc before regs->sepc is pointed at the fixup code.
+     */
+    trap_info->sepc = regs->sepc;
+    trap_info->scause = cause;
+    trap_info->stval = csr_read(CSR_STVAL);
+
+    regs->sepc = ex_fixup(ex);
+}
+
+bool fixup_exception(struct cpu_user_regs *regs, unsigned long cause)
 {
     unsigned long pc = regs->sepc;
     const struct virtual_region *region = find_text_region(pc);
@@ -77,7 +127,23 @@ bool fixup_exception(struct cpu_user_regs *regs)
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
+        ex_handler_trap_info(ex, regs, cause);
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
index c0128a91818f..7378f86e7eea 100644
--- a/xen/arch/riscv/include/asm/extable.h
+++ b/xen/arch/riscv/include/asm/extable.h
@@ -3,17 +3,24 @@
 #ifndef ASM__RISCV__ASM_EXTABLE_H
 #define ASM__RISCV__ASM_EXTABLE_H
 
+#include <asm/gpr-num.h>
+
+#define EX_TYPE_FIXUP       0
+#define EX_TYPE_TRAP_INFO   1
+
 #ifdef __ASSEMBLER__
 
-#define ASM_EXTABLE(insn, fixup) \
-    .pushsection .ex_table, "a"; \
-    .balign     4;               \
-    .word       (insn) - .;      \
-    .word       (fixup) - .;     \
+#define ASM_EXTABLE_RAW(insn, fixup, type, data)    \
+    .pushsection .ex_table, "a";                    \
+    .balign     4;                                  \
+    .word       (insn) - .;                         \
+    .word       (fixup) - .;                        \
+    .half       (type);                             \
+    .half       (data);                             \
     .popsection
 
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
+    ".word      (" insn ") - .\n"                   \
+    ".word      (" fixup ") - .\n"                  \
+    ".half      (" type ")\n"                       \
+    ".half      (" data ")\n"                       \
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
@@ -45,14 +68,15 @@ struct cpu_user_regs;
  */
 struct exception_table_entry {
     int32_t insn, fixup;
+    uint16_t type, data;
 };
 
 extern struct exception_table_entry __start___ex_table[];
 extern struct exception_table_entry __stop___ex_table[];
 
 void sort_exception_tables(void);
-bool fixup_exception(struct cpu_user_regs *regs);
+bool fixup_exception(struct cpu_user_regs *regs, unsigned long cause);
 
-#endif /* __ASSEMBLY__ */
+#endif /* __ASSEMBLER__ */
 
 #endif /* ASM__RISCV__ASM_EXTABLE_H */
diff --git a/xen/arch/riscv/include/asm/gpr-num.h b/xen/arch/riscv/include/asm/gpr-num.h
new file mode 100644
index 000000000000..3b97a72e6c30
--- /dev/null
+++ b/xen/arch/riscv/include/asm/gpr-num.h
@@ -0,0 +1,37 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef RISCV_GPR_NUM_H
+#define RISCV_GPR_NUM_H
+
+/*
+ * GPRs by ABI name, together with their register number (x0 .. x31).
+ *
+ * This is the single source of truth for the mapping: it generates the
+ * .L_gpr_num_<name> assembler symbols used to turn a register name emitted
+ * by the compiler into a register number, and struct cpu_user_regs is
+ * checked against it at build time (see regs_get_gpr()). Neither list can
+ * therefore be changed without the other.
+ */
+#define GPR_LIST(x)                                 \
+    x(0,  zero) x(1,  ra)  x(2,  sp)  x(3,  gp)     \
+    x(4,  tp)   x(5,  t0)  x(6,  t1)  x(7,  t2)     \
+    x(8,  s0)   x(9,  s1)  x(10, a0)  x(11, a1)     \
+    x(12, a2)   x(13, a3)  x(14, a4)  x(15, a5)     \
+    x(16, a6)   x(17, a7)  x(18, s2)  x(19, s3)     \
+    x(20, s4)   x(21, s5)  x(22, s6)  x(23, s7)     \
+    x(24, s8)   x(25, s9)  x(26, s10) x(27, s11)    \
+    x(28, t3)   x(29, t4)  x(30, t5)  x(31, t6)
+
+#ifdef __ASSEMBLER__
+
+#define GPR_NUM_EQU(num, name)  .equ .L_gpr_num_##name, num;
+GPR_LIST(GPR_NUM_EQU)
+#undef GPR_NUM_EQU
+
+#else /* __ASSEMBLER__ */
+
+#define GPR_NUM_EQU(num, name)  ".equ .L_gpr_num_" #name ", " #num "\n"
+#define DEFINE_ASM_GPR_NUMS     GPR_LIST(GPR_NUM_EQU)
+
+#endif /* __ASSEMBLER__ */
+
+#endif /* RISCV_GPR_NUM_H */
diff --git a/xen/arch/riscv/include/asm/processor.h b/xen/arch/riscv/include/asm/processor.h
index b1745c107100..e7b0f2321a0e 100644
--- a/xen/arch/riscv/include/asm/processor.h
+++ b/xen/arch/riscv/include/asm/processor.h
@@ -12,7 +12,19 @@
 
 #ifndef __ASSEMBLER__
 
-/* On stack VCPU state */
+/*
+ * On stack VCPU state.
+ *
+ * x0..x31 must remain at the start of this structure, in architectural
+ * register-number order: code which resolves a register number to its saved
+ * value indexes this structure directly (instruction emulation via
+ * REG_PTR() from asm/riscv_encoding.h, exception table fixups via
+ * regs_get_gpr()). ->zero therefore has to stay at offset 0 and must always
+ * read as 0, since it supplies the value of x0 when x0 is used as a source
+ * operand. The layout is checked against GPR_LIST() at build time; see
+ * regs_get_gpr() in extable.c. Do not reorder these fields or insert
+ * anything between them.
+ */
 struct cpu_user_regs
 {
     unsigned long zero;
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
diff --git a/xen/arch/riscv/traps.c b/xen/arch/riscv/traps.c
index 093d81e2d803..11a6fa1bc942 100644
--- a/xen/arch/riscv/traps.c
+++ b/xen/arch/riscv/traps.c
@@ -217,7 +217,7 @@ void do_trap(struct cpu_user_regs *cpu_regs)
             break;
         }
 
-        if ( fixup_exception(cpu_regs) )
+        if ( fixup_exception(cpu_regs, cause) )
             break;
 
         fallthrough;
-- 
2.55.0


