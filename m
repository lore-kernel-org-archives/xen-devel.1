Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 365F8C55ABF
	for <xen-devel@archiver.kernel.org>; Wed,  5 Aug 2026 22:45:41 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1383955.1627048 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrkMZ-0004pq-Ha; Wed, 05 Aug 2026 22:45:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1383955.1627048; Wed, 05 Aug 2026 22:45:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrkMZ-0004pi-Du; Wed, 05 Aug 2026 22:45:27 +0000
Received: by outflank-mailman (input) for mailman id 1383955;
 Wed, 05 Aug 2026 22:45:26 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <sstabellini@kernel.org>) id 1wrkMY-0004pc-5E
 for xen-devel@lists.xenproject.org; Wed, 05 Aug 2026 22:45:26 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wrkMX-001qHF-4f
 for xen-devel@lists.xenproject.org; Thu, 06 Aug 2026 00:45:25 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <sstabellini@kernel.org>)
 id 6a73bc77-2eae-0a2a0a5409dd-0a2a4504dc7a-30
 for <xen-devel@lists.xenproject.org>; Thu, 06 Aug 2026 00:45:25 +0200
Received: from [172.234.252.31] (helo=sea.source.kernel.org)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <sstabellini@kernel.org>)
 id 6a73bd03-b57f-0a2a45040019-aceafc1fa802-3
 for <xen-devel@lists.xenproject.org>; Thu, 06 Aug 2026 00:45:24 +0200
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id A855B42E90;
 Wed,  5 Aug 2026 22:45:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E77F21F000E9;
 Wed,  5 Aug 2026 22:45:20 +0000 (UTC)
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
	s=k20260515; t=1785969922;
	bh=3d3XFROd8+sbFsK8tpt4qnvKUt7FVBYbqAtzzam2GJw=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=LlwwsD176RfWsrVexLR7F8hO3K5O5ZgRQ80M4oMI+GHkCpPu4qctzNdrfJjNz5AIq
	 hLbqGEmh4+w4m+NZ2x11Zy1CoqM21IuaxZFGAJh4Nn6BZfKemNHEc9W2cGbeomRqAR
	 dw1cFxbu3EFQaYy7DMemmVitp/Rvtwkt8ixSq2ITGNKkeunSLNRP/of+HiJB13b9cu
	 zmvU5t0XceRKHATS0gnt7jQ9NCu4ZRPkUHrRmqj6Cs0XMlVAJyJ/zdbuuCDle56Lq/
	 i3fSpdq3GnHOsuVFH3Cg2b4N94YioS0fVUJciTtFC9yafnIuzy3amlu3lklgBl5XZu
	 VrW5Sj8MFIOJw==
Date: Wed, 5 Aug 2026 15:45:20 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
To: Juergen Gross <jgross@suse.com>
cc: linux-kernel@vger.kernel.org, x86@kernel.org, 
    Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
    Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
    "H. Peter Anvin" <hpa@zytor.com>, 
    Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, 
    xen-devel@lists.xenproject.org
Subject: Re: [PATCH 2/4] xen: Drop CONFIG_XEN_PVHVM
In-Reply-To: <20260805082137.1214967-3-jgross@suse.com>
Message-ID: <00aabcc8-cbdf-b7b9-b253-c7a1f46a22bd@kernel.org>
References: <20260805082137.1214967-1-jgross@suse.com> <20260805082137.1214967-3-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-purgate-ID: tlsNG-ebf023/1785969925-C30CDB50-B8D71824/0/0
X-purgate-type: clean
X-purgate-size: 7958

On Wed, 5 Aug 2026, Juergen Gross wrote:
> On x86 CONFIG_XEN_PVHVM is now a synonym of CONFIG_XEN.
> 
> In Xen specific x86 code it can be just dropped, in non-Xen specific
> x86 code it can be replaced with CONFIG_XEN.
> 
> In architecture independent code it is used only where CONFIG_XEN is
> defined, so it can be replaced with CONFIG_X86 there.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

