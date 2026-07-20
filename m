Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FBFAC4452D
	for <xen-devel@archiver.kernel.org>; Mon, 20 Jul 2026 16:03:04 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1367168.1617058 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wlqSC-0002eR-FB; Mon, 20 Jul 2026 16:02:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1367168.1617058; Mon, 20 Jul 2026 16:02:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wlqSC-0002cn-1A; Mon, 20 Jul 2026 16:02:52 +0000
Received: by outflank-mailman (input) for mailman id 1367168;
 Mon, 20 Jul 2026 16:02:50 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wlqSA-0002Sr-Ng
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2026 16:02:50 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wlqSA-00HTbS-4Z
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2026 18:02:50 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a5e46a4-bab6-0a2a0a5309dd-0a2a4501ee0c-16
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 18:02:50 +0200
Received: from [209.85.128.53] (helo=mail-wm1-f53.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a5e46a9-5984-0a2a45010019-d1558035bdbc-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 18:02:49 +0200
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-49556f97a9dso11482295e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 09:02:49 -0700 (PDT)
Received: from fedora (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49563eee22esm31331765e9.1.2026.07.20.09.02.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jul 2026 09:02:48 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1784563369; x=1785168169; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+7kdah3CKoZ2lfUKxn7g0im5G4hErGLWA6eC7dkc6P0=;
        b=AA7fG3jIMuyq4pTWeEgrMihL27S8GqnKQc8o41kqpfgqLbzq0MkFiXHlJ9KjY2uZ32
         XUK3yJ9ikQP2BM0c3UbBhzvwMrcRD73ef42ehKiS+0fzqanqwZbzFpcdzlbS2ydm0h7j
         r+NhuB3F5t2yNSyqaHzBBKSUAm9QNp6sJK34Iz/9fgykvr3meBM2kv2lTXPD9ubMR6pB
         nwGPd+R9xSCEzm1K8qNywStrWK2jJezm263Q66Niz+R5Cs+44pJDmtYhmT2j4jMwCIxi
         48SAqInSLQZDT8W2fbqBGF1F8ize+WDYaT+gtHEyLbiIatylswFHtcXzRJYtjp5HVME6
         FTnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784563369; x=1785168169;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+7kdah3CKoZ2lfUKxn7g0im5G4hErGLWA6eC7dkc6P0=;
        b=Tc3XOWSHiO688fiN6i1NuSskN+fZ++cQgQ9CV4Trwq2jd3K19HA8ceKGZWWub+Mgg6
         7/uj3rDiv4Vp4LTlAucEQQrmHGn+9ZPvodnMAwUobJnVDRUvLtcqOrjADNUOSLP6JSFK
         loXpwCmu7QmfQPqAUvXy27eanCRL7EPTP6GX2lHut+MLVq/9Q1onG/Y8AR3rOkZxUJsr
         /osLfqMWDYqxXNStx/wti8dUP8Naxae1p3/QKtPP/a+MmCmqs2ZOihu9JguV7sDDpTRt
         2fK7k8teYhqQJj21moZt+o9CRTVDCqzLy2LwYQ564cvtXeoVCH+zL14qDlxbTVttLQ6a
         /lTQ==
X-Gm-Message-State: AOJu0YxmB2pTfSqqM6Vr3Q9PODYS70MK06szD9ijqe/HdW+NE6wGjxh2
	MWsRA58o/LHXt/A/clpXR+Ea3yIKOOHAb9VXijkumvI8pTcnq7jSLNjSBsDQ5w==
X-Gm-Gg: AfdE7cksvWEttfLi4lr74Re6ynkfDzutaAQuZlDM0YvednfDQrIUzcctsw8uSQgO3dK
	L9oNtJqC1WkP2KZcLgOpS70TiNhKBLzxLuEukf/bc91cPxEl/z5wLt60rOIKdWo2nbAsyPRGrEY
	zl4U40XYDdUsjRFHUnnWPZ+oUfRbQKW9R3T5lPVfspAIJa1rbPK0AYn+sPsszZHDMUkEry/XOy2
	OZQV6JmIQU5K6sLLVTqcTmsKNxeTAtWpJoATdena/tqLFO5COBIIAy0aADJ8araoVVuB1A6Ix8z
	keMFx0I+g/TZhEyWNrSKr2qt56VsmDnqMHqCH5l7bM5AJYBnAkEqvgDdT75NtlJqtucJuiRhDHI
	KbKDhfGt1na0FghmZN9QzQeR4UIlVL0ED9vqOXF0Bgdl/Jkd9t7EUHd+lCOPr2nSBMCBAepCBcY
	TNvghiGsi/AizzGhEGElbmU7XweQ6Svf1TfkAIGMAIC1izMEQ=
X-Received: by 2002:a05:600c:6d82:b0:495:4072:4194 with SMTP id 5b1f17b1804b1-4954a40c4acmr113085805e9.28.1784563368763;
        Mon, 20 Jul 2026 09:02:48 -0700 (PDT)
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
Subject: [PATCH v1 13/17] xen/riscv: add unprivileged guest memory read helper
Date: Mon, 20 Jul 2026 18:02:11 +0200
Message-ID: <79cfa875e9dfc14bbcad948c20f4008b03d11f72.1784560663.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1784560663.git.oleksii.kurochko@gmail.com>
References: <cover.1784560663.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d62444/1784563369-BD341757-3A816EDB/10/73395122804
X-purgate-type: spam
X-purgate-size: 5698

Introduce riscv_vcpu_unpriv_read() to allow Xen to safely read guest memory
using HLV/HLVX instructions while reliably capturing trap context.

This is required for instruction fetch emulation and MMIO decoding, where
Xen must inspect guest memory that may not be directly accessible and may
fault.

The implementation is based on kvm_riscv_vcpu_unpriv_read() from Linux,
with one deviation: the hlv/hlvx instructions translate the guest address
through the live vsatp/hgatp CSRs, i.e. through the address space of the
currently running vCPU, so the function can only be called safely for
current. Instead of taking a struct vcpu argument, it always operates on
current directly.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/arch/riscv/guestcopy.c                | 91 +++++++++++++++++++++++
 xen/arch/riscv/include/asm/guest_access.h |  6 ++
 2 files changed, 97 insertions(+)

diff --git a/xen/arch/riscv/guestcopy.c b/xen/arch/riscv/guestcopy.c
index 8a89212e0bea..57844bc442f6 100644
--- a/xen/arch/riscv/guestcopy.c
+++ b/xen/arch/riscv/guestcopy.c
@@ -6,6 +6,7 @@
 #include <xen/string.h>
 
 #include <asm/guest_access.h>
+#include <asm/traps.h>
 
 #define COPY_from_guest     0U
 #define COPY_to_guest       BIT(0, U)
@@ -114,3 +115,93 @@ unsigned long copy_to_guest_phys(struct domain *d, paddr_t gpa, void *buf,
     return copy_guest(buf, gpa, len, GPA_INFO(d),
                       COPY_to_guest | COPY_gpa);
 }
+
+/*
+ * Read machine word from Guest memory
+ *
+ * @read_insn: Flag representing whether we are reading instruction
+ * @guest_addr: Guest address to read
+ * @trap: Output pointer to trap details
+ *
+ * The hlv/hlvx instructions translate guest_addr through the live
+ * vsatp/hgatp CSRs, so the read is only meaningful for the address
+ * space of the currently running vCPU.
+ */
+unsigned long riscv_vcpu_unpriv_read(bool read_insn,
+                                     unsigned long guest_addr,
+                                     struct trap_info *trap)
+{
+    unsigned long val, tmp;
+    unsigned long flags, old_hstatus;
+
+    /*
+     * As hstatus is going to be changed we don't want an interrupt to occur
+     * with guest's hstatus register.
+     */
+    local_irq_save(flags);
+
+    /*
+     * The hypervisor virtual-machine load and store instructions are valid
+     * only in M-mode or HS-mode, or in U-mode when hstatus.HU=1. Each
+     * instruction performs an explicit memory access as though V=1; i.e.,
+     * with the address translation and protection, and the endianness,
+     * that apply to memory accesses in either VS-mode or VU-mode.
+     * Field SPVP of hstatus controls the privilege level of the access.
+     * The explicit memory access is done as though in VU-mode when SPVP=0,
+     * and as though in VS-mode when SPVP=1.
+     *
+     * So it is necessary to restore vCPU's hstatus before execution of
+     * hlv* instruction.
+     */
+    old_hstatus = csr_swap(CSR_HSTATUS,
+                           vcpu_guest_cpu_user_regs(current)->hstatus);
+
+    if ( read_insn )
+    {
+        asm volatile ( "\n"
+            "1:\n"
+            "   hlvx.hu %[val], (%[addr])\n"
+            ASM_EXTABLE_TRAP_INFO(1b, 3f, %[ti])
+            "   andi %[tmp], %[val], 3\n"
+            "   addi %[tmp], %[tmp], -3\n"
+            "   bne %[tmp], zero, 3f\n"
+            "   addi %[addr], %[addr], 2\n"
+            "\n"
+            "2:\n"
+            "   hlvx.hu %[tmp], (%[addr])\n"
+            ASM_EXTABLE_TRAP_INFO(2b, 3f, %[ti])
+            "   sll %[tmp], %[tmp], 16\n"
+            "   add %[val], %[val], %[tmp]\n"
+            "3:\n"
+        : [val] "=&r" (val), [tmp] "=&r" (tmp), [addr] "+&r" (guest_addr)
+        : [ti] "r" (trap) : "memory" );
+
+        /*
+         * Although HLVX instructions' explicit memory accesses require execute
+         * permissions, they still raise the same exceptions as other load
+         * instructions, rather than raising fetch exceptions instead.
+         */
+        if ( trap->scause == CAUSE_LOAD_PAGE_FAULT )
+            trap->scause = CAUSE_FETCH_PAGE_FAULT;
+    }
+    else
+    {
+        asm volatile ( "\n"
+            "1:\n"
+#ifdef CONFIG_RISCV_64
+            "hlv.d %[val], (%[addr])\n"
+#else
+            "hlv.w %[val], (%[addr])\n"
+#endif
+            "2:\n"
+            ASM_EXTABLE_TRAP_INFO(1b, 2b, %[ti])
+        : [val] "=&r" (val)
+        : [addr] "r" (guest_addr), [ti] "r" (trap) : "memory" );
+    }
+
+    csr_write(CSR_HSTATUS, old_hstatus);
+
+    local_irq_restore(flags);
+
+    return val;
+}
diff --git a/xen/arch/riscv/include/asm/guest_access.h b/xen/arch/riscv/include/asm/guest_access.h
index 8d679319ded0..153ec6ce26d1 100644
--- a/xen/arch/riscv/include/asm/guest_access.h
+++ b/xen/arch/riscv/include/asm/guest_access.h
@@ -5,6 +5,8 @@
 #include <xen/types.h>
 
 struct domain;
+struct trap_info;
+struct vcpu;
 
 unsigned long raw_copy_to_guest(void *to, const void *from, unsigned len);
 unsigned long raw_copy_from_guest(void *to, const void *from, unsigned len);
@@ -25,6 +27,10 @@ unsigned long raw_clear_guest(void *to, unsigned int len);
 unsigned long copy_to_guest_phys(struct domain *d, paddr_t gpa, void *buf,
                                  unsigned long len);
 
+unsigned long riscv_vcpu_unpriv_read(bool read_insn,
+                                     unsigned long guest_addr,
+                                     struct trap_info *trap);
+
 #endif /* ASM__RISCV__GUEST_ACCESS_H */
 /*
  * Local variables:
-- 
2.54.0


