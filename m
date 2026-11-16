Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F4BF606A322
	for <xen-devel@archiver.kernel.org>; Mon, 16 Nov 2026 16:50:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=XNwgBws9
Received: from list by lists.xenproject.org with outflank-mailman.1491291.1692140 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xSzuP-00082X-L2; Mon, 16 Nov 2026 16:50:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1491291.1692140; Mon, 16 Nov 2026 16:50:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xSzuP-00082Q-IQ; Mon, 16 Nov 2026 16:50:21 +0000
Received: by outflank-mailman (input) for mailman id 1491291;
 Mon, 16 Nov 2026 16:50:19 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xSzuN-000826-KW
 for xen-devel@lists.xenproject.org; Mon, 16 Nov 2026 16:50:19 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xSzuM-001QHQ-Q6
 for xen-devel@lists.xenproject.org; Mon, 16 Nov 2026 17:50:18 +0100
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6afb3445-bab6-0a2a0a5309dd-0a2a4501c3d0-16
 for <xen-devel@lists.xenproject.org>; Mon, 16 Nov 2026 17:50:18 +0100
Received: from [209.85.128.43] (helo=mail-wm1-f43.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6afb344a-5984-0a2a45010019-d155802ba5ab-3
 for <xen-devel@lists.xenproject.org>; Mon, 16 Nov 2026 17:50:18 +0100
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-4a9a8d6cea8so272195e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 16 Nov 2026 08:50:18 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb783f8220sm648545e9.5.2026.11.16.08.50.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Nov 2026 08:50:17 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:Autocrypt:From:Cc:Content-Language:References:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1794847818; x=1795452618; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :cc:content-language:references:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9PlopzTDntie1pFYTKWJpgecUbpN0L2zkM7CHaaUnVE=;
        b=XNwgBws9e0DdRxXD9deK3PrCuuxpX4j/wVNLvI9V9RVMeeSSl/ywPd1uFaUnxroJSN
         5FecGeeva1fdvxLdQMyu5Yu/96zBxrnxXyAMJ3dvwXsA5SOmRAMeOTRTctK/pOYpuvkm
         7V2JFVthgGMwdMj9wOROvLen6WQGOEAw1icexhwqUGwkaDfLt5RaHJIzz+ybU9LZq7bQ
         lMcTbN/FmBRJDbN/j+AaqDpfSEXz1PYsL8XuvzzWRJjSNZKlSdTgqsJUgAMd7wMyKkOU
         jMr4zFpsEuVIM/we1eLLLp79J/yn4Q+6exmHCU4TkoW84p1mvazfBHB34dJ/Kw7JO2mZ
         GYgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794847818; x=1795452618;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :cc:content-language:references:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9PlopzTDntie1pFYTKWJpgecUbpN0L2zkM7CHaaUnVE=;
        b=KwzbGUw3zZlRzq8BQbqxTmJljRZk9FuTBcVvlGO8lhaD7vtkCyv+pL1XdcDswQf3mI
         IjWMQO9riFhNqk4rTOxv01UeetvS0yJ3/ssQGU7H/vRScXk1Eo3lb+JcoVfZAKCzlX4a
         /MFa7LtPWWEtUJNfioGHtxTk/nsABQXOPGs3V2tXbStoHFUwZ2UYOgiY9Eqkz9sCwhWr
         SE2z1Aiekppwjse2IwWEo6bQG18vKrBz/yt0yT8oujHdG6z6AYH+AFZqwlxvuBJgZaDb
         E+P/8PTRwjJseWsoG67RjVjH0/AOkjKTduBY4upzpQXyDZofJGdAGtWIGKWmKZV5etjO
         fzOA==
X-Gm-Message-State: APuU4Z+fchrYSgLEFES6+u+f+9JOEbLiuDOGUR3JemLHPPqdi5cspJLT
	Ff3gPr+HzAJf3bYXddrpej3gtK3RxEgfLD6U3iopZmP2PBptQiN7vjf7H/3oOBiNjQ==
X-Gm-Gg: AYBFou0Jaw/hB6wvs6ka/fUM9fmOyyI2TV4pW/y+m1KpKJLIF1nvyoi80e4+B3D5yPO
	2rjdaV4siCofd5JyqXOtwceP3Gc446A6w/ARcoj2tHXX/g/90CXMmzXP/OSsDOAJ1SJ9t8DISqK
	kY3+USvza53oAHEteYzONqy0gq+XBkH4XE/F8bF/86M2fPDiJMTqYRr41p3x3q0D1EErpY/vsia
	LFiUk34q7V+Y/F/zpHdRuLGMqKjIEX864e/+VmeiOv50eQYOKRYWxKgzlwYXy9KygPNghxLdXop
	c5XGGjTmRGzgOuWmppghYicVlxRUS6Th/ghBZI7Em3SjGnB3246/vNXFVI7eL9fhWE0CiJcQ7r9
	6KOeRGZ+3JKjP8Py1vDuAeRp9O382pBi5onO5GonucgrhquBQsdjA0fPYLcBsdOEO44Z0WYthqC
	24Duk+qaSzYWJtwtDLB8b7lciYvfRbjDSOK6VzQcnIv4pZZWLDgADqp96Rg4EVKMxzuBDUGZMFi
	oyjMM/ilcLdhAE5SKG76BxQ70/XJrhOi1wX+4y8CaNyaorw17Hy9lDC3Kw7oPQa1Jiwd4CtEOLa
	32Tl1MZSm/iXXwU1aaVx0chNwjqXB2ut1qUNYk7o26DYMQGp5i10VXCNYgzzKKHr1h3/9s0C9i9
	t1hK1/lRgzASlCL53
X-Received: by 2002:a05:600c:81c5:b0:4a2:18c4:61a5 with SMTP id 5b1f17b1804b1-4bb7837a43fmr1688565e9.6.1794847818058;
        Mon, 16 Nov 2026 08:50:18 -0800 (PST)
Message-ID: <83f59bf3-89a9-400a-a34b-ff14f27c97ca@suse.com>
Date: Mon, 16 Nov 2026 17:50:16 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xen/riscv: bound each IMSIC MMIO regset by the
 per-group hart slots
To: Baptiste Le Duc <baptiste.le-duc@vates.tech>
References: <1794842995.8631fc262581453bbf619ec5b2062170.1a1e4faaa300006d3f@vates.tech>
 <c9bbf2e0-9334-423a-ace9-9e50ee712986@gmail.com>
 <1794847326.8631fc262581453bbf619ec5b2062170.1a1e53cc2430006d3f@vates.tech>
Content-Language: en-US
Cc: xen-devel@lists.xenproject.org
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
In-Reply-To: <1794847326.8631fc262581453bbf619ec5b2062170.1a1e53cc2430006d3f@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d62444/1794847818-1D87F757-D104AC1E/10/78276251493
X-purgate-type: spam
X-purgate-size: 686
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 16.11.2026 17:42, Baptiste Le Duc wrote:
> On 11/16/26 5:34 PM, Oleksii Kurochko wrote:
> 
>>> -        if ( mmios[i].size != expected_mmio_size )
>>> +        /* A register set must not run past the end of its group. */
>>> +        offset = mmios[i].base_addr & (group_size - 1);
>>> +        if ( mmios[i].size + offset > group_size )
>>
>> This can overflow for a bogus, huge size from the DT and then pass. As 
>> offset is always below group_size,
> Oh yeah, thanks.
>>
>>          if ( mmios[i].size > group_size - offset )
>>
>> can't.
> Jan, do you think it needs a new version for this overflow?

I can do this adjustment as well while committing.

Jan

