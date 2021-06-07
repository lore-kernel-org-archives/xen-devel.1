Return-Path: <SRS0=/Cwe=LB=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B876C4743C
	for <xen-devel@archiver.kernel.org>; Mon,  7 Jun 2021 06:41:59 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 39E3D611C0
	for <xen-devel@archiver.kernel.org>; Mon,  7 Jun 2021 06:41:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 39E3D611C0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.137682.255063 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lq8xK-0002UN-T9; Mon, 07 Jun 2021 06:41:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 137682.255063; Mon, 07 Jun 2021 06:41:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lq8xK-0002UG-Pk; Mon, 07 Jun 2021 06:41:50 +0000
Received: by outflank-mailman (input) for mailman id 137682;
 Mon, 07 Jun 2021 06:41:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ZuZ8=LB=lst.de=hch@srs-us1.protection.inumbo.net>)
 id 1lq8xK-0002UA-0O
 for xen-devel@lists.xenproject.org; Mon, 07 Jun 2021 06:41:50 +0000
Received: from verein.lst.de (unknown [213.95.11.211])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ecd07ed7-0a40-488f-8cce-fa67029ed8f0;
 Mon, 07 Jun 2021 06:41:47 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id C9F1667373; Mon,  7 Jun 2021 08:41:42 +0200 (CEST)
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
X-Inumbo-ID: ecd07ed7-0a40-488f-8cce-fa67029ed8f0
Date: Mon, 7 Jun 2021 08:41:42 +0200
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
Subject: Re: [RFC PATCH V3 01/11] x86/HV: Initialize GHCB page in Isolation
 VM
Message-ID: <20210607064142.GA24478@lst.de>
References: <20210530150628.2063957-1-ltykernel@gmail.com> <20210530150628.2063957-2-ltykernel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210530150628.2063957-2-ltykernel@gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Sun, May 30, 2021 at 11:06:18AM -0400, Tianyu Lan wrote:
> +	if (ms_hyperv.ghcb_base) {
> +		rdmsrl(MSR_AMD64_SEV_ES_GHCB, ghcb_gpa);
> +
> +		ghcb_va = ioremap_cache(ghcb_gpa, HV_HYP_PAGE_SIZE);
> +		if (!ghcb_va)
> +			return -ENOMEM;

Can you explain this a bit more?  We've very much deprecated
ioremap_cache in favor of memremap.  Why yo you need a __iomem address
here?  Why do we need the remap here at all?

Does the data structure at this address not have any types that we
could use a struct for?

> +
> +		rdmsrl(MSR_AMD64_SEV_ES_GHCB, ghcb_gpa);
> +		ghcb_va = ioremap_cache(ghcb_gpa, HV_HYP_PAGE_SIZE);
> +		if (!ghcb_va) {

This seems to duplicate the above code.

> +bool hv_isolation_type_snp(void)
> +{
> +	return static_branch_unlikely(&isolation_type_snp);
> +}
> +EXPORT_SYMBOL_GPL(hv_isolation_type_snp);

This probably wants a kerneldoc explaining when it should be used.

