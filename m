Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0E34C55822
	for <xen-devel@archiver.kernel.org>; Wed,  5 Aug 2026 08:37:47 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1383016.1626269 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrX86-0007z5-7g; Wed, 05 Aug 2026 08:37:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1383016.1626269; Wed, 05 Aug 2026 08:37:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrX86-0007yy-5A; Wed, 05 Aug 2026 08:37:38 +0000
Received: by outflank-mailman (input) for mailman id 1383016;
 Wed, 05 Aug 2026 08:37:36 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wrX84-0007xU-1Y
 for xen-devel@lists.xenproject.org; Wed, 05 Aug 2026 08:37:36 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wrX83-00BHWz-E2
 for xen-devel@lists.xenproject.org; Wed, 05 Aug 2026 10:37:35 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a72f647-e002-0a2a0a5209dd-0a2a4502e3b8-34
 for <xen-devel@lists.xenproject.org>; Wed, 05 Aug 2026 10:37:35 +0200
Received: from [209.85.128.47] (helo=mail-wm1-f47.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a72f64f-6ca4-0a2a45020019-d155802fbcf7-3
 for <xen-devel@lists.xenproject.org>; Wed, 05 Aug 2026 10:37:35 +0200
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-4921eed3fa2so5468145e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 05 Aug 2026 01:37:35 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49949fcb0c5sm142089105e9.4.2026.08.05.01.37.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Aug 2026 01:37:34 -0700 (PDT)
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
        d=suse.com; s=google; t=1785919055; x=1786523855; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=paXBUFX35ESCakqZniHvS5VX9ri+1pb6qV9fxpbxAvA=;
        b=WDoPQLN71qNMTw3HQM1k8wrovR2z8Ny6b4chreQid9+xz0q/M9sp7Pf6U5By8jDa5k
         GMbqyj/G2YhlQdN58bXd5G1KrHORRMUqUArEIs2o35vxqvkGDCAriOkhS6qu/1CwOVnc
         8XgmEnXKtzFNoCDQFNfzroBTme1MjLZpx/b8XErpSdDfz5vYfA7o1QVT1lorV+TRf43Q
         TQKDJaW9n8SNljpfekr/BfQmWrgFkDl4ufOe+ErLRFnAmvFSAbJ3ns6pBS7kJlrFm+Of
         6YPwAUtQIzwcyy/bg1NSC47BzZjDCpTyX3ZibIbb/Q22HuL29QIrfsxGsdkwQ5eALzNd
         x6rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785919055; x=1786523855;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=paXBUFX35ESCakqZniHvS5VX9ri+1pb6qV9fxpbxAvA=;
        b=WQOQlklx7bYAMf/FcVQ1phi5uOPUhEKu+iwJhdvQuwgp78FijHcrEqb4f/NvxDD9i8
         L0LovVyoXA9emR2MoGhVijCwiIEWf/yS2qF6lygLgKJHu3mZYU3UEKhFn9jtqF61ixtF
         u1NejSykxXG0o4TnhG7erZeZr2o/SdS+3qNUTSh/oEnq0TuEnGgHR+OjLFQcVjYRIROu
         BuNyvBaBKGtKDJNSvH/m9+R75mW+1bFWac4qu6hKSks39y3Oa/mzftiMUjrwQu4NW+e0
         uBNma9N7rDdvV+HtcNcwmEhhZnCE0yKh/YRMv9dkOuCC2GQH4B9zchK9IBRqW8Fvkebj
         j8hA==
X-Forwarded-Encrypted: i=1; AHgh+RoEKaOzhz0ZO7R5jitVPKpr9lUJ44ghCl/LUJCO11vetP5oyNXX9TGNC9gnFI+bup9v8CFqLxDb9+k=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzmobcZagVCtWLCKmGGwU2E5zQ+RDat8GZNOA/ajAGVn3CLcVs5
	u4ko7EriXPW+qziub3887mDCEjKpKFMx+G6TMvCDm6Y2ATSvHRugf+XdTvD+WGHOkA==
X-Gm-Gg: AR+sD10rBDBsElnvtFn/I2Z+UMqVanfa9QcOyqaInTgBTy2jUWVX0q2mBtAyOqGuyVT
	R9PT+V27LsPEqHXCYYqZBf854uwG/Q79m1Vu9ftVKXP8RM8qHibr26C2SWxaRODFN4XVt0qn4PB
	A9DANvxBAfmxhajwMAqxRedfdXTkUnJg/nkH70lnOTg89XZOjK2/hF8apDepGBTF0ulUnfh6b6a
	r9aISAo27iXql8JfJXK7zu9CW/kTNRRo+L3aDKoGPtun6lqcoCYO9+l7mbFTUthiYA4l+vYt572
	sJj0XzAs10LDB6fUyVTpYFdhRdJIdvlrgbCTFWRzwDmMyTnwwgz1cyy6gBwp2gDD06Ils9btu6f
	C4M/G5n+43XV5ivRD7DVgz+gPYiRzxYJ5abGdmFbgadaBUQfx04NEJZGVc0iZ2EwxewqlvX4jfn
	bjsY/36eYeoA6Xf1yyJVLOdDHImZRSUGPdlIeoVYCaQqOtA6vCfaN4S54xsGCza9+XfVLZsr/pg
	2hspXlsHBWOBUsyP8QJMJhkLNDclBzPuq6g08Bh2cZMwHESmL0RZ58rF8V+pwc=
X-Received: by 2002:a05:600c:8b35:b0:493:c634:952 with SMTP id 5b1f17b1804b1-4994e79e668mr52852615e9.7.1785919054873;
        Wed, 05 Aug 2026 01:37:34 -0700 (PDT)
Message-ID: <08441834-6087-4cfe-8d56-ba660564384e@suse.com>
Date: Wed, 5 Aug 2026 10:37:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] x86/xen: Remove redundant config dependency on
 X86_LOCAL_APIC
To: Juergen Gross <jgross@suse.com>
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>, xen-devel@lists.xenproject.org,
 linux-kernel@vger.kernel.org, x86@kernel.org
References: <20260805082137.1214967-1-jgross@suse.com>
 <20260805082137.1214967-2-jgross@suse.com>
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
In-Reply-To: <20260805082137.1214967-2-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-720697/1785919055-F38BC2AC-E256C409/0/0
X-purgate-type: clean
X-purgate-size: 406

On 05.08.2026 10:21, Juergen Gross wrote:
> CONFIG_XEN depends on CONFIG_X86_LOCAL_APIC already, so the dependency
> of CONFIG_XEN_PVHVM on CONFIG_X86_LOCAL_APIC can be dropped.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

I've been noticing this every once in a while, but it never felt quite important
enough to make a patch, sorry.

Jan

