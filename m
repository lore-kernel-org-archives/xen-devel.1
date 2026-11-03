Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A7C66070AA3
	for <xen-devel@archiver.kernel.org>; Tue,  3 Nov 2026 10:35:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=g6AN2Zf8
Received: from list by lists.xenproject.org with outflank-mailman.1469479.1678284 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOBr5-00040y-Bv; Tue, 03 Nov 2026 10:35:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1469479.1678284; Tue, 03 Nov 2026 10:35:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOBr5-00040r-8p; Tue, 03 Nov 2026 10:35:03 +0000
Received: by outflank-mailman (input) for mailman id 1469479;
 Tue, 03 Nov 2026 10:35:01 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xOBr3-00040l-OJ
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2026 10:35:01 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOBr2-006L9v-Tp
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2026 11:35:00 +0100
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ae9b8d1-bab6-0a2a0a5309dd-0a2a450a81ce-16
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 11:35:00 +0100
Received: from [209.85.128.54] (helo=mail-wm1-f54.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ae9b8d4-f2d2-0a2a450a0019-d1558036a53b-3
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 11:35:00 +0100
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-4a9a8d6cea8so6820445e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 02:35:00 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e77409821sm20111782f8f.0.2026.11.03.02.34.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Nov 2026 02:34:59 -0800 (PST)
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
        d=suse.com; s=google; t=1793702100; x=1794306900; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VHOWbxYOtPkeGR3TvR8QTqoCVAkxxHAQlwkHUC5fVcw=;
        b=g6AN2Zf8L5F4quUgRKrywidWH+lSrguIypC/exH8QGuLkO3xt1WX0Ivk+Knp3RfDxA
         SQVsbe0GfhstJ86RZ9ND2rtxdWcCwApxhPCN9hBSqTEjSjNmK6AEzOF3EDAmO0O2kQbR
         8ZRI4SUM4+w62VwWOwVpNFeHk5VUBi/p2tnvvgQN6K/nOFo+JJL8iUDLfzPqdafyYn+/
         h06RzK4evJvIvN8ZykVsUWL1TZFbZKkkraFabkOo8i99zFT/Cg73OdzT354EjgGm6VRd
         VHs5WvlBXOcEYN9BK3S9SFcdj7fV7GPZEFOyKV2dI1Ku05V5yKjmt0DZztQhjnKoYU1T
         89Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793702100; x=1794306900;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VHOWbxYOtPkeGR3TvR8QTqoCVAkxxHAQlwkHUC5fVcw=;
        b=EsA4uPWrEjoha83574+0Ed6q8xsHB57s4QHk9PlCjRsmTiLvj0w6l2Totb323twzZN
         L6Pn1cgIkU+9a96+nvqYtgwFehRDS1EEouhVZ7nVojKF1AtGcyaKW8NzANia95CKaR/i
         WoLpzLvbnMP9Idc7ZfU6uDOd2URNfCpPHNGbfOD9dCp05VLerQWQWn8KvTzy+Gi0MSRg
         MEsAm/DRKHDyYyTIphca8wBG7P5TIzol4guqGWtujHUf7+7iP9B2++bsPQ/qy7143aAR
         AVoX1CAP0Ev96LHx+bYWDjvRn/VGhaCj8Xbawi3OdSnC5ZXDW1l7oO/vO3hov0q+IPaZ
         zarA==
X-Forwarded-Encrypted: i=1; AKwUvByidzbLpYJ6ct7WwUIW9iMJYXTov1gUKu3CpFr+L+ggjtQBYEVJdivqVTdh7NDkf69LnAZFpVinf4Q=@lists.xenproject.org
X-Gm-Message-State: APuU4Z/veVy+wCuYI7WuJwCYBahKmcMQi3BDcvH6v6wGJv7k9s1dQ5Aq
	7vpEzxzdk7g7yHJcmSe9+oG8H7tKtU8/A4oeq4lRMqBWGm2I7HF8bboKMR8zKzPINw==
X-Gm-Gg: AYBFou0XSynau3PNWkQw7T4TZ6JIQqg+2EIE2pamzNHIe2y5+tkuDZyxhrpICNOOxsx
	4tc2t8hQ1swkMuDCCBAlbJ8upb8pKUdvwp7PtqXpRhcfPHPazjMf58YVQYSdQcE77ahcyv1ZVfk
	4iyQ1GFZwo5cIL5oWsQkh/hTNVhzjY2YeurfaHjmS/HeGfw5YHQCQVDoaGJ0DCP1x0HmlbKZcmN
	MpnpDUKUfDbbsNeyT9VY2NeQi1uvLL7sbWyJZn+FBwSrc5y0LjR5xLezFxC2+epwj0L7jjIPWie
	JAE3Eta3rghDxnz9ZcIiIu+8exfeCOQwpyipT+IhnKRYO2iX9me6EtoCYJEWvWqmG8tBeWw9yUN
	N/3w/7soC2RxiWT76tOxpIA665d6FecaxMivTKaaYwEygCCUlzTe92PTHM11GWw8mDUDQwnpikR
	nZ1X5U3MbhsuJHdz7du/Fy39N0DdoCyc7KFnlhngRP5yPdPqgP6AR4Dhf5b92IHbvTbYXu1ojuV
	wonusDYeprab9OMngbv5HAfrU4we6+/cCkZRdXqCsKAaZpeAR7++7sslykoZrBbUnmZHZ3PUh0Q
	llKWw4tPpBWtuzRfe6OFQPmCq2+xQZCvU81mlEaNLWEM4ZPLq6nmamc2TMG8+jvxfKXvh/eGUPP
	gRtzm7IXCIUaJvp1w
X-Received: by 2002:a05:600c:37c8:b0:4a2:18c4:61a5 with SMTP id 5b1f17b1804b1-4ac16acd93cmr295063555e9.6.1793702100291;
        Tue, 03 Nov 2026 02:35:00 -0800 (PST)
Message-ID: <3949a7d5-8249-4656-86f9-1b86ecf6d01f@suse.com>
Date: Tue, 3 Nov 2026 11:34:59 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] xen/arm: acpi: resolve MISRA C Rule 11.8 in
 acpi_xsdt_modify_entry()
