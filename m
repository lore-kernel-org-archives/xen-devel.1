Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF33CC55ABF
	for <xen-devel@archiver.kernel.org>; Thu,  6 Aug 2026 11:32:13 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1384624.1627485 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrwKK-0005XV-Fh; Thu, 06 Aug 2026 11:31:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1384624.1627485; Thu, 06 Aug 2026 11:31:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrwKK-0005XO-Cj; Thu, 06 Aug 2026 11:31:56 +0000
Received: by outflank-mailman (input) for mailman id 1384624;
 Thu, 06 Aug 2026 11:31:55 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wrwKJ-0005XI-2U
 for xen-devel@lists.xenproject.org; Thu, 06 Aug 2026 11:31:55 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wrwKI-00AD88-FF
 for xen-devel@lists.xenproject.org; Thu, 06 Aug 2026 13:31:54 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a7470a1-2eae-0a2a0a5409dd-0a2a4502c222-34
 for <xen-devel@lists.xenproject.org>; Thu, 06 Aug 2026 13:31:54 +0200
Received: from [209.85.128.41] (helo=mail-wm1-f41.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a7470aa-6ca4-0a2a45020019-d1558029c164-3
 for <xen-devel@lists.xenproject.org>; Thu, 06 Aug 2026 13:31:54 +0200
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-4954aff6088so21092675e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 06 Aug 2026 04:31:54 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49954246f9dsm65439275e9.15.2026.08.06.04.31.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Aug 2026 04:31:53 -0700 (PDT)
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
        d=suse.com; s=google; t=1786015914; x=1786620714; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Imj1BdRczFgTNSp3crVFriTNBqw2cpBDb5vyHLuAegU=;
        b=WASbFKQoK8i4+xbQZ1M/3yLVdyRbeL09ZHCObsPKkGdHf6v+1gtw2i7GTjEO7Tw/vN
         7zOxLhWrYsaCBc1CtpjvlWAVIV8LadAOGFprKcelhCTjDO6yM6vXi6q3guIAseo2grpt
         XbAjhSODbszSrq3T41oOAVl9XZLHVeG5v/Ft7IXTcxV0r100yxbIIj0wso6isS4Sumua
         vtmOfgew5UkYInlP4tTsm3Cb4lAiL25pXU0zjJbMCyvnfxmieSXGF/FqjUdeoh1EK525
         HMNv6zclns6ASr4TqF6Jmkcnxr8evi1VdwtRZKo2Zudcfjf3b/dMSrGxs3kUKCWa63cW
         BuSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786015914; x=1786620714;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Imj1BdRczFgTNSp3crVFriTNBqw2cpBDb5vyHLuAegU=;
        b=RRTxdSn/tn7D17d02bJjUhvuYqD4dSsMy+Bgz1PSQMK/jCY2ZbTbE7+nAIEYWD6oSs
         XmXjWhMzg70FTQsgdhvaEekUaroJCMC0C+tBh4SsadyetyNGVmdf0OLMyElf0fHTqZgy
         RzHQl0yfsVcfYhlikb0WoGSIvbgtKEObzuz8nw7foDPTMYFZAj2aPyg9wmf4LXZ8Vn5C
         LKRIyR2hByL8xin1yQ1nZKPmvdLPBEOmfGjWurelNJPHEWgxKyhm1UanHC9/q0je38XK
         AThiUBl6ad8qAajFqAIciUwcF6w3zSvnm7ox/pq1wts73BFiD9xvpnKLvs/d35VkhC5B
         WyXQ==
X-Forwarded-Encrypted: i=1; AHgh+RrcMohXZS+kDQ9RflgEZCPwSQAz8UmP1KoYCvyjBz8zi/bkmzNfr0ZUV+Irp6ynZjxHFedmriIGNkU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwYtVsOQgc7hsNje/zh2ITJ+oLdcnXAOxMJ8MF2sNJ39aJxEi9P
	pdI6gpInhqSlAuaFcqEIXjH54Ud2fDWRWtc6tBvFn61bxqIyFyW3M6P9P8FeEa2FCA==
X-Gm-Gg: AR+sD13rJvGM5ii2Rv9OmFEeJa2rmFPvw85+zFFyBbKvnRi1kVoiM44Nem4OrOYZ28v
	tbDWx+5RtTw7LSl2qOJanfNCwep8/MC2DUm6szWAgX2u1lxheK79O0MBrx6ZYPXN8fF8QBymdPl
	aBYmBOZsVEQrzLQcI6pQt6AE9xxXrYKGRCvIUhMmgXo/cUUttc4X+/tWKoGrkNiEszaWzwHfZRQ
	d26UHHVPzcg97WC4MZjYwwVs5tryA9SDD0tkv4f/UynotXrICb2HRP9mWZjuR6o1VtWD0HEvVn3
	FBDausMCCS3CC17RHVFbSIaIZHD2DtXeKSKZFPrbp+vXHtYT4dxjOdp/sYYzMmhmz/ZCZexfAj8
	sIG76zQDhby0cQpk/vmwo0Rfe9jzVuA5cunnSx4HekuQAeUQa+hbbj6ov0LAiGGnBaosZQCqawo
	vDIhqOUv8qeFY4LhT76JYn0PkBg8nT6IOytGvN/gRopObtcQvCsH2ZSTxlUN5wuPnyMu53sSC7N
	d9OWrmr0OveC98Pd4EbTmzCnpKtWvjHY8cKlV55NDUdmRkpDED5
X-Received: by 2002:a05:600c:630c:b0:499:4d4a:4990 with SMTP id 5b1f17b1804b1-4994e74566bmr147562345e9.3.1786015913665;
        Thu, 06 Aug 2026 04:31:53 -0700 (PDT)
Message-ID: <62b5117f-928d-4908-9217-cc16d9cf15f9@suse.com>
Date: Thu, 6 Aug 2026 13:31:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] xen: Fix PV-only build
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
 Jason Andryuk <jason.andryuk@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>
References: <20260806015233.202486-1-jason.andryuk@amd.com>
 <083db883-558a-4000-b404-bf170c8309ee@suse.com>
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
In-Reply-To: <083db883-558a-4000-b404-bf170c8309ee@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-720697/1786015914-F18AC2AC-E996FB79/0/0
X-purgate-type: clean
X-purgate-size: 1083

On 06.08.2026 12:55, Juergen Gross wrote:
> On 06.08.26 03:52, Jason Andryuk wrote:
>> Allow disabling XEN_PVHVM for a PV-only.  A stub in the event channel
>> code needs to be fixed first.
>>
>> Jason Andryuk (2):
>>    xen/events: Fix xen_set_upcall_vector stub
>>    xen/Kconfig: select XEN_PVHVM
>>
>>   arch/x86/xen/Kconfig             | 8 +++++---
>>   drivers/xen/events/events_base.c | 2 +-
>>   2 files changed, 6 insertions(+), 4 deletions(-)
>>
> 
> I did a comparison of a kernel built with your patches disabling XEN_PVHVM
> and my patches with XEN_PVHVM_GUEST disabled.
> 
> The kernel built with my patches is 6 bytes smaller than the one with your
> patches.

Isn't this a sign of something else needing tweaking, somewhere?

> So I don't see any reason to take your patches, which conflict with mine,
> especially as my patches have a negative diffstat on source level, too.

Hmm, Jason's patches look to move things into a more adequate direction,
though. In which case I think a negative diffstat becomes an irrelevant
argument?

Jan

