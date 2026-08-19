Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52D68C5DF81
	for <xen-devel@archiver.kernel.org>; Wed, 19 Aug 2026 15:22:06 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1395564.1633894 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwi75-0002M5-1c; Wed, 19 Aug 2026 15:21:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1395564.1633894; Wed, 19 Aug 2026 15:21:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwi74-0002Ly-UQ; Wed, 19 Aug 2026 15:21:58 +0000
Received: by outflank-mailman (input) for mailman id 1395564;
 Wed, 19 Aug 2026 15:21:57 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wwi73-0002Ln-G6
 for xen-devel@lists.xenproject.org; Wed, 19 Aug 2026 15:21:57 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wwi72-0035n1-T3
 for xen-devel@lists.xenproject.org; Wed, 19 Aug 2026 17:21:56 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a85ca03-e002-0a2a0a5209dd-0a2a45028e46-36
 for <xen-devel@lists.xenproject.org>; Wed, 19 Aug 2026 17:21:56 +0200
Received: from [209.85.128.54] (helo=mail-wm1-f54.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a85ca14-6ca4-0a2a45020019-d1558036e105-3
 for <xen-devel@lists.xenproject.org>; Wed, 19 Aug 2026 17:21:56 +0200
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-49554ebb87dso12114215e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 19 Aug 2026 08:21:56 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-499aa17fc80sm72889305e9.14.2026.08.19.08.21.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Aug 2026 08:21:55 -0700 (PDT)
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
        d=suse.com; s=google; t=1787152916; x=1787757716; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4knUFfMmt2eXsg6zvk2plIhzZPfzCn/JZd/OrHbzN8I=;
        b=abbBGHvCVfbXZcTT0xx0Pvyp2D9h3xWEGQde1up0LiouVyr/q4jA3MIHzo0M6VEZcV
         sTt7jE3RdvqK+v+5HoAS4NhVQjvUIWIdFnQseIoCn2JhxXlSAPwB43aTvsnh/wXu1v5d
         RIbKLPcooM02AtbRhT7eE3zT3hy4jW7uYSXaFzLmOIQyfCCP9kLWYviq46GPmeKV5HKY
         TKv1jNX2QYzdWMD59J2a5qsCz/roFf+cfl3MGzqLgCs7QnEVJDbMrUQ8ZDi5kZNak/ad
         cW+/vK3ufnT4WFHIZY3uq1LART+NG/lzZGOVF1b0j5wlUjcoFgck2uHBup54ACe21/Be
         /rqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787152916; x=1787757716;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4knUFfMmt2eXsg6zvk2plIhzZPfzCn/JZd/OrHbzN8I=;
        b=G4o8J/ctTCzSEyBfztnxT5SloEPd5OcYHmwYdsRrN4PUV1Df7C0N+ybu3jPq6Ji64U
         ut6vbABQYp9/aJamy8PRO9sufmcFIvtlh8n86vsTulqhGZTgSeBo1RhOI9/wjkGHsDk6
         PEHalds9Ul6cAIeRMlDMUq0jECovEAifLy7afUbVk+DLNrn24/vaF6k2sP1X4r1p8Sta
         d6Gkr7th4Rct/3whiwHNjDN/+XlxRNlSWdAQPGJYp3M7+tJhZnrGjvN1Vh/+XT9jbFUE
         w5xhLSycBAw3RTf+28NCeki3z2xvURG5WBzRvmo+jZceKGX4+43dvUAVMCVrcSscvQrz
         OOSg==
X-Forwarded-Encrypted: i=1; AHgh+Rojt+FUc/VU4TAw+ioP6QEjtQjt+S3TbsrZyEfdMgQHmGnLVZnJ7a4HAPuPJPGB/QsdDS0wAXUx7N0=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxia1AcJ0uY1aw6RDrmcUkUS8VPleKCupdz13gsM33Mp9jPd6iU
	dlZagtBeDWoNIjd26bdx0uUIzBzrRg/3k7ZtqvkK7MOz9SE5M9AZrJ5ALc0Ru81Bcw==
X-Gm-Gg: AR+sD11hToXxIK29GE1r1QkQ7JM5XOi2v0nWXmr5GYgCn8wlItjskCYlJhU7hz2WdPH
	BLs1Q/GRBCUWTSrIQXBs9yjPUp79Scj43CfeFl7C7BYWOkKnoVBy1++b7vsP6frv8gFrropp0QI
	jN4B8Tesbkxcy1ully2lR2NwW6R/a13z40fvLmaCxVfLDoL5PkY12wfaYH4GK+RMxK0ai+2wQu5
	jRtMXE6oE0kxV3kO19IcG1nW62DO7cGbNEYbG885msvwRIHmrLSC9SQJ8F8NQaDo/Z/QTGdfuhK
	9iEnEbBvcwr7uV8HuWruKtZ2VcSjJiX2og8vmWj/8PH1dgg/Jh/7Bbnms/J9WZhqzQ5V2I3NECC
	Mq11DzeV3DA/acmZpsvPIsyhm2LT8Hpd2Gnt98bkWYFYbyh5ERFZH9LIvcCfMu1CDjGPYxtbrEs
	YuvFF8A3/Y/JNaiIonSSoLrXruJ/OmwTCF1KMew32ZqMsOgGW+R6eIgAjSKJ3DFbgbGy7lLzLFR
	RYZVmfIx9e7/fJfnPpJrZJ/5zamoNhEPbY+cZ/E5eAB8ZKBen/E
X-Received: by 2002:a05:600c:37c6:b0:499:8f9f:e9ee with SMTP id 5b1f17b1804b1-499aa173a16mr109156325e9.7.1787152916266;
        Wed, 19 Aug 2026 08:21:56 -0700 (PDT)
Message-ID: <1e6aa092-778f-4826-8013-aa527a4858eb@suse.com>
Date: Wed, 19 Aug 2026 17:21:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v7 05/14] iommu: Simplify quarantine logic
To: Teddy Astie <teddy.astie@vates.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
References: <cover.1763569135.git.teddy.astie@vates.tech>
 <31b2ede1eab92048b69fe4999a35eb7d4a4617ba.1763569135.git.teddy.astie@vates.tech>
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
In-Reply-To: <31b2ede1eab92048b69fe4999a35eb7d4a4617ba.1763569135.git.teddy.astie@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-720697/1787152916-676BF2AC-69426B25/0/0
X-purgate-type: clean
X-purgate-size: 680

On 20.11.2025 12:09, Teddy Astie wrote:
> Current quarantine code is very hard to change and is very
> complicated, remove most bits of it and replace it with direct
> reassignement to dom_io domain instead.

Well, again far too little of a description, even when taking ...

> Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
> ---
> A idea would be to rework this feature using the new reworked
> IOMMU subsystem.

... this sentence into account: As I can't spot replacement of present logic
(fill_qpt() being a prime example) - how is existing behavior retained? I
can't help the impression that you simply lose functionality, which is not
an option.

Jan

