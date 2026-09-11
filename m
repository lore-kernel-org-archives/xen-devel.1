Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D13A4C88E4D
	for <xen-devel@archiver.kernel.org>; Fri, 11 Sep 2026 12:57:10 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1416627.1645595 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x50oN-0000we-Kz; Fri, 11 Sep 2026 12:56:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1416627.1645595; Fri, 11 Sep 2026 12:56:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x50oN-0000wX-Fz; Fri, 11 Sep 2026 12:56:59 +0000
Received: by outflank-mailman (input) for mailman id 1416627;
 Fri, 11 Sep 2026 12:56:57 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1x50oL-0000wP-BS
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2026 12:56:57 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x50oK-00E9pL-OU
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2026 14:56:56 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6aa3fa7f-8faa-0a2a0a5109dd-0a2a4502c0be-40
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 14:56:56 +0200
Received: from [209.85.208.44] (helo=mail-ed1-f44.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6aa3fa98-6ca4-0a2a45020019-d155d02ce0d0-3
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 14:56:56 +0200
Received: by mail-ed1-f44.google.com with SMTP id
 4fb4d7f45d1cf-6a20319d030so1333898a12.2
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 05:56:56 -0700 (PDT)
Received: from [172.19.143.248] (IW396200.net.t-com.hr. [195.29.234.54])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c2966022298sm75617566b.17.2026.09.11.05.56.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Sep 2026 05:56:55 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1789131416; x=1789736216; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FyjXMl5Q8kG/H2J4L7UK8gHoWxwkk2OabczX9ehfwRw=;
        b=NqHg8GHn18tYIgtZ8Dn/5fOH0LLriEeuVGdWd7iaTpD80JP7fI7ZyBXr2jPalm8rxl
         RECFI+8kSUIBZkrv6x8WKxNCsy1pKnNuQ9Zfvq5EkuLJNtz48zd+cZSvW+BE+VvKZDrd
         Ei0pX7Q+TusFSMf5EoFL1cY95Zmm1Wiz10MB/2gCop7b29Qd3nEOH0bttrKJxH81ctJx
         cnvi50mM8yeRKvcS6DElepEa7Kr4nO+Kv5/yd7Yii6ogJTg3+WDMb5Kq/PDyVVL48a3J
         5kFJjataH3V1JoRIxAPG8KOBIrh0S3OVq/KH1Al9pzl03pHtp/i8A0TweLH/Bxi/zkcA
         iA6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789131416; x=1789736216;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FyjXMl5Q8kG/H2J4L7UK8gHoWxwkk2OabczX9ehfwRw=;
        b=bVUmWDh7wrncsP4DLHHD3Q+FLgjRIPdmXVg2zcHaqS43JD7vggiHyQ/z9689WY3jUm
         iRdJvoP2B1eRjosuz9rTaxg6iWpIO9Y2haoY1G3k2sOCDoQv7hjfUquFnjxbnqucowYR
         NXpruM/Xom2jzsEvJqtpvAvB+a8arhUZW84dGI6o2qFjJ2hGne0ethDlIUunygN5MhIn
         5JbDEjsHPpE1WOIMPaHmyeRePFG8C1zgiM27LyLV2vwxs63ansW+ifeXcjEjw9cB0IS4
         x18MFPUCVgYWsvtnSuUl7Y000XtrfgYsJQ/inLjgGz7sqxMsj6pKs41Lt1xQnh7lSacT
         tRrA==
X-Gm-Message-State: AFuF++muR03xykoOnxfewkI8IvO+wA2mjakMdQ1bOSLB+ojOcDPUUko/
	nVN8TcjTzEpyugNzSNSgzOj0mT9HHSOALUzaiVisw/T7IHBaHj/nloUY
X-Gm-Gg: AYBFou3gESevI2Jyiapw9B3MAsZMhblitwDOuvRojtuNrUDTPoNvZSxOt0Grj9vUxPR
	i/9qvD5gmXEXRomsyA1+2rGtHXRR9T7W5oNOJ6JtkGjuX9XgYw+nhV+WCKQDwPeLGTYnJ39Zf12
	RimMP/+1UeBGOjAw0dHRsHD453webHFtIC+CCOA+42ydotfiEFi3Ag90/Q2B60WCAf2c3e4EFX7
	/YCL5BSeE7DqF7qMoEwmmx6E5gTNgkBeC8dH4I15pLrHcCpq6zGyxQ6B1zzRVo9IN2HNCUtmZy3
	XIis8NhkG3mp7koGXUkQCgMF1BPnHpzs+2ZGf4fbVwI4RsIzUihyNfDSFTf35+TN4KSKKAHNHoG
	Dbam78KcJ6t38YJfbxxjUeZpsxkJInDaxZClCOYulog1K+6V/mImApeIm2N0/SGUf2s3b6ZyEw4
	tX2HAoHreaMAEryBvTZQQhVmGgaMmrGe28RLbi6IkfpTPKzX79vyhzwqmXqihWEfs5uAnsq5KSP
	YJr1cBe3JBWn1qm4XKh5q3X81P+LXeP
X-Received: by 2002:a17:906:6a0a:b0:c20:1c9d:8d4b with SMTP id a640c23a62f3a-c2966535268mr176537766b.2.1789131416018;
        Fri, 11 Sep 2026 05:56:56 -0700 (PDT)
Message-ID: <42ea4b01-422f-436f-b7bc-8b4f31283386@gmail.com>
Date: Fri, 11 Sep 2026 14:56:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 21/39] xen/riscv: resolve the faulting guest physical
 address
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
 <c7975a131c229c721b2d4fe81c13fecd8deb4329.1787838835.git.oleksii.kurochko@gmail.com>
 <1788955499.8631fc262581453bbf619ec5b2062170.1a0860e9a70000c4f3@vates.tech>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <1788955499.8631fc262581453bbf619ec5b2062170.1a0860e9a70000c4f3@vates.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-720697/1789131416-F0EA32AC-B3F1F23A/10/73395122804
