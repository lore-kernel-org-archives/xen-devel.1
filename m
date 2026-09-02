Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AC36C61DD6
	for <xen-devel@archiver.kernel.org>; Wed,  2 Sep 2026 15:56:27 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1406140.1639558 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1nJo-0002Ck-9X; Wed, 02 Sep 2026 15:56:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1406140.1639558; Wed, 02 Sep 2026 15:56:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1nJo-0002Cd-6z; Wed, 02 Sep 2026 15:56:08 +0000
Received: by outflank-mailman (input) for mailman id 1406140;
 Wed, 02 Sep 2026 15:56:07 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1x1nJn-0002CV-DX
 for xen-devel@lists.xenproject.org; Wed, 02 Sep 2026 15:56:07 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x1nJm-003Qce-4e
 for xen-devel@lists.xenproject.org; Wed, 02 Sep 2026 17:56:06 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a984716-8faa-0a2a0a5109dd-0a2a45079318-2
 for <xen-devel@lists.xenproject.org>; Wed, 02 Sep 2026 17:56:06 +0200
Received: from [209.85.221.43] (helo=mail-wr1-f43.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a984715-b4ea-0a2a45070019-d155dd2bc550-3
 for <xen-devel@lists.xenproject.org>; Wed, 02 Sep 2026 17:56:05 +0200
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-4843f205a5bso931675f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 02 Sep 2026 08:56:05 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48448e800cfsm6919332f8f.12.2026.09.02.08.56.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Sep 2026 08:56:04 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:Content-Language:References:Cc:To:From:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788364565; x=1788969365; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CcrEXnIwy36amc4izOGe3Zf1k6Xo3Vi0qqPL9Xy8XiA=;
        b=TiRFhE3eJ8BX0G396s79qjaJl1Md0KPlEOYKaCcGZ2GWL/+3QRNdv/CalGe6ooUGaW
         VV+v+x0xVWsUYPTTJ4onYbqSXHWWZcfM7qfa72lfMdew8mBuwENFB7rnA4gmh6eBo01U
         K2KcJPJy60ugjl3k+mvlGDFPyq1zA8z1ZHxytRwvKz1AmxplyMipRE3gKDph2eaWgIrn
         X4Ia2iP3FF1Pxt4+C3o/3snUnnEIfXmQ710PfCocPnSTSNAgo7bk8J0Yu5zS8v8GNeI+
         4uloDCxqeQg0PtSPywtc5Vmo8G3ig7I5B0ee7RLAk93/GSDMAEy3DQfe1WJ1nZdGlVGd
         F2QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788364565; x=1788969365;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CcrEXnIwy36amc4izOGe3Zf1k6Xo3Vi0qqPL9Xy8XiA=;
        b=EYBJlkg02wctxYx7DwDiOy7pt2/cW0ruIZOkkQ0fjQ1RAVQeYWxuwOBSTb08tuE0/e
         TGQygjb1XRYR6DpbgV81LkFwlsvcrekufY5kggUnAL8EVHfGEhYoNXMPgEWdRUO3aAML
         i5dV/T/KcCYryJfVXSDAaR/RSc6L4o/iY45LAZ0U8UasboWtHzGDX05ibXoi5TnbkjbG
         ohSIp5ceL25ySQcdzTB7Q8cOtygaCrcbr5TOeRyFfTPQgHw6ARPL6RE0oQJAR1vIXfjh
         8tdg6tjhdSIcnPGeVt233CpualSvvisG8xZSkQIWK87X9m0jr1SOPh2EaHRlrPCVfUGq
         t0gQ==
X-Forwarded-Encrypted: i=1; AHgh+RqLqa8zVsTUlBGAxAQRlnqvuAzEr4kIAaeAipLfX5oMxjQrJTp+pGWthzBOZ6mfBgdKC6dO9fy2LZk=@lists.xenproject.org
X-Gm-Message-State: AFuF++kymUv/1IGufmOZMAjDa0tCtLiEGs2KK+UkK0uOolqmmZG/C+6S
	vdnSQWb5dKj1lpwzRw5ccmMjnEaBz5G0GiV4UFIJ8JChmMrAmdD7Am+X
X-Gm-Gg: AR+sD13rMEqjn+b+b/AISt+Qphwt6YLDZBKyAIFoCEkrfVDWw1aKdfm28AvqLZG3pb5
	aS2VME3xAvyRdIPJZnM92bpcuVjR4v7ihtcQQTFEDr1JfQnoiJLTm/4vEDd9QLLd6whCpA5bOcJ
	sJpULP0TDyQQb5wHYtq1L3cEi3n5looXmjLgbp1veXzxrtyUwnQ2+2Xvyvt8w9ppVH0XSS3GKj4
	gf9EhKxTSmYadq8u/CyUURefree89tdrJs6E6cFVkdYAcCtyErA7xRdvIeurhnUWlZzA8ZytrIK
	OeL48vptPIR48MNhBPW0A7p+ets8UEHJNmU1I0RmnYQSrYIiuNhoLSTOkU6Qh4+XbsRWTO/GH6p
	roHxyc77va22/9xyXSEIE+Dz3Q1VPfjFHB17xXXRYU28jalG+3cwovXXLVpVWJAvu1Va6Vy40NH
	9Ha+uaK9K4ZvOCW3wHkLY46GCD15RubZirrYt19RjqY2g8QWh+l/etOVmZGRQPjO0UwH/AOu0aq
	lC91XbLdR44FFF8TdBYZyVfqJ6CKsq3PMrl0gJscg==
X-Received: by 2002:a05:600c:3f19:b0:499:93b3:91ea with SMTP id 5b1f17b1804b1-49ce582959cmr121773695e9.15.1788364565165;
        Wed, 02 Sep 2026 08:56:05 -0700 (PDT)
Message-ID: <b876ff5e-341a-4dd1-8df2-1017f788cbdc@gmail.com>
Date: Wed, 2 Sep 2026 17:56:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/39] xen/riscv: set the guest's XLEN explicitly in
 hstatus.VSXL
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 Zheng Zhang <zhangzheng@iscas.ac.cn>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1787838835.git.oleksii.kurochko@gmail.com>
 <a3ae79823e24f2e18cef2fac8ffffe7caa608f32.1787838835.git.oleksii.kurochko@gmail.com>
 <825ea854-5778-4cb6-a9a9-0ff97fa7bee5@suse.com>
 <127e8aea-4d65-492e-8bda-bffc75f02481@gmail.com>
 <071c5b4f-1d57-4223-94bd-9f8ae8d80366@suse.com>
 <edf010a3-5e76-4ed8-a660-b6f7f9d19ff2@gmail.com>
 <d4b6f86f-140a-4e9d-b21a-c71aae7978b5@suse.com>
 <a19802e5-3cb1-44d0-83ea-05612b550591@gmail.com>
