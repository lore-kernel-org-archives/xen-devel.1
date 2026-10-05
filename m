Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96365CA5FFC
	for <xen-devel@archiver.kernel.org>; Mon,  5 Oct 2026 16:13:30 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1441011.1658616 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xDlJb-0005JP-4P; Mon, 05 Oct 2026 16:13:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1441011.1658616; Mon, 05 Oct 2026 16:13:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xDlJb-0005JI-18; Mon, 05 Oct 2026 16:13:23 +0000
Received: by outflank-mailman (input) for mailman id 1441011;
 Mon, 05 Oct 2026 16:13:21 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger@xenproject.org>) id 1xDlJZ-0005Iq-JU
 for xen-devel@lists.xenproject.org; Mon, 05 Oct 2026 16:13:21 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <roger@xenproject.org>) id 1xDlJX-00G7u8-2j;
 Mon, 05 Oct 2026 16:13:19 +0000
Received: from 224.pool85-54-217.dynamic.orange.es ([85.54.217.224]
 helo=localhost) by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <roger@xenproject.org>) id 1xDlJX-0036w0-10;
 Mon, 05 Oct 2026 16:13:19 +0000
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
	bh=NqECvEkxeA24ZJ3cXmcqerUDz0GeBRnX3XtWfCxlQ84=; b=gVNTAwLpHIDhnzRoWfCWUsh7z6
	lLZh1hFT6P0+RJ68U+Mmz8Ciabs2MY4YQFaR6Ns5nZKBc+z5jJ0JI+pA97VpZSlvyCse4iCNQ2EJV
	W95kLMZl4uhooZKnEqMeIWldp5iIrie3B5C0Ek0Skorbi6uZVjbiDPLkoVUSdhxrAB60=;
Date: Mon, 5 Oct 2026 18:13:13 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger@xenproject.org>
To: Weiqi Wang <coolhaoyt@gmail.com>
Cc: xen-devel@lists.xenproject.org, jbeulich@suse.com,
	andrew.cooper3@citrix.com, anthony.perard@vates.tech,
	michal.orzel@amd.com, julien@xen.org, sstabellini@kernel.org,
	lucas.cordeiro@manchester.ac.uk,
	Weiqi Wang <weiqi.wang-2@postgrad.manchester.ac.uk>
Subject: Re: [PATCH v2] xen/pdx: fix offset-compression merge of a contained
 range
Message-ID: <asPMmanV3CYRDLNU@Mac.lan>
References: <20261005102713.94033-1-coolhaoyt@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261005102713.94033-1-coolhaoyt@gmail.com>

