Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34D6ACA5FB1
	for <xen-devel@archiver.kernel.org>; Wed, 30 Sep 2026 11:23:13 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1437059.1655771 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBsOk-0007OF-JW; Wed, 30 Sep 2026 11:22:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1437059.1655771; Wed, 30 Sep 2026 11:22:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBsOk-0007O8-GX; Wed, 30 Sep 2026 11:22:54 +0000
Received: by outflank-mailman (input) for mailman id 1437059;
 Wed, 30 Sep 2026 11:22:53 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xBsOj-0007Ms-FQ
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2026 11:22:53 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xBsOi-00GuEz-SR
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2026 13:22:52 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6abcf10a-e002-0a2a0a5209dd-0a2a4506aeb6-14
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 13:22:52 +0200
Received: from [74.125.225.140] (helo=mail-wm2-f12.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6abcf10c-195a-0a2a45060019-4a7de18cc506-3
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 13:22:52 +0200
Received: by mail-wm2-f12.google.com with SMTP id
 5b1f17b1804b1-49ccf3ca626so32144825e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 04:22:52 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-71-234.play-internet.pl.
 [109.243.71.234]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48b029e51b8sm2908573f8f.20.2026.09.30.04.22.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Sep 2026 04:22:50 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1790767372; x=1791372172; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Vd64KD6sHAawdfevF4/HAY5KEqrKlSapez4IlwY8UEk=;
        b=WJEeBOb+21FTndkU3cLizDdZaod67eECICr/oxE2ZJVvo+u3MVJPr2gPjesA7DUa5F
         YZKR+8gEg0yE6bgx5Ule4qyadbFzcU1qBcJtLrIH+L15Q3QHXw3gAVNqpIIGmTog7nsN
         M3zaxnFPzdHIs3mTPdJtHtagy2ksPpH/BhiwajwyeBAQdJhIVmrPBC4iP5JKXDCqHUek
         p/dmJd3WWNtz0mCrXrcJadNXlvCvlJGhZrM08RxEM/lAgkyFPVH2aYq3hB1ZvfOBAPTz
         0Zz2Xz3Huf8di7W2cv4PFvVtufPTC+0KA7k1P3d/siPQ29PSy414x3wnmJeQyw/qrCES
         7LUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790767372; x=1791372172;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Vd64KD6sHAawdfevF4/HAY5KEqrKlSapez4IlwY8UEk=;
        b=oBT0bB/AZEPq+cAApiFrJgvktS762StEW5iYJ6QVhNXBDuxjZUee4TJnxlRh/CnQPh
         3IR32tbN11yQERA8AAx62SrhDXSntfBcvKTFHTfnt/8x7DwFVOLVz4+t2x4g57ycVr6H
         XKPzP/n2NFS59p4adZ0QxKnWGAodO8M97O7iCvzFT89HuEmSnBEI0HcosYfbxQ94nadY
         3HJAp/s/JDUUImH114N0E6WICm5sMT/CaWixo0RWFsvAriGD7Dn3YZ8z2p+SZEe14dFZ
         RDXckIug4XVPebMbyJ2qB8xCIEU6AnsNV14eaWsPUvjM3QKxijovlDDMFB5gqzkNs0w+
         BgKw==
X-Gm-Message-State: AFuF++kD7akmFVYotcSkyQX/RF4woPjsFGPKDxVxn/FJRK6GdwQKo6tN
	3LLFFYpcYjld45+5tKMQrmoXswHPBHn6mDIr3n7fTgl1Cc0OJoSFkvG4
X-Gm-Gg: AYBFou1vMFamX2UL+mj34gK3+0GbkPgD3CvC//nfEwZJAE8lpmy08MZPKfkCMBUFlUl
	XBE0ZfBPs6PhrjW9R3L9fQb9ln1wedHQSC9sheAaQMhkUGzDNyKZH/lKa8ONAt+YSYX7hdVVJom
	zQCS3kXaMTdrDyfdqatjsbJ5Nit66ihxljAyP8gL4zIVk9EwI1rJbek9AN+n07PqdfaF/nZ42ZB
	ZRpTJRYQ0HsEQeyFt5rFwU4yLiAb5EIH3UlQSMddzFlR5dlPD6da7aUkvNtGbaHzgaTfOvb/pSv
	e8ht0B4PhEx4X1CbmOmvMpzs6C4Er5Xj+AsSoaOYfjnyI+mSIgOLKHW7W5CVp/thOU3Jz7B2eR0
	OORpQoVius5EEC2qLRxDElapFd9kFFQ2QtIb9gPhJCwY8G4kXs/qg522JIAD2z4DdAzuoEhix8S
	v68fr17yIpF0UotcG0PpQwGGuLb+/6I3h6uk6zDUBiX0VemxH1LzshaFuDi2eobA7Tc6xp9dhjB
	yBqchKQFojwoSGRYns0X/1Dj0YVh7gPTpvZap/07W9YK7m6wg==
X-Received: by 2002:a05:600d:82d3:b0:49d:39:90ba with SMTP id 5b1f17b1804b1-4a01ad9da84mr21719485e9.3.1790767371936;
        Wed, 30 Sep 2026 04:22:51 -0700 (PDT)
Message-ID: <8836d1e3-77c8-4447-b1ef-132620a71441@gmail.com>
Date: Wed, 30 Sep 2026 13:22:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 0/1] [RISC-V] replace SBI early console with 8250 UART
To: Zhang Zheng <zhangzheng@iscas.ac.cn>
Cc: xen-devel@lists.xenproject.org,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>
References: <20260928023857.1030884-1-zhangzheng@iscas.ac.cn>
 <5919f1f2-e24c-4b0e-a7dd-126ac6fbe38f@gmail.com> <aronfcYWtc1CHQgH@iscas-ws>
 <3152e70f-881f-4a58-9b2d-df661887dc80@gmail.com> <arpi6szfHazQg07N@iscas-ws>
 <arsr7FV_KDQpyTcS@iscas-ws>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <arsr7FV_KDQpyTcS@iscas-ws>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-16d1c6/1790767372-1EEC477B-617D9C74/10/73395122804
