Return-Path: <SRS0=BOky=EQ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 398DDC388F7
	for <xen-devel@archiver.kernel.org>; Tue, 10 Nov 2020 20:01:28 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 97F052067D
	for <xen-devel@archiver.kernel.org>; Tue, 10 Nov 2020 20:01:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gCXOExft"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 97F052067D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.23927.50915 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kcZp5-0002uk-2T; Tue, 10 Nov 2020 20:00:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 23927.50915; Tue, 10 Nov 2020 20:00:59 +0000
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
	id 1kcZp4-0002ud-Vs; Tue, 10 Nov 2020 20:00:58 +0000
Received: by outflank-mailman (input) for mailman id 23927;
 Tue, 10 Nov 2020 20:00:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BlNO=EQ=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1kcZp3-0002uY-Ha
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2020 20:00:57 +0000
Received: from mail-lf1-x141.google.com (unknown [2a00:1450:4864:20::141])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e6cc7351-0dda-4849-a152-07abc18202e9;
 Tue, 10 Nov 2020 20:00:56 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id e27so19367032lfn.7
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2020 12:00:56 -0800 (PST)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id n20sm2165361ljj.85.2020.11.10.12.00.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Nov 2020 12:00:55 -0800 (PST)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=BlNO=EQ=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
	id 1kcZp3-0002uY-Ha
	for xen-devel@lists.xenproject.org; Tue, 10 Nov 2020 20:00:57 +0000
X-Inumbo-ID: e6cc7351-0dda-4849-a152-07abc18202e9
Received: from mail-lf1-x141.google.com (unknown [2a00:1450:4864:20::141])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id e6cc7351-0dda-4849-a152-07abc18202e9;
	Tue, 10 Nov 2020 20:00:56 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id e27so19367032lfn.7
        for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2020 12:00:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=qtAwTdnEJSWx+IgWSM4arTxkF9Jv4KcG+2RumSEPQcU=;
        b=gCXOExftDjEN2W2GVE7V2r0zF5kix4KtrByDpuCqsv/oVfn0wPUq8gm9WsZWRiV8ER
         VF1uABxYgH0q5u5jhyZKUADpsr5MeDlZhUGWeK7UnaNtSjvn+1Xu/WInMd9ShYYytRKq
         HV4MbTklYoQWE7BmyC3JN3bveHtjp00/7/efBy564mMhM8ESgQg2wF3jQ3DAnMhx/vKz
         zZd9bpSM0tbKJ+IFPnWbJzJ/f16Fet71KXreT0IphDl8uXjvj/IYb1baG23G62zg6ZGB
         N3U+ndnP7ShDbdjzh5OhOEqQLHNoxadLHjap1VkxDyKZpGdBSazWcav44KVGUxFjeWv0
         3YKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=qtAwTdnEJSWx+IgWSM4arTxkF9Jv4KcG+2RumSEPQcU=;
        b=twVhHrGvP3CcGK80zggmhkO6NgKbR9L2rblYIrkM8sZHSXgtWZVPz5cvuNi7mBjO0f
         lot1FHHWrUZEnRxmfZT4bbdwpW0cVXlltf/7IUVV0sQTxhO03dbyTnwm7CcS2X0pmZtE
         Pp5UBnoxYiMMpucECtOO28X7dYB+r81iISjJdt8AONuKXlbSl8k6bFZfu19ORUcszZbS
         oEn0bhnKa/BvO8HCwjQRTx1oM3OL00VE06xzy3ag5LrBxntlaDGx/KeGhRQs0BDLvm4u
         AhBnKnPp+UgoYPE2YZC1O/AhBCpTlgWTFRzutlWkVrg/sXGpZJxNAQJuu9QKCV/ZjfG7
         14hw==
X-Gm-Message-State: AOAM533dS7LGIKPojiK9s7NRvmUjbNH1xduaXzU0HlEcCpYYfOcKS//g
	vsFC7nIRVW/0nWRG/gxntu4=
X-Google-Smtp-Source: ABdhPJxkaf5F/iurLZTZMh9REo5fgRnyhe7/n1eFT7FkCpVWD0XFfJ1uVoq7vITsKMfwSHEcJsXjoA==
X-Received: by 2002:a19:c94:: with SMTP id 142mr7704702lfm.284.1605038455625;
        Tue, 10 Nov 2020 12:00:55 -0800 (PST)
Received: from [192.168.1.7] ([212.22.223.21])
        by smtp.gmail.com with ESMTPSA id n20sm2165361ljj.85.2020.11.10.12.00.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2020 12:00:55 -0800 (PST)
Subject: Re: [PATCH V2 08/23] xen/ioreq: Introduce ioreq_params to abstract
 accesses to arch.hvm.params
To: paul@xen.org, xen-devel@lists.xenproject.org
Cc: 'Oleksandr Tyshchenko' <oleksandr_tyshchenko@epam.com>,
 'Jan Beulich' <jbeulich@suse.com>,
 'Andrew Cooper' <andrew.cooper3@citrix.com>,
 =?UTF-8?B?J1JvZ2VyIFBhdSBNb25uw6kn?= <roger.pau@citrix.com>,
 'Wei Liu' <wl@xen.org>, 'Julien Grall' <julien@xen.org>,
 'Stefano Stabellini' <sstabellini@kernel.org>,
 'Julien Grall' <julien.grall@arm.com>
References: <1602780274-29141-1-git-send-email-olekstysh@gmail.com>
 <1602780274-29141-9-git-send-email-olekstysh@gmail.com>
 <004c01d6a6cd$8b3e22e0$a1ba68a0$@xen.org>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <6b23967b-7517-477f-6923-ce530e877480@gmail.com>
Date: Tue, 10 Nov 2020 22:00:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <004c01d6a6cd$8b3e22e0$a1ba68a0$@xen.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 20.10.20 13:41, Paul Durrant wrote:

Hi Paul

Sorry for the late response.


>> -----Original Message-----
>> From: Oleksandr Tyshchenko <olekstysh@gmail.com>
>> Sent: 15 October 2020 17:44
>> To: xen-devel@lists.xenproject.org
>> Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>; Paul Durrant <paul@xen.org>; Jan Beulich
>> <jbeulich@suse.com>; Andrew Cooper <andrew.cooper3@citrix.com>; Roger Pau Monné
>> <roger.pau@citrix.com>; Wei Liu <wl@xen.org>; Julien Grall <julien@xen.org>; Stefano Stabellini
>> <sstabellini@kernel.org>; Julien Grall <julien.grall@arm.com>
>> Subject: [PATCH V2 08/23] xen/ioreq: Introduce ioreq_params to abstract accesses to arch.hvm.params
>>
>> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>
>> We don't want to move HVM params field out of *arch.hvm* in this particular
>> case as although it stores a few IOREQ params, it is not a (completely)
>> IOREQ stuff and is specific to the architecture. Instead, abstract
>> accesses by the proposed macro.
>>
>> This is a follow up action to reduce layering violation in the common code.
>>
>> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>> CC: Julien Grall <julien.grall@arm.com>
>>
> Keeping the 'legacy' magic page code under an x86 ioreq.c would avoid the need for this patch.

In that case, yes, agree.


-- 
Regards,

Oleksandr Tyshchenko


