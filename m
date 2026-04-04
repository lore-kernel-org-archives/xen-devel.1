Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 480E2E63FE5
	for <xen-devel@archiver.kernel.org>; Sat,  4 Apr 2026 16:59:23 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1273825.1560300 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w94L4-0007sP-Pq; Sat, 04 Apr 2026 16:59:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1273825.1560300; Sat, 04 Apr 2026 16:59:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w94L4-0007sI-N3; Sat, 04 Apr 2026 16:59:14 +0000
Received: by outflank-mailman (input) for mailman id 1273825;
 Sat, 04 Apr 2026 16:59:13 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <chleroy@kernel.org>) id 1w94L3-0007sB-5J
 for xen-devel@lists.xenproject.org; Sat, 04 Apr 2026 16:59:13 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w94L2-003sNx-Hl
 for xen-devel@lists.xenproject.org; Sat, 04 Apr 2026 18:59:12 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <chleroy@kernel.org>)
 id 69d1430e-bab6-0a2a0a5309dd-0a2a4505c9c6-22
 for <xen-devel@lists.xenproject.org>; Sat, 04 Apr 2026 18:59:12 +0200
Received: from [172.234.252.31] (helo=sea.source.kernel.org)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <chleroy@kernel.org>)
 id 69d1435e-3760-0a2a45050019-aceafc1fd69e-3
 for <xen-devel@lists.xenproject.org>; Sat, 04 Apr 2026 18:59:12 +0200
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 0732D40212;
 Sat,  4 Apr 2026 16:59:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DDF2C19421;
 Sat,  4 Apr 2026 16:58:54 +0000 (UTC)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=k20201202 header.d=kernel.org header.i="@kernel.org" header.h="Date:Subject:To:Cc:References:From:In-Reply-To"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775321949;
	bh=2nmDBifOoextQmoTG695I77JtU4IfJ6hHi18F/uovOA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=pzHa0ltJ7P/3nc4QK7/bV808HOZOGXaMyVekR/DB1WE+018orzHWLwztSYy1/aXtb
	 SzI8tsEInej9eoHjBzyIJaVGBr9u74dLFfrXcTThineYb99ODPDwsaOS5PNoPpADEf
	 RKWNJ7Ic0kSfp5FmUOXVQ6PFQBKcfI9b1bar1hvVu+oDjNbThyquuuXTFP/2f4hh2r
	 sNZXBYXoEYlp3D9Lzsjn9fgXUhLg5zak6jG42FprWSVJLQdnerHFANSStlrij56Tl/
	 nq4W3Agf2uSQ+xhFuLGyUpc0A63CtjXoWAelZzEtiaPysfp3k4jpj5PHDxaigPyBx2
	 FsekL+yzYor6g==
Message-ID: <76355cb5-0b5d-4a29-9702-8d020a79f4c0@kernel.org>
Date: Sat, 4 Apr 2026 18:58:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: (subset) [PATCH 00/12] treewide: Convert buses to use generic
 driver_override
To: Danilo Krummrich <dakr@kernel.org>, Russell King <linux@armlinux.org.uk>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Ioana Ciornei <ioana.ciornei@nxp.com>, Nipun Gupta <nipun.gupta@amd.com>,
 Nikhil Agarwal <nikhil.agarwal@amd.com>, "K. Y. Srinivasan"
 <kys@microsoft.com>, Haiyang Zhang <haiyangz@microsoft.com>,
 Wei Liu <wei.liu@kernel.org>, Dexuan Cui <decui@microsoft.com>,
 Long Li <longli@microsoft.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Armin Wolf <W_Armin@gmx.de>, Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Vineeth Vijayan <vneethv@linux.ibm.com>,
 Peter Oberparleiter <oberpar@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>,
 Harald Freudenberger <freude@linux.ibm.com>,
 Holger Dengler <dengler@linux.ibm.com>, Mark Brown <broonie@kernel.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, =?UTF-8?Q?Eugenio_P=C3=A9rez?=
 <eperezma@redhat.com>, Alex Williamson <alex@shazbot.org>,
 Juergen Gross <jgross@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: linux-kernel@vger.kernel.org, driver-core@lists.linux.dev,
 linuxppc-dev@lists.ozlabs.org, linux-hyperv@vger.kernel.org,
 linux-pci@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 linux-s390@vger.kernel.org, linux-spi@vger.kernel.org,
 virtualization@lists.linux.dev, kvm@vger.kernel.org,
 xen-devel@lists.xenproject.org, linux-arm-kernel@lists.infradead.org
References: <20260324005919.2408620-1-dakr@kernel.org>
 <DHKGQN6D0ANO.2QYY3JTM5435O@kernel.org>
Content-Language: fr-FR
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
In-Reply-To: <DHKGQN6D0ANO.2QYY3JTM5435O@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c201ff/1775321952-2292196F-DDB74BE1/0/0
X-purgate-type: clean
X-purgate-size: 1207



Le 04/04/2026 à 17:07, Danilo Krummrich a écrit :
> On Tue Mar 24, 2026 at 1:59 AM CET, Danilo Krummrich wrote:
>> Danilo Krummrich (12):
>>    PCI: use generic driver_override infrastructure
>>    platform/wmi: use generic driver_override infrastructure
>>    vdpa: use generic driver_override infrastructure
>>    s390/cio: use generic driver_override infrastructure
>>    s390/ap: use generic driver_override infrastructure
> 
> Applied to driver-core-testing, thanks!
> 
>>    amba: use generic driver_override infrastructure
>>    cdx: use generic driver_override infrastructure
>>    hv: vmbus: use generic driver_override infrastructure
>>    rpmsg: use generic driver_override infrastructure
> 
> I have not picked these up, as they have not received ACKs from the
> corresponding subsystem maintainers so far.
> 
>>    bus: fsl-mc: use generic driver_override infrastructure

I droped it from soc_fsl tree, some dependency must be missing.

Feal free to take it if you can, it is acked-by Ioana.

>>    spi: use generic driver_override infrastructure
> 
> These have already been picked up via the respective subsystem trees -- thanks!
> 
> Thanks,
> Danilo


