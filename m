Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B344ACA6002
	for <xen-devel@archiver.kernel.org>; Wed,  7 Oct 2026 08:31:15 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1442035.1659557 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xEN3I-00015v-7O; Wed, 07 Oct 2026 08:31:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1442035.1659557; Wed, 07 Oct 2026 08:31:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xEN3I-00015o-4i; Wed, 07 Oct 2026 08:31:04 +0000
Received: by outflank-mailman (input) for mailman id 1442035;
 Wed, 07 Oct 2026 08:31:02 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xEN3G-00015i-Ch
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2026 08:31:02 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xEN3F-00GwzR-Ph
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2026 10:31:01 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6ac60342-8faa-0a2a0a5109dd-0a2a4503ba6c-8
 for <xen-devel@lists.xenproject.org>; Wed, 07 Oct 2026 10:31:01 +0200
Received: from [209.85.128.43] (helo=mail-wm1-f43.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6ac60345-fae8-0a2a45030019-d155802bb123-3
 for <xen-devel@lists.xenproject.org>; Wed, 07 Oct 2026 10:31:01 +0200
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-4a061a13884so13212575e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 07 Oct 2026 01:31:01 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-71-234.play-internet.pl.
 [109.243.71.234]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a178c40a28sm145557345e9.7.2026.10.07.01.31.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Oct 2026 01:31:00 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:From:Content-Language:References:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791361861; x=1791966661; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=59vxMKFygRRXTpGVaBbehooknbFJQ4iCaF/7vJel9ak=;
        b=sVIgzFl1dwxHQMh/8kOfOpYvPFhcu83hDv+JwjXSSmUvd9V0NOYBFW498MnT5tlGDj
         J0EkfzvceFtUwPuedxgVd90ik2pp4c924EOSg079H6lGBGKwQgRmq5kl8XjzrkqnT8RR
         lA4F8W9HgZxANNy33acwUxO7NVFX6rjrShTGM2gQY3QthL4ubuUqPGrkom2L9lYFYWmp
         ndBMhFBoP79OJD86nS+fnuwYqvleaLn/pjaZM8zq+iW/GKVQWR1RD0+te17H15cOJMBu
         DiC2uOXe7Aa8/9Jh+56fKU8ghpaMJujuCLzNg1IQ7bw4XyQaAAqfT2ysUUCUfEfljNyf
         yW2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791361861; x=1791966661;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=59vxMKFygRRXTpGVaBbehooknbFJQ4iCaF/7vJel9ak=;
        b=U3C+wCLbWufz70DBBVFKTQ54G6GvD0AnHZPbSf1pYuWVZk0IHXfn1G7+uvQ1xHsOx6
         H7hAKoGFp3nLtqchATaeD9aUmHpMrOvaLVTuzlOIl1Q9BxoBDX8asNEApZA9Z1LPySa0
         t4SKY7vdSwMxbNP6in3anVqQ6rb3rCWOLnAUXlOT/4xFOujxF1RRh+ZE8aGaHAVIpZ90
         4Lbi8In7EDmdutpRabBFgsj8KzFvC8np9mRryfYSSIJ/zi9+2Md+HoKb6klJO+jAIoeH
         SqCZqf3rWn0cfLA+M+VJYAYCjnUWL6FksrE5qLQm/ILeUnI4jtvMqgK1bU/MVuL8lkCm
         F9Fw==
X-Forwarded-Encrypted: i=1; AKwUvBxlNwzBVMUn25r00YH4t9UbwzNV59EfjSA7gxKrA0fgfF2/IvGrW26ksjbRb5xToJhBAKUuLdF0giM=@lists.xenproject.org
X-Gm-Message-State: AFuF++mR2jadBOizzOej7I8V716sNrcdViketctxlMC8ZapHU15O0bc8
	HAl4s4yRP6WAzTiNr4RJ2pcIXrtWn2iWEsBcHXuIR79WfvQdQnBBSSlS
X-Gm-Gg: AYBFou0nA2OEBmXHkoOxm+mIof77TgJ5HWukLSfADZNwswqhPEinoycXCngm2mEAY4e
	7syNyFEkpk9z+mIdPK4c1LwxaGxUQB4SkjUspM/XxUDi9zgYSCzYU9CFVXclTlzgSRPqV5BYaLj
	FBAYWfKukqe7uKskh7sWLF7KxAg36ipWK3G1ol4/fw+t90jp1MbyrRwmAclOVIzH8n6kAfOjeJj
	yp0Hfpd4IpviBPKf6gF96og9GRK5PMz6yRDFcWLSzEcLUKoM6E0RPqORfDEL5SdnYvL4UT0KG3S
	3y9z8P8Mjt0sHkq9imWOPz+k34phL/FJZVPsrcO1+NSEYlX8+acDNCd3K6fR7YmTUIgsEs+s56c
	kEsw/H+b5uuw9WdxBqDasGVpcntFcm9UR+i8ZkeLeNpV891b690k8pYvaoe7yNgDXpRzH8Jv8ks
	TeeIckwduiwlSuz29ERpb99JwZpHer5FjwOsXJAVgIQM+oGg1RjOiCRIgHuRt59/WbIa2OwajVl
	qeALin22bWNjRuMlk0+TMhi2OskWOSNDjiuEdLvUpAuwm5F6ycaGOyuLgfz
X-Received: by 2002:a05:600c:3f08:b0:4a1:7703:e537 with SMTP id 5b1f17b1804b1-4a180313b66mr18708995e9.10.1791361860894;
        Wed, 07 Oct 2026 01:31:00 -0700 (PDT)
Message-ID: <3204203d-83eb-4afe-a99b-5baf1e19777d@gmail.com>
Date: Wed, 7 Oct 2026 10:30:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/3] xen/riscv: always preset A/D bits in G-stage PTEs
To: Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 xen-devel@lists.xenproject.org
References: <1791215925.8631fc262581453bbf619ec5b2062170.1a10cc9f7c20003f66@vates.tech>
 <1791216017.8631fc262581453bbf619ec5b2062170.1a10ccb5ec20003f66@vates.tech>
 <1791327013.8631fc262581453bbf619ec5b2062170.1a113690c000003f66@vates.tech>
 <1791361284.8631fc262581453bbf619ec5b2062170.1a11573f8520003f66@vates.tech>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <1791361284.8631fc262581453bbf619ec5b2062170.1a11573f8520003f66@vates.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-33051d/1791361861-6F2C84E9-5A6BAFC3/10/73395122804
