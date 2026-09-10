Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC6CDC79F9F
	for <xen-devel@archiver.kernel.org>; Thu, 10 Sep 2026 10:59:58 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1414428.1644228 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4cVB-00055R-Nn; Thu, 10 Sep 2026 10:59:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1414428.1644228; Thu, 10 Sep 2026 10:59:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4cVB-00055K-LA; Thu, 10 Sep 2026 10:59:33 +0000
Received: by outflank-mailman (input) for mailman id 1414428;
 Thu, 10 Sep 2026 10:59:32 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1x4cVA-00055E-CD
 for xen-devel@lists.xenproject.org; Thu, 10 Sep 2026 10:59:32 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x4cV9-002JFT-6A
 for xen-devel@lists.xenproject.org; Thu, 10 Sep 2026 12:59:31 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6aa28d8a-2eae-0a2a0a5409dd-0a2a4503827a-42
 for <xen-devel@lists.xenproject.org>; Thu, 10 Sep 2026 12:59:31 +0200
Received: from [74.125.228.140] (helo=mail-ej2-f12.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6aa28d92-fae8-0a2a45030019-4a7de48cb08c-3
 for <xen-devel@lists.xenproject.org>; Thu, 10 Sep 2026 12:59:30 +0200
Received: by mail-ej2-f12.google.com with SMTP id
 a640c23a62f3a-c254fa663bfso246516366b.1
 for <xen-devel@lists.xenproject.org>; Thu, 10 Sep 2026 03:59:30 -0700 (PDT)
Received: from [172.19.143.248] (IW396200.net.t-com.hr. [195.29.234.54])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c260d4a98efsm914196766b.14.2026.09.10.03.59.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Sep 2026 03:59:29 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1789037970; x=1789642770; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GzF0hWwqUwZEdjHGiY5HXumqIinPxR0gbzSyfXGV5Lk=;
        b=li5tlNihl9LHdWhI8h1P2bpTNEPvqrHhntSjKQPpAlSma/ugMeCG3hXkWBGh/tBqKD
         tbZDU0TnSjyf8N68SK8wR9FrI3JbvIPcMPut5fPhZPCyy6iyk2IaH7wyDYASee2Qe77S
         uUDc/JcB6DR91n5CuMJ2/a1M9iv+3DFBAbIKGUXQousL4fejDsZYzB3PPFRa+ses0dKL
         HaApD6axxCvLzfqJbMKTWMphz4Qz1H5KrpCVp7rp8urZODfA+pMK1kK28c+KwhXan+3+
         K5B8Bm3qynAfyLo8clsGBJU0bCvHu8CXliI6w5wu/RY733qhg9tHm3aLuI9+Hr1pbILu
         H6wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789037970; x=1789642770;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GzF0hWwqUwZEdjHGiY5HXumqIinPxR0gbzSyfXGV5Lk=;
        b=Uj5xAWIYPqAWhTgBW7fEWkl2pr4VAGIw/YP9yZnS4R3sviRNvIUdJ8q8xaLOwUN3zj
         k0xcpxkoO2rOcp0HhApS7xi+3B4PfoUMBQarM9+ehOUfXFzlc2rOGkxwPYRteDZIsb+i
         ONApvpLkv/cLLmsrcPAV03XQBpEiTuJUUdF40HtOojz5fSsVpTGu8ZMNUHU6VBV4KMHD
         PVQxUL2OgSfFitahfWH0ernQzCixmDtxvx8yfonBMM+P+scqZYg2/r+yKDt61XNjEUbW
         K4tOMMux0J5r/mI45WNvoD+qLK+QBaafLA2RaJDviJqDnWqkETseflQq7UCbn8yf/7pN
         q1pw==
X-Forwarded-Encrypted: i=1; AKwUvByE+hymD7shfW+mmEpkU8de/zRmupCaKcQR0cUUJkxs0GZSETElKCPLeJjv+q88dU31iLVPox7Uzx4=@lists.xenproject.org
X-Gm-Message-State: AFuF++llo+5kHz4x8ksZWSVzvCFyCyPW5Pzva6DgsAmUNOyrJiEyw5iu
	XhmhpJVXl2oPFygOGz17uEu2LcQmbBoVkhyfY6+YpJKIp2wtDGJ6Az7Y
X-Gm-Gg: AYBFou2tFXibYyL8Cx6ABzAsp2mOnYDzbAYkIYOFgAU6Ebq+p2gIuo9QYXZtnTxkPYO
	Fk0+zTn27Ds0BSO+VnOTnVzOasnghVnhNdjxQRO4pBpYdvTyU1jKAcqb0UjzBmaiCHzocKI1NT0
	PMRnjklO4KB6JCDVw3foycl2qQTQ1DgtSAY7JOv0oUUfuGy14WItn7EI1cGoxM96/wfjH58ZuJA
	QAUupkibS8415t/5wQcRqGUpIIcCUk6/nVpqkT+iiqJjY5wvbYI6UwhxqSTnYRJnWxq53U67TFK
	dcHP+Do6yvzarBhSK4AvA5iCNYDkWXsHUN1XrIcFB4Kzc+BeDh/yChCAKomK8QjK22bCcYnXviN
	Q3xn3FGmVVDh+yv+AondEEHhwoIOjM2/OlANURAfgryesN6VlWJFRhDSWHnr5P8bsuy19O6Wker
	btT/YfV/wIXNgKqPLeImEuD5QVVqRh1slOS8hr5fHbU9LrPDfyzasnjnDlTGWKRVTV7tpetOV3W
	QLTv5+O1yXn9EYtBwIFulH3DRUTYTrqcw==
X-Received: by 2002:a17:907:728f:b0:c25:362e:fb8b with SMTP id a640c23a62f3a-c29419f9643mr611700866b.7.1789037970246;
        Thu, 10 Sep 2026 03:59:30 -0700 (PDT)
Message-ID: <487a7efa-e83d-4ae2-8f39-33483161a64d@gmail.com>
Date: Thu, 10 Sep 2026 12:59:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/39] xen/riscv: build the target hart index via
 aplic_hart_field()
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
 <3c7418d64a730ec5e4b2cfd0ecfbbbc6fe0bf7d8.1787838835.git.oleksii.kurochko@gmail.com>
 <a7935767-97f3-46b6-a737-b11fa6dcfd33@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <a7935767-97f3-46b6-a737-b11fa6dcfd33@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-33051d/1789037970-6CCDB4E9-020F4BF4/10/73395122804
