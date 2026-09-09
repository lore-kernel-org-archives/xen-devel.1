Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDAA7C79FB7
	for <xen-devel@archiver.kernel.org>; Wed,  9 Sep 2026 14:32:57 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1413192.1643418 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4JLv-0001m6-MP; Wed, 09 Sep 2026 14:32:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1413192.1643418; Wed, 09 Sep 2026 14:32:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4JLv-0001lz-Jl; Wed, 09 Sep 2026 14:32:43 +0000
Received: by outflank-mailman (input) for mailman id 1413192;
 Wed, 09 Sep 2026 14:32:42 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x4JLt-0001lt-TO
 for xen-devel@lists.xenproject.org; Wed, 09 Sep 2026 14:32:42 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x4JLt-007tGb-AN
 for xen-devel@lists.xenproject.org; Wed, 09 Sep 2026 16:32:41 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aa16ded-e002-0a2a0a5209dd-0a2a450bbedc-38
 for <xen-devel@lists.xenproject.org>; Wed, 09 Sep 2026 16:32:41 +0200
Received: from [209.85.221.41] (helo=mail-wr1-f41.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aa16e09-b7e8-0a2a450b0019-d155dd29d5a0-3
 for <xen-devel@lists.xenproject.org>; Wed, 09 Sep 2026 16:32:41 +0200
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-482f2ee53e7so4397746f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 09 Sep 2026 07:32:41 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48594172546sm36102224f8f.15.2026.09.09.07.32.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Sep 2026 07:32:40 -0700 (PDT)
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
        d=suse.com; s=google; t=1788964361; x=1789569161; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=niI+hug1B0D87D3cWhx9zMTux9Md3jAEf2XG7mWaltg=;
        b=gesJYAWqmsp0cmbRWyPaSjuQLgAQ2bm03jL3Chq0QbiB5O2PQWYwZlYth0EeTCCJ4R
         WaMn+m4sO5pHhL1SFLjLhinIGeq/5aV/8FCoFKw9noLWINE0PyeUyxE43I7bojYm9KxO
         BS6WpR3BQwxK/Hr+2im3/ci9M3f13/nrblWP0CuTzqjA5dCH2V4sy3bqR6D/tVZG3Ja8
         ePQiPdWBkRavKWzWz1yKkEflUb5rUmuMS4cYjL3lo1l6Y1Y8wJ0UxD6m5tbN29hZL80S
         1RL2yH3FTVAYm17HWu1mW9hzSxxWwAQ/+016Q7kOc7pHodblW+orlDvh/o9L0/il9xPt
         mE2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788964361; x=1789569161;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=niI+hug1B0D87D3cWhx9zMTux9Md3jAEf2XG7mWaltg=;
        b=Ij5Zj9yLvDl2MgQNQVq2Gv3IIjFMOHZq7EBWyMDevohJBMLJRecbuTwj1BEhiucQR5
         /RjWRyYMcy6yF/NHGLdlDfq+tIe4pjVhAWSm0coakzm4MjsYcqx+bpjqSrSkEUQamjtd
         V8evrk7O++ZTyUfh3gGD7vbaUiTQXmJ3JN9xHDkrUoar4eXw3QY57xtEO0nkASwyRvRt
         Wv1N3V3cnm9iVXupfzQc3wJIUsaqZivFPu+G7GQMuBMP7zKY9VWc7uZuQf65t8QogNjE
         b43+fpeod5FjujkUEAuXE12+q5r8LlFGPQpLSYZ4hyfvs2Ohwlv1gTyt4itrsMzB1U/p
         MXNA==
X-Forwarded-Encrypted: i=1; AKwUvBxLtkQOETnAmD+PnFnO2LEiY30ZHVfW+FxZnFVhKbBZYAz2NjmogZH9Ut1imMPCFZtb0gohGUOoOcg=@lists.xenproject.org
X-Gm-Message-State: AFuF++kIELKJVTTh9FFVcy3Phq9+5upB+BHs2rOCcgR5/LyaCQKq9M7R
	Yc1gcJNND1N0wfs+i8CLMtQW1lplk9WdNajcbRM7iaOaJv7nX1/Emqrkvn6HBsV4hA==
X-Gm-Gg: AYBFou3oKfCAhygBe7TjWAoxF8c7nMyJKjNIRK7U6x/M5bivIamytHNTEBjEodhNjFH
	ibwcaRaSefVk0dY/E7kiRKvR3QPAf/ha85RmYhyMznYKjdcr6M5zGYNK2f4/lrNuihvtEeI2VLZ
	WByjGdVpdqG63N9DfkKW8/DB7KF/4MsTX6cCG8qZV0Ks4nW4CGEseZRzNqT5l6lFrHSN4alw9gs
	zUyQE4O1WtPYMyx+EUIsEjgoYagvkSXyUghOTNgRFxsXSgip1XU9PmJ/hDsHfjXrbdCW1bzSucc
	8x9c3PT5idBuL4SuOKZqHkn283q5y75izt66zqmkK05XHuqTmrNV0EuaiwJC8dMM83krBMTnvDA
	V3Cq2jXUHXBSLk4J+hYxj4IXn46Xa6TXytdm+mbnXoxnxZN7/JIvBRKF+R2DCbsPWEQVyoDWuzG
	VG4O6QZn8mtnjsufCaed4Z3HoeGEXdhDMDVuJVh14bCIH2tFSO2dTd0Vd9QKolzRb/QDl+70wXT
	hk+EKIlNAL5ark/WElX14tiWKPGiphXX+anWklsDKHF/9V1NuDIOJf43SLuCit6UEPehoYw/w==
X-Received: by 2002:a05:6000:41db:b0:485:8c17:9768 with SMTP id ffacd0b85a97d-4858c179982mr33005011f8f.42.1788964360610;
        Wed, 09 Sep 2026 07:32:40 -0700 (PDT)
Message-ID: <ac75e531-59aa-4915-a933-9c84518669dc@suse.com>
Date: Wed, 9 Sep 2026 16:32:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/39] xen/riscv: introduce device-agnostic MMIO
 emulation dispatch
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
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
 <a74ff916f76fb95e1e44bfadd45fbc477df00c51.1787838835.git.oleksii.kurochko@gmail.com>
 <d8086443-2076-4dbf-b756-217f83234d33@suse.com>
 <926c0356-efb9-4eb7-a7e7-d57e9bdc96c1@gmail.com>
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
In-Reply-To: <926c0356-efb9-4eb7-a7e7-d57e9bdc96c1@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-42698a/1788964361-190CD9EA-6EE30E4F/0/0
X-purgate-type: clean
X-purgate-size: 3607

