Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41FBFCA6019
	for <xen-devel@archiver.kernel.org>; Fri,  9 Oct 2026 14:00:46 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1444424.1661282 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xFB96-0001NI-T0; Fri, 09 Oct 2026 14:00:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1444424.1661282; Fri, 09 Oct 2026 14:00:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xFB96-0001NB-QG; Fri, 09 Oct 2026 14:00:24 +0000
Received: by outflank-mailman (input) for mailman id 1444424;
 Fri, 09 Oct 2026 14:00:24 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xFB96-0001N5-3I
 for xen-devel@lists.xenproject.org; Fri, 09 Oct 2026 14:00:24 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xFB94-00GE3Y-RN
 for xen-devel@lists.xenproject.org; Fri, 09 Oct 2026 16:00:22 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6ac8f36d-8faa-0a2a0a5109dd-0a2a450b9cfe-22
 for <xen-devel@lists.xenproject.org>; Fri, 09 Oct 2026 16:00:22 +0200
Received: from [209.85.221.51] (helo=mail-wr1-f51.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6ac8f376-b7e8-0a2a450b0019-d155dd33e92a-3
 for <xen-devel@lists.xenproject.org>; Fri, 09 Oct 2026 16:00:22 +0200
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-48bbb06e746so3483564f8f.3
 for <xen-devel@lists.xenproject.org>; Fri, 09 Oct 2026 07:00:22 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-71-234.play-internet.pl.
 [109.243.71.234]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48db9463230sm4930194f8f.1.2026.10.09.07.00.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Oct 2026 07:00:15 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1791554422; x=1792159222; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/cJ5kByjlNpwLVnkCGkRj3iBv1xbQvfIquQOlXXDjkg=;
        b=Cxv6lY/iOqjzyQoJqOYmA283MJbzhtRzteQIk6P5Ironq5voC4Ri2cbl98brB97lsj
         4kzN+raYLNGFZNaEf+HzF6kKjXm3WInsyoI4jO+J8ojWxiTUgcOxlum8CCbDZfSQN8sf
         eEWkgLynh+wPwmK3WlG8/Dy501G9ggLbgG3nxFg7UAjlC6gqYRoYE0bfVGIgN41kOmjv
         3OYOYuZdnvsvnp8+rn4Zpses+nNqgHW4aQfI/bcxXHijWiRYEqzabae3KvbDcGF4n+WX
         Bi7e46YFlNCG3wYMbkBHFNM7PtByZHXkbyH1xg3JSFrCLXqj8Nh4FD6U4lEhJnnQDgoH
         T2sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791554422; x=1792159222;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/cJ5kByjlNpwLVnkCGkRj3iBv1xbQvfIquQOlXXDjkg=;
        b=h3eOMGmqyMSRSKRF05rDIJ1vtSWx21HcSDBcqTq2TCIDSe1EFjdLq84OGx/oN0F1Jz
         y6dV4Xm0389bn4I7ejKO5/fadvuBBVbh28EuVgqPb1Rawi1RERckGN/LiFhkzI4S/z4z
         Y2X2/vZ7/Khg1URNvqFlsdiuG3oxi4jhjTy2xK97BxZZy3e9BNcQVwQz9qDFtn1QR8s/
         rhgn0lBcaBwJy353+3djiZzVw7CilR13JQyXYdeUwESUCtCDG+RXisj3flaiZ/aCKCcc
         pK0fceBZzWSNkIOntwp3aFtBXI3WJKimUmIdwqDrA+Zw9Qx9ztDsIQ/l/qsHiec7AzEp
         fDEw==
X-Forwarded-Encrypted: i=1; AKwUvBwNoIX0CX4mfjatiBV/2QrmxHmi4Gs52flDmbldsefYXyxHgMrQYI+1vljzBZp/fYeuo7EqrSqVXD0=@lists.xenproject.org
X-Gm-Message-State: AFq9FYIWo0MLZf6ZbJ7icbfO94QO0W+0O+Jls61uN8F1kRC9O/hkHzjv
	ENXPXyjaGmL7WLQ67+EjDsM2fmAq6Ctlwh/D6Ldz0FnUKTNwwUSSRT1c
X-Gm-Gg: AYBFou1S9chBecnK2GfTcEPHrQKOvJ065K+wwJY7o2qoT5own6MZXsUblun62W2GnR4
	uz3iYbKcT8gAWvCKbCziYcgY45SVy1Mo9Stdf8z9/FGCyVhrWvPDtzX4eNEO3eqU9GaJ5ZtXXIi
	N5DtTZZiRHHSxkOHnMUWbWgXfc5IgrQ7R+GFA8D44Ky8fq8t2m5m3GusZSeN40xPrPBOEtuSr6U
	iOtyP08WWg+Eb44DtzfyKFuxElV1IHp9kcBaezW149O1Mc4CdVpXEty8VaEDZW/ThS31x5jAde/
	eDzSq0vLoWFqZyo/UtKUwepydYgb84uaYNSWC+ZtbbxBCHsZK2wjvjl7Q8hFfa3YwOcLCbO49f9
	tC67QdpqQGMcSbZ8ZCQKyNriy5bDb+U4fSh4A/r6uMU0pZketuTTWovzdicqhL/1Gq2nfHOWpJf
	bkYyI200o6AsX4ZW4pu4vp54J3y1ZnT8Pa9RGbu5tDi/9IGTEMfANyezURWqztiU9lYNNoKKXGV
	F5WZo/XgPo8x4AbM+ZpkZ+wNcCNSUb2Kwnk27w9R0Q8EAvUdQ==
X-Received: by 2002:a05:6000:260b:b0:485:8c16:a34b with SMTP id ffacd0b85a97d-48dba9dd11bmr3934799f8f.35.1791554421537;
        Fri, 09 Oct 2026 07:00:21 -0700 (PDT)
Message-ID: <a1328bd1-7a7d-4abd-90e3-38df9fe57efa@gmail.com>
Date: Fri, 9 Oct 2026 16:00:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 03/39] xen/riscv: introduce csr_volatile_read64()
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
References: <cover.1790779209.git.oleksii.kurochko@gmail.com>
 <af8a07a676749b83cad27332e88bf433f98f22e1.1790779209.git.oleksii.kurochko@gmail.com>
 <ce03cd67-2175-4c89-a25e-95be2a85328f@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <ce03cd67-2175-4c89-a25e-95be2a85328f@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-42698a/1791554422-A9CC79EA-DD292EE8/10/78276251493
