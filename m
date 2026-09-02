Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72739C61DFD
	for <xen-devel@archiver.kernel.org>; Wed,  2 Sep 2026 08:40:26 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1405354.1638856 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1gVt-0005fE-Ds; Wed, 02 Sep 2026 08:40:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1405354.1638856; Wed, 02 Sep 2026 08:40:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1gVt-0005f7-AF; Wed, 02 Sep 2026 08:40:09 +0000
Received: by outflank-mailman (input) for mailman id 1405354;
 Wed, 02 Sep 2026 08:40:07 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x1gVr-0005f0-Po
 for xen-devel@lists.xenproject.org; Wed, 02 Sep 2026 08:40:07 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x1gVr-006PDl-6J
 for xen-devel@lists.xenproject.org; Wed, 02 Sep 2026 10:40:07 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a97e0e6-e002-0a2a0a5209dd-0a2a4504df58-6
 for <xen-devel@lists.xenproject.org>; Wed, 02 Sep 2026 10:40:07 +0200
Received: from [209.85.128.43] (helo=mail-wm1-f43.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a97e0e6-b57f-0a2a45040019-d155802bd1b1-3
 for <xen-devel@lists.xenproject.org>; Wed, 02 Sep 2026 10:40:07 +0200
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-4995b0343c1so7900885e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 02 Sep 2026 01:40:07 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49ce464aa32sm63331905e9.5.2026.09.02.01.40.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Sep 2026 01:40:06 -0700 (PDT)
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
        d=suse.com; s=google; t=1788338406; x=1788943206; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lFeiGfwHFbNu+2NtxgAHyH+5BhpbpvplrOjaEEUWGBw=;
        b=X7AzC6arcegL4W15BhQHgudYzz3iOXKFSxAWYdB1huCV/0cg5YDz2il1O1GQ/dCFRg
         EAkIyyqskoKxC3LlqMQsKdGftZVfQx/ogI7oW0mN9KpkNX20DWY0/lHYyjUX6b4oogm0
         67yatanJsVM/9X6XSGxadZ1mzoSs2kBxBf4jPqkCf7TkcVonzOGoPO051XOviBV+LRc+
         xMnKoItWHwssLVZBAaxDeZOQpo1MIW1EdgWRX0Q7oD7BnaoRnlsbJ/Lk9tqUli2kvBuE
         rGHoMnCxhSsyGoimYYyX7kCcLwrB7bRds/W+YPN6niTpIx1SK8xBfi5ZELXvPvrmWy9E
         Q3fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788338406; x=1788943206;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lFeiGfwHFbNu+2NtxgAHyH+5BhpbpvplrOjaEEUWGBw=;
        b=oDOgI0hPAEUJM1TkWk5My+dsxN28fygwdgJK625C4LGNNVgdL3PscTeQzILkeGEJ2u
         07wwXBRhlmKczydMQGW3Pd1DCHLBsPFesNu1n0uV8RXVcXcCEOYywwtoNCGR5jDF3z5E
         PaL3Wi1UYNsP0yQBLD5hVHNgc0UK2JO+qhr2uWQ+SmIisanm185RZp9wD/fEejwiu2OZ
         PGAjgRy43JXk/eDjshKCskq/7P9Bl9ZrlMQVjYO7ifrTZkCed1sumU1/vCGERNjYJHL0
         MdzKBNS2gHVCFrrm5TUGKxaVbtJDAqCkBkRFqxbwnFgzLMoaWWIuW/iLfmSq0QKDRzSM
         LWbw==
X-Gm-Message-State: AFuF++lY4o0dsVBxwjFNCceUUhv+iEDu38W4t7ddMAPOWfJws8d43XEi
	SEdMk2WOn5VQBMiEmSaBIoFUjdBxiaGXe/TMrlzx4zS8vI4CW8kxDw4jytNeeG3wyA==
X-Gm-Gg: AR+sD10v6JlLYdl2Jgbj8iMinOMvzKnYz3xrxMafLfjWE52wd69CoQI0yO8rRSpM3Qk
	9jlFOXZHze4aNo2JgybEjOf78paGbHLMgHx4n8IWgwK4AvJIBiyZNy/3gBNFhR7yWRhAfmBjJNY
	1w/PhbDCsVYqyphVyzYebvgA1P5e1pl5+IVJu0IZBvVUnR/Px6U8I3nsvebHJapar/InFFxQLu3
	Fm9eZWSbSr7j4yQC6P+Rwx17k6u8W4tQb6YShOwVujuxky6zGZUGgZ1HoqG8azGdIMEUY67V6cz
	uW10SmFIajSDRjAyBv4/I1ua25vonWuX79hOEOGLzG/PzPixsJlk6UCOwvPG68OXUBSlK2RLLzq
	u+w8W8+g9/N8Qyld9n6Q1/VXtj/UO2otzamddPMUoJFCIkigJOwhsblDSvPS2ZO0xDL+WutsWb7
	6q4YlURUf0D4vZPeQ3gi6ztqoOqKXfMXvqSTaPdkFfv9n4gEvWg1F9FGTgMKjQNuoQqwLhfUHak
	wOCl9JTVHNXUM3OaQVlLqRI9625YU3+zRnoegTFLF95eJANX6hPAA==
X-Received: by 2002:a05:600c:6296:b0:499:621a:2ec2 with SMTP id 5b1f17b1804b1-49ce581635bmr58290015e9.3.1788338406405;
        Wed, 02 Sep 2026 01:40:06 -0700 (PDT)
Message-ID: <1047fb1f-87a3-46b9-ad91-904b05d8a637@suse.com>
Date: Wed, 2 Sep 2026 10:40:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/2] x86/time: avoid early uses of NOW() to return zero
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>
References: <ec25e838-6bf6-496c-abbe-0fd71e2fb0d9@suse.com>
 <cb8d9a90-64ce-4e86-a188-36a32fe02970@suse.com>
 <apfWTzVihQi5LX9x@macbook.local>
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
In-Reply-To: <apfWTzVihQi5LX9x@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ebf023/1788338407-504DBB50-31705016/0/0
X-purgate-type: clean
X-purgate-size: 2163

