Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75536C53200
	for <xen-devel@archiver.kernel.org>; Wed, 29 Jul 2026 15:23:40 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1376250.1623089 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wp67u-0003VQ-9I; Wed, 29 Jul 2026 15:23:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1376250.1623089; Wed, 29 Jul 2026 15:23:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wp67u-0003VJ-6n; Wed, 29 Jul 2026 15:23:22 +0000
Received: by outflank-mailman (input) for mailman id 1376250;
 Wed, 29 Jul 2026 15:23:21 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wp67t-0003VD-7D
 for xen-devel@lists.xenproject.org; Wed, 29 Jul 2026 15:23:21 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wp67s-00Ak1U-Jw
 for xen-devel@lists.xenproject.org; Wed, 29 Jul 2026 17:23:20 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a6a1ad3-bab6-0a2a0a5309dd-0a2a4508cab4-32
 for <xen-devel@lists.xenproject.org>; Wed, 29 Jul 2026 17:23:20 +0200
Received: from [209.85.128.42] (helo=mail-wm1-f42.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a6a1ae8-f659-0a2a45080019-d155802ab4d8-3
 for <xen-devel@lists.xenproject.org>; Wed, 29 Jul 2026 17:23:20 +0200
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-495635a85d2so8512315e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 29 Jul 2026 08:23:20 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-496e8e06f7csm72511015e9.0.2026.07.29.08.23.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Jul 2026 08:23:19 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:Content-Language:References:Cc:To:From:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785338600; x=1785943400; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xnei6A7l1mI7PBSmafOSXraeR60REciey6GvXxBvLms=;
        b=c00i0pVSxBpAKOKe3VjDDXL0XQeMj2j/Who+XMtncGQTN0OXbOM3xWczj/hDiVLxH6
         DR5NoQC4fJsALeF7At9N8Hw/L4SHq8Xg1Aa1BJc3IEQ/biDTiQ57ypvRVYuvjpILzEbm
         JBLmToHdG1GQsJC09Qg2V+ZtpXa6LQmHePLT2QTTfbERk2NydJzcfEyrektC5lV/TvFR
         CW6U0567ePbO5GHrz3/9sPDiG7JNcvBNVcMF5A+kCNdm/P6T2L6Q9AGTYHlrEeAj0noU
         wHJPvZ7Gi0zCifohppcQBeet71kML1mE7G9ZQ6+x0s3SKsdPtBbLdrtXbomledo53ILP
         8qLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785338600; x=1785943400;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xnei6A7l1mI7PBSmafOSXraeR60REciey6GvXxBvLms=;
        b=LyjxYJwFh2Z9IEMB8Xbk+N5JfZd8G/YPYbD03aEVPRPJ1pAyUEoxvY9UepOp6BuW7g
         OMazEE/9VWWr0pRQPJ/gl2mKFVbuKIPevZzLZZTuBdnUQEH2d23Lc+QK4o9vj8X07HlS
         p2HtegaJqvoSflO++g1NI2PQ+QlMNUCQhTZJrpZzy0psw07P84yspevsyLeWVVgh4eCt
         cWHse2U8q/cVjRx9pFyCYahKCaDaECuHNMsIXN/2J8ARzN/5oFzEkJwcOv2ekicnSr2k
         qX6OqiikF1dAQZYk2hVhOQRkfPzMSa4BIyNkoiQlfouzyev/ZZQSZybjL4PXlVMSSxff
         cyfQ==
X-Forwarded-Encrypted: i=1; AHgh+Roi9uGfLuoz96HBn62kRh6P65afdq2wK3GWHZAVneDODd4271rFvibxj6D9u7NXUSVYD9g8gEUdFXI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YylSndG+z0gONOFay3Z0hG68ursV7GksZtdiMzWhf5752HWpjQy
	1dzH0JTTC8wzFvvRwy4w0Axp9jPuLqZPIL+fZ1oS7+tooMsfFF7FWtl/
X-Gm-Gg: AR+sD101ePB6EWR0fhd6W+N/mXaBZNKyNw1jUa6ULXMiiPC3vqEkNQPG9jN6uG9lr4X
	BiXPAZPERx2tvDBv6o8U5RWyZ8hg5Qp531cm6sFWRe+Pdd/CwvfmObGqvqLGoc0WTFmgidOqjGK
	fOGc6R+pIHnXMoH6i3lPHqP+TpfML3Ng7gEG0OHEhABqz6RhQLm3R3GIgnk43S807r0mbGbSkc9
	JHbACZ5Osc1732SYAFY5hn5jRkrfvP5CzU/U/T6rCNDMOerwgkGfLrpWm0rXGvUtsm6BoWldaDk
	K6RwjiPTFrFqZgTV+tSLyo3qvs3gNbmSjeDcdfBjz+xmotozPlspQ5uPc7zJoZ2owasU6akR4RI
	NK8WvC0TJcF1wqN6rhivwAoVQAXUEMA7OCWFyHCKUsR0ZtlXJIzgAZFrygyoUJP7uJCludhI2/m
	rwDUM6lXiz/Rzb551us5cvql7135pIxDHX/D1g7rCm8bRHQ/+dX3WUfKq+srhtFCDtlLAVedGGp
	88P1Yr2DhCEwdGViO/mGJmZ1ElaHcVvcupKa618UFRXaOXiHht6Kw==
X-Received: by 2002:a05:600c:1f8c:b0:495:52a5:8829 with SMTP id 5b1f17b1804b1-496c642c7e2mr89454055e9.11.1785338599842;
        Wed, 29 Jul 2026 08:23:19 -0700 (PDT)
Message-ID: <756041b3-14e2-4c1d-bbee-548ca3bea349@gmail.com>
Date: Wed, 29 Jul 2026 17:23:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 18/23] xen/riscv: implement IRQ routing for device
 passthrough
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
References: <cover.1784559209.git.oleksii.kurochko@gmail.com>
 <c489a420b1c01c5312773c2e2b51f63d3babf855.1784559209.git.oleksii.kurochko@gmail.com>
 <c64fc958-73bb-44ed-a3b2-dc368ce675ac@suse.com>
 <6cebc63c-2f21-4ef8-ab10-e2ec62f887b7@gmail.com>
 <534eef4c-7f5d-4565-97b8-e0cc3b3290c2@suse.com>
 <5c5f04e2-56fb-42b5-b49c-faebac313c54@gmail.com>