To: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cover.1793699713.git.dmytro_prokopchuk1@epam.com>
 <3533b0c51c28689ae7ef05cf8ca88b49d72eba5f.1793699713.git.dmytro_prokopchuk1@epam.com>
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
In-Reply-To: <3533b0c51c28689ae7ef05cf8ca88b49d72eba5f.1793699713.git.dmytro_prokopchuk1@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-4011c0/1793702100-514C7CFC-EFA867B2/10/78276251493
X-purgate-type: spam
X-purgate-size: 1254
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 03.11.2026 11:29, Dmytro Prokopchuk1 wrote:
> ACPI_COMPARE_NAME() casts both of its arguments to 'u32 *' through
> ACPI_CAST_PTR(). The 'signature' argument of acpi_xsdt_modify_entry()
> is 'const char *', so the macro casts away its const-ness, which is
> a violation of MISRA C Rule 11.8.
> 
> Use strncmp() with ACPI_NAME_SIZE instead. It takes 'const char *'
> arguments, so no cast is needed at all. It also avoids reading a 'u32'
> through a possibly unaligned char pointer.
> 
> No functional changes.
> 
> Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>

Worth mentioning perhaps that this (apparently) is an alternative to
https://lists.xen.org/archives/html/xen-devel/2026-09/msg00044.html.

Jan

> --- a/xen/arch/arm/acpi/domain_build.c
> +++ b/xen/arch/arm/acpi/domain_build.c
> @@ -253,7 +253,7 @@ static void __init acpi_xsdt_modify_entry(u64 entry[],
>      for( i = 0; i < entry_count; i++ )
>      {
>          table = acpi_os_map_memory(entry[i], size);
> -        if ( ACPI_COMPARE_NAME(table->signature, signature) )
> +        if ( !strncmp(table->signature, signature, ACPI_NAME_SIZE) )
>          {
>              entry[i] = addr;
>              acpi_os_unmap_memory(table, size);