On 02.09.2026 09:54, Roger Pau Monné wrote:
> On Wed, Aug 19, 2026 at 01:45:56PM +0200, Jan Beulich wrote:
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
> 
> Acked-by: Roger Pau Monné <roger@xenporject.org>

I assume you won't mind if I correct the typo in the domain name.

>> --- a/xen/arch/x86/time.c
>> +++ b/xen/arch/x86/time.c
>> @@ -1664,6 +1664,9 @@ s_time_t get_s_time_fixed(uint64_t at_ts
>>      const struct cpu_time *t = &this_cpu(cpu_time);
>>      uint64_t tsc, delta;
>>  
>> +    /* scale_delta() degenerates when the scale wasn't set yet. */
>> +    ASSERT(t->tsc_scale.mul_frac);
>> +
>>      if ( at_tsc )
>>          tsc = at_tsc;
>>      else
>> @@ -1679,6 +1682,20 @@ s_time_t get_s_time_fixed(uint64_t at_ts
>>  
>>  s_time_t get_s_time(void)
>>  {
>> +    /*
>> +     * Before the TSC scale is set, avoid returning constant 0 (or whatever
>> +     * this_cpu(cpu_time).stamp.local_stime is set to).  While the returned
>> +     * value is in no way representing time, it at least increases
>> +     * monotonically, thus avoiding e.g. waiting loops to degenerate to
>> +     * entirely infinite ones.
>> +     */
>> +    if ( unlikely(!this_cpu(cpu_time).tsc_scale.mul_frac) )
>> +    {
>> +        static s_time_t counter;
> 
> Not that it matters much, but counter can probably be __initdata?

I wanted to play safe here: In get_s_time_fixed(), release builds won't
crash if the assertion wasn't there, but would trigger in a
corresponding debug build. In that (unexpected) situation, we'd crash
here (when .init.* was unmapped) if __initdata was used.

Jan

