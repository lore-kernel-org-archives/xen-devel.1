Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 991A3C55ABF
	for <xen-devel@archiver.kernel.org>; Tue,  4 Aug 2026 16:04:46 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1382436.1625806 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrHcx-0004kD-5w; Tue, 04 Aug 2026 16:04:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1382436.1625806; Tue, 04 Aug 2026 16:04:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrHcx-0004k5-0D; Tue, 04 Aug 2026 16:04:27 +0000
Received: by outflank-mailman (input) for mailman id 1382436;
 Tue, 04 Aug 2026 16:04:26 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wrHcv-0004jE-WC
 for xen-devel@lists.xenproject.org; Tue, 04 Aug 2026 16:04:26 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wrHcu-001mZB-MB
 for xen-devel@lists.xenproject.org; Tue, 04 Aug 2026 18:04:24 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a720d80-bab6-0a2a0a5309dd-0a2a450b8942-26
 for <xen-devel@lists.xenproject.org>; Tue, 04 Aug 2026 18:04:24 +0200
Received: from [209.85.221.47] (helo=mail-wr1-f47.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a720d88-b7e8-0a2a450b0019-d155dd2fb82f-3
 for <xen-devel@lists.xenproject.org>; Tue, 04 Aug 2026 18:04:24 +0200
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-47362928f65so4540855f8f.2
 for <xen-devel@lists.xenproject.org>; Tue, 04 Aug 2026 09:04:24 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47fec249a78sm642447f8f.34.2026.08.04.09.04.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Aug 2026 09:04:22 -0700 (PDT)
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
        d=suse.com; s=google; t=1785859464; x=1786464264; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m5PEtzj8mtJe7pFOG8I3FsyiHy4JEbRtR3I88EiU7ZQ=;
        b=MX+irVqJ2dI01rJT/FniLmL2rBtcyz260T6tq4/5aZj2p1153/vecKPbA38XoTdJZ8
         mFAk/ehQBz17WlK5Nl4H2ZTWEXR/JQWE6yJV8YdyTjq9m/7mihOOqLrseD+QFBy8T87M
         e0XYDMhdElNmf482tK4Q54fjx9XSFbT8tvZVd4bD33qiQBP3rtaT7bn9OEDgj8lgr3sI
         oeiTr+fBanIgBFZSUwlTYkhnZJztSC4WGU1myxAnNxRCOAbL6XP4UzabPsXYikGTqONZ
         EpTUWIACb6Hd5V+tYd1HEdz57CSQFXgnagbjyQVw/EeLFPm2cRQgbcRitLD0q5DMxVWt
         NMfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785859464; x=1786464264;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m5PEtzj8mtJe7pFOG8I3FsyiHy4JEbRtR3I88EiU7ZQ=;
        b=qoj6uvxt+/kdBUbtFyoD6Y2A547hO6XmodhFGHYHEx0LyeuuqKM9SSvIcKl8VY/q1m
         0CoaGPsw7lIzUPuIzJBbNOGfpd/GRbNHS/f9oJwWoBdxmlN0J6mraBKMjXyfjGb6ce3r
         ZMEJp3DBMuyOnUpJ6ENgOtq3dDIZ6CRNjk7j4Ut2lNWtHGBxI87z/A+a7zy3ka5VoiU8
         cx/W5+vNJ4AkFt1p6VQKt2wC+nxFHo484gV5mWPxCfL0CG8HMpTjGdR3Bd7pWey5SyPE
         76D5DHUIfLjPmaIu+DYiuIghEZa6G+aLvT1fp9hGpmsk21veF9lFHfN3UJE7JXljQ3Ws
         ytxw==
X-Forwarded-Encrypted: i=1; AHgh+RrMA5Dee2JgTbQlkFwoQFeFSXCAqzNRs+EsPYemrDLFG8+F612r0BWxTYV/WOxVBDm4GITDO+OWz10=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx29rJVF93B7jRFhha4EAHGsOmS1DLzK1saYs0+LzTQbeoh28zI
	Ogxtzd+nVENqNdMUltgE3bQysGew2XGmT+d+LmMELhOGuPYlNkcDxDccaoMQ004kdpcg/M1B7F0
	2eeH8yQ==
X-Gm-Gg: AR+sD10oo5siioo4NhlsdlYld2CPpMj4H3e2dYCygrE01HVRFC8OEjUg32KxFW8+teW
	lt2gbqHGJ8kl/9Qn/zqrDrOJo06u18BLYR43vjHOH2Wp2yINISHm+wsXONB16h4jR61Z5zZUzxb
	E/NtMJbEJbV9nYb9cN6SVD2Ff/10Rg5eoC2/ZdZ1NpMTCdbriX9FlnC5GlaLkJFF+yQymm6hu4I
	dSU5yW948Ep0YuQArOXPgCFeXfwZMGaq1kB8tA8jpr1fu23qSLNWIObC0C/gP4pISaPSTPf1AS9
	diaKtsyMz1A2kkyP3CGquOA62JhIRRnrREhQCOt8kI3jURISoNOs3qG+R2Jo2ilJFi+fIVRdqwt
	092he3ON0+B4FTZEIyazb4dWjOyYNU8oYN7OHMnS5kBe5ZCebmHENCtjYE4I7+Hbp2tWcsRbGIK
	0KEgQbmmkCpo4hfDvf72NRtpvNaFW7uN6dYClOkLiHTTH2L+W2r+wx2h36eQHI9yEaHYvSETFtN
	EORn2YnGUhsO79Y/gz6D4BjRma14EwItNMfOO7x4Kycd3o7sXPy
X-Received: by 2002:a5d:68c9:0:b0:474:18d9:8371 with SMTP id ffacd0b85a97d-47fec6359c1mr364268f8f.28.1785859464014;
        Tue, 04 Aug 2026 09:04:24 -0700 (PDT)
Message-ID: <55d55c27-a482-4b59-a1f9-1412c91d7835@suse.com>
Date: Tue, 4 Aug 2026 18:04:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] vtd: Ensure context entry is cleared properly
To: Teddy Astie <teddy.astie@vates.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 xen-devel@lists.xenproject.org
References: <1785319236.8631fc262581453bbf619ec5b2062170.19fad51a4be000e099@vates.tech>
 <1785319341.8631fc262581453bbf619ec5b2062170.19fad533bfc000e099@vates.tech>
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
In-Reply-To: <1785319341.8631fc262581453bbf619ec5b2062170.19fad533bfc000e099@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-42698a/1785859464-A8AC89EA-A8DC0F50/0/0
X-purgate-type: clean
X-purgate-size: 1931

