Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3788E606A332
	for <xen-devel@archiver.kernel.org>; Fri, 13 Nov 2026 15:49:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sVyczNPO
Received: from list by lists.xenproject.org with outflank-mailman.1487737.1690084 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRtWw-0004Ss-Mf; Fri, 13 Nov 2026 15:49:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1487737.1690084; Fri, 13 Nov 2026 15:49:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRtWv-0004P2-69; Fri, 13 Nov 2026 15:49:33 +0000
Received: by outflank-mailman (input) for mailman id 1487737;
 Fri, 13 Nov 2026 15:49:29 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xRtWq-0003fb-Ru
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2026 15:49:28 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xRtWq-00AqRw-8W
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2026 16:49:28 +0100
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6af73183-8faa-0a2a0a5109dd-0a2a450a8adc-16
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 16:49:28 +0100
Received: from [209.85.221.48] (helo=mail-wr1-f48.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6af73188-f2d2-0a2a450a0019-d155dd30a8a4-3
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 16:49:28 +0100
Received: by mail-wr1-f48.google.com with SMTP id
 ffacd0b85a97d-4910b863b84so1324459f8f.0
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 07:49:28 -0800 (PST)
Received: from fedora (user-109-243-65-71.play-internet.pl. [109.243.65.71])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-49c5f1c0e0dsm5786493f8f.15.2026.11.13.07.49.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Nov 2026 07:49:27 -0800 (PST)
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
        d=gmail.com; s=20260707; t=1794584968; x=1795189768; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HnbLkBCaQmJCPPz2OoO2v3ph+wl5t46MRt1Xo8JrrZ4=;
        b=sVyczNPObZOA8sExYh6iH2vXO+EERhuj16gVW+iFb++GFAlumpwsZh/CsAR1Bf6syY
         7RuLSqdMAn0c+xksaimXq/Qvzm1IJ7sVcVg7NPJ9KJSlS2s2xSNmIgixr8g3IwtlRQdi
         V7TaOY9GpzWKIehCwfjs0bSQ17hRLcq1WrBa46ftsgCNxrHZgaIS6qlq/RrkmOWgSUU1
         sh1LhlL+PK2o8LZZxMcc5E3BAZ5g2wr1myuOoOJCd6w37zSDPMJa40Xet0QS/mat7kG+
         hN0u7SChzEYTzmuVZj0auuWSDIskWyNxxPoT5ykmzzOwIhc8aRwoc4nBBTr/UCkjf6eR
         nA5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794584968; x=1795189768;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HnbLkBCaQmJCPPz2OoO2v3ph+wl5t46MRt1Xo8JrrZ4=;
        b=s2yL5o1rruuz3Cslhq/pSSxGshM5n5nXJLn6Tc/0J/GQb83zxoGh84K4KEvQinq62g
         JYPrWlCQCGCz7AIzo4NNJGIkbhke8zWSkT0WGwwwwoVcV5M1MJlQKBnxJbyAlT/qmioj
         IQ3v1vKRTGeRhzovqb0/b/so7GmUGxSVQAHx/qHfLfO9c9rDCnPTPuX3Skpn44VM8+Jk
         FR+Ly3/7Aoc+vYxNOIGu9xYBrIEPe/3fmT5ZFQz5Zi/QMHF9Rz6GH3pc6I49hh7D6bbN
         Kp/5Pu26hd4GzVIugZegEGruaZutK+tQR7sB0IWKVcXpqVBhjHjw6Sbt/VdDOGYGE//m
         KHYA==
X-Gm-Message-State: APuU4Z+6V8XHYxiinzD1W0ISIM11gS3ef1e5cNL4bBqPMBiQ576WDNaW
	/PcqpRQvO/ceXlPMxQjrgfOERRq+CuspfAkD16m/zmDDzChQL+T9RC9Z/YZAAQ==
X-Gm-Gg: AYBFou18WmfZ2jA/9NfoJ5H6fZ6ipCahODewwJi0yubFDD4TgIDpM5K2Ykat2a/wMyN
	WI0fBBfigKvPM6ZDO0TG4GG1oP8eIkfvdX9FiabtZfrjMfPB8GiYdZLPOl0AO9KghzPPddoxIrA
	lLG1oTLUhyS8g7v6RbTLcif6jXpQvjdF0d6QTiE1923eWFJTRIJWY41i8Qo1VY/QtiZnNMuMOWM
	ock68V4+psmFf5HmPiadtGiqyvu+YBzbT7eVAx7gG+8PDvqLfv2rkIO32h6u+y1CPIX43rL3t3h
	WtpLwOTEnbAYel44+bLUNJfjI+GI154O0f4OkuWk0ep/djf+uGmx93CqjU8VwqBRU3zhaJDRRYE
	BkUgOMi6RBwLt0NRfgKGnb5vg9aoTyJq1nKvqxuhKZyyREsWWEcOrxf/KiBIeVxDpr0oaEsBobm
	IqeS9RaHo5KsnIUn9uZYeY6ZCAur6Q7zy5xeKqD8K0vG2KqzsAQgXNhfHijZHsiYvM7lCM7YKxi
	pigVuONRU4h4JztJVFapov9FzDrLSPF6yeDmX0zahKh6IECX1VvEHn12izjXDPqUSr9Awn0Z8Vm
	ZvnhHEKlPAM+3wt1rspuvYrCsMask3yeaHLhjIiE0BgwsFNvOzYD9DiN7E8NPOR7foIV
X-Received: by 2002:a05:6000:1787:b0:495:728a:5f6f with SMTP id ffacd0b85a97d-49c70823789mr6920294f8f.19.1794584967515;
        Fri, 13 Nov 2026 07:49:27 -0800 (PST)
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
Subject: [PATCH v4 19/42] xen/riscv: add guest memory read helper
Date: Fri, 13 Nov 2026 16:48:40 +0100
Message-ID: <3fceebfe7b50e267c57d8c2af9fe75e9e9ef3146.1794562488.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <cover.1794562488.git.oleksii.kurochko@gmail.com>
References: <cover.1794562488.git.oleksii.kurochko@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-4011c0/1794584968-585CBCFC-36B7EEFF/10/73395122804
X-purgate-type: spam
X-purgate-size: 10742
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

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

do_trap() looks up the exception table for any trap taken in Xen
context, so a fault of these accesses reaches its fixup. Update the
comments there, which still name only probing accesses and say that Xen
can't take a guest page fault itself.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in v4:
 - Update the comments in do_trap() on the exception table lookup and
   on the guest page fault case. "xen/riscv: look up the exception table
   for any trap taken in Xen context" used to do that, but went to
   staging without it.
 - Move the comment describing read_guest() to its declaration in
   asm/guest_access.h.
 - Explain the check of bits[1:0] of the first halfword fetched by
   read_guest().
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
 xen/arch/riscv/guestcopy.c                | 68 +++++++++++++++++++++++
 xen/arch/riscv/include/asm/guest_access.h | 28 ++++++++++
 xen/arch/riscv/traps.c                    | 13 +++--
 3 files changed, 104 insertions(+), 5 deletions(-)

diff --git a/xen/arch/riscv/guestcopy.c b/xen/arch/riscv/guestcopy.c
index 8a89212e0bea..283a96322caa 100644
--- a/xen/arch/riscv/guestcopy.c
+++ b/xen/arch/riscv/guestcopy.c
@@ -6,6 +6,7 @@
 #include <xen/string.h>
 
 #include <asm/guest_access.h>
+#include <asm/traps.h>
 
 #define COPY_from_guest     0U
 #define COPY_to_guest       BIT(0, U)
@@ -114,3 +115,70 @@ unsigned long copy_to_guest_phys(struct domain *d, paddr_t gpa, void *buf,
     return copy_guest(buf, gpa, len, GPA_INFO(d),
                       COPY_to_guest | COPY_gpa);
 }
+
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
+            /*
+             * bits[1:0] != 0b11: 16-bit (compressed) instruction, nothing
+             * more to read.
+             */
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
index e94aa838a3e7..77911bffbdbf 100644
--- a/xen/arch/riscv/include/asm/guest_access.h
+++ b/xen/arch/riscv/include/asm/guest_access.h
@@ -5,6 +5,7 @@
 #include <xen/types.h>
 
 struct domain;
+struct trap_info;
 
 unsigned long raw_copy_to_guest(void *to, const void *from, unsigned len);
 unsigned long raw_copy_from_guest(void *to, const void *from, unsigned len);
@@ -25,6 +26,33 @@ unsigned long raw_clear_guest(void *to, unsigned int len);
 unsigned long copy_to_guest_phys(struct domain *d, paddr_t gpa, void *buf,
                                  unsigned long len);
 
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
+                         struct trap_info *trap);
+
 #endif /* RISCV_GUEST_ACCESS_H */
 /*
  * Local variables:
diff --git a/xen/arch/riscv/traps.c b/xen/arch/riscv/traps.c
index 3672774271ff..97e604091458 100644
--- a/xen/arch/riscv/traps.c
+++ b/xen/arch/riscv/traps.c
@@ -197,9 +197,11 @@ void do_trap(struct cpu_user_regs *cpu_regs)
     bool from_guest = cpu_regs->hstatus & HSTATUS_SPV;
 
     /*
-     * A synchronous trap taken in Xen context may come from a probing access
-     * like csr_read_safe(), covered by an exception table entry which resumes
-     * execution past the faulting instruction.
+     * A synchronous trap taken in Xen context may come from an access done on
+     * a vCPU's behalf, e.g. the hlv/hlvx sequences in read_guest(),
+     * or from a probing access like csr_read_safe(). Both are covered by
+     * exception table entries which record the fault details for the caller
+     * and resume execution past the faulting instruction.
      *
      * Traps taken from the guest must never be fixed up: sepc is then a guest
      * address, which the guest could point at an address listed in the
@@ -230,8 +232,9 @@ void do_trap(struct cpu_user_regs *cpu_regs)
     case CAUSE_LOAD_GUEST_PAGE_FAULT:
     case CAUSE_STORE_GUEST_PAGE_FAULT:
         /*
-         * Xen doesn't access guest memory, so it can't take a guest page
-         * fault itself: only a guest can get here.
+         * A guest page fault taken in Xen context comes from an hlv/hlvx
+         * access made on a vCPU's behalf and is dealt with by the
+         * fixup_exception() above, so only a guest can get here.
          */
         BUG_ON(!from_guest);
 
-- 
2.56.1


