Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4782606A329
	for <xen-devel@archiver.kernel.org>; Tue, 17 Nov 2026 12:43:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=L2fThu/4
Received: from list by lists.xenproject.org with outflank-mailman.1492383.1692996 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTIWr-0000cB-RD; Tue, 17 Nov 2026 12:43:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1492383.1692996; Tue, 17 Nov 2026 12:43:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTIWr-0000c4-OO; Tue, 17 Nov 2026 12:43:17 +0000
Received: by outflank-mailman (input) for mailman id 1492383;
 Tue, 17 Nov 2026 12:43:15 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xTIWp-0000by-SR
 for xen-devel@lists.xenproject.org; Tue, 17 Nov 2026 12:43:15 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xTIWp-004nH2-8u
 for xen-devel@lists.xenproject.org; Tue, 17 Nov 2026 13:43:15 +0100
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6afc4bd2-e002-0a2a0a5209dd-0a2a45069aa4-48
 for <xen-devel@lists.xenproject.org>; Tue, 17 Nov 2026 13:43:15 +0100
Received: from [209.85.221.44] (helo=mail-wr1-f44.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6afc4be2-195a-0a2a45060019-d155dd2cd5a9-3
 for <xen-devel@lists.xenproject.org>; Tue, 17 Nov 2026 13:43:15 +0100
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-48e47347279so2282351f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 17 Nov 2026 04:43:15 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-49c7da37b19sm28794069f8f.5.2026.11.17.04.43.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Nov 2026 04:43:14 -0800 (PST)
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
        d=suse.com; s=google; t=1794919394; x=1795524194; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7YW85bHsQuEytFr4XSsOEB+y/gSvoHX6rPYqL5E3b6k=;
        b=L2fThu/4JuGZ0alFdBJY4lSMbsHeWdcMb1nhVmiPrXm2xRAk4PvBcZozhRS5DY0PTd
         iYbIVIAm9HTGlpCna92L89n77cUVSlBG65R1p1sWAs3H4IBUH5HTJQ3mrLiM/DJWkxCV
         vxgOPifvzxNwC7LA+PBy7cWA1alSLerb/zLviw9O37l00/9NMyCAXdSiloW6vCmLfkaX
         05h2wVZ9zsmOsy65H9I87vccP/BPhW+RgDdobTHSx/szgZvUQ8LKQ7eVGPRut1HYevkc
         E0TzMjku+AAaQQm6UjPf5GoWJXK1ilwGsXP13d3fyK3K8O0vHVpHV3HDTynFJupWlFSN
         xrOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794919394; x=1795524194;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7YW85bHsQuEytFr4XSsOEB+y/gSvoHX6rPYqL5E3b6k=;
        b=nXC19LNmlhYlT0iwXg7kuBWlopwL3rcFsG3ovJzMzpXlM7dexPLgrLgAgfW11hNSxH
         znGZytQYKpiEh/hEuLlueaGp+n4+OCTzSP+Bx3mKKAR3rUCj9T8MtE/+h2341lBuM0Ue
         oZtp0ygDvjoA//gglCFcvv2G1IU/jSeLnUC+ssf1r+ED5OGXWfha89F7TDEvIPznyLkL
         P8CwyrgP5fXoSqBKpvc/E81N244lbibgtxJlwT88+5dJaQTr147zMUrMcIyNc2v0EMid
         hSm1d87liaEzBd54q8v2we7W028P3VGLSAZktPgyQ3uDfDG25YFIDFX8LvbKUF92tzAG
         cKrw==
X-Forwarded-Encrypted: i=1; AL+hErENohwB8A6m2HYhYYJc78HwlG5e67AjTeSyvkEgykosms6+xg82IikMEM78+s57GWDDDY6eIIU/hK0=@lists.xenproject.org
X-Gm-Message-State: APuU4Z/cWdPH4PFpmiHEF7LlVlUbsWAW/FQBFte8ULB0d+D5dWH6NWmk
	pli/YmyanEWySgYeeBj4nSqz2RXfqwO9IkXlVd1KspOpaAASPHxQFFjO7dAdeJiDiw==
X-Gm-Gg: AZFdTZdElh9u6RiS0fFpAUHrX2rmeypLbUjwiu4wZsG0v7oTtfCju7fbqpjQsygiyDy
	GTLdfafaOeFPhEQTKTWfITeYMVkstrLlwxsoIcl9aWVrEScQidlt283ejTKs/nxOBuTJvnUJWZg
	GqDwAvc27fPxRXLnp9H0tYxClUtOiAhz5PiD4VQolQgIfGXIIZLtUC2cUh2KQdnTU8CY2L4IVLk
	jMaU+/hhlaQnfr5eqdcnkDI4f3X2ZBgSC9Dtdo5/QhUxstvmO7C53xHBvliOl0l9/uUtfR7Kq1t
	BbZW9MZdzJjg7jFm91xPQYmBIvKkMlIb63cu5HuHfKhuCyT+jlD1EfFjkSGD9N98hQQoArSeU6B
	oeqxel/ilY/LZ8UVuyeQL+EJY8z0UNiTosrWJ5YHmYuHahi4guJT12zDXpgQBVYDjkaIMsOi93s
	a589tni9AYv2mt9C+67P2mx18RR4d7b6TSb7Dz4n4EBgLCC9Zx/vTBhsqtm0d02rywUcJfVYE4o
	80zgqhVCRuRH+svMMJihrdVYmvYBjkH/FlfGpAhB0RqbOxD+DhZX3e6GiGQQz3fAMge/ouLtGYy
	GYZfbnC2UhLI5x8FLt2z1fVTWOceORtDCQTVJlsMif6AvM3x9pqcPvEyN7ub79Xe8q0hMiY4V7G
	5IEWdp4yv+yU6xHyIeBOm5D1O7VCKKcHy9cu0eHY6
X-Received: by 2002:a05:6000:220a:b0:490:a481:7ac8 with SMTP id ffacd0b85a97d-49c71d49137mr24556655f8f.29.1794919394444;
        Tue, 17 Nov 2026 04:43:14 -0800 (PST)
Message-ID: <a3f79064-9030-4efd-9829-a408b73c81c9@suse.com>
Date: Tue, 17 Nov 2026 13:43:13 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] xen/treewide: Remove NDEBUG
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Teddy Astie <teddy.astie@vates.tech>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20261117115549.3872611-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20261117115549.3872611-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-16d1c6/1794919395-F500977B-659AC8EA/10/78276251493
X-purgate-type: spam
X-purgate-size: 651
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 17.11.2026 12:55, Andrew Cooper wrote:
> We have two ways of spelling debug build in Xen.  Reduce this down to just one
> way.
> 
> Andrew Cooper (3):
>   xen/treewide: Convert all #ifndef NDEBUG to CONFIG_DEBUG
>   xen/treewide: Convert all #ifdef NDEBUG to CONFIG_DEBUG
>   xen/config: Drop NDEBUG

While the ASSERT() related distinction was helpful imo, I don't mind the
folding:
Acked-by: Jan Beulich <jbeulich@suse.com>

I wonder whether in x86_emulate/ keeping constructs like

#if defined(__XEN__) && defined(CONFIG_DEBUG)

is actually necessary: CONFIG_DEBUG shouldn't be defined in the test or
fuzzing harnesses.

Jan

