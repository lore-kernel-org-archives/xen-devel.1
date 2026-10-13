Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BF45CC6B0E
	for <xen-devel@archiver.kernel.org>; Tue, 13 Oct 2026 08:08:45 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1446741.1662844 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGXYk-0004XD-PX; Tue, 13 Oct 2026 08:08:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1446741.1662844; Tue, 13 Oct 2026 08:08:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGXYk-0004X6-MQ; Tue, 13 Oct 2026 08:08:30 +0000
Received: by outflank-mailman (input) for mailman id 1446741;
 Tue, 13 Oct 2026 08:08:29 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xGXYj-0004X0-1s
 for xen-devel@lists.xenproject.org; Tue, 13 Oct 2026 08:08:29 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xGXYh-00ETnc-RL
 for xen-devel@lists.xenproject.org; Tue, 13 Oct 2026 10:08:27 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6acde6f1-e002-0a2a0a5209dd-0a2a450bb7ec-38
 for <xen-devel@lists.xenproject.org>; Tue, 13 Oct 2026 10:08:27 +0200
Received: from [209.85.221.41] (helo=mail-wr1-f41.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6acde6fb-b7e8-0a2a450b0019-d155dd29d5e1-3
 for <xen-devel@lists.xenproject.org>; Tue, 13 Oct 2026 10:08:27 +0200
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-487049569b6so1827517f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 13 Oct 2026 01:08:27 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48de0aaaa05sm3283036f8f.13.2026.10.13.01.08.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Oct 2026 01:08:25 -0700 (PDT)
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
        d=suse.com; s=google; t=1791878907; x=1792483707; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PmYYAxqD4mSZwNf80Vz5dVtz0dj676xcDjEg1KEK44A=;
        b=PVEOI4tsj9xeHzdYy002C0LV1slnjyANrnh0IzFCXXkLcw8c90h4Kq2q4KIIjdblyt
         RMSC5eH3z8ilp2UcohKn0Lm1FgXhKGr5uYZYnWCdQuHz3qiXq11pAC5vd8SrDn+7BFuP
         6nCp2vo7XHbdvxZYWwkQ45uveshq65sQL3gO2m0mxtVbxpg2VRTiWe8MWbzGJgD8ECPi
         vsAzU13f6gCOCLu2pU9vk5tTH4Nq8q3fZpPGReMwbXRijxj+GbJWbZAvDohMluOO2NQZ
         MlQwwkxo0ghBpJqa9WtI6UKYnO+8YbttGhFv5gHMU04eCnrXU1gukog3MIK50bQ33j+O
         niBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791878907; x=1792483707;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PmYYAxqD4mSZwNf80Vz5dVtz0dj676xcDjEg1KEK44A=;
        b=HXhIZIry3tyCcLeUDhfVDeRqIhpkkxq0ljXmEwrVh+lWYnM1hJ0fbzrs8eoB0GMNyT
         Jvr9YjoKiMCsDEIIZfNgdUkXU/8/XfNg/yx78j58MdYqQSr4PJmXN6JFUmKvuCwiRU4c
         iFuI12/KvV6u3SrvKrqvOnZJgUent4kWZrSbLg1+Vfq1hDewzOBsPACIS8wHfH1DYp2Q
         JiucG4nYjwA1hvC4ZT/QwPkhFzgtw1aDG4DZobe/A+j2sKk6QrB7QEp3RYOTb9mL9lSq
         p/C9irnRrQL9evS5dGTU9SO+5g8H1SoElscaikfYe9S7XHKLbZ095D11zNUVkW1LW70D
         ucFQ==
X-Forwarded-Encrypted: i=1; AKwUvByzx6cfBh4uOzDCl25EKiQXEIoz7GYpWlbedcMz1JkFbid+yQzWH9ohch3BLu0Z8OxzdgkhF9CeIrA=@lists.xenproject.org
X-Gm-Message-State: AFq9FYJ7Zs7yVCgDeMyndnGctMdYTBOl7Go9bVNionYQxhdxukw8+WJg
	gX0NjWTssGTvVNdoD++O/YjxsTw19cC0heYPGdtS1yqN3kSM4FpVo8VL/WaYINZK/g==
X-Gm-Gg: AYBFou3h2YAK7Fjcgbb61DWuc/Jb9DhxLkfuiSKaNaKWVKIOvYqvzNCBWCQWuw0O7R7
	vYnbWWKlOYr5IOCh6u5Y4Ys5qky4gi/KJcnmDWse348yIalzGcRei47q5/AgBQ3uq8TFvfBUVxh
	lTgzrrFpBeBVz5A2FpEFi8YHzEiZCaZuCBT0EV+8DE5wTK5LGuYUTOfj4aL0LhSZQSH3H/n3zy2
	E01lqDEeQ9VBpgscYml1+nvWD5nRGRtTAkidTieO/7CfGhdOube2vlQ5LC+slPaJgCaH7MhB3j0
	ieADCgAjOH0J6MNR5dzyFs4qlumz8Yrrvbe+7/74DppDmxess7G2h55/zBiCYnlsOQNlmyydNOE
	HQq+N3Eb+hyHGrgdmGsE+QooGc3AsBlfnHu4bGeL1McD0NGYKBjVvOSrHYx32gmukqc3bdMvYkv
	45OlicezpGUtyzKik2CsqfptehnENwET9zHkYvf3VuMtzj3/GyBDNf3q1bbMMp8YifcrGBPURoj
	jtOL66UyP3Xp34cF4HsAf0WnAE12z/SkmVF+gV0ehNFHYK7riPVbpaj/7z+gDA=
X-Received: by 2002:a05:6000:4288:b0:488:6ed9:b11d with SMTP id ffacd0b85a97d-48dbacf554cmr21432930f8f.52.1791878905871;
        Tue, 13 Oct 2026 01:08:25 -0700 (PDT)
Message-ID: <0b68d552-1d90-48d1-bc06-76caf40e61f7@suse.com>
Date: Tue, 13 Oct 2026 10:08:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] automation/eclair: generalize the noreturn
 function-pointer deviation
