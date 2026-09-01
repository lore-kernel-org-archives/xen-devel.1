Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1243C624C6
	for <xen-devel@archiver.kernel.org>; Tue,  1 Sep 2026 06:34:32 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1404439.1638112 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1I4U-0000hX-Kf; Tue, 01 Sep 2026 06:34:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1404439.1638112; Tue, 01 Sep 2026 06:34:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1I4U-0000hQ-Hi; Tue, 01 Sep 2026 06:34:14 +0000
Received: by outflank-mailman (input) for mailman id 1404439;
 Tue, 01 Sep 2026 06:34:13 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x1I4T-0000hK-Hj
 for xen-devel@lists.xenproject.org; Tue, 01 Sep 2026 06:34:13 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x1I4S-006y77-UJ
 for xen-devel@lists.xenproject.org; Tue, 01 Sep 2026 08:34:12 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a9671d5-8faa-0a2a0a5109dd-0a2a4507b868-48
 for <xen-devel@lists.xenproject.org>; Tue, 01 Sep 2026 08:34:12 +0200
Received: from [209.85.128.52] (helo=mail-wm1-f52.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a9671e4-b4ea-0a2a45070019-d1558034b864-3
 for <xen-devel@lists.xenproject.org>; Tue, 01 Sep 2026 08:34:12 +0200
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-49cdc81f40eso7364445e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 31 Aug 2026 23:34:12 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49b91c5790csm282912335e9.0.2026.08.31.23.34.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 Aug 2026 23:34:12 -0700 (PDT)
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
        d=suse.com; s=google; t=1788244452; x=1788849252; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=im/4BG+MEJJe5UBdxNY4GApA4/zw8M0XrGC3NLnhOMM=;
        b=YH91TFH+h7RHOR8pARYw+TOSFb1duD5HEE7L0dXilr8mhkG+zwqFLObGbc1e/Th3o4
         a7LCFTMlKPY8t2WVPJuCO5lPtFf2fk32mdj93agtoQE59w7mBCTD7mbMe753TAdDsLWk
         W9ZSh+JKGgfzKXWJHafWDe8E2L+PfQ5qQc0QQZMmXRt1tics6YJOC6j39akzC06IN3PO
         6UOLS+Y2PsPxagekZaCnKmeYpdJeB0LWoWJwo796drqlCrVFFMdYN+kFjHXwnG3e9EMl
         +4Wyx6FpT9n57+/80OLgxtpqA6Y9AAkUFKVtYPa8gLwcTOhHfEDDpwIRwGgQy+jR390D
         7ZDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788244452; x=1788849252;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=im/4BG+MEJJe5UBdxNY4GApA4/zw8M0XrGC3NLnhOMM=;
        b=rmr+vk3w1xux95DScs7J0HyWys3xsVI2Hiq4yF9mB/++aAeEgy4JxzpJCS23AtwtkJ
         NKRmvas1O1AscfBHSxleewV6BSP5D7n3AYkYXP4xJMm5rVkN+D1oTD45EDSvHnish/Yr
         lnK305G7vMYCgcKKHXGeSyoxNiJc3cWYQaI4dVDP4SuSCldWqM/OdtK+H+KV8dbW4Ubn
         KfHH6W8IuatWfYubNw6zYh5uQa5AHoTexQzzcp/PRvRWPJBVUStlcy/JjVq2SG/g8MWU
         lvg2lyRXkywC6YDpXty9xTAByPNiPloEwRtmrMX5UVgU+iLFjxiYSPSSXIIOrrBUrMzz
         X6nQ==
X-Gm-Message-State: AFuF++mLbgkrNSF3A0Ng0RQrB5kU9qpYIaLmfyRJEZOW1iEQqfemr3el
	WUv5akQjdHMZ8/wYCdWBMMjLhhx1mAg0MClPM8rpHpi668/3zDpemTLK0nFAdd/cCe2tZmeScHy
	QR6+uBw==
X-Gm-Gg: AR+sD119CwtwGLucMj616dIp82uJ8V0KBmL8E4UepkPki++fMkll4Qh6FEwmtwWfBuT
	op8ZIr2do580E8wER22U1RUCAzaNOgGr1zVUR3UKa24sNwFb/JSjLA+QmLmc3Hw9WPL0oX1T1/T
	76HWgB9uyjwPLeS1n7zCVL8cEWCWZwv/yZgrp4jhG8KCF2YVcYBpuku7ISGuCjhtaUzK1Mtavaq
	ka1B7vLqjX8+qKaswmu0SuuQmvdsOz4BH1lq+TQsJfIfxE7L4GyuWxRWfRlE09TH38q0WTFIiiS
	CEoUUpce7VoP7pmVEYNi95W1XF2Jkf/7fLRuye7+khysg+YGDW9B/3pEH1E2WuSzvHgsNERR44h
	hZT3OqsptfX7WK1We4x01M/NgtTRAXXzkto9SBnDqx699zlvwigWZ5XDfuESG8U1PS85N7ePuYh
	RK1SB216bBo+kgzEYlXbqaGLCDBxcBvJJuYKAGULzIwsTUTyHdrqT68645sIG0oKlkjzz91t68+
	7x8NU0Osvm4MJt0PIanGIBHV75vvnH52fofh7fmfIUyCYG/F6ez
X-Received: by 2002:a05:600d:6402:20b0:499:a277:e8b5 with SMTP id 5b1f17b1804b1-49cdc42f448mr86087205e9.3.1788244452370;
        Mon, 31 Aug 2026 23:34:12 -0700 (PDT)
Message-ID: <cdc3f09f-0472-4660-8c08-b68d16c2b079@suse.com>
Date: Tue, 1 Sep 2026 08:34:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/2] flask: add const qualifier to
 security_context_to_sid()
To: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>
References: <cover.1787821757.git.Sergiy_Kibrik@epam.com>
 <ee0ce49467ac1ee1cdd017323e70c8a865269f39.1787821757.git.Sergiy_Kibrik@epam.com>
 <1b680cd1-c086-4aa1-9a8c-f89d9743918e@suse.com>
 <5564a32f-31fa-4629-beb4-d87d19c2944d@epam.com>
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
In-Reply-To: <5564a32f-31fa-4629-beb4-d87d19c2944d@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ef75cf/1788244452-356C2AE4-99973909/0/0
X-purgate-type: clean
X-purgate-size: 530

On 31.08.2026 12:01, Sergiy Kibrik wrote:
> On 8/28/26 09:40, Jan Beulich wrote:
>> - While touching code anyway, it would be nice if u<N> was converted to
>>    uint<N>_t (or else we'll never complete that conversion).
>> I think I'll take the liberty of addressing all of these while committing.
> 
> thank you, Jan. BTW, what's up with u<N>? Are they expected to be 
> dropped/converted in Xen?

Yes. If you go look, s<N> were already dropped, as were __[su]<N>. The use
of u<N> sadly is far more widespread.

Jan

