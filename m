Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8FDB606A326
	for <xen-devel@archiver.kernel.org>; Thu, 22 Oct 2026 10:03:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=vates.tech header.i=@vates.tech header.a=rsa-sha256 header.s=selector1 header.b=OVQOXxNN
Received: from list by lists.xenproject.org with outflank-mailman.1457909.1670404 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xJpdd-0004kw-Rg; Thu, 22 Oct 2026 10:03:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1457909.1670404; Thu, 22 Oct 2026 10:03:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xJpdd-0004kp-OZ; Thu, 22 Oct 2026 10:03:09 +0000
Received: by outflank-mailman (input) for mailman id 1457909;
 Thu, 22 Oct 2026 10:03:08 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xJpdc-0004kj-DZ
 for xen-devel@lists.xenproject.org; Thu, 22 Oct 2026 10:03:08 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xJpdb-001rMh-Ca
 for xen-devel@lists.xenproject.org; Thu, 22 Oct 2026 12:03:07 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a1631070d2000f79f@swg.vates.tech>)
 id 6ad9df52-e002-0a2a0a5209dd-0a2a45048ca4-20
 for <xen-devel@lists.xenproject.org>; Thu, 22 Oct 2026 12:03:07 +0200
Received: from [185.255.28.35] (helo=prod-mta-13-02.swg-srv.net)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a1631070d2000f79f@swg.vates.tech>)
 id 6ad9df5a-b57f-0a2a45040019-b9ff1c23992b-3
 for <xen-devel@lists.xenproject.org>; Thu, 22 Oct 2026 12:03:07 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-02.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a1631070d2000f79f.007 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 22 Oct 2026 10:03:04 +0000
Received: from [192.168.1.52] (areims-651-1-80-194.w90-18.abo.wanadoo.fr
 [90.18.187.194]) (Authenticated sender: baptiste.le-duc)
 by mail2.vates.fr (Postfix) with ESMTPSA id 6B2F782A69;
 Thu, 22 Oct 2026 12:03:03 +0200 (CEST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=vates.tech header.i="@vates.tech" header.h="From:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:References:Feedback-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech;
 q=dns/txt; s=selector1; bh=zvJyISb3vQPGxR0euKap2XzAGC99LFUzb/+MkPMMVSE=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:content-transfer-encoding:in-reply-to:references:feedback-id;
 b=OVQOXxNNBdVLPAvdnRu3nD+BJ9Jd7XnZxM+v2UAg7Dt9eeyhjF5FfvuWI7H1zuYUTd0UaIgFW
 8R4jY2m/il7j1GZkpdLE6NUfBhSmzTh255KasI2GmjipVFYtmNDWBrbYyQd+hAXtSlz3+NbvoXe
 7hPo96RdDgHksoMakiG/W5q6MN2F6kg4ZCfWKjai9Ok2YleALx3DfBPCOF4OLPvREiLX8ai7VAQ
 TUoJ91m4ihR07ztc8gkJjVnsSiGxptxffLurCmpglVWN23btrSi05dhXhTi38bgGExLw4gyi0kK
 FJUNW5twEf8LjElm8JQxe5IXNFcbuwZ87LiXrVSfkJFw==
X-Zone-Loop: 125ba5c40f642d550407dd08563c999a887ad97e01b4
x-campaign-type: default
x-transaction-id: eb10ec8c-ce5b-4b42-a884-5a4de46444a3
x-swg-uid: 01-7298593e-0748-4585-a225-2d1a8543f0e5
X-Mailer: Sweego
Message-ID:
 <1792663384.8631fc262581453bbf619ec5b2062170.1a1631070d2000f79f@vates.tech>
x-swg-bid: 1792663384.8631fc262581453bbf619ec5b2062170.1a1631070d2000f79f
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v3 23/39] xen/riscv: add helpers for decoding a trapped
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
In-Reply-To: <bac190288e65f82ef51d85e32c939558c21776d0.1790779209.git.oleksii.kurochko@gmail.com>
References: <cover.1790779209.git.oleksii.kurochko@gmail.com>
 <bac190288e65f82ef51d85e32c939558c21776d0.1790779209.git.oleksii.kurochko@gmail.com>
Date: Thu, 22 Oct 2026 12:02:56 +0200
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792663378; l=11215;
 i=baptiste.le-duc@vates.tech; s=20260810; h=from:subject:message-id;
 bh=YwM1/YgJS/BtHyk/eh3362ee3qawZVAF/HQVBtLs7Nw=;
 b=d3n7waXknbdn2v946DBgLeyMZtnsmwkOgf8oi+Xu9ZAzwoOsZVQbhhGnXUNWRx4jziyY/h+mP
 GPAccm81NOaA2T+64NyRWKEjD/LTJ259ikyTv4IQcvJSXeRjOoLR6nC
