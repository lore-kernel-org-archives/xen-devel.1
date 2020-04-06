Return-Path: <SRS0=VfOS=5W=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36103C2BA2B
	for <xen-devel@archiver.kernel.org>; Mon,  6 Apr 2020 10:55:30 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EF6A8206F8
	for <xen-devel@archiver.kernel.org>; Mon,  6 Apr 2020 10:55:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=xen.org header.i=@xen.org header.b="UI6HF78o"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EF6A8206F8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jLPPO-0008RD-Fq; Mon, 06 Apr 2020 10:55:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=glNc=5W=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jLPPN-0008R8-Dl
 for xen-devel@lists.xenproject.org; Mon, 06 Apr 2020 10:55:13 +0000
X-Inumbo-ID: 1711cd42-77f5-11ea-bfe0-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1711cd42-77f5-11ea-bfe0-12813bfff9fa;
 Mon, 06 Apr 2020 10:55:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ALOb53CJgR/xUQbjndxjgrmwWEL/vJ2c+U6npk60U74=; b=UI6HF78oMzORvpRVV4HJbyxkMX
 cuytyXMW1HnU6taPwA7LwIaXDj2ujqPqrRzl1e/kYTWeog1ZUhl6z6A5ntV+VZtloa3tiD91WF8pZ
 nFGTTTe3ZEfJ+s0i41DHHr6r+Fx7ntaMJcHlxJ3k/H4Z5HzRuqWIs4l8PDq57lLbpre8=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jLPPM-0007ZW-6r; Mon, 06 Apr 2020 10:55:12 +0000
Received: from 54-240-197-231.amazon.com ([54.240.197.231]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jLPPM-0004SS-0X; Mon, 06 Apr 2020 10:55:12 +0000
Subject: Re: [PATCH v2] tools/libxl: make default of max event channels
 dependant on vcpus
To: Ian Jackson <ian.jackson@citrix.com>, =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?=
 <jgross@suse.com>
References: <20200406082704.13994-1-jgross@suse.com>
 <afc7e988-3b51-bbee-cba8-af30a7605dc4@xen.org>
 <d1b095db-064e-bccf-b55d-d85fecb3045a@suse.com>
 <24203.2251.628483.557280@mariner.uk.xensource.com>
From: Julien Grall <julien@xen.org>
Message-ID: <fd09220a-7470-4679-ce16-f4553579171b@xen.org>
Date: Mon, 6 Apr 2020 11:55:10 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <24203.2251.628483.557280@mariner.uk.xensource.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Anthony Perard <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi Ian,

On 06/04/2020 11:47, Ian Jackson wrote:
> Jürgen Groß writes ("Re: [PATCH v2] tools/libxl: make default of max event channels dependant on vcpus"):
>> On 06.04.20 11:24, Julien Grall wrote:
>>> Large guests on which arch? Which type of guests?
>>
>> I'm pretty sure this applies to x86 only. I'm not aware of event
>> channels being used on ARM for IPIs.
> 
> Should this be arch-dependent then ?  It seems like the figure is just
> a heuristic anyway, and ...
> 
>> The resulting number would be larger than today only for guests with
>> more than 96 vcpus. So I don't think the additional amount of memory
>> is really that problematic.
> 
> Julien, are there likely to be any ARM guests now which have anywhere
> near that number of vcpus ?  If not do we know now what such guests
> are likely to be like ?

We are meant to support up to 128 vCPUs. But our implementation can 
support up to 4096 vCPUs on vGICv3.

> 
> If this is all hypothetical on ARM it would seem silly to make this
> arch-specific for the benefit of ARM given that the ARM implementation
> would be entirely guesswork.  Maybe we should postpone that
> specialisation until we know better what the ARM function should be
> like for these large numbers of vcpus.

There are no correlation between event channels and vCPUs. The number of 
event channels only depends on the number of frontend you have in your 
guest. So...

> If ARM folks want to have a different formula for the default then
> that is of course fine but I wonder whether this might do ARMk more
> harm than good in this case.

... 1023 event channels is going to be plenty enough for most of the use 
cases.

Cheers,

-- 
Julien Grall