While I think there is value in compiling a tiny PV-only kernel (in
fact I even have a real-world use case for it) the code addition is
minimal and also considering your reply to Andrew:

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  arch/x86/include/asm/idtentry.h   |  2 +-
>  arch/x86/kernel/cpu/hypervisor.c  |  2 +-
>  arch/x86/xen/Kconfig              | 10 +++-------
>  arch/x86/xen/Makefile             |  9 ++++-----
>  arch/x86/xen/time.c               |  2 --
>  arch/x86/xen/xen-ops.h            |  4 ----
>  drivers/xen/Kconfig               |  2 +-
>  drivers/xen/events/events_base.c  |  7 -------
>  drivers/xen/xenbus/xenbus_probe.c |  2 +-
>  include/xen/platform_pci.h        |  6 +++---
>  10 files changed, 14 insertions(+), 32 deletions(-)
> 
> diff --git a/arch/x86/include/asm/idtentry.h b/arch/x86/include/asm/idtentry.h
> index 20f548702404..f400cfac69a6 100644
> --- a/arch/x86/include/asm/idtentry.h
> +++ b/arch/x86/include/asm/idtentry.h
> @@ -745,7 +745,7 @@ DECLARE_IDTENTRY_SYSVEC(HYPERV_STIMER0_VECTOR,		sysvec_hyperv_stimer0);
>  DECLARE_IDTENTRY_SYSVEC(HYPERVISOR_CALLBACK_VECTOR,	sysvec_acrn_hv_callback);
>  #endif
>  
> -#ifdef CONFIG_XEN_PVHVM
> +#ifdef CONFIG_XEN
>  DECLARE_IDTENTRY_SYSVEC(HYPERVISOR_CALLBACK_VECTOR,	sysvec_xen_hvm_callback);
>  #endif
>  
> diff --git a/arch/x86/kernel/cpu/hypervisor.c b/arch/x86/kernel/cpu/hypervisor.c
> index f3e9219845e8..73428afca796 100644
> --- a/arch/x86/kernel/cpu/hypervisor.c
> +++ b/arch/x86/kernel/cpu/hypervisor.c
> @@ -31,7 +31,7 @@ static const __initconst struct hypervisor_x86 * const hypervisors[] =
>  #ifdef CONFIG_XEN_PV
>  	&x86_hyper_xen_pv,
>  #endif
> -#ifdef CONFIG_XEN_PVHVM
> +#ifdef CONFIG_XEN
>  	&x86_hyper_xen_hvm,
>  #endif
>  	&x86_hyper_vmware,
> diff --git a/arch/x86/xen/Kconfig b/arch/x86/xen/Kconfig
> index bb420a4cb75f..9e5bb51eecf4 100644
> --- a/arch/x86/xen/Kconfig
> +++ b/arch/x86/xen/Kconfig
> @@ -50,24 +50,20 @@ config XEN_PV_DOM0
>  	def_bool y
>  	depends on XEN_PV && XEN_DOM0
>  
> -config XEN_PVHVM
> -	def_bool y
> -	depends on XEN
> -
>  config XEN_PVHVM_SMP
>  	def_bool y
> -	depends on XEN_PVHVM && SMP
> +	depends on XEN && SMP
>  
>  config XEN_PVHVM_GUEST
>  	bool "Xen PVHVM guest support"
>  	default y
> -	depends on XEN_PVHVM && PCI
> +	depends on XEN && PCI
>  	help
>  	  Support running as a Xen PVHVM guest.
>  
>  config XEN_PVH
>  	bool "Xen PVH guest support"
> -	depends on XEN && XEN_PVHVM && ACPI
> +	depends on XEN && ACPI
>  	select PVH
>  	help
>  	  Support for running as a Xen PVH guest.
> diff --git a/arch/x86/xen/Makefile b/arch/x86/xen/Makefile
> index 717264ae269b..32d651aa9bc2 100644
> --- a/arch/x86/xen/Makefile
> +++ b/arch/x86/xen/Makefile
> @@ -16,11 +16,10 @@ obj-y				+= mmu.o
>  obj-y				+= time.o
>  obj-y				+= grant-table.o
>  obj-y				+= suspend.o
> -
> -obj-$(CONFIG_XEN_PVHVM)		+= enlighten_hvm.o
> -obj-$(CONFIG_XEN_PVHVM)		+= mmu_hvm.o
> -obj-$(CONFIG_XEN_PVHVM)		+= suspend_hvm.o
> -obj-$(CONFIG_XEN_PVHVM)		+= platform-pci-unplug.o
> +obj-y				+= enlighten_hvm.o
> +obj-y				+= mmu_hvm.o
> +obj-y				+= suspend_hvm.o
> +obj-y				+= platform-pci-unplug.o
>  
>  obj-$(CONFIG_XEN_PV)		+= setup.o
>  obj-$(CONFIG_XEN_PV)		+= apic.o
> diff --git a/arch/x86/xen/time.c b/arch/x86/xen/time.c
> index d62c14334b35..5c7822254a01 100644
> --- a/arch/x86/xen/time.c
> +++ b/arch/x86/xen/time.c
> @@ -586,7 +586,6 @@ void __init xen_init_time_ops(void)
>  		x86_platform.set_wallclock = xen_set_wallclock;
>  }
>  
> -#ifdef CONFIG_XEN_PVHVM
>  static void xen_hvm_setup_cpu_clockevents(void)
>  {
>  	int cpu = smp_processor_id();
> @@ -643,7 +642,6 @@ void __init xen_hvm_init_time_ops(void)
>  
>  	hvm_time_initialized = true;
>  }
> -#endif
>  
>  /* Kernel parameter to specify Xen timer slop */
>  static int __init parse_xen_timer_slop(char *ptr)
> diff --git a/arch/x86/xen/xen-ops.h b/arch/x86/xen/xen-ops.h
> index dc265bdda24d..47eebbb3684a 100644
> --- a/arch/x86/xen/xen-ops.h
> +++ b/arch/x86/xen/xen-ops.h
> @@ -236,11 +236,7 @@ void xen_pin_vcpu(int cpu);
>  
>  void xen_emergency_restart(void);
>  
> -#ifdef CONFIG_XEN_PVHVM
>  void xen_hvm_post_suspend(int suspend_cancelled);
> -#else
> -static inline void xen_hvm_post_suspend(int suspend_cancelled) {}
> -#endif
>  
>  /*
>   * The maximum amount of extra memory compared to the base size.  The
> diff --git a/drivers/xen/Kconfig b/drivers/xen/Kconfig
> index f9a35ed266ec..cfb517cd77dc 100644
> --- a/drivers/xen/Kconfig
> +++ b/drivers/xen/Kconfig
> @@ -311,7 +311,7 @@ config XEN_EFI
>  
>  config XEN_AUTO_XLATE
>  	def_bool y
> -	depends on ARM || ARM64 || XEN_PVHVM
> +	depends on ARM || ARM64 || X86
>  	help
>  	  Support for auto-translated physmap guests.
>  
> diff --git a/drivers/xen/events/events_base.c b/drivers/xen/events/events_base.c
> index 6ea945508a89..fd16d652c81f 100644
> --- a/drivers/xen/events/events_base.c
> +++ b/drivers/xen/events/events_base.c
> @@ -2180,7 +2180,6 @@ static struct irq_chip xen_percpu_chip __read_mostly = {
>  };
>  
>  #ifdef CONFIG_X86
> -#ifdef CONFIG_XEN_PVHVM
>  /* Vector callbacks are better than PCI interrupts to receive event
>   * channel notifications because we can receive vector callbacks on any
>   * vcpu and we don't need PCI support or APIC interactions. */
> @@ -2242,12 +2241,6 @@ static __init void xen_alloc_callback_vector(void)
>  	pr_info("Xen HVM callback vector for event delivery is enabled\n");
>  	sysvec_install(HYPERVISOR_CALLBACK_VECTOR, sysvec_xen_hvm_callback);
>  }
> -#else
> -void xen_setup_callback_vector(void) {}
> -static inline void xen_init_setup_upcall_vector(void) {}
> -int xen_set_upcall_vector(unsigned int cpu) {}
> -static inline void xen_alloc_callback_vector(void) {}
> -#endif /* CONFIG_XEN_PVHVM */
>  #endif /* CONFIG_X86 */
>  
>  bool xen_fifo_events = true;
> diff --git a/drivers/xen/xenbus/xenbus_probe.c b/drivers/xen/xenbus/xenbus_probe.c
> index fafb2b84fa5c..082b8c1fee8e 100644
> --- a/drivers/xen/xenbus/xenbus_probe.c
> +++ b/drivers/xen/xenbus/xenbus_probe.c
> @@ -831,7 +831,7 @@ static void xenbus_probe(void)
>   */
>  static bool xs_hvm_defer_init_for_callback(void)
>  {
> -#ifdef CONFIG_XEN_PVHVM
> +#ifdef CONFIG_X86
>  	return xen_store_domain_type == XS_HVM &&
>  		!xen_have_vector_callback;
>  #else
> diff --git a/include/xen/platform_pci.h b/include/xen/platform_pci.h
> index e51e7cb71a85..267040c1f504 100644
> --- a/include/xen/platform_pci.h
> +++ b/include/xen/platform_pci.h
> @@ -30,7 +30,7 @@
>  static inline int xen_must_unplug_nics(void) {
>  #if (defined(CONFIG_XEN_NETDEV_FRONTEND) || \
>  		defined(CONFIG_XEN_NETDEV_FRONTEND_MODULE)) && \
> -		defined(CONFIG_XEN_PVHVM)
> +		defined(CONFIG_X86)
>          return 1;
>  #else
>          return 0;
> @@ -40,14 +40,14 @@ static inline int xen_must_unplug_nics(void) {
>  static inline int xen_must_unplug_disks(void) {
>  #if (defined(CONFIG_XEN_BLKDEV_FRONTEND) || \
>  		defined(CONFIG_XEN_BLKDEV_FRONTEND_MODULE)) && \
> -		defined(CONFIG_XEN_PVHVM)
> +		defined(CONFIG_X86)
>          return 1;
>  #else
>          return 0;
>  #endif
>  }
>  
> -#if defined(CONFIG_XEN_PVHVM)
> +#if defined(CONFIG_X86)
>  extern bool xen_has_pv_devices(void);
>  extern bool xen_has_pv_disk_devices(void);
>  extern bool xen_has_pv_nic_devices(void);
> -- 
> 2.55.0
> 

