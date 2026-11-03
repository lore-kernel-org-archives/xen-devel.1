Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6426606A31B
	for <xen-devel@archiver.kernel.org>; Tue,  3 Nov 2026 20:46:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Be8FqblA
Received: from list by lists.xenproject.org with outflank-mailman.1470629.1679299 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOLNr-0007o4-Vs; Tue, 03 Nov 2026 20:45:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1470629.1679299; Tue, 03 Nov 2026 20:45:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOLNr-0007nx-TL; Tue, 03 Nov 2026 20:45:31 +0000
Received: by outflank-mailman (input) for mailman id 1470629;
 Tue, 03 Nov 2026 20:45:30 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <sstabellini@kernel.org>) id 1xOLNq-0007nr-7r
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2026 20:45:30 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOLNp-00EPLS-D4
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2026 21:45:29 +0100
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <sstabellini@kernel.org>)
 id 6aea47e5-bab6-0a2a0a5309dd-0a2a4509b1ce-4
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 21:45:29 +0100
Received: from [172.105.4.254] (helo=tor.source.kernel.org)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <sstabellini@kernel.org>)
 id 6aea47e8-be1a-0a2a45090019-ac6904febc6c-3
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 21:45:29 +0100
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 40686601EF;
 Tue,  3 Nov 2026 20:45:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75C261F000C1;
 Tue,  3 Nov 2026 20:45:25 +0000 (UTC)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=k20260515 header.d=kernel.org header.i="@kernel.org" header.h="Date:From:To:cc:Subject:In-Reply-To:References"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793738727;
	bh=d8eklC2VQhZz5EWJXYgNnZ+PKNEBrIyO3+DsJyq5YZU=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=Be8FqblAJgEgKutq1JkQ2fRVdBZnjS+Lus8YMdD9WcqzfhDUjS6DVfvh33mlGGxsW
	 zv30BNhGysyap2ob6UjDLtsnJgjpf4QuB3tgyR4F7Io48gb/CjAB4MOqVoPrO19oDh
	 /LE9pnbLV6rdHLAhibmMXI6vkIMPh5WwYSVBPW8flMS0H/9H234C+T5R9V9RPuRIVN
	 0lEJSTxnuQ77KhReoyRn19JkMV4CwTYPC+wBGLaKMcwg95UtrQpmwSIL08IuMhnadZ
	 4JWaHADu4Ca0a8LCaQNCUFgNOGAJWbzU27HN3L9CwVLgt9hLsPSX2U42R2orGub0HB
	 nbYCArJn/dAKQ==
Date: Tue, 3 Nov 2026 12:45:20 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
To: Michal Orzel <michal.orzel@amd.com>
cc: xen-devel@lists.xenproject.org, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH] xen/arm: domain_build.c: Use hwdom instead of dom0 where
 applicable
