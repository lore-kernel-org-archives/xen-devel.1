Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B299CA600D
	for <xen-devel@archiver.kernel.org>; Thu,  8 Oct 2026 15:55:30 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1443532.1660802 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xEqSR-0002AX-6i; Thu, 08 Oct 2026 15:54:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1443532.1660802; Thu, 08 Oct 2026 15:54:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xEqSR-0002AQ-3m; Thu, 08 Oct 2026 15:54:59 +0000
Received: by outflank-mailman (input) for mailman id 1443532;
 Thu, 08 Oct 2026 15:54:57 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xEqSP-0002AH-Lw
 for xen-devel@lists.xenproject.org; Thu, 08 Oct 2026 15:54:57 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xEqSP-006BLQ-2q
 for xen-devel@lists.xenproject.org; Thu, 08 Oct 2026 17:54:57 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ac7bcb1-e002-0a2a0a5209dd-0a2a450cea74-36
 for <xen-devel@lists.xenproject.org>; Thu, 08 Oct 2026 17:54:56 +0200
Received: from [209.85.128.54] (helo=mail-wm1-f54.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ac7bcd0-f479-0a2a450c0019-d1558036e819-3
 for <xen-devel@lists.xenproject.org>; Thu, 08 Oct 2026 17:54:56 +0200
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-49d05d51553so38837815e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 08 Oct 2026 08:54:56 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a1843df445sm78094745e9.12.2026.10.08.08.54.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Oct 2026 08:54:54 -0700 (PDT)
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
        d=suse.com; s=google; t=1791474896; x=1792079696; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JavdErP7KbBKiaezabZFBSgKfepvWSMx5svLCFcmWLE=;
        b=KFmDl8dRP4IIxszpDGu+x+OdW7qoQbVv/AmRKgLsQrm4cEhovhF++JyqsC/ioDV6Vw
         ukaKP9zgkECilqhYQR6aTQq/9Wc9XQPiGk8FsWkvKu1IeKwhoViEVOsPkFOPEl84ZMO+
         wx9S5BZBg4hnC0fxHCPgDo8tEvpBvZEnVlW0rttIHZqXWSlNLMh/UPP3Gzwhbt2X/z2l
         IBIXxsTM5LwqRWe52PAWc7YslR7jrtREpLXTqKQg8EnNTn9vHPKuZ1Jnj9nwmR+jz+bY
         uxnb4FyaHXKoZJsBWib5pbFFDOIZ8gqh/T3e4FHfFIJ5KL7nZCKr4AAaZ4siZu4p3WwM
         UfIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791474896; x=1792079696;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JavdErP7KbBKiaezabZFBSgKfepvWSMx5svLCFcmWLE=;
        b=oXB7lWiq+4pBHRzjltb/2SpIKSklfem/G/5pBpyKd/jSWKG7fV+p3CXK8Xend1xEiD
         CLMato1TC0uy03aqhgULeZEdC8WxTbGbTIQuFrtTkPzq45PtzZ8ZaTGZXWM6LP0rIeuR
         VrzoPlz5nduwNXroxrYcGfgJFmNhTGys4udE0NjGEYVK0yze1PKsiBdIGRL4FD6oE3x5
         syvkL1QaZY12XAeLLzShoyeM0t3xll5znWJp7ot6Zd63ZfmmH2gPmbK0plmsY88vA0tp
         k8KFsSstEaKKuMinw4hRZPRAeU0DPl3egHfJi9RKP0h5Na64+YrdOHpSxPCkrhb5DjFf
         NISg==
X-Forwarded-Encrypted: i=1; AKwUvBx9CodPKw0nSVuOJOWQvd1hChwoN+lMpwmSAAqW0YlITZnp0rWn6M9DQcla+pBvqn9dGTkIWTFk9Yc=@lists.xenproject.org
X-Gm-Message-State: AFuF++kmDxYyG7GiXyKy9wkfqpUTOAGerinMhMKlJIoQHvpSygjnch/W
	z5dLkQHVKKwf3Da8WYt7LZ5kg6eP/MbbD/R9mJhtnAOKKUpz3fh3zsobyrKTuDK3MQ==
X-Gm-Gg: AYBFou3jvKd/Zi0A7cDSN04lFTCibtMyodHTgmibnTfD9xZppenHSDm1eAemLx+qt10
	LNJhMhcLpePQPjSfJCmcvd9mLcMgt7zQ1oeJ1z8FoBPeolDRKlmLoIluQObPqykaT1bQ8KlziGX
	Ll8a7vneRKmB768C/HHq1it2xP0OIev54Yn8YrZyC7aMF6zFxUI/F4Eoegt3bbqrFEnM89hhacq
	nBlOXVwrTtaa7HpmFwuyWTDZLwNVeVAd1RHTq+4lhnDIuGdvlmV+RjsH155xBarmYaaMSUF9SUu
	LGbPZZJc/3QWu2wxNMI1XxvEcqDcaiGoayWztyWpJ/jY5dNtI1nLAaJ+eTqwEM7J7HQWiAvADy+
	RDPwnVvwuUMbmrmajKCGr13O+pfeW9lcsmynwzSw97i7STNrLsE1El0QNZCqu4XEh0a8ldaqMbZ
	8ZZPcug8uh03qSbhPlwwXgQgNSizKmygOeP8cohHjnDLl8PkT/UY+SxC6HMbFzE7d8bny/VdqHk
	ESu3lveZG15e1QTMs0sGpKK0+9cU0JbjdowMcy3kxlOhNVrTV1gkO3tJ9oUIOY=
X-Received: by 2002:a05:600c:3e0a:b0:4a1:6c79:fd31 with SMTP id 5b1f17b1804b1-4a180459354mr100534465e9.12.1791474894673;
        Thu, 08 Oct 2026 08:54:54 -0700 (PDT)
Message-ID: <8f61b665-17ca-4eda-b452-313eff8bff93@suse.com>
Date: Thu, 8 Oct 2026 17:54:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drivers/char: add timeout for XHCI console cable
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20261008150528.359731-1-marmarek@invisiblethingslab.com>
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
In-Reply-To: <20261008150528.359731-1-marmarek@invisiblethingslab.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d25034/1791474896-034D7A5B-A521AD3D/10/78276251493
X-purgate-type: spam
X-purgate-size: 2494

On 08.10.2026 17:05, Marek Marczykowski-Górecki wrote:
> Do not wait indefinitely for XHCI to configure console connection. If
> the cable is not plugged in, timeout after about 1s and continue boot.
> If the cable is plugged in later, the console will be activated then
> (see final part of dbc_ensure_running()). When timeout occurs, print a
> warning message - it will be saved in the console ring buffer, to be
> later retrieved from dom0, or possibly later printed when the cable is
> finally connected. But, do not print the warning when waiting after
> controller reset, as that may have been called from from console
> dbc_putc() and printing here would result in (possibly infinite)
> recursion.
> 
> Try the timeout to be about 1s, which is way above time needed for
> configuring already connected cable. But, since this part runs very
> early in the Xen startup, time is not calibrated yet, and functions like
> NOW() do not work yet. Use raw TSC and estimate needed time to be at
> least 1s on a fast CPU (5GHz), and possibly longer on a slower one. This
> is not very accurate method, but fortunately it doesn't need to be.

A little fragile, but well...

> --- a/xen/drivers/char/xhci-dbc.c
> +++ b/xen/drivers/char/xhci-dbc.c
> @@ -851,9 +851,15 @@ static void dbc_reset_debug_port(struct dbc *dbc)
>      }
>  }
>  
> -static void dbc_enable_dbc(struct dbc *dbc)
> +static bool dbc_enable_dbc(struct dbc *dbc)
>  {
>      struct dbc_reg *reg = dbc->dbc_reg;
> +    s_time_t start;
> +    /*
> +     * Too early for proper time calibration, assume a 5GHz CPU and let it wait
> +     * about 1s, with still reasonable timeout on a slower CPU.
> +     */
> +    unsigned long timeout_ticks = 5UL*1000*1000*1000;

Even if right now we don't use the driver in any 32-bit env, I think we
better wouldn't deliberately break such a possible use. IOW unsigned
long isn't a suitable type to use here.

Also, nit (style): Blanks please around *.

> @@ -870,8 +876,12 @@ static void dbc_enable_dbc(struct dbc *dbc)
>      writel(readl(&reg->portsc) | (1U << DBC_PSC_PED), &reg->portsc);
>      wmb();
>  
> -    while ( (readl(&reg->ctrl) & (1U << DBC_CTRL_DCR)) == 0 )
> +    start = rdtsc_ordered();
> +    while ( (readl(&reg->ctrl) & (1U << DBC_CTRL_DCR)) == 0 &&
> +            rdtsc_ordered() - start < timeout_ticks )

Urgh - now the driver's truly becoming x86-specific. Is there a reason
this cannot be get_cycles()?

Jan

