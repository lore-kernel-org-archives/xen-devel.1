Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED7F1CA6007
	for <xen-devel@archiver.kernel.org>; Thu,  8 Oct 2026 10:17:06 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1443133.1660524 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xElBK-00017q-Rx; Thu, 08 Oct 2026 10:16:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1443133.1660524; Thu, 08 Oct 2026 10:16:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xElBK-00017j-OL; Thu, 08 Oct 2026 10:16:58 +0000
Received: by outflank-mailman (input) for mailman id 1443133;
 Thu, 08 Oct 2026 10:16:57 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <m.szyprowski@samsung.com>) id 1xElBI-00017U-Sl
 for xen-devel@lists.xenproject.org; Thu, 08 Oct 2026 10:16:57 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xElBH-00Gcr5-Nr
 for xen-devel@lists.xenproject.org; Thu, 08 Oct 2026 12:16:55 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <m.szyprowski@samsung.com>)
 id 6ac76d79-2eae-0a2a0a5409dd-0a2a450cc41e-44
 for <xen-devel@lists.xenproject.org>; Thu, 08 Oct 2026 12:16:55 +0200
Received: from [210.118.77.11] (helo=mailout1.w1.samsung.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <m.szyprowski@samsung.com>)
 id 6ac76d95-f479-0a2a450c0019-d2764d0b8ddb-3
 for <xen-devel@lists.xenproject.org>; Thu, 08 Oct 2026 12:16:54 +0200
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20261008101653euoutp0199d22d6fe9bd4e2d748dfbbf669835df~chnrJlrZB3263932639euoutp01W
 for <xen-devel@lists.xenproject.org>; Thu,  8 Oct 2026 10:16:53 +0000 (GMT)
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20261008101650eucas1p2fa4adb7e7ece5173cba39c726300b64b~chnoAgJC60145601456eucas1p2Q;
 Thu,  8 Oct 2026 10:16:50 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20261008101649eusmtip2ee55bcf0281241017f5f2c9511114ef9~chnnP_ko_2421124211eusmtip2t;
 Thu,  8 Oct 2026 10:16:49 +0000 (GMT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=mail20170921 header.d=samsung.com header.i="@samsung.com" header.h="Date:Subject:To:Cc:From:In-Reply-To:References"
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20261008101653euoutp0199d22d6fe9bd4e2d748dfbbf669835df~chnrJlrZB3263932639euoutp01W
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1791454613;
	bh=mO4q4g0VGAokDsTnWCtbTL+H8XVcJzLn5OxmzhD0cdI=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=RyO+WNwUSfa24tfqEVn30FJVpxPoHsWDhqUoSf4SU6BUSj7n+E4ksCk0UftGrFtMJ
	 epit+ff7Tyb2DfzpNjpAsUNl9hVBaVijdfNpwW+7ADftqkOShT6EwtJQATn+uOo/eb
	 zfvVoWbPNEj4cEqDsviDE4pEITEe5ASd/J1DZfbY=
Message-ID: <04643c93-7d1b-49f6-870e-15c4c7306a05@samsung.com>
Date: Thu, 8 Oct 2026 12:16:48 +0200
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH] swiotlb: fix default_swiotlb_limit() for non-growable
 default pool
To: iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
	xen-devel@lists.xenproject.org
Cc: Robin Murphy <robin.murphy@arm.com>, Christoph Hellwig <hch@lst.de>,
	Petr Tesarik <petr.tesarik.ext@huawei.com>, Andreas Greve
	<andreas.greve@a-greve.de>, James Dingwall <james@dingwall.me.uk>
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20261005070518.1590097-1-m.szyprowski@samsung.com>
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20261008101650eucas1p2fa4adb7e7ece5173cba39c726300b64b
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20261005070528eucas1p18d16ec6ecc4e879d0adc66538122132c
X-EPHeader: CA
X-CMS-RootMailID: 20261005070528eucas1p18d16ec6ecc4e879d0adc66538122132c
References: <CGME20261005070528eucas1p18d16ec6ecc4e879d0adc66538122132c@eucas1p1.samsung.com>
	<20261005070518.1590097-1-m.szyprowski@samsung.com>
X-purgate-ID: tlsNG-d25034/1791454614-038D5A5B-19A7FCBD/0/0
X-purgate-type: clean
X-purgate-size: 2354

On 05.10.2026 09:05, Marek Szyprowski wrote:
> Commit ad96ce3252db ("swiotlb: determine potential physical address
> limit") changed default_swiotlb_limit() to return the maximum physical
> address that could ever be used by dynamically allocated pools, so that
> the value stays constant when CONFIG_SWIOTLB_DYNAMIC=y. However,
> io_tlb_default_mem.phys_limit is returned even when the default pool
> cannot grow, e.g. when swiotlb_init_remap() is called with a remap
> callback.
>
> This breaks Xen dom0 on x86: pci_xen_swiotlb_init() passes SWIOTLB_ANY
> and xen_swiotlb_fixup(), so phys_limit is set to the top of dom0 memory,
> although xen_swiotlb_fixup() makes the default pool below the 32-bit
> boundary. xen_swiotlb_dma_supported() then rejects 32-bit DMA masks,
> even though the bounce buffer is perfectly usable by such devices.
>
> Return phys_limit only if the default pool can actually grow, otherwise
> report the real end of the default pool, like in the
> !CONFIG_SWIOTLB_DYNAMIC case.
>
> Reported-by: Andreas Greve <andreas.greve@a-greve.de>
> Reported-by: James Dingwall <james@dingwall.me.uk>
> Fixes: ad96ce3252db ("swiotlb: determine potential physical address limit")
> Closes: https://lore.kernel.org/xen-devel/f74668db-52fd-4575-8372-7bfdf10d62ac@a-greve.de/
> Cc: stable@vger.kernel.org
> Assisted-by: Claude Opus 5.5 (1M context) <noreply@anthropic.com>
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>

Applied to dma-mapping-fixes with additional "Tested-by: James Dingwall"
tag, which I've received on priv.


> ---
>  kernel/dma/swiotlb.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
> index aa2f1c4588b9..5edea93ec635 100644
> --- a/kernel/dma/swiotlb.c
> +++ b/kernel/dma/swiotlb.c
> @@ -1844,10 +1844,10 @@ phys_addr_t default_swiotlb_base(void)
>  phys_addr_t default_swiotlb_limit(void)
>  {
>  #ifdef CONFIG_SWIOTLB_DYNAMIC
> -	return io_tlb_default_mem.phys_limit;
> -#else
> -	return io_tlb_default_mem.defpool.end - 1;
> +	if (io_tlb_default_mem.can_grow)
> +		return io_tlb_default_mem.phys_limit;
>  #endif
> +	return io_tlb_default_mem.defpool.end - 1;
>  }
>  
>  #ifdef CONFIG_DEBUG_FS

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland


