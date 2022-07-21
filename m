Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA4DEC433EF
	for <xen-devel@archiver.kernel.org>; Thu, 21 Jul 2022 10:10:21 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.372613.604431 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oET8C-0001Uz-VF; Thu, 21 Jul 2022 10:10:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 372613.604431; Thu, 21 Jul 2022 10:10:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oET8C-0001Us-SU; Thu, 21 Jul 2022 10:10:08 +0000
Received: by outflank-mailman (input) for mailman id 372613;
 Thu, 21 Jul 2022 10:10:07 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oET8B-0001Uk-Ow
 for xen-devel@lists.xenproject.org; Thu, 21 Jul 2022 10:10:07 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oET86-0007KB-93; Thu, 21 Jul 2022 10:10:02 +0000
Received: from [54.239.6.185] (helo=[10.85.97.231])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oET86-0007ld-18; Thu, 21 Jul 2022 10:10:02 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=Pco/YHE1BsU0Rcgzd2h0YBe6QK4X1/OMDVePGOHHDYw=; b=tw6SXF0C4GnZ/RtDy4TiwvOczm
	vqLMruZ7vgGX0yDiSUcPADvQcw/+Q1H6jcTpynkDM/ioLnm64SaSNvqSQi+kW9cwE745CnsXSNkd2
	/GvwRNYE9Iswo35axGhFchjfUYKRu0SjnqjWt+Y+RDMygLrptdxUIWQVmjzA88q7+XZ0=;
Message-ID: <3e28e8c4-9c80-59e3-6c8f-e0f357d9ae88@xen.org>
Date: Thu, 21 Jul 2022 11:09:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.11.0
Subject: Re: [PATCH v2 4/5] xen/arm: mm: Move domain_{,un}map_* helpers in a
 separate file
To: Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <jgrall@amazon.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220720184459.51582-1-julien@xen.org>
 <20220720184459.51582-5-julien@xen.org>
 <0c9a6602-8b3b-7cc0-981f-3aa67794b68a@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <0c9a6602-8b3b-7cc0-981f-3aa67794b68a@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 21/07/2022 11:07, Jan Beulich wrote:
> On 20.07.2022 20:44, Julien Grall wrote:
>> --- a/xen/common/Kconfig
>> +++ b/xen/common/Kconfig
>> @@ -11,6 +11,9 @@ config COMPAT
>>   config CORE_PARKING
>>   	bool
>>   
>> +config DOMAIN_PAGE
>> +	bool
>> +
>>   config GRANT_TABLE
>>   	bool "Grant table support" if EXPERT
>>   	default y
> 
> Is this an unintended leftover? I can't spot any use in this patch.

This was a mistake when splitting/renaming the config. I will drop it.

Cheers,

-- 
Julien Grall

