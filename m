Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79B4BC61DD6
	for <xen-devel@archiver.kernel.org>; Wed,  2 Sep 2026 12:44:18 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1405826.1639270 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1kJu-0004Uw-D3; Wed, 02 Sep 2026 12:44:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1405826.1639270; Wed, 02 Sep 2026 12:44:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1kJu-0004Uo-AB; Wed, 02 Sep 2026 12:44:02 +0000
Received: by outflank-mailman (input) for mailman id 1405826;
 Wed, 02 Sep 2026 12:44:01 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x1kJt-0004Ui-0d
 for xen-devel@lists.xenproject.org; Wed, 02 Sep 2026 12:44:01 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x1kJr-00BU0u-U4
 for xen-devel@lists.xenproject.org; Wed, 02 Sep 2026 14:43:59 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a981a03-bab6-0a2a0a5309dd-0a2a450c91b0-18
 for <xen-devel@lists.xenproject.org>; Wed, 02 Sep 2026 14:43:59 +0200
Received: from [209.85.128.44] (helo=mail-wm1-f44.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a981a0f-f479-0a2a450c0019-d155802cc08d-3
 for <xen-devel@lists.xenproject.org>; Wed, 02 Sep 2026 14:43:59 +0200
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-49b8eeb3ff2so8623285e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 02 Sep 2026 05:43:59 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49ce4647472sm66865865e9.4.2026.09.02.05.43.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Sep 2026 05:43:57 -0700 (PDT)
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
        d=suse.com; s=google; t=1788353039; x=1788957839; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kMXvHvoGB4+o6jAx8+NK0OjVKzstwY06/ccSn6nLBc8=;
        b=GF9+PblKNWAgJrp8cGeXj3lSvmsYkkqfHevRpIwaUA1F/KStBjVs+N5eabjEl6mlN/
         Ndx/VfuOB9HHaszW9Py/r9YwSHI8WFNNJKfkq3L3MUOlKI6wMmHKkuTDDwpPECdHDy5D
         arZlqjOFVqgBRsTvy9T51Sl6r3cGu5g8XiIqBSCtCjWmnBiufijWqRUXOO0+OcMG9ia8
         QvpUrzOZfO609gSr2wd0d4tqAE+VZmRWWABcXkzb1pRK/9RJRCGZyTP75dM55E9iQYTU
         D/eF3ydtyOrs04Yvgz2y3qb2QDD0vz2zYp3OZXkwiZ0cW5cmJH2szMV9bu0m8sVMiFu8
         TNFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788353039; x=1788957839;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kMXvHvoGB4+o6jAx8+NK0OjVKzstwY06/ccSn6nLBc8=;
        b=ZrR7z2HFQeR1vPqmchaxdXrw0lQKT0HtuVd7SW/JVR3ZqiKY2aTwfgPrdQ06N33H97
         CvwpMBpm+p+LqcSikj1MDxOGBLywfZ5t1O2FbTEDbuv72Z1pEnIlSIhvN0PUXfYXFOE6
         pIDnhLjsEJ9OJC+943LwTjUmBTvwPnEGcw7M4SNDnLhSGNN9bLlzDPn/9XXUq328sGEH
         O3bEH2cL/nD4jwUruHfChljHKQp4y+ougLy2QBj1jPs9xogEQ6mTlMnD/ke2ehH6+Dpm
         ToIO1NNdKYkjnkExIIGYguO24xZ2EN8N/NsSHvSDOaEkFNPEI0VNtM1WZTC/NjNu7im9
         8PIw==
X-Forwarded-Encrypted: i=1; AHgh+Rqq25gNY05aLXCYoRIumx0KhbU4NgaqmgZtD3t3/3QPbkLpJc6wxfr7NeDWhUBFZbfmutUyK+PWaWU=@lists.xenproject.org
X-Gm-Message-State: AFuF++mNaynIEPvHxAKYVhlnoZXc+tJ+z0nt3LGKxXK5jQwx6VvGJab8
	fWaidIvSLD4dMZ/p2D7Spx2RVvHfjB8UL55CkqU5mR8lWutasDGNmGR+MS3XmAFmjg==
X-Gm-Gg: AR+sD11rgPCpyhDc/WAmVh3fmVftSn3u9XhfDfwTEIZPkADGVDDNeczBmnRJ+zPwWBH
	tAJmyTIxahpbFCIwdjxbSoweCoHyTRuUC6QhClLX+vD6EEpXqrn/AuEZko+MoSUDb6jV+MHIiA1
	zBBDLKVXfyYEy27mX46drn/oSduQSMZpDNIBZoONG3UeCtskM/jrbxE5USjo82K37AG9VkAL7HC
	alS7g58lkG/3fI9c43hkGwC4DVjl4/YHFj4OIsbANzrH31WXBHb0lzW+Dsv9XGGsr9ftDQ46NM3
	5mY5qX9/naPfZYQd2YZ70AuwtbROYjEbstuUm3gOuLHCz3ksY95IKIj7j5S8dw2UPLygeMejKBv
	+ihgajqfrXFJGjjXWqjCSy+0MgEfqmZdkQ5so4JyR0nAUkXLZB2tZ6JSxx6vX3wOeO6Xk/kRvgT
	+9Msxnb9ZRWvHjwymL9YISfOd0pObv9Q05diHZT+PLEChbfwMvmdXUsUHxXCnfO8m+ELvCssCoZ
	BxDybqt8XEz79PLgrlNksjUE5O+i3DVNiG894reu8M1DwZaSb0G
X-Received: by 2002:a05:600c:45c4:b0:49c:e1df:79a4 with SMTP id 5b1f17b1804b1-49ce57fdd1emr84013155e9.5.1788353039317;
        Wed, 02 Sep 2026 05:43:59 -0700 (PDT)
Message-ID: <7515d6cf-4f5c-4390-abc7-45cf72b053b4@suse.com>
Date: Wed, 2 Sep 2026 14:43:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] x86/bitops: Remove CONST_ADDR
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Teddy Astie <teddy.astie@vates.tech>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <20260902114339.62043-1-andrew.cooper3@citrix.com>
 <20260902114339.62043-3-andrew.cooper3@citrix.com>
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
In-Reply-To: <20260902114339.62043-3-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d25034/1788353039-772D8A5B-73B9C2D7/0/0
X-purgate-type: clean
X-purgate-size: 578

On 02.09.2026 13:43, Andrew Cooper wrote:
> @@ -285,7 +284,9 @@ static inline int variable_test_bit(int nr, const volatile void *addr)
>      asm volatile ( "btl %[nr], %[addr]\n\t"
>                     ASM_FLAG_OUT(, "sbbl %[old], %[old]\n\t")
>                     : [old] ASM_FLAG_OUT("=@ccc", "=r") (oldbit)
> -                   : [addr] "m" (CONST_ADDR), [nr] "Ir" (nr) : "memory" );
> +                   : [addr] "m" (*(const volatile int *)addr),
> +		     [nr] "Ir" (nr)
> +		   : "memory" );

Hard tabs look to have slipped in here and in patch 3.

Jan

