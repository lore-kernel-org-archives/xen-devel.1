Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76E78C53219
	for <xen-devel@archiver.kernel.org>; Tue, 28 Jul 2026 10:01:30 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1372318.1619678 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1woecX-0007ir-Be; Tue, 28 Jul 2026 10:01:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1372318.1619678; Tue, 28 Jul 2026 10:01:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1woecX-0007ik-8s; Tue, 28 Jul 2026 10:01:09 +0000
Received: by outflank-mailman (input) for mailman id 1372318;
 Tue, 28 Jul 2026 10:01:08 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1woecW-0007ie-4d
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2026 10:01:08 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1woecV-002M47-HZ
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2026 12:01:07 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a687de3-bab6-0a2a0a5309dd-0a2a4507b59a-0
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 12:01:07 +0200
Received: from [209.85.128.42] (helo=mail-wm1-f42.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a687de1-b4ea-0a2a45070019-d155802ac8cb-3
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 12:01:05 +0200
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-4956869750eso27524215e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 03:01:05 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4957bff4784sm290629245e9.4.2026.07.28.03.01.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Jul 2026 03:01:04 -0700 (PDT)
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
        d=suse.com; s=google; t=1785232865; x=1785837665; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lpx2aid6gy0abl8xxEkqC6FysZqM94pHfw7hx0UNm6M=;
        b=BTBKRMeRapdFQxSk+cz1u/uu5nBUcrZVbIYcgq0QWV1r7TnxFOcLMnFcFatSVsBt/P
         9e8DfpV9VRvRUaSZajbb50izTrj6oCF/xAL/1kJ49hw2442A8wBl5xBac1QA2oTg8KKX
         9xpJhOH1VznJcM70ALBWvs8oeeE9zGYubhpqYBa/wlkMqAY3fX+UELMX55JLwWoFhR1m
         dmUweAxpYkm2kJ6v3CcIJhqH3dmteHqV4ONQJFJZBqdc+GtNdxie1KUqN2KifH4zxMEY
         2bgWjgGfMdB8GgTiRjG9OB50cEwF2NFz3rFyDnLHHqFEC8YVsO/KIdGs3LC4UgvgDh4Y
         31hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785232865; x=1785837665;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lpx2aid6gy0abl8xxEkqC6FysZqM94pHfw7hx0UNm6M=;
        b=SdV+o0Xe+ODcvd2VNYMriXpIIKj5sgZQGTk9vojeIahDFZsuk3n4tHY97jumX4dOdH
         ERf7PhP6+sJd450FX0rrV0AGVT5eyGaKL04ifefy6pt5WtGvzNC84KzIkuiuurfqhDG6
         8WxoweOWWYFxjoWSagFZ0ETJayQ9k6DE2CHM6eQxgHQVC+RJYX6j/S87tA7jnAC7szO1
         TF1CYwk5dVq8ZxrZnS10ppgKm/hYFqi8omSodk0P7g7BC87cV9j7n+i+cUxPmZY0TQJz
         7+wY8Zsq/AzMhkELWWNlf7sTb7b6E9iPCRWfG0DHr7yFnP7hUm5AkpreSlSvMPhj7BCa
         9jzg==
X-Gm-Message-State: AOJu0Yzp7Qs9LIbWkwLWj7tuqCT/H1GfAF+l+NMfc5NUMO7PzsnONaPS
	PWJzXiaFWRMcneuzbLMyk5WuCRdbpyf9mPtp72zDW3QRzyXrSPdTjYQkTD0l9MLfeQ==
X-Gm-Gg: AR+sD11MIAL+Lnp7V26KdKKiyvjEWJs01xoJ396OJlU8g1zRh6BSsBxyUPAwM6kIxe1
	XtsR4HtcaOdpth3x6mMa76gdlz0fe39GTzMxJoKXxOoDH/5CooVNMhntf3P0dpiPJWJSVRlyIkd
	87wdyyHRCsoMsp6vJqQHkz3mCJ2FZz9DTvjW9k1ycLb1SrsYIGJSpl3j5nIxCMsunBZplyocE4G
	1BBvPVknTz+69RlpANhm0cAd1ggF8pGjGIdX82X5aThF2GI5isD8qvAOwNI4aN1HGhBEuK9V4Lj
	/nm3McuUaal+EA9gRhEYTzIQVmCSzJWT/cIhB2oA2DkNCWdEIiGMSLptUhKtzL9+F/Wz8HKeR1/
	I2HxzCOUCEEq/mQRhP+NiThwO856zxTBrPOE09le++VHc16UJcuApsm5yjMaz2vAQU6JfaM5/O5
	Eu86EIWVEQPKqsdcD00IQSx37B+KrsqSg6//x3huoJkQhZ/kyEvyoRxmRp34em0ztIcA==
X-Received: by 2002:a7b:c016:0:b0:495:3eb2:b763 with SMTP id 5b1f17b1804b1-496c6568d56mr11615485e9.21.1785232865049;
        Tue, 28 Jul 2026 03:01:05 -0700 (PDT)
Message-ID: <f95aaae3-1e49-471f-9f44-ddd60309cbe7@suse.com>
Date: Tue, 28 Jul 2026 12:01:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] x86/time: avoid early uses of NOW() to return zero
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>
References: <f5040939-b166-4050-9a27-117b772547d4@suse.com>
 <a53601c4-dab7-4d75-9cf0-323acc980ede@suse.com>
 <amhrKd-736ymBrfD@macbook.local>
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
In-Reply-To: <amhrKd-736ymBrfD@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ef75cf/1785232865-A54C3AE4-1F2653CA/0/0
X-purgate-type: clean
X-purgate-size: 3431

