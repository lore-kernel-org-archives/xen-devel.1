Return-Path: <SRS0=BfPI=CJ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DD41C433E2
	for <xen-devel@archiver.kernel.org>; Mon, 31 Aug 2020 07:30:22 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 26DEC20738
	for <xen-devel@archiver.kernel.org>; Mon, 31 Aug 2020 07:30:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 26DEC20738
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kCeGW-0004S0-6r; Mon, 31 Aug 2020 07:30:08 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OIpa=CJ=linux.intel.com=baolu.lu@srs-us1.protection.inumbo.net>)
 id 1kCeGV-0004Rv-6P
 for xen-devel@lists.xenproject.org; Mon, 31 Aug 2020 07:30:07 +0000
X-Inumbo-ID: 80701ebf-a1e2-4cc8-9b07-93539897f142
Received: from mga05.intel.com (unknown [192.55.52.43])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 80701ebf-a1e2-4cc8-9b07-93539897f142;
 Mon, 31 Aug 2020 07:30:06 +0000 (UTC)
IronPort-SDR: gFlkBpdkW0u4J6O5hqj96ju2ZseKkyQY9mWA+hyFCd3NFumQfUYwUOQeeXtPxyGx7F2syD0D+f
 TreTJkK86iDQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9729"; a="241737732"
X-IronPort-AV: E=Sophos;i="5.76,374,1592895600"; d="scan'208";a="241737732"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2020 00:30:04 -0700
IronPort-SDR: RhGSL7wyVsjh+qsvOh480VVPNj2zqANcLsAm0u5fLr0CbkyXraU3/CQPTHJpjckYsGMnAcC/x1
 3SMjo64MzSQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,374,1592895600"; d="scan'208";a="501762398"
Received: from blu2-mobl3.ccr.corp.intel.com (HELO [10.254.212.84])
 ([10.254.212.84])
 by fmsmga005.fm.intel.com with ESMTP; 31 Aug 2020 00:29:57 -0700
Cc: baolu.lu@linux.intel.com, x86@kernel.org, Joerg Roedel <joro@8bytes.org>, 
 iommu@lists.linux-foundation.org, linux-hyperv@vger.kernel.org,
 Haiyang Zhang <haiyangz@microsoft.com>,
 Jon Derrick <jonathan.derrick@intel.com>, Wei Liu <wei.liu@kernel.org>,
 "K. Y. Srinivasan" <kys@microsoft.com>,
 Stephen Hemminger <sthemmin@microsoft.com>, Steve Wahl <steve.wahl@hpe.com>,
 Dimitri Sivanich <sivanich@hpe.com>, Russ Anderson <rja@hpe.com>,
 linux-pci@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 xen-devel@lists.xenproject.org, Juergen Gross <jgross@suse.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Marc Zyngier <maz@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Megha Dey <megha.dey@intel.com>,
 Jason Gunthorpe <jgg@mellanox.com>, Dave Jiang <dave.jiang@intel.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Jacob Pan <jacob.jun.pan@intel.com>, Baolu Lu <baolu.lu@intel.com>,
 Kevin Tian <kevin.tian@intel.com>, Dan Williams <dan.j.williams@intel.com>
Subject: Re: [patch V2 00/46] x86, PCI, XEN, genirq ...: Prepare for device MSI
To: Thomas Gleixner <tglx@linutronix.de>, LKML <linux-kernel@vger.kernel.org>
References: <20200826111628.794979401@linutronix.de>
 <02e30654-714b-520a-0d20-fca20794df93@linux.intel.com>
 <87pn77i93c.fsf@nanos.tec.linutronix.de>
From: Lu Baolu <baolu.lu@linux.intel.com>
Message-ID: <b41eb9d7-0438-8a3a-d708-0173b4b25fea@linux.intel.com>
Date: Mon, 31 Aug 2020 15:29:56 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <87pn77i93c.fsf@nanos.tec.linutronix.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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

Hi Thomas,

On 2020/8/31 15:10, Thomas Gleixner wrote:
> On Mon, Aug 31 2020 at 08:51, Lu Baolu wrote:
>> On 8/26/20 7:16 PM, Thomas Gleixner wrote:
>>> This is the second version of providing a base to support device MSI (non
>>> PCI based) and on top of that support for IMS (Interrupt Message Storm)
>>> based devices in a halfways architecture independent way.
>>
>> After applying this patch series, the dmar_alloc_hwirq() helper doesn't
>> work anymore during boot. This causes the IOMMU driver to fail to
>> register the DMA fault handler and abort the IOMMU probe processing.
>> Is this a known issue?
> 
> See replies to patch 15/46 or pull the git tree. It has the issue fixed.

Ah! Yes. Sorry for the noise.

Beset regards,
baolu

