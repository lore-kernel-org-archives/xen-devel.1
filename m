Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A538606A320
	for <xen-devel@archiver.kernel.org>; Thu, 19 Nov 2026 09:52:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=bBpW2BEQ
Received: from list by lists.xenproject.org with outflank-mailman.1495975.1694650 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTyoa-00044Z-KR; Thu, 19 Nov 2026 09:52:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1495975.1694650; Thu, 19 Nov 2026 09:52:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTyoa-00044Q-EP; Thu, 19 Nov 2026 09:52:24 +0000
Received: by outflank-mailman (input) for mailman id 1495975;
 Thu, 19 Nov 2026 09:52:22 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xTyoY-00044E-R3
 for xen-devel@lists.xenproject.org; Thu, 19 Nov 2026 09:52:22 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xTyoX-004GqQ-S9
 for xen-devel@lists.xenproject.org; Thu, 19 Nov 2026 10:52:21 +0100
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6afec6cb-e002-0a2a0a5209dd-0a2a450280ca-26
 for <xen-devel@lists.xenproject.org>; Thu, 19 Nov 2026 10:52:21 +0100
Received: from [209.85.128.47] (helo=mail-wm1-f47.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6afec6d5-4900-0a2a45020019-d155802fd41e-3
 for <xen-devel@lists.xenproject.org>; Thu, 19 Nov 2026 10:52:21 +0100
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-4b467581b98so23614155e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 19 Nov 2026 01:52:21 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb85342cedsm24173905e9.4.2026.11.19.01.52.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Nov 2026 01:52:20 -0800 (PST)
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
        d=suse.com; s=google; t=1795081941; x=1795686741; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ery4yZRaG3fXnNXGW0eaMng0gAtqoPi3KZMD3mWv3Co=;
        b=bBpW2BEQaN5LDqv+20MLuxWJocOBtUfjBzrsYA+KpuMFUzPp8zUGmRvedJVp6omqF0
         vaOzL6WFRH0i85mwqeEIq4ntYgsRq061REfwmq4eFYHvCDq8TKExExZOf1gi1QQ9lLsK
         5NSnJlqYpsU64jfmDkl93ErQXGv2S1CaQHqozzmDQzWyVOwg8xEjTI/e8SeQwmhnYMzY
         Myod1y90LjEuBoStO0/zVdcP1kfjP4F7kgxpm7NqVscCfrv7Ul2s7d15T/rQiI+y/FmQ
         ddb9jXyYMid0CiMmU8bxk00LrEAg9sK7z56NYD/qx5MgyeIWxCTugig38g7Sq7OVqfV6
         izIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795081941; x=1795686741;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ery4yZRaG3fXnNXGW0eaMng0gAtqoPi3KZMD3mWv3Co=;
        b=d2bMfgEVmpyRClHzfaqz+2hL0qNmXeqi5RDEpWBGQnDezG0ubjRw6R2VA+TVrmPhqi
         EU0bM6JgXbo4AGl7Z3Rf+lWaDwdZceTsUvmzR4/dxj3eeZMlV8VkIgTJT1cwPESnkHG4
         IQasueMrfwWqkzeBW6bfONyk/VbaGBqIt9Djy+5OUDcVhRxsc3KKeJi2ZZmXQWlIfaUD
         hnNyulPzMhLxpFMc6wZ006d8p2GqhpoMff/Abq5WmoicKXWi/XTTeYe5QWNFA8PKs7Cs
         CTaLqYGvbBilbw4rZnF0kHABbuig3u6tOq+X4vpXh0f6NVgWA0CMKURopMv0UA2gvmDe
         Id8Q==
X-Forwarded-Encrypted: i=1; AL+hErGsH08Ctam7fgPUJDquiIXgGO6/KJt3b1kHdGBrArhDXDcIRWyesIUPRUAdUgtFgNvseZsOmUYMEV0=@lists.xenproject.org
X-Gm-Message-State: APuU4Z+jZTTWYDx4dp/Ud3G5hWPsU6IDL/it4ts8xAw6Qj25Z9tbrNfA
	f2dxw+o7vOtMUIOmTHpSwo+EXlv4rLB1r2r+QrTB3jajEY4b+qgCAHUol2EqyjUU8A==
X-Gm-Gg: AYBFou01lbpUS4VT+G0m8Z2+yX4HZnFE0AABdNfS2e5NLT77ZQFedKXzxQJf2GVdrDH
	HBmXz0ijloRobMmTDOLsO8PFPVvoy3sNa7k7Ezg2d7TMCHIzMAJ5iUJ2d1De/WB4UGMuRywukBJ
	nbGEFokQQ9x+e5aiQswOR9CJyC2AXLAXLWwT4GHqMFfFmm03adJlW4Q0xj3YILGu9L+sxIAP8If
	4uXLZrZ9gwxqA5DVpfO2orpv8OpTI0H0vhahrVW+c/HuT7oSlD/NZC5rpD24eq0pj7F1GDEM+eH
	GCIDonh21QOhhAT/l+/+HLmo4h8yBq9VlSBZRWWn0F/l87omf0Lz0Jr9oLgZqkqD6MkGgKpv6JP
	TZyRzPQ0NLnMbxo4s/MOHpmaoWioXsdVl68tUZQ0+tETYwk885L5I/3Tpw7z/nHEFzUgMtTQjC/
	ilCOUzPYEtqXyaR3FDkdrj+OcpLKf2eXKcXEGoFIjuVjb7tuIzpBzjbthwqRAMiQU4q/aSBXxLK
	TC1Vn2ptWoPZqgymedpIJSmAmjprFW98yU4SaT71p30An7Wm6RK08gV60iXMbN8Tl8kaz+TTpsT
	jZp5m6l59iztJVEgU5GkdXHfMRrleM1i37WkOJY1HSx4pO2U4B2hcupDFl8o6wXugiSednYm0XF
	fwDFzab+blQ2Ww+g/ez09px66DP0vUrg6g8NBHxQ=
X-Received: by 2002:a05:600c:4444:b0:4a3:59c9:a754 with SMTP id 5b1f17b1804b1-4bb7da2cfa0mr103018625e9.22.1795081941097;
        Thu, 19 Nov 2026 01:52:21 -0800 (PST)
Message-ID: <8dade36e-0051-4ecb-8f49-07a156dd8b90@suse.com>
Date: Thu, 19 Nov 2026 10:52:20 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] x86/vlapic: accept a logical destination of all ones
 as a broadcast
