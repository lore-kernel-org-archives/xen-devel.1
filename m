Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4DAB606A326
	for <xen-devel@archiver.kernel.org>; Wed, 11 Nov 2026 08:33:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=MSRO6+S7
Received: from list by lists.xenproject.org with outflank-mailman.1483204.1686743 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xR3ll-0004hN-LP; Wed, 11 Nov 2026 08:33:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1483204.1686743; Wed, 11 Nov 2026 08:33:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xR3ll-0004hG-HO; Wed, 11 Nov 2026 08:33:25 +0000
Received: by outflank-mailman (input) for mailman id 1483204;
 Wed, 11 Nov 2026 08:33:24 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xR3lk-0004hA-91
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2026 08:33:24 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xR3lj-00Djt7-EP
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2026 09:33:23 +0100
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af42851-e002-0a2a0a5209dd-0a2a450890ce-12
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 09:33:23 +0100
Received: from [209.85.128.46] (helo=mail-wm1-f46.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af42852-f659-0a2a45080019-d155802ed4e8-3
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 09:33:23 +0100
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-4b467581b98so26600885e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 00:33:23 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4ba01fe63e6sm192329305e9.7.2026.11.11.00.33.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Nov 2026 00:33:22 -0800 (PST)
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
        d=suse.com; s=google; t=1794386002; x=1794990802; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IatpSNQ440AAjxM/DqfczVJHdoQeIBQerpyafpJM8ts=;
        b=MSRO6+S7skowdXNNMM0VlelikhbZ1AVav3jIBptrpaXO8khj0JBB8SBh5grVGpXwoa
         1lFm6+Pp3KHmX4JF3B7UtpLa77sWaAn8rFQhAdqfzsqRD1Nkwnh2ESSTrex62SxDpAin
         sOSLXJGlzUel5m8JE9vLuBuNXMo2EhsbLELJ2fcJkwAuZ+dOXcXvlG1NIWzJDS4c3KP0
         2ZUVWkk0EDJegrt65UzmKw1Dv+VuqNtulS5oovvHU5SWEVUyY/p3xzqEERikEp2ruCLG
         G0YWut/2ctepLZuT8giYnVQlI7OeQHymfIR9jeMlHdoYu/MKnb4DTPGjXhiM7pwmQ1MO
         IQXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794386002; x=1794990802;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IatpSNQ440AAjxM/DqfczVJHdoQeIBQerpyafpJM8ts=;
        b=ui+PO/a657N0bZ84B71FigbbpAlqYr30XlTLE9oTniJZSX4k/qA6WIzH3j75sGwtw7
         WWC3zWVfsNR+nL85kjyz1fqZD/8kNshXNGGs7lBbErPm26Dw6Pjq+Axt+tzJI/kN4m0y
         PWnf/I0mvOoLhyQdmscKDn32X4R+Q5MN0DeaUUckwiFXGSzHY1EvWsaGajMLbJZqwl8i
         Xywq/9bQYUn0emMKgFnj7nSt1KCYzXaOps1yNi+jmZDR4QBtGcVYQ8uqtfsY1tkERUHZ
         ot+l4IwxlCK42Ne8vfLwjGsX3K97EWmUt6ndYoOexv4us0tV80Be44ReNxuEnHty+nG/
         p0OQ==
X-Forwarded-Encrypted: i=1; AL+hErEJJ5FVpQesMlal0iIlniVg08mA7bjFnQ778FcByUyRCC3czMGzRsvkcvvotVLCrQciTf73W7wizxU=@lists.xenproject.org
X-Gm-Message-State: APuU4Z/b5EIw0Tsyge8Zo7Zzyh31gQl7nS+X9IexjnvXeS5kYHVx009L
	6G9ukNXYAE2ZL3ub7+5aGy4zYHPvkIDTsJmMBc9TLBmwDJGkPBeNLpphg/U8iSLxGw==
X-Gm-Gg: AYBFou0DUrTU1muEBGOv1OZMFckaf5T9+VVg2vi8iNo4B+x7IV4XikTulDRuJAEGUEE
	8aCU9dI9KLxrXioTewGleC0ZiQE0sq9qXnqIVGtbg1t2v4yNQhFfU4qrpj06ic7xTFJjnLDWdEm
	NNrgEfbW3yqDWPNuUyrvuWz3cEun3Xn9rESYQlzlrxKVuWraZx+PUG+ot4Ok9zB4mFo8ZiFRVe1
	uKXJFIYpMfY3zXAsTTgKr7wBvZjx0z+9HGvA1c54GLp3dSUTctj6mU7Y4InaWFW6y4VMwa6tErC
	EJx7oFmKM4aLmdhDsDvAGSvZ1OkrLHK510AVzk0YbU5maaRqKwjMX3yIGXqH9uk/yWxHUMTGZRs
	Y0Wkvo5W9hXHmYRvfu0H3OBjNYmg6W6XhXTznfKayl0RJRiHqoskthKM/KAhA1J9nWbRyTqf9Un
	j1LuLYxdOizbdmEZk5x3TvgE+/0l+2PMiEOidPpD6zFEKCZV19sueH3cdURkdaVNK3068N6eIO+
	u1/mse3A/qm6oXdXAieCrz8i4JHGdQidGZZ4MjY/gPiV5ub9NqzvymjZJIBw4+TLTeBeKsHFup/
	T9DYBVduqPjdGb4nrgY/YUYeSPxn9UlqkIN2q/kShJhAmqHYLU4SjqSYxM8OaYq8s1TPWVQC/Ha
	qD9/+4aJeAcWKHZ7JeA==
X-Received: by 2002:a05:600c:34d0:b0:4a5:87b3:ddc1 with SMTP id 5b1f17b1804b1-4ba0938a143mr27964665e9.13.1794386002591;
        Wed, 11 Nov 2026 00:33:22 -0800 (PST)
Message-ID: <03b84e95-9ebd-49e4-be77-b728acc3021b@suse.com>
Date: Wed, 11 Nov 2026 09:33:21 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/bitops: Replace __scanbit() with a simpler tzcnt()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Teddy Astie <teddy.astie@vates.tech>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20261110153156.3162601-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20261110153156.3162601-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c1860d/1794386003-D4D7087B-835459EC/10/78276251493
X-purgate-type: spam
X-purgate-size: 2374
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 10.11.2026 16:31, Andrew Cooper wrote:
> There are 4 remaining users of __scanbit(), and they're capable of dealing
> with max being BITS_PER_LONG.  Switch to a simpler tzcnt() helper, which also
> removed some alternatives from behind the scenes.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>
(with a suggestion below)

> Supercedes "x86/bitops: Improve code generation for __scanbit()"

Quite a bit neater indeed.

> --- a/xen/arch/x86/include/asm/bitops.h
> +++ b/xen/arch/x86/include/asm/bitops.h
> @@ -320,18 +320,23 @@ extern unsigned int __find_first_zero_bit(
>  extern unsigned int __find_next_zero_bit(
>      const unsigned long *addr, unsigned int size, unsigned int offset);
>  
> -static always_inline unsigned int __scanbit(unsigned long val, unsigned int max)
> +/*
> + * Search for the first set bit in @x, returning BITS_PER_LONG if @x was 0.
> + * See arch_ffs() for safety discussions.
> + */
> +static always_inline unsigned int tzcnt(unsigned long x)
>  {
> -    if ( __builtin_constant_p(max) && max == BITS_PER_LONG )
> -        alternative_io("bsf %[in],%[out]; cmovz %[max],%k[out]",
> -                       "rep; bsf %[in],%[out]",
> -                       X86_FEATURE_BMI1,
> -                       [out] "=&r" (val),
> -                       [in] "r" (val), [max] "r" (max));
> -    else
> -        asm ( "bsf %1,%0 ; cmovz %2,%k0"
> -              : "=&r" (val) : "r" (val), "r" (max) );
> -    return (unsigned int)val;
> +    unsigned int r;
> +
> +    /*
> +     * The destination register still needs pre-loading for older CPUs which
> +     * will execute TZCNT as BSF.
> +     */
> +    asm ( "tzcnt %[x], %q[r]"
> +          : [r] "=r" (r)
> +          : [x] "rm" (x), "[r]" (BITS_PER_LONG) );
> +
> +    return r;
>  }

By having r and the function return type be unsigned int, when the actual
insn really is a qword operation, you force call sites to do the zero-
extension if they want an unsigned long quantity. When both are unsigned
long, no zero-extension needs performing by the compiler. Truncation to
unsigned int (or less) won't require any extra insn(s) anyway. While this
doesn't look as if it would make a difference for present uses, future
ones may benefit.

Jan

