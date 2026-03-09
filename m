Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AE5CFCA18D
	for <xen-devel@archiver.kernel.org>; Mon,  9 Mar 2026 21:09:04 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1249730.1547146 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vzhqR-0003xG-2n; Mon, 09 Mar 2026 21:08:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1249730.1547146; Mon, 09 Mar 2026 21:08:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vzhqR-0003x9-0H; Mon, 09 Mar 2026 21:08:55 +0000
Received: by outflank-mailman (input) for mailman id 1249730;
 Mon, 09 Mar 2026 21:08:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=I7sq=BJ=kernel.org=helgaas@srs-se1.protection.inumbo.net>)
 id 1vzhqQ-0003x3-Dw
 for xen-devel@lists.xenproject.org; Mon, 09 Mar 2026 21:08:54 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2c21054e-1bfc-11f1-9ccf-f158ae23cfc8;
 Mon, 09 Mar 2026 22:08:51 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id E215760054;
 Mon,  9 Mar 2026 21:08:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6AE8BC4CEF7;
 Mon,  9 Mar 2026 21:08:50 +0000 (UTC)
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
X-Inumbo-ID: 2c21054e-1bfc-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773090530;
	bh=U7I3bh69J3B4cMe2WWPQdGTO1zM2gflc1SsDGP9ZT0I=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=A0L3JiuPR1xjYzTSESZft46f57l2sFUINbyiBwaa6vFAi1NfK83JHNon+cdjeHKbn
	 7dtI21fEV5QD8ro2YvLh2Si8Xpmb/17KnuNGo/q5fBhZ11PkzUawLhZoFdFNhVyGZM
	 h/UhGimNDd/Bac8cHifHRIEZ0rQmMlZ0lNoOeU0rl8G4gzJtuuk805FkZ6Mu2QWd+Z
	 3MmBuE34eHGaY4YmNqZFA/7GR/Hc/hOENwdlrhexbxhowZ156iiF3wnKTE7av1xp4N
	 wTipYJkof56uIJTznJYFJZWnhgT23MKaop5kLLZPDuod/62QnQMcD8mDWMFBsMhO4/
	 d13soJV6gfW+A==
Date: Mon, 9 Mar 2026 16:08:49 -0500
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
Subject: Re: [PATCH v10 3/3] of: Respect #{iommu,msi}-cells in maps
Message-ID: <20260309210849.GA591344@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260309-parse_iommu_cells-v10-3-c62fcaa5a1d8@oss.qualcomm.com>

On Mon, Mar 09, 2026 at 01:03:39AM +0530, Vijayanand Jitta wrote:
> From: Robin Murphy <robin.murphy@arm.com>
> 
> So far our parsing of {iommu,msi}-map properites has always blindly

s/properites/properties/