X-Developer-Key: i=baptiste.le-duc@vates.tech; a=ed25519;
 pk=N+BbdvMXRzrCuX/ieh4RWodiAKcLNvI+KjflcZ0oXCo=
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1792663383647
X-purgate-ID: tlsNG-ebf023/1792663387-C22D4B50-9FF4F2C3/10/73395122804
X-purgate-type: spam
X-purgate-size: 11215
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

> emulate_load() and emulate_store() will both need to obtain the
> instruction which caused a guest MMIO trap, decode it, and locate the
> register operand it names. Add what the two share, ahead of either of
> them being implemented: struct decoded_insn, insn_fetch_faulted(),
> decode_ldst_insn(), guest_xlen(), guest_gpr() and advance_pc(), together
> with the XLEN_FIELD_*, INSN_OPCODE_* and RV_RD()/RV_RS2() definitions
> they need.
> 
> Nothing calls any of this yet, so reference the functions from the
> emulate_load() stub to keep the build going; the references go away once
> emulate_load() gains its body later.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---
> How these helpers are used can be seen in the patches adding emulate_load()
> and emulate_store().
Appreciate this precision, thanks!
> [ ... 116 lines skipped ... ]
> +/*
> + * The effective XLEN of the guest at the point of the trap: hstatus.VSXL for a
> + * trap taken from VS-mode, vsstatus.UXL for one taken from VU-mode.
> + *
> + * VSXL is consulted whichever mode the trap came from, as it also gives the
> + * width of vsstatus itself: where VSXL says 32, that register has no UXL field
> + * to consult and VU-mode is 32-bit as well, there being nothing to configure.
Reading "it also gives the width of vsstatus itself", one might
understand that VSXL equals UXL in all cases, while, as you mentioned,
this only holds when VSXL says 32. I would slightly reword it, e.g.:
```
    VSXL is consulted whichever mode the trap came from: if VSXL says
    32, vsstatus has no UXL field, so VU-mode is 32-bit as well and
    there is nothing to configure.
```
>
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
> +static unsigned int guest_xlen(const struct cpu_user_regs *regs)
> +{
> +#ifdef CONFIG_RISCV_32
> +    return 32;
> +#else
> +    unsigned long xl = MASK_EXTR(regs->hstatus, HSTATUS_VSXL);
xl only ever holds a 2-bit field, so unsigned int would be better here.
> [ ... 49 lines skipped ... ]
> +static unsigned long *guest_gpr(struct cpu_user_regs *regs,
> +                                const struct decoded_insn *di)
> +{
> +    /*
> +     * decode_ldst_insn() is what fills @di in, and it rejects an access
> +     * wider than a guest register.
> +     */
> +    ASSERT(di->len <= (guest_xlen(regs) / BITS_PER_BYTE));
Nit: the parentheses around the division aren't needed.
> [ ... 14 lines skipped ... ]
> +static bool insn_fetch_faulted(const struct guest_fault *gf,
> +                               struct decoded_insn *di)
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
> +    /*
> +     * Bit[0] == 1 implies trapped instruction value is transformed instruction
> +     * or custom value. A transformed instruction is a 32-bit encoding, so a
> +     * value with any bit above bit[31] set is a custom one, which is of no use
> +     * for decoding: fetch the instruction from guest memory then, as for zero.
> +     */
> +    if ( (htinst & BIT(0, UL)) && (htinst == (uint32_t)htinst) )
> +    {
> +        /*
> +         * The transformation always yields the 32-bit format, with bits[1:0]
> +         * holding a marker instead of the original opcode bits: bit[0] set to
> +         * flag the transformation, bit[1] clear if the trapped instruction
> +         * was a compressed one. Restoring the opcode bits makes the value the
> +         * valid 32-bit encoding decode_ldst_insn() decodes. Its handling of
> +         * compressed encodings exists for the branch below, where a
> +         * compressed instruction is read from guest memory as is: a trapped
> +         * one arrives here already expanded to its 32-bit equivalent, and the
> +         * opcode bits just restored have it decoded as such.
Reading this, I first understood that something had to be done to recover
the original compressed opcode. "Restoring the opcode bits" suggests going
back to the trapped encoding, while it is only setting bits[1:0] to 0b11 of
an already expanded instruction. Maybe say that first, e.g.:

```
    /*
     * A compressed instruction is reported already expanded to its
     * 32-bit equivalent by the hardware, so htinst always holds a
     * 32-bit encoding, apart from bits[1:0] which is holding a marker:
     * bit[0] is set to flag the transformation and bit[1] is clear if
     * the trapped instruction was compressed. Setting both bits gives
     * the original 32-bit encoding for decode_ldst_insn().
     */
```
> +         *
> +         * The length then cannot come from the value anymore, only from
> +         * bit[1]. And only a 16- or a 32-bit instruction is ever reported
> +         * this way: the standard load and store instructions the hardware
> +         * transforms are all of one of these two lengths, anything else comes
> +         * as the zero special value handled below.
> +         */
> +        di->insn = htinst | 3;
> +        di->insn_len = (htinst & BIT(1, UL)) ? 4 : 2;
> +    }
> +    else
> +    {
> +        const struct cpu_user_regs *regs = gf->regs;
> +        struct trap_info utrap = {};
> +
> +        /*
> +         * Bit[0] == 0 implies trapped instruction value is zero or special
> +         * value. With the pseudoinstructions ruled out above, only zero (or a
> +         * custom value, see above) is left: the instruction has to be read from
> +         * guest memory.
Nit: as the assert would disappears in release build, this comment is
partially true. I would suggest something like:
```
         * Bit[0] == 0 implies trapped instruction value is zero or
         * special value. With the pseudoinstructions ruled out (see
         * comment above) only zero (or a custom value, see above) is
         * left: the instruction has to be read from guest memory.
```

> +         */
> +
> +        di->insn = read_guest(regs->sepc, true, &utrap);
> +        if ( utrap.scause )
> +        {
> +            /*
> +             * If during getting of trapped instruction a fault happen in
> +             * G-stage translation then CAUSE_LOAD_GUEST_PAGE_FAULT is
> +             * generated. Such faults during this operation is considered as
> +             * bus error.
Typo: "Such faults ... are considered" (plural subject). Also "a fault
happen" above should be "a fault happens", and "as bus error" -> "a
bus error". Maybe:

    /*
    * If a G-stage translation fault happens while fetching the
    * trapped instruction, CAUSE_LOAD_GUEST_PAGE_FAULT is generated.
    * Such faults are treated as an access fault.
    */
I used access fault instead of bus error because the code below sets
CAUSE_FETCH_ACCESS which is more like an access fault.

> [ ... 54 lines skipped ... ]
> +/*
> + * Decode the load or store instruction fetched into @di, filling in the
> + * remaining fields of it (@di->insn and @di->insn_len are filled by
> + * insn_fetch_faulted()). Fields which don't apply to the instruction are left
> + * alone, so @di is expected to start out zeroed.
> + *
> + * @xlen is the effective XLEN of the guest, needed as
> + * the encodings which exist for XLEN=64 only must not be recognized for a
> + * 32-bit guest.
Nit: odd wrapping, "the encodings" fits on the line above.

> + *
> + * Returns false if the instruction is not a load or store which can be
> + * emulated here.
>
Nit: maybe reword for clarity:

 * Returns false if the instruction is not a load or store, or cannot be
 * emulated here.

> + */
> +static bool decode_ldst_insn(struct decoded_insn *di, unsigned int xlen)
> +{
> +    uint32_t insn = di->insn;
> +    unsigned int funct3, width_log2;
> +
> +    if ( INSN_IS_16BIT(insn) )
> +    {
> +        /*
> +         * C.LW, C.LD, C.SW and C.SD (bits[1:0] == 00), and their sp-relative
> +         * C.*SP forms (bits[1:0] == 10), have bits[15:13] of the form x1y:
> +         * x is set for a store, and y selects a width of 4 or 8 bytes.
Very clear thanks.
> +         */
> +        funct3 = RV_X(insn, 13, 3);
> +
> +        if ( (insn & 1) || !(funct3 & 2) )
> +            return false;
> +
> +        di->is_write = funct3 & 4;
> +        width_log2 = 2 + (funct3 & 1);
> +
> +        if ( !(insn & 2) )
> +            /* Quadrant 0: bits[4:2] encode rd' (load) or rs2' (store) */
> +            di->reg = RVC_RS2S(insn);
> +        else if ( di->is_write )
> +            /* Quadrant 2 (CSS): bits[6:2] encode rs2 for C.SWSP / C.SDSP */
> +            di->reg = RVC_RS2(insn);
> +        else
> +        {
> +            /* Quadrant 2 (CI): bits[11:7] encode rd for C.LWSP / C.LDSP */
> +            di->reg = RV_RD(insn);
> +
> +            /* C.LWSP and C.LDSP are reserved with rd being x0. */
> +            if ( !di->reg )
> +                return false;
> +        }
> +    }
> +    else
> +    {
> +        /*
> +         * funct3[1:0] is log2 of the width in bytes, and funct3[2] selects
> +         * zero-extension for a load, while being reserved for a store.
> +         */
> +        funct3 = RV_X(insn, 12, 3);

Nit: the RVC branch above says where funct3 lives (bits[15:13]), this one
doesn't. Maybe mention bits[14:12] as well, so the reader doesn't wonder why
12 here vs 13 above:

```
        /*
         * LOAD and STORE (I/S-type) have funct3 in bits[14:12]: funct3[1:0]
         * is log2 of the width in bytes, and funct3[2] selects zero-extension
         * for a load, while being reserved for a store.
         */
```

> [ ... 51 lines skipped ... ]
> diff --git a/xen/arch/riscv/include/asm/riscv_encoding.h b/xen/arch/riscv/include/asm/riscv_encoding.h
> index b01da95f7e..1af309aa4a 100644
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
Do we really need long here? int wouldn't be enough?

-- 
Baptiste Le Duc <baptiste.le-duc@vates.tech>

