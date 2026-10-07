Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6563CA6002
	for <xen-devel@archiver.kernel.org>; Wed,  7 Oct 2026 19:22:14 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1442748.1660299 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xEXCz-0006OQ-4r; Wed, 07 Oct 2026 19:21:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1442748.1660299; Wed, 07 Oct 2026 19:21:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xEXCz-0006OJ-1w; Wed, 07 Oct 2026 19:21:45 +0000
Received: by outflank-mailman (input) for mailman id 1442748;
 Wed, 07 Oct 2026 19:21:44 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger@xenproject.org>) id 1xEXCy-0006OD-Dy
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2026 19:21:44 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <roger@xenproject.org>) id 1xEXCw-001lXl-0z;
 Wed, 07 Oct 2026 19:21:42 +0000
Received: from 224.pool85-54-217.dynamic.orange.es ([85.54.217.224]
 helo=localhost) by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <roger@xenproject.org>) id 1xEXCv-004xqo-2r;
 Wed, 07 Oct 2026 19:21:42 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date;
	bh=TaWY11l20d4YtKC/7kW9m6cZPXITLgh/ZOnA/puDdRc=; b=l1SbtPD3YiQNbdw807o1IUPS75
	7Ms4fcfRy2p3DGZOwEhEXFFT2CuZ/Ri0m2oJgB+gcfYneaI4UR2ijSvvBrot9hfBn+DBPVez/bskn
	S1I3Gj/zVFtcerxwouShjZJ7bclXJ6xSqQdJ4Ym4lxqud0i2mHa3bebSpnGbbG1Zpklw=;
Date: Wed, 7 Oct 2026 21:21:34 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger@xenproject.org>
To: George Dunlap <gwd@xenproject.org>
Cc: xen-devel@lists.xenproject.org,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>, Tim Deegan <tim@xen.org>
Subject: Re: [PATCH v3 07/18] x86/hvm: introduce per-vCPU L3 page-table
Message-ID: <asabvvijNb1h-FcW@Mac.lan>
References: <20261007104051.48841-1-gwd@xenproject.org>
 <20261007104051.48841-8-gwd@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261007104051.48841-8-gwd@xenproject.org>

On Wed, Oct 07, 2026 at 11:40:40AM +0100, George Dunlap wrote:
> From: Roger Pau Monné <roger.pau@citrix.com>
> 
> The per-domain area is currently a single domain-wide structure: one L3,

nit: s/structure/entry/ might be better?

> referenced from every root page-table associated with the domain, so
> every mapping in it is visible to every vCPU of the domain.  Its
> contents are already laid out in per-vCPU slices (each vCPU's
> COMPAT_ARG_XLAT pages, and for PV each vCPU's GDT/LDT window and
> mapcache entries), but the visibility is domain-wide.  Meanwhile, much
> of the per-vCPU state Xen maintains -- the VMCB, the VMX MSR load/save
> areas, FPU/XSAVE state -- lives in always-mapped memory.
> 
> Allow the "per-domain" area to be per-vCPU instead ("VCPU-PT") for HVM
> domains.  HVM monitor tables are already per-vCPU, so this needs nothing
> at context switch: every monitor table carries its vCPU's own L3 from
> creation, and the per-vCPU mappings are isolated from other running
> vCPUs at once.  We will later build on this, adding a per-vCPU mapcache
> and per-vCPU mapped areas, into which we can move the vCPU state
> mentioned above.
> 
> Add pervcpu_l3_pg to the arch_vcpu struct, to correspond to the
> perdomain_l3_pg in the domain struct.  (We retain both so that we can
> switch between per-domain and per-vCPU on a domain-by-domain basis; PV
> domains always use the domain-wide one.)
> 
> In {create,destroy}_perdomain_mapping(), if d->arch.vcpu_pt, use
> pervcpu_l3_pg as the per-domain L3 (allocating it for a vCPU if it's
> NULL, just as we allocate for a domain in !vcpu_pt mode); otherwise,
> use perdomain_l3_pg.  Introduce a helper, perdomain_l3(), to
> consistently choose the correct one.
> 
> Introduce free_pervcpu_mappings() to free this tree, called from
> arch_vcpu_destroy() on normal teardown.  Since the vcpu structure holds
> the only reference to pervcpu_l3_pg, arch_vcpu_create() must also call
> it on its error paths: nothing else records the allocation once the
> vcpu struct is torn down.  The domain-wide free_perdomain_mappings() is
> unchanged and keeps covering non-vCPU-PT domains.
> 
> Give init_xen_l4_slots() the vCPU a table is private to, and use

