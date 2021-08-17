Return-Path: <SRS0=kHjl=NI=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86FACC4338F
	for <xen-devel@archiver.kernel.org>; Tue, 17 Aug 2021 17:54:50 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4589D60FE6
	for <xen-devel@archiver.kernel.org>; Tue, 17 Aug 2021 17:54:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4589D60FE6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.167998.306722 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mG3I5-0000Qb-Ul; Tue, 17 Aug 2021 17:54:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 167998.306722; Tue, 17 Aug 2021 17:54:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mG3I5-0000QU-RX; Tue, 17 Aug 2021 17:54:21 +0000
Received: by outflank-mailman (input) for mailman id 167998;
 Tue, 17 Aug 2021 17:54:21 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mG3I5-0000QO-CF
 for xen-devel@lists.xenproject.org; Tue, 17 Aug 2021 17:54:21 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mG3Hj-0003BX-D6; Tue, 17 Aug 2021 17:53:59 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mG3Hj-0005gs-5I; Tue, 17 Aug 2021 17:53:59 +0000
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
	bh=Dh4zd4c22B793bOt16gtWq0USHCar4NDC3swpTkm7Yg=; b=y5v+Rh3C2rOotAhQACMk8Piz36
	rIEKrFbvl+nCYKUV1JGuPCWI7IOj/vTuNWb1XBrGyOtkR/vxgmFKIJPGuTsrh7Fcs0yEkpyuwCwj1
	Cd3bUA2yinXG15/0T5aPXlFhR9HRuehDk7B1MwlC3BpmiHYqGwvdO/N4incD0cxBWwlk=;
Subject: Re: [RFC PATCH] xen/memory: Introduce a hypercall to provide
 unallocated space
To: Oleksandr <olekstysh@gmail.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>
References: <1627489110-25633-1-git-send-email-olekstysh@gmail.com>
 <80fafc01-f063-d6e5-1c08-7ad64550310c@citrix.com>
 <e8db3021-78a5-e040-a70b-62ca5b500149@xen.org>
 <4de5ed21-379e-b618-44c8-924d88b1a519@citrix.com>
 <bbc7f597-5249-20a0-cac9-13f594268299@xen.org>
 <6a633f4e-13e0-4a2b-cf6e-35ef90ae977c@gmail.com>
 <alpine.DEB.2.21.2107301630510.10122@sstabellini-ThinkPad-T480s>
 <f6b2e6c6-bf58-960f-4a09-f05ebcf1f566@gmail.com>
 <5643d414-0b76-74a4-2c37-c7a99338d547@gmail.com>
 <c83378af-4d3b-9256-0e0d-f88c43c6de2f@xen.org>
 <alpine.DEB.2.21.2108051720210.18743@sstabellini-ThinkPad-T480s>
 <6596ad08-8398-64dd-ef62-cd7bc6f7333e@gmail.com>
 <bc576a23-d107-c67d-8dca-62691e5eea1a@xen.org>
 <1d0ea55d-2e5a-daa7-9c60-c7a1c4b48fa1@gmail.com>
 <6947db7a-44d3-eb5f-c93e-1c1b88c62f29@xen.org>
 <736c38b3-0dfa-ccbf-6a6a-6da871f8aca0@gmail.com>
 <4f5be55d-062b-06d2-1e41-bac3ade0cc3a@xen.org>
 <f046eaba-d073-7fbb-4f4d-405f34d8ee9c@gmail.com>
From: Julien Grall <julien@xen.org>
Message-ID: <e136dc8e-de64-56fa-8353-300b947db3aa@xen.org>
Date: Tue, 17 Aug 2021 18:53:56 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <f046eaba-d073-7fbb-4f4d-405f34d8ee9c@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Oleksandr,

On 10/08/2021 18:03, Oleksandr wrote:
> 
> On 10.08.21 19:28, Julien Grall wrote:
> 
> Hi Julien.
> 
>>
>>
>> On 09/08/2021 22:18, Oleksandr wrote:
>>>
>>> On 09.08.21 23:45, Julien Grall wrote:
>>>
>>>
>>> Hi Julien
>>
>>
>> Hi Oleksandr,
>>
>>>> On 09/08/2021 19:24, Oleksandr wrote:
>>>>>
>>>>> On 09.08.21 18:42, Julien Grall wrote:
>>>>> 1. If IOMMU is enabled for Dom0 -> provide holes found in Host DT 
>>>>> as safe ranges
>>>>>
>>>>> I would take into the account holes >= 1MB.
>>>>
>>>> May I ask why 1MB?
>>>
>>> Nothing special, just thinking to not bother with small regions which 
>>> would not be too useful overall, but could bloat resulting reg property.
>>>
>>> Anyway, I would be ok with any sizes.
>>
>> I was more interesting with the reasoning behind your choice rather 
>> than saying we want more.
>>
>> I agree that we may want to skip smaller region. I am guess that an 
>> high number of small regions will also increase the bookeeping in Linux.
>>
>> But I would probably suggest to align the safe region to a 2MB 
>> (superpage for 4KB page granularity) just because the backend (or even 
>> Xen) may be able to do some optimization there.
> 
> OK, agree regarding the alignment. But, what about the size? I assume, 
> it should be a multiple of 2MB.

I would say yes. In the documentation for the guest, I would just write 
"64KB" to give us some flexibility to reduce the alignment/size if we 
encounter platform where we can meet those limits (hopefully there is 
none...).

Cheers,

-- 
Julien Grall

