Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF21FD2ECF7
	for <xen-devel@archiver.kernel.org>; Tue, 20 Jan 2026 12:34:05 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1208842.1520975 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1viAvg-0004ep-M2; Tue, 20 Jan 2026 12:33:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1208842.1520975; Tue, 20 Jan 2026 12:33:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1viAvg-0004ei-Ih; Tue, 20 Jan 2026 12:33:52 +0000
Received: by outflank-mailman (input) for mailman id 1208842;
 Tue, 20 Jan 2026 12:33:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=JoV/=7Z=kernel.org=will@srs-se1.protection.inumbo.net>)
 id 1viAve-0004eb-N8
 for xen-devel@lists.xenproject.org; Tue, 20 Jan 2026 12:33:50 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org
 [2600:3c0a:e001:78e:0:1991:8:25])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 43fecaeb-f5fc-11f0-9ccf-f158ae23cfc8;
 Tue, 20 Jan 2026 13:33:48 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 5099943FA3;
 Tue, 20 Jan 2026 12:33:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 001ABC16AAE;
 Tue, 20 Jan 2026 12:33:42 +0000 (UTC)
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
X-Inumbo-ID: 43fecaeb-f5fc-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768912426;
	bh=Y0bXJFrIMQu42HkX8sO2hSl2uRvMmAIUm4N1kYYXYbg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TxGZV8yxxs7f9OIOe/76/YrYaqjVeBTLmNJdeq9rZnYXtQBKVVFzF9G+vZXhnfGlh
	 vT9CZ7egfF2YJDaVzTZCoXW7WvjE6P9hHlULJeQGsNLJOVQ6GN8ql7pboCjgU4WGCe
	 Vt8ME1f66ylY9a+GCkoyhnoJhXrb39PCRzYGGNaz54bIGYkZiF1bgZi24H9uytWylw
	 9Pa1LQ5sYMXUi5RHj69gPO6rv2NvuLMgE69i3zkNmc//4jIPBEZz5BqT8SQXYiPd6j
	 m+4BX8yGRcFm1xNp3e9O6KxgephbObAfu5q0mTQt6b0ny660NNsJKm//uUu92158VD
	 Rk2ttoJ8XgDvA==
Date: Tue, 20 Jan 2026 12:33:39 +0000
From: Will Deacon <will@kernel.org>
To: Barry Song <21cnbao@gmail.com>
Cc: catalin.marinas@arm.com, m.szyprowski@samsung.com, robin.murphy@arm.com,
	iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org,
	Barry Song <baohua@kernel.org>, Leon Romanovsky <leon@kernel.org>,
	Ada Couprie Diaz <ada.coupriediaz@arm.com>,
	Ard Biesheuvel <ardb@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Suren Baghdasaryan <surenb@google.com>,
	Tangquan Zheng <zhengtangquan@oppo.com>
Subject: Re: [PATCH v2 3/8] arm64: Provide dcache_inval_poc_nosync helper
Message-ID: <aW92I_sn9VqDPLKz@willie-the-truck>
References: <20251226225254.46197-1-21cnbao@gmail.com>
 <20251226225254.46197-4-21cnbao@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251226225254.46197-4-21cnbao@gmail.com>

