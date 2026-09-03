Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 426CFC61DD3
	for <xen-devel@archiver.kernel.org>; Thu,  3 Sep 2026 11:14:40 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1406848.1640021 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x25Om-0002iF-4V; Thu, 03 Sep 2026 11:14:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1406848.1640021; Thu, 03 Sep 2026 11:14:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x25Om-0002i7-16; Thu, 03 Sep 2026 11:14:28 +0000
Received: by outflank-mailman (input) for mailman id 1406848;
 Thu, 03 Sep 2026 11:14:26 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x25Ok-0002gN-Os
 for xen-devel@lists.xenproject.org; Thu, 03 Sep 2026 11:14:26 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x25Oj-005xHf-F0
 for xen-devel@lists.xenproject.org; Thu, 03 Sep 2026 13:14:25 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a99568c-2eae-0a2a0a5409dd-0a2a4505e472-14
 for <xen-devel@lists.xenproject.org>; Thu, 03 Sep 2026 13:14:25 +0200
Received: from [209.85.221.46] (helo=mail-wr1-f46.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a995691-4cb1-0a2a45050019-d155dd2ec847-3
 for <xen-devel@lists.xenproject.org>; Thu, 03 Sep 2026 13:14:25 +0200
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-482e2fdf5abso1101348f8f.2
 for <xen-devel@lists.xenproject.org>; Thu, 03 Sep 2026 04:14:25 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48448eea468sm13811027f8f.26.2026.09.03.04.14.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Sep 2026 04:14:24 -0700 (PDT)
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
        d=suse.com; s=google; t=1788434065; x=1789038865; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CZ2OTDTCvOgHyrNppdWw4VatHH0Z8Omk3UUzL8zKRDQ=;
        b=NYBRYRtztLUa8+KewhOXlWC1CTyoZ+LCsZz99LXYHYqqFEeLWJlW3j+fTVqYM9gsFH
         MUKriLF8oXxfWZ4zC09MYD7Vs2LfFNOlDK6DHS1AY1lYoNm+Zkc+0OIXsKw9Jn3NTI1/
         +b8w8wG494VKSQSw0/k8WKB2xBViKDiwVzv+J5fZ/duHMrMUl9JsN+B2S8Wd68nsvID0
         AJ0G7ayTbNtJGMSKrWgsedp256wSd4dpG5/VtJ+R1cCDxySmR8isqw0oEa2Ae3n061Oy
         HIbKpBOVscb4pJg8QmdmtW3ZbQkOrEbScnimhuvnNLCpwfOFuZGKL75wD9W75qLRLyLU
         ALOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788434065; x=1789038865;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CZ2OTDTCvOgHyrNppdWw4VatHH0Z8Omk3UUzL8zKRDQ=;
        b=pwaXQ39HUYNm01ZGqLcyeqJ0XDd4VEcXYj8RxHBBpuiqBP4aF4MXOBugUKNH96w4Uz
         N5HFkHxdZWpeqBDTj8LcytY3V6SRddvY6dPdBbVj5KPYay40TsLim4x8zcOPQvtmB7m6
         GRV5uQy8uNLEk6u9ABgR4J4kJE4eMazuDgGVPXHoxyeQb1P2MQIH1Qy0VU05E1KEtoSH
         r2SRz2kasriEiQeKsRHQHVCzPHhDazpOA8nRXN91qllqGCwV0rhX7d8Z9FixacyONzwu
         tfm2kIzJDIvQ76N1vZIVRM+GOPsma09l3wxBHsD4C79vwsM4fVVJBOOOmUj/5f8La0zT
         gX1A==
X-Forwarded-Encrypted: i=1; AKwUvByK1ZDgc4HQac69lQWxaC4LdSr0NlpmKZTO26IrgXxlQm020IqLHFpw0gp5U+3ttfPOFklpn8nvTm8=@lists.xenproject.org
X-Gm-Message-State: AFuF++lgfz+aBc8WuEJXmabacQV2oeHtkgPwPMlBlea3kmlXMjxc3lX3
	ZAYc3zAtIYSDNhZPqnu2F6SXQ6qFabVFTKJwVyjdOaHA4a4w8K0rPxXtaM+FzG2C5Q==
X-Gm-Gg: AYBFou0dS74y3ks2kJLkRaUh5ZVCz5j5etQHbBsYY19N37dZHx7SzZKDRxmBDyfUdPJ
	SkOPsk6pEpGSmyEInCnUrjyl577DUhd+AOlexOvrEZpuJH33k9uMG18r7tmGg9CH6kdjazbYaru
	2vV+sZpQvZnZFpz/N3VsuC5NTMzigekTLw4sjP7V+l2EYmudLRn2YFwI25bhTKg/BKe9LEVvTMK
	92DRxJ13m51gsJ5Ws2+hb3WsYMvN/JHeTlfX6GemaR/U6boTnNz+W5fCb8veRRoEcE9Ex5cCU1v
	nsQIjowazGrTF+G7Tg22Y2XqoufG0vd34uetAZ68XEqjRTUIrxUeiLqE5ARVrslzATTQrzfDsQZ
	AFAi2Cunihr0Ul+Cn8QFCwwkN849cvQazLmU+v2u2SIrpsebAsZub0/hbcsntTIxIhTcl/rnx/K
	93MpBkDX3IejIapXYlsQUbbWzzqWnleXjGzGAViLYV6pd5rz1KJL5OG+j6nzy4raFvhBmxp3gwq
	bI89CKza6xptAqjR9bRrQaQ4R9l+hpBc1O7LLqoyELJs1mME6yy
X-Received: by 2002:a05:6000:993:b0:484:3f88:b10d with SMTP id ffacd0b85a97d-48488f24640mr16633890f8f.18.1788434064845;
        Thu, 03 Sep 2026 04:14:24 -0700 (PDT)
Message-ID: <a3f0d2f7-b8b0-4367-853c-8d7e3d0948fb@suse.com>
Date: Thu, 3 Sep 2026 13:14:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/2] x86/viridian: Workaround Hyper-V GP fault writing
 to MSR
