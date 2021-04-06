Return-Path: <SRS0=uqgo=JD=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A5A4C433B4
	for <xen-devel@archiver.kernel.org>; Tue,  6 Apr 2021 14:13:32 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C02D1613A0
	for <xen-devel@archiver.kernel.org>; Tue,  6 Apr 2021 14:13:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C02D1613A0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.106013.202709 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lTmSE-0006e6-EJ; Tue, 06 Apr 2021 14:13:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 106013.202709; Tue, 06 Apr 2021 14:13:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lTmSE-0006dz-AI; Tue, 06 Apr 2021 14:13:18 +0000
Received: by outflank-mailman (input) for mailman id 106013;
 Tue, 06 Apr 2021 14:13:17 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lTmSC-0006du-WF
 for xen-devel@lists.xenproject.org; Tue, 06 Apr 2021 14:13:17 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lTmSB-0008FW-Nk; Tue, 06 Apr 2021 14:13:15 +0000
Received: from 54-240-197-234.amazon.com ([54.240.197.234]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lTmSB-0001Lc-Hb; Tue, 06 Apr 2021 14:13:15 +0000
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
	bh=l8PCfi6fqMJXelVkTU2iS2F2qt3YW25MQ+EbVh6r1Z8=; b=OsZGWJtk4UnAABCqX/r18+HqZH
	/pNLFWOkyuC5HYMSE0+kfLgg8GzGovttmvzbxFWR6kk/LepfEw3uVCb4PNi5GkJy+dd1GeVIDzo4x
	gJvXfh0wG5tQukE1Z1FP52hH4ztMPAT+HlSdILWyr7auwjVfVB7KNWFTd08ZlJ16v2mo=;
Subject: Re: [PATCH 0/2] xen/arm: Couple of bug fixes when decompressing
 kernels
To: Jan Beulich <jbeulich@suse.com>
Cc: bertrand.marquis@arm.com, Julien Grall <jgrall@amazon.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20210402152105.29387-1-julien@xen.org>
 <7a65f71b-e5a6-22aa-d360-4045b266229e@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <2d1dcac4-5e6d-b82c-0164-1471b6fc9a8c@xen.org>
Date: Tue, 6 Apr 2021 15:13:13 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <7a65f71b-e5a6-22aa-d360-4045b266229e@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Jan,

On 06/04/2021 08:45, Jan Beulich wrote:
> On 02.04.2021 17:21, Julien Grall wrote:
>> From: Julien Grall <jgrall@amazon.com>
>>
>> Hi all,
>>
>> The main goal of this series is to address the bug report [1]. It is not
>> possible
> 
> ...?

Urgh, I forgot to add the rest of the sentence :/. I was meant to say 
that it is not possible to decompress multiple kernels (doesn't need to 
be the same) today.

> 
>> While testing the series, I also noticed that it is not possible to
>> re-use the same compressed kernel for multiple domains as the module
>> will be overwritten during the first decompression.
>>
>> I am still a bit undecided how to fix it. We can either create a new
>> module for the uncompressed kernel and link with the compressed kernel.
>> Or we could decompress everytime.
>>
>> One inconvenience to kernel to only decompress once is we have to keep
>> it until all the domains have booted. This may means a lot of memory to be
>> wasted just for keeping the uncompressed kernel (one my setup, it takes
>> ~3 times more space).
>>
>> Any opinions on how to approach it?
> 
> Well, it's not "until all the domains have booted", but until all the
> domains have had their kernel image placed in the designated piece of
> memory. So while for the time being multiple decompression may indeed
> be a reasonable approach, longer term one could populate all the
> domains' memory in two steps - first just the kernel space for all of
> them, then load the kernel(s), then populate the rest of the memory.

Right, I am not sure this brings us to a better position. We would want 
to use superpage mapping for the guest memory as much as possible for 
performance reason.

So we may end up to populate the full memory of each guests. Therefore, 
I am not sure the split is that worth it.

Cheers,

-- 
Julien Grall

