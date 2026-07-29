Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75DD9C54F51
	for <xen-devel@archiver.kernel.org>; Wed, 29 Jul 2026 13:40:53 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1375924.1622913 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wp4WT-0006C0-Sf; Wed, 29 Jul 2026 13:40:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1375924.1622913; Wed, 29 Jul 2026 13:40:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wp4WT-0006Bt-PH; Wed, 29 Jul 2026 13:40:37 +0000
Received: by outflank-mailman (input) for mailman id 1375924;
 Wed, 29 Jul 2026 13:40:36 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wp4WS-0006Bh-Hy
 for xen-devel@lists.xenproject.org; Wed, 29 Jul 2026 13:40:36 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wp4WR-00AUZE-R4
 for xen-devel@lists.xenproject.org; Wed, 29 Jul 2026 15:40:35 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a6a02d3-2eae-0a2a0a5409dd-0a2a45019e30-4
 for <xen-devel@lists.xenproject.org>; Wed, 29 Jul 2026 15:40:35 +0200
Received: from [209.85.221.50] (helo=mail-wr1-f50.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a6a02d3-5984-0a2a45010019-d155dd32bc7e-3
 for <xen-devel@lists.xenproject.org>; Wed, 29 Jul 2026 15:40:35 +0200
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-47f96c5b722so598854f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 29 Jul 2026 06:40:35 -0700 (PDT)
Received: from fedora (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47fb6aa392asm7585952f8f.5.2026.07.29.06.40.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jul 2026 06:40:34 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1785332435; x=1785937235; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sFuIFHaAW+8s2KlN+hWBa0uRW0aaM8NroxXcUO611lM=;
        b=AhUu/oPe0RHfljWGYyzfC/lBnSFgIWZcBu5FOwdv5wuqQqzpilLDslMdvmEeGuNip7
         mCog17lof+kguudT+Wsz9f9f9CnAgmci6x8wTaYPTBC5frdT2rMV2YVd/9wZJ3BRCCC0
         FGGwf6dg4yTVZN8eiVmolFh6/VFrWmc+23KWwxBF6yzVd6OWRI93gx5AYML7yl6aMogn
         VOYjVyFgKQEqRjCKfaTajqOsD0rPmJXtUhJIKM+zAlCRz18TrhKqjVxcgUCL5zOVI6JP
         TY6WwCYIAAV8rUK1gzRlSYbI5OkCsiXjBpMN3fZpTyPAlAbgnXPZrHWC45UnNd9cRcXR
         3Gtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785332435; x=1785937235;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sFuIFHaAW+8s2KlN+hWBa0uRW0aaM8NroxXcUO611lM=;
        b=hMhvFZ5sRZHLBrV2jVn2lyty0+LBXdImj2Hj1KiAuO7EdaFiGNVBKQt2DHT9uqk28K
         ueoZfJCAptKf0QZAoreFVJB8cqDNIDKIZCerGeS3gnmLZJCkdHdZBSoxtykinB+Vawqj
         1elceRP1FtpXnsWiVUwzdrGKAv+Dnzrv+N8mrSuFuW/fy08QZPp+OR2PHYHJGZNsTTdZ
         2FHzzXVsHuTj9ixlE3X8dKlVuwmDSUooX+0tBTpSAfB0nwqK0xL9JVs8XQdec1frnE1f
         DMnyatgkSVw84xYrAgyCJeBBdMMhmaosl5Jhbm9w8d/kX4GvVDeyGW1wpZ0mSwPkkvJx
         6+hg==
X-Gm-Message-State: AOJu0YwtpmKvwE9VvG1U5PGYJxhOiCFhhy8MsiMmCGv7hnpk2P/pkvkp
	hQFJ1Bi9X+ELVAppeusb7G6Vv0pRGVE6PEtNqTcioBfrxNFJyr8npxX9Dxkoag==
X-Gm-Gg: AR+sD13UlhJ1TuO8vFlmYAzKfaaP6UzD+k7gWRWEBD3/Pc4cdSXywvIcuCrablJa+Dy
	DRuJKf+QkNsJbbO5kOOTHOV9PBm+IM9sMyGb0AXUM09d2SEevViQY0WN7R9D4zvGVAxano1AGdc
	V3asCqXlo2+H9PBQdD9roGNWeFn15GpSAmlyHrc157m3Knneh0PnpCQAKSPURwccQToZZ4Al9Op
	tJzJPcMzEhieHkZ7LnMnDLXukDhe3+98God/D/ytYFzcZq0pQReXb0CY3OiknGQjsiafYdlXrvM
	eFi0GPzfBH5tP+967zWyW7FjHBTJenj+IewXBD1VyFmZSg3yoyUALrg2Oae7OfJCphuhXZK0OY+
	P7GoVOPPTyThKfvPUnHKtZm6+DQ4oO5PLMAnHy4ybpwTRCYU9NSRAdRfCOiJpdYAdYilrFca4dg
	zUcsD/pb6UCASAbCodOSO9Kcv4cROqViXluN+4DsYAGz79ayL7SCbuKjWvDpOSYXdb6JRPcgXr1
	jJ5ltkmnH1cnJ7MJ9xu8e4lOiWaeV54bw==
X-Received: by 2002:a5d:5888:0:b0:47f:97b9:13e1 with SMTP id ffacd0b85a97d-47fb1f13e15mr7975292f8f.31.1785332434788;
        Wed, 29 Jul 2026 06:40:34 -0700 (PDT)
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
Subject: [PATCH v1 16/17] xen/riscv: add guest load emulation for trapped MMIO accesses
Date: Wed, 29 Jul 2026 15:40:21 +0200
Message-ID: <9b18a20367754605efd6a6b5bf09d4483d9c3ab2.1784560663.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1784560663.git.oleksii.kurochko@gmail.com>
References: <cover.1784560663.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d62444/1785332435-BD67C757-853EDD4D/10/73395122804
X-purgate-type: spam
X-purgate-size: 8507

Introduce emulate_load() to decode and emulate guest load instructions
that fault due to MMIO accesses. This provides the basic infrastructure
required for MMIO emulation on RISC-V.

The instruction decode (decode_trapped_insn() and the mask/match chain
for standard and compressed load encodings) is adapted from Linux's KVM
RISC-V implementation. The completion path differs from KVM's,
since Xen dispatches MMIO synchronously to an in-hypervisor handler via
try_handle_mmio() and has no userspace exit/return step equivalent to
KVM's kvm_io_bus_read() / KVM_EXIT_MMIO / kvm_riscv_vcpu_mmio_return()
split.

A fault taken while re-reading the trapped instruction is handled
depending on the faulting translation stage:
 - A VS-stage fault is the guest's own fault (e.g. it modified its page
   tables from another vCPU) and, as in KVM, is redirected to the
   guest's trap vector, with the cause remapped to
   CAUSE_FETCH_PAGE_FAULT since HLVX reports execute-permission failures
   as load faults.
 - A G-stage fault would mean the P2M mapping of the instruction page
   disappeared after the instruction was fetched. KVM must handle this
   by resuming the guest and retrying, as Linux MM can invalidate
   G-stage mappings at any time. Xen does not remove P2M mappings of a
   running domain at the moment, so this case is asserted unreachable with
   BUG_ON(); it will need to be revisited once such removal is implemented.

When a guest load triggers a page fault, the trapped instruction is
decoded using HTINST or, if unavailable, fetched via unprivileged access.
At the moment only virtual interrupt controller (vINTC) traps are
expected to occur, since it is currently the only backend registered
with the MMIO handler dispatch, so in practice the load is emulated via
the vINTC backend and the guest register state is updated accordingly.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/arch/riscv/include/asm/traps.h |   6 ++
 xen/arch/riscv/traps.c             | 162 ++++++++++++++++++++++++++++-
 2 files changed, 167 insertions(+), 1 deletion(-)

diff --git a/xen/arch/riscv/include/asm/traps.h b/xen/arch/riscv/include/asm/traps.h
index 8d4ab664bca9..937295c5c76c 100644
--- a/xen/arch/riscv/include/asm/traps.h
+++ b/xen/arch/riscv/include/asm/traps.h
@@ -4,6 +4,7 @@
 #define ASM__RISCV__TRAPS_H
 
 #include <asm/processor.h>
+#include <asm/riscv_encoding.h>
 
 #ifndef __ASSEMBLER__
 
@@ -13,6 +14,11 @@ struct trap_info {
     register_t stval;
 };
 
+static inline bool is_load_guest_page_fault(unsigned long scause)
+{
+    return (scause == CAUSE_LOAD_GUEST_PAGE_FAULT);
+}
+
 void do_trap(struct cpu_user_regs *cpu_regs);
 void handle_trap(void);
 void trap_init(void);
diff --git a/xen/arch/riscv/traps.c b/xen/arch/riscv/traps.c
index 1c97bd101948..12690ae37aba 100644
--- a/xen/arch/riscv/traps.c
+++ b/xen/arch/riscv/traps.c
@@ -14,7 +14,9 @@
 
 #include <asm/extable.h>
 #include <asm/cpufeature.h>
+#include <asm/guest_access.h>
 #include <asm/intc.h>
+#include <asm/mmio.h>
 #include <asm/processor.h>
 #include <asm/riscv_encoding.h>
 #include <asm/traps.h>
@@ -191,6 +193,11 @@ static void timer_interrupt(void)
     raise_softirq(TIMER_SOFTIRQ);
 }
 
