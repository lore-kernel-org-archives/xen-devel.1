Return-Path: <SRS0=FkqA=62=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B9E9C54E4A
	for <xen-devel@archiver.kernel.org>; Tue, 12 May 2020 14:31:54 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E36A020722
	for <xen-devel@archiver.kernel.org>; Tue, 12 May 2020 14:31:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E36A020722
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jYVwU-0001tr-W3; Tue, 12 May 2020 14:31:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qSkR=62=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jYVwT-0001tm-Hz
 for xen-devel@lists.xenproject.org; Tue, 12 May 2020 14:31:33 +0000
X-Inumbo-ID: 465d0268-945d-11ea-ae69-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 465d0268-945d-11ea-ae69-bc764e2007e4;
 Tue, 12 May 2020 14:31:32 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 4F718AD03;
 Tue, 12 May 2020 14:31:34 +0000 (UTC)
Subject: Re: [PATCH 12/16] x86/extable: Adjust extable handling to be shadow
 stack compatible
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200501225838.9866-1-andrew.cooper3@citrix.com>
 <20200501225838.9866-13-andrew.cooper3@citrix.com>
 <1e80c672-9308-f7ad-67ea-69d83d69bc03@suse.com>
 <974f631e-3a82-3da4-124d-f4bf2bef89e2@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <59fcdaf0-f877-7a90-9bf4-9e41b1bbcea7@suse.com>
Date: Tue, 12 May 2020 16:31:31 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <974f631e-3a82-3da4-124d-f4bf2bef89e2@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 11.05.2020 23:09, Andrew Cooper wrote:
> On 07/05/2020 14:35, Jan Beulich wrote:
>> On 02.05.2020 00:58, Andrew Cooper wrote:
>>> --- a/xen/arch/x86/traps.c
>>> +++ b/xen/arch/x86/traps.c
>>> @@ -778,6 +778,28 @@ static bool exception_fixup(struct cpu_user_regs *regs, bool print)
>>>                 vec_name(regs->entry_vector), regs->error_code,
>>>                 _p(regs->rip), _p(regs->rip), _p(fixup));
>>>  
>>> +    if ( IS_ENABLED(CONFIG_XEN_SHSTK) )
>>> +    {
>>> +        unsigned long ssp;
>>> +
>>> +        asm ("rdsspq %0" : "=r" (ssp) : "0" (1) );
>>> +        if ( ssp != 1 )
>>> +        {
>>> +            unsigned long *ptr = _p(ssp);
>>> +
>>> +            /* Search for %rip in the shadow stack, ... */
>>> +            while ( *ptr != regs->rip )
>>> +                ptr++;
>> Wouldn't it be better to bound the loop, as it shouldn't search past
>> (strictly speaking not even to) the next page boundary? Also you
>> don't care about the top of the stack (being the to be restored SSP),
>> do you? I.e. maybe
>>
>>             while ( *++ptr != regs->rip )
>>                 ;
>>
>> ?
>>
>> And then - isn't searching for a specific RIP value alone prone to
>> error, in case a it matches an ordinary return address? I.e.
>> wouldn't you better search for a matching RIP accompanied by a
>> suitable pointer into the shadow stack and a matching CS value?
>> Otherwise, ...
>>
>>> +            ASSERT(ptr[1] == __HYPERVISOR_CS);
>> ... also assert that ptr[-1] points into the shadow stack?
> 
> So this is the problem I was talking about that the previous contexts
> SSP isn't stored anywhere helpful.
> 
> What we are in practice doing is looking 2 or 3 words up the shadow
> stack (depending on exactly how deep our call graph is), to the shadow
> IRET frame matching the real IRET frame which regs is pointing to.
> 
> Both IRET frames were pushed in the process of generating the exception,
> and we've already matched regs->rip to the exception table record.  We
> need to fix up regs->rip and the shadow lip to the fixup address.
> 
> As we are always fixing up an exception generated from Xen context, we
> know that ptr[1] == __HYPERVISOR_CS, and *ptr[-1] = &ptr[2], as we
> haven't switched shadow stack as part of taking this exception. 
> However, this second point is fragile to exception handlers moving onto IST.
> 
> We can't encounter regs->rip in the shadow stack between the current SSP
> and the IRET frame we're looking to fix up, or we would have taken a
> recursive fault and not reached exception_fixup() to begin with.

I'm afraid I don't follow here. Consider a function (also)
involved in exception handling having this code sequence:

    call    func
    mov     (%rax), %eax

If the fault we're handling occured on the MOV and
exception_fixup() is a descendant of func(), then the first
instance of an address on the shadow stack pointing at this
MOV is going to be the one which did not fault.

> Therefore, the loop is reasonably bounded in all cases.
> 
> Sadly, there is no RDSS instruction, so we can't actually use shadow
> stack reads to spot if we underflowed the shadow stack, and there is no
> useful alternative to panic() if we fail to find the shadow IRET frame.

But afaics you don't panic() in this case. Instead you continue
looping until (presumably) you hit some form of fault.

>>> --- a/xen/arch/x86/x86_64/entry.S
>>> +++ b/xen/arch/x86/x86_64/entry.S
>>> @@ -708,7 +708,16 @@ exception_with_ints_disabled:
>>>          call  search_pre_exception_table
>>>          testq %rax,%rax                 # no fixup code for faulting EIP?
>>>          jz    1b
>>> -        movq  %rax,UREGS_rip(%rsp)
>>> +        movq  %rax,UREGS_rip(%rsp)      # fixup regular stack
>>> +
>>> +#ifdef CONFIG_XEN_SHSTK
>>> +        mov    $1, %edi
>>> +        rdsspq %rdi
>>> +        cmp    $1, %edi
>>> +        je     .L_exn_shstk_done
>>> +        wrssq  %rax, (%rdi)             # fixup shadow stack
>>> +.L_exn_shstk_done:
>>> +#endif
>> Again avoid the conditional jump by using alternatives patching?
> 
> Well - that depends on whether we're likely to gain any new content in
> the pre exception table.
> 
> As it stands, it is only the IRET(s) to userspace so would be safe to
> turn this into an unconditional alternative.  Even in the crash case, we
> won't be returning to guest context after having started the crash
> teardown path.

Ah, right - perhaps indeed better keep it as is then.

Jan

