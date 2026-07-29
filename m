Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6826C53200
	for <xen-devel@archiver.kernel.org>; Wed, 29 Jul 2026 06:04:01 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1375145.1622382 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1woxO0-0007NX-Mp; Wed, 29 Jul 2026 06:03:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1375145.1622382; Wed, 29 Jul 2026 06:03:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1woxO0-0007NP-HU; Wed, 29 Jul 2026 06:03:24 +0000
Received: by outflank-mailman (input) for mailman id 1375145;
 Wed, 29 Jul 2026 06:03:22 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1woxNy-0007MD-GA
 for xen-devel@lists.xenproject.org; Wed, 29 Jul 2026 06:03:22 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1woxNu-004gcM-Uv
 for xen-devel@lists.xenproject.org; Wed, 29 Jul 2026 08:03:18 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a699798-e002-0a2a0a5209dd-0a2a45028b4a-40
 for <xen-devel@lists.xenproject.org>; Wed, 29 Jul 2026 08:03:18 +0200
Received: from [209.85.221.44] (helo=mail-wr1-f44.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a6997a6-6ca4-0a2a45020019-d155dd2ca4d8-3
 for <xen-devel@lists.xenproject.org>; Wed, 29 Jul 2026 08:03:18 +0200
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-4758bd3731bso439154f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 23:03:18 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47fb6acfdafsm4632419f8f.15.2026.07.28.23.03.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Jul 2026 23:03:17 -0700 (PDT)
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
        d=suse.com; s=google; t=1785304998; x=1785909798; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZDGEM4zt2j6l2ZIqBC8vF6kjKRs2J9Iy1JHD8Oi+Fvk=;
        b=WGKlOabsp6x5uMkoSchVm1MwTLTVnzuE4QKYKFocYW1tHPWFUxQcNvxCV1vdbJpq4v
         nliDICSup2D3KadpOAqCkbgsgwh62D0r2zaFEwwJEbUsHpOyLqPgVtZYILXNLTkBRv5H
         v3JkGR9I0ZivoAmUSSr2dk20e5M/HwiN3Nv6uJRgbosOqWyTEO44avoj3JjCEf91ZZSZ
         lsiSOoz2t2/XmkyqnpS8JKec5cBC4FPal1U3SJcjZgPE9oK0LKcfUYK0sdmiq1/BEcVE
         j6ZNIx1VdxLEnFJrbo0WKaj4GRCm3dZpK8JsTefChrIwalOEc634is0/pUIYbTV7i2kW
         CKJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785304998; x=1785909798;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZDGEM4zt2j6l2ZIqBC8vF6kjKRs2J9Iy1JHD8Oi+Fvk=;
        b=Rafp/XXII3bhIItBk1wUkQUYJAoht04K4RHSVm4irZN/XH9+jO1OsRtPVl9llz8Ddy
         HPQ1nAkxRnkJpq0qZB0fNaADJI1vQpayWfuwU/MPyyfjSS+3/Hf30NpcHCFo2F4gH/8A
         qEVhoDmSVb176JYnA1kYN6ZvrRPLCysY7m+QfqtYJ7ivIunDZ4tq2zxSkWcUZEnoxDvA
         5+EA0Tk7AUO3L1WqR5J6ERqMR6vUZ1IWJjRwEMjJPVstjEjf1epkJ39LFxo5L07BfnW6
         Gn4G7XG3zlycfvYWsiG5D1l9fL9wlGdsWYlLDeyoR4ta/8hgeoT1f+IhAEBPQF/fC8Ao
         z1vQ==
X-Forwarded-Encrypted: i=1; AHgh+Rox8P6/25Ll0VluQrdI9YzfDrmmktxb/ik71iP+1OZXX2rMTb+wOdLPcXv0L+QcInjRydu+ljvpKYQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzrfxEt5Les5D/7Y3hX8Fd/Z/lGGK+TX195IYN2i1toamGRQmK1
	w9QQ2ScDW6Hk1gytHJDLvYXhmr9V0tcMnUuRpq40KvoidCnsBQ5Rv14KfJByoGst7w==
X-Gm-Gg: AR+sD12cjsKsu0qOfec03QR/4T6wXPvohyxW/k4zHZcGt3oWcySZOu/JCw0swP5t428
	k6/5fcCNW7fNatSmPisz9QX+Ft6SR5u/6uD8U+NYTVxRs9SCZ3NpmgkEBpyGChsu8QKnS61kPKs
	lyPLoZYTgU4b1fbhVcVXG5YZHtKapg7zf79xEnrRj+9xx6pgqIFF6YQvfcYwp1Sl65efxUCfT5c
	puQFmRV4Z1vC5b1qzE/GJJQSdMOx/4FIF7Ap2Mqzg2mn0ccYryX600h1QFuk98VLA7+tElytu2X
	g8raL8pvdTTfemVn8B1xmzmBuWnZqGefrlpO6w3jiWQm7ke+HqCmHqpqlnqdyHifF5Ne1CyfzGs
	winjvUybHi46JYhhdCPHpzxaS60HNM3Nm5mgtSNEG8cR/41m9GxkiFOZ53AWJBkbr863stgkafi
	GBgHttAAaJz+aifYnfnupkCl2PD6xnZk6f3M2nP8MOXJzlcBdLzVe5bW4b4rDJN+R7K11dxPTzt
	NCDoFHvpYvREWJ16KWcSgTDU9nel0Ih2fCZgzhtQRo3SUfKA9Gp
X-Received: by 2002:a05:6000:184d:b0:45e:dd32:92fa with SMTP id ffacd0b85a97d-47fbabd61b2mr1105970f8f.12.1785304997887;
        Tue, 28 Jul 2026 23:03:17 -0700 (PDT)
Message-ID: <b050c051-c165-42a4-a76f-781c8d43248e@suse.com>
Date: Wed, 29 Jul 2026 08:03:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] tools/ocaml: Fix crash in
 Xenctrl.domain_getinfo{,list} on ARM
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Julian Vetter <julian.vetter@vates.tech>,
 Andrii Sultanov <andriy.sultanov@vates.tech>,
 Guillaume Thouvenin <guillaume.thouvenin@vates.tech>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20260728154830.67734-1-andrew.cooper3@citrix.com>
 <20260728154830.67734-2-andrew.cooper3@citrix.com>
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
In-Reply-To: <20260728154830.67734-2-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-720697/1785304998-323D42AC-AFDDCD41/0/0
X-purgate-type: clean
X-purgate-size: 880

On 28.07.2026 17:48, Andrew Cooper wrote:
> @@ -452,16 +456,17 @@ static value alloc_domaininfo(xc_domaininfo_t * info)
>  		(info->arch_config.emulation_flags);
>  
>  	/* xen_x86_arch_domainconfig */
> -	x86_arch_config = caml_alloc_tuple(1);
> -	Store_field(x86_arch_config, 0, emul_list);
> +	arch_config = caml_alloc_tuple(1);
> +	Field(arch_config, 0) = emul_list;
>  
> -	/* arch_config: arch_domainconfig */
> -	arch_config = caml_alloc_small(1, 1);
> -
> -	Store_field(arch_config, 0, x86_arch_config);
> -
> -	Store_field(result, 16, arch_config);
>  #endif
> +	if (tag < 0)
> +		caml_failwith("Unimplemented architecutre in alloc_domaininfo()");

As I now ended up looking here as well (to determine whether this series will
want backporting): s/architecutre/architecture/ .

As to backporting: Both patches may want to have Fixes: tags?

Jan

