Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CD00CA5FF0
	for <xen-devel@archiver.kernel.org>; Mon,  5 Oct 2026 13:35:15 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1440853.1658359 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xDiqQ-0003RQ-7s; Mon, 05 Oct 2026 13:35:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1440853.1658359; Mon, 05 Oct 2026 13:35:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xDiqQ-0003RH-3w; Mon, 05 Oct 2026 13:35:06 +0000
Received: by outflank-mailman (input) for mailman id 1440853;
 Mon, 05 Oct 2026 13:35:05 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger@xenproject.org>) id 1xDiqP-0003Ql-97
 for xen-devel@lists.xenproject.org; Mon, 05 Oct 2026 13:35:05 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <roger@xenproject.org>) id 1xDiqN-00G3Yd-1L;
 Mon, 05 Oct 2026 13:35:03 +0000
Received: from 224.pool85-54-217.dynamic.orange.es ([85.54.217.224]
 helo=localhost) by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <roger@xenproject.org>) id 1xDiqM-001Zp3-0K;
 Mon, 05 Oct 2026 13:35:02 +0000
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
	bh=96lMZoBXp+xh8wi96UjJ9BDjNr6V4uDkQTBLpJYFA3k=; b=ZDQVg+LuB4CWxxeDIBxu54oT22
	sbKQM3HnoYc9m6LivnlwnY7jRWApvyKIb5+n61BDZ6DI93OQ2GwoUlH1yJsDx0vZE+vDt38jadh9U
	rgETE3XAZDtmIsANpBv4LFc5Qg8O7Hmr3nwWv2oqz0oMviORMuJ8S6dJ7+htaY1+mOYs=;
Date: Mon, 5 Oct 2026 15:34:55 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger@xenproject.org>
To: Weiqi Wang <coolhaoyt@gmail.com>
Cc: xen-devel@lists.xenproject.org, jbeulich@suse.com,
	andrew.cooper3@citrix.com, anthony.perard@vates.tech,
	michal.orzel@amd.com, julien@xen.org, sstabellini@kernel.org,
	lucas.cordeiro@manchester.ac.uk,
	Weiqi Wang <weiqi.wang-2@postgrad.manchester.ac.uk>
Subject: Re: [RFC PATCH] xen/pdx: reject regions crossing a lookup table index
Message-ID: <asOnfw6tznWMAtb6@Mac.lan>
References: <20261004190409.29276-1-coolhaoyt@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261004190409.29276-1-coolhaoyt@gmail.com>

On Sun, Oct 04, 2026 at 08:04:09PM +0100, Weiqi Wang wrote:
> From: Weiqi Wang <weiqi.wang-2@postgrad.manchester.ac.uk>
> 
> pdx_is_region_compressible() only looks up the table entry of the first
> page, and checks the region against [pfn_base, pfn_base +
> pdx_region_size).  pfn_base need not be aligned to the table index
> granularity, so that window can extend into the next index, which belongs
> to a different range with a different offset.  A region whose tail lies
> there is reported compressible, yet its last page on its own is not, and

can there be multiple pages that overlap into the next region?  Using
"its last page on its own is not" makes it look it's only a single
page whose translation is wrong.

> translates through the wrong offset.
> 
> Also require the first and last page of the region to use the same table
> index.

The "Also" at the start of the sentence seems misplaced to me, I would
rather start the sentence with "Require ..."

> This can be reached from the coverage check in srat_parse_regions() when an
> e820 RAM range is not covered by the SRAT ranges, which is the case that
> check is meant to catch.
> 
> Found with the ESBMC bounded model checker.  The counterexample was
> confirmed by running it natively against the unmodified code.

"The counterexample" is not part of the commit log, so it feel odd to
name it here, as people going through the commit history won't see it.

