Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77A9BC79FAD
	for <xen-devel@archiver.kernel.org>; Wed,  9 Sep 2026 12:57:40 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1412977.1643248 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4HrX-00044i-GT; Wed, 09 Sep 2026 12:57:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1412977.1643248; Wed, 09 Sep 2026 12:57:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4HrX-00044b-DL; Wed, 09 Sep 2026 12:57:15 +0000
Received: by outflank-mailman (input) for mailman id 1412977;
 Wed, 09 Sep 2026 12:57:14 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1x4HrW-00044V-5v
 for xen-devel@lists.xenproject.org; Wed, 09 Sep 2026 12:57:14 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x4HrV-00DR3s-4Z
 for xen-devel@lists.xenproject.org; Wed, 09 Sep 2026 14:57:13 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6aa15799-8faa-0a2a0a5109dd-0a2a4504b648-44
 for <xen-devel@lists.xenproject.org>; Wed, 09 Sep 2026 14:57:13 +0200
Received: from [209.85.218.47] (helo=mail-ej1-f47.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6aa157a8-b57f-0a2a45040019-d155da2ff101-3
 for <xen-devel@lists.xenproject.org>; Wed, 09 Sep 2026 14:57:12 +0200
Received: by mail-ej1-f47.google.com with SMTP id
 a640c23a62f3a-c2940d16190so35122966b.3
 for <xen-devel@lists.xenproject.org>; Wed, 09 Sep 2026 05:57:12 -0700 (PDT)
Received: from [172.19.143.248] (IW396200.net.t-com.hr. [195.29.234.54])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c262c770678sm607825566b.53.2026.09.09.05.57.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Sep 2026 05:57:12 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1788958632; x=1789563432; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FICCDewFemx7amMe/5cJmWLejfHXoU9z6m0V9R07YpM=;
        b=sp+O841w43xuESop50MfnmtBz2X86GB7s8Z2Os9G2qFU1rdF6FVsc5iB5xownpMmRj
         0FDDQLyn6dhEG6rnZhe8s8TtHZxHTLVJuIZC6vyfg0KYKaLEp4dfoc4BXqpNDIfkqUBz
         2GMujIiw7AkDjS4l1wYbBBa59/c2DNtGp2kDtNsZf3xysvoZh8Yb0r2nm17tsDd3nmiZ
         2wO1D/2Q4T6uHu9GKLBU4hqhfBxeKxnYol01NMBi0EBfOEX8eRjvKkFrkJjkpbOJ0gxZ
         WDETjwZolvoJ2sz7PDx6V8lsgzSxEMwzLJ63WWMhkdmfjBc1SyOX1TGYmk6R2R0nbL8j
         aO/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788958632; x=1789563432;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FICCDewFemx7amMe/5cJmWLejfHXoU9z6m0V9R07YpM=;
        b=GWwq07ZFM/3mll3V2Z16MmPc9r3NpdSN3tQvMRgFxdT+lG+wq8qCubtiRRVt54tr5W
         5E5VqHYZDWqZhya9n2v9LHyrRkg6RSIG1eXtgd77PiqSkZyktvwINeJ1UOV45qh+fT9+
         a3Wu1tp/8nsbtIPXh3w2LyYCLBJhhv/YfsuRkXq90yKDa5vCLq4L4AdaWzT9zUba1YvK
         7ZXLgUFiYQHXM62PlYvYKph86wsZLITLgZvOW+bD+5fMCySlSzceiNmGVuTls//wHaQ7
         raP3TeHiXxpdfix+jWsKmv4RH2HJ/+TwSpd67nEsGRp58MrOEVzAIiw/T074W6wYdMkz
         yGRQ==
X-Gm-Message-State: AFuF++nEEhIshWMeflAohf+ZpgNCFyIffnAcrVoJrPfwK4v3uMiqSGY9
	nd936n+zWVXzmb27rluzpj+TXvSAJ1QPaVrg/UGjG/RZrMei+eaLOTya
X-Gm-Gg: AYBFou3n94Da+8yYGaK4n8e1XAsadqnSqrUBvO2fuYJSsDOfJjjLwDf/DLy0eJyatbp
	QuMU5nW4zimhSmn37yQJNNPUPhwqsx2SzKA9WcYfek8UVZCS5s05y46FBHdzM1LD2LHzFnp/k+R
	faqks9ElPVtMZG14yvm4m1i+f5R5FTkFDGeEUClr96FH5dFX4BVKMIjYmiDspLn+DsaSc9xmUDG
	JS23gDEnDdDD+TJTjiRUlakAvebjbFAgHhvdeiLGz1Y1fn2Roo9galHwm+NaIWI8tb8FHmF07tX
	WKU4GdDfHa9wWxknihHDH3GOGbFW0w7MKbJprOyb8EPdh8ZAduvJkPdwLzkBp3xRO8jesBhtubn
	A17RO6FSxDyzlfrbLJcF8Q0SPC1sUg+xup9RKif+ioJPToB9vv4SJtTTyvsS1EltSK3cn6p/neg
	zM68vmfSM9PoktvlEOQYfJkXCSwmgLThRDY3DlWxk0qv1spIXIM7NN8KOPCiuRi4i+a9ynVXCgu
	P5w8YME75lok4tQF4TaDGTNPvZ6yH7V
X-Received: by 2002:a17:907:3f98:b0:c26:19e3:e988 with SMTP id a640c23a62f3a-c2619e3ef32mr1274834966b.40.1788958632374;
        Wed, 09 Sep 2026 05:57:12 -0700 (PDT)
Message-ID: <d715695a-f3fe-40b2-817c-254c624bbf33@gmail.com>
Date: Wed, 9 Sep 2026 14:57:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 17/39] xen/riscv: decouple INSN_PSEUDO_VS_* from the
 hypervisor's XLEN
