Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 417CCC624D0
	for <xen-devel@archiver.kernel.org>; Wed,  2 Sep 2026 10:48:56 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1405636.1639100 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1iW6-0003dz-1h; Wed, 02 Sep 2026 10:48:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1405636.1639100; Wed, 02 Sep 2026 10:48:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1iW5-0003ds-U7; Wed, 02 Sep 2026 10:48:29 +0000
Received: by outflank-mailman (input) for mailman id 1405636;
 Wed, 02 Sep 2026 10:48:28 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1x1iW4-0003dm-Aj
 for xen-devel@lists.xenproject.org; Wed, 02 Sep 2026 10:48:28 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x1iW3-00BEup-FT
 for xen-devel@lists.xenproject.org; Wed, 02 Sep 2026 12:48:27 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a97feec-bab6-0a2a0a5309dd-0a2a450ca710-38
 for <xen-devel@lists.xenproject.org>; Wed, 02 Sep 2026 12:48:27 +0200
Received: from [209.85.221.44] (helo=mail-wr1-f44.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a97fefb-f479-0a2a450c0019-d155dd2ca5e4-3
 for <xen-devel@lists.xenproject.org>; Wed, 02 Sep 2026 12:48:27 +0200
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-4843e397f74so1016270f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 02 Sep 2026 03:48:27 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48448eea5b4sm5671255f8f.27.2026.09.02.03.48.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Sep 2026 03:48:26 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1788346107; x=1788950907; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UrTdGaKXlidG9RJ8fjMxVtiHLx/JZHJeCLEosI7fpFk=;
        b=Tda/EHCyY5i52uoYLoaACUyzQm25nC5iGmujAMhpDbhzMDQkd6PZIGDlN6ThZ8ceFH
         +nGZ7c3xOstrIZJgp5EFBq2//cTEiE/AgsxDdmUwbNdS52xwwExTrMRPBXJbfchYPg+S
         FZC+CKCMPwnP1e3evvaWZooRh9hVEopijt/L1wvHeurLjEqmuK1udSm0yHZ4/PyCbhMY
         0w/YyYc+kyMRY4VZDMmB3U8Av2BN2QGDunawJdvsB33OEJvnBWwQCaLYRNxPglZI/j8P
         MOmXoXxf1XCeEJDrGS73Wnw0ZI3wy0T7IfGSWF1wNBEerXX59eRYYamcY5UJCdQjW1+Y
         bj3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788346107; x=1788950907;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UrTdGaKXlidG9RJ8fjMxVtiHLx/JZHJeCLEosI7fpFk=;
        b=aeKsBDc67kW7wKIboVtWMLZ+uoYicCGccwECSsrKn+MZROWIeM0wDfYbxKu2msWAcH
         BxfVZDMzoirtxHVMcSy/xQKFp76vgmz8uxm8UJKnXtMY8kU3D/suq0dOmdVpjQqsrjMe
         QY0LWb0ekJt9p6pd1jEzbVl9IgF0uqnwXqpXmNyuQxzk4ZnKfFC/k6Josr5BT572EKjk
         IBc63e0RT7Nq6jfOpxNpgo5bhT5qIYUN4zQ2klTwLF8B+xQjDQ0iQM6GIFOsLwLOoHS/
         V9mleGACYsAxLagueL7hrI+NUK858WxGekk0RYW+pZJg4Xkq8JKVvhFoiuGpJL/y7qaA
         76tg==
X-Forwarded-Encrypted: i=1; AKwUvBwkTdzfL/Kx/MoNgSwgLY1kcRhYxrXg5LrSHBQ7Bn7xrI+zEeSCRK9d2LyzUJRfpHHk2olgshop43s=@lists.xenproject.org
X-Gm-Message-State: AFuF++lTEKxi5jxUYRX5o+kfu/6jMkZMl3JtIo+mfAx7RXobQWKXl/hD
	zpxI0tz4nUOSStvGIKEy8y9ACpgfxR0YbBaTiRKlJh6zbnjFkgbD2G1k
X-Gm-Gg: AYBFou3J7dzInwrj0F/JaN6odWevtxV9mF2eB8+tYz0Bym/uFmtbCkLcc3Ei7avdqu3
	ygV6es+UYAowGqfnlTpJ5tx+ns558sE169lQ6Unxj+X5YJ+xLkLjdxZxeAzeL17BBgqPfOGKIFz
	DzpMRW/bI+Bit9ZvFrdYxB3USPIwNeFyCvUZ4Gd/XgaXP6tfTsvtTeQ6xyeyw1hCHpKRp3xzZ7q
	YMK2cnRo7P13REisMgnk1K54fEKVuyRAe4FfyAHCOMA1FC75zxZzQ6fqfeK/GZF438VIYGLzQN3
	q40c6QVP0HODYSR6H1MPozS4CH/vBecW7iuV/D8gjA8y3qF8iD6fZyrqpttbbjZbqfsfpLedCYw
	g/P8C3l425ZS5Z5n2Tj6htQJpPM4h+BJTzyQC0iyXvGVVBp5R75eRqRWEdNV47WQ13LElr1n5Qe
	MujaTxkGa3KTUHLFM+O7WvZoL9gpg1I3NMIW28CrYLTtm5BNDWVlfdpBO9JKFxj1aFlT7qlzleZ
	kOTqDX6Q/CJVido6dPBOPpMo+OU0AV9MJqLb0LCmw==
X-Received: by 2002:a05:6000:25f9:b0:484:4779:bcd6 with SMTP id ffacd0b85a97d-4857822e9e9mr4647429f8f.15.1788346106722;
        Wed, 02 Sep 2026 03:48:26 -0700 (PDT)
Message-ID: <5d8888f1-d6f6-4f73-812b-8a79edceed95@gmail.com>
Date: Wed, 2 Sep 2026 12:48:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/39] xen/riscv: drop bug.h's duplicate instruction
 length helpers
