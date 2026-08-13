Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1C3BC5DF67
	for <xen-devel@archiver.kernel.org>; Thu, 13 Aug 2026 16:02:29 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1390300.1630793 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wuXso-0000qU-4E; Thu, 13 Aug 2026 16:02:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1390300.1630793; Thu, 13 Aug 2026 16:02:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wuXso-0000qN-1E; Thu, 13 Aug 2026 16:02:18 +0000
Received: by outflank-mailman (input) for mailman id 1390300;
 Thu, 13 Aug 2026 16:02:17 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wuXsn-0000qH-84
 for xen-devel@lists.xenproject.org; Thu, 13 Aug 2026 16:02:17 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wuXsm-001UMH-LA
 for xen-devel@lists.xenproject.org; Thu, 13 Aug 2026 18:02:16 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a7dea6d-e002-0a2a0a5209dd-0a2a4507ac88-42
 for <xen-devel@lists.xenproject.org>; Thu, 13 Aug 2026 18:02:16 +0200
Received: from [209.85.128.43] (helo=mail-wm1-f43.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a7dea88-b4ea-0a2a45070019-d155802be1fd-3
 for <xen-devel@lists.xenproject.org>; Thu, 13 Aug 2026 18:02:16 +0200
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-49554ebb87dso696395e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 13 Aug 2026 09:02:16 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-499820c2897sm139554995e9.0.2026.08.13.09.02.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Aug 2026 09:02:14 -0700 (PDT)
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
        d=suse.com; s=google; t=1786636936; x=1787241736; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QARw4/9fNbhPmIYnuVBMQ+PAynfQgdSQs7OwkdGP4y0=;
        b=fbjYBQxR/GYADZhJ4+atcb0ww5LT6zA4F+NVmMnvx/XCchKlgfjSrrNMafnkIC3jBf
         lXWOLEbTnlS0tYQ5LP6iWXkkbXqG+fTQWQPn66hoz/yKx373UGVr652zeG/ae0maA5hT
         5Bq+Q3qU6bquVBqbkqTMzftPFP1lyO7y3Xfnw8OkbblI4DZ+EATQMkbIjRrw4T/QU84b
         Z/Omr1fjeMLdYIjlyRqkveNRpkUh9Cup5B+DghmwTUdukhAEvzdoCs8osDTswfb8SYHK
         TOxwneBoODRnaYkN/QBL8VmGnMmW74V6DIbHNMUhjV88x0LXaZmO57QjjuAPH+y2yznv
         CjSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786636936; x=1787241736;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QARw4/9fNbhPmIYnuVBMQ+PAynfQgdSQs7OwkdGP4y0=;
        b=SBKHRjeMuKBmsgr9BS3eZozSbk5BrhLSbHGh3Kw0xJl0Q77wy/t8+MEzor7sHv5AKL
         8tYs3ShfkEh/a6RpLNbKQ15y397KxqlvmCPcTV5ahQ66mbaSa0SZS72TJAuEbZJMbn61
         d3Wb6r+Q/C2uL/TIeQsP3T+IeE1H+1IF+bjlsJNnzVImErGvS0USwznVLKUA1LA6FVFY
         YTCzA7HPTfiD7RyZHSWvyRZlb+RrhTjyOjiGLW3MJa0toxsgm5AIZ/eh0bw3x4s19D2Q
         1QQ5d0ncAzbgAhM2pDgeoabnzAABgLQ4YTiZbaqtRo9p+QNy8UCZ9lfU0sj4QS+Cm6iX
         T3VA==
X-Forwarded-Encrypted: i=1; AHgh+RqmxT/qttw8eSfjAIoiX8VF3LfYiKCrW3cBD4RfvmAdtypyrbasucx1p3K5rMQrTXdhIvJ5YigJGFk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyhpsW69yV/TfIPybn6IPAlt4HWe7D6TWf1hgYIdDLpsDT61Kzm
	YjtgjSSJaMUxhTD9vhwTBpMwA1ajpLBH3AS/rO9xz4yHebQ4uY0zLVG7z0QhqVfdNg==
X-Gm-Gg: AR+sD11M23cB38/6+aj5+55MtUOT/fytsupnHhhBlQI+kn2LgUiPDKvSsKJupMlKEO2
	NjmlQ1ne+BzbqlsXxn1box3WUtXSruvmvE0XjHePHlFxNfM1uhLixNAXmz2Ebgm3tG1cSZepzxf
	TOSBZIRElynYna6pfRsPUoDsxCnDcT/AOwJw5xcdLvfxcBwBrbmzR51fiBHxSCtHrI3c01WCO1I
	2eyF4cmdGezcKkjaTDz5quqUbHrLIVwPIF528QceJRJk71oUHXXAq/HcxR70SR82Wkx/3pgu3cQ
	msQbATUGgcemhK2vga9M25qfX6HuFmYphfdGMTIICthEiuojEnLdW9wu3y6RpPm/zfVo7U1DV8a
	PRJpOc+3Wx4p7DNDG/a0TyXvyForICLA/wurBsjqin4eir0qoKmV6AYLcKDFHYST59GcyC/jnVH
	xx1jNXNZeCpDgPk933fKovEcZoRp3n275CKF2lyyn9e/jmBrqMW+/VjQvWA5K2WnrlCdJsstsAh
	lvYleqDJJN9aUW6/ZeiermcmXt9QffzcKRuheoAbp8tcZ76TzcLg1RBKoGiyD8I
X-Received: by 2002:a05:600c:a00d:b0:493:cefc:d113 with SMTP id 5b1f17b1804b1-499821a1e0emr93501285e9.5.1786636935707;
        Thu, 13 Aug 2026 09:02:15 -0700 (PDT)
Message-ID: <46210477-e225-4f1b-93c4-758912eee9b0@suse.com>
Date: Thu, 13 Aug 2026 18:02:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/2] xen/console: re-calibrate rate-limiter based on
 user input
