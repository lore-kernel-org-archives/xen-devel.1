Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 532A9C624D6
	for <xen-devel@archiver.kernel.org>; Wed,  2 Sep 2026 13:52:27 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1405958.1639377 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1lNt-0003OB-G2; Wed, 02 Sep 2026 13:52:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1405958.1639377; Wed, 02 Sep 2026 13:52:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1lNt-0003O4-DU; Wed, 02 Sep 2026 13:52:13 +0000
Received: by outflank-mailman (input) for mailman id 1405958;
 Wed, 02 Sep 2026 13:52:12 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1x1lNs-0003Ny-OF
 for xen-devel@lists.xenproject.org; Wed, 02 Sep 2026 13:52:12 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x1lNs-000ZZh-16
 for xen-devel@lists.xenproject.org; Wed, 02 Sep 2026 15:52:12 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a982a04-8faa-0a2a0a5109dd-0a2a450b989c-26
 for <xen-devel@lists.xenproject.org>; Wed, 02 Sep 2026 15:52:11 +0200
Received: from [209.85.128.41] (helo=mail-wm1-f41.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a982a0b-b7e8-0a2a450b0019-d1558029d104-3
 for <xen-devel@lists.xenproject.org>; Wed, 02 Sep 2026 15:52:11 +0200
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-4995b0343c1so11305995e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 02 Sep 2026 06:52:11 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48448ed37c4sm5694464f8f.21.2026.09.02.06.52.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Sep 2026 06:52:10 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1788357131; x=1788961931; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R/xXvT5t0uTjdWwesbEAdJ3uJsGubB1tB6H8T4RJtRk=;
        b=gFJ/A3RqLlgaSbo8E/WmBhaYcSkNr2Gk0jWp0NPJeYgfyTPzFOVkcbD+60+o8hNsYn
         AxBLMA56no4Kql1XsN3od+yfpe6LoO9YGGnmiWSSXvOqRu26vrn6s9OGP+h32XldpK3i
         xKtVs4c3tYGyE5Nvye/+Kz+36cn33Cd0ODiN/R/fYEPgfr3mIlLquQ0DIZDoi13frSaS
         XQHlca09HLorQQHMAF/hWd4/JBWqz9zHNbMannalO3hWfuftutSZ8j1qmcoYC7lez4Dj
         EqlcZGTpKJ1efdcS48Dl6wf33PmRQcNTQj1zitcl59WSLNsgSrUHdVTOT5GXHyZSMTcr
         15Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788357131; x=1788961931;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R/xXvT5t0uTjdWwesbEAdJ3uJsGubB1tB6H8T4RJtRk=;
        b=ZNnKuAxNONwADIvVeemjOpnG6peC0lR5IstRw82T0ej6jOmzcoUlaJ7ifncJC/My0H
         FCebC9chUuCYwyIm9bkztmWPdy6nGQe27GRYR4z+xtwc4YwIu+CamTgj0++IUFq4ue/1
         FsscZ0nk1lIjLa7N0q7W0a0AaS2jk7dKxb+Pwmp/zK4kQqbF2al/CzinKdK7O8HfKLpq
         dZt5Z1m0WtR7PLxJ/0vxwJPLCmZ9lQaVJKhjZ3j6vTbmCp5/OuFB7XX5pNZB0uD9Xwpb
         h4rJ0vYZQIup73IU6rCJth9kfZ41R3SxngXgxceFlWp4D38gvAeyyM3k1TtvuwFmKexL
         MRXQ==
X-Gm-Message-State: AFuF++kDfDRb9p+D5V/P7sCQ7oo8DuiKupDfIlUUl46J2kF5zT6wUOIZ
	3+umca5+OKgsgtlynV8By72SteKSxLzynn7PlAUvwNb2lksQKbgL7HBxqnglnQ==
X-Gm-Gg: AR+sD12mbPpSpnVfDoooZSmoqBxLIkriJtzXHH3uvcMgeBsFKYl6c7q1Cy1eUH9ZedU
	G8B1V2y/dH/gyH6fRDaC+dxdsYg24jnEaNtS0u4nbh0Yj91BN6elxn61pa5WaaaxjU828cdIfvD
	nvZA560gAY2IE0/CeBM2ManJtvLC2UCfLSGBGj6eoab9phzduwc/ZUzfY3xb0hAMzLlaGCQ5RwW
	U4Y8n5nk/69a00xghTma7nGMzJz4Zg5QPbY2I0qVZciv8iG10lB/3mlW2at5IUsOzz/U7rHMHMn
	LmRffrpNaq+3M8VikgdsFVHmNMxMj2sFKjaP98P/C+4YS7poAKPyTlOLMIIjozeLlG7itcC/CIe
	OiKDc3YbNFnsm9U0M+sJnhvAwCrwPTE0QKgbp5fHRsPkz0pV3f2qL03h0CCTwA+aEPY75ozOp0q
	6J4Cib0gchU/oKZUKQbdn9IXBOVoReenKTB3Zu9UIpGYuv6/WT1eZWOrMKT/jz7ORLQT3hSWKKz
	kz6Qn75NGC+v87tJ3W9ahX6b8CgIvr988bO0r5sTw==
X-Received: by 2002:a05:600c:3113:b0:49b:924e:9a28 with SMTP id 5b1f17b1804b1-49ce58163aemr75492025e9.1.1788357130735;
        Wed, 02 Sep 2026 06:52:10 -0700 (PDT)
Message-ID: <94a091d5-779d-454e-9ac6-0e565588db9e@gmail.com>
Date: Wed, 2 Sep 2026 15:52:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/39] xen/riscv: add missing APLIC register offsets,
 masks to asm/aplic.h
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org,
 Romain Caritey <Romain.Caritey@microchip.com>,
 Zheng Zhang <zhangzheng@iscas.ac.cn>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Baptiste Le Duc <baptiste.le-duc@vates.tech>
