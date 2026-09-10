Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47ECBC79FB9
	for <xen-devel@archiver.kernel.org>; Thu, 10 Sep 2026 06:44:13 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1413980.1643846 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4YVm-00070b-Vn; Thu, 10 Sep 2026 06:43:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1413980.1643846; Thu, 10 Sep 2026 06:43:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4YVm-00070U-S1; Thu, 10 Sep 2026 06:43:54 +0000
Received: by outflank-mailman (input) for mailman id 1413980;
 Thu, 10 Sep 2026 06:43:53 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x4YVl-00070L-B2
 for xen-devel@lists.xenproject.org; Thu, 10 Sep 2026 06:43:53 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x4YVk-007B1V-Bf
 for xen-devel@lists.xenproject.org; Thu, 10 Sep 2026 08:43:52 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aa25195-8faa-0a2a0a5109dd-0a2a450aa434-38
 for <xen-devel@lists.xenproject.org>; Thu, 10 Sep 2026 08:43:52 +0200
Received: from [209.85.128.50] (helo=mail-wm1-f50.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aa251a8-f2d2-0a2a450a0019-d1558032cccb-3
 for <xen-devel@lists.xenproject.org>; Thu, 10 Sep 2026 08:43:52 +0200
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-49d0b98d6d0so46595815e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 09 Sep 2026 23:43:52 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49d26c437besm49078465e9.11.2026.09.09.23.43.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Sep 2026 23:43:51 -0700 (PDT)
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
        d=suse.com; s=google; t=1789022632; x=1789627432; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YqPiClyDQWL2eh7tbuvmcAWQELtxg+LbHOcj6JzGFpY=;
        b=Zj3XteF/7CqYY1lJ7a5pySGc9nI7QOY2LbraoVcqRBlqxX7LLKEjpIw9ZX/tR+obM1
         tpXdjR+C7azapvimCHB8Yz/5H11Ng1zb5vtYIFqk+utl8BRyHLnt1oXhnBkLdIYKF8ls
         VuXMlJInxr6WDYLieveArse8Fa4PsEzs7BFPZXUhZeYhUEe+I7ANCJQ192Nfu1lVz7lp
         g+LdvszOigAcPSdhRyyf03WuHwf9GX0ZrTNmdiT7dOIJbOfp4ci2oqlb/ptQluDUWhlu
         cS9DIUVnomPCFAVIPi5PpKcXnvAqt4bBOgXX0I8fhjhuVL27F6C0D3X5oFgaESPDco/h
         GS7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789022632; x=1789627432;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YqPiClyDQWL2eh7tbuvmcAWQELtxg+LbHOcj6JzGFpY=;
        b=LCPe1rbjjq6bGPdbioLkYaLV/ftcApr68uHKLqe0j+OvvJ2jL0R9aGqByEHU7dtj2j
         sw5U8aWn04C33D3u+S5zunpwoz7yCLaOnlXi5ioH5kAYoKvHIiiz/3G6yfakps0qiMyL
         eLuUnYC8sGZ0iA6r9XyNFDxjunZQLswTu0qax2VsiCUx4Xt9meK5Hr4CO1ybwENNOpTY
         buW7JuXf3avJWqIp5oPKUipLEVo7DTKBg3UPMBvr/JhJtYbHqQwcV6SxiJ9MeUbhM01p
         3jvLHxiIVrV1x/xTEM6dOgre6czimDyeMfEFbupyl5h+vBzV7DDA2ROSv9/RzUuMQv4+
         HxWA==
X-Forwarded-Encrypted: i=1; AKwUvBzkrabhQKiRqkYNiBNOa5WRLzAOZsl1p9+9MmJM+qMyuF8vP12hhUHVoDIDTUgh3q2rIqbi/ew9yN0=@lists.xenproject.org
X-Gm-Message-State: AFuF++k3RCxIKLG0JAotzIJEdpwiGeElTR3qdHX30zbJ8goOOWV9ti2x
	QPB5UsmA5sRA7oj7CemlqWQy4FgYmCcL5pYGw36vWZ4WZT+kj3tVc0hjqL6wQRnVrg==
X-Gm-Gg: AYBFou2pmPeKfB/MTc8/O8rzdqeG7qY7Ak9baeHnWwEoOkS84cP8NnzxAhssb3f+WxE
	uWtqdBZk5PBwPpyHMSCruc5z2SxGAAHJ6HuFtM2+scVieRAlynl0TftnF6QhRtwTGEPLx1z2qcq
	fbv+OO9dGswph1xvXkvrk6EFrlCRU/7PH6Yvpt9pnrLaqpcOA3lw3jpqiKoog/rOHhwcI+JHg/h
	pP6PKEDPSEPf1O6ENf9gIznaWC57mPPK2PSGSrrubjNahga7ng5rdkwS/ouyQ9ZCR3DBlXhALes
	xyJg/Kvg6nqd2pe8AN/PCK3LSdLM4BfSqOqEYtwUYFDzIpIR6uIy1F3tdX0Z9gkCccTeWvdM0lb
	CZLXx5EwnaCZiBT3ffln9crWVazNOtpbe5EzZbrcTSQF/mcXOsNuheEpw+/yL1PGLmd+I4+Vvpm
	9ZnTnCv3iUvsCCLqlTICt6c2T34l0EawhvILshKU3cQbDyi0+DE9TrZRbsVLfeGpF2hxUTWZIxE
	eWYVMSgdKNe0jC/KhX/kYJFytNapHegwL+pkp00f2+4wSIp9IDpDLSjsr3Z9Zc=
X-Received: by 2002:a05:600c:5492:b0:49c:fa21:1c7e with SMTP id 5b1f17b1804b1-49cfa211d31mr361861905e9.19.1789022631724;
        Wed, 09 Sep 2026 23:43:51 -0700 (PDT)
Message-ID: <26a57fab-955a-4de6-b17b-eb57aa1f014b@suse.com>
Date: Thu, 10 Sep 2026 08:43:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/12] x86: add noreturn in a few more places
To: Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: Teddy Astie <teddy.astie@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 xen-devel@lists.xenproject.org
References: <90d0e3d6-2e12-43f1-815d-7936ca4c5fc6@suse.com>
 <d0f991de-db67-4f49-aef0-25c590b3889e@suse.com>
 <66fc1415-df9e-41c2-b3ae-78305814cbfc@citrix.com>
 <d08b2d8a-d363-49d5-965f-f954c79fe04c@suse.com>
 <320b920b3e673671eddceccb4b86f211@bugseng.com>
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
In-Reply-To: <320b920b3e673671eddceccb4b86f211@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-4011c0/1789022632-5A9D9CFC-7E53D6FC/0/0
X-purgate-type: clean
X-purgate-size: 3383

