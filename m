Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A59A3CA5FD9
	for <xen-devel@archiver.kernel.org>; Fri,  2 Oct 2026 07:55:29 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1438890.1657418 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xCY6r-0003xc-IK; Fri, 02 Oct 2026 07:55:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1438890.1657418; Fri, 02 Oct 2026 07:55:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xCY6r-0003xV-Fk; Fri, 02 Oct 2026 07:55:13 +0000
Received: by outflank-mailman (input) for mailman id 1438890;
 Fri, 02 Oct 2026 07:55:12 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xCY6q-0003xP-5f
 for xen-devel@lists.xenproject.org; Fri, 02 Oct 2026 07:55:12 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xCY6p-004E79-69
 for xen-devel@lists.xenproject.org; Fri, 02 Oct 2026 09:55:11 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6abf634f-8faa-0a2a0a5109dd-0a2a450bc5f6-46
 for <xen-devel@lists.xenproject.org>; Fri, 02 Oct 2026 09:55:11 +0200
Received: from [74.125.225.140] (helo=mail-wm2-f12.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6abf635e-b7e8-0a2a450b0019-4a7de18c8358-3
 for <xen-devel@lists.xenproject.org>; Fri, 02 Oct 2026 09:55:11 +0200
Received: by mail-wm2-f12.google.com with SMTP id
 5b1f17b1804b1-49ffe281cb1so39042225e9.1
 for <xen-devel@lists.xenproject.org>; Fri, 02 Oct 2026 00:55:10 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a03ff2280csm33320675e9.4.2026.10.02.00.55.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 02 Oct 2026 00:55:10 -0700 (PDT)
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
        d=suse.com; s=google; t=1790927710; x=1791532510; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rnKaHBPZaXwRCbMo9jpqNWs0SPqXXv30JCnFfVvGJiY=;
        b=IsU/ATKnhz1tx7lr1KYkJw12/GWcj7gCH9zAZd34NuXXg2NPfoUjIdBzDgjxRFKObB
         YhHPYYrReR4sQVxwho0zzIw7WdE1XF7D41t15HcWDoP07gkI6bFh9D11l2B6PU3dtyIM
         hk28VTvnuDU/1aKGs7mPseATLhFn93i5nWCvyUOYjcMAjtm+JMvrNzulLeiVWM3NSiLF
         vOGLcIWQs9d+oUKUH2E1xhhbh4Uh4PR5WMGiWsJNaA0pVUWFBDbIGAPR9NUjpWE7uknF
         NXzMA+EbTAOKWHkr3cODXwVwudELg2SPEhr4OG0MlrnHVAcya/6q4P62vUt1SRc2INK+
         QHvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790927710; x=1791532510;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rnKaHBPZaXwRCbMo9jpqNWs0SPqXXv30JCnFfVvGJiY=;
        b=NzN8B3ZwMcc2c9PE7ULhu1+mfkX0PPYmMHPlA8X1dMKpfG5zBuDJ9SaIYYQXDdZO5h
         6YGt56DFDbOpPVIvJoQLjGfN4kJzE3G/X0rLw3uYApNssZhmR/1CzF18uCCiLLiOae4n
         zITNIOqa6AnYZlqxbZru/Abrymi7jmu+uZN0GkYmfhgDwj/2+MJLIjnHUHn28pB5raZ+
         T8CxkxuynbFLm58N8S2u805kB3x6SoBmDX8CGu7xjJwap7lGgumlHJa7IhUkLLW3+YPC
         TlyKMjOCrvAdKolpclshMZlqnboFvve0ARdzFYBxClFGjhu06Zh04KxEi+QC566uS55w
         nyww==
X-Forwarded-Encrypted: i=1; AKwUvBzO98gO/rebuMuhnJAQ/bHVhLFHlne5VlSfhfZrfBT6E1IOXr+Nhiseik5avY550XQG0Wjlkilp5zM=@lists.xenproject.org
X-Gm-Message-State: AFuF++lrH6D8g4lJpK9J3iv23VIWRyujmvgzI3hHCzu8lrXMciCAYmQf
	fY+EUYAirNqHEFtH2vjj6vAkUI2SZuAyJ5kS6tc8ZmB393y+7eYJrB48fl7ZNhzqLw==
X-Gm-Gg: AYBFou2+kEdZpRm6muZNlGuEnUk5j/PXvcIfBePaYRdupDQhkWgcz+wHM+ZTuVbUCOC
	Ft1gWgu+zS+cIJ3Js+cI8gDpTtWPwZH8UODjknb0NQxX52rRB1xOYYpCO3blaOx8Ge40avrMWTd
	5ZqvvrqUj7v0eM465CMxux4KeYDJWxavpsgbGzEvNCXfdLq4MAzv+jbA1tgG50laWKpqZCVjeKl
	jeTN7T3yzURc3L52zgFp9zHeWZdX5bi0bqwAtHmcaDJ2aE7CEuzl/Yvf5PG3+9CnoJ7znn0RhnK
	rDqu1QwsngcGa+9w6ezreBuUpLBLHCCmsEKiXJCopNGvOQyQFvPJCjdL3KgBk7YMvlmzTYysmXy
	zgFa5Ld1UpO1/QKOklCDb9rC2hrS5pnqzjYRSEFgoq1kUO/0QkON6NF5wU4Z/1J6YjEZ2YWb3ur
	tVS04sERYxhvfI3egwMn9vD27lCeaKy2qllf+cwVIeNJtB6ZoC/oTV7Hrow75HBeVdg+oRzULUL
	5/gVgNoru3ZvKrJJbpRuQ0MOxoq7B/C9BAx4A0tpUswGTS1KZyhrG9pFtAVuA==
X-Received: by 2002:a05:600c:6d1:b0:4a0:1b14:ce81 with SMTP id 5b1f17b1804b1-4a0274e9a8cmr22981905e9.3.1790927710440;
        Fri, 02 Oct 2026 00:55:10 -0700 (PDT)
Message-ID: <4eb32155-1b04-4f04-ab9b-f30e584cb033@suse.com>
Date: Fri, 2 Oct 2026 09:55:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/domain: restrict context switch hooks for the idle
 domain
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>
Cc: Grygorii Strashko <grygorii_strashko@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
References: <20261001142757.98255-1-roger@xenproject.org>
 <f3754c45-7899-4e76-bb29-dc8deca0903b@suse.com> <ar9htQD7BC6dRCRS@Mac.lan>
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
In-Reply-To: <ar9htQD7BC6dRCRS@Mac.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-42698a/1790927711-AA6DA9EA-9BAC2290/10/78276251493
X-purgate-type: spam
X-purgate-size: 1280

On 02.10.2026 09:48, Roger Pau Monné wrote:
> On Fri, Oct 02, 2026 at 07:45:07AM +0200, Jan Beulich wrote:
>> On 01.10.2026 16:27, Roger Pau Monne wrote:
>>> --- a/xen/arch/x86/domain.c
>>> +++ b/xen/arch/x86/domain.c
>>> @@ -813,8 +813,6 @@ static bool emulation_flags_ok(const struct domain *d, uint32_t emflags)
>>>  void __init arch_init_idle_domain(struct domain *d)
>>>  {
>>>      static const struct arch_csw idle_csw = {
>>> -        .from = paravirt_ctxt_switch_from,
>>> -        .to   = paravirt_ctxt_switch_to,
>>>          .tail = idle_loop,
>>>      };
>>
>> Leaving NULL pointers around isn't a good thing, though. May I suggest to
>> at least poison the pointers then?
> 
> I don't mind doing so, but I don't think we usually do that for other
> hook structures, ie: hvm_function_table for example doesn't poison
> unset hooks (and it possibly can't, because there are .hook != NULL
> checks).
> 
> TBH I'm missing a benefit of the poisoning here.  Using NULL or a
> poisoned value will both trigger a page-fault, and NULL has the
> benefit of callers easily checking whether the hook is set.

NULL in the context of a HVM vCPU will #PF. NULL in the context of a PV
one may not, depending on what the guest may have put there.

Jan

