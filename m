Return-Path: <SRS0=Rlng=F3=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54349C433E6
	for <xen-devel@archiver.kernel.org>; Wed, 23 Dec 2020 14:17:04 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1364523159
	for <xen-devel@archiver.kernel.org>; Wed, 23 Dec 2020 14:17:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1364523159
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.58396.102632 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ks4wf-0002JR-96; Wed, 23 Dec 2020 14:16:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 58396.102632; Wed, 23 Dec 2020 14:16:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ks4wf-0002JK-44; Wed, 23 Dec 2020 14:16:53 +0000
Received: by outflank-mailman (input) for mailman id 58396;
 Wed, 23 Dec 2020 14:16:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zN8f=F3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ks4wd-0002JF-KF
 for xen-devel@lists.xenproject.org; Wed, 23 Dec 2020 14:16:51 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e0743636-44b0-438c-a33b-4473ff0b9045;
 Wed, 23 Dec 2020 14:16:50 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 1E506ACF1;
 Wed, 23 Dec 2020 14:16:50 +0000 (UTC)
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
X-Inumbo-ID: e0743636-44b0-438c-a33b-4473ff0b9045
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1608733010; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MiyKuqrIYynaf/Ko/uQdrnjot5QLfeQe6VUa3oQASTg=;
	b=aiqXe01VM1M6UIhwj8vUH43dh8rNzB/BUgIfGOTFm41vCSUIvaQBlkTwxShT+LSdhi2x9m
	jr5O3PT6Mqreuh8Glcsm9ARveBL2M+1g52/pG5QGGARtINelDeLyPHdwG7Df1XFsLsHe+r
	GeDtdNOZKNW1UbmBjCvgs0EDsYmVgKw=
Subject: Re: [PATCH for-4.15 2/4] xen/iommu: x86: Free the IOMMU page-tables
 with the pgtables.lock held
To: Julien Grall <julien@xen.org>
Cc: hongyxia@amazon.co.uk, Julien Grall <jgrall@amazon.com>,
 Paul Durrant <paul@xen.org>, xen-devel@lists.xenproject.org
References: <20201222154338.9459-1-julien@xen.org>
 <20201222154338.9459-3-julien@xen.org>
 <3148db2a-ff3f-5993-dd57-7f4376f2f0ad@suse.com>
 <295b32db-ddf7-3926-b4de-b0d3b78af316@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <e90365a5-e9d7-f3ac-7682-3161d74b786d@suse.com>
Date: Wed, 23 Dec 2020 15:16:49 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <295b32db-ddf7-3926-b4de-b0d3b78af316@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 23.12.2020 15:01, Julien Grall wrote:
> Hi Jan,
> 
> On 23/12/2020 13:48, Jan Beulich wrote:
>> On 22.12.2020 16:43, Julien Grall wrote:
>>> From: Julien Grall <jgrall@amazon.com>
>>>
>>> The pgtables.lock is protecting access to the page list pgtables.list.
>>> However, iommu_free_pgtables() will not held it. I guess it was assumed
>>> that page-tables cannot be allocated while the domain is dying.
>>>
>>> Unfortunately, there is no guarantee that iommu_map() will not be
>>> called while a domain is dying (it looks like to be possible from
>>> XEN_DOMCTL_memory_mapping).
>>
>> I'd rather disallow any new allocations for a dying domain, not
>> the least because ...
> 
> Patch #4 will disallow such allocation. However...
> 
>>
>>> So it would be possible to be concurrently
>>> allocate memory and free the page-tables.
>>>
>>> Therefore, we need to held the lock when freeing the page tables.
>>
>> ... we should try to avoid holding locks across allocation /
>> freeing functions wherever possible. >
>> As to where to place a respective check - I wonder if we wouldn't
>> be better off disallowing a majority of domctl-s (and perhaps
>> other operations) on dying domains. Thoughts?
> 
> ... this is still pretty racy because you need to guarantee that 
> d->is_dying is seen by the other processors to prevent allocation.

The function freeing the page tables will need a spin_barrier()
or alike similar to evtchn_destroy(). Aiui this will eliminate
all potential for races.

Jan

