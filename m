Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6910ECA5FFC
	for <xen-devel@archiver.kernel.org>; Mon,  5 Oct 2026 09:08:46 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1440629.1658030 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xDegH-0006Im-To; Mon, 05 Oct 2026 09:08:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1440629.1658030; Mon, 05 Oct 2026 09:08:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xDegH-0006If-QY; Mon, 05 Oct 2026 09:08:21 +0000
Received: by outflank-mailman (input) for mailman id 1440629;
 Mon, 05 Oct 2026 09:08:19 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xDegF-0006IZ-Lg
 for xen-devel@lists.xenproject.org; Mon, 05 Oct 2026 09:08:19 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xDegE-00AQ1w-EJ
 for xen-devel@lists.xenproject.org; Mon, 05 Oct 2026 11:08:18 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ac368f3-8faa-0a2a0a5109dd-0a2a450ac492-32
 for <xen-devel@lists.xenproject.org>; Mon, 05 Oct 2026 11:08:18 +0200
Received: from [74.125.225.140] (helo=mail-wm2-f12.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ac36902-f2d2-0a2a450a0019-4a7de18cc659-3
 for <xen-devel@lists.xenproject.org>; Mon, 05 Oct 2026 11:08:18 +0200
Received: by mail-wm2-f12.google.com with SMTP id
 5b1f17b1804b1-4a1722c37c9so5197655e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 05 Oct 2026 02:08:18 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a03ff56136sm127262875e9.3.2026.10.05.02.08.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Oct 2026 02:08:16 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:Autocrypt:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1791191298; x=1791796098; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vz5RxzHZkbj/P4LeJtNZ5BCMlbA0wuc5OUSU/fF6dIE=;
        b=VUgHBKgN+QvzA2Qgc1nsjitqIHlvia5yi/rfOVDqeKRvhoHnlguezJXDBTSZz3N5Ay
         jwhfXAMl8kdFCEDF07GpaxrJembl/pfW1vZc/bEYNv81bnuUrI1K2aI1HRzvS3r85hXr
         hb7K+FgHnPFd3+lZqr0t8ZB2dcTFsqMANIprnsvGVcWvhE/obL6oiPxwY/cv0W7xCETU
         JInN7LpbRs/X0ItL/zeyGC8WrrOxRvJxgqXdE+ku07TKBJJlnpDgtoG8NzDbhLx+cqwf
         tGE5CUa46z/YSIzgQ9z5InzLW+p+VdSFqKzlXoNXle386o08Qrjxpismuul51nM2qHn7
         hG+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791191298; x=1791796098;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vz5RxzHZkbj/P4LeJtNZ5BCMlbA0wuc5OUSU/fF6dIE=;
        b=UQb9zaqm7KzTabB3l9hiFchGY2v8xzzIzRzdPE6HxYA2AzEz1FWpIHEHELea9u7AE5
         7+G+ZkBedN4OdgJ/qnsg8zkj34uG7obfCFl+4ca/P/ytgNV/yqf9iAQp7e4sBTDQdL1F
         VMoGRGezVDNWelVxg4PYg1dxzDmce5HK+ULn/K+gXYe6PTDqypKzjPb5e+Jhb4oWREth
         Te6EADQ/UItxTYL+GKQHStJtdBGDWwppm4TpxEb64CIwtWTSEaqHojVZx1mQ7uOtOVM9
         5yR/nQmueTECc0b5j38Hykjb9kwnXoibWKsf+bb1r2nkwj71bztDS4KjGDKMtFKc6bKS
         OSTA==
X-Forwarded-Encrypted: i=1; AKwUvBxyT8Og9TDSGiI1lUAiO8Lf2IY5FryuOfD606RPB70BUHEGvdS0SQKz2wcOEg478q4a1s2uubJ2Lc4=@lists.xenproject.org
X-Gm-Message-State: AFuF++nLJRhLfKpeCe0xjl9OIvrRdbzauNe5xkQbXSqb3CEJgidazEGD
	+llawG+CArqhUbUqpUTScDg7K9MGmmULoyxo0+uzEFVFd3Yq0tWtqs8PHNcX4FmJhQ==
X-Gm-Gg: AYBFou23IANgei+Gf3XkzpU5KbgMNtQVZ5Afsuir8FupoRsaiKQTHvKLMRQEr6kXHJN
	oHCKyS00ueHUexmJlrL2YvgiM0FhyHEiuW+1h4eN7xkK7pFGHfSC5BiW+9cuqymnxHQQ10EsR1K
	qtMqG6WHfgyhANFlSaHHsIlPAP4+mzJTbF1NkQsB/0nvsBE3W1vg2va3sZ1VArnzfJT/Hp3tsvH
	PLbmCq1tU9LBPc2JeA6OK/RpsxHj41+FmnIWLO4ft6HJXBF59N/Br3ePo0WoKfYkChOTnbYZyCQ
	ngdzXOs8Zqy3kkHEE+S21qNf7aQlVNUm2Uv0w3BBpudv0Y5SVq/D5hXDxS6DayT5C4EORnLfGwd
	AL0UcnDhRnfQxZBUK0cbNzQNrYLQwdZnksflEzoAOSPKoeIh7aUMPPxCnHVzQVT24XBzLYtfP71
	tygR5dHVA98wGRF42S1I7iPqFU8l7AhKLH7O8afTZQByIx9hdOK+X5Pz+Dc9tTy097/UDMcWlmi
	BqQ0VwlYTs71Q+J6R7jHqB0emdNrMd8kSKrBxSfIofz8t87LGVjnGRTdwNY64Y=
X-Received: by 2002:a05:600c:19c9:b0:4a1:6c0c:ab93 with SMTP id 5b1f17b1804b1-4a16c0cabc6mr88448515e9.28.1791191297629;
        Mon, 05 Oct 2026 02:08:17 -0700 (PDT)
Message-ID: <a658d0dc-1748-435d-9fec-e7b03b7422b3@suse.com>
Date: Mon, 5 Oct 2026 11:06:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] xen/pdx: reject regions crossing a lookup table index
To: Weiqi Wang <coolhaoyt@gmail.com>, roger@xenproject.org
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech,
 michal.orzel@amd.com, julien@xen.org, sstabellini@kernel.org,
 lucas.cordeiro@manchester.ac.uk,
 Weiqi Wang <weiqi.wang-2@postgrad.manchester.ac.uk>,
 xen-devel@lists.xenproject.org
