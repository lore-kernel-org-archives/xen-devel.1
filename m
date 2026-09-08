Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFCA5C79FA1
	for <xen-devel@archiver.kernel.org>; Tue,  8 Sep 2026 10:16:06 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1411273.1641969 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x3sro-00069t-6G; Tue, 08 Sep 2026 10:15:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1411273.1641969; Tue, 08 Sep 2026 10:15:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x3sro-00069m-2p; Tue, 08 Sep 2026 10:15:52 +0000
Received: by outflank-mailman (input) for mailman id 1411273;
 Tue, 08 Sep 2026 10:15:51 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1x3srn-00069g-3V
 for xen-devel@lists.xenproject.org; Tue, 08 Sep 2026 10:15:51 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x3srm-00445Y-4i
 for xen-devel@lists.xenproject.org; Tue, 08 Sep 2026 12:15:50 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a9fe050-e002-0a2a0a5209dd-0a2a4507b64c-16
 for <xen-devel@lists.xenproject.org>; Tue, 08 Sep 2026 12:15:50 +0200
Received: from [209.85.218.46] (helo=mail-ej1-f46.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a9fe056-b4ea-0a2a45070019-d155da2eb8f8-3
 for <xen-devel@lists.xenproject.org>; Tue, 08 Sep 2026 12:15:50 +0200
Received: by mail-ej1-f46.google.com with SMTP id
 a640c23a62f3a-c20e70a0962so556337666b.2
 for <xen-devel@lists.xenproject.org>; Tue, 08 Sep 2026 03:15:50 -0700 (PDT)
Received: from [172.19.143.248] (IW396200.net.t-com.hr. [195.29.234.54])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c260d503f96sm583474066b.26.2026.09.08.03.15.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Sep 2026 03:15:48 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1788862549; x=1789467349; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=48xvm1sXjxlbELL90k6ywU4/pB7nbGZAULGKSdWcQ6A=;
        b=TYpMyg9m4NW5+5k28UfUrPvOtzIikBg8NKEIAKNOaaOd+SgawO8zScuzlGqfOwS93h
         NEkyteDWcWNJUgC1uvXSPSkBztT5wajbzRk8BFexh6OV3lk0sV76Sbje3hEfnHtZPcii
         HYeue6koXWmj8dK1ocUKNCWKa+eW4WETuqhdOCaIbXq+b7zVj5nDYu1oF56JHNJ+lieS
         s6PjOxPK6ouMAijN24/1fZ7VtFXsGoqBvT+GQ67WT/XGMUHItwRDeq4vNJgSqtp3HUBT
         wFapJr768GDc+8+QK0QzhCCt90DMSwykJ6qG+yMdIK8CsEqeGi7GUJHOZc9Or10Zgcr5
         spkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788862549; x=1789467349;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=48xvm1sXjxlbELL90k6ywU4/pB7nbGZAULGKSdWcQ6A=;
        b=sLUBJf4Tg6Y6kY3iCWHYvT473BSfQQuZAT1YR/Vpx1lTuLDSxe5EHtbAOiSRyQsfbq
         wZJiqcmd2cppjc2ep52YlsnzY2M3L0NnuH/U3t1PakFz1DE+XEm76KXf3rPvTt1r+s0x
         4yx1n6C9pmc3owLp4pFJ0xFKL9ZPXbu483S+eorbps/mh9Em3NJF8w0PzyA3IeOMDjKp
         kQfd+johgTu8LfDV1ArvYP9i2VFvFkaKvnbAbRXMi3EVd5boeZi/XzMdJkbxByNZDCYg
         JbFzsM/btXgU+cMrYNJvvDWTo8d4c4Wbe3/I9roGP5tVQssqWk6qAw1t7m2CF1tNXNnS
         hrfg==
X-Gm-Message-State: AFuF++lQYKLaBlGwtu7jgKC6SNpaW6Y92wwKkDnW8t59HHF/25bIFzhq
	dwktosgLU+gnTRIdjxY2jEr3jSwb9R4TFTvli1O6Az+yD7dupOA1mFuZIZSA6A==
X-Gm-Gg: AYBFou1afWS9C6vq2hYqLg78jO2vfdZwsMsVuUMOh3q/Bb7mj199vNIym+AiSx/MapV
	vYiO7V4Wh0817IrotQ3PCaWbmnREBtkQ3ZQgPZsVhG4ojtDGedWUFDwlrf8rIlqxBXmJnvURhdX
	/p+NPsiU8atLw+VfZUdkBeuce6YeESBHNJbitiysWXSz97LBTu3wCc7znf6M7lOd6VLoTz0c2Ge
	iEvU5BRRRjzd5TL+vBGPSGguCPehIdnE1cqW0Dgnlf311Is2F8DE20jTZtitnJvQhHRxFxUdKrh
	2TonYQt2ogRR52s637Xqap7e7JoLjhjvVEhbQbBqL3sNe2r4MModtMWFETkNDeu+YUbMyT8YM8O
	fQTgnzrRhPL8yMNlHRMwvtQE4ZU4mNmSbyYRUuM/HkPvstRsQgEefbvO66o/y5iVU10BUHIaUXh
	rgYXGK8CqO2qT8P8RIv1AA9fpvBOtQID14F92w5cP8ZvCY9hX4BhzXqJ2Yixp6yofwZ05iHtpv/
	V2BGsT+xuiR3IVQyx6DwPJUC1esz1zs
X-Received: by 2002:a17:907:d93:b0:c25:2a78:15ed with SMTP id a640c23a62f3a-c260c8b4c36mr1821644866b.6.1788862549334;
        Tue, 08 Sep 2026 03:15:49 -0700 (PDT)
Message-ID: <f8db1000-f309-4e35-8a03-80d09bea1f7f@gmail.com>
Date: Tue, 8 Sep 2026 12:15:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 20/39] xen/riscv: detect Shtvala
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
 <611683b3d2e3b836d08d0499f7caff782ba80a34.1787838835.git.oleksii.kurochko@gmail.com>
 <1788796635.8631fc262581453bbf619ec5b2062170.1a07c968805000c4f3@vates.tech>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <1788796635.8631fc262581453bbf619ec5b2062170.1a07c968805000c4f3@vates.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ef75cf/1788862550-A5AC0AE4-13175BBE/10/73395122804