X-purgate-type: spam
X-purgate-size: 4924



On 10/8/26 4:46 PM, Jan Beulich wrote:
> On 30.09.2026 18:18, Oleksii Kurochko wrote:
>> On RV32 a 64-bit CSR is accessed as two halves, <csr> and <csr>H. Reading
>> the halves with two separate instructions isn't always safe: for a CSR
>> which hardware increments, a carry from the low half into the high one can
>> happen in between, so a plain pair of reads can produce a value the CSR
>> never held. Therefore the high half is re-read and the sequence retried if
>> it changed in the meantime.
>>
>> Only CSRs which change under Xen's feet need that, hence the name. The
>> majority can be read with a plain pair of csr_read()s, so no helper for
>> those is introduced here as there would be no user for it.
>>
>> Use it for CSR_TIME, which is exactly such a counter, and widen cycles_t to
>> uint64_t. Otherwise get_cycles() would still truncate the time counter to
>> 32 bits on RV32.
>>
>> No functional change on RV64.
>>
>> Fixes: a541ddadec0a ("xen/riscv: introduce time.h")
>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> 
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Thanks.

> 
> Nevertheless, a few remarks below.
> 
>> --- a/xen/arch/riscv/include/asm/csr.h
>> +++ b/xen/arch/riscv/include/asm/csr.h
>> @@ -39,12 +39,39 @@
>>       csr_write(csr, v_);             \
>>       csr_write(csr ## H, v_ >> 32);  \
>>   })
>> +
>> +/*
>> + * The two halves are read by separate instructions, so a CSR which hardware
>> + * increments can carry from the low half into the high one in between,
>> + * yielding a value the CSR never held. Re-read the high half and retry the
>> + * sequence if it changed.
>> + *
>> + * Only needed for CSRs which change under Xen's feet.
>> + */
>> +#define csr_volatile_read64(csr)                    \
>> +({                                                  \
>> +    uint32_t hi_, lo_, old_;                        \
>> +                                                    \
>> +    hi_ = csr_read(csr ## H);                       \
> 
> This could be the initializer of the variable.
> 
>> +    do {                                            \
>> +        old_ = hi_;                                 \
>> +        lo_ = csr_read(csr);                        \
>> +    } while ( (hi_ = csr_read(csr ## H)) != old_ ); \
>> +                                                    \
>> +    ((uint64_t)hi_ << 32) | lo_;                    \
>> +})
>>   #else
>>   #define csr_write64(csr, val)       \
>>   ({                                  \
>>       csr_write(csr, val);            \
>>       (void)csr ## H;                 \
> 
> While I notice the same exists here already, I wonder what the purpose of
> this and ...

I can drop it in separate patch. The purpose was just for the symmetry 
with RV32 case.

> 
>>   })
>> +
>> +#define csr_volatile_read64(csr)    \
>> +({                                  \
>> +    (void)csr ## H;                 \
> 
> ... this is (and why their placements differ). Generally a pure 64-bit
> environment would have no need for these ...H constants, and their
> availability looks to be all that's checked for here. As Baptiste did
> point out on patch 11, these uses constitute Misra violations, which we
> then would need to deviate. I think we want to try to limit the number of
> needed deviations.

If I understood MISRA Rule 20.12 correctly (Baptiste pointed me to it on
patch 11), the issue is that the csr parameter is used both as an operand
of ## and in ordinary, macro-expanded context.

I think it would be better to just rewrite these macros so that no
deviation is needed:

#ifdef CONFIG_RISCV_32
#define csr_write64(name, val)                  \
({                                              \
     uint64_t v_ = (val);                        \
     csr_write(CSR_ ## name, v_);                \
     csr_write(CSR_ ## name ## H, v_ >> 32);     \
})

#define csr_read64(name)                        \
({                                              \
     uint64_t v_ = csr_read(CSR_ ## name ## H);  \
                                                 \
     (v_ << 32) | csr_read(CSR_ ## name);        \
})
/* csr_volatile_read64() similarly */
#else
#define csr_write64(name, val)      \
({                                  \
     csr_write(CSR_ ## name, val);   \
     (void)CSR_ ## name ## H;        \
})
...
#endif

For RV64, '(void)CSR_ ## name ## H;' could be dropped altogether, and
csr_volatile_read64() would be reworked in the same way.

IIUC, with such definitions there is no violation of MISRA Rule 20.12.

> 
> And then, seeing how patch 11 introduces an exact copy of this as
> csr_read64() - can't we simply have
> 
> #define csr_volatile_read64 csr_read64
> 
> ?

It could be an option, then I will move csr_read64 to this patch.

Thanks.

~ Oleksii

