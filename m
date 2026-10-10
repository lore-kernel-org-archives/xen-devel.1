Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDB55CA6004
	for <xen-devel@archiver.kernel.org>; Sat, 10 Oct 2026 10:39:13 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1445044.1661560 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xFUTi-000330-IP; Sat, 10 Oct 2026 10:38:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1445044.1661560; Sat, 10 Oct 2026 10:38:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xFUTi-00032t-FJ; Sat, 10 Oct 2026 10:38:58 +0000
Received: by outflank-mailman (input) for mailman id 1445044;
 Sat, 10 Oct 2026 10:38:57 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1xFUTh-00032n-OO
 for xen-devel@lists.xenproject.org; Sat, 10 Oct 2026 10:38:57 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1xFUTg-006LDA-3C;
 Sat, 10 Oct 2026 10:38:56 +0000
Received: from [2a02:8012:3a1:0:94b1:aa8d:8098:b789]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1xFUTg-00Fdib-2Y;
 Sat, 10 Oct 2026 10:38:56 +0000
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
	bh=5iDG8PX/lXyZDo3LebQztPnRw6XmuJ0rnGaESwTnB1k=; b=OIOV39c4m7o9IorgKgb5ucTeBr
	Xnpzv0BvglG0/CqfTLdkeR+5g79c4AjcCO2MChDrDuJoeYm4Q4BQ+lonVNjcT41FKT4W28a55FK59
	CBCYmx7rXx9ox0++BO5psPRb7bkFThHp5fUXTYEaWswAbz4aYbfcbBGHqOBHe4jMTm2Q=;
Message-ID: <71defbe4-44a1-4b76-8d0a-bcc6ab40515f@xen.org>
Date: Sat, 10 Oct 2026 11:38:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/arm: Fix under-mapping in map_range_to_domain()
To: "Orzel, Michal" <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20261007135848.220047-1-michal.orzel@amd.com>
 <055dc887-0cfd-4274-a5f6-e5afdd576746@xen.org>
 <9a4f56d4-4c2e-4d5a-8489-9300170729a3@amd.com>
Content-Language: en-GB
From: Julien Grall <julien@xen.org>
In-Reply-To: <9a4f56d4-4c2e-4d5a-8489-9300170729a3@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Michal,

On 08/10/2026 11:50, Orzel, Michal wrote:
> 
> 
> On 07-Oct-26 22:20, Grall, Julien wrote:
>> Hi Michal,
>>
>> On 07/10/2026 15:58, Michal Orzel wrote:
>>> If the memory region to be mapped does not start at the page boundary
>>> and its end spans over the page boundary, map_range_to_domain() passes
>>> a number of pages that is short by one to map_regions_p2mt(). Domain's
>>> attempt to access memory within that page will fail. Fix it by calculating
>>> the number of pages to be mapped taking into account the start offset.
>>
>> Can you provide an example where the caller doesn't suitably align?
> Sure. Example is handle_device() being called on the hwdom DTB creation time for
> a node whose address is not page aligned i.e. /reserved-memory node or basically
> any node, given that DT spec does not mention anything about memory region
> alignment and there are existing DTs like that. With reg = <0x0 0x800 0x0
> 0x1000>, today we only map 0x0-0xfff and an access to 0x1000-0x17ff faults.

Thanks!
> 
>>
>>>
>>> Fixes: 88c10b0d6eee ("arch/arm: let map_mmio_regions() use start and count")
>>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
>>
>> The fix LGTM in the current context. However given map_range_to_domain()
>> is now used in more places (e.g. overlay), I wonder whether this is the
>> right decision to allow map_range_to_domain() with non-aligned region.
>>
>> Imagine a user say "I want to map 0x400 - 0x1000 to domain A and map
>> domain B "0x0 - 0x400". This could result to interesting behavior if the
>> user is not aware of the alignment (this would become even more
>> problematic if we decide to ever support different page granularity on Arm).
> I agree this is not great, but this is not something introduced here:
> iomem_permit_access() and the iomem_ranges rangeset already cover whole pages
> and we already map the full first page.This patch only makes the p2m mapping
> match what we already allow.

I am possibly misinterpreting what you wrote, but I disagree with such 
statement. The fact existing code may be wrong doesn't mean we should 
continue with the wrongness.

> 
> I don't think we can reject unaligned regions in map_range_to_domain()
> though, as the host DT is not under our control and hwdom would fail to
> boot on platforms with sub-page devices. I asked AI to look at the Linux boards
> for Arm and Arm64 (140 boards in total with unaligned regions) and even the
> boards we claim to support have nodes that would fail:
> - RPI4: hdmi@7ef00700, <0x7ef01f00 0x400>
> - IMX8QXP: clock-controller@5b290004, <0x5b290004 0x10000>

I am not suggesting to reject unaligned regions when mapped into the 
hardware domain. I am suggesting to reject it when we want to 
passthrough to another domain. So we don't end up in a situation two 
different devices on the same page are passthrough to two different 
domains (or between Xen and a domain).

Codewise, it would mean map_range_to_domain() would enforce the 
alignment and the caller will be left to decide what to do. We could 
also decide about the alignment base don whether this is the HW domain 
or not within the function.

Cheers,

-- 
Julien Grall


