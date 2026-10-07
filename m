Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FDD9CA5FF1
	for <xen-devel@archiver.kernel.org>; Wed,  7 Oct 2026 11:33:05 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1442233.1659818 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xEPt3-0006Bv-QN; Wed, 07 Oct 2026 11:32:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1442233.1659818; Wed, 07 Oct 2026 11:32:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xEPt3-0006Bo-NP; Wed, 07 Oct 2026 11:32:41 +0000
Received: by outflank-mailman (input) for mailman id 1442233;
 Wed, 07 Oct 2026 11:32:40 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xEPt2-0006Bi-3o
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2026 11:32:40 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xEPt1-0025OF-C5
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2026 13:32:39 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6ac62dd0-2eae-0a2a0a5409dd-0a2a4503bc42-18
 for <xen-devel@lists.xenproject.org>; Wed, 07 Oct 2026 13:32:39 +0200
Received: from [209.85.128.54] (helo=mail-wm1-f54.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6ac62dd7-fae8-0a2a45030019-d1558036f07b-3
 for <xen-devel@lists.xenproject.org>; Wed, 07 Oct 2026 13:32:39 +0200
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-4a0286c981dso36121115e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 07 Oct 2026 04:32:39 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-71-234.play-internet.pl.
 [109.243.71.234]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48c71b786d8sm5059564f8f.0.2026.10.07.04.32.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Oct 2026 04:32:38 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1791372759; x=1791977559; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PHW3B5o3N3ilCM+9E2QvAbEwtGUHiB9qDO2zWEqNFUA=;
        b=ivxqzcRuauiGIoqvmS4RGsKN5HvnMv66qEgYpALyDqsu0bEwevnFVRSH/XvaEEK4uG
         tRSRGfIYonUMhsymaymxu/ztdpvgGQ0BEunWsD8qlttYfumRUwNXLbXuP/0YBA4xiJqk
         HNTvVYeIXIIekkkd/hRHx7GMsM+zROriq6xcfr9iCC+TQwOt+6U51QNkXP3k6VA2ib69
         Uy+elEZ2NKIznS7GRUAjZcgPvG7K8K6kK7KeCfoBQPDCR94K79a60WMlby3rKaxU5Zqm
         ttqjgZiflJzqHaQ4hkEyyKkuPACT6bJJwZjZ6BELYwp0Q7+yANdRjT7z6wLBFWxw96qI
         pzOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791372759; x=1791977559;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PHW3B5o3N3ilCM+9E2QvAbEwtGUHiB9qDO2zWEqNFUA=;
        b=JtEQdAM5k87Vl2ZfdFeR0Xq8vITcoUKrtl7N08YUq6s2cFEscfmXhsOtTnOJw9bQ9e
         GaAqNM3pKS3mdaBqcay0rD4pOlaZGVPw1bV5x4KUh8/LIPzGDCnoeerGvA7YfzAIjXK0
         JkzfnKwHDhD+D42dV4kIEZais3VDxUbR/sHVHiDQbGNcwl1Pa+T+D8wJjxjR72O953Xr
         k7abBLAqmniAiiXfKyZtvyi+jysCqh/2G9fLhZInhavOfZ4vcBf51R7HFiwESwx0gMnf
         M5x7cmSs7ZOAwy/zj8AbL4647TjeGDOn4ReipA7r1H2mTkvOgPu4K7ED8z7ma7sTS4Su
         12YA==
X-Forwarded-Encrypted: i=1; AKwUvBzZ+mv9XoXHa3aZ1iDpABRiku4vYmFZIlMAR9/mTpOoQ2HlNM8NQsUBWthUsP1ez9XywrIJP+ioff8=@lists.xenproject.org
X-Gm-Message-State: AFuF++nN8at7yhETHz/eMEaS5aweiSPsUxYVrZa0ZUweuFj7b8NV9Kqs
	t7Nc3vtawDWcUdb++BvF1rGd8WY9xJZJU26Zr/5Cur9TLXyThVr1HOY9
X-Gm-Gg: AYBFou2QucPoMEwYZuj0pSRZQHx4l4utO0qY1pby29oAqhCQyIRjxOBRDarWkX/cGoU
	drnYrBWhxhLPS37GYVD1YrUGt57tgwaGEy+H+O7pBnUFD5XrWTwzDPaVaguGd01LE7myORByk7X
	g3AEoapNdGC2I5kRkTFLIqLcG6g+LbsoR5DFmHk7vmWfvKyKeHs33lj76eKn7qBCXXERERWxCa7
	ObHeHXDv2S/bbYeMGoKbTjQ5VU+3naZ0Yy4jxBTn2rB5VP09P4OLiYntnJoVEhfcBAy62UmOXz2
	ppIvlv8f7qvSPT/hc70ZiYhM5vlBYnT13qD8hyuc66XiKH+T3Q8eumhfNaiTM4Z++XySBvCUang
	6wbaVSNrdsTP8SyshvDuhGnDlONuXtMSYrYjSFXZWjn03cZJmlid0HjjL0QMk8mz2CtB/WfwAFr
	zj+RMokJLGQA8Wl/izZEBohkbqHgaluDRBJctag1I0fis+5/eIYDnOKNELJdy5mglnlhm16R+7P
	5MwXCcfdGSYXLzI3xpS3u/OYThYWueLoY4fVKxMuZDFlE2mOdvCCPzEqHov
X-Received: by 2002:a05:600c:8b09:b0:4a1:7ce1:2eaf with SMTP id 5b1f17b1804b1-4a180682d24mr27212855e9.34.1791372758428;
        Wed, 07 Oct 2026 04:32:38 -0700 (PDT)
Message-ID: <a4db81fc-03ec-4521-8424-7c9486ec9be2@gmail.com>
Date: Wed, 7 Oct 2026 13:32:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/3] xen/riscv: always preset A/D bits in G-stage PTEs
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>, Zheng Zhang <zhangzheng@iscas.ac.cn>,
 xen-devel@lists.xenproject.org, Baptiste Le Duc <baptiste.le-duc@vates.tech>
