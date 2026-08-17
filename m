Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F228C5DF66
	for <xen-devel@archiver.kernel.org>; Mon, 17 Aug 2026 16:10:58 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1393103.1632000 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wvzv9-0001IX-O4; Mon, 17 Aug 2026 16:10:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1393103.1632000; Mon, 17 Aug 2026 16:10:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wvzv9-0001IP-Ki; Mon, 17 Aug 2026 16:10:43 +0000
Received: by outflank-mailman (input) for mailman id 1393103;
 Mon, 17 Aug 2026 16:10:42 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wvzv8-0001IJ-2Y
 for xen-devel@lists.xenproject.org; Mon, 17 Aug 2026 16:10:42 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wvzv7-0047pO-86
 for xen-devel@lists.xenproject.org; Mon, 17 Aug 2026 18:10:41 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a833276-2eae-0a2a0a5409dd-0a2a450294e2-18
 for <xen-devel@lists.xenproject.org>; Mon, 17 Aug 2026 18:10:41 +0200
Received: from [209.85.221.44] (helo=mail-wr1-f44.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a833281-6ca4-0a2a45020019-d155dd2cd181-3
 for <xen-devel@lists.xenproject.org>; Mon, 17 Aug 2026 18:10:41 +0200
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-471eeac43bfso3155889f8f.3
 for <xen-devel@lists.xenproject.org>; Mon, 17 Aug 2026 09:10:41 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-482a6c449dbsm4118368f8f.8.2026.08.17.09.10.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Aug 2026 09:10:40 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1786983041; x=1787587841; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S5Lu+q0GTBbHqPkp+c6So3t9yaUIszgkEcgQDMo0x/M=;
        b=Sd5Sod+io4Gir8N7fyWs0P8CZkpWoemqWVD0oondLxrBtlER7l0+vvvP+0TJbBgg+0
         CdbWrCoCPgMZA98AtFoIBMWd9lwbzNQbHsSvdIa52SFpfrQq3B/UpxyG7MszQwwOiNfd
         6rqDWiFJpQsA8sW7dj4JfucZKSnKThWDNYjnwnMvqeDImCCRJ+AOMMiiA2ilOuu1wk6f
         er2HOXeolu+O8da6+XTisMi6+3LsKj1MH5B2VkUIzTFcl3pB98xBblMDLsF4if9oeRMl
         lwjGMtO9uDLs9lNi75umiG3zTz5X/4QmQPQJxNvU8W4CIfVvGmZXZ16Yw5nqBvYTl2oW
         nz9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786983041; x=1787587841;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S5Lu+q0GTBbHqPkp+c6So3t9yaUIszgkEcgQDMo0x/M=;
        b=fKYt//STtvz33AIkc1+WAw1x59ZMhkBWxBl8IV+3iHbLwvBGYPndEfGP+qAtpiezSY
         hmwDiX25NGR7QsY64F6OTidB6r9bXlxiLl4NL2gNaB6ZA+TiSXRjS3kvhhDhrG2NscK8
         rZUH8VWmJitVX9S0WS+X6X6sVcCxmEcEbJrP/h6kCACP93IzC34iKGrjEJqrdUmQqFHw
         cGQ1saqXXb19H7yyKkT2tqhuCjZpk5w4S4ywJ7Ft8MuUlS2SkVbbl6mDdZQ5su9BxXDo
         P0d6N2Z9btIWPSwiz0YGy5Mo22/JzS3ClQ/h6wIarviMHWe7p+VKfB3nixyznpHm6Sci
         A7Ug==
X-Forwarded-Encrypted: i=1; AHgh+RpAaN0Jkn60IJLI8qFnplmQNeWlYuOGadCpjF31T5Ikam1yJTh4RJsgjpFlvOLUWnPyzVUNREBTZC4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxHS1Jcr/i1lUUxXFcx7l+lct+eQ+LxOu2+DFOKtxxPh5vlAKyQ
	1Z7HQB9AHefLPJ4CtIlEXlLLA1dgzhaiBCsDELdbGq+ShgDx0p7S391d
X-Gm-Gg: AR+sD12Eck+EvRttNjWc6pY0de899AyCSq5lb3OXn8aXYY+4BaulAVLTTUCuGuxGWtr
	9wx6ZSuGqdxNvzJgfnILVhQrhnC2a3Y89oBdwPMgFeseTjc4zLHM+Ws8jQcayg7L4gqnmK8epD6
	ntfUpLgC9qUEXxhDpD8jjP6hi/y+kyUv3v0L2vcz2Oawy0LXWh+ib8HrKI1HjkByjqgkw6tZQm0
	gLYDPBc+w5xRgOG817Bs5fb+JaOSIqisjrt/hf41BKybokqttuIlSazWvUU0o7qr5vWux6dj+c0
	5ROkfISPnb6S6xKdpBbJSkdaZd1ssrg5u9AEQStWU/P+gAvIP5xY+EE9GPsOS1ho/hJWMqcL7jT
	y08g6Gw+Kzu/tZegkYQFApZ01RTgPl+drmfZWsZ6dPhaKQMYLZVhcL72dIbsTjh8O+wY8QflQMv
	keFp1NQyNA9jhrQmTx2OBk4lNBrWbfNHiMwZZcZjvI4Uqnk/PkuNGFNBNSl1CqV+OekT4Ld9hpG
	Dzfc97aqEFt20Nj/ncwdcUTv8wLRkNeSwvRL9Zw11w=
X-Received: by 2002:a05:6000:65b:b0:47f:943a:45fa with SMTP id ffacd0b85a97d-481607c0725mr42091138f8f.29.1786983040513;
        Mon, 17 Aug 2026 09:10:40 -0700 (PDT)
Message-ID: <61b9f565-7193-4192-9f57-1b4bd258fc11@gmail.com>
Date: Mon, 17 Aug 2026 18:10:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 14/17] xen/riscv: add guest page fault handling stub
To: Jan Beulich <jbeulich@suse.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1784560663.git.oleksii.kurochko@gmail.com>
 <7ef8919f12c269d180a2b56a83218cc54e0e357c.1784560663.git.oleksii.kurochko@gmail.com>
 <ab3eb1be-ec62-42ae-8966-e2801752ce4f@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <ab3eb1be-ec62-42ae-8966-e2801752ce4f@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-720697/1786983041-666B72AC-4AA59E4B/10/73395122804
