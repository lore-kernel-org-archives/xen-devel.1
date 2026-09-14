Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1D51C88E50
	for <xen-devel@archiver.kernel.org>; Mon, 14 Sep 2026 06:27:56 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1420465.1646771 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x60AK-0001I9-4x; Mon, 14 Sep 2026 06:27:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1420465.1646771; Mon, 14 Sep 2026 06:27:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x60AK-0001I2-1i; Mon, 14 Sep 2026 06:27:44 +0000
Received: by outflank-mailman (input) for mailman id 1420465;
 Mon, 14 Sep 2026 06:27:42 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x60AI-0001Go-9k
 for xen-devel@lists.xenproject.org; Mon, 14 Sep 2026 06:27:42 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x60AH-00EaWK-MZ
 for xen-devel@lists.xenproject.org; Mon, 14 Sep 2026 08:27:41 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aa793dc-e002-0a2a0a5209dd-0a2a45079318-14
 for <xen-devel@lists.xenproject.org>; Mon, 14 Sep 2026 08:27:41 +0200
Received: from [74.125.225.76] (helo=mail-wr2-f12.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aa793dd-b4ea-0a2a45070019-4a7de14cde45-3
 for <xen-devel@lists.xenproject.org>; Mon, 14 Sep 2026 08:27:41 +0200
Received: by mail-wr2-f12.google.com with SMTP id
 ffacd0b85a97d-484366874b0so849581f8f.2
 for <xen-devel@lists.xenproject.org>; Sun, 13 Sep 2026 23:27:41 -0700 (PDT)
Received: from ?IPV6:2003:ca:b735:686c:f5c4:7858:246b:ca62?
 (p200300cab735686cf5c47858246bca62.dip0.t-ipconnect.de.
 [2003:ca:b735:686c:f5c4:7858:246b:ca62])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-486eb33ee8bsm24661901f8f.15.2026.09.13.23.27.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 13 Sep 2026 23:27:40 -0700 (PDT)
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
        d=suse.com; s=google; t=1789367261; x=1789972061; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mwmp9WPS7lTMWpQjfMoDaH5ulNLhnKsAqa1YMjCOZ5E=;
        b=gr8Gp2nm9zTBC/QdNaLxiGD48Ox1tOSI0FdKfW39U25/BAFXUiBDF4j3zoBMBgeJ/Z
         WPu0lzsn5DwWRa1/drSOp3wCfo7otkpnowXu9hPOfgpS8LAfs9hkToyGH3w8H9zCECsh
         b6aQv1xaagiRpJ1WTaxmlcny4bjl+thsXwH/ZqhLAX/1V6dvU5Ib73sbPeH6IzifErwr
         T7CrdgX364Ebn/JaOoWEoUUQ9mpquSBtyXQTGEio9pgONnJM6baD75nPE+XlZ+jDAEKg
         qcZ835MTXbqNKSOdutku4w5NPv2Uv2ZToQpczJ5p+BMteClqX8UqC5VTUfXb9vo1s7EZ
         J/Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789367261; x=1789972061;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mwmp9WPS7lTMWpQjfMoDaH5ulNLhnKsAqa1YMjCOZ5E=;
        b=schyUZpmvUbWCr8r3E8Xs7QPnbWUIvms2Dl2sxpuyzzYPgzC7DD9Mw0m+0DNkeW84+
         56fJ6gYxuoHkqianyS3l0ILdKjpzAsTEQrbzUeLP8+YsQ2C8bQVopiiIEv+o+z+RlQVP
         pPEDKAxBI2kiq10pV1YZaOXcRizuJRW7cBQ8nAWkWcZQvJyMOzASlqeRQYOsIDRKBgpW
         lYtCQEciiHavznrcPsd0kG9fRTlYsrA3P5nfrjKOoPcRbTFfcSm3M5dckfUzec39rKXE
         OGnktcXldBJ/77iCjGUHRY+FinisvcFLM6xzDlNzlx1GA+iznIarP0YNrSiD2YJPSQx5
         wxew==
X-Gm-Message-State: AFuF++lhdy4Iv6qpNZlP1DkWVanBM/LWNBrAyr3UceDH3RG0QRttRNtR
	mzYG+PVrOtkxl6oPjmutckX6SEQT8QxHmIwleQ39PG6ffWwW9QVuKRZ8Opj2W0jcLA==
X-Gm-Gg: AYBFou0uZUhtELDNoU/DPqvFCVcogG5WzLHX363h6EUtTRXE6i4hJXKwZv+9Vk5nFRS
	zA/0dFwPemQSypI3SGrd/ETcDFgkIgKUCEuI/113s01rp6+mtXYAvm27wLPOtPcf0tCa9pGxyPT
	znHryzVr3q9kY9CHIaHZwto3f9R7clF34x6DTpV67O4SqTQ4jr9a/bZd9HjHLFyAOzmxg+7r/WC
	jzzU4SitLG5Exg4JhnLSHy7aVsoW1R5IU+f5tmyrMdlN+Ko0RPQA9vwifCDhqbEddI4oTM31gCe
	zuhn3/3hCl2SvdihOMGwn1+u1S6GHcT7OBGALTPC6Ptlsp9ywKqvaJ3WDwRrj3RoCQJ7bVxyXq+
	QPtMpNh+zsvTciIuJUI+vw0Dm1teFUO+XfH9d08nPeZxeFuUSTPx5eKeB5mwYvGDX0rvkF+PktE
	aGiYnS597gQ5p7C1mFk0mbG+hYfVAGUF/Sj75gsWOVRYjJRPYiM+9lSdLM0nFcPTGFDk0i351io
	2C0ln2s7sHYIR8hg5I2JsaH0vG4fjEES8RgbLpJrMsbajOnT5A6ggr4k0oT5bKvz0cQ4BMvW7AH
	UyZRdLBuTFL4XwljhVHy+R56nSbPadA=
X-Received: by 2002:a05:6000:2403:b0:485:943c:886d with SMTP id ffacd0b85a97d-48702ad29bemr2153065f8f.7.1789367260972;
        Sun, 13 Sep 2026 23:27:40 -0700 (PDT)
Message-ID: <e511c588-215e-4e73-9ba4-a0a79cee4478@suse.com>
Date: Mon, 14 Sep 2026 08:27:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] Eclair: relax "noreturn" function-pointer conversion
 deviation
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>
References: <6d212d60-5c0b-4909-996d-5d6a4906b7e1@suse.com>
 <4cca58b6-b555-4064-aa26-5204dc4b99cc@suse.com>
 <3d473b8a85331856ea2b95f9448f2d6c@bugseng.com>
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
In-Reply-To: <3d473b8a85331856ea2b95f9448f2d6c@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ef75cf/1789367261-A60C5AE4-A74A6474/0/0
X-purgate-type: clean
X-purgate-size: 3211

