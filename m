Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84F35C5AD55
	for <xen-devel@archiver.kernel.org>; Mon, 10 Aug 2026 15:37:28 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1387594.1628853 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wtS3g-00040L-1D; Mon, 10 Aug 2026 15:37:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1387594.1628853; Mon, 10 Aug 2026 15:36:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wtS3f-00040D-TQ; Mon, 10 Aug 2026 15:36:59 +0000
Received: by outflank-mailman (input) for mailman id 1387594;
 Mon, 10 Aug 2026 15:36:59 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wtS3f-000406-7K
 for xen-devel@lists.xenproject.org; Mon, 10 Aug 2026 15:36:59 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wtS3e-0008Z4-KM
 for xen-devel@lists.xenproject.org; Mon, 10 Aug 2026 17:36:58 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a79f00c-8faa-0a2a0a5109dd-0a2a4502d55e-26
 for <xen-devel@lists.xenproject.org>; Mon, 10 Aug 2026 17:36:58 +0200
Received: from [209.85.128.52] (helo=mail-wm1-f52.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a79f01a-6ca4-0a2a45020019-d1558034e947-3
 for <xen-devel@lists.xenproject.org>; Mon, 10 Aug 2026 17:36:58 +0200
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-4955de8797cso13750495e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 10 Aug 2026 08:36:58 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-499740c1e65sm1464585e9.4.2026.08.10.08.36.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Aug 2026 08:36:57 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1786376218; x=1786981018; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Nt96e5JrhJ37b+v36cltLHlfFI5f1cPCJ8WVk3Ws90Q=;
        b=ApNhojU0wAfZm7igbZOBXK7zC4xOddYjslB/BTguXJAU4xQpmOcU90sECLaYlXTHCN
         qzQjJGfUDaFom9zR20PoLTp48pMZml1TvZegtTKEQCObqtK86OoOT/0yE7L02Wti7GjM
         oIYi5zb1BB/ktdpyrZNjDLykBkFj7NdbVkGvi7TA/cqYt6CorJhmBBPK4AMpJTgSuTkQ
         ctz+0CVhByWpKbxX+XZ3R/MspZ3Xv/Ot+UK8hQafxV5zy72qNpZNFbxwTYyKw7d4lhBK
         e92LxYhFozDC1SqBRzLuwe5Yr2vkqQJ5bSNmWx9wiQE+tChOBYjTo2W+bkkqYI5KHD4N
         9fng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786376218; x=1786981018;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Nt96e5JrhJ37b+v36cltLHlfFI5f1cPCJ8WVk3Ws90Q=;
        b=nRoHgNcZGldvNCB7f5FPBPLr4vsjes6q0/vDOSvrUOn6kGTR40PbJRA5j3HOt1j/lx
         pEcqQGj/wKs3lXfSu2uhZ41rZLxQleUtJNgzZvHu6IqjV8Ya5DF+x4yn82B0a8wO20fA
         0ThXlWaZe051tDpSV7fWxKXwz8gwbAh9gjM2NYD7t1ohMfwkfDlSxWlWEsa3aaz2Q163
         YttGbYHWgHZnsx077TLJkro8lpFuyacBju1uMz2ZRWz8GzX1bmZ8BYWkvjmEyImEXJcV
         +0foGGuMVPFpY6Yd0NODK37+NXkrOZjmnK4wsHIGZ+KBo/RNp5V05pgIKTKhFnIoNo6T
         6WJA==
X-Gm-Message-State: AOJu0YzzsKdd76Bfz/Zq6QquEh0yfBwFwQxmRTciNGn3YzgG+lRh2+MD
	r3doU7+5NWnbSre/uwI6l76IfwxxEBaNhTxOcmAe5m7F7I6U50NHei1p
X-Gm-Gg: AR+sD10VpZDdjufcEkch5j3S9M2/cTnY2Em1HbAQ44vvNnwVgD6GdKWqmZd6C1SDmF3
	yQ2jMLMz+kH+GozYcx8Mm+X899NXXhQ5u7pAC4c/rIrReBprhqRsdvUGmQhsKlASigQ5V90C252
	tqWuD/kB5R9VjENCujbEQis9qtVHRZm2tbTz2PEBWZKiG0yC8+MM3Cyn3CvozgtFsoD8OG/jdZC
	trWWOTNEj5SAAJkL/cML6jA6BVyCruh3f+ol+S7PmKn3zKiVrgvsNveVcQXiaHvGLmCBKya1SNm
	UdmQPMchWfm6oaBbukCznaMEy/yEPrPFvU+pt7ZzXo9AOhPsSG/UwQGjejbA12qNp8zz8Lra1nt
	tASZECf3rFnXs9Aqco4MYjLGoUbv3fQQmjPf0jx9on8RorYyJLdPf4YFDOIp+cJrsZ+cbbV4qp+
	3egs0OXSVBbAunHKpZjVN2UE/EJEpxKI+Adg7XXYRu/jf6fU1biCExD9dGCcLSjZGkGgInaJXA/
	2AuAq+Mu6gju0Vm6pxCPWebUkaPnNKrxAU9eeFMFEg=
X-Received: by 2002:a05:600c:c050:b0:493:a613:56b2 with SMTP id 5b1f17b1804b1-4995e08e537mr216929085e9.8.1786376217831;
        Mon, 10 Aug 2026 08:36:57 -0700 (PDT)
Message-ID: <05283ea0-de82-4160-a3f9-5fc1292a20a5@gmail.com>
Date: Mon, 10 Aug 2026 17:36:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 04/17] xen/riscv: introduce device-agnostic MMIO
 emulation dispatch
