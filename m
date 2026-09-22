Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43315C982FA
	for <xen-devel@archiver.kernel.org>; Tue, 22 Sep 2026 10:20:51 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1428539.1651382 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8xc4-0005DV-JV; Tue, 22 Sep 2026 10:20:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1428539.1651382; Tue, 22 Sep 2026 10:20:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8xc4-0005DO-Gs; Tue, 22 Sep 2026 10:20:36 +0000
Received: by outflank-mailman (input) for mailman id 1428539;
 Tue, 22 Sep 2026 10:20:36 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x8xc3-0005DC-SF
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2026 10:20:35 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x8xc3-005Iqa-0v
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2026 12:20:35 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ab25663-bab6-0a2a0a5309dd-0a2a45058ee6-36
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 12:20:34 +0200
Received: from [74.125.225.76] (helo=mail-wr2-f12.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ab25672-4cb1-0a2a45050019-4a7de14ce11a-3
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 12:20:34 +0200
Received: by mail-wr2-f12.google.com with SMTP id
 ffacd0b85a97d-482f62ccdb1so1366285f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 03:20:34 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4886277e84dsm4193133f8f.20.2026.09.22.03.20.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Sep 2026 03:20:33 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:Autocrypt:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1790072434; x=1790677234; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NUy6/cLFyqdO0dmZ/aIVtzBYW0tV/zVebq7X+jymWdA=;
        b=ZzLSNKu1nVuEpyVx3j+ueEEET3KOvmN/ZS0dgwlxFudCppiiHZJpNZaNb3gtseM40O
         9C6qAJYUdY9AkbCVm6s1cyHXg0G8stCE9aa0vL89iIusVms5cYcZdpARPwH0wa6X+Wf0
         eZj65wAwvhR/8tlvOJuPuLzOTCSj48RUj7EBKtum47ktFnWFk0Un12JIoJApQbDxcRE0
         U8jUCpPqjOJP/Cv7aKqMDMGvO7ogTzg5nZhIFgM+aWGW++tzPy1weWoj1cGEsMObdg93
         /mGobx1PaDOF/PxilYVpwQleuEwIElbAtEin3s/0p7QtD90bjmsra3fQGqmyZyyhYId9
         Qqow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790072434; x=1790677234;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NUy6/cLFyqdO0dmZ/aIVtzBYW0tV/zVebq7X+jymWdA=;
        b=xP5PaUE3+Ta23HMwJGamm98zi2UgTxCT0m8x9IlYARkWkKDCQlFRF7IZHHvJbtkebN
         nN88U06fyB+XH59GimZ1/Fdxpc2iW5/O0e8ZNdecaquprGVHEsMv3/dtqIbOAJRsNcsU
         jiICpW48iOWJi5V6YKZntsXg6b1nH265xOflkLhb5DJ8hFJc8iQjxyrn0ySFsNLITeA3
         dKAa15phGAoLL7J1WjjDPa2i+Rk77vRsvp9uXhv1u5vEIFGcNiWwpt9Yd1WuAssXZMRQ
         AQdiyDJiZAAwkcon6Wx7Yv8/Hc17RzpO0khJ8ci3rrSgydf/DGkoWeWH/lQU/6syF03t
         w9EQ==
X-Forwarded-Encrypted: i=1; AKwUvBwwyBb9GtUvbReSx1KiNkP+OqnU8FJvSnjcV+/DXyknRvXdNfl/7AhpK6lP+N7wiS7zVYcpTlL7mx8=@lists.xenproject.org
X-Gm-Message-State: AFuF++k4LC8yDGjzBJn/uH5U+NxwBnfpSBSCITvioNHXNFPZq5mFweRk
	FuZevvRuJXNQS15HyBgxsHoCEX29SnSeuC++aiuq8eTuCpFnuDN/dS3EcUuF+g96sA==
X-Gm-Gg: AYBFou0F3VOObBW8H9RqmVle8HzpsZm7UaiXVdtIn2hyoLOg/iOOknAT4NZ7qDbvEPG
	wyMbozlXUYPT7cjTL/oLVM3fAQOusNJjUCn85D6yTom35RDJ77NqBBqO2KH3LeDgVjtczjHhDCL
	MziQhZOLaOx6tfCcuztUvMTqEElwuMo4o0gb0EkSkcpmxJBTUWwEc3Hj5oKDrQdgsATcnaSFWt/
	rkuepK5sdAkTeFz2u6tsiYBT4hAdCi9KQ75D+buaL0EUKcXC7gqHwp2dMDqQ43Ttlp0b5/MIxby
	5MFtA7qZG6wbEF5OV+TqGuWcQBrtipcmXw807U9JZsZIAV3cDNaLIW3Lm9nVZDlp5PNbDMRZM8r
	+OeTZgtmk0fd3praf/jlhBfQopdmMKoUjx379YmBfzjfr3C4mkXCxUmJxOFxshjUE7TByCyl3kI
	s16E8RIRQO/HVdBs3zG2cDqhlFie2N8a6zOl5PC8+Sd1LMaGF9QxUEojOWdg/iV8aV29aAqJj1T
	rsE+/gBIpG9Qep8re1KOMDkM8pCSdoVBO+opPqu/3FLRnk/nE0uP9xgjWHNyg==
X-Received: by 2002:a05:6000:4b1b:b0:487:13a9:80d with SMTP id ffacd0b85a97d-48860ff7d35mr3914753f8f.10.1790072434238;
        Tue, 22 Sep 2026 03:20:34 -0700 (PDT)
Message-ID: <a88e1326-14da-4613-9d01-2e374b574467@suse.com>
Date: Tue, 22 Sep 2026 12:20:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 38/39] xen/riscv: implement continue_new_vcpu()
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
 <a282887cc08cd9b05f59d46cab9377915e83c61d.1787838835.git.oleksii.kurochko@gmail.com>
 <8dbc4ba6-bf92-4e9f-b4b6-7286d5a96443@suse.com>
 <96f66feb-8889-4475-b39f-ed52b1f58a68@gmail.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <96f66feb-8889-4475-b39f-ed52b1f58a68@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c201ff/1790072434-F7CB82A1-C6CCF03B/0/0
