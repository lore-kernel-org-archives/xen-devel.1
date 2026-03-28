Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25C3A10F3DCE
	for <xen-devel@archiver.kernel.org>; Sat, 28 Mar 2026 13:17:13 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1266512.1556746 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w6TWs-0002GF-HQ; Sat, 28 Mar 2026 13:16:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1266512.1556746; Sat, 28 Mar 2026 13:16:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w6TWs-0002G7-Cm; Sat, 28 Mar 2026 13:16:42 +0000
Received: by outflank-mailman (input) for mailman id 1266512;
 Sat, 28 Mar 2026 12:10:42 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <chleroy@kernel.org>) id 1w6SV0-0002qm-TP
 for xen-devel@lists.xenproject.org; Sat, 28 Mar 2026 12:10:42 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w6SV0-00G0B2-5y
 for xen-devel@lists.xenproject.org; Sat, 28 Mar 2026 13:10:42 +0100
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <chleroy@kernel.org>)
 id 69c7c531-e002-0a2a0a5209dd-0a2a45069552-12
 for <xen-devel@lists.xenproject.org>; Sat, 28 Mar 2026 13:10:42 +0100
Received: from [172.234.252.31] (helo=sea.source.kernel.org)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <chleroy@kernel.org>)
 id 69c7c540-3034-0a2a45060019-aceafc1f8264-3
 for <xen-devel@lists.xenproject.org>; Sat, 28 Mar 2026 13:10:41 +0100
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 52B8543FD2;
 Sat, 28 Mar 2026 12:10:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24AC2C4CEF7;
 Sat, 28 Mar 2026 12:10:26 +0000 (UTC)
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
	s=k20201202; t=1774699839;
	bh=NTFcZ7aSZIsyP3qPdyEPoyvUbM7dBDc1cogifZf44fs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=LQI2u2FJrZdfURKcCR9tStL7U7j9JDQoiHCmq72vccMs+ZUBhp+9/TKvL161WNaYt
	 HB6Cn/KW4bpF4LE8szU/Ttp0n1iAeBjvFxI338mQ+OH5v7/aZmAQ9mRmTZhzpLHT8Q
	 2ij/qw3sRiilAWVo3GAkTfwxr5AaAfiGpMiRoVeACXWF2FpqJdBr1mqCSFspFTpRGG
	 IWAWGn1ScwG3hTcEoF9XWrUzsMNbRCB9m36GDK5FSVbYng9NVfLXXuJIcV7JatH039
	 EqdHKj9j/+OVngUAIX3Bg6ahCKh6k16Ub4DhdqyNRlVlqKadrI7x9Bvws94pvNi0EJ
	 U/HidD7p2Gw6Q==
Message-ID: <4c5e9bad-82f0-4714-99c2-8ccd79a45043@kernel.org>
Date: Sat, 28 Mar 2026 13:10:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/12] bus: fsl-mc: use generic driver_override
 infrastructure
To: Ioana Ciornei <ioana.ciornei@nxp.com>, Danilo Krummrich <dakr@kernel.org>
Cc: Russell King <linux@armlinux.org.uk>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Nipun Gupta <nipun.gupta@amd.com>,
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
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, =?UTF-8?Q?Eugenio_P=C4=82=C2=A9rez?=
 <eperezma@redhat.com>, Alex Williamson <alex@shazbot.org>,
 Juergen Gross <jgross@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 linux-kernel@vger.kernel.org, driver-core@lists.linux.dev,
 linuxppc-dev@lists.ozlabs.org, linux-hyperv@vger.kernel.org,
 linux-pci@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 linux-s390@vger.kernel.org, linux-spi@vger.kernel.org,
 virtualization@lists.linux.dev, kvm@vger.kernel.org,
 xen-devel@lists.xenproject.org, linux-arm-kernel@lists.infradead.org,
 Gui-Dong Han <hanguidong02@gmail.com>
References: <20260324005919.2408620-1-dakr@kernel.org>
 <20260324005919.2408620-3-dakr@kernel.org>
 <cvcetxkxjq2tz6n2vsofhyzove3qdi2e4r6rq6yxou3joejk2h@rmt5ygav7ssu>
Content-Language: fr-FR
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
In-Reply-To: <cvcetxkxjq2tz6n2vsofhyzove3qdi2e4r6rq6yxou3joejk2h@rmt5ygav7ssu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-16d1c6/1774699842-815891C2-424DDE06/0/0
X-purgate-type: clean
X-purgate-size: 1868



Le 25/03/2026 à 13:01, Ioana Ciornei a écrit :
> On Tue, Mar 24, 2026 at 01:59:06AM +0100, Danilo Krummrich wrote:
>> When a driver is probed through __driver_attach(), the bus' match()
>> callback is called without the device lock held, thus accessing the
>> driver_override field without a lock, which can cause a UAF.
>>
>> Fix this by using the driver-core driver_override infrastructure taking
>> care of proper locking internally.
>>
>> Note that calling match() from __driver_attach() without the device lock
>> held is intentional. [1]
>>
>> Link: https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.kernel.org%2Fdriver-core%2FDGRGTIRHA62X.3RY09D9SOK77P%40kernel.org%2F&data=05%7C02%7Cchristophe.leroy%40csgroup.eu%7C4b9262ddecdd4ce29f9808de8a66485e%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C639100369055903282%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=%2BRfjlUkq7oWV%2F0v2S2B%2BEuxCY%2FLRQv6qHiEWiupd6kc%3D&reserved=0 [1]
>> Reported-by: Gui-Dong Han <hanguidong02@gmail.com>
>> Closes: https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fbugzilla.kernel.org%2Fshow_bug.cgi%3Fid%3D220789&data=05%7C02%7Cchristophe.leroy%40csgroup.eu%7C4b9262ddecdd4ce29f9808de8a66485e%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C639100369055936232%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=XL1K1ICiygOZnlvDUbQFe192KnLsBQms0HFNGCuyz%2Fw%3D&reserved=0
>> Fixes: 1f86a00c1159 ("bus/fsl-mc: add support for 'driver_override' in the mc-bus")
>> Signed-off-by: Danilo Krummrich <dakr@kernel.org>
> 
> Tested-by: Ioana Ciornei <ioana.ciornei@nxp.com>
> Signed-off-by: Ioana Ciornei <ioana.ciornei@nxp.com>
> 


Applied, thanks

