Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCBE3C61DD3
	for <xen-devel@archiver.kernel.org>; Thu,  3 Sep 2026 10:28:33 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1406696.1639866 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x24gC-0003da-0o; Thu, 03 Sep 2026 10:28:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1406696.1639866; Thu, 03 Sep 2026 10:28:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x24gB-0003dT-UX; Thu, 03 Sep 2026 10:28:23 +0000
Received: by outflank-mailman (input) for mailman id 1406696;
 Thu, 03 Sep 2026 10:28:23 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1x24gB-0003dN-9l
 for xen-devel@lists.xenproject.org; Thu, 03 Sep 2026 10:28:23 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x24gA-0072G1-J8
 for xen-devel@lists.xenproject.org; Thu, 03 Sep 2026 12:28:22 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a994bc2-8faa-0a2a0a5109dd-0a2a45098762-12
 for <xen-devel@lists.xenproject.org>; Thu, 03 Sep 2026 12:28:22 +0200
Received: from [209.85.128.51] (helo=mail-wm1-f51.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a994bc6-be1a-0a2a45090019-d1558033a93a-3
 for <xen-devel@lists.xenproject.org>; Thu, 03 Sep 2026 12:28:22 +0200
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-4954a9e8490so4833955e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 03 Sep 2026 03:28:22 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49ce47b9817sm104235925e9.1.2026.09.03.03.28.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Sep 2026 03:28:21 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:Content-Language:References:Cc:To:Subject:From:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788431302; x=1789036102; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YznnKZXf6PyR49qfiMZ5c2JghO0VNvR3jH2UdEDmKuo=;
        b=DIEUZUGN1HkQEySStPyLvO6xVDzCzhyC2VuYdR/qjtvUenJSyDgPaL3whQeRs0HIMS
         vQVkWzkR2wfpfK88xy84Y6s0vJUdXOQjaM0zQKZsxOAxgUhsgQH5+IhSP6cqMTXBySEt
         HuRKiRbwGQ6jyZF2hIgecFekdtKxLIiqgnrTA8dn8wKjpLvgWscqm4YUqApccgXEQkzx
         8BtlUx4xoQfCBA+bp+xHRgU5A+ja5JisC9Issc3WJlB0dVJupyjlJjoePo0Hn3rr3L7e
         eQ1ahed/XCMIts1KCDndKFRld90jh5FwXiyzB6x8z23vZkPYB666Mmg7+ueTs5r88iDN
         T1jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788431302; x=1789036102;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YznnKZXf6PyR49qfiMZ5c2JghO0VNvR3jH2UdEDmKuo=;
        b=H/IrzYi7A8qi9zjs6n7N4MtlvjK5gsb5XngZbg6dTGbDspd3c+9JcxmbmDKZhC62rB
         geJv7CJpHDWo+jYuId0EzTDFUHg4lODKORjnOim0nCqV7EO2IwIxjqcs+6xNKlku6Jqx
         t+GqLSUeyk9FeNEl04tqazJoEpjOhLGAy9bC5EoX5cHnw1uU5a/4yhvkvhnPvYsmW1S/
         7HdGWrED7uZusWZhps7vDJPicSCo+OLFYvxsdYrrlw57XLKRVGMVYd/8Wr3OftLh+igl
         tfAUVIplHg/LeRAFgtxNfhH/sb+cIRQ3ixx+ANzJzT2sab3xP/6xBw4tRK65/1PTVZzc
         OR8g==
X-Gm-Message-State: AFuF++nXm81HUSpZmQyl1+nkZMBppUGb2Ccja//M3EwyX3ughKuvVxZb
	guhT/Zt3ke/B06jGRJDjKUt1RQTP1UR3PDmZXzg0rSZycNQ4yagpge8/
X-Gm-Gg: AYBFou3k9jm1yaaMw60kAOZ81DQ9nI4d+AI8t6sD4E6tk8T3kd4pDbtGKjnyhBXMWV6
	rflmdiaYV0XKcJ0oyOOtQFfTmfTk5rg6wkkXnbzkvO1uUh05V3JPdg8LO4kpdH10A3s9fkgbmuI
	20YvVv6mgzRVNcdyt4CgSz5P6W+DD0dIqBhdhUo4dVPjDmE8z/5fPATu0+WLCAu0KJ+7ofHcTKn
	fs8p3GQohxgsbsoluMr1luZCVwP2AjDGlv4bpCsaSnQs3CPXsDG/X+J4dxoDsbx5pF1OVS9O73s
	QaJf2PXmTudGlWqG3ApKXplPl2HB46iBx3q7sUVYOHVQA4mb5MHalXbOlWlgBrBrDry7qeRs3AV
	d7q0WvvXEJo5hF3x+p1I2zlEaA0we5yoyXvdXEQxXFddfiM8Pj+nkYpjcJkNZ+H6sl2O5Uwqg+M
	Xg/lphFRh4H/+lyz7+5giHpnI+AR9+jYc1D0xLCPfVq3QoBGqgyRyr5McjmL1dPn8u8KtHBPXjr
	yxxty8kKF1mCi30+NU9wuoJAQ/MoFrJFu0IDUmyUQ==
X-Received: by 2002:a05:600c:a085:b0:49c:f13e:e4e with SMTP id 5b1f17b1804b1-49cf15ab3c1mr28366845e9.11.1788431301802;
        Thu, 03 Sep 2026 03:28:21 -0700 (PDT)
Message-ID: <0c06c3d4-067d-4cd5-91e5-0fa16f2894f6@gmail.com>
Date: Thu, 3 Sep 2026 12:28:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH v2 08/39] xen/riscv: introduce device-agnostic MMIO
 emulation dispatch