References: <1791215925.8631fc262581453bbf619ec5b2062170.1a10cc9f7c20003f66@vates.tech>
 <1791216017.8631fc262581453bbf619ec5b2062170.1a10ccb5ec20003f66@vates.tech>
 <793b6d0d-68ca-4f9d-8ca5-c37f2c013478@suse.com>
 <4a0b0d62-c312-43c1-908a-fcff7c081149@gmail.com>
 <4fa78acf-4de9-48bc-aea8-fed774d80cfa@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <4fa78acf-4de9-48bc-aea8-fed774d80cfa@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-33051d/1791372759-76EF74E9-ADA12144/10/73395122804
X-purgate-type: spam
X-purgate-size: 8129



On 10/7/26 12:44 PM, Jan Beulich wrote:
> On 07.10.2026 12:03, Oleksii Kurochko wrote:
>> On 10/6/26 5:20 PM, Jan Beulich wrote:
>>> On 05.10.2026 18:00, Baptiste Le Duc wrote:
>>>> A RISC-V implementation can manage the PTE A/D bits in one of two ways:
>>>>       1) Update the 'A' and 'D' PTE bits in hardware (ratified as Svadu).
>>>>       2) Generate a page fault when 'A' and/or 'D' is clear, so that software
>>>>          can set them (ratified as Svade).
>>>>
>>>> p2m_set_pte_flags() presets A/D in G-stage PTEs only when the device tree
>>>> advertises Svade.
>>
>> According to the code it seems like it is setting A/D bits always
>> independently on what is DT file.  Baptiste, am I missing something?
>>
>>    Platforms that use scheme (2) without advertising Svade,
>>>> such as the HiFive Premier P550, then hit guest-page faults that Xen does
>>>> not handle.
>>>
>>> Is that a quirk then (to avoid the word "bug")? Since it's all DT that
>>> conveys available ISA information, why can't the DT for those systems
>>> simply be fixed? Depending on the answer here I might question the
>>> presence of the Fixes: tag below.
>>
>> I think it can at some point. Let me clarify why "at some point"...
>>
>> So how the things are working now:
>>
>> OpenSBI detects the available ISA extensions in two steps:
>> 1. It parses the CPU nodes in the DTB. If a node has the
>> riscv,isa-extensions property, OpenSBI uses it; otherwise it falls back
>> to riscv,isa. riscv,isa-extensions describes the same extensions as
>> riscv,isa, but as a list of strings, which makes it easier to parse.
>>   From this, OpenSBI builds a per-hart bitmap of available extensions
>> (basically what we do in Xen). (Platform-specific code can also add
>> extensions to the bitmap at this step.)
>> 2. It then probes a small, fixed set of extensions (Sstc, Smaia,
>> Sscofpmf, Smstateen, Ssstateen, Smcntrpmf, Sdtrig) by reading a CSR that
>> the extension introduces and checking whether the access traps. This is
>> similar to what we do for Sstc in Xen.
>>
>> Step 2 only adds extensions to the bitmap. It does not check or clear
>> the extensions that came from the DT; the only exception is Zicntr,
>> which is detected purely by probing. So for extensions such as
>> Svade/Svadu, which have no CSR to probe, the DT is the only source of truth.
>> Now, what OpenSBI does with Svade/Svadu specifically. First, it disables
>> hardware A/D updating by default, i.e. it clears menvcfg.ADUE:
>>
>> Now, what OpenSBI does with Svade/Svadu specifically. First, it disables
>> hardware A/D updating by default, i.e. it clears menvcfg.ADUE:
>>
>>     /* Disable HW A/D updating by default */
>>     menvcfg_val &= ~ENVCFG_ADUE;
>>
>> Then it sets ADUE again, depending on which extensions are listed in the
>> DTB:
>>
>>     /*
>>      * Assume only Svadu is supported when it is the only extension
>>      * present in the ISA string. Svade is assumed when neither are
>>      * present. When both are present we must default to Svade (see
>>      * the zero reset value of FWFT.PTE_AD_HW_UPDATING).
>>      */
>>     if (!sbi_hart_has_extension(scratch, SBI_HART_EXT_SVADE))
>> 	__set_menvcfg_ext(SBI_HART_EXT_SVADU, ENVCFG_ADUE);
>>
>> So all OpenSBI does is set or clear menvcfg.ADUE based on what is
>> mentined in DTB.
>>
>> So, to answer your original question: yes, this can be fixed just by
>> updating the DTS. OpenSBI will then configure menvcfg.ADUE according to
>> the extensions listed there. Note that the logic above is from OpenSBI
>> v1.9. Versions v1.5–v1.8 behave the same when the DT lists only svadu,
>> only svade, or both. When neither is listed, they leave ADUE unchanged
>> instead of clearing it. Versions before v1.5 don't handle Svade/Svadu at
>> all.
>>
>> But IIRC such approach was suggested in one of vX and it was rejected
>> because we can't in Xen be sure that passed DTB is correct and
>> corresponds to how real h/w is configured as specifically with ADUE bit
>> in menvcfg we can't read it in HS-mode as an exception will occur as it
>> is M-mode register. So we have to trust that OpenSBI (or other firmware
>> will configure the A/D update scheme according to what is mentioned in DTS).
>>
>> So then basically the question is do we want to rely on that how OpenSBI
>> configures h/w?
>>
>> It seems like it could be fine. For example, without support for the
>> FWFT extension, we can't access or change the menvcfg bit anyway. The
>> FWFT extension was ratified in 2025, so we have to trust OpenSBI anyway
>> (or introduce our own extension or port the FWFT extension to an earlier
>> OpenSBI version) before FWFT is started to be available.
>>
>> With this explanation would you (Jan) be okay to go with just providing
>> proper DTS?
> 
> I can't answer this, as I lack details on where the DTS is coming from.
> So far I thought this was a blob handed to Xen (as kind of a module) at
> boot. What you say above makes me uncertain about that. If it is a blob
> as I thought, how difficult is it for people to edit a broken blob, for
> it to correctly reflect their hardware's capabilities?

