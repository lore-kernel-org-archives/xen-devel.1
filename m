Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1311CC6B1D
	for <xen-devel@archiver.kernel.org>; Wed, 14 Oct 2026 10:52:22 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1448725.1664761 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGwaX-0006O7-Ei; Wed, 14 Oct 2026 10:52:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1448725.1664761; Wed, 14 Oct 2026 10:52:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGwaX-0006O0-Bn; Wed, 14 Oct 2026 10:52:01 +0000
Received: by outflank-mailman (input) for mailman id 1448725;
 Wed, 14 Oct 2026 10:52:00 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xGwaW-0006Nu-1a
 for xen-devel@lists.xenproject.org; Wed, 14 Oct 2026 10:52:00 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xGwaV-000zxu-EX
 for xen-devel@lists.xenproject.org; Wed, 14 Oct 2026 12:51:59 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6acf5ecb-bab6-0a2a0a5309dd-0a2a4508af28-40
 for <xen-devel@lists.xenproject.org>; Wed, 14 Oct 2026 12:51:59 +0200
Received: from [209.85.221.41] (helo=mail-wr1-f41.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6acf5ecf-f659-0a2a45080019-d155dd29e51f-3
 for <xen-devel@lists.xenproject.org>; Wed, 14 Oct 2026 12:51:59 +0200
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-48441a2ba1bso202320f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 14 Oct 2026 03:51:59 -0700 (PDT)
Received: from [172.20.10.5] (public-gprs376522.centertel.pl. [37.47.102.11])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48de0514ab1sm14639482f8f.0.2026.10.14.03.51.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Oct 2026 03:51:58 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1791975119; x=1792579919; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pJ40mdVF2h3U99L6LSkoNg9S+JOxwfRKomS8IAjHB+w=;
        b=HNAGVhK6Vc1SEerQUM9v79gRy469quGojFQrLpOEGLZSH23W76HrTbLX7aREcXkyp4
         eY0moBlRY+97Z8yuiWbuYehDz2R6N6Qd6ak8qRS7iXzZ9Jq1L3/fSquLigKcG7hMshJ1
         u4QREP9rRr+m9SA13JuksOO/3xeRIoYXF9/208P6l4A6nKXGTYxcFPn+ZZcvZmsTkNFd
         uVV8mHXy6aHIBr3iya+yhR+CFy/vTZLj0hDJHM+sUkV0GHWu8SWkjXGV0WgGtlDQhsOl
         VeZiVsugyLTM7cE9N4BUUTg6f+3miKwblv4/5kql6PjKAzsvkvjbSXsaNW3fr6Ben3/0
         eSHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791975119; x=1792579919;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pJ40mdVF2h3U99L6LSkoNg9S+JOxwfRKomS8IAjHB+w=;
        b=sDV9XRKidAdFJCzgMNmMUzVlIOfEC83VyvvkLq0jlld26zk5zbgFVAIZ5Alv7z0Ai+
         YkN6DGHI/WOCBnkn7nfeHW2r5ZLhK7v4+MIMxiN+OmSihOmuBPc4vT4VbuA9tAi1nsbx
         5TjdtuHgxs2dTzoBe8QgbLBJEK6GIV4zkwY/XlzZQmKLZpTjdmY4P5zds3IRfL9POP6U
         mYjjWGooLvOK27/BZB+ejWUQaMX2my1cXeBx65DxTscIzsFrWZh9mpRFyKcAi/7DPTxR
         tcqRacbMc+UQFykJvxfRRyGLx60OHUIgB0bqXUkgDS109PCt/pHgauPv5ZhTuwtN1AkZ
         1NSA==
X-Forwarded-Encrypted: i=1; AKwUvBwb43EtF0/wb4F3/ovZqjzKlFElB+FkCYv3YwZHBhF3w9fG9SYd/V+6/6vq2Om3OJJjXN4WF0BPEec=@lists.xenproject.org
X-Gm-Message-State: AFq9FYK+3i5PLMF0F+LBVxfGB8wDBJvyiyOCoQl+ZJxPtV3JpYhPbtyg
	l3D2JGKVSM2Mfq3B+oPS84aTVrTFPkZ4lfyaRHpobY5l70/MRIXerWrW
X-Gm-Gg: AYBFou1zSSFPJHYvO3BLvCcXPC3sNuBIzxvoszx3WyUCqLgHNQJ6FHHr4IYAd9NsPfi
	fdCvng7Ezj2Grcid3TrCRkJxUtlschpLkNcNRTv4Cz3EiyEFGcSDNLwCVGd+ADbDp1I/is5nRO4
	puSRR9adrXLnUW15xvJhELMJsQ6Kf3Hp/3wbF+ndZ2+UN20JQ66siJ0YJgCqdYXwBlOquMLEtEI
	cIvle1Ggyhy7bkX4rK/gIuBh6F2NpdQS/KjAGFIoihuKMaDEOn0Tp3TFcRVSD5h0YHMUebtepoi
	UgoChTIwtrvzKRu6TUNRvZCM/K/fccQyRSsakQKTIW3HSPvBrqvlMngiJs0KOgEF1MuF0TPOnuA
	wfgdwPpSEdX2S50061Cfu9pUb7p99wZqS1l3/MLHKomXCbEBOQHo602/eDCARWbCtYNnCumT0rP
	NCEV4irjI44bYAV59R5C7VkE7rpbS7Cmziq3NZYBPMc7IgDB1i+E3ZTsXe//wUTXwN9e7O6R1Br
	VaZEy/hPcCj63dTIHBQmW+r+2pJLSTj0/8notc=
X-Received: by 2002:a5d:6346:0:b0:488:8a3d:b58a with SMTP id ffacd0b85a97d-48dbaaed83fmr22972310f8f.53.1791975118646;
        Wed, 14 Oct 2026 03:51:58 -0700 (PDT)
Message-ID: <66fd20a7-4849-48b9-8030-9154c5100301@gmail.com>
Date: Wed, 14 Oct 2026 12:51:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 06/39] xen/riscv: introduce device-agnostic MMIO
 emulation dispatch
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
 <cafb356d9cc3148d74df846e08c4961da72bea0e.1790779209.git.oleksii.kurochko@gmail.com>
 <aa82fc34-0074-422a-87da-0cab24bb43c8@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <aa82fc34-0074-422a-87da-0cab24bb43c8@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c1860d/1791975119-CED4087B-BE7263B3/10/73395122804
