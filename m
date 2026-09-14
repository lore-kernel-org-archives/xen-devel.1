Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F8EAC88E65
	for <xen-devel@archiver.kernel.org>; Mon, 14 Sep 2026 11:03:44 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1420775.1647003 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x64T9-0001pt-P6; Mon, 14 Sep 2026 11:03:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1420775.1647003; Mon, 14 Sep 2026 11:03:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x64T9-0001pm-MQ; Mon, 14 Sep 2026 11:03:27 +0000
Received: by outflank-mailman (input) for mailman id 1420775;
 Mon, 14 Sep 2026 11:03:26 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x64T8-0001pg-Q8
 for xen-devel@lists.xenproject.org; Mon, 14 Sep 2026 11:03:26 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x64T8-00D35q-33
 for xen-devel@lists.xenproject.org; Mon, 14 Sep 2026 13:03:26 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aa7d473-8faa-0a2a0a5109dd-0a2a450add0c-20
 for <xen-devel@lists.xenproject.org>; Mon, 14 Sep 2026 13:03:20 +0200
Received: from [74.125.225.141] (helo=mail-wm2-f13.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aa7d478-f2d2-0a2a450a0019-4a7de18d9ad2-3
 for <xen-devel@lists.xenproject.org>; Mon, 14 Sep 2026 13:03:20 +0200
Received: by mail-wm2-f13.google.com with SMTP id
 5b1f17b1804b1-49e7355e411so12394565e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 14 Sep 2026 04:03:20 -0700 (PDT)
Received: from [172.18.123.208] ([185.104.138.131])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49e62232cb7sm241487115e9.4.2026.09.14.04.03.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Sep 2026 04:03:19 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1789383800; x=1789988600; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VosfrI+8RtvxpWlfnnw7Xr/+ZAYLsvan3hsjL08KQUI=;
        b=g/8l7F7dknPb8xezowlQctydj+maX/PCM7LsApVUDacotRFMEmo4c00vNA9g9Yb44z
         4o6V6DNbhSBriMg5mrkh6SDD/AQi4LBY0CjwNdphHmkpezjtQ5QbnC5+kWVp/jhqx2BZ
         ktJhMp3enMEPA5Sr+HNmkIX0q5Hx5ZBEsMgjbCzfhEpGKRhEJboV6ungGr8eAttm9EbP
         S+LxDqTzR7x2Kvx3k671i5BmjFtEhWDr/pFR35heaZIU9Vdm+tsVUUFKvC4zsbPQIUvh
         4jo/vZq9AuFfY7F0fiinK494RuN3S2abpuYYtWnXYOAUG/bC1iEybgwgVEgbw86JIqWS
         MUUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789383800; x=1789988600;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VosfrI+8RtvxpWlfnnw7Xr/+ZAYLsvan3hsjL08KQUI=;
        b=OSq7plBCblUxk3TCGRnhVXTw+nfutc3FeeFQNoQPrXvF92Ts9w4Y1kRjlQ9e4Ir4Wj
         6fIQb8rqBS8p6Hrhu8fmMtml8PG2KWF2K4rE02yhfcBVfleuPT9AXUImOI2v2KJ2kDyT
         /9bSP1iLEdlOuFzDUL98eu2IKWFkrl+yzYEDPgacpglJv7j8FaXQxmyvftJVbO3sQqD7
         iM7Diw01QBM1mP8qthYoijfaj35sMwLgf2oIrytr/eLgXaAADqx3li29PjE3DMsMbLKf
         2Bnm/SnK6WoztuxtioT086Q2BHFPdCW1okKK/aZe0uxTBZFr19DOgf/77Aqm509Tk9oF
         e+8A==
X-Forwarded-Encrypted: i=1; AKwUvBzX6i9dEZwIKkDkc4E6Wq3siDeByZ6baKe5FN9ktTmZMu+yEGoErOgOCVJQV9xrIPJiky1gyGVvUhY=@lists.xenproject.org
X-Gm-Message-State: AFuF++lcs+z3TlgFf2PFRaiJihw4MKrdOzl3H0F4xvcPXcDUFLXlocsM
	QvjWS/gMJzm4jIDAptb2mWZJCKl1Oc1VYcqfUxmFyaCevWTdetdNPkkmZR1NUVGelA==
X-Gm-Gg: AYBFou2h7260waN8DnQxCXuaUREcZiE91x9XENuOoWP76uSOcxhLll6xyqkGRoBC1V3
	omiPCKG5Ft2FjXZIO0oRWhLjg3MqeH0PjKqlrE/9u7IQvVrC13YPdS8lUdmjrp4UleSLczOcWbp
	49n/epiOL3YyiumbTZ379CoLwm8B+F4W+uGJaTGLFJZvS9vZN4FMCjPqKSTCofduM19qOdTWXVL
	VirSKrCwX67xQvHoVCt97oyXW3viYDBXrFq7ggBRpBZS4PgmjlFST50zPY/sP9Ud6k2S5zuUUVu
	w/lC7l0H1r9bcYbR7mQteL6uDAqx05/01cj2eaVTIo8ZV9AtJpG4kkvs8M31C6iWIug3Lx6rtsl
	FnkbNWhCssFN7dIoYKNv2o4kYknAgsGb1NziZM9QQR/ZfCZaEif1nauKfnAwnKUaRPUk8AqoQob
	bX7m0cX9bOZwsI832QhtkHwI/Z6rmJt4KjX0XQpBv1EdQkvrZvlBgvFBMjgU1MpjC19Q+x4sxEV
	aYoe52TVKnGJVbiJqeAXls=
X-Received: by 2002:a05:600c:8b6b:b0:49c:d52e:d0ea with SMTP id 5b1f17b1804b1-49e7a64acc2mr53511275e9.4.1789383800100;
        Mon, 14 Sep 2026 04:03:20 -0700 (PDT)
Message-ID: <895a427d-1adb-43cb-a2bb-e0e9d50791db@suse.com>
Date: Mon, 14 Sep 2026 13:03:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 24/39] xen/riscv: add helpers for decoding a trapped
 load or store
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 Zheng Zhang <zhangzheng@iscas.ac.cn>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1787838835.git.oleksii.kurochko@gmail.com>
 <4c5361bda56e97f5338f4bc561498e018adbf618.1787838835.git.oleksii.kurochko@gmail.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <4c5361bda56e97f5338f4bc561498e018adbf618.1787838835.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-4011c0/1789383800-532D8CFC-40C8ABBC/0/0
