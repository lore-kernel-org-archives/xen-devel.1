Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA10DC61DB9
	for <xen-devel@archiver.kernel.org>; Thu, 27 Aug 2026 15:56:38 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1401231.1636990 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzcSs-0005q2-7Q; Thu, 27 Aug 2026 15:56:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1401231.1636990; Thu, 27 Aug 2026 15:56:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzcSs-0005pq-2e; Thu, 27 Aug 2026 15:56:30 +0000
Received: by outflank-mailman (input) for mailman id 1401231;
 Thu, 27 Aug 2026 15:56:28 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wzcSq-0005ck-O4
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2026 15:56:28 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wzcSq-003T5w-4i
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2026 17:56:28 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a905e20-2eae-0a2a0a5409dd-0a2a450886a0-24
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 17:56:27 +0200
Received: from [209.85.128.52] (helo=mail-wm1-f52.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a905e2b-f659-0a2a45080019-d1558034e04f-3
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 17:56:27 +0200
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-49b8e527d63so6730925e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 08:56:27 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49b8d2ba486sm38337815e9.5.2026.08.27.08.56.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Aug 2026 08:56:26 -0700 (PDT)
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
        d=suse.com; s=google; t=1787846187; x=1788450987; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HHEE/gXyj0DP9lcj+bQ/1E1HsxUUYdXKZoMB8d/ktNU=;
        b=d2PzyySTh5TsBvo9Xc61FQbX2iudkePTm6WK1qTqLIu4ZW+m6i8A/RG/DOrcosnSa1
         ZtJSQhc6FbH33YD70orFxeqotB+9Mom2Czgz4mu49s60VlPyliV5DXTLyBawPOVuCKKN
         RHp3DaN3oiQxHLmLP2UGU/dK1CajRHakRMy8SCdYFhqHtacfEJEtHoqOvFBFaD3jObz0
         zMnfa0tiwJt2RvIsV2f6NOzYiuxO7qvTCpsH/U7sHpKio8+IThSHUoOwBepAQbkgP2+j
         FlUvSRZJfkM3pC8fFinVexHa7Yf6APm6qkYaiX0b4Ab2Rz0ehVdc3hWYq2pVoW9VJljV
         eScw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787846187; x=1788450987;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HHEE/gXyj0DP9lcj+bQ/1E1HsxUUYdXKZoMB8d/ktNU=;
        b=nEc7/bFoftvLAWTFXE+BZCZDK+zVqBz75sn0V6smsaRPuFn6HqDNXCNfm1zLv24j9o
         UXfzEyC9CQpBB/ybPfqkNGrYH7UCExw5PzoLaf7T6n/hE/Os/0HgEorh8HYfQIC2im24
         VWm3qsuSys/0j1RdCOYrKt5oCf/mxxptAg2APkFVStY0eVxEPxRi81kAJmxFjgPgVNel
         qd5SrJjxrpPY4KVTxyNsZyOwjnS4+d8fLtYJxOqLM1xbSOfoKM++z1VELOBK4zBSKWpU
         JJA+HW8mQoNC6UuUnrmWCt8h68ISX07eQYC9fjAsXXBYa7/bDgtSZnGElJsrnrh8jVB+
         AphQ==
X-Forwarded-Encrypted: i=1; AHgh+RqkIR9+A0C22BXdOSe6OizusBdnlJH+Ironlm/a8aM1CLBolFeNZcus/wpXPEtFpJD3c4ryjzmemjI=@lists.xenproject.org
X-Gm-Message-State: AFuF++k3ij4qZO/l8JeFtYUNheRzo5YCdNRVVh9/FHuJ0vEScqdthrIF
	uIdnyK28AYJAI4WCVAmBiWtpc/2C2OCxA+x+sOO54sSTJQc02srcFWb3YgXQAmJvEw==
X-Gm-Gg: AR+sD10KNvbSLOHP9T2K3LraVjDjF8E8eC0WtOVkqDjeAT5eechuUQYi69+o73jpJFG
	tjK/17bFISpmqxUkVNiuog0sDGyYyhmwmzN67KAGNpZpCFcwE79CZeubncXyOFhVaxH5GJwV/35
	hNhnc2LTMgTW3O4o61jRWyUkln5+3vHXZ6Cax/6Te8hPygWZ723gzPmC3npLFzO+h1QUmfOqwnN
	jjdON+UL4xaRYguzsn1USOjclnkWYZGp8FpLe7QlWJ0JfxeQS6f28kgZvJw7+VMsC/wLYzx/wJi
	vdPq0sm28VpsZVCaRTb2RW1/2IsaZO8wZZzqHBLXNDqvcKIsny8H2gVnERyvugdIGAjsV/JeX4H
	gEfDZq/X/QCCGIpIVegohP85nE18av+pa8mT6i9xYjOl7hJGCBdwK1gWowPcZ5Yt9eEhR2nkzUc
	Wzsb0Nqw5ivbE6bLRQ4+WkLh7deXATv52MslGt7toLs+WTFfe5bIJMlXxzze1kEvTD1b+jAGFFs
	ajju+scb6bUH/03mmwUqlQD7BbJNAO2IEawj/MrKC29qDn0iWdO
X-Received: by 2002:a05:600c:8518:b0:499:be2d:c290 with SMTP id 5b1f17b1804b1-499dc720ae9mr234254945e9.9.1787846187319;
        Thu, 27 Aug 2026 08:56:27 -0700 (PDT)
Message-ID: <8eebbdd6-d414-49eb-83e6-668f187e6f93@suse.com>
Date: Thu, 27 Aug 2026 17:56:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 7/7] RISC-V: place .sdata / .srodata /
 .riscv.attributes
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <9a78fdea-08ba-4e04-bfa1-ba09730a300b@suse.com>
 <f26f80e3-0b2d-429a-895c-b8003d1c5a38@suse.com>
 <0d0c6a5b-94a5-49c6-a150-3bb6a0dc3b93@gmail.com>
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
In-Reply-To: <0d0c6a5b-94a5-49c6-a150-3bb6a0dc3b93@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c1860d/1787846187-D674387B-F37BB47A/0/0
X-purgate-type: clean
X-purgate-size: 5458

