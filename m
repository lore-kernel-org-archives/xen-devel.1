Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14A19C9832F
	for <xen-devel@archiver.kernel.org>; Mon, 28 Sep 2026 07:38:32 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1435694.1654489 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xB5wL-00024V-5l; Mon, 28 Sep 2026 07:38:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1435694.1654489; Mon, 28 Sep 2026 07:38:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xB5wL-00024O-34; Mon, 28 Sep 2026 07:38:21 +0000
Received: by outflank-mailman (input) for mailman id 1435694;
 Mon, 28 Sep 2026 07:38:19 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xB5wI-00024E-T5
 for xen-devel@lists.xenproject.org; Mon, 28 Sep 2026 07:38:18 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xB5wG-00FAlJ-Di
 for xen-devel@lists.xenproject.org; Mon, 28 Sep 2026 09:38:16 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6aba1961-2eae-0a2a0a5409dd-0a2a450983f8-10
 for <xen-devel@lists.xenproject.org>; Mon, 28 Sep 2026 09:38:16 +0200
Received: from [74.125.225.99] (helo=mail-wr2-f35.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6aba1968-be1a-0a2a45090019-4a7de1639766-3
 for <xen-devel@lists.xenproject.org>; Mon, 28 Sep 2026 09:38:16 +0200
Received: by mail-wr2-f35.google.com with SMTP id
 ffacd0b85a97d-48877902c99so2605725f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 28 Sep 2026 00:38:16 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-71-234.play-internet.pl.
 [109.243.71.234]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a0018e54fesm109521175e9.4.2026.09.28.00.38.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Sep 2026 00:38:15 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1790581096; x=1791185896; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tZkGTUeTQ44HXLl2lSkZYjGUXVm0V5YyV5s0zlQUENU=;
        b=drVi3IdmMOYmZdUm6Nrx27OairNQ/V5aewYmRWzJO+F5IYv5sTjPXQdzFDDTL2+DcY
         OVStYPU9B3ETBPLcDpikyO4N4XaFBPZKQMGeGLC5ikRpOA6aXI9Pe+O27TaJ7IaRPQ4y
         P+ZJNWwYKcnsN70wELA457Gq7Upfv2iC69gDL8c8bC35sz8DQJ1+FWLjhEqp3myHx1YH
         adjXtkH+QZEfVL7ltrX5UtayFUx2NwqjfCg+u36SBDCIez4P/eRBTLA3CTDQ1trqIzP3
         K7AS6wIyag+TNoYv0OPKKBuqoTU2E1tnTJZccewS7W7H+9HqpkOvnMpe7grbY+h/X4GM
         ekyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790581096; x=1791185896;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tZkGTUeTQ44HXLl2lSkZYjGUXVm0V5YyV5s0zlQUENU=;
        b=yHfeT+/Z3RF/Xlvv+2JD3IQyFpc11B3F6ViW/NAv/J+EvSjQgDUa7tjLRmzM+abxfd
         YMLN0zrTPdWeI/g1VW1MI5NK2DcBPOsQDzed6N9OwYE4ow6butYPcfPF2ZqGIiN0LXPD
         WrM54KLzrGZQApHOpWINfgmSbTjKU3LWal8O4/xEvLTdYdOOrTvjPujQfEvgCjJnEZub
         FV0dKTtEwMjawbm85IWVEP2GgeJt5Vgp4mO2xhItIAP0rD/r9wtsg4uqWMGOuVM/OTiz
         vRiVCySelHQooc5QpRg+KGn1jUng1yIF1nV22r9eNmB2+68OyKIFvepD7xPOMhn2cY/f
         3WRA==
X-Forwarded-Encrypted: i=1; AKwUvBxL7yn8qKBklxeFIUOzHqJ4SzGnhSRnQxgLfqmXQLNLxUauxtFjrtfvD8qqgMBlXfLi0HDgacxmXak=@lists.xenproject.org
X-Gm-Message-State: AFuF++msaPqp7Q29ZGYHr9mNm0ZkLtdd0uj3u3tqQmF/Ktu1Bg33xu2B
	qwKEoJxFQvTHiU8x0Ru7EDHYW2+I9xKMBPIdif5YRayR/bmgaRQgq2CP
X-Gm-Gg: AYBFou3QaDao/Q+3nZuc7SfVL8h7O4UB1GkvYvIHQli9jGRO1VtQl9ClPD0I22DOXE6
	6YqALxXuy3jcURlKHTY2f2pMG+9CxSngIazL6MzxDGpswa8FeDi6EIOV3cZRhydVX8yaWH6K8yh
	qbinmaYoEmzJZ5zc8O6BsuaUJtmf7gwhL+0rs0rVeoxXFbFkcoK2nfZkKwqgFeAN9s79pLqChJk
	ie6S7mMltcu+oKji57NcVnzExfpVEPsZuHcfAYffCjUctF9Z2NdHVJAtGx3sXqr33k2OjM5AxU/
	niGy1pLM5kAbWaoc1EKVhV/dHBZmOBfkutjgJCI4TfrE40h6pOxmWS+CUr28GHX2SyQ0pMF9PcS
	tayxQONnTC175m9g5j5SnuCT+gEV0Y6o5o3VOvQB502u0UWZBPquh4JePdpamfadiXWV8MFZSv3
	7KS/1QdkGR0AgOOZiR9WbkTxjPTinA17Pbk5CJcdU/xVMUroeVQXsDNFhZT6LCKuJG8AAqAr9Rg
	6JyVSr2sbOoqK+72CD7JGNLccRQJrBWujLwK+9ON7Nkulm77A==
X-Received: by 2002:a05:600c:198f:b0:49f:bd3c:bc23 with SMTP id 5b1f17b1804b1-49fe6707f90mr218212715e9.30.1790581095635;
        Mon, 28 Sep 2026 00:38:15 -0700 (PDT)
Message-ID: <5919f1f2-e24c-4b0e-a7dd-126ac6fbe38f@gmail.com>
Date: Mon, 28 Sep 2026 09:38:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 0/1] [RISC-V] replace SBI early console with 8250 UART
To: Zhang Zheng <zhangzheng@iscas.ac.cn>, xen-devel@lists.xenproject.org
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>
References: <20260928023857.1030884-1-zhangzheng@iscas.ac.cn>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <20260928023857.1030884-1-zhangzheng@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-bad1c0/1790581096-BDCC7034-60C8A199/10/73395122804
X-purgate-type: spam
X-purgate-size: 2738