References: <cover.1787838835.git.oleksii.kurochko@gmail.com>
 <b3e0c1a662403ea2aa84a1943223ad0885733d0f.1787838835.git.oleksii.kurochko@gmail.com>
 <1788276968.8631fc262581453bbf619ec5b2062170.1a05d9d0d1d000c4f3@vates.tech>
 <d68f0e14-6c74-4b3d-9ede-c60364a93c59@suse.com>
 <bb0765bf-6eea-4a37-8dd8-832db5a70b79@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <bb0765bf-6eea-4a37-8dd8-832db5a70b79@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-42698a/1788357131-A98C19EA-9275FA5D/10/73395122804
X-purgate-type: spam
X-purgate-size: 1337



On 9/2/26 3:22 PM, Jan Beulich wrote:
> On 01.09.2026 17:53, Jan Beulich wrote:
>> On 01.09.2026 17:36, Baptiste Le Duc wrote:
>>> On Thu, 27 Aug 2026 17:20:51 +0200, Oleksii Kurochko <oleksii.kurochko@gmail.com> wrote:
>>>> These definitions are required for correct decoding of APLIC MMIO
>>>> accesses and target configuration, and will be used by both the
>>>> physical and virtual APLIC implementations.
>>>>
>>>> While adding them, rearrange the header in the style of x86's
>>>> asm/msr-index.h: a register's offset is immediately followed by the
>>>> definitions of that register's fields, with the blocks sorted by
>>>> offset.  This makes the relation between a register and its fields
>>>> obvious from the layout alone, so no comment is needed to express it.
>>>>
>>>> [...]
>>>
>>> Reviewed-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>
>>
>> Acked-by: Jan Beulich <jbeulich@suse.com>

Thanks.

>>
>> If there's no dependency on earlier patches (nor the prereq series), this
>> could go in right away. Yet nothing is being said anywhere, unless I
>> overlooked anything.
> 
> Doesn't apply cleanly to current staging, so left out for the time being.

Yes, it isn't applied because of:

[PATCH v8 12/20] xen/riscv: introduce minimal virtual APLIC (vAPLIC) 
infrastructure

~ Oleksii

