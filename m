Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4224DC44511
	for <xen-devel@archiver.kernel.org>; Thu, 16 Jul 2026 15:39:09 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1364265.1615567 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wkOAf-00048Z-4t; Thu, 16 Jul 2026 15:38:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1364265.1615567; Thu, 16 Jul 2026 15:38:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wkOAf-00048R-1O; Thu, 16 Jul 2026 15:38:45 +0000
Received: by outflank-mailman (input) for mailman id 1364265;
 Thu, 16 Jul 2026 15:38:44 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wkOAe-00048L-DH
 for xen-devel@lists.xenproject.org; Thu, 16 Jul 2026 15:38:44 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wkOAd-00HG3l-Hq
 for xen-devel@lists.xenproject.org; Thu, 16 Jul 2026 17:38:43 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a58faf7-bab6-0a2a0a5309dd-0a2a4505ad36-30
 for <xen-devel@lists.xenproject.org>; Thu, 16 Jul 2026 17:38:43 +0200
Received: from [209.85.221.44] (helo=mail-wr1-f44.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a58fb03-4cb1-0a2a45050019-d155dd2ce980-3
 for <xen-devel@lists.xenproject.org>; Thu, 16 Jul 2026 17:38:43 +0200
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-47defd0c1c5so2711363f8f.3
 for <xen-devel@lists.xenproject.org>; Thu, 16 Jul 2026 08:38:43 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47f464a96fdsm25562102f8f.24.2026.07.16.08.38.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Jul 2026 08:38:39 -0700 (PDT)
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
        d=suse.com; s=google; t=1784216323; x=1784821123; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w8ogeAOc+1uekaYIAprkGc/PzobS26Q+wBAIPILYa+M=;
        b=Myj8Q0WCk7EbNp+StGY1Y0k7PnZkoosIKK81AIZbtXy5QJEs7XeJJID5m/5mlZlvXT
         YozyTGE93VBUeLfhFfg6tSVDyziF5cQqCAhMOpK4nZZrAe85N/J2z+M2qbSKLPtpOXUm
         dI3W0JWv6LtN9qDRRdclRV542Z8CsaWQfGsaqqyzsZdhHrCdqajiob2/h2LIvSNBvkO+
         JGtfz56gO6gxZveS+fLh8MW4BBq0K/K2gQH+ipfTtyEDNYKM8xr38yPG6HBZDRqgwg+Z
         oKIqtqX6x9ig9qjHNFllyJz73t7VljtklKfvSE0XrEohGNnLO+cl/g4LAE9vV0kLNjG1
         C23Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784216323; x=1784821123;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w8ogeAOc+1uekaYIAprkGc/PzobS26Q+wBAIPILYa+M=;
        b=sVwtWLLiLra/F/7sB3E/pojlCNdtJg0kFapKTGactU3xGhnxIkzXkdDSvyQEuKv5Zs
         ocNVVCf+egszBCfOtpL0L1MG8pnE8wRGVcEaFVSf+yketXrS0IRvW66V7ksG2TXI+cf2
         qm9fWUdQM6fPo/ECmxJMkqvhlsz4EUJClhfzF/sZxjF7DTf7phcTXYU8KheUUpN4iD9q
         ERizNpslQyAFLA1OX01dNUDynqbtE5JU34BFweYPvyzSrSgkiXVWjohXLSxqxm6hwWks
         WFeg2c0VhEuIGtaDilkrocMmIWakiaxaRZBh0MUsVcGRnEeEMHzaYGZ6FIWOWU1r88nR
         COGA==
X-Forwarded-Encrypted: i=1; AHgh+Rqr13yZ8jYWYvBJxgkaDNPWYSt9NjmjOYE7JkhUhCbpFxVtMbbRAOxA0LWdetfZlS1AH7PSChT4soo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzbGJtmF9E8kdfpWrr2Brxci686K0SBfpDGHzS1M+9imwSmHUXx
	nde2LMjAkHpJ/91Hg3VfWectlg4uv2cXzeJt996uD1Yb29tHMy4gWuM/qKUChaROlycTTgKT8Py
	AFMXlCg==
X-Gm-Gg: AfdE7clJjPin+ZhwIIGOFWBKt9+IWp+RwQT9R0A7P27+BRD6hwfdIs1coimv/OTRWYj
	qYj+M+MOPdIwh5hpapz3OtvehkwG+8tNvoZ2WWN0HxiDH95gQ6iYFuVN4JWBWwoCbaeWKVO0T6Z
	M/03W3rikmljsftLKSteJoL/S5IZU83P6c75M/N/QneVHmarBqx+6QUplb7SNggVGlAh8x+i4ed
	ByDlgRPIPYW0WdQlBvzOp+P/UaWX4vuNpLL4FxPR+uI8BwXbojlnn5b+klD7Nqbjtzupg68N6DU
	Nu8QTX3cOaMMQFO151y6kQnTm6pQI2Fp/RoZ8h5J9dSKjQo74lP/bXglW0Roxfq79wH4GzxKdG9
	RNUWq3b55xvrDSbP5RcTGt30WKm4otu3wIpzAvKDYF1r7V/tgT0MuAfeWOTZxi/sLpU9y7cSiAk
	BMjHV1wwaunB480EuT6PVW/7gKcfkq83BAuyrhRV3uL/fBySpdJaMedX/3Nu55J3/8Cg==
X-Received: by 2002:adf:e19a:0:b0:475:f0f0:9ed1 with SMTP id ffacd0b85a97d-47f2dcf9fccmr27240172f8f.60.1784216322840;
        Thu, 16 Jul 2026 08:38:42 -0700 (PDT)
Message-ID: <749d531a-e6a9-4f6c-971d-4971dc6e738d@suse.com>
Date: Thu, 16 Jul 2026 17:38:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] xen/console: correct leaky-bucket rate limiter
To: dmukhin@ford.com
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org,
 michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org,
 xen-devel@lists.xenproject.org
References: <20260715201902.2984407-1-dmukhin@ford.com>
 <20260715201902.2984407-3-dmukhin@ford.com>
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
In-Reply-To: <20260715201902.2984407-3-dmukhin@ford.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c201ff/1784216323-714AC2A1-769C7769/0/0
X-purgate-type: clean
X-purgate-size: 1197

On 15.07.2026 22:19, dmukhin@ford.com wrote:
> --- a/xen/drivers/char/console.c
> +++ b/xen/drivers/char/console.c
> @@ -1274,21 +1274,26 @@ bool __printk_ratelimit(unsigned int ratelimit_ms,
>                          unsigned int ratelimit_burst)
>  {
>      static DEFINE_SPINLOCK(ratelimit_lock);
> -    static unsigned long toks = 10 * 5 * 1000;
> -    static unsigned long last_msg;
> +    static unsigned long long toks, last_msg;

Along the lines of what Teddy said, I question the need to widen the variables.

>      static unsigned int missed;
> +    unsigned long long now, limit;
>      unsigned long flags;
> -    unsigned long long now = NOW(); /* ns */
> -    unsigned long ms;
> +    s_time_t ms;

This is the type to use for e.g. NOW() return values; it isn't ...

> -    do_div(now, 1000000);
> -    ms = (unsigned long)now;
> +    if ( !ratelimit_burst || !ratelimit_burst )
> +        return true;
> +
> +    limit = min(ratelimit_burst * ratelimit_ms, UINT_MAX);
> +    if ( !toks )
> +        toks = limit;
> +
> +    now = NOW(); /* ns */
> +    ms = do_div(now, MILLISECS(1));

... a type to hold a millisecond granularity value.

Jan