On 9/28/26 4:38 AM, Zhang Zheng wrote:
> The legacy SBI console extension is planned for deprecation. Replace the
> RISC-V early printk backend with direct access to 8250 UART MMIO.

Won't it better just to start to add support of newer SBI? It provides 
pretty good support + faster as it supports passing of string instead of 
one char.

Also, I think it will lead to lesser changes.

~ Oleksii

> 
> This also addresses truncated output observed on SpacemiT K3 when
> switching from early printk to dtuart. Direct UART access lets early
> printk flush the UART after each string before the dtuart driver takes
> over and clear it's FIFO, which cause the truncated uart output.>
> The truncated uart looks like:
> 
>    (XEN) Command line: dtuart=/soc/uart@d4017000:115200/921600 console=dtuart sync_console
>    (XEN) Domain heap initialised
>    (XEN) Booting using Device Tree
>    (XEN) /home/zz/dev/git/xen_stuff/xen/xen/arch/riscv/cpufeature.c:710: SSTC detected; supported for Xen use, but not for guests
>    (XEN) Looking for dtuart at "/soc/uart@d40 __  __            _  _    ____  _____                    _        _     _
>     \ \/ /___ _ __   | || |  |___ \|___ /    _   _ _ __  ___| |_ __ _| |__ | | ___
>      \  // _ \ '_ \  | || |_   __) | |_ \ __| | | | '_ \/ __| __/ _` | '_ \| |/ _ \
>      /  \  __/ | | | |__   _| / __/ ___) |__| |_| | | | \__ \ || (_| | |_) | |  __/
>     /_/\_\___|_| |_|    |_|(_)_____|____/    \__,_|_| |_|___/\__\__,_|_.__/|_|\___|
> 
>    (XEN) Xen version 4.23-unstable (zz@) (riscv64-linux-gnu-gcc (GCC) 15.1.0) debug=y ubsan=y Sat Sep 26 14:50:31 CST 2026
>    (XEN) Latest ChangeSet: Fri Sep 18 10:11:27 2026 +0800 git:77544a69ea
> 
> Zheng Zhang (1):
>    xen/riscv: replace SBI early console with 8250 UAR
> 
>   xen/arch/riscv/Kconfig.debug              | 53 ++++++++++++++++++++--
>   xen/arch/riscv/configs/tiny64_defconfig   |  2 +
>   xen/arch/riscv/early_printk.c             | 37 +++++++---------
>   xen/arch/riscv/include/asm/early_printk.h | 12 +++++
>   xen/arch/riscv/include/asm/fixmap.h       |  6 ++-
>   xen/arch/riscv/include/asm/sbi.h          |  7 ---
>   xen/arch/riscv/mm.c                       | 41 +++++++++++++----
>   xen/arch/riscv/riscv64/Makefile           |  1 +
>   xen/arch/riscv/riscv64/debug-8250.inc     | 51 +++++++++++++++++++++
>   xen/arch/riscv/riscv64/debug.S            | 54 +++++++++++++++++++++++
>   xen/arch/riscv/sbi.c                      |  5 ---
>   11 files changed, 223 insertions(+), 46 deletions(-)
>   create mode 100644 xen/arch/riscv/riscv64/debug-8250.inc
>   create mode 100644 xen/arch/riscv/riscv64/debug.S
> 
> base-commit: 4c1aba82cff95ab11f7fe4af8965a06703537288


