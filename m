Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86012C5AC67
	for <xen-devel@archiver.kernel.org>; Tue, 11 Aug 2026 07:59:26 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1387995.1629208 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wthO8-0003Rl-Iw; Tue, 11 Aug 2026 07:59:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1387995.1629208; Tue, 11 Aug 2026 07:59:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wthO8-0003Re-GC; Tue, 11 Aug 2026 07:59:08 +0000
Received: by outflank-mailman (input) for mailman id 1387995;
 Tue, 11 Aug 2026 07:59:07 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger@xenproject.org>) id 1wthO7-0003RY-9X
 for xen-devel@lists.xenproject.org; Tue, 11 Aug 2026 07:59:07 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <roger@xenproject.org>) id 1wthO7-00GIFN-02;
 Tue, 11 Aug 2026 07:59:06 +0000
Received: from 224.pool85-54-217.dynamic.orange.es ([85.54.217.224]
 helo=localhost) by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <roger@xenproject.org>) id 1wthO6-008vX1-19;
 Tue, 11 Aug 2026 07:59:06 +0000
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
	bh=yuks5UgbK1jEMp3ty2xIMVbvZYC1PurOFUgY437blUg=; b=57TJr8BonQjCGJ6tMHHE0nz9jV
	rWubFn6Y4BQbVI5PtDj99wuJ+VvkngO0P/ku9qpU2yDKZHM5l8tdu5T+WP1PltI68z/qT6FT5dhIH
	KWTD5Ot/8WcO3l0dbFeF1PzFw6sFDM5bknltOyA66jM3ptQ2NLN+p9H1LwYSq+YWFyKk=;
Date: Tue, 11 Aug 2026 09:58:56 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger@xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: Re: [PATCH] x86/pagewalk: Read guest PTEs with ACCESS_ONCE()
Message-ID: <anrWQL-pw3HicFwS@macbook.local>
References: <20260810221029.1520858-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260810221029.1520858-1-andrew.cooper3@citrix.com>

On Mon, Aug 10, 2026 at 11:10:29PM +0100, Andrew Cooper wrote:
> This has been a plain C read for as far back as I can trace in history.
> 
> Research into invented-loads has flagged it as a possible vulnerability.
> After careful analysis, it is believed to be a bug only, not a security
> vulnerability.
> 
> The code fits the pattern for invented loads, and it is a risk.
> 
> The analysis suggests that we can read one value out of the guest, operate on
> another, and that this could be an in-guest privliege escalation.  Any entity
> in the guest able to modify the pagetables already has full privilege, so
> while Xen can potentially malfunction, the effects don't cross a privilege
> boundary.
> 
> The analysis also suggests that this is worse for shadow guests because we may
> put the TOCTOU entry in the shadows, but this is inaccurate.  What we put in
> the shadows is still translated under the P2M and refers to guest physical
> address space.
> 
> Either way, harden the accesses.
> 
> Link: https://github.com/xoreaxeaxeax/schrodingers-toctou/blob/main/observer-effect/audits/audit-xen-ptwalk-RELEASE-4.21.1.md#86-per-candidate-finding
> Fixes: 49f7c7364e0a ("Replace shadow pagetable code with shadow2.")
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Roger Pau Monné <roger@xenproject.org>

> ---
> CC: Jan Beulich <jbeulich@suse.com>
> CC: Roger Pau Monné <roger@xenproject.org>
> CC: Teddy Astie <teddy.astie@vates.tech>
> 
> I'm not really sure about the fixes tag.  That's the oldest commit which bares
> any reseblence to the current code, and it was a bulk rewrite of the whole
> shadow pagetable code.  Prior to that, it was all mixed up and it's not
> completely obvious what's (definiely) walking the guest pagetables as opposed
> to the shadows.

I'm fine with no Fixes tag if there's no clear introduction point, or
if the introduction is simply that far away (ie: < 4.0) that it's
no really relevant anymore.

> Bloat-o-meter shows this clearly makes a code-gen difference in all cases:
> 
>   add/remove: 0/0 grow/shrink: 1/2 up/down: 16/-19 (-3)
>   Function                                     old     new   delta
>   guest_walk_tables_2_levels                  1688    1704     +16
>   guest_walk_tables_4_levels                  3708    3703      -5
>   guest_walk_tables_3_levels                  2233    2219     -14
> 
> To start with, l?e_read() looked to be the right helper, but they don't exist
> for guest pagetable types, leading to:
> 
> arch/x86/mm/guest_walk.c: In function ‘guest_walk_tables_2_levels’:
> ./arch/x86/include/asm/page.h:135:36: error: incompatible types when assigning to type ‘guest_l2e_t’ from type ‘l2_pgentry_t’
>   135 | #define l2e_from_intpte(intpte)    ((l2_pgentry_t) { (intpte_t)(intpte) })
>       |                                    ^
> ---
>  xen/arch/x86/mm/guest_walk.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/xen/arch/x86/mm/guest_walk.c b/xen/arch/x86/mm/guest_walk.c
> index f48c3ef75f48..df2ccaa67475 100644
> --- a/xen/arch/x86/mm/guest_walk.c
> +++ b/xen/arch/x86/mm/guest_walk.c
> @@ -129,7 +129,7 @@ guest_walk_tables(const struct vcpu *v, struct p2m_domain *p2m,
>              guest_l4_table_offset(va) * sizeof(gw->l4e);
>      if ( !hvmemul_read_cache(v, l4gpa, &gw->l4e, sizeof(gw->l4e)) )
>      {
> -        gw->l4e = l4p[guest_l4_table_offset(va)];
> +        gw->l4e = (guest_l4e_t){ ACCESS_ONCE(l4p[guest_l4_table_offset(va)].l4) };

I wouldn't mind if this was a macro or static inline function, maybe
that would prevent new usages from forgetting to use ACCESS_ONCE().

Thanks, Roger.

