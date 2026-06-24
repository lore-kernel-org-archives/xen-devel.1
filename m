Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29162CDB479
	for <xen-devel@archiver.kernel.org>; Wed, 24 Jun 2026 14:27:52 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1345032.1604038 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wcOZn-000256-Gt; Wed, 24 Jun 2026 14:27:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1345032.1604038; Wed, 24 Jun 2026 14:27:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wcOZn-00024z-Dg; Wed, 24 Jun 2026 14:27:39 +0000
Received: by outflank-mailman (input) for mailman id 1345032;
 Wed, 24 Jun 2026 14:27:37 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wcOZl-000243-IA
 for xen-devel@lists.xenproject.org; Wed, 24 Jun 2026 14:27:37 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wcOZk-005O5u-UZ
 for xen-devel@lists.xenproject.org; Wed, 24 Jun 2026 16:27:36 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a3be958-e002-0a2a0a5209dd-0a2a4508c866-0
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jun 2026 16:27:36 +0200
Received: from [209.85.128.44] (helo=mail-wm1-f44.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a3be958-edec-0a2a45080019-d155802caddc-3
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jun 2026 16:27:36 +0200
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-490b1bbcf3aso6194665e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jun 2026 07:27:36 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49260915286sm148486875e9.1.2026.06.24.07.27.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Jun 2026 07:27:35 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:In-Reply-To:Autocrypt:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1782311256; x=1782916056; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=EvrY+XRvya2e4tUXP1DlmyYhOvFlaRI3hQgzIgMawro=;
        b=CXc8dJdAPKPg7oxwAYyYHIDRbXMkzplu8vyKNwG+Xj2cgogSOC+iaxjAWqn/pNGpoQ
         OWJEn6BysubfsbMrHu600BQqEpnC128hMYZlCPim0MBu0HgYvoFF3qaA5yhaAW8yNnTE
         BWuQQxsm+W/6A/v2jP3/R7Dh2QvkIgvPoZahurp4o5RFWHWMcUC5pFE0pf2A9Kn2vYp4
         BjPotD0OE1H9yETBeR0hgfRZPJqWAMgRrHDaC6fLTn8tRmtqGgbqXW7lwILHlyO7GoMP
         gCst6J8DH1nQR9z1XGiDx6sMVBTEH41Meq4aHWug7a3wzXTmNQMM01hCijuCwhQW/P6Y
         Ys0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782311256; x=1782916056;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EvrY+XRvya2e4tUXP1DlmyYhOvFlaRI3hQgzIgMawro=;
        b=LPMJiKLUPKLr8UpxQNPukuI43AmJFeqbs8dX+zI+zKa8d5t5OyBUmCkejD84tGvbQM
         3nUl2pT2yf4i+PHXFUk+4mnyKKX4aJV3Ag68tan+WET2DvsPI1by5C+mMsJXDTEu1/QV
         4WvbJpzbSfNgwvWxB1iRWhuWCqH208iF61PQNs6mc64U69QmFCKFm0GiW8umorV1si4/
         wzGMswJp9rskX9GrMqY9Wi1fIFPEsQ7HriDZ+dOvRG9nPLJDw1+YtUh2CfsSF/vajEbf
         1j57ZDsrNUK9rgz7iali/LyWQVHd1vAmE4BJxzoqLX/L5ndxwQ+ftG2Ck6Tao/zLWBoQ
         w+hQ==
X-Forwarded-Encrypted: i=1; AFNElJ/SAKdteVsMU4YvDIkUyfG4LS0tO2iJCSoQ2OkWbPE5K6HX90ZT0C4AVYiV9qppOn+MgeLCMJrQ2Wg=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw7YcucM/0NYSnkj2ErZeespDun5Y5MKOOW9EMRgcjNSxB1lJvA
	NuTUAjgAFuzHUTXTZnY5wjA3S7QoeNRR7NvVDEupp1ZYYiDirnG+CTDmLrZ03LjzlA==
X-Gm-Gg: AfdE7ckf3qoZVoPlUWkzGjgk1Yf8DNrsanAtfXqqCb+Xc5RpedOHU2gcI3HqXepC2Lw
	F+QsO3aX3YXXOlc6SzSykvD0ed/QuzFQsrtwIUStiQRRtuKESFefVcBM+XuqzOj4PMK/R+Kj8HO
	mFNMYxoy1NuvW9nuklZ0F9eB2/fjvkL4nFfwSP+yXgYH/eVmn2WTEeOJx/sc/fZg+7UIJEduAkE
	zL/YWTOYVoTpcaytdrN8y6bmNDsNPny8shXtPx/zQjfYfC4oXBW80uUQtMlmRnTZflJGXXlWigV
	hNvKub5EHuIRVfhk30ebUHzLhVjhyRHddh1Fa7P7ETTqCZxr+8ncVvZuDbTqZeH9OFZZjPkAGLn
	jKSm0mczhcxmf6MWNL8PIrEHR3dWQtlRP1BZpK6HZKBDUrmuwyyMdAd97S0o4xDivXr2fljbYx3
	y/K/OxVpemkaFB1Cpg3RMKa7tapBXagEmF0ZL1PDET3njH1bfaHfMxbtXDtlip1/HDxvVzF7f+4
	XZw
X-Received: by 2002:a05:600c:c0c5:b0:492:4ff5:fb9e with SMTP id 5b1f17b1804b1-4924ff5fe1fmr199439775e9.37.1782311256239;
        Wed, 24 Jun 2026 07:27:36 -0700 (PDT)
Message-ID: <d5eb947d-f2b1-4e6e-aafb-4fc7004eadf5@suse.com>
Date: Wed, 24 Jun 2026 16:27:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/4] x86: Split .init section to satisfy UEFI CA memory
 mitigation
