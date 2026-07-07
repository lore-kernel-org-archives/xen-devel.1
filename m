Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA823C43458
	for <xen-devel@archiver.kernel.org>; Tue,  7 Jul 2026 07:16:48 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1355978.1610642 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wh02W-0004Xf-1G; Tue, 07 Jul 2026 07:16:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1355978.1610642; Tue, 07 Jul 2026 07:16:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wh02V-0004XY-Uo; Tue, 07 Jul 2026 07:16:19 +0000
Received: by outflank-mailman (input) for mailman id 1355978;
 Tue, 07 Jul 2026 07:16:19 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wh02V-0004XS-HE
 for xen-devel@lists.xenproject.org; Tue, 07 Jul 2026 07:16:19 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wh02T-003VtO-UC
 for xen-devel@lists.xenproject.org; Tue, 07 Jul 2026 09:16:17 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a4ca7bb-2eae-0a2a0a5409dd-0a2a4502a75a-48
 for <xen-devel@lists.xenproject.org>; Tue, 07 Jul 2026 09:16:17 +0200
Received: from [209.85.128.49] (helo=mail-wm1-f49.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a4ca7c1-5a27-0a2a45020019-d1558031e125-3
 for <xen-devel@lists.xenproject.org>; Tue, 07 Jul 2026 09:16:17 +0200
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-493c83474ddso33841375e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 07 Jul 2026 00:16:17 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47a9e4d7801sm31946739f8f.16.2026.07.07.00.16.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Jul 2026 00:16:16 -0700 (PDT)
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
        d=suse.com; s=google; t=1783408577; x=1784013377; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Mjb/c/myA+tuD/YBBTtZR4yJa0PaQQACdHd1x/OrSzk=;
        b=NfYHHr8FVu7S4ENGdNqjlhcphEuyu3xsuk2W0eNcce2g9FV95NMoTHxvbvHFZHUCMy
         bln4B7JnSKnhOPasGs95ckg1jy6/lsZCHRdGHuPvKtiIyfcYR8QQZuQUG22Kf8L1YlyQ
         Ru38VxWcJDzehP6c7FMw7eT+HrCpbG0KYLC1YVbUPUJJk7aqBlA/PNTClJR4kGJkf8o1
         p3KeaCD1ZtXYusCp951qcvbjEBWvROxneSQouXRshYZEYjnbphdHldBPKyb/7SGzjaHC
         kCZzep7KRrNxfuOaMMAk1XVr6SV2cRQXEqoJLI6FDcH+XG24pTYVHuVSsPzPK/4Wzk57
         gVOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783408577; x=1784013377;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Mjb/c/myA+tuD/YBBTtZR4yJa0PaQQACdHd1x/OrSzk=;
        b=ifDDL4CFnQY9MeiSFtbTS9UTOdJz+4030duWZ3++DnbXdGd2KDKE6HW4/R5LWv6pd4
         Ge74mBue+fn157fTR+FaX+cm2nyOWGnr85/77s5rrJv00hduW1DzrKiQNtbeJ52tg3To
         n+Y2lZjU65rjKdYkah186qCGVAEzUqxeu6VIY/qa+nc9fnKWRpQSdygNsuZFKlWqdXG9
         EgZspxcuujltoeTz8agGcO3I+QC6qfkb32tqgfWgNwLTvMSE513U918cEa09URtTeqDg
         UBYPo1zD8BZcrAU2Z1GS+g3EGBM7XN7dZTVDcBU/30XB6HVhWybAjOBOuV76BjUQudgL
         OtzA==
X-Forwarded-Encrypted: i=1; AHgh+RoPduFrnPnA286rdkKv0sPHAGYTGgtY2ZkvpoHenDIg+D8AiUEyy47PVBMy01sL3VZPgsP3eJTJuRM=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy39a+IDaxa75PmoRZFtjM2GbIyVKuheGZHqbZWR1Ot9vcTvqfT
	ha9/GGjyhOuOVs43Wnsk5+xSSE92TtRx04M8sspYurOxawASwSer4d115N5YE9xD+g==
X-Gm-Gg: AfdE7cliMq1RjJfgxzSDn97ZEovM8jyLAB66vlAMmmTvFnL/DZz4d2N8uzqcb1DYXxf
	UiL0TrZV/6L1xNqHaLYy2k6dh/6KHYSssYSavXUm1pi0SLlV78fFy94sP5kw5cee5jTBQvBow5+
	XfZW8mf93jTRc+8j9zJZOQrfHu99oHbzrXxJ4L5E+cmufBoT2Q73d1xIJO8L/QK6rLJJYZwXkwd
	WPgP1wJ62NBBppyAaq1yf1lyTzi+AuiedfGYjbdOgsx/UWI6/kfxzreKfwz6k5k0T3oHV8nRaMQ
	G2o56EcjFJTrV0hvMw/pBCnxtXujbFNxzUzh8UCbpaoXkHYUa3p6XtVkcmkN9E/+EW5bTE8kZSn
	NXLkGbD8IYAzYDp3F9Or2T4etlLj87+Lz4Z27S4k3FMxmsY7XuQW5BDRcSbw2kPusfMOWrnl/S8
	BikqEE7ez7njpA3kWNupQw7QeiKcFjByuI/TvyTr6eJgh8BIVfJVXw5YdLTNOYJGUF6PViM03Fh
	aXq
X-Received: by 2002:a05:600c:8b6f:b0:493:a7bc:5bcf with SMTP id 5b1f17b1804b1-493df08cf98mr39971585e9.24.1783408577217;
        Tue, 07 Jul 2026 00:16:17 -0700 (PDT)
Message-ID: <6c4bb5bc-be27-4eef-a08f-1dd96df81304@suse.com>
Date: Tue, 7 Jul 2026 09:16:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] x86/entry: Use PUSH_AND_CLEAR_GPRS and drop SAVE_ALL
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20260706153415.1264750-1-andrew.cooper3@citrix.com>
 <20260706153415.1264750-4-andrew.cooper3@citrix.com>
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
In-Reply-To: <20260706153415.1264750-4-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-720697/1783408577-545187C5-AF3D03D8/0/0
X-purgate-type: clean
X-purgate-size: 1560

On 06.07.2026 17:34, Andrew Cooper wrote:
> PUSH_AND_CLEAR_GPRS is shorter than SAVE_ALL in terms of emitted code.

Could patch 1 perhaps also gain this sentence?

> lstar_enter() and cstar_enter() do not need CLD.  The SYSCALL instruction
> sanitises flags based on MSR_SYSCALL_MASK.  For all other cases, place the CLD
> instruction next to STAC/CLAC so the flag handling is together.

And really the earlier the better. Relevant perhaps for early_page_fault(),
which has no CLAC.

> Get rid of the compat=1 special case for PV32.  It's not obviously a win, and
> PV32 is getting increasingly rare these days.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

> Bloat-o-meter reports:
>   add/remove: 0/0 grow/shrink: 0/12 up/down: 0/-518 (-518)
>   Function                                     old     new   delta
>   symbols_names                             135277  135276      -1
>   symbols_offsets                            53664   53660      -4

Interesting. Likely an artifact of padding going away between two functions.
Which likely would change again if the SLS patches would finally land
("x86: guard against straight-line speculation past JMP or RET in assembly
files" here in particular).

Btw, as it occurs to me while mentioning SLS: Judging from the patches I
have, IRET looks to be immune, albeit I can't find any statement in the doc.
What about ERET{S,U}, uses of which we've gained only relatively recently?

Jan

