Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E4BF606A324
	for <xen-devel@archiver.kernel.org>; Thu, 29 Oct 2026 07:13:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=O6mau2xZ
Received: from list by lists.xenproject.org with outflank-mailman.1464235.1674969 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xMKKC-0008Ta-Gc; Thu, 29 Oct 2026 07:13:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1464235.1674969; Thu, 29 Oct 2026 07:13:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xMKKC-0008TT-C2; Thu, 29 Oct 2026 07:13:24 +0000
Received: by outflank-mailman (input) for mailman id 1464235;
 Thu, 29 Oct 2026 07:13:23 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xMKKB-0008TN-4i
 for xen-devel@lists.xenproject.org; Thu, 29 Oct 2026 07:13:23 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xMKK9-00G5lM-NJ
 for xen-devel@lists.xenproject.org; Thu, 29 Oct 2026 08:13:21 +0100
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ae2f201-8faa-0a2a0a5109dd-0a2a45029b40-40
 for <xen-devel@lists.xenproject.org>; Thu, 29 Oct 2026 08:13:21 +0100
Received: from [209.85.128.44] (helo=mail-wm1-f44.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ae2f211-6ca4-0a2a45020019-d155802ccd6c-3
 for <xen-devel@lists.xenproject.org>; Thu, 29 Oct 2026 08:13:21 +0100
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-4a20bdaf39cso19025145e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 29 Oct 2026 00:13:21 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e3ebc3932sm33957511f8f.18.2026.10.29.00.13.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Oct 2026 00:13:20 -0700 (PDT)
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
        d=suse.com; s=google; t=1793258001; x=1793862801; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kBA2wbAezOQ0h0cwG79l8WxR5+Zyx74ppDFGMr4jtsg=;
        b=O6mau2xZqF2wJaWFQsa5jVG4M5aTZSPF4My3LR7Je/tvQBBEr1Jn52zGnlENL/QD+v
         SHBan30HeIyj6fgFhrpkNWOVVCN1+5cLkC34Pza8szvG4VY4fnDKFxg6VJszEomQ4St0
         +0vMPLltDnDiWV6lJc7PWcZDfQi38xUwur4MzcYiVbTdSOEYGpgJBSRW49puLhqj/h1j
         k/moN1vLC4jBDqFTaYS33Lx41VNcbx9Rrq1y3EZ1pIfhu1zkOAdLMYApRS7FZ49m3DcM
         visfcCwfJxUhUqqxCWqOVYtDMNEozKRcJrIarUNArDtHP7veL8n7z4wU4hE7Ti4gIv0p
         guug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793258001; x=1793862801;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kBA2wbAezOQ0h0cwG79l8WxR5+Zyx74ppDFGMr4jtsg=;
        b=FDoFTqxkc5DopkUCUbp05j9yIsKVwdkrPbnVErooHqyx+0WGCKA8IZ8IU/ADVArNYR
         mEEMXexGdBAP+e0BvIzNchpExdS/u6BIL8yOnELjx5zZgG0yOxHWh8CxhX3lVtZWld0h
         krTttHAd+PQ4omoyWJ50oX2ge7WKjTGmYcTx1KzNNffgMTN+uI4ROkZkRlGbrGSXKCwQ
         dWUQb0LBZtK9hFd9rmoUcypLWOs/gHxu0n6aBQscPi7wlQzd8UElUMOVzZot1mzWCovD
         a1vpfMBT95lJIK5+w3a2l6nxMYVU5VHKA/GRi5bmXUcnyvbfhHn2JPiXeXsTN94ze6t7
         W8Gg==
X-Forwarded-Encrypted: i=1; AKwUvByiOpiQiKdUa8YdEj4/dM7IQvcBY6bkGHi8JWwU3zJuiVyiilKLJxjEukoB2nh9l4mVV0a3Q/1YjQQ=@lists.xenproject.org
X-Gm-Message-State: AFq9FYLNUp67zJNCopav3JniSQXBix3maHlzjvC5/wywtq+lHtBwS7Cr
	wRR2eq70fbq+IUX00nSGXDBf2Hz34lwlLVShLVxHPJ5L/U9drZu7Von9VTpDjzfj1g==
X-Gm-Gg: AYBFou1HRqMp6VBX1XrVnFZpJ1PF77GJX0OIe1/6bO6VMizf219WC5jodtA4tIVEEAF
	0aChQrCrDAKA3slNA3ZegQmmBo6jjOXdcfnAc1UPVrKB/5hwDoT/XDMroJKrSNgXapruzSQReEV
	bLzAo7mxwlTcrhvEWbF/XtkWGguGDJzY2XQTRtezb3I6nY0wAoruAUI3XzOwTVOJSYdZbfIVufn
	8B2yfdZraAif4mdc5EogNisIa38uiCTvJRpC1M7Ci+Wb+VRw7K+85nGc/uUXJECg6P2WpA/tR/i
	NHx0otw2Xr0cHKrkLtLyRPD/f47lrL1bLhR8VQEn0eNsY7WCS3b18TrPXObXpkkHUrcY16vZamI
	ugq6ah017zqGAHwN464nDUnwX2KWB+bnIL/t5KIQMslnf5Sqq8ie+xGyIARa8+tSpF0IRORDUfG
	MYSfHYAzO7211wYy/SsEy4QNJlZBAH/uwevZqcjffs0yeNndxt+vzH7iJZXTT0hnrw8U0xofz6D
	LGC73oGVeAnoppRtARSIWAkAW0wyJurK0LANLUDAZNn8QwN0fcbWUXgK/M9nku34yrXPHqovpar
	ZpKvm7KvvoFF3xMOsA9KHX9EYAfFKcTOl8FGx5zjlL+n0DARJ57iP1k1YDM4ghITWppQaWDvJnD
	cczpQZGY7epxUgVjIzg==
X-Received: by 2002:a05:600c:4e01:b0:4a2:190f:cf6a with SMTP id 5b1f17b1804b1-4a967ca03demr105721145e9.35.1793258000809;
        Thu, 29 Oct 2026 00:13:20 -0700 (PDT)
Message-ID: <fa74b1a6-55a3-498d-ae0b-29028f879c5f@suse.com>
Date: Thu, 29 Oct 2026 08:13:19 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/mm: Remove loops in get_order_from_{pages,bytes}()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20261028124104.1564435-1-andrew.cooper3@citrix.com>
 <7128c617-9432-4571-9b7a-22d6f6e8d884@suse.com>
 <78279123-37d2-4acd-85b0-2bfe1fdf61d0@citrix.com>
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
In-Reply-To: <78279123-37d2-4acd-85b0-2bfe1fdf61d0@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-720697/1793258001-F0EA32AC-5FA78554/10/78276251493
X-purgate-type: spam
X-purgate-size: 1402
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 28.10.2026 19:07, Andrew Cooper wrote:
> On 28/10/2026 2:15 pm, Jan Beulich wrote:
>> On 28.10.2026 13:41, Andrew Cooper wrote:
>>> --- a/xen/include/xen/mm.h
>>> +++ b/xen/include/xen/mm.h
>>> @@ -530,26 +530,16 @@ page_list_splice(struct page_list_head *list, struct page_list_head *head)
>>>      list_for_each_entry_safe_reverse(pos, tmp, head, list)
>>>  #endif
>>>  
>>> -static inline unsigned int get_order_from_bytes(paddr_t size)
>>> +static always_inline unsigned int get_order_from_bytes(paddr_t size)
>>>  {
>>> -    unsigned int order;
>>> -
>>>      size = (size - 1) >> PAGE_SHIFT;
>>> -    for ( order = 0; size; order++ )
>>> -        size >>= 1;
>>>  
>>> -    return order;
>>> +    return fls64(size);
>>>  }
>> Along the lines of what you do below, perhaps simply
>>
>>     return fls_g(PFN_DOWN(size - 1));
>>
>> (and nothing else in the function body)? And then even
>>
>>     return flsl(PFN_DOWN(size - 1));
>>
>> (eliminating the immediate need for fls_g())?
> 
> Neither of these are quite correct.  fls64() can't be downgraded to
> flsl(), as it would truncate the input on 32bit builds of Xen.

Only hypothetically: get_order_from_pages() taking an unsigned long is
okay on 32-bit builds. In fact in principle get_order_from_bytes()
could be implemented by calling get_order_from_pages() with a suitably
adjusted argument.

Jan

