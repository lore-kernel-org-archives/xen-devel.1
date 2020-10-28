Return-Path: <SRS0=61/H=ED=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0A5CC388F9
	for <xen-devel@archiver.kernel.org>; Wed, 28 Oct 2020 00:04:24 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5EEF62223C
	for <xen-devel@archiver.kernel.org>; Wed, 28 Oct 2020 00:04:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="tgTgnVIA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5EEF62223C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.13210.33776 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kXYwj-0000j7-1p; Wed, 28 Oct 2020 00:04:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 13210.33776; Wed, 28 Oct 2020 00:04:09 +0000
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
	id 1kXYwi-0000j0-VH; Wed, 28 Oct 2020 00:04:08 +0000
Received: by outflank-mailman (input) for mailman id 13210;
 Wed, 28 Oct 2020 00:04:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ghuf=ED=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1kXYwh-0000iv-6o
 for xen-devel@lists.xenproject.org; Wed, 28 Oct 2020 00:04:07 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bb000be8-4024-40ee-820e-b2bdd260ad63;
 Wed, 28 Oct 2020 00:04:06 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s (c-24-130-65-46.hsd1.ca.comcast.net
 [24.130.65.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3DF8C2223C;
 Wed, 28 Oct 2020 00:04:05 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=ghuf=ED=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
	id 1kXYwh-0000iv-6o
	for xen-devel@lists.xenproject.org; Wed, 28 Oct 2020 00:04:07 +0000
X-Inumbo-ID: bb000be8-4024-40ee-820e-b2bdd260ad63
Received: from mail.kernel.org (unknown [198.145.29.99])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id bb000be8-4024-40ee-820e-b2bdd260ad63;
	Wed, 28 Oct 2020 00:04:06 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s (c-24-130-65-46.hsd1.ca.comcast.net [24.130.65.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 3DF8C2223C;
	Wed, 28 Oct 2020 00:04:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1603843445;
	bh=7XeYwh4xtpo99whUtqEGN7GeyloO1dcUjaYCORgAGLo=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=tgTgnVIAnnWQHjbpco1BWPCqPUKnYDW+tdSDQ5y0Xx5kiShfzn/Hir8Gp25hz2Pkk
	 vGP6AhqANvuO9wXgFhrMxPfth+lUdizJbdJw/nhp9JWMKrErnzUqNDJXDjjS8HIhJs
	 tjFr4l1TiTloHrvlAfoIeSUPx+i0lF1yp7zqUMAU=
Date: Tue, 27 Oct 2020 17:04:04 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Rahul Singh <rahul.singh@arm.com>
cc: xen-devel@lists.xenproject.org, bertrand.marquis@arm.com, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, 
    Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, 
    Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Paul Durrant <paul@xen.org>, Kevin Tian <kevin.tian@intel.com>
Subject: Re: [PATCH v1 0/4] xen/arm: Make PCI passthrough code non-x86
 specific
In-Reply-To: <cover.1603731279.git.rahul.singh@arm.com>
Message-ID: <alpine.DEB.2.21.2010271702020.12247@sstabellini-ThinkPad-T480s>
References: <cover.1603731279.git.rahul.singh@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 26 Oct 2020, Rahul Singh wrote:
> This patch series is preparatory work to make PCI passthrough code non-x86
> specific.

Do you have a simple patch I could use to test the compilation on ARM?
Even just a hack to help me review the series?

Right now I can only test that the compilation on x86 is unbroken.

Thanks!

- Stefano


> Rahul Singh (4):
>   xen/ns16550: solve compilation error on ARM with CONFIG_HAS_PCI
>     enabled.
>   xen/pci: Introduce new CONFIG_HAS_PCI_ATS flag for PCI ATS
>     functionality.
>   xen/pci: Move x86 specific code to x86 directory.
>   xen/pci: solve compilation error when memory paging is not enabled.
> 
>  xen/arch/x86/Kconfig                     |  1 +
>  xen/drivers/char/Kconfig                 |  7 ++
>  xen/drivers/char/ns16550.c               | 32 ++++----
>  xen/drivers/passthrough/ats.h            | 24 ++++++
>  xen/drivers/passthrough/pci.c            | 79 +------------------
>  xen/drivers/passthrough/vtd/x86/Makefile |  2 +-
>  xen/drivers/passthrough/x86/Makefile     |  3 +-
>  xen/drivers/passthrough/x86/iommu.c      |  7 ++
>  xen/drivers/passthrough/x86/pci.c        | 97 ++++++++++++++++++++++++
>  xen/drivers/pci/Kconfig                  |  3 +
>  xen/include/xen/pci.h                    |  2 +
>  11 files changed, 164 insertions(+), 93 deletions(-)
>  create mode 100644 xen/drivers/passthrough/x86/pci.c
> 
> -- 
> 2.17.1
> 

