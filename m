Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF109C61DC2
	for <xen-devel@archiver.kernel.org>; Wed, 26 Aug 2026 06:33:53 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1399647.1635628 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wz7Cc-00051a-PY; Wed, 26 Aug 2026 06:33:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1399647.1635628; Wed, 26 Aug 2026 06:33:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wz7Cc-00051S-Lq; Wed, 26 Aug 2026 06:33:38 +0000
Received: by outflank-mailman (input) for mailman id 1399647;
 Wed, 26 Aug 2026 06:33:37 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wz7Cb-00051M-1M
 for xen-devel@lists.xenproject.org; Wed, 26 Aug 2026 06:33:37 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wz7Ca-00G6IR-8x
 for xen-devel@lists.xenproject.org; Wed, 26 Aug 2026 08:33:36 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a8e88b1-bab6-0a2a0a5309dd-0a2a4507c9aa-36
 for <xen-devel@lists.xenproject.org>; Wed, 26 Aug 2026 08:33:36 +0200
Received: from [209.85.218.42] (helo=mail-ej1-f42.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a8e88c0-b4ea-0a2a45070019-d155da2ad1d2-3
 for <xen-devel@lists.xenproject.org>; Wed, 26 Aug 2026 08:33:36 +0200
Received: by mail-ej1-f42.google.com with SMTP id
 a640c23a62f3a-c2055573c8cso75582466b.3
 for <xen-devel@lists.xenproject.org>; Tue, 25 Aug 2026 23:33:36 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c250a7303casm431017666b.25.2026.08.25.23.33.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Aug 2026 23:33:35 -0700 (PDT)
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
        d=suse.com; s=google; t=1787726016; x=1788330816; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=um4yUsDv8cKb/Tn8csIrcU7+wnb9hBIUF0Hp/FAFH7g=;
        b=eN+VVzLHAXBQ7PwZ/XyNr1cjazx5E/qsEF6Wz3P8UY4JHkPhp7ZRFRyjabQmICzovz
         QKAvOaDJHr2xrQqk4wWOdeE8bUtirONeFen8A1kWd36W5SRZOY0PHvIVRi+90J3hfwET
         vDFBYSP4ZBOb70+lJr9n+0T6dPb/T8zao15dq29LlQKjATihW9rj6i1amTrBbNZDkjJK
         OPgjbICjKnJeXfJgBZeHDA+ncAh9WfqBt5XZ07tPDqFADMOd5C64mWLzAEi3NXFUlsP6
         1MKoXaFqU94sgk0gliRhM+G3CVgMJTk0c5xM1kEZQOCZasDdTmf/idGLhthdvzwrif6X
         eiqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787726016; x=1788330816;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=um4yUsDv8cKb/Tn8csIrcU7+wnb9hBIUF0Hp/FAFH7g=;
        b=oo4navzLw3Nsegwq9RmYwdRkuHPSHCI1ey0TA9PfIzaZIKuCy2LVp4Q03BgOXpiFj1
         EdH4LtbhDYeg/ipXYqOvokyQGcEi7hHvMjfj0bzosIFVQCk/OJ8hwU9BKBQFWeQC09D/
         SP/dC/mFDG9DlDAy0EZTBiAdP9nZDgfTwAaOmoH8NclQ//OJjVu8h15MgJJA39+O0N4x
         OJMxqlfjAQBCg/D6tAKcGlIksDjC9cKWZGMJvYu1nUievFtSLTegXFOxFQw+kB1+jOim
         pPXcufekOqxAk2GMnhWj49VrFcAw12ScEez7PVHnO4koOVH3XwC9iaEyrzALdzCUJlbL
         XdfQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr7Agp+AZjo/jqyKi4dV6vTHa7idfl4zfLSb6uZZc2TWJT0uvHzr9KZlMCNc2i24sOMZ4oH+QtWdmw=@lists.xenproject.org
X-Gm-Message-State: AFuF++mwuqjT59XGBBSC37YpzVLse/SCTwO6p7Uzuzp3CHzLsJHgB6CB
	0ZQlZJu28aT7wkX/GfHHPFm6K/pgWBNFJSuaYy61qcguV7ZM0vGcJ4p26zpRp+Dg/g==
X-Gm-Gg: AR+sD12fLiPnz6l1P8GUv1z0b0Z9Amk5SaZtHu5j5tsmRBot5nqR06MvdIsA5awp15j
	b4LznhNDAJcab6H5LJbW9kYstyplai2SDJQwKzreFAzk/4rPtGnwCZlePvWxUHWq/LeTqNmNyRb
	Bey8+w0D6CpZcT3RDyAtoiNi1Cs/gKXpECDULsKyB31a/p+mBZ0/nyeTG/BlXJP/0vqfINCQ0kW
	eX+qiCGawdYcF8xMnj0B9gGXgN2QeOAvY012MfdhWjLOV4vCmcR40TJ/kGs1MhRJqT6w0Q3BMcP
	PyRVdnB/SriZhNGR2Ms6YFJZHLsC7EouPY0FLfAo/ouif++q+6t3jlsBOrGpZOjdnCCJI1P/LCS
	x6nVzSlMNCtT3wdJbztklN5frftfyAEmL0wtOuC2sgk8KceXaaTKhhgktR6elMs8ol8j+Jim4Ld
	Ut0vrCY5z+Abs6lX/iNwDXrGYk49gU0BdThaFAULmycAqXJX/jyr+522MAM3YA9INrbgeA3bIv/
	hVRGLl+gPnSfdX2/HpddB41tdLo8gVCYXTYYKCMuWe/A9zBiXZ8
X-Received: by 2002:a17:907:c499:b0:c24:6390:decf with SMTP id a640c23a62f3a-c250c329353mr501402566b.16.1787726015706;
        Tue, 25 Aug 2026 23:33:35 -0700 (PDT)
Message-ID: <22091019-92ea-4de5-b470-2eb40d819dd1@suse.com>
Date: Wed, 26 Aug 2026 08:33:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] stubdom: Fix GCC 14 -Wmemset-elt-size compiler warnings
 in PolarSSL
