Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5766AC43602
	for <xen-devel@archiver.kernel.org>; Thu,  2 Jul 2026 09:33:28 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1351497.1608663 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wfDnI-0000th-Vz; Thu, 02 Jul 2026 09:33:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1351497.1608663; Thu, 02 Jul 2026 09:33:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wfDnI-0000ta-SR; Thu, 02 Jul 2026 09:33:16 +0000
Received: by outflank-mailman (input) for mailman id 1351497;
 Thu, 02 Jul 2026 09:33:15 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wfDnG-0000tU-U5
 for xen-devel@lists.xenproject.org; Thu, 02 Jul 2026 09:33:15 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wfDnG-005Cuz-A9
 for xen-devel@lists.xenproject.org; Thu, 02 Jul 2026 11:33:14 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a463056-e002-0a2a0a5209dd-0a2a450cdfda-28
 for <xen-devel@lists.xenproject.org>; Thu, 02 Jul 2026 11:33:14 +0200
Received: from [209.85.128.42] (helo=mail-wm1-f42.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a46305a-f399-0a2a450c0019-d155802abd9c-3
 for <xen-devel@lists.xenproject.org>; Thu, 02 Jul 2026 11:33:14 +0200
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-493bb510ce4so11732985e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 02 Jul 2026 02:33:14 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-148-111.play-internet.pl.
 [109.243.148.111]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-477db3dbacbsm7516228f8f.4.2026.07.02.02.33.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Jul 2026 02:33:13 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:In-Reply-To:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782984794; x=1783589594; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IY3SZailvwX528iXXlWraiO7f+IYxbdwbGQ0Wrx2rZ0=;
        b=hcROJ4UYxGY7e9MUcifxRDQfZiWebisIt2pS8M+k2AGsPINxrgmc358NnL8f2eG5NQ
         hEarK1JrW5CCHscmlH0n6Yctya5VPZZykRUzKkR02wUYNNT0PCf7nm6FLI3iT/qd6SlF
         dTBXiZCZ8Mib24na6NlgoSXptGU7xaXUWz6B5Un7+VJbtdgh9v8HBfPGith2kMQ51+p/
         yNaHuqsk1N4DSaaG1Hc6aBLYaVMNKoHuqLbKt6vTbb+9D6oX2OBiqa0On3SJwT1CiDRR
         Vxe9oGeiCclDT8IJjMrIsrGtkZHoeuqUz7VkrzspLZuXQOzlwY1OuKaFRDrn/3EaJ4O5
         pt2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782984794; x=1783589594;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IY3SZailvwX528iXXlWraiO7f+IYxbdwbGQ0Wrx2rZ0=;
        b=PnOCrsvkmOPkF3mFrNe3vOLz7AZrqwBnc+9iwoarRjl6EypUlnuVlaPylzCc/fdxR1
         ktZOpkq2h3dqLWaUpXfe7eppb88VqncXB2KHUb4/OFrcIC2ua9+4B66wP6Re1fIuLYvN
         t1CNBSJYBmpasMnFb4j9fM9Ue2SoQB65o3Vcy/XsrRlC2FQd+g7jmDuF1h27LjgrikXu
         2AkY7hZJ4N/RDz73Y0lA3l7qCsr5BAaqqy6895M5Mezu2ut/sc60bIvfoJqq+nxcFnIS
         bSONGmLXn2Fu4XDciNxtNgG3sXMrsDFgT81t6DSsCK956U7M7VX1gRHWc8pEOxHITsLy
         1pag==
X-Forwarded-Encrypted: i=1; AFNElJ9npchuLFoJZyK7I4S+zf0aQ2gXHRXLSJnNT699/tdmcjJLCICi2OMcxCtX9crS4tNmcvHIjHSmFNE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxcMgvkAp14sB+Pv1JlLvIYo84CBf937nTpSKO/Yzob1l1OA3DE
	OK5L2QJhlAjKucO8Nr5R1UFU2fqlvLsKcErvC72H86Qkbn9cptvksqGs
X-Gm-Gg: AfdE7cnZ1Ut7UG2yLvMa3eK6iGXdol/mh2yarmX0BQzlWy18KIMMTiHugvfqijyUUQe
	+s4CBzoiC12HuC8M89f6DvEWjG3/QT8Thz+b7IQmI2ZazjE2CifenkU/oWjuP/tfJ8Q8r/ZW9+z
	pThHVt1bYux2yGdlQ/sdoBQPiaMzeiPJ6cH7oiHb6d65lzR/oqwaRIK7ULdpOb1M9Ef+Mx3Qrl5
	JUimdbwy9dUfbWtmKr+gu1h+I6TMAXb0Pr51l/WmKoN7CPheDFKlIdpJB6awGBGCJgr8rhFwvF4
	q9nCOmhgduofCav+1BXM82sQPYHCce4hdTll6L/6Yov7JHfaYIpov9+ogKyYmJpMwwUrP/zmldj
	sbIPyig8mVSMK6s7hphcjWJy1qs5fhft+fDv1B44bMjy+dsZ5asn5ONpM2cNayM0OoVjcxEqbNZ
	PmvpwRLFrydqOdCII7BSjaxex5sU3QlTySP88xJqlozjf+mAVem3eGFZpT4s6tHRmrAe1ktOo4t
	yxgXQ==
X-Received: by 2002:a05:600c:6308:b0:493:b915:4a6f with SMTP id 5b1f17b1804b1-493c2b38138mr77225745e9.8.1782984793521;
        Thu, 02 Jul 2026 02:33:13 -0700 (PDT)
Message-ID: <91ffc1b2-7648-4185-a2f1-12b30181c8a9@gmail.com>
Date: Thu, 2 Jul 2026 11:33:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 21/25] xen/riscv: implement IRQ routing for device
 passthrough
