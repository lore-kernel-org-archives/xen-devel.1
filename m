Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90C98C88E45
	for <xen-devel@archiver.kernel.org>; Fri, 11 Sep 2026 13:50:56 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1416813.1645737 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x51eP-0001LT-VZ; Fri, 11 Sep 2026 13:50:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1416813.1645737; Fri, 11 Sep 2026 13:50:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x51eP-0001LM-T4; Fri, 11 Sep 2026 13:50:45 +0000
Received: by outflank-mailman (input) for mailman id 1416813;
 Fri, 11 Sep 2026 13:50:45 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1x51eP-0001LG-Eo
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2026 13:50:45 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x51eO-00EIT1-Rx
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2026 15:50:44 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6aa40722-2eae-0a2a0a5409dd-0a2a450bb98a-34
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 15:50:44 +0200
Received: from [209.85.208.52] (helo=mail-ed1-f52.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6aa40734-b7e8-0a2a450b0019-d155d034cc91-3
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 15:50:44 +0200
Received: by mail-ed1-f52.google.com with SMTP id
 4fb4d7f45d1cf-6a9a20a5e72so1446129a12.0
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 06:50:44 -0700 (PDT)
Received: from [172.19.143.248] (IW396200.net.t-com.hr. [195.29.234.54])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c2966022298sm79926366b.17.2026.09.11.06.50.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Sep 2026 06:50:43 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1789134644; x=1789739444; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rIbWYzVATaArPOIUXCyeRp47IjnE+SLDm73PPY0JUXA=;
        b=hiddp9r9xzHDgOIa2/D7Br7PvvH4P5/AIMjdd34Yjq1gepGoRcLWibpzQgz+gPdRL+
         Q41jD4FQy6kjAoRw5XoUecrFDkZcmeuqvhXdBRjSDDGo2tLLVxu0nNbYyLR/VlARlWIA
         vsR74waEHTr9pFTIRAmpoWcMLFLhUnrqHEEnuGDvx343v/OKVPaTO4X8ofQ2TGgHXOQj
         ygz8HQ93Q2gW4P931cvER63gmyeWB7A9UO3BCi7VTA2NPsOxbbosJaiQFBawKkzvMc+k
         Ck/JFbQn5mqNBfrwq7gvULrEmljG2aZ3HchMVxyCTFxydaOGPlYUAe/YkEj7sjNpTOjY
         7d0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789134644; x=1789739444;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rIbWYzVATaArPOIUXCyeRp47IjnE+SLDm73PPY0JUXA=;
        b=CoskOzEWU9SZ5ItHen+soxE+iFRNKFZINmMNVNICCBhepnjlZkf3+sbxyULQSDCoe6
         nhuG6MR0Do692hserbLF4ibh36LcKOwy5ZoFCxzOMk4ZUeDYoLXfYoZIu9zQoO0/Wr4y
         84Vi/fj6SZBojdIr04pJjHcrFM2sMxb3YDJwOimtMTNGvJfMSStSxtzXX86cWWT8mptI
         vH/GHRlFd885PDMrL7IvM1ip1e4vw9uUbFOICydnm7p4VWiLksSUfMEne8E7EGMc561s
         /+rIVtn5M3wi6Q1nAcoiSiAOMcHzjQpbW29ADw1QvrcdWVwBkPvo5gAhgRvvmm58Zucl
         oqvA==
X-Gm-Message-State: AFuF++kLBbwdaFV7EiSx7f4S/Uz/N887Kb04zFU+JQZTAcUCXp85NoMt
	zW/x3k5I7AWQyK+KOXfxYvQqJ3niu105o1VMGW2aFUU5otfiiuyK4Vxf
X-Gm-Gg: AYBFou3FlHwPsVbU7utTkDXeGNfyV22L/mJ74VvaeCnEhAGipt2Lmjaos4kk9iuDhZD
	NBcfpomObUNNnmhaPCtwzhWiahU3DtMtB23OTAxSz9iAr2GRqBdfPjwryUO5vAyv5jptw/cGjhR
	021x0+dS65RpEHeUMhkywP1InWv3xKzQKAOWxS17Cm/yyEebEhgtL/Rg8HCYdiiL0ruHdO0p41g
	iBKIr84Bu5/hxgtiZg5I59PkC6s51/zfWXZ/pcIgbkq87K7qhwf+0VVR1XeFcYrmoC6Qz6xpCl3
	77E8HqtghgU4g6UT6RyV0irablzpVyY2aiiej1MKCuUtwG5Q0FpfJEbDCi34ULhcAIVchi/w0ds
	OpKEn4wvpOh8ptP0zp6LKoSl49NfdF5Mt3g2Lfe7nj3fVQKo0/Eb6at5UbOxoQNHaJ3unnrKdmP
	j219imcqkeCa+g1iz98vVHPGFxvo9nVCmI7bqWTvd9pS3+450zKhjxlXE0NuB0rB4Krv6WNVdZf
	cMigKQsOC2lZgLYcwvyX5Z51cf0REpr7Q==
X-Received: by 2002:a17:907:6093:b0:c29:52dd:317b with SMTP id a640c23a62f3a-c29666bd78fmr170235466b.29.1789134644228;
        Fri, 11 Sep 2026 06:50:44 -0700 (PDT)
Message-ID: <d88106fa-b8d4-4804-a068-83de0da0297f@gmail.com>
Date: Fri, 11 Sep 2026 15:50:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 22/39] xen/riscv: add guest memory read helper
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org,
 Romain Caritey <Romain.Caritey@microchip.com>,
 Zheng Zhang <zhangzheng@iscas.ac.cn>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Baptiste Le Duc <baptiste.le-duc@vates.tech>