In-Reply-To: <20261103164624.195576-1-michal.orzel@amd.com>
Message-ID: <5ed90745-512a-53e7-f5ef-aa4422383cb1@kernel.org>
References: <20261103164624.195576-1-michal.orzel@amd.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-purgate-ID: tlsNG-bad1c0/1793738729-3B4D3034-9B020834/0/0
X-purgate-type: clean
X-purgate-size: 8520
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, 3 Nov 2026, Michal Orzel wrote:
> Since commit 52cb53f1816a ("xen/arm: dom0less hwdom construction"),
> construct_hwdom() and the helpers it relies on (allocate_memory_11(),
> prepare_dtb_hwdom(), handle_node(), find_gnttab_region(), etc.) are used
> not only for the regular dom0 but also for a hardware domain created by
> dom0less. Many comments and names on this path still refer to dom0, which
> is misleading.
> 
> No functional change other than the panic messages.
> 
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> This is just the cleanup for one file with the most number of occurences that
> I decided to do in the free time after reviewing latest DOM0_BOOT changes. Other
> files also need such cleanup on Arm.
> ---
>  xen/arch/arm/domain_build.c | 44 ++++++++++++++++++-------------------
>  1 file changed, 22 insertions(+), 22 deletions(-)
> 
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index 1ee1f1f6a733..606e85818eb4 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -100,7 +100,7 @@ int __init parse_arch_dom0_param(const char *s, const char *e)
>  #endif
>  
>  /*
> - * Amount of extra space required to dom0's device tree. This covers
> + * Amount of extra space required to hwdom's device tree. This covers
>   * nodes generated by Xen, which are not directly copied from the host DTB.
>   * It is calculated as:
>   *  - Space for /hypervisor node (128 bytes).
> @@ -111,15 +111,15 @@ int __init parse_arch_dom0_param(const char *s, const char *e)
>   *    plus the appendage to the main /memory node (NR_SHMEM_BANKS * (160 + 16)
>   *    bytes). This overhead is dropped when CONFIG_STATIC_SHM is disabled.
>   */
> -#define DOM0_FDT_EXTRA_SIZE (128 + sizeof(struct fdt_reserve_entry) + \
> -                             (NR_MEM_BANKS * 16) +                    \
> -                             (IS_ENABLED(CONFIG_STATIC_SHM) ?         \
> -                              (NR_SHMEM_BANKS * (160 + 16)) : 0))
> +#define HWDOM_FDT_EXTRA_SIZE (128 + sizeof(struct fdt_reserve_entry) + \
> +                              (NR_MEM_BANKS * 16) +                    \
> +                              (IS_ENABLED(CONFIG_STATIC_SHM) ?         \
> +                               (NR_SHMEM_BANKS * (160 + 16)) : 0))
>  
>  paddr_t __init hwdom_get_fdt_alloc_size(void)
>  {
>      if ( acpi_disabled )
> -        return fdt_totalsize(device_tree_flattened) + DOM0_FDT_EXTRA_SIZE;
> +        return fdt_totalsize(device_tree_flattened) + HWDOM_FDT_EXTRA_SIZE;
>  
>      return ACPI_DOM0_FDT_MIN_SIZE;
>  }
> @@ -175,7 +175,7 @@ static bool __init insert_11_bank(struct domain *d,
>  
>      res = guest_physmap_add_page(d, _gfn(mfn_x(smfn)), smfn, order);
>      if ( res )
> -        panic("Failed map pages to DOM0: %d\n", res);
> +        panic("Failed map pages to %pd: %d\n", d, res);
>  
>      kinfo->unassigned_mem -= size;
>  
> @@ -245,19 +245,19 @@ fail:
>   *
>   * Requirements:
>   *
> - * 1. The dom0 kernel should be loaded within the first 128MB of RAM. This
> + * 1. The hwdom kernel should be loaded within the first 128MB of RAM. This
>   *    is necessary at least for Linux zImage kernels, which are all we
>   *    support today.
> - * 2. We want to put the dom0 kernel, ramdisk and DTB in the same
> + * 2. We want to put the hwdom kernel, ramdisk and DTB in the same
>   *    bank. Partly this is just easier for us to deal with, but also
>   *    the ramdisk and DTB must be placed within a certain proximity of
>   *    the kernel within RAM.
> - * 3. For dom0 we want to place as much of the RAM as we reasonably can
> + * 3. For hwdom we want to place as much of the RAM as we reasonably can
>   *    below 4GB, so that it can be used by non-LPAE enabled kernels (32-bit).
> - * 4. Some devices assigned to dom0 can only do 32-bit DMA access or
> + * 4. Some devices assigned to hwdom can only do 32-bit DMA access or
>   *    even be more restricted. We want to allocate as much of the RAM
>   *    as we reasonably can that can be accessed from all the devices..
> - * 5. For 32-bit dom0 the kernel must be located below 4GB.
> + * 5. For 32-bit hwdom the kernel must be located below 4GB.
>   * 6. We want to have a few largers banks rather than many smaller ones.
>   *
>   * For the first two requirements we need to make sure that the lowest
> @@ -293,7 +293,7 @@ fail:
>   * to be allocated in the low mem. Then for subsequent allocation, we
>   * initially allocate memory only from low mem. Once that runs out out
>   * (as described above) we allow higher allocations and continue until
> - * that runs out (or we have allocated sufficient dom0 memory).
> + * that runs out (or we have allocated sufficient hwdom memory).
>   */
>  static void __init allocate_memory_11(struct domain *d,
>                                        struct kernel_info *kinfo)
> @@ -311,7 +311,7 @@ static void __init allocate_memory_11(struct domain *d,
>      unsigned int bits;
>  
>      /*
> -     * TODO: Implement memory bank allocation when DOM0 is not direct
> +     * TODO: Implement memory bank allocation when hwdom is not direct
>       * mapped
>       */
>      BUG_ON(!is_domain_direct_mapped(d));
> @@ -409,8 +409,8 @@ static void __init allocate_memory_11(struct domain *d,
>  
>      if ( kinfo->unassigned_mem )
>          /* Don't want format this as PRIpaddr (16 digit hex) */
> -        panic("Failed to allocate requested dom0 memory. %ldMB unallocated\n",
> -              (unsigned long)kinfo->unassigned_mem >> 20);
> +        panic("Failed to allocate requested %pd memory. %ldMB unallocated\n",
> +              d, (unsigned long)kinfo->unassigned_mem >> 20);
>  
>      for( i = 0; i < mem->nr_banks; i++ )
>      {
> @@ -516,7 +516,7 @@ static int __init write_properties(struct domain *d, struct kernel_info *kinfo,
>           * * remove bootargs, linux,uefi-system-table,
>           *   linux,uefi-mmap-start, linux,uefi-mmap-size,
>           *   linux,uefi-mmap-desc-size, and linux,uefi-mmap-desc-ver
> -         *   (since EFI boot is not currently supported in dom0).
> +         *   (since EFI boot is not currently supported in hwdom).
>           */
>          if ( dt_node_path_is_equal(node, "/chosen") )
>          {
> @@ -1544,7 +1544,7 @@ static int __init handle_node(struct domain *d, struct kernel_info *kinfo,
>  
>      /*
>       * Even if the IOMMU device is not used by Xen, it should not be
> -     * passthrough to DOM0
> +     * passthrough to hwdom.
>       */
>      if ( device_get_class(node) == DEVICE_IOMMU )
>      {
> @@ -1695,7 +1695,7 @@ static int __init prepare_dtb_hwdom(struct domain *d, struct kernel_info *kinfo)
>      kinfo->phandle_intc = dt_interrupt_controller->phandle;
>      fdt = device_tree_flattened;
>  
> -    new_size = fdt_totalsize(fdt) + DOM0_FDT_EXTRA_SIZE;
> +    new_size = fdt_totalsize(fdt) + HWDOM_FDT_EXTRA_SIZE;
>      kinfo->fdt = xmalloc_bytes(new_size);
>      if ( kinfo->fdt == NULL )
>          return -ENOMEM;
> @@ -1764,7 +1764,7 @@ static void __init find_gnttab_region(struct domain *d,
>          gnttab_resource_max_frames(d, XENMEM_resource_grant_table_id_shared);
>  
>      /*
> -     * The region used by Xen on the memory will never be mapped in DOM0
> +     * The region used by Xen on the memory will never be mapped in hwdom
>       * memory layout. Therefore it can be used for the grant table.
>       *
>       * Only use the text section as it's always present and will contain
> @@ -1776,7 +1776,7 @@ static void __init find_gnttab_region(struct domain *d,
>  
>  #ifdef CONFIG_ARM_32
>      /*
> -     * The gnttab region must be under 4GB in order to work with DOM0
> +     * The gnttab region must be under 4GB in order to work with hwdom
>       * using short page table.
>       * In practice it's always the case because Xen is always located
>       * below 4GB, but be safe.
> @@ -1941,7 +1941,7 @@ int __init construct_hwdom(struct kernel_info *kinfo,
>              return rc;
>      }
>  
> -    /* Map extra GIC MMIO, irqs and other hw stuffs to dom0. */
> +    /* Map extra GIC MMIO, irqs and other hw stuffs to hwdom */
>      rc = gic_map_hwdom_extra_mappings(d);
>      if ( rc < 0 )
>          return rc;
> -- 
> 2.43.0
> 

