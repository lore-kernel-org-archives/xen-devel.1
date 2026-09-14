Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96A37C88E64
	for <xen-devel@archiver.kernel.org>; Mon, 14 Sep 2026 07:12:17 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1420513.1646814 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x60r4-00021D-Al; Mon, 14 Sep 2026 07:11:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1420513.1646814; Mon, 14 Sep 2026 07:11:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x60r4-000216-7b; Mon, 14 Sep 2026 07:11:54 +0000
Received: by outflank-mailman (input) for mailman id 1420513;
 Mon, 14 Sep 2026 07:11:52 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x60r2-000210-C7
 for xen-devel@lists.xenproject.org; Mon, 14 Sep 2026 07:11:52 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x60r1-00FfCf-I5
 for xen-devel@lists.xenproject.org; Mon, 14 Sep 2026 09:11:51 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aa79e2e-bab6-0a2a0a5309dd-0a2a4503d16e-18
 for <xen-devel@lists.xenproject.org>; Mon, 14 Sep 2026 09:11:51 +0200
Received: from [209.85.221.50] (helo=mail-wr1-f50.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aa79e37-fae8-0a2a45030019-d155dd32e9d1-3
 for <xen-devel@lists.xenproject.org>; Mon, 14 Sep 2026 09:11:51 +0200
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-485850cbac3so1488764f8f.3
 for <xen-devel@lists.xenproject.org>; Mon, 14 Sep 2026 00:11:51 -0700 (PDT)
Received: from ?IPV6:2003:ca:b735:686c:f5c4:7858:246b:ca62?
 (p200300cab735686cf5c47858246bca62.dip0.t-ipconnect.de.
 [2003:ca:b735:686c:f5c4:7858:246b:ca62])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-486eb32e8d1sm24992844f8f.11.2026.09.14.00.11.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Sep 2026 00:11:50 -0700 (PDT)
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
        d=suse.com; s=google; t=1789369911; x=1789974711; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y/Cs8HpoX9Yo1ntlNmfm9TtzMXK7PRApDowzUjGq8FA=;
        b=CybCFDrA4rYNpGf9KOeDOtrzBBfqwCQ9410jzfYw6/FKVR9kSgK48EzDO8hPRA3zYq
         Tytl0FnEOZitXZSZaUdc9Bsxk4Qp5FDn/piBXqnnxa4TqZ0VUdnHqQ8Yusts8hOhEo+n
         WrgtxfTenZhPfOHhYU9YOvgo/ZfLIfpuU07R+2KBF07P4H/pIKvQOffMv0NQ47DwBSrv
         nw1VNR14AQ9uE2Qr9z0raYhf+RqhxCUQRbhyiMhaH2IlqFZY717Zre1ZAwgYFBkkBtVV
         HWqtvGWfBa6lpWTbsk4AFnhfNh3xYjbUep0FkypiSTx52i5BRG8OZECh1Qnqc9WdrD5C
         gecQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789369911; x=1789974711;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y/Cs8HpoX9Yo1ntlNmfm9TtzMXK7PRApDowzUjGq8FA=;
        b=JUC62pWi1O1S5n35/0IcbQSlVcGjBUlLHWd4JUGiZqUnC4ck6za2thAB4s6jCRGUZE
         k8D3uMhTsS+1s4cx90HdXL9KeasFD+0xTiUXPXM6/j0v/g5YyLAAEznIymjrpapiI2he
         +PIPA6cYpHbzeXb4qtvRjsJ1vAd5YdmHieMglm8PlSRzVtkQbB7MtJ7rXL8UY2IxYe+y
         nTVV5H1Qj2iURy30D72EcvH/ZAR0mBNb5GUEGcJBT3Kn15Q/Wu4QqigUmMKSosid7l1j
         SqBiUV5ZEF+uIDNNHTfbu9MvlNF5MIQ5jrBEzYvu/EXlItgFIuHkIINCrT+EkEybE30K
         a6yQ==
X-Forwarded-Encrypted: i=1; AKwUvBzU9T5JdKi5Ve6P3yjYiwZdVDzWyHwUXmMxbSxeKwYTgJHGXy6keKqLNSQvYY7Vmyvx5iTnpCyUSrU=@lists.xenproject.org
X-Gm-Message-State: AFuF++mpC9LK3IwsTuN4Mmxo+0SXH4d46ar0cXMIm3YtD2Fjr68VOf38
	kvmpWNRsqG3AVr/a/jHqN0ioKYQOKh/JamagUWu7nBOLYfnZGdkpgM4JhiyRFCFB6Q==
X-Gm-Gg: AYBFou1pFspIq+apwA9vSqpxWnopEINZrQl8UDqIfo5cpgHdniwPGIijsbBbTm0W+wp
	jIPXRuGoWsq6mtlTrMNtmxxf9Z9MGYcXnQYBka3nB22gUsrvjn2dEpclge2niWF6BgEWiAqOwKy
	l6ylk70zNdlyDFAREx0xoJESgyeDWZPqefwqyWqNN+4YvT7mLUaT9i6cJAHgQtqq+mlg/CxFHxW
	A2b82xmThUTtWN49+/3ovuXpZWVKxCGQa5APIKIlghGD6GEiVtijHIdY9RzCEgdqzHr5MYtFOoi
	yHnng1Lwans5uBWxO3UlK+R6LugY90NNDT27bdzXmAwJz2PIcnSF4M7iNKs9TdIbcq2Z67mvpSp
	5SdT53r7Q9c8cduW9YYcfgy0CO6pcHR/ukUwjiTs9wKVT8eUgT7DIktMh/eBFXsNNDhMpOhGSvv
	Vyg6TdyOb/PYNQr44mfTF7gZb1BycX7xhzj0uzRU40KbgW+2AAC5jo39VFtroa4y8eLlazwKfuh
	a1K+8GAvmeZBfHsDa4D+k584N80c6jokormEAzgpKoptbjSuBw91dIhxOcryl1wdfzsE0EdIl1y
	gyWkjYIPe4StlyUtuqc8dZjLiRbLbmc=
X-Received: by 2002:a05:6000:26c7:b0:485:8c16:a35f with SMTP id ffacd0b85a97d-48702b3ae68mr1157486f8f.55.1789369910674;
        Mon, 14 Sep 2026 00:11:50 -0700 (PDT)
Message-ID: <02d7010e-9864-40f5-ab3a-f0c161433d90@suse.com>
Date: Mon, 14 Sep 2026 09:11:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/12] x86: add noreturn in a few more places
To: Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Teddy Astie <teddy.astie@vates.tech>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, xen-devel@lists.xenproject.org
References: <90d0e3d6-2e12-43f1-815d-7936ca4c5fc6@suse.com>
 <d0f991de-db67-4f49-aef0-25c590b3889e@suse.com>
 <66fc1415-df9e-41c2-b3ae-78305814cbfc@citrix.com>
 <d08b2d8a-d363-49d5-965f-f954c79fe04c@suse.com>
 <320b920b3e673671eddceccb4b86f211@bugseng.com>
 <26a57fab-955a-4de6-b17b-eb57aa1f014b@suse.com>
 <98af89029999f2d0535d603ebf64d9b4@bugseng.com>
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
In-Reply-To: <98af89029999f2d0535d603ebf64d9b4@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-33051d/1789369911-6E2D04E9-E0B46DE5/0/0
X-purgate-type: clean
X-purgate-size: 5067

