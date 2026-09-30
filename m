Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B866CA5FC4
	for <xen-devel@archiver.kernel.org>; Wed, 30 Sep 2026 16:24:36 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1437557.1656571 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBx6Z-0005te-L8; Wed, 30 Sep 2026 16:24:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1437557.1656571; Wed, 30 Sep 2026 16:24:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBx6Z-0005sq-7L; Wed, 30 Sep 2026 16:24:27 +0000
Received: by outflank-mailman (input) for mailman id 1437557;
 Wed, 30 Sep 2026 16:24:25 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xBx6W-0005Kk-Rg
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2026 16:24:24 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xBx6W-00GhY9-7w
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2026 18:24:24 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6abd37a8-8faa-0a2a0a5109dd-0a2a45069d94-18
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 18:24:24 +0200
Received: from [74.125.225.141] (helo=mail-wm2-f13.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6abd37b8-195a-0a2a45060019-4a7de18de0c4-3
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 18:24:24 +0200
Received: by mail-wm2-f13.google.com with SMTP id
 5b1f17b1804b1-49e79a408deso35150055e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 09:24:24 -0700 (PDT)
Received: from fedora (user-109-243-71-234.play-internet.pl. [109.243.71.234])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a01cd43e66sm14620485e9.2.2026.09.30.09.24.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Sep 2026 09:24:23 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1790785464; x=1791390264; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tqwkuuchWfrTIyA6KjmXq5aMj+FhTurJK2/FofFtnjA=;
        b=in22vjwjcsjBB8JqGiun1WuGUGKYe7Tgwffksy5RX7uYiMDABtzH9/4vFCFJmaK8YH
         79NcL0KFPIRMXDMWpqqcEKHsX5T2+U4TTw7NiGJVscCyCskicuj0xeQpp0CGwOzN34Z7
         Qz4367Y9EJ4gc5ck6jT3ufIQdV9pw7kRXgKy6mjSR4Ymwq/2MbtKDBuDSmDeYK5DzkgQ
         ubKysVyI0V5kOz+8tCiAnUSXVxlqR0TPAxo99618vQ1FZEjA1X25eYTyvYoqV557MSj0
         a26nF5WGn7bkjAi0k+IAQiFYSMnmilpLH9FzpLpmvrGzMKh6W19rd478AXKQZ9Fve2As
         xMNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790785464; x=1791390264;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tqwkuuchWfrTIyA6KjmXq5aMj+FhTurJK2/FofFtnjA=;
        b=ofjU6dffKu1t0+7C4OT2FYFMUxTYkVt0uI0egqbVkP5KbVzHqKN1GaJ5OtFrYrSCID
         +65eIpEbHFZiYq5WFPEIzu+/OrtRNSdPwat2Kq/spR5K6AEtM9Qrxc3gYbUqttjH+7OG
         fZFjzFY8BDHoJKYF1Z7L7cJ1aS+k7TfYRUAAuxrugPtftIhRPQzByHeMuiy7wBxVFH++
         4JJ+yp+GWTvtmvUOSBN0uyZRBtmJCZUftsOaYdATE37um+5HwHzjHlQqYOZoVCqa08O7
         DxK86sJPVcg0minxeg2f9XZh8DP6jEq0pkQqjtcJnSyIPlTWTBXb5eAv13rk64oSZyLY
         g/Lg==
X-Gm-Message-State: AFuF++lpImlN1dQe8aPhXbhXhSRb49bnfYBZIrspnKTlqW/KbqLs8wZI
	WLunz6nKYpQZhLlT30+M4cQZT05CPUFxmqxmEwsO9hhdMtXOJvjAkm6hKYx4RA==
X-Gm-Gg: AYBFou1oRC5geXVNTRx9Lz3jzDrYpad5J6Wamy07U89UOL5odbcsa2zudC+ImHdch9c
	qvmd3mFUDmdsKqNKV8rdLHcUBB80a1+SXic1RVc3Cubz9O7iKL0/yvXBsntnUGXhhfuqDOrahHh
	sRdtKLYYr+2xPY7s8axVxp4xrsgCX5e9dV10SH0z190FBfv7wtpfJfNYTOpuP0NZ1LPODncsiUV
	bKn1SGTif88pcPlzsglozfxh7Zxl44ozlvFAmSeI1gPvuoU1HwFlgKaYwWdumYZB2CIdftVHBdF
	fHF5Uu578ZIAn8TDwPL+usj69Mj1cxOrgjpZTIWbyy1CllJWxPLr91LCTFQOjnVOaM9+TqJyX0K
	zG4whq5qrUu8NuuzuXVllQ9hjsVQPJBOG35gf9yk88Z71vlBVPWyrF8j+iti5qj07jIiQKSy6WT
	z/ZfXpezIo9JQ6B7y55UPsPyZQGkZrHKxeNbLwvk5+RO3MTA0ocjlLk1/XTcrPAOP75FKpiDPkH
	u6J1ZwdSMwAaUEGv7fWczrcNj6jX07HXdru6aF6
X-Received: by 2002:a05:600d:8642:10b0:4a0:1b15:8852 with SMTP id 5b1f17b1804b1-4a01b1588bfmr26290095e9.16.1790785463495;
        Wed, 30 Sep 2026 09:24:23 -0700 (PDT)
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
Subject: [PATCH v3 21/39] xen/riscv: add guest memory read helper
Date: Wed, 30 Sep 2026 18:23:40 +0200
Message-ID: <c77408157f7674ad2ffc775d1267470b724fdecf.1790779209.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1790779209.git.oleksii.kurochko@gmail.com>
References: <cover.1790779209.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-16d1c6/1790785464-FCC0777B-E8E2890A/10/73395122804
X-purgate-type: spam
X-purgate-size: 8247

Introduce read_guest() to allow Xen to safely read guest memory using
HLV/HLVX instructions while reliably capturing trap context.

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
Changes in v3:
 - Rename riscv_read_guest() to read_guest().
 - Document that @trap must be zero-initialised by the caller: it is
   written only when an access faults, so trap->scause == 0 on return is
   what tells the caller that the read succeeded.
 - Drop the ASSERT() on hstatus.SPV: vcpu_guest_cpu_user_regs(current)
   is the guest frame whatever context Xen is in, so SPV is always set in
   it and the check couldn't catch a call made from a nested trap. State
   in the comment above read_guest() that it must not be called from a
   nested trap taken in HS-mode instead.
 - Declare read_guest() in asm/guest_access.h.
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
 xen/arch/riscv/guestcopy.c                | 88 +++++++++++++++++++++++
 xen/arch/riscv/include/asm/guest_access.h |  4 ++
 2 files changed, 92 insertions(+)

diff --git a/xen/arch/riscv/guestcopy.c b/xen/arch/riscv/guestcopy.c
index 8a89212e0bea..4aa5a0d967ba 100644
--- a/xen/arch/riscv/guestcopy.c
+++ b/xen/arch/riscv/guestcopy.c
@@ -6,6 +6,7 @@
 #include <xen/string.h>
 
 #include <asm/guest_access.h>
+#include <asm/traps.h>
 
 #define COPY_from_guest     0U
 #define COPY_to_guest       BIT(0, U)
@@ -114,3 +115,90 @@ unsigned long copy_to_guest_phys(struct domain *d, paddr_t gpa, void *buf,
     return copy_guest(buf, gpa, len, GPA_INFO(d),
                       COPY_to_guest | COPY_gpa);
 }
+
+/*
+ * Read machine word from guest memory
+ *
+ * @guest_addr: Guest address to read
+ * @read_insn: Flag representing whether we are reading instruction
+ * @trap: Output pointer to trap details if something went wrong during read.
+ *        It must be zero-initialised by the caller: it is written only when
+ *        an access faults, so trap->scause == 0 on return is what tells the
+ *        caller that the read succeeded.
+ *
+ * The hlv/hlvx instructions translate guest_addr through the live
+ * vsatp/hgatp CSRs, so the read is only meaningful for the address
+ * space of the currently running vCPU. It must therefore only be called
+ * while handling a trap taken from that vCPU, never from a nested trap
+ * taken in HS-mode, which may have interrupted Xen at a point where
+ * hstatus, vsatp or hgatp don't belong to the vCPU.
+ *
+ * At most two halfwords are fetched when @read_insn is true, i.e. encodings
+ * wider than 32 bits are not supported. Such an encoding cannot be completed
+ * by calling this function again at @guest_addr + 4: the length check is
+ * applied to the first halfword read, which would then be a continuation of
+ * the instruction rather than its opcode. It is up to the caller to reject
+ * anything that is neither a 16- nor a 32-bit encoding.
+ */
+unsigned long read_guest(unsigned long guest_addr, bool read_insn,
+                         struct trap_info *trap)
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
+     */
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
diff --git a/xen/arch/riscv/include/asm/guest_access.h b/xen/arch/riscv/include/asm/guest_access.h
index 8d679319ded0..41c6ede4baae 100644
--- a/xen/arch/riscv/include/asm/guest_access.h
+++ b/xen/arch/riscv/include/asm/guest_access.h
@@ -5,6 +5,7 @@
 #include <xen/types.h>
 
 struct domain;
+struct trap_info;
 
 unsigned long raw_copy_to_guest(void *to, const void *from, unsigned len);
 unsigned long raw_copy_from_guest(void *to, const void *from, unsigned len);
@@ -25,6 +26,9 @@ unsigned long raw_clear_guest(void *to, unsigned int len);
 unsigned long copy_to_guest_phys(struct domain *d, paddr_t gpa, void *buf,
                                  unsigned long len);
 
+unsigned long read_guest(unsigned long guest_addr, bool read_insn,
+                         struct trap_info *trap);
+
 #endif /* ASM__RISCV__GUEST_ACCESS_H */
 /*
  * Local variables:
-- 
2.55.0


