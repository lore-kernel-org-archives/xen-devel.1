Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 669E9C982DE
	for <xen-devel@archiver.kernel.org>; Mon, 21 Sep 2026 08:50:30 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1427166.1649790 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8Zj1-0001q2-Op; Mon, 21 Sep 2026 08:50:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1427166.1649790; Mon, 21 Sep 2026 08:50:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8Zj1-0001pv-Kz; Mon, 21 Sep 2026 08:50:11 +0000
Received: by outflank-mailman (input) for mailman id 1427166;
 Mon, 21 Sep 2026 08:50:10 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1x8Zj0-0001pp-DG
 for xen-devel@lists.xenproject.org; Mon, 21 Sep 2026 08:50:10 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x8Ziz-00CPc3-QN
 for xen-devel@lists.xenproject.org; Mon, 21 Sep 2026 10:50:09 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6ab0efc0-8faa-0a2a0a5109dd-0a2a4502d2a4-10
 for <xen-devel@lists.xenproject.org>; Mon, 21 Sep 2026 10:50:09 +0200
Received: from [74.125.225.88] (helo=mail-wr2-f24.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6ab0efc1-6ca4-0a2a45020019-4a7de1588072-3
 for <xen-devel@lists.xenproject.org>; Mon, 21 Sep 2026 10:50:09 +0200
Received: by mail-wr2-f24.google.com with SMTP id
 ffacd0b85a97d-482f63546c3so2097846f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 21 Sep 2026 01:50:09 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-71-234.play-internet.pl.
 [109.243.71.234]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4885a0549c3sm8650879f8f.25.2026.09.21.01.50.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Sep 2026 01:50:08 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1789980609; x=1790585409; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kMNDPIW1M+Dnfnntk5+ZE4qyCf9pl2+3W+E2riidDAQ=;
        b=OHdLd8iG3AAEykemnzEYZ6wJW6ca78hFheu4kM8hSKXNo7iGoFOLc9aD0R7v3Tb37R
         eoXrNp4EKhdQ1tywhgSBV62gkMnVld7tEQ5Wu4PDLSYSFR47ziMpZOqpuml10BTrboia
         Pvi7MHnqhjcdfX44xQLOP0Bq8eKRrzCbq3HgwjgrsVnx2ITeoPoTzX2bomjoxOpBS80v
         DghjzpA+nf754QJjimczfnIofUbWOnkuHlkiSjgYS1GmFQtK2CxexxMiw0N1kKjI6g+t
         JU/JYeAbxFqQ5VBVLIO7e5NUWH6nfPn0+W/PTt5eO4O2SdTHTSp8jT5fmmeDjD/cxoJI
         PLXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789980609; x=1790585409;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kMNDPIW1M+Dnfnntk5+ZE4qyCf9pl2+3W+E2riidDAQ=;
        b=fQ39Uw5DYJp9y2Yq6B/rxNjC5UXextylOubUbuRIhRDQDhb+OhwB61XahWrlkzv6na
         iFkPhC7/SBYzf1RkRM0jX4S972hmMCDZV7+u7O/BaHGxEQGMsw3XONSJxsAbuwqojDvC
         Pc+qQYXa5gW9YIT8n9QVv/31iDngx8wWFz0JJ95d7C+CGlfAHSjlk3weuEPAAkRLGg7v
         9tOOYnh+h0iSkBP+KQY13iaLA9CwBzg5Yfd7H1kG3eUdh6B9Yn51owaYxORkcyP/bwQg
         MS7OiBz8TGSavgfdypCfNofQEUUqmKirjtjSn5ugfhsBl3gGyI0l5r829fOPlxTgDthq
         vOFg==
X-Forwarded-Encrypted: i=1; AKwUvBwKg3uzm+VQLRrF17R61fcYowb4icl2Ps+ZtF2XKSdNpqNDHwL18BdP5+rwWaHW5wT8uE2QCvXCIao=@lists.xenproject.org
X-Gm-Message-State: AFuF++lysLCqTSAYYwSj7TUkX7KYvMsHHRYWuRL9hhMTMXekKj2iyrJb
	F6uO0OrnPTUZDWS4ujA44LjFL5jF+fGuwtp6hNucRgK5M4k2oGBeBMgk
X-Gm-Gg: AYBFou2Hcf0GThiF1/J3ox/b3c/Uz89jDBO9xfldSlyB63c7bTjXNke5wpApjL8qila
	0lwKKAEbZFIQywoz1I4glV1HgQmB1UuLcGRmjo/1IJ87rujlgHPJFBl4Lz0+eX6LWaVuh5BLv26
	aEoiLhtkL/M2ScFmD38LicpUE6q/GS4ZbPBgnUdlav9pl09hbft3fUsc0/Xq/jPHAyRBtI0M5lb
	q9Oo/PUxrjtJR6ox+WgbP6cPFPQYf6hWzhUBP/9zRh1SFR89EdpsyC/8dky3MBCuPAC5LY1ORdm
	WJuu6AXEnijlMuob4AKQx4RGTJFhTU+EHHRLMZOzSjll2vl7ub8VmOGtz3awM1iuP/RaoifPUhK
	2x5BodzLv2rNlvyER2G24Wjcy/V2DoQoGfFPFoVfqt0MRuOBGqMttxAE5xQB+8vHe5V7Cfxglkd
	+ioc0EncLQNI1TMkhXAbVtOMcwqj9rUMU6R6eDQHJyJRdoW618h5AJGTTPiE9/p/nAi7fb0lyAt
	Y4ZD6b5/X24M1vTBQbTLL3cAkeq9K89AnPvfiH4JwnM8GaUzA==
X-Received: by 2002:a05:6000:65a:b0:488:5d38:71fe with SMTP id ffacd0b85a97d-4885d387deamr1436148f8f.39.1789980609095;
        Mon, 21 Sep 2026 01:50:09 -0700 (PDT)
Message-ID: <e850131b-d7b2-4738-96fb-c20dfc670199@gmail.com>
Date: Mon, 21 Sep 2026 10:50:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 32/39] xen/riscv: remap interrupts to new IMSIC VS-file
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
 <948e94b6610586b84626c98da033d301335dc7b0.1787838835.git.oleksii.kurochko@gmail.com>
 <2394a616-16be-4657-be17-0a2dafebaeee@suse.com>
 <9929eb6a-d7b8-4a39-b726-82290983e9f3@gmail.com>
 <815bf929-57be-4b31-b3a9-a3720f5cd88e@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <815bf929-57be-4b31-b3a9-a3720f5cd88e@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-720697/1789980609-664B62AC-E419220D/10/73395122804
