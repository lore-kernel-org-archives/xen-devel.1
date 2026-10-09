Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D93C2CA6012
	for <xen-devel@archiver.kernel.org>; Fri,  9 Oct 2026 07:59:20 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1444035.1661056 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xF5VF-0008DV-Aj; Fri, 09 Oct 2026 07:58:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1444035.1661056; Fri, 09 Oct 2026 07:58:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xF5VF-0008DN-74; Fri, 09 Oct 2026 07:58:53 +0000
Received: by outflank-mailman (input) for mailman id 1444035;
 Fri, 09 Oct 2026 07:58:51 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger@xenproject.org>) id 1xF5VD-0008DH-Hm
 for xen-devel@lists.xenproject.org; Fri, 09 Oct 2026 07:58:51 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <roger@xenproject.org>) id 1xF5VC-004haQ-2s;
 Fri, 09 Oct 2026 07:58:50 +0000
Received: from 224.pool85-54-217.dynamic.orange.es ([85.54.217.224]
 helo=localhost) by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <roger@xenproject.org>) id 1xF5VC-000xRX-1h;
 Fri, 09 Oct 2026 07:58:50 +0000
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
	d=xenproject.org; s=20200302mail; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date;
	bh=lr4MY+D+xpnz1ymcfppbFvLxwpTSo1hOMK+sxi+OY5Q=; b=qWd+Vts5xpqkOpHTIijYAbme4C
	SktYu+1WhN56Itb2VXl/Yh5TLQY5O8Ug1D9pmrmT9h2wsZyVpbYgjc1HG2WXRn5sS/1+vpglk5F5G
	b6L3ScqdvqKY2hcktTscC31cZi+ixP2SkDo5HIaVYOkbOIqLMNHGK5JRlyNQZzaYBW1k=;
Date: Fri, 9 Oct 2026 09:58:45 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger@xenproject.org>
To: George Dunlap <gwd@xenproject.org>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: Re: [PATCH v3 17/18] x86/mm: run guest contexts on the sparse
 directmap view
Message-ID: <asietfC0LX4Z7xI7@Mac.lan>
References: <20261007104051.48841-1-gwd@xenproject.org>
 <20261007104051.48841-18-gwd@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261007104051.48841-18-gwd@xenproject.org>

On Wed, Oct 07, 2026 at 11:40:50AM +0100, George Dunlap wrote:
> In init_xen_l4_slots(), if d->arch.sparse_dmap is set, point the
> directmap L3 at the sparse view.
> 
> d->arch.sparse_dmap is decided at domain creation: PV domains all have a
> mapcache, HVM domains need per-vCPU page-tables for one.  No option asks
> for the sparse view yet.

Is it strictly needed to tie the sparse directmap to having a per-vCPU
mapcache on HVM?  AFAICT HVM domains could also use the classic
per-domain mapcache.

> The sparse view becomes active once dom0 is built, before it first runs:
> dom0's construction runs on the full directmap, which it needs, and its
> root page-tables so far (a PV dom0's first L4s, a PVH dom0's monitor
> tables) are switched over then.  A PV dom0 booted with dom0=shadow is
> switched as well: shadow mode is enabled only later, from a tasklet, and
> its shadow L4s then get the sparse view from init_xen_l4_slots(), as for
> any PV domain entering shadow mode.  Anything built later gets the
> sparse view from init_xen_l4_slots().  The sparse view's slots are
> marked NX at activation, as the full directmap's slots are.

Is NX worth mentioning here?  The expectation is that the sparse dmap
slots will use the same attributes as the full dmap, and hence I
would focus on the differences (if any).

