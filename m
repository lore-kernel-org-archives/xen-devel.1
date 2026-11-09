Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 856F0606A322
	for <xen-devel@archiver.kernel.org>; Mon,  9 Nov 2026 14:58:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=vates.tech header.i=@vates.tech header.a=rsa-sha256 header.s=selector1 header.b=QRDKYxLt
Received: from list by lists.xenproject.org with outflank-mailman.1480214.1684178 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQQoo-0005Od-DJ; Mon, 09 Nov 2026 14:57:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1480214.1684178; Mon, 09 Nov 2026 14:57:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQQoo-0005OW-AT; Mon, 09 Nov 2026 14:57:58 +0000
Received: by outflank-mailman (input) for mailman id 1480214;
 Mon, 09 Nov 2026 14:57:57 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a1c0d0cd62000403d@swg.vates.tech>)
 id 1xQQom-0005OF-R1
 for xen-devel@lists.xenproject.org; Mon, 09 Nov 2026 14:57:57 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xQQom-004JZs-0t
 for xen-devel@lists.xenproject.org; Mon, 09 Nov 2026 15:57:56 +0100
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a1c0d0cd62000403d@swg.vates.tech>)
 id 6af1df61-bab6-0a2a0a5309dd-0a2a4509b43c-36
 for <xen-devel@lists.xenproject.org>; Mon, 09 Nov 2026 15:57:55 +0100
Received: from [185.255.28.35] (helo=prod-mta-13-02.swg-srv.net)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a1c0d0cd62000403d@swg.vates.tech>)
 id 6af1df73-be1a-0a2a45090019-b9ff1c23a087-3
 for <xen-devel@lists.xenproject.org>; Mon, 09 Nov 2026 15:57:55 +0100
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-02.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a1c0d0cd62000403d.007 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 09 Nov 2026 14:57:51 +0000
Received: from [100.68.94.6] (areims-651-1-80-194.w90-18.abo.wanadoo.fr
 [90.18.187.194]) (Authenticated sender: baptiste.le-duc)
 by mail2.vates.fr (Postfix) with ESMTPSA id 1386082191;
 Mon,  9 Nov 2026 15:57:51 +0100 (CET)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=vates.tech header.i="@vates.tech" header.h="From:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:References:Feedback-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech;
 q=dns/txt; s=selector1; bh=o0lfqTwCf1N+PscNT4QvCibY7SxKauPhgfpJ0dhSFm8=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:content-transfer-encoding:in-reply-to:references:feedback-id;
 b=QRDKYxLtKl2nDtA2xh2B/dNSWtqyYGt6uhZw4Kf8PEumrGYJYrix3pTyIt5enCIKwyaCyEQ+I
 3uqlKphV06uRrfTDxwLyE+4VkzgLYsQlBJTm2voIjF/KFNGKrHwuUJoF2qeqxKiWXGwQxEFEZZ0
 Ra+R/vXeGKB9K/ezUWGtzm9vBDmTslrt+N0ENxPEO7qXU4E3bQJvfhBO7f4luDEGW8fWBNBw9eF
 gyFy5TA8yOPShn39t8limTphpOr8GTL2eXltdyWqLn4BB7aD6v03pJxTwQEZWt0RZALMdeJFcV1
 gVHBCKi9W9MHCa96vdAOMN8O4/WYH9u0soJFnWBpHI4A==
X-Zone-Loop: bb6345a7797a1f3564b7693820f405c839dd2a546fde
x-campaign-type: default
x-transaction-id: bb7611df-1746-4ca8-93d4-c0b17bdfd913
x-swg-uid: 01-762b211a-3453-4dcf-869b-5f5af7168dae
X-Mailer: Sweego
Message-ID:
 <1794236272.8631fc262581453bbf619ec5b2062170.1a1c0d0cd62000403d@vates.tech>
x-swg-bid: 1794236272.8631fc262581453bbf619ec5b2062170.1a1c0d0cd62000403d
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v7 2/3] xen/mm: Introduce NUMA-aware memory claim sets
From: Baptiste Le Duc <baptiste.le-duc@vates.tech>
To: Bernhard Kaindl <bernhard.kaindl@citrix.com>
Cc: xen-devel@lists.xenproject.org, 
 Anthony PERARD <anthony.perard@vates.tech>, Juergen Gross <jgross@suse.com>, 
 Andrew Cooper <andrew.cooper3@citrix.com>, 
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, 
 Julien Grall <julien@xen.org>, 
 =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
 Stefano Stabellini <sstabellini@kernel.org>, 
 "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <ddcc692d642aaf6dec84dcdb17ebaf2b8c09c7b0.1778272036.git.bernhard.kaindl@citrix.com>