On 11.09.2026 22:48, Nicola Vetrini wrote:
> On 2026-09-10 08:43, Jan Beulich wrote:
>> On 09.09.2026 21:07, Nicola Vetrini wrote:
>>> On 2026-09-01 08:26, Jan Beulich wrote:
>>>> On 31.08.2026 21:13, Andrew Cooper wrote:
>>>>> On 28/08/2026 8:01 am, Jan Beulich wrote:
>>>>>> --- a/xen/arch/x86/traps.c
>>>>>> +++ b/xen/arch/x86/traps.c
>>>>>> @@ -2304,7 +2304,7 @@ void asmlinkage entry_from_pv(struct cpu
>>>>>>      case X86_ET_HW_EXC:
>>>>>>          switch ( vec )
>>>>>>          {
>>>>>> -        case X86_EXC_DF: return do_double_fault(regs);
>>>>>> +        case X86_EXC_DF: do_double_fault(regs); /* noreturn */
>>>>>>          case X86_EXC_MC: return do_machine_check(regs);
>>>>>>          }
>>>>>>          break;
>>>>>> @@ -2615,7 +2615,7 @@ void asmlinkage entry_from_xen(struct cp
>>>>>>      case X86_ET_HW_EXC:
>>>>>>          switch ( regs->fred_ss.vector )
>>>>>>          {
>>>>>> -        case X86_EXC_DF: return do_double_fault(regs);
>>>>>> +        case X86_EXC_DF: do_double_fault(regs); /* noreturn */
>>>>>>          case X86_EXC_MC: return do_machine_check(regs);
>>>>>>          }
>>>>>>          break;
>>>>>>
>>>>>
>>>>> For starters you're missing a break, and the only reason this isn't a
>>>>> compile error is the trailing comment.
>>>>
>>>> "break" there would again be unreachable, though.
>>>>
>>>>>   Second, it's a tailcall anyway. 
>>>>> There really is nothing unreachable anywhere in this construct.
>>>>
>>>> Just that the concept of "tailcall" is an optimization, not something
>>>> inherent to the language.
>>>>
>>>>> But by far the most important, it the singular noreturn attribute on
>>>>> do_double_fault() (elsewhere, and not visible when reading these two
>>>>> functions) which is preventing #DF falling into #MC.   This introduces
>>>>> fragility which did not exist previously.
>>>>
>>>> I realized that when making the patch, yet what do you do when the rule
>>>> is as it is? Hence why I added the comment, really.
>>>>
>>>>> do_double_fault() would conditionally return if we ever got around to
>>>>> fixing espfix64.
>>>>
>>>> And hence would have to lose its "noreturn". At which point call sites
>>>> would need inspecting. (As said - yes, I do realize the fragility.)
>>>>
>>>>> So no - I'm going to insist that Eclair is taught to accept "return
>>>>> some_noreturn_fn();" as intentional.  It is objectively less fragile
>>>>> than the MISRA-preferred option.
>>>>
>>>> Nicola, thoughts?
>>>
>>> If you find a suitable argument from the toolchain that the generated
>>> code is correct even though you return from a function where you
>>> promised not to return in its declaration, I suppose that's fine, but
>>> that MISRA Rule I mentioned ("A function declared with a _Noreturn
>>> function specifier shall not return to its caller"), which is not (yet)
>>> applied to Xen exists to defend from stumbling on UB 71 of C11: A
>>> function declared with a _Noreturn function specifier shall not return
>>> to its caller.
>>>
>>> So in general ECLAIR should not accept this by default. What you can do
>>> is deviate these (hopefully few) cases if you have backing evidence of
>>> the correct behavior.
>>
>> The disagreement between you suggesting a deviation and Andrew demanding
>> "that Eclair is taught to accept ..." will need resolving. The argument
>> towards the code being overall less fragile in its original shape cannot
>> easily be put away. And Misra demanding code to be made more fragile
>> than it needs to be cannot really be the goal either.
>>
> 
> Well, I feel like I have explained my reasoning, but let me step back a bit and lay out the possible safe alternatives I see for this construct. By the way, perhaps it's a better idea to split off this change from the other additions of noreturn, which can probably go in as is.
> 
> Adding noreturn to do_double_fault() while keeping "return do_double_fault()" in the #DF path is likely subtly broken (i.e. the compiler can rightfully optimize assuming the function does not return) so that's not a feasible solution.

Hmm, why would this be subtly broken? do_double_fault() doesn't (and won't
ever) return. So the compiler optimizing based on that is quite okay.

> If noreturn is added to do_double_fault(), removing the return in entry_from_pv(), shouldn't that be guarded against falling trough via BUG() or equivalent constructs that do not vanish in release builds? My understanding, that may be incorrect, is that returning from do_double_fault() is currently not expected to happen (hence the panic() in it).

This would feel odd to me - do_double_fault() is really already BUG()-like,
so following a call to it by such a construct would end up questionable.

All of the above (and maybe more) is what I understand makes Andrew say
"Eclair needs to be taught ...". Andrew, maybe you could expand a bit?

Jan

