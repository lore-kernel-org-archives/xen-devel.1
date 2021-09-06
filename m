Return-Path: <SRS0=XIDt=N4=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55F59C433EF
	for <xen-devel@archiver.kernel.org>; Mon,  6 Sep 2021 13:13:46 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0AC3360F14
	for <xen-devel@archiver.kernel.org>; Mon,  6 Sep 2021 13:13:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0AC3360F14
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.179860.326276 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNERF-00020H-B0; Mon, 06 Sep 2021 13:13:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 179860.326276; Mon, 06 Sep 2021 13:13:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNERF-00020A-7r; Mon, 06 Sep 2021 13:13:29 +0000
Received: by outflank-mailman (input) for mailman id 179860;
 Mon, 06 Sep 2021 13:13:28 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mNERE-000204-A0
 for xen-devel@lists.xenproject.org; Mon, 06 Sep 2021 13:13:28 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mNERB-0004RC-I9; Mon, 06 Sep 2021 13:13:25 +0000
Received: from 54-240-197-236.amazon.com ([54.240.197.236]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mNERB-0003Lx-Bb; Mon, 06 Sep 2021 13:13:25 +0000
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
	bh=Y12aQVs2B09axgUlZvQNFaktwJQZPR6LaeC5gO9J3Zo=; b=Wr4XyjbkMShdiCiWcLXwSdIOCH
	fkgKPuhnWJ469AQgsKrVQoZLuuJsY8xSdHNVQjRRoa8YPveSdetCTV2E4r0Qquh/8+xDMGX6uM96E
	VIgA/NosXJ8i1tZUDtjM7oZCblYewEvXrquYxVobPSOYHkQF9HcvSmV2N22moyt/3sIA=;
Subject: Re: [PATCH 1/9] gnttab: defer allocation of maptrack frames table
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <eb7bbd51-1da3-9a7f-27c7-49dea1a41488@suse.com>
 <062bcbd3-420e-e1c0-3aa0-0dfb229e6ae9@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <7b8fba1a-767e-87f8-d0eb-5af5e5427bb4@xen.org>
Date: Mon, 6 Sep 2021 14:13:23 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <062bcbd3-420e-e1c0-3aa0-0dfb229e6ae9@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Jan,

On 26/08/2021 11:09, Jan Beulich wrote:
> By default all guests are permitted to have up to 1024 maptrack frames,
> which on 64-bit means an 8k frame table. Yet except for driver domains
> guests normally don't make use of grant mappings. Defer allocating the
> table until a map track handle is first requested.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> I continue to be unconvinced that it is a good idea to allow all DomU-s
> 1024 maptrack frames by default. While I'm still of the opinion that a
> hypervisor enforced upper bound is okay, I question this upper bound
> also getting used as the default value - this is perhaps okay for Dom0,
> but not elsewhere.

I agree here. I think having a per-domain limit maptrack is a good idea.

> 
> --- a/xen/common/grant_table.c
> +++ b/xen/common/grant_table.c
> @@ -633,6 +633,34 @@ get_maptrack_handle(
>       if ( likely(handle != INVALID_MAPTRACK_HANDLE) )
>           return handle;
>   
> +    if ( unlikely(!read_atomic(&lgt->maptrack)) )
> +    {
> +        struct grant_mapping **maptrack = NULL;
> +
> +        if ( lgt->max_maptrack_frames )
> +            maptrack = vzalloc(lgt->max_maptrack_frames * sizeof(*maptrack));

While I understand that allocating with a lock is bad idea, I don't like 
the fact that multiple vCPUs racing each other would result to 
temporarily allocate more memory.

If moving the call within the lock is not a solution, would using a loop 
with a cmpxchg() a solution to block the other vCPU?

Cheers,

-- 
Julien Grall

