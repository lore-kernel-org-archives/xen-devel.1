Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1319C624D3
	for <xen-devel@archiver.kernel.org>; Tue,  1 Sep 2026 16:02:03 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1404841.1638516 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1Qvm-0006il-P2; Tue, 01 Sep 2026 16:01:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1404841.1638516; Tue, 01 Sep 2026 16:01:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1Qvm-0006ie-Lm; Tue, 01 Sep 2026 16:01:50 +0000
Received: by outflank-mailman (input) for mailman id 1404841;
 Tue, 01 Sep 2026 16:01:49 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1x1Qvl-0006hG-DY
 for xen-devel@lists.xenproject.org; Tue, 01 Sep 2026 16:01:49 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x1Qvk-001N3C-QQ
 for xen-devel@lists.xenproject.org; Tue, 01 Sep 2026 18:01:48 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a96f6e5-bab6-0a2a0a5309dd-0a2a4507e316-28
 for <xen-devel@lists.xenproject.org>; Tue, 01 Sep 2026 18:01:48 +0200
Received: from [209.85.221.52] (helo=mail-wr1-f52.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a96f6ec-b4ea-0a2a45070019-d155dd34f06f-3
 for <xen-devel@lists.xenproject.org>; Tue, 01 Sep 2026 18:01:48 +0200
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-482fc2b44a7so60030f8f.2
 for <xen-devel@lists.xenproject.org>; Tue, 01 Sep 2026 09:01:48 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48448e13db0sm61769f8f.0.2026.09.01.09.01.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Sep 2026 09:01:46 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:Content-Language:References:Cc:To:Subject:From:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788278508; x=1788883308; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xf85yesiKQUQie1aMQO7OcAiS04pkkycYfzDVlZGMZI=;
        b=h+cL0n/NXvJIIbK2qWYICcb1rQnWt18XQpzCwZzpkP+rufxW110QXau782VBML0cqE
         Xy2/R8YWNjDl/T5NPRCw2j46j7+fP9SABvLLyejLQlHEG1YMaikhy9kF5yPHFrbBahkj
         1HMN0Q3AKLjKAmukV6mP0ewlvahrJvd14WBUlPq5uAdFKhyJHPCf1pe4KKeDSFaIsRoP
         tR38o24ftOtW/MpZZQN/pJYbmfsGEkAfVcjILWGmtg/4fw+ALzfDSDk1D/xQVzlP6LQ+
         oAKxqegNku95GeBT38wXwbKH3fh5SoTBzLgjeQvHcwqXANKAVxA7bVCB9mIDJoipMYw4
         SSRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788278508; x=1788883308;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xf85yesiKQUQie1aMQO7OcAiS04pkkycYfzDVlZGMZI=;
        b=m1L5Ph8JfYxK3ii1T7MMxy3p/HyOMCkw/WVEF1RBAf6EI05Cx6qLAV3eRzAR6oFmK1
         j2jZxPN/wZySk9P3cQaObO2YQBYzb6MqvQ4m7ZVfns1FGqSIj+1uCjmgaaG23HG3dEJO
         j8qNPwVacTuPLqoPMju5yqq1V8ChFZJt7wLp/Ng9iYHZUXyveMZQ4c+OO9LCunxhS4GS
         bz/u6HmBMXMIhR8cHqLm2XRXZVRVUsvURMvrM7rG/YbLndF53bG5vQUKDxw6mXDz0Qww
         DA+Bi7xWfqF9T486tHd1z/6qI6BIlWked/NwuCLtX4jo5YqojHIRPLAPgtLBLAakz3qx
         wN8A==
X-Gm-Message-State: AFuF++m5FjALZmnIwjIEfDKwwvLeiKfMOjqVEJ3aZQbByiGu8OcEaLAj
	bumN0gg+NdM7MeqMgFhpFcsH60MDm4nQ0f2yM0u4CCNJ4mLQqTMn6h8W
X-Gm-Gg: AYBFou0huOH2Wmd8QbQjqhQ5jQ31e6gj9PvUULPhxsXySBqgTTcBgkf+/VKJ5SWnHuG
	RYYrVYJ2npeYocgqf5HgdIA8VtYETdTPhutKDLxwVMdcY9zqWl5WVTLjglSDQfgYrxsvpaH89cY
	UF4zJCQcZ0MnAR2/VpFNnAl12cjsGX2PbqOFLSb42dBJhnGThR7LDgpmcvKOfV8diQroBCwqsic
	8Xr4ZFDHmYy1LNxJq40h3Mn5Ge34+fPZJIDM9XJ5O5ph9z1xbGts1zkpVMCUDVvgdpQH9H33EV4
	p3TMNvBw75elzIV1Du8rXba133GruKYFIxWHT6FCAN8QA1hR2EDxi6NmExmqDsC0OPlQL0zJ3x4
	4mlmeiB9jVRHtFPw4/LJLxo6ZlXJIJOV2kMffGTTkRoXmI7P83PqvtQqb7kHvd2RllF6lPPyCLU
	BX52A8z2QTBJs9wQlGtasW7ueAaP4sdIhQoJCCRMdjinM4Cx+1BY4NwAEsRUokkHolyNTSEMyjj
	4FJWfxwecWwH3OawYtzTcZpc9HjsiPLGDmB6iWAPA==
X-Received: by 2002:adf:e005:0:10b0:484:40f5:da6a with SMTP id ffacd0b85a97d-48440f5dac4mr13730232f8f.15.1788278507963;
        Tue, 01 Sep 2026 09:01:47 -0700 (PDT)
Message-ID: <3f6cd361-6349-433e-a7b7-8cc72b31b84e@gmail.com>
Date: Tue, 1 Sep 2026 18:01:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH 3/5] xen/riscv: make Svpbmt no longer a required extension
To: Baptiste Le Duc <baptiste.le-duc@vates.tech>
Cc: xen-devel@lists.xenproject.org, zhangzheng@iscas.ac.cn,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>
References: <1787844438.8631fc262581453bbf619ec5b2062170.1a043d52a06000c4f3@vates.tech>
 <1787844809.8631fc262581453bbf619ec5b2062170.1a043dad34e000c4f3@vates.tech>
 <59555237-425d-47f0-80b6-b7273cc8d6ec@gmail.com>
 <1788168989.8631fc262581453bbf619ec5b2062170.1a0572d6c8c000c4f3@vates.tech>
