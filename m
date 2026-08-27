Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC6F2C61DC6
	for <xen-devel@archiver.kernel.org>; Thu, 27 Aug 2026 15:22:20 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1400953.1636694 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzbvg-0002q8-KG; Thu, 27 Aug 2026 15:22:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1400953.1636694; Thu, 27 Aug 2026 15:22:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzbvg-0002o6-6F; Thu, 27 Aug 2026 15:22:12 +0000
Received: by outflank-mailman (input) for mailman id 1400953;
 Thu, 27 Aug 2026 15:22:10 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wzbve-0002P7-GN
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2026 15:22:10 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wzbvd-009kzH-TD
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2026 17:22:09 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a905616-2eae-0a2a0a5409dd-0a2a4501a8e6-32
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 17:22:09 +0200
Received: from [209.85.128.50] (helo=mail-wm1-f50.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a905621-5984-0a2a45010019-d1558032e01e-3
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 17:22:09 +0200
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-49b8e527d63so6385605e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 08:22:09 -0700 (PDT)
Received: from fedora (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49b4b2d6b30sm57441155e9.14.2026.08.27.08.22.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Aug 2026 08:22:08 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1787844129; x=1788448929; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O68oZFCfXHfk/QZ3xStOhptGKFjcOPvB2fsPLA0mazI=;
        b=hdXrQLwyNYMXTPP5Z0v9i6+NYAN3htktxEQAB7pm+O8PwhRO482V+7X2B61WYCckSX
         vsVql0dujLJzj95BVU7u7qUBfg0t3gCMS7JTQFDfwdV0c0mDshjbVf3v8NrcmGEx4ULb
         +zGNQh2QNi24slHhLpfulzSWniaNKacfc/PylvSofedA16cwLUbvzu8RlYFC+owoEbCz
         1DiD1jqyayJG9JbGPbiPA7AMPO19r3QB80LVZeN7cSp0LIygks/nGZspQ+PZt2v5MeJ9
         Q9hyNlimlm9jWmCKdRFGiz6/ja7yA/Zm05jrfK+PlO1aScJcJKGtlPC8iUAlAEXZo6Fw
         hgtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787844129; x=1788448929;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=O68oZFCfXHfk/QZ3xStOhptGKFjcOPvB2fsPLA0mazI=;
        b=XP25m6tTJt7xIefaFdEHOUD3nJTZeU2WLCy/dZZa4rvG4c0TedeggB7DjApda9NOqh
         L4J269Szm+unZWTM/AGlwOYj+q0GbmAZnH8xD/iWe/pZF/rSH/JRq50ECk5e92EN/wfH
         Kmwy4UJFanftCYs/dj11Ai6f8KI3agPhQS6THiPb9wP6sex2WdrfSeMEmfpw6NoeQ0F5
         B8XtbNUeQsXkWkg8TEfDIoiGCZ+X2ovDlL9zDxy5CT+oRrX5XjrKz/sLWBIbL7Z/K/uG
         jHbQJhxSEtFsIenXQRkndETcObNza7YQzdEhz2sLN3Ap6gn9roNkaGkNR8mK0aqrnwzf
         3HOw==
X-Gm-Message-State: AFuF++ls5AMwTjKa7rrsy9PUUr1fenVqklB6rZPwiuNQ1WFTz780jq0a
	8ZU8kj0Cf2rH+SwIamdDF1/LkUQ2odmvilf00wIx+jgn42pzcMmODWibQdy5Aw==
X-Gm-Gg: AR+sD129jvJU05uMf4Xr5DoDCD+e1HvTU6N5T/5C0saX05nr6HrGTm6lN0Sc2A9dETf
	uDn6huMRBk9ka7gtIhvWlxMSSWkDpO0ueny4qjNWfrYY6ZAKLRqgjvj4FVn+ZO5rsaQcWcLvDGU
	tc3vZXdWHQYhlqc0so4sHnVy1CYB3mM1Vdr92ZSs4u5yftZ47m4culwk2N47oyC9UXAJfSxME2S
	wWAgmrMthIqeqpdDtrRoN69C52bzWCPqqYIhJ/vTAY23h6b1+CrMCPWORIsquMK7UVwy94Sposd
	v9vkDpvySjHTtvhZDi1CfXY/g7J25piid9djKpMM/vmeqVfj2fK8dkEJCnNJUssXz7uwiMZUvrT
	60RYCsrGOkmCwmkCeg2kcF2yeKubeIHeAuHceiVuvX/b3tQ1zQWmQJlNl2+xbF2zntSMzFNoPON
	Pf/urTYN6lDlKhznr1MLqd0SBSTZeQDiuUgYtuqUQZE8g1nkGM+aaKto56deri8LvAmET6LQJVP
	jruQU4XUR5YdWIXO6TLczV8ptba2xpI
X-Received: by 2002:a05:600c:698c:b0:493:cefc:d113 with SMTP id 5b1f17b1804b1-499dc6f5dcdmr224736685e9.5.1787844129021;
        Thu, 27 Aug 2026 08:22:09 -0700 (PDT)
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
Subject: [PATCH v2 18/39] xen/riscv: add guest page fault handling stub
Date: Thu, 27 Aug 2026 17:21:02 +0200
Message-ID: <42e37df518f1eda9579264b4bae9db3521e1042a.1787838835.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1787838835.git.oleksii.kurochko@gmail.com>
References: <cover.1787838835.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d62444/1787844129-C4359757-CAD6905E/10/73395122804
X-purgate-type: spam
X-purgate-size: 12235

Add a handler for guest page faults and hook it into the trap path,
providing the trap-side entry point which will later feed the MMIO
dispatch.

This will be used, for example, to trap accesses to APLIC registers so
that a guest can initialize and drive an emulated interrupt controller.

Two of the situations handled here are already decided, as neither can
ever be turned into an emulated access:

 - A fault reported with a pseudoinstruction in htinst was taken on an
   implicit access made for VS-stage address translation, so htval holds
   the address of a VS-stage PTE rather than of anything the guest asked
   for, and the guest physical address behind the original access is not
   known. This is orthogonal to the cause and can accompany any of the
   three, which is why it is checked first. scause keeps reporting the
   type of the original access, and on bare hardware a PTE which cannot
   be read raises an access fault of exactly that type, so reflect one
   back to the guest.

 - A fetch fault means the guest tried to execute from a guest physical
   address which is unmapped or which G-stage does not allow to be
   executed. On bare hardware a fetch from physical memory which does
   not exist, or which may not be executed, raises an instruction access
   fault, so reflect one back too.

Explicit loads and stores are where MMIO emulation will hook in.

Neither of the two paths above consults the p2m first, and neither will
the MMIO one: RISC-V has no populate-on-demand, no paging and no
mem_access, so every guest mapping is established eagerly and a G-stage
fault never denotes a mapping Xen could install to let the faulting
access complete.

Both of the helpers this leans on, resolve_faulting_gpa() and
trap_redirect(), are BUG_ON() placeholders for now, so each of the three
causes currently takes the host down rather than the domain. That is no
worse than before this patch, where the same causes fell through to
do_unexpected_trap() and die(). Implementing the helpers is left to
later patches.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in v2:
 - Introduce struct guest_fault.
 - Change the prototypes of emulate_{load,store}() to take a non-const
   struct guest_fault, as emulation has to write the destination
   register and advance sepc.
 - Add handling of pseudoinstructions before the call of
   emulate_{load,store}.
 - Rename get_fault_gpa to resolve_faulting_gpa and change its prototype
   to take struct guest_fault.
 - Add handling of CAUSE_FETCH_GUEST_PAGE_FAULT now.
 - Document why the p2m is not consulted before a fault is injected, and
   add a BUILD_BUG_ON() on CONFIG_VM_EVENT to catch that assumption
   breaking.
 - Print the fault cause in the domain_crash() message rather than
   deriving an access type string which cannot cover every case.
 - Move code to introduced emulate.c instead of having it in traps.c
---
---
 xen/arch/riscv/Makefile              |   1 +
 xen/arch/riscv/emulate.c             | 179 +++++++++++++++++++++++++++
 xen/arch/riscv/include/asm/emulate.h |  10 ++
 xen/arch/riscv/include/asm/traps.h   |   3 +
 xen/arch/riscv/traps.c               |  23 +++-
 5 files changed, 215 insertions(+), 1 deletion(-)
 create mode 100644 xen/arch/riscv/emulate.c
 create mode 100644 xen/arch/riscv/include/asm/emulate.h

diff --git a/xen/arch/riscv/Makefile b/xen/arch/riscv/Makefile
index ce6410a299a4..4a021ee9eb70 100644
--- a/xen/arch/riscv/Makefile
+++ b/xen/arch/riscv/Makefile
@@ -6,6 +6,7 @@ obj-y += domain.o
 obj-y += domain-build.init.o
 obj-$(CONFIG_DOM0LESS_BOOT) += dom0less-build.init.o
 obj-$(CONFIG_EARLY_PRINTK) += early_printk.o
+obj-y += emulate.o
 obj-y += entry.o
 obj-y += extable.o
 obj-y += guestcopy.o
diff --git a/xen/arch/riscv/emulate.c b/xen/arch/riscv/emulate.c
new file mode 100644
index 000000000000..f9da0751049c
--- /dev/null
+++ b/xen/arch/riscv/emulate.c
@@ -0,0 +1,179 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+
+/*
+ * RISC-V instruction emulation for trapped guest accesses
+ */
+
+#include <xen/bug.h>
+#include <xen/errno.h>
+#include <xen/sched.h>
+#include <xen/types.h>
+
+#include <asm/csr.h>
+#include <asm/current.h>
+#include <asm/emulate.h>
+#include <asm/riscv_encoding.h>
+#include <asm/traps.h>
+
+/*
+ * The hardware-reported details of a guest page fault, gathered once by
+ * handle_guest_page_fault() and passed down to the emulation of the faulted
+ * access.
+ */
+struct guest_fault {
+    /* The guest register state as saved on entry to do_trap(). */
+    struct cpu_user_regs *regs;
+    /* scause: a fetch, a load or a store/AMO guest page fault. */
+    unsigned long cause;
+    /*
+     * htinst: the trapped instruction in its transformed form, or one of the
+     * special values (zero, or a pseudoinstruction).
+     */
+    unsigned long htinst;
+    /* htval: as written by hardware; see resolve_faulting_gpa(). */
+    unsigned long htval;
+    /* stval: the guest virtual address of the faulting access. */
+    unsigned long stval;
+    /* The faulting guest physical address, filled by resolve_faulting_gpa(). */
+    paddr_t gpa;
+};
+
+/*
+ * Is @htinst one of the pseudoinstructions reported for a guest page fault
+ * taken on an implicit memory access done for VS-stage address translation?
+ *
+ * All four values are recognized regardless of the hypervisor's XLEN: the
+ * width they encode is that of a VS-stage PTE, i.e. it follows the guest's
+ * paging mode (4 bytes for Sv32, 8 otherwise). On RV32 the 64-bit forms
+ * simply never occur.
+ */
+static bool htinst_is_pseudo(unsigned long htinst)
+{
+    switch ( htinst )
+    {
+    case INSN_PSEUDO_VS_LOAD32:
+    case INSN_PSEUDO_VS_STORE32:
+    case INSN_PSEUDO_VS_LOAD64:
+    case INSN_PSEUDO_VS_STORE64:
+        return true;
+
+    default:
+        return false;
+    }
+}
+
+/* Reconstruct the guest physical address of the access which faulted. */
+static void resolve_faulting_gpa(struct guest_fault *gf)
+{
+    BUG_ON("unimplemented");
+}
+
+static int emulate_load(const struct guest_fault *gf)
+{
+    return -EOPNOTSUPP;
+}
+
+static int emulate_store(struct guest_fault *gf)
+{
+    return -EOPNOTSUPP;
+}
+
+static void inject_access_fault(const struct guest_fault *gf)
+{
+    struct trap_info utrap = {};
+
+    switch ( gf->cause )
+    {
+    case CAUSE_FETCH_GUEST_PAGE_FAULT:
+        utrap.scause = CAUSE_FETCH_ACCESS;
+        break;
+
+    case CAUSE_LOAD_GUEST_PAGE_FAULT:
+        utrap.scause = CAUSE_LOAD_ACCESS;
+        break;
+
+    case CAUSE_STORE_GUEST_PAGE_FAULT:
+        utrap.scause = CAUSE_STORE_ACCESS;
+        break;
+
+    default:
+        domain_crash(current->domain, "Impossible cause (%#lx) in %s?\n",
+                     gf->cause, __func__);
+        return;
+    }
+
+    utrap.sepc = gf->regs->sepc;
+    utrap.stval = gf->stval;
+
+    trap_redirect(&utrap);
+}
+
+void handle_guest_page_fault(struct cpu_user_regs *regs, unsigned long cause)
+{
+    struct guest_fault gf = {
+        .regs = regs,
+        .cause = cause,
+        .htinst = csr_read(CSR_HTINST),
+        .htval = csr_read(CSR_HTVAL),
+        .stval = csr_read(CSR_STVAL),
+        .gpa = INVALID_PADDR,
+    };
+    int rc;
+
+    /*
+     * A guest-page fault may arise due to an implicit memory access during
+     * first-stage (VS-stage) address translation, in which case a guest
+     * physical address written to htval is that of the implicit memory
+     * access that faulted - for example, the address of a VS-level page
+     * table entry that could not be read. (The guest physical address
+     * corresponding to the original virtual address is unknown when
+     * VS-stage translation fails to complete)
+     *
+     * In such cases htinst reports one of the pseudoinstructions recognized
+     * by htinst_is_pseudo(), and the fault requires separate handling (since
+     * G-stage translation failed on an unpopulated/unmapped guest physical
+     * address during a hardware page-table walk). To match bare hardware
+     * behavior, we must inject an access fault of the ORIGINAL access type
+     * (Instruction, Load, or Store/AMO) that initiated the address
+     * translation.
+     */
+    if ( htinst_is_pseudo(gf.htinst) )
+    {
+        inject_access_fault(&gf);
+
+        return;
+    }
+
+    resolve_faulting_gpa(&gf);
+
+    switch ( cause )
+    {
+    case CAUSE_LOAD_GUEST_PAGE_FAULT:
+        rc = emulate_load(&gf);
+        break;
+
+    case CAUSE_STORE_GUEST_PAGE_FAULT:
+        rc = emulate_store(&gf);
+        break;
+
+    case CAUSE_FETCH_GUEST_PAGE_FAULT:
+        /*
+         * Guest is trying to reach unmapped/unpopulated or G-stage PTE doesn't
+         * allow execution (X=0). Generate fetch fault in this case.
+         */
+        inject_access_fault(&gf);
+        rc = 0;
+        break;
+
+    default:
+        rc = -EOPNOTSUPP;
+        ASSERT_UNREACHABLE();
+        break;
+    }
+
+    if ( rc )
+        domain_crash(current->domain,
+                     "%s: unable to handle guest page fault (cause=%#lx) at "
+                     "gpa %#"PRIpaddr"\n",
+                     __func__, cause, gf.gpa);
+}
diff --git a/xen/arch/riscv/include/asm/emulate.h b/xen/arch/riscv/include/asm/emulate.h
new file mode 100644
index 000000000000..59e69ca6794c
--- /dev/null
+++ b/xen/arch/riscv/include/asm/emulate.h
@@ -0,0 +1,10 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+
+#ifndef RISCV_EMULATE_H
+#define RISCV_EMULATE_H
+
+struct cpu_user_regs;
+
+void handle_guest_page_fault(struct cpu_user_regs *regs, unsigned long cause);
+
+#endif /* RISCV_EMULATE_H */
diff --git a/xen/arch/riscv/include/asm/traps.h b/xen/arch/riscv/include/asm/traps.h
index 8d4ab664bca9..38c6423742e0 100644
--- a/xen/arch/riscv/include/asm/traps.h
+++ b/xen/arch/riscv/include/asm/traps.h
@@ -17,6 +17,9 @@ void do_trap(struct cpu_user_regs *cpu_regs);
 void handle_trap(void);
 void trap_init(void);
 
+/* Reflect @trap back to the guest, i.e. enter its VS-mode trap handler. */
+void trap_redirect(const struct trap_info *trap);
+
 #endif /* __ASSEMBLER__ */
 
 #endif /* ASM__RISCV__TRAPS_H */
diff --git a/xen/arch/riscv/traps.c b/xen/arch/riscv/traps.c
index 11a6fa1bc942..9cd37d943be1 100644
--- a/xen/arch/riscv/traps.c
+++ b/xen/arch/riscv/traps.c
@@ -14,6 +14,7 @@
 
 #include <asm/extable.h>
 #include <asm/cpufeature.h>
+#include <asm/emulate.h>
 #include <asm/intc.h>
 #include <asm/processor.h>
 #include <asm/riscv_encoding.h>
@@ -193,6 +194,7 @@ void do_trap(struct cpu_user_regs *cpu_regs)
 {
     register_t pc = cpu_regs->sepc;
     unsigned long cause = csr_read(CSR_SCAUSE);
+    bool from_guest = cpu_regs->hstatus & HSTATUS_SPV;
 
     switch ( cause )
     {
@@ -203,6 +205,19 @@ void do_trap(struct cpu_user_regs *cpu_regs)
         vsbi_handle_ecall(cpu_regs);
         break;
 
+    case CAUSE_FETCH_GUEST_PAGE_FAULT:
+    case CAUSE_LOAD_GUEST_PAGE_FAULT:
+    case CAUSE_STORE_GUEST_PAGE_FAULT:
+        /*
+         * A guest page fault taken in Xen context comes from an hlv/hlvx
+         * access made on a vCPU's behalf and is dealt with by the
+         * fixup_exception() above, so only a guest can get here.
+         */
+        BUG_ON(!from_guest);
+
+        handle_guest_page_fault(cpu_regs, cause);
+        break;
+
     case CAUSE_ILLEGAL_INSTRUCTION:
         if ( do_bug_frame(cpu_regs, pc) >= 0 )
         {
@@ -251,7 +266,7 @@ void do_trap(struct cpu_user_regs *cpu_regs)
         break;
     }
 
-    if ( cpu_regs->hstatus & HSTATUS_SPV )
+    if ( from_guest )
         check_for_pcpu_work();
 }
 
@@ -275,3 +290,9 @@ enum mc_disposition arch_do_multicall_call(struct mc_state *state)
     BUG_ON("unimplemented");
     return mc_continue;
 }
+
+/* Redirect trap to Guest. */
+void trap_redirect(const struct trap_info *trap)
+{
+    BUG_ON("unimplemented");
+}
-- 
2.55.0


