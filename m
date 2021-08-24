Return-Path: <SRS0=P/U6=NP=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C98EFC4320A
	for <xen-devel@archiver.kernel.org>; Tue, 24 Aug 2021 14:26:13 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 82AE161163
	for <xen-devel@archiver.kernel.org>; Tue, 24 Aug 2021 14:26:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 82AE161163
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.171502.312957 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIXNN-0003is-Nc; Tue, 24 Aug 2021 14:26:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 171502.312957; Tue, 24 Aug 2021 14:26:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIXNN-0003i1-Jk; Tue, 24 Aug 2021 14:26:05 +0000
Received: by outflank-mailman (input) for mailman id 171502;
 Tue, 24 Aug 2021 14:26:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0IqF=NP=gmail.com=groeck7@srs-us1.protection.inumbo.net>)
 id 1mIXNM-0003f3-K6
 for xen-devel@lists.xenproject.org; Tue, 24 Aug 2021 14:26:04 +0000
Received: from mail-ot1-x32d.google.com (unknown [2607:f8b0:4864:20::32d])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 813e0be0-0e3a-4ff3-9168-e1e79698eff2;
 Tue, 24 Aug 2021 14:26:03 +0000 (UTC)
Received: by mail-ot1-x32d.google.com with SMTP id
 v33-20020a0568300921b0290517cd06302dso46480809ott.13
 for <xen-devel@lists.xenproject.org>; Tue, 24 Aug 2021 07:26:03 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 w23sm4515362otk.56.2021.08.24.07.26.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Aug 2021 07:26:02 -0700 (PDT)
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
X-Inumbo-ID: 813e0be0-0e3a-4ff3-9168-e1e79698eff2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=cLmu7zgJaXKzK4Rf3xZy8rbXQ8G9iiiCS2AqbbVSdr4=;
        b=W/vnTArXnkUTeAWPhVsCsNx9G1AaqqjMh7JGGCeKMkNnaOWP3sAbf+15/nLoCNmR3g
         q5YdGS8A1cXpAtJlYg19EzxhKY4ftiJkULVtdpcPrc3JdAsQuBkyHELZ+nm35chlenyd
         B1EUk7sT/qRPK4Ufw9SGcQJoAGqm8fBuCmyUjLn+ofRgVfuPflWOJHcCCZEENzbQUeyQ
         VmavwAVWpqeeI9XEBe9u66mgOWxsXHJm3RTYGIcz6konO25IcoN22AqYojFn8mbqHxKg
         qRzCfRvKs4A+5DaC8fRnZWJa7UOCRmoYWPgWVuJeEHetkAAVaEkEKj7Ut9tMesrOQeKz
         uFVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=cLmu7zgJaXKzK4Rf3xZy8rbXQ8G9iiiCS2AqbbVSdr4=;
        b=CXA3YslSPy9sFH3LISTdltwjeeSpbFVk00MPHvt+euLEq+cSu8NYP12NDbU7+ZJwby
         e9utrsyKPHP2MLx3XDceWOO3gXudGi0sF01r1/hVNcYo9sl7/pSzx55E19Lt+EiopDrx
         QgsVuEyFokkl4LK9RsYY+74/JxM+HMOjWmF1s1JDlnW12X1rKOgF99JHlHQf+PvHeqcJ
         1q7fe6wCgcewdZmLLOfo4T7LI3qdDEZ67pR9PIjgiyfbbYHAWlaFi/VMYEsnA5w+9Vf9
         2jTEarlJtwVCSdcnRQgNf+aWh4opaXNUMW3CQ7OWWZFEFO3Dv34xUz0DGJEDTXrgot/m
         xfOw==
X-Gm-Message-State: AOAM530/nE2SM/1ElrEaPq6BbpOLClOxLXiqA7A5Kqz7yti3eIFKQUOG
	86Yjg9Sgb+EWA5lO58pk8OU=
X-Google-Smtp-Source: ABdhPJwwcoIM6BcsOG2f+J3p/MRlA0Dk0tp13V1qbyu4iB7WMMjh+hei/xpqfoPCtwiA6Z7Inf6E6w==
X-Received: by 2002:a54:4513:: with SMTP id l19mr3045512oil.143.1629815163193;
        Tue, 24 Aug 2021 07:26:03 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 24 Aug 2021 07:26:01 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Claire Chang <tientzu@chromium.org>
