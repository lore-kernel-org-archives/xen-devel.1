Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36643F9B611
	for <xen-devel@archiver.kernel.org>; Wed, 22 Apr 2026 10:37:38 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1290240.1569880 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFUxL-0001Pd-Cv; Wed, 22 Apr 2026 10:37:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1290240.1569880; Wed, 22 Apr 2026 10:37:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFUxL-0001PV-9P; Wed, 22 Apr 2026 10:37:19 +0000
Received: by outflank-mailman (input) for mailman id 1290240;
 Wed, 22 Apr 2026 10:37:19 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wFUxK-0001PP-V1
 for xen-devel@lists.xenproject.org; Wed, 22 Apr 2026 10:37:18 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wFUxJ-002tN5-Tc
 for xen-devel@lists.xenproject.org; Wed, 22 Apr 2026 12:37:17 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69e8a4d2-e002-0a2a0a5209dd-0a2a4504ce1e-38
 for <xen-devel@lists.xenproject.org>; Wed, 22 Apr 2026 12:37:17 +0200
Received: from [209.85.128.54] (helo=mail-wm1-f54.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 69e8a4dd-1dec-0a2a45040019-d1558036b02e-3
 for <xen-devel@lists.xenproject.org>; Wed, 22 Apr 2026 12:37:17 +0200
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-483487335c2so52563415e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 22 Apr 2026 03:37:17 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488fc0f82bbsm738025775e9.3.2026.04.22.03.37.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Apr 2026 03:37:16 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:In-Reply-To:Autocrypt:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1776854237; x=1777459037; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=IGBynXRuBkvVB54EFm5nxzikcVRMwdEyO1/v1LRBc90=;
        b=MnNLbEEqeokJHr0+E1fuhCBBeYI0k3pSy+nEQQiLVycF4cH/Co7FMvOEhjlDs4RMMi
         RPYiWTLjqCsjgd7EtJ3ODn1D8f/YQ0vuMnmZEeULZvyJHLNT+gf2vALCQMns6TCLoxvS
         k5+jg2yjpycWTC5/FiAh7VXBAm2wXNbYd74TNFzjUI5hiuZePtNt7dY2pxp4wbgoowvm
         zp+viTvdRFsbdNvGNxvZBAPPHNv+YMoZRh9hWDR0aMuDu9Xg3Ij6zkM7fnw50LMHOB7p
         RFPut3bVOlwovevePdwm4TtFsjWX7oBNG1Y4LBSHKIVw/0CIuNupsSOZ/Eqqt9Tajp/x
         fpAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776854237; x=1777459037;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IGBynXRuBkvVB54EFm5nxzikcVRMwdEyO1/v1LRBc90=;
        b=Dh6vhMADLrTxgSL7JLGuw8wq0QJ0XjHmxb/kFKoXPr/kTiOGyKbwrPKtdtOoz9Gaf2
         zCk+vHrfQ84abeb6RR2I5T7iA+NXSkVayFn3emgOf1pk73mZewXM1uyklSkjSGDIj98U
         E2E76/BuJbqjsnf9/B/mfsAOnlJIOBRlf4yHlyhth5lG7ACXIpkpjie1UeeqWOyiKHzh
         qpS3giNYnKHp5zj4WpAABplVX3wjNwm6nbODHKCvUOtqnfb/r5qtSKCitzvaRnpbqHRv
         e7+W3RbDmNvhvcOXIpbTU/MnBG1V16OWj0C9Vi87DUhcFMpMnGffMhWGnWcrQCM+wl3e
         AJwA==
X-Forwarded-Encrypted: i=1; AFNElJ/G+Hep/sKgQEgeyDcgX4INarOHq/0mRxJpgvxWKgJ3nYFuxz9Q6tOegCosO/ycpWfwaAvMZTcJkEw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyntxMRa1WQCVrg+Bu0mkrs3wWmWdIFUO41yL6bTS1QH8vMb8/4
	G1Sa16Z5CV3aah8CDB0oMCKp+w/HsNBFB2cwQkbgp6P61w4uLWrX2sO/M92idwYtyw==
X-Gm-Gg: AeBDievphXbkAVFcYwp6nALMQeKnJpJT9iun87gzAzidOypkLZAsJqvSbSFbNgMiEmm
	IlEmNUGF1dUrzFAdyk1rrAEgx01Lbq/W1fKPmIMlcLv2hDeay3EDsj73x3xX/WIBlH0cWTS85Y0
	lAWiILIe8e9nEBfXlJCQhsD6EsH/sM3uBJUr5fJx45iBO3basWPFRy7IERpm6LWNCNAPR4TBzdP
	Xzfz8brtUnSt3++GYt8WaiQ9hrVER8ziFStlcWlRekevMq/f5scX8bELIqhaWYnfRdDEkVDC/GF
	pD4n8sCIqLSUlVWnTrfKcLphQ8OHNWid/ADsxwAEg5pScW3Hb6eLsrEr2UGiJlBZSb8rWQaXogk
	lP2D7hDz4wNsiLJTjDkvntgtSsWPpdi2NXTxNJF9y9sm8aY5Hs9siPpIVXrwLB8Q6kwWtURwk78
	NdWTAEAJ8/UHZm/7C6KWYXHidIgMTzsq7CnnYbLIDueQyVVWtJAcxRdbLI2xS4NxG3xoMjDe290
	pUXcHREH+sLWlA4o+zTaD27Qw==
X-Received: by 2002:a05:600c:8b8c:b0:489:1d74:56d with SMTP id 5b1f17b1804b1-4891d7406famr186705405e9.29.1776854237221;
        Wed, 22 Apr 2026 03:37:17 -0700 (PDT)
Message-ID: <f2ad01dc-0f8b-4514-b35f-24b254c9b2ee@suse.com>
Date: Wed, 22 Apr 2026 12:37:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] xen: introduce CONFIG_HAS_DOMAIN_TYPE
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1776780944.git.oleksii.kurochko@gmail.com>
 <61c33c15d046110b5c99490f54191facf18068e1.1776780944.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <61c33c15d046110b5c99490f54191facf18068e1.1776780944.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ebf023/1776854237-43D6C3FF-4A741CE9/0/0
