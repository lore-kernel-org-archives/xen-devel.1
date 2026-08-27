Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6884C61DB9
	for <xen-devel@archiver.kernel.org>; Thu, 27 Aug 2026 16:07:48 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1401249.1637007 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzcdV-0005OV-CU; Thu, 27 Aug 2026 16:07:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1401249.1637007; Thu, 27 Aug 2026 16:07:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzcdV-0005OO-8W; Thu, 27 Aug 2026 16:07:29 +0000
Received: by outflank-mailman (input) for mailman id 1401249;
 Thu, 27 Aug 2026 16:07:27 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wzcdT-0005JX-Oz
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2026 16:07:27 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wzcdQ-00BwIY-VB
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2026 18:07:24 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a9060b4-8faa-0a2a0a5109dd-0a2a450cba8e-30
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 18:07:24 +0200
Received: from [209.85.128.45] (helo=mail-wm1-f45.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a9060bc-f479-0a2a450c0019-d155802db1e9-3
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 18:07:24 +0200
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-499ae1c6471so14884975e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 09:07:24 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49b49bd11c3sm60734465e9.7.2026.08.27.09.07.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Aug 2026 09:07:23 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1787846844; x=1788451644; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FRLim6j/feVuyl8Yxi6V/xN5B6NazHSdqReW1S+GAPo=;
        b=dwjaqkwhtV96YAqtAXwYJnHsXscMZrQKLyTZx/FnEVWy0ibyaGkADz1QYYPhNmbekl
         2HtOLNqBIaiNGymdRTwtwnv0va1jdp0BHdm6JfQjEeKCx9l9K+eH9SB5aWOFHap7Dmj5
         j+ygtj5+Zjize+awNK1wZlg9siilHwJpVZKvw8JHG5nojxwQVJj5OFj1w6xvp1vRrktN
         IzxZR3A2ccybUHfwDdyGz7D9eIDJJP9+HuW7Wuasvg6XwlJJWzGa0PnEbddodOYUD1SP
         lG/5Zt4YXym0bXt8IWD1b9BB2rFANSET+RMrFPsQTac7xa79/SrrE+QGr6kRmEoUdTzv
         021Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787846844; x=1788451644;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FRLim6j/feVuyl8Yxi6V/xN5B6NazHSdqReW1S+GAPo=;
        b=dxjWGiKYbTy3awayti3HojxVpPgjbZjZDHs1QS1pwGfH02R7ljwqZj4V/MirnRxqup
         Tqb2sAHjXC1s3+LQZfYT3YTT0mUIH8AkVjCJgVyYAh4IyXREhzFdb6blpZOFeO7mLBbr
         /hAn+0Bbw/agQHfJMPz7+HN+w8EUuwztVWuB+IEfwc78ZgyFtlIScpKD/0iNEPuaGQUz
         8o/OaC2rxuCcfJHb2OCYwkG0NL1VrtTw7LdypNimBcGKwzTj3BqJKfw/XieN9wo9ctUV
         22112obTcuTJaxRJAoc5vcyogoxyrAUyi3imalLWtRc0QulOpkVz0sIaq2TVT4BR4GU3
         MOGw==
X-Forwarded-Encrypted: i=1; AHgh+RrKUgXHy3mlGQfsRZnoLKrBkPyf741TvrjRNoQTgdsCT2kXnLxmzlJlSRyju7De1IIvIxYS7M1XGfw=@lists.xenproject.org
X-Gm-Message-State: AFuF++nm9kYqB+9igd6Vde4dGVtI7jPpwcyjDA0Bg42pNL0zMHyjaaXD
	+IQ2hUcPGrFaSbJqOYHl1lye+0rDa/bVqEUrmBOkTK7yAd4Cn+2N0UEg
X-Gm-Gg: AR+sD11Y0vuxtjuUFk53eVbr+YRXoOL56/IWYJ4fS7AqPIyaKbW6jvsaZF0kPG0iTqw
	Q3xP9SoQUcbV6Ww7xUnjoDfxi38sW0yI2mwnuL7KL7Vs+33OPodanpIGC9LF52rVIyWOJb4txoJ
	a/zE/BgD0Phsqr5k+8VkZ4RMH0qP5z2VK2wKk/miWAdk0CmQOQPorbDT/EMBZgQNt2mfh6cSdYs
	8MFi8TAcpesA++p7kt5Zk9mKiNbuMIKnxnZSr3e4SodgJx2lqdv5SBh2Dbe1X/q1joPnLW0qF6S
	t6/yqJLuLK9vXiq3PsIFVv4/FwJw/ZaFaR9FLOoTZBJJGiAtznQ3Rox6oterMLzfu1t1pxm7CPD
	tRO+2RO4z85ZIkhtg2h6X05kkOtgEN3xMte1VTLOg7gNFlsdWTj5kfE7R/v67VUCTHeXANKJ8iy
	Hp6+RJr0HZgQeVFiTuiw1a8ykFVl94sL/K8XWEzdux0Bz+K30ER42KjlDuRdtTZNokaFyKFAXu/
	2rAjRvIQ3RiujLXL3kzzeyOYH+APYbYJtf3hF6aJTuIX4akvp4oUg==
X-Received: by 2002:a05:600c:c4aa:b0:499:dbae:43d3 with SMTP id 5b1f17b1804b1-499dc71f023mr175886705e9.9.1787846844167;
        Thu, 27 Aug 2026 09:07:24 -0700 (PDT)
Message-ID: <e4652848-4923-49e1-ad2f-c3c46b8ce5d9@gmail.com>
Date: Thu, 27 Aug 2026 18:07:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 7/7] RISC-V: place .sdata / .srodata /
 .riscv.attributes
To: Jan Beulich <jbeulich@suse.com>
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
 <8eebbdd6-d414-49eb-83e6-668f187e6f93@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <8eebbdd6-d414-49eb-83e6-668f187e6f93@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d25034/1787846844-51B35A5B-07008E2C/10/73395122804
X-purgate-type: spam
X-purgate-size: 6120



On 8/27/26 5:56 PM, Jan Beulich wrote:
> On 27.08.2026 17:40, Oleksii Kurochko wrote:
>> On 8/26/26 2:04 PM, Jan Beulich wrote:
>>> Of the short-data sections, only .sbss is presently mentioned in the
>>> linker script. Place them next to, but ahead of their "normal" data
>>> sections.
>>>
>>> .riscv.attributes can go towards the tail of the image, next to (ahead of)
>>> debug info.
>>>
>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>> ---
>>> Seeing where .sbss lives, does positioning really not matter at all? I
>>> would have expected that short-data sections want to live close together,
>>> and specifically close to .text / .init.text (seeing that such data is
>>> accessed using AUIPC). I'm puzzled that the psABI doesn't even mention
>>> them, hence leaving it open how exactly they are to be used.
>>
>> It doesn't, and the reason is that the relevant proximity isn't to .text
>> but to __global_pointer$.
> 
> Anything like this still should be set forth by the psABI, so I don't
> quite understand your reply.
> 
>> The small-data sections exist to let a linker
>> script cluster small objects around that anchor so that ld's relaxation
>> pass can fold an auipc+load pair into a single gp-relative access (-+2
>> KiB window).
>>
>> That pass is keyed purely on the symbol being defined
>> riscv_global_pointer_value() returns 0 otherwise and the relaxation is
>> skipped. We define no __global_pointer$ and head.S never loads gp (it
>> appears only as a cpu_user_regs slot in entry.S), so every access stays
>> the medany auipc form regardless of section.
>>
>> I confirmed this by linking the same object twice (look at the script
>> below, with and without the symbol: without it, zero gp-relative
>> accesses; with it, the pairs collapse.
>>
>> Worth noting the relaxation is section-agnostic: in the test mentioned
>> below a 400-byte array in plain .bss got gp-relative too, purely because
>> it landed in range. So the sections are a clustering hint, not a
>> mechanism ld keys off.
> 
> Okay, fine, but what does this mean for placing the small data sections?
> I.e. what does this mean for the patch here (which really it shouldn't
> have been me to write in the first place)?

I just wnated to show that a position of .sbss doesn't really matter 
based on the example and so true for other .s* and not only .s* 
sections. What means I am okay with your suggested places in the current 
patch.


> 
>>> What remains to eliminate orphan section warnings is the placement of
>>> .note.GNU-stack (which perhaps wants dealing with on all of Arm, PPC, and
>>> RISC-V together, ideally unifying with x86) and (odd at the first glance,
>>> but dealt with on x86 as well, i.e. may again want unifying) that of a
>>> number of .rela.* sections.
>>>
>>> --- a/xen/arch/riscv/xen.lds.S
>>> +++ b/xen/arch/riscv/xen.lds.S
>>> @@ -44,6 +44,8 @@ SECTIONS
>>>    
>>>            BUGFRAMES
>>>    
>>> +        *(.srodata)
>>> +        *(.srodata.*)
>>>            *(.rodata)
>>>            *(.rodata.*)
>>>            VPCI_ARRAY
>>> @@ -92,6 +94,7 @@ SECTIONS
>>>            SCHEDULER_ARRAY
>>>            HYPFS_PARAM
>>>    
>>> +        *(.sdata .sdata.*)
>>>            *(.data .data.*)
>>>            CONSTRUCTORS
>>>        } :text
>>> @@ -162,6 +165,8 @@ SECTIONS
>>>        /* Section for the device tree blob (if any). */
>>>        .dtb : { *(.dtb) } :text
>>>    
>>> +    .riscv.attributes : { *(.riscv.attributes) } :text
>>> +
>>
>> Nit: .riscv.attributes is SHT_RISCV_ATTRIBUTES, i.e. non-alloc.
>> :text on it is misleading, and without an explicit address it gets
>> sh_addr from .(location counter) after .dtb. Could we use matching the
>> idiom used for every other non-alloc section in xen.lds.h:
>>     .riscv.attributes 0 : { *(.riscv.attributes) }
>> No functional difference either way (objcopy -O binary drops it, and I
>> verified a non-alloc output section doesn't advance dot, so nothing
>> downstream shifts), so purely consistency.
> 
> Well, I compare attributes rather with notes, which we make part of a
> segment (on x86 at least). I can drop the :text if it's that what's
> needed to get this in, but I'm not fully convinced. But my knowledge
> on the purpose and use of attributes also is still somewhat limited.

