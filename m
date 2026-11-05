Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3109E606A31B
	for <xen-devel@archiver.kernel.org>; Thu,  5 Nov 2026 08:46:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=FaGNI+az
Received: from list by lists.xenproject.org with outflank-mailman.1474261.1681429 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOt6d-00018m-Rm; Thu, 05 Nov 2026 08:45:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1474261.1681429; Thu, 05 Nov 2026 08:45:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOt6d-00018f-Oa; Thu, 05 Nov 2026 08:45:59 +0000
Received: by outflank-mailman (input) for mailman id 1474261;
 Thu, 05 Nov 2026 08:45:58 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xOt6c-00018Z-Lc
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 08:45:58 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOt6c-00H0qS-28
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 09:45:58 +0100
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aec4240-bab6-0a2a0a5309dd-0a2a450ba346-26
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 09:45:57 +0100
Received: from [209.85.128.44] (helo=mail-wm1-f44.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aec4245-b7e8-0a2a450b0019-d155802cad94-3
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 09:45:57 +0100
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-4a2d6cf958bso7312655e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 00:45:57 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4b57317cae5sm76351085e9.12.2026.11.05.00.45.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Nov 2026 00:45:57 -0800 (PST)
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
        d=suse.com; s=google; t=1793868357; x=1794473157; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K15PiFSSM+eb88EEsPfu/1IVaBMnNivmxxIMNCBIvK8=;
        b=FaGNI+azuAKI6zUPPaZaTyoeKCM+pf4kt67wddVWdaQGh/QkorT5BF6JuOpCkLguKN
         fGEbk3HCrQne0tZHXtfT8616Gre8BQ0cQnjAEpSiccOD5vyWIBoNix0YxITl9BqrW+3W
         gm6/gKMir1tSikPwDFOovOxdnL+zWB0hqOi1dowPznMmaw+xtaBoNQdKMjdyka90Zxo6
         x9ltIiF0kGGJAxdfVuPsfQihws4GAiJxcHpkB6hqZRuEvIPVehSuvopGbvafWsucHDw8
         yXd5Uiq3L8a+kiu5V8j6rZM1IdNuElP04GeTaDmKMO6HzmCp7jTWyYUAh05YWf5z6Eei
         XbrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793868357; x=1794473157;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K15PiFSSM+eb88EEsPfu/1IVaBMnNivmxxIMNCBIvK8=;
        b=It1CuBaMcaiGrUAvIPySwOCSeJ7/O20XRK/HyoflxxU5mp+20GULvvumv8pS3nBKHx
         4GgtnEDPsO/fY0zPR6BpGLeAUVQPX7qikbo9CnnnGowQ0UDLnRBku0WFTTzaSSShEecj
         gbm7idTxfSKZHZRWzyEi6osPW+ns0B98QW4EFBf9ARFHY+dFxh2Vv0p2HsVCcJgj0KiM
         zcn7juBHzCyysJhip/1Gp5WvQCd1m4coEzdxJOxeNZE7rVLLvkMIoQc90OLIvoHe7NnA
         35yzJKBcwEdu2NL0XSa9e7BRBBfTGDFu+p4Ja0/rWLsNcG6EAwZAJMXpbO3uYXo2n2Rr
         nUEw==
X-Gm-Message-State: APuU4Z8zQ5SqJ+NLBKy/TyMXY10dc9sIwxTPCI9ACtRYabD0CbQlWbns
	oWGP7VN0lCnNeKJhDBAmUoyfJXfbMyIp18oGicmcFuxxICr40pnOUt9tVhSgY0CR2Q==
X-Gm-Gg: AYBFou0aPCrnIlI0H3YhdCtJrg/XhE3ACP4w+RTmar50S/TjOIoeBtN8imoVsrqdLBv
	s/lF8oZ5uHZzlRkCVm2+I6I4tQFbToPZRCdnrpFfyjppoabz+8sdasNcofepGt/hZynhQZ4NCZR
	t9zQncqSOUH3dwKXec6/z1sbexEnIMGDvkT1QY+3cyr2TT/dAHxdKukYDs6aIrSWWwNqh/ZTbEt
	yayPEbBEN9lQmATQzV/a45AWWVfTvaXTENBJXhsMY+EoPxb4x43Q6tsB8QKuGdzirDBJsJSzXiH
	VnAFHHYBPRoHssWnryzctbOGAxi36u7S+KDvuTfQ4RRGZ7mFDiTdMW0RS/uaRt82sAjXQlr9QOB
	JeolUffexYyF2dqwTo29oaN+C23UwudpC4LbSmBv2WVV/OCgtlVW//HOhChmvz47uUiSMC/J4dS
	7H4n/5mXeq9wr3AajID5HYPjbRYLwt70pr2lyYA0wxW2GhikBWw6dyxMf0J29dPxsGXei9E1Xrf
	JahbyObomzpB2uk568JH7P+SAfQ14fKx72cuIiQ3pXuGxmKqs2ZzWfETqR5Mr1ym1bASW5pSH3I
	5y657H+Pcns27b69M9V8FTHJ4t8BSUdZl7HOtw2GMkGCoNY+ZZRHNcl6P0e3q1ItKXdiT62pDmD
	ngOiUEh2h/sLDMh8L
X-Received: by 2002:a05:600c:1f93:b0:49f:ce78:356d with SMTP id 5b1f17b1804b1-4ac180f2fd3mr428805605e9.30.1793868357355;
        Thu, 05 Nov 2026 00:45:57 -0800 (PST)
Message-ID: <1d458862-d4d1-4b5a-8a38-983a725900c3@suse.com>
Date: Thu, 5 Nov 2026 09:45:56 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/15] x86/PVH: try to map initrd directly into Dom0
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>,
 Marek Marczykowski <marmarek@invisiblethingslab.com>
