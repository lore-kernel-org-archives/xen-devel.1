Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B0AACA600A
	for <xen-devel@archiver.kernel.org>; Thu,  8 Oct 2026 08:41:05 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1443054.1660432 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xEjgJ-00010p-GJ; Thu, 08 Oct 2026 08:40:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1443054.1660432; Thu, 08 Oct 2026 08:40:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xEjgJ-00010i-Dh; Thu, 08 Oct 2026 08:40:51 +0000
Received: by outflank-mailman (input) for mailman id 1443054;
 Thu, 08 Oct 2026 08:40:50 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xEjgI-00010c-0f
 for xen-devel@lists.xenproject.org; Thu, 08 Oct 2026 08:40:50 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xEjgH-00Ab0I-DZ
 for xen-devel@lists.xenproject.org; Thu, 08 Oct 2026 10:40:49 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ac75707-8faa-0a2a0a5109dd-0a2a4507cb80-32
 for <xen-devel@lists.xenproject.org>; Thu, 08 Oct 2026 10:40:49 +0200
Received: from [209.85.221.42] (helo=mail-wr1-f42.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ac75710-b4ea-0a2a45070019-d155dd2ac8fc-3
 for <xen-devel@lists.xenproject.org>; Thu, 08 Oct 2026 10:40:48 +0200
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-48c4d870d54so1771051f8f.2
 for <xen-devel@lists.xenproject.org>; Thu, 08 Oct 2026 01:40:48 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48c75b4e399sm8936643f8f.56.2026.10.08.01.40.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Oct 2026 01:40:47 -0700 (PDT)
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
        d=suse.com; s=google; t=1791448848; x=1792053648; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4vMvz8pjS1xywNZLHwQXBMAQcuHHZcZfe8Xkd/FjYQk=;
        b=Dr3O2QAsER61ogBpvkDiw/YiUWkpGduOlzbbsVrdc5UFYo3a9xMsNCXnKZQ8T0vp+Y
         3Vrifek4EDdIBP2bG/VTd80laHfx6z09HykiNx3Gmd51LHJIfvnfGgrlOVVSab3SJjX6
         ghLyCWtQ2phv0UxXFKxRl1Cm0Ci4wiILOYm7ZPuK1fyiEkXSxHw3b2LF/kpfi5vjTgtk
         wPgON7HLMDtEU1rwup6ajuwnoynEds5dZ5GzlGgY/BCIgJ+oajT9iIlqZdDoC85JBwHN
         BJjEyMjHlAriJY4JI7gFdTXl7MXn0TSUkBy0AEB0GMUDeSh0kjDxFhzA3zAhju6SYU+G
         JvAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791448848; x=1792053648;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4vMvz8pjS1xywNZLHwQXBMAQcuHHZcZfe8Xkd/FjYQk=;
        b=SWY00Aj3kLNLG8BdLl94wAmtcpV3dd9rDdfU9Oww3cuBjK4JCOE/NQeXeQrNr7eMyy
         6LuqZLXa9uT9I/ZLtUxKa8SZCNhAakyzJMhadd6iwqH4XjuYbOTdWP92K0KFCengSTmI
         PANF8O/qqdey9ZEsp2sFVMbzDfDn9ylcjrkh1BUa69yIeE8MFHPz3qWkhl1EYRYUPN3R
         CXQbN3wSCfzX6SGeF/4b/anw0cSklKffRyKXshEbzaxNwg4wD3pdirqoodTBEpr8/yi6
         7OrH6dZXqlQrOIeuypu4rXpptvj3auIdkrSQmRPlvTXNJC+z3PUzjsg94c8kFwUs/zDp
         SZBw==
X-Forwarded-Encrypted: i=1; AKwUvBzoslxl6gW511rU+rXk+th3OC8OtKe0JoYWW9pYkDe+TnUE0lgTK7BtjZqDtOZeP58Tltizp3HfE1c=@lists.xenproject.org
X-Gm-Message-State: AFq9FYJWG1sDejfoUvgEYwUN5yRiNHJ3J6fzp2+fHIL2BeR6Z4q8Udb9
	SOOy0GuJ17kySQl6NC2dqmYfZ9LtXtGE0QqlEEtlSjlFhs8SJt4SkezX7Gziv610Dg==
X-Gm-Gg: AYBFou3KQ6i7/fNJYc8z3Rzg3VUU5bqO4c6LqBm9Ilnywf3Z+1zF5qBYi0PPul/WR3P
	YH4PzOUaVqc4VjTF/uV0YAx0QCl7BH62r94ATw5Ve9gj0xr41DvYEftcRItOWp5gz+FIP8TnT8i
	NfRUU/IOBQzMfvgFCSnA427okUCqlrUzPQqGDjDB3mMWz+Qcy9cXAQMbOzLWfpH89PLv9KOLsIs
	geDDcNEtn1Vdt3jdal0xDdzfbPkC6OztKqmF8PD0PGxyUKyjoFfmqHzHkWsQmLLAomKPP1ZbKlw
	Z8F4LB7RthtbTmD6eh0nxVK+flMRFPuY95kAQQRV4r/p0VgK1500OpBVHxxv+fj1GGb3Jtg9ByI
	oiTFhhpfJSvhyVH37G3VWaUCLCfl4D4hoRsaB//ldM9/t8NOrAnERgOe0g3B8uB7g0JYQK7UCUr
	zT4xxlF+6qb2GGgv+eh1KOeT+riG/mt2B1T9PXTbQHx5OEzNt2LTGMLPk6sm9J7RhYgqrru3LVI
	Cff8UOhUVtQL4IBmja38NllSij5KnYExTwGaJH4/i6qUdL2kjncbhfvdogPhQ==
X-Received: by 2002:a05:6000:1846:b0:48b:d17:139c with SMTP id ffacd0b85a97d-48c728858b5mr9256437f8f.51.1791448848142;
        Thu, 08 Oct 2026 01:40:48 -0700 (PDT)
Message-ID: <7bced27f-5391-4120-b9cf-b97bb88758ca@suse.com>
Date: Thu, 8 Oct 2026 10:40:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 07/18] x86/hvm: introduce per-vCPU L3 page-table
To: George Dunlap <gwd@xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Teddy Astie <teddy.astie@vates.tech>, Tim Deegan <tim@xen.org>,
 xen-devel@lists.xenproject.org
