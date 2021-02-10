Return-Path: <SRS0=BMSw=HM=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA07DC433E0
	for <xen-devel@archiver.kernel.org>; Wed, 10 Feb 2021 11:48:55 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6A4F264E3B
	for <xen-devel@archiver.kernel.org>; Wed, 10 Feb 2021 11:48:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6A4F264E3B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.83576.155850 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9nzC-0003tX-St; Wed, 10 Feb 2021 11:48:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 83576.155850; Wed, 10 Feb 2021 11:48:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9nzC-0003tQ-Pt; Wed, 10 Feb 2021 11:48:46 +0000
Received: by outflank-mailman (input) for mailman id 83576;
 Wed, 10 Feb 2021 11:48:45 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1l9nzB-0003tJ-4p
 for xen-devel@lists.xenproject.org; Wed, 10 Feb 2021 11:48:45 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1l9nz9-0008Nh-2V; Wed, 10 Feb 2021 11:48:43 +0000
Received: from [54.239.6.177] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1l9nz8-0001st-P0; Wed, 10 Feb 2021 11:48:42 +0000
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
	bh=lkR8InNLLzVeOd/06ybgP28NO53GP7CHLoDv/mWCGa8=; b=5cfP9PplEz/2R1amopc1uLT2/t
	OUBEHR+PsahKPU+IYZ3wVvRlrcmjRtX1+hPpOug49MQCUhWU1xm9nC08riBEcdeJWj5kV0iyvTYj2
	GQT2ekyhYaH0kdzEcU5aEiTt8mV4MEu+6U22on3g4f1PkSSDihXexPV9WoRfA7ujzuTM=;
Subject: Re: [for-4.15][PATCH v2 1/5] xen/x86: p2m: Don't map the special
 pages in the IOMMU page-tables
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org, hongyxia@amazon.co.uk,
 iwj@xenproject.org, Julien Grall <jgrall@amazon.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20210209152816.15792-1-julien@xen.org>
 <20210209152816.15792-2-julien@xen.org> <YCOZbNly7YCSNtHY@Air-de-Roger>
 <5bf0a2de-3f0e-8860-7bc7-f667437aa3a7@suse.com>
 <YCPE0byWKlf/uOFT@Air-de-Roger>
 <65797b03-7bd8-92e9-b6c7-e8eccde9f8ba@suse.com>
 <e1c7c616-0941-b577-5842-a51374030798@xen.org>
 <71c4150a-0b81-cdc3-b752-814f58cb5ca4@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <df760d78-a439-db0a-4b88-813b002f0a64@xen.org>
Date: Wed, 10 Feb 2021 11:48:40 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <71c4150a-0b81-cdc3-b752-814f58cb5ca4@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit



On 10/02/2021 11:45, Jan Beulich wrote:
> On 10.02.2021 12:40, Julien Grall wrote:
>> On 10/02/2021 11:38, Jan Beulich wrote:
>>> On 10.02.2021 12:34, Roger Pau Monné wrote:
>>>> On Wed, Feb 10, 2021 at 12:10:09PM +0100, Jan Beulich wrote:
>>>>> On 10.02.2021 09:29, Roger Pau Monné wrote:
>>>>>> I get the feeling this is just papering over an existing issue instead
>>>>>> of actually fixing it: IOMMU page tables need to be properly freed
>>>>>> during early failure.
>>>>>
>>>>> I take a different perspective: IOMMU page tables shouldn't
>>>>> get created (yet) at all in the course of
>>>>> XEN_DOMCTL_createdomain - this op is supposed to produce an
>>>>> empty container for a VM.
>>>>
>>>> The same would apply for CPU page-tables then, yet they seem to be
>>>> created and populating them (ie: adding the lapic access page) doesn't
>>>> leak such entries, which points at an asymmetry. Either we setup both
>>>> tables and handle freeing them properly, or we set none of them.
>>>
>>> Where would CPU page tables get created from at this early stage?
>>
>> When mapping the APIC page in the P2M. I don't think you can get away
>> with removing it completely.
> 
> It doesn't need putting in the p2m this early. It would be quite
> fine to defer this until e.g. the first vCPU gets created.

It feels wrong to me to setup a per-domain mapping when initializing the 
first vCPU.

But, I was under the impression that there is plan to remove 
XEN_DOMCTL_max_vcpus. So it would only buy just a bit of time...

Cheers,

-- 
Julien Grall

