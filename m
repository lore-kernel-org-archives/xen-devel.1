Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C403DC79FB7
	for <xen-devel@archiver.kernel.org>; Thu, 10 Sep 2026 07:30:02 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1414010.1643862 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4ZE8-0004pU-FV; Thu, 10 Sep 2026 07:29:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1414010.1643862; Thu, 10 Sep 2026 07:29:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4ZE8-0004pN-Cu; Thu, 10 Sep 2026 07:29:44 +0000
Received: by outflank-mailman (input) for mailman id 1414010;
 Thu, 10 Sep 2026 07:29:42 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x4ZE6-0004oy-OJ
 for xen-devel@lists.xenproject.org; Thu, 10 Sep 2026 07:29:42 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x4ZE4-007KLQ-RM
 for xen-devel@lists.xenproject.org; Thu, 10 Sep 2026 09:29:40 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aa25c60-2eae-0a2a0a5409dd-0a2a450ac260-16
 for <xen-devel@lists.xenproject.org>; Thu, 10 Sep 2026 09:29:40 +0200
Received: from [209.85.221.41] (helo=mail-wr1-f41.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aa25c64-f2d2-0a2a450a0019-d155dd29d434-3
 for <xen-devel@lists.xenproject.org>; Thu, 10 Sep 2026 09:29:40 +0200
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-48436216a98so4644370f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 10 Sep 2026 00:29:40 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49d1fd532dcsm103274285e9.1.2026.09.10.00.29.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Sep 2026 00:29:39 -0700 (PDT)
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
        d=suse.com; s=google; t=1789025380; x=1789630180; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=shTrhPJT0Rvh0GI+uaE1DcyfXYiG/sseduOAlSbGj+Y=;
        b=Z7H3jFxvu+sKPAAs5Q5c1XSNG04Nb+xnygTjBX3sUmnTM4QW1wwmjfkeqEauPYmi02
         0JUssQ4ORh9iCAfiyEPEarbANVTzLpfeOEcsocAK+lh663zyYxQ/iN+1Rbiij5a7EXso
         wSEEJ5fcl7INx3jHRjoykhVB+Ll4Ombs5jkTqo1Ub3TKynZxsNjpneLtLTb31ot1hh0A
         EFWov5O3CJzLIZEgx32WYHN+gDZXGnZWHYUjRg8aJl21UEpmiOQjzPhztOnEpH0AAlMX
         ooecdD1q2MChJ6aGvpdtFI6lkRBqw2Mo574qdoa9SCpfRUJL+p9fAAY5+uq30sy6QnDQ
         73Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789025380; x=1789630180;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=shTrhPJT0Rvh0GI+uaE1DcyfXYiG/sseduOAlSbGj+Y=;
        b=Rw2zq9ts8x2XROdCOp/LIikoS32ll+91bPrEQhuBUqaQzhjCrBSoeZ7fwhfbsFr4yH
         9yMI99gqZpxx8aKyiHjoxYudz5nnkaR3elz9eeSsqzJHJAncYo1CC1FaKQ6lqak8Y84P
         VjlkVzcFzXoWI2j0WUgvPQBwkji3Zas4pJ/Y6bIWKChsfEWp8rH6tylNMJqQc2sHAydj
         BXl5q7Do0NZIrI5HrJwL07bhpcO/WStDkF/8/wsullObzjVEHv1XQL+ZzZNK/GJhh8T2
         mD3kvR1ZmTgpDy14kFB7UpmsHwApvsqNyQeZl/fJmvCJn+3ad4pBPoZLU6kb3j2d+MXU
         Vh/g==
X-Forwarded-Encrypted: i=1; AKwUvBxSvqO01Ku5BrOot5eWKvyYSUiCwU9R2IS9REsGIQJKSuWn/8aqB+F3lC+EAXOb078KEhlekgelrxE=@lists.xenproject.org
X-Gm-Message-State: AFuF++k/kjjAks5AVr7hA5ELCBt7/82AbcjadZLC7cjVW+JqHMdeUTiI
	hRjYCI8MC+JK9sC03I+VCoB6VT9MZC5KVNuVwOzzoOK60VRYSTxl6wS7bNqCtoDfjw==
X-Gm-Gg: AYBFou3FfYSskUoe510r1hDcs3wpqlPUDhfhv9AW0ms3b0mx+MdSCCLUX1xJR8cyiCj
	26LdIpdTzEaSS1JxrhzCmXHBl+z7/nSJTBsgbfn8Vg7LPlyXQ3NYIK6EJaSChLXEIMfoerCpOjk
	w4Rcvp/3IavFrWXUcuRj32+2czyYX1ve/yDblHig1SbuxuFJfzhrl0MjyE/FVhAOnkY7fLtg2sX
	327HaMU5TI4VkoDhSrLgCnGpwGkC8Chgirs3bYL0SaPo390AgqxQE9qWnpV+11YOU/lHfoHyUqH
	iugA/eaqNTaGdhDD+mTihNIN+Iu+UgAs3kGqn32vWDU4GdravdmsHJobrGaLL45gErdI/HCZx98
	wxWSJJQNUcm7HlB1mkpXVvFurhThH/+oV8GQH7BwlPb+bM/LrMXp3PCjfOWTKCUd1shkFO7D8iZ
	rm5a04ELXZnBsur0/MtnJYPKKnJbkaqN12si1KCTf/fvxjGGt/+TGiLSJdT24f2pWL3gSGBh4m4
	adIIiQsfdCL4K7pIi2bgDKY2+5T/NWEV5GEo6D6TcQ9o7CAapQY/RYJBnl8lss=
X-Received: by 2002:a05:600c:474a:b0:49c:e42b:a4ac with SMTP id 5b1f17b1804b1-49cf823f60amr355087195e9.11.1789025380158;
        Thu, 10 Sep 2026 00:29:40 -0700 (PDT)
Message-ID: <73918fa5-0c61-4a91-8e44-be5bd377141b@suse.com>
Date: Thu, 10 Sep 2026 09:29:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/nSVM: Validate the L1 MSRPM physical address range
To: Lin Liu <lin.liu01@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Jason Andryuk <jason.andryuk@amd.com>, Teddy Astie <teddy.astie@vates.tech>,
 Abdelkareem Abdelsaamad <abdelkareem.abdelsaamad@citrix.com>,
 xen-devel@lists.xenproject.org
References: <ae1d0feb918df7b64281cb9fed876eb97f626470.1789020882.git.lin.liu01@citrix.com>
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
In-Reply-To: <ae1d0feb918df7b64281cb9fed876eb97f626470.1789020882.git.lin.liu01@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-4011c0/1789025380-524DFCFC-25DAB5EC/0/0
X-purgate-type: clean
X-purgate-size: 342

On 10.09.2026 08:18, Lin Liu wrote:
> 8c36d5a500 ("x86/nSVM: Validate the L1 IOPM physical address range") added
> this check for the IOPM.  The MSRPM requires a check as well.

See https://lists.xen.org/archives/html/xen-devel/2026-08/msg00242.html
and Abdelkareem's reply. If you disagree, please go into further detail
here.

Jan

