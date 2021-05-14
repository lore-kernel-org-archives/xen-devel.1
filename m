Return-Path: <SRS0=zvGf=KJ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C366C433B4
	for <xen-devel@archiver.kernel.org>; Fri, 14 May 2021 23:36:09 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F03B061350
	for <xen-devel@archiver.kernel.org>; Fri, 14 May 2021 23:36:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F03B061350
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.127621.239868 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lhhLY-0006eI-Oy; Fri, 14 May 2021 23:35:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 127621.239868; Fri, 14 May 2021 23:35:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lhhLY-0006eB-Le; Fri, 14 May 2021 23:35:56 +0000
Received: by outflank-mailman (input) for mailman id 127621;
 Fri, 14 May 2021 23:35:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=saLk=KJ=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1lhhLX-0006e5-7a
 for xen-devel@lists.xenproject.org; Fri, 14 May 2021 23:35:55 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fa0156f1-62c9-4035-9abf-ddbaab356c51;
 Fri, 14 May 2021 23:35:54 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 321B161350;
 Fri, 14 May 2021 23:35:53 +0000 (UTC)
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
X-Inumbo-ID: fa0156f1-62c9-4035-9abf-ddbaab356c51
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1621035353;
	bh=UTNKx1PKEmnbSPW7tZFyqO7KdR9soOOqIZcVbewQXhU=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=PWlg2g+JQi5iRBVhuQynH0OLm0s4bpXfavuFUxyTIMnpQorEab/FfJYYWi39/S5zd
	 wcL0wZDj2owQOm6pZvEde4rbOxotaVhwDK0l+tmkNzZvucGpt3ecnP/7Di4y4Psl2x
	 CF3pBvHynp0vMGjAqI3zAkkF91TjFS9PllG5j73TIDTxMI8Xck+NVsaOO+dEpZxTos
	 Qqupsgn2jtInD/mK7CBK93tluUEl8zPCwGsSmyqUCchrcZ6yAN9uXoMZnJewQ/k0Ln
	 jiYGkzrQAGG6TcSnsWKZlUH9CTYZFa4TdbPlK1SPscLJNYkgKtk3hQIo5I77Iodmqa
	 mwVsNem76qSpw==
Date: Fri, 14 May 2021 16:35:52 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien@xen.org>
cc: xen-devel@lists.xenproject.org, Wei.Chen@arm.com, Henry.Wang@arm.com, 
    Penny.Zheng@arm.com, Bertrand.Marquis@arm.com, 
    Julien Grall <jgrall@amazon.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH RFCv2 13/15] xen/arm: mm: Use the PMAP helpers in
 xen_{,un}map_table()
In-Reply-To: <20210425201318.15447-14-julien@xen.org>
Message-ID: <alpine.DEB.2.21.2105141628130.14426@sstabellini-ThinkPad-T480s>
References: <20210425201318.15447-1-julien@xen.org> <20210425201318.15447-14-julien@xen.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sun, 25 Apr 2021, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
> 
> During early boot, it is not possible to use xen_{,un}map_table()
> if the page tables are not residing the Xen binary.
> 
> This is a blocker to switch some of the helpers to use xen_pt_update()
> as we may need to allocate extra page tables and access them before
> the domheap has been initialized (see setup_xenheap_mappings()).
> 
> xen_{,un}map_table() are now updated to use the PMAP helpers for early
> boot map/unmap. Note that the special case for page-tables residing
> in Xen binary has been dropped because it is "complex" and was
> only added as a workaround in 8d4f1b8878e0 ("xen/arm: mm: Allow
> generic xen page-tables helpers to be called early").
> 
> Signed-off-by: Julien Grall <jgrall@amazon.com>

In terms of boot stages:

- SYS_STATE_early_boot --> use pmap_map
- greater than SYS_STATE_early_boot --> map_domain_page

While actually pmap would be able to work as far as SYS_STATE_boot, but
we don't need it. Is it worth simplifying it by changing the checks in
the previous patch to be against SYS_STATE_early_boot?

In any case:

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>



> ---
>     Changes in v2:
>         - New patch
> ---
>  xen/arch/arm/mm.c | 33 +++++++++------------------------
>  1 file changed, 9 insertions(+), 24 deletions(-)
> 
> diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
> index 5e713b599611..f5768f2d4a81 100644
> --- a/xen/arch/arm/mm.c
> +++ b/xen/arch/arm/mm.c
> @@ -41,6 +41,7 @@
>  #include <xen/sizes.h>
>  #include <xen/libfdt/libfdt.h>
>  
> +#include <asm/pmap.h>
>  #include <asm/setup.h>
>  
>  /* Override macros from asm/page.h to make them work with mfn_t */
> @@ -967,27 +968,11 @@ void *ioremap(paddr_t pa, size_t len)
>  static lpae_t *xen_map_table(mfn_t mfn)
>  {
>      /*
> -     * We may require to map the page table before map_domain_page() is
> -     * useable. The requirements here is it must be useable as soon as
> -     * page-tables are allocated dynamically via alloc_boot_pages().
> -     *
> -     * We need to do the check on physical address rather than virtual
> -     * address to avoid truncation on Arm32. Therefore is_kernel() cannot
> -     * be used.
> +     * During early boot, map_domain_page() may be unusable. Use the
> +     * PMAP to map temporarily a page-table.
>       */
>      if ( system_state == SYS_STATE_early_boot )
> -    {
> -        if ( is_xen_fixed_mfn(mfn) )
> -        {
> -            /*
> -             * It is fine to demote the type because the size of Xen
> -             * will always fit in vaddr_t.
> -             */
> -            vaddr_t offset = mfn_to_maddr(mfn) - virt_to_maddr(&_start);
> -
> -            return (lpae_t *)(XEN_VIRT_START + offset);
> -        }
> -    }
> +        return pmap_map(mfn);
>  
>      return map_domain_page(mfn);
>  }
> @@ -996,12 +981,12 @@ static void xen_unmap_table(const lpae_t *table)
>  {
>      /*
>       * During early boot, xen_map_table() will not use map_domain_page()
> -     * for page-tables residing in Xen binary. So skip the unmap part.
> +     * but the PMAP.
>       */
> -    if ( system_state == SYS_STATE_early_boot && is_kernel(table) )
> -        return;
> -
> -    unmap_domain_page(table);
> +    if ( system_state == SYS_STATE_early_boot )
> +        pmap_unmap(table);
> +    else
> +        unmap_domain_page(table);

