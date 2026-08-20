Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDA41C5DF81
	for <xen-devel@archiver.kernel.org>; Thu, 20 Aug 2026 13:39:07 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1396578.1634376 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wx2yp-0006CB-Bc; Thu, 20 Aug 2026 13:38:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1396578.1634376; Thu, 20 Aug 2026 13:38:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wx2yp-0006C4-8g; Thu, 20 Aug 2026 13:38:51 +0000
Received: by outflank-mailman (input) for mailman id 1396578;
 Thu, 20 Aug 2026 13:38:49 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wx2yn-0006By-6E
 for xen-devel@lists.xenproject.org; Thu, 20 Aug 2026 13:38:49 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wx2ym-00FSmu-J3
 for xen-devel@lists.xenproject.org; Thu, 20 Aug 2026 15:38:48 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a87035c-2eae-0a2a0a5409dd-0a2a450cce8a-28
 for <xen-devel@lists.xenproject.org>; Thu, 20 Aug 2026 15:38:48 +0200
Received: from [209.85.128.42] (helo=mail-wm1-f42.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a870368-f479-0a2a450c0019-d155802aa497-3
 for <xen-devel@lists.xenproject.org>; Thu, 20 Aug 2026 15:38:48 +0200
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-499b57cf2f3so2455765e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 20 Aug 2026 06:38:48 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-499a9e784b3sm125852055e9.3.2026.08.20.06.38.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Aug 2026 06:38:47 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787233128; x=1787837928; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FwIveaMVZqQ3xr7y6C3rbxssTn7KuMmVWVEyV+AvEn4=;
        b=agS9Qx+1mpBUD6N43AbT7RJKiqMGzrEzAr/gDQEUhi1fqYQ5Ls/kbNKccTjLh4zBaL
         Kvmmix8WVP8yF+YxlanQSSZOOFt7RozeWm9e1k5TZ8CBXUm5B2RCOItt3WUH/MAdnaqy
         T32dpXyPiQkTyJ1OvUP/qOWoyMA/s1pkUE95BmJW4I0HfM2AZ6NZcNJ9DDv5im2SByMI
         E7xF4NFf5Sdm3Oix7oX07XuJdJ1P+BYTpNalxvU3wO8PmSNV8V0Nj51uUjxSL8H5Xxzi
         3ZXoHl3lLf2h4h3TDPj+KjQmPYS6u6iGx7FGgvGlZvi25vU0wUIDox+hqmebG+odW3m7
         nQ2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787233128; x=1787837928;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FwIveaMVZqQ3xr7y6C3rbxssTn7KuMmVWVEyV+AvEn4=;
        b=iJ8aHGH4o7DK89tgCAfux3Bb12SgIbWWgIL3E+P+RpDfUCZsEA1wEsqGIm19Vp1Nww
         m03yUIIb1Gr3vCBQCMtOmMDAmjBCS2xZJKY6EIrYXYfdgkPHhe0LafaovLW1BvKtWbI3
         9yXT1g394+5GOTTA6Gxa4SNYhcOikV6lm+JeDTRKxa7P637MqjsbfbTC4cQwUkUM+EGL
         xNIoOZXP18B2q1LA7vZs0vvpgSMh97OeIB8HIW2ySnNcoeE7EAOQqZnbq25qsY6D7Otq
         TcPA7/kqwH6a5MOm7PAKv1YuFHZxj2qrVCn+NF/gzPK+xx7mqVTjztYUUevBfpnQx7yV
         x8rg==
X-Forwarded-Encrypted: i=1; AHgh+Ro93L0RTFnaTvXWcOt4EZPyDN1gduO7qmvTRGXtrsVIO6r4/Q08/7DAmIkC/cfdCwWjQZ7/1iqTIhk=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz2edj/ueFco0QY0IZY6pZKhdkCfUtO5+3AFr4VvH1kGC/AQ/N/
	w2AEwRqJzzykrA5NWbh1+BZIoDXuXYuogXJy3N8bit9bw41pEhHRe5Ks
X-Gm-Gg: AR+sD12JO3K+d2GaWRxSJO5QuJhLYN5iDK7R54JNCDdK7oy2G9YWou6fyBRtRxIRkAC
	F8Mozf60TGQwMUExdtu12qrXq/8mIl2JV4Ung9TyXleP1k8CZokCvVT1WRzByvh5yTYwvqmSs+w
	gSylIOS/I7JRL3Zp4pe9iN58NjoKNZ0y5HAmLrWLjAHmT2HMcRzPFL8bEKA3i+YCa3K+t5hiuHT
	CPBioVKVNdH2g8YuycAP9evihkipggwp/csFVdsdywAYlcUzEiMFxOHgol2WYf94Y0YCfaXotn3
	hItpF0KXhbVpvaNNjL57oyQNmuZOfSUG7TO9aLMFvZk4p2hnXqdT8zPUAPppUOF7USO+gkIg6a5
	To6hcd/EMHSc/d67tDT5f7jFhEgCyQQB20whQ5ZN5LF8QhqH2+PQN4k86eAGMtvCqlcZLOOyh0O
	Cqfc5j8dYJ3Wk4mqxEJWSoPcH08DWV/EL2/GFL2LZfiYBMjNW6NDqfh80yNJxyRpjW08R5gKz/3
	VHdxsBFzAHfCYofnJMWhKQziJb3fW3DqH6/rdqnh3Q=
X-Received: by 2002:a05:600c:674a:b0:499:5f80:83ac with SMTP id 5b1f17b1804b1-499b06cbaf2mr104118765e9.7.1787233127709;
        Thu, 20 Aug 2026 06:38:47 -0700 (PDT)
Message-ID: <417b2b37-d805-49a4-a23d-46dd8363a751@gmail.com>
Date: Thu, 20 Aug 2026 15:38:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 16/17] xen/riscv: add guest load emulation for trapped
 MMIO accesses