To: Stefano Stabellini <stefano.stabellini@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
References: <20261117233700.2654525-1-stefano.stabellini@amd.com>
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
In-Reply-To: <20261117233700.2654525-1-stefano.stabellini@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-720697/1795081941-F0B876C6-084D323A/10/78276251493
X-purgate-type: spam
X-purgate-size: 2792
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 18.11.2026 00:36, Stefano Stabellini wrote:
> In logical destination mode, a destination of all ones is a broadcast
> accepted by every local APIC: 0xff in xAPIC mode, in both the flat and
> the cluster model (AMD APM vol. 2, "Receiving System and IPI
> Interrupts"), and 0xffffffff in x2APIC mode (AMD APM vol. 2, "x2APIC
> Interrupt Command Register (ICR) Operations").
> 
> vlapic_match_logical_addr() treated these as ordinary logical
> destinations, so a broadcast reached only the vLAPICs whose logical ID
> happened to match it. In particular, a vLAPIC whose logical ID is 0
> received no logical broadcast at all.
> 
> Check for the broadcast in vlapic_match_dest() before telling the two
> destination modes apart, as was already done for physical destinations.
> A vLAPIC whose destination format register names neither model now
> also accepts the broadcast.
> 
> Fixes: f9e0cccf7b35 ("x86/HVM: fix ID handling of x2APIC emulation")
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> ---
> CC: Jan Beulich <jbeulich@suse.com>,
> CC: Andrew Cooper <andrew.cooper3@citrix.com>,
> CC: Roger Pau Monné <roger@xenproject.org>,
> CC: Teddy Astie <teddy.astie@vates.tech>
> 
> v2:
>  - Check for the broadcast once in vlapic_match_dest(), before the two
>    destination modes are told apart, rather than in each model of
>    vlapic_match_logical_addr() (Jan). As a result, a logical broadcast
>    now also matches a vLAPIC whose DFR names neither model.
>  - Cite the AMD APM by section title (Jan).
>  - Add Fixes: tags.
> 
>  xen/arch/x86/hvm/vlapic.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/xen/arch/x86/hvm/vlapic.c b/xen/arch/x86/hvm/vlapic.c
> index 6698779e22..50b515d254 100644
> --- a/xen/arch/x86/hvm/vlapic.c
> +++ b/xen/arch/x86/hvm/vlapic.c
> @@ -247,10 +247,12 @@ bool vlapic_match_dest(
>      switch ( short_hand )
>      {
>      case APIC_DEST_NOSHORT:
> +        /* All ones is a broadcast in either destination mode. */
> +        if ( dest == _VLAPIC_ID(target, 0xffffffffU) )

Turns out a very similar patch (referencing the SDM rather than the APM)
was sent before, and Andrew pointed out an issue there [1]: This needs to
use the sender, not the receiver, to determine whether broadcast is meant.

Jan

[1] https://lore.kernel.org/xen-devel/95e0e0fb-2978-4c87-b723-fb7c30f36883@citrix.com/

> +            return true;
>          if ( dest_mode )
>              return vlapic_match_logical_addr(target, dest);
> -        return (dest == _VLAPIC_ID(target, 0xffffffffU)) ||
> -               (dest == VLAPIC_ID(target));
> +        return dest == VLAPIC_ID(target);
>  
>      case APIC_DEST_SELF:
>          return (target == source);


