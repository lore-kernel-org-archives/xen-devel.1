Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51070C55174
	for <xen-devel@archiver.kernel.org>; Wed,  5 Aug 2026 22:47:25 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1383962.1627057 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrkOG-0005SN-RQ; Wed, 05 Aug 2026 22:47:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1383962.1627057; Wed, 05 Aug 2026 22:47:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrkOG-0005SG-Nl; Wed, 05 Aug 2026 22:47:12 +0000
Received: by outflank-mailman (input) for mailman id 1383962;
 Wed, 05 Aug 2026 22:47:11 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <sstabellini@kernel.org>) id 1wrkOF-0005SA-12
 for xen-devel@lists.xenproject.org; Wed, 05 Aug 2026 22:47:11 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wrkOE-005shb-EJ
 for xen-devel@lists.xenproject.org; Thu, 06 Aug 2026 00:47:10 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <sstabellini@kernel.org>)
 id 6a73bd04-e002-0a2a0a5209dd-0a2a4508ab58-36
 for <xen-devel@lists.xenproject.org>; Thu, 06 Aug 2026 00:47:10 +0200
Received: from [172.234.252.31] (helo=sea.source.kernel.org)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <sstabellini@kernel.org>)
 id 6a73bd6c-f659-0a2a45080019-aceafc1f8bae-3
 for <xen-devel@lists.xenproject.org>; Thu, 06 Aug 2026 00:47:10 +0200
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 423C9439F0;
 Wed,  5 Aug 2026 22:47:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 636D81F000E9;
 Wed,  5 Aug 2026 22:47:07 +0000 (UTC)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=k20260515 header.d=kernel.org header.i="@kernel.org" header.h="Date:From:To:cc:Subject:In-Reply-To:References"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785970028;
	bh=fuuPEvAgsHQj9nsqLXSKpXJzZS7FnT2ffJxVGZb1cbA=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=cz/EpjzlrGUmxt+B0JJyEawyTl6rwJbKaxw6SkzKrj6S4yhYdGRNOsyxG2x4OD+jl
	 yWCl4Kn26ujSZrB0Oh9FFklTurJ4MoF0dPRBOdv2DlbjGh02l/1jRlzTIR/8zcAFKH
	 X2RZjl4NkdVKGtKl956zpqWN+23Io66ZlMChieQl4BWxpMmrYgBOlLfswWvmXtqudT
	 MIdXFKwZwxG2Txe9XbdjsucTEQsEXoUrpzNQeIwZSBah2SZ/KSaz1quHzm/vTWiitT
	 wH2+yCcRQ6hpDUI4CJq+YTeu0AfftbUJeEjDpUfK88+t+FJB98hG8kFu9FUgZOJbTE
	 TXdV3qAiKby0w==
Date: Wed, 5 Aug 2026 15:47:06 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
To: Juergen Gross <jgross@suse.com>
cc: linux-kernel@vger.kernel.org, Stefano Stabellini <sstabellini@kernel.org>, 
    Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, 
    xen-devel@lists.xenproject.org
Subject: Re: [PATCH 3/4] xen: Drop CONFIG_XEN_AUTO_XLATE
In-Reply-To: <20260805082137.1214967-4-jgross@suse.com>
Message-ID: <fcdf9321-c4bf-216e-7be9-395ba0f20df4@kernel.org>
References: <20260805082137.1214967-1-jgross@suse.com> <20260805082137.1214967-4-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-purgate-ID: tlsNG-c1860d/1785970030-CFED287B-37B27DC7/0/0
X-purgate-type: clean
X-purgate-size: 4109

On Wed, 5 Aug 2026, Juergen Gross wrote:
> CONFIG_XEN_AUTO_XLATE is referenced only in code built with CONFIG_XEN
> enabled. As it is enabled for all architectures supporting Xen, it can
> be just dropped.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