On 27.08.2026 17:40, Oleksii Kurochko wrote:
> On 8/26/26 2:04 PM, Jan Beulich wrote:
>> Of the short-data sections, only .sbss is presently mentioned in the
>> linker script. Place them next to, but ahead of their "normal" data
>> sections.
>>
>> .riscv.attributes can go towards the tail of the image, next to (ahead of)
>> debug info.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> Seeing where .sbss lives, does positioning really not matter at all? I
>> would have expected that short-data sections want to live close together,
>> and specifically close to .text / .init.text (seeing that such data is
>> accessed using AUIPC). I'm puzzled that the psABI doesn't even mention
>> them, hence leaving it open how exactly they are to be used.
> 
> It doesn't, and the reason is that the relevant proximity isn't to .text 
> but to __global_pointer$.

Anything like this still should be set forth by the psABI, so I don't
quite understand your reply.

> The small-data sections exist to let a linker 
> script cluster small objects around that anchor so that ld's relaxation 
> pass can fold an auipc+load pair into a single gp-relative access (-+2 
> KiB window).
> 
> That pass is keyed purely on the symbol being defined 
> riscv_global_pointer_value() returns 0 otherwise and the relaxation is 
> skipped. We define no __global_pointer$ and head.S never loads gp (it 
> appears only as a cpu_user_regs slot in entry.S), so every access stays 
> the medany auipc form regardless of section.
> 
> I confirmed this by linking the same object twice (look at the script 
> below, with and without the symbol: without it, zero gp-relative 
> accesses; with it, the pairs collapse.
> 
> Worth noting the relaxation is section-agnostic: in the test mentioned 
> below a 400-byte array in plain .bss got gp-relative too, purely because 
> it landed in range. So the sections are a clustering hint, not a 
> mechanism ld keys off.

Okay, fine, but what does this mean for placing the small data sections?
I.e. what does this mean for the patch here (which really it shouldn't
have been me to write in the first place)?

>> What remains to eliminate orphan section warnings is the placement of
>> .note.GNU-stack (which perhaps wants dealing with on all of Arm, PPC, and
>> RISC-V together, ideally unifying with x86) and (odd at the first glance,
>> but dealt with on x86 as well, i.e. may again want unifying) that of a
>> number of .rela.* sections.
>>
>> --- a/xen/arch/riscv/xen.lds.S
>> +++ b/xen/arch/riscv/xen.lds.S
>> @@ -44,6 +44,8 @@ SECTIONS
>>   
>>           BUGFRAMES
>>   
>> +        *(.srodata)
>> +        *(.srodata.*)
>>           *(.rodata)
>>           *(.rodata.*)
>>           VPCI_ARRAY
>> @@ -92,6 +94,7 @@ SECTIONS
>>           SCHEDULER_ARRAY
>>           HYPFS_PARAM
>>   
>> +        *(.sdata .sdata.*)
>>           *(.data .data.*)
>>           CONSTRUCTORS
>>       } :text
>> @@ -162,6 +165,8 @@ SECTIONS
>>       /* Section for the device tree blob (if any). */
>>       .dtb : { *(.dtb) } :text
>>   
>> +    .riscv.attributes : { *(.riscv.attributes) } :text
>> +
> 
> Nit: .riscv.attributes is SHT_RISCV_ATTRIBUTES, i.e. non-alloc.
> :text on it is misleading, and without an explicit address it gets 
> sh_addr from .(location counter) after .dtb. Could we use matching the 
> idiom used for every other non-alloc section in xen.lds.h:
>    .riscv.attributes 0 : { *(.riscv.attributes) }
> No functional difference either way (objcopy -O binary drops it, and I 
> verified a non-alloc output section doesn't advance dot, so nothing 
> downstream shifts), so purely consistency.