References: <20261004190409.29276-1-coolhaoyt@gmail.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <20261004190409.29276-1-coolhaoyt@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-4011c0/1791191298-4B4D7CFC-16FFBD56/10/78276251493
X-purgate-type: spam
X-purgate-size: 6036

On 04.10.2026 21:04, Weiqi Wang wrote:
> From: Weiqi Wang <weiqi.wang-2@postgrad.manchester.ac.uk>
> 
> pdx_is_region_compressible() only looks up the table entry of the first
> page, and checks the region against [pfn_base, pfn_base +
> pdx_region_size).  pfn_base need not be aligned to the table index
> granularity, so that window can extend into the next index, which belongs
> to a different range with a different offset.  A region whose tail lies
> there is reported compressible, yet its last page on its own is not, and
> translates through the wrong offset.
> 
> Also require the first and last page of the region to use the same table
> index.
> 
> This can be reached from the coverage check in srat_parse_regions() when an
> e820 RAM range is not covered by the SRAT ranges, which is the case that
> check is meant to catch.
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

I don't quite understand this part: SRAT not covering all E820 regions isn't
tied to huge addresses, is it?

>     [1] https://www.mail-archive.com/xen-devel@lists.xenproject.org/msg194095.html

Hmm, indeed you now provide an example of the concern raised there. I think
we indeed ...

> --- a/xen/common/pdx.c
> +++ b/xen/common/pdx.c
> @@ -324,7 +324,8 @@ bool pdx_is_region_compressible(paddr_t base, unsigned long npages)
>      unsigned long pfn_base = pfn_bases[PFN_TBL_IDX(pfn)];
>  
>      return pfn >= pfn_base &&
> -           pfn + npages <= pfn_base + pdx_region_size;
> +           pfn + npages <= pfn_base + pdx_region_size &&
> +           PFN_TBL_IDX(pfn) == PFN_TBL_IDX(pfn + npages - 1);
>  }

... need this extra check (as we want to cope with SRAT and E820 not fully
agreeing). Roger?

Jan

