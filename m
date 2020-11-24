Return-Path: <SRS0=fYmn=E6=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFF35C63798
	for <xen-devel@archiver.kernel.org>; Tue, 24 Nov 2020 14:47:14 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6489620715
	for <xen-devel@archiver.kernel.org>; Tue, 24 Nov 2020 14:47:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="Nf940VeI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6489620715
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.36482.68390 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khZat-0007Pm-Bc; Tue, 24 Nov 2020 14:46:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 36482.68390; Tue, 24 Nov 2020 14:46:59 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khZat-0007Pf-8b; Tue, 24 Nov 2020 14:46:59 +0000
Received: by outflank-mailman (input) for mailman id 36482;
 Tue, 24 Nov 2020 14:46:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LHIe=E6=kernel.org=gustavoars@srs-us1.protection.inumbo.net>)
 id 1khZar-0007Pa-MN
 for xen-devel@lists.xenproject.org; Tue, 24 Nov 2020 14:46:57 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 82b5fe2f-7825-457a-a989-d52150337348;
 Tue, 24 Nov 2020 14:46:57 +0000 (UTC)
Received: from embeddedor (187-162-31-110.static.axtel.net [187.162.31.110])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 296CF206F9;
 Tue, 24 Nov 2020 14:46:49 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=LHIe=E6=kernel.org=gustavoars@srs-us1.protection.inumbo.net>)
	id 1khZar-0007Pa-MN
	for xen-devel@lists.xenproject.org; Tue, 24 Nov 2020 14:46:57 +0000
X-Inumbo-ID: 82b5fe2f-7825-457a-a989-d52150337348
Received: from mail.kernel.org (unknown [198.145.29.99])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 82b5fe2f-7825-457a-a989-d52150337348;
	Tue, 24 Nov 2020 14:46:57 +0000 (UTC)
Received: from embeddedor (187-162-31-110.static.axtel.net [187.162.31.110])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 296CF206F9;
	Tue, 24 Nov 2020 14:46:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1606229216;
	bh=3zQtrTTCw8twqJtP/1a4NB1MKrz6/NphiIiwgRncCiQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Nf940VeIUgpffOGETTY1L3G0QcIjfozBFvnFoqG8O328ZSxeeaAXcr0hOe3zQgRlG
	 fbix380mdFR2g9eZBg8DhbUZBvf1w7UYgoM6pwiYDzTHildmv27dPl4/uYYBPb4fgA
	 1gCiZGhi+wbnwk7bOx0yc8Qq/SRuVl9DTTdMTQVI=
Date: Tue, 24 Nov 2020 08:47:05 -0600
From: "Gustavo A. R. Silva" <gustavoars@kernel.org>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
	amd-gfx@lists.freedesktop.org, bridge@lists.linux-foundation.org,
	ceph-devel@vger.kernel.org, cluster-devel@redhat.com,
	coreteam@netfilter.org, devel@driverdev.osuosl.org,
	dm-devel@redhat.com, drbd-dev@lists.linbit.com,
	dri-devel@lists.freedesktop.org, GR-everest-linux-l2@marvell.com,
	GR-Linux-NIC-Dev@marvell.com, intel-gfx@lists.freedesktop.org,
	intel-wired-lan@lists.osuosl.org, keyrings@vger.kernel.org,
	linux1394-devel@lists.sourceforge.net, linux-acpi@vger.kernel.org,
	linux-afs@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-atm-general@lists.sourceforge.net,
	linux-block@vger.kernel.org, linux-can@vger.kernel.org,
	linux-cifs@vger.kernel.org, linux-crypto@vger.kernel.org,
	linux-decnet-user@lists.sourceforge.net, linux-ext4@vger.kernel.org,
	linux-fbdev@vger.kernel.org, linux-geode@lists.infradead.org,
	linux-gpio@vger.kernel.org, linux-hams@vger.kernel.org,
	linux-hwmon@vger.kernel.org, linux-i3c@lists.infradead.org,
	linux-ide@vger.kernel.org, linux-iio@vger.kernel.org,
	linux-input@vger.kernel.org, linux-integrity@vger.kernel.org,
	linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org,
	linux-mmc@vger.kernel.org, linux-mm@kvack.org,
	linux-mtd@lists.infradead.org, linux-nfs@vger.kernel.org,
	linux-rdma@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-scsi@vger.kernel.org, linux-sctp@vger.kernel.org,
	linux-security-module@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com, linux-usb@vger.kernel.org,
	linux-watchdog@vger.kernel.org, linux-wireless@vger.kernel.org,
	netdev@vger.kernel.org, netfilter-devel@vger.kernel.org,
	nouveau@lists.freedesktop.org, op-tee@lists.trustedfirmware.org,
	oss-drivers@netronome.com, patches@opensource.cirrus.com,
	rds-devel@oss.oracle.com, reiserfs-devel@vger.kernel.org,
	samba-technical@lists.samba.org, selinux@vger.kernel.org,
	target-devel@vger.kernel.org, tipc-discussion@lists.sourceforge.net,
	usb-storage@lists.one-eyed-alien.net,
	virtualization@lists.linux-foundation.org,
	wcn36xx@lists.infradead.org, x86@kernel.org,
	xen-devel@lists.xenproject.org, linux-hardening@vger.kernel.org,
	Nick Desaulniers <ndesaulniers@google.com>,
	Nathan Chancellor <natechancellor@gmail.com>,
	Miguel Ojeda <ojeda@kernel.org>, Joe Perches <joe@perches.com>,
	Kees Cook <keescook@chromium.org>
Subject: Re: [PATCH 000/141] Fix fall-through warnings for Clang
Message-ID: <20201124144705.GK16084@embeddedor>
References: <cover.1605896059.git.gustavoars@kernel.org>
 <20201123200345.GA38546@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201123200345.GA38546@nvidia.com>
User-Agent: Mutt/1.9.4 (2018-02-28)

On Mon, Nov 23, 2020 at 04:03:45PM -0400, Jason Gunthorpe wrote:
> On Fri, Nov 20, 2020 at 12:21:39PM -0600, Gustavo A. R. Silva wrote:
> 
> >   IB/hfi1: Fix fall-through warnings for Clang
> >   IB/mlx4: Fix fall-through warnings for Clang
> >   IB/qedr: Fix fall-through warnings for Clang
> >   RDMA/mlx5: Fix fall-through warnings for Clang
> 
> I picked these four to the rdma tree, thanks

Awesome. :)

Thank you, Jason.
--
Gustavo