X-purgate-type: spam
X-purgate-size: 3693



On 8/12/26 5:48 PM, Jan Beulich wrote:
> On 20.07.2026 18:02, Oleksii Kurochko wrote:
>> --- a/xen/arch/riscv/traps.c
>> +++ b/xen/arch/riscv/traps.c
>> @@ -191,6 +191,67 @@ static void timer_interrupt(void)
>>       raise_softirq(TIMER_SOFTIRQ);
>>   }
>>   
>> +static always_inline unsigned long get_faulting_gpa(void)
> 
> May I suggest to use always_inline only when inlining is _functionally_
> required?

Sure. But it ins't clear to me why it isn't a case here? Is it connected 
to that function is static and too simple so a compiler will do by itself?

> 
>> +{
>> +    /*
>> +     * According to RISC-V spec:
>> +     *  18.2.8. Hypervisor Trap Value Register (htval)
>> +     *   ...
>> +     *   A guest physical address written to htval is shifted right by 2 bits
>> +     *   to accommodate addresses wider than the current XLEN.
>> +     *   ...
>> +     *   If the least-significant two bits of a faulting guest physical address
>> +     *   are needed, these bits are ordinarily the same as the
>> +     *   least-significant two bits of the faulting virtual address in stval.
>> +     *   For faults due to implicit memory accesses for VS-stage address
>> +     *   translation, the least-significant two bits are instead zeros. These
>> +     *   cases can be distinguished using the value provided in register htinst.
>> +     */
>> +    return (csr_read(CSR_HTVAL) << 2) | (csr_read(CSR_STVAL) & 0x3);
> 
> Well, okay, but instead of not losing the bottom two bits you're now losing
> the top two ones.

Oh, right, I will add a cast ((uint64_t)csr_read(CSR_HTVAL) << 2) | ...

It will cover all the cases RV32 which has 34-bit guest address and it 
will be enough for RV64 where GPA is 59bit (the highest possible for Sv59).

> 
> Also the spec reads as if htval only _may_ hold the original address of the
> faulting access. What if htval ends up 0?

good point. then we have to emulate fault instruction and get an address 
from an instruction. I think that for now it will be enough just to 
support platforms which always write GPA to HTVAL.

If I understand correctly if htval is supported by platform then htval 
will be always filled for guest page fault. To verify if HTVAL is 
supported we could do:

'Unless it has reason to assume otherwise (such as a platform standard), 
software that writes a value to htval should read back from htval to 
confirm the stored value.'

And is it true because:
```
A value of zero in mtval signifies either that the feature is not 
supported, or an illegal zero instruction was fetched.
```
(yes, it is about mtval but I asssume that htval has the same behaviour').

Otherwise if it won't work then we can't distinguish if it is zero 
because h/w doesn't update htval or it zero because faulty GPA is zero.

So we could add this check under #ifdef CONFIG_DEBUG here and if HTVAL 
isn't supported then we can't work on this platform.

> 
> Further, nit: There's (once again) no real value in the 0x prefix, I don't
> think.

Sure I will drop then.

> 
>> +static int emulate_load(unsigned long fault_addr, unsigned long htinst)
>> +{
>> +    return -EOPNOTSUPP;
>> +}
>> +
>> +static int emulate_store(unsigned long fault_addr, unsigned long htinst)
>> +{
>> +    return -EOPNOTSUPP;
>> +}
>> +
>> +static void handle_guest_page_fault(unsigned long cause,
>> +                                    struct cpu_user_regs *regs)
>> +{
>> +    unsigned long addr;
>> +    int rc;
>> +
>> +    addr = get_faulting_gpa();
> 
> Can't this become the initializer of the variable?

Sure, it can. I will do that.

Thanks.

~ Oleksii