Well, I compare attributes rather with notes, which we make part of a
segment (on x86 at least). I can drop the :text if it's that what's
needed to get this in, but I'm not fully convinced. But my knowledge
on the purpose and use of attributes also is still somewhat limited.

> Is dropping orphan-handling-y := from arch/riscv/Makefile the intended 
> end of this series?

It is the intended goal, but not by the end of this series.

> As if I understand correctly with such defintion we 
> will miss warning so everything of that will be missed:
> 
> cd xen
> riscv64-linux-gnu-ld -T arch/riscv/xen.lds prelink.o 
> --orphan-handling=warn -o /tmp/t.elf 2>&1 \
>    | grep 'orphan section'
> /usr/bin/riscv64-linux-gnu-ld: warning: orphan section `.note.GNU-stack' 
> from `prelink.o' being placed in section `.note.GNU-stack'
> /usr/bin/riscv64-linux-gnu-ld: warning: orphan section `.rela.text' from 
> `prelink.o' being placed in section `.rela.dyn'
> /usr/bin/riscv64-linux-gnu-ld: warning: orphan section `.rela.init.text' 
> from `prelink.o' being placed in section `.rela.dyn'
> /usr/bin/riscv64-linux-gnu-ld: warning: orphan section 
> `.rela.data.read_mostly' from `prelink.o' being placed in section 
> `.rela.dyn'
> /usr/bin/riscv64-linux-gnu-ld: warning: orphan section `.rela.init.data' 
> from `prelink.o' being placed in section `.rela.dyn'
> /usr/bin/riscv64-linux-gnu-ld: warning: orphan section 
> `.rela.text.header' from `prelink.o' being placed in section `.rela.dyn'

Yes, if the override was dropped, these warnings would appear on every
build. I thought that may not be wanted, hence the override I put in
(really everywhere except for x86, where things were already tidied).

Jan

