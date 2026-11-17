Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61772606A323
	for <xen-devel@archiver.kernel.org>; Tue, 17 Nov 2026 10:42:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=xenproject.org header.i=@xenproject.org header.a=rsa-sha256 header.s=20200302mail header.b=wuMBGTKe
Received: from list by lists.xenproject.org with outflank-mailman.1492145.1692844 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTGdT-0006rH-6S; Tue, 17 Nov 2026 10:41:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1492145.1692844; Tue, 17 Nov 2026 10:41:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTGdT-0006rA-2y; Tue, 17 Nov 2026 10:41:59 +0000
Received: by outflank-mailman (input) for mailman id 1492145;
 Tue, 17 Nov 2026 10:41:57 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger@xenproject.org>) id 1xTGdR-0006r4-9z
 for xen-devel@lists.xenproject.org; Tue, 17 Nov 2026 10:41:57 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.98.2)
 (envelope-from <roger@xenproject.org>) id 1xTGdQ-00000002t1Y-2pdi;
 Tue, 17 Nov 2026 10:41:57 +0000
Received: from 224.pool85-54-217.dynamic.orange.es ([85.54.217.224]
 helo=localhost) by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <roger@xenproject.org>) id 1xTGdQ-0000000AaKu-3VK9;
 Tue, 17 Nov 2026 10:41:56 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date;
	bh=g7JV1j2md7wnKpHOwYS34fB3RraXybBBlkusRO/+Iwg=; b=wuMBGTKevmXUv1oq+WwoB9kpfe
	DfSJtq/4LGhchnz+dzdM08IhQz5bVU2DFs9E8egE+aMrPA1C0ALD3yDYr6reLCtn9naISvtclWXrW
	nNelWr1nq8Xv8f9q0A3rnkhC0BH2z5OvVuCEIfeJuut5cfmbFka43xiyjCuHGu+03DyY=;
Date: Tue, 17 Nov 2026 11:41:54 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger@xenproject.org>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: Re: [PATCH 4/4] x86: tighten PCI-related locking assertions
Message-ID: <avwvcs256XUGxVOc@Mac.lan>
References: <37c9675b-dc2b-4c57-b5a8-79075836311b@suse.com>
 <5d5bc3c9-79ef-4a80-866b-8c374c4021e5@suse.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5d5bc3c9-79ef-4a80-866b-8c374c4021e5@suse.com>
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Oct 29, 2026 at 03:25:04PM +0100, Jan Beulich wrote:
> With recent changes the .pi_update_irte() hook as well as
> {,un}map_domain_pirq() and allocate_and_map_msi_pirq() won't be called
> anymore with the global PCI lock held. Convert the assertions to check for
> just the domain's PCI lock.
> 
> With that the somewhat ugly ASSERT_PDEV_LIST_IS_READ_LOCKED() isn't used
> outside of msi.c anymore, so move the #define there.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Roger Pau Monné <roger@xenproject.org>

I agree about keeping a single ASSERT_PDEV_LIST_IS_READ_LOCKED()
definitions and dropping the unneeded NDEBUG preprocessor conditional.

> ---
> It being just two use sites which remain, we may want to do away with
> ASSERT_PDEV_LIST_IS_READ_LOCKED() altogether. Thoughts?

IIRC the reason for having this expression was so it could be used
everywhere to ensure the domain pdev list was somehow locked (either
by pcidevs lock or the per-domain rwlock).

If we now have fine grained control over the locking it possibly makes
no sense to keep it.

> (It also isn't
> qite clear to me why its #define(s) sit inside an #ifdef: The expression
> used ought to be fine to use also in release builds, as it looks.)

Hm, I'm not sure.  It looks like the debug expression could be used in
non-debug builds.

> --- a/xen/arch/x86/hvm/vmx/vmx.c
> +++ b/xen/arch/x86/hvm/vmx/vmx.c
> @@ -419,7 +419,7 @@ static int cf_check vmx_pi_update_irte(c
>  
>      spin_unlock_irq(&desc->lock);
>  
> -    ASSERT_PDEV_LIST_IS_READ_LOCKED(msi_desc->dev->domain);
> +    ASSERT(rw_is_locked(&msi_desc->dev->domain->pci_lock));
>  
>      rc = iommu_update_ire_from_msi(msi_desc, &msg);
>      if ( rc > 0 )
> --- a/xen/arch/x86/irq.c
> +++ b/xen/arch/x86/irq.c
> @@ -2250,7 +2250,7 @@ int map_domain_pirq(
>          struct pci_dev *pdev;
>          unsigned int nr = 0;
>  
> -        ASSERT_PDEV_LIST_IS_READ_LOCKED(d);
> +        ASSERT(rw_is_locked(&d->pci_lock));
>  
>          ret = -ENODEV;
>          if ( !cpu_has_apic )
> @@ -2410,7 +2410,7 @@ int unmap_domain_pirq(struct domain *d,
>      if ( (pirq < 0) || (pirq >= d->nr_pirqs) )
>          return -EINVAL;
>  
> -    ASSERT_PDEV_LIST_IS_READ_LOCKED(d);
> +    ASSERT(rw_is_locked(&d->pci_lock));
>      ASSERT(rw_is_write_locked(&d->event_lock));
>  
>      info = pirq_info(d, pirq);
> @@ -3021,7 +3021,7 @@ int allocate_and_map_msi_pirq(struct dom
>  {
>      int irq = -1, pirq, ret;
>  
> -    ASSERT_PDEV_LIST_IS_READ_LOCKED(d);
> +    ASSERT(rw_is_locked(&d->pci_lock));
>  
>      switch ( type )
>      {
> --- a/xen/arch/x86/msi.c
> +++ b/xen/arch/x86/msi.c
> @@ -737,6 +737,19 @@ static uint64_t read_pci_mem_bar(const s
>      return (addr & PCI_BASE_ADDRESS_MEM_MASK) + disp;
>  }
>  
> +#ifndef NDEBUG
> +/*
> + * Check to ensure there will be no changes to the entries in d->pdev_list (but
> + * not the contents of each entry).
> + * This check is not suitable for protecting other state or critical regions.
> + */
> +#define ASSERT_PDEV_LIST_IS_READ_LOCKED(d)                               \
> +        /* NB: d may be evaluated multiple times, or not at all */       \
> +        ASSERT(pcidevs_locked() || ((d) && rw_is_locked(&(d)->pci_lock)))
> +#else
> +#define ASSERT_PDEV_LIST_IS_READ_LOCKED(d) ((void)(d))
> +#endif

Maybe while moving it you can leave just the !NDEBUG variant?Q

Thanks, Roger.