X-purgate-type: spam
X-purgate-size: 2989



On 9/21/26 10:28 AM, Jan Beulich wrote:
> On 21.09.2026 10:03, Oleksii Kurochko wrote:
>> On 9/14/26 5:02 PM, Jan Beulich wrote:
>>> On 27.08.2026 17:21, Oleksii Kurochko wrote:
>>>> @@ -242,6 +254,15 @@ void imsic_irq_disable(unsigned int irq)
>>>>        spin_unlock(&imsic_cfg.lock);
>>>>    }
>>>>    
>>>> +static bool imsic_local_is_pending(unsigned int id)
>>>> +{
>>>> +    unsigned long isel =
>>>> +        (id / BITS_PER_LONG) * (BITS_PER_LONG / IMSIC_EIPx_BITS) + IMSIC_EIP0;
>>>> +    unsigned long bit = BIT(id % BITS_PER_LONG, UL);
>>> Both can be unsigned int, can't they?
>> Yes, agreed. Both isel and bit fit within unsigned int. I will update
>> them in the next version.

Sorry for not noticing that in first reply but local variable `bit` 
should be unsigned long as if id % 64 >= 32 we will have overflow of 
'unsigned int'.

>>
>>>> +    return !!(imsic_csr_read(isel) & bit);
>>>> +}
>>> No need for !! here.
>>>
>>> What about endianness, btw? Does the IMSIC always match the CPU (and
>>> its setting)?
>> No, the IMSIC does not dynamically adapt its register interfaces based
>> on the CPU's runtime endianness configuration (e.g. mstatus.SBE/MBE):
>>
>> - CSR Accesses (imsic_csr_read): Indirect CSR accesses (siselect/sireg
>> or miselect/mireg) operate using standard RISC-V CSR instructions at
>> current XLEN width. Values are read and written directly into
>> architectural GPRs without byte-swapping.
> I.e. you need you add endianness conversion.

I think I don't really get why. My understanding is that endianness is 
about an access to memory. We don't have here load/store instruction or 
an explicit access to memory. We have here only CSR instruction which 
loads value from IMSIC register to GPR w/ an access to any memory.

Probably I wasn't clear here "he IMSIC does not dynamically adapt its 
register interfaces based on the CPU's runtime endianness configuration 
(e.g. mstatus.SBE/MBE):" and it would be better to reply as:

```
endianness (mstatus.SBE/MBE) only governs memory accesses, whereas
eipK is accessed via CSR instructions, which transfer an XLEN-wide
value between the CSR and a GPR with no notion of byte order. The AIA
spec defines eipK in terms of bit significance (bit i of eipK is
identity K*32+i), so BIT(id % BITS_PER_LONG) is correct regardless of
the CPU's data endianness. Endianness only matters for the memory-mapped
seteipnum register, which is why the spec provides both seteipnum_le
and seteipnum_be.
```

> 
>>> Overall, what does "local" in the function name signify? (For a static
>>> function, the "imsic" prefix may also be unnecessary.)
>> It signifies that local (on which code is executed now) hart's IMSIC
>> CSRs (isel and ireg in the case of imsic_csr_read()) are touched.
> That's the expected thing for CSR access, though.

Fair enough. I'll drop both the "imsic_" prefix and "local" and rename
it to irq_is_pending().

~ Oleksii