References: <cover.1778272036.git.bernhard.kaindl@citrix.com>
 <ddcc692d642aaf6dec84dcdb17ebaf2b8c09c7b0.1778272036.git.bernhard.kaindl@citrix.com>
Date: Mon, 09 Nov 2026 15:57:44 +0100
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794236265; l=24306;
 i=baptiste.le-duc@vates.tech; s=20260810; h=from:subject:message-id;
 bh=MIhhFCBwbx/vqq4f/IiP3pVyiFfFiQ4gWX1AO8OYnvA=;
 b=v8zj3Ud37pF21cO6gNsNAqFzLx+p4t6v3yCe+LkWUfEtClD+evUXf+KrMTWNOV4yEyA8nXVXe
 WYBivR0+w+vB1co2h0V+k5Hv3uUv1Wk94aIWwnj8YKuHQOaOdccyqg+
X-Developer-Key: i=baptiste.le-duc@vates.tech; a=ed25519;
 pk=N+BbdvMXRzrCuX/ieh4RWodiAKcLNvI+KjflcZ0oXCo=
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1794236271270
X-purgate-ID: tlsNG-bad1c0/1794236275-BC6CA034-EC17B86D/0/0
X-purgate-type: clean
X-purgate-size: 24306
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Bernhard,

Thanks for the patch! At ~500 changed lines it is hard to review in one
go. Could you split it into smaller patches, ideally under 200 lines
each? For instance:

  1. domain_{set,get}_claim_entries(), with XENMEM_claim_pages and
     domain_kill() converted to it,
  2. per-node claim accounting in the allocator (claimed_pages[],
     d->claims[], redeeming in alloc_heap_pages()/get_free_buddy()),
  3. restoring the claim invariants on page offlining,
  4. the new XEN_DOMCTL_claim_memory (public header, domctl, XSM),
  5. the xc_domain_claim_memory() wrapper in libxenctrl.

Some comments below :)

> This commit extends Xen's memory claim design to support installing claim
> sets spanning multiple NUMA nodes atomically. As Roger Pau Monné suggested:
> 
>   Ideally, we would need to introduce a new hypercall that allows
>   making claims from multiple nodes in a single locked region, as to
>   ensure success or failure in an atomic way.
> 
Quoting a mail in the commit message seems unusual in Xen. Credit should
go in a tag as a Suggested-by trailer, and the motivation could simply be
stated, e.g.:

  Installing per-node claims one by one is not atomic: a request may
  succeed on some nodes and fail on others. Introduce a hypercall
  that installs a set of claims spanning multiple nodes under a single
  lock, so that it either fully succeeds or fully fails.

> A claim set can contain multiple node-specific claims and a host-wide
> claim for memory that may come from any NUMA node. The new domctl
> installs the full claim set atomically, and the allocator is updated
> so that claim checks and claim consumption follow the new semantics.
> 
> This adds:
> 
> 1. installing multi-node claim sets atomically,
> 2. protecting claimed pages from other claim requests and allocations, and
> 3. redeeming held claims when satisfying allocations.

"redeem" is used throughout the patch (here, in alloc_heap_pages()
and in the public header) but never defined. Could you add a sentence
saying what it means? E.g.:

  Redeeming a claim means consuming it through allocation: each page
  allocated to the domain decreases its claim by one. This differs from
  releasing a claim, which drops it without any allocation.
> 
> Legacy XENMEM_claim_pages behaviour is preserved; the interface is
> deprecated and superseded by XEN_DOMCTL_claim_memory.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> Signed-off-by: Bernhard Kaindl <bernhard.kaindl@citrix.com>

> ---
> The v7 design document submitted ahead of this series may help with review.
> It explains the background, design rationale, and implementation details.
> 
> Rendered version: https://xen.kaindl.dev/claims-v7-design/designs/claims
Very useful, thanks!
> [ ... 44 lines skipped ... ]
> diff --git a/tools/libs/ctrl/xc_domain.c b/tools/libs/ctrl/xc_domain.c
> index 01c0669c88..f78e085dd7 100644
> --- a/tools/libs/ctrl/xc_domain.c
> +++ b/tools/libs/ctrl/xc_domain.c
> @@ -1070,6 +1070,34 @@ int xc_domain_remove_from_physmap(xc_interface *xch,
>      return xc_memory_op(xch, XENMEM_remove_from_physmap, &xrfp, sizeof(xrfp));
>  }
>  
> +/* Set or get memory claims for a domain. */

