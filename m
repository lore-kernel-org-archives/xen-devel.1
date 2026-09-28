Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B738C9832F
	for <xen-devel@archiver.kernel.org>; Mon, 28 Sep 2026 09:31:22 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1435842.1654624 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xB7hX-0000C7-Gw; Mon, 28 Sep 2026 09:31:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1435842.1654624; Mon, 28 Sep 2026 09:31:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xB7hX-0000C0-EG; Mon, 28 Sep 2026 09:31:11 +0000
Received: by outflank-mailman (input) for mailman id 1435842;
 Mon, 28 Sep 2026 09:31:10 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xB7hW-0000Bu-F8
 for xen-devel@lists.xenproject.org; Mon, 28 Sep 2026 09:31:10 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xB7hV-00FZct-NJ
 for xen-devel@lists.xenproject.org; Mon, 28 Sep 2026 11:31:09 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6aba33ca-8faa-0a2a0a5109dd-0a2a450c93fa-40
 for <xen-devel@lists.xenproject.org>; Mon, 28 Sep 2026 11:31:09 +0200
Received: from [74.125.225.76] (helo=mail-wr2-f12.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6aba33dd-f479-0a2a450c0019-4a7de14cb114-3
 for <xen-devel@lists.xenproject.org>; Mon, 28 Sep 2026 11:31:09 +0200
Received: by mail-wr2-f12.google.com with SMTP id
 ffacd0b85a97d-485984ebf5cso2225108f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 28 Sep 2026 02:31:09 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-71-234.play-internet.pl.
 [109.243.71.234]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4887a34a4e9sm22432379f8f.11.2026.09.28.02.31.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Sep 2026 02:31:08 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1790587869; x=1791192669; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9ODPk+Zi+1zp8MR8Wx4ZGsbQguFRdx5vFJPDCYUjtPI=;
        b=KNmLgwvi0msmifZw2mYD6ALB7xxGmL7M4EV0K/5dipz5LNn6Z1lvhTI3OfecGy+5Sl
         Ncoku8q745YKXqCsOGI4BTxs/idex9Nrrcp4x7WDlZWFf5wHyXFgT/Tn8ujjXgyy7s1e
         +J43bf1XWEmM/TSfr9B2JDJ4Q9UkVIZuDEr1caHPCy6te0br7ZWlLHL34/URbCXCgeIn
         iX9OAaP1Fnvj0C1+8VVEMMiTtkPwBuWbbbeB4GRtIEQQi3uLt0omnpP9yLibQLWzmd9d
         fCJs3LJwEtreYF240kOc3sF/SmpPwRgHZ8BxkJEZ0e3/oigxA9pP0s/0w4Yi/CJgQOQZ
         TUig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790587869; x=1791192669;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9ODPk+Zi+1zp8MR8Wx4ZGsbQguFRdx5vFJPDCYUjtPI=;
        b=z6GBgI2kPrOTRVg5bm1xKWplsuioT40mzGM6fiQxzdf4eHyEy17RpBJpqfbzNCPtWz
         8cCX/YwGRDgtA/k6/0yo2dyCgSMzYdnF4OSf4b6WFaJooFBSIFkcDf4Jq3TWhB0rq2HD
         QzD89Pba/EX6tsHQBej+6pvQ3thdpUd++tFO8ATG31DPKunuRE/I+2wRtRBK3aoURl5h
         wzoqajhmA5OdjlQKA7X0wnhsh/idfTdY/pvQDN9BdbAM9BR9Z1y0OFgONdZ+j4pvKlx5
         9a4kMmJAFiFV+H5bUOfbs7Gdrx9Q226WnrT3a8qzyH6oZLVU3HdNAYza8pxdTp1S4xYG
         Rnnw==
X-Gm-Message-State: AFq9FYKLqXhxXEauxF6EfRJuHyO/TAduyqY2XHc1Hd/QdcpigXLpg5tE
	3ZU2LrXYEP06G8TBbO19t5nTwcZZYjNFQRNw6hRug8jCt3FeS+xefM7isq3PPg==
X-Gm-Gg: AYBFou3hNpmt4Iu3RMv3GltBW+1RVaB5Fw/cbQO16FHV0NOWQSW6sNVL6ejTVRqyUN9
	xD0RNNd4ccktHkSmEMTWmMwQF/3LXhlha6EomQjZu3l0Z1PuKsQhVJkOGCR042rwmtPa9DpWDFt
	T6D3XolEFD8vi4U5M1D+X9n9V+ysOs2lBs8PaqHjaludP/a2mRp0I2IS3ncluFsrTSmRVv2oYOS
	EVManHQFK/epWFnX2pbgx02gH4jwJoFo3Mj2wcuaDXNLFoC8+gLYLW2keQkcOKpXAVOFOOXbu7y
	uJ7d1S/FppEZm6/WKBd00e8IRozK1LnawlP2PsTheizaJxkXL6l/OPGxI/FxmtpaUjSk6jNG6Bi
	tcn1bivkt2E9EcqRdKpoyB46qEsJAna9vN8xBw+yMSvm84XUc5bGT7+/UgT34urpdch9+OINWb1
	bxHEkdCLigiibBMw3jrBvUrO36j0AkE0jwtXL5p/7sI8wJejCYoeDW9+JMScbpHOOhcQwKx8Gzj
	pnGQIsTz0IgYuI9tos3kddv3axOOtm2RhlNdRiy5FLJkIRWEQ==
X-Received: by 2002:a05:6000:4b09:b0:488:6072:c0bc with SMTP id ffacd0b85a97d-48872a5d9a7mr21962218f8f.4.1790587868961;
        Mon, 28 Sep 2026 02:31:08 -0700 (PDT)
Message-ID: <3152e70f-881f-4a58-9b2d-df661887dc80@gmail.com>
Date: Mon, 28 Sep 2026 11:31:06 +0200
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
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <aronfcYWtc1CHQgH@iscas-ws>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d25034/1790587869-014C7A5B-1739295A/10/73395122804
X-purgate-type: spam
X-purgate-size: 4088



On 9/28/26 10:40 AM, Zhang Zheng wrote:
> On Mon, Sep 28, 2026 at 09:38:14AM +0200, Oleksii Kurochko wrote:
>>
>>
>> On 9/28/26 4:38 AM, Zhang Zheng wrote:
>>> The legacy SBI console extension is planned for deprecation. Replace the
>>> RISC-V early printk backend with direct access to 8250 UART MMIO.
>>
>> Won't it better just to start to add support of newer SBI? It provides
>> pretty good support + faster as it supports passing of string instead of one
>> char.
>>
> 
> Using the newer SBI DBCN extension would indeed result in a smaller change. At
> the time, I mainly followed the direction suggested by the TODO and referred
> directly to the arm64 implementation, from which most of the code was adapted.

I think TODO was written at that way because I missed DBCN (or it wasn't 
ratified at that moment). Considering that it is ratified now ...

> 
>> Also, I think it will lead to lesser changes.
>>
> 
> If falling back to SBI console putchar is acceptable, DBCN should work
> well here.

... I prefer to use SBI functionality (in the current case DBCN) as 
maximum as possible so if there is no any reason (and I don't see at the 
moment it) which doesn't allow us to use DBCN here, I would prefer to 
use DBCN.

If you still want to in the way suggested by TODO then some parts which 
are common between Arm and RISC-V should be moved to common instead of 
introducing them in RISC-V specific folder.

Let me know which approach you are going to follow. If the current one 
you already introduced then I will start to review it, if you will go 
SBI-way then I prefer to wait for your v2.

~ Oleksii

>>>
>>> This also addresses truncated output observed on SpacemiT K3 when
>>> switching from early printk to dtuart. Direct UART access lets early
>>> printk flush the UART after each string before the dtuart driver takes
>>> over and clear it's FIFO, which cause the truncated uart output.>
>>> The truncated uart looks like:
>>>
>>>     (XEN) Command line: dtuart=/soc/uart@d4017000:115200/921600 console=dtuart sync_console
>>>     (XEN) Domain heap initialised
>>>     (XEN) Booting using Device Tree
>>>     (XEN) /home/zz/dev/git/xen_stuff/xen/xen/arch/riscv/cpufeature.c:710: SSTC detected; supported for Xen use, but not for guests
>>>     (XEN) Looking for dtuart at "/soc/uart@d40 __  __            _  _    ____  _____                    _        _     _
>>>      \ \/ /___ _ __   | || |  |___ \|___ /    _   _ _ __  ___| |_ __ _| |__ | | ___
>>>       \  // _ \ '_ \  | || |_   __) | |_ \ __| | | | '_ \/ __| __/ _` | '_ \| |/ _ \
>>>       /  \  __/ | | | |__   _| / __/ ___) |__| |_| | | | \__ \ || (_| | |_) | |  __/
>>>      /_/\_\___|_| |_|    |_|(_)_____|____/    \__,_|_| |_|___/\__\__,_|_.__/|_|\___|
>>>
>>>     (XEN) Xen version 4.23-unstable (zz@) (riscv64-linux-gnu-gcc (GCC) 15.1.0) debug=y ubsan=y Sat Sep 26 14:50:31 CST 2026
>>>     (XEN) Latest ChangeSet: Fri Sep 18 10:11:27 2026 +0800 git:77544a69ea
>>>
>>> Zheng Zhang (1):
>>>     xen/riscv: replace SBI early console with 8250 UAR
>>>
>>>    xen/arch/riscv/Kconfig.debug              | 53 ++++++++++++++++++++--
>>>    xen/arch/riscv/configs/tiny64_defconfig   |  2 +
>>>    xen/arch/riscv/early_printk.c             | 37 +++++++---------
>>>    xen/arch/riscv/include/asm/early_printk.h | 12 +++++
>>>    xen/arch/riscv/include/asm/fixmap.h       |  6 ++-
>>>    xen/arch/riscv/include/asm/sbi.h          |  7 ---
>>>    xen/arch/riscv/mm.c                       | 41 +++++++++++++----
>>>    xen/arch/riscv/riscv64/Makefile           |  1 +
>>>    xen/arch/riscv/riscv64/debug-8250.inc     | 51 +++++++++++++++++++++
>>>    xen/arch/riscv/riscv64/debug.S            | 54 +++++++++++++++++++++++
>>>    xen/arch/riscv/sbi.c                      |  5 ---
>>>    11 files changed, 223 insertions(+), 46 deletions(-)
>>>    create mode 100644 xen/arch/riscv/riscv64/debug-8250.inc
>>>    create mode 100644 xen/arch/riscv/riscv64/debug.S
>>>
>>> base-commit: 4c1aba82cff95ab11f7fe4af8965a06703537288
> 


