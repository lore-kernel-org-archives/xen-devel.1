Return-Path: <SRS0=VkMt=LS=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9463C48BDF
	for <xen-devel@archiver.kernel.org>; Thu, 24 Jun 2021 04:06:20 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 57A84613CC
	for <xen-devel@archiver.kernel.org>; Thu, 24 Jun 2021 04:06:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 57A84613CC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=quicinc.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.146283.269281 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lwGct-00069U-MP; Thu, 24 Jun 2021 04:06:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 146283.269281; Thu, 24 Jun 2021 04:06:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lwGct-00068A-Gc; Thu, 24 Jun 2021 04:06:03 +0000
Received: by outflank-mailman (input) for mailman id 146283;
 Wed, 23 Jun 2021 18:44:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8eZS=LR=quicinc.com=quic_qiancai@srs-us1.protection.inumbo.net>)
 id 1lw7rg-0000Lq-Bx
 for xen-devel@lists.xenproject.org; Wed, 23 Jun 2021 18:44:44 +0000
Received: from alexa-out-sd-01.qualcomm.com (unknown [199.106.114.38])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f9d2ac5c-947f-4431-8cbe-a27ee5d4434a;
 Wed, 23 Jun 2021 18:44:43 +0000 (UTC)
Received: from unknown (HELO ironmsg05-sd.qualcomm.com) ([10.53.140.145])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 23 Jun 2021 11:44:42 -0700
Received: from nasanexm03e.na.qualcomm.com ([10.85.0.48])
 by ironmsg05-sd.qualcomm.com with ESMTP/TLS/AES256-SHA;
 23 Jun 2021 11:44:41 -0700
Received: from [10.38.240.33] (10.80.80.8) by nasanexm03e.na.qualcomm.com
 (10.85.0.48) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Wed, 23 Jun
 2021 11:44:35 -0700
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
X-Inumbo-ID: f9d2ac5c-947f-4431-8cbe-a27ee5d4434a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1624473883; x=1656009883;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=N07wTNJU87j8J0GwX4jxR069BiU3mP0B1FK82hyEXsU=;
  b=YaQG1kmOJmrIQ4OYRGvFbMs7YdDbMfAUzTt5+3dU3awrC3ogq9wrVQyF
   by/8dBmI481zG9rDrDT63r5gl0+4Lgssz8Mjz1GicA/qq40Nz3W4Z2g8Y
   cwdpP2PDxeqtQnpQtwpqB5cxljkW9npsn4gepj+IF4rWnVDZ0OlwyEZ53
   U=;
X-QCInternal: smtphost
Subject: Re: [PATCH v14 06/12] swiotlb: Use is_swiotlb_force_bounce for
 swiotlb data bouncing
