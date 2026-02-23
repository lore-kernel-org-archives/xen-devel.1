Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60E05EA4FAE
	for <xen-devel@archiver.kernel.org>; Mon, 23 Feb 2026 12:59:46 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1239046.1540453 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vuVX4-00048k-Mi; Mon, 23 Feb 2026 12:59:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1239046.1540453; Mon, 23 Feb 2026 12:59:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vuVX4-00048d-JU; Mon, 23 Feb 2026 12:59:26 +0000
Received: by outflank-mailman (input) for mailman id 1239046;
 Mon, 23 Feb 2026 12:59:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dhnJ=A3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vuVX3-00048X-08
 for xen-devel@lists.xenproject.org; Mon, 23 Feb 2026 12:59:25 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 78d3395c-10b7-11f1-9ccf-f158ae23cfc8;
 Mon, 23 Feb 2026 13:59:22 +0100 (CET)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-48375f10628so27120765e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 23 Feb 2026 04:59:21 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483a82d8c50sm77042315e9.6.2026.02.23.04.59.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Feb 2026 04:59:20 -0800 (PST)
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
X-Inumbo-ID: 78d3395c-10b7-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1771851561; x=1772456361; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=mJCI6zuIG7pO0oREk7YoJOO3FHJJqupPkAY1qAOuNpE=;
        b=Zf76qMpE8Ya7o2pJBLhE1fldvmbgvDZjhVw6Ls25CWGzjTNKJs4ocPPB8bw4ahwRn+
         UXqfyU8KoCX+X77RUKD2ahA1pvWHNt2Typ5642d/RgQqBILB2mHttzgmVrh6O08L3HRJ
         4Z8+qJrHxa6Rn9C7vRsAy6Uy7FW0kFBOyBcY8ZX/XubSutab42lsdqj1s4u04ejbu3r+
         JAVtiAxjwaIX1TvlKRNtNpDj0suMDn/CNE4Al8zhNtsR6d0HIZF/rF3xEFHxEgFMLpZl
         uSWSBFo3VnPWMjALkLcTLNcjGHKM4aVtELV8IzboHGQANVKqoBmTKP+1I2ZFFxYqmRyG
         yRRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771851561; x=1772456361;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mJCI6zuIG7pO0oREk7YoJOO3FHJJqupPkAY1qAOuNpE=;
        b=oSpuPSz1Jw96b4UWqy47gBespE2BqBgSE9NHBQxxIv3k1sn2rj73kkB9oZzVyNRCLl
         TvYez8qKONzACxP6E7EGCiTQAxtWNFCJ6US2jsPCRKeDDKXo/ApwA0TpHytGP6XX7DhG
         f1vvxsCqcjpGssxXR/MaRu5hv0IoqC7nGYn4Bl6Mv26jfqz/pmI0/pg59jIxKCiiAUDl
         ljiXCmPHr5kNCAE0VtMT3eTGiahz8c8oiilWa+CZySyC/psWpXdeqiG1UaQLyxCKSEm+
         kz2WC4KmUmm38xX4x7AVjgBQt88LPsGjiAtslK/yE7J3HsB7ws7+8sf3gHRQg6bwiZ/j
         3Q+A==
X-Forwarded-Encrypted: i=1; AJvYcCVux+9ork8AChWLu0PUhxQWsKYxJOFi+4BcBirxzyJs6QrvQ6gMvK/RS6t9gK1dJ1LN+LZ0wSohvJk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyNqTDbmLShJzT+EQzX+Ly2ZhPQeESmWs1zWXagVZOQNusdNn1Y
	GPKUHiuvm1rHL9CpOu7SYu1pU87z3woRVKXKpFRFxyADtoZiexWLIRQvZbBhC6kGyNlAgxs3/Ys
	FgQ4=