X-purgate-type: clean
X-purgate-size: 12186

On 27.08.2026 17:21, Oleksii Kurochko wrote:
> emulate_load() and emulate_store() will both need to obtain the
> instruction which caused a guest MMIO trap, decode it, and locate the
> register operand it names. Add what the two share, ahead of either of
> them being implemented: struct decoded_insn, insn_fetch_faulted(),
> decode_ldst_insn(), guest_xlen(), guest_gpr() and advance_pc().
> 
> The mask/match chain is adapted from Linux's KVM RISC-V implementation.
> 
> Nothing calls any of this yet, so tag the functions __maybe_unused to
> keep the build going; the tags go away once emulate_load() and
> emulate_store() gain their bodies later.

That'll be a lot of churn to drop those __maybe_unused again. As this
is merely transient, did you consider putting

   (void)is_load_guest_page_fault;

etc in e.g. emulate_load()?

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

I wonder how efficient this is. With use of bitfield the size of this struct
can likely be more than halved. With suitable choice of widths this may not
even cause significantly worse generated code.

One thing in any event: Why would the insn field need to be wider than 32
bits?

> @@ -39,6 +60,71 @@ struct guest_fault {
>      paddr_t gpa;
>  };
>  
> +static bool is_load_guest_page_fault(unsigned long scause)
> +{
> +    return scause == CAUSE_LOAD_GUEST_PAGE_FAULT;
> +}

With no "store" counterpart this may end up being a little fragile (at the
use site(s)).

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

How about xl > XLEN_FIELD_32 here, to be RV128-compatible?

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

For future callers of this: For 32-bit environments hardware guarantees
upper halves of registers to be zero?

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

Hmm, so ->insn_len doesn't describe ->insn, as suggested by the comment in
the struct. That wants clarifying there.

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

Couldn't this be part of the initializer of utrap? Or does read_guest()
alter the field?

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

Such wording is at risk of going stale. Better say that no guest-exposed
extensions have wider than 32-bit insns.

> +        if ( !INSN_IS_16BIT(di->insn) && !INSN_IS_32BIT(di->insn) )
> +        {
> +            utrap.sepc = regs->sepc;

With the earlier remark this may then also not be needed here.

> +            utrap.scause = CAUSE_ILLEGAL_INSTRUCTION;
> +            /*
> +             * stval is left zero: the spec allows that for an illegal
> +             * instruction, and only part of the instruction is in hand.
> +             */

Not just this - stval may also not be wide enough to hold the full insn.

> +            trap_redirect(&utrap);
> +
> +            return true;
> +        }
> +
> +        di->insn_len = INSN_LEN(di->insn);

If you moved this up a little, you could avoid the separate use of
INSN_{32,64}BIT_MASK above, by going from the value calculated here.

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
> +    di->is_write = false;
> +    di->is_unsigned = false;

Elsewhere we established that the whole struct has to start out zeroed.
Why not leverage that also here?

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
> +    }

These insns encode the access width uniformly, i.e. doing things the
way done above is rather inefficient.

> +    /* c.lwsp and c.ldsp are reserved with rd being x0. */
> +    else if ( (insn & INSN_MASK_C_LWSP) == INSN_MATCH_C_LWSP && rd )
> +        di->len = 4;

Careful with insns not part of the base ISA: Between the trap and you
getting to fetch and decode, the in-memory insn may have changed. You
posibly set yourself up for vulnerabilities if you permit C encodings
for guests not having C exposed to them.

Jan

