Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64D94606D805
	for <xen-devel@archiver.kernel.org>; Thu,  5 Nov 2026 11:44:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eV6Gvx37
Received: from list by lists.xenproject.org with outflank-mailman.1474496.1681605 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOvsu-0002kx-QF; Thu, 05 Nov 2026 11:44:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1474496.1681605; Thu, 05 Nov 2026 11:44:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOvsu-0002kq-NG; Thu, 05 Nov 2026 11:44:00 +0000
Received: by outflank-mailman (input) for mailman id 1474496;
 Thu, 05 Nov 2026 11:43:59 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xOvst-0002kk-Fu
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 11:43:59 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOvss-002gbd-Gm
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 12:43:58 +0100
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6aec6be7-e002-0a2a0a5209dd-0a2a4501c33a-38
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 12:43:58 +0100
Received: from [209.85.128.49] (helo=mail-wm1-f49.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6aec6bfe-5984-0a2a45010019-d1558031c07c-3
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 12:43:58 +0100
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-4a5b2be99a8so13720625e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 03:43:58 -0800 (PST)
Received: from [192.168.1.6] (user-109-243-65-71.play-internet.pl.
 [109.243.65.71]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48feda1f100sm9735976f8f.46.2026.11.05.03.43.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Nov 2026 03:43:57 -0800 (PST)
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
        d=gmail.com; s=20260707; t=1793879038; x=1794483838; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fC3nIsihUEw5p4mwDyf18YPtfyEs4Yx7c0Yt/0Br/ts=;
        b=eV6Gvx371EHhWUeeSHK6m4r42ZQASr0z/EjzzQf7/xEY7FjOoyBpVJHGK3s9b4pFQj
         rAIUgJKyt/AU9cjU//dbA2oRdjpUHIF3KIR3x1CcfPukgjrYCFCCdn+rchKNyJv4ZBxR
         IKzsgqbGGQvmsHvnA6FapN1Pa2KNGdqo6ITWE4d5wBQbgEI8Md2pOhS0lOAT+CFRbdlK
         p1TUyElvcG1btQZ57/lQoZQMmVNanam9LoQe1yqWywseYTmNeDtvcxLPg7nix08Cjo+J
         FSJQFkkvnlFwdeJBmgrnTeKjrA/Yows9zxVmEruZEXBINNig9nnQtwNj7P/YAF269U9S
         QwDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793879038; x=1794483838;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fC3nIsihUEw5p4mwDyf18YPtfyEs4Yx7c0Yt/0Br/ts=;
        b=2Mb8n73h/OA5/oiZ7oaM7yjlElWEv16q3sbCldT8Y+VarVThHGpzOTCiUnpnkBUpbC
         lfGVFxmijOfFvyfJV4WOHPiSOVZVPRmDA9xXlj1cRB26S0iVkrKBozk2W5ykaCWp/7Xa
         A6myN24h6Pinfxn3eBBLe1z7a3PdFY4COJk9pkHsfFpmvH1GS+2eddiJUxFt/kB08MA7
         r6ZeY7bDV8qcIH8ncwpZNwsJPhrF31/sEyWUzhEZAoB07Ileu4hpb/V1TWvDvgaeVvMj
         w6fcK1qyLVXKK6AC8Ot68n8gwfqRMf+YRUtqSBoUZbyriBKsqoGjUhF5mlTkQJxWmXgR
         yp1A==
X-Gm-Message-State: APuU4Z9CWREcm90+eXjP/sYQXdjfEdBYpEubZ/p9qXTlkahtaN6IaboQ
	QsYzDTMKvfYA5BDxfNGTelvuVQZvWDjRkzSLFIpN7nkB1UBNuLLPLKrV
X-Gm-Gg: AYBFou1RobJ/sAPRyV03779PKwdD1yj7YZ0fgdbmIu3bMXMjFb07n9RuZZZ+Zje48CR
	wcgSRwAIUSYaLNNe0w4xFpa6J9h4aSFSk84dbd2ezm9eSN+e3nMuotgj6xfiU2i/PCw2vRzeHVZ
	TILHuCEy733ssFxxnc/mj1mTZ+jTm319mh0CEw9F2kFSRbZots/Kt7IkaYWMSi54zP2Q28pu5hO
	VvMr8nJT5wGxqdKU5k3vV4I0ums/lKaS6K6hvWugIk7j3dUAPVD+uNAMXSg6MaQaoBPWP8KNB8C
	BU9PzqZLvKL+CRVOplFj9hE9ms1TU1kfa61v/bEN8FfMcY9YjQjYTUPHZ+xO2RQ2XfFLaJDvpyJ
	DbvXWzZ1XA+BE5SRebgViHAZb5nSnu1hgV9VR0uqJR0IrFAQNG7VUedTrQN6tuMT5+hbiYJXyc3
	AeC7zNDaYMIVc4sT+4oauCrEPp7lkAuumIsbHBpjjWXrkYV+sWz+Ktn0Grgv6mI0QtsXY19S7hC
	C/kY6OL+kC7+ECZwLM3yP0NKF/Wy3xQOhf9g9t9zZjO93CGJWg1uV852qg/9zA6XMeEOromfbuQ
	1qcWQWoYJgFVPh4GmcnzR7IyMcRIslzqGg4AtSCcJOVV7lHQ4pleHlFFTp15KAVCMG52CGJ7oRY
	2jecb1rusXjzGrlxcfoqXdA==
X-Received: by 2002:a05:600c:4f8b:b0:4a3:5a98:c279 with SMTP id 5b1f17b1804b1-4ac17ffb07cmr406193075e9.8.1793879037743;
        Thu, 05 Nov 2026 03:43:57 -0800 (PST)
Message-ID: <d8839a78-4af7-46cd-b9ca-8913f98f84f8@gmail.com>
Date: Thu, 5 Nov 2026 12:43:56 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 28/39] xen/riscv: introduce vaplic_reconfigure_target()
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
 <ccbe8db271e53f13bfc4bd223d546e8531108310.1790779209.git.oleksii.kurochko@gmail.com>
 <1792676312.8631fc262581453bbf619ec5b2062170.1a163d5b71c000f79f@vates.tech>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <1792676312.8631fc262581453bbf619ec5b2062170.1a163d5b71c000f79f@vates.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d62444/1793879038-1E07B757-30D04DCD/10/73395122804
X-purgate-type: spam
X-purgate-size: 8356
X-Spam-Status: No, score=-9.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 10/22/26 3:38 PM, Baptiste Le Duc wrote:
>> When a vCPU is migrated to a different pCPU, its IMSIC guest interrupt
>> file changes. Any APLIC interrupt previously configured to deliver an
>> MSI to the old interrupt file must be retargeted to the new one.
>>
> Jan's first question on v2 was how this avoids losing interrupts that
> are raised mid-retarget. You answered it on the list (step 3 of the AIA
> VS-level migration sequence; in-flight MSIs still land in the old file's
> eip and get merged into the new file later), but neither the description
> nor a comment says so. Please put it in the description, since this
> function is only correct as one step of that sequence.
> 

I will add the following:

This is correct only as part of step 3 of the sequence in the AIA spec's
"Migrating a virtual hart to a different guest interrupt file". Before
it is called, the new file must be cleared, with eidelivery set to 0,
and recorded in the vCPU's IMSIC state, which aplic_msi_target_gen()
takes the new target from. Once it returns, Xen must synchronize with
the APLIC.

That is also why an interrupt raised mid-retarget isn't lost. An MSI
sent before its source's TARGET register is rewritten is latched in the
old file's eip, the synchronization ensures it has arrived there, and
steps 4 and 5 merge that eip into the new file. One sent after the
rewrite lands in the new file and stays pending there until eidelivery
is restored (step 6).


>> [ ... 43 lines skipped ... ]
>> --- a/xen/arch/riscv/aplic.c
>> +++ b/xen/arch/riscv/aplic.c
>> @@ -128,7 +128,10 @@ static unsigned long aplic_hart_index(unsigned int cpu)
>>   /*
>>    * v->processor can't be used here: during a migration it names the new pCPU
>>    * before the interrupt file is moved there. The caller has to hold
>> - * vsfile_lock until the result is written to the h/w.
>> + * vsfile_lock, so that the guest file id and the pCPU owning it are read as
>> + * a consistent pair. A value built from the old file just before a migration
>> + * publishes the new one isn't lost: vaplic_reconfigure_target() runs after
>> + * the publication and rewrites every source targeting the vCPU.
> At this point in the series nothing calls vaplic_reconfigure_target(),
> so "runs after the publication" describes a caller that doesn't exist
> yet. Either move this sentence to the patch that adds the call, or word
> it as a requirement on that caller.
> 

Agreed, I'll word it as a requirement on that caller:

   A value may still be built from the old file just before a migration
   publishes the new one, so whoever publishes a new file has to call
   vaplic_reconfigure_target() afterwards, to rewrite every source
   targeting the vCPU.



>> [ ... 43 lines skipped ... ]
>>
>> +/* Decode the target vCPU from a TARGET snapshot (NULL if none). */
>> +static struct vcpu *vaplic_target_decode_vcpu(const struct domain *d,
>> +                                              uint32_t target)
>> +{
>> +    unsigned int hart_idx = MASK_EXTR(target, APLIC_TARGET_HART_IDX);
>> +
>> +    /*
>> +     * Skip a source whose EIID is 0, e.g. one still holding its reset
>> +     * value: interrupt identity 0 isn't valid at any IMSIC interrupt file,
>> +     * so such a source delivers nothing and needs no retargeting.
>> +     * The hart index range check is only a guard: the write path refuses to
>> +     * record values with an out-of-range hart index.
>> +     */
> "Reset value" reads as if the AIA spec defined one, but it doesn't: APLIC
> state other than domaincfg, the MSI address config registers and the
> genmsi Busy bit is UNSPECIFIED after reset. The 0 here only comes from
> xvzalloc_array() in domain_vaplic_init(). Could this be made explicit?
> It may also be worth saying that this check keeps unprogrammed sources
> from decoding as targeting vCPU0 (hart index 0), which would otherwise
> cause pointless physical TARGET rewrites on every vCPU0 migration.
> 
> Something like:
> 
>        /*
>         * Skip a source whose EIID is 0 (not yet programmed, vAPLIC state
>         * is zero-initialised): identity 0 is reserved at every IMSIC, so
>         * it can't fire. Otherwise it would also decode as targeting
>         * vCPU0 and get rewritten on every vCPU0 migration.
>         * The hart index range check is only a guard: the write path
>         * refuses to record values with an out-of-range hart index.
>         */
> 

Agreed on both points. I'd word it slightly differently though: the
write path doesn't reject EIID 0, so a guest can program it itself and
"not yet programmed" is only one of the cases; the spec calls identity 0
never valid rather than reserved; and such a source can still become
pending and have its MSI sent, it's the IMSIC that ignores it. So:

     Skip a source whose EIID is 0: interrupt identity 0 is never valid
     at an IMSIC, so such a source delivers nothing and needs no
     retargeting. The AIA spec leaves target[] UNSPECIFIED after reset,
     but the vAPLIC state is zero-initialized, so this also covers every
     source the guest hasn't programmed yet, which would otherwise decode
     as targeting vCPU0 (hart index 0) and have its h/w TARGET register
     needlessly rewritten on every vCPU0 migration.


>> [ ... 6 lines skipped ... ]
>> +void vaplic_reconfigure_target(const struct vcpu *v)
>> +{
>> +    struct domain *d = v->domain;
>> +    struct vaplic *vaplic = to_vaplic(d);
>> +    struct vimsic_state *vimsic_state = v->arch.vimsic_state;
>> +    unsigned int irqn;
>> +
>> +    bitmap_for_each ( irqn, d->arch.vintc->used_irqs, d->arch.vintc->nr_virqs )
>> +    {
>> +        struct vaplic_source *src = &vaplic->regs.sources[irqn];
>> +        unsigned long flags;
>> +        uint32_t target;
>> +
>> +        /* APLIC interrupt sources start from 1, there is no source 0. */
>> +        if ( !irqn )
>> +            continue;
>> +
>> +        spin_lock_irqsave(&src->lock, flags);
>> +
>> +        target = read_atomic(&src->target);
>> +
>> +        if ( vaplic_target_decode_vcpu(d, target) == v )
>> +        {
>> +            /*
>> +             * IRQs are already off under src->lock so no need for *_irqsave
>> +             * here.
>> +             */
>> +            read_lock(&vimsic_state->vsfile_lock);
>> +            aplic_hw_write_reg(offsetof(struct aplic_regs, target[irqn - 1]),
>> +                               aplic_msi_target_gen(v, target));
>>
> Doesn't this need the same vsfile_cpu != CPU_NONE check as
> vaplic_emulate_store()? 

The case with the similar place in vaplic_emulate_store() is slightly 
different, as a guest could write to the target register using a vCPU 
for which the h/w interrupt file hasn't been assigned yet. Since we 
support only h/w interrupt files, we should simply ignore such writes, 
as the vCPU isn't ready for some reason.

> Because it seems that, for a vCPU on a s/w
> VS-file, aplic_msi_target_gen() calls aplic_hart_index(CPU_NONE) and
> indexes imsic->msi[] out of bounds; the ASSERT() in
> aplic_msi_target_gen() doesn't help in release builds.

I think ASSERT() should be sufficient to catch this situation. Since 
software interrupt file support is not included in this patch series, 
vaplic_reconfigure_target() cannot be called for a vCPU with a software 
interrupt file. The ASSERT() in aplic_hw_write_reg() will catch such 
cases. Therefore, even in a release build, we will never encounter a 
vCPU with a software interrupt file so we shouldn't care that ASSERT() 
is do nothing in release built.

When it comes to adding software interrupt file support, debug builds 
will be used during development, so the need to update 
aplic_msi_target_gen() to handle this case properly won't be overlooked.

> Since both
> callers now do the same lock/check/generate/write sequence, a helper for
> it would make sense.
> 

Looking at my current implementation of the software interrupt file 
support, aplic_msi_target_gen() has been updated so that there is no 
longer a need to check vsfile_cpu != CPU_NONE before calling it. 
Therefore, this check will be removed from vaplic_emulate_store() and 
both the places will look the same.

~ Oleksii