Content-Language: en-US
In-Reply-To: <5c5f04e2-56fb-42b5-b49c-faebac313c54@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c1860d/1785338600-CD74B87B-BCF8DCB9/10/73395122804
X-purgate-type: spam
X-purgate-size: 2504



On 7/29/26 5:02 PM, Oleksii Kurochko wrote:
> 
> 
> On 7/29/26 4:15 PM, Jan Beulich wrote:
>> On 29.07.2026 13:59, Oleksii Kurochko wrote:
>>> On 7/23/26 3:30 PM, Jan Beulich wrote:
>>>> On 20.07.2026 17:59, Oleksii Kurochko wrote:
>>>>> +/* Route an IRQ to a specific guest */
>>>>> +int route_irq_to_guest(struct domain *d, unsigned int virq,
>>>>> +                       unsigned int irq, const char *devname)
>>>>> +{
>>>>> +    struct irqaction *action;
>>>>> +    struct irq_guest *info;
>>>>> +    struct irq_desc *desc;
>>>>> +    unsigned long flags;
>>>>> +    int retval = 0;
>>>>> +
>>>>> +    if ( d->is_dying )
>>>>> +        return -EINVAL;
>>>>> +
>>>>> +    desc = irq_to_desc(irq);
>>>>> +
>>>>> +    /*
>>>>> +     * release_irq() frees this action via xvfree(), relying on 
>>>>> action
>>>>> +     * being the first member of struct irq_guest so that &info- 
>>>>> >action
>>>>> +     * coincides with info itself. Guard the layout so a future field
>>>>> +     * reorder can't silently turn that into a free() of a mid- 
>>>>> allocation
>>>>> +     * pointer.
>>>>> +     */
>>>>> +    BUILD_BUG_ON(offsetof(struct irq_guest, action) != 0);
>>>>
>>>> Can't release_irq() simply use container_of()? One way or another it 
>>>> feels
>>>> like you're painting yourself into a particular corner ...
>>>
>>> If it isn't the best option then it is needed to follow they way we had
>>> before:
>>
>> I don't understand why you think you need to go back.
> 
> Because, based on your reply—specifically, "One way or another it feels 
> like you're painting yourself into a particular corner..." — it seems 
> that even if I replaced BUILD_BUG_ON() with container_of() in 
> release_irq(), you would still consider it a bad solution. Did I 
> misunderstand your point?

One more thing: I'm not really sure it's safe to do the following in 
release_irq():

if ( action->free_on_release )
     xvfree(container_of(action, struct irq_guest, action));

release_irq() is a generic API, but this kind of allocation is only 
needed for guest IRQs. Wouldn't it be better to set:

action->free_on_release = false;

for guest IRQs, and then free the memory in release_guest_irq() after 
the call to release_irq()?

Wouldn't that be a better approach than calling 
`xvfree(container_of(...))` from within the generic release_irq()?


~ Oleksii