This comment may not be needed: the function is already documented in
the header file.

> [ ... 26 lines skipped ... ]
> +/* XENMEM_claim_pages is deprecated; use xc_domain_claim_memory() instead. */

Shouldn't XENMEM_claim_pages then be formally deprecated, e.g. with a
warning when it is used? I don't know whether Xen has such a practice,
but it would notify users without breaking the hypercall ABI.

>  int xc_domain_claim_pages(xc_interface *xch,
>                                 uint32_t domid,
>                                 unsigned long nr_pages)

> diff --git a/xen/common/domain.c b/xen/common/domain.c
> index bb9e210c28..8cb4241b05 100644
> --- a/xen/common/domain.c
> +++ b/xen/common/domain.c
> @@ -1319,7 +1319,10 @@ int domain_kill(struct domain *d)
>          rspin_barrier(&d->domain_lock);
>          argo_destroy(d);
>          vnuma_destroy(d->vnuma);
> -        domain_set_outstanding_pages(d, 0);
> +        /* Release all outstanding claims of the domain. */
> +        domain_set_claim_entries(d, 1, &(xen_memory_claim_t){
> +            .target = XEN_DOMCTL_CLAIM_MEMORY_HOST, .pages = 0,
> +        });
Installing an empty host-wide claim to release everything works, but the
reader has to go through domain_set_claim_entries() to see that it can't
fail and ends up in release_existing. Could page_alloc.c instead export a
small domain_release_claims(d) helper, taking the locks and calling
domain_recall_node_claims() + domain_release_host_claims()? That keeps the
release helpers static and makes this call self-explanatory.

> [ ... 3 lines skipped ... ]
> diff --git a/xen/common/domctl.c b/xen/common/domctl.c
> index 93738931c5..391f256f01 100644
> --- a/xen/common/domctl.c
> +++ b/xen/common/domctl.c
> @@ -51,6 +51,57 @@ static int xenctl_bitmap_to_nodemask(nodemask_t *nodemask,
>                                     MAX_NUMNODES);
>  }
>  
> +/* Set or get memory claims for a domain. */
> +static int claim_memory(struct domain *d,
> +                        struct xen_domctl_claim_memory *uinfo, bool *copyback)
> +{
> +    xen_memory_claim_t *entries;
> +    int rc = -EFAULT;
> +
> +    /* Reject LLC coloring; alloc_color_heap_page() does not handle claims. */
> +    if ( llc_coloring_enabled )
> +        return -EOPNOTSUPP;
> +
> +    switch ( uinfo->mode )
> +    {
> +    case XEN_DOMCTL_CLAIM_MEMORY_SET:
> +        if ( !uinfo->nr_entries )
> +            return -EINVAL;
> +        if ( uinfo->nr_entries > MAX_NUMNODES + 1 )
> +            return -E2BIG;
> +        break;
> +    case XEN_DOMCTL_CLAIM_MEMORY_GET:
> +        if ( uinfo->nr_entries > MAX_NUMNODES + 1 )
> +            uinfo->nr_entries = MAX_NUMNODES + 1;
> +        break;
> +    default:
> +        return -EOPNOTSUPP;
> +    }
> +    if ( d->is_dying )
> +        return -ESRCH;
> +
> +    entries = xmalloc_array(xen_memory_claim_t, uinfo->nr_entries);
> +    if ( entries == NULL )

Nit: !entries.

> +        return -ENOMEM;
> +
> +    switch ( uinfo->mode )
> +    {
> +    case XEN_DOMCTL_CLAIM_MEMORY_SET:
> +        if ( !copy_from_guest(entries, uinfo->claim_set, uinfo->nr_entries) )
> +            rc = domain_set_claim_entries(d, uinfo->nr_entries, entries);
> +        break;
> +    case XEN_DOMCTL_CLAIM_MEMORY_GET:
> +        rc = domain_get_claim_entries(d, &uinfo->nr_entries, entries);
> +        *copyback = true;
> +        if ( !rc && copy_to_guest(uinfo->claim_set, entries,
> +                                  uinfo->nr_entries) )
> +            rc = -EFAULT;
> +        break;
> +    }
> +    xfree(entries);
> +    return rc;

Blank line before the final return.

> [ ... 128 lines skipped ... ]
> @@ -858,6 +805,253 @@ static void check_and_stop_scrub(struct page_info *head)
>      }
>  }
>  
> +/* Release claims from the host-wide claims pool of the domain. */
> +static unsigned long domain_release_host_claims(struct domain *d,
> +                                                unsigned long release)
> +{
> +    unsigned long host_wide_claims;
> +
> +    ASSERT(d->outstanding_pages >= d->node_claims);
> +    host_wide_claims = d->outstanding_pages - d->node_claims;
> +
> +    if ( release > host_wide_claims )
> +        release = host_wide_claims;
> +
> +    ASSERT(release <= outstanding_claims);
> +
> +    outstanding_claims -= release;
> +    d->outstanding_pages -= release;
> +
> +    return release;
> +}
> +
> +/* Release claims from the node-specific claims pool of the domain. */
> +static unsigned long domain_release_node_claims(
I'm a bit confused by the naming of domain_release_node_claims() and
domain_recall_node_claims(): both release node claims, the only
difference being that the former targets one given node while the
latter walks all nodes. I'd suggest naming them after that:

    domain_release_node_claim(d, node, pages);  /* one given node */
    domain_release_any_node_claims(d, pages);   /* any node */

> +    struct domain *d, nodeid_t node, unsigned long release)