> 
> Fixes: c5c45bcbd6a1 ("pdx: introduce a new compression algorithm based on region offsets")
> Assisted-by: Claude Code:claude-opus-5-5 # finding the issue with ESBMC, patch creation
> Signed-off-by: Weiqi Wang <weiqi.wang-2@postgrad.manchester.ac.uk>
> ---
> 
> Notes:
>     RFC because this was discussed when the offset compression was reviewed.
>     In the v2 thread [1] Jan asked whether pdx_is_region_compressible() is
>     correct when a region crosses a lookup table slot boundary.  The thread
>     concluded it was not an issue, on the basis that pages contiguous in MFN
>     space are also contiguous in PDX space.  The reproducer below is a case
>     where that does not hold for the code as merged: the region is reported
>     compressible, its last page on its own is not, and that page round-trips
>     to a different PFN.
>     
>     The ranges are as srat_parse_regions() would see them.  The RAM range is
>     not covered by either SRAT range, which is the situation the coverage
>     check in srat_parse_regions() is meant to detect.  Built from
>     tools/tests/pdx like test-pdx-offset, on staging (e4da182973) plus patch
>     "xen/pdx: fix merging of a range contained in the previous one":
>     
>       region [0x75757ffef9, 0x8122007e00) compressible: 1
>       last page compressible: 0
>       last page: pfn 0x8122007dff -> pdx 0x2122047dff -> pfn 0x2d7ee07dff
>     
>     With this patch the region is reported not compressible, and
>     srat_parse_regions() disables compression.
>     
>     8<----------------------------------------------------------------------
>     /* Build like test-pdx-offset, e.g. from tools/tests/pdx:
>      *   gcc -D__XEN_TOOLS__ -DCONFIG_PDX_OFFSET_COMPRESSION \
>      *       -I../../include -o repro-window repro-window.c
>      * (after generating pdx.h as the Makefile does). */
>     #include "harness.h"
>     #include "../../xen/common/pdx.c"
>     
>     int main(void)
>     {
>         /* Two SRAT-like ranges, in PFNs. */
>         pfn_pdx_add_region(pfn_to_paddr(0xdffffe0000UL),
>                            pfn_to_paddr(0xe000000000UL - 0xdffffe0000UL));
>         pfn_pdx_add_region(pfn_to_paddr(0xc5cde0000UL),
>                            pfn_to_paddr(0x4cd7000000UL - 0xc5cde0000UL));
>         if ( !pfn_pdx_compression_setup(0) )
>             return puts("compression not enabled"), EXIT_FAILURE;
>     
>         /* A RAM range not covered by either, as srat_parse_regions() checks. */
>         unsigned long s = 0x75757ffef9UL, e = 0x8122007e00UL;
>     
>         printf("region [%#lx, %#lx) compressible: %d\n", s, e,
>                pdx_is_region_compressible(pfn_to_paddr(s), e - s));
>         printf("last page compressible: %d\n",
>                pdx_is_region_compressible(pfn_to_paddr(e - 1), 1));
>         printf("last page: pfn %#lx -> pdx %#lx -> pfn %#lx\n",
>                e - 1, pfn_to_pdx(e - 1), pdx_to_pfn(pfn_to_pdx(e - 1)));
>     
>         return pdx_is_region_compressible(pfn_to_paddr(s), e - s) &&
>                pdx_to_pfn(pfn_to_pdx(e - 1)) != e - 1 ? EXIT_FAILURE : EXIT_SUCCESS;

I think we want this testing added to test-pdx.c, however it will
require some expansion so that test cases can also provide an array of
memory regions to use with pdx_is_region_compressible() different from
the regions to be compressed.

>     }
>     8<----------------------------------------------------------------------
>     
>     Other callers that rely on the same answer are mem_hotadd_check() and
>     the EFI ram_range_valid() check.  I have not run those paths.
>     
>     One behavioural change to check: with npages == 0 the new condition
>     compares against pfn - 1.  The callers I looked at never pass 0.
>     
>     Model checking (ESBMC, 2 SRAT ranges and 2 e820 RAM ranges, all free
>     below 2^40 PFNs, the srat_parse_regions() coverage check modelled) finds
>     no accepted RAM page that fails to round-trip with both patches applied.
>     It also finds no layout where the coverage check now rejects what setup
>     accepted, with RAM equal to the SRAT ranges.  This is bounded to 2 ranges.
>     
>     The existing tests in tools/tests/pdx pass in both mask and offset mode.
>     
>     I have not reproduced this in a boot: the layout needs RAM near 2^51
>     bytes, which I could not set up under QEMU.
>     
>     [1] https://www.mail-archive.com/xen-devel@lists.xenproject.org/msg194095.html
> 
>  xen/common/pdx.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/common/pdx.c b/xen/common/pdx.c
> index 23655ef3bd..52928faa15 100644
> --- a/xen/common/pdx.c
> +++ b/xen/common/pdx.c
> @@ -324,7 +324,8 @@ bool pdx_is_region_compressible(paddr_t base, unsigned long npages)
>      unsigned long pfn_base = pfn_bases[PFN_TBL_IDX(pfn)];
>  
>      return pfn >= pfn_base &&
> -           pfn + npages <= pfn_base + pdx_region_size;
> +           pfn + npages <= pfn_base + pdx_region_size &&
> +           PFN_TBL_IDX(pfn) == PFN_TBL_IDX(pfn + npages - 1);

The fix itself LGTM.

Thanks for chasing this.

Regards, Roger.

