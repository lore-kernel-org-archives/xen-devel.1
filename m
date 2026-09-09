Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A536C79FB7
	for <xen-devel@archiver.kernel.org>; Wed,  9 Sep 2026 14:05:29 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1413151.1643391 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4Iv0-0004gZ-7O; Wed, 09 Sep 2026 14:04:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1413151.1643391; Wed, 09 Sep 2026 14:04:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4Iv0-0004gS-4o; Wed, 09 Sep 2026 14:04:54 +0000
Received: by outflank-mailman (input) for mailman id 1413151;
 Wed, 09 Sep 2026 14:04:53 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1x4Iuy-0004gM-VV
 for xen-devel@lists.xenproject.org; Wed, 09 Sep 2026 14:04:53 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x4Iuy-007xwJ-CH
 for xen-devel@lists.xenproject.org; Wed, 09 Sep 2026 16:04:52 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6aa16733-bab6-0a2a0a5309dd-0a2a4502e872-18
 for <xen-devel@lists.xenproject.org>; Wed, 09 Sep 2026 16:04:52 +0200
Received: from [74.125.228.140] (helo=mail-ej2-f12.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6aa16784-6ca4-0a2a45020019-4a7de48ca899-3
 for <xen-devel@lists.xenproject.org>; Wed, 09 Sep 2026 16:04:52 +0200
Received: by mail-ej2-f12.google.com with SMTP id
 a640c23a62f3a-c254f9f0b1fso164224766b.2
 for <xen-devel@lists.xenproject.org>; Wed, 09 Sep 2026 07:04:52 -0700 (PDT)
Received: from [172.19.143.248] (IW396200.net.t-com.hr. [195.29.234.54])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c260d4a9cbbsm789027466b.13.2026.09.09.07.04.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Sep 2026 07:04:50 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1788962692; x=1789567492; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N/qLeRGKLFe1TR3mDBZ/zQ19jESJ0lDOanHFh7sul2g=;
        b=A2cNpnO9bX11hWa2bddqIMEk9LJMiEvSr3Sq1j60nXB3TIG1KqiBOTDBQpJIbVusr/
         jTPAFHGPXwt76lq4QYhoYYlxedpDTqFkI2v80fTHQSMcjuIafvPnspm2IFgyoYLRHqM5
         1b2OJAlhXuMVh40u2xa+MvHEqyqsj4Jfun3N4fJhqvb7LxxmN11xjUE5lOCXWy1nrdn0
         rd6cS/AyVMv+XojU87XKAjczdGj59icECQFXSan30ZU0A7A2NObHs4K4tp+33z3f6jHT
         bcVWd9i/txF+SM24PDl1E/E+scLHiWzm6+WOLTyqd+E2+W1oQXwPJC+50x9dDzISRwlx
         3PRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788962692; x=1789567492;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N/qLeRGKLFe1TR3mDBZ/zQ19jESJ0lDOanHFh7sul2g=;
        b=Fc7cJgcJmqwgymz5ocSEo4yf8DRoXVHsAuVOyDgML8GLej2HJDi8EGk9+UWVmnTrO+
         +eK8VhMTKiQ5lgZ+C6974VzqzLBszpTJk0+8gK6rXIgLZpJEsMev/tPNaU1Qf+EtSbkz
         wOU0vC04wR8RJW+0f9d9cdpLPqnou0uFJPG1jfsCzxhK8nbmP3xNoPQQ8ORqtE8OZfFb
         VBvSVmhx3AMqTORugW9ugTj/P61n4FkqRhzguQmZmIXsHb2ulDfF2VhOafBrIgg2fVY8
         rmhMLjtKrwoek2/Lvauq8i+2nHjG95mU4wj6nVzRUqdps8NNMWtvks3FO5+c4wBt96tm
         3QUA==
X-Forwarded-Encrypted: i=1; AKwUvByxhUZf88+g5ifYLfnm/x7ntndRQolTem501T+SufmdMiv46fHigI5UqgZEv6boHBQcrfuvWHqX3g8=@lists.xenproject.org
X-Gm-Message-State: AFuF++kXBYrvnxpgYfIeIMcvbqE8DRuQpfvFI4qQ3JuqfmIOCsPDEbT6
	FW/vwzyD7pQICu9DRA31ddkUpj9MHruv3p/PXFxKbTppsD8amKh0wv2O
X-Gm-Gg: AYBFou0D/MYlwZIQXMHCzUp+pUV5nUaEwjFWr2cD6o44A8iwCL2V0YTTLxqkb8Lyk/Z
	QMKQtm0EvADABQ6sA+m6g9fdNJ+/bvaQVCCdGIkQ967TlWk+t34I5pJx1xJfRNSifJHFda2baTT
	ilqW9RyBMfhT4vygIb149UpGt5rewJZrE7C7Ow5sX7gRbObHBW7qkBG5B/SuarX7YbIU2V8cA5K
	lRsv2poAWdcIrliRDNkL+qTfm/IHZpWnAfONVFNgOyQNQVRcXGzvP4vm1FG6w9Wfo1YkjkuYsTt
	+xrwmg4McV1keCvF7C2BiJYdyY+Ejch/s96Gkv98FkKtxQHhjiL0hO1Wj0G1TFIULkQLiF5IpgG
	Z9t5E3J0la+Im5NfZr5bb3dGWTr7Hbkmg6zfyYW8Q3844oKpVQRw7vH6Tzo2upJgRCQko9Q4bqC
	qjk9mcHFDQl+GaY5mJgH8izGE+eFa4Ugop/IjMCjkg1QyUEgHfc1oM0uCy1hSjP47Jmbder7xeP
	5PVBXB9Errmbqvglj+zad/VNJBjsdAA
X-Received: by 2002:a17:907:a313:b0:c21:752f:c44e with SMTP id a640c23a62f3a-c292b190470mr548936866b.16.1788962691446;
        Wed, 09 Sep 2026 07:04:51 -0700 (PDT)
Message-ID: <926c0356-efb9-4eb7-a7e7-d57e9bdc96c1@gmail.com>
Date: Wed, 9 Sep 2026 16:04:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/39] xen/riscv: introduce device-agnostic MMIO
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
References: <cover.1787838835.git.oleksii.kurochko@gmail.com>
 <a74ff916f76fb95e1e44bfadd45fbc477df00c51.1787838835.git.oleksii.kurochko@gmail.com>
 <d8086443-2076-4dbf-b756-217f83234d33@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <d8086443-2076-4dbf-b756-217f83234d33@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-720697/1788962692-662A92AC-3ABECD66/10/73395122804
