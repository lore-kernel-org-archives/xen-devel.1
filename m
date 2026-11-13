Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70A4B606A32D
	for <xen-devel@archiver.kernel.org>; Fri, 13 Nov 2026 15:49:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dG172Z4Q
Received: from list by lists.xenproject.org with outflank-mailman.1487730.1690052 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRtWp-0003NQ-IM; Fri, 13 Nov 2026 15:49:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1487730.1690052; Fri, 13 Nov 2026 15:49:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRtWo-0003Ln-OA; Fri, 13 Nov 2026 15:49:26 +0000
Received: by outflank-mailman (input) for mailman id 1487730;
 Fri, 13 Nov 2026 15:49:24 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xRtWm-0002z4-PX
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2026 15:49:24 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xRtWm-00AqPc-68
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2026 16:49:24 +0100
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6af73181-bab6-0a2a0a5309dd-0a2a450bba04-6
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 16:49:24 +0100
Received: from [209.85.221.54] (helo=mail-wr1-f54.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6af73183-b7e8-0a2a450b0019-d155dd36ac09-3
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 16:49:24 +0100
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-48e3b22e971so549314f8f.0
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 07:49:24 -0800 (PST)
Received: from fedora (user-109-243-65-71.play-internet.pl. [109.243.65.71])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-49c5f1c0e0dsm5786493f8f.15.2026.11.13.07.49.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Nov 2026 07:49:23 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20260707 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794584963; x=1795189763; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IkdgcnMywWPxKm6hXmAPKzX9CTqSlpcehh5F4omzwKM=;
        b=dG172Z4QdI1vytkAS5BLVJqhgpu2+lyl8IyDLaDiPc3yZbi9qgRG6rkTT77jr2U+Mb
         xZWVJReIJfhkLt61TvJi0yZh/DzJDx8icaXOZlUpdFKSiFpiB57AESWvLRLym5G6rpAv
         46eYYNL2O0ZcHhp2h+7pbY6qMDf9rNg/lktsd+M5AAIIHuJiWhCRxQI/h1c9NgGxAl3x
         eNFHmDNEittm5tFJ+zabVoJgQvFzKC+T1OTi5SNEuORFCoaKXzNPrXXkor4bQLusgkLZ
         +kMqmx9HPr4EZ8NBxvdZdBbneAwjuLMYIBSAwS42G79G2L8JhYH9vq+/uoreaKzQzkjo
         bY6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794584963; x=1795189763;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IkdgcnMywWPxKm6hXmAPKzX9CTqSlpcehh5F4omzwKM=;
        b=r4JxGz/+0q8uUE3yvMjGNq4yR8zvOZBaX/63NsCkwr6eEKzcInlPS5Rk1tiebnWUPY
         3mHQAJeo7ZrnvvTGPN2Y1aB0Ur7q8/6gucQDUkT34Q0GqOD9p3+fLEz1XpZx3V/bm4OG
         gkIxTpRHflm4j7flZFLZt7scOQ4r/Vd23oZm5D4wy9eb7JGipbUt+tYmIZUXOCiilZpd
         C1cd7wyzdcj7Tc/FH10kgxHC17G3+z08Myl695lHcfQq+v2H6wYPsXPOCcHcpXLys9R+
         uO+HmW38ZK7RZULHCsLEQqnrsfzRH8j8GYd/s1XtTxuiCtXtb/IlfFkxeallUjrXi8JZ
         5lPA==
X-Gm-Message-State: APuU4Z93d6qSnZu7jUnOKPEhMIAarGrbQFWVSmjq5phuITCD9WwZQ43u
	lCClqrfiyk6tqn9dpZb8YjY4VekSsqeTw/pXzbAI7XtqVuNqLuRBF6NRHswJLw==
X-Gm-Gg: AYBFou0+o5lDSayklWN/+nP8d3dbhhnv10mgLoH2iCKDPpIui2SJ/Qb1XEBuTsnN1xg
	9wM+EcDlA5pDTFe8z1057tpHgSAS7T8RLd2N2zQc99ERbaCizjyjB/mevBXmczHN8d/ni1IsDwd
	qk+XyWo0I2bqnZ3zOtHc+DwOgxSEzegQUZ4+7XSAmyqTgG94235Dlp+QPvK5ajxYk1aP6Lxy6aZ
	RqAtRrIOmijxSO82Uu+LvpIgAteW0pNzuoUTxsIyQFNmx5eChkU8zoHP3s4GH9viqpATCf+ThC0
	4OuyIEN+2qlL9tLImzXJW0HTzLWrdrkkAWTVAYQ29r339Ob7BRihN1C2brNMhLQHNrzDf6m/Emv
	PDjUKIMHuKRjRgA7x2hX99DWs+JnItKO6umdtrUGhJrVuNXNbt9GJtYgPbsbgEnF6YoOieces/H
	SSAQpggkm88b5tDyeCPe8UzQH3mBp09G3ymvPNYgoFjOgvmdprenxm5q57MoFre6Pmu2DfBE7F2
	HJ1FTYpSdOpU1SKjNCjmAJ64tWQhxqAyH7FH95WFkRXUJFk/HIWLD7yqqSi18JYdFxLArMR/2hg
	5UsCwcgVSBYMWoU5fwx0V3uZQKMetLxixBXeWN9smXKwutZMmtciXFuxKTlRQg5VX7YDzA==
X-Received: by 2002:a05:6000:25e7:b0:48f:bb68:4e83 with SMTP id ffacd0b85a97d-49c73164334mr6760861f8f.9.1794584963487;
        Fri, 13 Nov 2026 07:49:23 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Baptiste Le Duc <baptiste.le-duc@vates.tech>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v4 15/42] xen/riscv: add guest page fault handling stub