References: <cover.1787838835.git.oleksii.kurochko@gmail.com>
 <b68a29b7ef5b2cb83fde405b3854c94a2f44f4d0.1787838835.git.oleksii.kurochko@gmail.com>
 <1788955499.8631fc262581453bbf619ec5b2062170.1a0860e9b57000c4f3@vates.tech>
 <7b743afb-409d-433b-86b9-7ec8be7ad860@gmail.com>
 <1ce9effb-a632-4a48-aaaa-3c810ebd255d@gmail.com>
 <7a683895-d145-4640-b0c7-390408404a94@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <7a683895-d145-4640-b0c7-390408404a94@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-42698a/1789134644-1BCD79EA-27F24C2B/10/73395122804
X-purgate-type: spam
X-purgate-size: 3592



On 9/11/26 3:47 PM, Jan Beulich wrote:
> On 11.09.2026 15:41, Oleksii Kurochko wrote:
>> On 9/11/26 3:06 PM, Oleksii Kurochko wrote:
>>> On 9/9/26 2:04 PM, Baptiste Le Duc wrote:
>>>>> Introduce riscv_read_guest() to allow Xen to safely read guest memory
>>>>> using HLV/HLVX instructions while reliably capturing trap context.
>>>>
>>>>> This is required for instruction fetch emulation and MMIO decoding,
>>>>> where
>>>>> Xen must inspect guest memory that may not be directly accessible and
>>>>> may
>>>>> fault.
>>>>>
>>>>> The implementation is based on kvm_riscv_vcpu_unpriv_read() from Linux,
>>>>> with one deviation: the hlv/hlvx instructions translate the guest
>>>>> address
>>>>> through the live vsatp/hgatp CSRs, i.e. through the address space of the
>>>>> currently running vCPU, so the function can only be called safely for
>>>>> current. Instead of taking a struct vcpu argument, it always operates on
>>>>> current directly.
>>>>>
>>>>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>>>>>
>>>>> diff --git a/xen/arch/riscv/guestcopy.c b/xen/arch/riscv/guestcopy.c
>>>>> index 8a89212e0b..b2327822ac 100644
>>>>> --- a/xen/arch/riscv/guestcopy.c
>>>>> +++ b/xen/arch/riscv/guestcopy.c
>>>>> @@ -6,6 +6,7 @@
>>>>>    #include <xen/string.h>
>>>>>    #include <asm/guest_access.h>
>>>>> +#include <asm/traps.h>
>>>>>    #define COPY_from_guest     0U
>>>>>    #define COPY_to_guest       BIT(0, U)
>>>>> @@ -114,3 +115,89 @@ unsigned long copy_to_guest_phys(struct domain
>>>>> *d, paddr_t gpa, void *buf,
>>>>>        return copy_guest(buf, gpa, len, GPA_INFO(d),
>>>>>                          COPY_to_guest | COPY_gpa);
>>>>>    }
>>>>> +
>>>>> +/*
>>>>> + * Read machine word from guest memory
>>>>> + *
>>>>> + * @guest_addr: Guest address to read
>>>>> + * @read_insn: Flag representing whether we are reading instruction
>>>>> + * @trap: Output pointer to trap details if something went wrong
>>>>> during read
>>>>> + *
>>>>> + * The hlv/hlvx instructions translate guest_addr through the live
>>>>> + * vsatp/hgatp CSRs, so the read is only meaningful for the address
>>>>> + * space of the currently running vCPU.
>>>>> + *
>>>>> + * At most two halfwords are fetched when @read_insn is true, i.e.
>>>>> encodings
>>>>> + * wider than 32 bits are not supported. Such an encoding cannot be
>>>>> completed
>>>>> + * by calling this function again at @guest_addr + 4: the length
>>>>> check is
>>>>> + * applied to the first halfword read, which would then be a
>>>>> continuation of
>>>>> + * the instruction rather than its opcode. It is up to the caller to
>>>>> reject
>>>>> + * anything that is neither a 16- nor a 32-bit encoding.
>>>>> + */
>>>>> +unsigned long riscv_read_guest(unsigned long guest_addr, bool
>>>>> read_insn,
>>>>> +                               struct trap_info *trap)
>>>> Nit: every other function in this file / declared in this header
>>>> (raw_copy_from_guest, copy_to_guest_phys, ...) has no riscv_ prefix. Why
>>>> does this one get it?
>>>
>>> Agree not to much sense. I will drop it.
>>
>> Probably we still want to have riscv_ prefix to show that this
>> read_guest() is specific to RISC-V but others (raw_copy_from_guest,
>> copy_to_guest_phys, ...) could be used in Xen common code too.
>>
>> So I think we could keep riscv_ prefix.
> 
> Please may I suggest to avoid unnecessary prefixes?

Sure then I will drop it as originally suggested.

~ Oleksii