To: Baptiste Le Duc <baptiste.le-duc@vates.tech>
Cc: xen-devel@lists.xenproject.org,
 Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
References: <cover.1784560663.git.oleksii.kurochko@gmail.com>
 <c12b69710d7b79bfc0c110f3fa043d871d8b8394.1784560663.git.oleksii.kurochko@gmail.com>
 <1786373377.8631fc262581453bbf619ec5b2062170.19fec268e07000e099@vates.tech>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <1786373377.8631fc262581453bbf619ec5b2062170.19fec268e07000e099@vates.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-720697/1786376218-666B72AC-03B528EE/10/73395122804
X-purgate-type: spam
X-purgate-size: 2760



On 8/10/26 4:49 PM, Baptiste Le Duc wrote:
>> diff --git a/xen/arch/riscv/include/asm/mmio.h b/xen/arch/riscv/include/asm/mmio.h
>> new file mode 100644
>> index 0000000000..18df1133e6
>> --- /dev/null
>> +++ b/xen/arch/riscv/include/asm/mmio.h
>> @@ -0,0 +1,63 @@
>> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> 
> According to coding style, it should be GPL-2.0-only.

Could you please point me to the line in the coding style document where 
this is mentioned?

If you are referring to:
   New files should start with a single-line SPDX comment to express the
   license, e.g.:

   /* SPDX-License-Identifier: GPL-2.0-only */

   See LICENSES/ for a list of licenses and SPDX tags currently used.

Then my understanding is that /* SPDX-License-Identifier: GPL-2.0-only 
*/ is used only as an example, and I can choose any license from 
LICENSES/. There, it is mentioned:
   Valid-License-Identifier: LGPL-2.0-only
   Valid-License-Identifier: LGPL-2.0-or-later

I am pretty sure that I am free to choose any license that does not 
conflict with the other licenses used in the project.

>> +#ifndef RISCV_MMIO_H
>> +#define RISCV_MMIO_H
>> +
>> +#include <xen/lib.h>
>> +#include <xen/rwlock.h>
>> +
>> +#define MAX_IO_HANDLER  16
>> +
>> +typedef struct {
>> +    paddr_t gpa;
>> +    unsigned int len;  /* access width in bytes (1, 2, 4, 8) */
>> +    bool is_write;
>> +    register_t data;   /* store: value to write; load: value read (set by handler) */
> 
> Nit: line too long (85)

I will apply that. Actually I've already fixed that by putting the 
comment above:
   /* store: value to write; load: value read (set by handler) */
   register_t data;


>> diff --git a/xen/arch/riscv/mmio.c b/xen/arch/riscv/mmio.c
>> new file mode 100644
>> index 0000000000..7d56bc8b27
>> --- /dev/null
>> +++ b/xen/arch/riscv/mmio.c
>> @@ -0,0 +1,145 @@
>> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> Should be GPL-2.0-only.

Regarding license I've wrote a comment above so lets continue discussion 
there.

>> +/*
>> + * Copyright (C) Vates
>> + */
> Why have you included a copyright notice here, but not in the other
> files? 

So I just decided to do that for new files as I am not using corporate 
e-mail.

I don’t know if you can keep it,

Good point, I have to ask then someone from our legal department...

  but I just wanted to point out
> that there are other files where this type of copyright notice includes
> the year.
> 

Before, I used to include the year, but someone pointed out (or perhaps 
I misunderstood) that there isn’t much point in including it and that it 
is enough to have just (c) <company name>.

Thanks.

~ Oleksii




