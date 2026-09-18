Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99158C982D7
	for <xen-devel@archiver.kernel.org>; Fri, 18 Sep 2026 08:45:37 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1424961.1649147 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x7UDY-0002bW-CU; Fri, 18 Sep 2026 08:45:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1424961.1649147; Fri, 18 Sep 2026 08:45:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x7UDY-0002bP-9r; Fri, 18 Sep 2026 08:45:12 +0000
Received: by outflank-mailman (input) for mailman id 1424961;
 Fri, 18 Sep 2026 08:45:11 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1x7UDW-0002b8-Ps
 for xen-devel@lists.xenproject.org; Fri, 18 Sep 2026 08:45:11 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x7UDW-005NnV-6c
 for xen-devel@lists.xenproject.org; Fri, 18 Sep 2026 10:45:10 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0b3b0c3ad00072c4@swg.vates.tech>)
 id 6aacfa10-e002-0a2a0a5209dd-0a2a4506a144-10
 for <xen-devel@lists.xenproject.org>; Fri, 18 Sep 2026 10:45:09 +0200
Received: from [185.255.28.35] (helo=prod-mta-13-02.swg-srv.net)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0b3b0c3ad00072c4@swg.vates.tech>)
 id 6aacfa14-195a-0a2a45060019-b9ff1c23a1e5-3
 for <xen-devel@lists.xenproject.org>; Fri, 18 Sep 2026 10:45:08 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-02.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a0b3b0c3ad00072c4.007 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 18 Sep 2026 08:45:01 +0000
Received: from [192.168.1.46] (areims-651-1-80-194.w90-18.abo.wanadoo.fr
 [90.18.187.194]) (Authenticated sender: baptiste.le-duc)
 by mail2.vates.fr (Postfix) with ESMTPSA id 5B8ED821ED;
 Fri, 18 Sep 2026 10:45:00 +0200 (CEST)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=vates.tech header.i="@vates.tech" header.h="From:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:References:Feedback-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech;
 q=dns/txt; s=selector1; bh=cB51r+lZrmiPfz+T3Gfa8J2oPhSh0gpzC4SIRfovPlc=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:content-transfer-encoding:in-reply-to:references:feedback-id;
 b=jrsK/EGBrHucTrIs+1eUtIGQ0pnwzrosVJ/4br/33JYMpwE8bQtNkFqsBzuSc3RLtTtfEIx34
 zEz8g8Pr2Hqk7RxDkBvSxJFALZqyaiE86atlHYT2PCfBdmpidnOgdLyqJWQo/8Nq7A7U/kQOOty
 YI/QFFan5fOXv72UwkkqmPjbGtbOy3Qy9/gM0waL7M4OO7W2oYaTSHC3iVFhR1Wjmsjg3Mrkeg2
 XD9K+tLTerfAuiNSK2eiOuYsoXugcPFUgWpsnIxBgvecA7oMrl/sNCnQDH6mtl1vaaOWR1KHNUR
 VJMRrugok8ruje0eQMZG1JIDDAk6VOr/efWcQbbhQkoA==
X-Zone-Loop: 838f895215de527d5e6bda2e77c1bee5b38a7077956e
x-campaign-type: default
x-transaction-id: dadd2cb1-cf33-4e9b-b298-007b18a64040
x-swg-uid: 01-9023a72b-dff1-4074-954f-772a454d07cb
X-Mailer: Sweego
Message-ID:
 <1789721101.8631fc262581453bbf619ec5b2062170.1a0b3b0c3ad00072c4@vates.tech>
x-swg-bid: 1789721101.8631fc262581453bbf619ec5b2062170.1a0b3b0c3ad00072c4
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2 24/39] xen/riscv: add helpers for decoding a trapped
 load or store
From: Baptiste Le Duc <baptiste.le-duc@vates.tech>
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: xen-devel@lists.xenproject.org, 
 Romain Caritey <Romain.Caritey@microchip.com>, 
 Baptiste Le Duc <baptiste.le-duc@vates.tech>, 
 Zheng Zhang <zhangzheng@iscas.ac.cn>, 
 Alistair Francis <alistair.francis@wdc.com>, 
 Connor Davis <connojdavis@gmail.com>, 
 Andrew Cooper <andrew.cooper3@citrix.com>, 
 Anthony PERARD <anthony.perard@vates.tech>, 
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, 
 Julien Grall <julien@xen.org>, 
 =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>, 
 Stefano Stabellini <sstabellini@kernel.org>