To: Frediano Ziglio <freddy77@gmail.com>
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>,
 Frediano Ziglio <frediano.ziglio@citrix.com>, xen-devel@lists.xenproject.org
References: <20260616172830.111393-1-frediano.ziglio@citrix.com>
 <20260616172830.111393-5-frediano.ziglio@citrix.com>
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
In-Reply-To: <20260616172830.111393-5-frediano.ziglio@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c1860d/1782311256-A273E3FC-6824E887/0/0
X-purgate-type: clean
X-purgate-size: 1430

On 16.06.2026 19:28, Frediano Ziglio wrote:
> From: Frediano Ziglio <frediano.ziglio@cloud.com>
> 
> Currently .init section is both writeable and executable, split data and code
> to have 2 sections satisfying W^X rule.
> 
> It is a requirement for NX_COMPAT so the PE can be loaded with W^X perms
> in the pagetables.
> 
> NX_COMPAT is a requirement from shim-review,
> https://github.com/rhboot/shim-review#do-you-have-the-nx-bit-set-in-your-shim-if-so-is-your-entire-boot-stack-nx-compatible-and-what-testing-have-you-done-to-ensure-such-compatibility
> 
> Signed-off-by: Frediano Ziglio <frediano.ziglio@citrix.com>
> Acked-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>

This looks okay in principle, yet I have a nit-like question:

> @@ -210,12 +206,12 @@ SECTIONS
>          */
>         *(.altinstr_replacement)
>  
> -#ifdef EFI /* EFI wants to merge all of .init.*  ELF doesn't. */
> -       . = ALIGN(SMP_CACHE_BYTES);
> -#else
>    } PHDR(text)
> -  DECL_SECTION(.init.data) {
> +#ifdef EFI
> +  /* Align to satisfy UEFI CA memory mitigation. */
> +  . = ALIGN(SECTION_ALIGN);

In patch 1 you add two such ALIGN()s, one with comment and one without. Imo
we want to be consistent - all otherwise unnecessary ALIGN()s with comment,
or (less desirable) just the 1st one. If we go with comments on all three
of them:
Acked-by: Jan Beulich <jbeulich@suse.com>

Jan

