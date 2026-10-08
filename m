Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7739CA6007
	for <xen-devel@archiver.kernel.org>; Thu,  8 Oct 2026 08:47:31 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1443059.1660440 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xEjmZ-0001gH-8K; Thu, 08 Oct 2026 08:47:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1443059.1660440; Thu, 08 Oct 2026 08:47:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xEjmZ-0001gA-5Y; Thu, 08 Oct 2026 08:47:19 +0000
Received: by outflank-mailman (input) for mailman id 1443059;
 Thu, 08 Oct 2026 08:47:18 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xEjmX-0001g4-VR
 for xen-devel@lists.xenproject.org; Thu, 08 Oct 2026 08:47:18 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xEjmW-000MjN-NP
 for xen-devel@lists.xenproject.org; Thu, 08 Oct 2026 10:47:16 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ac7588c-2eae-0a2a0a5409dd-0a2a450bd148-28
 for <xen-devel@lists.xenproject.org>; Thu, 08 Oct 2026 10:47:13 +0200
Received: from [209.85.128.42] (helo=mail-wm1-f42.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ac75891-b7e8-0a2a450b0019-d155802acc0f-3
 for <xen-devel@lists.xenproject.org>; Thu, 08 Oct 2026 10:47:13 +0200
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-4a168355946so24938525e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 08 Oct 2026 01:47:13 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a1843cb256sm49360005e9.5.2026.10.08.01.47.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Oct 2026 01:47:11 -0700 (PDT)
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
        d=suse.com; s=google; t=1791449233; x=1792054033; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aFTz6/ey6PBFnkyw1RG2MwqdUAInL3A+nwIFvu9l3GU=;
        b=REfM6hR1f6IXCU6B8GiCXHSU9S1FkcYrafwUZHEYLvJGs7C1s1MBctFDAluO7fVUjx
         MG5VKAaww9UFZe7P3Bv7XwZZg6tlGsgFBYg/G8j7wW8M1xaCksc7nKIavFav0LPNVddo
         AVJ/rEH2VWj8qiUB2/dhTfYJSA+pyzo35h7v9Hv56V1qHygTiWxp98GbZv0/17XXby+y
         8CH6dfIlXRRvfdnntsAJVhGLoX2Q5I0slwe09GoULMDepW325jbPJBbWQdtXFFVPGNIG
         OaGg4to+p/sw3KZU0UEo3PRj19oDqdIeLPmN6N9J8b8iQhgDIAH8GDFOst8H9LkLOFqq
         CU6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791449233; x=1792054033;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aFTz6/ey6PBFnkyw1RG2MwqdUAInL3A+nwIFvu9l3GU=;
        b=mkTte3O+HF5HLy5jsLPGot6+JdQmzMfuq8HZ4c7MW9ze7vhclEDrP8vDp4d40n1tRx
         6jRRbgUTcMXIO7Byj6NiKPQuATWqUweO/t9LTX43+oyU5oHBx/JmiJAfirpazZ25jnr7
         Q6gd5z6OOX7/tCn34jWR5bo/pmGvvEzDz8xFE7yXwiu603Ny+/ay66bEArBxn+lIm4dL
         OxFE2bb2BEvry0RULntic71cga+Eu5JsyxegstD0gu2dTaNvWZ7CJA+w+QSGDxCmKYhp
         eD8TltrfR+RL5aYN9jCTo5Z5fCAEpCDtGi8gmF/9URc0BlLoTaVuWLrr7YaqycjFk2N7
         4inQ==
X-Forwarded-Encrypted: i=1; AKwUvBwWR4lPEWonIkP6E/cyms2URRWzKtF8TCSV8LS6Rff3u+9tNe8fyRfQB8/2iaz7ZLpZjH2Qv9caQps=@lists.xenproject.org
X-Gm-Message-State: AFuF++m2hWo5rQ6D9slvks72rDZnbRMHxr8Cav9gIEDPVR/6BU5ZEL8D
	UAp9Iy82PL+jTxHlozhfOwx3QNUdfCzmxGaVdSY2f4Jat0aTXO2d3HKkUkRLLPh1WA==
X-Gm-Gg: AYBFou3fD2z5prfNm3kztIiByNwzTYWplstWt3RPDDYh9XqtvPBHsrDw0AEtoEgyKOo
	//QMl7JNdtqX9u0uWSzUwqd4HBWa2EZIuUNQH4Y65+F6Dqm5RrUEiMBBt72w+FM/hyPjIWaoW2M
	5YUEnicQCT0GXrWIAb/BdH1e+GXNhzUlhlBV1Ydc/PyG++ZKud7RBTBIgcnvxqt1/SaYlng1PnR
	CyfaBfQCPMAqvxqoX83/u43vYxDit79ySPoaLdB8xy2aSmOu4cDNavzL1/VN++dJEY5y9g/vCm6
	xljbxOL5w7jbSxNkeRFP4NBjYhCc434ruYZ9bxr/jbCl3b8nGbC6chhm8FWySABED8tzJwoM4X4
	En5r/O8+0CfZPJH05gEbCMFPGp9de/Qnehr+2mIi5SEy0EuD3GH26G6bR4bNOc5vr7sCcvleOnF
	LuObtUu3rxsYaP78avQs3rczZiHGvvdmvKNOs7Qwwn6jeWCQO4y/clo8/szZzFSwkvzpff1Wxda
	iXIBNkEwtnB1W5gtjTN6IaTTbCtnBIBo7HRbNZrhO+T1WFoWmv3qig04b9PqDE=
X-Received: by 2002:a05:600c:8116:b0:4a0:108:3b48 with SMTP id 5b1f17b1804b1-4a18030428cmr83460935e9.7.1791449232671;
        Thu, 08 Oct 2026 01:47:12 -0700 (PDT)
Message-ID: <506d21d6-a6e7-4abd-b054-aeccd59565cf@suse.com>
Date: Thu, 8 Oct 2026 10:47:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] xen/pdx: reject regions crossing a lookup table
 index
