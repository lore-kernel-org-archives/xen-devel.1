Return-Path: <SRS0=cbMO=BQ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37134C433E3
	for <xen-devel@archiver.kernel.org>; Thu,  6 Aug 2020 12:01:28 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 04C0C22D02
	for <xen-devel@archiver.kernel.org>; Thu,  6 Aug 2020 12:01:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fb7bgxh3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 04C0C22D02
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k3b8b-0004OT-50; Thu, 06 Aug 2020 08:20:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HTjn=BQ=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1k3b8Z-0004OO-Fj
 for xen-devel@lists.xenproject.org; Thu, 06 Aug 2020 08:20:31 +0000
X-Inumbo-ID: 7526d188-3049-4643-836c-879667853536
Received: from mail-lj1-x242.google.com (unknown [2a00:1450:4864:20::242])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7526d188-3049-4643-836c-879667853536;
 Thu, 06 Aug 2020 08:20:30 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id g6so38115035ljn.11
 for <xen-devel@lists.xenproject.org>; Thu, 06 Aug 2020 01:20:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=N/jRCuLrGIw0wydT6IPDn4A6ZllL+0k+MGioxejrhJg=;
 b=fb7bgxh3WV0Rcl9k4cctFwuf8nuNzqfQIxqe9CJES3R+MIqBGqEcE9jQVyD1pG26Wu
 OpKCrq0ImOqeeghZTvuikFf/qGKLFz62ohIoiQMVuVR9zNHDCzm7qGgQx1MdY0UFv1dE
 B4MtP6bCZNr/rhs/qRZdpH45ugKhAuXLqPLB21zwGT+L/bA1EP3W4L2A+IWIDAK1YMDD
 nQL8Y0ViPx3nzzqyvrquYcMySq6RPjK4cgkLQSyZ9Xx1xUIJouBo1ZS5TTX93FzIqp39
 wl5p2wzHWTgxepH3av3pZ6uUHjxmg7k2udQdIvlDb/KwllQZk039+tzn3rQMW3bxSBhJ
 9+WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=N/jRCuLrGIw0wydT6IPDn4A6ZllL+0k+MGioxejrhJg=;
 b=TYgzf0ODywyz1z038Nghyv8joEdURViGBC0DUdoHeFrqMg0vah27O9gAUI9EWvsRQJ
 Ax7/bcCZ0yGUmt5Wf6W196Th8q3Gns/9ftTyRiBUcMegSL/5Cy6w34uKEqfjztdCAaKK
 0qGibS8vZBDD9I8V7f8wIhQrukg34vGAO/y8eZMAfhWlGU+DOL80cymVvXLCGJMoBFdD
 rjL1Q3pQVzMN7zwsO6s6OqmPj+qnPSpQOS9UMG3/+DVdPJldGipg2NyRuHKHhbaiUYJZ
 H5XtmdtiP12KXeKGwDB2fzQ9/A2SerzyE/bNPIIjfTf7cTMMmAIzrERPTIvp2jT1C8MU
 taag==
X-Gm-Message-State: AOAM533gKvD691QgS147al1cLr8Y76NiDhYm2VCGD9JN4I1POTdy1LGy
 SyvmjHNx/lidyGo2OTSv5C8=
X-Google-Smtp-Source: ABdhPJxBFTu29BeH2Ek58cpSwUhh14eMMNKF4cfifP4cm5VociUQNlxXx824iD0EeJNetUPazqkYhQ==
X-Received: by 2002:a2e:850b:: with SMTP id j11mr3073243lji.254.1596702028899; 
 Thu, 06 Aug 2020 01:20:28 -0700 (PDT)
Received: from [192.168.1.2] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id i19sm2371150lfi.14.2020.08.06.01.20.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Aug 2020 01:20:28 -0700 (PDT)
Subject: Re: [RFC PATCH V1 01/12] hvm/ioreq: Make x86's IOREQ feature common
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <1596478888-23030-1-git-send-email-olekstysh@gmail.com>
 <1596478888-23030-2-git-send-email-olekstysh@gmail.com>
 <57ab62fb-048f-44ae-f815-9d5054457eb9@citrix.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <863748b5-f4f4-b240-b29a-a54d64b7a04e@gmail.com>
Date: Thu, 6 Aug 2020 11:20:21 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <57ab62fb-048f-44ae-f815-9d5054457eb9@citrix.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>,
 Paul Durrant <paul@xen.org>, Tim Deegan <tim@xen.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Julien Grall <julien.grall@arm.com>, Jun Nakajima <jun.nakajima@intel.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


On 05.08.20 19:15, Andrew Cooper wrote:

Hi Andrew

> On 03/08/2020 19:21, Oleksandr Tyshchenko wrote:
>> diff --git a/xen/common/Makefile b/xen/common/Makefile
>> index 06881d0..f6fc3f8 100644
>> --- a/xen/common/Makefile
>> +++ b/xen/common/Makefile
>> @@ -70,6 +70,7 @@ extra-y := symbols-dummy.o
>>   
>>   obj-$(CONFIG_COVERAGE) += coverage/
>>   obj-y += sched/
>> +obj-$(CONFIG_IOREQ_SERVER) += hvm/
>>   obj-$(CONFIG_UBSAN) += ubsan/
>>   
>>   obj-$(CONFIG_NEEDS_LIBELF) += libelf/
>> diff --git a/xen/common/hvm/Makefile b/xen/common/hvm/Makefile
>> new file mode 100644
>> index 0000000..326215d
>> --- /dev/null
>> +++ b/xen/common/hvm/Makefile
>> @@ -0,0 +1 @@
>> +obj-y += ioreq.o
>> diff --git a/xen/common/hvm/ioreq.c b/xen/common/hvm/ioreq.c
>> new file mode 100644
>> index 0000000..7e1fa23
>> --- /dev/null
>> +++ b/xen/common/hvm/ioreq.c
>> <snip>
> HVM is an internal detail of arch specific code.  It should not escape
> into common code.
>
>  From x86's point of view, there is nothing conceptually wrong with
> having an IOREQ server for PV guests, although it is very unlikely at
> this point that adding support would be a good use of time.

Got it.


> Please make this into a proper top-level common set of functionality.

ok.


-- 
Regards,

Oleksandr Tyshchenko


