Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75708C5DF74
	for <xen-devel@archiver.kernel.org>; Tue, 18 Aug 2026 14:32:10 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1394233.1633063 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwKr2-00017F-J8; Tue, 18 Aug 2026 14:31:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1394233.1633063; Tue, 18 Aug 2026 14:31:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwKr2-000178-GM; Tue, 18 Aug 2026 14:31:52 +0000
Received: by outflank-mailman (input) for mailman id 1394233;
 Tue, 18 Aug 2026 14:31:51 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wwKr1-000172-GI
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2026 14:31:51 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wwKr0-00FXA9-5R
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2026 16:31:50 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a846cd3-2eae-0a2a0a5409dd-0a2a4502ae38-6
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 16:31:50 +0200
Received: from [209.85.221.42] (helo=mail-wr1-f42.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a846cd5-6ca4-0a2a45020019-d155dd2aa893-3
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 16:31:50 +0200
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-47db714766aso705136f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 07:31:49 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-482a5a7c55bsm12043664f8f.20.2026.08.18.07.31.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Aug 2026 07:31:49 -0700 (PDT)
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
        d=suse.com; s=google; t=1787063509; x=1787668309; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CfCofe3KyBoJCN3PFQ3H3q6o9j9MJAxwTJdM1Z5zqAY=;
        b=RUNLFEdQD0PVo+RAL4Ty7IKpnZbx+xdWXEct7/iR3dWNxDO27PxyQ30sGpLFMWGKnD
         S+nLQHNKZcsjMl00gKYqSw9+OFQAJPak8jZLAIs2SZvACkEL9H9tMpaybzmrHLXzOjNj
         ClPVqtZLi22B+ID3x0dpQ5O8oIeVFxQf/OA92rmgNaAYnGPsYa0J5iTd3Q7Av3loxybW
         ngTFrkY1xBVDscdLbzhugy3px4+EqsVs7akTgAvwWmZ6GVOcXDc7OIFgWXvbaHII+Hxl
         efdI0ziCRSffNkim/qVrFqf0gzlYGQzhghjDayGOOr99120kD+SsFWLEfPIpI0AtkaCh
         JS6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787063509; x=1787668309;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CfCofe3KyBoJCN3PFQ3H3q6o9j9MJAxwTJdM1Z5zqAY=;
        b=tEISC+cUhmB3QFMmWsd4xHvxq6WUBdVvm1QzPiSd6CYPznfj2rJGgkLjMS/SArY6RW
         8p4TM8kbnr8ZU3ljacfqlatkJ00wjx8qhErOsnSx/ZW/C6zTohm3sM0DEu+IzaIn1Ph6
         VUIJPbNDWtifXvZxcoIluYN6PBupiM/wCmyGWP8iWnKr4qcu3ZuMoTpqBreSgBmklcdf
         z/JuMFskZWYXr0F7a/oxjjqjRDl8b8L0B24bYxd2b9n1so6DCRCjE2mDJqYJwjyU+f47
         7kI6D0hVFDy/HyR2tsM7sT/WPP5gVX8D7xeWc56FZaflMfnaED4qatbjOsfR+oLoCwwh
         AS5w==
X-Forwarded-Encrypted: i=1; AHgh+RoV2Pw0QRGLSJ/NN/rQ0aT7vOsav5lE20IopBatbNudIFBY6iQdIeXprZSaizwoRIXPNYwxL8UJOSk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzSqRjfqjUklvfO6iIHpWONKUhV+LWhLc7ijWvP9zp9IpLi2bmP
	V0kUrh7hdQzyqj8Jug/VxIGpB9zecNrSk0VAPW+WCk9E9SiXqyNN+SVCsFeTvqbIiA==
X-Gm-Gg: AR+sD10oZ+KJT95P3UZdqhbyjznmukvpQ+/LzltF+Cpro2lNlRxFg+1VQQVk6sAck+I
	Mlq+NG6NNZte6YlknCCmYlI7RwjiJ6cD815tUClu0yxa5rRGpriBZKHRI60fI4FJ22iBBV00PFG
	Ny9UbN/n+T6hgObCmRt3A5Ff3m6Ugz1UzMBc675M5S7I7prI5KInI8xkI2sb++RCVQg1GWtDaNN
	dP06rbIN8bQUuCztW9NWraWSmOX3s2v///eCLl2z5Wj/fi+ic6wcFcRrFTN+4wonRrZnw5W/oTM
	jFHxTkY58/2hicgFDFfhKR/Jd+0NqYLt8y2QzJ22K7bhbbQIOKEmBOgLu+EP10W8c5y9teyOQml
	GllqmQ/3MJwVJYun+0uVZ2YAJyYzhcbNA+42TWn4c2T3PH4+pBEaXsksMcnbCka45oIUiPovRhB
	hZGM8OYV63U3jQeC7s1uowIMa04J36QdPIwf+egghMZIdc+mmrKafV+M2kOHnnCnvywL9s3Rw4b
	It1/KCRrLFjdRAAVWn5O524ITMJGYTDVZO2LOzxxj065D3sRBVJ
X-Received: by 2002:a05:6000:2881:b0:47f:7fe0:a287 with SMTP id ffacd0b85a97d-482aaa5fe04mr10184190f8f.2.1787063509508;
        Tue, 18 Aug 2026 07:31:49 -0700 (PDT)
Message-ID: <5fa222d8-af04-4b1a-a457-ee5004ace484@suse.com>
Date: Tue, 18 Aug 2026 16:31:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/ucode: Remove MICROCODE_UPDATE_TIMEOUT and associated
 panic()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Teddy Astie <teddy.astie@vates.tech>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20260818130738.1911850-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20260818130738.1911850-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-720697/1787063510-F34BE2AC-BDC93B56/0/0
X-purgate-type: clean
X-purgate-size: 1557

On 18.08.2026 15:07, Andrew Cooper wrote:
> Panicing in the case of a timeout turns out to be about the worst possible
> action Xen can take.  It leaves all other APs waiting on the condition
> variable, some in NMI context.  As a result, they fail to be shot down and
> dump state for kexec crash analysis.

At the same time there likely isn't much to be learned from a kexec dump, as
the source of the issue is in the CPU, not in Xen.

Further, this code runs with the watchdog disabled. If there's truly no
progress anymore, how would one know from the outside whether the system is
dead altogether vs the control CPU still kicking around?

> Microcode Loading on Granite Rapids takes about 4.5s of wallclock time, far in
> excess of the of the arbitrary 1s Xen allows.  This time is spent in the WRMSR
> to load the blob, and there's nothing the system can do but to sit and wait.
> Despite the delay, the system as a whole does survive.

For this I wonder whether the log message issues after 1 sec is adequate. If
we know things can take this long, wouldn't we better issue the log message
no earlier than, say, 5s * nr_sockets?

> Microcode loading occures through admin operation only, so get rid of the
> timeout completely.  It does nothing but make a bad sitaution worse.

Worse when taking one perspective, yes, yet a silent hang also is worse than
a panic() telling you what was wrong.

This is a tough one, with - likely - no really good options. And establishing
what's "least bad" may also be difficult.

Jan

