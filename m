Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1400C54F51
	for <xen-devel@archiver.kernel.org>; Wed, 29 Jul 2026 15:02:51 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1376183.1623080 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wp5ni-0008OM-So; Wed, 29 Jul 2026 15:02:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1376183.1623080; Wed, 29 Jul 2026 15:02:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wp5ni-0008OF-Q1; Wed, 29 Jul 2026 15:02:30 +0000
Received: by outflank-mailman (input) for mailman id 1376183;
 Wed, 29 Jul 2026 15:02:30 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wp5ni-0008O7-7O
 for xen-devel@lists.xenproject.org; Wed, 29 Jul 2026 15:02:30 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wp5nh-00Eqa1-KN
 for xen-devel@lists.xenproject.org; Wed, 29 Jul 2026 17:02:29 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a6a15fa-2eae-0a2a0a5409dd-0a2a4508d2a4-44
 for <xen-devel@lists.xenproject.org>; Wed, 29 Jul 2026 17:02:29 +0200
Received: from [209.85.128.54] (helo=mail-wm1-f54.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a6a1605-f659-0a2a45080019-d1558036f12f-3
 for <xen-devel@lists.xenproject.org>; Wed, 29 Jul 2026 17:02:29 +0200
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-49548aebcd8so7815995e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 29 Jul 2026 08:02:29 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-497fecfccc7sm49217695e9.12.2026.07.29.08.02.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Jul 2026 08:02:27 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1785337349; x=1785942149; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+0rUANCvVWVW0kdzwOfTq0br9fDY8k13zwZAGN6CEZQ=;
        b=XdDUnrZIrxuNg/g851oOpD0REg/hc5ezyy4ZnhMR4r/4JdpDdQH5hiVVy4AEdyk/JH
         3ln5/qPUEP28Ap5y3MwFGlwBU1Edf9ApnDh+4Pp41MNMoS66zB0m3tmoRDTZ7bn0N4L7
         NtGaPVV7d5+SLgGfXevwB53XblQ5k+fRRXP/l2uGzsdR3ddO00Ryxqt7p9S2csb8bfLX
         cOyPK9/hGQ7CcMl8fNsu3IeZl5OzJG9wG1eixxx/Cla1rf4DN6lZzIq7VWFne7sjIal+
         BQ2p6GHily2RkGiMSzGycNOUAg1jfh1u3VWZadFWVyAk1tES6AC32ZZBWFmuVGx/l+jz
         TJaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785337349; x=1785942149;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+0rUANCvVWVW0kdzwOfTq0br9fDY8k13zwZAGN6CEZQ=;
        b=aeDz3LvIMFl7wmpBdv5kCUa0VyECqp9V5bFD//C8YPexmTUSMUB9hqQgcByQ3BOWTr
         Yj09I8LGLi3ZznRCGxOeh6+GL0uSNQT+dGWOXun4qBXJMppOattqdhkDBUDK5X2q80BG
         EyGc/SNSBEuDHLnjbJyFGIexE8XEn2FWwyLjgpcEIQglvTlVWc4h8mAPrlgTc7hDttOR
         kwkxdeffDDM1w0mthXIBa/giNd133wXI9+e5pAx7Oky2+QAjsxOrkYrAlE0O93Olm6Wt
         rPQvFLi590zDfc2KMqEvQfGSVVPx2D3Kt0hy4DS1rwFYXBP74W/vV74mJgL8Y0Z1bWSU
         Il3g==
X-Forwarded-Encrypted: i=1; AHgh+Ro9vTdw/TwMqQBUzrZCvhXeDKHRjjqrY9BohEK+uXXFGNsyiiWACidiu6MQxQmJvzw3XLI7l3sob7o=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy5fsSOO/YMiG8r/0Em0GZPs2GmJ7MUtba5fNh6a0derFdhz7Vf
	iwBcDg6IQZiI022X5sGq1j7tbIKF4Zpf1i7DMQueY7KA5nqPjF97yH4N
X-Gm-Gg: AR+sD13yPOijal5YrmU4fUvUalRtqK4p4Wd46bDQXa8kX24Z7xl67faZXc9DQOpOy6q
	ml2rz2TOf9DSZJ+fD8b7d/9PKw3UWpwEFe/nc2+zsWTt3rSaPoYMTtGXWeFYhCaoploYm5fOWMQ
	V2yOGutXab87wlVGtslOc3qaWR445GA9PBKg+iS+1dLi/N35Uwt7/FiINtX1k3X7J69G39lgnmd
	uF9YdaSEYaUygnzlgAPQ5ejPv0d76CjBB3xOaeCaIDDBC2bMqg7AN9Sak/o8ENfGOaOS9iQgY7v
	j93biIWN4hhBoTwo66voCzXN5TOXbtFbBq0K0ESTiZfHHL5B+yniQtQgzecrGTt7HnvksSq6pr5
	6RWcBPhMBclLmxDp22Ia+hgmg1VKeJSjyCtaft0IXneSB1u/jOGLARKysvO738+kausfbCejOqF
	5Q86dd95cI/inedAAeV5Ej2ZjElvmwIcXiBcQcuGV5uDEXJPv3SmLgELynlEipE7fjJj58Kd6YX
	VNO2O0ZnotIrPXejcKn+jmo7nTc6Ybxz0e8SXR5wI3dXVVh3oAPpQ==
X-Received: by 2002:a05:600c:638f:b0:496:bba5:33a9 with SMTP id 5b1f17b1804b1-496c658ef41mr81282645e9.34.1785337348494;
        Wed, 29 Jul 2026 08:02:28 -0700 (PDT)
Message-ID: <5c5f04e2-56fb-42b5-b49c-faebac313c54@gmail.com>
Date: Wed, 29 Jul 2026 17:02:27 +0200
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
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <534eef4c-7f5d-4565-97b8-e0cc3b3290c2@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c1860d/1785337349-D554C87B-F88F40A9/10/73395122804
X-purgate-type: spam
X-purgate-size: 1720



On 7/29/26 4:15 PM, Jan Beulich wrote:
> On 29.07.2026 13:59, Oleksii Kurochko wrote:
>> On 7/23/26 3:30 PM, Jan Beulich wrote:
>>> On 20.07.2026 17:59, Oleksii Kurochko wrote:
>>>> +/* Route an IRQ to a specific guest */
>>>> +int route_irq_to_guest(struct domain *d, unsigned int virq,
>>>> +                       unsigned int irq, const char *devname)
>>>> +{
>>>> +    struct irqaction *action;
>>>> +    struct irq_guest *info;
>>>> +    struct irq_desc *desc;
>>>> +    unsigned long flags;
>>>> +    int retval = 0;
>>>> +
>>>> +    if ( d->is_dying )
>>>> +        return -EINVAL;
>>>> +
>>>> +    desc = irq_to_desc(irq);
>>>> +
>>>> +    /*
>>>> +     * release_irq() frees this action via xvfree(), relying on action
>>>> +     * being the first member of struct irq_guest so that &info->action
>>>> +     * coincides with info itself. Guard the layout so a future field
>>>> +     * reorder can't silently turn that into a free() of a mid-allocation
>>>> +     * pointer.
>>>> +     */
>>>> +    BUILD_BUG_ON(offsetof(struct irq_guest, action) != 0);
>>>
>>> Can't release_irq() simply use container_of()? One way or another it feels
>>> like you're painting yourself into a particular corner ...
>>
>> If it isn't the best option then it is needed to follow they way we had
>> before:
> 
> I don't understand why you think you need to go back.

Because, based on your reply—specifically, "One way or another it feels 
like you're painting yourself into a particular corner..." — it seems 
that even if I replaced BUILD_BUG_ON() with container_of() in 
release_irq(), you would still consider it a bad solution. Did I 
misunderstand your point?

~ Oleksii

