Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7E81C531F7
	for <xen-devel@archiver.kernel.org>; Thu, 23 Jul 2026 14:55:39 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1369285.1618129 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wmupY-0000BC-2p; Thu, 23 Jul 2026 14:55:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1369285.1618129; Thu, 23 Jul 2026 14:55:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wmupX-0000B5-W8; Thu, 23 Jul 2026 14:55:23 +0000
Received: by outflank-mailman (input) for mailman id 1369285;
 Thu, 23 Jul 2026 14:55:22 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wmupW-0000Az-Ed
 for xen-devel@lists.xenproject.org; Thu, 23 Jul 2026 14:55:22 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wmupV-004CGn-Gz
 for xen-devel@lists.xenproject.org; Thu, 23 Jul 2026 16:55:21 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a622b49-e002-0a2a0a5209dd-0a2a450a8cc4-32
 for <xen-devel@lists.xenproject.org>; Thu, 23 Jul 2026 16:55:21 +0200
Received: from [209.85.221.41] (helo=mail-wr1-f41.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a622b59-f2d2-0a2a450a0019-d155dd29a9b6-3
 for <xen-devel@lists.xenproject.org>; Thu, 23 Jul 2026 16:55:21 +0200
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-4720f3bf164so396132f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 23 Jul 2026 07:55:21 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47f85b9a596sm16738928f8f.4.2026.07.23.07.55.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Jul 2026 07:55:20 -0700 (PDT)
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
        d=suse.com; s=google; t=1784818521; x=1785423321; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=il3JEqMCYbc7juYJmftpaflwuk9Up1TDVfBFz9IMMCU=;
        b=bZs2+BLfpFWwoIk7YlJopjPh77lDn0Q55iFHounKglR715FGTeqmz/ctwwCUbnDESZ
         KLdvDnmYIW25dsT8Ol9kIGA5cLXBl7scFA37H5dekq6VPrUyCm6lJJkPOeOsgyC04Xkr
         8xQ9zw+cvVaU80EjFvB/2eCA7Gq65TGBW262AeHB6SZByplj6PCNWAPgIlYpERPOXfso
         1e1BNpL22HB2J1fvPQhS06HIopb9j1xHzWh2IyN1eY/zBECfQAmMjmvZjGiZ5XvsDNL6
         Sgm8co2JNtPF6fmACpKNf3p8JeLl2MWolVTMNHanFuN+0Qz0npy4Sjsy/iVbxZH+is0h
         D4vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784818521; x=1785423321;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=il3JEqMCYbc7juYJmftpaflwuk9Up1TDVfBFz9IMMCU=;
        b=GZC4A+v1kZNpcyRbneJ12iA9XVzoPlu2iWR3EwVk1UdHF4xddnbEj3bm3NXJ1fl+Ut
         xnYgipsK00iiLbThs0vccQuB4HhnH4pZaOkhk+INZnpsx6WV9PDV/Cs/G1rdPIZ2AkmX
         woNONI97H8y59bGU6k7E1detFQZBqCrPVP2htF/N8p9rdHG3E4AKMd5HlwlbOpOoYi9d
         IfHSTGHrYEoSAnw1nEapZzqJB+ruliE03R14J7Yd+h+qnxUB7hLr7SHyZDCZfJ3Ptwqa
         +sk2zJ13I/HPX6TC9cVsEynWNIiSt3vBoCin/Co/cLBJkHqHK0yNTbKwB8acciNSAtoi
         Gy+w==
X-Forwarded-Encrypted: i=1; AHgh+RrOLx6stgehUXhjezlXVjIjRCBBinqf0t/tC0AiaQLq25yB6Gi/n+L1GruN18PT+yWepqV+IJ+Fa9Y=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxOhKBxp3y9OhUkFDksw/idkGu+9X7grt51mIhDcxkF+yDAUJcD
	GCZwARaIjProqsLdbyHdJhTH/0qvSf0htNfXIHrtqN22O6TDiWYJzSel8M7/ynt/XA==
X-Gm-Gg: AR+sD132nDZUu1tQWqaDkqCHKdIubMjPbPKV2sZ7UysiwisOvegrN+6IVWLtgRzpBdu
	RQ6BzJ6s8q9bJ0H6rrdLjRUv/2LRv51rxC4/A7NUcta1YppEpuJkDphd560wDPhY53NVQZahkgg
	CFmCvKDyjOxnylTly/2pGhYBIJ4c9O4cZ6+mPFEehPWREDvOjUfBNf+j5ZlkoM8SPdiUPF6TORQ
	jNKIOFuZmgy+9tERV+yX4FP2iGKcGJQgnWw8iSg8bJoW4pfjrF19b9vb+hEeAEuvFU1nfkgJcT3
	3pCDpquKmwkWeVZztBr++jYf9gmpj4X9Lkvi88adl1erxzojiGA7Vnkwa1BZNv/ZUxAn+7oSVV8
	rotNZlUzPNhHkaGB2GsiXTzy1e7VykWT24gygqCfIpqol4nBoSyC0CiWH2hoVwWRbOfObmtI2zy
	0XC5hIJ+1ylt8QUZkc9SF2lOTe/9lmKY6dIwlyrTQXoeovFSg1wqJ9CdNR1jsbF2wtYA==
X-Received: by 2002:a05:6000:40c6:b0:47f:71a0:c060 with SMTP id ffacd0b85a97d-47f901b4cc7mr4136089f8f.2.1784818520660;
        Thu, 23 Jul 2026 07:55:20 -0700 (PDT)
Message-ID: <252e7f23-24d7-47c5-b5d2-e03864a4fe2f@suse.com>
Date: Thu, 23 Jul 2026 16:55:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/9] vpci: make BAR mapping more resilient for the
 hardware domain
