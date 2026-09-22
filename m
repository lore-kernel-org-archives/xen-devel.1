Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6122C982FE
	for <xen-devel@archiver.kernel.org>; Tue, 22 Sep 2026 15:14:37 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1429124.1652061 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x92CR-0005d8-1O; Tue, 22 Sep 2026 15:14:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1429124.1652061; Tue, 22 Sep 2026 15:14:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x92CQ-0005d1-Uk; Tue, 22 Sep 2026 15:14:26 +0000
Received: by outflank-mailman (input) for mailman id 1429124;
 Tue, 22 Sep 2026 15:14:26 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1x92CP-0005cs-Vs
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2026 15:14:26 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x92CP-008NK7-Ck
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2026 17:14:25 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6ab29b35-2eae-0a2a0a5409dd-0a2a450ac320-48
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 17:14:25 +0200
Received: from [74.125.225.92] (helo=mail-wr2-f28.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6ab29b51-f2d2-0a2a450a0019-4a7de15c8075-3
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 17:14:25 +0200
Received: by mail-wr2-f28.google.com with SMTP id
 ffacd0b85a97d-485b1d2874aso31448f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 08:14:25 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-71-234.play-internet.pl.
 [109.243.71.234]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48862774882sm5936376f8f.13.2026.09.22.08.14.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Sep 2026 08:14:24 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1790090065; x=1790694865; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wctz8bQ99T0MRcz2ZfNR4ChcDuX77qBnwjNz/nlSGVc=;
        b=WOH/j38DOEB3EPalEZGWYH0q/0gBVTI4giSr8d8PBWueUIOPPv9wx1ZGwTDe/PBH49
         b27ui5OdugpeDizv9SPB58saBb9LKB4prjyi6/1n198kkPqE8VjVQLFBPb5DyshAMsH2
         6ywR4bioSMfqyQOQ3B6GGVskapVD/gLST/nXpqqNR4zvE2qCnYV4pJsU/0pFAMCDNRnf
         aF5qCaA3GwlSuOI+AX+47YhTWYCLso4rV8cLhTeZwH6a6J+vHHx1jKGWGUflVoi3yrp+
         FsPC9MfIunEvnHZyoh2DBQSz5gkqkp2Dnanr09ikCDtgdfAmPO9Z+LiLb2mYmsrjegHr
         RxIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790090065; x=1790694865;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wctz8bQ99T0MRcz2ZfNR4ChcDuX77qBnwjNz/nlSGVc=;
        b=tF9f9LYjkpcq5VCo1zS9EmfV9Z8ZuxUy6buyJYvZrCENEPvs2cUVYcicl3iR+ZbHg6
         EV9fOyHtQkTG18fzPPIEJfte9FPZedntUXoeHYEk1wx1f0HEpqBsLlEK42KWRfs2LndW
         OfGClqr5JQz0fVBxfq4aUQsQ3/YT9UjjZKlLoGIjwH+iGrnH7zWAZE6qwn4av+Cy8uDB
         tTfAqtAOelne1Bt6nXKj6er+SdYsUysVPoGRkDjaFLj9x6JOSe51DUU+itqu2+ZClUcd
         J6IW0/8t07I35toJPZBKEG/Bj0JKwc9MZouRSGBQbDMEtWmoyfPw2Qnu6EaNCYaSxHm5
         +Gxw==
X-Gm-Message-State: AFuF++k71J7K+CcLmq12U0eNoaXKylvFFbLTP0wbkiQFOF2AaHUM/HKu
	JYVJbnV1u/9+0M5jV+xqec4Rm8u4ZyY+xCu9mhqK8ahCIKMKFwF3zq3J
X-Gm-Gg: AYBFou32pmruW6ttTK6QUOl5t/h6utfhyt7Q9Bt5x/o/1NIA9ZKzPMNCiXQmMHdoIvg
	CF9GsTj6vuKIM3V9RaJc3JP1zALAEpEPNR15ZBF8NRJPVVBkGo1oVnop1qBylTPkFf69auFRdhQ
	/Yanittx94U55lDp7enXzoJuZQWhwOOSHkNDm9UZENutFmTQS3LUyH9eBzd+apo2LjVXTr7C5m/
	FHixM+fopPqZyUmtIEtmXn48d++fl2CeRncdC4hbU8jkbJtpgOC0CDxTXGVv0QBE27haZRA56CJ
	7OI8EWu8X7SzKZd3eKGQiDplr64XymdFizZdmXfyj9sIinuxcmO2x6RQtvdD/9KH4+htkgdsRe4
	K4zXCfPw2xjKDCjudEfq2O9uc+y+f29UMwmBNhVMNJ8mT/wq3Oy5P1nFUQiFRYEHCxbUYp6IG9/
	Xt/YpnGElhasdLKxm8+nGpSarnXlPzevEf3CUVQe7cSokXPk+4ftONrPhWiVxubon+WMork1Gjz
	14xW9pDGQU4SmVVCO1QkOjZmF76MLd/dZ7Jd4B09kOVStswew==
X-Received: by 2002:a05:6000:4819:b0:487:27f9:833 with SMTP id ffacd0b85a97d-48727f90ad7mr15798665f8f.40.1790090064670;
        Tue, 22 Sep 2026 08:14:24 -0700 (PDT)
Message-ID: <48253b42-1b0c-4463-ad0b-01ebed1d8282@gmail.com>
Date: Tue, 22 Sep 2026 17:14:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/6] xen/riscv: fix Svade/Svadu A/D bit handling
To: Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <1789032657.8631fc262581453bbf619ec5b2062170.1a08aa7f23b000c4f3@vates.tech>
 <1789032897.8631fc262581453bbf619ec5b2062170.1a08aab9d76000c4f3@vates.tech>
 <450d0c5e-2101-4b1c-98fd-2f438bd0ccf3@suse.com>
 <1790010225.8631fc262581453bbf619ec5b2062170.1a0c4ec74f000072c4@vates.tech>
 <e8b1257b-3b28-43d3-b692-5e79f5cae68a@suse.com>
 <1790068677.8631fc262581453bbf619ec5b2062170.1a0c868594900072c4@vates.tech>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <1790068677.8631fc262581453bbf619ec5b2062170.1a0c868594900072c4@vates.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-4011c0/1790090065-583CCCFC-CFA75FBF/10/73395122804