Nit: the parameters fit when aligned after the (, like
domain_release_host_claims() above.

> [ ... 42 lines skipped ... ]
> +/* Get claim entries for the outstanding claims of a domain. */
> +int domain_get_claim_entries(struct domain *d, uint32_t *nr_entries,
> +                             xen_memory_claim_t *entries)
> +{
> +    unsigned int needed_entries = 1, max_entries = *nr_entries;
> +    nodeid_t node;
> +
> +    /* If max_entries is 0, only the number of needed entries is returned. */
> +    if ( max_entries )
> +    {
> +        memset(entries, 0, sizeof(*entries) * max_entries);
> +        entries[0].target = XEN_DOMCTL_CLAIM_MEMORY_HOST;
> +    }
> +
> +    spin_lock(&heap_lock);
> +    if ( max_entries )
> +    {
> +        ASSERT(d->outstanding_pages >= d->node_claims);
> +        entries[0].pages = d->outstanding_pages - d->node_claims;
> +    }
> +
> +    for_each_online_node ( node )
> +    {
> +        if ( !d->claims[node] )
> +            continue;
> +
> +        if ( needed_entries < max_entries )
> +        {
> +            entries[needed_entries].target = node;
> +            entries[needed_entries].pages = d->claims[node];
> +        }
> +        needed_entries++;
> +    }
> +    spin_unlock(&heap_lock);
> +    *nr_entries = needed_entries;
> +    return needed_entries <= max_entries ? 0 : -ERANGE;

Blank line before the final return.

> +}
> +
> +/* Validate a set of claim records and install it if valid. */
> +int domain_set_claim_entries(struct domain *d, uint32_t nr_entries,
> +                             const xen_memory_claim_t *claim_set)
> +{
> +    uint64_t avail_pages, request, node_requests = 0, host_requests = 0;

I think native types would fit better for avail_pages and request. What
about:

    unsigned long avail_pages, request;
    uint64_t node_requests = 0, host_requests = 0;

The accumulators can stay uint64_t: node_requests + host_requests +
domain_tot_pages(d) can exceed UINT_MAX, which would not fit in a 32-bit
unsigned long.

With that, you would need to add this check just before
`request = claim_set[i].pages`, since `pages` is a uint64_t, to make sure
there is no narrowing conversion:

    if ( claim_set[i].pages > d->max_pages )
        goto out;

As d->max_pages is an unsigned int, claim_set[i].pages is then
guaranteed to fit in request.

> +    nodemask_t nodes;
> +    uint32_t node;

And here:

    unsigned int node;

> +    int ret = -EINVAL;
> +    bool host_request_seen = false, legacy_semantics = false;
> +
I think it would be worth stating nr_entries != 0 as a precondition, or
adding a check:

    if ( !nr_entries )
        return ret;

I understand the only caller, claim_memory(), already checks it, but with
nr_entries == 0 this function silently goes to release_existing and drops
all existing claims, which a future caller may not expect.

> +    /*
> +     * Two locks are needed here:
> +     *  - d->page_alloc_lock: protects accesses to d->{tot,max,extra}_pages.
> +     *  - heap_lock: protects accesses to total_avail_pages, node_avail_pages,
> +     *    avail[], scrub state and all total and node-specific claim counters.
> +     */
> +    nrspin_lock(&d->page_alloc_lock);
> +    spin_lock(&heap_lock);
> +
> +    /*
> +     * Phase 1: Check and process the individual claim entries. Check
> +     * the node-specific claim requests, and validate them against the
> +     * available memory. Track legacy and host-wide claim requests and
> +     * prepare validation of the combined claims in Phase 2.
> +     */
> +    nodes_clear(nodes);
> +    for ( uint32_t i = 0; i < nr_entries; i++ )

Nit: unsigned int would fit better for i. Also, avail_pages, request and
node are only used inside the loops, so their scope can be reduced.

> +    {
> +        node = claim_set[i].target;
> +        request = claim_set[i].pages;
> +
> +        if ( claim_set[i].cmd ) /* Reserved for possible future use. */
> +            goto out;
> +
> +        switch ( node )
> +        {
> +        case XEN_DOMCTL_CLAIM_MEMORY_LEGACY:
> +            legacy_semantics = true;
> +            fallthrough;
> +        case XEN_DOMCTL_CLAIM_MEMORY_HOST:
> +            if ( host_request_seen ) /* Only one host-wide request allowed. */

Nit: maybe a gdprintk() here, so the caller can tell why the request
was rejected?

> +                goto out;
> +
> +            host_request_seen = true;
> +            host_requests = request;
> +            continue;
> +        }

Missing default label here (MISRA C:2012 Rule 16.4):

        default:
            break;

> +
> +        /* Node-specific claim. */
> +        if ( node >= MAX_NUMNODES || !node_online(node) )
> +        {
> +            ret = -ENOENT; /* Node not valid or not online. */
> +            goto out;
> +        }
> +
> +        if ( nodemask_test(node, &nodes) ) /* Only one request per node. */
> +            goto out;
> +        node_set(node, nodes);
> +
> +        ASSERT(node_avail_pages[node] >= claimed_pages[node]);
> +        avail_pages = node_avail_pages[node] - claimed_pages[node];
> +
Nit: could you add a short comment explaining why d->claims[node] is
added back? Something like:

    /* The new claim replaces the domain's current one on this node. */

> +        if ( request > avail_pages + d->claims[node] )
> +        {
> +            ret = -ENOMEM; /* Request exceeds available memory on node. */
> +            goto out;
> +        }

I'm not sure a comment describing behaviour that happens later makes
sense here.

> +        node_requests += request; /* The combined total is checked below. */
> +    }
> +
> +    /*
> +     * Phase 2: Validate the combined claim set.
> +     * Apply legacy semantics if needed, then check that the total fits
> +     * within d->max_pages and within the available unclaimed heap memory.
> +     * A zero new-claim request is a pure release; skip validation entirely.
> +     */
> +    if ( legacy_semantics )
> +    {
> +        if ( node_requests )

Shouldn't there be a debug trace saying that node-specific requests are not
supported with legacy semantics?

> +            goto out;
> +
> +        if ( !host_requests )
> +            goto release_existing;
> +
> +        /*
> +         * Legacy semantics require the request to exceed the current
> +         * allocation; the request is then reduced by the current allocation.
> +         * Existing outstanding claims are not allowed.
> +         */
> +        if ( d->outstanding_pages ||
> +             host_requests <= domain_tot_pages(d) )

This fits on one line.

> +            goto out;
> +
> +        host_requests -= domain_tot_pages(d);
> +    }
> +    else if ( !host_requests && !node_requests )
> +        goto release_existing;
> +
> +    /* Ensure new claims plus domain_tot_pages() fit into d->max_pages. */
> +    if ( host_requests > d->max_pages ||
> +         node_requests > d->max_pages - host_requests ||
> +         node_requests + host_requests + domain_tot_pages(d) > d->max_pages )
> +        goto out;


With the per-entry check suggested above:

    if ( claim_set[i].pages > d->max_pages )
        goto out;

each entry is at most UINT_MAX, so:
- host_requests <= UINT_MAX, as it comes from a single entry;
- domain_tot_pages(d) <= UINT_MAX;
- node_requests <= MAX_NUMNODES * UINT_MAX, as there is at most one
  entry per node. With MAX_NUMNODES = 64, that is below 2^38.

The sum is computed in uint64_t, since node_requests is a uint64_t, and
stays below 2^39, so it can't overflow. The first two conditions only
guard against that overflow and are implied by the third one, so this
can be reduced to:

    if ( node_requests + host_requests + domain_tot_pages(d) > d->max_pages )
        goto out;

> +
> +    /* Ensure new claims fit in the total unclaimed heap memory. */
> +    ASSERT(total_avail_pages >= outstanding_claims);
> +    if ( node_requests + host_requests >
> +         (total_avail_pages - outstanding_claims) + d->outstanding_pages )
> +    {
> +        /* New claims would exceed available unclaimed memory. */
> +        ret = -ENOMEM;
> +        goto out;
> +    }

Nit: a local would make this easier to read, e.g.:

    unsigned long unclaimed = total_avail_pages - outstanding_claims;

> +
> + release_existing:
> +    /* Phase 3: Remove the old claims before installing the new claims. */
> +    domain_recall_node_claims(d, d->node_claims);
> +    domain_release_host_claims(d, d->outstanding_pages);
> +    ASSERT(!d->node_claims && !d->outstanding_pages);
> +
> +    /* Phase 4: Install new node-specific and host-wide claims. */
> +    d->node_claims = node_requests;
> +    d->outstanding_pages = host_requests + node_requests;
> +    outstanding_claims += d->outstanding_pages;
> +
> +    /* Phase 5: Install the individual node claims. */
> +    for ( uint32_t i = 0; i < nr_entries; i++ )

Nit: unsigned int here too.

> +    {
> +        node = claim_set[i].target;
> +        request = claim_set[i].pages;
> +        if ( node >= MAX_NUMNODES ) /* Skip non-node claim targets. */
> +            continue;
> +
> +        ASSERT(!d->claims[node]);
> +        d->claims[node] = request;
> +        claimed_pages[node] += request;
> +    }
> +    ret = 0;
> + out:
> +    spin_unlock(&heap_lock);
> +    nrspin_unlock(&d->page_alloc_lock);
> +    return ret;

Blank line before the label and before the final return.

> +}
> +
>  static struct page_info *get_free_buddy(unsigned int zone_lo,
>                                          unsigned int zone_hi,
>                                          unsigned int order, unsigned int memflags,
> @@ -907,6 +1101,18 @@ static struct page_info *get_free_buddy(unsigned int zone_lo,
>       */
>      for ( ; ; )
>      {
> +        unsigned long avail_pages;
> +
> +        ASSERT(node_avail_pages[node] >= claimed_pages[node]);
> +        avail_pages = node_avail_pages[node] - claimed_pages[node];
> +
> +        if ( d && !(memflags & MEMF_no_refcount) )
> +            avail_pages += d->claims[node];
> +
> +        /* Skip this node if memory and claims do not permit this request. */
> +        if ( avail_pages < (1UL << order) )

Nit: 1UL << order is now used twice per node iteration (here and in the
avail[node][zone] check below). What about a local, as alloc_heap_pages()
already does:

    unsigned long request = 1UL << order;

> [ ... 13 lines skipped ... ]
> @@ -1047,13 +1254,13 @@ static struct page_info *alloc_heap_pages(
>          }
>      }
>  
> -    ASSERT(avail[node][zone] >= request);
> -    avail[node][zone] -= request;
> -    ASSERT(total_avail_pages >= request);
> -    total_avail_pages -= request;
> -    ASSERT(node_avail_pages[node] >= request);
> -    node_avail_pages[node] -= request;
> -
> +    /*
> +     * Ensure the domain's claims are fully redeemed before deducting
> +     * the allocation from the page counters, otherwise the host or the
> +     * node might be left with more claims than available pages. This would
> +     * break the invariants claimed_pages[node] <= node_avail_pages[node]
> +     * and outstanding_claims <= total_avail_pages.
> +     */
>      if ( d && d->outstanding_pages && !(memflags & MEMF_no_refcount) )
>      {
>          /*
> @@ -1071,13 +1278,34 @@ static struct page_info *alloc_heap_pages(
>           * the domain being destroyed before creation is finished.  Losing part
>           * of the claim makes no difference.
>           */
> -        unsigned long outstanding = min(d->outstanding_pages + 0UL, request);
> +        unsigned long redeem = min(d->outstanding_pages + 0UL, request);
> +
> +        BUG_ON(redeem > outstanding_claims);
> +
> +        /* Maintain invariant: claimed_pages[node] <= node_avail_pages[node] */
> +        redeem -= domain_release_node_claims(d, node, redeem);
>  
> -        BUG_ON(outstanding > outstanding_claims);
> -        outstanding_claims -= outstanding;
> -        d->outstanding_pages -= outstanding;
> +        if ( redeem )
> +        {
> +            /*
> +             * Maintain the invariant outstanding_claims <= total_avail_pages:
> +             * Redeem from the host-wide claims pool and if needed from other
> +             * nodes' claims pools to maintain that outstanding_claims do not
> +             * exceed total_avail_pages after deducting the allocation.

Nit: this repeats the outstanding_claims <= total_avail_pages statement
from the first line. I'd trim it to:

            /*
             * Redeem from the host-wide claims pool and, if needed, from
             * other nodes' claims pools to keep outstanding_claims <=
             * total_avail_pages after deducting the allocation.
             */

> [ ... 25 lines skipped ... ]
> @@ -1256,6 +1485,43 @@ static int reserve_offlined_page(struct page_info *head)
>          count++;
>      }
>  
> +    /* Offlining pages may violate claim invariants; restore them if needed. */

Which invariants, and in which case does offlining break them? I can work
it out because I'm reading the series in order, but someone reading this
code once it's committed won't have that context. Please spell both out
here, or in the commit message.

> [ ... 39 lines skipped ... ]
> diff --git a/xen/include/public/domctl.h b/xen/include/public/domctl.h
> index 8f6708c0a7..352d7095c9 100644
> --- a/xen/include/public/domctl.h
> +++ b/xen/include/public/domctl.h
> @@ -1276,6 +1276,42 @@ struct xen_domctl_get_domain_state {
>      uint64_t unique_id;      /* Unique domain identifier. */
>  };
>  
> +struct xen_memory_claim {
> +    uint64_aligned_t pages; /* Number of pages to claim. */
> +    uint32_t target;        /* NUMA node or special target constant. */
> +    uint32_t cmd;           /* Reserved, must be zero. */
> +};
> +typedef struct xen_memory_claim xen_memory_claim_t;
> +DEFINE_XEN_GUEST_HANDLE(xen_memory_claim_t);
> +
> +/* Special claim targets for the target field of xen_memory_claim_t. */
> +#define XEN_DOMCTL_CLAIM_MEMORY_HOST     0x80000000U /* Host-wide claims. */
> +#define XEN_DOMCTL_CLAIM_MEMORY_LEGACY   0x40000000U /* Legacy semantics. */

How did you choose these values? IMO the rationale belongs in the commit
message.

> [ ... 44 lines skipped ... ]
> diff --git a/xen/include/public/memory.h b/xen/include/public/memory.h
> index bd9fc37b52..086334af05 100644
> --- a/xen/include/public/memory.h
> +++ b/xen/include/public/memory.h
> @@ -569,6 +569,8 @@ DEFINE_XEN_GUEST_HANDLE(xen_mem_sharing_op_t);
>   * for 10, only 7 additional pages are claimed.
>   *
>   * Caller must be privileged or the hypercall fails.
> + *
> + * Note: This hypercall is superseded by XEN_DOMCTL_claim_memory.

Same question as for xc_domain_claim_pages() above: should
XENMEM_claim_pages emit a deprecation warning?

> [ ... 27 lines skipped ... ]
> diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
> index 00db1da12f..f671e0c4c7 100644
> --- a/xen/include/xen/sched.h
> +++ b/xen/include/xen/sched.h
> @@ -419,6 +419,10 @@ struct domain
>      unsigned int     xenheap_pages;     /* pages allocated from Xen heap */
>      /* Pages claimed but not possessed, protected by global heap_lock. */
>      unsigned int     outstanding_pages;
> +    unsigned int     node_claims;       /* Sum of per-node claims. */
> +    /* Domain objects use dedicated pages, leaving room for per-node claims. */
> +    unsigned int     claims[MAX_NUMNODES]; /* Per-NUMA-node claims. */
> +

Stray blank line added in the middle of the field group.

-- 
Baptiste Le Duc <baptiste.le-duc@vates.tech>