Date: Fri, 13 Nov 2026 16:48:36 +0100
Message-ID: <7bbd0bce42dcbff08ec4bb12c3831ae498196bfd.1794562488.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <cover.1794562488.git.oleksii.kurochko@gmail.com>
References: <cover.1794562488.git.oleksii.kurochko@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-42698a/1794584964-ABAD09EA-1100C5D0/10/73395122804
X-purgate-type: spam
X-purgate-size: 12386
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add a handler for guest page faults and hook it into the trap path,
providing the trap-side entry point for the MMIO dispatch.

This will be used, for example, to trap accesses to APLIC registers so
that a guest can initialize and drive an emulated interrupt controller.

A G-stage (stage-2) fault has one of three causes, reported via scause:
- Fetch fault: guest tried to execute from a guest-physical address
  that is unmapped or that G-stage marks non-executable. Never
  emulatable (nothing to emulate a fetch into). On real hardware
  this raises an instruction access fault, so Xen reflects the same
  fault back to the guest. Decided here.

- Load fault / Store fault: this is where MMIO emulation hooks in. Not
  in scope of this patch.

Any of these three faults is instead reported via a pseudoinstruction
in htinst, when both:

(a) the fault is caused by an implicit memory access for VS-stage
    address translation, and
(b) htval holds a nonzero value: the guest-physical address of that
    VS-stage PTE, not of the guest's original access.

However, none of these paths consult the p2m first, and the future MMIO path
won't either: RISC-V has no populate-on-demand, no paging, and no
mem_access, so every guest mapping is established eagerly. A G-stage
fault therefore never indicates a mapping Xen could lazily resolve to
let the access complete.

