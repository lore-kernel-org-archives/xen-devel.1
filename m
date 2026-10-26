Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2DD6606A31A
	for <xen-devel@archiver.kernel.org>; Mon, 26 Oct 2026 11:13:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=INwc0z6p
Received: from list by lists.xenproject.org with outflank-mailman.1461132.1672094 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLIe3-0000it-Ro; Mon, 26 Oct 2026 11:13:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1461132.1672094; Mon, 26 Oct 2026 11:13:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLIe3-0000im-Oo; Mon, 26 Oct 2026 11:13:39 +0000
Received: by outflank-mailman (input) for mailman id 1461132;
 Mon, 26 Oct 2026 11:13:39 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xLIe2-0000ig-Vl
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2026 11:13:39 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xLIe2-00DiwI-8n
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2026 12:13:38 +0100
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6adf35bf-bab6-0a2a0a5309dd-0a2a4509e6ea-44
 for <xen-devel@lists.xenproject.org>; Mon, 26 Oct 2026 12:13:38 +0100
Received: from [209.85.221.41] (helo=mail-wr1-f41.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6adf35e2-be1a-0a2a45090019-d155dd29d006-3
 for <xen-devel@lists.xenproject.org>; Mon, 26 Oct 2026 12:13:38 +0100
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-48e20ed3b9dso2600377f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 26 Oct 2026 04:13:38 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e3ebd48fasm15816506f8f.31.2026.10.26.04.13.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Oct 2026 04:13:37 -0700 (PDT)
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
        d=suse.com; s=google; t=1793013218; x=1793618018; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NQEqAWQAVAbqs2L97mpoqqquPJquF7CTY+1JaDokM0Y=;
        b=INwc0z6pqAotxllcsOdbRj+pn+gUqdHA+/rQQlpe1kDRUIkjcL5WVQvVgkNULJgO6T
         dZXSnS38qElXaJCrVfXwIgB+GN80lbmXWGq837G/3lhk8W4SwC7DLaOrWqKIAPD4W+TR
         H4S7bWxHdXiqrRwG+yaa+Wn6RPnJTsYwKzJvISz/EjFx20kJVC7luJN1oNCkUxwJZCIW
         F6eeL8H/9BEFiW09Nu/hA4nGkMVgGhCyj8ZnfPOyEMhnYI90A93f1zVPF0ugLCqhHxiv
         FwtSvWk7g+zOCuHvxw2XvhdydbrQmat0tj/cNiNWg2tDQpH9OGVNALrkwGbUlwNs8w3O
         iY6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793013218; x=1793618018;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NQEqAWQAVAbqs2L97mpoqqquPJquF7CTY+1JaDokM0Y=;
        b=yArMecOktnUiu7jd891S1zvXzStOCiJz+28YdREUBrlHeLJNOayCdeYpUneX0zIjmB
         bgj36bm7+ERNsNctEpl6o5UmB4JOQ11dXVZlARMoarj8EgRdOo5jzIHJ88nn159U33rG
         bk3ow+jxFVG16v/Sif5SaLBWHShfySUHqdqdV+CwPqFTVXQi3xZVZRDarRx5GABCoWce
         4TmAsXGrFekcJIm+DjyoaWA3PXxDn4VVEpfn+pmaJBg4TeSCSqEubexufBa9+sx+X5PP
         t71L0mjNWEl2VpDtQTLaWo59czAY9aOagQvIg2/eoNehxNWFGAdCwpr2W1L0QH1ZXKsQ
         b2fg==
X-Forwarded-Encrypted: i=1; AKwUvBwuxxCj/Fnlc3Rt0th+IvupnGAX7icHWqaZ8SIAtmvISxQP+JDsbCa93fy6JFTC58u10LH/xLyV5OY=@lists.xenproject.org
X-Gm-Message-State: AFq9FYJMjGVDYG0FmuVKMXQ6PKb0dcPX/qRCUsF1uxH920NM0+ovwO+1
	Jcuban1vTEH+mbmdcaN9cyo2DuPP/ThqblBwfPx8NL07bKsi+ng2JGw9/EtT5yNUQA==
X-Gm-Gg: AYBFou3x127UJQVnSo1DwU7EbPHDky5uOW+/Ti9r+rhHeZzZibzGm1UwoMAAOO2HCCm
	3RWVqw2xGyoVioPw8dbSYkOc9s3ExLCIClkvklq4/anbkeRP6NiTl5knNKVQs2eMSgIeNBxOieZ
	HzksqxSXDIXeGzngkfPK3KYoLA6C9S+T9UODBR3NrwMbnYbFL1DMmwphZzyuY38j0rJKt62opAS
	r06OWBvAC9m1Z9Tef7N0MZbOwflqvuMTPYXt164vCHAdWDmjdoipygF1HXtAXablXjYebGqK/OL
	depy/cxSDOteHHeB3SB7wFTjZapxzXwpwU1hKfEmqluk/X9KelwJT9xDEV3FC9Py87OIvXPt358
	htrcayewOBd2w5NZfVB1kkHnZpYpeiV79yCAOdu6Sn/IF5zfIcHnRqCtzjH1aQ4Icc961A5pAyW
	ZTrFx55do9ChANe/WM83CvRMOxxoK4e1LnCxtkwLcDi7y+opIsvAo0zBvEhOBq1WXpE8QOf1/62
	Acxk97DBBocfxIdowhmov6XcivXZwIeNcaqRPCFviwLFJxf0TIVSbcFlEBcZTXyDgGsDDAgb0Mt
	kJLir4riUw7QM+wR2QLbKg4xEYjJTGlg0wJAple7zSic
X-Received: by 2002:a5d:4886:0:b0:48d:f460:2c62 with SMTP id ffacd0b85a97d-48e3eb8c120mr8654988f8f.33.1793013217544;
        Mon, 26 Oct 2026 04:13:37 -0700 (PDT)
Message-ID: <83187933-b4cd-46df-b428-368d6f71cfaa@suse.com>
Date: Mon, 26 Oct 2026 12:13:36 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] misra: deviate MISRA C Rule 10.1 for boolean operands of
 arithmetic