X-purgate-type: clean
X-purgate-size: 6538

On 22.09.2026 10:23, Oleksii Kurochko wrote:
> On 9/21/26 2:12 PM, Jan Beulich wrote:
>> On 27.08.2026 17:21, Oleksii Kurochko wrote:
>>> continue_new_vcpu() is the arch hook invoked the first time a freshly
>>> created vCPU is scheduled. Implement both cases it has to cover:
>>>   - for the idle vCPU, switch to its own stack and jump to idle_loop();
>>>   - for a guest vCPU, restore hstatus and enter the guest through the new
>>>     return_to_new_vcpu() path in entry.S, which loads sepc, passes the
>>>     hart id in a0 and the DTB address in a1 as expected by the RISC-V
>>>     boot protocol, sets sstatus.SPP and executes sret.
>>
>> Is this a requirement for all CPUs, or just for the boot one? (I can't
>> quite see why secondary processors would need passing a DTB address.)
> 
> It is requirement for boot one. For secondary processors it is HSM boot 
> data which is passed to sbi_hsm_hart_start() and then intercpeted by Xen.
> 
> At the moment of writing of this commit message we have only boot CPU 
> and so only DTB could be passed.

That you're talking about Xen. Despite Xen being UP only right now, guests
still can have more than one vCPU, can't they?

> I can update the commit message and the comment in return_to_new_vcpu() 
> to tell that it could be DTB address for boot cpu and/or for secondary 
> CPUs HSM boot data or it will be better to add info about HSM boot data 
> during and an introduction of secondary CPUs support?

As per above you want to deal with multi-vCPU guests right now.

