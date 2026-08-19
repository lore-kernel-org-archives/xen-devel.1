Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFB04C5DF6D
	for <xen-devel@archiver.kernel.org>; Wed, 19 Aug 2026 09:00:12 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1394931.1633540 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwc9N-0001l6-VU; Wed, 19 Aug 2026 08:59:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1394931.1633540; Wed, 19 Aug 2026 08:59:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwc9N-0001kz-SW; Wed, 19 Aug 2026 08:59:57 +0000
Received: by outflank-mailman (input) for mailman id 1394931;
 Wed, 19 Aug 2026 08:59:56 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wwc9M-0001ka-AZ
 for xen-devel@lists.xenproject.org; Wed, 19 Aug 2026 08:59:56 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wwc9L-005HdV-NZ
 for xen-devel@lists.xenproject.org; Wed, 19 Aug 2026 10:59:55 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a85706e-2eae-0a2a0a5409dd-0a2a4509d87c-36
 for <xen-devel@lists.xenproject.org>; Wed, 19 Aug 2026 10:59:55 +0200
Received: from [209.85.128.43] (helo=mail-wm1-f43.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a85708b-be1a-0a2a45090019-d155802be0e1-3
 for <xen-devel@lists.xenproject.org>; Wed, 19 Aug 2026 10:59:55 +0200
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-4956242332dso7182595e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 19 Aug 2026 01:59:55 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-499a9aa7e8dsm28321935e9.0.2026.08.19.01.59.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Aug 2026 01:59:54 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:Content-Language:References:Cc:To:From:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787129995; x=1787734795; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5mnOP/uz5PJBUYJ7+Pmzbd2rmvd9WdUt1+NtWRw3KbI=;
        b=n37Wyd01qQoufqs3yEiwLdy+yA66rnXYf+1qH1C7p15QtGswU2wzjPrPVjVlicS2yi
         aZuU0GPxW36cW/E4DtGYVS1N73O9dR0tIU9EI3WE0TFMLZYyaHVQGpdRsbrMxR5x487F
         KVyOHhS65k+Gk9zSJEfc8wT7QHE4+LKKjD5H5E2giRN3/wNT7QyAXf0gXQTBlzsqRH6q
         fwV3tq5+aER7Zu8216Sxkb/18cBrpnHCkU94Wb60CoXNXTnwsEawQTMFoLKQfeTmUVjK
         X7LD4Ap08yFAu2vAtnZJsWmq78w39iQ0EBeoocFwo9kQGu1rncytRns8IE9nkYlKukNQ
         VQuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787129995; x=1787734795;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5mnOP/uz5PJBUYJ7+Pmzbd2rmvd9WdUt1+NtWRw3KbI=;
        b=JCjHD8wHUWB8FqCZOUH5Ox+at3UYPQ2R72wv6/bVery7KYxs+rsZ6H/QLrZbWjQhMO
         bep+QzLzVbD2eXxOAjzHuOQryLduUnUetVxcLYNhrrsOG6pPcVcJM93hU1+GbBFRSpvX
         MBb2YGo5FeOhY/poQ9y0/icVC0Nu2TvPnkGp2VpP+B3Bhyb3YHG+7B6EPFZl+1tfJB4n
         t2LRfL/95zS78eDYjeIfUrhlfc60XXTZUvayicAKGSNmg7XfPQHkdORC5PQy/K27pQfD
         +GFBNiqlfDee+G2khCk09NJOdv+3tFxr2o+rbkcO3WhSG2JvB+x+AJHoHTAC3GZc3tNB
         bfNw==
X-Forwarded-Encrypted: i=1; AHgh+Rq0WeyEO7epkxcuSH+vmTdlDN5fwlpknZnyiJa5Guc9hhW8tDGlI4uxbNXUOwA7akNmhpElCY/1F9g=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyJztAZORgUDHzgefr7YfqpJM2bSkhA/SockWSvyMdqzp0tR/2/
	1KslcpP7xVbSPEa2+zms8PwDQG8iY7X/JxtvhCGKy43HH8nsYo/Bv2gI
X-Gm-Gg: AR+sD121WOJCem1nh2zhFDFB8HKAC3CuhZhFtaoDnUtiCT94iNfOtg229A8hjFROhF8
	2HGSkxat+gSKCNfobpXgRrcgSqRnFDPuX/ndtfg1lGxOufT0M3veTu8EO8vZ/B/3fg8sff8vVE5
	xssTiO05KqMxsXlUQqrgpyqKKv1UpXKurpq83KgdzruXzoCo9Ghpat3ENEQJMBdKFnP2TqOGgzD
	Q3OKRLXwajVI+8d69ivXezLbA0Mi5LtBKXfK5JPFnGUr1fIh0SWqetdvsPvTYaQ1rtxeUihHMpb
	RBsviryimjuQR4CM+WlVXCC1wZzhRP1tyUIBDQmTzoZPHZDNfgsp4RNtajFV67LMz6VGHHn/CYU
	KZJYbY1VMdG8buJVY3Wbw0Yy98ZCuXa/DUMuyWiVLP8yQLtCJCfpeHvDu8GmplTPwRxeiZCdHr6
	6HLCKmBBJGiO0llTft1+0E1Qkbr8ZCLVh92k+TeXZDSb6AI0/bEVyIq9x0lpCO9gHYYIuKHBEp4
	gH3nxIVv1pmbuI8+GR94vsVBOaTmwXWv2NamZZdcto=
X-Received: by 2002:a05:600c:4e94:b0:499:78b3:7b36 with SMTP id 5b1f17b1804b1-499aa1b549cmr51115725e9.11.1787129994885;
        Wed, 19 Aug 2026 01:59:54 -0700 (PDT)
Message-ID: <38fd0ba7-562f-49e2-8453-be14f79f1c3c@gmail.com>
Date: Wed, 19 Aug 2026 10:59:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 14/17] xen/riscv: add guest page fault handling stub
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
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
 <7ef8919f12c269d180a2b56a83218cc54e0e357c.1784560663.git.oleksii.kurochko@gmail.com>
 <ab3eb1be-ec62-42ae-8966-e2801752ce4f@suse.com>
 <61b9f565-7193-4192-9f57-1b4bd258fc11@gmail.com>
 <f6e12465-dcd0-4f04-bdd4-8e1943e1ade7@suse.com>
 <fa2924e9-139c-4cdc-9dd4-4b3a26a21fa2@gmail.com>
