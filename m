From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v3] xen: share start flags between PV and PVH
Date: Fri, 8 Jun 2018 09:12:25 -0700 (PDT)
Message-ID: <alpine.DEB.2.10.1806080909320.14699__2228.37691330842$1528474273$gmane$org@sstabellini-ThinkPad-X260>
References: <20180608084038.19344-1-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="8323329-1478822903-1528474284=:14699"
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=fhnu=i2=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1fRK05-0008FI-6H
 for xen-devel@lists.xenproject.org; Fri, 08 Jun 2018 16:12:29 +0000
In-Reply-To: <20180608084038.19344-1-roger.pau@citrix.com>
Content-ID: <alpine.DEB.2.10.1806080911340.14699@sstabellini-ThinkPad-X260>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Stefano Stabellini <sstabellini@kernel.org>, linux-kernel@vger.kernel.org
List-Id: xen-devel@lists.xenproject.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1478822903-1528474284=:14699
Content-Type: TEXT/PLAIN; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.10.1806080911341.14699@sstabellini-ThinkPad-X260>

On Fri, 8 Jun 2018, Roger Pau Monne wrote:
> Use a global variable to store the start flags for both PV and PVH.
> This allows the xen_initial_domain macro to work properly on PVH.
> 
> Note that ARM is also switched to use the new variable.
> 
> Signed-off-by: Boris Ostrovsky <boris.ostrovsky@oracle.com>
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

As I already mentioned, the ARM part is OK. However, is the issue that
xen_start_info is not available on PVH? We had the same problem on ARM
and solved it by faking a xen_start_info page, see the top of
arch/arm/xen/enlighten.c.

I would love to get rid of that, but to do that, we also need to remove
the xen_start_info referece at drivers/tty/hvc/hvc_xen.c:255:

  if (!xen_start_info->console.domU.evtchn)
		return -ENODEV;


> ---
> Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>
> Cc: Juergen Gross <jgross@suse.com>
> Cc: Stefano Stabellini <sstabellini@kernel.org>
> Cc: xen-devel@lists.xenproject.org
> ---
> Changes since v2:
>  - Declare xen_start_flags outside of the XEN_DOM0 guard and include
>    types.h.
> 
> Changes since v1:
>  - Switch ARM to also use the new xen_start_flags.
> ---
>  arch/arm/xen/enlighten.c     | 7 ++++---
>  arch/x86/xen/enlighten.c     | 7 +++++++
>  arch/x86/xen/enlighten_pv.c  | 1 +
>  arch/x86/xen/enlighten_pvh.c | 1 +
>  include/xen/xen.h            | 6 +++++-
>  5 files changed, 18 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm/xen/enlighten.c b/arch/arm/xen/enlighten.c
> index ba7f4c8f5c3e..a99d5edf7bdf 100644
> --- a/arch/arm/xen/enlighten.c
> +++ b/arch/arm/xen/enlighten.c
> @@ -59,6 +59,9 @@ struct xen_memory_region xen_extra_mem[XEN_EXTRA_MEM_MAX_REGIONS] __initdata;
>  
>  static __read_mostly unsigned int xen_events_irq;
>  
> +uint32_t xen_start_flags;
> +EXPORT_SYMBOL(xen_start_flags);
> +
>  int xen_remap_domain_gfn_array(struct vm_area_struct *vma,
>  			       unsigned long addr,
>  			       xen_pfn_t *gfn, int nr,
> @@ -282,9 +285,7 @@ void __init xen_early_init(void)
>  	xen_setup_features();
>  
>  	if (xen_feature(XENFEAT_dom0))
> -		xen_start_info->flags |= SIF_INITDOMAIN|SIF_PRIVILEGED;
> -	else
> -		xen_start_info->flags &= ~(SIF_INITDOMAIN|SIF_PRIVILEGED);
> +		xen_start_flags |= SIF_INITDOMAIN|SIF_PRIVILEGED;
>  
>  	if (!console_set_on_cmdline && !xen_initial_domain())
>  		add_preferred_console("hvc", 0, NULL);
> diff --git a/arch/x86/xen/enlighten.c b/arch/x86/xen/enlighten.c
> index c9081c6671f0..3b5318505c69 100644
> --- a/arch/x86/xen/enlighten.c
> +++ b/arch/x86/xen/enlighten.c
> @@ -64,6 +64,13 @@ struct shared_info xen_dummy_shared_info;
>  __read_mostly int xen_have_vector_callback;
>  EXPORT_SYMBOL_GPL(xen_have_vector_callback);
>  
> +/*
> + * NB: needs to live in .data because it's used by xen_prepare_pvh which runs
> + * before clearing the bss.
> + */
> +uint32_t xen_start_flags __attribute__((section(".data"))) = 0;
> +EXPORT_SYMBOL(xen_start_flags);
> +
>  /*
>   * Point at some empty memory to start with. We map the real shared_info
>   * page as soon as fixmap is up and running.
> diff --git a/arch/x86/xen/enlighten_pv.c b/arch/x86/xen/enlighten_pv.c
> index 357969a3697c..8d4e2e1ae60b 100644
> --- a/arch/x86/xen/enlighten_pv.c
> +++ b/arch/x86/xen/enlighten_pv.c
> @@ -1203,6 +1203,7 @@ asmlinkage __visible void __init xen_start_kernel(void)
>  		return;
>  
>  	xen_domain_type = XEN_PV_DOMAIN;
> +	xen_start_flags = xen_start_info->flags;
>  
>  	xen_setup_features();
>  
> diff --git a/arch/x86/xen/enlighten_pvh.c b/arch/x86/xen/enlighten_pvh.c
> index aa1c6a6831a9..c85d1a88f476 100644
> --- a/arch/x86/xen/enlighten_pvh.c
> +++ b/arch/x86/xen/enlighten_pvh.c
> @@ -97,6 +97,7 @@ void __init xen_prepare_pvh(void)
>  	}
>  
>  	xen_pvh = 1;
> +	xen_start_flags = pvh_start_info.flags;
>  
>  	msr = cpuid_ebx(xen_cpuid_base() + 2);
>  	pfn = __pa(hypercall_page);
> diff --git a/include/xen/xen.h b/include/xen/xen.h
> index 9d4340c907d1..1e1d9bd0bd37 100644
> --- a/include/xen/xen.h
> +++ b/include/xen/xen.h
> @@ -25,12 +25,16 @@ extern bool xen_pvh;
>  #define xen_hvm_domain()	(xen_domain_type == XEN_HVM_DOMAIN)
>  #define xen_pvh_domain()	(xen_pvh)
>  
> +#include <linux/types.h>
> +
> +extern uint32_t xen_start_flags;
> +
>  #ifdef CONFIG_XEN_DOM0
>  #include <xen/interface/xen.h>
>  #include <asm/xen/hypervisor.h>
>  
>  #define xen_initial_domain()	(xen_domain() && \
> -				 xen_start_info && xen_start_info->flags & SIF_INITDOMAIN)
> +				 (xen_start_flags & SIF_INITDOMAIN))
>  #else  /* !CONFIG_XEN_DOM0 */
>  #define xen_initial_domain()	(0)
>  #endif	/* CONFIG_XEN_DOM0 */
> -- 
> 2.17.1
> 
--8323329-1478822903-1528474284=:14699
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--8323329-1478822903-1528474284=:14699--
