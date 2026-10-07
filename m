Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D296CA5FFC
	for <xen-devel@archiver.kernel.org>; Wed,  7 Oct 2026 11:40:45 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1442240.1659826 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xEQ0b-0007pD-Fl; Wed, 07 Oct 2026 11:40:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1442240.1659826; Wed, 07 Oct 2026 11:40:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xEQ0b-0007p6-DB; Wed, 07 Oct 2026 11:40:29 +0000
Received: by outflank-mailman (input) for mailman id 1442240;
 Wed, 07 Oct 2026 11:40:28 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xEQ0a-0007p0-8O
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2026 11:40:28 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xEQ0Z-00959A-Ep
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2026 13:40:27 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6ac62f9f-e002-0a2a0a5209dd-0a2a4506d762-30
 for <xen-devel@lists.xenproject.org>; Wed, 07 Oct 2026 13:40:27 +0200
Received: from [209.85.128.53] (helo=mail-wm1-f53.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6ac62fab-195a-0a2a45060019-d1558035b470-3
 for <xen-devel@lists.xenproject.org>; Wed, 07 Oct 2026 13:40:27 +0200
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-4a021c809e3so17362535e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 07 Oct 2026 04:40:27 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-71-234.play-internet.pl.
 [109.243.71.234]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a178c33091sm146321435e9.4.2026.10.07.04.40.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Oct 2026 04:40:26 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1791373227; x=1791978027; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fxQn707ALc/LL3QUmDsNHwOoEljnAO3jUsJRBgN2r8U=;
        b=Pf9f1r8YKNAu/4c6v1C1FmDgiW54idOe95XTC4cdv5NLFBDr/Kp3vbXjohlUK/z69m
         Hcac7t/eEA4Zm04nYeWOAPB14yncHQMuULeGTb7jOEMRLfAK2YFe5Dq4sjoKJP3Wp1wB
         bCA58KXPzn22BaFMMKdUdfu5b8nFXieP9EtIIFVXOY39Aha2iLs5KlgGnRehI0k5pXmH
         kCVpO1nugS9uQXa/df7mL0tRoeK3pFnzuraMhR9zzG/se5hqfPQt9gm54lZATzUB508w
         XRPzACYt4njkucKTVzuH8lFDYwRKn9hOiWc2XqtkS46m9ovFfc+QnOTdfkGKr5csUAfk
         m8Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791373227; x=1791978027;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fxQn707ALc/LL3QUmDsNHwOoEljnAO3jUsJRBgN2r8U=;
        b=DIQPF7QU6wgFrmL47o6j0z+CdKX370N77Y5nY+DGZ9HF2fUIcmTak1oNJcT0gHpQj4
         FQ5Ik+IMkE8NADF505lktixZNNKnuMu4/qnvq0nwd2vLLE1T4AMxKpCln3RT4xYruz2g
         YUz9+Xv5AAC6MZxC00GlYshy5AixrvM0/8MO9LIUaVtLwEnWHmhdkID/Mfn24cQCoOMD
         aVdrE4SNhH56P5Y79yY+OtoG2RsaVfzE5/tD9hsfGwn0Nx/RYmly1uH7SyR0np7IzCkp
         Zxpp0JSXp2ieECvTS5sGelzar05hzCw/hdWjIKQpzfNTXKwlKQWkGu1Ki/KfgudvE/on
         jTyA==
X-Forwarded-Encrypted: i=1; AKwUvBzMdsxuZQy2jf9FEUoQ8fvhl+dVulZyBbqUt9/PAyppVK+0xA7eDUhb726j65KEQHg3HA3pJ+zqDg0=@lists.xenproject.org
X-Gm-Message-State: AFuF++l/ynSbgfuqR0Pgm6qPFQBLIjvctMz2R0noRqSN9oUFOk2/P4QH
	pHGQxtexa+Ftx1m657RTa/o3088vRy8YZWSgzyW7NI/kchqGeCRsCsqf
X-Gm-Gg: AYBFou2zKPIWjVqtNfrkNdg5qfcg1LQBgCBiJiLbP9wHcuzPmSS7p8ptad2mNOrxZDc
	P/CxyjMMF0xH04VAVtrM/j5P+TEt8lWDnoWnTWri8hZiJb6iXtiZkar1lcHCLCLTaZHH7EkI4nH
	3Klx0hoaz2QYuMmvsfRf9ZOneBkzOHwdxWqAqS72nhyLagTASwtJ334zA3v018SI41L4Awg0D5E
	PIzxuUrMVQToI6YcNHTs3qMkyGxbhIFAjJyJVHO00epnfk4CqFoU90c4Zrrm4+J9WzRhNsWIWrY
	viTgMXSBWp/4+6QDwxYXBQ0qwU4JtbAZgu7laEvpC243Z+SAUYiKLRwqfnvcwcMUWWk8sDjqKk9
	Zj3L2Fj1zLKhE7LPtDb8MIFRKRidnTEpF6a/kPnZSLyWqmZfn809Jx0fskf2+BWRDu8/guwGovq
	RaOmVd+t97FhmM5R7vWgxKNEQgl2VLmGuaLj+y9Jg5W6VTnV/zxlwPpdTV083jgGwvxGc+t0XjX
	J0xsKEfJto2nX2DrmGqJY0LG3Qx1UfpTTZebLCp2EpNDjcdOA==
X-Received: by 2002:a05:600c:818c:b0:499:b65e:49c9 with SMTP id 5b1f17b1804b1-4a180419643mr26080295e9.10.1791373226729;
        Wed, 07 Oct 2026 04:40:26 -0700 (PDT)
Message-ID: <eafdbdc4-c616-4345-888b-70c4c39ed039@gmail.com>
Date: Wed, 7 Oct 2026 13:40:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/3] xen/riscv: always preset A/D bits in G-stage PTEs
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
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
 <a4db81fc-03ec-4521-8424-7c9486ec9be2@gmail.com>
