Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAE68C624D4
	for <xen-devel@archiver.kernel.org>; Thu,  3 Sep 2026 06:28:21 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1406407.1639710 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x20vd-00047f-R9; Thu, 03 Sep 2026 06:28:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1406407.1639710; Thu, 03 Sep 2026 06:28:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x20vd-00047Y-OM; Thu, 03 Sep 2026 06:28:05 +0000
Received: by outflank-mailman (input) for mailman id 1406407;
 Thu, 03 Sep 2026 06:28:05 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x20vd-00047P-57
 for xen-devel@lists.xenproject.org; Thu, 03 Sep 2026 06:28:05 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x20vc-006DtT-8x
 for xen-devel@lists.xenproject.org; Thu, 03 Sep 2026 08:28:04 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a991372-e002-0a2a0a5209dd-0a2a4501a192-4
 for <xen-devel@lists.xenproject.org>; Thu, 03 Sep 2026 08:28:04 +0200
Received: from [209.85.221.47] (helo=mail-wr1-f47.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a991373-5984-0a2a45010019-d155dd2fcd17-3
 for <xen-devel@lists.xenproject.org>; Thu, 03 Sep 2026 08:28:04 +0200
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-48441a2ba14so1784810f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 02 Sep 2026 23:28:04 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48448ed3840sm12120684f8f.17.2026.09.02.23.28.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Sep 2026 23:28:03 -0700 (PDT)
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
        d=suse.com; s=google; t=1788416883; x=1789021683; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yTxpRBqDWMda19Nr+SUufVl8lNCypyYsmgFMvGkBNRU=;
        b=bmleMGj31QGq+hDHUq5skq9igrWDsoAFX/tIm68RSedncc5nBWIQHpEL7evHtAHNJI
         baDy4PhxgL/lQ9/lmgHAAproe4tGKnA9XAeQr0vAns+d+d70OAu133WtojDR/kruxziw
         X5tejHko7jEY/lUZOZoq4RQLR9z3ktuvb1C7gFqym1nf3krrZuo6EO253Sbc91w3YvAk
         vjkISdOl6EqPLw2aG96zeew6BUEL0UMKBmF+0GhjsHJ/cWRzQ8kIusueRyMQguHqNNuw
         7o12TvFJk2iL9t/OAzf06QpSYWaX0YHebBu+ER7Y/qRPnxVM1ADUB8f8lWo76gnkuu9a
         b1KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788416883; x=1789021683;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yTxpRBqDWMda19Nr+SUufVl8lNCypyYsmgFMvGkBNRU=;
        b=mZRZf4bFsph+lii/ZwhnRGqBBH/3pd5E2uHaxEGe+YQvQwFB2ZcoUY9QEkH8LqUUeZ
         v12IDQl3mM2EQM1y8JOxSmaG/t4MBUMZiq43GPREOTSKUa904Nz/GQW21lC6ZoboNsVv
         jrqeKTkbDWvNdSbmvjH5q7btlyuVkBUtLNAIa51MhugUPs/dI0wcaOwYVI5oEFaEq1Sr
         yUlel3c1fSLcORM6B61iH5n6ruKyes66d1JUeH0EGhBuM5BodKQnz6aJqFiL9hy53jXF
         Z1zPj5GknI8+W6B45E2Wia0yKmzdaDhUZIpgpoxuwa2n/EOnB81UdoH9RUDLGSisP6hU
         Owig==
X-Forwarded-Encrypted: i=1; AKwUvBxYZnZWSS2eBDTZnqPi9JFZUaD9wwuBaEUjGTQ0TYv6P5E+MdE9zwRF8jMQFa1n8v92oUvxVvxvTkQ=@lists.xenproject.org
X-Gm-Message-State: AFuF++kWM2hBVqmnvQmtx7DW2sN512wBPiiU40ML0WvCbLMOk0V4esxX
	Vtb4ZuhgLr2gbJxMce/0X5gR5fooINsTUFxnc6vn4xdQHYL/tbd8zABdlQInB7MZGA==
X-Gm-Gg: AYBFou2JYc6I4/Gtn/T8IGOpDHBEI6vojYn3BGXcYjlB3kdUeKulMIEX+G5bEV3bG+7
	/gIFslEWmLL5kWGojPXiVHkFcYkR6voAKBy7iXwOl21/o7CcaFYh5iThU+qj37t2WIYjUL3qVYF
	jT738P++Wg/rxyrQN1x8++fbiQe5EA5NHG/zsJZhH7cYjspepnHzWJRv+YL4sg2ltRQPrgTlK0W
	ddMn9VIONyN9rjW1H0LKQo8rOM+b3KR4J1vi+XA1iZIoplGaVMlA/l1aeapE3ZhUOU+VQLygnjq
	sUieDXG/k67kEv1yuBlsz7xgugJcRVwg9SQKN7duAgkzjn/tlqz7tN+DNNRtgNviLgC+jydKJSA
	nxdmxcV/Ko0QVLUqCTIzjZTkduyiO8yQ0QEHaY6VKIqSS6sS5Ufo0/9OjHItXVf4ni3nh1CL1t0
	c+6AMfJwiQccvvp0X5vOihl47bFKkF2siumNUq1LuAdKrKpTnNMEvtKnhYMUm6zxiRWuaJfj4DF
	SfckXsoaLHq9ShILbEOqq4ElgLzux6bNMlr0zLGXraAPCr7vmfM4SiEjBRDSM4=
X-Received: by 2002:adf:e196:0:b0:484:3311:3703 with SMTP id ffacd0b85a97d-48488f222d6mr20416915f8f.26.1788416883587;
        Wed, 02 Sep 2026 23:28:03 -0700 (PDT)
Message-ID: <e782714d-ed16-42ef-9c90-593a2823ab4d@suse.com>
Date: Thu, 3 Sep 2026 08:28:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/ucode: Work around Granite Rapids erraturm GNR98
To: Teddy Astie <teddy.astie@vates.tech>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20260902221000.2967167-1-andrew.cooper3@citrix.com>
 <1788389520.8631fc262581453bbf619ec5b2062170.1a064527434000c4f3@vates.tech>
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
In-Reply-To: <1788389520.8631fc262581453bbf619ec5b2062170.1a064527434000c4f3@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d62444/1788416884-1E07B757-13EDACF4/0/0
X-purgate-type: clean
X-purgate-size: 817

On 03.09.2026 00:51, Teddy Astie wrote:
> Le 03/09/2026 à 00:14, Andrew Cooper a écrit :
>> @@ -273,6 +274,35 @@ static bool microcode_fits_cpu(const struct microcode_patch *mc)
>>       return false;
>>   }
>>   
>> +static bool microcode_safe_to_load(const struct microcode_patch *mc)
>> +{
>> +    struct cpu_signature *cpu_sig = &this_cpu(cpu_sig);
>> +
>> +    /*
>> +     * Treat pre-production as always safe - anyone using pre-production
>> +     * microcode knows what they are doing, and can keep any resulting pieces.
>> +     */
>> +    if ( cpu_sig->rev < 0 || mc->rev < 0 )
> 
> cpu_sig->rev can't be negative as it's unsigned int.

With that I'm surprised the compiler doesn't flag this as "condition is
always false" or alike. Surely Misra isn't going to like it either.

Jan