X-purgate-type: spam
X-purgate-size: 2248



On 9/9/26 4:52 PM, Jan Beulich wrote:
> On 27.08.2026 17:20, Oleksii Kurochko wrote:
>> @@ -340,27 +338,11 @@ static void cf_check aplic_set_irq_affinity(struct irq_desc *desc, const cpumask
>>   
>>       ASSERT(spin_is_locked(&desc->lock));
>>   
>> -    cpu = cpuid_to_hartid(aplic_get_cpu_from_mask(mask));
>> -    hhxw = imsic->group_index_bits;
>> -    lhxw = imsic->hart_index_bits;
>> -    /*
>> -     * Although this variable is used only once in the calculation of
>> -     * group_index, and it might seem that hhxs could be defined as:
>> -     *   hhxs = imsic->group_index_shift - IMSIC_MMIO_PAGE_SHIFT;
>> -     * and then the addition of IMSIC_MMIO_PAGE_SHIFT could be omitted
>> -     * when calculating the group index.
>> -     * It was done intentionally this way to follow the formula from
>> -     * the AIA specification for calculating the MSI address.
>> -     */
>> -    hhxs = imsic->group_index_shift - IMSIC_MMIO_PAGE_SHIFT * 2;
>> -    base_ppn = imsic->msi[cpu].base_addr >> IMSIC_MMIO_PAGE_SHIFT;
>> -
>> -    /* Update hart and EEID in the target register */
>> -    group_index = (base_ppn >> (hhxs + IMSIC_MMIO_PAGE_SHIFT)) &
>> -                  (BIT(hhxw, UL) - 1);
>> -    value = desc->irq;
> 
> Hmm, only after sending the ack I noticed that there's no masking here, ...
> 
>> -    value |= cpu << APLIC_TARGET_HART_IDX_SHIFT;
>> -    value |= group_index << (lhxw + APLIC_TARGET_HART_IDX_SHIFT);
>> +    cpu = aplic_get_cpu_from_mask(mask);
>> +
>> +    /* Update hart index and EIID in the target register */
>> +    value = MASK_INSR(aplic_hart_field(cpu), APLIC_TARGET_HART_IDX) |
>> +            (desc->irq & APLIC_TARGET_EIID);
> 
> ... but there is masking here. Chopping off bits doesn't look as if it can
> lead to anything good. What's the deal here?

The mask is a no-op: desc->irq < NR_IRQS (1024) always fits the 11-bit 
EIID field, so I'll drop it and add a BUILD_BUG_ON() instead.

Would it be better to:

+    /* desc->irq < NR_IRQS, so it always fits the EIID field */
+    BUILD_BUG_ON(NR_IRQS - 1 > APLIC_TARGET_EIID);
+
+    value = MASK_INSR(aplic_hart_index(cpu), APLIC_TARGET_HART_IDX) | 
desc->irq;

?

Thanks.

~ Oleksii


