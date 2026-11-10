Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06D8D606AF39
	for <xen-devel@archiver.kernel.org>; Tue, 10 Nov 2026 13:29:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=QRHVXTmj
Received: from list by lists.xenproject.org with outflank-mailman.1481804.1685714 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQlul-0001pC-II; Tue, 10 Nov 2026 13:29:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1481804.1685714; Tue, 10 Nov 2026 13:29:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQlul-0001p5-EX; Tue, 10 Nov 2026 13:29:31 +0000
Received: by outflank-mailman (input) for mailman id 1481804;
 Tue, 10 Nov 2026 13:29:30 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xQluk-0001oz-Ok
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2026 13:29:30 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xQluk-0001cC-1e
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2026 14:29:30 +0100
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af31c2f-2eae-0a2a0a5409dd-0a2a4508aeda-32
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2026 14:29:29 +0100
Received: from [209.85.128.50] (helo=mail-wm1-f50.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af31c39-f659-0a2a45080019-d1558032dc67-3
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2026 14:29:29 +0100
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-4a60f9474c4so24779355e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2026 05:29:29 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4ba01fe61e6sm66461405e9.6.2026.11.10.05.29.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Nov 2026 05:29:29 -0800 (PST)
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
        d=suse.com; s=google; t=1794317369; x=1794922169; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3CEnf9ISm+pAqdXGR+GsPMALLF9N6rWMVDZURTaZiVw=;
        b=QRHVXTmjpc6mX83t5UG3I3+L9S+AncBpUfw/zWHWK7EW81G89p1YwXCiMqVLTClmQH
         eUptDmEWzEnU5dR6xsPPFYtVIM8TJQaWC9g6+LAYfuCObWV+FQwe249yQu4O5+8C9mH3
         e61M4rqScvRu9u1IPwus/c8JIshXcl9AP5wUbDhGiKLwNUs0rCO/813vjpCfyiROec6x
         BgZrSDXaSfnp8OkjAAm2TCQtIucHb249CrEJggdti4o2jKwVDS6syES0c/wMeKUfRio+
         T2dAq9kO/R/vMTBJhh9rnqptF1r/JsR3lxalgt0nYtFckIh/HW8PZP6wbyGuNuRFfNEE
         TK4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794317369; x=1794922169;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3CEnf9ISm+pAqdXGR+GsPMALLF9N6rWMVDZURTaZiVw=;
        b=0r6Jsgk0uKEmmT/6LljnbeKJaw9vqaCWpVmL4L9UwO9WA6tvFVFTOlr9GvQh+ZQ+3j
         RyhOn8SjBFC3QdMqBmhlWQVsroNZ7FsMW21pIqwlOM3f6aY4qH+6c+zAQ94/tKk2zP96
         AjOsoBl9CkRxC/M02yAg5tztzyig2oCQUod2EDNopQEtLa6iDQiOqyvH/fur2/qfaSb9
         MamHg0I0bEtP7YmyA7mdifXbtJWBatavLCYG8xUMnfjE1jsGE1Im7XD1JwQXHgqIO40O
         ScYsuQ3X6ddzvCSd//twO6fZhNRlI6oZUZY/owvKtbQ8PDNtko31hE5vNGKqi9AMMCmp
         ryEw==
X-Forwarded-Encrypted: i=1; AL+hErGDroLTlD50jMXZF/H7PFIV9xmz3st12FSAqhO0pG24ET4MXlt+fEssABJQ8trzUIKFetyIQRmjW/U=@lists.xenproject.org
X-Gm-Message-State: APuU4Z982/13lu9R/U5bYLlIHweqyr+3GqTJFs1llf4ZzMPnwrPSP1QE
	zDTaOPqlyJ6xQbfaOjuKVbtNedxbTmEhbgBOXxIMrpi7MvBse9pw47uQyZsoQht0ZA==
X-Gm-Gg: AYBFou2s66ggeu1iH4qBXTsdXM8AkC2ri3f0ouSpvO9gGZd/2dAhHN9jHoX1Hdgke/o
	9hcbm+5u5u4jzbmIiFCkxZImhYAGhYlVUIXssWs6rUGeIWFDCwJ73ulgFshUcBJheWn5zmiW/Tm
	7pSzODyjW9jf4DgIfzyr3tzM3nQLNQPrNKiaZCLwLEWZj2cmtNQ5cWKpg51IT29MnzjSYHsuqCl
	PC5jQPRZVo6chuH4KHwcDocKgFoT8maOVcfevhH9QqcyX3wFHa0bi0RPr5InJZPZMf+035Sufq2
	YaAcm5rGvz8aYh7tOZqZC7V9sIfZLivSPpk19F24p0QBvDKGRmg5UKIFD3PRjHclI8eypZ3p/9U
	Z62ZfSx8JYX0tVGDrUL+mn17dTYkWP2un7rko6VsEkiOU6XrMqyRrBtEf+6Anck1dw83MG/EJbJ
	ZRv23oAlhym3SlL9WRe3mWkDE8qbRZNoigPCAoks6LNYYrJdqcWVwGXduRlaqZS3KnC4PPIrbb0
	LWFTqoUE5mesYVC4dCAOijhzgLMiqHzm44W6ou2UC79pikMAME/hnThZBmgOPY20TrOMxgTKqW3
	xvA5NM9nuo7RzpPAi+dBHP4ReQAB77JcyT2+YsZv5DfJYEkatotx5RSLBOmPfdHs13wNTmhhNqx
	bRuBk6jVY39AZqlKF
X-Received: by 2002:a05:600c:4f4e:b0:4a2:10f9:37ce with SMTP id 5b1f17b1804b1-4ba0233e9dfmr50612105e9.15.1794317369391;
        Tue, 10 Nov 2026 05:29:29 -0800 (PST)
Message-ID: <93875740-8661-41af-b4d9-836a4ae85dbc@suse.com>
Date: Tue, 10 Nov 2026 14:29:28 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] automation/eclair: deviate R2.6 for the x86 emulator
To: Shuaidong Chen <shuaidong.chen@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Alejandro Vallejo <alejandro.garciavallejo@amd.com>,
 xen-devel@lists.xenproject.org
