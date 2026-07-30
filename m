Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FD6AC55162
	for <xen-devel@archiver.kernel.org>; Thu, 30 Jul 2026 11:32:00 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1377650.1623579 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wpOzN-0003CP-RT; Thu, 30 Jul 2026 11:31:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1377650.1623579; Thu, 30 Jul 2026 11:31:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wpOzN-0003CI-OW; Thu, 30 Jul 2026 11:31:49 +0000
Received: by outflank-mailman (input) for mailman id 1377650;
 Thu, 30 Jul 2026 11:31:49 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wpOzM-0003CA-U4
 for xen-devel@lists.xenproject.org; Thu, 30 Jul 2026 11:31:49 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wpOzK-00HNMU-W6
 for xen-devel@lists.xenproject.org; Thu, 30 Jul 2026 13:31:47 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a6b3622-bab6-0a2a0a5309dd-0a2a4508b2bc-2
 for <xen-devel@lists.xenproject.org>; Thu, 30 Jul 2026 13:31:46 +0200
Received: from [209.85.128.42] (helo=mail-wm1-f42.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a6b3622-f659-0a2a45080019-d155802aa5c5-3
 for <xen-devel@lists.xenproject.org>; Thu, 30 Jul 2026 13:31:46 +0200
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-495437bb891so5488325e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 30 Jul 2026 04:31:46 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47fc88d7097sm5329959f8f.5.2026.07.30.04.31.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Jul 2026 04:31:45 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1785411106; x=1786015906; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cAZumL/Aqc7BPMoLy5wLpf6cWCOxSKCjfqYITDKbJx8=;
        b=DfeN6qotOMRR4qoXyfMVgip8KJSKz0XuRQpjyWgKoBqfuh4EKRsMPYyfzQJM1HXLEu
         s5qWfrRgMPbtVAsS6fRQObjItaG43Hh3eOvMjYuGGH+QZ9qdclU90XwnrJvXXN4dRLpO
         FD72m6wn4k0hjURTgBNkCkWiqXtjIFFGLV5U06+UwOfeP8JK30vYBVIUDW4ucXeDezxu
         bkgkE1BlZUCdxRmyLQAarW0lgZxTNJTuG5z2orYmasj2tlHckLjF0kHEFcHRqwNuF6uQ
         JX1OowovV+Z22gaykaEe9I8U4/YEQtC7x77oEygoSpiqpesDW2tiIgthgMrz+ua+ZWem
         7P8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785411106; x=1786015906;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cAZumL/Aqc7BPMoLy5wLpf6cWCOxSKCjfqYITDKbJx8=;
        b=A/zMWk4q0NN0qVXk0jaZRevc4bnTKF/KGq+bN+1/hbZmNmDG7JiHsEEJQ4T44q1spf
         FhaD80jWlffm9KKz3CSOMA8QvnXJarY4iG+Jm9+KmnXw96JKKgW2HMivWiyDFSUTq8cB
         jFDjAhh8ORFnbdCus6QFgNxDG2QvCcNob4LWCpvSzJa+rWfo97LoA919SztvQiTYKSYr
         JWZeUoEzX9M7jkC3+UODLeByqlaCBKufzpr628ixHeI1jZVcqTe/L3M0JSXdRfrfIX3+
         62h4v5FVdhstNVbhRC9DqC1yl1hJlHCDV/XitUTZRlGP+PrQjrP/16UsjtOlHu9OGp5f
         26oQ==
X-Forwarded-Encrypted: i=1; AHgh+RpudzeZwCacmDb2kKPA2Si2ysiElIpY+oFxYnT6s6ykNn2NYEaLVBBX5QeT32fxa6iEP0v8+ZL6DBg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxRFJijUmAepPKLaBklY1XeZbAgbfeRoAYW7Tl2jRwaEyRV8yOP
	WD31Ts076trvnwDvwsXhaFDLZjY4WXMXuYhVotkc8Do31HSBiQEQDJbG
X-Gm-Gg: AR+sD1346qCNXUKa+92mXs3x1Q4MQLAI8BznW/VdXbL5Eu9bM4V24ohJKV6Q878oNVK
	VrFbqtXlnAqFbHDalI5z36EeNrGXi8Df4tR25bRsj89aUEdgem8cgAYIlvH1VY24DlK1BYec26m
	8IvK7p/6TwcosynRi4bAWJElTf8TVtXKUkzvumsBAonshmjBC7a5rsbPEqABNPrVJENdZ8nfFAU
	DzEZgllBZa1x0LMh2VBMP9bFi1gbitZ17rIF6ZAK9rSPljR2PmodjTlfpFat4p8wcTzj7vO1/4f
	JpEbJ8zBhZu+W5sNlbqRXY6koaSEFMoqj8A3Ed27EMFik6fGA53TMY3pdGtDf0SvuGqII8DyTX5
	G22cSnPMBuCr0KQsMEx5q8HAmlwGJEcfyhvOzBWDTzBXIbNlNrxLVee4VfWY6T1JI1F4/q49DSz
	i9kbm6wZPkLpzrOxvx27/f6XjF6lbMG+jkZiDXF3iOZ515T/8PmPpoWJT4hXoj2/U0gWNEDuDUo
	9LtfOLDukevn3VnEoR9wuucwUNDWoM0lubrL3UUjbk=
X-Received: by 2002:a05:600c:4847:b0:495:5ed2:3756 with SMTP id 5b1f17b1804b1-49801f19b4emr15830665e9.16.1785411106062;
        Thu, 30 Jul 2026 04:31:46 -0700 (PDT)
Message-ID: <e7d1775d-3c91-43d1-b7a7-30600dcd23dd@gmail.com>
Date: Thu, 30 Jul 2026 13:31:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 18/23] xen/riscv: implement IRQ routing for device
 passthrough
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
 <756041b3-14e2-4c1d-bbee-548ca3bea349@gmail.com>
 <ea3417c9-bf6a-4b07-9a74-d9a767a87c9e@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <ea3417c9-bf6a-4b07-9a74-d9a767a87c9e@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c1860d/1785411106-D534D87B-575496D0/10/73395122804
