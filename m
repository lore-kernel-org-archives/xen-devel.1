Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF00D606B22A
	for <xen-devel@archiver.kernel.org>; Mon, 16 Nov 2026 13:51:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=BFjOzYBL
Received: from list by lists.xenproject.org with outflank-mailman.1490956.1691881 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xSx6i-00039g-Iu; Mon, 16 Nov 2026 13:50:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1490956.1691881; Mon, 16 Nov 2026 13:50:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xSx6i-00039Y-FY; Mon, 16 Nov 2026 13:50:52 +0000
Received: by outflank-mailman (input) for mailman id 1490956;
 Mon, 16 Nov 2026 13:50:51 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xSx6h-00039S-0J
 for xen-devel@lists.xenproject.org; Mon, 16 Nov 2026 13:50:51 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xSx6g-0086pN-D2
 for xen-devel@lists.xenproject.org; Mon, 16 Nov 2026 14:50:50 +0100
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6afb0a38-2eae-0a2a0a5409dd-0a2a4508c4b2-6
 for <xen-devel@lists.xenproject.org>; Mon, 16 Nov 2026 14:50:50 +0100
Received: from [209.85.221.41] (helo=mail-wr1-f41.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6afb0a3a-f659-0a2a45080019-d155dd29d4bd-3
 for <xen-devel@lists.xenproject.org>; Mon, 16 Nov 2026 14:50:50 +0100
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-49a92144733so1368159f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 16 Nov 2026 05:50:50 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb4e28c882sm389679195e9.6.2026.11.16.05.50.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Nov 2026 05:50:49 -0800 (PST)
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
        d=suse.com; s=google; t=1794837050; x=1795441850; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FzI+O3IMEuIAn9QWXJPsKR+GnIJf9hqi6KR74FWztQQ=;
        b=BFjOzYBLtbsw5TbhxbkIfMaVMqKvXxGMajrcgJF3/Z07AA7zc9UKieWr/AhIJE9xk0
         bq27GMbo4DnQtrR/YDCFcaphVQhR9v1LCEP1S3wkXC+aqQDd9V/tK13Hzbfv5gpzLu6t
         cOo3P6bd8oCWxFd+a+MAWSbZWXsYXAERz9/5YKdTrLXHxmjgXXNvLu4cR4iTPjf9Is/o
         QMMIbHG9C2Ii/yVjnYGv3tkAHTvyvYFQIROJrYwX4r4pQFE/ikfEeDXxjLn1J+Xmp9mh
         G+n6ZzR4tZzoaPfYs5rarH5Can4RgoW+n3jUfytCfqrY5FdqpqHIHbJQ1AykG7ctWsvN
         BjTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794837050; x=1795441850;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FzI+O3IMEuIAn9QWXJPsKR+GnIJf9hqi6KR74FWztQQ=;
        b=b+x0vAiGM6XjDhQGYi082v6/t+q18lY0vMalIiRRDh6ZZt9P5lYVnB0iB6y2ZZ9Tii
         RabD4e3+ugExJHteznLZxsLr0M01dg1hpEXPZJsg36Aa4pso/Yx6c7njDCbnNmogAoM2
         Khnl6Wg0h0mha7+Z+j0mrndOWzWr8ZxSEUuEXWsd9y9cACLmv0xDvQ3RCHkpm8b+3LMW
         6bmSnv/xPuavwgpqDRN47J22o+0BRaI4lWuePWCfeeHjlH+s4DWU7SKIS7B3rAB3Sdd3
         XPBLM0ip7oPNN9+k2Nn+cx6be64mHJO1pYx8UC8oV3nfnTcI76hXA9QKZRaAlT85I9n6
         vI7Q==
X-Forwarded-Encrypted: i=1; AL+hErGBv1yYbIqxf3Adm9zz4bD+LaRJZ8OlQn8jbJhHo0V9g49KjdFdaXmUqJkcUFCAv7vtue9C6DzTalE=@lists.xenproject.org
X-Gm-Message-State: APuU4Z+pHk2rs8cBZIEcZD/4UFxXnE0noVGzzkUfMVCMLmYGt51ApGp4
	R9j30+w9JeVK15WKEP+PA1geo8VYawuGKhbE693M5ETmWdlZMTJz34dJeMbeW0Gjdg==
X-Gm-Gg: AYBFou0GXQRqArY8L7YP/1Q6kZ+EvQa5g2UztYRhLPSNuK44qyl2j/+S4ZYZhWhq4yG
	4VPcyihf3G6zPULtV//E9pvmZYZDEh0+c5uPa1eXw+l4FZCq++Om9+9unuzf0T9wuCI0ESI4SPS
	WRhqa7MnW8rn1Fhk7Blbx/nPeSSVyoWt3uqrumvnaiBo+Q/mR4Z3+LO531Tv3+9E5ZzUiZFgDg+
	rQUiLz/usfSNeq2is7p0oxfyJtiW/Dj54XeT/qC+FpFPvYq5//M1dxpH/YukDXXe/EUe1xvikA/
	8fAkcEhgvSILVH2S4hjub0reCYQAj9eU/Stxv85AgR+iyVs/Ig2MwlO+UJCl3SO1AS4OGpFzHyv
	8jpAgNKJQBHCDiYYU2hkh9CfLJFbnRbS1nhWwKZG8haxA6j39IgCygh247Oqejmitt1acBCpkDi
	+2YlnR2in6xoZCoAUlUgJ60Uj5U2TVXjrppNb78TKW//+7Cpr5QAnyhCpYoSYRTee7w5OZhT6sk
	lxPTDeFfSbFGX9bu+DhycFw3eBxa4dz3Q8mBcri61gmobLK8WYBA2a3Iqh0PbhcaKXxDEM9Ivcj
	VuZS1/I473gEW6EpvxToLwh7qzuRzFaw+r28p5Qy9OQXdkJMWQRR1B630NOXWBfgh3oSA2mr8/d
	8A2tOqSWbMclH5TbTtQ==
X-Received: by 2002:a05:600c:a00d:b0:4bb:6842:66ef with SMTP id 5b1f17b1804b1-4bb6842670dmr133742595e9.30.1794837049643;
        Mon, 16 Nov 2026 05:50:49 -0800 (PST)
Message-ID: <57d0ae0d-79df-492c-a902-395733ed0f53@suse.com>
Date: Mon, 16 Nov 2026 14:50:48 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/2] xen/console: re-calibrate rate-limiter based on
 compile-time options