resolve_faulting_gpa() is a stub which always fails for now, so any guest
page fault other than one taken on an implicit access for VS-stage
translation currently crashes the domain. That one is reflected to the
guest through trap_redirect(), which is still a BUG_ON() placeholder
though, and so takes the host down. This is no worse than before this
patch, where these traps fell through to do_unexpected_trap() and die().

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in v4:
 - Drop the from_guest local and the paragraph on it in the commit
   message: "xen/riscv: look up the exception table for any trap taken
   in Xen context" introduces it now.
 - Update the commit message.
 - Rewrite the comment ahead of the htinst_is_pseudo() check along the
   lines of the commit message.
 - Drop __func__ from the domain_crash() messages: they are unique
   enough.
 - Drop the comment ahead of the definition of trap_redirect(): it
   duplicates the one on its declaration.
---
Changes in v3:
 - Update the commit message.
 - Make resolve_faulting_gpa() return an error, which the caller checks.
 - Add a FIXME about guest page tables residing in emulated MMIO.
 - Don't refer to fixup_exception() in the comment ahead of
   BUG_ON(!from_guest): it isn't consulted for guest page faults yet.
 - Mention the from_guest local in the commit message.
 - Say in the comment above resolve_faulting_gpa() that it stores the address
   in @gf->gpa.
 - Make emulate_store() take a pointer to const, as emulate_load() does:
   neither modifies *gf.
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
 xen/arch/riscv/emulate.c             | 177 +++++++++++++++++++++++++++
 xen/arch/riscv/include/asm/emulate.h |  10 ++
 xen/arch/riscv/include/asm/traps.h   |   3 +
 xen/arch/riscv/traps.c               |  18 +++
 5 files changed, 209 insertions(+)
 create mode 100644 xen/arch/riscv/emulate.c
 create mode 100644 xen/arch/riscv/include/asm/emulate.h

diff --git a/xen/arch/riscv/Makefile b/xen/arch/riscv/Makefile
index 5454517724bd..2b84dace6bd5 100644
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
index 000000000000..de8c09fe1505
--- /dev/null
+++ b/xen/arch/riscv/emulate.c
@@ -0,0 +1,177 @@
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
+    /* The guest register state. */
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
+ * Is @htinst one of the special pseudoinstruction values, reported for a guest
+ * page fault taken on an implicit memory access done for VS-stage address
+ * translation?
+ *
+ * It is enough to check only bits[1:0] as according to the spec:
+ *
+ * The value is one of the special pseudoinstructions defined later, all of
+ * which have bits 1:0 equal to 00.
+ */
+static bool htinst_is_pseudo(unsigned long htinst)
+{
+    return htinst && !(htinst & 3);
+}
+
+/*
+ * Reconstruct the guest physical address the access faulted on into @gf->gpa.
+ */
+static int resolve_faulting_gpa(struct guest_fault *gf)
+{
+    return -EOPNOTSUPP;
+}
+
+static int emulate_load(const struct guest_fault *gf)
+{
+    return -EOPNOTSUPP;
+}
+
+static int emulate_store(const struct guest_fault *gf)
+{
+    return -EOPNOTSUPP;
+}
+
+static void inject_access_fault(const struct guest_fault *gf)
+{
+    struct trap_info utrap = {
+        .sepc = gf->regs->sepc,
+        .stval = gf->stval,
+    };
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
+        domain_crash(current->domain, "Impossible cause (%#lx)?\n", gf->cause);
+        return;
+    }
+
+    trap_redirect(&utrap);
+}
+
+void handle_guest_page_fault(struct cpu_user_regs *regs, unsigned long cause)
+{
+    struct guest_fault gf = {
+        .regs = regs,
+        .cause = cause,
+        .gpa = INVALID_PADDR,
+    };
+    int rc;
+
+    gf.htinst = csr_read(CSR_HTINST);
+    gf.htval = csr_read(CSR_HTVAL);
+    gf.stval = csr_read(CSR_STVAL);
+
+    /*
+     * htinst reports one of the special pseudoinstruction values when both:
+     *   (a) the fault is caused by an implicit memory access for VS-stage
+     *       address translation
+     *   (b) htval holds a nonzero value: the guest physical address of that
+     *       VS-stage PTE, not of the guest's original access, which is
+     *       unknown as VS-stage translation didn't complete.
+     *
+     * No access to emulate then: to match bare hardware behavior, inject an
+     * access fault of the ORIGINAL access type (Instruction, Load, or
+     * Store/AMO) that initiated the address translation.
+     *
+     * FIXME: This assumes that guest page tables never reside in an emulated
+     * MMIO region, i.e. that an implicit access faulting at G-stage always
+     * targets an unpopulated GPA. Guests may (even transiently) place page
+     * tables in MMIO-backed memory, e.g. a video frame buffer. Supporting
+     * that would require walking the VS-stage page tables in software,
+     * accessing the PTEs (including A/D updates) through the MMIO handlers,
+     * and then emulating the original access, instead of injecting a fault.
+     */
+    if ( htinst_is_pseudo(gf.htinst) )
+    {
+        inject_access_fault(&gf);
+
+        return;
+    }
+
+    rc = resolve_faulting_gpa(&gf);
+    if ( rc )
+        goto out;
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
+         * Guest is trying to reach unmapped/unpopulated, or G-stage PTE doesn't
+         * allow execution (X=0). Generate fetch fault in this case.
+         */
+        inject_access_fault(&gf);
+        return;
+
+    default:
+        ASSERT_UNREACHABLE();
+        rc = -EOPNOTSUPP;
+
+        break;
+    }
+
+ out:
+    if ( rc )
+        domain_crash(current->domain,
+                     "unable to handle guest page fault (cause=%#lx) at gpa %#"PRIpaddr"\n",
+                     cause, gf.gpa);
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
index 3f2b5b7ccb5f..a7c79ae6165b 100644
--- a/xen/arch/riscv/include/asm/traps.h
+++ b/xen/arch/riscv/include/asm/traps.h
@@ -17,6 +17,9 @@ void do_trap(struct cpu_user_regs *cpu_regs);
 void handle_trap(void);
 void trap_init(void);
 