X-purgate-type: spam
X-purgate-size: 5435



On 9/9/26 2:04 PM, Baptiste Le Duc wrote:
>> Take the guest physical address from htval and stval: on a guest-page fault
>> htval holds it shifted right by 2, so that an address wider than XLEN fits,
>> and stval holds the faulting guest virtual address, whose two least
>> significant bits are those of the guest physical address. The shift is done
>> on paddr_t rather than on the raw register: a guest physical address is 34
>> bits wide on RV32 with Sv32x4, so shifting an XLEN-wide value would drop its
>> top two bits.
>>
>> Those two low bits come from stval only for a fault on an explicit access.
>> Where one is taken on an implicit access made for VS-stage translation htval
>> holds the address of the VS-stage PTE which could not be read, while stval
>> still holds the guest virtual address which started the walk, and the low
>> bits of the address written to htval are zero instead. htinst tells the two
>> apart, which is what the spec points at it for.
>>
> I'd just precise (the spec is also not clear on this point though), what
> is "current XLEN" here, clearly indicate that htval holds the GPA >> 2 and

My understanding was that "current XLEN" == hypervisor XLEN as htval is 
hypervisor register and has HSXLEN size so it was okay for me to have 
just XLEN in the original commit message. But I am okay to use your 
suggestion ...

> stval holds VGA and also put the two different cases we need to
> distinguish clearly:
> ```
> Recover the guest physical address from htval and stval. On a guest-page
> fault to hypervisor, htval holds the guest physical address shifted
> right by 2, so that an address wider than HSXLEN fits, and stval holds

... here.

> the faulting guest virtual address. The shift is done on paddr_t rather
> than on the raw register: a guest physical address is 34 bits wide on
> RV32 with Sv32x4, so shifting an XLEN-wide value would drop its top two
> bits.
> 
> However, there are two cases to distinguish when recovering the
> faulting GPA:
>      - Explicit memory access: we use the two least significant bits of
>      stval, which are the same as those of the guest physical
>      address.
>      - Implicit memory access for VS-stage translation: the two least
>      significant bits of htval are zero.

The original phrasing "the two least significant bits of htval are zero" 
is inaccurate for the following reasons:
- htval holds a shifted address (GPA >> 2): The htval CSR stores the 
faulting Guest Physical Address (GPA) shifted right by 2 bits. As a 
result, the two least significant bits of htval (htval[1:0]) actually 
correspond to bits 2 and 3 of the original GPA (GPA[3:2]).

- htval bits are not guaranteed to be zero: Implicit memory accesses 
during VS-stage address translation fetch PTEs that are 4-byte aligned 
(Sv32) or 8-byte aligned (Sv39/Sv48/Sv57). Since PTEs can reside at 
offsets like 0x04, 0x08, or 0x0C, GPA (and therefore htval[1:0]) can be 
non-zero.

- What is actually guaranteed to be zero: Because all VS-stage PTE 
accesses are at least 4-byte aligned, it is the lowest two bits of the 
unshifted Guest Physical Address (GPA[1:0]) that are guaranteed to be 
00, not the low bits of htval.

So here I think we want to clarify then:
```
Implicit memory access for VS-stage translation: the two least 
significant bits of the guest physical address (GPA[1:0]) are zero
```

> 
> These two cases can be distinguished using the value provided in
> register htinst.
> ```
>>
>> stval needs no check against an ISA extension: a guest-page fault writes it
>> with the faulting guest virtual address regardless. Sstvala would not be the
>> right thing to test for either (it covers stval across every trap type
>> which writes it, a wider guarantee than what is needed here).
>>
>> htval does need one. The H extension lets an implementation write it with
>> either the faulting address or zero, so without Shtvala a zero htval cannot
>> be told apart from a genuine fault on guest physical address 0-3, and the
>> address has to be recovered by decoding the access and walking the VS-stage
>> page tables in software instead. That is left as a TODO, and until it is
>> written such hardware panics rather than acting on an address which may not
>> be the one which faulted.
>>
>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>>
>> diff --git a/xen/arch/riscv/emulate.c b/xen/arch/riscv/emulate.c
>> index f9da075104..ff530ef2df 100644
>> --- a/xen/arch/riscv/emulate.c
>> +++ b/xen/arch/riscv/emulate.c
>> @@ -9,6 +9,7 @@
>>   #include <xen/sched.h>
>>   #include <xen/types.h>
>>   
>> +#include <asm/cpufeature.h>
>>   #include <asm/csr.h>
>>   #include <asm/current.h>
>>   #include <asm/emulate.h>
>> @@ -62,10 +63,28 @@ static bool htinst_is_pseudo(unsigned long htinst)
>>       }
>>   }
>>   
>> -/* Reconstruct the guest physical address of the access which faulted. */
>> +/* Resolves the guest physical address the access faulted on into @gf->gpa. */
> Why did you change the comment apart for adding @gf->gpa? I think the
> "reconstruct" is more clear but there might be another reason why you
> changed it.
> 

I thought that it will just a little bit clearer (and anyway it should a 
part of another patch...) so I will revert the change here and go with 
"reconstruct".

Thanks.

~ Oleksii


