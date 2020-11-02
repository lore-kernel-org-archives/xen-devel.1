Return-Path: <SRS0=5c5y=EI=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2587C00A89
	for <xen-devel@archiver.kernel.org>; Mon,  2 Nov 2020 05:56:06 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4547F20870
	for <xen-devel@archiver.kernel.org>; Mon,  2 Nov 2020 05:56:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tJkrpkuv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4547F20870
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.17371.42162 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kZSov-0001VA-6w; Mon, 02 Nov 2020 05:55:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 17371.42162; Mon, 02 Nov 2020 05:55:57 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kZSov-0001V3-3j; Mon, 02 Nov 2020 05:55:57 +0000
Received: by outflank-mailman (input) for mailman id 17371;
 Mon, 02 Nov 2020 05:55:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Pnj+=EI=gmail.com=andr2000@srs-us1.protection.inumbo.net>)
 id 1kZSot-0001Uv-Tp
 for xen-devel@lists.xenproject.org; Mon, 02 Nov 2020 05:55:56 +0000
Received: from mail-lj1-x242.google.com (unknown [2a00:1450:4864:20::242])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 81110818-03c2-4211-841c-ed5a36365fab;
 Mon, 02 Nov 2020 05:55:55 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id v19so8753760lji.5
 for <xen-devel@lists.xenproject.org>; Sun, 01 Nov 2020 21:55:55 -0800 (PST)
Received: from [192.168.10.4] ([185.199.97.5])
 by smtp.gmail.com with ESMTPSA id k13sm2007725lfe.179.2020.11.01.21.55.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 01 Nov 2020 21:55:53 -0800 (PST)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=Pnj+=EI=gmail.com=andr2000@srs-us1.protection.inumbo.net>)
	id 1kZSot-0001Uv-Tp
	for xen-devel@lists.xenproject.org; Mon, 02 Nov 2020 05:55:56 +0000
X-Inumbo-ID: 81110818-03c2-4211-841c-ed5a36365fab
Received: from mail-lj1-x242.google.com (unknown [2a00:1450:4864:20::242])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 81110818-03c2-4211-841c-ed5a36365fab;
	Mon, 02 Nov 2020 05:55:55 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id v19so8753760lji.5
        for <xen-devel@lists.xenproject.org>; Sun, 01 Nov 2020 21:55:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=Lw6JhrZAacucyBbqvQgzEycZM3mRTn4rRKHi43j13hI=;
        b=tJkrpkuvHdKsxOjwbAj204dqo/ug6ebscDcSkkOnpWzSpRnMsM2BrIUGxVlIgGQpBb
         VgQu7StFn+63uvo7wCVs8oVgzU6VSN+qjjrRBUvy2x0yPx2dCWmSHNPzti4w45h0tOP3
         oWAuwFPy9FBAhxgOND9S2wUIjcUEKDzX3Jyd1CH8XNi6vcy9hbX/tkgPAy8mRiYSY7h0
         lMVx64kllGCvYsDm4bwXBYwlhMTbwMTHC30jYCeW6hhur3+q8UZci/9I3GGXkiG/Vrhu
         2HjEzP6P9iBedNkOTNbRYdCQHQWMRvy7WJJil1lhAlJu73M3ZO0spop6ZH7vOTLxTNd7
         rZiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=Lw6JhrZAacucyBbqvQgzEycZM3mRTn4rRKHi43j13hI=;
        b=I6PNihi6fYZc7Ot+KlghQ3mtHXwQ8TKxOa/tcTle3PSFrcb53I9YibnOtElom/0yPB
         521MSp9BMAEFqrJytz/n1XFKjGbyjzay0SiCNglKu9mz4xH4gLaENYGTDHRnQLr3NfW8
         YeRmmkQK8HWAa6rSBxu+4fRqS8UTJlwh+XR35OmkET4qz5U5woZAcUhcC4w+7z7/b7lf
         Mat5u8crDxNKhv2iy3DCXazw3gRX24GAF6sLnCoCeGoz8GN2bfHKAUnHvIjpguqnUxkT
         SmEZrqNjpT7em613PBZxKKXpCxOHDfS8v8mi9aP5+f9tfxorL8s/v5ua6zKFxlnsriLS
         dL7Q==