On 29.07.2026 11:59, Teddy Astie wrote:
> When removing a context entry for a device, the present bit needs to
> be cleared first, then we can clear the rest of the field. In the current
> logic, the compiler is allowed to perform optimizations in a way where high
> is cleared before the present bit (which is in low part) is, leading to a
> window where the context entry is invalid and would make the IOMMU fault
> (as address width would be set to a reserved value).
> 
> Fix the logic by ensuring we clear the low part first (which also clears
> the present bit) then the high part afterward.
> 
> Fixes: cada0c18f8d1 ("vtd: Move dom0 RMRR check to intel_iommu_remove_device()")
> Reported-by: Teddy Astie <teddy.astie@vates.tech>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
> ---
>  xen/drivers/passthrough/vtd/iommu.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/xen/drivers/passthrough/vtd/iommu.c b/xen/drivers/passthrough/vtd/iommu.c
> index c314ce1db8..1005e200c1 100644
> --- a/xen/drivers/passthrough/vtd/iommu.c
> +++ b/xen/drivers/passthrough/vtd/iommu.c
> @@ -1889,8 +1889,14 @@ int domain_context_unmap_one(
>  
>      iommu_domid = context_domain_id(*context);
>  
> -    context_clear_present(*context);
> -    context_clear_entry(*context);
> +    /*
> +     * Clear the context entry.
> +     *
> +     * As this is performed with two stores, ensure lo (containing the present
> +     * bit) is cleared first.
> +     */
> +    ACCESS_ONCE(context->lo) = 0;
> +    ACCESS_ONCE(context->hi) = 0;

Implying the placement of the present bit is again something I'm a little uneasy
with.

With the uses of context_clear_{present,entry}() dropped, the macros are unused.
I think they would better be dropped right away, to prevent misguided use
elsewhere.

Jan