X-purgate-type: spam
X-purgate-size: 2546



On 10/7/26 10:21 AM, Baptiste Le Duc wrote:
> On 10/7/26 00:50, Teddy Astie wrote:
>> Le 05/10/2026 à 18:02, Baptiste Le Duc a écrit :
>>> A RISC-V implementation can manage the PTE A/D bits in one of two ways:
>>>      1) Update the 'A' and 'D' PTE bits in hardware (ratified as Svadu).
>>>      2) Generate a page fault when 'A' and/or 'D' is clear, so that 
>>> software
>>>         can set them (ratified as Svade).
>>>
>>> p2m_set_pte_flags() presets A/D in G-stage PTEs only when the device 
>>> tree
>>> advertises Svade. Platforms that use scheme (2) without advertising 
>>> Svade,
>>> such as the HiFive Premier P550, then hit guest-page faults that Xen 
>>> does
>>> not handle.
>>
>> I second what Jan said (this is likely a firmware bug, given that the 
>> enumerated behavior is not consistent with the specification, as 
>> existence of Svadu/Svade alters observable behavior).
>>
> Thanks, agreed on both points.
> 
> I'll reword the commit message: it shouldn't imply that Svade in the DT 
> means faults will occur, since with Svadu also present that depends on 
> henvcfg.ADUE.
> 
> On the firmware-bug point: I don't think the P550 is really inconsistent 
> with the spec. Svade and Svadu didn't exist when the P550 core was 
> designed. They were only ratified later, to name the two behaviors that 
> already existed in the wild. Before that, the privileged spec just 
> allowed either: hardware updating A/D, or raising a page fault. The P550 
> implements the second, and there was no extension it could advertise for 
> it.
> Therefore, the DT lacks svade because the extension didn't exist when 
> the platform description was written, not because the vendor 
> misdescribed anything.
> 
> I agree that, where Svadu is available, Xen should ideally configure a 
> consistent scheme (ADUE=1) and use ADUE=0 only for specific needs such 
> as dirty tracking. But Xen doesn't support Svadu today, so that is a 
> separate piece of work which I'd prefer to do later.

It would be nice to have such option to configure ADUE bit but IIRC it 
could be configured only in M-mode (so OpenSBI and OpenSBI really set 
ADUE to 1 when Svadu is available) so we will need some kind of new SBI 
call to do that as we are working in HS-mode and can't change ADUE bit.

So IMO we don't really need that for now until we really will start to 
use A/D bits for Xen purpose. For me, at the moment, it is more then 
enough just to have them always set.

~ Oleksii