To: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
Cc: Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <a1200bca22212f81bb2265b761a7de5fc91e798f.1791877354.git.dmytro_prokopchuk1@epam.com>
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
In-Reply-To: <a1200bca22212f81bb2265b761a7de5fc91e798f.1791877354.git.dmytro_prokopchuk1@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-42698a/1791878907-1B2DC9EA-CBFE30FB/10/78276251493
X-purgate-type: spam
X-purgate-size: 2754

On 13.10.2026 09:56, Dmytro Prokopchuk1 wrote:
> --- a/docs/misra/deviations.rst
> +++ b/docs/misra/deviations.rst
> @@ -392,10 +392,12 @@ Deviations related to MISRA C:2012 Rules:
>       - Tagged as `safe` for ECLAIR.
>  
>     * - R11.1
> -     - The conversion from 'void noreturn (*)(...)' to 'void (*)(...)' is safe
> -       because the semantics of the 'noreturn' attribute do not alter the calling
> -       convention or behavior of the resulting code, parameters handling remain
> -       consistent.
> +     - The conversion from a noreturn function pointer to a function pointer
> +       with a compatible signature does not alter the calling convention.

"... with noreturn omitted but an otherwise compatible signature ..."

> +       The callee does not return, so code following a call through the
> +       resulting pointer is unreachable. The compiler may delete that
> +       unreachable code when it can see the noreturn callee, or it may

"... when it can see that all of the possible callees are noreturn, ..."

> +       leave the code in place. Xen's behavior is the same in either case.
>       - Tagged as `safe` for ECLAIR.

While kind of implicit, should it perhaps be made explicit that we tolerate
(deviate) such a violation of rule 2.1?

> --- a/docs/misra/rules.rst
> +++ b/docs/misra/rules.rst
> @@ -435,9 +435,10 @@ maintainers if you want to suggest a change.
>         and any other type
>       - All conversions to integer types are permitted if the destination
>         type has enough bits to hold the entire value. Conversions to bool
> -       and void* are permitted. Conversions from 'void noreturn (*)(...)'
> -       to 'void (*)(...)' are permitted. Conversions from [unsigned] long
> -       or '(void *)' to a function pointer are permitted.
> +       and void* are permitted. Conversions from a noreturn function pointer

Nit: Take the opportunity and convert the badly formatted "void*" to match
the formatting in the last sentence? (It's not quite clear to me though
why that has parentheses; it would seem to me that just the quotes [and
the separating blank] ought to be sufficient. My main point here obviously
is that all spellings of the same thing would better be identical.)

> +       to a function pointer with a compatible signature are permitted.

Like above, it is imo important to state that the difference between both
pointers should be _only_ the "noreturn". That's lost here, just like it's
lost in deviations.rst.

Jan

> +       Conversions from [unsigned] long or '(void *)' to a function pointer
> +       are permitted.
>         Example::
>  
>             unsigned long func_addr = (unsigned long)&some_function;