>>> Interrupts have to stay disabled across the restore. The trap entry
>>> logic implicitly clears hstatus.SPV, so an interrupt taken between the
>>> write of hstatus and sret would make sret return to HS-mode instead of
>>> VS-mode, and restoring SPV afterwards is non-trivial. Instead interrupts
>>> are simply kept off and sstatus.SPIE is set, so that SIE is restored from
>>> SPIE once sret has been executed.
>>
>> As written this reads as if the guest would be responsible for doing this.
>> Isn't it rather SRET itself which does this?
> 
> IIUC to which part you refer then yes, it is SRET itself which does 
> this. So some re-wording should be done ...
> 
>>
>>> Also, it follows what hardware will do
>>> with real CPU which is also started with interrupts disabled.
>>
>> Further up, aiui, you talk about the host's interrupt state. How vCPU-s
>> are started, however, is virtual interrupt state. Mixing both isn't
>> very helpful.
> 
> ...:
> 
> Interrupts have to stay disabled across the restore. The trap entry
> logic implicitly clears hstatus.SPV, so an interrupt taken between the
> write of hstatus and sret would make sret return to HS-mode instead of
> VS-mode, and restoring SPV afterwards is non-trivial. Hence interrupts
> are kept disabled, and sstatus.SPIE is set so that sret itself 
> re-enables them (SIE := SPIE) as part of entering the guest.
> 
> Then it will be also need to update the comment inside 
> continue_new_vcpu() to:
> 
> -         * To avoid this, interrupts are kept disabled during the restore.
> -         * Additionally, setting sstatus.SPIE=1 ensures that after sret is
> -         * executed (as sstatus.SIE will be loaded from SPIE), HS-mode will
> -         * continue to receive interrupts normally.
> +         * To avoid this, interrupts are kept disabled during the restore,
> +         * and sstatus.SPIE is set so that sret itself re-enables them
> +         * (SIE := SPIE) as part of entering the guest.
>            */
> 
> Would it be the wording okay for you now?

I think so, yes.

>>> --- a/xen/arch/riscv/entry.S
>>> +++ b/xen/arch/riscv/entry.S
>>> @@ -143,3 +143,26 @@ FUNC(__context_switch)
>>>   
>>>           ret
>>>   END(__context_switch)
>>> +
>>> +/* t0 is used as a temporary reg and is clobbered to oblivion */
>>> +FUNC(return_to_new_vcpu)
>>> +        /* Swap tp with sscratch */
>>> +        csrrw   tp, CSR_SSCRATCH, tp
>>
>> What is this about? I'm not aware of any counterpart code, yet all on its
>> own this I can't see it being overly useful.
> 
> It will be needed later when a guest will be able to launch to 
> distinguish in handle_trap() [1] if a trap is from guest or not. I can 
> drop it for now and re-introduce it with the code of handle_trap() or as 
> an option I could update the comment above to:
> 
>          /*
>           * SSCRATCH holds this hart's struct pcpu_info while a guest 
> runs and
>           * is zero while Xen runs, so that a trap handler can tell the two
>           * apart: tp is Xen's pointer to pcpu_info in Xen context, but 
> belongs
>           * to the guest once sret has been executed. Establish that by 
> swapping
>           * the two here; the trap path swaps them back.
>           */
>          csrrw   tp, CSR_SSCRATCH, tp
> 
> (but then the last part will point to the part which isn't yet 
> introduced so probably it will be better to drop this line for now)

Yes, introducing it together with the other related pieces is going to be
more consistent and easier to follow.

>>> +        /* Set guest mode to supervisor */
>>> +        li      t0, SSTATUS_SPP
>>> +        csrs    CSR_SSTATUS, t0
>>> +
>>> +        /* Enter guest */
>>> +        sret
>>> +END(return_to_new_vcpu)
>>
>> Aiui SRET does not switch stacks. Shouldn't you therefore clear sp here?
>> And perhaps also other GPRs, not the least ra? Exposing hypervisor
>> register values to guests is, well, a bit of a problem.
> 
> Good point, sret leaves all GPRs as they are, so the guest would indeed 
> see Xen's sp, ra and friends. Only a0 and a1 are architecturally 
> meaningful for a booting hart, so I'll clear every other GPR right 
> before sret.
> 
> I will add the following before sret:
> 
>          /*
>           * sret doesn't switch stacks and leaves the GPRs alone, so every
>           * register which isn't meaningful to the vCPU being started 
> has to be
>           * cleared here: otherwise the guest would see Xen's values, sp 
> (this
>           * vCPU's Xen stack) and ra among them.
>           */
>          .irp reg, ra, sp, gp, tp, t0, t1, t2, s0, s1, a2, a3, a4, a5, 
> a6, a7, \
>                    s2, s3, s4, s5, s6, s7, s8, s9, s10, s11, t3, t4, t5, t6
>          mv      \reg, zero
>          .endr

At which point discussing the clobbering of t0 in the comment ahead of
the function also isn't needed anymore.

Jan

