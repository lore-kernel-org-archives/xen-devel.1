Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A794CA5FFC
	for <xen-devel@archiver.kernel.org>; Wed,  7 Oct 2026 16:32:26 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1442561.1660110 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xEUYg-00061j-7Z; Wed, 07 Oct 2026 16:31:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1442561.1660110; Wed, 07 Oct 2026 16:31:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xEUYg-00061c-3x; Wed, 07 Oct 2026 16:31:58 +0000
Received: by outflank-mailman (input) for mailman id 1442561;
 Wed, 07 Oct 2026 16:31:56 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger@xenproject.org>) id 1xEUYe-00061W-U4
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2026 16:31:56 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <roger@xenproject.org>) id 1xEUYe-001iQE-21;
 Wed, 07 Oct 2026 16:31:56 +0000
Received: from 224.pool85-54-217.dynamic.orange.es ([85.54.217.224]
 helo=localhost) by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <roger@xenproject.org>) id 1xEUYe-003hbh-10;
 Wed, 07 Oct 2026 16:31:56 +0000
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
	bh=x151EDjMbL+Rnk3egyIDcF1TYhS8M+FaW6V0IbaysBc=; b=Cx0pk1eGZrQR7KzatBzjhYgblQ
	7Jdn7AYZ9gtODoLs4fC+VCYRHfPD1sh9aD8yV5x3GsPhH/Od06sGbriBPFwWSCqm5H+X5gn5u4G1A
	G2bW/vBUhPQjgEDF/mV7Cf/DW1TPJJv3gBetVnzXRTR1JHXitNSjLBa4pPLVBYc0lsLU=;
Date: Wed, 7 Oct 2026 18:31:53 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger@xenproject.org>
To: George Dunlap <gwd@xenproject.org>
Cc: xen-devel@lists.xenproject.org,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: Re: [PATCH v3 05/18] x86/mm: prepare create_perdomain_mapping() for
 per-vCPU perdomain areas
Message-ID: <asZz-SmakR9xR0gP@Mac.lan>
References: <20261007104051.48841-1-gwd@xenproject.org>
 <20261007104051.48841-6-gwd@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261007104051.48841-6-gwd@xenproject.org>

On Wed, Oct 07, 2026 at 11:40:38AM +0100, George Dunlap wrote:
> From: Roger Pau Monné <roger.pau@citrix.com>
> 
> We want to change per-domain mappings to be per-vCPU mappings.  In
> preparation for that, we want to arrange that
> create_perdomain_mapping() work either with a single perdomain area,
> or with a per-vCPU perdomain area.
> 
> Most of the remaining callers are already in a vCPU context.  This is
> no accident: the perdomain area has always been laid out in per-vCPU
> slices -- each vCPU has its own GDT/LDT window, its own
> COMPAT_ARG_XLAT pages, its own window of mapcache entries -- and each
> vCPU's slice is set up as that vCPU is created.  For these callers, we
> just need to change the parameter from a domain pointer to a vCPU
> pointer.  Once the perdomain area itself becomes per-vCPU, the same
> calls will populate the owning vCPU's own area rather than slices of a
> shared one.
> 
> One exception is the call in hvm_domain_initialise().  An HVM vCPU's
> monitor table is created during vCPU initialisation, and
> init_xen_l4_slots() stamps the perdomain slot into it at that point --
> far earlier than for PV, where the Xen slots are written only once
> guest page tables are built.  hvm_domain_initialise() therefore had an
> explicit create_perdomain_mapping() call just to make the perdomain
> root exist ahead of that.  Move it to arch_vcpu_create(), covering HVM
> and PV alike.  With a single shared area, the call allocates at most
> once per domain; but once each vCPU has its own perdomain area, this
> is the call that will allocate every vCPU's root before any page
> tables referencing it are built.  vCPU creation is
> where the call must end up; move it there directly.

I think it's clear from the paragraph above the call must be moved
there, there's likely no need to re-iterate that fact.

> For PV guests
> nothing observable changes: the root was already being created during
> vCPU creation as a side effect (by mapcache_vcpu_init(), or failing
> that pv_create_gdt_ldt_l1tab()); it now merely becomes explicit.
> 
> Note that we cannot yet do a parallel movement of
> free_perdomain_mappings(): the per-domain page-table hierarchy is
> still a single domain-wide structure shared by all vCPUs, so tearing
> it down from a per-vCPU path would pull the mappings out from under
> sibling vCPUs (e.g.  on a partially failed, retryable
> XEN_DOMCTL_max_vcpus), and vCPU-create error paths can rely on domain
> destruction to free a partially set up hierarchy.  Teardown will move
> to vCPU scope only once the structure itself becomes per-vCPU.

Even then - we will still need to support non-ASI (PV domains) not
using a per-vCPU slot, and hence the call can't be moved as-is just
when per-vCPU support is available?

> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> Assisted-by: Claude Code:claude-fable-5, Claude Code:claude-opus-4-8, Claude Code:claude-opus-5-5
> Signed-off-by: George Dunlap <gwd@xenproject.org>
> ---
> Changes in v3:
> - Rebased onto staging without the GDT/LDT conversions (for the
>   HVM-only series): the capture parameters stay, as the PV GDT/LDT
>   stash still uses them.
> 
> Changes in v2:
> - Added to the series
> 
> Changes since the previously posted version:
> - Keep free_perdomain_mappings() (and hence perdomain teardown)
>   domain-scoped.
> - Keep the idle domain without a perdomain area.
> - Retitle (was: "x86/mm: switch {create,destroy}_perdomain_mapping()
>   domain parameter to vCPU"); destroy_perdomain_mapping() was switched
>   in a separate patch.
> - Split the removal of mapcache_domain_init()'s redundant
>   create_perdomain_mapping() call into its own (preceding) patch.
> ---
>  xen/arch/x86/domain.c         | 10 ++++++++++
>  xen/arch/x86/domain_page.c    |  6 +++---
>  xen/arch/x86/hvm/hvm.c        |  5 -----
>  xen/arch/x86/include/asm/mm.h |  2 +-
>  xen/arch/x86/mm.c             |  3 ++-
>  xen/arch/x86/pv/domain.c      |  2 +-
>  xen/arch/x86/x86_64/mm.c      |  2 +-
>  7 files changed, 18 insertions(+), 12 deletions(-)
> 
> diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
> index 85cedc3d03..b670cea52b 100644
> --- a/xen/arch/x86/domain.c
> +++ b/xen/arch/x86/domain.c
> @@ -517,6 +517,16 @@ int arch_vcpu_create(struct vcpu *v)
>  
>      if ( !is_idle_domain(d) )
>      {
> +        /*
> +         * Make sure the per-domain L3 exists ahead of any consumer (e.g.
> +         * init_xen_l4_slots() for the HVM monitor tables): with
> +         * create_perdomain_mapping() taking a vCPU this can no longer be
> +         * done when creating the domain.

I think the comment here is not very useful - it's not helpful that
the comment here references the previous position of the call.  It
only makes sense in the context of this change, but not for someone
looking at the code after this commit has landed.  I would terminate
the commit at the ":".

The code itself looks good to me.

Thanks, Roger.