> The two directmaps differ where the sparse view leaves memory out, so no
> translation of the full directmap may remain usable on page-tables
> carrying the sparse view.  Directmap mappings stay global nevertheless:
> every CR3 write which can move a CPU onto the sparse view goes through
> switch_cr3_cr4(), which flushes the old page-tables' translations,
> global entries included, before it returns.  The CR3 writes which keep
> entries -- a PV vCPU's switch between its kernel and user page-tables,
> XPTI's entry and exit -- stay within one vCPU's page-tables, which carry
> the same directmap, or go to XPTI's per-CPU root, which maps only Xen's
> own per-CPU pages there.  Removals from the sparse view are flushed on
> every CPU, global entries included.  PV guests running with global
> pages, a PV dom0 not using the sparse view among them, so keep their
> directmap TLB entries across switches between guest kernel and user
> mode.
> 
> Assisted-by: Claude Code:claude-opus-5-5
> Signed-off-by: George Dunlap <gwd@xenproject.org>
> ---
> Changes in v3:
> - New in this version.
> ---
>  xen/arch/x86/include/asm/sparse-directmap.h |  11 ++
>  xen/arch/x86/mm.c                           |   9 +-
>  xen/arch/x86/setup.c                        |   3 +
>  xen/arch/x86/sparse-directmap.c             | 129 ++++++++++++++++++++
>  xen/arch/x86/spec_ctrl.c                    |   7 ++
>  5 files changed, 157 insertions(+), 2 deletions(-)
> 
> diff --git a/xen/arch/x86/include/asm/sparse-directmap.h b/xen/arch/x86/include/asm/sparse-directmap.h
> index 512f8064d6..41866b77e9 100644
> --- a/xen/arch/x86/include/asm/sparse-directmap.h
> +++ b/xen/arch/x86/include/asm/sparse-directmap.h
> @@ -33,7 +33,15 @@ static inline bool sparse_dmap_configured(void)
>      return opt_sparse_dmap_pv || opt_sparse_dmap_hvm;
>  }
>  
> +/* Whether a new domain of the given type is to use the sparse view. */
> +static inline bool sparse_dmap_wanted(bool pv)
> +{
> +    return sparse_dmap_root && (pv ? opt_sparse_dmap_pv : opt_sparse_dmap_hvm);
> +}
> +
>  void sparse_dmap_init(void);
> +void sparse_dmap_activate(void);
> +void sparse_dmap_install(l4_pgentry_t *l4t, bool pv);
>  int sparse_dmap_mirror_map(unsigned long virt, mfn_t mfn, unsigned long nr,
>                             pte_attr_t flags);
>  int sparse_dmap_mirror_modify(unsigned long s, unsigned long e,
> @@ -46,7 +54,10 @@ int sparse_dmap_drop_pagetable(mfn_t mfn);
>  #define sparse_dmap_active false
>  
>  static inline bool sparse_dmap_configured(void) { return false; }
> +static inline bool sparse_dmap_wanted(bool pv) { return false; }
>  static inline void sparse_dmap_init(void) {}
> +static inline void sparse_dmap_activate(void) {}
> +static inline void sparse_dmap_install(l4_pgentry_t *l4t, bool pv) {}
>  static inline int sparse_dmap_mirror_map(unsigned long virt, mfn_t mfn,
>                                           unsigned long nr, pte_attr_t flags)
>  {
> diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
> index 4a1bd9d146..4e2f9e1f12 100644
> --- a/xen/arch/x86/mm.c
> +++ b/xen/arch/x86/mm.c
> @@ -1662,7 +1662,8 @@ struct page_info *perdomain_l3(const struct vcpu *v)
>   * share; it is mandatory for a vCPU-PT domain, whose per-domain area is
>   * per-vCPU.  All other parameters are optional and will either fill or zero
>   * the appropriate slots.  Pagetables not shared with guests will gain the
> - * extended directmap.
> + * extended directmap, unless the domain runs on the sparse view of the
> + * directmap, which replaces the directmap slots (see sparse_dmap_install()).
>   */
>  void init_xen_l4_slots(l4_pgentry_t *l4t, mfn_t l4mfn,
>                         const struct domain *d, const struct vcpu *v,
> @@ -1670,7 +1671,7 @@ void init_xen_l4_slots(l4_pgentry_t *l4t, mfn_t l4mfn,
>  {
>      /*
>       * PV vcpus need a shortened directmap.  HVM and Idle vcpus get the full
> -     * directmap.
> +     * directmap, unless the domain runs on the sparse view (below).
>       */
>      bool short_directmap = !paging_mode_external(d);
>  
> @@ -1743,6 +1744,10 @@ void init_xen_l4_slots(l4_pgentry_t *l4t, mfn_t l4mfn,
>                 (ROOT_PAGETABLE_FIRST_XEN_SLOT + slots -
>                  l4_table_offset(XEN_VIRT_START)) * sizeof(*l4t));
>      }
> +
> +    /* The domain's contexts may run on the sparse view of the directmap. */
> +    if ( sparse_dmap_active && d->arch.sparse_dmap )
> +        sparse_dmap_install(l4t, short_directmap);

Instead of doing the copy of the full directmap from the idle page
tables, and then rewriting, won't it be simpler if the copied
directmap was the correct one right away rather than doing a fixup
afterwards?

>  }
>  
>  bool fill_ro_mpt(mfn_t mfn)
> diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
> index e52388ad28..21edab9cea 100644
> --- a/xen/arch/x86/setup.c
> +++ b/xen/arch/x86/setup.c
> @@ -2216,6 +2216,9 @@ void asmlinkage __init noreturn __start_xen(void)
>      if ( !dom0 )
>          panic("Could not set up DOM0 guest OS\n");
>  
> +    /* Before dom0 first runs, and after it was built on the full directmap. */
> +    sparse_dmap_activate();
> +
>      heap_init_late();
>  
>      init_constructors();
> diff --git a/xen/arch/x86/sparse-directmap.c b/xen/arch/x86/sparse-directmap.c
> index ef13f9e95d..54a6e36132 100644
> --- a/xen/arch/x86/sparse-directmap.c
> +++ b/xen/arch/x86/sparse-directmap.c
> @@ -46,8 +46,10 @@
>  #include <xen/lib.h>
>  #include <xen/mm.h>
>  #include <xen/numa.h>
> +#include <xen/sched.h>
>  #include <xen/sort.h>
>  
> +#include <asm/flushtlb.h>
>  #include <asm/page.h>
>  #include <asm/sparse-directmap.h>
>  
> @@ -437,3 +439,130 @@ void __init sparse_dmap_init(void)
>  
>      printk(XENLOG_INFO "Sparse directmap: %lu pages mapped\n", mapped);
>  }
> +
> +/*
> + * Point the directmap slots of the root page-table @l4t at the sparse view.
> + * Every slot it covers gets its L3, whatever the full directmap has there,
> + * so that memory added later is covered too.  A PV root has guest slots
> + * above; any other root loses the rest of the directmap, which the sparse
> + * view does not cover.
> + *
> + * Directmap mappings may be global, in either hierarchy.  Translations of
> + * the full directmap must not remain usable on a root carrying the sparse
> + * view: every CR3 write which can move a CPU from the one to the other goes
> + * through switch_cr3_cr4(), which flushes what the old root left in the TLB,
> + * global entries included, before it returns.  The other CR3 writes, which
> + * may keep global or PCID-tagged entries (_toggle_guest_pt(), XPTI's entry
> + * and exit paths), switch between one vCPU's roots, which carry the same
> + * directmap, or to XPTI's per-CPU root, which maps only this CPU's stack,
> + * IDT and TSS there.  Removals from the sparse view flush all CPUs, global
> + * entries included.

IMO parts of this comment are likely out of scope here.  It's fine to
discuss about the flushing strategy in the commit message, however
doing so in a comment here, that's disconnected from the definitions
of switch_cr3_cr4() and _toggle_guest_pt() seems out of place.

I would also avoid referencing function names in code comments: it's
fine to do so in the commit message, but it's likely those references
in comments will go stale as functions change names or disappear.
Commit messages are otherwise tied to a specific point in time, so the
context and the referenced functions are always accurate and it will
never go stale in the context is was committed.

> + */
> +void sparse_dmap_install(l4_pgentry_t *l4t, bool pv)
> +{
> +    unsigned int i;
> +
> +    ASSERT(sparse_dmap_root);
> +
> +    for ( i = l4_table_offset(SPARSE_DMAP_START);
> +          i < l4_table_offset(SPARSE_DMAP_END); i++ )
> +        l4t[i] = sparse_dmap_root[i];
> +
> +    if ( !pv )
> +        for ( ; i < l4_table_offset(DIRECTMAP_VIRT_END); i++ )
> +            l4t[i] = l4e_empty();
> +}
> +
> +static void __init sparse_dmap_install_mfn(mfn_t mfn, bool pv)
> +{
> +    l4_pgentry_t *l4t = map_domain_page(mfn);
> +
> +    sparse_dmap_install(l4t, pv);
> +    unmap_domain_page(l4t);
> +}
> +
> +/*
> + * Let guest contexts run on the sparse view.  Root page-tables built from
> + * here on carry it (init_xen_l4_slots()); those of the domains built so far
> + * (dom0, which has not run yet) are switched over here.  Its construction ran
> + * on the full directmap, and needed to.
> + */
> +void __init sparse_dmap_activate(void)
> +{
> +    struct domain *d;
> +    struct vcpu *v;
> +    unsigned long va, mapped = 0;
> +    unsigned int i, switched = 0;
> +
> +    if ( !sparse_dmap_root )
> +        return;
> +
> +    /*
> +     * Nothing in the directmap is executed: as subarch_init_memory() does
> +     * for the full directmap, mark the sparse view's slots NX, before any
> +     * root page-table takes a copy of them.
> +     */
> +    if ( cpu_has_nx )
> +        for ( i = l4_table_offset(SPARSE_DMAP_START);
> +              i < l4_table_offset(SPARSE_DMAP_END); i++ )
> +            l4e_add_flags(sparse_dmap_root[i], _PAGE_NX_BIT);

Shouldn't this be done when the sparse directmap L4 are populated,
instead of here?

> +
> +    rcu_read_lock(&domlist_read_lock);
> +
> +    for_each_domain ( d )
> +    {
> +        if ( !d->arch.sparse_dmap )
> +            continue;

You should likely ensure the domain is paused here, otherwise nothing
good can came out of playing with its root page-table.

> +
> +        /*
> +         * A PV domain runs on shadow L4s only in shadow mode, which boot
> +         * does not enter before this point: dom0=shadow enables it later,
> +         * from a tasklet, and the shadow L4s then get the sparse view from
> +         * init_xen_l4_slots(), as for any PV domain entering shadow mode.
> +         */
> +        switched++;
> +        for_each_vcpu ( d, v )
> +        {
> +            if ( is_hvm_vcpu(v) )

nit: you could pull is_hvm_vcpu() out of the loop and store in a
boolean, so that you don't need to call it for each domain vCPU.

> +            {
> +                if ( !pagetable_is_null(v->arch.hvm.monitor_table) )
> +                    sparse_dmap_install_mfn(
> +                        pagetable_get_mfn(v->arch.hvm.monitor_table), false);
> +                continue;
> +            }
> +
> +            if ( !pagetable_is_null(v->arch.guest_table) )
> +                sparse_dmap_install_mfn(
> +                    pagetable_get_mfn(v->arch.guest_table), true);
> +            if ( !pagetable_is_null(v->arch.guest_table_user) )
> +                sparse_dmap_install_mfn(
> +                    pagetable_get_mfn(v->arch.guest_table_user), true);
> +        }
> +    }
> +
> +    rcu_read_unlock(&domlist_read_lock);
> +
> +    /*
> +     * Belt and braces: nothing runs on these page-tables yet, and PV dom0's
> +     * construction, which ran on its own, returned to the idle page-tables
> +     * through switch_cr3_cr4(), dropping what it left in the TLB.
> +     */
> +    flush_all(FLUSH_TLB_GLOBAL);
> +
> +    sparse_dmap_active = true;
> +
> +    for ( va = SPARSE_DMAP_START; va < SPARSE_DMAP_END; )
> +    {
> +        pte_attr_t flags;
> +        unsigned long n;
> +
> +        if ( !mfn_eq(xen_mapping_lookup(sparse_dmap_root, va, &flags, &n),
> +                     INVALID_MFN) )
> +            mapped += n;
> +        va += n << PAGE_SHIFT;
> +    }

This looks to be extremely expensive just for the purposes of printing
the number of mapped pages in the sparse directmap, it should be under
CONFIG_DEBUG if anything.

Thanks, Roger.