> ---
>  drivers/xen/Kconfig   |  6 ------
>  drivers/xen/Makefile  |  2 +-
>  drivers/xen/privcmd.c |  4 ++--
>  include/xen/xen-ops.h | 22 ----------------------
>  4 files changed, 3 insertions(+), 31 deletions(-)
> 
> diff --git a/drivers/xen/Kconfig b/drivers/xen/Kconfig
> index cfb517cd77dc..32e35a8580ee 100644
> --- a/drivers/xen/Kconfig
> +++ b/drivers/xen/Kconfig
> @@ -309,12 +309,6 @@ config XEN_EFI
>  	def_bool y
>  	depends on (ARM || ARM64 || X86_64) && EFI
>  
> -config XEN_AUTO_XLATE
> -	def_bool y
> -	depends on ARM || ARM64 || X86
> -	help
> -	  Support for auto-translated physmap guests.
> -
>  config XEN_ACPI
>  	def_bool y
>  	depends on X86 && ACPI
> diff --git a/drivers/xen/Makefile b/drivers/xen/Makefile
> index c0503f1c7d5b..6ce2e2a52d47 100644
> --- a/drivers/xen/Makefile
> +++ b/drivers/xen/Makefile
> @@ -2,6 +2,7 @@
>  obj-$(CONFIG_HOTPLUG_CPU)		+= cpu_hotplug.o
>  obj-y	+= grant-table.o features.o balloon.o manage.o time.o
>  obj-y	+= mem-reservation.o
> +obj-y	+= xlate_mmu.o
>  obj-y	+= events/
>  obj-y	+= xenbus/
>  
> @@ -29,7 +30,6 @@ obj-$(CONFIG_XEN_PRIVCMD)		+= xen-privcmd.o
>  obj-$(CONFIG_XEN_ACPI_PROCESSOR)	+= xen-acpi-processor.o
>  obj-$(CONFIG_XEN_EFI)			+= efi.o
>  obj-$(CONFIG_XEN_SCSI_BACKEND)		+= xen-scsiback.o
> -obj-$(CONFIG_XEN_AUTO_XLATE)		+= xlate_mmu.o
>  obj-$(CONFIG_XEN_PVCALLS_BACKEND)	+= pvcalls-back.o
>  obj-$(CONFIG_XEN_PVCALLS_FRONTEND)	+= pvcalls-front.o
>  xen-evtchn-y				:= evtchn.o
> diff --git a/drivers/xen/privcmd.c b/drivers/xen/privcmd.c
> index 725a49a0eee7..7cfc28f1bb86 100644
> --- a/drivers/xen/privcmd.c
> +++ b/drivers/xen/privcmd.c
> @@ -794,7 +794,7 @@ static long privcmd_ioctl_mmap_resource(struct file *file,
>  		goto out;
>  	}
>  
> -	if (IS_ENABLED(CONFIG_XEN_AUTO_XLATE) && !xen_pv_domain()) {
> +	if (!xen_pv_domain()) {
>  		unsigned int nr = DIV_ROUND_UP(kdata.num, XEN_PFN_PER_PAGE);
>  		struct page **pages;
>  		unsigned int i;
> @@ -825,7 +825,7 @@ static long privcmd_ioctl_mmap_resource(struct file *file,
>  	if (rc)
>  		goto out;
>  
> -	if (IS_ENABLED(CONFIG_XEN_AUTO_XLATE) && !xen_pv_domain()) {
> +	if (!xen_pv_domain()) {
>  		rc = xen_remap_vma_range(vma, kdata.addr, kdata.num << PAGE_SHIFT);
>  	} else {
>  		unsigned int domid =
> diff --git a/include/xen/xen-ops.h b/include/xen/xen-ops.h
> index 496e6013c689..15e0c3f4b7bb 100644
> --- a/include/xen/xen-ops.h
> +++ b/include/xen/xen-ops.h
> @@ -59,7 +59,6 @@ static inline int xen_remap_pfn(struct vm_area_struct *vma, unsigned long addr,
>  
>  struct vm_area_struct;
>  
> -#ifdef CONFIG_XEN_AUTO_XLATE
>  int xen_xlate_remap_gfn_array(struct vm_area_struct *vma,
>  			      unsigned long addr,
>  			      xen_pfn_t *gfn, int nr,
> @@ -68,27 +67,6 @@ int xen_xlate_remap_gfn_array(struct vm_area_struct *vma,
>  			      struct page **pages);
>  int xen_xlate_unmap_gfn_range(struct vm_area_struct *vma,
>  			      int nr, struct page **pages);
> -#else
> -/*
> - * These two functions are called from arch/x86/xen/mmu.c and so stubs
> - * are needed for a configuration not specifying CONFIG_XEN_AUTO_XLATE.
> - */
> -static inline int xen_xlate_remap_gfn_array(struct vm_area_struct *vma,
> -					    unsigned long addr,
> -					    xen_pfn_t *gfn, int nr,
> -					    int *err_ptr, pgprot_t prot,
> -					    unsigned int domid,
> -					    struct page **pages)
> -{
> -	return -EOPNOTSUPP;
> -}
> -
> -static inline int xen_xlate_unmap_gfn_range(struct vm_area_struct *vma,
> -					    int nr, struct page **pages)
> -{
> -	return -EOPNOTSUPP;
> -}
> -#endif
>  
>  int xen_remap_vma_range(struct vm_area_struct *vma, unsigned long addr,
>  			unsigned long len);
> -- 
> 2.55.0
> 

