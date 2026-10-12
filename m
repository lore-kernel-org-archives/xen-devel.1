Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CD9CCA9EC5
	for <xen-devel@archiver.kernel.org>; Mon, 12 Oct 2026 13:51:25 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1446390.1662526 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGGQn-0005fX-45; Mon, 12 Oct 2026 13:51:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1446390.1662526; Mon, 12 Oct 2026 13:51:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGGQn-0005fQ-12; Mon, 12 Oct 2026 13:51:09 +0000
Received: by outflank-mailman (input) for mailman id 1446390;
 Mon, 12 Oct 2026 13:51:07 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xGGQl-0005e2-IG
 for xen-devel@lists.xenproject.org; Mon, 12 Oct 2026 13:51:07 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xGGQk-00CA47-VZ
 for xen-devel@lists.xenproject.org; Mon, 12 Oct 2026 15:51:06 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6acce5ae-2eae-0a2a0a5409dd-0a2a4507c272-40
 for <xen-devel@lists.xenproject.org>; Mon, 12 Oct 2026 15:51:06 +0200
Received: from [209.85.128.50] (helo=mail-wm1-f50.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6acce5ca-b4ea-0a2a45070019-d1558032b987-3
 for <xen-devel@lists.xenproject.org>; Mon, 12 Oct 2026 15:51:06 +0200
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-4a0e1b0681bso13794445e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 12 Oct 2026 06:51:06 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-71-234.play-internet.pl.
 [109.243.71.234]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48db98c38f4sm22223312f8f.27.2026.10.12.06.51.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Oct 2026 06:51:06 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1791813066; x=1792417866; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0w8o4QV823/YkzZBk4iJbx3xKAe5ngaSHAaCWR6m7iY=;
        b=BPDy6TJO5BCSdci7KKScn7Jba6dolu4hdrHj9smAaL6asEPTMyRM3BZqLNt6oSnWJj
         H8JgtQtlIbyHtlWYV4JUBJPRCZDvc8XRi1qvdtYztnmE8gEWRtnaFk1fnAoD+PWvDeQ1
         yQybWLu4fGgkOlqaf/J6EdfmzP8SO/zkNO4oywsRmPLfZKqsCLXdx9betNPG+kyvtRt7
         ShPuMpaHcel6HkBI/YounvVZXdZDTxJI48i/+YCSv0DXOsrqnTWzs7+KX5AKy/DxqLdl
         DaLu+MkXwG9KTEIQ/IgVrMpp4fakJaQRXake4D/wei+Ck34yKEs8U2WT4PItcYjrEwP3
         wnGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791813066; x=1792417866;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0w8o4QV823/YkzZBk4iJbx3xKAe5ngaSHAaCWR6m7iY=;
        b=QjRo/RMzTDEkvBjbmXusmTceAYvtEI/c5RElJwP2ICaCJjaz4fxVidMb1/09EBeB+P
         2+LjI4Nkkhri4//IesVHaGo9IJBkxdpaoIh13TDn0tna2X2jr/A+jlq5S+EiI/Ah+AXx
         5rXCaBADeIcT8r5/1R4SNptkZtkCQMklFFRefqWu4pi4F1+G9yAyj78MV+TFh1ds0PoP
         faDRdVpRS97hKWf8IcRSoffLzXb5hH5qjJ7cvdihp2tDj3efCJ0YuZWLVnY89h5Dyeul
         dK9Ji1X7mkNX0sIDa+dC8CY8Z6jWxvbA7aoZuAkrPWhJCPRIsgdirJShOZqYNAEer9kH
         /I/Q==
X-Gm-Message-State: AFq9FYL/Pfyx/Nyk/3tlVNkjA1LpO0svdmAtLeLzvsJAUYk4b+P+E1cc
	k/KestGu36w0Mqe+ZCnkH9D3ceIazfi/oVz2gkOkNtwSX1zI+LNEKX/7
X-Gm-Gg: AYBFou1vjj69Ty846nLINzfMDYy6xBKSi6GANCNGucFr20YAUOsG6kiiHll3Rqq/ufw
	GAzbhQJNjog57zWalqVpFs7uhRln6AkdDiyumsd7jvrmoe1Xu4A0Jr0EKNqPio9866BjgO6RfKo
	97Evl7uQHebc9l2+k6QRpyo29Z3XSviL/ZcU5l1ffsUKGe5WnXgy20IdBUZSLSWCgfVtpXRGboe
	2q/ob09KDjyVd/uZPr9c0Y7EfgkDepysmQYzqcMlXJ2Sz/Uku4u2vgc1NNpvpCyqyg6ml5zlNhB
	2uWMW7jYx9dsDe3ZHzWh0qogb08GWfKKnrVicWlCf1WjFYr35JQHoE2FPZI2vwiF196ykG2yMUR
	VqHhcBl5Kup6ssPzKGCh0r6uXAaf5fSGrFPPfg76cDwAwDPGorhc9gFbLpvolt23Pl0p8fBFUuW
	5fu/V0kOjBaJv1TvOIjSLCLs0+AAdw8z4OjslWnLohCtvLmBt62LERGkx/ErTEHXt/3cPbIw2YH
	ZXzffjt8Oodz8zpcehQihBrXm3oZjsnkYWBt7UTyk+eon+nKg==
X-Received: by 2002:a05:600c:4fcb:b0:4a1:811c:8083 with SMTP id 5b1f17b1804b1-4a18e4c3600mr177734105e9.33.1791813066323;
        Mon, 12 Oct 2026 06:51:06 -0700 (PDT)
Message-ID: <54a18241-5808-4b8d-8af1-2bab0b869047@gmail.com>
Date: Mon, 12 Oct 2026 15:51:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 06/39] xen/riscv: introduce device-agnostic MMIO
 emulation dispatch
To: Jan Beulich <jbeulich@suse.com>,
 Baptiste Le Duc <baptiste.le-duc@vates.tech>
Cc: xen-devel@lists.xenproject.org,
 Romain Caritey <Romain.Caritey@microchip.com>,
 Zheng Zhang <zhangzheng@iscas.ac.cn>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <cover.1790779209.git.oleksii.kurochko@gmail.com>
 <cafb356d9cc3148d74df846e08c4961da72bea0e.1790779209.git.oleksii.kurochko@gmail.com>
 <1791194531.8631fc262581453bbf619ec5b2062170.1a10b8384c50003f66@vates.tech>
 <8aab6ff3-512e-418a-8170-5182ae7f30dc@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <8aab6ff3-512e-418a-8170-5182ae7f30dc@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ef75cf/1791813066-352CCAE4-5773DBA8/10/73395122804
X-purgate-type: spam
X-purgate-size: 607



On 10/8/26 4:57 PM, Jan Beulich wrote:
> On 05.10.2026 12:01, Baptiste Le Duc wrote:
>>> --- /dev/null
>>> +++ b/xen/arch/riscv/include/asm/mmio.h
>>> @@ -0,0 +1,63 @@
>>> +/* SPDX-License-Identifier: GPL-2.0-or-later */
>>> +#ifndef RISCV_MMIO_H
>> Should be ASM__RISCV_MMIO_H instead to be consistant with other header
>> files in riscv/include/asm.
> 
> No, please see the bottom of ./CODING_STYLE. It's many of the other headers
> which would want updating (eventually; there's no urgency I think).

I will send a separate patch for that, at least, for RISC-V.

Thanks.

~ Oleksii

