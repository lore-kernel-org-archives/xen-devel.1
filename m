Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F9FDCA9ED2
	for <xen-devel@archiver.kernel.org>; Mon, 12 Oct 2026 07:39:45 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1445875.1661735 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGAdA-0007Rp-Ix; Mon, 12 Oct 2026 07:39:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1445875.1661735; Mon, 12 Oct 2026 07:39:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGAdA-0007Ri-GF; Mon, 12 Oct 2026 07:39:32 +0000
Received: by outflank-mailman (input) for mailman id 1445875;
 Mon, 12 Oct 2026 07:39:31 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xGAd9-0007Rc-3v
 for xen-devel@lists.xenproject.org; Mon, 12 Oct 2026 07:39:31 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xGAd8-004Yjm-DE
 for xen-devel@lists.xenproject.org; Mon, 12 Oct 2026 09:39:30 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6acc8eb2-e002-0a2a0a5209dd-0a2a4503e04e-0
 for <xen-devel@lists.xenproject.org>; Mon, 12 Oct 2026 09:39:30 +0200
Received: from [209.85.128.49] (helo=mail-wm1-f49.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6acc8eb2-fae8-0a2a45030019-d1558031d4f2-3
 for <xen-devel@lists.xenproject.org>; Mon, 12 Oct 2026 09:39:30 +0200
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-4a02667ccebso10074185e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 12 Oct 2026 00:39:30 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-71-234.play-internet.pl.
 [109.243.71.234]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a18c85009csm210608885e9.2.2026.10.12.00.39.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Oct 2026 00:39:29 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1791790770; x=1792395570; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vmbB8deohtfma7MFZruRY7kPcQzqKJfblRZurzIi8WU=;
        b=XshMj7kS7jq4MsB2SVVY9XyUlccrsjfbrzaJav/qifd7LIfrpuvMf+p5oxB8Vs/GDm
         UR9pN7Fgk21Z55fGd6ncAGIceJsLJeIKUqXxyAx4dDq0G9M7gfYjyOM9/51ReyvjiDSo
         vnHmDa0IMJyQy3+4XyoerW3vKjWCcHzv1behMvv7BaNSfxtyqiADwGczvoJEWtQFwgOW
         YASS7qIY0dKiCE99uWOZ7VqxvNArqMkG6AFPLIx3W3YzUv6/1fWIseFzMf9fpXed4vk3
         TF56seEkI1+QWCbr/MF6KTKvgeKv0XgCMkkcTMDElM0i2EuwzCpDWrTeaX6g3Dg3UC0F
         UKPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791790770; x=1792395570;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vmbB8deohtfma7MFZruRY7kPcQzqKJfblRZurzIi8WU=;
        b=gCFRFHrXleKwW5MKlhO0arGl8dWaV8P1yzb5C/IzHyIq4TdrlKKv/Gj/ldXIFAB/yO
         8EwCpt+PWWEEVVGINyvb0bNkZdrRRiw9/vBKFvDPGSHzuiMs2aUxy61du98skmZ6j8We
         B73wdwHl7oJw7BFm2P31kXIpsYRuxGuLiLC2lk5J1OqQJ/GifeWuB3mt4wreA16Tcauo
         q0DKDu55LR+vS4ItDTSFLusDO7yEuliqf90L/8506D4b+/0Xcs0jEZbI6LdLDJZ4eezI
         twQZ0rebTny+/LZOIj6c/60AC4x2cy2g8AUBVZ5jRxf2mqB/5RiL8WBqmD7mSdsPZjGw
         I74A==
X-Gm-Message-State: AFq9FYLUNVQC8wAVs/feDvPTjSPO9lyD+1cDyBduciML8Dbz66U6lvtQ
	XB/LfyTvGb+xhCcmIeDGfc1C2bSFFmnBXfphAxLRc4XGwMytCSIY3tdF
X-Gm-Gg: AYBFou36ajcWAAMXLvk3wEWJEY9zg/C2gYs29vM1XaWSKuaP9XIcLL/FH3QovMOjoCw
	V/QvSAjJvJv4BQQ3Ev+oYlMqaRtV2R/xs8PRYCrLHe/LElJlg3Xlal1trDRr29l+ZBcEIMV9hLm
	9bBB/MUDvEJbNbi06qNh+AHAbla2Oj4rd0uNScn8CZRb2672R3ST4HX/hP+43x0aaHs68UdNKQR
	BkLw0nYl/1dSOdWd8zDVjVSIMfoZweBhlw9iOeQwUZnHJ5CgArLYj6+eIfVgyLv+EERCCjRHcx6
	3vOzC6yRGy/ZiOmYO+okKMCbmfvZvwen0Ku2BAuUNHRtLgPfpLqbC5c9JxONyNtXA56AWAF4irb
	si9YVj2Y7N6auoaYv4nsgVYB++bgKSsZ7rWA273VASpb8IOMAeVpFgyHQM/h87KK+Q1XHXSX/jV
	qPz8L6/3HiYDRDnpmgs5JoIhTcw6t0BDnXSE4T0a0THjNGqb2Y97cBtUjrAWB5f/6AlxXCOZaUO
	cmjvcBPZGdwvKyKQ+h36E6gbQbeaSmhGFfCpaTMzx6M469/YisEgaArxah6
X-Received: by 2002:a05:600c:8b28:b0:49f:ff7b:f056 with SMTP id 5b1f17b1804b1-4a18e4a3c24mr139892275e9.9.1791790769674;
        Mon, 12 Oct 2026 00:39:29 -0700 (PDT)
Message-ID: <55dd5d53-34f8-41e2-a5b4-fbac30b791f8@gmail.com>
Date: Mon, 12 Oct 2026 09:39:28 +0200
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
 <arsr7FV_KDQpyTcS@iscas-ws> <8836d1e3-77c8-4447-b1ef-132620a71441@gmail.com>
 <asmuU6EtrCS7nrp9@iscas-ws>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <asmuU6EtrCS7nrp9@iscas-ws>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-33051d/1791790770-6F2C84E9-3D9877EB/10/73395122804
X-purgate-type: spam
X-purgate-size: 8069



On 10/10/26 5:32 AM, Zhang Zheng wrote:
> On Wed, Sep 30, 2026 at 01:22:46PM +0200, Oleksii Kurochko wrote:
>> Hello Zheng,
>>
>> On 9/29/26 5:10 AM, Zhang Zheng wrote:
>>> On Mon, Sep 28, 2026 at 08:53:15PM +0800, Zhang Zheng wrote:
>>>> On Mon, Sep 28, 2026 at 11:31:06AM +0200, Oleksii Kurochko wrote:
>>>>>
>>>>>
>>>>> On 9/28/26 10:40 AM, Zhang Zheng wrote:
>>>>>> On Mon, Sep 28, 2026 at 09:38:14AM +0200, Oleksii Kurochko wrote:
>>>>>>>
>>>>>>>
>>>>>>> On 9/28/26 4:38 AM, Zhang Zheng wrote:
>>>>>>>> The legacy SBI console extension is planned for deprecation. Replace the
>>>>>>>> RISC-V early printk backend with direct access to 8250 UART MMIO.
>>>>>>>
>>>>>>> Won't it better just to start to add support of newer SBI? It provides
>>>>>>> pretty good support + faster as it supports passing of string instead of one
>>>>>>> char.
>>>>>>>
>>>>>>
>>>>>> Using the newer SBI DBCN extension would indeed result in a smaller change. At
>>>>>> the time, I mainly followed the direction suggested by the TODO and referred
>>>>>> directly to the arm64 implementation, from which most of the code was adapted.
>>>>>
>>>>> I think TODO was written at that way because I missed DBCN (or it wasn't
>>>>> ratified at that moment). Considering that it is ratified now ...
>>>>>
>>>>>>
>>>>>>> Also, I think it will lead to lesser changes.
>>>>>>>
>>>>>>
>>>>>> If falling back to SBI console putchar is acceptable, DBCN should work
>>>>>> well here.
>>>>>
>>>>> ... I prefer to use SBI functionality (in the current case DBCN) as maximum
>>>>> as possible so if there is no any reason (and I don't see at the moment it)
>>>>> which doesn't allow us to use DBCN here, I would prefer to use DBCN.
>>>>>
>>>>
>>>> Given that Xen on RISC-V is expected to target relatively recent RVA23 hardware,
>>>> which should ship with a recent version of OpenSBI, I think you are right that
>>>> there is no real need to provide a fallback here.
>>>>
>>>>> If you still want to in the way suggested by TODO then some parts which are
>>>>> common between Arm and RISC-V should be moved to common instead of
>>>>> introducing them in RISC-V specific folder.
>>>>>
>>>>
>>>> I also tried to make the current patch as minimal as possible, but it would
>>>> still end up touching quite a few places.
>>>>
>>>>> Let me know which approach you are going to follow. If the current one you
>>>>> already introduced then I will start to review it, if you will go SBI-way
>>>>> then I prefer to wait for your v2.
>>>>>
>>>>> ~ Oleksii
>>>>>
>>>>
>>>> I misunderstood the TODO comment, I thought that would be the preferred
>>>> implementation. Therefore, I will switch to using DBCN and send a v2.
>>
>> I think I didn’t word it in the best way.
>>
>> For early debug, I think it would be better to use the SBI function. At some
>> point, it doesn’t really matter which one we use, SBI 0.1 or DBCN. If we
>> switch to using the UART’s MMIO directly, we wouldn’t need to change the
>> privilege mode or perform a context switch, so it should be faster.
>>
>> However, considering that the early console is mainly used during bring-up,
>> it seems like the overhead of an SBI function call isn’t a big price to pay.
>> In return, we could potentially have early printk support even for UARTs
>> that aren’t currently supported by Xen.
>>
>>>>
>>>> Best regards,
>>>>
>>>> Zhang
>>>>
>>>
>>> Hi Oleksii,
>>>
>>> I initially assumed that the DBCN console-write call would wait until the
>>> whole string had been transmitted. After checking the SBI specification
>>> and the Linux implementation, I found that this is not the case.
>>
>> I think Linux does roughly the same here: its SBI earlycon
>> calls sbi_debug_console_write() (or something like that) in a loop until the
>> whole buffer has been written.
>>
>> Also note that Linux supports both the legacy SBI v0.1 console_putchar
>> and DBCN console write for earlycon. It picks DBCN when the firmware
>> provides it and falls back to v0.1 otherwise (when CONFIG_RISCV_SBI_V01
>> is enabled). I would really like Xen to do the same rather than drop
>> SBI v0.1 support. A board might not support DBCN, or might implement only
>> the legacy SBI extensions, and we still want console output there. So we
>> should keep both.
>>
>> I'd go further: we probably don't need to add DBCN support at this point.
>> It would be enough to fix the bug you originally hit with the legacy SBI
>> call.
>>
>> Also, in Linux the SBI console is only used as an early (boot) console.
>> Once the UART driver has probed and registered a real console, printk
>> switches to it and unregisters the boot console (unless keep_bootcon is
>> passed). So this switch doesn't cause any issues in Linux, and I don't see
>> why it should be a problem in our case either. Switching to DBCN, or the
>> approach taken in the current patch, looks to me like it is just hiding an
>> issue somewhere else.
>>
>>>
>>> The DBCN Console Write function is explicitly non-blocking. Linux uses DBCN
>>> through the HVC console driver, so the DBCN backend remains the owner of the
>>> console and the 8250 driver does not subsequently reinitialize the same UART
>>> or clear its FIFO.
>>>
>>> On the other hand, when Linux uses an 8250 earlycon, it accesses the UART
>>> directly and waits for UART_LSR_TEMT before the regular 8250 driver takes
>>> over.
>>>
>>> The current Xen setup combines these two paths: early printk uses the SBI
>>> console, while the later 8250 driver initializes the same UART. During this
>>> handover, the 8250 driver clears the TX FIFO, which can discard characters
>>> that were accepted by SBI but have not yet been transmitted by the UART.
>>
>> Isn't a question just doing flush before switch to 8250 so we won't loose
>> anything? (and then again why Linux doesn't have such issue considering that
>> they have the similar way of work, even without virtualization)
>>
>>>
>>> Therefore, if Xen is going to use the 8250 driver after early printk, I
>>> think the early console should use the same 8250 MMIO path, as Linux does
>>> with 8250 earlycon. This keeps the early-console backend consistent with
>>> the driver that takes ownership of the UART and allows Xen to wait for
>>> UART_LSR_TEMT before reinitialization.
>>
>> At some point, yes, but then we could lose support for other UARTs that
>> OpenSBI could provide out of the box for initial bring-up debugging.
>>
>> Also, we could have both implementations for early printk (SBI-based and
>> MMIO-based), configurable through some option, and allow the user to choose
>> which approach to use. But for now, I think we could live with the SBI-based
>> implementation (even with support only for old SBI console call for a
>> while), as it is more generic, until we actually face a performance issue
>> where the MMIO-based approach would start to provide a benefit.
>>
>> ~ Oleksii
> 
> Hi Oleksii,

Hello Zheng,

> 
> Thanks for the clarification and suggestion.
> 
> I have sent v2, keeping the existing SBI early console unchanged.  Following
> your suggestion, it drains pending TX data before ns16550 reinitializes the
> UART.

I will check your v2 during this week.

> 
> While bringing up Xen on K3 I also encountered an issue with its
> XScale-compatible UART, so v2 includes a separate fix to detect and preserve
> the UART_IER_UUE bit.  As a result, v2 now mainly fixes UART handover issues
> rather than changing the RISC-V early printk implementation.

Sounds good to me!

> 
> I'm not sure whether carrying these fixes as v2 of the original series is the
> best approach, so please let me know if you have any concerns.

I think I don't have any concern but probably it would be better to say 
that it is v1 as patches don't touch RISC-V specific code anymore. But 
you mentioned basically why it is v2 in cover letter and it is okay to 
me, at least.

Thanks for v2!

~ Oleksii

