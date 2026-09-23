Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF8D4C982FA
	for <xen-devel@archiver.kernel.org>; Wed, 23 Sep 2026 07:32:02 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1429775.1652440 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9HS2-0002RZ-JY; Wed, 23 Sep 2026 07:31:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1429775.1652440; Wed, 23 Sep 2026 07:31:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9HS2-0002RS-GS; Wed, 23 Sep 2026 07:31:34 +0000
Received: by outflank-mailman (input) for mailman id 1429775;
 Wed, 23 Sep 2026 07:31:33 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1x9HS1-0002RM-09
 for xen-devel@lists.xenproject.org; Wed, 23 Sep 2026 07:31:33 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x9HRz-00AESD-Mk
 for xen-devel@lists.xenproject.org; Wed, 23 Sep 2026 09:31:31 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6ab3804d-bab6-0a2a0a5309dd-0a2a450596b2-18
 for <xen-devel@lists.xenproject.org>; Wed, 23 Sep 2026 09:31:31 +0200
Received: from [74.125.225.100] (helo=mail-wr2-f36.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6ab38053-4cb1-0a2a45050019-4a7de1648045-3
 for <xen-devel@lists.xenproject.org>; Wed, 23 Sep 2026 09:31:31 +0200
Received: by mail-wr2-f36.google.com with SMTP id
 ffacd0b85a97d-4843c3ee4cfso374900f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 23 Sep 2026 00:31:31 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-71-234.play-internet.pl.
 [109.243.71.234]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4886848646dsm4321278f8f.10.2026.09.23.00.31.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Sep 2026 00:31:29 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1790148691; x=1790753491; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ez00zs/pIQ/TI/e+vxBc1G78CKXnF3ieCrItTOcLyvY=;
        b=g+goRExjdJUJtXfcfUSZ+6Ka8fTUHnSKhrVbRfg/CGKiy/HQBtz591Qc5gRNNOFLdr
         3RGKXqprKYHWlC2G3DCfh+t909/yAzj+HDcym+d+UUaeDF0gS82qd6LvRiLgMPfrh49M
         iuwkpwDrBYXO88NPtsO0uWjsKZ0lRmcTFDLrcah7O18h4sEQiYNjKuHY3ybhN+tUEyhM
         tjMo4SWFHwCd77a4VWksl8LhkbqWY/P6KqbyJvyFxclH4AcixktYg0DWxF8NR3pkz92+
         mZ/Iul8Bc8nEv5p9TUSItGoMh4Ta0m1VIpEuaaaXIwU0Lx3D0mHYYDgyVEKTada1koJK
         SeIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790148691; x=1790753491;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ez00zs/pIQ/TI/e+vxBc1G78CKXnF3ieCrItTOcLyvY=;
        b=hiG8M+XTGicEiE/WiUKXCncw517kkeQuqHonCmeLLzMXxFdCPRfbfAMhqsWyETYPqq
         sHqY+CUy7xvGz6MJ0Nrm521PKsKnJJjS9tDqYI5BeEzMeNm3jvLTJ5hTwq5/Y+WiEp+W
         +EARMRiK4KMCdKlGb61IRykS5ouAoXX9qn3y7BshjQ36HOJr0/XUPBS2RBThWSt9lLDR
         0uC5+D6rlFiAMdS+Wn+IQMCzJeY9fGK5kS3HZfHdoiVlzzC1N7jU7Ll/6aAjMp4zRAiR
         iVfDwIGGN8u3isWyo8qOoxFVGhK8vdnJTGuDd3tyjbf2ygOcSgV2trVlTHT3c28BNWq5
         YpUQ==
X-Gm-Message-State: AFuF++kqJot82UXJFQ/QyhlKj9Hfz15VExyeaKiPAhlZH7YBV7g9IFkD
	CAruIsZ1BNPf9uLLyOVZitAYKHk5FQXt1U24yD0QCBhcbwa+bbtUfH8/
X-Gm-Gg: AYBFou0L83Y+/UrNO5CtDAkFSRsJ0A39frAjmCuYKUMd2vQerusVMC0gLeKHOlZuvqe
	QOOEIrspj0cNl70p02XcnoHB8YNyjdlAbVpckg9S2RgStJaB4FFUL1PMKRNZ0DE0sn/EbYuZ9UU
	qI7QVEDIaS8RzbjiZn8fjAzg+cC5oNYdtzygLeyRSKdARyPtBxACOM47RPRssGKbCvz/np7swE4
	M+QKMOCeK9MMTPcgpjfc/QbIn4OWi3h7wnKK/DnlGCK1AcUDHCUyO8ssVQCeNnRyhwHAqb8tbY5
	S3SFO4S7YRc/GMAhD4Km/c5+z4ZLCPzlZIP7uXngp9bi8+QAGzPXLAC3jBWcU1N2WRwQTpIoXcK
	Hm8CCGxmsDQirLAdJEzq5JmHplGY6cTkX26Hx97W08wOilJasicbI7iAhIOK8YOfg4+rSOhT4mu
	LrJxRrj80Hsoo68KSEtGXU7F5A0Xc13Hk8yKqLvgos4MWW0QLN7ORn+RbITJnYU9K+qDo6uONOT
	6rVeRlfQyamYO1EoBX8Diy4JAbd/eoikZ9MUQV4lfE+TBnVzy8=
X-Received: by 2002:a05:6000:260a:b0:485:c240:20ec with SMTP id ffacd0b85a97d-488670a3596mr2501691f8f.37.1790148690466;
        Wed, 23 Sep 2026 00:31:30 -0700 (PDT)
Message-ID: <5b531087-2327-4f59-8a7c-c16941a5f324@gmail.com>
Date: Wed, 23 Sep 2026 09:31:28 +0200
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
X-purgate-ID: tlsNG-c201ff/1790148691-F78BE2A1-31DFB191/10/73395122804
X-purgate-type: spam
X-purgate-size: 8338



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
> the platform uses Svade or Svade. 

It is unknown from DT point of view but it isn't true from h/w point of 
view. H/W knows what it supports Svade or Svadu. That is why I am not 
convinced that in p2m_set_permission() we should use DT binding 
explanation. The original comment is better as it describes all the 
possible from h/w point and not DT point of view. Also, generally 
nothing guarantee that DT is correct (someone miss to add Svade or Svadu 
in riscv,isa property) so make an explanation *only* based on it 
probably isn't the best one option and probably it will be better just 
have a comment as it was in original changes.

I think that the easiest option for us is to ...

> Hypervisor may then assume Svade to be
> present and enabled or it can discover based on mvendorid, marchid, and
> mimpid. For this patch, I choose to have the Hypervisor assumed Svade.
> 
> Saying that, I agree that it doesn't make sense to manually have set
> Svade extension in the isa bitfield as we could just preset A/D bits
> regardless of Svade/Svadu during the p2m_set_permission(). It's what

But then it means that in the case of Svadu we will have not precise 
statistics about A/D bits. I think that for p2m_set_permission() we 
still may want to have if () condition around as at the moment of 
p2m_set_permission is being called we could identify which A/D scheme is 
supported by h/w.

Therefore I think we still want to set ISA bitmap based on what I 
described below ...

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

...to require the user to specify either Svade or Svadu in the DTS. If 
neither is mentioned in the DTS, the user should be prompted to choose 
one of the two options, since, from a hardware perspective, the hardware 
must support one of them.

Also, I think we could detect in runtime if Svade is supported but it is 
IMO overcomplication of the things instead of force use to put implicity 
Svade or Svadu in DTS.

~ Oleksii

