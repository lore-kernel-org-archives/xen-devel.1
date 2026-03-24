Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AF94FEC102
	for <xen-devel@archiver.kernel.org>; Tue, 24 Mar 2026 19:45:18 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1261361.1554407 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w57gN-00031P-Vx; Tue, 24 Mar 2026 19:44:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1261361.1554407; Tue, 24 Mar 2026 19:44:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w57gN-00031I-T0; Tue, 24 Mar 2026 19:44:55 +0000
Received: by outflank-mailman (input) for mailman id 1261361;
 Tue, 24 Mar 2026 19:44:54 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <broonie@kernel.org>) id 1w57gM-00031C-Rf
 for xen-devel@lists.xenproject.org; Tue, 24 Mar 2026 19:44:54 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w57gL-002Hgi-0t
 for xen-devel@lists.xenproject.org; Tue, 24 Mar 2026 20:44:53 +0100
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <broonie@kernel.org>)
 id 69c2e9a8-bab6-0a2a0a5309dd-0a2a450bbffe-18
 for <xen-devel@lists.xenproject.org>; Tue, 24 Mar 2026 20:44:52 +0100
Received: from [172.105.4.254] (helo=tor.source.kernel.org)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <broonie@kernel.org>)
 id 69c2e9b3-ef63-0a2a450b0019-ac6904fea0ea-3
 for <xen-devel@lists.xenproject.org>; Tue, 24 Mar 2026 20:44:52 +0100
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 2B3A3600AC;
 Tue, 24 Mar 2026 19:44:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF553C19424;
 Tue, 24 Mar 2026 19:44:42 +0000 (UTC)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=k20201202 header.d=kernel.org header.i="@kernel.org" header.h="From:To:Cc:In-Reply-To:References:Subject:Date"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774381490;
	bh=WRF/0A79XI/IfrPujL8sWiRG4jtPsIHG8/HKlYhxfwg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=BI/PyKSYvjLJXWbEpQrc+czH+55hhTQfVKT55Uu1wKsITHQaRklHZhshTVjzHQFZN
	 XI99w4CrCK+yRfm2877TM5yV4pPdvKaG1DWbUoq9X2UMljaiVAeNppp3zNtFe6VQcR
	 Nbxio4BzKuKvbSdbHpiqyp9b0V4Wi4iBFmRLBu0AraFrnoul9PN3a4ntDRFnw+1WBV
	 6VOLh/84HoNWnxFvJA4p13awciT/KZz8A8WdIkArI2aCUbV0ZkSk5h4r/JYUTPRIIT
	 T8Jt8zQSnSc69wMDv4JXXRT2onYDSQlxz5UqGBDTvOp1c1OxGFbD7+EZxoeS8MPSTJ
	 8n38/skizDzlQ==
From: Mark Brown <broonie@kernel.org>
To: Russell King <linux@armlinux.org.uk>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Ioana Ciornei <ioana.ciornei@nxp.com>, Nipun Gupta <nipun.gupta@amd.com>, 
 Nikhil Agarwal <nikhil.agarwal@amd.com>, 
 "K. Y. Srinivasan" <kys@microsoft.com>, 
 Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, 
 Dexuan Cui <decui@microsoft.com>, Long Li <longli@microsoft.com>, 
 Bjorn Helgaas <bhelgaas@google.com>, Armin Wolf <W_Armin@gmx.de>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Vineeth Vijayan <vneethv@linux.ibm.com>, 
 Peter Oberparleiter <oberpar@linux.ibm.com>, 
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Sven Schnelle <svens@linux.ibm.com>, 
 Harald Freudenberger <freude@linux.ibm.com>, 
 Holger Dengler <dengler@linux.ibm.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, 
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, 
 =?utf-8?q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>, 
 Alex Williamson <alex@shazbot.org>, Juergen Gross <jgross@suse.com>, 
 Stefano Stabellini <sstabellini@kernel.org>, 
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, 
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
 Danilo Krummrich <dakr@kernel.org>
Cc: linux-kernel@vger.kernel.org, driver-core@lists.linux.dev, 
 linuxppc-dev@lists.ozlabs.org, linux-hyperv@vger.kernel.org, 
 linux-pci@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
 linux-s390@vger.kernel.org, linux-spi@vger.kernel.org, 
 virtualization@lists.linux.dev, kvm@vger.kernel.org, 
 xen-devel@lists.xenproject.org, linux-arm-kernel@lists.infradead.org
In-Reply-To: <20260324005919.2408620-1-dakr@kernel.org>
References: <20260324005919.2408620-1-dakr@kernel.org>
Subject: Re: (subset) [PATCH 00/12] treewide: Convert buses to use generic
 driver_override
Message-Id: <177436441990.98682.12977271865531185229.b4-ty@b4>
Date: Tue, 24 Mar 2026 15:00:19 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev-6cc06
X-Developer-Signature: v=1; a=openpgp-sha256; l=1523; i=broonie@kernel.org;
 h=from:subject:message-id; bh=WRF/0A79XI/IfrPujL8sWiRG4jtPsIHG8/HKlYhxfwg=;
 b=kA0DAAoBJNaLcl1Uh9AByyZiAGnC6amgudhaUXvPlk+pDm3GoyUp8H0DzJj7P23jodGH3vgaM
 YkBMwQAAQoAHRYhBK3maKpnVxi1n+Kf6iTWi3JdVIfQBQJpwumpAAoJECTWi3JdVIfQ7W4H/0HK
 bnLD6QxQOBC+fzyIxZ6G6kEKZPO4GVW3Pfn4yfAzX5qrdKQRkDgps7IYWut/u33hS3f+Z04EmOJ
 lYrLIJIM422nR6nge6hF8EhqNBiTq/w9q7cGC48hH540F15d0sLd2//XCIGupIA1RXpBqVdzq5x
 OT6qjdHSfs8FyZ+oeQmp08Rcg1XfVc+MneH1PzidJufZ+tJUtayZw29OlGfNk6vGZ389vkRi+Ec
 XFn5qSzIYh78B0Z0zXzPv2/IjG8frEcheWdi3dJbD2bUS4h2S1US62r3HG8U3Au0lRz8ggXRMML
 03vuVW3IP0egShhpeZHJhBzFqhYb6LFlY+k9hXc=
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-purgate-ID: tlsNG-42698a/1774381492-A3630112-27420F28/0/0
X-purgate-type: clean
X-purgate-size: 1525

On Tue, 24 Mar 2026 01:59:04 +0100, Danilo Krummrich wrote:
> treewide: Convert buses to use generic driver_override
> 
> This is the follow-up of the driver_override generalization in [1], converting
> the remaining 11 busses and removing the now-unused driver_set_override()
> helper.
> 
> All of them (except AP, which has a different race condition) are prone to the
> potential UAF described in [2], caused by accessing the driver_override field
> from their corresponding match() callback.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-7.0

Thanks!

[11/12] spi: use generic driver_override infrastructure
        https://git.kernel.org/broonie/spi/c/cc34d77dd487

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark


