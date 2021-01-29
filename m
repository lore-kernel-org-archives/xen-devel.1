Return-Path: <SRS0=v1SG=HA=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BC62C433E0
	for <xen-devel@archiver.kernel.org>; Fri, 29 Jan 2021 11:26:46 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1A7EF64FA1
	for <xen-devel@archiver.kernel.org>; Fri, 29 Jan 2021 11:26:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1A7EF64FA1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.78032.141752 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5RvB-0005xf-7J; Fri, 29 Jan 2021 11:26:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 78032.141752; Fri, 29 Jan 2021 11:26:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5RvB-0005xY-4J; Fri, 29 Jan 2021 11:26:37 +0000
Received: by outflank-mailman (input) for mailman id 78032;
 Fri, 29 Jan 2021 11:26:36 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1l5RvA-0005xT-5R
 for xen-devel@lists.xenproject.org; Fri, 29 Jan 2021 11:26:36 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1l5Rv9-0004Md-5U; Fri, 29 Jan 2021 11:26:35 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1l5Rv8-00075o-VB; Fri, 29 Jan 2021 11:26:35 +0000
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
	bh=Pnj6dQlguB8VyEkhgU1EiokyrcBPhQwcdPkDPmbVirI=; b=tc7/pV1DcXpuqoD43e3oEJAk9H
	1KObH3aJIF5m5L+1zegPfXXeedhclSlk8d7olaXW5S1o9ZMJjIpj7NJnnu9BarnWnPOSjQ+zl9Vsp
	Uek5AOrNIE7AlSIBzr307T1DNBwPzZunIJDikdVOR/9M5OaMieCXBLVkcXNPoLN6+QpE=;
Subject: Re: [PATCH V6 24/24] xen/ioreq: Make the IOREQ feature selectable on
 Arm
To: Jan Beulich <jbeulich@suse.com>, Oleksandr <olekstysh@gmail.com>
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <1611884932-1851-1-git-send-email-olekstysh@gmail.com>
 <1611884932-1851-25-git-send-email-olekstysh@gmail.com>
 <2d98fd45-a88a-a198-a42d-393a713e1d54@xen.org>
 <433f8d5c-f66f-874e-e08e-83427f9f2a29@suse.com>
 <3fb55faa-8d05-cb8f-f567-4e099347b3e6@gmail.com>
 <e9e9eabc-3925-c402-b7e2-1412b5b6ca8a@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <63d005ce-0993-e604-7b06-fc6603995152@xen.org>
Date: Fri, 29 Jan 2021 11:26:32 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <e9e9eabc-3925-c402-b7e2-1412b5b6ca8a@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 29/01/2021 11:25, Jan Beulich wrote:
> On 29.01.2021 12:19, Oleksandr wrote:
>>
>> On 29.01.21 12:06, Jan Beulich wrote:
>>
>> Hi Jan, Julien
>>
>>> On 29.01.2021 10:55, Julien Grall wrote:
>>>>> --- a/xen/common/Kconfig
>>>>> +++ b/xen/common/Kconfig
>>>>> @@ -137,7 +137,13 @@ config HYPFS_CONFIG
>>>>>     	  want to hide the .config contents from dom0.
>>>>>     
>>>>>     config IOREQ_SERVER
>>>>> -	bool
>>>>> +	bool "IOREQ support (EXPERT)" if EXPERT && !X86
>>>>> +	default X86
>>>>> +	depends on HVM
>>>> AFAICT, CONFIG_HVM will already select CONFIG_IOREQ_SERVER. So are the
>>>> two lines necessary?
>>> I agree they may not be necessary, but as long as they don't
>>> cause any harm I thought maybe they serve a documentation
>>> purpose.
>> 1. Agree that it should be "If unsure, say N."
> 
> Faod this could be taken care of while committing.
> 
>> 2. Agree that two lines are not strictly needed (just rechecked).
>> 3. Agree that two lines indicates the *real* state:
>> - Although we managed to remove almost all (all?) HVM-ism in IOREQ
>> common code, this feature depends on HVM anyway
>> - And it is should enabled by default on X86, and disabled on Arm
>>
>> So what we should do with them (keep or remove)?
> 
> I'd be fine either way, with just a slight preference to keeping.
> Julien?

I find a bit strange, but I am happy to keep it.

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

