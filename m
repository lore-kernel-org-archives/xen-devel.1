Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0979BCA5FB1
	for <xen-devel@archiver.kernel.org>; Wed, 30 Sep 2026 09:17:01 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1436966.1655658 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBqQR-0001Ef-T1; Wed, 30 Sep 2026 09:16:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1436966.1655658; Wed, 30 Sep 2026 09:16:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBqQR-0001EY-P2; Wed, 30 Sep 2026 09:16:31 +0000
Received: by outflank-mailman (input) for mailman id 1436966;
 Wed, 30 Sep 2026 09:16:31 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xBqQQ-0001ES-SY
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2026 09:16:30 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xBqQP-00BgAP-Lt
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2026 11:16:29 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6abcd367-8faa-0a2a0a5109dd-0a2a4504b8c8-18
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 11:16:29 +0200
Received: from [74.125.225.98] (helo=mail-wr2-f34.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6abcd36d-b57f-0a2a45040019-4a7de16289c8-3
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 11:16:29 +0200
Received: by mail-wr2-f34.google.com with SMTP id
 ffacd0b85a97d-48884b0219bso2653982f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 02:16:29 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48b029edea4sm2095305f8f.22.2026.09.30.02.16.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Sep 2026 02:16:28 -0700 (PDT)
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
        d=suse.com; s=google; t=1790759789; x=1791364589; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CAkMOPMyTaLaREECd8FDu5/o24Ns16hyxx155bhE4gM=;
        b=PNtFdToRPUfthvKku0Nbmziba1jFxZe7y9QQTjctXfSu25fBZHLIFQh0Z8tlKWXhYf
         HY+B6BM9iA9OUcHBh1whdwtytNtrxBkQnDoilhVZc7LOYSM+h+ar3x+IkGm4Hwy/mFYs
         aWKP4baCGRCFVxxGiEB9aJCXB3PKwC2OixNnI0X8jppT/J5n0X4giOA935X7x3N1JDBt
         g0ft+Cv0MA6nFX+bEJHqm7WBGIj1VqXWaOXATyLKdlcfxjTVIjAtYL1iIyYK2JM0xMtM
         aHzzdCwaM5vMKS4el53tPks3uc1S/XYRJ+NwNvq5PqPhUNhPOPR0boE1uyWF3kK3rhJx
         8DZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790759789; x=1791364589;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CAkMOPMyTaLaREECd8FDu5/o24Ns16hyxx155bhE4gM=;
        b=yGftdotdd0Nleszh1oj60VS3vSiY41NOF4IXjFuk7uCFw3JWkhB0ugWRnEb3BKgxN/
         xkeN5SWohq2AaJGC5z2d0nVVYzBkA21AmT2mYPjGsFE2qIz+f397XC/OM6VHn7zOBIKj
         1CPzn001n3oGgpTvesXuD6NcPpZ8fSkKDr1MKX7UBWBUNPW/Dyw+aLxI8TZYBxxmLhBo
         hwkrya/7nE+14/3bQOXytvBdPN3hPXJXjhoKxiB6Dj7w7/NuB+MDMiVvKkXdceoBVn3s
         3Vqb+Lob/+1Z/m6SyBr6vupd7JWbJmeJ6pCY2gHBz8fNJ4GAb1zHCQJl+LKDKvwnFcxK
         eC/Q==
X-Forwarded-Encrypted: i=1; AKwUvByO9mEVzC7BV2aGweOXu/WjJeKGhXVFu/+M24XJht8xYbnGNQnfHLC2Tj/47+kaXJK9bqfb/0jMozo=@lists.xenproject.org
X-Gm-Message-State: AFq9FYLrDHmyVtywSQ2rJBLG8ov42hHMziQx+JlzfOAlXATmiNq7tWHa
	efq4ax3PufDxRN00V3jWoZ+3O1tcIe3WiO+ytnA3XfVBBe/yjHDFbZuAiqaoF/iIDg==
X-Gm-Gg: AYBFou3/EqzAGZe1FqzsApA/STxFylLnidS2dfTRON6tZ81ZXmrqXJl1K1m5UK9RG49
	E+FxpoEp2FvYk46YdynWzGEMn6tZA3nRhYWxiaq827YVn75NfHDRRHvvaYetZMO8Al5BzATMtZN
	eBH2K5+gU6x5l9+MMNGAWGdeyxdegNVnGGH80ZcLQknGTt8q8hAFoOZTaoDpVsfxbsTk6LXpkDA
	H1hHUWY1STGkCkdwgnbDcjArXcNYxWILtuHQLkL6BDtEFmLXC9EDGR2HrBi4twJLpZ32QmVoycZ
	v8zh9wd4Yk7OyBI/8elocYv7+0Zy/B8iGBlh8xkhBNe4tZKS7BwI/tKNkJGXfH/tdNxUBHIkcvG
	vHFh7WfEVV9+8AOLwlEckp3R1F5G69W5gRGrD9g3bx+3eKttQXyV2E4Vdu4BSZZu9itHoA4MNgi
	a5nZER3vLaRVvQGBWkgdGPUpOG4gm1GUg7gbYYyKuIi4adjr/ZBw5eAxTFk5kEuF0qJnVR1JOE/
	8tS9YjjlJMuksk8iOXLU2HpwdZ97qaM/RcH++C8zMKRPfvR4xTRAg5DQvIDFXxDX9WlNksTlA==
X-Received: by 2002:a05:6000:2882:b0:48a:fba3:d5af with SMTP id ffacd0b85a97d-48b0244e251mr1538646f8f.4.1790759788607;
        Wed, 30 Sep 2026 02:16:28 -0700 (PDT)
Message-ID: <1abe6540-e92a-4d11-90e0-a3c13c9b0a97@suse.com>
Date: Wed, 30 Sep 2026 11:16:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] vm_event: svm: Don't BUG() when enabling intercept on
 hypervisor MSR