To: Will Deacon <will@kernel.org>
CC: Claire Chang <tientzu@chromium.org>, Rob Herring <robh+dt@kernel.org>,
	<mpe@ellerman.id.au>, Joerg Roedel <joro@8bytes.org>, Frank Rowand
	<frowand.list@gmail.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	<boris.ostrovsky@oracle.com>, <jgross@suse.com>, Christoph Hellwig
	<hch@lst.de>, Marek Szyprowski <m.szyprowski@samsung.com>,
	<heikki.krogerus@linux.intel.com>, <thomas.hellstrom@linux.intel.com>,
	<peterz@infradead.org>, <benh@kernel.crashing.org>,
	<joonas.lahtinen@linux.intel.com>, <dri-devel@lists.freedesktop.org>,
	<chris@chris-wilson.co.uk>, <grant.likely@arm.com>, <paulus@samba.org>,
	<mingo@kernel.org>, <jxgao@google.com>, <sstabellini@kernel.org>, Saravana
 Kannan <saravanak@google.com>, <xypron.glpk@gmx.de>, "Rafael J . Wysocki"
	<rafael.j.wysocki@intel.com>, Bartosz Golaszewski
	<bgolaszewski@baylibre.com>, <bskeggs@redhat.com>,
	<linux-pci@vger.kernel.org>, <xen-devel@lists.xenproject.org>, Thierry Reding
	<treding@nvidia.com>, <intel-gfx@lists.freedesktop.org>,
	<matthew.auld@intel.com>, linux-devicetree <devicetree@vger.kernel.org>,
	<daniel@ffwll.ch>, <airlied@linux.ie>, <maarten.lankhorst@linux.intel.com>,
	<linuxppc-dev@lists.ozlabs.org>, <jani.nikula@linux.intel.com>, Nicolas
 Boichat <drinkcat@chromium.org>, <rodrigo.vivi@intel.com>,
	<bhelgaas@google.com>, Dan Williams <dan.j.williams@intel.com>, Andy
 Shevchenko <andriy.shevchenko@linux.intel.com>, Greg KH
	<gregkh@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, lkml
	<linux-kernel@vger.kernel.org>, "list@263.net:IOMMU DRIVERS"
	<iommu@lists.linux-foundation.org>, Jim Quinlan <james.quinlan@broadcom.com>,
	<thomas.lendacky@amd.com>, Robin Murphy <robin.murphy@arm.com>,
	<bauerman@linux.ibm.com>
References: <20210619034043.199220-1-tientzu@chromium.org>
 <20210619034043.199220-7-tientzu@chromium.org>
 <76c3343d-72e5-9df3-8924-5474ee698ef4@quicinc.com>
 <20210623183736.GA472@willie-the-truck>
From: Qian Cai <quic_qiancai@quicinc.com>
Message-ID: <19d4c7a2-744d-21e0-289c-a576e1f0e6f3@quicinc.com>
Date: Wed, 23 Jun 2021 14:44:34 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210623183736.GA472@willie-the-truck>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanexm03e.na.qualcomm.com (10.85.0.48)



On 6/23/2021 2:37 PM, Will Deacon wrote:
> On Wed, Jun 23, 2021 at 12:39:29PM -0400, Qian Cai wrote:
>>
>>
>> On 6/18/2021 11:40 PM, Claire Chang wrote:
>>> Propagate the swiotlb_force into io_tlb_default_mem->force_bounce and
>>> use it to determine whether to bounce the data or not. This will be
>>> useful later to allow for different pools.
>>>
>>> Signed-off-by: Claire Chang <tientzu@chromium.org>
>>> Reviewed-by: Christoph Hellwig <hch@lst.de>
>>> Tested-by: Stefano Stabellini <sstabellini@kernel.org>
>>> Tested-by: Will Deacon <will@kernel.org>
>>> Acked-by: Stefano Stabellini <sstabellini@kernel.org>
>>
>> Reverting the rest of the series up to this patch fixed a boot crash with NVMe on today's linux-next.
> 
> Hmm, so that makes patch 7 the suspicious one, right?

Will, no. It is rather patch #6 (this patch). Only the patch from #6 to #12 were reverted to fix the issue. Also, looking at this offset of the crash,

pc : dma_direct_map_sg+0x304/0x8f0
is_swiotlb_force_bounce at /usr/src/linux-next/./include/linux/swiotlb.h:119

is_swiotlb_force_bounce() was the new function introduced in this patch here.

+static inline bool is_swiotlb_force_bounce(struct device *dev)
+{
+	return dev->dma_io_tlb_mem->force_bounce;
+}

> 
> Looking at that one more closely, it looks like swiotlb_find_slots() takes
> 'alloc_size + offset' as its 'alloc_size' parameter from
> swiotlb_tbl_map_single() and initialises 'mem->slots[i].alloc_size' based
> on 'alloc_size + offset', which looks like a change in behaviour from the
> old code, which didn't include the offset there.
> 
> swiotlb_release_slots() then adds the offset back on afaict, so we end up
> accounting for it twice and possibly unmap more than we're supposed to?
> 
> Will
> 

