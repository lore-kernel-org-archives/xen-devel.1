Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61DB0606A31B
	for <xen-devel@archiver.kernel.org>; Mon, 26 Oct 2026 13:07:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=QYbXFZV2
Received: from list by lists.xenproject.org with outflank-mailman.1461323.1672309 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLKPc-0007Mv-Uf; Mon, 26 Oct 2026 13:06:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1461323.1672309; Mon, 26 Oct 2026 13:06:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLKPc-0007Mo-Ro; Mon, 26 Oct 2026 13:06:52 +0000
Received: by outflank-mailman (input) for mailman id 1461323;
 Mon, 26 Oct 2026 13:06:51 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xLKPb-0007Ld-By
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2026 13:06:51 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xLKPa-003E0O-Hd
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2026 14:06:50 +0100
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6adf5069-2eae-0a2a0a5409dd-0a2a4501db4e-14
 for <xen-devel@lists.xenproject.org>; Mon, 26 Oct 2026 14:06:50 +0100
Received: from [209.85.128.49] (helo=mail-wm1-f49.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6adf506a-5984-0a2a45010019-d1558031d9d9-3
 for <xen-devel@lists.xenproject.org>; Mon, 26 Oct 2026 14:06:50 +0100
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-4a35db1f202so13488045e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 26 Oct 2026 06:06:50 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a35a5822a7sm200556725e9.11.2026.10.26.06.06.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Oct 2026 06:06:49 -0700 (PDT)
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
        d=suse.com; s=google; t=1793020010; x=1793624810; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XjzpRtJCLLAF5cHo+M935TSFiH8JPHWUr5T6NqDLR+o=;
        b=QYbXFZV2dgePAmgtbFjJQiojrhSVDLTjoLUWamgD+c0OqioPuX9bMkD27C1CyjMtgZ
         CzQkIeElHwmszg0j7xhXXgKMKnNyL9qLVwaT4i5aZfEcZTi3CjdkDrNFR1aHxlkOxpQ6
         VhV7YgaZnD4H2bzAJgM8Gzelkut+o5ba8C6BbpHU8epS8SvM7AKoVVQIaLcbdGsTYdw8
         /dOuveq8bsGBMe75O7zMdvBztp/S5wuGZnEea5B+gLNtPA5aeEezHvrChPGnQ6n0eXiY
         NDomT8izHiLqMuNJofKCAYQMkiqxK1I7j2lLgFpO2BDbgGJB7/v+kqbBVD6Y8NHinEPr
         IZ2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793020010; x=1793624810;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XjzpRtJCLLAF5cHo+M935TSFiH8JPHWUr5T6NqDLR+o=;
        b=VN3623G/smBbkn9cjWz+2IV9htAfh+mNpIYmz0ZYuzMzYxFhKn+f6wJyDjpFEnaW+H
         NyrcOOPgJzar+la0znVtDKV2g95c89os6VbvSqFfSM3rgAxDAz+uyFfulIEYfDoAqHUs
         6Hc/hUvG4QC94SYif0+bMHi+MwGk1WOnEDXariJ9h338fjYQvUs0CbIFRHlfvqaaSjzW
         RqCYb7BMUgjEJWZ4MzQrpwi3K0+orGnkXhKfrWGWKtEkBkSHiwOYy3n+t/thDWFrDjQK
         KWKfkZrRMi5dFGykhkv2Uthtw66G3UhPnl9JnThmOttc9A9DWUYSVjTL/aK//1E5K+AB
         WOOQ==
X-Forwarded-Encrypted: i=1; AKwUvBwyCDa7Kw0q1tzLXDK25Xfg0ng1+yF3x9kPEViPjaiUpdVqRSvXyfMXfKcdbOeMCAJvhaXRMKLfI/0=@lists.xenproject.org
X-Gm-Message-State: AFq9FYKn9IeFEsWulzg2jh71UkD28cgz8PrvP5vPbePFMi4Mfxh0bgZA
	D6l52W+pLXwK9DGSM3EbKwKRSmgaKzHZTsfunS4cDGFmrFfN563zI/knK3sg6aKYkQ==
X-Gm-Gg: AYBFou3CKqR7rsjSFTedbDJWjgVRPNdchSt4L09u0/ba2WkZl9VDpBpejKALYDQMWB0
	zGiWLaybsLNF2tlTJiQW4WFCA6SImxjMR/GwxVTsaFh/sF4TdesTxGqx976+PNJPAe7d0eckEF4
	qnx2YtKP6SwwPQZoSrsxJF1/2ST55Gaix3aJWSXzZ/kbAjqwCzPq9+B/WNouCTZbATG31p3TVdy
	LRvy36xUUhZSM7TTEa43XPi1yx8isGUHQyxpLy8Lj9BiAO3S7u0UT9cQ080o947QRJFkadyTS4n
	dmeP4q2SYo7/Ea7UKMzspMYvvFggVRgkUru6rrcTUih2PYc2VkVQsirrwW4hkjY32gCm7szuQO7
	z90w1rgFkFtko8YTugC7B6BkDzMMd0K0UXU1vWY9bSno5vHTpKR96Smm6+D0rVjSVfffhNOZ1ml
	p0F+TmO3qg/c9+uMe2X6mef2c3ERIzBG5/5ubuTUxQisLqRMiVp/Z/BOZUAatk6+dhpW3cn2/zY
	SvpsGNHyZKgTCbHXjtZhkV0V3zNrg1Ms3xcZQLRcLl6ALfGi6xqIy6p4tnJiIp6thdcvOm/1jsd
	HHkjkLCoSWxAqx4GruCFI/ySgIK+9paZhdR/UXzeViSo
X-Received: by 2002:a05:600c:524d:b0:4a1:a45a:88f with SMTP id 5b1f17b1804b1-4a35acb07c5mr113287045e9.20.1793020009781;
        Mon, 26 Oct 2026 06:06:49 -0700 (PDT)
Message-ID: <47d6f426-6751-4a32-a187-2fb8a5347091@suse.com>
Date: Mon, 26 Oct 2026 14:06:48 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xen/vcpu: ensure no write when runstate handler is
 NULL
To: Roger Pau Monne <roger@xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20261023161742.67329-1-roger@xenproject.org>
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
In-Reply-To: <20261023161742.67329-1-roger@xenproject.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d62444/1793020010-C475B757-ABCCE2FF/10/78276251493
X-purgate-type: spam
X-purgate-size: 1464
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 23.10.2026 18:17, Roger Pau Monne wrote:
> --- a/xen/arch/x86/x86_64/domain.c
> +++ b/xen/arch/x86/x86_64/domain.c
> @@ -58,6 +58,11 @@ compat_vcpu_op(int cmd, unsigned int vcpuid, XEN_GUEST_HANDLE_PARAM(void) arg)
>          rc = 0;
>          guest_from_compat_handle(v->runstate_guest.compat, area.addr.h);
>  
> +        /* NULL handle is deregistering the address. */
> +        if ( compat_handle_is_null(area.addr.h) )
> +            break;
> +
> +        /* Update the newly-registered runstate area, best-effort. */
>          if ( v == current )
>          {
>              XLAT_vcpu_runstate_info(&info, &v->runstate);

While likely unnecessary in this x86-only handling, ...

> --- a/xen/common/domain.c
> +++ b/xen/common/domain.c
> @@ -2330,6 +2330,11 @@ long common_vcpu_op(int cmd, struct vcpu *v, XEN_GUEST_HANDLE_PARAM(void) arg)
>          rc = 0;
>          runstate_guest(v) = area.addr.h;
>  
> +        /* NULL handle is deregistering the address. */
> +        if ( guest_handle_is_null(area.addr.h) )
> +            break;
> +
> +        /* Update the newly-registered runstate area, best-effort. */
>          if ( v == current )
>          {
>              __copy_to_guest(runstate_guest(v), &v->runstate, 1);

... if we make null an official "de-register", then imo the earlier
guest_handle_okay() also wants bypassing in the null case. An arch
could - in principle - reject a null handle.

Jan