On 28.07.2026 10:41, Roger Pau Monné wrote:
> On Tue, Jun 30, 2026 at 04:06:41PM +0200, Jan Beulich wrote:
>> Waiting loops like the one in flush_command_buffer() will degenerate to
>> infinite ones when used early enough for NOW() to still return constant
>> zero. Make sure the returned value at least monotonically increases. When
>> available, use nominal frequency values as initial approximation.
>>
>> Do this only in get_s_time(), as producing a sane value in
>> get_s_time_fixed() for non-zero inputs won't be reasonably possible.
>> Put an assertion there.
>>
>> Reported-by: Roger Pau Monné <roger.pau@citrix.com>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> RFC: While generally the mentioned waiting loops will take longer to time
>>      out, on a very fast CPU tight loops may time out too early.
> 
> While we know this is not ideal, it's better than getting stuck in an
> infinite NOW() loop without any timeout.  IMO it's best to timeout
> early than not timeout at all.

Good, thanks for confirming.

>> RFC: On the 2nd pass through early_cpu_init() it may be okay to skip the
>>      new additions.
> 
> Possibly, yes, maybe add a static variable there to avoid re-doing?

I don't think a static would be needed: We can key this off of the function
parameter.

>> @@ -403,6 +404,36 @@ void __init early_cpu_init(bool verbose)
>>  				    &c->x86_capability[FEATURESET_7d1]);
>>  	}
>>  
>> +	if (c->cpuid_level >= 0x15) {
>> +		cpuid(0x15, &eax, &ebx, &ecx, &edx);
>> +
>> +		if (ecx && ebx && eax)
>> +			preset_tsc_scale(DIV_ROUND_UP(ecx * 1UL * ebx, eax));
>> +		else if (c->cpuid_level >= 0x16) {
>> +			/* Assume CPU base freq ≈ TSC freq. */
>> +			cpuid(0x16, &eax, &ebx, &ecx, &edx);
>> +			if (eax)
>> +				preset_tsc_scale(eax * 1000000UL);
>> +			else if (ebx) /* See preset_tsc_scale() for why. */
>> +				preset_tsc_scale(ebx * 1000000UL);
>> +		}
>> +	} else if (c->vendor & (X86_VENDOR_AMD | X86_VENDOR_HYGON)) {
>> +		unsigned int nom_mhz = 0, hi_mhz = 0;
>> +
>> +		amd_process_freq(c, NULL, &nom_mhz, &hi_mhz);
>> +		if (nom_mhz)
>> +			preset_tsc_scale(nom_mhz * 1000000UL);
>> +		else if (hi_mhz) /* See preset_tsc_scale() for why. */
>> +			preset_tsc_scale(hi_mhz * 1000000UL);
>> +	} else if (c->vendor & X86_VENDOR_INTEL) {
>> +		unsigned int hi_mhz = 0;
>> +
>> +		/* See preset_tsc_scale() for why. */
> 
> I would avoid those repeated "See preset_tsc_scale() for why."
> comments, and simply state at the beginning of the block that either
> the nominal or the higher reported frequencies will be used, as in the
> worse case when using the high frequency the timer will run slower,
> but not faster.

Can do.

>> --- a/xen/arch/x86/time.c
>> +++ b/xen/arch/x86/time.c
>> @@ -1664,6 +1664,9 @@ s_time_t get_s_time_fixed(uint64_t at_ts
>>      const struct cpu_time *t = &this_cpu(cpu_time);
>>      uint64_t tsc, delta;
>>  
>> +    /* scale_delta() degenerates when the scale wasn't set yet. */
>> +    ASSERT(t->tsc_scale.mul_frac);
> 
> Hm, so for release builds we would just return 0 in get_s_time_fixed()
> when called before the scale is initialized.  I guess that's as good
> as we can do.  I wonder whether using BUG_ON() won't be better here,
> but it's likely best to return 0 than plain crash.

Yeah, crashing release builds because of this felt excessive to me.

Jan

