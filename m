Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D98A3C531F9
	for <xen-devel@archiver.kernel.org>; Tue, 28 Jul 2026 11:37:35 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1372405.1619753 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wog7e-0000Gf-FP; Tue, 28 Jul 2026 11:37:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1372405.1619753; Tue, 28 Jul 2026 11:37:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wog7e-0000GY-Cl; Tue, 28 Jul 2026 11:37:22 +0000
Received: by outflank-mailman (input) for mailman id 1372405;
 Tue, 28 Jul 2026 11:37:21 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wog7d-0000GR-Me
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2026 11:37:21 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wog7d-00EWB9-33
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2026 13:37:21 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a689467-bab6-0a2a0a5309dd-0a2a4506aa3e-26
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 13:37:17 +0200
Received: from [209.85.128.52] (helo=mail-wm1-f52.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a68946d-195a-0a2a45060019-d1558034ed36-3
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 13:37:17 +0200
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-49553515a8bso45907215e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 04:37:17 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4957f99fa7asm338591525e9.2.2026.07.28.04.37.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Jul 2026 04:37:16 -0700 (PDT)
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
        d=suse.com; s=google; t=1785238637; x=1785843437; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KO+vepVVChYrRf1OeanOvt5rsUQJC5BlGco1fvpvUdc=;
        b=GMXHYaJKwHyqY2Ni+JjoNlpSIifUq/X6JpAgVRN4XHhSi4wQBVp7Hx6JpvL7ERFYq9
         7PgS+l9cccy/j6jpMUqmbUEHGvrYrFs5TR70QCSLpntmL0wt4FINRFwQ4UbpYfItX5gd
         Cubqh9PzwvfblpQCKwWgnCwjh0L9zIY75B6ZgNJM4CXhpiB4uhAQRgX4uER6uOZ2uyzP
         ZpyihURIT/zTLQInukK3KvnonEGwerONOjYaxv3Dtj2tWWaFlKTCX2cJV/mckBRzBWCD
         KB95l6O3VXb68lo09yLtu9py9vO9If3U8CJQCzp/B/PZsY9HVZ4MKeINTxmt+Tm5SWgc
         PPlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785238637; x=1785843437;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KO+vepVVChYrRf1OeanOvt5rsUQJC5BlGco1fvpvUdc=;
        b=qX9SJuYTkoxaX24L1DKI8QQuWFriFNyTIDqyRAvKV1vFsOBEvud/D85bYL2VWANOQZ
         pQjQvLeicqsT78WCzI9AZiuD1W6YjF38mFTsa5oDhCpktMUxJggxCSa83G8mvMKtHa2R
         n4gzpDykHZjt3gxu/KVfidCAHUW6K1P62mO/+e9tpv76y4FYGYxP8LbtqVKqOADS6Skf
         dyoRKTrt0t5OU/rH9gIUlSKypbLRaPnW5GI3Rhitc4K9CohsgSMkKitTl+2JLfRUiGxG
         /1RLDLyk52Vwhh7L2WKAQDKRq2ygUs2FsRhWGuPTRNkXhniGYISITf85piLWb7ecRD+Z
         eqYA==
X-Gm-Message-State: AOJu0YzlXc6UtH6VXa9j1zd+oByr0uuPwRfhnhGYs+1VhkAwGE9oW3cR
	0lJfj466htz9P0WQEPoix/pLD6HNBEvbZH15H9LLup17MZVx41dJi8cKGdMZJoENPg==
X-Gm-Gg: AR+sD11xBTDCc/BOlvKRfOBaLE/WUvOMXeyDSL232029UXHT8FnvxfXwtrIZWU5yUUy
	kiqGS5eSQ9YXBQNESyDJH1R5Vyy3QgStOyYaHHAPDUwTNe3iewOCumEDYTe+v9L6vwdB3JyDNBr
	KjDSAgS8Jdq8jA/OKPzPdGAtYyTNSlM65GtPeT+1r0pAGoOF0Xv28AJW4aSKfFsHOYB/KPjR37I
	zFAR7rSaV3e4PbWWMUsprD7wgdFa4H2IU0U7Kkz1SL5Wm00ymwHEw6CQknJsOOBon5dhxFC5AjO
	S4egbMujermdEEOApErJIbxmbLwRBLPEU9w5Qfa+b35Yiy+U10Xd6T2qVqf/FeRrJb/Pl3MOa0p
	MSsEuwp5teiT84/hBqk1dTO9c8unVlXUMbocS8hWWUXMFEgBDG2XPHkzh00LzakeK35txflnZ81
	GMvy9tseJir+gFnGEZRxNDlJMN/edbqG9u6SEY4G6VMlQ+xG6OOXy5TqbJy0pqtZvXiMeWv5BUZ
	9kt
X-Received: by 2002:a05:600c:3f10:b0:495:7278:95c3 with SMTP id 5b1f17b1804b1-496c657de59mr21010875e9.26.1785238636690;
        Tue, 28 Jul 2026 04:37:16 -0700 (PDT)
Message-ID: <fff1460b-7ec7-44f0-9772-35fb5bc87cb9@suse.com>
Date: Tue, 28 Jul 2026 13:37:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] time: add "NOW() good" indicator
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Teddy Astie <teddy.astie@vates.tech>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <f5040939-b166-4050-9a27-117b772547d4@suse.com>
 <b7513795-9e4b-4358-9d46-6c7036d64b81@suse.com>
 <amhlnWAwF-AS_sH7@macbook.local>
 <baddc2f7-deab-4727-a688-a6fe30f7fb89@suse.com>
 <amiFV3IWZUoaT57V@macbook.local>
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
In-Reply-To: <amiFV3IWZUoaT57V@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-16d1c6/1785238637-1EEC477B-BBB15F33/0/0
X-purgate-type: clean
X-purgate-size: 1372

On 28.07.2026 12:32, Roger Pau Monné wrote:
> On Tue, Jul 28, 2026 at 10:24:38AM +0200, Jan Beulich wrote:
>> On 28.07.2026 10:17, Roger Pau Monné wrote:
>>> On Tue, Jun 30, 2026 at 04:06:00PM +0200, Jan Beulich wrote:
>>>> --- a/xen/arch/x86/time.c
>>>> +++ b/xen/arch/x86/time.c
>>>> @@ -2660,6 +2660,7 @@ void __init early_time_init(void)
>>>>  
>>>>      set_time_scale(&t->tsc_scale, tmp);
>>>>      t->stamp.local_tsc = boot_tsc_stamp;
>>>> +    NOW_good = true;
>>>
>>> Would you need a barrier here to ensure compiler doesn't re-order the
>>> writes?  Maybe using ACCESS_ONCE(), or a smp_wmb() like it's used in
>>> other arches?
>>
>> Aiui it isn't needed here. The compiler can't re-order the two writes,
>> due to our use of -fno-strict-aliasing. The barrier is there on other
>> arch-es to avoid re-ordering in hardware.
> 
> You are the expert in compilers, but it was my understanding that
> `no-strict-aliasing` only affects the ordering of pointers accesses,
> but not plain variables.  IOW: NOW_good accesses could be reordered
> because it's not a pointer.  Does the compiler consider t can point to
> &NOW_good and hence it can't be reordered?

Yes, that's my understanding of how this work. (Yet no, "expert" surely
is going too far.) Things would be different if NOW_good was a function-
local variable, I think.

Jan

