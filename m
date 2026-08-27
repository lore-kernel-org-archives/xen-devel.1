Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 109DEC61DC4
	for <xen-devel@archiver.kernel.org>; Thu, 27 Aug 2026 15:22:39 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1400977.1636751 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzbvv-0005du-5m; Thu, 27 Aug 2026 15:22:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1400977.1636751; Thu, 27 Aug 2026 15:22:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzbvt-0005Yt-Ra; Thu, 27 Aug 2026 15:22:25 +0000
Received: by outflank-mailman (input) for mailman id 1400977;
 Thu, 27 Aug 2026 15:22:21 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wzbvo-0004S1-Ju
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2026 15:22:20 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wzbvo-009l31-07
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2026 17:22:20 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a905621-2eae-0a2a0a5409dd-0a2a450aa854-18
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 17:22:19 +0200
Received: from [209.85.128.51] (helo=mail-wm1-f51.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a90562b-f2d2-0a2a450a0019-d1558033ed2a-3
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 17:22:19 +0200
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-4998b5a63e2so21336015e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 08:22:19 -0700 (PDT)
Received: from fedora (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49b4b2d6b30sm57441155e9.14.2026.08.27.08.22.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Aug 2026 08:22:18 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1787844139; x=1788448939; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/v2fG+yV7FaiFbgNd6aGxtgxLdiavEOKbrATFwfainU=;
        b=HX8IG4GYJIEQ0YEUrDgqzhP5H+ruo5EWEPtxixuuPBE4XfyBcXo+5IubYVQELnIjkd
         VvppDcvxphpnHvJhg/KdsKbC6RBU5OF4122yH8BLOCK55sbmt/trkqItClxGfSPiohcW
         dZCCUXN9HyrSwnb4EZY1uldQUMJePJ3ayi4Z2D4fDODpvRwp2mCvuYa9CnJUrwBqD56q
         uznVgdCibGhZKaj+Sl4/K898URBG9bcBODcX/NnMRIDAfkKAg7I6oQ+znrBiBEf9w2QU
         5LqWW6DXmNfvdXzyFrbnDPxn81dFvNSDCO5HMoiMWbUHavduQWAAaah2gBhMENjhY9Yk
         mXIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787844139; x=1788448939;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/v2fG+yV7FaiFbgNd6aGxtgxLdiavEOKbrATFwfainU=;
        b=L+vjDHW8WTsG3nU/Bazy5C1LdQXjR6nDXb4spD4tF9qXneW/2f9qf5nLqEEYcB2NS8
         5FWX1RBPWUbjt/HJsNKxAn7gTQDQEta5YiMbALujS4QaVzDXgNMKUlyM+wEXOsm7Fsx/
         yL2hEOxFoUIpmNfF4Cz76jKyHPvgW/VzP3eEgUNTHdkSpd3AL17Ft6x/4yKWwK4WfgM2
         j9XJ1M8i61AOvoE0oH0KsRJleeQHYnqiTn7gh40WaqBLOxaXBJsMjx21/ZYKI9vu8YLD
         p2TiBVPlHjhxlu7qMq7gTX68P3kMduLwK3SOdwVPntoFWokFwKHjVQMwbYnQHVhFhs9z
         qE0Q==
X-Gm-Message-State: AFuF++lNESuja76s0iK2zZsvsLx2H8wDnNnPpolIkGBt+E/49iGIDUA+
	aB2mIJVW07zOWVvwCpeiSevubW5IIymn+HBQhedf1j2PMeN6niGLLdmtY0fkMw==
X-Gm-Gg: AR+sD12BjaqR1nsgLsnTs8jX+QDaaUkd/wH9gYbE22aAEqXVHE2ASWsMaEGGMDySNu4
	Fh7FeXXazcl38uiIj/qYHhrlQbflNfzf3yKp2T3DL0jvpNFqus7/RWWZRRjD3ptM7eJPsjFoMgp
	4xS/Bzj0jyA4qxG0Y79uQ2tbBVINh6kiAAdwZORxQy5vDWrCxeSQaHtZ99BtczslidAaZOZNn+J
	8EarFUfz0R0a3bGlPxrtrtVH2VD5gRIEKIODI/3moH/xekPQ7P3nBpSkn3ZpcmPVu4Ca2g6/OTg
	p1EJvNQ/++knNhXdIzW9wklBB0BnfZggiae1HuzZa5dbcNMXlUST4P+EGTdDK0a8HrDlY0Hv6ec
	ZCLErosoRyJcRYMfgTaN3hM9zgXqN1lqwc6a1fxBSwNrAZRl7lZxUKxH4GGwc1i1Q1lrRjDpCap
	jyu/8PI+Qav5MdIUV344izkAwR+YHfjALdBmA7CDw0NdRFNgyI/fJVVGBV9j17ZKqF1S5ZztyGW
	l8SD7lR1N923vuSMLkcUAeWzVvgqoX3
X-Received: by 2002:a05:600c:3f08:b0:499:51f0:a9b2 with SMTP id 5b1f17b1804b1-499dc6ec0e7mr217088315e9.1.1787844139231;
        Thu, 27 Aug 2026 08:22:19 -0700 (PDT)
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
Subject: [PATCH v2 25/39] xen/riscv: add guest load emulation for trapped MMIO accesses
Date: Thu, 27 Aug 2026 17:21:09 +0200
Message-ID: <7cf3203f8f826eefa1b24bb2dedbd76c0b611dc1.1787838835.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1787838835.git.oleksii.kurochko@gmail.com>
References: <cover.1787838835.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-4011c0/1787844139-53CD3CFC-BDF5C5AC/10/73395122804
X-purgate-type: spam
X-purgate-size: 6912

Implement emulate_load() on top of the decoding interface introduced by
the previous patch: fetch the trapped instruction, decode it, dispatch
the access to a registered MMIO handler via do_mmio(), write the result
back into the destination register and step over the instruction.

Xen dispatches MMIO synchronously to an in-hypervisor handler, so unlike
KVM RISC-V there is no userspace exit/return step and no equivalent of
the kvm_io_bus_read() / KVM_EXIT_MMIO / kvm_riscv_vcpu_mmio_return()
split; the result is consumed in place.

Sign extension is done here rather than in the handlers: a signed load
is normalized by a shift pair, so a handler need only report the value
it read.

At the moment vINTC is the only backend registered with the MMIO
dispatch, so in practice this only covers vINTC traps. An access which
no handler claims currently crashes the domain; injecting an access
fault into the guest instead is left for later.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in v2:
 - Move the emulation code to the new arch/riscv/emulate.c, leaving traps.c
   with trap dispatch only.
 - Split the patch up: struct decoded_insn and the decoding helpers are
   introduced by "xen/riscv: introduce the interface for trapped instruction
   decoding" and filled in by "xen/riscv: implement trapped instruction
   decoding", so only emulate_load() itself is left here.
 - do_mmio() is no longer defined alongside emulate_load(); it now lives in
   mmio.c, next to the dispatch it drives.
 - Don't write the result of a load into x0. SET_RD() wrote rd
   unconditionally, so a load into x0 clobbered regs->zero and broke the
   invariant that it reads as zero when x0 is a source operand elsewhere.
 - Recognize the XLEN=64-only encodings by the guest's effective XLEN
   (guest_xlen()) rather than by Xen's own (CONFIG_RISCV_32). Besides those
   encodings simply being reserved on RV32, the compressed ones are ambiguous
   there: C.LD and C.FLW share the encoding 0x6000 (mask 0xe003), and likewise
   C.SD/C.FSW, C.LDSP/C.FLWSP and C.SDSP/C.FSWSP.
 - Take the faulting address from struct guest_fault, filled in by
   resolve_faulting_gpa(), rather than from get_faulting_gpa().
 - Drop the description of a fault taken while re-reading the trapped
   instruction: that code is now in the patch implementing
   fetch_trapped_insn(), where a G-stage fault is reported to the guest as
   CAUSE_FETCH_ACCESS instead of hitting a BUG_ON().
 - Update the commit message accordingly.
---
---
 xen/arch/riscv/emulate.c | 53 +++++++++++++++++++++++++++++++---------
 1 file changed, 42 insertions(+), 11 deletions(-)

diff --git a/xen/arch/riscv/emulate.c b/xen/arch/riscv/emulate.c
index 81a50643a5ec..e52f2851800c 100644
--- a/xen/arch/riscv/emulate.c
+++ b/xen/arch/riscv/emulate.c
@@ -5,7 +5,6 @@
  */
 
 #include <xen/bug.h>
-#include <xen/compiler.h>
 #include <xen/errno.h>
 #include <xen/sched.h>
 #include <xen/types.h>
@@ -15,6 +14,7 @@
 #include <asm/current.h>
 #include <asm/emulate.h>
 #include <asm/guest_access.h>
+#include <asm/mmio.h>
 #include <asm/processor.h>
 #include <asm/riscv_encoding.h>
 #include <asm/traps.h>
@@ -65,8 +65,7 @@ static bool is_load_guest_page_fault(unsigned long scause)
     return scause == CAUSE_LOAD_GUEST_PAGE_FAULT;
 }
 
-static __maybe_unused void advance_pc(struct cpu_user_regs *regs,
-                                      unsigned int step)
+static void advance_pc(struct cpu_user_regs *regs, unsigned int step)
 {
     regs->sepc += step;
 }
@@ -88,7 +87,7 @@ static __maybe_unused void advance_pc(struct cpu_user_regs *regs,
  * IS_ENABLED() can't be used here as HSTATUS_VSXL is defined for
  * __riscv_xlen == 64 only, the field not existing on RV32 in the first place.
  */
-static __maybe_unused unsigned int guest_xlen(const struct cpu_user_regs *regs)
+static unsigned int guest_xlen(const struct cpu_user_regs *regs)
 {
 #ifdef CONFIG_RISCV_32
     return 32;
@@ -179,8 +178,7 @@ static void resolve_faulting_gpa(struct guest_fault *gf)
  * Relies on x0..x31 being laid out at the start of struct cpu_user_regs in
  * architectural register-number order; see the comment there.
  */
-static __maybe_unused unsigned long *guest_gpr(struct cpu_user_regs *regs,
-                                               unsigned int reg)
+static unsigned long *guest_gpr(struct cpu_user_regs *regs, unsigned int reg)
 {
     ASSERT(reg < 32);
 
@@ -197,8 +195,8 @@ static __maybe_unused unsigned long *guest_gpr(struct cpu_user_regs *regs,
  * caller to do. Where it returns false, @di has been filled in and emulation
  * is to continue.
  */
-static bool __maybe_unused insn_fetch_faulted(const struct guest_fault *gf,
-                                              struct decoded_insn *di)
+static bool insn_fetch_faulted(const struct guest_fault *gf,
+                               struct decoded_insn *di)
 {
     unsigned long htinst = gf->htinst;
 
@@ -306,8 +304,7 @@ static bool __maybe_unused insn_fetch_faulted(const struct guest_fault *gf,
  * Returns false if the instruction is not a load or store which can be
  * emulated here.
  */
-static __maybe_unused bool decode_ldst_insn(struct decoded_insn *di,
-                                            unsigned int xlen)
+static bool decode_ldst_insn(struct decoded_insn *di, unsigned int xlen)
 {
     unsigned long insn = di->insn;
     /* Register fields of the uncompressed forms ... */
@@ -419,7 +416,41 @@ static __maybe_unused bool decode_ldst_insn(struct decoded_insn *di,
 
 static int emulate_load(const struct guest_fault *gf)
 {
-    return -EOPNOTSUPP;
+    struct cpu_user_regs *regs = gf->regs;
+    mmio_info_t info = { .is_write = false };
+    struct decoded_insn di;
+    unsigned int shift = 0;
+    int rc;
+
+    /* A fault taken re-reading the instruction is redirected to the guest. */
+    if ( insn_fetch_faulted(gf, &di) )
+        return 0;
+
+    if ( !decode_ldst_insn(&di, guest_xlen(regs)) || di.is_write )
+        return -EOPNOTSUPP;
+
+    if ( !di.is_unsigned )
+        shift = BITS_PER_BYTE * (sizeof(unsigned long) - di.len);
+
+#ifdef EMULATE_LOAD_DEBUG
+    gdprintk(XENLOG_DEBUG, "pc=%#lx, addr=%#"PRIpaddr", len=%u, shift=%u\n",
+             regs->sepc, gf->gpa, di.len, shift);
+#endif
+
+    rc = do_mmio(&info, gf->gpa, di.len);
+    if ( rc )
+        return rc;
+
+    /*
+     * A load into x0 discards its result: writing regs->zero would break the
+     * invariant that it reads as zero when x0 is a source operand elsewhere.
+     */
+    if ( di.reg )
+        *guest_gpr(regs, di.reg) = (long)(info.data << shift) >> shift;
+
+    advance_pc(regs, di.insn_len);
+
+    return 0;
 }
 
 static int emulate_store(struct guest_fault *gf)
-- 
2.55.0