X-purgate-type: spam
X-purgate-size: 2064



On 9/7/26 5:57 PM, Baptiste Le Duc wrote:
>> Shtvala says that htval is written with the faulting guest physical address
>> on a guest-page fault. The H extension itself allows an implementation to
>> write htval with either that address or with zero, so where the extension is
>> absent a zero htval cannot be told apart from a genuine fault on guest
>> physical address 0-3.
>>
>> It is not offered to guests. Shtvala describes the HS-mode trap interface,
>> which a VS-mode guest never sees, and the H extension it belongs to is
>> already withheld from guests. Its guest-facing counterpart is a separate
>> extension, Shvstvala.
>>
>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>>
> I thought this commit message is not very clear. Here is a more direct
> suggestion:
> 
> ```
> The H extension allows htval, on a guest-page fault, to be written with
> either the faulting guest physical address or zero. Shtvala extension
> removes the ambiguity of this zero-write by guaranteeing that htval is
> written with the faulting guest physical address in every circumstance
> permitted by the ISA.
> 
> Not offered to guests: Shtvala describes htval, an HS-mode-only trap
> register a VS-mode guest never touches and the H extension it belongs to
> is already hidden from guests. The guest-visible equivalent is a
> separate extension, Shvstvala, covering vstval instead.
> ```

Sounds good to me. I will apply your suggestion.

> 
> Btw, I saw Linux has Documentation/devicetree/bindings/riscv/extensions.yaml
> which describes all of the extensions supported, don't you think it would
> be useful to have the same in docs/misc/devicetree/...?

I think it could be useful.

I think also about booting.txt already exitsted in the codebase. Would 
you be okay with that? I think I will add the section to booting.txt and 
pointing to riscv_isa_ext[] in cpufeature.c and so we won't miss an 
update of doc if we will add or remove support of an extension. Does it 
sound good to you?

~ Oleksii