References: <1b4c2bb4-118d-497c-8d7d-f3824fd61a73@suse.com>
 <78cd46cc-84ed-46df-96c9-26ce97ed0da0@suse.com> <atEADbxD4mL_bXy6@Mac.lan>
 <ac9eb028-6585-4318-b0ee-e6c86624722f@suse.com> <auxARAN_1uokz3Kp@Mac.lan>
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
In-Reply-To: <auxARAN_1uokz3Kp@Mac.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-42698a/1793868357-194C39EA-970121BA/10/78276251493
X-purgate-type: spam
X-purgate-size: 1949
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 05.11.2026 09:37, Roger Pau Monné wrote:
> On Thu, Nov 05, 2026 at 09:06:15AM +0100, Jan Beulich wrote:
>> On 15.10.2026 18:32, Roger Pau Monné wrote:
>>> On Mon, Oct 12, 2026 at 10:25:11AM +0200, Jan Beulich wrote:
>>>> Why does find_memory() go upwards, while find_kernel_memory() goes
>>>> downwards? And why do we use the lowest part of the region found by
>>>> find_memory() rather than the highest part?
>>>
>>> find_memory() should probably start downwards from 4G.
>>
>> In the course of replacing that find_memory() by pvh_steal_ram() (while
>> converting to rangeset-based tracking) I learned the hard way that this
>> isn't possible, even if it ought to be. Linux won't cope with parts of
>> start-info (at least the module array) living outside of the first Gb
>> (in 32-bit Linux it may go farther, depending on CONFIG_PAGE_OFFSET).
> 
> I assume start_info itself also needs to be < 1G then?

Looks like it isn't, as that's getting copied before enabling paging.

>> See pvh_level3_ident_pgt[] having only its first direct-map entry
>> populated, and pvh_start_xen() also only updating that one entry. Which
>> causes xen_prepare_pvh() -> init_pvh_bootparams() to fall over anything
>> living beyond the 1Gb boundary. (.memmap_paddr would apparently have
>> the same issue, just that for Dom0 we don't set that.)
> 
> Hm, that's unfortunate.  We should fix Linux to the bootstrap
> page-tables identity map the whole low 4G.

Blindly mapping the first Gb as Linux does is already a problem imo:
In the first Mb there very likely is MMIO, which shouldn't be mapped WB.
Further up there may be MMIO as well, yet maybe that's unlikely. Up from
1Gb and below 4Gb there definitely is MMIO again.

>  In the meantime, we keep
> allocating upwards, and hope we don't cross the 1G boundary.

A hope which breaks with an initrd big enough to fit below 4Gb, but too
bit to fit in the first Gb.

Jan

