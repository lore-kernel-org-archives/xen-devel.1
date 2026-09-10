Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EC0AC79F9F
	for <xen-devel@archiver.kernel.org>; Thu, 10 Sep 2026 12:44:48 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1414585.1644331 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4e8e-0007KO-Rj; Thu, 10 Sep 2026 12:44:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1414585.1644331; Thu, 10 Sep 2026 12:44:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4e8e-0007KF-OF; Thu, 10 Sep 2026 12:44:24 +0000
Received: by outflank-mailman (input) for mailman id 1414585;
 Thu, 10 Sep 2026 12:44:23 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1x4e8d-0007K6-76
 for xen-devel@lists.xenproject.org; Thu, 10 Sep 2026 12:44:23 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x4e8c-00FjAJ-FZ
 for xen-devel@lists.xenproject.org; Thu, 10 Sep 2026 14:44:22 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6aa2a621-8faa-0a2a0a5109dd-0a2a45039834-16
 for <xen-devel@lists.xenproject.org>; Thu, 10 Sep 2026 14:44:22 +0200
Received: from [209.85.218.47] (helo=mail-ej1-f47.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6aa2a625-fae8-0a2a45030019-d155da2fcddf-3
 for <xen-devel@lists.xenproject.org>; Thu, 10 Sep 2026 14:44:21 +0200
Received: by mail-ej1-f47.google.com with SMTP id
 a640c23a62f3a-c2941f7229dso198335666b.1
 for <xen-devel@lists.xenproject.org>; Thu, 10 Sep 2026 05:44:21 -0700 (PDT)
Received: from [172.19.143.248] (IW396200.net.t-com.hr. [195.29.234.54])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c2624eb1813sm783481166b.38.2026.09.10.05.44.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Sep 2026 05:44:19 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1789044261; x=1789649061; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4NDpqhkstPr+5DN02O+wj1vjpTXqr33/+64K/uydFXI=;
        b=gNuR2jVsyUHP7YbT7lPxPn3J8dKWpRLI9cUHJTpVVuC5Z7NjK7jGaD7qn6e6qw7JRu
         Epn0GrukqoHufIEpHiI++yV7+cPxUkfHUfQTMB5j4HIJDDvdQzFBIKbKRdQZ3rRSq3RW
         lnnEh3FsDHRM2CbbwxkcvXjPnTUAaBwpy7K5EbJrJ3YnPzqqxaquFpmpSrfuOoZj96k+
         dAyBY1D2qEORGl/r37uyfb2Rh34jQ6SVb3aFqf44itt2O/rI0iLGmVcxXHXqTtSfJvav
         yOxZlyAvkKEWmBasddTxlj1GbAOcwftlbV/JkUDhmEnk5u7kCMG+pSQ3c70iCbvppq/v
         1aPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789044261; x=1789649061;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4NDpqhkstPr+5DN02O+wj1vjpTXqr33/+64K/uydFXI=;
        b=iCrVKfBNZbIRFbmiF8m3jRtjY4C4mrVtrvy1O5HXND0Jd6cIOuF/Zdb4s3ohBtVEww
         zJ+1uuzvTd9C0M+6K+mBU0Gz+lHcE0eKJV4B1QUGBscBkPXOKKs81Xsxk5/UYQVDgBvd
         ShqhzfHj76qkcmUG7Da8HRXYrZoTU/Ug8JzJNoxKPt1pvqSNqj+azZLRSRou01PdSjmX
         hHKsub20qJVHeSPjdDc0lVPqIWjwaO6BOOOm4HlaE6CIOLV06UVtedvrl/7/RhgmbBU7
         ZzOPb48KEyFFVxhyiGU+mIam+EVWASWxw5y53N1606B4Hvp6SOlyRcf0WdNT1GRDTJV4
         ADHA==
X-Forwarded-Encrypted: i=1; AKwUvBzzz4oJ6k841tPVx2c5gOTuZFGQ75JJsyIDWCoqmEtUky1ug3cGOuBRbJSAL8Xhyi2uwBGOW8bGros=@lists.xenproject.org
X-Gm-Message-State: AFuF++lTCiuF70Vn0ZvKpaD2qhUbi/d+lXZwOvA9YzaHhotSRa78JIcq
	G4sdQwielugijYsQt1jlYGNJTkVH65b4jFk2tX8CRMTWfSXE6RqjqH03
X-Gm-Gg: AYBFou1pM6h9jdbjIB35ihV8ogkRUb0/HVdvBiOdeXdI2+Z1AR799jOzFblxURUyS8B
	7N2nVlGOJTiCHtgz3JeFPiof9Wg+aaodGff9nJ7eQikJsBnPuOQ8TI6kLtQ7T49IdLjWG+gjBb8
	VD036kVyk4LA0xvUR9N2ZuEInvqVfx0kGHUz6K0PHQiTd/YWpGMA8Sbsqr18mN697MQnwieydFD
	wrde8gtS5EraU3sEoK/t00d/6pizeGTVtvIl63dZ3LsWIbuyXbZJQOOVBYRxWhpNs4ngLDq9Toz
	HilM79hwto9iaywt/u6JGhtSqwjpeQ7lFl059BxcsvME66NbtOODj/NYcrK90xtwGCnxmnh22xl
	ByN3vQTSeQW1jXRwSN1F2lmpKY3oWJYE6bAQZa81HMeCmkyqgDTfdxSKNDCM8VMqCAQx9e+Y2WF
	JJAjAGwozgXqV08MCqhXTcoB1Da1DYYazCg5pBTbfAjDl5Ted/W4mOiyldDjQO8U4g4wOy3Gkq+
	kTZJYJm1GUNFsCRsPnlP2DeIq7cZ/SVkA==
X-Received: by 2002:a17:907:a08a:b0:c29:3b7e:3a94 with SMTP id a640c23a62f3a-c293b7e3d04mr395916266b.38.1789044261288;
        Thu, 10 Sep 2026 05:44:21 -0700 (PDT)
Message-ID: <744f17cb-de7b-499a-83cb-9f0a122a4605@gmail.com>
Date: Thu, 10 Sep 2026 14:44:16 +0200
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
 <487a7efa-e83d-4ae2-8f39-33483161a64d@gmail.com>
 <9f2245d8-faef-4608-a179-b8e942fdfc1d@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <9f2245d8-faef-4608-a179-b8e942fdfc1d@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-33051d/1789044262-6ECCB4E9-021B25C9/10/73395122804
X-purgate-type: spam
X-purgate-size: 3294



On 9/10/26 1:23 PM, Jan Beulich wrote:
> On 10.09.2026 12:59, Oleksii Kurochko wrote:
>> On 9/9/26 4:52 PM, Jan Beulich wrote:
>>> On 27.08.2026 17:20, Oleksii Kurochko wrote:
>>>> @@ -340,27 +338,11 @@ static void cf_check aplic_set_irq_affinity(struct irq_desc *desc, const cpumask
>>>>    
>>>>        ASSERT(spin_is_locked(&desc->lock));
>>>>    
>>>> -    cpu = cpuid_to_hartid(aplic_get_cpu_from_mask(mask));
>>>> -    hhxw = imsic->group_index_bits;
>>>> -    lhxw = imsic->hart_index_bits;
>>>> -    /*
>>>> -     * Although this variable is used only once in the calculation of
>>>> -     * group_index, and it might seem that hhxs could be defined as:
>>>> -     *   hhxs = imsic->group_index_shift - IMSIC_MMIO_PAGE_SHIFT;
>>>> -     * and then the addition of IMSIC_MMIO_PAGE_SHIFT could be omitted
>>>> -     * when calculating the group index.
>>>> -     * It was done intentionally this way to follow the formula from
>>>> -     * the AIA specification for calculating the MSI address.
>>>> -     */
>>>> -    hhxs = imsic->group_index_shift - IMSIC_MMIO_PAGE_SHIFT * 2;
>>>> -    base_ppn = imsic->msi[cpu].base_addr >> IMSIC_MMIO_PAGE_SHIFT;
>>>> -
>>>> -    /* Update hart and EEID in the target register */
>>>> -    group_index = (base_ppn >> (hhxs + IMSIC_MMIO_PAGE_SHIFT)) &
>>>> -                  (BIT(hhxw, UL) - 1);
>>>> -    value = desc->irq;
>>>
>>> Hmm, only after sending the ack I noticed that there's no masking here, ...
>>>
>>>> -    value |= cpu << APLIC_TARGET_HART_IDX_SHIFT;
>>>> -    value |= group_index << (lhxw + APLIC_TARGET_HART_IDX_SHIFT);
>>>> +    cpu = aplic_get_cpu_from_mask(mask);
>>>> +
>>>> +    /* Update hart index and EIID in the target register */
>>>> +    value = MASK_INSR(aplic_hart_field(cpu), APLIC_TARGET_HART_IDX) |
>>>> +            (desc->irq & APLIC_TARGET_EIID);
>>>
>>> ... but there is masking here. Chopping off bits doesn't look as if it can
>>> lead to anything good. What's the deal here?
>>
>> The mask is a no-op: desc->irq < NR_IRQS (1024) always fits the 11-bit
>> EIID field, so I'll drop it and add a BUILD_BUG_ON() instead.
>>
>> Would it be better to:
>>
>> +    /* desc->irq < NR_IRQS, so it always fits the EIID field */
>> +    BUILD_BUG_ON(NR_IRQS - 1 > APLIC_TARGET_EIID);
> 
> If the question is whether to prefer BUILD_BUG_ON() over BUG_ON(), then:
> Yes please. However, APLIC_TARGET_EIID is a mask (despite its name not
> indicating that), which only happens to start at bit 0. This kind of
> assumption would better be avoided.

Then BUILD_BUG_on should be updated to:

  /* desc->irq < NR_IRQS, so it always fits the EIID field */
     BUILD_BUG_ON(NR_IRQS - 1 > MASK_EXTR(~0U, APLIC_TARGET_EIID));


> 
> This raises another question though: No matter how big a RISC-V system
> is, it can only ever have 1k IRQs? How does that work with a single
> MSI-X device having up to 2k MSIs?

Device MSIs never pass through the APLIC. They are written straight into 
an IMSIC interrupt file. The ID space belongs to each file, so each hart 
has up to 2047 IDs (IMSIC_MAX_ID).

1k it is limitation for wired interrupts (which could be delivered in 
MSI mode where APLIC + IMSIC is needed) which are going through APLIC.

~ Oleksii

