Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB6D8FCA18A
	for <xen-devel@archiver.kernel.org>; Mon,  9 Mar 2026 21:05:38 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1249722.1547138 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vzhmq-0003RG-Km; Mon, 09 Mar 2026 21:05:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1249722.1547138; Mon, 09 Mar 2026 21:05:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vzhmq-0003R9-Hk; Mon, 09 Mar 2026 21:05:12 +0000
Received: by outflank-mailman (input) for mailman id 1249722;
 Mon, 09 Mar 2026 21:05:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=I7sq=BJ=kernel.org=helgaas@srs-se1.protection.inumbo.net>)
 id 1vzhmp-0003R3-QT
 for xen-devel@lists.xenproject.org; Mon, 09 Mar 2026 21:05:11 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a7ba343a-1bfb-11f1-b164-2bf370ae4941;
 Mon, 09 Mar 2026 22:05:09 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 0FF3560054;
 Mon,  9 Mar 2026 21:05:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FD26C4CEF7;
 Mon,  9 Mar 2026 21:05:07 +0000 (UTC)
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
X-Inumbo-ID: a7ba343a-1bfb-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773090307;
	bh=Nq8FH4TTfSWeK3IqSHQXr18jc5JUXALz41xxYhKgNgA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=kdf6A65npBGYj/ybcEJCHuWvMf/VZj0Jj8ZaOAFs96ROtJKN3tNO6HP1MgrC1B6oy
	 EPz1UZwrSSC9JS6jVh8OFGGbTheePHMFWRYLgBv6QYovtZxwfOJIBlVIiFiT1GlRLD
	 gIb3m8jY9XsN+5f9e3VF1vUYbRS23+wDBhf1FUzktXUHwBjHU/K01iV5QYd4lJUqwT
	 Juq+UXeh/FdpGWKyQnG8gefrB2Wu+pXvMbGgRB3sIPoxuUO6Q4ct39W+i2TnSz6lEb
	 4iJj4AIMUzMPKu8qsjNoIlfsyAQcX/cq7D4MiOj4h7VwqN29Fg5h87eIkiuTTVEPZg
	 88YY2nPe8WVWw==
Date: Mon, 9 Mar 2026 16:05:06 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
Cc: Nipun Gupta <nipun.gupta@amd.com>,
	Nikhil Agarwal <nikhil.agarwal@amd.com>,
	Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>, Marc Zyngier <maz@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Saravana Kannan <saravanak@kernel.org>,
	Richard Zhu <hongxing.zhu@nxp.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Prakash Gupta <prakash.gupta@oss.qualcomm.com>,
	Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
	linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-pci@vger.kernel.org, imx@lists.linux.dev,
	xen-devel@lists.xenproject.org, linux-arm-msm@vger.kernel.org,
	Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
Subject: Re: [PATCH v10 0/3] of: parsing of multi #{iommu,msi}-cells in maps
Message-ID: <20260309210506.GA589665@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260309-parse_iommu_cells-v10-0-c62fcaa5a1d8@oss.qualcomm.com>

On Mon, Mar 09, 2026 at 01:03:36AM +0530, Vijayanand Jitta wrote:
> ...

> Charan Teja Kalla (1):
>       of: factor arguments passed to of_map_id() into a struct

Please make this subject line match the capitalization of those below,
i.e., "of: Factor arguments ..."

> Robin Murphy (2):
>       of: Add convenience wrappers for of_map_id()
>       of: Respect #{iommu,msi}-cells in maps