In-Reply-To: <4c5361bda56e97f5338f4bc561498e018adbf618.1787838835.git.oleksii.kurochko@gmail.com>
References: <cover.1787838835.git.oleksii.kurochko@gmail.com>
 <4c5361bda56e97f5338f4bc561498e018adbf618.1787838835.git.oleksii.kurochko@gmail.com>
Date: Fri, 18 Sep 2026 10:44:52 +0200
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789721094; l=16982;
 i=baptiste.le-duc@vates.tech; s=20260810; h=from:subject:message-id;
 bh=Dg2QiUp8Y1lpu0ImOFAoAE+mxFvJ5sseFP0IZrp5/SM=;
 b=Y1HmtScKXHDumUg3arsjOASHXNwGhqRhx73/mkyBWQDcJ4P6lEE/wCuQQAYGCy/+0Tdiu8kUb
 Bw5DhnAvt5XD3PsMb2xMn0lJWRN/dEGlsOMStQADiPX/rEs/lYZlFdI
X-Developer-Key: i=baptiste.le-duc@vates.tech; a=ed25519;
 pk=N+BbdvMXRzrCuX/ieh4RWodiAKcLNvI+KjflcZ0oXCo=
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1789721100586
X-purgate-ID: tlsNG-16d1c6/1789721108-F4C0777B-722D6683/10/73395122804
X-purgate-type: spam
X-purgate-size: 16982

> emulate_load() and emulate_store() will both need to obtain the
> instruction which caused a guest MMIO trap, decode it, and locate the
> register operand it names. Add what the two share, ahead of either of
> them being implemented: struct decoded_insn, insn_fetch_faulted(),
> decode_ldst_insn(), guest_xlen(), guest_gpr() and advance_pc().
> 
> The mask/match chain is adapted from Linux's KVM RISC-V implementation.
Nit: maybe you could add the Origin: trailer as mentioned in the
sending-patches.adoc.
> 
> Nothing calls any of this yet, so tag the functions __maybe_unused to
> keep the build going; the tags go away once emulate_load() and
> emulate_store() gain their bodies later.


> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>
> diff --git a/xen/arch/riscv/emulate.c b/xen/arch/riscv/emulate.c
> index ff530ef2df..81a50643a5 100644
> --- a/xen/arch/riscv/emulate.c
> +++ b/xen/arch/riscv/emulate.c
> @@ -5,6 +5,7 @@
>   */
>  
>  #include <xen/bug.h>
> +#include <xen/compiler.h>
>  #include <xen/errno.h>
>  #include <xen/sched.h>
>  #include <xen/types.h>
> @@ -13,9 +14,29 @@
>  #include <asm/csr.h>
>  #include <asm/current.h>
>  #include <asm/emulate.h>
> +#include <asm/guest_access.h>
> +#include <asm/processor.h>
>  #include <asm/riscv_encoding.h>
>  #include <asm/traps.h>
>  
> +/*
> + * Determine the trapped load or store instruction which caused a guest MMIO
> + * trap.
> + */
> +struct decoded_insn {
> +    /* The instruction itself, and its length in bytes. */
> +    unsigned long insn;
> +    unsigned int insn_len;
> +    /* Width of the memory access, in bytes. */
> +    unsigned int len;
> +    /* Number of the register operand: rd for a load, rs2 for a store. */
> +    unsigned int reg;
> +    /* The access is a store rather than a load. */
> +    bool is_write;
> +    /* The load zero-extends its result rather than sign-extending it. */
> +    bool is_unsigned;
> +};


