Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D15EDC44524
	for <xen-devel@archiver.kernel.org>; Thu, 23 Jul 2026 07:00:14 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1368922.1617972 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wmnPE-00046X-OB; Thu, 23 Jul 2026 06:59:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1368922.1617972; Thu, 23 Jul 2026 06:59:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wmnPE-00046P-Jb; Thu, 23 Jul 2026 06:59:44 +0000
Received: by outflank-mailman (input) for mailman id 1368922;
 Thu, 23 Jul 2026 06:59:42 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wmnPC-00046J-P8
 for xen-devel@lists.xenproject.org; Thu, 23 Jul 2026 06:59:42 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wmnPB-00Ehdg-O4
 for xen-devel@lists.xenproject.org; Thu, 23 Jul 2026 08:59:41 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a61bbdb-bab6-0a2a0a5309dd-0a2a4502a22a-12
 for <xen-devel@lists.xenproject.org>; Thu, 23 Jul 2026 08:59:41 +0200
Received: from [209.85.128.53] (helo=mail-wm1-f53.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a61bbdd-6ca4-0a2a45020019-d1558035e016-3
 for <xen-devel@lists.xenproject.org>; Thu, 23 Jul 2026 08:59:41 +0200
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-4956242332dso2650695e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 22 Jul 2026 23:59:41 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4956a6354a3sm198616985e9.10.2026.07.22.23.59.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Jul 2026 23:59:40 -0700 (PDT)
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
        d=suse.com; s=google; t=1784789981; x=1785394781; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xjAZiGXpd0CSGVgZfcdRxovUfmNvf7gTbYTIde+ER0I=;
        b=IfU6VVu/Bqiqws5EJFGbJvjRdm9GLudOzEL6ITLimNUPcvQGZYLSw7vtHPuhFVlP4f
         2lGkr/x5Gpvw7dQGTyLfqhp7TMO8tjljC+4U+jfhyuCvH3PpU6mIF7R69dfdwFaaArri
         JqeUbyuu63bLxJXMvgQ0nmkpqMtTkwssy1EAxsRpRNKcPwoawHJtJN2EihCg8uGJoUs6
         Ysk8ScnEUfnn5FhbtURwWDODSO2MoM0znmax9qpttoZSh/Y1E31BGh2CoUe2p6f2PAxu
         im625OFSTTzJ2E73c554QjEDUMNrBc7xC8HcfhfMlaQUgGSc7h3jMfuP/zw3miRPb3wV
         rMGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784789981; x=1785394781;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xjAZiGXpd0CSGVgZfcdRxovUfmNvf7gTbYTIde+ER0I=;
        b=iRGMWmZvDyRSULwbv+OjnXLViPafC/WPoaqVP3UNQtFD+OJZ/qaFCc79awmHOELcxT
         cjQKleCKWB76ws5JAsrmv9k360kEr+Dq//914AxbsLOqjgjy+7U/EZyE8XUXuqlUUO5P
         MRJ/Q9uQZCzqyX0gckcYtAmjH/3zkRpQ4G6fRr6YID7uCOLSHXZh3c1iYiIrcHhv2DX4
         WP27o5s2QviL3TStY+J6OOhUT42QmRTheqAqMXubZ0c653mQMVNGl3EpU4Jx/ejcMx1V
         2HWnkLaVhSREVpwBkccpPLYtiAUBP8JOPRqqen4xQpi6Wxcw9mz/aR1GSPSV6nEdmph8
         YQNg==
X-Forwarded-Encrypted: i=1; AHgh+Ro1LWUqw15dw19SmsMpxcfSFOzBsMGzJWQW9fcsbbKctZslLyu2A5zQSCxpICl3Vj+Q2SNPY8rHMHE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwmX3ofPUZ+toJAi86FpJLH6Ct2GxUfxq0ponQ9IXObDP6buwv0
	/W7eAzlpb2dU9MXP9yByFui4vatOyCiaJ/Y8iu4iHLk3dAgglt+ebo+KF4ircxdr7g==
X-Gm-Gg: AR+sD11Wxnep8jcBAeAKTsRQCIu2fDzAdqkGNd918lGGhdopPLWUcBmHz2UN4POnjw/
	mfKsNwuVskZ21zTKvXIYQjvtLMyDbjvnxj3EAAGFJHjPaiAcMKiUlVzmalrbmG5KS+LyIIapiEq
	hjVki1tGBPRgNM4hLyN+quaG3AsTQk5OR76L74X+SHpKYR5Sq8egrVWcp6Q1HaRoQb/1LABB3Bc
	bK5+g6SrL56BaH+62h8HQBzzsfqgHIOy9XKQz9rGFdzuGrAo66hDbC78yzBd/m/sHuPNXcvkZTj
	S+UHfqdxad8cpdy10Cr/FeV0WemcKrufB0cxfEmgzVAhv5IlkmDis60EFh9xX9E8gj8BMithO9y
	6bMvebr0kWlOIf3IaecFS4+X0ouuv4edGcoZYMpwwGb15QF2boIahbwZYOauvWLshA7fF+CoHIY
	6rnrLidw7zyZcy99Xhv6VXUTiPjuRx9hbbx/cLsWv5DyJjDZNuLED/KSSrphcZ6hT0/Q==
X-Received: by 2002:a05:600c:6012:b0:495:4d2d:82f2 with SMTP id 5b1f17b1804b1-49573d0eb3emr12449405e9.26.1784789980946;
        Wed, 22 Jul 2026 23:59:40 -0700 (PDT)
Message-ID: <4daed8ac-b533-436f-9f86-6d297b87abbb@suse.com>
Date: Thu, 23 Jul 2026 08:59:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/5] x86/asm: add volatile, clobbers and zero-length
 check in inline memcmp