Content-Language: en-US
In-Reply-To: <a4db81fc-03ec-4521-8424-7c9486ec9be2@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-16d1c6/1791373227-FD80D77B-B8306C4D/10/73395122804
X-purgate-type: spam
X-purgate-size: 8716



On 10/7/26 1:32 PM, Oleksii Kurochko wrote:
> 
> 
> On 10/7/26 12:44 PM, Jan Beulich wrote:
>> On 07.10.2026 12:03, Oleksii Kurochko wrote:
>>> On 10/6/26 5:20 PM, Jan Beulich wrote:
>>>> On 05.10.2026 18:00, Baptiste Le Duc wrote:
>>>>> A RISC-V implementation can manage the PTE A/D bits in one of two 
>>>>> ways:
>>>>>       1) Update the 'A' and 'D' PTE bits in hardware (ratified as 
>>>>> Svadu).
>>>>>       2) Generate a page fault when 'A' and/or 'D' is clear, so 
>>>>> that software
>>>>>          can set them (ratified as Svade).
>>>>>
>>>>> p2m_set_pte_flags() presets A/D in G-stage PTEs only when the 
>>>>> device tree
>>>>> advertises Svade.
>>>
>>> According to the code it seems like it is setting A/D bits always
>>> independently on what is DT file.  Baptiste, am I missing something?
>>>
>>>    Platforms that use scheme (2) without advertising Svade,
>>>>> such as the HiFive Premier P550, then hit guest-page faults that 
>>>>> Xen does
>>>>> not handle.
>>>>
>>>> Is that a quirk then (to avoid the word "bug")? Since it's all DT that
>>>> conveys available ISA information, why can't the DT for those systems
>>>> simply be fixed? Depending on the answer here I might question the
>>>> presence of the Fixes: tag below.
>>>
>>> I think it can at some point. Let me clarify why "at some point"...
>>>
>>> So how the things are working now:
>>>
>>> OpenSBI detects the available ISA extensions in two steps:
>>> 1. It parses the CPU nodes in the DTB. If a node has the
>>> riscv,isa-extensions property, OpenSBI uses it; otherwise it falls back
>>> to riscv,isa. riscv,isa-extensions describes the same extensions as
>>> riscv,isa, but as a list of strings, which makes it easier to parse.
>>>   From this, OpenSBI builds a per-hart bitmap of available extensions
>>> (basically what we do in Xen). (Platform-specific code can also add
>>> extensions to the bitmap at this step.)
>>> 2. It then probes a small, fixed set of extensions (Sstc, Smaia,
>>> Sscofpmf, Smstateen, Ssstateen, Smcntrpmf, Sdtrig) by reading a CSR that
>>> the extension introduces and checking whether the access traps. This is
>>> similar to what we do for Sstc in Xen.
>>>
>>> Step 2 only adds extensions to the bitmap. It does not check or clear
>>> the extensions that came from the DT; the only exception is Zicntr,
>>> which is detected purely by probing. So for extensions such as
>>> Svade/Svadu, which have no CSR to probe, the DT is the only source of 
>>> truth.
>>> Now, what OpenSBI does with Svade/Svadu specifically. First, it disables
>>> hardware A/D updating by default, i.e. it clears menvcfg.ADUE:
>>>
>>> Now, what OpenSBI does with Svade/Svadu specifically. First, it disables
>>> hardware A/D updating by default, i.e. it clears menvcfg.ADUE:
>>>
>>>     /* Disable HW A/D updating by default */
>>>     menvcfg_val &= ~ENVCFG_ADUE;
>>>
>>> Then it sets ADUE again, depending on which extensions are listed in the
>>> DTB:
>>>
>>>     /*
>>>      * Assume only Svadu is supported when it is the only extension
>>>      * present in the ISA string. Svade is assumed when neither are
>>>      * present. When both are present we must default to Svade (see
>>>      * the zero reset value of FWFT.PTE_AD_HW_UPDATING).
>>>      */
>>>     if (!sbi_hart_has_extension(scratch, SBI_HART_EXT_SVADE))
>>>     __set_menvcfg_ext(SBI_HART_EXT_SVADU, ENVCFG_ADUE);
>>>
>>> So all OpenSBI does is set or clear menvcfg.ADUE based on what is
>>> mentined in DTB.
>>>
>>> So, to answer your original question: yes, this can be fixed just by
>>> updating the DTS. OpenSBI will then configure menvcfg.ADUE according to
>>> the extensions listed there. Note that the logic above is from OpenSBI
>>> v1.9. Versions v1.5–v1.8 behave the same when the DT lists only svadu,
>>> only svade, or both. When neither is listed, they leave ADUE unchanged
>>> instead of clearing it. Versions before v1.5 don't handle Svade/Svadu at
>>> all.
>>>
>>> But IIRC such approach was suggested in one of vX and it was rejected
>>> because we can't in Xen be sure that passed DTB is correct and
>>> corresponds to how real h/w is configured as specifically with ADUE bit
>>> in menvcfg we can't read it in HS-mode as an exception will occur as it
>>> is M-mode register. So we have to trust that OpenSBI (or other firmware
>>> will configure the A/D update scheme according to what is mentioned 
>>> in DTS).
>>>
>>> So then basically the question is do we want to rely on that how OpenSBI
>>> configures h/w?
>>>
>>> It seems like it could be fine. For example, without support for the
>>> FWFT extension, we can't access or change the menvcfg bit anyway. The
>>> FWFT extension was ratified in 2025, so we have to trust OpenSBI anyway
>>> (or introduce our own extension or port the FWFT extension to an earlier
>>> OpenSBI version) before FWFT is started to be available.
>>>
>>> With this explanation would you (Jan) be okay to go with just providing
>>> proper DTS?
>>
>> I can't answer this, as I lack details on where the DTS is coming from.
>> So far I thought this was a blob handed to Xen (as kind of a module) at
>> boot. What you say above makes me uncertain about that. If it is a blob
>> as I thought, how difficult is it for people to edit a broken blob, for
>> it to correctly reflect their hardware's capabilities?
> 
> It depends...
> 
> So usually the things are going in this way products like U-boot, Linux 
> has dts in its code source base and then these DTSes are compiled by 
> build system to DTB, and then this DTB is put to the place where U-boot, 
> Linux can reach it, or U-boot provides through a register DTB to Linux.
> Sometimes it also could be a case when what is U-boot/Linux source code 
> base is taken as a base and then a new dts is provided  based on them, 
> for example, to choose what h/w should be enabled/disabled or probably 
> for some specific board some device is connected to a different pin and 
> so DTS will be needed to be updated, and so on...
> 
>  From one side, it could be super easy as DTB (blob) could be taken by 
> anyone then just decompile (it using a default dtc compiler) to DTS, 
> update the necessary properties and then updated DTS (using dtc compiler 
> again) compile back to DTB.
> 
> But on the other side it could be some kind of secure boot where all the 
> binaries are signed and then it will be pretty hard to decompile and 
> compile DTB with the same sign....
> 
>>
>> If that's not "very simple", or if there's concern that people may
>> object to doing such editing, then I think we could (should) go without
>> that. All I then would ask is that the description be clarified a
>> little further (clarifying that absence of both extensions is a valid,
>> albeit historical situation).
>>
> 
> Also I am looking at henvcfg register which we could access in HS-mode 
> and it also has ADUE bit and the description for it is the following:
> ```
> If the Svadu extension is implemented, the ADUE bit controls whether 
> hardware updating of PTE A/D bits is enabled for VS-stage address 
> translation. When ADUE=1, hardware updating of PTE A/D bits is enabled 
> during VS-stage address translation, and the implementation behaves as 
> though the Svade extension were not implemented for VS-mode address 
> translation. When ADUE=0, the implementation behaves as though Svade 
> were implemented for VS-stage address translation. If Svadu is not 
> implemented, ADUE is read-only zero
> ```
> 
> So, at some point, we could verify how OpenSBI configured the hardware 
> and compare it with what is specified in the DTS file.
> 
> The only problem is how to interpret this part: “If Svadu is not 
> implemented, ADUE is read-only zero.” The spec does not explicitly state 
> that Svade will be used in this case, but logically, it seems that if 
> Svadu is not implemented, the implementation has no other choice but to 
> provide Svade and so basically we could detect if Svade is used based 
> only on ADUE bit.
> 
> If we accept this assumption, we could fully verify, in HS-mode, both 
> what is specified in the DTS and how OpenSBI configured the hardware. 
> This would allow us to require users to provide a proper DTS with the A/ 
> D bits update scheme correctly specified.

Probably we could do such assumption as I found the following in the spec:

The Svade extension requires page-fault exceptions be raised when PTE 
A/D bits need be set, hence Svade is implemented when ADUE=0.

~ Oleksii