To: Jan Beulich <jbeulich@suse.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
References: <cover.1782487661.git.oleksii.kurochko@gmail.com>
 <472a77604d35a0bc2a75b71f250fd67b63afde4c.1782487661.git.oleksii.kurochko@gmail.com>
 <ac1a3a08-dc39-4794-ba96-dab4b88c27a3@suse.com>
 <6aafbeb5-2f33-49f4-9d14-937b0bc4d15d@gmail.com>
 <40bcf6b7-306a-419a-bf12-1855f9e589fe@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <40bcf6b7-306a-419a-bf12-1855f9e589fe@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d25034/1782984794-91F23D51-74EF1538/10/73395122804
X-purgate-type: spam
X-purgate-size: 1448



On 7/2/26 8:38 AM, Jan Beulich wrote:

>>>> +    spin_unlock_irqrestore(&desc->lock, flags);
>>>> +
>>>> +    release_irq(desc->irq, info);
>>>> +    xvfree(info);
>>>
>>> If, in release_irq(), action isn't freed, it's ->dev_id field will now have
>>> a dangling pointer. (I think I did point this out before.)
>>
>> It should freed in release_irq() as route_irq_to_guest() always set
>> action->free_on_release = true;
> 
> Well, "free_on_release" must exits for a purpose. I.e. there must be, now
> or soon, cases where it's set to false. Else simply drop the field.
> 

I can't simply remove this field because it is part of the common 
`struct irqaction` and is used by other arc-s. (I assume that it is not 
what you fully meant...)

IIUC, this field is used to determine whether an irqaction is 
heap-allocated (and therefore should be freed) or statically allocated 
(and therefore should not be freed).

At the moment, all IRQ actions are heap-allocated (on RISC-V), so 
free_on_release should always be set to true. In particular, the code 
snippet you asked about releases a guest interrupt, and guest interrupt 
actions are always heap-allocated. As a result, when release_guest_irq() 
calls release_irq(), the associated irqaction will be freed.

So, from what I can see, the current behavior is correct and I think it 
should be left as it is. Do you have any concerns about this?

~ Oleksii



