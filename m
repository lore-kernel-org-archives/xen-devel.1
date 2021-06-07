Return-Path: <SRS0=/Cwe=LB=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03ABCC4743F
	for <xen-devel@archiver.kernel.org>; Mon,  7 Jun 2021 06:50:25 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C85C3611C2
	for <xen-devel@archiver.kernel.org>; Mon,  7 Jun 2021 06:50:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C85C3611C2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.137712.255110 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lq95S-0005nw-HS; Mon, 07 Jun 2021 06:50:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 137712.255110; Mon, 07 Jun 2021 06:50:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lq95S-0005np-Dv; Mon, 07 Jun 2021 06:50:14 +0000
Received: by outflank-mailman (input) for mailman id 137712;
 Mon, 07 Jun 2021 06:50:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ZuZ8=LB=lst.de=hch@srs-us1.protection.inumbo.net>)
 id 1lq95R-0005nj-Dg
 for xen-devel@lists.xenproject.org; Mon, 07 Jun 2021 06:50:13 +0000
Received: from verein.lst.de (unknown [213.95.11.211])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id dfdb5c52-ebc5-4c3e-a33b-006801863ac4;
 Mon, 07 Jun 2021 06:50:12 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 6BD7A68AFE; Mon,  7 Jun 2021 08:50:07 +0200 (CEST)
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
X-Inumbo-ID: dfdb5c52-ebc5-4c3e-a33b-006801863ac4
Date: Mon, 7 Jun 2021 08:50:07 +0200
From: Christoph Hellwig <hch@lst.de>
To: Tianyu Lan <ltykernel@gmail.com>
Cc: kys@microsoft.com, haiyangz@microsoft.com, sthemmin@microsoft.com,
	wei.liu@kernel.org, decui@microsoft.com, tglx@linutronix.de,
	mingo@redhat.com, bp@alien8.de, x86@kernel.org, hpa@zytor.com,
	arnd@arndb.de, dave.hansen@linux.intel.com, luto@kernel.org,
	peterz@infradead.org, akpm@linux-foundation.org,
	kirill.shutemov@linux.intel.com, rppt@kernel.org,
	hannes@cmpxchg.org, cai@lca.pw, krish.sadhukhan@oracle.com,
	saravanand@fb.com, Tianyu.Lan@microsoft.com, konrad.wilk@oracle.com,
	hch@lst.de, m.szyprowski@samsung.com, robin.murphy@arm.com,
	boris.ostrovsky@oracle.com, jgross@suse.com, sstabellini@kernel.org,
	joro@8bytes.org, will@kernel.org, xen-devel@lists.xenproject.org,
	davem@davemloft.net, kuba@kernel.org, jejb@linux.ibm.com,
	martin.petersen@oracle.com, iommu@lists.linux-foundation.org,
	linux-arch@vger.kernel.org, linux-hyperv@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org,
	netdev@vger.kernel.org, vkuznets@redhat.com,
	thomas.lendacky@amd.com, brijesh.singh@amd.com,
	sunilmut@microsoft.com
Subject: Re: [RFC PATCH V3 10/11] HV/Netvsc: Add Isolation VM support for
 netvsc driver
Message-ID: <20210607065007.GE24478@lst.de>
References: <20210530150628.2063957-1-ltykernel@gmail.com> <20210530150628.2063957-11-ltykernel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210530150628.2063957-11-ltykernel@gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Sun, May 30, 2021 at 11:06:27AM -0400, Tianyu Lan wrote:
> +	if (hv_isolation_type_snp()) {
> +		pfns = kcalloc(buf_size / HV_HYP_PAGE_SIZE, sizeof(unsigned long),
> +			       GFP_KERNEL);
> +		for (i = 0; i < buf_size / HV_HYP_PAGE_SIZE; i++)
> +			pfns[i] = virt_to_hvpfn(net_device->recv_buf + i * HV_HYP_PAGE_SIZE) +
> +				(ms_hyperv.shared_gpa_boundary >> HV_HYP_PAGE_SHIFT);
> +
> +		vaddr = vmap_pfn(pfns, buf_size / HV_HYP_PAGE_SIZE, PAGE_KERNEL_IO);
> +		kfree(pfns);
> +		if (!vaddr)
> +			goto cleanup;
> +		net_device->recv_original_buf = net_device->recv_buf;
> +		net_device->recv_buf = vaddr;
> +	}

This probably wnats a helper to make the thing more readable.  But who
came up with this fucked up communication protocol where the host needs
to map random pfns into a contigous range?  Sometime I really have to
wonder what crack the hyper-v people take when comparing this to the
relatively sane approach others take.

> +	for (i = 0; i < page_count; i++)
> +		dma_unmap_single(&hv_dev->device, packet->dma_range[i].dma,
> +				 packet->dma_range[i].mapping_size,
> +				 DMA_TO_DEVICE);
> +
> +	kfree(packet->dma_range);

Any reason this isn't simply using a struct scatterlist?

> +	for (i = 0; i < page_count; i++) {
> +		char *src = phys_to_virt((pb[i].pfn << HV_HYP_PAGE_SHIFT)
> +					 + pb[i].offset);
> +		u32 len = pb[i].len;
> +
> +		dma = dma_map_single(&hv_dev->device, src, len,
> +				     DMA_TO_DEVICE);

dma_map_single can only be used on page baked memory, and if this is
using page backed memory you wouldn't need to do thee phys_to_virt
tricks.  Can someone explain the mess here in more detail?

>  	struct rndis_device *dev = nvdev->extension;
>  	struct rndis_request *request = NULL;
> +	struct hv_device *hv_dev = ((struct net_device_context *)
> +			netdev_priv(ndev))->device_ctx;

Why not use a net_device_context local variable instead of this cast
galore?