To: Stewart Hildebrand <stewart.hildebrand@amd.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 xen-devel@lists.xenproject.org
References: <20260708210233.922275-1-stewart.hildebrand@amd.com>
 <20260708210233.922275-3-stewart.hildebrand@amd.com>
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
In-Reply-To: <20260708210233.922275-3-stewart.hildebrand@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-4011c0/1784818521-599C1CFC-8AEEF6FD/0/0
X-purgate-type: clean
X-purgate-size: 2582

On 08.07.2026 23:02, Stewart Hildebrand wrote:
> From: Roger Pau Monne <roger.pau@citrix.com>
> 
> The logic in map_range() will bubble up failures to the upper layer, which
> will result in any remaining regions being skip, and for the non-hardware
> domain case the owner domain of the device would be destroyed.  However for
> the hardware domain the intent is to continue execution, hoping the
> failure to modify the p2m could be worked around by the hardware domain.
> 
> To accomplish that in a better way, ignore failures and skip the range in
> that case, possibly continuing to map further ranges.
> 
> Since the error path in vpci_process_pending() should only be used by domUs
> now, and it will unconditionally end up calling domain_crash(), simplify
> it: there's no need to cleanup if the domain will be destroyed.

Aren't we increasing the number of places adjustments will need making if
that (not really nice) crashing of the domain was sorted at some point?

> Memory decoding may be left enabled in case of mapping error for devices
> assigned to domUs.

I'm similarly concerned of this. I also can't spot why this would be for
DomU-s only. The original code did it for all domains.

> --- a/xen/drivers/vpci/header.c
> +++ b/xen/drivers/vpci/header.c
> @@ -70,17 +70,26 @@ static int cf_check map_range(
>  
>          rc = map->map ? map_mmio_regions(map->d, _gfn(s), size, _mfn(map_mfn))
>                        : unmap_mmio_regions(map->d, _gfn(s), size, _mfn(map_mfn));
> -        if ( rc == 0 )
> -        {
> -            *c += size;
> -            break;
> -        }
>          if ( rc < 0 )
>          {
>              printk(XENLOG_G_WARNING
>                     "Failed to %smap [%lx %lx] -> [%lx %lx] for %pd: %d\n",
>                     map->map ? "" : "un", s, e, map_mfn,
>                     map_mfn + size, map->d, rc);
> +            goto done;
> +        }
> +        if ( rc == 0 )
> +        {
> + done:
> +            if ( is_hardware_domain(map->d) )
> +                /*
> +                 * Ignore failures for the hardware domain and skip the range.
> +                 * Do it as a best effort workaround to attempt to get the
> +                 * hardware domain to boot.
> +                 */
> +                rc = 0;

Why would this not move ahead of the "goto done"? For the if() here it's
a no-op. Then (really: independently) ...

> +            *c += size;
>              break;
>          }

... the remaining piece could be in "if ( rc <= 0 )".

Jan

