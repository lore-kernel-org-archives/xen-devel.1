Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74A01CD98F3
	for <xen-devel@archiver.kernel.org>; Thu, 18 Jun 2026 12:42:42 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1341097.1601648 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1waC4n-0007It-1F; Thu, 18 Jun 2026 12:42:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1341097.1601648; Thu, 18 Jun 2026 12:42:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1waC4m-0007Im-Ug; Thu, 18 Jun 2026 12:42:32 +0000
Received: by outflank-mailman (input) for mailman id 1341097;
 Thu, 18 Jun 2026 12:42:31 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1waC4l-0007Ig-NF
 for xen-devel@lists.xenproject.org; Thu, 18 Jun 2026 12:42:31 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1waC4l-00D0Zu-48
 for xen-devel@lists.xenproject.org; Thu, 18 Jun 2026 14:42:31 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a33e7b1-5cb7-0a2a0a5109dd-0a2a45069ff0-20
 for <xen-devel@lists.xenproject.org>; Thu, 18 Jun 2026 14:42:30 +0200
Received: from [209.85.221.52] (helo=mail-wr1-f52.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.0)
 (envelope-from <jbeulich@suse.com>)
 id 6a33e7b6-b690-0a2a45060019-d155dd34e818-3
 for <xen-devel@lists.xenproject.org>; Thu, 18 Jun 2026 14:42:30 +0200
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-4629051c9d1so749690f8f.2
 for <xen-devel@lists.xenproject.org>; Thu, 18 Jun 2026 05:42:30 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4631217027bsm12600545f8f.12.2026.06.18.05.42.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Jun 2026 05:42:29 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:In-Reply-To:Autocrypt:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1781786550; x=1782391350; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=8EoPimGAL4EnRiIk4C2YS75y5PyrVnQdNRDMlQMcDoU=;
        b=dcIpEtM33RPdtyZBGYQXs1tGYVWQdfpZC6ExKnN2IwxaajJRqqkG5L4gCPWE8TdPkw
         MuQefrmxBFvzccH1NIgh1NqVE1H32xqhRCXPOIGFV4rWAoqU7NB3G7veqRN0+D2SDUnW
         TpkLbSVx8aAvwqk47uFMbyVedvcHEVB47RSxzF3u69achxV7XyHlwW8oytSJ7ISANBBA
         V7DpIu7tPc490XeAsryZI4Qw2DkVYFA8t9juQqLefPeTkOULYYZnHqYvwa3Nx+xt7puN
         Z4Fjr2zbbQ9AcvI21JOts+nDCCZdyMpD5RZBzY7zW4yl2Daocxn7bFUyniVE1RHdIEfH
         3ASg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781786550; x=1782391350;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8EoPimGAL4EnRiIk4C2YS75y5PyrVnQdNRDMlQMcDoU=;
        b=sjeD8xPCG/Mti119IVm6q0Vx8mxOm2sGCcMPJvKXo7kxwaXQ2/WtGgXCLIc7fANwdS
         fXEa/9KVeluUVqicrA7o88ImggPIDQJu+uVzthrBXYtjKab8CVgAu8OYtYOYjpWvziHP
         8lWHVxUTtIdb/7PFK/XjRitZAXVyc71GoRoRgikvBXubvpLlebOEOISpAifsL6yNUZPV
         2/ZJFOhzFoWxFvd1amSh+/44kMOPrnO9ZlanHfuVKNIP/cL6IXOgSdTC+mk+iwUu+/nV
         4/+P+qxsgOyfar0JdUNKDZelnz3iJlNxNYnIjHSueJ+4mfKM0U7R0eIbwpGm7Za/oUpl
         h1uQ==
X-Forwarded-Encrypted: i=1; AFNElJ/HfUVfcqEvIhO2jnJnOQNCjLWSUm/VTGD/BwaH7VDVel482Yl7UmLmVsX6oFJF+v7MYW5uFDctxWk=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz/uD06/bFdXEA0tRMJmgbIBhvgCb6SkTAitobWKCSjLdtmm3c6
	Vn0IBPWZvx3ZCwipE+lys59g/petRkFZk15vjX0OvrsIoHxeZppnWgMeIgu/up/hgw==
