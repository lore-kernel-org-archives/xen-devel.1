Return-Path: <SRS0=FMYz=GX=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13BDEC433DB
	for <xen-devel@archiver.kernel.org>; Wed, 20 Jan 2021 17:45:13 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C19532070A
	for <xen-devel@archiver.kernel.org>; Wed, 20 Jan 2021 17:45:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C19532070A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.71683.128561 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2HXU-0005T3-F8; Wed, 20 Jan 2021 17:45:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 71683.128561; Wed, 20 Jan 2021 17:45:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2HXU-0005Sw-By; Wed, 20 Jan 2021 17:45:04 +0000
Received: by outflank-mailman (input) for mailman id 71683;
 Wed, 20 Jan 2021 17:45:02 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1l2HXS-0005So-8X
 for xen-devel@lists.xenproject.org; Wed, 20 Jan 2021 17:45:02 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1l2HXQ-0006CK-0j; Wed, 20 Jan 2021 17:45:00 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1l2HXP-00083R-Pq; Wed, 20 Jan 2021 17:44:59 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=LAx7SSSSAQUnpq4739/ye7Gfg+5Eh/PUweSsyAgJaW8=; b=Ogiqh0cFlClFwv9pnogN8Ff+ua
	PWCQdiXXg7DV2bPSlKzB3K6853LLJBgq6AhRHbIZ33M5NKOpRLC2lHL4v0welLfcmph+OZgOAoBw+
	oidKIlSn99Ml9KsE9kuoqW//RG9RBMXmD1cpPmRoSG8TdeF3vUgr9Wvwsvw81b6W312I=;
Subject: Re: [XEN PATCH] xen/arm: Relax GIC version check
To: Ian Jackson <iwj@xenproject.org>
Cc: Vladimir Murzin <vladimir.murzin@arm.com>,
 xen-devel@lists.xenproject.org, sstabellini@kernel.org,
 Volodymyr_Babchuk@epam.com
References: <20210120112644.8882-1-vladimir.murzin@arm.com>
 <5df5270d-216b-3f14-5416-bd3a12da3650@xen.org>
 <24584.19862.22683.273911@mariner.uk.xensource.com>
From: Julien Grall <julien@xen.org>
Message-ID: <e70f20e9-0aed-8ab6-c4fc-fb4e20058ea8@xen.org>
Date: Wed, 20 Jan 2021 17:44:58 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <24584.19862.22683.273911@mariner.uk.xensource.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Ian,

On 20/01/2021 15:34, Ian Jackson wrote:
> Julien Grall writes ("Re: [XEN PATCH] xen/arm: Relax GIC version check"):
>> On 20/01/2021 11:26, Vladimir Murzin wrote:
>>> Supported values are
>>>
>>> 0b0000 GIC CPU interface system registers not implemented.
>>>
>>> 0b0001 System register interface to versions 3.0 and 4.0 of the GIC
>>>          CPU interface is supported.
>>>
>>> 0b0011 System register interface to version 4.1 of the GIC CPU
>>>          interface is supported.
>>>
>>> 4.1 is still backward compatible with 4.0/3.0, moreover ARM ARM
>>> guarantees that future versions of the GIC CPU interface retain
>>> backwards compatible.
>>>
>>> Signed-off-by: Vladimir Murzin <vladimir.murzin@arm.com>
>>
>> Acked-by: Julien Grall <jgrall@amazon.com>
>>
>> @Ian: I would like your put as the RM for 4.15.
>>
>> Technically, it could be consider as a new "feature" because Xen would
>> fail to boot on such HW.
>>
>> However, I think the change is small enough and doesn't introduce risk
>> on existing supported HW.
>>
>> Therefore, I would like to merge it for 4.15. @Ian does it sounds good
>> to you?
> 
> Thank you for this analysis.  I think it does need a freeze
> exception.  But your argument is convincing, so
> 
> Release-Acked-by: Ian Jackson <ian.jackson@eu.citrix.com>

Thank you!

I have committed the patch.

Cheers,

-- 
Julien Grall