References: <20261007104051.48841-1-gwd@xenproject.org>
 <20261007104051.48841-8-gwd@xenproject.org>
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
In-Reply-To: <20261007104051.48841-8-gwd@xenproject.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ef75cf/1791448848-368D9AE4-E0DF25F5/10/78276251493
X-purgate-type: spam
X-purgate-size: 1078

On 07.10.2026 12:40, George Dunlap wrote:
> @@ -1835,7 +1853,7 @@ static int promote_l4_table(struct page_info *page)
>      if ( !rc )
>      {
>          init_xen_l4_slots(pl4e, l4mfn,
> -                          d, INVALID_MFN, VM_ASSIST(d, m2p_strict));
> +                          d, NULL, INVALID_MFN, VM_ASSIST(d, m2p_strict));

Nit: Take the opportunity and re-flow the statement (i.e. move more args
onto the 1st line)?

> --- a/xen/arch/x86/pv/domain.c
> +++ b/xen/arch/x86/pv/domain.c
> @@ -127,7 +127,7 @@ static int setup_compat_l4(struct vcpu *v)
>      mfn = page_to_mfn(pg);
>      l4tab = map_domain_page(mfn);
>      clear_page(l4tab);
> -    init_xen_l4_slots(l4tab, mfn, v->domain, INVALID_MFN, false);
> +    init_xen_l4_slots(l4tab, mfn, v->domain, v, INVALID_MFN, false);

This being PV-only code, don't you want to pass NULL here? The description
talks about this, but (a) it's not quite clear why PV32 would want handling
differently from PV64 at this point and (b) in sh_make_shadow() you do pass
NULL unconditionally.

Jan

