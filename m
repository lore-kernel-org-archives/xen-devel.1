Return-Path: <SRS0=i2DS=CC=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AFE0C433DF
	for <xen-devel@archiver.kernel.org>; Mon, 24 Aug 2020 04:49:28 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 32A1820774
	for <xen-devel@archiver.kernel.org>; Mon, 24 Aug 2020 04:49:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 32A1820774
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kA4Pe-0003Nm-8Q; Mon, 24 Aug 2020 04:48:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=h8JF=CC=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kA4Pd-0003Nh-AA
 for xen-devel@lists.xenproject.org; Mon, 24 Aug 2020 04:48:53 +0000
X-Inumbo-ID: 1974a13d-7a91-4601-83fd-a54ff7772a43
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1974a13d-7a91-4601-83fd-a54ff7772a43;
 Mon, 24 Aug 2020 04:48:52 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 33352AAC7;
 Mon, 24 Aug 2020 04:49:21 +0000 (UTC)
Subject: Re: [patch RFC 22/38] x86/xen: Make xen_msi_init() static and rename
 it to xen_hvm_msi_init()
To: Thomas Gleixner <tglx@linutronix.de>, LKML <linux-kernel@vger.kernel.org>
Cc: x86@kernel.org, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 linux-pci@vger.kernel.org, xen-devel@lists.xenproject.org,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Joerg Roedel <joro@8bytes.org>,
 iommu@lists.linux-foundation.org, linux-hyperv@vger.kernel.org,
 Haiyang Zhang <haiyangz@microsoft.com>,
 Jon Derrick <jonathan.derrick@intel.com>, Lu Baolu
 <baolu.lu@linux.intel.com>, Wei Liu <wei.liu@kernel.org>,
 "K. Y. Srinivasan" <kys@microsoft.com>,
 Stephen Hemminger <sthemmin@microsoft.com>, Steve Wahl <steve.wahl@hpe.com>,
 Dimitri Sivanich <sivanich@hpe.com>, Russ Anderson <rja@hpe.com>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Marc Zyngier
 <maz@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Megha Dey <megha.dey@intel.com>,
 Jason Gunthorpe <jgg@mellanox.com>, Dave Jiang <dave.jiang@intel.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Jacob Pan <jacob.jun.pan@intel.com>, Baolu Lu <baolu.lu@intel.com>,
 Kevin Tian <kevin.tian@intel.com>, Dan Williams <dan.j.williams@intel.com>
References: <20200821002424.119492231@linutronix.de>
 <20200821002947.464203710@linutronix.de>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <1af3d4a2-0f73-4e58-0e23-ac667d2c9141@suse.com>
Date: Mon, 24 Aug 2020 06:48:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200821002947.464203710@linutronix.de>
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

On 21.08.20 02:24, Thomas Gleixner wrote:
> The only user is in the same file and the name is too generic because this
> function is only ever used for HVM domains.
> 
> Signed-off-by: Thomas Gleixner<tglx@linutronix.de>
> Cc: Konrad Rzeszutek Wilk<konrad.wilk@oracle.com>
> Cc:linux-pci@vger.kernel.org
> Cc:xen-devel@lists.xenproject.org
> Cc: Juergen Gross<jgross@suse.com>
> Cc: Boris Ostrovsky<boris.ostrovsky@oracle.com>
> Cc: Stefano Stabellini<sstabellini@kernel.org>

Reviewed-by: Juergen Gross<jgross@suse.com>


Juergen