As I mentioned from functional point of view I don't think that it will 
be an issue so generally you could keep :text here.

That why I wrote "Nit:".

Reviewed-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

> 
>> Is dropping orphan-handling-y := from arch/riscv/Makefile the intended
>> end of this series?
> 
> It is the intended goal, but not by the end of this series.
> 
>> As if I understand correctly with such defintion we
>> will miss warning so everything of that will be missed:
>>
>> cd xen
>> riscv64-linux-gnu-ld -T arch/riscv/xen.lds prelink.o
>> --orphan-handling=warn -o /tmp/t.elf 2>&1 \
>>     | grep 'orphan section'
>> /usr/bin/riscv64-linux-gnu-ld: warning: orphan section `.note.GNU-stack'
>> from `prelink.o' being placed in section `.note.GNU-stack'
>> /usr/bin/riscv64-linux-gnu-ld: warning: orphan section `.rela.text' from
>> `prelink.o' being placed in section `.rela.dyn'
>> /usr/bin/riscv64-linux-gnu-ld: warning: orphan section `.rela.init.text'
>> from `prelink.o' being placed in section `.rela.dyn'
>> /usr/bin/riscv64-linux-gnu-ld: warning: orphan section
>> `.rela.data.read_mostly' from `prelink.o' being placed in section
>> `.rela.dyn'
>> /usr/bin/riscv64-linux-gnu-ld: warning: orphan section `.rela.init.data'
>> from `prelink.o' being placed in section `.rela.dyn'
>> /usr/bin/riscv64-linux-gnu-ld: warning: orphan section
>> `.rela.text.header' from `prelink.o' being placed in section `.rela.dyn'
> 
> Yes, if the override was dropped, these warnings would appear on every
> build. I thought that may not be wanted, hence the override I put in
> (really everywhere except for x86, where things were already tidied).

Thanks. Got you. It makes sense.

~ Oleksii

