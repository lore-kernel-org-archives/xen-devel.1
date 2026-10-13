Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4520CCC6B08
	for <xen-devel@archiver.kernel.org>; Tue, 13 Oct 2026 14:59:58 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1447987.1663953 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGdyZ-0002HU-M9; Tue, 13 Oct 2026 14:59:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1447987.1663953; Tue, 13 Oct 2026 14:59:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGdyZ-0002HN-JK; Tue, 13 Oct 2026 14:59:35 +0000
Received: by outflank-mailman (input) for mailman id 1447987;
 Tue, 13 Oct 2026 14:59:34 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger@xenproject.org>) id 1xGdyY-0002HH-Lh
 for xen-devel@lists.xenproject.org; Tue, 13 Oct 2026 14:59:34 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.98.2)
 (envelope-from <roger@xenproject.org>) id 1xGdyY-00000003Qk8-2C1i;
 Tue, 13 Oct 2026 14:59:34 +0000
Received: from 224.pool85-54-217.dynamic.orange.es ([85.54.217.224]
 helo=localhost) by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <roger@xenproject.org>) id 1xGdyX-000000024eW-2K8I;
 Tue, 13 Oct 2026 14:59:34 +0000
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
	bh=Azj8TpXYKgknYBcUzdSrDKjtvSbs0uZmnlMiUen+Wyk=; b=vK9Zt8PnkgNjPeL4pXMtyd1hJo
	JpVZ1jmMuCMzMpzYVln8t9dOGWvjoWYAlgA6c6aJeua/lltHeVTpnhqq5WZtq9drmR9fa8Y/PW0kq
	V6Bek/qvaz7EtG9AnWMaxCxBG8tBdn+8QkXaSCjLaeYgqu8oavoVbWZX1C9icuMJB+mI=;
Date: Tue, 13 Oct 2026 16:59:31 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger@xenproject.org>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: Re: [PATCH 07/15] x86/PVH: lift E820 alignment requirement
Message-ID: <as5HU6-tCy9YPWlM@Mac.lan>
References: <1b4c2bb4-118d-497c-8d7d-f3824fd61a73@suse.com>
 <a28959f9-a832-45ae-9c81-350e43f23c91@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <a28959f9-a832-45ae-9c81-350e43f23c91@suse.com>

On Mon, Oct 12, 2026 at 10:22:28AM +0200, Jan Beulich wrote:
> Before reordering things (to move in particular pvh_steal_ram()
> invocations ahead of the pvh_populate_p2m() one) drop an undue (and as it
> turns out unnecessary) assumption: find_memory() doesn't really depend on
> E820 regions to end on page boundaries.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> Really the assumption towards the start of regions doesn't look to be
> relevant either, yet I thought I'd limit the change to the minimum needed.
> (In fact the statement immediately ahead of the assertion arranges for
> page alignment, so the check is dubious altogether.)
> 
> We also could consider whether kernel_end really needs rounding up to a
> page boundary: Technically there's no need, but the question is whether it
> would be a good idea to have the tail of the kernel region share a page
> with metadata (or, as things still are at this point of the series, the
> initrd).

I think it would a bad idea to have this kind of page-sharing.  The
guest might use NX for metadata page-tables (ie: initrd), so it
sharing a page with the kernel could be problematic.

> 
> --- a/xen/arch/x86/hvm/dom0_build.c
> +++ b/xen/arch/x86/hvm/dom0_build.c
> @@ -365,6 +365,9 @@ static __init void pvh_setup_e820(struct
>           * that's the minimum granularity of the 2nd stage translation. Since
>           * the p2m code uses PAGE_ORDER_4K internally, also use it here in
>           * order to prevent this code from getting out of sync.
> +         *
> +         * Note that this is only for pvh_populate_p2m().  Subsequent uses of
> +         * pvh_steal_ram() will break the length part.

Maybe because I'm too familiar with this code, but the previous
comment mentioning the 4K alignment being required for the 2nd stage
translation kind of implies this is the reason for it?  I guess you
want to make it clear there is no further logic depending on that
alignment.

>           */
>          start = ROUNDUP(entry->addr, PAGE_SIZE << PAGE_ORDER_4K);
>          end = (entry->addr + entry->size) &
> @@ -506,8 +509,8 @@ static paddr_t __init find_memory(
>      unsigned int i;
>  
>      /*
> -     * The memory map is sorted and all RAM regions starts and sizes are
> -     * aligned to page boundaries.
> +     * The memory map is sorted and all RAM region starts are aligned to
> +     * page boundaries.
>       */
>      for ( i = 0; i < d->arch.nr_e820; i++ )
>      {
> @@ -519,7 +522,7 @@ static paddr_t __init find_memory(
>  
>          start = MAX(ROUNDUP(d->arch.e820[i].addr, PAGE_SIZE), MB(1));
>  
> -        ASSERT(IS_ALIGNED(start, PAGE_SIZE) && IS_ALIGNED(end, PAGE_SIZE));
> +        ASSERT(IS_ALIGNED(start, PAGE_SIZE));

I would remove this altogether - as you noticed start is clearly
aligned by the code in the line just above.

Thanks, Roger.