+static always_inline void advance_pc(struct cpu_user_regs *regs, int step)
+{
+    regs->sepc += step;
+}
+
 static always_inline unsigned long get_faulting_gpa(void)
 {
     /*
@@ -210,9 +217,162 @@ static always_inline unsigned long get_faulting_gpa(void)
     return (csr_read(CSR_HTVAL) << 2) | (csr_read(CSR_STVAL) & 0x3);
 }
 
+/*
+ * Determine the trapped instruction which caused a guest MMIO trap.
+ *
+ * Returns true if the trap was redirected to the guest, in which case
+ * the caller must stop emulation and return success. Otherwise *insn
+ * and *insn_len are filled in and the caller should continue decoding.
+ */
+static bool decode_trapped_insn(unsigned long htinst, unsigned long *insn,
+                                unsigned int *insn_len)
+{
+    if ( htinst & 0x1 )
+    {
+        /*
+         * Bit[0] == 1 implies trapped instruction value is
+         * transformed instruction or custom instruction.
+         */
+        *insn = htinst | INSN_16BIT_MASK;
+        *insn_len = (htinst & BIT(1, UL)) ? INSN_LEN(*insn) : 2;
+    }
+    else
+    {
+        struct cpu_user_regs *regs = vcpu_guest_cpu_user_regs(current);
+        struct trap_info utrap = { 0 };
+
+        /*
+         * Bit[0] == 0 implies trapped instruction value is
+         * zero or special value.
+         */
+        *insn = riscv_vcpu_unpriv_read(true, regs->sepc, &utrap);
+        if ( utrap.scause )
+        {
+            /*
+             * A G-stage fault here would mean the P2M mapping of the page
+             * containing the trapped instruction disappeared after it was
+             * fetched. Nothing removes P2M mappings of a running domain yet,
+             * so this cannot happen.
+             *
+             * TODO: Revisit once P2M mappings can be removed at runtime.
+             */
+            BUG_ON(is_load_guest_page_fault(utrap.scause));
+
+            utrap.sepc = regs->sepc;
+            utrap.stval = utrap.sepc;
+
+            riscv_vcpu_trap_redirect(&utrap);
+
+            return true;
+        }
+
+        *insn_len = INSN_LEN(*insn);
+    }
+
+    return false;
+}
+
+/*
+ * Check alignment and dispatch a decoded MMIO access to a registered
+ * handler. On success (0), info->data holds the read value for loads.
+ */
+static int do_mmio(mmio_info_t *info, unsigned long fault_addr,
+                   unsigned int len)
+{
+    /* Fault address should be aligned to length of MMIO */
+    if ( fault_addr & (len - 1) )
+        return -EIO;
+
+    info->gpa = fault_addr;
+    info->len = len;
+
+    switch ( try_handle_mmio(info) )
+    {
+    case IO_HANDLED:
+        return 0;
+    case IO_ABORT:
+        return -EIO;
+    default:
+        return -EOPNOTSUPP;
+    }
+}
+
 static int emulate_load(unsigned long fault_addr, unsigned long htinst)
 {
-    return -EOPNOTSUPP;
+    struct cpu_user_regs *regs = vcpu_guest_cpu_user_regs(current);
+    mmio_info_t info = { .is_write = false };
+    unsigned long insn;
+    unsigned int shift = 0, len, insn_len;
+    bool is_unsigned = false;
+    int rc;
+
+    if ( decode_trapped_insn(htinst, &insn, &insn_len) )
+        return 0;
+
+    /* Decode length of MMIO and whether it is a sign- or zero-extending load */
+    if ( (insn & INSN_MASK_LB) == INSN_MATCH_LB )
+        len = 1;
+    else if ( (insn & INSN_MASK_LBU) == INSN_MATCH_LBU )
+    {
+        len = 1;
+        is_unsigned = true;
+    }
+    else if ( (insn & INSN_MASK_LH) == INSN_MATCH_LH )
+        len = 2;
+    else if ( (insn & INSN_MASK_LHU) == INSN_MATCH_LHU )
+    {
+        len = 2;
+        is_unsigned = true;
+    }
+    else if ( (insn & INSN_MASK_LW) == INSN_MATCH_LW )
+        len = 4;
+#ifndef CONFIG_RISCV_32
+    else if ( (insn & INSN_MASK_LWU) == INSN_MATCH_LWU )
+    {
+        len = 4;
+        is_unsigned = true;
+    }
+#endif
+    else if ( (insn & INSN_MASK_C_LW) == INSN_MATCH_C_LW )
+    {
+        len = 4;
+        insn = RVC_RS2S(insn) << SH_RD;
+    }
+    else if ( (insn & INSN_MASK_C_LWSP) == INSN_MATCH_C_LWSP &&
+              RV_X(insn, SH_RD, 5) )
+        len = 4;
+#ifndef CONFIG_RISCV_32
+    else if ( (insn & INSN_MASK_LD) == INSN_MATCH_LD )
+        len = 8;
+    else if ( (insn & INSN_MASK_C_LD) == INSN_MATCH_C_LD )
+    {
+        len = 8;
+        insn = RVC_RS2S(insn) << SH_RD;
+    }
+    else if ( (insn & INSN_MASK_C_LDSP) == INSN_MATCH_C_LDSP &&
+              RV_X(insn, SH_RD, 5) )
+        len = 8;
+#endif
+    else
+        return -EOPNOTSUPP;
+
+    if ( !is_unsigned )
+        shift = BITS_PER_BYTE * (sizeof(unsigned long) - len);
+
+#ifdef EMULATE_LOAD_DEBUG
+    gdprintk(XENLOG_DEBUG, "pc=%#02lx, addr=%#02lx, len=%d, shift=%d\n",
+             regs->sepc, fault_addr, len, shift);
+#endif
+
+    rc = do_mmio(&info, fault_addr, len);
+    if ( rc )
+        return rc;
+
+    SET_RD(insn, regs, (long)((unsigned long)info.data << shift) >> shift);
+
+    advance_pc(regs, insn_len);
+
+    return 0;
 }
 
 static int emulate_store(unsigned long fault_addr, unsigned long htinst)
-- 
2.54.0