X-purgate-type: spam
X-purgate-size: 6608

Hello Zheng,

On 9/29/26 5:10 AM, Zhang Zheng wrote:
> On Mon, Sep 28, 2026 at 08:53:15PM +0800, Zhang Zheng wrote:
>> On Mon, Sep 28, 2026 at 11:31:06AM +0200, Oleksii Kurochko wrote:
>>>
>>>
>>> On 9/28/26 10:40 AM, Zhang Zheng wrote:
>>>> On Mon, Sep 28, 2026 at 09:38:14AM +0200, Oleksii Kurochko wrote:
>>>>>
>>>>>
>>>>> On 9/28/26 4:38 AM, Zhang Zheng wrote:
>>>>>> The legacy SBI console extension is planned for deprecation. Replace the
>>>>>> RISC-V early printk backend with direct access to 8250 UART MMIO.
>>>>>
>>>>> Won't it better just to start to add support of newer SBI? It provides
>>>>> pretty good support + faster as it supports passing of string instead of one
>>>>> char.
>>>>>
>>>>
>>>> Using the newer SBI DBCN extension would indeed result in a smaller change. At
>>>> the time, I mainly followed the direction suggested by the TODO and referred
>>>> directly to the arm64 implementation, from which most of the code was adapted.
>>>
>>> I think TODO was written at that way because I missed DBCN (or it wasn't
>>> ratified at that moment). Considering that it is ratified now ...
>>>
>>>>
>>>>> Also, I think it will lead to lesser changes.
>>>>>
>>>>
>>>> If falling back to SBI console putchar is acceptable, DBCN should work
>>>> well here.
>>>
>>> ... I prefer to use SBI functionality (in the current case DBCN) as maximum
>>> as possible so if there is no any reason (and I don't see at the moment it)
>>> which doesn't allow us to use DBCN here, I would prefer to use DBCN.
>>>
>>
>> Given that Xen on RISC-V is expected to target relatively recent RVA23 hardware,
>> which should ship with a recent version of OpenSBI, I think you are right that
>> there is no real need to provide a fallback here.
>>
>>> If you still want to in the way suggested by TODO then some parts which are
>>> common between Arm and RISC-V should be moved to common instead of
>>> introducing them in RISC-V specific folder.
>>>
>>
>> I also tried to make the current patch as minimal as possible, but it would
>> still end up touching quite a few places.
>>
>>> Let me know which approach you are going to follow. If the current one you
>>> already introduced then I will start to review it, if you will go SBI-way
>>> then I prefer to wait for your v2.
>>>
>>> ~ Oleksii
>>>
>>
>> I misunderstood the TODO comment, I thought that would be the preferred
>> implementation. Therefore, I will switch to using DBCN and send a v2.

I think I didn’t word it in the best way.

For early debug, I think it would be better to use the SBI function. At 
some point, it doesn’t really matter which one we use, SBI 0.1 or DBCN. 
If we switch to using the UART’s MMIO directly, we wouldn’t need to 
change the privilege mode or perform a context switch, so it should be 
faster.

However, considering that the early console is mainly used during 
bring-up, it seems like the overhead of an SBI function call isn’t a big 
price to pay. In return, we could potentially have early printk support 
even for UARTs that aren’t currently supported by Xen.

>>
>> Best regards,
>>
>> Zhang
>>
> 
> Hi Oleksii,
> 
> I initially assumed that the DBCN console-write call would wait until the
> whole string had been transmitted. After checking the SBI specification
> and the Linux implementation, I found that this is not the case.

I think Linux does roughly the same here: its SBI earlycon
calls sbi_debug_console_write() (or something like that) in a loop until 
the whole buffer has been written.

Also note that Linux supports both the legacy SBI v0.1 console_putchar
and DBCN console write for earlycon. It picks DBCN when the firmware
provides it and falls back to v0.1 otherwise (when CONFIG_RISCV_SBI_V01
is enabled). I would really like Xen to do the same rather than drop
SBI v0.1 support. A board might not support DBCN, or might implement 
only the legacy SBI extensions, and we still want console output there. 
So we should keep both.

I'd go further: we probably don't need to add DBCN support at this point.
It would be enough to fix the bug you originally hit with the legacy SBI
call.

Also, in Linux the SBI console is only used as an early (boot) console.
Once the UART driver has probed and registered a real console, printk
switches to it and unregisters the boot console (unless keep_bootcon is
passed). So this switch doesn't cause any issues in Linux, and I don't 
see why it should be a problem in our case either. Switching to DBCN, or 
the approach taken in the current patch, looks to me like it is just 
hiding an issue somewhere else.

> 
> The DBCN Console Write function is explicitly non-blocking. Linux uses DBCN
> through the HVC console driver, so the DBCN backend remains the owner of the
> console and the 8250 driver does not subsequently reinitialize the same UART
> or clear its FIFO.
> 
> On the other hand, when Linux uses an 8250 earlycon, it accesses the UART
> directly and waits for UART_LSR_TEMT before the regular 8250 driver takes
> over.
> 
> The current Xen setup combines these two paths: early printk uses the SBI
> console, while the later 8250 driver initializes the same UART. During this
> handover, the 8250 driver clears the TX FIFO, which can discard characters
> that were accepted by SBI but have not yet been transmitted by the UART.

Isn't a question just doing flush before switch to 8250 so we won't 
loose anything? (and then again why Linux doesn't have such issue 
considering that they have the similar way of work, even without 
virtualization)

> 
> Therefore, if Xen is going to use the 8250 driver after early printk, I
> think the early console should use the same 8250 MMIO path, as Linux does
> with 8250 earlycon. This keeps the early-console backend consistent with
> the driver that takes ownership of the UART and allows Xen to wait for
> UART_LSR_TEMT before reinitialization.

At some point, yes, but then we could lose support for other UARTs that 
OpenSBI could provide out of the box for initial bring-up debugging.

Also, we could have both implementations for early printk (SBI-based and 
MMIO-based), configurable through some option, and allow the user to 
choose which approach to use. But for now, I think we could live with 
the SBI-based implementation (even with support only for old SBI console 
call for a while), as it is more generic, until we actually face a 
performance issue where the MMIO-based approach would start to provide a 
benefit.

~ Oleksii