On Sat, Dec 27, 2025 at 11:52:43AM +1300, Barry Song wrote:
> From: Barry Song <baohua@kernel.org>
> 
> dcache_inval_poc_nosync does not wait for the data cache invalidation to
> complete. Later, we defer the synchronization so we can wait for all SG
> entries together.
> 
> Cc: Leon Romanovsky <leon@kernel.org>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Marek Szyprowski <m.szyprowski@samsung.com>
> Cc: Robin Murphy <robin.murphy@arm.com>
> Cc: Ada Couprie Diaz <ada.coupriediaz@arm.com>
> Cc: Ard Biesheuvel <ardb@kernel.org>
> Cc: Marc Zyngier <maz@kernel.org>
> Cc: Anshuman Khandual <anshuman.khandual@arm.com>
> Cc: Ryan Roberts <ryan.roberts@arm.com>
> Cc: Suren Baghdasaryan <surenb@google.com>
> Cc: Tangquan Zheng <zhengtangquan@oppo.com>
> Signed-off-by: Barry Song <baohua@kernel.org>
> ---
>  arch/arm64/include/asm/cacheflush.h |  1 +
>  arch/arm64/mm/cache.S               | 42 +++++++++++++++++++++--------
>  2 files changed, 32 insertions(+), 11 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/cacheflush.h b/arch/arm64/include/asm/cacheflush.h
> index 9b6d0a62cf3d..382b4ac3734d 100644
> --- a/arch/arm64/include/asm/cacheflush.h
> +++ b/arch/arm64/include/asm/cacheflush.h
> @@ -74,6 +74,7 @@ extern void icache_inval_pou(unsigned long start, unsigned long end);
>  extern void dcache_clean_inval_poc(unsigned long start, unsigned long end);
>  extern void dcache_inval_poc(unsigned long start, unsigned long end);
>  extern void dcache_clean_poc(unsigned long start, unsigned long end);
> +extern void dcache_inval_poc_nosync(unsigned long start, unsigned long end);
>  extern void dcache_clean_poc_nosync(unsigned long start, unsigned long end);
>  extern void dcache_clean_pop(unsigned long start, unsigned long end);
>  extern void dcache_clean_pou(unsigned long start, unsigned long end);
> diff --git a/arch/arm64/mm/cache.S b/arch/arm64/mm/cache.S
> index 4a7c7e03785d..99a093d3aecb 100644
> --- a/arch/arm64/mm/cache.S
> +++ b/arch/arm64/mm/cache.S
> @@ -132,17 +132,7 @@ alternative_else_nop_endif
>  	ret
>  SYM_FUNC_END(dcache_clean_pou)
>  
> -/*
> - *	dcache_inval_poc(start, end)
> - *
> - * 	Ensure that any D-cache lines for the interval [start, end)
> - * 	are invalidated. Any partial lines at the ends of the interval are
> - *	also cleaned to PoC to prevent data loss.
> - *
> - *	- start   - kernel start address of region
> - *	- end     - kernel end address of region
> - */
> -SYM_FUNC_START(__pi_dcache_inval_poc)
> +.macro raw_dcache_inval_poc_macro
>  	dcache_line_size x2, x3
>  	sub	x3, x2, #1
>  	tst	x1, x3				// end cache line aligned?
> @@ -158,11 +148,41 @@ SYM_FUNC_START(__pi_dcache_inval_poc)
>  3:	add	x0, x0, x2
>  	cmp	x0, x1
>  	b.lo	2b
> +.endm
> +
> +/*
> + *	dcache_inval_poc(start, end)
> + *
> + * 	Ensure that any D-cache lines for the interval [start, end)
> + * 	are invalidated. Any partial lines at the ends of the interval are
> + *	also cleaned to PoC to prevent data loss.
> + *
> + *	- start   - kernel start address of region
> + *	- end     - kernel end address of region
> + */
> +SYM_FUNC_START(__pi_dcache_inval_poc)
> +	raw_dcache_inval_poc_macro
>  	dsb	sy
>  	ret
>  SYM_FUNC_END(__pi_dcache_inval_poc)
>  SYM_FUNC_ALIAS(dcache_inval_poc, __pi_dcache_inval_poc)
>  
> +/*
> + *	dcache_inval_poc_nosync(start, end)
> + *
> + * 	Issue the instructions of D-cache lines for the interval [start, end)
> + * 	for invalidation. Not necessarily cleaned to PoC till an explicit dsb
> + *	sy is issued later
> + *
> + *	- start   - kernel start address of region
> + *	- end     - kernel end address of region
> + */
> +SYM_FUNC_START(__pi_dcache_inval_poc_nosync)
> +	raw_dcache_inval_poc_macro
> +	ret

Sorry, similar naming nit to the other patch. Let's have the macro use
the 'nosync' suffix instead of the 'raw' prefix. You can chuck some
underscores at it if you want to keep the name of this function the same.

Will