To: Baptiste Le Duc <baptiste.le-duc@vates.tech>
Cc: xen-devel@lists.xenproject.org,
 Romain Caritey <Romain.Caritey@microchip.com>,
 Zheng Zhang <zhangzheng@iscas.ac.cn>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>
References: <cover.1787838835.git.oleksii.kurochko@gmail.com>
 <2a69992aa02ff114237ec27204cfac0f8278b1d6.1787838835.git.oleksii.kurochko@gmail.com>
 <1788796633.8631fc262581453bbf619ec5b2062170.1a07c9682ec000c4f3@vates.tech>
 <9a7dea59-be4a-4dbd-9935-f48e24adc009@gmail.com>
 <1788883499.8631fc262581453bbf619ec5b2062170.1a081c3f83a000c4f3@vates.tech>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <1788883499.8631fc262581453bbf619ec5b2062170.1a081c3f83a000c4f3@vates.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ebf023/1788958632-51AD0B50-452F3C23/10/73395122804
X-purgate-type: spam
X-purgate-size: 5778



On 9/8/26 6:04 PM, Baptiste Le Duc wrote:
> On 2026-09-08 11:34 +0200, Oleksii Kurochko wrote:
>>
>>
>> On 9/7/26 5:57 PM, Baptiste Le Duc wrote:
>>>> htinst reports a pseudoinstruction when a guest page fault is taken on an
>>>> implicit memory access done for VS-stage address translation. Four such
>>>> values are defined, differing in the access type (read or write) and in the
>>>> access width: 4 bytes (0x2000/0x2020) or 8 bytes (0x3000/0x3020).
>>>>
>>>> That width is the width of a VS-stage PTE, i.e. it follows the guest's
>>>> paging mode (4 bytes for Sv32, 8 bytes for Sv39 and wider) and has nothing
>>>> to do with the XLEN Xen itself is built for. Selecting just one pair with
>>>> where a guest running with VSXL=32 and Sv32 in vsatp produces the 4-byte
>>> Sentence is broken. Guess you mean "Selecting just one pair based on Xen's XLEN misses the case where
>>> …".
>>
>> Likely it is becuase of my low level English but it seems that original
>> version wast okay and what you added is just a part from prev. sentence
>> but I will add your suggestion for better clearness. Thanks for noticing
>> that!
>>
>>>
>>>> forms. Such an htinst would not be recognized as a pseudoinstruction and the
>>>> fault would be mistaken for an ordinary MMIO trap: Xen would fetch and
>>>> decode whatever instruction sepc happens to point at (unrelated to the
>>>> access which faulted) and emulate it against a guest physical address
>>>> derived from htval, which for an implicit access holds the address of a
>>>> VS-stage PTE rather than of any access the guest performed.
>>>>
>>>> Define all four values unconditionally instead, named after the access width
>>>> they encode rather than after the build's XLEN. On RV32 the 8-byte forms
>>>> simply never occur, so recognizing them costs nothing.
>>>>
>>>> Dropping the ladder loses no build-time coverage: a build for an XLEN other
>>>> than 32 or 64 already fails on the equivalent ladders in asm/asm.h and
>>>> asm/config.h, so no replacement #error is needed here. Adding one keyed on
>>>> CONFIG_RISCV_* would in any case re-introduce exactly the conflation this
>>>> patch removes.
>>>>
>>>> This diverges from the imported version of riscv_encoding.h.
>>>>
>>>> No functional change: the values have no user yet.
>>>>
>>>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>>>>
>>>> diff --git a/xen/arch/riscv/include/asm/riscv_encoding.h b/xen/arch/riscv/include/asm/riscv_encoding.h
>>>> index c63e5e3046..2d2e7e11b3 100644
>>>> --- a/xen/arch/riscv/include/asm/riscv_encoding.h
>>>> +++ b/xen/arch/riscv/include/asm/riscv_encoding.h
>>>> @@ -839,25 +839,17 @@
>>>>    #define INSN_MASK_FENCE_TSO		0xffffffff
>>>>    #define INSN_MATCH_FENCE_TSO		0x8330000f
>>>>    
>>>> -#if __riscv_xlen == 64
>>>> -
>>>>    /* 64-bit read for VS-stage address translation (RV64) */
>>>> -#define INSN_PSEUDO_VS_LOAD		0x00003000
>>>> +#define INSN_PSEUDO_VS_LOAD64		0x00003000
>>>>    
>>>>    /* 64-bit write for VS-stage address translation (RV64) */
>>>> -#define INSN_PSEUDO_VS_STORE	0x00003020
>>>> -
>>>> -#elif __riscv_xlen == 32
>>>> +#define INSN_PSEUDO_VS_STORE64		0x00003020
>>>>    
>>>>    /* 32-bit read for VS-stage address translation (RV32) */
>>>> -#define INSN_PSEUDO_VS_LOAD		0x00002000
>>>> +#define INSN_PSEUDO_VS_LOAD32		0x00002000
>>>>    
>>>>    /* 32-bit write for VS-stage address translation (RV32) */
>>>> -#define INSN_PSEUDO_VS_STORE	0x00002020
>>>> -
>>> Whole point of patch is these no longer depend on build XLEN, yet
>>> comments still say "(RV64)"/"(RV32)" which could be confusing. Maybe it
>>> should be better to indicate, as the spec does, that RV32 values are
>>> used when VSXLEN=32 (only sv32 paging mode) and RV64 values when
>>> VSXLEN=64 (sv39+ paging modes).
>>>
>>
>> Could you please clarify to me what in the spec it is?
> 
> It is the same table as you indicated below (but mine is Table 56, so it
> seems we don't have the same spec version, I'm using the version 20260120).
> 
> When I found unclear is that "RV32" or "RV64" alone is ambiguous,
> since host and guest can differ (e.g. RV64 host running an RV32 guest).
> Saying it depends on VSXLEN instead makes clear which one is meant.
> 
>>
>> This comments are just copy from the spec:
>>
>> Table 39. Special pseudoinstruction values for guest-page faults. The
>> RV32 values are used when VSXLEN=32, and the RV64 values when VSXLEN=64.
>> Value           Meaning
>> 0x00002000      32-bit read for VS-stage address translation (RV32)
>> 0x00002020      32-bit write for VS-stage address translation (RV32)
>>
>> Value           Meaning
>> 0x00003000      64-bit read for VS-stage address translation (RV64)
>> 0x00003020      64-bit write for VS-stage address translation (RV64)
>>
>> So the comments are just copy of "Meaning" column from the spec.
>>
>> And I think that Meaning column is fine here as we could have a case of
>> when hypervisor has XLEN=64 but guests could be on it RV32 and RV64 and
>> if a guest is RV32 (what means VSXLEN=32) then the comment above
>> defintion mean that we hav 32-bit read/write VS-stage address
>> translation for (RV32) guest and the similar is for RV64.
>>
>> Do I miss something? Is a comments make more sense now or I have to
>> still update them in some way?
>>
> I think it would be more clear to modify the comment by that:
> /* 32-bit read for VS-stage address translation (VSXLEN=32) */
> 
> But now with your explanation, your comment is more clear as it specify
> VS-stage address, so the guest. Feel free to adopt my version or not.
Agree your suggestion here will be more clear. I will apply it.

Thanks.

~ Oleksii