X-Gm-Gg: AZuq6aLQPz/fWha3Xu9WKDPF4m04Q3qjIQWaGY3fXtkV5kJeTKrOvKkz9R4T/1YCH7T
	gTj0OgfUCFn49/ZiA7uA1b3r8YLMeyMu+FXBOxDHriHq08TEVz5k6tfToRfQfLP9nRoCj0kklOx
	1YHis7RH2xwbjUbAOmFW8ulThAH80yU7OqpmVqKLjQ3w5vQz/QDA+Tt/cm6wCmJ4jSNgse5JNzW
	EFUd7aXYnyYPmP8yrF5QuvBPEu+Uo9iMSwhVYUPBeipqmyD790Jdvj91H2/xbU2erqRcVWxzGQR
	n2gLItZWGdJIk19fMEiXUTFoj2ow2MU1NdTS2qXeqc34qD5OF9jFBHGJrof2M3c6Y0gzK3SG8M+
	XFEXw4nKjBGLYUYv0Lv5LnzgKHQn60qeDg+4+KbbZJ/+agYwWif+NGEtC6cVU8WmS5Piv2ad2GX
	rbFCmn4+CeF5LZutr51UvldOKKd2qZ/hb1bHLEwd5seURK+laGnkumnla8qdLq5yBZzYKso3yQt
	MDx9HRGXMEsuZw=
X-Received: by 2002:a05:600c:3e10:b0:480:5951:fc1e with SMTP id 5b1f17b1804b1-483a95bd836mr148441995e9.11.1771851561217;
        Mon, 23 Feb 2026 04:59:21 -0800 (PST)
Message-ID: <f105222d-458d-48b5-bd19-078129ad7480@suse.com>
Date: Mon, 23 Feb 2026 13:59:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/MCE: restore CPU vendor reporting to the outside
 world
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Jason Andryuk <jason.andryuk@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <561865f9-cd0f-40c9-86b8-98a3ac070b65@suse.com>
 <e35a952f-0ade-4729-8f33-59daf151f131@citrix.com>
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
In-Reply-To: <e35a952f-0ade-4729-8f33-59daf151f131@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 23.02.2026 13:36, Andrew Cooper wrote:
> On 16/02/2026 11:56 am, Jan Beulich wrote:
>> The records reported used to contain Linux enumerators. We first broke
>> that connection when purging unused ones, and then again when switching to
>> the bit mask forms.
>>
>> Fixes: 408413051144 ("x86/cpu: Drop unused X86_VENDOR_* values")
>> Fixes: 0cd074144cbb ("x86/cpu: Renumber X86_VENDOR_* to form a bitmap")
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> I see you've committed this, but it's not a viable approach.

Well, depends on what the goal is, I suppose: It's viable to restore previously
regressed behavior. We have been in agreement, I think, that vMCE itself is
doomed.

>> --- a/xen/arch/x86/cpu/mcheck/mce.c
>> +++ b/xen/arch/x86/cpu/mcheck/mce.c
>> @@ -858,6 +858,22 @@ void *x86_mcinfo_reserve(struct mc_info
>>      return mic_index;
>>  }
>>  
>> +/* Linux values need using when reporting CPU vendors to the outside. */
>> +static unsigned int xen2linux_vendor(unsigned int vendor)
>> +{
>> +    switch ( vendor )
>> +    {
>> +    case X86_VENDOR_INTEL:    return 0;
>> +    case X86_VENDOR_AMD:      return 2;
>> +    case X86_VENDOR_CENTAUR:  return 5;
>> +    case X86_VENDOR_HYGON:    return 9;
>> +    case X86_VENDOR_SHANGHAI: return 10; /* X86_VENDOR_ZHAOXIN */
>> +    default: break;
>> +    }
>> +
>> +    return 0xff; /* X86_VENDOR_UNKNOWN */
>> +}
> 
> The Linux x86 maintainers say that the numbers are internal and not an
> ABI, even they haven't changed since 2008.

Yet the numbers are propagated to the outside world there as well, aiui.

>> @@ -866,7 +882,7 @@ static void x86_mcinfo_apei_save(
>>      memset(&m, 0, sizeof(struct mce));
>>  
>>      m.cpu = mc_global->mc_coreid;
>> -    m.cpuvendor = boot_cpu_data.x86_vendor;
>> +    m.cpuvendor = xen2linux_vendor(boot_cpu_data.x86_vendor);
> 
> This is an internal Xen structure.  This hunk needs reverting.

It's not, unless I'm missing something. The struct is passed to
apei_write_mce(), to then be passed to erst_write(). ERST isn't Xen-
internal anymore, is it?

Jan

