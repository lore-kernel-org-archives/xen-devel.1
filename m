Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EC48606A32D
	for <xen-devel@archiver.kernel.org>; Fri, 13 Nov 2026 15:50:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xAMu4cxC
Received: from list by lists.xenproject.org with outflank-mailman.1487750.1690119 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRtX7-0006XY-Mi; Fri, 13 Nov 2026 15:49:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1487750.1690119; Fri, 13 Nov 2026 15:49:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRtX5-0006Pj-Uk; Fri, 13 Nov 2026 15:49:43 +0000
Received: by outflank-mailman (input) for mailman id 1487750;
 Fri, 13 Nov 2026 15:49:35 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xRtWw-0004Wf-58
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2026 15:49:34 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xRtWv-003hR2-HM
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2026 16:49:33 +0100
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6af73182-e002-0a2a0a5209dd-0a2a4502d3ba-22
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 16:49:33 +0100
Received: from [209.85.221.41] (helo=mail-wr1-f41.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6af73189-6ca4-0a2a45020019-d155dd29b5c4-3
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 16:49:29 +0100
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-49465892f7bso1163022f8f.1
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 07:49:29 -0800 (PST)
Received: from fedora (user-109-243-65-71.play-internet.pl. [109.243.65.71])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-49c5f1c0e0dsm5786493f8f.15.2026.11.13.07.49.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Nov 2026 07:49:28 -0800 (PST)
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
        d=gmail.com; s=20260707; t=1794584969; x=1795189769; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t2W24INZMWFUeLuUfkHDCeMQjhOCI9IXkwzSjlG2y/8=;
        b=xAMu4cxC2tgr1CbfuY/Kw5gXrlXv9JCdFY3rsQe7AfOLEqGnn1XrM0aIxf5sCDs25v
         0ePXhjXay2c5iFIGHnEc9yVh9nZJrhoYIXfoOFwldRRxXHnD82FehzlV92bCzKlUv+hl
         gK3wc8pflfKvIhjhL4WOkB28d1XQfUWksDh7FpFylfSoQ0LI6eYWNbr29szn4ddyAKCQ
         GzjuBxx2YKVjLD7Ks1RRHYQlsz+IwNur9a/folmI8AkqMIWDhFX+HGFFG/WxFarhqeMc
         l4Cklmdon9ySrvemhJCfKmsVwDrz5CpTERocduFh9gSgNNviqVvfrZcAxnm4uSxxFZeB
         HxyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794584969; x=1795189769;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=t2W24INZMWFUeLuUfkHDCeMQjhOCI9IXkwzSjlG2y/8=;
        b=Bme5iR6ULSVfqcayVk5RCJ20hUwS3YFc+r4GgKDC9rxI/k0h6lUC0asuSdRSefAtJG
         uzcsvJynRabR1JS67OlMo3GKNt2VkeVRwsKFot9woF/gctW4erhJDZWQfpjarZhRiL4i
         pbbSX4Qk2LAvZ6qqxl0BJG9DyOOHy/0Cs4P5G26sdVRvK0KGiswTwQSkMvfmdLKz2dwN
         YbiJ/x9+M3KwUYJHeavR8Vs8gyRSW0tUO9v4ruUmBZLL2tMYGJnS18P1jTq0Zj8/SJ7j
         aXFpRfLMBnQri19lhnyE4H/5N0sAeg7X2znKsgm9EDdjDRgUjjNnsjcfUTxHlBaKC3Qf
         4eng==
X-Gm-Message-State: APuU4Z98zzbJphEtuZLHaKX6dlHHE0BdG6xnbopm+ppjmVgUZkLhIy+6
	Ogp9pMU1z1YzGKDAr7q8FkydCekc6uZTzO5cNLzfsaHAJdaBc0rYyY07Z714Ow==
X-Gm-Gg: AYBFou1QV1Ewc8oUVBXEs/dqsP/aFKOzTQOlF6FKWx+Ueg0cznvwIT/vvYT22PjrfaP
	l3zqXiJeg21O/UNGugwHbTUVPNu2k7dAN7yDkqS9w/w1pW/paJI90zY2o22NejXvHISoAUaK13K
	nL4VJaqOAgkmqXismLMhb5ymaBm6KGg3tUqRyGF/2XUYwCeQTgThIObEEAqNG/Bx8RKDI+NGyXO
	fDzUKDE1h1Xuv/h1ERx0USvU3EQkrQiYNk0Hwo5kSvuC9PnMQAthy6cZS/4WfnrZLOEEJnxlfPs
	dWuJxtzmzKQJklp+v61cwx4HZCKmJuhJMCHJoGRTF8RGsXaVR4p3MgEgF/T5CmYiXnIBhcCT4Cc
	QckayoSFm+CWvDYwThFbvCMKtIO+niXV/U7Hwt7FDCPKCb7GJrcNJD96Hi8WHGR112J3K6+TFG2
	Cocdn4xqNtClp/8a/S4MfOLbQZOfbpM2egi/3nIk+zBAvIYh1KP+WeNk9Iodu7m+wjLAjBPh+VJ
	6M5AlFz13Bq32I0/Su83Jah8sZvyytektUMJ1JuUG4v5P1KDMsxAObkSKwRF2UTS95nyvzfR/Ba
	ebbQYhehN51RTntnUK+EkFrPplpKpDgzgsR51R9P18ag58PkQgendos6jWfOAMJKFM+h
X-Received: by 2002:a05:6000:260a:b0:48e:5e1f:9a36 with SMTP id ffacd0b85a97d-49c727cf557mr5847308f8f.42.1794584968991;
        Fri, 13 Nov 2026 07:49:28 -0800 (PST)
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
Subject: [PATCH v4 20/42] xen/riscv: add helpers for decoding a trapped load or store
Date: Fri, 13 Nov 2026 16:48:41 +0100
Message-ID: <6cf77156985468c82e060c0788be83da2e24714f.1794562488.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <cover.1794562488.git.oleksii.kurochko@gmail.com>
References: <cover.1794562488.git.oleksii.kurochko@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-720697/1794584969-F3ABD2AC-E137AB36/10/73395122804
X-purgate-type: spam
X-purgate-size: 20745
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

emulate_load() and emulate_store() will both need to obtain the
instruction which caused a guest MMIO trap, decode it, and locate the
register operand it names. Add what the two share, ahead of either of
them being implemented: struct decoded_insn, insn_fetch_faulted(),
decode_ldst_insn(), guest_xlen(), guest_gpr() and advance_pc(), together
with the XLEN_FIELD_*, INSN_OPCODE_* and RV_RD()/RV_RS2() definitions
they need.

Nothing calls any of this yet, so reference the functions from the
emulate_load() stub to keep the build going; the references go away once
emulate_load() gains its body later.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
How these helpers are used can be seen in the patches adding emulate_load()
and emulate_store().
---
Changes in v4:
 - Reword the comment above guest_xlen() on why hstatus.VSXL is
   consulted whichever mode the trap came from.
 - Reword the comment on a transformed instruction reported in htinst,
   saying first that a compressed one comes already expanded.
 - Don't imply in the comment on a zero htinst that the ASSERT() rules the
   pseudoinstructions out: handle_guest_page_fault() does.
 - Fix the grammar of the comment on a G-stage fault taken while fetching
   the trapped instruction, and say that it is reported as an instruction
   access fault rather than as a bus error.
 - Reflow the description of @xlen above decode_ldst_insn().
 - Say that decode_ldst_insn() also returns false for a load or store
   which cannot be emulated, not only for other instructions.
 - Say where funct3 sits in the 32-bit LOAD and STORE encodings, as the
   comment on the compressed ones does.
 - Make the xl local of guest_xlen() unsigned int: it only ever holds the
   value of a 2-bit field.
---
Changes in v3:
 - Update the commit message.
 - Restore the opcode bits of a transformed instruction with 3 rather
   than INSN_16BIT_MASK: the macro is dropped by "xen/riscv: drop
   INSN_{16,32}BIT_MASK and report unknown instruction lengths", and its
   name didn't fit this use anyway.
 - Use (void) references in emulate_load() instead of __maybe_unused.
 - Use read_guest(), the new name of riscv_read_guest().
 - Shrink struct decoded_insn from 24 to 8 bytes (RV64): insn becomes
   uint32_t, as no instruction is wider than 32 bits, insn_len, len and reg
   become uint8_t (rather than bit-fields, for better code generation), and
   is_write and is_unsigned become bit-fields.
 - Don't take a custom htinst value with bits above bit[31] set for a
   transformed instruction (truncating it could yield a valid load/store
   encoding); fetch the instruction from guest memory instead.
 - Drop is_load_guest_page_fault() and open-code the check at its only
   user: with no store counterpart, such a helper is fragile.
 - Make guest_xlen() RV128-compatible by checking (xl > XLEN_FIELD_32)
   instead of (xl == XLEN_FIELD_64) before consulting vsstatus.UXL.
 - Clarify in struct decoded_insn that insn may hold the 32-bit transformed
   equivalent of the trapped instruction, and that insn_len is the length of
   the trapped instruction in guest memory rather than of the encoding in
   insn.
 - Say that none of the extensions exposed to guests has instructions wider
   than 32 bits, instead of referring to what the ISA defines, which is at
   risk of going stale.
 - Document in guest_gpr() that register bits above the guest's XLEN are not
   guaranteed to be zero or a sign extension, so callers must not rely on
   them when reading and must sign-extend what they write.
 - Explain why utrap.sepc can't be set in the initializer: on a fault
   read_guest() overwrites it with the address of its own faulting access.
 - Mention that stval, being XLEN bits wide, may not be able to hold a wider
   instruction as another reason for leaving it zero.
 - Calculate insn_len ahead of the width check and use it there, instead of
   testing INSN_IS_16BIT() and INSN_IS_32BIT() separately.
 - Drop the resets of is_write and is_unsigned in decode_ldst_insn() and
   state that @di is expected to start out zeroed instead.
 - Report an illegal instruction for a compressed encoding read back from
   guest memory when C isn't exposed to the guest.
 - Have guest_gpr() take the decoded instruction rather than a bare register
   number, and assert there that the access width fits a guest register.
 - Decode the access width from funct3 (from bits[15:13] for the
   compressed forms), which the loads and stores encode uniformly, instead
   of matching the instruction against each of them in turn. Introduce
   INSN_OPCODE_{MASK,LOAD,STORE} for that. Reject by a single check what
   the guest's XLEN doesn't allow, i.e. an access wider than a guest
   register, which neither the value an emulated access moves nor the
   register operand guest_gpr() hands out could carry.
 - Say which field of the compressed forms holds the register operand:
   RVC_RS2S() gives rd' of a load as well as rs2' of a store.
 - guest_gpr(): resolve the register via regs_gpr_ptr() from asm/regs.h
   instead of REG_PTR(), sharing its bounds check.
---
Changes in v2:
 - New patch.
---
---
 xen/arch/riscv/emulate.c                    | 335 ++++++++++++++++++++
 xen/arch/riscv/include/asm/riscv_encoding.h |  14 +
 2 files changed, 349 insertions(+)

diff --git a/xen/arch/riscv/emulate.c b/xen/arch/riscv/emulate.c
index d661ef0bf204..a30b2a7fadae 100644
--- a/xen/arch/riscv/emulate.c
+++ b/xen/arch/riscv/emulate.c
@@ -13,9 +13,40 @@
 #include <asm/csr.h>
 #include <asm/current.h>
 #include <asm/emulate.h>
+#include <asm/guest_access.h>
+#include <asm/processor.h>
+#include <asm/regs.h>
 #include <asm/riscv_encoding.h>
 #include <asm/traps.h>
 
+/*
+ * Determine the trapped load or store instruction which caused a guest MMIO
+ * trap.
+ */
+struct decoded_insn {
+    /*
+     * The trapped instruction: as read from guest memory, or the 32-bit
+     * equivalent the hardware transformed it into (see insn_fetch_faulted()).
+     * None of the extensions exposed to guests has instructions wider than
+     * 32 bits, and insn_fetch_faulted() rejects anything longer.
+     */
+    uint32_t insn;
+    /*
+     * Length in bytes of the trapped instruction in guest memory: 2 or 4.
+     * This need not be the length of the encoding in insn, as a compressed
+     * instruction may have been transformed into its 32-bit equivalent.
+     */
+    uint8_t insn_len;
+    /* Width of the memory access, in bytes. */
+    uint8_t len;
+    /* Number of the register operand: rd for a load, rs2 for a store. */
+    uint8_t reg;
+    /* The access is a store rather than a load. */
+    bool is_write:1;
+    /* The load zero-extends its result rather than sign-extending it. */
+    bool is_unsigned:1;
+};
+
 /*
  * The hardware-reported details of a guest page fault, gathered once by
  * handle_guest_page_fault() and passed down to the emulation of the faulted
@@ -39,6 +70,65 @@ struct guest_fault {
     paddr_t gpa;
 };
 
+static void advance_pc(struct cpu_user_regs *regs, unsigned int step)
+{
+    regs->sepc += step;
+}
+
+/*
+ * The effective XLEN of the guest at the point of the trap: hstatus.VSXL for a
+ * trap taken from VS-mode, vsstatus.UXL for one taken from VU-mode.
+ *
+ * VSXL is consulted whichever mode the trap came from: if VSXL says 32,
+ * vsstatus has no UXL field, so VU-mode is 32-bit as well and there is
+ * nothing to configure.
+ *
+ * It is needed to decode a trapped instruction: the encodings which exist only
+ * for XLEN=64 must not be recognized for a 32-bit guest. Besides those simply
+ * being reserved there, the compressed ones are ambiguous: C.LD and C.FLW
+ * share the encoding 0x6000 (mask 0xe003), and likewise C.SD/C.FSW,
+ * C.LDSP/C.FLWSP and C.SDSP/C.FSWSP.
+ *
+ * IS_ENABLED() can't be used here as HSTATUS_VSXL is defined for
+ * __riscv_xlen == 64 only, the field not existing on RV32 in the first place.
+ */
+static unsigned int guest_xlen(const struct cpu_user_regs *regs)
+{
+#ifdef CONFIG_RISCV_32
+    return 32;
+#else
+    unsigned int xl = MASK_EXTR(regs->hstatus, HSTATUS_VSXL);
+
+    if ( (xl > XLEN_FIELD_32) && !(regs->sstatus & SSTATUS_SPP) )
+        xl = MASK_EXTR(csr_read(CSR_VSSTATUS), SSTATUS64_UXL);
+
+    switch ( xl )
+    {
+    case XLEN_FIELD_32:
+        return 32;
+
+    case XLEN_FIELD_64:
+        return 64;
+
+    default:
+        /*
+         * The field holds nothing else in practice: XLEN_FIELD_128 would mean
+         * RV128, which no implementation provides, and the only value left is
+         * reserved. ASSERT_UNREACHABLE() being debug-only, a width still has
+         * to be answered in release builds.
+         *
+         * Answer 32, that being the safe way to be wrong: the decoder then
+         * fails to recognize the RV64-only encodings and emulation gives up.
+         * Answering 64 for what may well be a 32-bit guest would instead have
+         * it take C.FLW for C.LD and C.FSW for C.SD (see above), i.e. quietly
+         * emulate an access of the wrong width against the wrong register.
+         */
+        ASSERT_UNREACHABLE();
+        return 32;
+    }
+#endif
+}
+
 /*
  * Is @htinst one of the special pseudoinstruction values, reported for a guest
  * page fault taken on an implicit memory access done for VS-stage address
@@ -86,8 +176,253 @@ static int resolve_faulting_gpa(struct guest_fault *gf)
     return 0;
 }
 
+/*
+ * Where the value of a decoded instruction's register operand is held.
+ *
+ * The register is held at its full width, whatever the guest's XLEN is (see
+ * guest_xlen()). Where XLEN is narrower, the bits above it are not guaranteed
+ * to be zero, nor even a sign extension: hardware only ignores them in source
+ * operands, so they may have been left there by more privileged code running
+ * at a wider XLEN. Hence callers must not rely on those bits when reading a
+ * value, and must sign-extend what they write from bit XLEN-1, as hardware
+ * does for the result of an operation.
+ */
+static unsigned long *guest_gpr(struct cpu_user_regs *regs,
+                                const struct decoded_insn *di)
+{
+    /*
+     * decode_ldst_insn() is what fills @di in, and it rejects an access
+     * wider than a guest register.
+     */
+    ASSERT(di->len <= (guest_xlen(regs) / BITS_PER_BYTE));
+
+    return regs_gpr_ptr(regs, di->reg);
+}
+
+/*
+ * Obtain the instruction which caused a guest MMIO trap, filling in
+ * @di->insn and @di->insn_len. It either comes transformed in htinst, or has
+ * to be fetched from guest memory.
+ *
+ * Returns true if the fetch faulted in turn; the resulting trap has then
+ * already been redirected to the guest and there is nothing further for the
+ * caller to do. Where it returns false, @di has been filled in and emulation
+ * is to continue.
+ */
+static bool insn_fetch_faulted(const struct guest_fault *gf,
+                               struct decoded_insn *di)
+{
+    unsigned long htinst = gf->htinst;
+
+    /*
+     * A pseudoinstruction says nothing about the instruction the guest was
+     * executing, and comes with a guest physical address which isn't the one
+     * that instruction accessed. handle_guest_page_fault() deals with such a
+     * fault on its own, so no emulation can ever start for one.
+     */
+    ASSERT(!htinst_is_pseudo(htinst));
+
+    /*
+     * Bit[0] == 1 implies trapped instruction value is transformed instruction
+     * or custom value. A transformed instruction is a 32-bit encoding, so a
+     * value with any bit above bit[31] set is a custom one, which is of no use
+     * for decoding: fetch the instruction from guest memory then, as for zero.
+     */
+    if ( (htinst & BIT(0, UL)) && (htinst == (uint32_t)htinst) )
+    {
+        /*
+         * A compressed instruction is reported already expanded to its 32-bit
+         * equivalent, so htinst always holds a 32-bit encoding, except for
+         * bits[1:0], which hold a marker: bit[0] is set to flag the
+         * transformation and bit[1] is clear if the trapped instruction was
+         * compressed. Setting both bits gives a 32-bit encoding
+         * decode_ldst_insn() can decode. (Its handling of compressed
+         * encodings is for the branch below, which reads the instruction from
+         * guest memory as is.)
+         *
+         * The length then cannot come from the value anymore, only from
+         * bit[1]. And only a 16- or a 32-bit instruction is ever reported
+         * this way: the standard load and store instructions the hardware
+         * transforms are all of one of these two lengths, anything else comes
+         * as the zero special value handled below.
+         */
+        di->insn = htinst | 3;
+        di->insn_len = (htinst & BIT(1, UL)) ? 4 : 2;
+    }
+    else
+    {
+        const struct cpu_user_regs *regs = gf->regs;
+        struct trap_info utrap = {};
+
+        /*
+         * Bit[0] == 0 implies trapped instruction value is zero or special
+         * value. Pseudoinstructions never get here (see the comment ahead of
+         * the ASSERT() above), so only zero (or a custom value, see above) is
+         * left: the instruction has to be read from guest memory.
+         */
+
+        di->insn = read_guest(regs->sepc, true, &utrap);
+        if ( utrap.scause )
+        {
+            /*
+             * If a G-stage translation fault happens while fetching the
+             * trapped instruction, CAUSE_LOAD_GUEST_PAGE_FAULT is generated,
+             * hlvx being a load. Such a fault is reported to the guest as an
+             * instruction access fault.
+             */
+            if ( utrap.scause == CAUSE_LOAD_GUEST_PAGE_FAULT )
+                utrap.scause = CAUSE_FETCH_ACCESS;
+
+            /*
+             * Not set in the initializer: on a fault read_guest() leaves in
+             * utrap.sepc the address of its own faulting access, whereas the
+             * trap is to be reported at the guest instruction.
+             */
+            utrap.sepc = regs->sepc;
+
+            trap_redirect(&utrap);
+
+            return true;
+        }
+
+        di->insn_len = INSN_LEN(di->insn);
+
+        /*
+         * read_guest() fetches at most two halfwords, so a wider encoding has
+         * been read in part only and cannot be decoded here.
+         *
+         * Report an illegal instruction: none of the extensions exposed to
+         * guests has instructions wider than 32 bits, so such an encoding is
+         * not a valid instruction for the guest in the first place.
+         *
+         * The same goes for a compressed encoding where C isn't exposed to the
+         * guest. The instruction in guest memory may have changed since the
+         * trap, so what is read back must not be assumed to be what trapped,
+         * nor to be valid for the guest.
+         */
+        if ( !di->insn_len ||
+             (di->insn_len == 2 &&
+              !riscv_isa_extension_available(current->domain->arch.isa,
+                                             RISCV_ISA_EXT_c)) )
+        {
+            utrap.sepc = regs->sepc;
+            utrap.scause = CAUSE_ILLEGAL_INSTRUCTION;
+            /*
+             * stval is left zero, which the spec allows for an illegal
+             * instruction: only part of the instruction is in hand, and stval,
+             * being only XLEN bits wide, may not be able to hold all of it
+             * anyway.
+             */
+
+            trap_redirect(&utrap);
+
+            return true;
+        }
+    }
+
+    return false;
+}
+
+/*
+ * Decode the load or store instruction fetched into @di, filling in the
+ * remaining fields of it (@di->insn and @di->insn_len are filled by
+ * insn_fetch_faulted()). Fields which don't apply to the instruction are left
+ * alone, so @di is expected to start out zeroed.
+ *
+ * @xlen is the effective XLEN of the guest, needed as the encodings which
+ * exist for XLEN=64 only must not be recognized for a 32-bit guest.
+ *
+ * Returns false if the instruction is not a load or store, or cannot be
+ * emulated here.
+ */
+static bool decode_ldst_insn(struct decoded_insn *di, unsigned int xlen)
+{
+    uint32_t insn = di->insn;
+    unsigned int funct3, width_log2;
+
+    if ( INSN_IS_16BIT(insn) )
+    {
+        /*
+         * C.LW, C.LD, C.SW and C.SD (bits[1:0] == 00), and their sp-relative
+         * C.*SP forms (bits[1:0] == 10), have bits[15:13] of the form x1y:
+         * x is set for a store, and y selects a width of 4 or 8 bytes.
+         */
+        funct3 = RV_X(insn, 13, 3);
+
+        if ( (insn & 1) || !(funct3 & 2) )
+            return false;
+
+        di->is_write = funct3 & 4;
+        width_log2 = 2 + (funct3 & 1);
+
+        if ( !(insn & 2) )
+            /* Quadrant 0: bits[4:2] encode rd' (load) or rs2' (store) */
+            di->reg = RVC_RS2S(insn);
+        else if ( di->is_write )
+            /* Quadrant 2 (CSS): bits[6:2] encode rs2 for C.SWSP / C.SDSP */
+            di->reg = RVC_RS2(insn);
+        else
+        {
+            /* Quadrant 2 (CI): bits[11:7] encode rd for C.LWSP / C.LDSP */
+            di->reg = RV_RD(insn);
+
+            /* C.LWSP and C.LDSP are reserved with rd being x0. */
+            if ( !di->reg )
+                return false;
+        }
+    }
+    else
+    {
+        /*
+         * LOAD and STORE (I/S-type) have funct3 in bits[14:12]: funct3[1:0]
+         * is log2 of the width in bytes, and funct3[2] selects zero-extension
+         * for a load, while being reserved for a store.
+         */
+        funct3 = RV_X(insn, 12, 3);
+        width_log2 = funct3 & 3;
+
+        switch ( insn & INSN_OPCODE_MASK )
+        {
+        case INSN_OPCODE_LOAD:
+            di->is_unsigned = funct3 & 4;
+            di->reg = RV_RD(insn);
+            break;
+
+        case INSN_OPCODE_STORE:
+            if ( funct3 & 4 )
+                return false;
+            di->is_write = true;
+            di->reg = RV_RS2(insn);
+            break;
+
+        default:
+            return false;
+        }
+    }
+
+    di->len = 1U << width_log2;
+
+    /*
+     * No access is wider than XLEN, and one as wide as XLEN exists only in
+     * its sign-extending form: this rules out the encodings which exist for
+     * XLEN=64 only on a 32-bit guest, including C.FLW for C.LD (and alike).
+     */
+    if ( (di->len * BITS_PER_BYTE > xlen) ||
+         (di->is_unsigned && di->len * BITS_PER_BYTE == xlen) )
+        return false;
+
+    return true;
+}
+
 static int emulate_load(const struct guest_fault *gf)
 {
+    /* Transient, until the helpers gain their users. */
+    (void)advance_pc;
+    (void)guest_xlen;
+    (void)guest_gpr;
+    (void)insn_fetch_faulted;
+    (void)decode_ldst_insn;
+
     return -EOPNOTSUPP;
 }
 
diff --git a/xen/arch/riscv/include/asm/riscv_encoding.h b/xen/arch/riscv/include/asm/riscv_encoding.h
index fa26f5a2eb86..4529bef856b1 100644
--- a/xen/arch/riscv/include/asm/riscv_encoding.h
+++ b/xen/arch/riscv/include/asm/riscv_encoding.h
@@ -65,6 +65,14 @@
 #define SSTATUS64_UXL			MSTATUS_UXL
 #define SSTATUS64_SD			MSTATUS64_SD
 
+/*
+ * Width encoded by the MXL, SXL, UXL and VSXL fields, all of which share one
+ * encoding. 0 is reserved.
+ */
+#define XLEN_FIELD_32			_UL(1)
+#define XLEN_FIELD_64			_UL(2)
+#define XLEN_FIELD_128			_UL(3)
+
 #if __riscv_xlen == 64
 #define HSTATUS_VSXL			_UL(0x300000000)
 #define HSTATUS_VSXL_SHIFT		32
@@ -854,6 +862,10 @@
 /* 32-bit write for VS-stage address translation (VSXLEN=32) */
 #define INSN_PSEUDO_VS_STORE32		0x00002020
 
+#define INSN_OPCODE_MASK		0x7f
+#define INSN_OPCODE_LOAD		0x03
+#define INSN_OPCODE_STORE		0x23
+
 #define INSN_IS_16BIT(insn)	(((insn) & 3) != 3)
 #define INSN_IS_32BIT(insn)	(!INSN_IS_16BIT(insn) && ((insn) & 0x1c) != 0x1c)
 
@@ -895,6 +907,8 @@
 					 (RV_X(x, 7, 2) << 6))
 #define RVC_SDSP_IMM(x)			((RV_X(x, 10, 3) << 3) | \
 					 (RV_X(x, 7, 3) << 6))
+#define RV_RD(insn)			RV_X(insn, SH_RD, 5)
+#define RV_RS2(insn)			RV_X(insn, SH_RS2, 5)
 #define RVC_RS1S(insn)			(8 + RV_X(insn, SH_RD, 3))
 #define RVC_RS2S(insn)			(8 + RV_X(insn, SH_RS2C, 3))
 #define RVC_RS2(insn)			RV_X(insn, SH_RS2C, 5)
-- 
2.56.1


