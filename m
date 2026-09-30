Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E52CCA5FB1
	for <xen-devel@archiver.kernel.org>; Wed, 30 Sep 2026 09:25:03 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1436975.1655666 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBqYS-0002yc-KC; Wed, 30 Sep 2026 09:24:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1436975.1655666; Wed, 30 Sep 2026 09:24:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBqYS-0002yV-HS; Wed, 30 Sep 2026 09:24:48 +0000
Received: by outflank-mailman (input) for mailman id 1436975;
 Wed, 30 Sep 2026 09:24:47 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xBqYR-0002yO-Ji
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2026 09:24:47 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xBqYQ-005idT-W9
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2026 11:24:47 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6abcd554-bab6-0a2a0a5309dd-0a2a450c80b6-6
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 11:24:46 +0200
Received: from [74.125.225.97] (helo=mail-wr2-f33.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6abcd55e-f479-0a2a450c0019-4a7de1618002-3
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 11:24:46 +0200
Received: by mail-wr2-f33.google.com with SMTP id
 ffacd0b85a97d-482f6351831so2992214f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 02:24:46 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48b02a0185asm2136142f8f.32.2026.09.30.02.24.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Sep 2026 02:24:45 -0700 (PDT)
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
        d=suse.com; s=google; t=1790760286; x=1791365086; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nnSmgbkaBOu7erSOnMiri/4+mWnIoa1FObTpJVnmzpA=;
        b=F9ODwDtxJwdIF2AuPznHp6xim9ouT8zY/fNksGwyT4k3igUIbaDr+XhTRfSPZcb9ID
         DQow28NOK1Q/sDYjKfK0BxdktWTdgIOqR8wUGvgAOw8cl5nbOgfRRdRu9f6z7kvaJ80q
         E1Rl7ZfIpVMNnzQdklKZRkHf7eWHIVMf3yqctypfdOXUOpQ7LLg4s5q9fU845ss2tcQO
         lg44UzdxDD+Z2S8+s4ZD9koDFM8mwO6zjcauMSHAftD1tfTU+7+rtOJ5h1UbWC6+IkUI
         Q64kY6YfpdVyU2fvwsLo3Va4ClHqoaJW4kSJ+nJySDNbfNE3/8+F3GtHxxAWuTSbSwhs
         RS8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790760286; x=1791365086;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nnSmgbkaBOu7erSOnMiri/4+mWnIoa1FObTpJVnmzpA=;
        b=hlJ7SoesvuN5SOx82dxldU9SBpg7jyB7WbZLrcC5w4dGZOj+PlWZdhvjk+RGejyZrM
         P6QnqdggqMrGIzpfvxkuejDY8X6YOowz1EESQ5goFEg5xTW/8v6X87gM7BrB+srz3UTq
         LITmvOExgLgmnwBC7vHaMqlhiVWabAmvmtViJG5iSQk9B0X8a0NxQzZw3/PjhchvxaCK
         61Q2bQ/x4ruu2FbUGo0mzJ+uJC6RhOEQqg7kgBM8IFWItHVJYGNoaFjjobc1SZZhvV/Y
         JqyHbG9UswQiuSJ4SZ1g9c/p+Zzh9FUzgLv9Iao/j+0jFHKaEobWB1cPTDluIgZgV/jZ
         4VrA==
X-Forwarded-Encrypted: i=1; AKwUvByttGqllp47sGxKlO35HkPqGudp4I4S/3n/9N8k5llPhBn6Z32yRsqMAgern6qXj2UkyPOnLpHBs3E=@lists.xenproject.org
X-Gm-Message-State: AFq9FYIb6Idk1q4Wii9y/hV74NwGMzJ/BpCLB4vckYb9Q4RIaX+9w/zC
	LmeX0iQLYG0mIKIrYBNMDpLrkK70eKaErEI+FBJ6YVH30q9Q5niBkXV7GSww6nou4w==
X-Gm-Gg: AYBFou2Sp40Ohz4Q8cQtZC0tJckkYKvy9kVVyi0M2qVBlsaokfdFwYbiHCqPX2xLuWR
	F47Wr8N2mWSMKJV/mvETSlPrPfcgf49Rc2XzItNJqT1K9aRc1itV4fbHkBBXtd5Tpmvq4uxYEm5
	H/nu/cvj6wU8jcOEQN7PArJopzEQz7DOpoPw/NQUcuJeX80TQHPn7OiwQ0ofXZuiSJiW7lCu3NP
	heUSI92B545Q6DgP6kkrYSIIQkLGgKkhgduAlroZUxO0Kbw3jZK40N9OTBrRHFiUVlctKnsrhPl
	6Z37T87kURSla8uD6XArHZLynSZRaY4W6iky3NzJphfcACVbI7WTAdq6KOjhoglQo0AYcyNnLC8
	Zp8nwFLBtkSsB/Gylr3zGvTu/szn8nGR/cEkYQ19HmI1pHq0jL9BrPu12bgFLuzYw8R6X2KjPex
	A9Ov22Wx2vMe+B9hSjmt/OTd5e552zCJR4XV0EjVvptEpsuUaG7wDfiiXITUGg+VXg1e7/VF3wq
	W3maJlGyqV3s9kwFVs3pwlFg/N8L7I/9XOrFfY2JRbT4y5Q2gXPq54DljMzpHU=
X-Received: by 2002:a05:6000:4283:b0:487:8b9:66d6 with SMTP id ffacd0b85a97d-48b0252029fmr1854203f8f.40.1790760286137;
        Wed, 30 Sep 2026 02:24:46 -0700 (PDT)
Message-ID: <8aaa660e-43f3-4f7c-bfee-60b9806c4c38@suse.com>
Date: Wed, 30 Sep 2026 11:24:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] vm_event: svm: Fix incorrect monitored_msr() check
To: Teddy Astie <teddy.astie@vates.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
References: <1790250881.8631fc262581453bbf619ec5b2062170.1a0d344933500072c4@vates.tech>
 <1790251023.8631fc262581453bbf619ec5b2062170.1a0d346bb7600072c4@vates.tech>
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
In-Reply-To: <1790251023.8631fc262581453bbf619ec5b2062170.1a0d346bb7600072c4@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d25034/1790760286-52331A5B-A1B649EA/10/78276251493
X-purgate-type: spam
X-purgate-size: 704

On 24.09.2026 13:56, Teddy Astie wrote:
> monitored_msr() is called with truncated MSR values (&= 0x1fff)
> which doesn't match the original one, making the check incorrect.
> 
> Fix that by keeping the msr value intact and computing the bitmap
> offset separately (in msr_offset).
> 
> Fixes: 2746088d9cb4 ("svm: don't clear interception for MSRs required for introspection")
> Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
> ---
> Should we multiply by 2 msr_offset instead of doing that in {set,clear}_bit() ?

I'm okay with the patch as-is, but I would prefer that alternative. Of
course the variable then wants naming differently - maybe bit_offset or
simply bit or pos?

Jan