On 09.09.2026 21:07, Nicola Vetrini wrote:
> On 2026-09-01 08:26, Jan Beulich wrote:
>> On 31.08.2026 21:13, Andrew Cooper wrote:
>>> On 28/08/2026 8:01 am, Jan Beulich wrote:
>>>> --- a/xen/arch/x86/traps.c
>>>> +++ b/xen/arch/x86/traps.c
>>>> @@ -2304,7 +2304,7 @@ void asmlinkage entry_from_pv(struct cpu
>>>>      case X86_ET_HW_EXC:
>>>>          switch ( vec )
>>>>          {
>>>> -        case X86_EXC_DF: return do_double_fault(regs);
>>>> +        case X86_EXC_DF: do_double_fault(regs); /* noreturn */
>>>>          case X86_EXC_MC: return do_machine_check(regs);
>>>>          }
>>>>          break;
>>>> @@ -2615,7 +2615,7 @@ void asmlinkage entry_from_xen(struct cp
>>>>      case X86_ET_HW_EXC:
>>>>          switch ( regs->fred_ss.vector )
>>>>          {
>>>> -        case X86_EXC_DF: return do_double_fault(regs);
>>>> +        case X86_EXC_DF: do_double_fault(regs); /* noreturn */
>>>>          case X86_EXC_MC: return do_machine_check(regs);
>>>>          }
>>>>          break;
>>>>
>>>
>>> For starters you're missing a break, and the only reason this isn't a
>>> compile error is the trailing comment.
>>
>> "break" there would again be unreachable, though.
>>
>>>   Second, it's a tailcall anyway. 
>>> There really is nothing unreachable anywhere in this construct.
>>
>> Just that the concept of "tailcall" is an optimization, not something
>> inherent to the language.
>>
>>> But by far the most important, it the singular noreturn attribute on
>>> do_double_fault() (elsewhere, and not visible when reading these two
>>> functions) which is preventing #DF falling into #MC.   This introduces
>>> fragility which did not exist previously.
>>
>> I realized that when making the patch, yet what do you do when the rule
>> is as it is? Hence why I added the comment, really.
>>
>>> do_double_fault() would conditionally return if we ever got around to
>>> fixing espfix64.
>>
>> And hence would have to lose its "noreturn". At which point call sites
>> would need inspecting. (As said - yes, I do realize the fragility.)
>>
>>> So no - I'm going to insist that Eclair is taught to accept "return
>>> some_noreturn_fn();" as intentional.  It is objectively less fragile
>>> than the MISRA-preferred option.
>>
>> Nicola, thoughts?
> 
> If you find a suitable argument from the toolchain that the generated 
> code is correct even though you return from a function where you 
> promised not to return in its declaration, I suppose that's fine, but 
> that MISRA Rule I mentioned ("A function declared with a _Noreturn 
> function specifier shall not return to its caller"), which is not (yet) 
> applied to Xen exists to defend from stumbling on UB 71 of C11: A 
> function declared with a _Noreturn function specifier shall not return 
> to its caller.
> 
> So in general ECLAIR should not accept this by default. What you can do 
> is deviate these (hopefully few) cases if you have backing evidence of 
> the correct behavior.

The disagreement between you suggesting a deviation and Andrew demanding
"that Eclair is taught to accept ..." will need resolving. The argument
towards the code being overall less fragile in its original shape cannot
easily be put away. And Misra demanding code to be made more fragile
than it needs to be cannot really be the goal either.

Jan