X-Gm-Message-State: AOAM530W0hyTJHvYIEOSbbLFftIPagw7iEd7eXSvc3FR6G1xT2Ju/wHx
	GlULYTbfPNmTzBTSmmDlnxI=
X-Google-Smtp-Source: ABdhPJzT7TB+JDrDcnmrSyxG4L3jkKeCzdQhZt2+kymG7S/gQnZffogjcRMMMtqO+gxqogLy+SuH5Q==
X-Received: by 2002:a2e:6e10:: with SMTP id j16mr5588344ljc.320.1604296553863;
        Sun, 01 Nov 2020 21:55:53 -0800 (PST)
Received: from [192.168.10.4] ([185.199.97.5])
        by smtp.gmail.com with ESMTPSA id k13sm2007725lfe.179.2020.11.01.21.55.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Nov 2020 21:55:53 -0800 (PST)
Subject: Re: [XEN PATCH v1] xen/arm : Add support for SMMUv3 driver
To: Julien Grall <julien@xen.org>,
 Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
 Rahul Singh <rahul.singh@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: "bertrand.marquis@arm.com" <bertrand.marquis@arm.com>,
 Jan Beulich <jbeulich@suse.com>, Paul Durrant <paul@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <b085e894773842ac320b818aa6f84289d0a128ed.1602591365.git.rahul.singh@arm.com>
 <09cfc160-3490-0aeb-f872-04fb4ce04364@epam.com>
 <76593217-c7e2-2963-9cbe-d6cc38830710@xen.org>
From: Oleksandr Andrushchenko <andr2000@gmail.com>
Message-ID: <d83f6859-6737-0da8-7c1d-a236e8313869@gmail.com>
Date: Mon, 2 Nov 2020 07:55:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <76593217-c7e2-2963-9cbe-d6cc38830710@xen.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

Hi, Julien!

On 10/30/20 7:18 PM, Julien Grall wrote:
> Hi Oleksandr,
>
> On 30/10/2020 10:44, Oleksandr Andrushchenko wrote:
>> On 10/20/20 6:25 PM, Rahul Singh wrote:
>>> Add support for ARM architected SMMUv3 implementations. It is based on
>>> the Linux SMMUv3 driver.
>>>
>>> Major differences between the Linux driver are as follows:
>>> 1. Only Stage-2 translation is supported as compared to the Linux driver
>>>      that supports both Stage-1 and Stage-2 translations.
>>
>> First of all thank you for the efforts!
>>
>> I tried the patch with QEMU and would like to know if my understanding correct
>>
>> that this combination will not work as of now:
>>
>> (XEN) SMMUv3: /smmuv3@9050000: SMMUv3: DT value = eventq
>> (XEN) Data Abort Trap. Syndrome=0x1940010
>> (XEN) Walking Hypervisor VA 0x40031000 on CPU0 via TTBR 0x00000000b8469000
>> (XEN) 0TH[0x0] = 0x00000000b8468f7f
>>
>> [snip]
>>
>> If this is expected then is there any plan to make QEMU work as well?
>>
>> I see [1] says that "Only stage 1 and AArch64 PTW are supported." on QEMU side.
>
> Just for clarication, you are trying to boot Xen on QEMU, right?
Exactly
>
> You might be able to use the stage-1 page-tables to isolate each device in Xen. However, I don't think you will be able to share the P2M because the page-tables layout between stage-1 and stage-2 is different.
So, it is even more work then
>
>>
>>
>> We are interested in QEMU/SMMUv3 as a flexible platform for PCI passthrough
>>
>> implementation, so it could allow testing different setups and configurations with QEMU.
>
> I would recommend to get the SMMU supporting supporting stage-2 page-tables.
You mean in QEMU?
>
> Regardless that, I think Xen should be able to say the SMMU is not supported rather than crashing.
Yes, that would be nice
>
> Cheers,
>
Thank you,

Oleksandr