On Mon, Oct 05, 2026 at 11:27:13AM +0100, Weiqi Wang wrote:
> From: Weiqi Wang <weiqi.wang-2@postgrad.manchester.ac.uk>
> 
> When sorting and merging overlapping ranges in
> pfn_pdx_compression_setup(), the merged range is set to end where the
> second range ends.  If the second range is fully contained in the first,
> this truncates the first range, and the tail of it is then neither
> compressible nor translated correctly.
> 
> Keep the end of the merged range as the maximum of both ends.
> 
> On x86 the ranges come from the SRAT memory affinity entries, and
> overlapping entries for the same node are tolerated with a warning by the
> NUMA code.  The caller's subsequent coverage check catches the truncated
> range, so the effect is that PDX compression is disabled with a "RAM
> region ... not covered" message rather than memory being mistranslated.
> 
> Add a test case that fails without this change.
> 
> Found with the ESBMC bounded model checker.  The counterexample was
> confirmed by running it natively against the unmodified code.
> 
> Fixes: c5c45bcbd6a1 ("pdx: introduce a new compression algorithm based on region offsets")
> Assisted-by: Claude Code:claude-opus-5-5 # finding the issue with ESBMC, patch creation
> Signed-off-by: Weiqi Wang <weiqi.wang-2@postgrad.manchester.ac.uk>
> ---
> 
> Notes:
>     Changes in v2:
>     - clarify in the title that this is the offset-compression instance (Jan)
>     - parenthesise the test multiplications against the binary ORs (Jan)
>     
>     Also seen in a real boot: the hypervisor alone under QEMU (pc, 8 GiB),
>     built from defconfig, with no -numa and a hand-built SRAT passed with
>     -acpitable.  Memory affinity entries, all PXM 0:
>     
>       [0, 3G)  [4G, 9G)  [5G, 6G)  [1T, 1T+1G)
>     
>     The third entry lies inside the second.  The NUMA code prints "overlaps
>     with itself" for it and accepts it.  Without this patch:
>     
>       (XEN) PFN compression using lookup table shift 23 and region size 0x200000
>       (XEN)  range   0 [0000000000000, 000000017ffff] PFN IDX   0 : 0000000000000
>       (XEN)  range   1 [0000010000000, 000001003ffff] PFN IDX  32 : 000000fe00000
>       (XEN) PFN compression disabled, RAM region [0x100000000, 0x23fffffff] not covered
>     
>     With it, the same output as without the third entry:
>     
>       (XEN) PFN compression using lookup table shift 28 and region size 0x400000
>       (XEN)  range   0 [0000000000000, 000000023ffff] PFN IDX   0 : 0000000000000
>       (XEN)  range   1 [0000010000000, 000001003ffff] PFN IDX   1 : 000000fc00000
> 
>  tools/tests/pdx/test-pdx.c | 12 ++++++++++++
>  xen/common/pdx.c           |  5 +++--
>  2 files changed, 15 insertions(+), 2 deletions(-)
> 
> diff --git a/tools/tests/pdx/test-pdx.c b/tools/tests/pdx/test-pdx.c
> index 4de8d43d86..8d271a488f 100644
> --- a/tools/tests/pdx/test-pdx.c
> +++ b/tools/tests/pdx/test-pdx.c
> @@ -87,6 +87,18 @@ int main(int argc, char **argv)
>              },
>              .compress = true,
>          },
> +        /* Range contained in a previous one. */
> +        {
> +            .ranges = {
> +                { .start =                                                 0,
> +                  .end   =                          ((1UL << MAX_ORDER) * 1) },
> +                { .start = (1UL << (MAX_ORDER * 2)) |                      0,
> +                  .end   = (1UL << (MAX_ORDER * 2)) | ((1UL << MAX_ORDER) * 4) },
> +                { .start = (1UL << (MAX_ORDER * 2)) | ((1UL << MAX_ORDER) * 1),
> +                  .end   = (1UL << (MAX_ORDER * 2)) | ((1UL << MAX_ORDER) * 2) },
> +            },
> +            .compress = true,
> +        },

You place this in the __LP64__ protected section, but AFAICT this is
not needed?  Those values all fit in a 32bit integer.

Also, I think the example could be simpler:

        /* Range contained in a previous one. */
        {
            .ranges = {
                /* Overlapping ranges. */
                { .start = 0, .end = (1UL << MAX_ORDER) * 2 },
                { .start = 0, .end = (1UL << MAX_ORDER) * 1 },
                /* Extra range to force offset compression to be engaged. */
                { .start = (1UL << MAX_ORDER) * 3,
                  .end   = (1UL << MAX_ORDER) * 4 },

            },
#ifdef CONFIG_PDX_OFFSET_COMPRESSION
            .compress = true,
#else
            .compress = false,
#endif
        },

FWIW, we could also make the fully contained range not start at 0, to
avoid the sorting from reordering those, but I think that's not
possible given the (current) compare function cmp_node().

>  #endif
>          /* PDX compression, 2 ranges covered by the lower mask. */
>          {
> diff --git a/xen/common/pdx.c b/xen/common/pdx.c
> index e7e16e193e..23655ef3bd 100644
> --- a/xen/common/pdx.c
> +++ b/xen/common/pdx.c
> @@ -393,8 +393,9 @@ bool __init pfn_pdx_compression_setup(paddr_t base)
>               (ranges[i - 1].base_pfn + ranges[i - 1].pages) )
>              continue;
>  
> -        ranges[i - 1].pages = ranges[i].base_pfn + ranges[i].pages -
> -                              ranges[i - 1].base_pfn;
> +        ranges[i - 1].pages = max(ranges[i - 1].pages,
> +                                  ranges[i].base_pfn + ranges[i].pages -
> +                                  ranges[i - 1].base_pfn);

The fix LGTM, thanks.

Regards, Roger.