X-purgate-type: spam
X-purgate-size: 4646



On 10/12/26 5:28 PM, Jan Beulich wrote:
> On 30.09.2026 18:18, Oleksii Kurochko wrote:
>> --- a/xen/arch/riscv/include/asm/domain.h
>> +++ b/xen/arch/riscv/include/asm/domain.h
>> @@ -9,6 +9,7 @@
>>   
>>   #include <asm/cpufeature.h>
>>   #include <asm/guest-layout.h>
>> +#include <asm/mmio.h>
>>   #include <asm/p2m.h>
>>   #include <asm/vtimer.h>
>>   
>> @@ -101,6 +102,8 @@ struct arch_domain {
>>       const unsigned long *isa;
>>   
>>       struct vintc *vintc;
>> +
>> +    struct vmmio vmmio;
> 
> This is a decent size structure, so I wonder whether this really wants
> embedding in struct domain. If it was a pointer here (with the struct
> dynamically allocated), the struct definition itself may not even need
> exposing in a header.

Makes sense. I'll make it a pointer allocated in domain_io_init(), with
struct vmmio (along with MAX_IO_HANDLER and struct mmio_handler) moved
into mmio.c (as they then will be used only there), so that 
<asm/domain.h> doesn't need <asm/mmio.h> anymore.

> 
>> --- /dev/null
>> +++ b/xen/arch/riscv/mmio.c
>> @@ -0,0 +1,175 @@
>> +/* SPDX-License-Identifier: GPL-2.0-or-later */
>> +
>> +#include <xen/bsearch.h>
>> +#include <xen/lib.h>
>> +#include <xen/rwlock.h>
>> +#include <xen/sched.h>
>> +#include <xen/string.h>
>> +
>> +#include <asm/current.h>
>> +#include <asm/mmio.h>
>> +
>> +/*
>> + * bsearch() comparator: @key holds the address to look up in its addr field,
>> + * @elem is an entry of vmmio->handlers. Relies on the regions not
>> + * overlapping, which register_mmio_handler() enforces.
>> + */
>> +static int cmp_mmio_handler(const void *key, const void *elem)
>> +{
>> +    const struct mmio_handler *handler0 = key;
>> +    const struct mmio_handler *handler1 = elem;
>> +
>> +    if ( handler0->addr < handler1->addr )
>> +        return -1;
>> +
>> +    if ( handler0->addr >= (handler1->addr + handler1->size) )
>> +        return 1;
>> +
>> +    return 0;
>> +}
>> +
>> +/*
>> + * Return a copy of the matching handler rather than a pointer into
>> + * vmmio->handlers: a concurrent register_mmio_handler() shifts entries
>> + * up to keep the array sorted, so an escaped pointer could refer to a
>> + * different (or torn) entry once the lock is dropped. The copy stays
>> + * valid as the ops structures are never freed.
>> + */
>> +static bool find_mmio_handler(struct domain *d, paddr_t gpa,
> 
> The first parameter here apparently wants to be named currd, much like ...

With having vmmio member of arch_domain struct declared as pointer then 
here it could be const struct domain *currd.

> 
>> +                              struct mmio_handler *out)
>> +{
>> +    struct vmmio *vmmio = &d->arch.vmmio;
>> +    struct mmio_handler key = { .addr = gpa };
>> +    const struct mmio_handler *handler;
>> +
>> +    read_lock(&vmmio->lock);
>> +    handler = bsearch(&key, vmmio->handlers, vmmio->num_entries,
>> +                      sizeof(*handler), cmp_mmio_handler);
>> +    if ( handler )
>> +        *out = *handler;
>> +    read_unlock(&vmmio->lock);
>> +
>> +    return handler != NULL;
>> +}
>> +
>> +static enum io_state try_handle_mmio(mmio_info_t *info)
>> +{
>> +    struct vcpu *v = current;
> 
> ... this variable wants to be named curr. Unless of course there are
> plans to not unconditionally use current here.

Indeed, both always refer to current. I'll rename them to currd and curr
(and make currd a pointer to const while at it).

> 
>> +int register_mmio_handler(struct domain *d,
>> +                          const struct mmio_handler_ops *ops,
>> +                          paddr_t addr, paddr_t size)
>> +{
>> +    struct vmmio *vmmio = &d->arch.vmmio;
>> +    struct mmio_handler *handlers = vmmio->handlers;
>> +    paddr_t end = addr + size;
>> +    unsigned int i;
>> +    int rc = 0;
>> +    bool overlap;
>> +
>> +    if ( !ops || !ops->read || !ops->write || end <= addr )
>> +        return -EINVAL;
> 
> I think this checking goes a little too far: It's absurd for some call site
> to pass NULL into this function. The other three checks are sufficiently
> plausible, albeit I wonder whether this wouldn't want to be an assertion
> then.

Agreed, NULL ops can be dropped. As the callbacks always come from a
static ops structure, I'll turn their check into an ASSERT(). I'd keep
end <= addr as a run-time check though, as the region bounds may be
computed (e.g. from max_vcpus) rather than being constants, and the
overlap check below relies on addr + size not wrapping.

Thanks.

~ Oleksii