To: Teddy Astie <teddy.astie@vates.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
References: <1790250881.8631fc262581453bbf619ec5b2062170.1a0d344933500072c4@vates.tech>
 <1790250991.8631fc262581453bbf619ec5b2062170.1a0d3463da200072c4@vates.tech>
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
In-Reply-To: <1790250991.8631fc262581453bbf619ec5b2062170.1a0d3463da200072c4@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ebf023/1790759789-53CC7B50-8AC148DC/10/78276251493
X-purgate-type: spam
X-purgate-size: 1708

On 24.09.2026 13:56, Teddy Astie wrote:
> svm_msrbits() only cover MSRs in the ranges specified in APM and returns
> NULL for all the other ones (i.e hypervisor range), which triggers the
> BUG_ON() that follows.
> 
> APM specifies that MSR outside the architectural and AMD specific ranges
> are unconditionally intercepted, hence don't require any specific handling
> by SVM logic, fix this by ignoring cases when msr_bit is NULL.
> 
> This is only reachable with CONFIG_VM_EVENT using XEN_DOMCTL_MONITOR_EVENT_MOV_TO_MSR
> to configure a MSR intercept in the hypervisor range (0x40000000–0x40001fff).

Hence imo it is wrong to drop the sanity check altogether. See below.

Also, nit: Description lines want limiting to 75 chars.

> --- a/xen/arch/x86/hvm/svm/svm.c
> +++ b/xen/arch/x86/hvm/svm/svm.c
> @@ -237,7 +237,9 @@ void svm_intercept_msr(struct vcpu *v, uint32_t msr, int flags)
>      const struct domain *d = v->domain;
>  
>      msr_bit = svm_msrbit(v->arch.hvm.svm.msrpm, msr);
> -    BUG_ON(msr_bit == NULL);
> +    if ( msr_bit == NULL )
> +        return;

Imo the function wants to return an error here, which all callers
except the one you mention check. I.e. the BUG_ON() would be moved
out to most callers (alternatively the one caller could range-check
the MSR itself). Right now for introspection intercepts can only be
enabled, hence why for that use "all other MSRs are intercepted
anyway" is fine. Suppose the inverse operation would be possible as
well: Then indicating "success" back to the caller when accesses to
the requested MSR are still intercepted would be wrong.

Also, nit: We generally prefer !msr_bit over msr_bit == NULL.

Jan

