Return-Path: <SRS0=TguT=NK=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 444E0C4338F
	for <xen-devel@archiver.kernel.org>; Thu, 19 Aug 2021 12:41:14 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0044260EB5
	for <xen-devel@archiver.kernel.org>; Thu, 19 Aug 2021 12:41:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0044260EB5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.168735.308070 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGhLv-0002eg-A7; Thu, 19 Aug 2021 12:40:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 168735.308070; Thu, 19 Aug 2021 12:40:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGhLv-0002eZ-76; Thu, 19 Aug 2021 12:40:59 +0000
Received: by outflank-mailman (input) for mailman id 168735;
 Thu, 19 Aug 2021 12:40:58 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mGhLu-0002eT-R8
 for xen-devel@lists.xenproject.org; Thu, 19 Aug 2021 12:40:58 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mGhLu-0007SZ-Fo; Thu, 19 Aug 2021 12:40:58 +0000
Received: from [54.239.6.188] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mGhLu-0003sE-9j; Thu, 19 Aug 2021 12:40:58 +0000
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
	bh=9yllFMNSbSrB6Ragoc8ZP1+wXjW96S0jiseqLCfNAfI=; b=ScA+UnSWpWgalqArTPESqCdba8
	WJ06lOrsMDWLjfpgvugDwUfxLjy1Pd+Z5lm2j/4WMOMIwNt9L0I29OgYb/IuRvuQJHdaDLhWV74rY
	efu93O8K0Xcsc/HhEltp65Wtk4tpw9PZodznnN67VR88AsNy5Fjl7lCkk6O0elPJqn54=;
Subject: Re: [PATCH v1 13/14] xen/arm: Fixed error when PCI device is assigned
 to guest
To: Jan Beulich <jbeulich@suse.com>, Rahul Singh <rahul.singh@arm.com>
Cc: bertrand.marquis@arm.com, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <cover.1629366665.git.rahul.singh@arm.com>
 <917720808121c3098690b51d55f2d60118ec6408.1629366665.git.rahul.singh@arm.com>
 <f57bc8cf-6fcf-b9ef-cdd5-1bf5ad4701a7@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <2e2d3618-3bc0-c2b9-3270-aa4542e52fe0@xen.org>
Date: Thu, 19 Aug 2021 13:40:56 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <f57bc8cf-6fcf-b9ef-cdd5-1bf5ad4701a7@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi,

On 19/08/2021 13:12, Jan Beulich wrote:
> On 19.08.2021 14:02, Rahul Singh wrote:
>> --- a/xen/arch/arm/domctl.c
>> +++ b/xen/arch/arm/domctl.c
>> @@ -173,6 +173,8 @@ long arch_do_domctl(struct xen_domctl *domctl, struct domain *d,
>>   
>>           return rc;
>>       }
>> +    case XEN_DOMCTL_ioport_permission:
>> +        return 0;
> 
> I don't think returning success for something that doesn't make
> much sense in the first place (there aren't truly "I/O ports" on
> Arm afaik) is a good idea.

They are memory mapped. IIRC, there is a region that is reserved to fake 
them (for PCI cards that still using them).

> Instead I think the tool stack should
> avoid making arch-specific calls in an arch-independent way.

+1. The current approach means that it will be impossible to implement 
those sub operations without breaking Xen if we ever needs it.

Cheers,

-- 
Julien Grall

