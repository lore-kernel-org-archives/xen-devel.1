Return-Path: <SRS0=XBNZ=CD=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C163EC433E1
	for <xen-devel@archiver.kernel.org>; Tue, 25 Aug 2020 16:18:04 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8CB072076C
	for <xen-devel@archiver.kernel.org>; Tue, 25 Aug 2020 16:18:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=xen.org header.i=@xen.org header.b="Z6ZNoD8o"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8CB072076C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kAbdp-0005DL-Ua; Tue, 25 Aug 2020 16:17:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yzwT=CD=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1kAbdo-0005DG-EM
 for xen-devel@lists.xenproject.org; Tue, 25 Aug 2020 16:17:44 +0000
X-Inumbo-ID: e0886256-968e-48bb-ae3f-79b328642ed2
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e0886256-968e-48bb-ae3f-79b328642ed2;
 Tue, 25 Aug 2020 16:17:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
 bh=6CUwgIBfVcm6bhpTNkDKpykMFsnKXZ2py8gEJ8dNH8Y=; b=Z6ZNoD8o1P9kIyQNBpeMj2fy8y
 Id10TBhBnr2iKGVOalNf9ribsXb0lnH6BOVd5RojRDgNYotN5pKm9iZchc20rIOU9EVqesRvzQHxr
 DsIyCBu4htCtwCMDCfV4GFNetckVlI+9A1ysmnuvl4a/SPOOyPRObqBIB0rwYaWldxQk=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kAbdn-0002oF-AF; Tue, 25 Aug 2020 16:17:43 +0000
Received: from [54.239.6.177] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kAbdn-00072s-2k; Tue, 25 Aug 2020 16:17:43 +0000
Subject: Re: MFN on ARM
To: luckybreak051779 <luckybreak051779@gmail.com>
Cc: xen-devel@lists.xenproject.org
References: <CAN00iyXLZXkXkq2Umg8K+hyJS=-+bzLeBVcaUEWOuMe-91T4eA@mail.gmail.com>
 <aaf57295-0f13-2af6-650a-b9ccbf8d7733@xen.org>
 <CAN00iyW2pr=nBjNTdC32ZeUR56W6_crZ3D8LTAabR6LPPDGdfA@mail.gmail.com>
From: Julien Grall <julien@xen.org>
Message-ID: <3bd1cb08-5a55-bc2d-3e3b-1d612c98b0c9@xen.org>
Date: Tue, 25 Aug 2020 17:17:41 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <CAN00iyW2pr=nBjNTdC32ZeUR56W6_crZ3D8LTAabR6LPPDGdfA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>



On 24/08/2020 16:29, luckybreak051779 wrote:
> Hi Julien

Hi,

> Thanks for getting back to me.
> 
> On Mon, Aug 24, 2020 at 11:10 AM Julien Grall <julien@xen.org> wrote:
>>
>> Hi,
>>
>> On 24/08/2020 15:23, luckybreak051779 wrote:
>>> Xen Team:
>>>
>>> I am running Xen 4.13.0 on a 32-bit ARM processor.  In a domU driver I
>>> use the dma_map_single() function to obtain a DMA address.
>>> How can I get the MFN of that DMA address from inside the domU?
>>
>> We don't provide a way to find the MFN from a Guest Physical Frame.
>>
>>>   I need
>>> the MFN to be able to differentiate between
>>> two identical domUs running the same driver code (e.g. both calling
>>> dma_map_single() ).
>> Can you give more details of your setup? Are you trying to use the same
>> physical device in two domUs?
>>
> I have an FPGA that needs to communicate with each domU via buffers
> mapped from the dma_map_single() call.  The domU puts the bus address
> received from dma_map_single() into a shared memory area in Dom0 that
> the FPGA can read.  The problem is that the FPGA tries to use that
> address and its not the "real" physical address in memory.  That's why
> i'm trying to get the MFN so that I can give the FPGA the "real"
> physical address associated with the domU buffer from
> dma_map_single().  This code worked fine when it was originally in
> dom0.

The approach here will depend on whether you want your DomU to be 
trusted or not.

If you don't trust your guest, then you want to prevent the physical 
page to disappear under your feet.

I am assuming you don't have an IOMMU on your platform, so you would 
want to create a PV driver to interact with the FPGA. The backend 
(probably residing in Dom0) would be in charge of translating the GFN to 
an MFN and also ensure the page doesn't disappear while used.

Cheers,

-- 
Julien Grall