+/* Reflect @trap back to the guest, i.e. enter its VS-mode trap handler. */
+void trap_redirect(const struct trap_info *trap);
+
 #endif /* __ASSEMBLER__ */
 
 #endif /* RISCV_TRAPS_H */
diff --git a/xen/arch/riscv/traps.c b/xen/arch/riscv/traps.c
index efeba0a9ce03..db8873d1e43f 100644
--- a/xen/arch/riscv/traps.c
+++ b/xen/arch/riscv/traps.c
@@ -14,6 +14,7 @@
 
 #include <asm/extable.h>
 #include <asm/cpufeature.h>
+#include <asm/emulate.h>
 #include <asm/intc.h>
 #include <asm/processor.h>
 #include <asm/riscv_encoding.h>
@@ -225,6 +226,18 @@ void do_trap(struct cpu_user_regs *cpu_regs)
         vsbi_handle_ecall(cpu_regs);
         break;
 
+    case CAUSE_FETCH_GUEST_PAGE_FAULT:
+    case CAUSE_LOAD_GUEST_PAGE_FAULT:
+    case CAUSE_STORE_GUEST_PAGE_FAULT:
+        /*
+         * Xen doesn't access guest memory, so it can't take a guest page
+         * fault itself: only a guest can get here.
+         */
+        BUG_ON(!from_guest);
+
+        handle_guest_page_fault(cpu_regs, cause);
+        break;
+
     case CAUSE_ILLEGAL_INSTRUCTION:
         if ( do_bug_frame(cpu_regs, pc) >= 0 )
         {
@@ -294,3 +307,8 @@ enum mc_disposition arch_do_multicall_call(struct mc_state *state)
     BUG_ON("unimplemented");
     return mc_continue;
 }
+
+void trap_redirect(const struct trap_info *trap)
+{
+    BUG_ON("unimplemented");
+}
-- 
2.56.1