To: Weiqi Wang <coolhaoyt@gmail.com>
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech,
 michal.orzel@amd.com, julien@xen.org, sstabellini@kernel.org,
 roger@xenproject.org, lucas.cordeiro@manchester.ac.uk,
 Weiqi Wang <weiqi.wang-2@postgrad.manchester.ac.uk>,
 xen-devel@lists.xenproject.org
References: <c3ba7ec05772614c4f84f9bba1e4f3e54d21c14d.1791291898.git.weiqi.wang-2@postgrad.manchester.ac.uk>
 <71fe1a0cff0563db66df7f427d115fdd1953938e.1791291898.git.weiqi.wang-2@postgrad.manchester.ac.uk>
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
In-Reply-To: <71fe1a0cff0563db66df7f427d115fdd1953938e.1791291898.git.weiqi.wang-2@postgrad.manchester.ac.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-42698a/1791449233-AB2DC9EA-E6CF3655/10/78276251493
X-purgate-type: spam
X-purgate-size: 3032

On 06.10.2026 15:06, Weiqi Wang wrote:
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
> Require the first and last page of the region to use the same table
> index.
> 
> This can be reached from the coverage check in srat_parse_regions() when an
> e820 RAM range is not covered by the SRAT ranges, which is the case that
> check is meant to catch.
> 
> Add a test case that fails without this change.
> 
> Found with the ESBMC bounded model checker, and confirmed by running the
> failing case natively against the unmodified code.
> 
> Fixes: c5c45bcbd6a1 ("pdx: introduce a new compression algorithm based on region offsets")
> Assisted-by: Claude Code:claude-opus-5-5 # finding the issue with ESBMC, patch creation
> Signed-off-by: Weiqi Wang <weiqi.wang-2@postgrad.manchester.ac.uk>

Reviewed-by: Jan Beulich <jbeulich@suse.com>
with ...

> --- a/tools/tests/pdx/test-pdx.c
> +++ b/tools/tests/pdx/test-pdx.c
> @@ -288,6 +288,39 @@ int main(int argc, char **argv)
>          }
>      }
>  
> +#ifdef CONFIG_PDX_OFFSET_COMPRESSION
> +    /*
> +     * srat_parse_regions() passes e820 RAM ranges to
> +     * pdx_is_region_compressible(), and these can be wider than any single
> +     * SRAT range.  A region must be rejected when its first and last page
> +     * resolve through different lookup table indices, even if it fits within
> +     * pdx_region_size.  The values are PFNs from a ~5 GiB layout.
> +     */
> +    {
> +        unsigned long ram_start = 0x4ca9bUL, ram_end = 0x12982eUL;
> +
> +        pfn_pdx_compression_reset();
> +        pfn_pdx_add_region(pfn_to_paddr(0x5bbd3UL),
> +                           pfn_to_paddr(0xf18f2UL - 0x5bbd3UL));
> +        pfn_pdx_add_region(pfn_to_paddr(0x1869bdUL),
> +                           pfn_to_paddr(0x189f58UL - 0x1869bdUL));
> +
> +        if ( !pfn_pdx_compression_setup(0) )
> +        {
> +            printf("table-index crossing test: compression disabled\n");
> +            ret_code = EXIT_FAILURE;
> +        }
> +        else if ( pdx_is_region_compressible(pfn_to_paddr(ram_start),
> +                                             ram_end - ram_start) )
> +        {
> +            printf(
> +    "region [%#lx, %#lx) crosses a table index but was accepted\n",

... this format string placed normally. We don't mind format strings going
past 80 columns. Possibly the word "region" could also be omitted. (Surely
this adjustment can be done while committing; no need to submit v4 just
for this.)

Jan