To: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
Cc: Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <a536212d9cb18b5c23d06c1c06b9a8ae03941440.1792428626.git.dmytro_prokopchuk1@epam.com>
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
In-Reply-To: <a536212d9cb18b5c23d06c1c06b9a8ae03941440.1792428626.git.dmytro_prokopchuk1@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-bad1c0/1793013218-FC610034-D738E71D/10/78276251493
X-purgate-type: spam
X-purgate-size: 3176
X-Spam-Status: No, score=-22.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 19.10.2026 18:54, Dmytro Prokopchuk1 wrote:
> MISRA C Rule 10.1 states: "Operands shall not be of an inappropriate
> essential type".
> 
> The result of relational, equality and logical negation operators has
> type int and value 0 or 1 (C99 6.5.8p6, 6.5.9p3, 6.5.3.3p5), so using
> it as an operand of +, -, * and their assignment forms has well-defined
> semantics.
> 
> Update ECLAIR configuration to tag such uses as safe.
> 
> Update deviations.rst and rules.rst accordingly.
> 
> Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
> ---
> Current patch resolves all ARM Rule 10.1 violations (actually, there were only two),
> and resolves around 55 x86 violations.
> 
> Test CI pipeline:
> https://gitlab.com/xen-project/people/dimaprkp4k/xen/-/pipelines/2963748389
> ---
>  automation/eclair_analysis/ECLAIR/deviations.ecl | 5 +++++
>  docs/misra/deviations.rst                        | 6 ++++++
>  docs/misra/rules.rst                             | 2 ++
>  3 files changed, 13 insertions(+)
> 
> diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/automation/eclair_analysis/ECLAIR/deviations.ecl
> index 6cdb10a129..8bfb1a0f89 100644
> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
> @@ -335,6 +335,11 @@ still non-negative."
>  -config=MC3A2.R10.1,etypes+={safe, "stmt(operator(logical)||node(conditional_operator||binary_conditional_operator))", "dst_type(ebool||boolean)"}
>  -doc_end
>  
> +-doc_begin="The result of relational, equality and logical negation operators has type int and value 0 or 1 (C99 6.5.8p6, 6.5.9p3, 6.5.3.3p5),
> +so using it as an operand of an arithmetic operator is well defined and well known to all Xen developers."
> +-config=MC3A2.R10.1,etypes+={safe, "stmt(operator(add||sub||mul||add_assign||sub_assign))", "src_type(ebool||boolean)"}
> +-doc_end

Why the restriction to add/sub/mul? The text ...

> --- a/docs/misra/deviations.rst
> +++ b/docs/misra/deviations.rst
> @@ -347,6 +347,12 @@ Deviations related to MISRA C:2012 Rules:
>         well-known to all Xen developers to be a comparison with 0.
>       - Tagged as `safe` for ECLAIR.
>  
> +   * - R10.1
> +     - The result of relational, equality and logical negation operators has
> +       type int and value 0 or 1 (C99 6.5.8p6, 6.5.9p3, 6.5.3.3p5), so using
> +       it as an operand of an arithmetic operator has well-defined semantics.
> +     - Tagged as `safe` for ECLAIR.

... here is less strict, albeit ...

> --- a/docs/misra/rules.rst
> +++ b/docs/misra/rules.rst
> @@ -387,6 +387,8 @@ maintainers if you want to suggest a change.
>             compilers' extensions)
>           - Implicit conversions to boolean for conditionals (?: if while
>             for) and logical operators (! || &&)
> +         - Results of relational, equality and logical negation operators
> +           (0 or 1) used as operands of arithmetic operators (+ - *)

... it's again more strict here, yet at the same time somewhat ambiguous: Are
all arithmetic operators meant, or merely those named in parentheses?

Jan

