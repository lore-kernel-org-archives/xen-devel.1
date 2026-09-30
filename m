Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0DA3CA5FCB
	for <xen-devel@archiver.kernel.org>; Wed, 30 Sep 2026 16:24:30 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1437549.1656517 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBx6R-0004IT-PT; Wed, 30 Sep 2026 16:24:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1437549.1656517; Wed, 30 Sep 2026 16:24:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBx6R-0004I6-Lt; Wed, 30 Sep 2026 16:24:19 +0000
Received: by outflank-mailman (input) for mailman id 1437549;
 Wed, 30 Sep 2026 16:24:18 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xBx6Q-0003x7-IV
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2026 16:24:18 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xBx6P-00GhSc-Fo
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2026 18:24:17 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6abd37a6-bab6-0a2a0a5309dd-0a2a4501b0cc-28
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 18:24:17 +0200
Received: from [74.125.225.140] (helo=mail-wm2-f12.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6abd37b1-5984-0a2a45010019-4a7de18caead-3
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 18:24:17 +0200
Received: by mail-wm2-f12.google.com with SMTP id
 5b1f17b1804b1-49fff6f0f87so28361075e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 09:24:17 -0700 (PDT)
Received: from fedora (user-109-243-71-234.play-internet.pl. [109.243.71.234])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a01cd43e66sm14620485e9.2.2026.09.30.09.24.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Sep 2026 09:24:15 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1790785457; x=1791390257; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h6p22y/TU0N97lNSaxpm7Mkih9ikwlnvqIiwklPqahY=;
        b=HgaQj/4uzrA7LCebG3/MUDaIHCwylTnYmbjrUAJl2rtujuMjHcz0BxSmpuXhEIMnZx
         WGOKOHy+vfm5uP7grMixG0C901JFB5hKolIU1b5s8a8Ecxf8TblbU6IFjGyyEhaaNTvG
         u6LCOaVCImlNcw+e07E1NvseFkwonzyk5Sbs8Wr8PDbZFeFrSyqtNkCT836ZQkZ8ZLyE
         zKbVs2w6kp5ZU/zZYECh7pp22jvYJlTWJBHVOim6W7qkRryJt6fjYaJ2pgsmqs2sOoIw
         WeFvLeJGFUqLeY0C3fsZAcOAj25CVoQSjqIaRefBXddQ2lZR7oVIg7PH0ICDpy9cTcyr
         uZQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790785457; x=1791390257;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=h6p22y/TU0N97lNSaxpm7Mkih9ikwlnvqIiwklPqahY=;
        b=VRRAAlN/UUgQOihmgSXcf6wO/aGp8mc4h2xXcRtJyLWQzWPA6FSvHnIXTl5gzcpCo+
         LNoXdHiHrM/nG9fYySfuaJQt7ki/RDUx+iZzL1GCGAsJJPk2o+rJjtfPacjNVYJkK5RL
         8gDgTAfBVvr93lHK9SR1sOtHscW3HlfIZAvmwu4HBq6flLFPIT7Tx2t/ext2ELC7hfG0
         fFmy6/MV2MXxzefqcPSDZk0O/EWpS29mb5Lu/BkTO6/6mHygAvg7olhavdERlNtlg9i5
         jnMbCaCgo+Jclf9UQNleKRB/U/5cRXpac8CdJiklpWTFt2z7X8CgsOD7T7SgNFv3sZEL
         2hAQ==
X-Gm-Message-State: AFuF++kzNDxqZILziHxUm23rptM8wAaRyJ7tvunFCNGrsc2qt54RbBhO
	wvMTcQtx0DbhX/ydiyjAijYvz5ud/ST4OTKFqZOk5TqJu8qL9MIXa8qkKsFi5w==
X-Gm-Gg: AYBFou2jK4Md0mB+/xTpEpQz4Io7qIG+hkTX2S22UeRHAHU+AtebRbWuYBZEKIuPr5R
	Ht1zf9JsKSqrV/wtX7J2gnbN+K1LCpYW6UqVDImD+QFZN/eISFQD7gV7fpQ/MIu4VVYCXlElfnO
	nHNI4iraXj0D/fCubzfccegXqOooREChh2aXcBmzi1PKxTLGXOlxJWmpUDOJYcEZucp1yJrAaEM
	VigagWF8VGuLppoFSBB8Ql+2PgwGFipmlP/7jepD4f/I3EqydXMFQKPXVm7YJ9KurkN9UqqQoT5
	eWvgwuMpAs/cut6ZrCsMAOqV0DP01e3NGWV81AkTO5BPN3IO/eOJVtZawrIfRQu5zvSBOq7jJXw
	hmiRtBxthL/4bDnWzgd4/8aWnK/MCoIY4LlIOCRsCzBWRyzLVWzl1stZZsWkaHmRc4s9pkiSu+6
	oCcALtU3+vI0rbCHOAnM0gaAfn459CTTxwOurb6K40StEpI89KZ09gIEz1VIWF+V0GsJk5IbJNp
	g251FoxUT0fw75REKFJdaUhrtqSX4qQtlOit7sr17tPdD5gH24=
X-Received: by 2002:a05:600c:1c0d:b0:49c:fa21:1c81 with SMTP id 5b1f17b1804b1-4a01aff36b2mr38760015e9.22.1790785456607;
        Wed, 30 Sep 2026 09:24:16 -0700 (PDT)
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
Subject: [PATCH v3 15/39] xen/riscv: extend exception tables with type and data fields
Date: Wed, 30 Sep 2026 18:23:34 +0200
Message-ID: <8c1c0c2adf56a395b6419335161da9f11fc827c5.1790779209.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1790779209.git.oleksii.kurochko@gmail.com>
References: <cover.1790779209.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d62444/1790785457-BC359757-9ADD436A/10/73395122804
X-purgate-type: spam
X-purgate-size: 20210

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
Provide ASM_EXTABLE_TRAP_INFO() as a convenience wrapper for this case,
and pass the trap cause down to fixup_exception() for it.

Also add gpr-num.h, providing symbolic GPR numbers for use in assembly
and inline asm. It is derived from Linux 6.16, with the register list
turned into a GPR_LIST() macro instead of being open-coded with .irp, so
that it can be used from C as well.

Resolving a GPR number to the saved value of the register relies on
struct cpu_user_regs holding x0..x31 contiguously and in register-number
order. Add regs_gpr_ptr() for that, and check the layout against
GPR_LIST() at build time. The block doesn't have to be at the start of
the structure, so anchor REG_PTR() at ->zero too rather than at the
structure itself.

Update the exception handling code to dispatch based on the entry type.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in v3:
 - Update the commit message.
 - Keep the name of the asm_extable assembler macro: renaming it to
   _asm_extable was unrelated to this patch.
 - Replace regs_get_gpr() in extable.c with regs_gpr_ptr() in asm/regs.h,
   returning where the register's value is saved rather than the value
   itself, so that a single helper serves code which reads a guest register
   as well as code which writes one. Anchor the array access at
   &regs->zero rather than casting regs itself, matching the relaxed
   layout requirement below, and bound the index with array_index_nospec()
   so that release builds, where the ASSERT() is compiled out, cannot read
   past the register frame. Add NR_GPRS instead of open-coding 32.
 - Move the layout BUILD_BUG_ON()s out of regs_get_gpr() into
   build_assertions() in domain.c, so that they no longer sit in one
   particular consumer of the mapping.
 - Anchor those checks at offsetof(struct cpu_user_regs, zero) rather than
   at offset 0: the x0..x31 block only has to be contiguous and in
   register-number order, it no longer has to sit at the start of the
   structure. Update the comment above struct cpu_user_regs accordingly,
   keeping the "->zero must read as 0" requirement as a separate point.
 - REG_PTR(): anchor at &regs->zero for the same reason.
 - gpr-num.h: move the part of the comment describing the generation of the
   .L_gpr_num_<name> symbols down to the construct which actually generates
   them; GPR_LIST() itself has other users.
 - gpr-num.h: emit the separator ahead of each list entry instead of after
   it, so that the expansion doesn't end with one and whatever follows a use
   of the list has to supply its own; ASM_EXTABLE_TRAP_INFO() supplies the
   "\n" it needs.
 - gpr-num.h: state in the file header what was changed compared to the
   Linux original.
 - asm/extable.h: no functional change, put EX_TRAP_INFO_REG() on a single
   line and reflow the comment describing the exception table entry format.
 - Drop BUG_ON() in ex_handler_trap_info() as trap_info pointer should be
   guaranteed properly filled by compilation process.
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
 xen/arch/riscv/domain.c                     | 22 ++++++++
 xen/arch/riscv/extable.c                    | 48 +++++++++++++++-
 xen/arch/riscv/include/asm/extable.h        | 61 ++++++++++++++-------
 xen/arch/riscv/include/asm/gpr-num.h        | 53 ++++++++++++++++++
 xen/arch/riscv/include/asm/processor.h      | 14 ++++-
 xen/arch/riscv/include/asm/regs.h           | 23 +++++++-
 xen/arch/riscv/include/asm/riscv_encoding.h |  7 ++-
 xen/arch/riscv/include/asm/traps.h          |  6 ++
 xen/arch/riscv/traps.c                      |  2 +-
 9 files changed, 210 insertions(+), 26 deletions(-)
 create mode 100644 xen/arch/riscv/include/asm/gpr-num.h

diff --git a/xen/arch/riscv/domain.c b/xen/arch/riscv/domain.c
index fd21cb1789e6..f60f871aba98 100644
--- a/xen/arch/riscv/domain.c
+++ b/xen/arch/riscv/domain.c
@@ -12,6 +12,7 @@
 #include <asm/cpufeature.h>
 #include <asm/csr.h>
 #include <asm/current.h>
+#include <asm/gpr-num.h>
 #include <asm/intc.h>
 #include <asm/mmio.h>
 #include <asm/riscv_encoding.h>
@@ -484,9 +485,30 @@ void context_switch(struct vcpu *prev, struct vcpu *next)
 
 static void __init __maybe_unused build_assertions(void)
 {
+/*
+ * GPR_LIST() puts nothing between its entries, so the separator has to come
+ * from here. It is emitted ahead of each entry rather than after it, so that
+ * the expansion doesn't end with one and its use below can be terminated like
+ * an ordinary statement.
+ */
+#define CHECK_GPR_INDEX(num, name)                          \
+    ; BUILD_BUG_ON(offsetof(struct cpu_user_regs, name) !=  \
+                   offsetof(struct cpu_user_regs, zero) +   \
+                   (num) * sizeof(unsigned long))
+
     /*
      * Enforce the requirement documented in struct cpu_info that
      * guest_cpu_user_regs must be the first field.
      */
     BUILD_BUG_ON(offsetof(struct cpu_info, guest_cpu_user_regs));
+
+    /*
+     * Enforce the requirement documented in struct cpu_user_regs that the
+     * x0..x31 fields are contiguous and in architectural register-number
+     * order, which is what lets a register number be resolved to its saved
+     * value by indexing them as an array anchored at ->zero.
+     */
+    GPR_LIST(CHECK_GPR_INDEX);
+
+#undef CHECK_GPR_INDEX
 }
diff --git a/xen/arch/riscv/extable.c b/xen/arch/riscv/extable.c
index 5b89c4278c65..19d9e3617c81 100644
--- a/xen/arch/riscv/extable.c
+++ b/xen/arch/riscv/extable.c
@@ -6,8 +6,11 @@
 #include <xen/sort.h>
 #include <xen/virtual_region.h>
 
+#include <asm/csr.h>
 #include <asm/extable.h>
 #include <asm/processor.h>
+#include <asm/regs.h>
+#include <asm/traps.h>
 
 #define EX_FIELD(ptr, field) ((unsigned long)&(ptr)->field + (ptr)->field)
 
@@ -32,6 +35,12 @@ static void __init cf_check swap_ex(void *a, void *b)
 
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
@@ -59,7 +68,26 @@ static void ex_handler_fixup(const struct exception_table_entry *ex,
     regs->sepc = ex_fixup(ex);
 }
 
-bool fixup_exception(struct cpu_user_regs *regs)
+static void ex_handler_trap_info(const struct exception_table_entry *ex,
+                                 struct cpu_user_regs *regs,
+                                 unsigned long cause)
+{
+    struct trap_info *trap_info =
+        (struct trap_info *)*regs_gpr_ptr(regs, ex->data);
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
@@ -77,7 +105,23 @@ bool fixup_exception(struct cpu_user_regs *regs)
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
index c0128a91818f..1ff557b70dd6 100644
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
 
 .macro asm_extable, insn, fixup
-    ASM_EXTABLE(\insn, \fixup)
+    ASM_EXTABLE_RAW(\insn, \fixup, EX_TYPE_FIXUP, 0)
 .endm
 
 #else /* __ASSEMBLER__ */
@@ -23,20 +30,35 @@
 
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
+#define EX_TRAP_INFO_REG(gpr) "(.L_gpr_num_" #gpr ")"
+
+#define ASM_EXTABLE_TRAP_INFO(insn, fixup, data)                    \
+    DEFINE_ASM_GPR_NUMS "\n"                                        \
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
+ * program should continue in case of a fault, `type` selects how the exception
+ * is handled (EX_TYPE_*), and `data` holds auxiliary information for the
+ * handler (e.g. for EX_TYPE_TRAP_INFO, the number of the GPR that contains a
+ * pointer to a struct trap_info). No general-purpose registers are
+ * modified by the exception handling mechanism itself, so it is up to
+ * the fixup code to handle any necessary state cleanup.
  *
  * The exception table and fixup code live out of line with the main
  * instruction path. This means when everything is well, we don't even
@@ -45,14 +67,15 @@ struct cpu_user_regs;
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
index 000000000000..867ee172c068
--- /dev/null
+++ b/xen/arch/riscv/include/asm/gpr-num.h
@@ -0,0 +1,53 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Based on Linux 6.16 arch/riscv/include/asm/gpr-num.h, with the
+ * register list turned into GPR_LIST() instead of being open-coded
+ * with .irp, so that it can also be used outside of assembly.
+ */
+#ifndef RISCV_GPR_NUM_H
+#define RISCV_GPR_NUM_H
+
+/*
+ * GPRs by ABI name, together with their register number (x0 .. x31).
+ *
+ * This is the single source of truth for the mapping; users expand it with
+ * their own per-register macro. Among them, the layout of struct cpu_user_regs
+ * is checked against this list at build time (see build_assertions() in
+ * domain.c), so neither list can be changed without the other.
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
+/* Number of GPRs described by GPR_LIST(). */
+#define NR_GPRS 32
+
+#ifdef __ASSEMBLER__
+
+/*
+ * Generate the .L_gpr_num_<name> assembler symbols, used to turn a register
+ * name emitted by the compiler into a register number.
+ *
+ * The separator is emitted ahead of each entry rather than after it, so that
+ * the expansion doesn't end with one: whatever follows a use of the list has
+ * to supply its own separator, instead of silently relying on a trailing one.
+ */
+#define GPR_NUM_EQU(num, name)  ; .equ .L_gpr_num_##name, num
+GPR_LIST(GPR_NUM_EQU)
+#undef GPR_NUM_EQU
+
+#else /* __ASSEMBLER__ */
+
+/* See the comment ahead of the __ASSEMBLER__ flavour above. */
+#define GPR_NUM_EQU(num, name)  "\n.equ .L_gpr_num_" #name ", " #num
+#define DEFINE_ASM_GPR_NUMS     GPR_LIST(GPR_NUM_EQU)
+
+#endif /* __ASSEMBLER__ */
+
+#endif /* RISCV_GPR_NUM_H */
diff --git a/xen/arch/riscv/include/asm/processor.h b/xen/arch/riscv/include/asm/processor.h
index b1745c107100..00c7654c3278 100644
--- a/xen/arch/riscv/include/asm/processor.h
+++ b/xen/arch/riscv/include/asm/processor.h
@@ -12,7 +12,19 @@
 
 #ifndef __ASSEMBLER__
 
-/* On stack VCPU state */
+/*
+ * On stack VCPU state.
+ *
+ * The x0..x31 fields must remain contiguous and in architectural
+ * register-number order: code which resolves a register number to its saved
+ * value indexes them as an array anchored at ->zero. Where that block sits
+ * within the structure is of no interest, but nothing may be inserted in
+ * between its fields. The layout is checked against GPR_LIST() at build
+ * time; see build_assertions() in domain.c.
+ *
+ * ->zero additionally has to always read as 0, since it supplies the value
+ * of x0 when x0 is used as a source operand.
+ */
 struct cpu_user_regs
 {
     unsigned long zero;
diff --git a/xen/arch/riscv/include/asm/regs.h b/xen/arch/riscv/include/asm/regs.h
index 531958f3d748..59573bb6013c 100644
--- a/xen/arch/riscv/include/asm/regs.h
+++ b/xen/arch/riscv/include/asm/regs.h
@@ -5,16 +5,35 @@
 #ifndef __ASSEMBLER__
 
 #include <xen/bug.h>
+#include <xen/nospec.h>
 
-#define hyp_mode(r)     (0)
+#include <asm/gpr-num.h>
+#include <asm/processor.h>
 
-struct cpu_user_regs;
+#define hyp_mode(r)     (0)
 
 static inline bool guest_mode(const struct cpu_user_regs *r)
 {
     BUG_ON("unimplemented");
 }
 
+/*
+ * Resolve an architectural register number to where its value is saved in
+ * @regs. Relies on x0..x31 being laid out as an array anchored at ->zero; see
+ * the comment above struct cpu_user_regs.
+ */
+static inline unsigned long *regs_gpr_ptr(struct cpu_user_regs *regs,
+                                          unsigned int num)
+{
+    ASSERT(num < NR_GPRS);
+
+    /*
+     * Not a speculation concern, but a convenient way to keep the access in
+     * bounds in release builds, where the assertion above is compiled out.
+     */
+    return &(&regs->zero)[array_index_nospec(num, NR_GPRS)];
+}
+
 #endif /* __ASSEMBLER__ */
 
 #endif /* ASM__RISCV__REGS_H */
diff --git a/xen/arch/riscv/include/asm/riscv_encoding.h b/xen/arch/riscv/include/asm/riscv_encoding.h
index 647268e6d0d4..599ae3cd601a 100644
--- a/xen/arch/riscv/include/asm/riscv_encoding.h
+++ b/xen/arch/riscv/include/asm/riscv_encoding.h
@@ -911,8 +911,13 @@
 #define REG_OFFSET(insn, pos)		\
 	(SHIFT_RIGHT((insn), (pos) - LOG_REGBYTES) & REG_MASK)
 
+/*
+ * The x0..x31 block of struct cpu_user_regs is not required to sit at the
+ * start of the structure, so anchor the offset at ->zero (x0) rather than
+ * at the structure itself.
+ */
 #define REG_PTR(insn, pos, regs)	\
-	(unsigned long *)((unsigned long)(regs) + REG_OFFSET(insn, pos))
+	(unsigned long *)((unsigned long)&(regs)->zero + REG_OFFSET(insn, pos))
 
 #define GET_RM(insn)			(((insn) >> 12) & 7)
 
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
index 9bb54d030be7..144b5beaa2c8 100644
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


