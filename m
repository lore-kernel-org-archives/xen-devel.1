Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D0E8606A31A
	for <xen-devel@archiver.kernel.org>; Tue, 27 Oct 2026 11:36:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=SY1dW+jd
Received: from list by lists.xenproject.org with outflank-mailman.1462080.1673120 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLfSt-0001Wo-Vp; Tue, 27 Oct 2026 11:35:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1462080.1673120; Tue, 27 Oct 2026 11:35:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLfSt-0001Wh-SC; Tue, 27 Oct 2026 11:35:39 +0000
Received: by outflank-mailman (input) for mailman id 1462080;
 Tue, 27 Oct 2026 11:35:39 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xLfSs-0001Wb-Um
 for xen-devel@lists.xenproject.org; Tue, 27 Oct 2026 11:35:39 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xLfSs-003QG7-4T
 for xen-devel@lists.xenproject.org; Tue, 27 Oct 2026 12:35:38 +0100
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ae08c7f-2eae-0a2a0a5409dd-0a2a4507e4ea-48
 for <xen-devel@lists.xenproject.org>; Tue, 27 Oct 2026 12:35:37 +0100
Received: from [209.85.221.51] (helo=mail-wr1-f51.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ae08c89-b4ea-0a2a45070019-d155dd33cd13-3
 for <xen-devel@lists.xenproject.org>; Tue, 27 Oct 2026 12:35:37 +0100
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-48dfc0421d9so3406197f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 27 Oct 2026 04:35:37 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e3ebc3c5bsm22992317f8f.9.2026.10.27.04.35.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Oct 2026 04:35:36 -0700 (PDT)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:Autocrypt:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1793100937; x=1793705737; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IcCI4frMu7p5QnsKC66MEafUJj1B+BfRNflTPN5BE34=;
        b=SY1dW+jd6ePHLEzXAsRl7IwPh1lzPvRRvD5GWy0DbIAy0r4dLWNyq8um2YCApaeGtI
         1mSmk7c27zOQiaJLPYSXwEJWIPBp8MXpwGe7g3iDwt9HcPbywRhW8j+kecy0Wi64IYIm
         c38CBCTT5BvJMB+pPJTG0nVaUlmPXQ9RSMo1Ge8wPPi5PBmHGD31Kdk5ZrJaFnioDQZG
         ONABbjZZUgIHD4bjzAiWGp0XQMq79/hv/w6cCukUuMG7mWqrvEEvvyVgXAaEyJ5jAfj4
         cG+PHgjrLNiJXmOQFkU9eCuIRPkS3KyGk1hgAUzTxAST8vzf5Pm5QilhMiDTWjqNw72M
         913g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793100937; x=1793705737;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IcCI4frMu7p5QnsKC66MEafUJj1B+BfRNflTPN5BE34=;
        b=UzG6n8AajmLNJLU1SYx7EeYod1rB4GpU/NIplEK2REjv10jKiYY314llZY8VPJorGf
         fh9XyIlgLQpvcNJwg58kskTiDE25433y6HILfMp5l2SACJuNBDSnXV0zfha99ythrjy+
         dG8l7DKkhRAV26h478RepINCjygqbnYodxCzDIzftKlxL07hmdoowwIdrnzDvAb4dxDd
         eaYJX0gw3ase8pY12Zl9j40HhUSkO++nc2JXXKWks18ZTgrBxguC7fKGACqndYNNF/ct
         30L45/uQE36LrOtVAbS5LzlnWx0rMEi6RjXHbtqnWXs1vz5sZSYa5JXWFmzmLsD9N6Vo
         al+A==
X-Forwarded-Encrypted: i=1; AKwUvBxI4BoIG8G76CqhwAaltK9+va2XkKdRnaUu411VkRuviVrEM1JcQ5tnJ9XyBuNgd5mnONIeA2wrUk0=@lists.xenproject.org
X-Gm-Message-State: AFq9FYJPdsjgEZ4+aDxZ3RVly2Aa3IWcYdODqWu1w7CfwGXAiFqjinpi
	u0ZreFhN+AALMn4XEDddeKM61djOdyURzwrAKCMssrNkkkxTK2/Oam0oKjwkmlwWPg==
X-Gm-Gg: AYBFou0tSSCC6A3iOGgLJAxKpWr8O6sNKlXi54wOP5/Ag2ogKRvCWRTDu8ja20lAekJ
	5UxR161wY8PjAU7/0PzN+L69vE/jsBnYqQ9bZ2KSk0WLT8y3mOIx4d2HSLYLeC3L3ivSTDVPrEu
	Gfthel/1xGEEan+JywNrK9pkT7EejspwKTnPC8kZj96rfPrEl2bQFrWBZJRPjj2Hc0mdKpL6sq5
	r6HA3UYCIqX90ZolRO5f6lM7/DSJmseWeHiAafuZFcV8MXHoxEwmEbXpGNRtK+1bpMGgnxKNqwN
	9nFdrJiMyS+RD2yJFgDTmTdP1PIwQuC7imAOJk50rK020JUnX1+3+Kjld6s3PMu6v+6DNeDImFy
	Wq5uRT9Epx3Hue4Sbq7EWljTB4UX55uc0QSlXZig+Nst4Z7+mTlzxPyRn4Hkh3JrVsW69bFbXXC
	bW5eWXlQbz6G0xVfHricwcBjS1qzJ769/BKMflrXAzrxxEo8eOirPvRz6FPeJ8Hd5gHhl2iutfa
	uMkuLMGPgo2bjb3i+PlpbIKBKrDBUkjZkH/GhuL2hndL1PmWytQpcC0a3b+WloULjk02rwx9xvC
	ZCgYyO8neJY9FtgECBgmmiIl564kX8VNoY8SLw6SiM0=
X-Received: by 2002:a05:6000:26c7:b0:48e:824:f0b9 with SMTP id ffacd0b85a97d-48e3eb945b1mr20069682f8f.45.1793100937013;
        Tue, 27 Oct 2026 04:35:37 -0700 (PDT)
Message-ID: <79b56256-3df6-40b6-9827-d23347b9c6ed@suse.com>
Date: Tue, 27 Oct 2026 12:35:35 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xen/amd/iommu: record the IOMMU for alias DeviceIDs
To: Stefano Stabellini <stefano.stabellini@amd.com>
Cc: andrew.cooper3@citrix.com, roger@xenproject.org, jason.andryuk@amd.com,
 teddy.astie@vates.tech, xen-devel@lists.xenproject.org
References: <20261020221214.3683476-1-stefano.stabellini@amd.com>
 <20261026235926.2105578-1-stefano.stabellini@amd.com>
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
In-Reply-To: <20261026235926.2105578-1-stefano.stabellini@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ef75cf/1793100937-A4ECEAE4-81484B34/10/78276251493
X-purgate-type: spam
X-purgate-size: 2825
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 27.10.2026 00:59, Stefano Stabellini wrote:
> add_ivrs_mapping_entry() marks an alias DeviceID valid and may give it
> an interrupt remapping table, but records the IOMMU only for the device
> using the alias.  If no IVHD entry names the alias DeviceID itself,
> amd_iommu_setup_device_table() passes a NULL IOMMU to
> amd_iommu_set_intremap_table(), which dereferences it at boot.

Also possibly amd_iommu_alloc_intremap_table(), as it looks.

> Record the IOMMU for the alias too, as was done before the interrupt
> remapping rework.  Nothing relies on it being NULL: the alias is then
> handled like any other DeviceID.  Its remapping table is freed on
> cleanup and dumped by the 'V' key, a device at the alias DeviceID can
> be added instead of failing with -ENODEV, and reserved ranges, already
> recorded for the alias as well, are reported once under it.  A NULL
> check at the crash site instead would leave the alias device table
> entry without interrupt remapping.

What about find_iommu_for_device(), for example? That does check .iommu
to be non-NULL, and hence behavior there is being altered by the change.
Maybe to the better, but that's not obvious to me.
amd_iommu_get_reserved_device_memory() has a similar, related check.

> --- a/xen/drivers/passthrough/amd/iommu_acpi.c
> +++ b/xen/drivers/passthrough/amd/iommu_acpi.c
> @@ -104,6 +104,10 @@ static void __init add_ivrs_mapping_entry(
>  
>      /* Assign IOMMU hardware. */
>      ivrs_mappings[bdf].iommu = iommu;
> +
> +    /* Requests using the alias go through the same IOMMU. */
> +    if ( !ivrs_mappings[alias_id].iommu )
> +        ivrs_mappings[alias_id].iommu = iommu;

Comment and code are out of sync as long as the assignment is conditional.
Question is which way this needs adjusting, and hence why you added the
conditional in the first place. Which extends to other aspects of this
function, when called with an alias_id (or bdf) which was previously seen:
Should we reject such (early in the function)? Should later data override
earlier one?

Perhaps what we want here is

    /* Requests using the alias go through the same IOMMU. */
    if ( ivrs_mappings[alias_id].iommu )
        ASSERT(ivrs_mappings[alias_id].iommu == iommu);
    ivrs_mappings[alias_id].iommu = iommu;

?

Furthermore, if there's an issue with .iommu, why would there not be the
same issue with the other fields set by this function? (Else if some of
the fields can be relied upon only when
ivrs_mappings[n].dte_requestor_id == n, then I think this would need
writing down somewhere.) See e.g. amd_iommu_setup_domain_device(): It
uses get_dma_requestor_id() to determine DTE and ivrs_dev, and passes
that ivrs_dev to use_ats(). If this is an alias, ivrs_dev->block_ats
won't be properly set.

Jan