Content-Language: en-US
In-Reply-To: <fa2924e9-139c-4cdc-9dd4-4b3a26a21fa2@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-bad1c0/1787129995-BFED6034-51068E59/10/73395122804
X-purgate-type: spam
X-purgate-size: 6397



On 8/18/26 6:04 PM, Oleksii Kurochko wrote:
> 
> 
> On 8/18/26 10:29 AM, Jan Beulich wrote:
>> On 17.08.2026 18:10, Oleksii Kurochko wrote:
>>> On 8/12/26 5:48 PM, Jan Beulich wrote:
>>>> On 20.07.2026 18:02, Oleksii Kurochko wrote:
>>>>> --- a/xen/arch/riscv/traps.c
>>>>> +++ b/xen/arch/riscv/traps.c
>>>>> @@ -191,6 +191,67 @@ static void timer_interrupt(void)
>>>>>        raise_softirq(TIMER_SOFTIRQ);
>>>>>    }
>>>>> +static always_inline unsigned long get_faulting_gpa(void)
>>>>
>>>> May I suggest to use always_inline only when inlining is _functionally_
>>>> required?
>>>
>>> Sure. But it ins't clear to me why it isn't a case here? Is it connected
>>> to that function is static and too simple so a compiler will do by 
>>> itself?
>>
>> Counter question: What is it that would functionally break if the 
>> function
>> ended up not being inlined? (This is the question you generally need to
>> answer to justify use of always_inline. Of course there's the additional
>> case of performance being affected, but I don't view that as applicable
>> here; I'm open to be proven wrong, though.)
> 
> Now it is clear how to identrify if function should be always_inline.
> 
> I put it only for the purpose to be sure that this function won't be 
> called with prologue/epilogue but I agree that compiler will do that by 
> itself.
> 
>>
>>>>> +{
>>>>> +    /*
>>>>> +     * According to RISC-V spec:
>>>>> +     *  18.2.8. Hypervisor Trap Value Register (htval)
>>>>> +     *   ...
>>>>> +     *   A guest physical address written to htval is shifted 
>>>>> right by 2 bits
>>>>> +     *   to accommodate addresses wider than the current XLEN.
>>>>> +     *   ...
>>>>> +     *   If the least-significant two bits of a faulting guest 
>>>>> physical address
>>>>> +     *   are needed, these bits are ordinarily the same as the
>>>>> +     *   least-significant two bits of the faulting virtual 
>>>>> address in stval.
>>>>> +     *   For faults due to implicit memory accesses for VS-stage 
>>>>> address
>>>>> +     *   translation, the least-significant two bits are instead 
>>>>> zeros. These
>>>>> +     *   cases can be distinguished using the value provided in 
>>>>> register htinst.
>>>>> +     */
>>>>> +    return (csr_read(CSR_HTVAL) << 2) | (csr_read(CSR_STVAL) & 0x3);
>>>>
>>>> Well, okay, but instead of not losing the bottom two bits you're now 
>>>> losing
>>>> the top two ones.
>>>
>>> Oh, right, I will add a cast ((uint64_t)csr_read(CSR_HTVAL) << 2) | ...
>>>
>>> It will cover all the cases RV32 which has 34-bit guest address and it
>>> will be enough for RV64 where GPA is 59bit (the highest possible for 
>>> Sv59).
>>
>> Only if the function return type then also changes.
>>
>>>> Also the spec reads as if htval only _may_ hold the original address 
>>>> of the
>>>> faulting access. What if htval ends up 0?
>>>
>>> good point. then we have to emulate fault instruction and get an address
>>> from an instruction. I think that for now it will be enough just to
>>> support platforms which always write GPA to HTVAL.
>>>
>>> If I understand correctly if htval is supported by platform then htval
>>> will be always filled for guest page fault. To verify if HTVAL is
>>> supported we could do:
>>>
>>> 'Unless it has reason to assume otherwise (such as a platform standard),
>>> software that writes a value to htval should read back from htval to
>>> confirm the stored value.'
>>
>> How does this matter here? It's one thing for htval to be capable of
>> holding (all?) non-zero values, and another that it would always be
>> written. If the platform doesn't indicate the behavior, I fear you have
>> to assume that you may (perhaps even randomly) observe 0.
> 
> So to be very sure we could check for two extensions: Sstval and Shtval.
> They will guarantee that under any circumstances it will be filled.
> 
> Also, as an option we could check that htinst value isn't zero as 
> according to the spec:
> 
> For guest-page faults, the trap instruction register is written with a 
> special pseudoinstruction value if:
> (a) the fault is caused by an implicit memory access for VS-stage 
> address translation, and (b) a nonzero
> value (the faulting guest physical address) is written to mtval2 or htval.
> 
> So if htinst != 0 then htval is filled with GPA and a nonzero guest 
> physical address written to mtval2/htval shall correspond to the exact 
> virtual address written to mtval/stval.

I've re-read SPEC again and it looks like htinst != 0 doesn't guarantee 
that htval and stval will contain necessary for me here faulty 
instruction. What I wrote above guarantee that if a fault during 
VS-stage translation failed then it htval will contatain GPA of PTE with 
which was an issue.

So I have to blindly believe that HTVAL and STVAL will always contain 
necessary for me data as KVM and other hypervisor does or introduce here 
software guest page table walker if Sstvala and Shtvala aren't provided 
by platform.

~ Oleksii

> 
> But if htinst is 0 then we have to do VS-stage software pagewalk to get 
> GPA and also we will need to decode instruction to get GVA.
> 
> I am thinking if it will be okay for now to cover the case htinst != 0 
> and have BUG_ON(!htinst) to not miss that the possible future case when 
> VS-stage s/w page walks and parsing of GVA from an instruction are 
> needed. I think it is fine as all real boards on which I was able to 
> test Xen has htval and stval properly filled and of course QEMU code 
> guarantees that htval and stval will be properly filled in the case of 
> QEMU.
> Also, KVM is based also only htval and stval and I assume that they 
> tested it on real hardware too so it seems like it is okay to go with 
> solution that for now we are using htval + stval to get faulty address.
> 
>>
>>> And is it true because:
>>> ```
>>> A value of zero in mtval signifies either that the feature is not
>>> supported, or an illegal zero instruction was fetched.
>>> ```
>>> (yes, it is about mtval but I asssume that htval has the same 
>>> behaviour').
>>
>> Right, but what you quote is specific to illegal instruction exceptions.
> 
> Oh, right.
> 
> ~ Oleksii