To: Jan Beulich <jbeulich@suse.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 Zheng Zhang <zhangzheng@iscas.ac.cn>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1787838835.git.oleksii.kurochko@gmail.com>
 <9908a5b8a5e0d00403af8073a6b7452c19795fc3.1787838835.git.oleksii.kurochko@gmail.com>
 <fba838ed-b6a0-4cef-8dcc-8b5d1f8a8aab@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <fba838ed-b6a0-4cef-8dcc-8b5d1f8a8aab@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d25034/1788346107-038D5A5B-29E7D2C9/10/73395122804
X-purgate-type: spam
X-purgate-size: 3636



On 9/1/26 9:01 AM, Jan Beulich wrote:
> On 27.08.2026 17:20, Oleksii Kurochko wrote:
>> asm/riscv_encoding.h already provides INSN_16BIT_MASK and INSN_LEN(), and
>> emulate.c uses them, so the tree carried two spellings of the same thing
>> which could drift apart. COMPRESSED_INSN_MASK never had a user.
>>
>> No functional change.
>>
>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> 
> As I'm happy to see the duplication go away:
> Acked-by: Jan Beulich <jbeulich@suse.com>

Thanks.

> However, ...
> 
>> --- a/xen/arch/riscv/traps.c
>> +++ b/xen/arch/riscv/traps.c
>> @@ -214,7 +214,7 @@ void do_trap(struct cpu_user_regs *cpu_regs)
>>                   die();
>>               }
>>   
>> -            cpu_regs->sepc += GET_INSN_LENGTH(*(uint16_t *)pc);
>> +            cpu_regs->sepc += INSN_LEN(*(uint16_t *)pc);
> 
> ... for one I'd prefer if we took the opportunity and add "const" to the
> pointer target here.

Thanks for adding 'const' during commit.

> 
> And then
> 
> #define INSN_16BIT_MASK			0x3
> #define INSN_32BIT_MASK			0x1c
> 
> are really named backwards, seeing e.g. their use in

It was derived from OpenSBI project and I haven't paid enough attention 
for these defines.

Now looking at them again I fully agree that names here not really 
correct. It should be according to the spec:
    #define INSN_32BIT_MASK          0x3
    #define INSN_48BIT_MASK          0x1c

Then ...

> 
> #define INSN_IS_16BIT(insn)		\
> 	(((insn) & INSN_16BIT_MASK) != INSN_16BIT_MASK)
> #define INSN_IS_32BIT(insn)		\
> 	(((insn) & INSN_16BIT_MASK) == INSN_16BIT_MASK && \
> 	 ((insn) & INSN_32BIT_MASK) != INSN_32BIT_MASK)

...

#define INSN_IS_16BIT(insn)      \
     (((insn) & INSN_32BIT_MASK) != INSN_32BIT_MASK)

#define INSN_IS_32BIT(insn)      \
     ((((insn) & INSN_32BIT_MASK) == INSN_32BIT_MASK) && \
      (((insn) & INSN_48BIT_MASK) != INSN_48BIT_MASK))

> 
> Furthermore,
> 
> #define INSN_LEN(insn)			(INSN_IS_16BIT(insn) ? 2 : 4)
> 
> fails to use INSN_32BIT_MASK / INSN_IS_32BIT() altogether.

Then INSN_LEN will be redefined as:

/*
  * Length in bytes of the instruction whose first parcel is @insn.  Callers
  * must have established that the encoding is 16- or 32-bit wide; the ISA
  * defines no instruction wider than that, and the wider encodings are
  * reserved.
  */
#define INSN_LEN(insn) \
     (INSN_IS_16BIT(insn) ? 2 : (INSN_IS_32BIT(insn) ? 4 : 0))

I am thinking if it makes sense to have here the generic way to 
calculate INSN_LEN. Something like:

/*
  * Length in bytes of the instruction whose first 16-bit parcel is 
@insn, or
  * zero for the encoding reserved for instructions of 192 bits or more, 
whose
  * length the ISA leaves unspecified.  See "Expanded Instruction-Length
  * Encoding" in the unprivileged spec; the first parcel holds all of the
  * information needed.
  */
static inline unsigned int INSN_LEN(uint16_t insn)
{
     unsigned int nnn;

     if ( INSN_IS_16BIT(insn) )
         return 2;

     if ( INSN_IS_32BIT(insn) )
         return 4;

     if ( INSN_IS_48BIT(insn) )
         return 6;

     if ( INSN_IS_64BIT(insn) )
         return 8;

     /* xnnnxxxxx1111111 with nnn != 111 is (80 + 16 * nnn) bits wide. */
     nnn = MASK_EXTR(insn, INSN_NNN_MASK);

     return (nnn == 7) ? 0 : 10 + 2 * nnn;
}

I think that for now it is enough to go without common implmenntation of 
INSN_LEN and just return 0 as suggested above.

If you are okay with suggested changes I will send a separate patch for 
them.

~ Oleksii