X-purgate-type: spam
X-purgate-size: 7202



On 9/22/26 11:17 AM, Baptiste Le Duc wrote:
> On 2026-09-22 08:24 +0200, Jan Beulich wrote:
>> On 21.09.2026 19:03, Baptiste Le Duc wrote:
>>> On 2026-09-21 17:26:47+02:00, Jan Beulich wrote:
>>>> On 10.09.2026 11:34, Baptiste Le Duc wrote:
>>>>> @@ -468,6 +469,62 @@ static bool __init has_isa_extensions_property(void)
>>>>>       return false;
>>>>>   }
>>>>>   
>>>>> +/*
>>>>> + * Svade and Svadu extensions represent two schemes for managing the PTE A/D
>>>>> + * bits. When the PTE A/D bits need to be set, the Svade extension indicates
>>>>> + * that a page fault will be raised. In contrast, the Svadu extension supports
>>>>> + * hardware updating of the PTE A/D bits.
>>>>> + *
>>>>> + * There are 4 possible combinations of these extensions in the device tree.
>>>>> + * The default hardware behavior for each is:
>>>>> + *
>>>>> + * 1) Neither Svade nor Svadu present in DT => It is technically unknown
>>>>> + *    whether the platform uses Svade or Svadu. Xen should be prepared to
>>>>> + *    handle either hardware updating of the PTE A/D bits or page faults when
>>>>> + *    they need updating. In that case, Xen assumes Svade because it's
>>>>> + *    harmless if the platform is actually Svadu, while assuming Svadu on real
>>>>> + *    Svade hardware risks an unhandled page fault.
>>>>> + *
>>>>> + * 2) Only Svade present in DT => Xen must assume Svade to be always enabled.
>>>>> + *
>>>>> + * 3) Only Svadu present in DT => Xen must assume Svadu to be always enabled.
>>>>> + *
>>>>> + * 4) Both Svade and Svadu present in DT => Xen must assume Svadu is turned off
>>>>> + *    at boot time by setting A/D bits. To use Svadu, the supervisor must
>>>>> + *    explicitly enable it using the SBI FWFT extension.
>>>>> + *
>>>>> + * The Svade extension is mandatory and the Svadu extension is optional in the
>>>>> + * RVA23 profile. Platforms wanting to take advantage of Svadu can choose
>>>>> + * option 3. Platforms aware of the profile can choose option 4, and Xen won't
>>>>> + * get the benefit of Svadu until the SBI FWFT extension is available.
>>>>> + *
>>>>> + * In other words, hardware manages the A/D bits on its own only in case 3, in
>>>>> + * all the other cases software has to preset them. Instead of open coding this
>>>>> + * in every A/D bits user, RISCV_ISA_EXT_svade is used to mean "software is
>>>>> + * responsible for the A/D bits" and is set here for the cases 1, 2 and 4.
>>>>> + */
>>>>> +static void __init riscv_resolve_ad_scheme(void)
>>>>> +{
>>>>> +    bool svade = riscv_isa_extension_available(NULL, RISCV_ISA_EXT_svade);
>>>>> +    bool svadu = riscv_isa_extension_available(NULL, RISCV_ISA_EXT_svadu);
>>>>> +
>>>>> +    /* Case 3: leave the A/D bits management to hardware. */
>>>>> +    if ( svadu && !svade )
>>>>> +        return;
>>>>> +
>>>>> +    /* Case 4 */
>>>>> +    if ( svadu && svade ){
>>>>> +        if ( !sbi_probe_extension(SBI_EXT_FWFT) ){
>>>>
>>>> Nit (style): Brace placement.
>>> Sorry for that. I will fix that in v3.
>>>> Furthermore this is written in a way which Misra would call "dead code". I'd
>>>> like to suggest (leaving out comments):
>>>>
>>>>      if ( svadu )
>>>>      {
>>>>          if ( !svade )
>>>>              return;
>>>>
>>>>          if ( !sbi_probe_extension(SBI_EXT_FWFT) )
>>>>              printk(...);
>>>>      }
>>> I assume you are referring to Misra C:2012 Rule 13.5 "The right operand
>>> of a logical && or || operand shall not contain persistent side effect"
>>>
>>> If yes, IMO, I think it doesn't apply here as `svade` is evaluated
>>> before the `if` so there is no side effect that wouldn't have been
>>> executed in case of svadu=false.
>>
>> No, there's nothing side-effect-ish here. With "svadu && !svade" in the
>> first if(), the rhs of "svadu && svade" in the second one is dead code:
>> Things would function the same with it dropped.
> Ok, now I understand, thanks. I'll fix it in next round.
>>
>>>>> +          printk(XENLOG_WARNING "RISC-V: Both Svade and Svadu detected, but SBI FWFT is missing.\n"
>>>>> +                  "RISC-V: Defaulting to software A/D updates (Svade).\n"
>>>>> +                  "RISC-V: To force hardware A/D updates (Svadu), remove 'svade' from DT.\n");
>>>>
>>>> Nit (style): Indentation (in multiple ways). Furthermore XENLOG_* needs
>>>> repeating after every newline.
>>>>
>>>>> +        }
>>>>> +    }
>>>>> +
>>>>> +    /* Cases 1, 2: Xen assume Svade to be enabled */
>>>>> +    __set_bit(RISCV_ISA_EXT_svade, riscv_isa);
>>>>
>>>> Isn't this a lie (to ourselves) then?
>>> If you are talking about case 1:
>>>      [1] Yes, it's technically a lie for boards shipped before
>>>      the svade/svadu extension was ratified (e.g., HiFive Premier P550).
>>>      These extensions merely formalized a mechanism that already existed in
>>>      hardware.
>>
>> Wait, how do you know this for _all_ boards anyone may ever have made?
> We don't know but based on [1] and my commit message, if neither
> Svade nor Svadu are present in DT then it is technically unknown whether
> the platform uses Svade or Svade. Hypervisor may then assume Svade to be
> present and enabled or it can discover based on mvendorid, marchid, and
> mimpid. For this patch, I choose to have the Hypervisor assumed Svade.

Can hypervisor really access this regs?

~ Oleksii

> 
> Saying that, I agree that it doesn't make sense to manually have set
> Svade extension in the isa bitfield as we could just preset A/D bits
> regardless of Svade/Svadu during the p2m_set_permission(). It's what
> kvm explains in kvm_riscv_gstage_map_page():
> 
>    /*
>     * A RISC-V implementation can choose to either:
>     * 1) Update 'A' and 'D' PTE bits in hardware
>     * 2) Generate page fault when 'A' and/or 'D' bits are not set
>     *    PTE so that software can update these bits.
>     *
>     * We support both options mentioned above. To achieve this, we
>     * always set 'A' and 'D' PTE bits at time of creating G-stage
>     * mapping. To support KVM dirty page logging with both options
>     * mentioned above, we will write-protect G-stage PTEs to track
>     * dirty pages.
>     */
> 
> 
> [1] https://lore.kernel.org/lkml/20240628093711.11716-1-yongxuan.wang@sifive.com/#t
>> And for all qemu (and alike) versions which supported RISC-V?
> 
> Concerning qemu, you're right, in case when (!svade && !svadu) they use
> by default Svadu (hw updating) for backward compatibility.
> 
>>
>>>      [2] For boards that do support svade, we could enforce DT
>>>      declaration by adding it to `required_extension` as they are
>>>      explicitly supporting it. However, doing so would cause boards
>>>      without svade/svadu support (as described above) to hit a panic
>>>      during boot.
>>>
>>>      So in both case ([1], [2]), the svade extension exist either implicitely or
>>>      explicitly. Therefore, force it doesn't compromize anything.
>>
>> If, despite my comment above, this is indeed what is wanted, I think it
>> requires a little more commentary.
>>
>> Jan
>>
>>
>>
> 
> 