Can't you replace the domain parameter with a vcpu one, and obtain
domain as v->domain?

> perdomain_l3() to select the value to install in slot 260 when one is
> given.  The HVM monitor tables and the 32-bit PV Xen-owned L4s pass
> their vCPU; tables the domain's vCPUs share -- promoted PV guest L4s,
> PV shadow L4s, and the PV dom0 L4 under construction -- pass NULL and
> keep the domain-wide L3, which is all a PV domain has.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> Assisted-by: Claude Code:claude-fable-5, Claude Code:claude-opus-4-8, Claude Code:claude-fable-5-1, Claude Code:claude-opus-5-5
> Signed-off-by: George Dunlap <gwd@xenproject.org>
> ---
> Changes in v3:
> - HVM only: PV domains keep the domain-wide area, so the PV parts go
>   (the single-vCPU limit, the shadow refusals, the XPTI slot install).
>   init_xen_l4_slots() takes the vCPU as an extra, optional argument
>   rather than in place of the domain, so PV guest L4s, which no vCPU
>   owns, are promoted exactly as before.

Hm, I see, so this is the reason. PV L4s are promoted ahead of being
loaded into a vCPU %cr3, and hence when init_xen_l4_slots() is called
the per-vCPU L3 to use is not clear.

> - Retitle (was: "x86/mm: introduce per-vCPU L3 page-table").
> - free_compat_arg_xlat()'s comment names free_pervcpu_mappings() as the
>   teardown for a vCPU-PT domain.
> 
> Changes in v2:
> - Added to the series
> 
> Changes since the previously posted version:
> - Expand the commit message with the motivation and the design
>   rationale.
> - Keep domain-wide freeing intact and introduce a vCPU-scoped
>   free_pervcpu_mappings() instead of re-scoping
>   free_perdomain_mappings(); fix the arch_vcpu_create() error-path
>   leaks of a partially built per-vCPU hierarchy.
> - Add a perdomain_l3() helper for the root selection, rather than
>   open-coding the vcpu_pt choice (and testing both root pointers) at
>   each site.
> ---
>  xen/arch/x86/domain.c             | 10 +++--
>  xen/arch/x86/include/asm/domain.h | 12 +++++
>  xen/arch/x86/include/asm/mm.h     |  5 ++-
>  xen/arch/x86/mm.c                 | 73 ++++++++++++++++++++++---------
>  xen/arch/x86/mm/hap/hap.c         |  2 +-
>  xen/arch/x86/mm/shadow/hvm.c      |  2 +-
>  xen/arch/x86/mm/shadow/multi.c    |  5 ++-
>  xen/arch/x86/pv/dom0_build.c      |  2 +-
>  xen/arch/x86/pv/domain.c          |  2 +-
>  xen/arch/x86/x86_64/mm.c          |  7 +--
>  10 files changed, 87 insertions(+), 33 deletions(-)
> 
> diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
> index b670cea52b..0aba2cca2e 100644
> --- a/xen/arch/x86/domain.c
> +++ b/xen/arch/x86/domain.c
> @@ -513,7 +513,7 @@ int arch_vcpu_create(struct vcpu *v)
>  
>      rc = mapcache_vcpu_init(v);
>      if ( rc )
> -        return rc;
> +        goto fail_early;
>  
>      if ( !is_idle_domain(d) )
>      {
> @@ -525,12 +525,12 @@ int arch_vcpu_create(struct vcpu *v)
>           */
>          rc = create_perdomain_mapping(v, PERDOMAIN_VIRT_START, 0, NULL, NULL);
>          if ( rc )
> -            return rc;
> +            goto fail_early;
>  
>          paging_vcpu_init(v);
>  
>          if ( (rc = vcpu_init_fpu(v)) != 0 )
> -            return rc;
> +            goto fail_early;
>  
>          vmce_init_vcpu(v);
>  
> @@ -578,6 +578,8 @@ int arch_vcpu_create(struct vcpu *v)
>      vcpu_destroy_fpu(v);
>      xfree(v->arch.msrs);
>      v->arch.msrs = NULL;
> + fail_early:
> +    free_pervcpu_mappings(v);

Do we really need the extra label?  It would seem to me like the
existing cleanup functions are harmless to execute regardless of
whether the matching initialization routine has been called.

>  
>      return rc;
>  }
> @@ -598,6 +600,8 @@ void arch_vcpu_destroy(struct vcpu *v)
>          pv_vcpu_destroy(v);
>      else
>          ASSERT_UNREACHABLE();
> +
> +    free_pervcpu_mappings(v);
>  }
>  
>  int arch_sanitise_domain_config(struct xen_domctl_createdomain *config)
> diff --git a/xen/arch/x86/include/asm/domain.h b/xen/arch/x86/include/asm/domain.h
> index b192c86bc1..a6c6eaf53a 100644
> --- a/xen/arch/x86/include/asm/domain.h
> +++ b/xen/arch/x86/include/asm/domain.h
> @@ -335,6 +335,11 @@ struct monitor_write_data {
>  
>  struct arch_domain
>  {
> +    /*
> +     * Domain-wide L3 page-table for the L4 per-domain slot, used when
> +     * the domain does not use per-vCPU page-tables (!d->arch.vcpu_pt).
> +     * NULL otherwise (see v->arch.pervcpu_l3_pg and perdomain_l3()).
> +     */
>      struct page_info *perdomain_l3_pg;
>  
>      /* I/O-port admin-specified access capabilities. */
> @@ -691,6 +696,13 @@ struct arch_vcpu
>  
>      struct vcpu_msrs *msrs;
>  
> +    /*
> +     * Per-vCPU L3 page-table for the L4 per-domain slot, used when the
> +     * domain uses per-vCPU page-tables (d->arch.vcpu_pt).  NULL
> +     * otherwise (see d->arch.perdomain_l3_pg and perdomain_l3()).
> +     */
> +    struct page_info *pervcpu_l3_pg;
> +
>      struct {
>          bool next_interrupt_enabled;
>      } monitor;
> diff --git a/xen/arch/x86/include/asm/mm.h b/xen/arch/x86/include/asm/mm.h
> index 87bbe1a6f5..87131dd4bf 100644
> --- a/xen/arch/x86/include/asm/mm.h
> +++ b/xen/arch/x86/include/asm/mm.h
> @@ -369,8 +369,10 @@ int devalidate_page(struct page_info *page, unsigned long type,
>                           int preemptible);
>  
>  void init_xen_pae_l2_slots(l2_pgentry_t *l2t, const struct domain *d);
> +struct page_info *perdomain_l3(const struct vcpu *v);
>  void init_xen_l4_slots(l4_pgentry_t *l4t, mfn_t l4mfn,
> -                       const struct domain *d, mfn_t sl4mfn, bool ro_mpt);
> +                       const struct domain *d, const struct vcpu *v,
> +                       mfn_t sl4mfn, bool ro_mpt);
>  bool fill_ro_mpt(mfn_t mfn);
>  void zap_ro_mpt(mfn_t mfn);
>  
> @@ -609,6 +611,7 @@ int create_perdomain_mapping(struct vcpu *v, unsigned long va,
>  void destroy_perdomain_mapping(const struct vcpu *v, unsigned long va,
>                                 unsigned int nr);
>  void free_perdomain_mappings(struct domain *d);
> +void free_pervcpu_mappings(struct vcpu *v);
>  
>  void __iomem *ioremap_wc(paddr_t pa, size_t len);
>  
> diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
> index ca22107cd3..7258935528 100644
> --- a/xen/arch/x86/mm.c
> +++ b/xen/arch/x86/mm.c
> @@ -1638,6 +1638,17 @@ static int promote_l3_table(struct page_info *page)
>  }
>  #endif /* CONFIG_PV */
>  
> +/*
> + * The root of the per-domain area in use by @v: the vCPU's own L3 for a
> + * vCPU-PT domain, the domain-wide one otherwise.
> + */
> +struct page_info *perdomain_l3(const struct vcpu *v)
> +{
> +    const struct domain *d = v->domain;
> +
> +    return d->arch.vcpu_pt ? v->arch.pervcpu_l3_pg : d->arch.perdomain_l3_pg;
> +}
> +
>  /*
>   * Fill an L4 with Xen entries.
>   *
> @@ -1645,12 +1656,16 @@ static int promote_l3_table(struct page_info *page)
>   * values a guest may have left there from promote_l4_table().
>   *
>   * l4t, l4mfn, and d are mandatory, but l4mfn doesn't need to be the mfn under
> - * *l4t.  All other parameters are optional and will either fill or zero the
> - * appropriate slots.  Pagetables not shared with guests will gain the
> + * *l4t.  v names the vCPU the table is private to (an HVM monitor table, a
> + * 32-bit PV vCPU's Xen-owned L4), or is NULL for tables the domain's vCPUs
> + * share; it is mandatory for a vCPU-PT domain, whose per-domain area is
> + * per-vCPU.  All other parameters are optional and will either fill or zero
> + * the appropriate slots.  Pagetables not shared with guests will gain the
>   * extended directmap.
>   */
>  void init_xen_l4_slots(l4_pgentry_t *l4t, mfn_t l4mfn,
> -                       const struct domain *d, mfn_t sl4mfn, bool ro_mpt)
> +                       const struct domain *d, const struct vcpu *v,
> +                       mfn_t sl4mfn, bool ro_mpt)
>  {
>      /*
>       * PV vcpus need a shortened directmap.  HVM and Idle vcpus get the full
> @@ -1678,8 +1693,11 @@ void init_xen_l4_slots(l4_pgentry_t *l4t, mfn_t l4mfn,
>          l4e_from_mfn(sl4mfn, __PAGE_HYPERVISOR_RW);
>  
>      /* Slot 260: Per-domain mappings. */
> +    ASSERT(!v || v->domain == d);
> +    ASSERT(v || !d->arch.vcpu_pt);
>      l4t[l4_table_offset(PERDOMAIN_VIRT_START)] =
> -        l4e_from_page(d->arch.perdomain_l3_pg, __PAGE_HYPERVISOR_RW);
> +        l4e_from_page(v ? perdomain_l3(v) : d->arch.perdomain_l3_pg,
> +                      __PAGE_HYPERVISOR_RW);
>  
>      /* Slot 4: Per-domain mappings mirror. */
>      BUILD_BUG_ON(IS_ENABLED(CONFIG_PV32) &&
> @@ -1835,7 +1853,7 @@ static int promote_l4_table(struct page_info *page)
>      if ( !rc )
>      {
>          init_xen_l4_slots(pl4e, l4mfn,
> -                          d, INVALID_MFN, VM_ASSIST(d, m2p_strict));
> +                          d, NULL, INVALID_MFN, VM_ASSIST(d, m2p_strict));
>          atomic_inc(&d->arch.pv.nr_l4_pages);
>      }
>      unmap_domain_page(pl4e);
> @@ -6216,7 +6234,7 @@ int create_perdomain_mapping(struct vcpu *v, unsigned long va,
>                               struct page_info **ppg)
>  {
>      struct domain *d = v->domain;
> -    struct page_info *pg;
> +    struct page_info *pg, *l3_pg = perdomain_l3(v);
>      l3_pgentry_t *l3tab;
>      l2_pgentry_t *l2tab;
>      l1_pgentry_t *l1tab;
> @@ -6225,14 +6243,17 @@ int create_perdomain_mapping(struct vcpu *v, unsigned long va,
>      ASSERT(va >= PERDOMAIN_VIRT_START &&
>             va < PERDOMAIN_VIRT_SLOT(PERDOMAIN_SLOTS));
>  
> -    if ( !d->arch.perdomain_l3_pg )
> +    if ( !l3_pg )
>      {
>          pg = alloc_domheap_page(d, MEMF_no_owner);
>          if ( !pg )
>              return -ENOMEM;
>          l3tab = __map_domain_page(pg);
>          clear_page(l3tab);
> -        d->arch.perdomain_l3_pg = pg;
> +        if ( d->arch.vcpu_pt )
> +            v->arch.pervcpu_l3_pg = pg;
> +        else
> +            d->arch.perdomain_l3_pg = pg;
>          if ( !nr )
>          {
>              unmap_domain_page(l3tab);
> @@ -6242,7 +6263,7 @@ int create_perdomain_mapping(struct vcpu *v, unsigned long va,
>      else if ( !nr )
>          return 0;
>      else
> -        l3tab = __map_domain_page(d->arch.perdomain_l3_pg);
> +        l3tab = __map_domain_page(l3_pg);
>  
>      ASSERT(!l3_table_offset(va ^ (va + nr * PAGE_SIZE - 1)));
>  
> @@ -6339,16 +6360,16 @@ void destroy_perdomain_mapping(const struct vcpu *v, unsigned long va,
>                                 unsigned int nr)
>  {
>      const l3_pgentry_t *l3tab, *pl3e;
> -    const struct domain *d = v->domain;
> +    struct page_info *l3_pg = perdomain_l3(v);
>  
>      ASSERT(va >= PERDOMAIN_VIRT_START &&
>             va < PERDOMAIN_VIRT_SLOT(PERDOMAIN_SLOTS));
>      ASSERT(!nr || !l3_table_offset(va ^ (va + nr * PAGE_SIZE - 1)));
>  
> -    if ( !d->arch.perdomain_l3_pg )
> +    if ( !l3_pg )
>          return;
>  
> -    l3tab = __map_domain_page(d->arch.perdomain_l3_pg);
> +    l3tab = __map_domain_page(l3_pg);
>      pl3e = l3tab + l3_table_offset(va);
>  
>      if ( l3e_get_flags(*pl3e) & _PAGE_PRESENT )
> @@ -6387,16 +6408,11 @@ void destroy_perdomain_mapping(const struct vcpu *v, unsigned long va,
>      unmap_domain_page(l3tab);
>  }
>  
> -void free_perdomain_mappings(struct domain *d)
> +static void free_perdomain_l3(struct page_info *l3pg)
>  {
> -    l3_pgentry_t *l3tab;
> +    l3_pgentry_t *l3tab = __map_domain_page(l3pg);
>      unsigned int i;
>  
> -    if ( !d->arch.perdomain_l3_pg )
> -        return;
> -
> -    l3tab = __map_domain_page(d->arch.perdomain_l3_pg);
> -
>      for ( i = 0; i < PERDOMAIN_SLOTS; ++i)
>          if ( l3e_get_flags(l3tab[i]) & _PAGE_PRESENT )
>          {
> @@ -6432,10 +6448,27 @@ void free_perdomain_mappings(struct domain *d)
>          }
>  
>      unmap_domain_page(l3tab);
> -    free_domheap_page(d->arch.perdomain_l3_pg);
> +    free_domheap_page(l3pg);
> +}
> +
> +void free_perdomain_mappings(struct domain *d)
> +{
> +    if ( !d->arch.perdomain_l3_pg )
> +        return;
> +
> +    free_perdomain_l3(d->arch.perdomain_l3_pg);
>      d->arch.perdomain_l3_pg = NULL;
>  }
>  
> +void free_pervcpu_mappings(struct vcpu *v)
> +{
> +    if ( !v->arch.pervcpu_l3_pg )
> +        return;
> +
> +    free_perdomain_l3(v->arch.pervcpu_l3_pg);
> +    v->arch.pervcpu_l3_pg = NULL;

We have been (recently) following the model of first setting the
pointer to NULL, and then freeing it, ie:

struct page_info *l3_pg = v->arch.pervcpu_l3_pg;

if ( !l3_pg )
    return;

v->arch.pervcpu_l3_pg = NULL;
free_perdomain_l3(l3_pg);

Like XFREE() and similar macros.  It's possibly worth using the same
pattern here.

Thanks, Roger.

