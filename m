Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 693A4C982E6
	for <xen-devel@archiver.kernel.org>; Mon, 21 Sep 2026 14:56:15 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1427640.1650443 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8fR1-00054V-3G; Mon, 21 Sep 2026 14:55:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1427640.1650443; Mon, 21 Sep 2026 14:55:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8fR1-00054O-0N; Mon, 21 Sep 2026 14:55:59 +0000
Received: by outflank-mailman (input) for mailman id 1427640;
 Mon, 21 Sep 2026 14:55:58 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x8fR0-00054I-1D
 for xen-devel@lists.xenproject.org; Mon, 21 Sep 2026 14:55:58 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x8fQy-00DYVI-Ts
 for xen-devel@lists.xenproject.org; Mon, 21 Sep 2026 16:55:56 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ab14565-e002-0a2a0a5209dd-0a2a4506b338-48
 for <xen-devel@lists.xenproject.org>; Mon, 21 Sep 2026 16:55:56 +0200
Received: from [74.125.225.140] (helo=mail-wm2-f12.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ab1457c-195a-0a2a45060019-4a7de18cdd02-3
 for <xen-devel@lists.xenproject.org>; Mon, 21 Sep 2026 16:55:56 +0200
Received: by mail-wm2-f12.google.com with SMTP id
 5b1f17b1804b1-49b912d3920so21375875e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 21 Sep 2026 07:55:56 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49fcd115dcbsm232267515e9.15.2026.09.21.07.55.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Sep 2026 07:55:55 -0700 (PDT)
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
        d=suse.com; s=google; t=1790002556; x=1790607356; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JJSPnhpBfQDvLzWMDKDLPoJA2wV83c4JXvRKt8rLBRs=;
        b=SHHYoRMrYQfI1bpdluZgNOB/8civXMTkF4kNkxS1zcy664j5PfEHSxJ9KA8VgLsQZZ
         mrWm/Uu5+z2C5CE3/8EfpHcVYY6S9ez2Duq6eSA9PemqEVcE9/HV5WJoohfAW1kp49vt
         E4QcEWQVZbaNZenSqnnPgMZ1V/sArcWwUIACgSBhs498Gyn1qlEPJmC1SlU2YwTxxUwo
         mAVvyobU1R34pWT/gd8cA5MJmvD11mbRZw3OfSOXTRE5LcFgdpWWjaelwlylMGnuAuuk
         tyQbSkOPawcHaAjAYGZQhX9km9LDs6U0oncoC6gaa2fqj1peMPrlhe+uEX0pivDOHFUm
         eB8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790002556; x=1790607356;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JJSPnhpBfQDvLzWMDKDLPoJA2wV83c4JXvRKt8rLBRs=;
        b=2q5EEFrM3BpuQWjXQdMjhHmdmb50LeE53ohr/1wIqyMFfQRjDzgAYxJGTTSQ5fqUlU
         rupfwiNT187ZujJdAkvkKl6FMSIMrVR+fsJfgKtICqjxekxWZXfxYGJbWNbjzyRjlExs
         XMYkhPEVNEUN5sOHvGzkPHGkTw4uNU2bN7bBBagHFtas8+ocwh58VQWTa7jQfgyTjvaf
         I+c68Jhrh9+IMmvSThVU9AhKV/ikFx8JTAS4FqDS9YwHwOY9IDQvaTf3FooIzxnhNEtW
         B5TALwdYaAbFf5qmqVO33QCTVEFao7eO2K+jHorws9t6L5OgxE0A1/0lkq/LAdmagyZr
         a2Sw==
X-Forwarded-Encrypted: i=1; AKwUvBwTeaL37nfFt1SgSHAfKlvPTAzxjOSgTu7PV83ZAvXzBPZ7DldHlGkRiLnc4mG2jWYhDkiN8InsVUg=@lists.xenproject.org
X-Gm-Message-State: AFuF++nK4vuItLHRcLq9J91bVZQcoi/h1graSyxNTFwyoljrh9c/aKjq
	Tr+NYYwvOQIBJgFFAqzHF/wxXhBBMRiycjJtrr7GoHreJEw4N8VGaUglTH9yAGb8Kg==
X-Gm-Gg: AYBFou3xR6NaEzhh6888Ige5tQ9x3R6ZgLXLlLHxhFKSxgw9iuqfQq7+Aa2Tnd53ng8
	Lbri0WSS4bnOJS7w4G4n4mtpiiZRfC+1mWKan7kGSp+ocVns39FiZm9jAwkST5RyC3UYH0wIYjD
	yL1W7nMJvkyS83uNn7rlY4OhRI5dXcalxa282rQeQd4xUzzxq2yoLWSB2EHpGmOHkw6Ana4TBrQ
	mqLe/PR8ciP1DkTfzhWB0zOtksYMVDCn9uvzKyxOmJKr5wy8JjURJ5TCjEKamS1nKkB3qrnPrRR
	zCUiXbDZe1HQwgLJ1IYkwR/mZ0WRkUJpERSq0tALy8VIwY1stOO7CDuuSUTSHlf0AKU8wodoVhk
	csJjXSn6wBUg6sa8Bryozc9BBl11kmwjPpW1yynllekRcKLQFixQqPH/QIzJx4sjQaEHlVPyXKi
	l9RREfg5JxTqRU1TM6kDFR8bXUR3z5E/jcTN20OgWeMdxaHdh+L1hQWqRcnmJUekX/m+3tPXuDB
	B7l7O1YoPsJh5J4FA+o84fqKJvv0Z2Vq439bvXhL0RoYeN51y4Gjr3eUlbgYoE=
X-Received: by 2002:a05:600c:4e4a:b0:49e:6e94:7cae with SMTP id 5b1f17b1804b1-49fc5741495mr154441435e9.28.1790002556162;
        Mon, 21 Sep 2026 07:55:56 -0700 (PDT)
Message-ID: <8f70ec4c-ffb1-4116-9128-1cbdf8d89ce5@suse.com>
Date: Mon, 21 Sep 2026 16:56:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/HVM: replace paging_mode_hap() uses
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <f456b455-bcae-46a0-b68b-cebf31afa38f@suse.com>
 <DLL1G8IR03BR.3KDSA5APZ73TY@amd.com>
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
In-Reply-To: <DLL1G8IR03BR.3KDSA5APZ73TY@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-16d1c6/1790002556-F78CB77B-57F4593C/0/0
X-purgate-type: clean
X-purgate-size: 1968

On 21.09.2026 15:45, Alejandro Vallejo wrote:
> On Mon Sep 21, 2026 at 3:19 PM CEST, Jan Beulich wrote:
>> HVM guests cannot run without either HAP or shadow enabled. While
>> paging_mode_shadow() is compile-time-constant when SHADOW_PAGING=n,
>> paging_mode_hap() isn't. Hence the former is preferred to leverage DCE.
>>
>> In svm_update_guest_cr() combine two adjacent conditionals.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Yes, please.
> 
>   Reviewed-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>

Thanks.

>> --- a/xen/arch/x86/hvm/svm/svm.c
>> +++ b/xen/arch/x86/hvm/svm/svm.c
>> @@ -113,7 +113,8 @@ static void cf_check svm_update_guest_cr
>>      switch ( cr )
>>      {
>>      case 0:
>> -        if ( paging_mode_hap(v->domain) )
>> +        value = v->arch.hvm.guest_cr[0];
>> +        if ( !paging_mode_shadow(v->domain) )
>>          {
>>              uint32_t intercepts = vmcb_get_cr_intercepts(vmcb);
>>  
>> @@ -122,9 +123,7 @@ static void cf_check svm_update_guest_cr
>>                   monitor_ctrlreg_bitmask(VM_EVENT_X86_CR3) )
>>                 vmcb_set_cr_intercepts(vmcb, intercepts | CR_INTERCEPT_CR3_WRITE);
>>          }
>> -
>> -        value = v->arch.hvm.guest_cr[0];
>> -        if ( paging_mode_shadow(v->domain) )
>> +        else
>>              value |= X86_CR0_PG | X86_CR0_WP;
> 
> nit: This would be clearer with the polarity reversed. Check shadow
> first and have hap later. It'd also make the diff (marginally) smaller too.

Not sure about diff size, but I deliberately didn't want to inverse
polarities anywhere. Switching the predicate I was hoping to be
sufficiently uncontroversial (except, as Andrew points out, it having
a slightly negative doc effect in a few places). Inverting polarities
of if/else-like constructs, otoh, can affect code gen, and we would
likely not want to favor shadow over HAP now that shadow is off by
default.

Jan

