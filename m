Return-Path: <SRS0=FTcr=IH=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C554C433E0
	for <xen-devel@archiver.kernel.org>; Tue,  9 Mar 2021 10:37:14 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4825E6526C
	for <xen-devel@archiver.kernel.org>; Tue,  9 Mar 2021 10:37:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4825E6526C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.95317.179907 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJZjf-0002H3-Np; Tue, 09 Mar 2021 10:37:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 95317.179907; Tue, 09 Mar 2021 10:37:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJZjf-0002Gw-Ki; Tue, 09 Mar 2021 10:37:07 +0000
Received: by outflank-mailman (input) for mailman id 95317;
 Tue, 09 Mar 2021 10:37:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GyQX=IH=arm.com=michal.orzel@srs-us1.protection.inumbo.net>)
 id 1lJZje-0002Gn-3i
 for xen-devel@lists.xenproject.org; Tue, 09 Mar 2021 10:37:06 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 82ac0d2a-4bd5-4127-b049-a7995d75f876;
 Tue, 09 Mar 2021 10:37:05 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DEE651063;
 Tue,  9 Mar 2021 02:37:04 -0800 (PST)
Received: from [10.57.15.131] (unknown [10.57.15.131])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A6CD33F71B;
 Tue,  9 Mar 2021 02:37:02 -0800 (PST)
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
X-Inumbo-ID: 82ac0d2a-4bd5-4127-b049-a7995d75f876
Subject: Re: [PATCH v2] arm: Add Kconfig entry to select CONFIG_DTB_FILE
To: Julien Grall <julien@xen.org>, Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, bertrand.marquis@arm.com,
 xen-devel@lists.xenproject.org
References: <20210308135937.1692-1-michal.orzel@arm.com>
 <37ea3c87-c960-4c92-af5f-71f2db774a75@suse.com>
 <efdf6d29-7e1e-4239-ac80-31cfef18ab31@arm.com>
 <d309a1bb-8da1-ca32-3c33-82b197abfb1e@xen.org>
From: Michal Orzel <michal.orzel@arm.com>
Message-ID: <6ce4c4c6-91a4-5c88-abe1-ac1eec52c663@arm.com>
Date: Tue, 9 Mar 2021 11:37:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <d309a1bb-8da1-ca32-3c33-82b197abfb1e@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit



On 09.03.2021 11:22, Julien Grall wrote:
> 
> 
> On 09/03/2021 07:28, Michal Orzel wrote:
>>
>>
>> On 08.03.2021 15:26, Jan Beulich wrote:
>>> On 08.03.2021 14:59, Michal Orzel wrote:
>>>> --- a/xen/arch/arm/Makefile
>>>> +++ b/xen/arch/arm/Makefile
>>>> @@ -68,7 +68,7 @@ extra-y += $(TARGET_SUBARCH)/head.o
>>>>     #obj-bin-y += ....o
>>>>   -ifdef CONFIG_DTB_FILE
>>>> +ifneq ($(CONFIG_DTB_FILE),"")
>>>>   obj-y += dtb.o
>>>>   AFLAGS-y += -DCONFIG_DTB_FILE=\"$(CONFIG_DTB_FILE)\"
>>>>   endif
>>>
>>> Right now what I have for my Arm test builds is an unquoted
>>> string in ./.config, e.g.:
>>>
>>> CONFIG_DTB_FILE:=/usr/local/arm-linux-gnueabi/vexpress-v2p-aem-v7a.dtb
>>>
>>> While I suppose you've tested that the resulting quoting is still
>>> okay, to reduce confusion perhaps the AFLAGS-y line would better
>>> be changed to
>>>
>>> AFLAGS-y += '-DCONFIG_DTB_FILE=$(CONFIG_DTB_FILE)'
>>
>> It is tested. I can change it to:
>> AFLAGS-y += -DCONFIG_DTB_FILE='$(CONFIG_DTB_FILE)'
>> as the -DCONFIG_DTB_FILE= does not need to be within quotes
> 
> May I ask why do we need to keep the AFLAGS-y? Wouldn't Kconfig define it in an header with all the other config option?
> 
It is interesting. I did not investigate it when creating a patch.
I just tested and indeed we can get rid of AFLAGS-y line.
Will do in v3
> Cheers,
> 
Cheers