Content-Language: en-US
In-Reply-To: <a19802e5-3cb1-44d0-83ea-05612b550591@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ef75cf/1788364566-A7ED6AE4-8678E7EC/10/73395122804
X-purgate-type: spam
X-purgate-size: 2764



On 9/2/26 5:17 PM, Oleksii Kurochko wrote:
> 
> 
> On 9/2/26 4:31 PM, Jan Beulich wrote:
>> On 02.09.2026 15:29, Oleksii Kurochko wrote:
>>> On 9/2/26 3:07 PM, Jan Beulich wrote:
>>>> On 02.09.2026 13:42, Oleksii Kurochko wrote:
>>>>> It will also affect then common code as vcpu_csr_init() could be then
>>>>> called before domain type is set:
>>>>>
>>>>> +++ b/xen/common/device-tree/dom0less-build.c
>>>>> @@ -812,17 +812,18 @@ static int __init construct_domU(struct
>>>>> kernel_info *kinfo,
>>>>>         else if ( rc == 0 && !strcmp(dom0less_enhanced, "no- 
>>>>> xenstore") )
>>>>>             kinfo->dom0less_feature = DOM0LESS_ENHANCED_NO_XS;
>>>>>
>>>>> -    if ( vcpu_create(d, 0) == NULL )
>>>>> -        return -ENOMEM;
>>>>> -
>>>>>         d->max_pages = ((paddr_t)mem * SZ_1K) >> PAGE_SHIFT;
>>>>>
>>>>>         rc = kernel_probe(kinfo, node);
>>>>>         if ( rc < 0 )
>>>>>             return rc;
>>>>>
>>>>> +    /* The domain type needs to be known before the first vCPU is
>>>>> created. */
>>>>>         set_domain_type(d, kinfo);
>>>>>
>>>>> +    if ( vcpu_create(d, 0) == NULL )
>>>>> +        return -ENOMEM;
>>>>
>>>> I don't understand the need for this, likely because I don't see why
>>>> domain_vsxl() would need calling from underneath vcpu_create().
>>>
>>> The call trace will be the following:
>>>     vcpu_create() -> arch_vcpu_create() -> vcpu_csr_init() ->
>>> domain_vsxldomain_vsxl()
>>>
>>>       unsigned int vsxl = domain_vsxl(v->domain);
>>>
>>>       ...
>>>
>>>       vcpu_guest_cpu_user_regs(v)->hstatus =
>>>           HSTATUS_SPV | HSTATUS_SPVP | MASK_INSR(vsxl, HSTATUS_VSXL);
>>>
>>> Without moving vcpu_create(d, 0) after set_domain_type(), domain_vsxl()
>>> will return something wrong.
>>
>> Question is - do you need to set ->hstatus this early?
> 
> Good point. I think that there is no really such need. It could be set 
> (at least, VSXL) just before jumping to new vCPU where we know domain 
> type for sure.

I planned to set VSXL bits here: 
https://lore.kernel.org/xen-devel/cover.1787838835.git.oleksii.kurochko@gmail.com/T/#m4144ea90815b48f2d281a2267cd28f50bd4cd54c

But it seems that I can't do that there as considering that platform can 
do VSXLEN == HSXLEN == 64 but someone will try do run
vCPU in 32bit mode we can't just crash domain in continue_new_vcpu().

Then still to set it in arch_vcpu_create() will be better (or in the 
construct_domain() if we want to avoid to change dom0less common code). 
At this stage it is easier to reject to create such vCPU which violates 
platform implementation.

~ Oleksii

