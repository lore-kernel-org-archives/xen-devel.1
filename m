Return-Path: <SRS0=VkMt=LS=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55B7EC48BDF
	for <xen-devel@archiver.kernel.org>; Thu, 24 Jun 2021 07:58:18 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E3D52611AD
	for <xen-devel@archiver.kernel.org>; Thu, 24 Jun 2021 07:58:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E3D52611AD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.146451.269474 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lwKFW-0004ot-Sj; Thu, 24 Jun 2021 07:58:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 146451.269474; Thu, 24 Jun 2021 07:58:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lwKFW-0004om-PU; Thu, 24 Jun 2021 07:58:10 +0000
Received: by outflank-mailman (input) for mailman id 146451;
 Thu, 24 Jun 2021 07:58:09 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lwKFV-0004og-7G
 for xen-devel@lists.xenproject.org; Thu, 24 Jun 2021 07:58:09 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lwKFT-0002uJ-J2; Thu, 24 Jun 2021 07:58:07 +0000
Received: from [54.239.6.182] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lwKFT-0002C8-At; Thu, 24 Jun 2021 07:58:07 +0000
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
	bh=wNZZSzSIQ08whR5sxQWNM/FiFK2Bi63S0/15RY4mB6k=; b=ORQfUrC6SkEj/wzV3SNMx8BAWa
	b1xUzlmmk49CPqBrBRnwVZlxN+2vg+Wxrlrej1bdq6dnZwzrDlQ9Z1GEZI9n/XjS2XKXAFA8zLG+t
	wtzpKW1qJpqnmP+ooCUdZOdYPxyAKW/vPq6ALkurKLvDuiVQQ3uc+G/Ns76fUTREwz8o=;
Subject: Re: [PATCH 07/10] tools/xenstored: delay_request: don't assume
 conn->in == in
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: raphning@amazon.co.uk, doebel@amazon.de, Julien Grall
 <jgrall@amazon.com>, Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
References: <20210616144324.31652-1-julien@xen.org>
 <20210616144324.31652-8-julien@xen.org>
 <30348a8d-aef4-dee4-50ee-f6613da27952@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <501cc477-08e2-174d-2e7e-f6441f943007@xen.org>
Date: Thu, 24 Jun 2021 09:58:04 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <30348a8d-aef4-dee4-50ee-f6613da27952@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Juergen,

On 24/06/2021 09:44, Juergen Gross wrote:
> On 16.06.21 16:43, Julien Grall wrote:
>> From: Julien Grall <jgrall@amazon.com>
>>
>> delay_request() is currently assuming that the request delayed is
>> always conn->in. This is currently correct, but it is a call for
>> a latent bug as the function allows the caller to specify any request.
>>
>> To prevent any future surprise, check if the request delayed is the
>> current one.
>>
>> Fixes: c5ca1404b4 ("tools/xenstore: add support for delaying execution 
>> of a xenstore request")
> 
> Is the Fixes: tag really wanted in this patch? Currently there is
> nothing wrong without this patch. So a backport will be needed only if
> e.g. this series will be backported. >
> I'm fine either way, but I think this should be Ian's call.

We don't usually backport to stable for tech preview (Xenstored 
Live-Update is one).

In this case, I mainly added it because it makes easier for a developper 
to figure out where the bugs comes from and downstream may want to 
ingest it. This doesn't mean I request an official backport.

I could just mention in the commit message if you prefer.

Cheers,

-- 
Julien Grall

