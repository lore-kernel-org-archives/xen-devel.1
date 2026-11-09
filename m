Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BB73606A321
	for <xen-devel@archiver.kernel.org>; Mon,  9 Nov 2026 07:17:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=gkvK48nF
Received: from list by lists.xenproject.org with outflank-mailman.1479594.1683516 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQJcY-00046U-AL; Mon, 09 Nov 2026 07:16:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1479594.1683516; Mon, 09 Nov 2026 07:16:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQJcY-00046N-7r; Mon, 09 Nov 2026 07:16:50 +0000
Received: by outflank-mailman (input) for mailman id 1479594;
 Mon, 09 Nov 2026 07:16:49 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xQJcX-00046H-FO
 for xen-devel@lists.xenproject.org; Mon, 09 Nov 2026 07:16:49 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xQJcV-009g0V-Ud
 for xen-devel@lists.xenproject.org; Mon, 09 Nov 2026 08:16:47 +0100
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af17358-bab6-0a2a0a5309dd-0a2a450ba220-30
 for <xen-devel@lists.xenproject.org>; Mon, 09 Nov 2026 08:16:47 +0100
Received: from [209.85.128.51] (helo=mail-wm1-f51.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af1735f-b7e8-0a2a450b0019-d1558033d820-3
 for <xen-devel@lists.xenproject.org>; Mon, 09 Nov 2026 08:16:47 +0100
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-4a210470b49so2936475e9.2
 for <xen-devel@lists.xenproject.org>; Sun, 08 Nov 2026 23:16:47 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-495966f316esm8205837f8f.17.2026.11.08.23.16.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 08 Nov 2026 23:16:46 -0800 (PST)
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
        d=suse.com; s=google; t=1794208607; x=1794813407; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RZf4ovfOayxN2P+DWXMXh5ZcwMSGqulvxKXHQKQ2HsA=;
        b=gkvK48nF1BFm/MLjE5oQvvo+CzPkk6W41Km+7RNzcsTUBQLZ5DpPJib3hlwozXS578
         xXqyMs0opEdnoX5oaY3vIfQkLyhYcxb0M/VUkyhFEaaUk0WnoqukHdNtBTPrMhziZYyH
         MkfZAJ/07uYJ8ZmV5KCNuWwTT5zQfJlSjzaecoVbPKSnpmGHEKa1J3bofi/P0qzWKQE4
         lDkymj4qz/vIBBihivyK32cAKPPFbhhPqu0jLDqtI85oVI9ZNLo9/dDvrhlAyDP24kfr
         RKJdK4bj/BEMRgrR64RE0SuPM4cdZ7uT6G4Dv3CC4125BV+6SVvtXmaFPm/W95RXslz2
         s9wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794208607; x=1794813407;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RZf4ovfOayxN2P+DWXMXh5ZcwMSGqulvxKXHQKQ2HsA=;
        b=2hNUy2YZeQbKpBTQeU24AFe/zn8uLYZ0MUXuR2U+nJIhb8CTKm/eaO/wVj4XOyHdkm
         LzoXT7kBponkNmLLfidt0JXZH6q+xK4g9wU5N16zXZi0+dbL7aTNQm2qvLF9ve1PP8Ob
         utN3br+PJDyG68H483AHM5V6BjFx6gdoEkibcCtKcgG7cEHQsouqSrc6b1/hx2wOupE+
         xXdNeOMknkSws9itNzIG52yGsqr01GAXVq6TuageX8IL2Acy/s/I0f+4/8IZ/1HOEogg
         6XJwSiC9kGP2QWiDa06yDL5TkzFsQp4LQha+NvMiF6+LwWxjK/1m6SeeV1Bw5ZmtdmZX
         WHrg==
X-Forwarded-Encrypted: i=1; AL+hErEviaepX1wQkMtqR+jeDuh2cVLmUFBjiD7gpyuryB5NdCygwchr296QyifJU3rVdaxXKOOwIdLRcPw=@lists.xenproject.org
X-Gm-Message-State: APuU4Z/mI6HOOWdGrBWeyZIwvUAZ9Hg6WDdiQtEEBYeVh2SmKBGG7olC
	ahK0x6rSpYtRVAMBzqWZo7EfW9dXw9U8TaJGG49okyGCMeKttbKieo9q2zGT/T895/nsznZ01lP
	Gm0G8Tg==
X-Gm-Gg: AYBFou0RjqbqJ65MMHJH0AH7VPFbk811YNudm33AZg3ILnykjR5n7UmNuK3xgIh0x2H
	s0/HwpqOTDnc3fRQkLs4YkQSX+PAsyv47OHZAmCtcLqruOsXD9LpZBlJplpPjTWs7yDe6nOQZ7C
	y0ymCmy9eXuvfySWiY2hsG5htOIdh3PqjGBamaJoxXWpeNqtLxQSPJ56hyIDfaSOI8a7dU24SRu
	Z3XUI+r5aui8ROoA2dtUN2ypeWtK5fC98dUSIFhl86FhoWfbQpvb3FUo8BjuuAmfLYaBEsmi5zw
	UA48k13Hj/YrDmHokExKwz5j3fPZo99NrVqi0zedGt91GoCwV5/LoXxDvhKu7e/SzGf4L3s/bw2
	nHLDDrbF3CHiD4nApx9iZsR8kwHLzetjy+ipMTv1+wgtVw+2Fg+09Wm7/pQFiRdtCPsrr34/Rv9
	jRSi3j6kIF7k5umawivFlpP8pxRUqOM+B3jExpIpiyiI5No2ZkGfVpm602byDFTcC7fwNW2zbvW
	4qJHAXmq2UEoL0yHccv+fr/zFR8goisFT2uu1IMojCPr6aXPjzIDIDhegekDieue6CbJX7EQ3JH
	kjZOhpONGtF2aXHLDdtk26NvFB+0xOPCwM7LPU0RTh5tdylRHKasvwNSS4kVI5O98Wxr6LyC8z7
	c5j+SaLQjfglVeJOMRaqI5r9pOrC8CDgknNdj
X-Received: by 2002:a05:600c:1d0e:b0:4a6:44b:2593 with SMTP id 5b1f17b1804b1-4b963c853a9mr60398715e9.29.1794208607188;
        Sun, 08 Nov 2026 23:16:47 -0800 (PST)
Message-ID: <0d725b6a-089c-402b-97ff-2f584c0898d6@suse.com>
Date: Mon, 9 Nov 2026 08:16:48 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/cpuidle: allocate processor_powers[] dynamically
To: Jason Andryuk <jason.andryuk@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <4da146da-26ee-4ecd-a747-130ed0783324@suse.com>
 <729bd90c-af1d-45b6-a466-f18845a10daf@amd.com>
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
In-Reply-To: <729bd90c-af1d-45b6-a466-f18845a10daf@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-42698a/1794208607-182F49EA-2B1CD925/10/78276251493
X-purgate-type: spam
X-purgate-size: 797
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 07.11.2026 00:36, Jason Andryuk wrote:
> On 2026-11-03 07:52, Jan Beulich wrote:
>> @@ -1694,6 +1702,15 @@ static int __init cf_check cpuidle_presm
>>       if ( !xen_cpuidle )
>>           return 0;
>>   
>> +    processor_powers = xvzalloc_array(struct acpi_processor_power *,
>> +                                      nr_cpu_ids);
>> +    if ( !processor_powers )
>> +    {
>> +        printk("CPUIDLE: disabled - not enough memory\n");
>> +        xen_cpuidle = 0;
>> +        return -ENOMEM;
>> +    }
>> +
>>       mwait_idle_init(&cpu_nfb);
> mwait-idle.c accesses processor_powers[], too, but that should not be 
> accessible since we don't make it into mwait_idle_init()?

Indeed.

> If so:
> Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

Thanks.

Jan

