Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56C58606A323
	for <xen-devel@archiver.kernel.org>; Mon, 26 Oct 2026 13:25:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=T2WQqA1o
Received: from list by lists.xenproject.org with outflank-mailman.1461351.1672345 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLKhi-0004RP-48; Mon, 26 Oct 2026 13:25:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1461351.1672345; Mon, 26 Oct 2026 13:25:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLKhi-0004RI-10; Mon, 26 Oct 2026 13:25:34 +0000
Received: by outflank-mailman (input) for mailman id 1461351;
 Mon, 26 Oct 2026 13:25:32 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xLKhg-0004R6-3C
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2026 13:25:32 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xLKhf-00E7qq-CT
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2026 14:25:31 +0100
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6adf54c6-e002-0a2a0a5209dd-0a2a450aa2b4-12
 for <xen-devel@lists.xenproject.org>; Mon, 26 Oct 2026 14:25:31 +0100
Received: from [209.85.221.50] (helo=mail-wr1-f50.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6adf54ca-f2d2-0a2a450a0019-d155dd32e401-3
 for <xen-devel@lists.xenproject.org>; Mon, 26 Oct 2026 14:25:31 +0100
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-48df54150dfso1615513f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 26 Oct 2026 06:25:31 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e3ebc39a8sm17375163f8f.11.2026.10.26.06.25.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Oct 2026 06:25:30 -0700 (PDT)
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
        d=suse.com; s=google; t=1793021130; x=1793625930; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hd/R/G5waAjta1bG/JloZRSe+IvgMCS1Vi84kc1JB8M=;
        b=T2WQqA1oX79YjO0W8+1ci+CKN7jJTyIkXoGc0y8P8i4yFvOMqatJyt5084kk4eE3Cz
         VB3UmKl+D9d9ZjD49z8Z8Sh7lOsgGsQp7/BI+nwQGci9QC/keln2KpcHYuVWTFHRlS6P
         /VFNrsDFIUgdSAuhtNeivPjkfHLfxE2rH2T4ZcaivNcItjBdAh+ftZcHBKfcP5aC11fr
         v4M5ki8G8TQSthME2eXjilBCl1hz1RRoI061Kn283AE6XTXByAyys0gNeASkU6lQBzcu
         PuY1VxF6OjwoLlNDDdjilQRc8fjGxlQCxtcqbWIKnzmknbYCygKOnOv5Fc7XjgQBADp8
         Zl/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793021130; x=1793625930;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hd/R/G5waAjta1bG/JloZRSe+IvgMCS1Vi84kc1JB8M=;
        b=YkX7BN69A/Hur9ajI1gl20HMOv2FbWku0oUsyZYlVBwd6ZRr6MuvzvGabjnOAxbf8Y
         1CxJ+yTTA4OMeTvrGIzLZd6u2qHvF51qRmUBCqfCt6WNHPT/iF+YliZzfJyGagRErTKh
         pt/V6uCE7cDm5jJrPKe1l6XVbVBXN6HmxjQf0xq+Y7Ub7G+h8FawDkzG+lXGh9i/xctk
         Q6YGEWeoi5SR/LwmbtvZPxF3asgCGwpjZC84tLN0rl/+4nA4ievRaiMXV3b4BwKJIFqL
         kCE32GtFJwXXf+75VfOGkoSb8pRibjxsw1ZW+1+2p6U1aEsSw6yBbhjWk1YtQHvZi7UL
         uWbw==
X-Forwarded-Encrypted: i=1; AKwUvByGoR3RgqLGOoYr8m46y7oh8A5Ptbe9rKHXpRHlDj4c9wieaOASuyKm7Wx+ayOLmAkhPCD+DuQsA40=@lists.xenproject.org
X-Gm-Message-State: AFq9FYK7yffYVl9hYOs8aFB+k5BYWUslyc9xmJHgLKb+OnbgFWuD0Htk
	MnuKcnvXGynoUt6oI2ceYCRX3lDJJ+3PJ3t5E6dpBwkvUyGlVkXhZDM5ni7M2o2Q9g==
X-Gm-Gg: AYBFou0Wb6U9kbMCNfQH4hQxAgbH6McJ0JOi8V31gm7bdLTIGP/S+VllXsvsyaSCDGN
	N6FPB0GMxSnFCQUOLhLkMDYF0q5168zL7121g0/WggzC/7jXjcJcXS7RyqwblNl479kaiPVj/J2
	AlyXZ53SH+uPL/3qJIe6OW+UFWP5N9xaice6WPE6bTl8dUXB8GlFKNd2zJCZn8Mm1m48/eg7V/L
	WymYeB/pOc5GWehiEZ2jIOKJ085Bia95K8qR6qeBmZ4pQ2a39/8OtQ+HM5/DhhvqW+S6vlH/Uvr
	PkZTQ5VAqmLM+ThaBDs+bZC6V5bOkhaJTUKbQsj5i43rd6e38M4nP+Ab2dZ/YIrpXE8phJK98eH
	nW8GYv6/GBvrcW4xfdlKGhkHDB3CFH+ZYBsNtLT8fuuJ66P4fwqSx93Xkv1K7lLFHL6AdpJNG5L
	MoUiaL5O9GHlfbJkYOidph2kx5Y+HVJ9n9ecNxG2EM28dv6H8jtJNphJ76WXCKCcrp/qpLwaXr2
	R5bimpEchBJ29LjWbteISd7kdGgN6vw+Xe+1mt9TS46R5jZ3KgPb8OZFGt5YyLxIC07uN2Gm6X4
	1v193f74ExibG7Ppk3zBi9OE8UpjDO7WHSzNIhNSePLlTYe5U/6bzjtFNcjDaGWDpg==
X-Received: by 2002:adf:fa12:0:b0:48e:28bd:e1ad with SMTP id ffacd0b85a97d-48e3eb8f9fdmr8566357f8f.30.1793021130462;
        Mon, 26 Oct 2026 06:25:30 -0700 (PDT)
Message-ID: <13d05dec-f7ba-4625-940a-b89b346610c6@suse.com>
Date: Mon, 26 Oct 2026 14:25:29 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/amd/iommu: record the IOMMU for alias DeviceIDs
To: Stefano Stabellini <stefano.stabellini@amd.com>
Cc: andrew.cooper3@citrix.com, roger@xenproject.org, jason.andryuk@amd.com,
 teddy.astie@vates.tech, xen-devel@lists.xenproject.org
References: <20261020221214.3683476-1-stefano.stabellini@amd.com>
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
In-Reply-To: <20261020221214.3683476-1-stefano.stabellini@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-4011c0/1793021131-4B8D5CFC-97529A22/10/78276251493
X-purgate-type: spam
X-purgate-size: 1391
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 21.10.2026 00:12, Stefano Stabellini wrote:
> add_ivrs_mapping_entry() marks an alias DeviceID valid and may give it
> an interrupt remapping table, but records the IOMMU only for the
> aliased device.  If no IVHD entry names the alias DeviceID itself,
> amd_iommu_setup_device_table() passes a NULL IOMMU to
> amd_iommu_set_intremap_table(), and Xen crashes at boot.
> 
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>

The description deals with only part of what's needed for justification.
What's missing is analysis of the safety of the change being made: There
may very well be logic somewhere which relies on alias entries to be
NULL. If there were (which I seem to have a faint recollection of), this
change wouldn't be safe to make, and checks may instead be necessary to
add elsewhere to circumvent the (vaguely described) boot time crash(es).

Jan

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
>  }
>  
>  static struct amd_iommu * __init find_iommu_from_bdf_cap(


