Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0D3BFF5139
	for <xen-devel@archiver.kernel.org>; Tue,  7 Apr 2026 20:32:16 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1275340.1561197 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAD5i-0007mx-Su; Tue, 07 Apr 2026 20:32:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1275340.1561197; Tue, 07 Apr 2026 20:32:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAD5i-0007mq-QA; Tue, 07 Apr 2026 20:32:06 +0000
Received: by outflank-mailman (input) for mailman id 1275340;
 Tue, 07 Apr 2026 20:32:04 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <sstabellini@kernel.org>) id 1wAD5g-0007mk-Pn
 for xen-devel@lists.xenproject.org; Tue, 07 Apr 2026 20:32:04 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wAD5g-00HMxG-5d
 for xen-devel@lists.xenproject.org; Tue, 07 Apr 2026 22:32:04 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <sstabellini@kernel.org>)
 id 69d569b9-bab6-0a2a0a5309dd-0a2a450ca290-36
 for <xen-devel@lists.xenproject.org>; Tue, 07 Apr 2026 22:32:04 +0200
Received: from [172.105.4.254] (helo=tor.source.kernel.org)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <sstabellini@kernel.org>)
 id 69d569c3-f40c-0a2a450c0019-ac6904feb640-3
 for <xen-devel@lists.xenproject.org>; Tue, 07 Apr 2026 22:32:03 +0200
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id B7158600CB;
 Tue,  7 Apr 2026 20:32:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9576EC116C6;
 Tue,  7 Apr 2026 20:32:01 +0000 (UTC)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=k20201202 header.d=kernel.org header.i="@kernel.org" header.h="Date:From:To:cc:Subject:In-Reply-To:References"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775593922;
	bh=5JPbz7ZvJhy4OvxwPpdeqCLBT41FR4vzxedbyx+6XyU=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=bn1ZOO27Oom4tJRCmprrVSJY0kjA7o6sP76x8hUyPzS1bD9QozqPwivl+lLikx+rs
	 wRSZfwqB4oUsA7y9FW/1NdjnKBfpqgJr18BqFXAVmGkF1nSd4RwqRUc9AZDmCF/yDc
	 lPOFJSSTPwObofNpGCT6PVY4XuSoXv6eE387KyVVWm/uxEnSsCIdwLEKjcGMNKLaF8
	 VC4ECbZ3BFZXNhmrAD+UxIAmXmFjxDHAE7HWNWSb6o9AG/+Nm64VT8PhCmxu2iwP1J
	 BYXvhPcHfAMkvC1dFlWD/uGNTujpuG+ySzeSH+8iT9nZf5VW/XADn7xicik+Xwl3+K
	 4QPTQL0dnlLZw==
Date: Tue, 7 Apr 2026 13:32:00 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Michal Orzel <michal.orzel@amd.com>
cc: xen-devel@lists.xenproject.org, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH 2/2] iommu/arm: ipmmu-vmsa: Fix variable shadowing
In-Reply-To: <20260407103434.90838-3-michal.orzel@amd.com>
Message-ID: <alpine.DEB.2.22.394.2604071331290.2873990@ubuntu-linux-20-04-desktop>
References: <20260407103434.90838-1-michal.orzel@amd.com> <20260407103434.90838-3-michal.orzel@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-purgate-ID: tlsNG-d25034/1775593924-8055FA3D-8A72AB62/0/0
X-purgate-type: clean
X-purgate-size: 1864

On Tue, 7 Apr 2026, Michal Orzel wrote:
> Rename 'pdev' to 'pci_dev' in the dev_print_pci() macro to avoid
> shadowing local 'pdev' variables at call sites.
> 
> Remove the unused 'ret' declaration from ipmmu_assign_device() where
> the function-scope 'ret' is sufficient.
> 
> This fixes MISRA C R5.3.
> 
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  xen/drivers/passthrough/arm/ipmmu-vmsa.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/xen/drivers/passthrough/arm/ipmmu-vmsa.c b/xen/drivers/passthrough/arm/ipmmu-vmsa.c
> index ea9fa9ddf3ce..fa9ab9cb1330 100644
> --- a/xen/drivers/passthrough/arm/ipmmu-vmsa.c
> +++ b/xen/drivers/passthrough/arm/ipmmu-vmsa.c
> @@ -65,8 +65,8 @@
>          printk(lvl "ipmmu: %s: " fmt, dev_name((dev)), ## __VA_ARGS__);  \
>      else                                                                \
>      {                                                                   \
> -        struct pci_dev *pdev = dev_to_pci((dev));                       \
> -        printk(lvl "ipmmu: %pp: " fmt, &pdev->sbdf, ## __VA_ARGS__);     \
> +        struct pci_dev *pci_dev = dev_to_pci((dev));                       \
> +        printk(lvl "ipmmu: %pp: " fmt, &pci_dev->sbdf, ## __VA_ARGS__);     \
>      }                                                                   \
>  })
>  #endif
> @@ -1171,8 +1171,6 @@ static int ipmmu_assign_device(struct domain *d, u8 devfn, struct device *dev,
>          /* dom_io is used as a sentinel for quarantined devices */
>          if ( d == dom_io )
>          {
> -            int ret;
> -
>              /*
>               * Try to de-assign: do not return error if it was already
>               * de-assigned.
> -- 
> 2.43.0
> 