Cc: Rob Herring <robh+dt@kernel.org>, mpe@ellerman.id.au,
	Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
	Frank Rowand <frowand.list@gmail.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	boris.ostrovsky@oracle.com, jgross@suse.com,
	Christoph Hellwig <hch@lst.de>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	benh@kernel.crashing.org, paulus@samba.org,
	"list@263.net:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
	sstabellini@kernel.org, Robin Murphy <robin.murphy@arm.com>,
	grant.likely@arm.com, xypron.glpk@gmx.de,
	Thierry Reding <treding@nvidia.com>, mingo@kernel.org,
	bauerman@linux.ibm.com, peterz@infradead.org,
	Greg KH <gregkh@linuxfoundation.org>,
	Saravana Kannan <saravanak@google.com>,
	"Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
	heikki.krogerus@linux.intel.com,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Dan Williams <dan.j.williams@intel.com>,
	Bartosz Golaszewski <bgolaszewski@baylibre.com>,
	linux-devicetree <devicetree@vger.kernel.org>,
	lkml <linux-kernel@vger.kernel.org>, linuxppc-dev@lists.ozlabs.org,
	xen-devel@lists.xenproject.org,
	Nicolas Boichat <drinkcat@chromium.org>,
	Jim Quinlan <james.quinlan@broadcom.com>, tfiga@chromium.org,
	bskeggs@redhat.com, bhelgaas@google.com, chris@chris-wilson.co.uk,
	daniel@ffwll.ch, airlied@linux.ie, dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org, jani.nikula@linux.intel.com,
	jxgao@google.com, joonas.lahtinen@linux.intel.com,
	linux-pci@vger.kernel.org, maarten.lankhorst@linux.intel.com,
	matthew.auld@intel.com, rodrigo.vivi@intel.com,
	thomas.hellstrom@linux.intel.com, thomas.lendacky@amd.com,
	quic_qiancai@quicinc.com
Subject: Re: [PATCH v15 10/12] swiotlb: Add restricted DMA pool initialization
Message-ID: <20210824142601.GA3393158@roeck-us.net>
References: <20210624155526.2775863-1-tientzu@chromium.org>
 <20210624155526.2775863-11-tientzu@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210624155526.2775863-11-tientzu@chromium.org>

Hi Claire,

On Thu, Jun 24, 2021 at 11:55:24PM +0800, Claire Chang wrote:
> Add the initialization function to create restricted DMA pools from
> matching reserved-memory nodes.
> 
> Regardless of swiotlb setting, the restricted DMA pool is preferred if
> available.
> 
> The restricted DMA pools provide a basic level of protection against the
> DMA overwriting buffer contents at unexpected times. However, to protect
> against general data leakage and system memory corruption, the system
> needs to provide a way to lock down the memory access, e.g., MPU.
> 
> Signed-off-by: Claire Chang <tientzu@chromium.org>
> Reviewed-by: Christoph Hellwig <hch@lst.de>
> Tested-by: Stefano Stabellini <sstabellini@kernel.org>
> Tested-by: Will Deacon <will@kernel.org>
> ---
>  include/linux/swiotlb.h |  3 +-
>  kernel/dma/Kconfig      | 14 ++++++++
>  kernel/dma/swiotlb.c    | 76 +++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 92 insertions(+), 1 deletion(-)
> 
> diff --git a/include/linux/swiotlb.h b/include/linux/swiotlb.h
> index 3b9454d1e498..39284ff2a6cd 100644
> --- a/include/linux/swiotlb.h
> +++ b/include/linux/swiotlb.h
> @@ -73,7 +73,8 @@ extern enum swiotlb_force swiotlb_force;
>   *		range check to see if the memory was in fact allocated by this
>   *		API.
>   * @nslabs:	The number of IO TLB blocks (in groups of 64) between @start and
> - *		@end. This is command line adjustable via setup_io_tlb_npages.
> + *		@end. For default swiotlb, this is command line adjustable via
> + *		setup_io_tlb_npages.
>   * @used:	The number of used IO TLB block.
>   * @list:	The free list describing the number of free entries available
>   *		from each index.
> diff --git a/kernel/dma/Kconfig b/kernel/dma/Kconfig
> index 77b405508743..3e961dc39634 100644
> --- a/kernel/dma/Kconfig
> +++ b/kernel/dma/Kconfig
> @@ -80,6 +80,20 @@ config SWIOTLB
>  	bool
>  	select NEED_DMA_MAP_STATE
>  
> +config DMA_RESTRICTED_POOL
> +	bool "DMA Restricted Pool"
> +	depends on OF && OF_RESERVED_MEM
> +	select SWIOTLB

This makes SWIOTLB user configurable, which in turn results in

mips64-linux-ld: arch/mips/kernel/setup.o: in function `arch_mem_init':
setup.c:(.init.text+0x19c8): undefined reference to `plat_swiotlb_setup'
make[1]: *** [Makefile:1280: vmlinux] Error 1

when building mips:allmodconfig.

Should this possibly be "depends on SWIOTLB" ?

Thanks,
Guenter

