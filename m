Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AEFDC982FA
	for <xen-devel@archiver.kernel.org>; Wed, 23 Sep 2026 10:42:15 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1430163.1652766 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9KQG-00085I-8u; Wed, 23 Sep 2026 10:41:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1430163.1652766; Wed, 23 Sep 2026 10:41:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9KQG-00085B-3x; Wed, 23 Sep 2026 10:41:56 +0000
Received: by outflank-mailman (input) for mailman id 1430163;
 Wed, 23 Sep 2026 10:41:54 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1x9KQE-000855-IR
 for xen-devel@lists.xenproject.org; Wed, 23 Sep 2026 10:41:54 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x9KQD-00DLFB-Lj
 for xen-devel@lists.xenproject.org; Wed, 23 Sep 2026 12:41:53 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6ab3acdb-2eae-0a2a0a5409dd-0a2a450c96f6-44
 for <xen-devel@lists.xenproject.org>; Wed, 23 Sep 2026 12:41:53 +0200
Received: from [74.125.225.140] (helo=mail-wm2-f12.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6ab3acf1-f479-0a2a450c0019-4a7de18c88cf-3
 for <xen-devel@lists.xenproject.org>; Wed, 23 Sep 2026 12:41:53 +0200
Received: by mail-wm2-f12.google.com with SMTP id
 5b1f17b1804b1-49cd38e0e5dso9731745e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 23 Sep 2026 03:41:53 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-71-234.play-internet.pl.
 [109.243.71.234]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-488682668dcsm6475478f8f.1.2026.09.23.03.41.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Sep 2026 03:41:52 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1790160113; x=1790764913; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c9ihzKE0mSlPqtEO5PDjohARwVTe+h90O5WXQ1vjLDo=;
        b=eocGGaNlAdOeWuWU7/EzgJmYKWmNNB6U6Gl6ZTubOO8fc3Yu+7yBv91HIEnP5H6PvI
         AmHVadJpMASii2YwRFLvYyW4f8i9G82TyqeJ5iA/7MTJPxJ2d+WM3NnBCnMEbWRLE6Go
         3P3qxWuuHyCVxLbGzaaY+mIyFxgh6pR8DYP2MK7mc27EE4zvBCPiuU92je9xNQx7FW6W
         VFa6iHaqARr4C+4EI0hXsmVorPttZd3gqdhwC0iQ0nlCEhoCibk9VHaM21XpOkTGNq1n
         RemPXk9j5xSe9m/wuqBlUZKgpYEf83xHvpdfB1PmzwyrBD7NCYZQkn+C2q+N/sGYqGRD
         dTTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790160113; x=1790764913;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c9ihzKE0mSlPqtEO5PDjohARwVTe+h90O5WXQ1vjLDo=;
        b=Qu/S/Ckg5G8FsCQUhxUzpOFiySdkBt25Ir1eeHOXOKTpPg4euW3D1TkDF5wLM1Yft6
         Cy8ceBu2GB0Zgmkm75eXZcMnfvdW6nRHmC7XQ+6xyDavx/yfibtv5vVaZaDPjs3XFurR
         05j6xmkFiAJclpu98GMy7JKQvv5adAFCFYgbN6kmjXVmV3zD3uVk96zKjMMT21X2PQLN
         Wu+bay/C2sic1nQooeKf/l9RjElDxeZqANtxKY6OEnMNOmdzwmyN1WdnHKt8vNmiRaOw
         YMy7vk8C86YMWmEcKwia/WjBwnCsP2J32YCWNv1zm81dz9U0pE+Ye4K5in74lL1QvGbF
         Hisw==
X-Forwarded-Encrypted: i=1; AKwUvBxSTxVJu+1HsgYd4uej2ib98b9rGF5xyx1XC6ItJI9vDRCqG1YSdxX88V+RwDZWQl6zUD2KNcKXB5k=@lists.xenproject.org
X-Gm-Message-State: AFuF++l5m2ZFiypJpsHjfb8iKebTkVrJqiNwixgXpF5XoYHt6whVnjz8
	2czHY78ZmfBle6TODxCed7MiSnL2vmlI513YJ1VM54cnNgXG6BgfTiMH
X-Gm-Gg: AYBFou2qP3lPLcuULp8yPKMZKvTopbIvRfdQl5/KQAt4fuDZzenegdcnab7Uk+qB6fK
	sKJLv/wbkq+ijaJroqHXYk/NhBe/qokK2o0Muf/QCrmk2gKQQMefadMtCZkfnmlwxMTDSwSUixP
	z6UUHKsaMWwkTVvy6C+orse4sxvOg48h32hqu75tghI7klU3wbqpTQsjvCmKWsW6azvcou6wAqE
	Bu+QSeV95rsTZ+0TgJcwtDm3xC1ZY5yNAAaPoBYEUOdlO2hT7q6rE6DU32GWCUeoLZYZP4xoYYX
	sKE67h9w3kAVNQrGl0b9gdxyh1gX84E6HplxmT5y4rVWXYCYHwifk0hyuHD1kKSyYRCx+ukYWH2
	9sBGHSJVAZ/2TIk4YmVLEbg74S8cCfMIBwElktDStBqFGL5P97vKeWMpv1nnxXE6kqVKKwrdDSS
	B71L5IZJrogKDGn48ZNnLuob8gGDQDyyJscLeAUZ6NLqO5wgBr8qc02NYC2laNaYxUdrIFtF0eX
	fXB9CgSrh4bWMjNUHAflR4YHD0vFNrkBYN8dXLm9FuQUoU4ug==
X-Received: by 2002:a05:600c:8b21:b0:49c:f512:2361 with SMTP id 5b1f17b1804b1-49fdf1087edmr28780185e9.14.1790160112776;
        Wed, 23 Sep 2026 03:41:52 -0700 (PDT)
Message-ID: <1425dafc-9737-4776-aa65-5b0e5635e9f5@gmail.com>
Date: Wed, 23 Sep 2026 12:41:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/6] xen/riscv: fix Svade/Svadu A/D bit handling
To: Baptiste Le Duc <baptiste.le-duc@vates.tech>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <1789032657.8631fc262581453bbf619ec5b2062170.1a08aa7f23b000c4f3@vates.tech>
 <1789032897.8631fc262581453bbf619ec5b2062170.1a08aab9d76000c4f3@vates.tech>
 <ab528209-4a06-4f30-8cd7-af54c7c33e4c@gmail.com>
 <1790157982.8631fc262581453bbf619ec5b2062170.1a0cdbb0c1a00072c4@vates.tech>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <1790157982.8631fc262581453bbf619ec5b2062170.1a0cdbb0c1a00072c4@vates.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d25034/1790160113-03CD3A5B-5D75B1F1/10/73395122804
X-purgate-type: spam
X-purgate-size: 4120



On 9/23/26 12:06 PM, Baptiste Le Duc wrote:
> On 2026-09-22 17:29 +0200, Oleksii Kurochko wrote:
>>
>>
>> On 9/10/26 11:34 AM, Baptiste Le Duc wrote:
>>> p2m_set_permission() only presets the PTE A/D bits when the Svade extension
>>> is present in the device tree. This causes an unhandled page fault when
>>> neither Svade nor Svadu is present (the platform's actual behaviour is then
>>> unknown), and when both are present in the device tree.
>>
>> When both are present, RISCV_ISA_EXT_svade is set, so the current code
>> does preset the A/D bits and no fault happens. The only broken case is
>> when neither extension is present, so shouldn't "both present" be dropped?
> Yes i agree, I'll fix that in v3.
>>
>>>
>>> Move the Svade/Svadu resolution out of p2m_set_permission() and into a new
>>> riscv_resolve_ad_scheme(), called once from riscv_fill_hwcap(). For each of
>>> the four possible Svade/Svadu combinations (inspired by [1]), it decides
>>> whether software has to preset the A/D bits and, if so, sets
>>> RISCV_ISA_EXT_svade to record that decision:
>>> - neither present: assume Svade, since assuming Svade is harmless on real
>>>     Svadu hardware, while assuming Svadu on real Svade hardware risks an
>>>     unhandled page fault
>>> - only Svade present: assume Svade
>>> - only Svadu present: leave A/D management to hardware
>>> - both present: Svade wins until Xen supports the SBI FWFT call needed to
>>>     enable hardware updating of A/D bits, so assume Svade and warn that
>>>     dropping 'svade' from the DT is the only way to get Svadu.
>>>
>>> [1] https://lwn.net/Articles/980016/
>>>
>>> Fixes: ff14053983b0 ("xen/riscv: Implement p2m_pte_from_mfn() and support PBMT configuration")
>>> Assisted-by: Claude:claude-opus-5
>>> Signed-off-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>
>>> ---
>>> Changes since v1:
>>> - change commit title
>>> - expose RISCV_ISA_EXT_svadu so the two extensions can be told apart.
>>> - move the Svade/Svadu resolution to a new riscv_resolve_ad_scheme(),
>>>     called once from riscv_fill_hwcap().
>>> - expose sbi_probe_extension() (was static) to probe for SBI FWFT.
>>
>> sbi_probe_extension() is already non-static in staging, only the prototype
>> is missing. What base is this patch against?
>>
>>> - stop presetting A/D bits unconditionally in p2m_set_permission(), do it
>>>     only when Svade is present.
>>
>> What is the gain from not presetting them? Presetting A/D is correct
>> with both Svade and Svadu: with Svadu it just saves the hardware an
>> atomic PTE update on first access. Xen doesn't consume G-stage A/D bits
>> (no dirty tracking, no demand paging), and pt.c already presets A/D
>> unconditionally for Xen's own mappings. Always setting PTE_ACCESSED |
>> PTE_DIRTY in p2m_set_permission() fixes the bug in one line, with no
>> need for the resolver, the new ISA bit, FWFT probing or the ASSERT.
>> Handling A/D differently only makes sense once Xen actually wants that
>> information, and at that point FWFT support and a fault handler are
>> needed anyway.
> I agree that presetting them is the right way, it is also the way linux
> is working. If Jan agree, I will to in that way in v3.
> 
> Then, it seems there is no need to register Svade/Svadu at all in
> cpufeature.c, am I right?

If after the re-work we won't need any case of code where it is needed 
to call riscv_isa_extension_available(NULL, RISCV_ISA_EXT_{svadu,svade}) 
then it seems like we won't need it in cpufeature.c, at least, in terms 
of the current patch. (but also consider my another reply in a separate 
thread if final solution will end that we will force a user to 
explicitly tell that a user has to write Svade or Svadu in DTS then 
likely we will need to have correspondent arrays in cpufeature.c and 
emum updated).

Probably, we will need to have them mentioned in correspondent arrays in 
cpufeature.c if we want to implicitly tell for example that guest is 
supporting Svadu or Svade. But I think it isn't the case for the current 
patch.

~ Oleksii