X-purgate-type: spam
X-purgate-size: 4148



On 7/30/26 9:18 AM, Jan Beulich wrote:
> On 29.07.2026 17:23, Oleksii Kurochko wrote:
>>
>>
>> On 7/29/26 5:02 PM, Oleksii Kurochko wrote:
>>>
>>>
>>> On 7/29/26 4:15 PM, Jan Beulich wrote:
>>>> On 29.07.2026 13:59, Oleksii Kurochko wrote:
>>>>> On 7/23/26 3:30 PM, Jan Beulich wrote:
>>>>>> On 20.07.2026 17:59, Oleksii Kurochko wrote:
>>>>>>> +/* Route an IRQ to a specific guest */
>>>>>>> +int route_irq_to_guest(struct domain *d, unsigned int virq,
>>>>>>> +                       unsigned int irq, const char *devname)
>>>>>>> +{
>>>>>>> +    struct irqaction *action;
>>>>>>> +    struct irq_guest *info;
>>>>>>> +    struct irq_desc *desc;
>>>>>>> +    unsigned long flags;
>>>>>>> +    int retval = 0;
>>>>>>> +
>>>>>>> +    if ( d->is_dying )
>>>>>>> +        return -EINVAL;
>>>>>>> +
>>>>>>> +    desc = irq_to_desc(irq);
>>>>>>> +
>>>>>>> +    /*
>>>>>>> +     * release_irq() frees this action via xvfree(), relying on
>>>>>>> action
>>>>>>> +     * being the first member of struct irq_guest so that &info-
>>>>>>>> action
>>>>>>> +     * coincides with info itself. Guard the layout so a future field
>>>>>>> +     * reorder can't silently turn that into a free() of a mid-
>>>>>>> allocation
>>>>>>> +     * pointer.
>>>>>>> +     */
>>>>>>> +    BUILD_BUG_ON(offsetof(struct irq_guest, action) != 0);
>>>>>>
>>>>>> Can't release_irq() simply use container_of()? One way or another it
>>>>>> feels
>>>>>> like you're painting yourself into a particular corner ...
>>>>>
>>>>> If it isn't the best option then it is needed to follow they way we had
>>>>> before:
>>>>
>>>> I don't understand why you think you need to go back.
>>>
>>> Because, based on your reply—specifically, "One way or another it feels
>>> like you're painting yourself into a particular corner..." — it seems
>>> that even if I replaced BUILD_BUG_ON() with container_of() in
>>> release_irq(), you would still consider it a bad solution. Did I
>>> misunderstand your point?
>>
>> One more thing: I'm not really sure it's safe to do the following in
>> release_irq():
>>
>> if ( action->free_on_release )
>>       xvfree(container_of(action, struct irq_guest, action));
>>
>> release_irq() is a generic API, but this kind of allocation is only
>> needed for guest IRQs. Wouldn't it be better to set:
>>
>> action->free_on_release = false;
>>
>> for guest IRQs, and then free the memory in release_guest_irq() after
>> the call to release_irq()?
> 
> Perhaps.
> 
>> Wouldn't that be a better approach than calling
>> `xvfree(container_of(...))` from within the generic release_irq()?
> 
> Perhaps.
> 
> What I'd really like to see you do is come up with an approach that is
> both self-consistent and future-proof. With the latter aspect meaning that
> it should be (reasonably) easy to identify places that need changing if
> e.g. the "->free_on_release is only ever one value" property goes away.
> 

An approach with action->free_on_release = false; together with 
vfree(info) in release_guest_irq() seems to be the best option. Since 
action is no longer allocated dynamically, it should not be freed 
through free_on_release, so setting it to false makes that explicit. 
Additionally, guest IRQs have extra state (struct irq_guest), and it is 
the responsibility of release_guest_irq() to clean it up.

This also keeps the semantics of ->free_on_release consistent for Xen 
IRQs. If it is set to true, release_irq() is responsible for freeing 
struct irq_action; if it is false, release_irq() should not free it.

For guest interrupts, release_irq() should not free anything because 
struct irq_action is embedded in struct irq_guest, which is freed by 
release_guest_irq(). If, in the future, guest interrupts need 
->free_on_release = true, the only required change would be to allocate 
struct irq_action dynamically and set ->free_on_release = true. All 
other is already covered. That makes the design, in my opinion, 
self-consistent and future-proof.

~ Oleksii