> +
>  /*
>   * The hardware-reported details of a guest page fault, gathered once by
>   * handle_guest_page_fault() and passed down to the emulation of the faulted
> @@ -39,6 +60,71 @@ struct guest_fault {
>      paddr_t gpa;
>  };
>  
> +static bool is_load_guest_page_fault(unsigned long scause)
> +{
> +    return scause == CAUSE_LOAD_GUEST_PAGE_FAULT;
> +}


> +
> +static __maybe_unused void advance_pc(struct cpu_user_regs *regs,
> +                                      unsigned int step)
> +{
> +    regs->sepc += step;
> +}
> +
> +/*
> + * The effective XLEN of the guest at the point of the trap: hstatus.VSXL for a
> + * trap taken from VS-mode, vsstatus.UXL for one taken from VU-mode.
> + *
> + * VSXL is consulted whichever mode the trap came from, as it also gives the
> + * width of vsstatus itself: where VSXL says 32, that register has no UXL field
> + * to consult and VU-mode is 32-bit as well, there being nothing to configure.
> + *
> + * It is needed to decode a trapped instruction: the encodings which exist only
> + * for XLEN=64 must not be recognized for a 32-bit guest. Besides those simply
> + * being reserved there, the compressed ones are ambiguous: C.LD and C.FLW
> + * share the encoding 0x6000 (mask 0xe003), and likewise C.SD/C.FSW,
> + * C.LDSP/C.FLWSP and C.SDSP/C.FSWSP.
> + *
> + * IS_ENABLED() can't be used here as HSTATUS_VSXL is defined for
> + * __riscv_xlen == 64 only, the field not existing on RV32 in the first place.
> + */
> +static __maybe_unused unsigned int guest_xlen(const struct cpu_user_regs *regs)
> +{
> +#ifdef CONFIG_RISCV_32
> +    return 32;
> +#else
> +    unsigned long xl = MASK_EXTR(regs->hstatus, HSTATUS_VSXL);
> +
> +    if ( (xl == XLEN_FIELD_64) && !(regs->sstatus & SSTATUS_SPP) )


> +        xl = MASK_EXTR(csr_read(CSR_VSSTATUS), SSTATUS64_UXL);
> +
> +    switch ( xl )
> +    {
> +    case XLEN_FIELD_32:
> +        return 32;
> +
> +    case XLEN_FIELD_64:
> +        return 64;
> +
> +    default:
> +        /*
> +         * The field holds nothing else in practice: XLEN_FIELD_128 would mean
> +         * RV128, which no implementation provides, and the only value left is
> +         * reserved. ASSERT_UNREACHABLE() being debug-only, a width still has
> +         * to be answered in release builds.
> +         *
> +         * Answer 32, that being the safe way to be wrong: the decoder then
> +         * fails to recognize the RV64-only encodings and emulation gives up.
> +         * Answering 64 for what may well be a 32-bit guest would instead have
> +         * it take C.FLW for C.LD and C.FSW for C.SD (see above), i.e. quietly
> +         * emulate an access of the wrong width against the wrong register.
> +         */
> +        ASSERT_UNREACHABLE();
> +        return 32;
> +    }
> +#endif
> +}
> +
>  /*
>   * Is @htinst one of the pseudoinstructions reported for a guest page fault
>   * taken on an implicit memory access done for VS-stage address translation?
> @@ -87,6 +173,250 @@ static void resolve_faulting_gpa(struct guest_fault *gf)
>                (htinst_is_pseudo(gf->htinst) ? 0 : (gf->stval & 3));
>  }
>  
> +/*
> + * Where the value of a decoded instruction's register operand is held.
> + *
> + * Relies on x0..x31 being laid out at the start of struct cpu_user_regs in
> + * architectural register-number order; see the comment there.
> + */
> +static __maybe_unused unsigned long *guest_gpr(struct cpu_user_regs *regs,
> +                                               unsigned int reg)
> +{
> +    ASSERT(reg < 32);
> +
> +    return REG_PTR(reg, 0, regs);
> +}