To: dmukhin@ford.com
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org,
 michal.orzel@amd.com, roger@xenproject.org, sstabellini@kernel.org,
 dmukhin@xen.org, xen-devel@lists.xenproject.org
References: <20261112182042.1104699-1-dmukhin@ford.com>
 <20261112182042.1104699-3-dmukhin@ford.com>
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
In-Reply-To: <20261112182042.1104699-3-dmukhin@ford.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c1860d/1794837050-D715E87B-6A5DB1B6/10/78276251493
X-purgate-type: spam
X-purgate-size: 1083
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 12.11.2026 19:20, dmukhin@ford.com wrote:
> --- a/xen/drivers/char/console.c
> +++ b/xen/drivers/char/console.c
> @@ -1286,21 +1286,35 @@ bool __printk_ratelimit(unsigned int ratelimit_ms,
>                          unsigned int ratelimit_burst)
>  {
>      static DEFINE_SPINLOCK(ratelimit_lock);
> -    static unsigned long toks = 10 * 5 * 1000;
> +    static unsigned int toks = UINT_MAX;
>      static unsigned long last_msg;
>      static unsigned int missed;
> +    unsigned int limit;
> +    unsigned int elapsed;
>      unsigned long flags;
> -    unsigned long long now = NOW(); /* ns */
>      unsigned long ms;
> +    s_time_t now;
>  
> -    do_div(now, 1000000);
> -    ms = (unsigned long)now;
> +    if ( !ratelimit_ms || !ratelimit_burst )
> +        return true;
> +
> +    if ( __builtin_umul_overflow(ratelimit_burst, ratelimit_ms, &limit) )
> +        limit = UINT_MAX;

It's only a multiplication, so likely okay to do on every call. Strictly
speaking limit could be static __read_mostly, and would need setting only
once.

Jan

