Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8168DC79F82
	for <xen-devel@archiver.kernel.org>; Tue,  8 Sep 2026 09:34:42 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1411229.1641929 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x3sDj-0007St-Jp; Tue, 08 Sep 2026 09:34:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1411229.1641929; Tue, 08 Sep 2026 09:34:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x3sDj-0007Sm-H7; Tue, 08 Sep 2026 09:34:27 +0000
Received: by outflank-mailman (input) for mailman id 1411229;
 Tue, 08 Sep 2026 09:34:26 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1x3sDi-0007Sg-1c
 for xen-devel@lists.xenproject.org; Tue, 08 Sep 2026 09:34:26 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x3sDh-00GY4f-8A
 for xen-devel@lists.xenproject.org; Tue, 08 Sep 2026 11:34:25 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a9fd69c-8faa-0a2a0a5109dd-0a2a4509e0ba-26
 for <xen-devel@lists.xenproject.org>; Tue, 08 Sep 2026 11:34:25 +0200
Received: from [209.85.218.41] (helo=mail-ej1-f41.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a9fd6a1-be1a-0a2a45090019-d155da29b03f-3
 for <xen-devel@lists.xenproject.org>; Tue, 08 Sep 2026 11:34:25 +0200
Received: by mail-ej1-f41.google.com with SMTP id
 a640c23a62f3a-c2533d83e3bso754715066b.2
 for <xen-devel@lists.xenproject.org>; Tue, 08 Sep 2026 02:34:25 -0700 (PDT)
Received: from [172.19.143.248] (IW396200.net.t-com.hr. [195.29.234.54])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c26e956ea81sm376416966b.33.2026.09.08.02.34.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Sep 2026 02:34:23 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1788860065; x=1789464865; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jIXQVEUqa9D7i03beXcgoj5TiD/kN8vTM/UcnAY9lCs=;
        b=InxJHVkSRkPDv9aXQW763zbjTJ3RMhGjblRYYRgup2yMQk3x49BDsyYusT+yuhfTYp
         YIHDggYb6l7HJkOv3PuxD9FMPPFwM7D4wExZJQVUWF+933qtkunDehFs0NEpIQ2x35aI
         6Y0R6yz6fvENfQ1txHUS5DzAx9RA4nHuWrnd9ZKgNITvQfC8OjP8gcZDnKgg4sJ3Odwr
         YhuHDBjWCeMD5j14Z17RpCxaX0s9yRU+n7f1BSc5JtkUk7kZEn6YulJZHNYhwGF88ZaN
         1VOzWSDuBL8M2PFI1tPrWNngYA3g6bL7z/P3Lu+z/uXRLp+nltXvKvut37kD+oOmDRu4
         ZRpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788860065; x=1789464865;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jIXQVEUqa9D7i03beXcgoj5TiD/kN8vTM/UcnAY9lCs=;
        b=Orz0xg6U2J4PKWVKPMygxl65Aj7oJtXNnOOJs+bzs/AkEuXK8SYt1RTcUEnOztgIF1
         Bg+8lz6RJVS6ARykEKNJdeCIY56RU2zyDe8dtlnEvuqiAj7/crF9tqUfQ5rtS/etfE2/
         9pmi+SUY2ff4/MSUGtsHJ/wh2gZPT7/CIn5+figp4slJDE1BD7h/hpr8c8dN25yvxeub
         lh7JulGV+KtFYnSTjSY+r8REpswzW99SXJbHEMrK9DKHAlvbrp+MuVCdRmYIkRS5nRFm
         HQQ7nr0ZpHy0RK314DTEIbajRnrfPtD+a++2Y1dtnuUYsWtM144g2eorCQR+WkHrfDyS
         MVdg==
X-Gm-Message-State: AFuF++lWMjlZTtbIqfIu+Zxog47jSPvWyFTeKUTfluQ5TEXA3x9oF38h
	qDQpvyOiW7wfMhXi0jJclRLnVCuuNEKSaubeaBwNsK/7+sm7ItjwzUZt
X-Gm-Gg: AYBFou3+h3jICC9wQ+H0YZyxL167fKxy1ArLafPS2eVZ8dAZYqYAY1H2lkp6C0R+Efb
	SWBkJ4Y1hYQvg2Phq/U5sQGSxodjbDsA/T+7m4tnV2l6ujG5LUxKOxxGAG9SV55dOsxtL8C8cYG
	242uN7b0yUNQ/XTqC4v4so/cPStKzFTWzxdjkmYrGSKQvwB0LRm19aNPKZsM4JKiIztel6Hr0Tq
	5GcpY2VixzrWMqmRFEPRks69DSOFH+78CGrxyZArQnbvf/tLLTrSsAT8zOwYgXpj5igBNCC0ZIZ
	p4KlSlEjQ3JflR0ipd9GTZQcxnXPQ4xeRthjZ2BP8yTrlipJ9fURbHVbgmPTs1GXbJ4x3w6za67
	ZJ98aJJtT8vZl2Q3YS7bpxD/dKF+YeAJbjIGWMb2xJRxboKfykvZKz1tO7cfUS/YXgNzlypT+ep
	PNkqOaqSzWQyzlP781xCHGJJUAR3zomBHeeMiN/h5lfYQER0rLaymJRdhPQlbaIdQwPnG5R+hiz
	4KV2bBdPdU4NHbQVbzMkQ==
X-Received: by 2002:a17:907:1c25:b0:c26:337e:7e05 with SMTP id a640c23a62f3a-c26337ea2f5mr1272648166b.4.1788860064524;
        Tue, 08 Sep 2026 02:34:24 -0700 (PDT)
Message-ID: <9a7dea59-be4a-4dbd-9935-f48e24adc009@gmail.com>
Date: Tue, 8 Sep 2026 11:34:20 +0200
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
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <1788796633.8631fc262581453bbf619ec5b2062170.1a07c9682ec000c4f3@vates.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-bad1c0/1788860065-3BCD7034-BE982E63/10/73395122804
X-purgate-type: spam
X-purgate-size: 4721



On 9/7/26 5:57 PM, Baptiste Le Duc wrote:
>> htinst reports a pseudoinstruction when a guest page fault is taken on an
>> implicit memory access done for VS-stage address translation. Four such
>> values are defined, differing in the access type (read or write) and in the
>> access width: 4 bytes (0x2000/0x2020) or 8 bytes (0x3000/0x3020).
>>
>> That width is the width of a VS-stage PTE, i.e. it follows the guest's
>> paging mode (4 bytes for Sv32, 8 bytes for Sv39 and wider) and has nothing
>> to do with the XLEN Xen itself is built for. Selecting just one pair with
>> where a guest running with VSXL=32 and Sv32 in vsatp produces the 4-byte
> Sentence is broken. Guess you mean "Selecting just one pair based on Xen's XLEN misses the case where
> …".

Likely it is becuase of my low level English but it seems that original 
version wast okay and what you added is just a part from prev. sentence 
but I will add your suggestion for better clearness. Thanks for noticing 
that!

> 
>> forms. Such an htinst would not be recognized as a pseudoinstruction and the
>> fault would be mistaken for an ordinary MMIO trap: Xen would fetch and
>> decode whatever instruction sepc happens to point at (unrelated to the
>> access which faulted) and emulate it against a guest physical address
>> derived from htval, which for an implicit access holds the address of a
>> VS-stage PTE rather than of any access the guest performed.
>>
>> Define all four values unconditionally instead, named after the access width
>> they encode rather than after the build's XLEN. On RV32 the 8-byte forms
>> simply never occur, so recognizing them costs nothing.
>>
>> Dropping the ladder loses no build-time coverage: a build for an XLEN other
>> than 32 or 64 already fails on the equivalent ladders in asm/asm.h and
>> asm/config.h, so no replacement #error is needed here. Adding one keyed on
>> CONFIG_RISCV_* would in any case re-introduce exactly the conflation this
>> patch removes.
>>
>> This diverges from the imported version of riscv_encoding.h.
>>
>> No functional change: the values have no user yet.
>>
>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>>
>> diff --git a/xen/arch/riscv/include/asm/riscv_encoding.h b/xen/arch/riscv/include/asm/riscv_encoding.h
>> index c63e5e3046..2d2e7e11b3 100644
>> --- a/xen/arch/riscv/include/asm/riscv_encoding.h
>> +++ b/xen/arch/riscv/include/asm/riscv_encoding.h
>> @@ -839,25 +839,17 @@
>>   #define INSN_MASK_FENCE_TSO		0xffffffff
>>   #define INSN_MATCH_FENCE_TSO		0x8330000f
>>   
>> -#if __riscv_xlen == 64
>> -
>>   /* 64-bit read for VS-stage address translation (RV64) */
>> -#define INSN_PSEUDO_VS_LOAD		0x00003000
>> +#define INSN_PSEUDO_VS_LOAD64		0x00003000
>>   
>>   /* 64-bit write for VS-stage address translation (RV64) */
>> -#define INSN_PSEUDO_VS_STORE	0x00003020
>> -
>> -#elif __riscv_xlen == 32
>> +#define INSN_PSEUDO_VS_STORE64		0x00003020
>>   
>>   /* 32-bit read for VS-stage address translation (RV32) */
>> -#define INSN_PSEUDO_VS_LOAD		0x00002000
>> +#define INSN_PSEUDO_VS_LOAD32		0x00002000
>>   
>>   /* 32-bit write for VS-stage address translation (RV32) */
>> -#define INSN_PSEUDO_VS_STORE	0x00002020
>> -
> Whole point of patch is these no longer depend on build XLEN, yet
> comments still say "(RV64)"/"(RV32)" which could be confusing. Maybe it
> should be better to indicate, as the spec does, that RV32 values are
> used when VSXLEN=32 (only sv32 paging mode) and RV64 values when
> VSXLEN=64 (sv39+ paging modes).
> 

Could you please clarify to me what in the spec it is?

This comments are just copy from the spec:

Table 39. Special pseudoinstruction values for guest-page faults. The 
RV32 values are used when VSXLEN=32, and the RV64 values when VSXLEN=64.
Value           Meaning
0x00002000      32-bit read for VS-stage address translation (RV32)
0x00002020      32-bit write for VS-stage address translation (RV32)

Value           Meaning
0x00003000      64-bit read for VS-stage address translation (RV64)
0x00003020      64-bit write for VS-stage address translation (RV64)

So the comments are just copy of "Meaning" column from the spec.

And I think that Meaning column is fine here as we could have a case of 
when hypervisor has XLEN=64 but guests could be on it RV32 and RV64 and 
if a guest is RV32 (what means VSXLEN=32) then the comment above 
defintion mean that we hav 32-bit read/write VS-stage address 
translation for (RV32) guest and the similar is for RV64.

Do I miss something? Is a comments make more sense now or I have to 
still update them in some way?

Thanks!

~ Oleksii



