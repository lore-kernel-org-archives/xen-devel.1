Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8553FC55838
	for <xen-devel@archiver.kernel.org>; Thu,  6 Aug 2026 07:17:09 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1384262.1627276 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrsLN-0000s1-Gt; Thu, 06 Aug 2026 07:16:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1384262.1627276; Thu, 06 Aug 2026 07:16:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrsLN-0000rt-Di; Thu, 06 Aug 2026 07:16:45 +0000
Received: by outflank-mailman (input) for mailman id 1384262;
 Thu, 06 Aug 2026 07:16:43 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wrsLL-0000rn-Qc
 for xen-devel@lists.xenproject.org; Thu, 06 Aug 2026 07:16:43 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wrsLK-009R4U-L3
 for xen-devel@lists.xenproject.org; Thu, 06 Aug 2026 09:16:42 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a7434c9-bab6-0a2a0a5309dd-0a2a4509b588-44
 for <xen-devel@lists.xenproject.org>; Thu, 06 Aug 2026 09:16:42 +0200
Received: from [209.85.221.44] (helo=mail-wr1-f44.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a7434da-be1a-0a2a45090019-d155dd2cddf0-3
 for <xen-devel@lists.xenproject.org>; Thu, 06 Aug 2026 09:16:42 +0200
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-47f7854678cso1130104f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 06 Aug 2026 00:16:42 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49954228a47sm58644065e9.12.2026.08.06.00.16.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Aug 2026 00:16:41 -0700 (PDT)
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
        d=suse.com; s=google; t=1786000602; x=1786605402; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=afWRBDy6f/MYpbm8V8ND9nRxMaDsHk8GOgxRDVlc6g8=;
        b=IOHVQhLPbH/ZeFyOs8PNb/I516WzGBk97S+5dTFX28ODBWhONY1yWOYK6GUAw7251p
         pAMg05VTNT1CVO8OBOIHYzINXLCtuDvnmJNnLYW5OgFOsdSLIz7l9WBXLzkYoagkWB5Z
         FH+aGK0RJ+e4XPdyT2YXdZc4ypb0E0jr//d+vDsOE9slKpxRmfKoSNkMiCbXtmZt+yrI
         b2nVhMxK0FSHVt04PpeRuo7uGk5iy9H8qVcd8vEnsW7DbXn0KFMtVovmUhLV2gMkmPIF
         yqZwcnNm9QKSi1YUy7oxi1itncN+/ptPiJcjSgbtzcwBoS17nvCaySC3Ddr7dgyqnpPX
         OAtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786000602; x=1786605402;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=afWRBDy6f/MYpbm8V8ND9nRxMaDsHk8GOgxRDVlc6g8=;
        b=D7pNpfL+E8cJsNuUjTJJSmSHbJ02VmCCzzH4nJrVpOzjg1aVGXo6kE24GMXFhD/Nn8
         8cF2sl23H7qPJJ3Yu3qUqGzuQq4/CY8Kxe4/FhLbL4g3ppocBY6Vh/hkTFa2ZEipw6ny
         sv3Vu358TRm34gYfHvpEIcZwp0MYcdZ9vurbaO14RN3CmwBKQYgKLC31ikh0qjYM0/OG
         zfdP+RcJZcOUpyqCsQeh49eszEShjO5oKwpSY6iAnNEjOCotSmM+RgJnNqwhWty26tKo
         svzv3XOwpe4O2CjnwBVFhCKVBYJFBDcPTV7LTREgbE4yPHbnEBOCm0/Zo/jKe9EroP4R
         2frA==
X-Forwarded-Encrypted: i=1; AHgh+RqmQ42yFp6s6Flo5sXzobxOV18yXG7I4c9Yttvqae+8YyFlLiVN0n22x4RTN3HeiqxZUPBWHbp7YhM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwFT/x4QB7KdqCQDmnK2XyWMZ9JMuHLYKqwNoUnbjJs1Jx8T98R
	SqvYXHU3qQVRA0Ocdk0Jx1z88W1STBSUwgoGfkWbndq0+Wh5WOBIeBfSpwJAllT5XR1WaAKcoHr
	EOh/NZw==
X-Gm-Gg: AR+sD112NOjNHdOu7Mexm3U1+vNEUs3v3VDVBBATDEAmddSPAAJaN1hOcESsNy9reCV
	1tgXK8bmHXSv1J5UegqDNO3ist8Dj/ssiavaIAw3qrlZWp0fCpI+UhzVxPIt/iTmjzAWyB1wM0a
	2O3hOn9UBYlJoYkUD9WCIfp2e5DgraLuBi0OHh/GrOSgSD4l63Nduv1mu0cugn4ZGCdkvH7LiwB
	kVvaJqehmwBMjMs4rzINNdcc4YCQu1mVEDPJfunkS/fJQgP7vMkMwoUm5mmzsh1DP6R31Mof4WH
	LbVKQj1hMNIFYDYMzsQ8XpnxRkO0PQvcvIYNEFDHOvXeu3iB+S4PmKf72S0XRweXoaWTd3IGC+p
	IaH5d9uldclscEnsa0v09Rxp4VY0oJaBc5aqOSK7UPoY0VavicgfSN+aFK5EgfRmlgJhQInxKZn
	g4hWcxuIblhiXLl7fvn4T+dAAGKvlSqKkLLEjVQr2vknUdvsdCCFmPR8Q9QxxI0ytA3ej4xH/Fm
	cfhymPoXlowiBpDClhRddaF05zZ+8QsRZdkM08geQGbilOCDzCM97R/WKIIT6w=
X-Received: by 2002:a05:600d:8489:10b0:495:4749:16a7 with SMTP id 5b1f17b1804b1-4994e7c5e9bmr143037545e9.14.1786000601911;
        Thu, 06 Aug 2026 00:16:41 -0700 (PDT)
Message-ID: <7762513c-0d3a-465a-abd9-73e3ba586556@suse.com>
Date: Thu, 6 Aug 2026 09:16:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 17/24] XSM: make Argo hooks well-formed ones
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: Jason Andryuk <jason.andryuk@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <758c8410-a18e-45dc-8944-5913e5832397@suse.com>
 <4bd4e7f7-e005-45b4-a543-98597a9de707@suse.com>
 <6991badc-dcc4-44b9-a048-29eb67c46d2e@apertussolutions.com>
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
In-Reply-To: <6991badc-dcc4-44b9-a048-29eb67c46d2e@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-bad1c0/1786000602-BD2CC034-198D6D2D/0/0
X-purgate-type: clean
X-purgate-size: 1053

On 06.08.2026 01:02, Daniel P. Smith wrote:
> On 7/28/26 9:22 AM, Jan Beulich wrote:
>> @@ -2307,7 +2308,7 @@ argo_init(struct domain *d)
>>   {
>>       struct argo_domain *argo;
>>   
>> -    if ( !opt_argo || xsm_argo_enable(d) )
>> +    if ( !opt_argo || xsm_argo_enable(XSM_HOOK, d) )
> 
> This question came up on another thread, so thought I might point it out 
> that when FLASK is in use this can return a nubmer of error codes beyond 
> an access deny. While I know it's the existing behavior, but if the 
> error code is anything other than -EPERM, then it's not that the policy 
> denied the access but something cause a fault in the security server. In 
> that case the domain is still being allowed to construct with the 
> assumption that it was a policy deny. At a minimum should the error code 
> at least get reported, and perhaps it should be passed up to domain 
> construction to allowing it to make an informed decision on construction?

Sounds plausible, but definitely wants doing in a separate patch.

Jan