To: Andrew Mbugua <andrewprecious388@gmail.com>
Cc: jgross@suse.com, samuel.thibault@ens-lyon.org,
 xen-devel@lists.xenproject.org
References: <20260825184605.79318-1-andrewprecious388@gmail.com>
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
In-Reply-To: <20260825184605.79318-1-andrewprecious388@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ef75cf/1787726016-348C9AE4-0DDCE437/0/0
X-purgate-type: clean
X-purgate-size: 2146

On 25.08.2026 20:46, Andrew Mbugua wrote:
> When compiling Xen with GCC 14, I get a compiler warning originating from the /polarssl-x86_64/library about a memset element size mismatch:
> 
> ssl_tls.c: In function ‘ssl_session_reset’:
> ssl_tls.c:1778:5: warning: ‘memset’ used with length equal to number of elements without multiplication by element size [-Wmemset-elt-size]
> 1778 |     memset( ssl->ctx_enc, 0, 128 );
> |     ^~~~~~
> ssl_tls.c:1779:5: warning: ‘memset’ used with length equal to number of elements without multiplication by element size [-Wmemset-elt-size]
> 1779 |     memset( ssl->ctx_dec, 0, 128 );
> |     ^~~~~~
> 
> This patch introduces a build-time patch to PolarSSL that replaces the hardcoded 128 byte length with a dynamic sizeof(), thus allowing clean compilation without warnings.

First a formal note: Commit messages want limiting to 75 characters per
line (some even say 72).

Then: You introduce a patch which isn't used anywhere. What use is such
a patch? You also ...

> Signed-off-by: Andrew Mbugua <andrewprecious388@gmail.com>
> ---
>  stubdom/patches/polarssl-gcc14-memset.patch | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>  create mode 100644 stubdom/patches/polarssl-gcc14-memset.patch

... introduce it in a new patches/ subdir, when all other patches live
right beneath stubdom/.

> --- /dev/null
> +++ b/stubdom/patches/polarssl-gcc14-memset.patch
> @@ -0,0 +1,13 @@
> +--- a/library/ssl_tls.c
> ++++ b/library/ssl_tls.c
> +@@ -1775,8 +1775,8 @@
> +     memset( ssl->iv_dec, 0, 16 );
> +     memset( ssl->mac_enc, 0, 32 );
> +     memset( ssl->mac_dec, 0, 32 );
> +-    memset( ssl->ctx_enc, 0, 128 );
> +-    memset( ssl->ctx_dec, 0, 128 );
> ++    memset( ssl->ctx_enc, 0, sizeof( *ssl->ctx_enc) );
> ++    memset( ssl->ctx_dec, 0, sizeof( *ssl->ctx_dec) );

Don't you mean sizeof(ssl->ctx_enc) and sizeof(ssl->ctx_dec) respectively?
Otherwise it looks like you're making a bad situation worse.

Judging from surrounding style, there also looks to be a blank missing each,
ahead of the new inner closing parenthesis.

Jan