On 09.09.2026 16:04, Oleksii Kurochko wrote:
> On 9/9/26 3:24 PM, Jan Beulich wrote:
>> On 27.08.2026 17:20, Oleksii Kurochko wrote:
>>> +/*
>>> + * Check alignment and dispatch a decoded MMIO access to a registered
>>> + * handler. On success (0), info->data holds the read value for loads.
>>> + *
>>> + * There is no "retry" outcome to handle: find_mmio_handler() returns a
>>> + * copy of the matching handler taken under vmmio->lock and the ops
>>> + * structures are never freed, so the lookup result cannot go stale
>>> + * between finding the handler and invoking it.
>>> + */
>>> +int do_mmio(mmio_info_t *info, paddr_t fault_addr, unsigned int len)
>>> +{
>>> +    /* Fault address should be aligned to length of MMIO */
>>> +    if ( fault_addr & (len - 1) )
>>> +        return -EIO;
>>
>> Better first check (or at least assert) that len is a power of 2?
> 
> It make sense. I will do then:
> 
>      if ( len & (len - 1) || fault_addr & (len - 1) )

With more parentheses added, I suppose.

>>> +int register_mmio_handler(struct domain *d,
>>> +                          const struct mmio_handler_ops *ops,
>>> +                          paddr_t addr, paddr_t size)
>>> +{
>>> +    struct vmmio *vmmio = &d->arch.vmmio;
>>> +    struct mmio_handler *handlers = vmmio->handlers;
>>> +    paddr_t end = addr + size;
>>> +    unsigned int i;
>>> +    int rc = 0;
>>> +    bool overlap;
>>> +
>>> +    if ( !ops || !ops->read || !ops->write || !size || end < addr )
>>> +        return -EINVAL;
>>
>> "!size || end < addr" can be had shorter as "end <= addr".
> 
> I will apply this.
> 
>>
>> Whether it's worth checking ops to be non-NULL I question, bit I wouldn't
>> insist on dropping the check.
> 
> Probably it isn't really needed but just extra check that someone miss 
> to provide implementation of ->read, ->write still could be useful. Also 
> it is executed only at boot time so not big perfomance impact.

I questioned merely the checking of ops itself, not that of the ->read
and ->write hooks.

>>> +    write_lock(&vmmio->lock);
>>> +
>>> +    if ( vmmio->num_entries >= ARRAY_SIZE(vmmio->handlers) )
>>> +    {
>>> +        rc = -ENOSPC;
>>> +        goto out;
>>> +    }
>>> +
>>> +    /*
>>> +     * The array is kept sorted by base address, so rather than appending and
>>> +     * re-sorting, find the slot the new region belongs to and shift the tail
>>> +     * up by one.
>>> +     */
>>> +    for ( i = vmmio->num_entries;
>>> +          i > 0 && handlers[i - 1].addr > addr;
>>> +          i-- )
>>> +        /* Nothing */;
>>
>>      for ( i = vmmio->num_entries; i-- > 0 && handlers[i].addr > addr; )
>>          /* Nothing */;
>>
>> ?
> 
> It seems like it will break the code after it.
> 
> This breaks cases:
> 1. On a normal exit (handlers[i].addr <= addr), i is the index of the 
> entry that was found, whereas the insertion slot ought to be i + 1. The 
> code below, however, uses i as the insertion slot and handlers[i - 1] as 
> the left neighbour - an off-by-one.
> 
> 2.If every entry has a bigger addr than the new one, the loop exits when 
> i == 0: 0 > 0 is false, yet i-- has already taken effect, so i == 
> UINT_MAX. Then i > 0 is true, leading to a read of handlers[UINT_MAX - 
> 1] and to memmove() with a size of (num_entries - UINT_MAX).
> 
> Case 1 pretty easy to fix, just use proper indexing but case 2 will 
> require extra check at least. Thereby I think we could keep here 
> original for loop.

Oh, I'm sorry for the bad suggestion then.

Jan

