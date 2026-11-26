Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9F4B606A31C
	for <xen-devel@archiver.kernel.org>; Thu, 26 Nov 2026 07:58:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=EzsUyp7J
Received: from list by lists.xenproject.org with outflank-mailman.1503135.1698971 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWUN7-0002tc-JN; Thu, 26 Nov 2026 07:58:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1503135.1698971; Thu, 26 Nov 2026 07:58:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWUN7-0002tV-Fq; Thu, 26 Nov 2026 07:58:25 +0000
Received: by outflank-mailman (input) for mailman id 1503135;
 Thu, 26 Nov 2026 07:58:24 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xWUN5-0002tN-VB
 for xen-devel@lists.xenproject.org; Thu, 26 Nov 2026 07:58:24 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xWUN5-00BK4Y-BW
 for xen-devel@lists.xenproject.org; Thu, 26 Nov 2026 08:58:23 +0100
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6b07e69c-e002-0a2a0a5209dd-0a2a450986b6-14
 for <xen-devel@lists.xenproject.org>; Thu, 26 Nov 2026 08:58:23 +0100
Received: from [209.85.128.47] (helo=mail-wm1-f47.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6b07e69f-be1a-0a2a45090019-d155802fc822-3
 for <xen-devel@lists.xenproject.org>; Thu, 26 Nov 2026 08:58:23 +0100
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-4ac95761c85so51541145e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 25 Nov 2026 23:58:23 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb90660cb4sm536166845e9.2.2026.11.25.23.58.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Nov 2026 23:58:22 -0800 (PST)
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
        d=suse.com; s=google; t=1795679902; x=1796284702; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GCaLjotTSgSKXT5ZLLsHr0lDDuRO3U4yMpb6vP6PvHY=;
        b=EzsUyp7JXtxkQwqrie0wbcDriE9WUJqHUmORgoz63n7YCnhVRvF0WDJcQMGerop+mU
         bb057PWSRyMCP2h1kJQo5M1IveI4c9QHOcF/FaTdtvKCROIptFLjvrifBoqoh50/MV87
         Bh1md7pAl/B8JzZInUVdsS6e35ZXXp28I2orUkYJjiayNqEW5J0zCeAg2F6DJuepKXAr
         8u1y1cqm8pCSRSNIIf1Jbp+uCiP408kXDSPu4n/AXnEMEqBLUJhnVkUCspa9nUNOiM4E
         UxZ+AX+C9ly9+hVrvPnsnxiPuWWvb6JBMda17/0qM1AkfPzm9LB0vR8kmOc7EKwsbZxZ
         uQ8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795679902; x=1796284702;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GCaLjotTSgSKXT5ZLLsHr0lDDuRO3U4yMpb6vP6PvHY=;
        b=Ibeaha/nZLkQ7GxB9KC8GVfI1hqEbfEBE2KkexP7DxaZe01ruRErk6PA16hvHDp874
         DEZrkNvTt6IatJNYo5cr+4iaNgUjpZ1Pb2JOh0voj9XFRV3x5L3bvx38hI9LbHdIApHR
         3zTRiwyVhU3y7kH0IiTqKjc0l1/BEQCB7b1vQiKc4+OUJD1FnUWD8hDWUKBvJ1o4x/QV
         42y7dcSMYm35KBvA3n60m3TWzsPjvgPfkX9pZ42/FPZfA8ZjtNbcO61yEdTzYoTYsyU+
         UwYAXNRQm7aB8HuCxDBa4iI5UgW4pWG5WNSbVimHzCbrHC7Gx82bm1ZvgG+7QpvQSIwp
         1ZvA==
X-Forwarded-Encrypted: i=1; AL+hErHvfVIcW6ESzDdDgdIKSzt8daEKoNmdDJYe8+a7qhLBeLVgOJe+dDj28Xugse2nuAHqGqu5fkmUbQQ=@lists.xenproject.org
X-Gm-Message-State: APuU4Z8bI3L6WT/Ap3oLeWCbNxHgp3zl/wi6NO6FEICjiP+9i2oU+Gsd
	FmM0cvV1ppZUF82Fqm4KlQndLzADRj+37wu4dUFyqYM/b8C1HlI5VTY0rKghQE7RxQ==
X-Gm-Gg: AZFdTZfOO6NlO2AR+secQiqwDq1bi+HtBL6ZqoJnThi3sZcxsU6J3W6JaIenybmUh+u
	o8GsRVpeH8gbEGuQJBY1h3Y8RG/3r7Gm9Icso5Ql0suCVq0Pd8P6+P3STnu5r+T6op3l+EKK0K3
	YDTTavX9w42H3M9qg0dwaZbgkm5nvoEWAp0sJRwvbUF3t5kFSHFDOCQAhMiDDjNRWq55sXHDzmp
	6AdtUo85CKr+qL9UpnCXWa+1d8jGiNbLxMfkbDX3r6aV8BrMtxwiWlOv2B2ne0wg6oy4LwOFk9m
	fAF/w16wBA+LzjUhWyUPrscgQ3rARRa/pOq5PPUrDp/Ks/1jFOgyLsc5CWkXFZss/DnJbGbjNBg
	qIZucHDtxjtxC0I74DLn6YIcEBetj7k6Q1uXfQNxy7ae04NnssfuilR61WA9Q9/iYXtA8bio6rG
	7FkCOiuXRHDckLauV65/GzUFM1iWAs7bAjf7VkHKdapUEaihiHy+C7/XGDB7NWGKmb4HDyl0cLi
	v72jQx4BkvUurumUwf1Oj8mWf/VzaGr/eb7vu9i6rH3qtvbHq/Z9KM9fdIh6Lat1zZRad38E2MX
	4d1JubsmYWDJ+QhlEoiF3Yt98sagBmZo2JrmgWyUQ1Vo1t9THnG2onMIo2YD6wdam/K2j/w8lYt
	VEU7+oxTmizxHJHZO
X-Received: by 2002:a05:600c:c4a2:b0:4a3:59c9:a744 with SMTP id 5b1f17b1804b1-4bb88807d87mr416546955e9.7.1795679902597;
        Wed, 25 Nov 2026 23:58:22 -0800 (PST)
Message-ID: <92037524-9d94-447a-8066-8c4e9f496124@suse.com>
Date: Thu, 26 Nov 2026 08:58:21 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] xen/arm64: detect the LSE atomic instructions
To: Luca Di Maio <luca@edera.dev>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <20261125175555.2110163-1-luca@edera.dev>
 <20261125175555.2110163-2-luca@edera.dev>
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
In-Reply-To: <20261125175555.2110163-2-luca@edera.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-bad1c0/1795679903-BF0DD034-0F0A61D0/10/78276251493
X-purgate-type: spam
X-purgate-size: 1398
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 25.11.2026 18:55, Luca Di Maio wrote:
> Load/store exclusive loops give no forward-progress guarantee, so many
> CPUs contending on one cache line can livelock. Add the
> ARM64_HAS_LSE_ATOMICS capability and system_uses_lse_atomics(), patched
> at boot like Linux's alternative_has_cap_likely(), for the next patches.
> Assemblers older than binutils 2.26 lack .arch_extension, so Xen built
> with one keeps the exclusive loops.
> 
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Luca Di Maio <luca@edera.dev>
> ---
>  xen/arch/arm/arch.mk                  |  3 +++
>  xen/arch/arm/cpufeature.c             | 10 +++++++++
>  xen/arch/arm/include/asm/arm64/lse.h  | 31 +++++++++++++++++++++++++++
>  xen/arch/arm/include/asm/cpufeature.h |  3 ++-
>  4 files changed, 46 insertions(+), 1 deletion(-)
>  create mode 100644 xen/arch/arm/include/asm/arm64/lse.h
> 
> diff --git a/xen/arch/arm/arch.mk b/xen/arch/arm/arch.mk
> index dea8dbd18a..fe8e02229f 100644
> --- a/xen/arch/arm/arch.mk
> +++ b/xen/arch/arm/arch.mk
> @@ -19,6 +19,9 @@ endif
>  CFLAGS-$(CONFIG_ARM_64) += -mgeneral-regs-only # No fp registers etc
>  $(call cc-option-add,CFLAGS-$(CONFIG_ARM_64),CC,-mno-outline-atomics)
>  
> +# Binutils >= 2.26
> +$(call as-option-add,CFLAGS-$(CONFIG_ARM_64),CC,".arch_extension lse",-DHAVE_AS_LSE)

Wouldn't this better be done in Kconfig nowadays?

Jan

