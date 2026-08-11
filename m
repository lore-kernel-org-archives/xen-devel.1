Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42560C5B56A
	for <xen-devel@archiver.kernel.org>; Tue, 11 Aug 2026 11:49:55 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1388150.1629357 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wtkzE-00083o-Hu; Tue, 11 Aug 2026 11:49:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1388150.1629357; Tue, 11 Aug 2026 11:49:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wtkzE-00083h-Eo; Tue, 11 Aug 2026 11:49:40 +0000
Received: by outflank-mailman (input) for mailman id 1388150;
 Tue, 11 Aug 2026 11:49:39 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wtkzD-00083b-Mr
 for xen-devel@lists.xenproject.org; Tue, 11 Aug 2026 11:49:39 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wtkzD-006hMg-3L
 for xen-devel@lists.xenproject.org; Tue, 11 Aug 2026 13:49:39 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a7b0c3c-2eae-0a2a0a5409dd-0a2a4503aaf8-30
 for <xen-devel@lists.xenproject.org>; Tue, 11 Aug 2026 13:49:39 +0200
Received: from [209.85.221.42] (helo=mail-wr1-f42.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a7b0c52-fae8-0a2a45030019-d155dd2ae1f1-3
 for <xen-devel@lists.xenproject.org>; Tue, 11 Aug 2026 13:49:38 +0200
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-47de0093c42so2150665f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 11 Aug 2026 04:49:38 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4814a72cea1sm4368958f8f.37.2026.08.11.04.49.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Aug 2026 04:49:37 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1786448978; x=1787053778; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2dE/foGziw/KGa1/idt3BoTG5ZRQ5Ek4O5T0IJYTeDw=;
        b=qPm9EsXkRCR9SkZeCr3MMnOUxXwO1zRomagA+jG5q1RRj/nsMslTVdcVoF40DK7Avn
         QoYz4J8DnnJ0xMAIJ/cF9zVgo2D8n78QKE7I7h9KjcApsBxrLMY+Qpp8hvyy+lhq07/t
         q7q+TOahNFbpVuOaf9B5TQB7YWhEaPbNrnQgMz80qHemahE6iXHyy09OCFoe/RBgca10
         b/e9dDDgIctsMiAICnPY37SdDiaa0DQRS1C5HH1IznFriVPvMHu7kY4FC56U6jhixlYv
         n47hykl89adphadn3DpnAisSbXLWoRITNAO4TGB75y8uun0ImrMjwE4msQ3Q89s5DtSg
         SuMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786448978; x=1787053778;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2dE/foGziw/KGa1/idt3BoTG5ZRQ5Ek4O5T0IJYTeDw=;
        b=WmrrWok6+IkOQdiCO2fJ3oiI8TV6JaZ6uLdGDGxfU3gpE3cFEwltJ4bM8iK/8p6vJm
         fRk2nSNUx6/22LTcQJJZBTOG1xDVOW6LEWNJRPzSPKiPzuCmGoau7YJrx++XguFYKbSc
         B8JE1MehSRkPWnJcIkCifw9CrCvQWbNGgSsSZmHpUmOGN80587GCAeAW+iGAQjmaetCu
         LQo8NJNb0M/pIxteOziUXqMgIgjpW4aEv/LjpYvc7KugUSlI5BTTlxbubd/z+w6QT17r
         Irx7jTDmUyL9soIosbnAHU+AKNBcrVAJrt8iP4LVoUUBX8KjGT+6aox9AYdW4DeMwkw/
         lYfA==
X-Gm-Message-State: AOJu0YxtfrRRay+hcgGHbLGBmbB8A3aWqm27bJ4SCqJztrJ0y9XtXhVH
	muSmGUKCZajMDUGOtcHsjFtf8UggNkAKARs6L09RhbucYdcXHZ46njU9
X-Gm-Gg: AR+sD13WD2cmkRxrEJeiYkmMM37OdSacv8XpS2TyEMvtZNimWo6nvUcH27coiWSSg9O
	0M5u5WGRB7+lUPoScmYlTgbDwclPGjtDS3lFeQxNP5Vz1+tnhn0zNcfWuCR7Sh70QJdPZ/2p63Q
	V0TKf2cb0+lQpZzLurWArfQhUotwiDdx6974nZbZbFrEkCxdwEpuEdZD/xr2Kutskp4Ldvwe+Ay
	Oo4EDTw0F8dTMiUR0b/UWMd5yrkpQLnx7uM0wmKUsrmvTm7eIwnQf+DlaTsR/N4gjr68hirM8mj
	8rfYbfdu0l7QV07tMpvpCXNynbE+13BVHKbCrzVhbKTgblk3AFNy9b0GuGQmnIBZy5EteaD6Ac8
	aPGtpougsx+8YYGXy7unJJ8AOj0eoQN7VdS1UVmMfiOh2jjpUQGJ8nTXh0aji7cXTzYCH351vAs
	ylWDNiFvbAqd57wKNm9Tnr2hqxmH1U485dg4BkLj72gp5tseyNQbk3QrwTyz76pNgTzuUjvNOzt
	aaprc6ytrtAwbXRghsOXj3Dhhj1Rtg7sKCA6o4CeYc=
X-Received: by 2002:a5d:5c81:0:b0:47f:8480:4abd with SMTP id ffacd0b85a97d-4814aeec2aemr4394446f8f.29.1786448978236;
        Tue, 11 Aug 2026 04:49:38 -0700 (PDT)
Message-ID: <a58af12e-13f0-48a3-b39d-bff92991ccd1@gmail.com>
Date: Tue, 11 Aug 2026 13:49:36 +0200
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
 <05283ea0-de82-4160-a3f9-5fc1292a20a5@gmail.com>
 <1786436246.8631fc262581453bbf619ec5b2062170.19fefe5dbbc000c4f3@vates.tech>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <1786436246.8631fc262581453bbf619ec5b2062170.19fefe5dbbc000c4f3@vates.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-33051d/1786448979-766FB4E9-3F01239B/10/73395122804
X-purgate-type: spam
X-purgate-size: 2375



On 8/11/26 10:17 AM, Baptiste Le Duc wrote:
> On 2026-08-10 17:36:56+02:00, Oleksii Kurochko wrote:
>> On 8/10/26 4:49 PM, Baptiste Le Duc wrote:
>>
>>>> diff --git a/xen/arch/riscv/include/asm/mmio.h b/xen/arch/riscv/include/asm/mmio.h
>>>
>>> According to coding style, it should be GPL-2.0-only.
>>
>> Could you please point me to the line in the coding style document where
>> this is mentioned?
>>
>> If you are referring to:
>>     New files should start with a single-line SPDX comment to express the
>>     license, e.g.:
>>
>>     /* SPDX-License-Identifier: GPL-2.0-only */
>>
>>     See LICENSES/ for a list of licenses and SPDX tags currently used.
>>
>> Then my understanding is that /* SPDX-License-Identifier: GPL-2.0-only
>> */ is used only as an example, and I can choose any license from
>> LICENSES/. There, it is mentioned:
>>     Valid-License-Identifier: LGPL-2.0-only
>>     Valid-License-Identifier: LGPL-2.0-or-later
>>
>> I am pretty sure that I am free to choose any license that does not
>> conflict with the other licenses used in the project.
>>
> Oh ok I didn't know, thanks for these explanations. Could you let me
> know how do you choose one instead of the other in that case? Is there a
> rule from our company to follow somewhere?

I don't know about any specific rule from our company.

In different situations different licenses could/should be used. 
Specifically here I used GPL-2.0-or-later as this code partially is 
based on Arm code which uses this license so I just re-use it.

>>>> +#ifndef RISCV_MMIO_H
>>>
>>> Nit: line too long (85)
>>
>> I will apply that. Actually I've already fixed that by putting the
>> comment above:
>>     /* store: value to write; load: value read (set by handler) */
>>     register_t data;
>>
>>>> diff --git a/xen/arch/riscv/mmio.c b/xen/arch/riscv/mmio.c
>>> Should be GPL-2.0-only.
>>
>> Regarding license I've wrote a comment above so lets continue discussion
>> there.
>>
>>>> +/*
>>> Why have you included a copyright notice here, but not in the other
>>> files?
>>
>> So I just decided to do that for new files as I am not using corporate
>> e-mail.
> But why didn't you do it for all new files of this series?
If there are such cases then I just missed to add it. I will double 
check during preparation of v2.

~ Oleksii