X-purgate-type: spam
X-purgate-size: 3920



On 9/9/26 3:24 PM, Jan Beulich wrote:
> On 27.08.2026 17:20, Oleksii Kurochko wrote:

> 
>> +/*
>> + * Check alignment and dispatch a decoded MMIO access to a registered
>> + * handler. On success (0), info->data holds the read value for loads.
>> + *
>> + * There is no "retry" outcome to handle: find_mmio_handler() returns a
>> + * copy of the matching handler taken under vmmio->lock and the ops
>> + * structures are never freed, so the lookup result cannot go stale
>> + * between finding the handler and invoking it.
>> + */
>> +int do_mmio(mmio_info_t *info, paddr_t fault_addr, unsigned int len)
>> +{
>> +    /* Fault address should be aligned to length of MMIO */
>> +    if ( fault_addr & (len - 1) )
>> +        return -EIO;
> 
> Better first check (or at least assert) that len is a power of 2?

It make sense. I will do then:

     if ( len & (len - 1) || fault_addr & (len - 1) )

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
>> +    if ( !ops || !ops->read || !ops->write || !size || end < addr )
>> +        return -EINVAL;
> 
> "!size || end < addr" can be had shorter as "end <= addr".

I will apply this.

> 
> Whether it's worth checking ops to be non-NULL I question, bit I wouldn't
> insist on dropping the check.
> 

Probably it isn't really needed but just extra check that someone miss 
to provide implementation of ->read, ->write still could be useful. Also 
it is executed only at boot time so not big perfomance impact.


>> +    write_lock(&vmmio->lock);
>> +
>> +    if ( vmmio->num_entries >= ARRAY_SIZE(vmmio->handlers) )
>> +    {
>> +        rc = -ENOSPC;
>> +        goto out;
>> +    }
>> +
>> +    /*
>> +     * The array is kept sorted by base address, so rather than appending and
>> +     * re-sorting, find the slot the new region belongs to and shift the tail
>> +     * up by one.
>> +     */
>> +    for ( i = vmmio->num_entries;
>> +          i > 0 && handlers[i - 1].addr > addr;
>> +          i-- )
>> +        /* Nothing */;
> 
>      for ( i = vmmio->num_entries; i-- > 0 && handlers[i].addr > addr; )
>          /* Nothing */;
> 
> ?

It seems like it will break the code after it.

This breaks cases:
1. On a normal exit (handlers[i].addr <= addr), i is the index of the 
entry that was found, whereas the insertion slot ought to be i + 1. The 
code below, however, uses i as the insertion slot and handlers[i - 1] as 
the left neighbour - an off-by-one.

2.If every entry has a bigger addr than the new one, the loop exits when 
i == 0: 0 > 0 is false, yet i-- has already taken effect, so i == 
UINT_MAX. Then i > 0 is true, leading to a read of handlers[UINT_MAX - 
1] and to memmove() with a size of (num_entries - UINT_MAX).

Case 1 pretty easy to fix, just use proper indexing but case 2 will 
require extra check at least. Thereby I think we could keep here 
original for loop.
> 
>> +    /*
>> +     * Regions are required not to overlap; check both neighbours. Their
>> +     * addr + size cannot overflow, as such regions are rejected above when
>> +     * they get registered.
>> +     */
>> +    overlap = (i > 0 && handlers[i - 1].addr + handlers[i - 1].size > addr) ||
>> +              (i < vmmio->num_entries && end > handlers[i].addr);
>> +
>> +    if ( overlap )
>> +    {
>> +        rc = -EEXIST;
> 
> I fear -EEXIST can be misleading; it generally means _this_ range is
> already covered, not some sub-range thereof.

Then probably EADDRINUSE() would be better.

Thanks.

~ Oleksii

