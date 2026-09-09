Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7C75C79FAA
	for <xen-devel@archiver.kernel.org>; Wed,  9 Sep 2026 06:30:21 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1412577.1642969 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4Boo-0002NL-3V; Wed, 09 Sep 2026 06:30:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1412577.1642969; Wed, 09 Sep 2026 06:30:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4Boo-0002Mj-0f; Wed, 09 Sep 2026 06:30:02 +0000
Received: by outflank-mailman (input) for mailman id 1412577;
 Wed, 09 Sep 2026 06:30:00 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x4Bom-0002JK-Cd
 for xen-devel@lists.xenproject.org; Wed, 09 Sep 2026 06:30:00 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x4Boj-00FaBO-Uf
 for xen-devel@lists.xenproject.org; Wed, 09 Sep 2026 08:29:57 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aa0fce2-e002-0a2a0a5209dd-0a2a45089b18-20
 for <xen-devel@lists.xenproject.org>; Wed, 09 Sep 2026 08:29:57 +0200
Received: from [209.85.128.48] (helo=mail-wm1-f48.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aa0fce5-f659-0a2a45080019-d1558030d806-3
 for <xen-devel@lists.xenproject.org>; Wed, 09 Sep 2026 08:29:57 +0200
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-49b0d78a801so53948895e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 08 Sep 2026 23:29:57 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49cfbdacc45sm419611795e9.11.2026.09.08.23.29.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Sep 2026 23:29:56 -0700 (PDT)
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
        d=suse.com; s=google; t=1788935397; x=1789540197; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zNNrwzlgwXbpRUEBSY7hJJvBKiZ4KZJRYme6JSu7CMA=;
        b=Zrtc79TgIAO8G6a6PHhdnf1YkHS/tJ9eC+4We8gn4Ls0PJLacW300IxJaKxvmmXRKB
         Q/CFGH47AI2hFrKWA4moHTG6Xmkt1TDmfAcagw/a/LVGmVSEUcaB6Ts8Nc1gIfZeV40W
         u74muZiyDxIpHsahHt/4r3o+H/ssv/CRiTyarbX85dXDEQ/JWNkqcSoHQZK0Mo3wNSDd
         PugNBrdv4Uyg9PW//gLznswgjsThNkIFc/vQcFnzsRuaKB4KJwvOKJuu8QURGMzoJE9p
         FavOMKaCMj2ZQGbSzC6ZwiT6C71KoNZS6+1OoiWpcRPW6wj6jYYzasFbl2vScpmGppse
         S2AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788935397; x=1789540197;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zNNrwzlgwXbpRUEBSY7hJJvBKiZ4KZJRYme6JSu7CMA=;
        b=ZsX5FKpFlBjGFeklRj9026uoBjzeY/vEpjHwSoAsmn4446JYaLtR9GLYm5FhV2uB1d
         oM1BnDDj9UTIL73sl616UWWZe8j0J1N9//rzCyS8B3gEo6ABO6tDofZjIkonU1IpPTa2
         cRuMO5rs1aUajnLrXqORazac1ZtPQ0PSzZsXTIFlqCoMo2Ow+5tzr1sfHhy1z2agk0ES
         uekoqqT9FgPGG/LI2MhgtX3vd2tHSDQbqcOBtX4WYlUVHZqqtcYturPVFo312U9pJblA
         dltn4L1+403tpd/KWnYwmLOjQFuAhfp8Iljli8JPVBL/P8jMde337VMMPkuluK1NsoCr
         KGcg==
X-Forwarded-Encrypted: i=1; AKwUvBx/pooyB6IMZs4sl/5VzbyCUETVWZflz+gtCcLogs42R/1eT+Kj5oH/QSkU9eEZpR7L4THUU3W0HXs=@lists.xenproject.org
X-Gm-Message-State: AFuF++ksJy7Fvj0YCkc7Ooc9Y1bZ70Im5vwyzWCp78wcUtzhyoqQCjH/
	ZXyXWuC9Gb+DFe9XrX9oUsk9JzJ8lJMCq65NwRHOrMj55rwyXBgKOBfJiBdvX1bKbA==
X-Gm-Gg: AYBFou2sOh1SPOEzW5HZ3E8aiV4Nuk7kmF/9dvmkEkRfVAMLYrza/0pVzlyEm8ZJzFc
	LCWjeaohd613BhdVC9BE9UY8WMKVa9cFiQPH1ckuF72bQItUXmeE4nOAH2WcWaxfv8kAMMUDEcn
	v7YYSr1esFUbLysJOcyIq6lP/8Q8U3WZpi78dzOolEM678IzEJlQ7qzi5ALuG1+YGjMFcszeK42
	33EnxBnQX3W64OU31xV1iH179Oshq65d6bSwcq4QzrM4vRRbXqG0cNX0G1k9xjuC0LUwoXLxXQH
	ofrep08tq0wAeZ149Ku4/TYi+ATJObs/BidlgvOFEMl96uGmlmo17vSEsGcj5KB9p2cXdwNV5EB
	Aci97uM+ZUjsbbQsleHsQdRP/V3p4tk39uM+cFd+9xwb9STMtFxfTgDu3ttSVVa3wUvmmE2OSG4
	re5nJvLSb8NTMAx7QGAdaceI3r3f2trsX6oT2WSgPbCo6cpFS3p2rcGzGzecphzSGUz9BjsX7w3
	N0zKMpk18ZlcLXIYDxmJn8jms3DovDTKyzA4kfrsfj0olxXsyHb9ijZb73cWc3t+L4nc1guZA==
X-Received: by 2002:a05:600d:4449:20b0:49d:3a:e576 with SMTP id 5b1f17b1804b1-49d003ae639mr195365485e9.5.1788935397190;
        Tue, 08 Sep 2026 23:29:57 -0700 (PDT)
Message-ID: <1aacf944-6de7-4f81-9ee1-0c0b266c5f2c@suse.com>
Date: Wed, 9 Sep 2026 08:29:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/arm64/atomic: Clear exclusive monitor on cmpxchg
 failure
To: Ryoji Okamoto <okamoto@valinux.co.jp>
Cc: Hirokazu Takahashi <taka@valinux.co.jp>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <20260909055238.521966-1-okamoto@valinux.co.jp>
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
In-Reply-To: <20260909055238.521966-1-okamoto@valinux.co.jp>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c1860d/1788935397-DF8D587B-3C24E9D0/0/0
X-purgate-type: clean
X-purgate-size: 1014

On 09.09.2026 07:52, Ryoji Okamoto wrote:
> When the value comparison fails in atomic_cmpxchg, the code branches
> out without executing stxr, leaving the exclusive monitor in the
> exclusive state set by ldxr.
> 
> Add `clrex` to the failure path to explicitly clear the exclusive
> monitor.
> 
> Fixes: d2654a556835 ("xen: arm64: atomics")
> Signed-off-by: Ryoji Okamoto <okamoto@valinux.co.jp>

Reviewed-by: Jan Beulich <jbeulich@suse.com>
with ...

> --- a/xen/arch/arm/include/asm/arm64/atomic.h
> +++ b/xen/arch/arm/include/asm/arm64/atomic.h
> @@ -118,7 +118,9 @@ static inline int atomic_cmpxchg(atomic_t *v, int old, int new)
>  "	b.ne	2f\n"
>  "	stxr	%w0, %w4, %2\n"
>  "	cbnz	%w0, 1b\n"
> -"2:"
> +"   b       3f\n"
> +"2: clrex\n"
> +"3:"

... padding changed to match that of surrounding code (hard tabs).

I have to admit though that I'm uncertain of the usefulness of the
new B that you insert. If CLREX is cheap enough, avoiding the extra
branch may be better.

Jan