X-purgate-type: clean
X-purgate-size: 1181

On 22.04.2026 11:44, Oleksii Kurochko wrote:
> --- a/xen/common/Kconfig
> +++ b/xen/common/Kconfig
> @@ -29,6 +29,9 @@ config DOM0LESS_BOOT
>  config DOMAIN_BUILD_HELPERS
>  	bool
>  
> +config HAS_DOMAIN_TYPE
> +	bool
> +
>  config GRANT_TABLE
>  	bool "Grant table support" if EXPERT
>  	default y

Looks like I need to repeat my v1 comment: "Why here rather than where
the bulk of the other HAS_* are?" They are (or at least are suppoosed to
be) sorted, so that finding a particular entry (e.g. while checking for
name clashes) is easy.

> --- a/xen/include/xen/domain.h
> +++ b/xen/include/xen/domain.h
> @@ -13,6 +13,19 @@ struct guest_area {
>      void *map;
>  };
>  
> +#ifdef CONFIG_HAS_DOMAIN_TYPE
> +enum __packed domain_type {
> +    DOMAIN_32BIT,
> +    DOMAIN_64BIT,
> +};
> +#define is_32bit_domain(d) ((d)->type == DOMAIN_32BIT)
> +#define is_64bit_domain(d) ((d)->type == DOMAIN_64BIT)
> +#elif !defined(CONFIG_64BIT)
> +/* On 32-bit-only platforms all domains are 32-bit. */

Btw, while this may be true in practice right now, it is not given. A
32-bit hypervisor can in principle be capable of running 64-bit guests.

Jan

