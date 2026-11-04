Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6723606D808
	for <xen-devel@archiver.kernel.org>; Wed,  4 Nov 2026 16:38:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tav7Op5a
Received: from list by lists.xenproject.org with outflank-mailman.1472227.1680187 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOe0S-0007bt-1O; Wed, 04 Nov 2026 16:38:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1472227.1680187; Wed, 04 Nov 2026 16:38:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOe0R-0007bm-U5; Wed, 04 Nov 2026 16:38:35 +0000
Received: by outflank-mailman (input) for mailman id 1472227;
 Wed, 04 Nov 2026 16:38:35 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xOe0Q-0007bc-N6
 for xen-devel@lists.xenproject.org; Wed, 04 Nov 2026 16:38:34 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOe0P-000x1H-VJ
 for xen-devel@lists.xenproject.org; Wed, 04 Nov 2026 17:38:33 +0100
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6aeb5f81-bab6-0a2a0a5309dd-0a2a450c951c-22
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 17:38:33 +0100
Received: from [209.85.221.52] (helo=mail-wr1-f52.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6aeb5f89-f479-0a2a450c0019-d155dd34d917-3
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 17:38:33 +0100
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-490a0e72588so333723f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 08:38:33 -0800 (PST)
Received: from [192.168.1.6] (user-109-243-146-71.play-internet.pl.
 [109.243.146.71]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48fed0844e2sm3739894f8f.28.2026.11.04.08.38.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Nov 2026 08:38:32 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20260707 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793810313; x=1794415113; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7oPzuPFyKO/r7exvkxR3tK22R6tRkddL2ZLbRLJk17g=;
        b=tav7Op5a2+BlpMmOzyRXblOVwi6/m5dZnj5Wb+yK7a7SCOO7BFLBWdoobZ8l6SrLFK
         dZskwvApAH5wImF6+GAvjes2AhgBDdAg/i5WC8tH2HK7mKDdkMAakSe2Tef/JUAUkOmQ
         xx1l5NeOCtNClroqsW5+ICqbikljA89h425KnG2s7zuZLB2xv4ZGQyr/rFaGNAN74sMN
         8Rr7YWekVmBNnvqO1KajC1QeeuLyqcIUVeB80YYrYUBoHN9Eml3CuxBayCJyzw584uMu
         u4il6sue+fhF//FKemuZK0vY8QqbMHPnez15ES4o5JFCxzKRsJTTGTXotISKWeubwwCd
         NT7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793810313; x=1794415113;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7oPzuPFyKO/r7exvkxR3tK22R6tRkddL2ZLbRLJk17g=;
        b=v3A6++Q61+DDgq4TtxsvnbOaLUNE8KvQIWpUoDmXXnVNhMyC8aRybY+Yq44r6kqydy
         /yGSVlZbdQ0ngPSI57SvdmHW55U7vDHO5DwG44Qqolg3EtZ17rrJFeBCUGECX5As20wH
         HjOIED1ZC530LbAk1B0VfaV0ZfoCHmynAaNpGAjelx4II67JH2pdR1HEh8BEZcCXavxi
         lTvM1WQCVqZH3RDQwlZXY9yg1/e3arHY4kNUu4TY+lzG0chwtR8NBDETOOZFG68fqdjq
         lfq40CXDu4RjVDaQxzEYJ+5aUVW9z+LX1Gk/AIXaX0Kb0h2BFyR/QCFCX9NBrK7nyu/U
         hgLg==
X-Gm-Message-State: APuU4Z+UswB6dyc+KboKlffZNfGwvyR0CnWp1C5hVqXkPUCvoXUuh7FO
	+cyaCxruZutpubiaUdNamQjFx8FvrQ1Z3QPi83+iytj9fLOse9c03ZeG
X-Gm-Gg: AYBFou0JBN3WX6lvOvLdCq6xW1JqmRODf4W6tSNt8DsfkqXkxHhSRq01KslGL4pNoQD
	b5bGH7JibGfyZjIADEtlu29zUh3ptzQ4qlp9s9HgE1HcB1WShkTivKfDZ59B/DVga6N36RKaBgC
	/A4oa4cQcPWhO3UAXD+jhTP2tV1wiZUX1C10A+ZyU9DNkJfhtr8LNtxVhTBEkQi5P5SpLAf9j63
	O5rWIoqHWd+2tVGd4OlMIhcFNpU3w1WDJRzi8wjpYVGNgqaolsjBW4pwXXbbhNIlEEPGq+nK0XF
	sFV4xN7UJZukyPXiPkmti+4s6Fjsr50LQTCrQkzCuDpBqOIHmNwoK/euDsN56+osaaGXCLORJDL
	PTZTxOTXmdsYK6YpS2eY79k0d84yBoezImbDKPHZ2zxbegxKVSvQf+WtW388k4uRJ9ZaivHzZ+U
	YraCax1tmR8uO8a5TwGHkHP8GX8ysVI3kKsieGxcaAYCne8wD8PzF8GMmFIGK5aAlqGX8vW+d4V
	HG+uo5W3VUkskdFtmi5TTW+b+fhGA6KAFE1Fs5TUT0fyXn3ZpnH69sD9qtBSwcl59RXxc0n8Z6Y
	JIWaBMzG5UsBKzzJz7FB89VHZXfZEj7ZeT1RVVSmX88OZ3kEc1A9SLwLwFw0QkKKvCvsRwZYail
	tVDU=
X-Received: by 2002:a05:6000:2a03:b0:48a:fba3:d5b1 with SMTP id ffacd0b85a97d-48e6e50b502mr25808328f8f.55.1793810312999;
        Wed, 04 Nov 2026 08:38:32 -0800 (PST)
Message-ID: <8f6c0cd1-f5fc-4a1d-8752-3da42a52a710@gmail.com>
Date: Wed, 4 Nov 2026 17:38:31 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 23/39] xen/riscv: add helpers for decoding a trapped
 load or store
To: Baptiste Le Duc <baptiste.le-duc@vates.tech>
Cc: xen-devel@lists.xenproject.org,
 Romain Caritey <Romain.Caritey@microchip.com>,
 Zheng Zhang <zhangzheng@iscas.ac.cn>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>
References: <cover.1790779209.git.oleksii.kurochko@gmail.com>
 <bac190288e65f82ef51d85e32c939558c21776d0.1790779209.git.oleksii.kurochko@gmail.com>
 <1792663384.8631fc262581453bbf619ec5b2062170.1a1631070d2000f79f@vates.tech>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <1792663384.8631fc262581453bbf619ec5b2062170.1a1631070d2000f79f@vates.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d25034/1793810313-002F0A5B-C0CE863C/10/73395122804
X-purgate-type: spam
X-purgate-size: 14273
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 10/22/26 12:02 PM, Baptiste Le Duc wrote:
>> emulate_load() and emulate_store() will both need to obtain the
>> instruction which caused a guest MMIO trap, decode it, and locate the
>> register operand it names. Add what the two share, ahead of either of
>> them being implemented: struct decoded_insn, insn_fetch_faulted(),
>> decode_ldst_insn(), guest_xlen(), guest_gpr() and advance_pc(), together
>> with the XLEN_FIELD_*, INSN_OPCODE_* and RV_RD()/RV_RS2() definitions
>> they need.
>>
>> Nothing calls any of this yet, so reference the functions from the
>> emulate_load() stub to keep the build going; the references go away once
>> emulate_load() gains its body later.
>>
>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>> ---
>> How these helpers are used can be seen in the patches adding emulate_load()
>> and emulate_store().
> Appreciate this precision, thanks!

Welcome!

>> [ ... 116 lines skipped ... ]
>> +/*
>> + * The effective XLEN of the guest at the point of the trap: hstatus.VSXL for a
>> + * trap taken from VS-mode, vsstatus.UXL for one taken from VU-mode.
>> + *
>> + * VSXL is consulted whichever mode the trap came from, as it also gives the
>> + * width of vsstatus itself: where VSXL says 32, that register has no UXL field
>> + * to consult and VU-mode is 32-bit as well, there being nothing to configure.
> Reading "it also gives the width of vsstatus itself", one might
> understand that VSXL equals UXL in all cases, while, as you mentioned,
> this only holds when VSXL says 32. I would slightly reword it, e.g.:
> ```
>      VSXL is consulted whichever mode the trap came from: if VSXL says
>      32, vsstatus has no UXL field, so VU-mode is 32-bit as well and
>      there is nothing to configure.
> ```

Agreed. I'll use your suggested wording.

>>
>> + *
>> + * It is needed to decode a trapped instruction: the encodings which exist only
>> + * for XLEN=64 must not be recognized for a 32-bit guest. Besides those simply
>> + * being reserved there, the compressed ones are ambiguous: C.LD and C.FLW
>> + * share the encoding 0x6000 (mask 0xe003), and likewise C.SD/C.FSW,
>> + * C.LDSP/C.FLWSP and C.SDSP/C.FSWSP.
>> + *
>> + * IS_ENABLED() can't be used here as HSTATUS_VSXL is defined for
>> + * __riscv_xlen == 64 only, the field not existing on RV32 in the first place.
>> + */
>> +static unsigned int guest_xlen(const struct cpu_user_regs *regs)
>> +{
>> +#ifdef CONFIG_RISCV_32
>> +    return 32;
>> +#else
>> +    unsigned long xl = MASK_EXTR(regs->hstatus, HSTATUS_VSXL);
> xl only ever holds a 2-bit field, so unsigned int would be better here.

MASK_EXTR() yields the type of its operands, unsigned long here (and 
unsigned long long for the UXL extraction), as do the XLEN_FIELD_* 
constants xl is compared against. Making xl unsigned int would add an 
implicit narrowing conversion: harmless value-wise but I think it will 
violate one of MISRA rules at least if build everything with 
-Wconversion then it will tell: conversion from 'long unsigned int' to 
'unsigned int' may change value.

>> [ ... 49 lines skipped ... ]
>> +static unsigned long *guest_gpr(struct cpu_user_regs *regs,
>> +                                const struct decoded_insn *di)
>> +{
>> +    /*
>> +     * decode_ldst_insn() is what fills @di in, and it rejects an access
>> +     * wider than a guest register.
>> +     */
>> +    ASSERT(di->len <= (guest_xlen(regs) / BITS_PER_BYTE));
> Nit: the parentheses around the division aren't needed.

I can drop them but I think it improves readability here a little bit.

>> [ ... 14 lines skipped ... ]
>> +static bool insn_fetch_faulted(const struct guest_fault *gf,
>> +                               struct decoded_insn *di)
>> +{
>> +    unsigned long htinst = gf->htinst;
>> +
>> +    /*
>> +     * A pseudoinstruction says nothing about the instruction the guest was
>> +     * executing, and comes with a guest physical address which isn't the one
>> +     * that instruction accessed. handle_guest_page_fault() deals with such a
>> +     * fault on its own, so no emulation can ever start for one.
>> +     */
>> +    ASSERT(!htinst_is_pseudo(htinst));
>> +
>> +    /*
>> +     * Bit[0] == 1 implies trapped instruction value is transformed instruction
>> +     * or custom value. A transformed instruction is a 32-bit encoding, so a
>> +     * value with any bit above bit[31] set is a custom one, which is of no use
>> +     * for decoding: fetch the instruction from guest memory then, as for zero.
>> +     */
>> +    if ( (htinst & BIT(0, UL)) && (htinst == (uint32_t)htinst) )
>> +    {
>> +        /*
>> +         * The transformation always yields the 32-bit format, with bits[1:0]
>> +         * holding a marker instead of the original opcode bits: bit[0] set to
>> +         * flag the transformation, bit[1] clear if the trapped instruction
>> +         * was a compressed one. Restoring the opcode bits makes the value the
>> +         * valid 32-bit encoding decode_ldst_insn() decodes. Its handling of
>> +         * compressed encodings exists for the branch below, where a
>> +         * compressed instruction is read from guest memory as is: a trapped
>> +         * one arrives here already expanded to its 32-bit equivalent, and the
>> +         * opcode bits just restored have it decoded as such.
> Reading this, I first understood that something had to be done to recover
> the original compressed opcode. "Restoring the opcode bits" suggests going
> back to the trapped encoding, while it is only setting bits[1:0] to 0b11 of
> an already expanded instruction. Maybe say that first, e.g.:
> 
> ```
>      /*
>       * A compressed instruction is reported already expanded to its
>       * 32-bit equivalent by the hardware, so htinst always holds a
>       * 32-bit encoding, apart from bits[1:0] which is holding a marker:
>       * bit[0] is set to flag the transformation and bit[1] is clear if
>       * the trapped instruction was compressed. Setting both bits gives
>       * the original 32-bit encoding for decode_ldst_insn().
>       */
> ```

Agree, it will be better.

>> +         *
>> +         * The length then cannot come from the value anymore, only from
>> +         * bit[1]. And only a 16- or a 32-bit instruction is ever reported
>> +         * this way: the standard load and store instructions the hardware
>> +         * transforms are all of one of these two lengths, anything else comes
>> +         * as the zero special value handled below.
>> +         */
>> +        di->insn = htinst | 3;
>> +        di->insn_len = (htinst & BIT(1, UL)) ? 4 : 2;
>> +    }
>> +    else
>> +    {
>> +        const struct cpu_user_regs *regs = gf->regs;
>> +        struct trap_info utrap = {};
>> +
>> +        /*
>> +         * Bit[0] == 0 implies trapped instruction value is zero or special
>> +         * value. With the pseudoinstructions ruled out above, only zero (or a
>> +         * custom value, see above) is left: the instruction has to be read from
>> +         * guest memory.
> Nit: as the assert would disappears in release build, this comment is
> partially true. I would suggest something like:
> ```
>           * Bit[0] == 0 implies trapped instruction value is zero or
>           * special value. With the pseudoinstructions ruled out (see
>           * comment above) only zero (or a custom value, see above) is
>           * left: the instruction has to be read from guest memory.
> ```
> 

Agree "ruled out" could be read incorrectly. I think it will be better then:

          /*
           * Bit[0] == 0 implies trapped instruction value is zero or 
special
-         * value. With the pseudoinstructions ruled out above, only 
zero (or a
-         * custom value, see above) is left: the instruction has to be 
read from
-         * guest memory.
+         * value. Pseudoinstructions never get here (see the comment 
ahead of
+         * the ASSERT() above), so only zero (or a custom value, see 
above) is
+         * left: the instruction has to be read from guest memory.
           */

>> +         */
>> +
>> +        di->insn = read_guest(regs->sepc, true, &utrap);
>> +        if ( utrap.scause )
>> +        {
>> +            /*
>> +             * If during getting of trapped instruction a fault happen in
>> +             * G-stage translation then CAUSE_LOAD_GUEST_PAGE_FAULT is
>> +             * generated. Such faults during this operation is considered as
>> +             * bus error.
> Typo: "Such faults ... are considered" (plural subject). Also "a fault
> happen" above should be "a fault happens", and "as bus error" -> "a
> bus error". Maybe:
> 
>      /*
>      * If a G-stage translation fault happens while fetching the
>      * trapped instruction, CAUSE_LOAD_GUEST_PAGE_FAULT is generated.
>      * Such faults are treated as an access fault.
>      */
> I used access fault instead of bus error because the code below sets
> CAUSE_FETCH_ACCESS which is more like an access fault.
> 

Suggestion LGTM with one nit that "... instruction acccess fault" + 
mentioned of that it is because of hlvx instruction so:

              /*
-             * If during getting of trapped instruction a fault happen in
-             * G-stage translation then CAUSE_LOAD_GUEST_PAGE_FAULT is
-             * generated. Such faults during this operation is 
considered as
-             * bus error.
+             * If a G-stage translation fault happens while fetching the
+             * trapped instruction, CAUSE_LOAD_GUEST_PAGE_FAULT is 
generated,
+             * hlvx being a load. Such a fault is reported to the guest 
as an
+             * instruction access fault.
               */
              if ( utrap.scause == CAUSE_LOAD_GUEST_PAGE_FAULT )
                  utrap.scause = CAUSE_FETCH_ACCESS;



>> [ ... 54 lines skipped ... ]
>> +/*
>> + * Decode the load or store instruction fetched into @di, filling in the
>> + * remaining fields of it (@di->insn and @di->insn_len are filled by
>> + * insn_fetch_faulted()). Fields which don't apply to the instruction are left
>> + * alone, so @di is expected to start out zeroed.
>> + *
>> + * @xlen is the effective XLEN of the guest, needed as
>> + * the encodings which exist for XLEN=64 only must not be recognized for a
>> + * 32-bit guest.
> Nit: odd wrapping, "the encodings" fits on the line above.
> 

Missed that, it could be really on the prev line.

>> + *
>> + * Returns false if the instruction is not a load or store which can be
>> + * emulated here.
>>
> Nit: maybe reword for clarity:
> 
>   * Returns false if the instruction is not a load or store, or cannot be
>   * emulated here.
> 

Agree, your option is better

>> + */
>> +static bool decode_ldst_insn(struct decoded_insn *di, unsigned int xlen)
>> +{
>> +    uint32_t insn = di->insn;
>> +    unsigned int funct3, width_log2;
>> +
>> +    if ( INSN_IS_16BIT(insn) )
>> +    {
>> +        /*
>> +         * C.LW, C.LD, C.SW and C.SD (bits[1:0] == 00), and their sp-relative
>> +         * C.*SP forms (bits[1:0] == 10), have bits[15:13] of the form x1y:
>> +         * x is set for a store, and y selects a width of 4 or 8 bytes.
>> +         */
>> +        funct3 = RV_X(insn, 13, 3);
>> +
>> +        if ( (insn & 1) || !(funct3 & 2) )
>> +            return false;
>> +
>> +        di->is_write = funct3 & 4;
>> +        width_log2 = 2 + (funct3 & 1);
>> +
>> +        if ( !(insn & 2) )
>> +            /* Quadrant 0: bits[4:2] encode rd' (load) or rs2' (store) */
>> +            di->reg = RVC_RS2S(insn);
>> +        else if ( di->is_write )
>> +            /* Quadrant 2 (CSS): bits[6:2] encode rs2 for C.SWSP / C.SDSP */
>> +            di->reg = RVC_RS2(insn);
>> +        else
>> +        {
>> +            /* Quadrant 2 (CI): bits[11:7] encode rd for C.LWSP / C.LDSP */
>> +            di->reg = RV_RD(insn);
>> +
>> +            /* C.LWSP and C.LDSP are reserved with rd being x0. */
>> +            if ( !di->reg )
>> +                return false;
>> +        }
>> +    }
>> +    else
>> +    {
>> +        /*
>> +         * funct3[1:0] is log2 of the width in bytes, and funct3[2] selects
>> +         * zero-extension for a load, while being reserved for a store.
>> +         */
>> +        funct3 = RV_X(insn, 12, 3);
> 
> Nit: the RVC branch above says where funct3 lives (bits[15:13]), this one
> doesn't. Maybe mention bits[14:12] as well, so the reader doesn't wonder why
> 12 here vs 13 above:
> 
> ```
>          /*
>           * LOAD and STORE (I/S-type) have funct3 in bits[14:12]: funct3[1:0]
>           * is log2 of the width in bytes, and funct3[2] selects zero-extension
>           * for a load, while being reserved for a store.
>           */
> ```

Agreed. Will apply your comment.

> 
>> [ ... 51 lines skipped ... ]
>> diff --git a/xen/arch/riscv/include/asm/riscv_encoding.h b/xen/arch/riscv/include/asm/riscv_encoding.h
>> index b01da95f7e..1af309aa4a 100644
>> --- a/xen/arch/riscv/include/asm/riscv_encoding.h
>> +++ b/xen/arch/riscv/include/asm/riscv_encoding.h
>> @@ -65,6 +65,14 @@
>>   #define SSTATUS64_UXL			MSTATUS_UXL
>>   #define SSTATUS64_SD			MSTATUS64_SD
>>   
>> +/*
>> + * Width encoded by the MXL, SXL, UXL and VSXL fields, all of which share one
>> + * encoding. 0 is reserved.
>> + */
>> +#define XLEN_FIELD_32			_UL(1)
>> +#define XLEN_FIELD_64			_UL(2)
>> +#define XLEN_FIELD_128			_UL(3)
> Do we really need long here? int wouldn't be enough?
> 

Good question.

These are values of fields living at bits 33:32 (VSXL, UXL, SXL), so a 
plain int would overflow if one were ever shifted into place. That isn't 
the case at the moment, but I think it's worth looking beyond the 
current uses: this header is included all over arch/riscv, and we can't 
know how these definitions will be used in the future. Using UL also 
keeps them in line with the other field values in this header, e.g. 
SATP_MODE_* and STVEC_MODE_*.

Thanks for review!

~ Oleksii

