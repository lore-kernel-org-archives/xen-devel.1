Return-Path: <SRS0=EOea=HE=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F260DC433DB
	for <xen-devel@archiver.kernel.org>; Tue,  2 Feb 2021 18:44:14 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9B9AF64E36
	for <xen-devel@archiver.kernel.org>; Tue,  2 Feb 2021 18:44:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9B9AF64E36
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.80696.147799 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l70ee-0007Kc-06; Tue, 02 Feb 2021 18:44:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 80696.147799; Tue, 02 Feb 2021 18:43:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l70ed-0007KV-Sn; Tue, 02 Feb 2021 18:43:59 +0000
Received: by outflank-mailman (input) for mailman id 80696;
 Tue, 02 Feb 2021 18:43:58 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1l70ec-0007KQ-M0
 for xen-devel@lists.xenproject.org; Tue, 02 Feb 2021 18:43:58 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1l70eb-0003TV-AX; Tue, 02 Feb 2021 18:43:57 +0000
Received: from 54-240-197-239.amazon.com ([54.240.197.239]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1l70eb-00015b-4V; Tue, 02 Feb 2021 18:43:57 +0000
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
	bh=kRrhMXrhYGAVHBtrbarY6P89Mz2xJnk+0P1iItuTPZw=; b=eCMJW1wOdeHzNvtr138Ipygpeb
	gx+WhBUUkaLvOQ0uHQ/uLteo+GwZikaSgKkpEBhwMs1bwH/3yVdPX2QWgSqgb6+EoB89LwR1x3wid
	SJ6z83ypWRvzaeyjn8G84Kc5AdatxR4nmxo/AwO+p20Owazp3JrViKntwCZdThP975RM=;
Subject: Re: [PATCH v3 0/3] Generic SMMU Bindings
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Rahul Singh <Rahul.Singh@arm.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 "Volodymyr_Babchuk@epam.com" <Volodymyr_Babchuk@epam.com>,
 "brian.woods@xilinx.com" <brian.woods@xilinx.com>
References: <alpine.DEB.2.21.2101261435550.2568@sstabellini-ThinkPad-T480s>
 <C094E054-885F-4363-ABF3-E0FB4DDD7A2A@arm.com>
 <alpine.DEB.2.21.2102020937480.29047@sstabellini-ThinkPad-T480s>
 <7ddc6e1b-41ce-37ae-f86e-39893f53a0ec@xen.org>
 <alpine.DEB.2.21.2102021024100.29047@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien@xen.org>
Message-ID: <cd8dc216-987f-4dd8-88ab-4ee455456f81@xen.org>
Date: Tue, 2 Feb 2021 18:43:55 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2102021024100.29047@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Stefano,

On 02/02/2021 18:27, Stefano Stabellini wrote:
> On Tue, 2 Feb 2021, Julien Grall wrote:
>> On 02/02/2021 17:44, Stefano Stabellini wrote:
>>> On Tue, 2 Feb 2021, Rahul Singh wrote:
>>>> Hello Stefano,
>>>>
>>>>> On 26 Jan 2021, at 10:58 pm, Stefano Stabellini <sstabellini@kernel.org>
>>>>> wrote:
>>>>>
>>>>> Hi all,
>>>>>
>>>>> This series introduces support for the generic SMMU bindings to
>>>>> xen/drivers/passthrough/arm/smmu.c.
>>>>>
>>>>> The last version of the series was
>>>>> https://marc.info/?l=xen-devel&m=159539053406643
>>>>>
>>>>> I realize that it is late for 4.15 -- I think it is OK if this series
>>>>> goes in afterwards.
>>>>
>>>> I tested the series on the Juno board it is woking fine.
>>>> I found one issue in SMMU driver while testing this series that is not
>>>> related to this series but already existing issue in SMMU driver.
>>>>
>>>> If there are more than one device behind SMMU and they share the same
>>>> Stream-Id, SMMU driver is creating the new SMR entry without checking the
>>>> already configured SMR entry if SMR entry correspond to stream-id is
>>>> already configured.  Because of this I observed the stream match conflicts
>>>> on Juno board.
>>>>
>>>> (XEN) smmu: /iommu@7fb30000: Unexpected global fault, this could be
>>>> serious
>>>> (XEN) smmu: /iommu@7fb30000: 	GFSR 0x00000004, GFSYNR0 0x00000006,
>>>> GFSYNR1 0x00000000, GFSYNR2 0x00000000
>>>>
>>>>
>>>> Below two patches is required to be ported to Xen to fix the issue from
>>>> Linux driver.
>>>>
>>>> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/drivers/iommu/arm-smmu.c?h=linux-5.8.y&id=1f3d5ca43019bff1105838712d55be087d93c0da
>>>> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/drivers/iommu/arm-smmu.c?h=linux-5.8.y&id=21174240e4f4439bb8ed6c116cdbdc03eba2126e
>>>
>>>
>>> Good catch and thanks for the pointers! Do you have any interest in
>>> backporting these two patches or should I put them on my TODO list?
>>>
>>> Unrelated to who does the job, we should discuss if it makes sense to
>>> try to fix the bug for 4.15. The patches don't seem trivial so I am
>>> tempted to say that it might be best to leave the bug unfixed for 4.15
>>> and fix it later.
>>
>> SMMU support on Juno is not that interesting because IIRC the stream-ID is the
>> same for all the devices. So it is all or nothing passthrough.
>>
>> For other HW, this may be a useful feature. Yet we would need a way to group
>> the devices for passthrough.
>>
>> In this context, I would consider it more a feature than a bug because the
>> SMMU driver never remotely work on such HW.
> 
> I see. To be honest I wasn't thinking of Juno (I wasn't aware of its
> limitations) but of potential genuine situations where stream-ids are
> the same for 2 devices. I know it can happen with PCI devices for
> instance, although I am aware we don't have PCI passthrough yet. I don't
> know if it is possible for it to happen with non-PCI devices but I
> wouldn't be surprised if it can.

I merely pointed out Juno because this is where the discussion started. 
Although, my conclusion wasn't solely based on this system nor PCI devices.

It was based on the fact that this could never have worked with the 
current SMMU driver. So this is not a regression and more an improvement 
of the driver to support passthrough for devices using the same stream-ID.

At this stage of the release, I would only consider trivial improvement 
to be merged.

Cheers,

-- 
Julien Grall