X-Gm-Gg: AfdE7cnV9+XOZTi6mwHDDX0zS7pB9CiKOOG60JBmuwxvOPqqs+2oewcqj4C0TdG6rs0
	zGCbWcBe5ltw3tudZpcgQB7S+QzIIF3k1hK59LIF+AMLmoEIVMbszuJ2IokK1Rch2JrLr+8K4pT
	O+QsMG48S2ybeFmFYzQaH79mE8fhgI6noGQwOYTNO8jKgExygiwg6pB8RrlbwT36gbQhRxJi7f2
	ICHm6DdfMoeA98cyKQqrZUEwCG34bALeXuqTkX8El0AUQgNbjqPFuD49GHX3DenIDd5wHuq9734
	2yVTt8dBjX9Y14kwfc/AJrqIOP9WUTS3iqPQRCZpR7YvJQrNQRaQzPKGMmG8M2Wz8BZ4RaZW8wn
	yOUxMKDTTH91T9IzKjtu6jQP7XCkHzb9beUxOJnQ2ZH6PEgB30v4+Abo2IjY42EOrUGxllVOE8X
	eYZJdvTYF6nUM/xpC6b6Mf/wdw3DehIH4xgafLlXcUpFOIsV8/sRBW1cYJCIvrSsbp4Uvu/pDQR
	o8QmO+hfvW1YlE=
X-Received: by 2002:a05:6000:4b01:b0:460:67b0:7544 with SMTP id ffacd0b85a97d-46235e98d0bmr13239725f8f.7.1781786550144;
        Thu, 18 Jun 2026 05:42:30 -0700 (PDT)
Message-ID: <243c5119-a016-49f4-919e-efa492b02e5e@suse.com>
Date: Thu, 18 Jun 2026 14:42:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.22] XSM: guard .sysctl() and .readconsole() hooks
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <bf642902-7235-45a8-a470-f164a930c0c1@suse.com>
 <8536e453-423d-45a0-bb82-38283eca4786@citrix.com>
 <0604a985-96fc-454f-b9a1-242bc6cce9b6@suse.com>
 <a3e51817-4464-4672-a975-ba76349bab31@apertussolutions.com>
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
In-Reply-To: <a3e51817-4464-4672-a975-ba76349bab31@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-16d1c6/1781786550-399F0853-505CB0B8/0/0
X-purgate-type: clean
X-purgate-size: 2337

On 18.06.2026 14:34, Daniel P. Smith wrote:
> On 6/18/26 8:23 AM, Jan Beulich wrote:
>> On 18.06.2026 14:13, Andrew Cooper wrote:
>>> On 18/06/2026 12:32 pm, Jan Beulich wrote:
>>>> Leaving the hook pointers in struct xsm_ops when !SYSCTL would lead to
>>>> the BUG_ON() in xsm_fixup_ops() triggering for respectively configured
>>>> hypervisors.
>>>>
>>>> While moving the #ifdef for the corresponding xsm_*() wrappers, also move
>>>> those for xsm_page_offline() (where the hook pointer field already is
>>>> suitably guarded).
>>>>
>>>> Fixes: c9eabaa03a68 ("xen/xsm: wrap around xsm_sysctl with CONFIG_SYSCTL")
>>>> Fixes: bddd9af6049f ("xen/sysctl: wrap around XEN_SYSCTL_readconsole")
>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>>
>>> Ugly.  We probably ought to see about booting the RANDCONFIG hypervisor
>>> too, which should be able to spot things like this.
>>>
>>> This is a regression vs 4.21, so does need including.
>>
>> Aiui it's a regression vs 4.20, i.e. will want backporting to 4.21.
>>
>>> Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>, although...
>>
>> Thanks.
>>
>>>> --- a/xen/include/xsm/xsm.h
>>>> +++ b/xen/include/xsm/xsm.h
>>>> @@ -61,8 +61,10 @@ struct xsm_ops {
>>>>   #endif
>>>>       int (*set_target)(struct domain *d, struct domain *e);
>>>>       int (*domctl)(struct domain *d, struct xen_domctl *op);
>>>> +#ifdef CONFIG_SYSCTL
>>>>       int (*sysctl)(int cmd);
>>>>       int (*readconsole)(uint32_t clear);
>>>> +#endif
>>>
>>> ... this is now the 3rd CONFIG_SYSCTL in xsm_ops.
>>>
>>> I know it will grow the diff, but can we see about collecting them into
>>> a single region, and in dummy_ops too?  It will shrink the overall
>>> result, and the order of pointers in this ops structure is uninteresting.
>>
>> I have a far more consolidating patch in the works, which is how I actually
>> noticed the issue. I'd prefer to keep things as simple as possible here.
> 
> By the way, I was going back through this and notices that they are not 
> ifdef out in xsm/dummy.h. Are we relying on them being inlines to ensure 
> that they do not result in dead code?

I think so. Maybe it's unhelpful that we have

#define XSM_INLINE __maybe_unused

and we may instead better want explicit #ifdef wherever necessary.

Jan