To: Ross Lagerwall <ross.lagerwall@citrix.com>
Cc: Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
References: <20260828131142.3986110-1-ross.lagerwall@citrix.com>
 <20260828131142.3986110-2-ross.lagerwall@citrix.com>
 <39ccc2f5-7b3e-4c5f-a98c-b526f12bb1c7@suse.com>
 <12a277aa-2d67-436a-8afa-3a68ad6f6ae1@citrix.com>
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
In-Reply-To: <12a277aa-2d67-436a-8afa-3a68ad6f6ae1@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c201ff/1788434065-F6CB02A1-43CADB04/0/0
X-purgate-type: clean
X-purgate-size: 1114

On 03.09.2026 12:55, Ross Lagerwall wrote:
> On 9/3/26 11:44 AM, Jan Beulich wrote:
>> On 28.08.2026 15:11, Ross Lagerwall wrote:
>>> The Viridian spec requires the vector to be >= 0x10 when writing to the
>>> SINTx MSR, otherwise it should #GP fault.
>>> The spec-defined initial value is 0x0000000000010000, i.e. the vector is
>>> 0. On startup, for some reason Windows 11 Hyper-V tries to set the MSR to
>>> the spec-defined initial value and since the vector is 0, it GP faults.
>>> To workaround this, treat the write as a no-op if the value is
>>> unchanged.
>>>
>>> Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
>>
>> Acked-by: Jan Beulich <jbeulich@suse.com>
>>
>> I expect that despite the (valid) absence of a Fixes: tag this will want
>> backporting.
> 
> It should be fine to backport, though in general I think backporting nested
> virt fixes at this point is not needed as there will be too many changes to go
> into the stable releases for it to reach a usable state.

How is this nested-virt related? It looks to affect Win11 when run on bare-
metal Xen?

Jan