> +
> +/*
> + * Obtain the instruction which caused a guest MMIO trap, filling in
> + * @di->insn and @di->insn_len. It either comes transformed in htinst, or has
> + * to be fetched from guest memory.
> + *
> + * Returns true if the fetch faulted in turn; the resulting trap has then
> + * already been redirected to the guest and there is nothing further for the
> + * caller to do. Where it returns false, @di has been filled in and emulation
> + * is to continue.
> + */
> +static bool __maybe_unused insn_fetch_faulted(const struct guest_fault *gf,
> +                                              struct decoded_insn *di)
> +{
> +    unsigned long htinst = gf->htinst;
> +
> +    /*
> +     * A pseudoinstruction says nothing about the instruction the guest was
> +     * executing, and comes with a guest physical address which isn't the one
> +     * that instruction accessed. handle_guest_page_fault() deals with such a
> +     * fault on its own, so no emulation can ever start for one.
> +     */
> +    ASSERT(!htinst_is_pseudo(htinst));
> +
> +    if ( htinst & BIT(0, UL) )
> +    {
> +        /*
> +         * Bit[0] == 1 implies trapped instruction value is
> +         * transformed instruction or custom instruction.
> +         *
> +         * The transformation always yields the 32-bit format, with bits[1:0]
> +         * holding a marker instead of the original opcode bits: bit[0] set to
> +         * flag the transformation, bit[1] clear if the trapped instruction
> +         * was a compressed one. Restoring the opcode bits makes the value the
> +         * valid 32-bit encoding decode_ldst_insn() matches against. Its
> +         * INSN_MASK_C_* cases exist for the branch below, where a compressed
> +         * instruction is read from guest memory as is: a trapped one arrives
> +         * here already expanded to its 32-bit equivalent, and the opcode bits
> +         * just restored keep it from matching those cases anyway.
> +         *
> +         * The length then cannot come from the value anymore, only from
> +         * bit[1]. And only a 16- or a 32-bit instruction is ever reported
> +         * this way: the standard load and store instructions the hardware
> +         * transforms are all of one of these two lengths, anything else comes
> +         * as the zero special value handled below.
> +         */
> +        di->insn = htinst | INSN_16BIT_MASK;
> +        di->insn_len = (htinst & BIT(1, UL)) ? 4 : 2;


> +    }
> +    else
> +    {
> +        const struct cpu_user_regs *regs = gf->regs;
> +        struct trap_info utrap = {};
> +
> +        /*
> +         * Bit[0] == 0 implies trapped instruction value is
> +         * zero or special value. With the pseudoinstructions ruled out
> +         * above, only zero is left: the instruction has to be read from
> +         * guest memory.
> +         */
> +
> +        di->insn = riscv_read_guest(regs->sepc, true, &utrap);
> +        if ( utrap.scause )
> +        {
> +            /*
> +             * If during getting of trapped instruction a fault happen in
> +             * G-stage translation then CAUSE_LOAD_GUEST_PAGE_FAULT is
> +             * generated. Such faults during this operation is considered as
> +             * bus error.
> +             */
> +            if ( is_load_guest_page_fault(utrap.scause) )
> +                utrap.scause = CAUSE_FETCH_ACCESS;
> +
> +            utrap.sepc = regs->sepc;


> +
> +            trap_redirect(&utrap);
> +
> +            return true;
> +        }
> +
> +        /*
> +         * riscv_read_guest() fetches at most two halfwords, so a wider
> +         * encoding has been read in part only and cannot be decoded here.
> +         *
> +         * Report an illegal instruction, which is what the guest would have
> +         * got for such an encoding anyway: the ISA defines no instruction
> +         * wider than 32 bits.
> +         */


> +        if ( !INSN_IS_16BIT(di->insn) && !INSN_IS_32BIT(di->insn) )
> +        {
> +            utrap.sepc = regs->sepc;


> +            utrap.scause = CAUSE_ILLEGAL_INSTRUCTION;
> +            /*
> +             * stval is left zero: the spec allows that for an illegal
> +             * instruction, and only part of the instruction is in hand.
> +             */


> +
> +            trap_redirect(&utrap);
> +
> +            return true;
> +        }
> +
> +        di->insn_len = INSN_LEN(di->insn);


> +    }
> +
> +    return false;
> +}
> +
> +/*
> + * Decode the load or store instruction fetched into @di, filling in the
> + * remaining fields of it (@di->insn and @di->insn_len are filled by
> + * insn_fetch_faulted()).
> + *
> + * @xlen is the effective XLEN of the guest, needed as
> + * the encodings which exist for XLEN=64 only must not be recognized for a
> + * 32-bit guest.
> + *
> + * Returns false if the instruction is not a load or store which can be
> + * emulated here.
> + */
> +static __maybe_unused bool decode_ldst_insn(struct decoded_insn *di,
> +                                            unsigned int xlen)
> +{
> +    unsigned long insn = di->insn;
> +    /* Register fields of the uncompressed forms ... */
> +    unsigned int rd = RV_RD(insn);
> +    unsigned int rs2 = RV_RS2(insn);
> +    /*
> +     * ... and of the compressed ones, where the 3-bit field selects one of
> +     * x8..x15, while the stack-pointer-relative forms have a full-width one.
> +     */
> +    unsigned int rs2s = RVC_RS2S(insn);
> +    unsigned int rs2c = RVC_RS2(insn);
> +
This naming are confusing because above you described di->reg to be rd
for load and rs2 for store but here ...
> +    di->is_write = false;
> +    di->is_unsigned = false;


> +    di->reg = rd;
> +
> +    if ( (insn & INSN_MASK_LB) == INSN_MATCH_LB )
> +        di->len = 1;
> +    else if ( (insn & INSN_MASK_LBU) == INSN_MATCH_LBU )
> +    {
> +        di->len = 1;
> +        di->is_unsigned = true;
> +    }
> +    else if ( (insn & INSN_MASK_LH) == INSN_MATCH_LH )
> +        di->len = 2;
> +    else if ( (insn & INSN_MASK_LHU) == INSN_MATCH_LHU )
> +    {
> +        di->len = 2;
> +        di->is_unsigned = true;
> +    }
> +    else if ( (insn & INSN_MASK_LW) == INSN_MATCH_LW )
> +        di->len = 4;
> +    else if ( xlen == 64 && (insn & INSN_MASK_LWU) == INSN_MATCH_LWU )
> +    {
> +        di->len = 4;
> +        di->is_unsigned = true;
> +    }


> +    else if ( (insn & INSN_MASK_C_LW) == INSN_MATCH_C_LW )
> +    {
> +        di->len = 4;


> +        di->reg = rs2s;
... you assigned rs2s for a load. According to the spec, it should be rd'.

I would suggest something generic to load and store. Maybe rxs with a comment to explain it concerns rs2' for store and rd' for load.

    /*
     * ... and of the compressed ones, where the 3-bit field selects one of
     * x8..x15, while the stack-pointer-relative forms have a full-width one.
     * rxs is named after that field's spec mnemonic, rd'/rs2': rd' for
     * compressed loads, rs2' for compressed stores.
     */
    unsigned int rxs = RVC_RS2S(insn);

> +    }
> +    /* c.lwsp and c.ldsp are reserved with rd being x0. */
> +    else if ( (insn & INSN_MASK_C_LWSP) == INSN_MATCH_C_LWSP && rd )
> +        di->len = 4;
> +    else if ( xlen == 64 && (insn & INSN_MASK_LD) == INSN_MATCH_LD )
> +        di->len = 8;
> +    else if ( xlen == 64 && (insn & INSN_MASK_C_LD) == INSN_MATCH_C_LD )
> +    {
> +        di->len = 8;
> +        di->reg = rs2s;
> +    }
> +    else if ( xlen == 64 && (insn & INSN_MASK_C_LDSP) == INSN_MATCH_C_LDSP &&
> +              rd )
> +        di->len = 8;
> +    else if ( (insn & INSN_MASK_SB) == INSN_MATCH_SB )
> +    {
> +        di->len = 1;
> +        di->is_write = true;
> +        di->reg = rs2;
> +    }
> +    else if ( (insn & INSN_MASK_SH) == INSN_MATCH_SH )
> +    {
> +        di->len = 2;
> +        di->is_write = true;
> +        di->reg = rs2;
> +    }
> +    else if ( (insn & INSN_MASK_SW) == INSN_MATCH_SW )
> +    {
> +        di->len = 4;
> +        di->is_write = true;
> +        di->reg = rs2;
> +    }
> +    else if ( (insn & INSN_MASK_C_SW) == INSN_MATCH_C_SW )
> +    {
> +        di->len = 4;
> +        di->is_write = true;
> +        di->reg = rs2s;
> +    }
> +    else if ( (insn & INSN_MASK_C_SWSP) == INSN_MATCH_C_SWSP )
> +    {
> +        di->len = 4;
> +        di->is_write = true;
> +        di->reg = rs2c;
> +    }
> +    else if ( xlen == 64 && (insn & INSN_MASK_SD) == INSN_MATCH_SD )
> +    {
> +        di->len = 8;
> +        di->is_write = true;
> +        di->reg = rs2;
> +    }
> +    else if ( xlen == 64 && (insn & INSN_MASK_C_SD) == INSN_MATCH_C_SD )
> +    {
> +        di->len = 8;
> +        di->is_write = true;
> +        di->reg = rs2s;
> +    }
> +    else if ( xlen == 64 && (insn & INSN_MASK_C_SDSP) == INSN_MATCH_C_SDSP )
> +    {
> +        di->len = 8;
> +        di->is_write = true;
> +        di->reg = rs2c;
> +    }
> +    else
> +        return false;
> +
> +    return true;
> +}
> +
>  static int emulate_load(const struct guest_fault *gf)
>  {
>      return -EOPNOTSUPP;
> diff --git a/xen/arch/riscv/include/asm/guest_access.h b/xen/arch/riscv/include/asm/guest_access.h
> index 8d679319de..39c28dd2ec 100644
> --- a/xen/arch/riscv/include/asm/guest_access.h
> +++ b/xen/arch/riscv/include/asm/guest_access.h
> @@ -5,6 +5,7 @@
>  #include <xen/types.h>
>  
>  struct domain;
> +struct trap_info;
>  
>  unsigned long raw_copy_to_guest(void *to, const void *from, unsigned len);
>  unsigned long raw_copy_from_guest(void *to, const void *from, unsigned len);
> @@ -25,6 +26,9 @@ unsigned long raw_clear_guest(void *to, unsigned int len);
>  unsigned long copy_to_guest_phys(struct domain *d, paddr_t gpa, void *buf,
>                                   unsigned long len);
>  
> +unsigned long riscv_read_guest(unsigned long guest_addr, bool read_insn,
> +                               struct trap_info *trap);
> +
>  #endif /* ASM__RISCV__GUEST_ACCESS_H */
>  /*
>   * Local variables:
> diff --git a/xen/arch/riscv/include/asm/riscv_encoding.h b/xen/arch/riscv/include/asm/riscv_encoding.h
> index b2071f4758..656a5fcccb 100644
> --- a/xen/arch/riscv/include/asm/riscv_encoding.h
> +++ b/xen/arch/riscv/include/asm/riscv_encoding.h
> @@ -65,6 +65,14 @@
>  #define SSTATUS64_UXL			MSTATUS_UXL
>  #define SSTATUS64_SD			MSTATUS64_SD
>  
> +/*
> + * Width encoded by the MXL, SXL, UXL and VSXL fields, all of which share one
> + * encoding. 0 is reserved.
> + */
> +#define XLEN_FIELD_32			_UL(1)
> +#define XLEN_FIELD_64			_UL(2)
> +#define XLEN_FIELD_128			_UL(3)
> +
>  #if __riscv_xlen == 64
>  #define HSTATUS_VSXL			_UL(0x300000000)
>  #define HSTATUS_VSXL_SHIFT		32
> @@ -896,6 +904,8 @@
>  					 (RV_X(x, 7, 2) << 6))
>  #define RVC_SDSP_IMM(x)			((RV_X(x, 10, 3) << 3) | \
>  					 (RV_X(x, 7, 3) << 6))
> +#define RV_RD(insn)			RV_X(insn, SH_RD, 5)
> +#define RV_RS2(insn)			RV_X(insn, SH_RS2, 5)
Nit: format

-- 
Baptiste Le Duc <baptiste.le-duc@vates.tech>