To: Baptiste Le Duc <baptiste.le-duc@vates.tech>
Cc: xen-devel@lists.xenproject.org,
 Romain Caritey <Romain.Caritey@microchip.com>,
 Zheng Zhang <zhangzheng@iscas.ac.cn>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>
References: <cover.1787838835.git.oleksii.kurochko@gmail.com>
 <a74ff916f76fb95e1e44bfadd45fbc477df00c51.1787838835.git.oleksii.kurochko@gmail.com>
 <1788276969.8631fc262581453bbf619ec5b2062170.1a05d9d0e85000c4f3@vates.tech>
Content-Language: en-US
In-Reply-To: <1788276969.8631fc262581453bbf619ec5b2062170.1a05d9d0e85000c4f3@vates.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-bad1c0/1788431302-FC610034-98B001B6/10/73395122804
X-purgate-type: spam
X-purgate-size: 2683



On 9/1/26 5:36 PM, Baptiste Le Duc wrote:
>> RISC-V guests can expose several virtual interrupt controllers at
>> distinct GPA ranges: vPLIC (hasn't been introduced yet) for legacy machines,
>> vAPLIC and vIMSIC for AIA-compliant ones (are being introduced in the follow
>> up patches).
> As Jan said here [1], we shouldn't use "as later in this series" in
> commit message...

I will reword this paragraph to:
```
A RISC-V guest can be given several emulated devices at distinct GPA
ranges; the virtual interrupt controllers alone account for vPLIC on
legacy machines and vAPLIC together with vIMSIC on AIA-compliant ones.
Routing MMIO faults via a per-device is_access() check in the trap
handler would couple that handler to every device it must serve,
requiring a new conditional branch in the fault path for each emulated
device added.
```

> 
> [1]: https://lore.kernel.org/xen-devel/cover.1787838835.git.oleksii.kurochko@gmail.com/T/#m56fbac1ceb0642d5d868e9dcb2b5ed93ecbe5058
>> Routing MMIO faults via a per-device is_access() check in the
>> trap handler would couple it to every device it must serve, requiring a
>> new conditional branch in the fault path each time a new emulated device is
>> added.
>>
>> Introduce a per-domain MMIO handler registration table, modeled
>> after the equivalent ARM framework, so that virtual devices
>> self-register their GPA ranges and read/write callbacks at domain
>> creation time. The MMIO fault path delegates to a single
>> try_handle_mmio() entry point and remains agnostic of which device
>> owns a particular address.
>>
>> A subsequent patch wires this into the MMIO fault path in traps.c.
> ...same here

I'll reword this to:
```
Nothing registers a handler and try_handle_mmio() has no callers yet,
so this patch is a no-op; the trap handler is left untouched.
```

+

I will add after Signed-off-by:
```
---
Wiring this into the MMIO fault path in traps.c is done in this patch
series later.
```


[...]

>> +
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
> Just a question: is the aim of end < addr check to handle possible overflow of end?
> 

Yes, your understanding is correct.

Thanks.

~ Oleksii