It depends...

So usually the things are going in this way products like U-boot, Linux 
has dts in its code source base and then these DTSes are compiled by 
build system to DTB, and then this DTB is put to the place where U-boot, 
Linux can reach it, or U-boot provides through a register DTB to Linux.
Sometimes it also could be a case when what is U-boot/Linux source code 
base is taken as a base and then a new dts is provided  based on them, 
for example, to choose what h/w should be enabled/disabled or probably 
for some specific board some device is connected to a different pin and 
so DTS will be needed to be updated, and so on...

 From one side, it could be super easy as DTB (blob) could be taken by 
anyone then just decompile (it using a default dtc compiler) to DTS, 
update the necessary properties and then updated DTS (using dtc compiler 
again) compile back to DTB.

But on the other side it could be some kind of secure boot where all the 
binaries are signed and then it will be pretty hard to decompile and 
compile DTB with the same sign....

> 
> If that's not "very simple", or if there's concern that people may
> object to doing such editing, then I think we could (should) go without
> that. All I then would ask is that the description be clarified a
> little further (clarifying that absence of both extensions is a valid,
> albeit historical situation).
> 

Also I am looking at henvcfg register which we could access in HS-mode 
and it also has ADUE bit and the description for it is the following:
```
If the Svadu extension is implemented, the ADUE bit controls whether 
hardware updating of PTE A/D bits is enabled for VS-stage address 
translation. When ADUE=1, hardware updating of PTE A/D bits is enabled 
during VS-stage address translation, and the implementation behaves as 
though the Svade extension were not implemented for VS-mode address 
translation. When ADUE=0, the implementation behaves as though Svade 
were implemented for VS-stage address translation. If Svadu is not 
implemented, ADUE is read-only zero
```

So, at some point, we could verify how OpenSBI configured the hardware 
and compare it with what is specified in the DTS file.

The only problem is how to interpret this part: “If Svadu is not 
implemented, ADUE is read-only zero.” The spec does not explicitly state 
that Svade will be used in this case, but logically, it seems that if 
Svadu is not implemented, the implementation has no other choice but to 
provide Svade and so basically we could detect if Svade is used based 
only on ADUE bit.

If we accept this assumption, we could fully verify, in HS-mode, both 
what is specified in the DTS and how OpenSBI configured the hardware. 
This would allow us to require users to provide a proper DTS with the 
A/D bits update scheme correctly specified.

~ Oleksii


