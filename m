Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94179606A31B
	for <xen-devel@archiver.kernel.org>; Thu,  5 Nov 2026 16:26:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=G7/oC7Ew
Received: from list by lists.xenproject.org with outflank-mailman.1475212.1682074 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xP0II-0002Fq-Co; Thu, 05 Nov 2026 16:26:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1475212.1682074; Thu, 05 Nov 2026 16:26:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xP0II-0002Fj-9G; Thu, 05 Nov 2026 16:26:30 +0000
Received: by outflank-mailman (input) for mailman id 1475212;
 Thu, 05 Nov 2026 16:26:29 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xP0IH-0002Fd-1V
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 16:26:29 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xP0IF-00Eddz-O7
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 17:26:27 +0100
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6aecae24-e002-0a2a0a5209dd-0a2a450c9796-16
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 17:26:27 +0100
Received: from [209.85.128.45] (helo=mail-wm1-f45.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6aecae33-f479-0a2a450c0019-d155802dacef-3
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 17:26:27 +0100
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-4a59100fa83so20681135e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 08:26:27 -0800 (PST)
Received: from [192.168.1.6] (user-109-243-65-71.play-internet.pl.
 [109.243.65.71]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4b56f0237aesm78573505e9.9.2026.11.05.08.26.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Nov 2026 08:26:24 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20260707 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:From:Content-Language:References:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793895987; x=1794500787; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BYSvNpGyoJGh7bHU68a8hS3u7Syc2l+JA2nju4G4sYY=;
        b=G7/oC7EwSAc6YMzz0H8lxl8XNA+i8bO0cwVQBVx48FznN+aJO22ZHUEcGvpW1k7biZ
         BVprIlittG1BeEZ6pYRahQcRKwqG7JKakIaRTr4YKKNWyq/NoVLHmazxV66xE0NxJYEA
         beNgxgczRUFzmvlteoX/lcPckZEYUQAgavWtaGhRDEg+XsYYsjGqsvDdQ4kq/f7JE4i0
         8/8KTVl0zQ9JF3a7atyL19wKKPn+vn6swV0/u5g94uT11NJH9+IQsBt8XK4W9ZjxAGPt
         Kcft9qkxj+V44klSBz/QEpYxpn5ojyMwf+FnyP/5ANl/BijFrHq2cUfJ24ubolQSUho6
         MBKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793895987; x=1794500787;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BYSvNpGyoJGh7bHU68a8hS3u7Syc2l+JA2nju4G4sYY=;
        b=o4a9kA+GNfBQw5GGY0c/9/aDPRaIk71ugvuPudwQLeNFjL1n2KBQKg9SIJUNGAhgGS
         Ps+9aDWa9FlBSBIQcpnEzcetGG44Ac246S52mU2cLgvqD9YZV/c/fMJsIH53iOpIkaAG
         5f9fPTLaUxgB1nckg96yj5bW1365OKxUVm7CNWbvvat6aDzzqVSd4CbM4doTAzsyvXgp
         sorBDNl4eS8zWFaNqbQLJQ8oiMRBg0MlIs/y53G3N/BfIUSBjm98qR2ZYRyIXophHfd3
         dk2X1pHhwLClAjimm8gfnmw63AJSO513Pk8hCAMIIs0h0FemgMlk0+dNjAw6QE6Rp1rb
         tPaQ==
X-Forwarded-Encrypted: i=1; AKwUvBzJ/sF1xw8BOT+ZUXCkCrUpfkm1GvZxjkWUZv5/j+Q3wFKVri5Coaq40tb4Ep8L6Z5pTI1ILFzO13I=@lists.xenproject.org
X-Gm-Message-State: APuU4Z+LTCEvEfRz4wEd2lT49GmCyXy8YNVBErqDElqbziJ2leAv0JMB
	AtsMQRnIRB01bSu3FgttIaKs+nF8d6nGOK8egNJVhpBEt7qkhk5Shwby
X-Gm-Gg: AYBFou1vgiy/HZIW/xgazSuBiPgsOJIOG4tu3S8GMAV3eYYvmQlMx+kyOEGeFwpvi1Q
	IQCLK8RRNTHTZrJ4/Sw2OSv6g9pRFCoExYWJwdyE5RWuFgZZ65GrqiNs4PtDoT+tdr8NqYJc8X+
	EU3fDYmPT9rkEv1p011LmDbRX5W+6rCyhZn+kDVmTwwe3HYOOUm09LWZvp3jUCWrF47Sjv2r4ps
	7vgV6HI4mjhW12/JrupRYzbPLnnTv7L/sSW3BFrmoDpb4dbHub9EkhlD2B9EoYri3yAZPSXuIJb
	4Geo8T7PNZkXOTIdB9YQJo9y2dPS2mFYPMXr3Jc4kpHdBiVWe3gtI3HV64K5JvqV85SwHBV2dHb
	ErACMj7HrDAk5m5G+MTtPi8JFr6HcFbmUcrOgwAfjQvsJvvmyPx88ncMpc03XxibarWYlp2vI5m
	/qmjKfbQhhLEHFIGBoaAxNvf+oo+iKHUPIKVvhDktUEm2cuQ0OYYLV9rxRYykKHPFxbO9pTgbT6
	6G3gB1/ywnpfasreVl/9YE+KneOMyfslUPrp1x/bV4CwrXQx0qv2JGMUMTofzGnYdhK76TNszMm
	bPc38DZMw63m6+wSKlnez0heVAr1vwDDoLQJUdNcyL11r2h18Gm3hYasBIZAOhj7EPyxnkdIzXe
	gHNf7bpm2qAF8DGKTYbogpw==
X-Received: by 2002:a05:600c:138c:b0:49f:ce78:3562 with SMTP id 5b1f17b1804b1-4ac1765d3e8mr425684435e9.19.1793895986859;
        Thu, 05 Nov 2026 08:26:26 -0800 (PST)
Message-ID: <3d2b61ed-790a-4c11-8607-8c5fe6b34b61@gmail.com>
Date: Thu, 5 Nov 2026 17:26:23 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 30/39] xen/riscv: implement APLIC-IMSIC-hart sync
 barrier for vCPU migration
To: Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 xen-devel@lists.xenproject.org
References: <cover.1790779209.git.oleksii.kurochko@gmail.com>
 <2075cb10e5f6df787b29f2f087632c82b787a007.1790779209.git.oleksii.kurochko@gmail.com>
 <c77101fe-2505-4cdb-8520-52f92a1c668d@gmail.com>
 <1792763490.8631fc262581453bbf619ec5b2062170.1a16907f005000f79f@vates.tech>
 <cf206b92-88df-4f51-b10b-960e0c141d9e@gmail.com>
 <1793892730.8631fc262581453bbf619ec5b2062170.1a1ac56c714000403d@vates.tech>
 <1ff766a5-3d49-45fb-9c46-d781cfaf4b6d@gmail.com>
 <1793894366.8631fc262581453bbf619ec5b2062170.1a1ac6fbbf5000403d@vates.tech>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <1793894366.8631fc262581453bbf619ec5b2062170.1a1ac6fbbf5000403d@vates.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d25034/1793895987-026DEA5B-002BAAB4/10/73395122804
X-purgate-type: spam
X-purgate-size: 1556
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 11/5/26 4:59 PM, Baptiste Le Duc wrote:
> 
> 
> On 11/5/26 4:51 PM, Oleksii Kurochko wrote:
>>
>>
>> On 11/5/26 4:32 PM, Baptiste Le Duc wrote:
>>> On 2026-11-05 15:21 +0100, Oleksii Kurochko wrote:
>>>> [ ... 348 lines skipped ... ]
>>>>> LGTM, but I wonder why, as I said in the original patch, sync_id is
>>>>> really needed.
>>>>>
>>>>
>>>> I think that I am not understand your response. Could you please
>>>> re-phrase it?
>>> I'm questionning the need of the sync_id field as it will always be
>>> equal to imsic_cfg.nr_ids, couldn't we drop it?
>>>
>>
>> It's equal to nr_ids by choice rather than by necessity: which identity
>> gets reserved is decided in a single place, imsic_parse_node(), and all
>> the users (the genmsi write, the pending bit the barrier spins on, the
>> limit on the APLIC sources and the ASSERT() in imsic_irq_enable()) refer
>> to it by its role rather than as "the last identity".
>>
>> Basically if one day someone will decide to come up with EIID 
>> allocator instead of using static allocation then it will be harder to 
>> find a places where to change.
>>
>> So yes, it could be drooped but at the moment I think it is useful to 
>> have separate field or ,at least, as an option in asm/imsic.h:
>>
>> static inline unsigned int imsic_sync_id(const struct imsic_config *cfg)
>> {
>>      return cfg->nr_ids;
>> }
> 
> I prefer this as it would save space in imsic_config struct.
> 

Thanks for the clarification. I'll go with that approach, then.

~ Oleksii


