Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21760C61DC4
	for <xen-devel@archiver.kernel.org>; Thu, 27 Aug 2026 15:22:28 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1400966.1636724 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzbvn-00044q-B0; Thu, 27 Aug 2026 15:22:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1400966.1636724; Thu, 27 Aug 2026 15:22:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzbvm-00043E-KC; Thu, 27 Aug 2026 15:22:18 +0000
Received: by outflank-mailman (input) for mailman id 1400966;
 Thu, 27 Aug 2026 15:22:16 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wzbvk-0003cR-FE
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2026 15:22:16 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wzbvj-003Nzp-Rn
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2026 17:22:15 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a905627-8faa-0a2a0a5109dd-0a2a450bdcc6-0
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 17:22:15 +0200
Received: from [209.85.128.46] (helo=mail-wm1-f46.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a905627-b7e8-0a2a450b0019-d155802eb420-3
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 17:22:15 +0200
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-49b14637dfdso5514575e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 08:22:15 -0700 (PDT)
Received: from fedora (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49b4b2d6b30sm57441155e9.14.2026.08.27.08.22.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Aug 2026 08:22:14 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1787844135; x=1788448935; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aSYcksaoNZwls6A65DTca2yUNFfZ7PKVnJOQ7ecrw0c=;
        b=P4thFkEW1tDIghNFmt1iHTz8MRejqDB8yojr3dD15BDDWkiu+bU+O6x0vJZhQxkq11
         0zzQpARafoHQiSdxTTsB8xuBXeweg7wxrxfdt1bZhT/dGkAaKwXeHZwzbZyVlAH0ezte
         a17evhYm7NOmvTzdWRGkkgTm930D7b5174GcZSyH+XesTzBPjsrFLkIk4WgOuM8EUOMB
         v6Nrvdca+x9BR+UaAfeRy57pB82QQ3yXGS9Cu4KlJnvkpCGZS7Y6zGfPbHvN3AS7eMvZ
         3trKrkcGz3N/SC3b0YsnFGQjv26oWZ69pqDDnH2m3mH0Z/6zp3HYI1s9s5gFrQwiTyks
         FWzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787844135; x=1788448935;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aSYcksaoNZwls6A65DTca2yUNFfZ7PKVnJOQ7ecrw0c=;
        b=IgWKfrK3vBRxA0tkV5szV06FMQpaltv3iUa7zsg16ZfgvJLaRoZi1iuuCUUtkk/gcf
         nuhhYK0q1Wlq1qGOKe2VAAYbwyOP1vXXW8HueKSGwi76Yf69fkbMYOknv5coaCe8mTud
         umbUUxm65ra+naq6FZaccSTenssXC2UbG3sxVdwhX+B8eCbhimcw/8P7XHfXUl9ltzF0
         dDIUPpCgev1lXgc0KDPNYxP6xAB5zFD6pqkfyCQ0qkVYoRSJ9H4u07TgaEwD16clLwbj
         sfjBs7YtzMflF+Amdu+cCdxPtGgNMecWS/82Yi7UHglaFQfURTxffd12ORi4ydvJy9CO
         chSg==
X-Gm-Message-State: AFuF++lD9Bb/c9dYyfJpWM5TJPiKVdi6kbTefBtbKHDauZ9HgM2xc7JW
	XA7hgRek10BE7ta29FP4K55eTrdy5wgMaQ9JHTiolSv9ymvSIWjMWguPdDko5A==
X-Gm-Gg: AR+sD11QZITBkBdPcDwTtBAyq46ljeYsAP9M+OdQtR7VAHAZjdBiMrkUPV1ZscP6qqg
	E64gLH2qqDnBua1aizy6kRuRRW6AGuZQmUBHz7wCZBa5voJ7Cyp7qRf9cJFa6yRO0Z6XEmvjSTl
	jqOzBqxd7mfH0BiEQ4qr2M4ZR+SPRghZbrSfynivInTJ03d47wTXf+PVKSvGTej/YF93/s2ZWBu
	jeb9zYch8gaIDqQ42x/jhQKfgsWItccK3VD8E0pRSuq8t5srDGY8Ecuf1wU3Nkfs6SxrJ+gOApS
	SrG4cVHV1OdoTfhPSR4V02mJwQoqZGFAGTqa8zLTo1Me5BQB0zUAw1ep5OJ39ajTjvt4l/bds/D
	Xz78cy0hq8LAAoRIebBZXvJSzvSOwM2buS5SbfkswcZOCHQ47qDB4bmpeaaj6fmXqdjnSvojsHE
	wG0OjEkLIubLOTov8pPpmE1wbkGJU6OHYsEVq3pcnasHMNDjBfUTScL46FT9X1Y2EHYsyw7yvmw
	QljXDHWYTq3l3La2GyFVfnMGATfG9cT
X-Received: by 2002:a05:600c:1c09:b0:49b:8f01:7119 with SMTP id 5b1f17b1804b1-49b8f017186mr73761075e9.14.1787844134926;
        Thu, 27 Aug 2026 08:22:14 -0700 (PDT)
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
Subject: [PATCH v2 22/39] xen/riscv: add guest memory read helper
Date: Thu, 27 Aug 2026 17:21:06 +0200
Message-ID: <b68a29b7ef5b2cb83fde405b3854c94a2f44f4d0.1787838835.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1787838835.git.oleksii.kurochko@gmail.com>
References: <cover.1787838835.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-42698a/1787844135-194C39EA-EDA43B15/10/73395122804
X-purgate-type: spam
X-purgate-size: 6481

Introduce riscv_read_guest() to allow Xen to safely read guest memory
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
Changes in v2:
 - Rename riscv_vcpu_unpriv_read() to riscv_read_guest() and make the guest
   address the first parameter. "unprivileged" described how hlv/hlvx perform
   the access rather than what the helper is for, and "unprivileged guest"
   reads as a synonym for DomU although the helper works for any domain.
 - Drop the hstatus save/restore and the local_irq_save() protecting it:
   hstatus already belongs to the vCPU which trapped, as Xen never installs
   a value of its own and does not reschedule before returning to the guest.
   ASSERT() hstatus.SPV in the saved copy instead, which also documents that
   the helper is only usable while handling a trap from a guest.
 - Poison val with ~0UL and make [val] "+&r": the fixup for the first access
   resumes past the loads without writing it, so a caller which checks
   trap->scause is no longer handed an uninitialized value.
 - Describe the trap_info write with a "+m" (*trap) operand instead of a
   "memory" clobber; the exception handler writes that structure and nothing
   else.
 - Combine the two halfwords with slli/or instead of sll/add, and use bnez
   for the instruction length check.
 - Turn the hlv.d/hlv.w selection into #if/#elif with an #error default,
   rather than silently using hlv.w for anything that is not RV64.
 - Document that at most two halfwords are fetched, i.e. that encodings
   wider than 32 bits are unsupported and cannot be completed by calling the
   helper again at guest_addr + 4, since the length check would then be
   applied to a continuation halfword.
---
---
 xen/arch/riscv/guestcopy.c | 87 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 87 insertions(+)

diff --git a/xen/arch/riscv/guestcopy.c b/xen/arch/riscv/guestcopy.c
index 8a89212e0bea..b2327822acaa 100644
--- a/xen/arch/riscv/guestcopy.c
+++ b/xen/arch/riscv/guestcopy.c
@@ -6,6 +6,7 @@
 #include <xen/string.h>
 
 #include <asm/guest_access.h>
+#include <asm/traps.h>
 
 #define COPY_from_guest     0U
 #define COPY_to_guest       BIT(0, U)
@@ -114,3 +115,89 @@ unsigned long copy_to_guest_phys(struct domain *d, paddr_t gpa, void *buf,
     return copy_guest(buf, gpa, len, GPA_INFO(d),
                       COPY_to_guest | COPY_gpa);
 }
+
+/*
+ * Read machine word from guest memory
+ *
+ * @guest_addr: Guest address to read
+ * @read_insn: Flag representing whether we are reading instruction
+ * @trap: Output pointer to trap details if something went wrong during read
+ *
+ * The hlv/hlvx instructions translate guest_addr through the live
+ * vsatp/hgatp CSRs, so the read is only meaningful for the address
+ * space of the currently running vCPU.
+ *
+ * At most two halfwords are fetched when @read_insn is true, i.e. encodings
+ * wider than 32 bits are not supported. Such an encoding cannot be completed
+ * by calling this function again at @guest_addr + 4: the length check is
+ * applied to the first halfword read, which would then be a continuation of
+ * the instruction rather than its opcode. It is up to the caller to reject
+ * anything that is neither a 16- nor a 32-bit encoding.
+ */
+unsigned long riscv_read_guest(unsigned long guest_addr, bool read_insn,
+                               struct trap_info *trap)
+{
+    /*
+     * Poison the result: if the very first access faults, the fixup skips
+     * over the loads without writing it. Callers must check trap->scause.
+     */
+    unsigned long val = ~0UL, tmp;
+
+    /*
+     * hlv/hlvx use hstatus.SPVP for the privilege of the access, and the
+     * live vsatp/hgatp for the translation. Xen never installs a value of
+     * its own in hstatus (it is only saved on trap entry and restored
+     * before sret) and it doesn't reschedule before returning to the
+     * guest, so all three still belong to the vCPU which trapped.
+     *
+     * Check the saved copy rather than the live CSR: a nested trap taken
+     * from HS-mode clears hstatus.SPV in the CSR (but leaves SPVP alone).
+     */
+    ASSERT(vcpu_guest_cpu_user_regs(current)->hstatus & HSTATUS_SPV);
+
+    if ( read_insn )
+    {
+        asm volatile ( "\n"
+            "1: hlvx.hu %[val], (%[addr])\n"
+            ASM_EXTABLE_TRAP_INFO(1b, 3f, %[ti])
+            "   andi %[tmp], %[val], 3\n"
+            "   addi %[tmp], %[tmp], -3\n"
+            "   bnez %[tmp], 3f\n"
+            "   addi %[addr], %[addr], 2\n"
+            "\n"
+            "2: hlvx.hu %[tmp], (%[addr])\n"
+            ASM_EXTABLE_TRAP_INFO(2b, 3f, %[ti])
+            "   slli %[tmp], %[tmp], 16\n"
+            "   or %[val], %[val], %[tmp]\n"
+            "3:\n"
+        : [val] "+&r" (val), [tmp] "=&r" (tmp), [addr] "+&r" (guest_addr),
+          "+m" (*trap)
+        : [ti] "r" (trap) );
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
+            "1: "
+#if defined(CONFIG_RISCV_64)
+            "hlv.d %[val], (%[addr])\n"
+#elif defined(CONFIG_RISCV_32)
+            "hlv.w %[val], (%[addr])\n"
+#else
+# error "unsupported RISC-V variant: no hlv for a machine word"
+#endif
+            "2:\n"
+            ASM_EXTABLE_TRAP_INFO(1b, 2b, %[ti])
+        : [val] "+&r" (val), "+m" (*trap)
+        : [addr] "r" (guest_addr), [ti] "r" (trap) );
+    }
+
+    return val;
+}
-- 
2.55.0