To: Jan Beulich <jbeulich@suse.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1784560663.git.oleksii.kurochko@gmail.com>
 <9b18a20367754605efd6a6b5bf09d4483d9c3ab2.1784560663.git.oleksii.kurochko@gmail.com>
 <7a2e46da-5b1f-448e-aba3-7eefe0a61950@suse.com>
 <aff1f879-48c6-4047-a6c1-237a350e0f35@gmail.com>
 <a64d4714-2215-4bff-9dfa-2cbcc36ce3f2@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <a64d4714-2215-4bff-9dfa-2cbcc36ce3f2@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d25034/1787233128-03CD3A5B-5C826055/10/73395122804
X-purgate-type: spam
X-purgate-size: 18150



On 8/20/26 9:34 AM, Jan Beulich wrote:
> On 19.08.2026 18:06, Oleksii Kurochko wrote:
>> On 8/13/26 9:15 AM, Jan Beulich wrote:
>>> On 29.07.2026 15:40, Oleksii Kurochko wrote:
>>>> @@ -210,9 +217,162 @@ static always_inline unsigned long get_faulting_gpa(void)
>>>>        return (csr_read(CSR_HTVAL) << 2) | (csr_read(CSR_STVAL) & 0x3);
>>>>    }
>>>>    
>>>> +/*
>>>> + * Determine the trapped instruction which caused a guest MMIO trap.
>>>> + *
>>>> + * Returns true if the trap was redirected to the guest, in which case
>>>> + * the caller must stop emulation and return success. Otherwise *insn
>>>> + * and *insn_len are filled in and the caller should continue decoding.
>>>> + */
>>>> +static bool decode_trapped_insn(unsigned long htinst, unsigned long *insn,
>>>> +                                unsigned int *insn_len)
>>>> +{
>>>> +    if ( htinst & 0x1 )
>>>> +    {
>>>> +        /*
>>>> +         * Bit[0] == 1 implies trapped instruction value is
>>>> +         * transformed instruction or custom instruction.
>>>> +         */
>>>> +        *insn = htinst | INSN_16BIT_MASK;
>>>> +        *insn_len = (htinst & BIT(1, UL)) ? INSN_LEN(*insn) : 2;
>>>
>>> In the if() you don't use BIT(), while here you do. Please be consistent.
>>>
>>> Why the use of INSN_LEN(), when due to the earlier assignment it'll always
>>> yield 4 here?
>>
>> ld/sd instruction which we are trapping here at the moment here could be
>> 2 bit and 4 bit depends on C extension so we need to pass correct
>> instruction length to advance_pc() after it is emulated.
> 
> Well, fine, but how does that matter? I pointed you at the preceding
> assignment, which sets bits 0 and 1. With that INSN_LEN() is guaranteed
> to return (at least) 4 (and it's not presently capable of returning
> values larger than 4).

Oh, right. But considering that htinst can handle only max 31 bits so it 
looks like it can't fit more then 32 bits instructions. But I think it 
is needed ifdef around INSN_LEN to not miss add support for longer 
instructions or just write now more generic macros (or static inline 
function).

> 
>>> Finally, how would the caller know whether it looks at a transformed insn
>>> or (as fetched below) a "normal" one?
>>
>> According to the spec ((part from htinst ... ):
>> On a synchronous exception, if a nonzero value is written, one of the
>> following shall be true about the value:
>>
>> • Bit 0 is 1, and replacing bit 1 with 1 makes the value into a valid
>> encoding of a standard instruction.
>> In this case, the instruction that trapped is the same kind as indicated
>> by the register value, and the register value is the transformation of
>> the trapping instruction, as defined later. For example, if bits 1:0 are
>> binary 11 and the register value is the encoding of a standard LW (load
>> word) instruction, then the trapping instruction is LW, and the register
>> value is the transformation of the trapping LW instruction.
>>
>> • Bit 0 is 1, and replacing bit 1 with 1 makes the value into an
>> instruction encoding that is explicitly designated for a custom
>> instruction (not an unused reserved encoding). This is a custom value.
>> The instruction that trapped is a non-standard instruction. The
>> interpretation of a custom value is not otherwise specified by this
>> standard.
>>
>> • The value is one of the special pseudoinstructions defined later, all
>> of which have bits 1:0 equal to 00.
>>
>> So setting bit 0 to 1 we will guarantee that it is normal "normal"
>> instruction.
> 
> Right. Yet my question was how to distinguish the cases. Or are you trying
> to tell me that distinguishing isn't going to be necessary, anywhere?

Yes, I don't see for now why such distinguish is necessary. But I will 
re-check that point.
> 
>>>> +    }
>>>> +    else
>>>> +    {
>>>> +        struct cpu_user_regs *regs = vcpu_guest_cpu_user_regs(current);
>>>
>>> Pointer-to-const.
>>>
>>>> +        struct trap_info utrap = { 0 };
>>>
>>> Just {} please.
>>>
>>>> +        /*
>>>> +         * Bit[0] == 0 implies trapped instruction value is
>>>> +         * zero or special value.
>>>> +         */
>>>
>>> How come you get away without dealing with pseudoinsns? The insn pointed at
>>> by regs->sepc is of no interest for faults caused by implicit memory accesses
>>> originating from VS-stage address translation.
>>
>> It is really problem but I think it should be resolved much earlier in
>> handle_guest_page_fault(). I will add the following:
>>
>> /*
>>        * A guest page fault taken on an implicit memory access performed for
>>        * VS-stage address translation (reading a PTE, or updating its A/D
>> bits)
>>        * reports a pseudoinstruction in htinst rather than a transformed
>>        * instruction. Such a fault can't be emulated: htval holds the guest
>>        * physical address of a VS-stage PTE rather than of any access the
>> guest
>>        * itself performed (and its two least significant bits are zero
>> instead
>>        * of matching stval), while the instruction at sepc is unrelated
>> to the
>>        * access which actually faulted.
>>        *
>>        * Report an access fault to the guest at the original virtual address,
>>        * which is what stval already holds and what hardware would raise
>> for a
>>        * page table walk hitting an inaccessible address.
>>        */
>>       if ( (htinst == INSN_PSEUDO_VS_LOAD) || (htinst ==
>> INSN_PSEUDO_VS_STORE) )
>>       {
>>           struct cpu_user_regs *regs = vcpu_guest_cpu_user_regs(current);
>>           struct trap_info utrap = {
>>               .scause = (htinst == INSN_PSEUDO_VS_LOAD) ? CAUSE_LOAD_ACCESS
>>                                                         : CAUSE_STORE_ACCESS,
>>               .sepc = regs->sepc,
>>               .stval = csr_read(CSR_STVAL),
>>           };
>>
>>           riscv_trap_redirect(&utrap);
>>           return;
>>       }
> 
> That's not what would happen on bare hardware though, aiui. At least I don't
> think I ever found it being spelled out anywhere what the supposed behavior
> is when a page table resides in unpopulated space.

What do you mean here by "unpopulated space"? IIUC, it means that to 
have things working we should have GVA -> GPA mapping, if there is no 
such mapping then correspondent access bits aren't set and so a 
page-fault exception corresponding to the original access type. So not 
access fault should be here but just correspondent page fault.

If GPA itself is incorrect (it isn't mapped in G-stage) then it looks to 
me that access fault should be generated. But in this case I think we 
won't be here (in handle_guest_page_fault() at all) as just a page fault 
will be generated (so G-stage fault), not guest page fault (VS-fault 
what is the case in the code above but as I told in prev paragraph 
access fault is too much in that case and just page fault will be enough 
and it looks like it is correspond to hardware behavior).
> 
>>>> +        *insn = riscv_vcpu_unpriv_read(true, regs->sepc, &utrap);
>>>> +        if ( utrap.scause )
>>>> +        {
>>>> +            /*
>>>> +             * A G-stage fault here would mean the P2M mapping of the page
>>>> +             * containing the trapped instruction disappeared after it was
>>>> +             * fetched.
>>>
>>> Does it? What about, again, faults from VS-stage address translation while
>>> hardware was trying to fetch an insn? That is ...
>>>
>>>> Nothing removes P2M mappings of a running domain yet,
>>>> +             * so this cannot happen.
>>>
>>> ... the necessary P2M mapping may never have been there.
>>
>> If VS-stage failed then CAUSE_LOAD_PAGE_FAULT will happen so BUG_ON()
>> won't occur and it will be passed to guest to handle it.
> 
> Are you sure? So far it was my understanding that CAUSE_LOAD_PAGE_FAULT
> would happen when VS-stage translation hits e.g. a non-present leaf
> entry. But got an address translation failure while doing the VS-stage
> page walk (i.e. failure to translate the address found in a VS-stage
> PTE to a host address) would raise CAUSE_LOAD_GUEST_PAGE_FAULT.

Sorry, you are right. Then what I suggested before instead of BUG_ON() 
will be enough:
             if ( is_load_guest_page_fault(utrap.scause) )
                 utrap.scause = CAUSE_FETCH_ACCESS;
as if we don't have mapping in G-stage then it looks like guest is 
trying to reach something wrong.
> 
>> BUG_ON() here catches CAUSE_LOAD_GUEST_PAGE_FAULT (G-stage translation
>> failure).
>>
>> Also, as I mentioned above I will change BUG_ON() too:
>>
>>               /*
>>                * If during getting of trapped instruction a fault happen in
>>                * G-stage translation then CAUSE_LOAD_GUEST_PAGE_FAULT is
>>                * generated. Such faults during this operation is
>> considered as
>>                * bus
>>                */
> 
> What is "bus" here (dym "bug"?), and why is the sentence unfinished?
> 
>>>> +             * TODO: Revisit once P2M mappings can be removed at runtime.
>>>> +             */
>>>> +            BUG_ON(is_load_guest_page_fault(utrap.scause));
>>>> +
>>>> +            utrap.sepc = regs->sepc;
>>>> +            utrap.stval = utrap.sepc;
>>>
>>> How do you know the fault was at .sepc? A 32-bit insn crossing a page boundary
>>> (implying the C extension is available) may well fault only on its higher half.
>>
>> According to the spec, if stval is written with a nonzero value when an
>> instruction access-fault or page-fault exception occurs on a system with
>> variable-length instructions, then stval will contain the virtual
>> address of the portion of the instruction that caused the fault, while
>> sepc will point to the beginning of the instruction.
>>
>> So here, we are trying to emulate what real hardware will do in this
>> case. In regs->sepc, we have the start of the instruction that we didn't
>> touch. sepc is filled according to the spec in this case.
> 
> Right, but utrap.stval is set to the same value, which is explicitly not
> in line with what you say above ("will contain the virtual address of the
> portion of the instruction that caused the fault").>
>> Regarding utrap.stval, we know that utrap.sepc points to the correct
>> part of the faulting address, as we are reading the instruction in
>> 16-bit chunks:
>>
>> HLVX_HU(%[val], %[addr])        ; low 16 bits from sepc
>> andi %[tmp], %[val], 3
>> addi %[tmp], %[tmp], -3
>> bne  %[tmp], zero, 2f           ; if not (insn & 3) == 3 -> 16-bit, end
>> addi %[addr], %[addr], 2        ; <- addr is now sepc+2
>> HLVX_HU(%[tmp], %[addr])        ; high 16 bits, possibly from another page
>>
>> So, if a trap happens while reading the high 16 bits (which may be
>> located on another page), then utrap.sepc, if the read fails, will point
>> to the high part of the instruction, which is what the spec requires.
>>
>> Does that make sense?
> 
> Not really, no. As said above - the code as written guarantees
> utrap.stval == utrap.sepc, and that cannot always be correct.

Oh, right, utrap.stval = utrap.sepc; should be just dropped utrap.stval 
already has a correct value (from ex_handler_trap_info()) which should 
be passed to guest.

> 
>>>> +/*
>>>> + * Check alignment and dispatch a decoded MMIO access to a registered
>>>> + * handler. On success (0), info->data holds the read value for loads.
>>>> + */
>>>> +static int do_mmio(mmio_info_t *info, unsigned long fault_addr,
>>>> +                   unsigned int len)
>>>> +{
>>>> +    /* Fault address should be aligned to length of MMIO */
>>>> +    if ( fault_addr & (len - 1) )
>>>> +        return -EIO;
>>>> +
>>>> +    info->gpa = fault_addr;
>>>> +    info->len = len;
>>>> +
>>>> +    switch ( try_handle_mmio(info) )
>>>> +    {
>>>> +    case IO_HANDLED:
>>>> +        return 0;
>>>> +    case IO_ABORT:
>>>> +        return -EIO;
>>>> +    default:
>>>> +        return -EOPNOTSUPP;
>>>> +    }
>>>> +}
>>>
>>> And there's no indication of "retry needed", e.g. when something changed
>>> between find_mmio_handler() and handle_{read,write}()?
>>
>> I don't have any specific scenario where it is needed now so I don't
>> know what to say.
>> And there is no race between find_mmio_handler() and
>> handle_{read,write}() as find_mmio_handler() returns copy of the
>> structure under read_lock():
> 
> Oh, right, but that's not visible here at all and requires going back to
> patch 04 to realize.

I will update the comment above function:

/*
  * Check alignment and dispatch a decoded MMIO access to a registered
  * handler. On success (0), info->data holds the read value for loads.
  *
  * There is no "retry" outcome to handle: find_mmio_handler() returns a
  * copy of the matching handler taken under vmmio->lock and the ops
  * structures are never freed, so the lookup result cannot go stale
  * between finding the handler and invoking it.
  */


> 
>>>>    static int emulate_load(unsigned long fault_addr, unsigned long htinst)
>>>>    {
>>>> -    return -EOPNOTSUPP;
>>>> +    struct cpu_user_regs *regs = vcpu_guest_cpu_user_regs(current);
>>>> +    mmio_info_t info = { .is_write = false };
>>>> +    unsigned long insn;
>>>> +    unsigned int shift = 0, len, insn_len;
>>>> +    bool is_unsigned = false;
>>>> +    int rc;
>>>> +
>>>> +    if ( decode_trapped_insn(htinst, &insn, &insn_len) )
>>>> +        return 0;
>>>> +
>>>> +    /* Decode length of MMIO and whether it is a sign- or zero-extending load */
>>>> +    if ( (insn & INSN_MASK_LB) == INSN_MATCH_LB )
>>>> +        len = 1;
>>>> +    else if ( (insn & INSN_MASK_LBU) == INSN_MATCH_LBU )
>>>> +    {
>>>> +        len = 1;
>>>> +        is_unsigned = true;
>>>> +    }
>>>> +    else if ( (insn & INSN_MASK_LH) == INSN_MATCH_LH )
>>>> +        len = 2;
>>>> +    else if ( (insn & INSN_MASK_LHU) == INSN_MATCH_LHU )
>>>> +    {
>>>> +        len = 2;
>>>> +        is_unsigned = true;
>>>> +    }
>>>> +    else if ( (insn & INSN_MASK_LW) == INSN_MATCH_LW )
>>>> +        len = 4;
>>>
>>> Already up to here this demonstrates a weakness of the INSN_MASK_*
>>> set of #define-s (which I similarly observe in binutils, and I expect it
>>> all has the same questionable origin). All INSN_MASK_L* and INSN_MASK_FL*
>>> (also INSN_MASK_S* and INSN_MASK_FS*) are identical, allowing for a nice
>>> switch() to be used here in principle. That said, with access width
>>> nicely encoded in FUNCT3, it's not even clear whether a switch() would
>>> end up being needed / efficient.
>>
>> .......
>>
>>>
>>> Otoh none of these masks cover the pseudoinsns that htinst may supply.
>>
>> As I answered above we should handle that before this function will call
>> so here we won't deal with htinst at all. Of course, if what I wrote
>> above is correct. I will double check before applying that.
>>
>>>
>>> Further, what about A-extension insns? Some (if not all) of them can
>>> plausibly be used on MMIO, I think.
>>
>> I’m not really sure that the A-extension is actively used for MMIO.
> 
> Does the spec preclude their use? I'm unaware of such a restriction.

Definitely no. In this case hypervisor will tell that we can't emulate 
this instruction and then extra handling should be added.

> 
>> At
>> least, Linux doesn’t do that for now, which is why we don’t handle
>> A-extension instructions here.
> 
> Focusing on what present Linux needs is okay, but then remaining gaps
> should (as said on various other occasions before) be clearly marked.
> 
>> I think this is related to the fact that MMIO is usually (if not
>> always?) naturally aligned, and naturally aligned loads and stores are
>> guaranteed by RISC-V to execute atomically.
> 
> How does this matter, when a bit or field in MMIO may serve the purpose
> of e.g. a semaphore?

Then yes it will be an issue and such instruction should be emulated 
(when such use cases will come into play)

> 
>>>> +    {
>>>> +        len = 4;
>>>> +        is_unsigned = true;
>>>> +    }
>>>> +#endif
>>>> +    else if ( (insn & INSN_MASK_C_LW) == INSN_MATCH_C_LW )
>>>> +    {
>>>> +        len = 4;
>>>> +        insn = RVC_RS2S(insn) << SH_RD;
>>>> +    }
>>>> +    else if ( (insn & INSN_MASK_C_LWSP) == INSN_MATCH_C_LWSP &&
>>>> +              RV_X(insn, SH_RD, 5) )
>>>> +        len = 4;
>>>> +#ifndef CONFIG_RISCV_32
>>>> +    else if ( (insn & INSN_MASK_LD) == INSN_MATCH_LD )
>>>> +        len = 8;
>>>> +    else if ( (insn & INSN_MASK_C_LD) == INSN_MATCH_C_LD )
>>>> +    {
>>>> +        len = 8;
>>>> +        insn = RVC_RS2S(insn) << SH_RD;
>>>> +    }
>>>> +    else if ( (insn & INSN_MASK_C_LDSP) == INSN_MATCH_C_LDSP &&
>>>> +              RV_X(insn, SH_RD, 5) )
>>>> +        len = 8;
>>>> +#endif
>>>> +    else
>>>> +        return -EOPNOTSUPP;
>>>
>>> Because you don't permit F/D/Q for guests (yet), FL* and FS* aren't
>>> covered, I expect?
>>
>> At the moment, I wrote this function with handling of MMIO instruction
>> in mind, which are at the moment ld and sd.
>>
>> Even if to permit F/D/Q then do we really need to trap that
>> instructions? Hypervisor could allow access to FPU to guest and then it
>> will be just a question of context switch to properly save and restore FPU.
> 
> And how would you know FPU loads/stores aren't used against MMIO? Later
> on, once V support is added, even its loads/stores might be used that way.
> Think of video frame buffer accesses, for example.

We will get 'return -EOPNOTSUPP' and so guest will be crashed because we 
don't support such work with MMIO.
And then yes it should be likely to be added in parallel with adding 
F/D/Q support for guest. At the moment, KVM supports, for example, F/D/Q 
but doesn't emulate FPU load/store but I agree that with your example it 
could happen.

~ Oleksii