References: <20261110132442.2891216-1-shuaidong.chen@amd.com>
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
In-Reply-To: <20261110132442.2891216-1-shuaidong.chen@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c1860d/1794317369-CF15E87B-29F4A115/10/78276251493
X-purgate-type: spam
X-purgate-size: 1812
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 10.11.2026 14:24, Shuaidong Chen wrote:
> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
> @@ -55,6 +55,11 @@ removed by the compiler, the resulting slowdown is negligible."
>  -config=MC3A2.R2.6,reports+={deliberate, "any_area(text(^.*__maybe_unused.*$))"}
>  -doc_end
>  
> +-doc_begin="With CONFIG_HVM=n the FPU, MMX and SIMD parts of the x86 emulator are compiled out, leaving labels with no goto targeting them, many generated by the CASE_SIMD_* macros.
> +Annotating them would only add churn to the emulator, therefore it is deemed better to leave such files as is."
> +-config=MC3A2.R2.6,reports+={deliberate, "any_area(any_loc(file(^xen/arch/x86/x86_emulate/.*$)))"}
> +-doc_end

Both the doc above and the one below specifically mention HVM=n. Yet the
config= doesn't (and can't, aiui) limit things to that case. Imo either
the HVM=n mention wants dropping, or this deviation wants putting in
place only when actually HVM=n.

Jan

> --- a/docs/misra/deviations.rst
> +++ b/docs/misra/deviations.rst
> @@ -116,6 +116,14 @@ Deviations related to MISRA C:2012 Rules:
>         such labels poses no risks.
>       - Tagged as `deliberate` for ECLAIR.
>  
> +   * - R2.6
> +     - With CONFIG_HVM=n the FPU, MMX and SIMD parts of the x86 emulator are
> +       compiled out, leaving labels with no goto targeting them, many of them
> +       generated by the CASE_SIMD_* macros. Annotating them would only add
> +       churn to the emulator, therefore it is deemed better to leave such
> +       files as is.
> +     - Tagged as `deliberate` for ECLAIR.
> +
>     * - R3.1
>       - Comments starting with '/\*' and containing URLs are safe as they are
>         not instances of commented-out code.