Content-Language: en-US
In-Reply-To: <1788168989.8631fc262581453bbf619ec5b2062170.1a0572d6c8c000c4f3@vates.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ef75cf/1788278508-A78D1AE4-A49D3CD5/10/73395122804
X-purgate-type: spam
X-purgate-size: 3687



On 8/31/26 11:36 AM, Baptiste Le Duc wrote:
> On 2026-08-28 17:58 +0200, Oleksii Kurochko wrote:
>>
>>
>> On 8/27/26 5:33 PM, Baptiste Le Duc wrote:
>>> required_extensions[] panics at boot if Svpbmt is missing, which is a
>>> problem on hardware that doesn't implement it.
>>
>> Based only on this sentence it isn't clear why it is safe to have SvPBMT
>> = n and what guarantees that if some memory for a device dma for example
> 
> Sorry I'm not used to this kind of terminology, does Svpbmt = n means that MT
> bits ([62:61]) are equal to 0 = PMA?

Yes, exactly. Sorry for the confusion; by "Svpbmt = n" I meant that the 
Svpbmt extension is not available/implemented on the platform.

> 
>> should be non-cachable and strongly ordered what will guarantee that.
>>
>> So basically something like that should be added to the commit message:
>> ```
>> Without the Svpbmt extension, memory attributes (such as cacheability
>> and ordering) are strictly tied to physical address ranges and enforced
>> by the hardware's Physical Memory Attributes (PMA) checker.
>>
>> In this configuration, supervisor software relies on the platform's
>> memory map: peripheral device registers (MMIO) are physically mapped
>> into hardware-defined I/O regions (which are implicitly non-cacheable
>> and strongly-ordered), while regular RAM is mapped as cacheable main
>> memory.
>>
>> S-mode paging can safely map these physical ranges without specifying
>> page-based memory types in the PTEs, as the hardware MMU and PMA
>> pipeline will correctly bypass caches for MMIO accesses based on the
>> target physical address.
> I think this could go in the previous paragraph as it only concerns
> of the configuration you mentionned.
> 
>> Furthermore, on platforms that either feature
>> fully hardware-coherent DMA or do not expose non-coherent DMA agents to
>> the OS, page-level programmatic cache control via Svpbmt is not
>> required, making it safe to boot and run when Svpbmt is absent.
> If we have a platforms that doesn't have both of these feature, what
> would happen?

Regarding your question about what happens if a platform has 
non-coherent DMA and also lacks Svpbmt:

In that scenario, we must rely on other standard RISC-V mechanisms to 
guarantee coherence. Typically, this is handled in one of two ways:

1. PMA-backed non-cacheable memory pools: The operating system or 
hypervisor must allocate DMA buffers from a specific physical address 
range that the hardware's Physical Memory Attributes (PMA) checker 
defines as implicitly non-cacheable.
2. Software-managed cache coherence (Zicbom): If we must allocate DMA 
buffers from regular cacheable RAM on a non-coherent platform, the 
platform must implement the Zicbom extension. Software (Xen/Linux) will 
then use Cache-Block Operations (CBOs) like `cbo.clean`, `cbo.flush`, 
and `cbo.inval` to manually flush and invalidate caches before and after 
DMA transactions.
3. Some platform specific solution...

So indeed, there are several hardware design combinations, but compliant 
platforms without Svpbmt must either enforce coherence in hardware, 
provide dedicated non-cacheable physical memory via PMA, or implement 
Zicbom for software-managed coherence.

> Do we need to add a check in Xen code?

Good question. Generally, it would definitely be good to check this, but 
I’m not sure how we could do that at runtime.

The best approach I have in mind is to require the user to explicitly 
set a RISCV_ISA_SVPBMT configuration option (which doesn’t exist yet and 
would need to be introduced) if the platform supports SvPBMT.

~ Oleksii

