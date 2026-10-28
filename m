Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21D31606A31C
	for <xen-devel@archiver.kernel.org>; Wed, 28 Oct 2026 14:33:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=xenproject.org header.i=@xenproject.org header.a=rsa-sha256 header.s=20200302mail header.b=uKz1fMBg
Received: from list by lists.xenproject.org with outflank-mailman.1463366.1674254 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xM4iP-0007Oq-Q2; Wed, 28 Oct 2026 14:33:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1463366.1674254; Wed, 28 Oct 2026 14:33:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xM4iP-0007Oj-N4; Wed, 28 Oct 2026 14:33:21 +0000
Received: by outflank-mailman (input) for mailman id 1463366;
 Wed, 28 Oct 2026 14:33:20 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger@xenproject.org>) id 1xM4iO-0007Od-DG
 for xen-devel@lists.xenproject.org; Wed, 28 Oct 2026 14:33:20 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.98.2)
 (envelope-from <roger@xenproject.org>) id 1xM4iO-00000000f29-11PA;
 Wed, 28 Oct 2026 14:33:20 +0000
Received: from 224.pool85-54-217.dynamic.orange.es ([85.54.217.224]
 helo=localhost) by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <roger@xenproject.org>) id 1xM4iN-000000079qK-2ols;
 Wed, 28 Oct 2026 14:33:19 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date;
	bh=M0J2osm8lTrtdywm+8LmBt91vfub2jaGrIxOZbJgrM0=; b=uKz1fMBgG92QNHv5rZTDvjpgWo
	FgFaJY8M8qIapHEQVEsrb1RiUmHzBf9yBDZmMEgkJ11zlG0621kCjBSaXVj6FeyMvpfFkLs6yP/Ai
	aeeE7YBy8ACIzMDXGKp0b0wtQG031AXb6qi4+wh7aotwxIlUfGogva3dRrShL+7Vk4ek=;
Date: Wed, 28 Oct 2026 15:33:13 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger@xenproject.org>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	Julian Vetter <julian.vetter@vates.tech>
Subject: Re: [PATCH v2 1/5] x86/pass-through: alter locking around
 pt_irq_{create,destroy}_bind()
Message-ID: <auIHqfrpdFnmgoMq@Mac.lan>
References: <e34484a9-03f8-40f7-8627-7d5e668dbd63@suse.com>
 <e3f82d25-42b1-467b-93b7-902bf6c1bf15@suse.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <e3f82d25-42b1-467b-93b7-902bf6c1bf15@suse.com>
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Sep 30, 2026 at 01:42:29PM +0200, Jan Beulich wrote:
> The questionable use of pcidevs_lock() there was discussed more than once.
> It really is pointless: The functions synchronize primarily via the per-
> domain event lock. They also may already be called with the global PCI
> devices lock not held: See hvm/vmsi.c:vpci_msi_update(),
> hvm/vmsi.c:vpci_msi_arch_update(), and hvm/vmsi.c:vpci_msi_disable().
> 
> It's merely msixtbl_pt_{,un}register() which require the global or per-
> domain PCI lock held. Switch to using the latter, which is also sufficient
> to acquire in read mode. While strictly speaking this is needed only for
> PT_IRQ_TYPE_MSI, keep it being unconditional. In vioapic_hwdom_map_gsi()
> also unlock earlier.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> v2: Replace locking rather than dropping it altogether.
> 
> --- a/xen/arch/x86/domctl.c
> +++ b/xen/arch/x86/domctl.c
> @@ -636,9 +636,9 @@ long arch_do_domctl(
>              ret = -EPERM;
>          else if ( is_iommu_enabled(d) )
>          {
> -            pcidevs_lock();
> +            read_lock(&d->pci_lock);
>              ret = pt_irq_create_bind(d, bind);
> -            pcidevs_unlock();
> +            read_unlock(&d->pci_lock);
>  
>              if ( ret < 0 )
>                  printk(XENLOG_G_ERR "pt_irq_create_bind failed (%ld) for %pd\n",
> @@ -670,9 +670,9 @@ long arch_do_domctl(
>              ret = -EPERM;
>          else if ( is_iommu_enabled(d) )
>          {
> -            pcidevs_lock();
> +            read_lock(&d->pci_lock);
>              ret = pt_irq_destroy_bind(d, bind);
> -            pcidevs_unlock();
> +            read_unlock(&d->pci_lock);
>  
>              if ( ret < 0 )
>                  printk(XENLOG_G_ERR "pt_irq_destroy_bind failed (%ld) for %pd\n",
> --- a/xen/arch/x86/hvm/vioapic.c
> +++ b/xen/arch/x86/hvm/vioapic.c
> @@ -197,8 +197,9 @@ static int vioapic_hwdom_map_gsi(unsigne
>          return ret;
>      }
>  
> -    pcidevs_lock();
> +    read_lock(&currd->pci_lock);
>      ret = pt_irq_create_bind(currd, &pt_irq_bind);
> +    read_unlock(&currd->pci_lock);

I think you need to extend the ->pci_lock'ed region so it also covers
unmap_domain_pirq(), otherwise the ASSERT_PDEV_LIST_IS_READ_LOCKED()
in there will trigger?  IE: the read_unlock() needs to be where the
pcidevs_unlock() is?

Thanks, Roger.

