Return-Path: <SRS0=FMYz=GX=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87793C433DB
	for <xen-devel@archiver.kernel.org>; Wed, 20 Jan 2021 20:47:46 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 126B3235FA
	for <xen-devel@archiver.kernel.org>; Wed, 20 Jan 2021 20:47:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 126B3235FA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.71767.128787 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2KO2-0007id-8O; Wed, 20 Jan 2021 20:47:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 71767.128787; Wed, 20 Jan 2021 20:47:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2KO2-0007iW-5T; Wed, 20 Jan 2021 20:47:30 +0000
Received: by outflank-mailman (input) for mailman id 71767;
 Wed, 20 Jan 2021 20:47:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vUnd=GX=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1l2KO0-0007iR-NW
 for xen-devel@lists.xenproject.org; Wed, 20 Jan 2021 20:47:28 +0000
Received: from mail-lj1-x22c.google.com (unknown [2a00:1450:4864:20::22c])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 010eb43d-fb27-4b2b-b36f-9162ad58d9eb;
 Wed, 20 Jan 2021 20:47:27 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id x23so20352lji.7
 for <xen-devel@lists.xenproject.org>; Wed, 20 Jan 2021 12:47:27 -0800 (PST)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id j12sm291821lfc.99.2021.01.20.12.47.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Jan 2021 12:47:26 -0800 (PST)
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
X-Inumbo-ID: 010eb43d-fb27-4b2b-b36f-9162ad58d9eb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=yi0zr24d/5qGisNWcKFtTm01pNNqmX2xVtr7lDQl6CM=;
        b=pkaC5VNMC0j7VNKA4CfZxz53hhoF8RWe96rn+P9S6l1nu2KnfBxvu2wxbEIMT9ieXJ
         wmmbIhLwg2CdN0ncZewaSRJ7GDCQnY2R4Rhs53l/JAlq6tigx+Tmd6fbTgFM2Jvy2PfA
         3ho94wqLdc4R0CzhBCX8oQkVNEtrktf/gg89A3mzNa/0pTjKWqhLjyUuxFA48hFr/nZT
         Si/vzuLHKB4gFGHXFakEE1slbYa0tlTq1lo5O748Qqp3fF8LkmM5VAMjQkCT25rOWiKK
         Z8LWC0JTQtMOL670B7HynqnPIGgMxOGXIHyYZY7zj5aMI7If/D3WKG/yHZUN1GBnP4de
         gnrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=yi0zr24d/5qGisNWcKFtTm01pNNqmX2xVtr7lDQl6CM=;
        b=GTSDY+QlTA3vRZUvfug+GFcNGLA/pLN/im/ocRDXZZ0MzF7bfsRxRwSbgBKnRgAvuB
         KBEmLUKK2T1Tp3IvCgOYPwYl0XaSx1IX5ZObiZUF/PcwLlNkUNejD8kXAO7ZCqOsOVlX
         plluD9QlZDlUIjFfnGAh3d/Pbj1xp7Q5m3DS9/89WqvtGY+kjw9IQQ+aPfbHUatGxs5/
         oa6MRMCr98AjXskIv4RHQYi2UYV6TXdql4eBf+xfA30aJDPUJs9GJep5QNCfduxdxlbQ
         TjTyRdUn/r34Gh32QeuJAO9n/Y5A6dzfli6HeNH62/I+jbfL+Y5+r4rRHpxSDhMYwAmO
         EW7w==
X-Gm-Message-State: AOAM530b6OJKd9tNpt8qYWJcCc1Q1jZ99kMJzVf592YxmoH1HGULhP2s
	sUf+UaD4V1yAZmz7OpR1vsVOENjZbyjcCw==
X-Google-Smtp-Source: ABdhPJxWZZV7r7XtpqHYg7pjLOI8TuBvf0esppicdoxPfrOy+zS5bwfFbxrrbDMtc2xUaPBSUdyuWQ==
X-Received: by 2002:a2e:8e98:: with SMTP id z24mr5314531ljk.83.1611175646524;
        Wed, 20 Jan 2021 12:47:26 -0800 (PST)
Subject: Re: [PATCH V4 06/24] xen/ioreq: Make x86's
 hvm_mmio_first(last)_byte() common
To: Jan Beulich <jbeulich@suse.com>
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
References: <1610488352-18494-1-git-send-email-olekstysh@gmail.com>
 <1610488352-18494-7-git-send-email-olekstysh@gmail.com>
 <d3328d6c-a754-efc7-fe94-489dd5282878@suse.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <4d81b9f4-0cb4-caf8-e16d-4a570c2d9e18@gmail.com>
Date: Wed, 20 Jan 2021 22:47:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <d3328d6c-a754-efc7-fe94-489dd5282878@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 20.01.21 18:15, Jan Beulich wrote:

Hi Jan

> On 12.01.2021 22:52, Oleksandr Tyshchenko wrote:
>> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>
>> The IOREQ is a common feature now and these helpers will be used
>> on Arm as is. Move them to xen/ioreq.h and replace "hvm" prefixes
>> with "ioreq".
>>
>> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>> Reviewed-by: Paul Durrant <paul@xen.org>
>> CC: Julien Grall <julien.grall@arm.com>
>> [On Arm only]
>> Tested-by: Wei Chen <Wei.Chen@arm.com>
>>
>> ---
>> Please note, this is a split/cleanup/hardening of Julien's PoC:
>> "Add support for Guest IO forwarding to a device emulator"
>>
>> Changes RFC -> V1:
>>     - new patch
>>
>> Changes V1 -> V2:
>>     - replace "hvm" prefix by "ioreq"
>>
>> Changes V2 -> V3:
>>     - add Paul's R-b
>>
>> Changes V32 -> V4:
>>     - add Jan's A-b
> Did you?

Oops, I didn't. I will add.


>
> Jan

-- 
Regards,

Oleksandr Tyshchenko