On 12.09.2026 18:04, Nicola Vetrini wrote:
> On 2026-09-03 13:44, Jan Beulich wrote:
>> Like misra/rules.rst says, function arguments other than "void *" are okay
>> as well.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> I can't explain why this covers the violation in mce.c:mce_callbacks'es
>> initializer, but not the one in mce.c:default_handler's.
> 
> Possibly differing attributes (e.g. cf_check vs section attributes)? Just a guess that would need to be tested, though.

As long as its guesswork, it could end up being many (expensive) tries.

>> As a result of 6852334f8416 ("Arm/GIC: add noreturn in a few more
>> places"), vgic_v2_lpi_to_pending() and vgic_v2_lpi_get_priority() (both
>> returning non-void) would also need covering. (As said in a remark there,
>> non-void together with noreturn is somewhat odd.)
> 
> Indeed
> 
>> Really before and after this change there's no checking that parameter and
>> return types actually match. I have no clue how one would express such
>> checks.

With this last sentence in mind ...

> The presence of a bitcast indicates that the two types do not match exactly. Typically function attributes are not relevant towards determining a type difference, but different compilers may model non-standard features differently (rightly so), in such a way that some make a difference in the AST, and others do not.
> 
> To check for compatibility of function pointers I would try activating service STD.funptrcv, which essentially mirrors -Wincompatible-pointer-types:
> 
> caution for rule STD.funptrcv: (rule) A pointer is used to call a function whose type is not compatible with the pointed-to type. (untagged)
> p.c:8.8-8.8: Loc #1 [culprit: implicit cast converts from `void(*)(int)' to `__typeof__(@EXPR@)*' (that is `void(*)(void)')]
>   qq = m;
>        ^
> p.c: In function ‘h’:
> p.c:8:6: error: assignment to ‘void (*)(void)’ from incompatible pointer type ‘void (*)(int)’ [-Wincompatible-pointer-types]
>     8 |   qq = m;
>       |      ^
> p.c:3:6: note: ‘m’ declared here
>     3 | void m(int x);
>       |      ^

... - well, fine, but ...

>> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
>> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
>> @@ -391,11 +391,11 @@ constant expressions are required.\""
>>  }
>>  -doc_end
>>
>> --doc_begin="The conversion from 'void noreturn (*)(void *)' to 'void (*)(void *)' is safe
>> +-doc_begin="The conversion from 'void noreturn (*)(...)' to 'void (*)(...)' is safe
>>  because the semantics of the 'noreturn' attribute do not alter the calling convention or behavior of the resulting code."
>>  -config=MC3A2.R11.1,casts+={safe,
>> -  "kind(bitcast)&&to(type(pointer(inner(return(builtin(void))&&all_param(1, pointer(builtin(void)))))))&&from(expr(skip(!syntactic(),
>> -   ref(property(noreturn)))))"}
>> +  "kind(bitcast)&&to(type(pointer(inner(return(builtin(void))))))&&from(expr(skip(!syntactic(),ref(property(noreturn)))))"
>> +}
>>  -doc_end

... how would this be expressed here? Perhaps best if you would make an
alternative patch?

Jan

