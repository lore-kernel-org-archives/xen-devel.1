Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4BC1CCA464
	for <xen-devel@archiver.kernel.org>; Fri, 16 Oct 2026 08:43:27 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1451385.1666446 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHdWy-0000hv-Ft; Fri, 16 Oct 2026 08:43:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1451385.1666446; Fri, 16 Oct 2026 08:43:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHdWy-0000ho-CJ; Fri, 16 Oct 2026 08:43:12 +0000
Received: by outflank-mailman (input) for mailman id 1451385;
 Fri, 16 Oct 2026 08:43:11 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xHdWx-0000hi-9h
 for xen-devel@lists.xenproject.org; Fri, 16 Oct 2026 08:43:11 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xHdWw-0025Dk-Mg
 for xen-devel@lists.xenproject.org; Fri, 16 Oct 2026 10:43:10 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ad1e394-bab6-0a2a0a5309dd-0a2a45029d40-24
 for <xen-devel@lists.xenproject.org>; Fri, 16 Oct 2026 10:43:10 +0200
Received: from [209.85.128.41] (helo=mail-wm1-f41.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ad1e39e-6ca4-0a2a45020019-d1558029b5f7-3
 for <xen-devel@lists.xenproject.org>; Fri, 16 Oct 2026 10:43:10 +0200
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-4a180fbeef5so55750725e9.1
 for <xen-devel@lists.xenproject.org>; Fri, 16 Oct 2026 01:43:10 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a1cbedb6f7sm40406185e9.2.2026.10.16.01.43.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Oct 2026 01:43:09 -0700 (PDT)
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
        d=suse.com; s=google; t=1792140190; x=1792744990; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3gTSuV+PJUern7SPamPr3NuSPV+s9DhBdkBjMM8M3C0=;
        b=S/OE0un/R8P8UITXMBbJElVaeAmZy7wEhe/jy1HO45AYBp08r/qZpY7hHxvJ8zVNAp
         1K4eJ9Eh0g2yndrH00v9nNilw1qlUi+Cizl4wCitxBYS5cQhqZ5/A3t7IxmMxggPCk4t
         6sDAuhPsHjSOik+scOvKirlZwIOQxC0KehqW5zee6GdE5PEI1knIqghFWRourrvmXp2+
         qx2ulj5UmMh3ayBk8hlvl5gaHnoteTrtBs+wXYyWE/7MqwtjTXlVUiSrxCw/waRaX2Ko
         KRi9tLD2DmjpQ/N7tQJhdgTQ/ABtveSwh3i7q4vVOp86RkJSbNQKs357i6ncRg75xvGr
         oryw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792140190; x=1792744990;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3gTSuV+PJUern7SPamPr3NuSPV+s9DhBdkBjMM8M3C0=;
        b=EYKS8DBYBoAjBnZTgYP9LFEkuOh+VJ97ziwfiZrASYQdYOmlE3fe4T73NXrjWdu226
         0CArCmIe9u32904DPM5s0djLxuTZAkcMmwP6Qda2Ta2awPeSinZ7WvQ9pW0M8g2mO+h/
         ISPs1H0XNHVssg4F7vI9bti4fHWy0Lhra7dksQoGVbKrZ7bcGXg7ceFIznh8byKD2IY2
         FSasvQxWHsu7wU+qnMpemv0ShCjzHuDJIry2VeTxq/R0ohynPqdgx5zcQ9z9L12ok/W+
         y+h4sIXkFW8lxorX6c31/QQzMI8smAVi7eJqPM4XOdWNT/ZCUBZfL+3gOLxrOUbW7vz2
         mFeQ==
X-Gm-Message-State: AFq9FYIdScJlB1yQDoif15456x+vJKtzS3Vd72Eax/i2dJK1F3r7V+UM
	AkIx+68igJ2Rkf5zuAdy0t3cvwn41vDw4fQBnbr2AbF7LDtZZPaR7yoOxYqmPYD91Q==
X-Gm-Gg: AYBFou3XiWensjqgj5tXsDMTvzQ+E1Kv0RSYs6vowGHkUAWjhIiucSjNkg7JZzE4ohO
	CcJ8mk9xj9fr9AZFtSe43Ud/tDQshrgWy7cBmNuq7ZbiXPcPnjhv1mmwRQBM/E+rMju2kRWg8Le
	ZP3RDWtZAYCCuI5K5240SsmMlxOdbm1hm0J1h65kG/Zna14baa3tllOHUXuNBF5Y1iGm7Rkv7W2
	o4b28GRcdz9Ffkn2SNw7wa0dblFkuOjrUuohdtJ6tAhAvZcqAiHhTaOsqep+aJloaJsL7Fjjqn+
	rIkSx+1X+k5GqlXQr7ELWsJNgncYcFrGWmFmupNKlKH1dtqHOvFttHJ9Y+sDLEWK4+ae2Wqcc7H
	7F5JyBgFT6gUnvClLgTauh2y0KmTip7hRT+qXCoNUKRGjskk0pjXsWIghkyDotvcdTYM9+04Lbt
	5/KoIYocqZZxtQbYGTlc7ccjflh5lgr9piGy89xejvv9z5ErfsaqObFT2pVtvs+gMqgys+DQnu8
	ZoYIGMqIVS88o78dyYiAdHsgMIxPgB+E6UDg8hLo1Mfu+PzP7yV+lcmV6bzK34=
X-Received: by 2002:a05:600c:820d:b0:4a1:65d2:7912 with SMTP id 5b1f17b1804b1-4a18e47b302mr389242125e9.8.1792140190005;
        Fri, 16 Oct 2026 01:43:10 -0700 (PDT)
Message-ID: <92148677-e512-4883-b66f-dc340c2915e5@suse.com>
Date: Fri, 16 Oct 2026 10:43:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/15] x86/PVH: convert find_memory() to using a rangeset
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>
References: <1b4c2bb4-118d-497c-8d7d-f3824fd61a73@suse.com>
 <c27c214a-da72-419d-ae30-2315b85d0c83@suse.com> <atDvNeMKy__hL2IV@Mac.lan>
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
In-Reply-To: <atDvNeMKy__hL2IV@Mac.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-720697/1792140190-66EB32AC-3C9C7CBF/10/78276251493
X-purgate-type: spam
X-purgate-size: 1222

On 15.10.2026 17:20, Roger Pau Monné wrote:
> On Mon, Oct 12, 2026 at 10:24:44AM +0200, Jan Beulich wrote:
>> Subsequently we will need to exclude a 2nd range here. To avoid
>> complicating the logic when it needs to cover two ranges, follow the
>> suggestion left in a code comment and convert to using a rangeset.
>>
>> Suggested-by: Xenia Ragiadakou <xenia.ragiadakou@amd.com>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Acked-by: Roger Pau Monné <roger@xenproject.org>

Thanks.

>> --- a/xen/arch/x86/hvm/dom0_build.c
>> +++ b/xen/arch/x86/hvm/dom0_build.c
>> @@ -518,14 +518,38 @@ static int __init pvh_populate_p2m(
>>  #undef MB1_PAGES
>>  }
>>  
>> +struct mem_info {
>> +    size_t size;
>> +    paddr_t addr;
>> +};
>> +
>> +static int cf_check __init _find_memory(
> 
> I don't really like underscore prefixed functions, I would rather name
> this check_memory_range() or similar.

A single leading underscore followed by a digit or a lower-case letter
matches what is "always reserved for use as identifiers with file scope
in both the ordinary and tag name spaces". I.e. I not only see nothing
wrong with such a use, but I consider it actively encouraged.

Jan

