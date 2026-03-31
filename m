Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E031109B492
	for <xen-devel@archiver.kernel.org>; Tue, 31 Mar 2026 15:43:37 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1269118.1558248 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7bFY-0006NA-Pe; Tue, 31 Mar 2026 15:43:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1269118.1558248; Tue, 31 Mar 2026 15:43:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7bFY-0006N3-Lz; Tue, 31 Mar 2026 15:43:28 +0000
Received: by outflank-mailman (input) for mailman id 1269118;
 Tue, 31 Mar 2026 15:43:27 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dakr@kernel.org>) id 1w7bFX-0006Ma-LO
 for xen-devel@lists.xenproject.org; Tue, 31 Mar 2026 15:43:27 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w7bFW-003Zcf-Rz
 for xen-devel@lists.xenproject.org; Tue, 31 Mar 2026 17:43:27 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dakr@kernel.org>)
 id 69cbeb9c-2eae-0a2a0a5409dd-0a2a4502ab30-6
 for <xen-devel@lists.xenproject.org>; Tue, 31 Mar 2026 17:43:26 +0200
Received: from [172.234.252.31] (helo=sea.source.kernel.org)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <dakr@kernel.org>)
 id 69cbeb9d-63bb-0a2a45020019-aceafc1f9690-3
 for <xen-devel@lists.xenproject.org>; Tue, 31 Mar 2026 17:43:26 +0200
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 33F5141AA1;
 Tue, 31 Mar 2026 15:43:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D763AC2BCB1;
 Tue, 31 Mar 2026 15:43:14 +0000 (UTC)
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
	s=k20201202; t=1774971804;
	bh=6Sh+nuXBMcAFDxKLCKsR5cDxicblUVjm/StrUH5xvws=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=AvEJIy/r0i0fIT0q1b7k0uixxXSVC1oh7xfO2lmos43V1mEkh9/oCyjjM/NIlIzDR
	 G4ToLsOxBoNZj9eIXjRIfgaF1JLikB4FAvsXjSce8BwELH8sXRPMxKzVfwC18KZVLM
	 xvaZCSjKCWIMAF0TL0BKofu4C2zQpBgPhfjifUkEE/91cdaFO2EcfVtNgpPrO7Xulf
	 fYkRcb4pifGLoTxuUkNA9ffXMCz8PqPYdeYYDg7woAcRkIdsrLp3N/31BR3QOWYwl8
	 kL1fnhPJvjBetXgl25fDvOAS7XsfRd59LIFlTx8YTswK4vMykSPYpL+e72NUmtvpp/
	 OhFF1YDMIAkew==
Message-ID: <f819b7d8-5c80-4463-9afa-933a2ddc8ab3@kernel.org>
Date: Tue, 31 Mar 2026 17:43:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/12] platform/wmi: use generic driver_override
 infrastructure
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Russell King <linux@armlinux.org.uk>,
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
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
 LKML <linux-kernel@vger.kernel.org>, driver-core@lists.linux.dev,
 linuxppc-dev@lists.ozlabs.org, linux-hyperv@vger.kernel.org,
 linux-pci@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 linux-s390@vger.kernel.org, linux-spi@vger.kernel.org,
 virtualization@lists.linux.dev, kvm@vger.kernel.org,
 xen-devel@lists.xenproject.org, linux-arm-kernel@lists.infradead.org,
 Gui-Dong Han <hanguidong02@gmail.com>
References: <20260324005919.2408620-1-dakr@kernel.org>
 <20260324005919.2408620-7-dakr@kernel.org>
 <f15629e4-ef8f-b1b6-0158-064f40f111da@linux.intel.com>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <f15629e4-ef8f-b1b6-0158-064f40f111da@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-720697/1774971806-BDA9CDB8-E6A325E6/0/0
X-purgate-type: clean
X-purgate-size: 312

On 3/31/26 5:02 PM, Ilpo Järvinen wrote:
> I tried applying this to platform-drivers tree but it failed to compile so 
> I ended up dropping the changed.

As the cover letter mentions, it sits on top of v7.0-rc5, did you consider this?

I can also pick it up via the driver-core tree.

Thanks,
Danilo