To: "H. Peter Anvin" <hpa@zytor.com>,
 Mauricio Faria de Oliveira <mfo@igalia.com>
Cc: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 Juergen Gross <jgross@suse.com>, Alexey Dobriyan <adobriyan@gmail.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, kernel-dev@igalia.com,
 linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org,
 Borislav Petkov <bp@alien8.de>
References: <20260721-pvh-kasan-inline-v7-0-38979a50cef0@igalia.com>
 <20260721-pvh-kasan-inline-v7-2-38979a50cef0@igalia.com>
 <20260722170334.GCamD35gwrCng30WH1@fat_crate.local>
 <0F3A1121-208F-4F71-8C88-BEAE7CB50E75@zytor.com>
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
In-Reply-To: <0F3A1121-208F-4F71-8C88-BEAE7CB50E75@zytor.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-720697/1784789981-F38BC2AC-E185D1F4/0/0
X-purgate-type: clean
X-purgate-size: 2580

On 22.07.2026 20:45, H. Peter Anvin wrote:
> On July 22, 2026 10:03:34 AM PDT, Borislav Petkov <bp@alien8.de> wrote:
>> hpa in To:.
>>
>> On Tue, Jul 21, 2026 at 12:56:43PM -0300, Mauricio Faria de Oliveira wrote:
>>> Add the volatile qualifier and clobbers parameter to prevent bugs with
>>> instruction reordering and optimization.
>>>
>>> Also check the zero-length case, as the 'repe' prefix does not run the
>>> 'cmpsb' instruction if the 'count' register is zero, which doesn't set
>>
>> Please use capital letters for insns: REPE, CMPSB and you don't need to put
>> words in '' - it reads fine without them.
>>
>>> the condition-code/zero flag, so the result is based on a stale flag.
>>>
>>> Those are pre-existing issues found by Sashiko.
>>>
>>> Link: https://sashiko.dev/#/patchset/20260701-pvh-kasan-inline-v6-0-ba99045dfa9f%40igalia.com
>>> Signed-off-by: Mauricio Faria de Oliveira <mfo@igalia.com>
>>> ---
>>>  arch/x86/include/asm/shared/string.h | 8 ++++++--
>>>  1 file changed, 6 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/arch/x86/include/asm/shared/string.h b/arch/x86/include/asm/shared/string.h
>>> index 02b92927553f7b8e1c87e6122bbaa70439e57ea7..166274e44f3cb49e3dccab3cdac281d67aef5d44 100644
>>> --- a/arch/x86/include/asm/shared/string.h
>>> +++ b/arch/x86/include/asm/shared/string.h
>>> @@ -11,8 +11,12 @@ static __always_inline int __inline_memcmp(const void *s1, const void *s2, size_
>>>  {
>>>  	bool diff;
>>>  
>>> -	asm("repe cmpsb"
>>> -	    : "=@ccnz" (diff), "+D" (s1), "+S" (s2), "+c" (len));
>>> +	if (len == 0)
>>> +		return 0;
>>> +
>>> +	asm volatile("repe cmpsb"
>>> +		     : "=@ccnz" (diff), "+D" (s1), "+S" (s2), "+c" (len)
>>> +		     : : "cc", "memory");
>>>  
>>>  	return diff;
>>>  }
>>
>> So this is a fix which should probably go to stable, I think. Going back into
>> git history, it points to
>>
>>  62bd0337d0c4 ("Top header file for new x86 setup code")
>>
>>from 2007. And we have carried it this way through the years and who knows
>> what hit this or not. So please make this the first patch in your set - you
>> can even send it separately so that I can get route it through stable.
>>
>> Then you can base the rest ontop.
>>
>> Thx.
>>
> 
> Also, this is silly. Instead of adding a whole separate test, just do "test %3,%3" before the repe to set ZF and let the REPE skip.

Besides this, isn't the function effectively returning bool wrong anyway? This
way you can use it for equal / not-equal comparisons, but not for sorting and
alike.

Jan