To: dmukhin@ford.com
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org,
 michal.orzel@amd.com, roger@xenproject.org, sstabellini@kernel.org,
 xen-devel@lists.xenproject.org
References: <20260811233824.1874525-1-dmukhin@ford.com>
 <20260811233824.1874525-2-dmukhin@ford.com>
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
In-Reply-To: <20260811233824.1874525-2-dmukhin@ford.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ef75cf/1786636936-A5CC7AE4-6943FEBC/0/0
X-purgate-type: clean
X-purgate-size: 1800

On 12.08.2026 01:38, dmukhin@ford.com wrote:
> From: Denis Mukhin <dmukhin@ford.com> 

First: What user input is the subject talking about?

> Current __printk_ratelimit() relies on hardcoded values 5000 and 10
> respectively to program leaky-bucket message limiting.

Which doesn't change, as ...

> Use 'ratelimit_ms' and 'ratelimit_burst' variables to re-calibrate
> limiter.

... the values of the two static variables never change.

> Ensure rate limiter is disabled if either 'ratelimit_ms' or
> 'ratelimit_burst' is 0.
> 
> Fixes: 26cf03554a75 ("[XEN] Implement rate-limited logging.")

I don't think anything is being fixed here.

> --- a/xen/drivers/char/console.c
> +++ b/xen/drivers/char/console.c
> @@ -33,6 +33,7 @@
>  #include <asm/setup.h>
>  #include <xen/sections.h>
>  #include <xen/consoled.h>
> +#include <xen/xvmalloc.h>

This shouldn't be needed, as ...

> @@ -1286,21 +1287,34 @@ bool __printk_ratelimit(unsigned int ratelimit_ms,
>                          unsigned int ratelimit_burst)
>  {
>      static DEFINE_SPINLOCK(ratelimit_lock);
> -    static unsigned long toks = 10 * 5 * 1000;
> +    static unsigned long toks = ~0;
>      static unsigned long last_msg;
>      static unsigned int missed;
> +    unsigned long limit;
> +    unsigned long elapsed;
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
> +    limit = DIM_MUL2(ratelimit_burst, ratelimit_ms);

... this helper shouldn't be (ab)used here. I further wonder whether we
really want differing behavior here for 32- and 64-bit hosts.

Jan

