Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7DDD606A328
	for <xen-devel@archiver.kernel.org>; Wed,  4 Nov 2026 11:00:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TrhpY0Ua
Received: from list by lists.xenproject.org with outflank-mailman.1471674.1679921 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOYix-0008TN-JP; Wed, 04 Nov 2026 11:00:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1471674.1679921; Wed, 04 Nov 2026 11:00:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOYix-0008TG-GV; Wed, 04 Nov 2026 11:00:11 +0000
Received: by outflank-mailman (input) for mailman id 1471674;
 Wed, 04 Nov 2026 11:00:10 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xOYiw-0008TA-Bv
 for xen-devel@lists.xenproject.org; Wed, 04 Nov 2026 11:00:10 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOYiv-00ALUa-OC
 for xen-devel@lists.xenproject.org; Wed, 04 Nov 2026 12:00:09 +0100
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6aeb1036-e002-0a2a0a5209dd-0a2a4508ae56-24
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 12:00:09 +0100
Received: from [209.85.128.46] (helo=mail-wm1-f46.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6aeb1038-f659-0a2a45080019-d155802eb1a0-3
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 12:00:09 +0100
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-4a2153c8525so3357025e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 03:00:09 -0800 (PST)
Received: from [192.168.1.6] (user-109-243-146-71.play-internet.pl.
 [109.243.146.71]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4b43c748105sm43632025e9.6.2026.11.04.03.00.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Nov 2026 03:00:07 -0800 (PST)
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
        d=gmail.com; s=20260707; t=1793790008; x=1794394808; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PbFWdUa4VlrjpcKmBu2JCg52vYF9RRdG6E4DaLLh+cM=;
        b=TrhpY0UaM3o39jITf4y3qEU+jkKIBvOekevnAO4wBzz8urPLh67EXCLfBXoqCRD53A
         iRa0DcF+mdU/zhg0YcwEQbjIlPBJMxAAnmrHYG9WxxDVC3KLh6FsREnQ++QlLV+lYZKu
         2mKyHb73zbODu561c+smA//FkcRkrZNaA1sNK0VxpmjWVOZ6/DW7WCAoHAOVe7KIdeSe
         HZdvTrYOK4ueTGKEF+0aRKF+iR45GaVaHwS+puKaWp78oM2PU8I7yc5HMZnUVDYdUnO+
         6v6Z5N/DN2+fCZTdESlZSSb09A6VDCq4umlpt1vD91qFi3YBcIx2EeqbU5FLvvT15O1e
         407A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793790008; x=1794394808;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PbFWdUa4VlrjpcKmBu2JCg52vYF9RRdG6E4DaLLh+cM=;
        b=LzlEpf1V8KPlI+xtQ7SxANs5RhLMBOlVxW+HlE0zSck8h/pXe1vPpoYMMU0zqn4ho7
         c0OKZ+KWyfIJ2YKQELggBB3iqeeeQ+UtdyskbNIO6mGtjAGAfvNqPqOo3xShrA8jbyVQ
         BcvGDmxdfXI2CGhRncJ1uPXB5gbm9E/vFJ9IpLggOEtw8rCcq0D6fOq1WORzMYdo7sDk
         ChBjUGlUFQPU15mCQTz94Q9ni1TrI3kMv8z9qnPTkzqEv+fQ1D3u5w4OBJJb2hU5FtIw
         Gz0GWYWeTm8wlt2Qhg4VSRPffJUZOtWyFNZUwNgIMPlOmGT5SwIYdJ0vSnvNNPLajbFp
         W6dg==
X-Gm-Message-State: APuU4Z+xjBqxD19Cdtcl6OuBvwDGIDIzYsevfjK1DTdIIoooZJwTmuBd
	1CrQJ2cOZ5fOTgSkIvVipIW1IHgu2eXROjI9dHIe3CJJ9i1UWHVw88Y3
X-Gm-Gg: AYBFou282I/Nl+1CsJBfB0hkZvSY2hPNUGBhZ46LqhYSrJwT+Tuadx+PwFErGYgFwoY
	oCPqQ5x/hNbBTfuUbb+PTY3DwZaAFZNWM0JFrZWyJYCOjRJScqdxlcPpsagso6wh6P/vYwGuVAK
	uocmEw3P5ssmGdbTYsVexl4Rm3heoMV+STH7ZjrgA/x00B5/L5HHLzB8dagrZWkc72J4yGroEUF
	m0u2NQg1k1NbTTfFIW4qfzncscz47GTeeIJCIlNkY7MB/fPB2b8iqHXCbYgLMsRqejv7VhTkv2R
	k+jwobgo4FfOI6LcAaxBIo7V8rGIPeP50QXeRF93loSgPsSXPPzQuyIGJ9mS5lWBR/0JGqDk03z
	cbCUIyTw86Q20m9/fTivfxGnRcYJfhMhC02MtRVjOodxPYVL+7Vh/uwgJ5FDsVX3R61hshx/FBY
	Yy2LnnVz2m84dxsvCusVJp5xPukOCeRpO2uq8CQkoDOjwtby68BUh7REK0mVbsIBTnVYsdSnN9y
	ymqsVNPOH/Gb43kSwdk6Pz8E977WnwjaWcYO9PU20crgJ7Gi52FdBWxPdN/eARruna7NbcvnkEk
	MVn1epuvT20c3XQBNsmmp8iR9px/YR8arpzV9NVqSvbLVkf34nunBqfN9bple+4GSaYFulgwxuQ
	gS1g=
X-Received: by 2002:a05:600c:c4b8:b0:4a0:1b14:e283 with SMTP id 5b1f17b1804b1-4ac150b38dbmr372936045e9.1.1793790007994;
        Wed, 04 Nov 2026 03:00:07 -0800 (PST)
Message-ID: <6a00cec2-b58e-4a83-a115-393f283d1cf6@gmail.com>
Date: Wed, 4 Nov 2026 12:00:06 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 15/39] xen/riscv: extend exception tables with type and
 data fields
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
 <8c1c0c2adf56a395b6419335161da9f11fc827c5.1790779209.git.oleksii.kurochko@gmail.com>
 <1792508383.8631fc262581453bbf619ec5b2062170.1a159d3517e000f79f@vates.tech>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <1792508383.8631fc262581453bbf619ec5b2062170.1a159d3517e000f79f@vates.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c1860d/1793790009-CFCD387B-06EFA35D/10/73395122804
X-purgate-type: spam
X-purgate-size: 6466
X-Spam-Status: No, score=-9.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 10/20/26 4:59 PM, Baptiste Le Duc wrote:


>>   
>>   static void __init __maybe_unused build_assertions(void)
>>   {
>> +/*
>> + * GPR_LIST() puts nothing between its entries, so the separator has to come
>> + * from here. It is emitted ahead of each entry rather than after it, so that
>> + * the expansion doesn't end with one and its use below can be terminated like
>> + * an ordinary statement.
>> + */
>> +#define CHECK_GPR_INDEX(num, name)                          \
>> +    ; BUILD_BUG_ON(offsetof(struct cpu_user_regs, name) !=  \
>> +                   offsetof(struct cpu_user_regs, zero) +   \
>> +                   (num) * sizeof(unsigned long))
>> +
>>       /*
>>        * Enforce the requirement documented in struct cpu_info that
>>        * guest_cpu_user_regs must be the first field.
>>        */
>>       BUILD_BUG_ON(offsetof(struct cpu_info, guest_cpu_user_regs));
>> +
>> +    /*
>> +     * Enforce the requirement documented in struct cpu_user_regs that the
>> +     * x0..x31 fields are contiguous and in architectural register-number
>> +     * order, which is what lets a register number be resolved to its saved
>> +     * value by indexing them as an array anchored at ->zero.
>> +     */
>> +    GPR_LIST(CHECK_GPR_INDEX);
>> +
>> +#undef CHECK_GPR_INDEX
>>   }


>> diff --git a/xen/arch/riscv/include/asm/gpr-num.h b/xen/arch/riscv/include/asm/gpr-num.h
>> new file mode 100644
>> index 0000000000..867ee172c0
>> --- /dev/null
>> +++ b/xen/arch/riscv/include/asm/gpr-num.h
>> @@ -0,0 +1,53 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +/*
>> + * Based on Linux 6.16 arch/riscv/include/asm/gpr-num.h, with the
>> + * register list turned into GPR_LIST() instead of being open-coded
>> + * with .irp, so that it can also be used outside of assembly.
>> + */
>> +#ifndef RISCV_GPR_NUM_H
>> +#define RISCV_GPR_NUM_H
>> +
>> +/*
>> + * GPRs by ABI name, together with their register number (x0 .. x31).
>> + *
>> + * This is the single source of truth for the mapping; users expand it with
>> + * their own per-register macro. Among them, the layout of struct cpu_user_regs
>> + * is checked against this list at build time (see build_assertions() in
>> + * domain.c), so neither list can be changed without the other.
>> + */
>> +#define GPR_LIST(x)                                 \
>> +    x(0,  zero) x(1,  ra)  x(2,  sp)  x(3,  gp)     \
>> +    x(4,  tp)   x(5,  t0)  x(6,  t1)  x(7,  t2)     \
>> +    x(8,  s0)   x(9,  s1)  x(10, a0)  x(11, a1)     \
>> +    x(12, a2)   x(13, a3)  x(14, a4)  x(15, a5)     \
>> +    x(16, a6)   x(17, a7)  x(18, s2)  x(19, s3)     \
>> +    x(20, s4)   x(21, s5)  x(22, s6)  x(23, s7)     \
>> +    x(24, s8)   x(25, s9)  x(26, s10) x(27, s11)    \
>> +    x(28, t3)   x(29, t4)  x(30, t5)  x(31, t6)
>> +
>> +/* Number of GPRs described by GPR_LIST(). */
>> +#define NR_GPRS 32
>> +
>> +#ifdef __ASSEMBLER__
>> +
>> +/*
>> + * Generate the .L_gpr_num_<name> assembler symbols, used to turn a register
>> + * name emitted by the compiler into a register number.
>> + *
>> + * The separator is emitted ahead of each entry rather than after it, so that
>> + * the expansion doesn't end with one: whatever follows a use of the list has
>> + * to supply its own separator, instead of silently relying on a trailing one.
>> + */
>> +#define GPR_NUM_EQU(num, name)  ; .equ .L_gpr_num_##name, num
>> +GPR_LIST(GPR_NUM_EQU)
>> +#undef GPR_NUM_EQU
>> +
>> +#else /* __ASSEMBLER__ */
>> +
>> +/* See the comment ahead of the __ASSEMBLER__ flavour above. */
> It's hard to understand which comment you're talking about, if you are
> talking about the separator comment above GPR_NUM_EQU, may I
> suggest something like:
> 
>      /* See the GPR_NUM_EQU()'s comment about separator use */

Agree, I will apply this suggestion. Maybe a little but more precise:

/* See the comment above the assembler GPR_NUM_EQU() about the separator. */

> 
> 
>> +#define GPR_NUM_EQU(num, name)  "\n.equ .L_gpr_num_" #name ", " #num
>> +#define DEFINE_ASM_GPR_NUMS     GPR_LIST(GPR_NUM_EQU)
>> +
>> +#endif /* __ASSEMBLER__ */
>> +
>> +#endif /* RISCV_GPR_NUM_H */
>>
>> diff --git a/xen/arch/riscv/include/asm/riscv_encoding.h b/xen/arch/riscv/include/asm/riscv_encoding.h
>> index 647268e6d0..599ae3cd60 100644
>> --- a/xen/arch/riscv/include/asm/riscv_encoding.h
>> +++ b/xen/arch/riscv/include/asm/riscv_encoding.h
>> @@ -911,8 +911,13 @@
>>   #define REG_OFFSET(insn, pos)		\
>>   	(SHIFT_RIGHT((insn), (pos) - LOG_REGBYTES) & REG_MASK)
>>   
>> +/*
>> + * The x0..x31 block of struct cpu_user_regs is not required to sit at the
>> + * start of the structure, so anchor the offset at ->zero (x0) rather than
>> + * at the structure itself.
>> + */
>>   #define REG_PTR(insn, pos, regs)	\
>> -	(unsigned long *)((unsigned long)(regs) + REG_OFFSET(insn, pos))
>> +	(unsigned long *)((unsigned long)&(regs)->zero + REG_OFFSET(insn, pos))
> I don't see why this hunk is needed here. Nothing in the tree uses REG_PTR()
> (nor GET_RS*() / SET_RD()), and ->zero is the first member of struct
> cpu_user_regs, so this is a no-op today. It is also unrelated to the extable
> change.
> 
> If you want REG_PTR() to follow the same layout assumption as regs_gpr_ptr(),
> I'd rather see it built on top of it, e.g. regs_gpr_ptr(regs, REG_OFFSET(insn,
> pos) >> LOG_REGBYTES), in a separate patch together with its first user.
> Otherwise please drop the hunk (and the matching sentence in the commit
> message).
> 

I'd rather keep it here. It isn't a standalone change waiting for a 
user: it follows from this patch relaxing the layout requirement. Until 
now the requirement wasn't written down anywhere, and REG_PTR() 
implicitly relied on the stricter form of it, x0..x31 starting at offset 
0 of struct cpu_user_regs. This patch documents the requirement as 
"contiguous and in register-number order, anchored at ->zero", with the 
BUILD_BUG_ON()s anchored the same way (look at build_assertions() 
above). Leaving REG_PTR() as is would make that comment untrue for the 
one other piece of code in the tree that resolves a register number to 
its saved value. Moving the block would then still build, and REG_PTR() 
would silently compute wrong addresses. It's a no-op today simply 
because the block still sits at the start of the structure.

~ Oleksii



