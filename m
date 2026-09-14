Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F36DC88E50
	for <xen-devel@archiver.kernel.org>; Mon, 14 Sep 2026 06:23:42 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1420448.1646762 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x606B-0000dN-Me; Mon, 14 Sep 2026 06:23:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1420448.1646762; Mon, 14 Sep 2026 06:23:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x606B-0000dF-Ht; Mon, 14 Sep 2026 06:23:27 +0000
Received: by outflank-mailman (input) for mailman id 1420448;
 Mon, 14 Sep 2026 06:23:26 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x606A-0000d7-7K
 for xen-devel@lists.xenproject.org; Mon, 14 Sep 2026 06:23:26 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x6069-002RpJ-JW
 for xen-devel@lists.xenproject.org; Mon, 14 Sep 2026 08:23:25 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aa792c8-bab6-0a2a0a5309dd-0a2a45028f16-30
 for <xen-devel@lists.xenproject.org>; Mon, 14 Sep 2026 08:23:25 +0200
Received: from [209.85.128.52] (helo=mail-wm1-f52.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aa792dd-6ca4-0a2a45020019-d1558034edef-3
 for <xen-devel@lists.xenproject.org>; Mon, 14 Sep 2026 08:23:25 +0200
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-4998b5a63e2so31599305e9.1
 for <xen-devel@lists.xenproject.org>; Sun, 13 Sep 2026 23:23:25 -0700 (PDT)
Received: from ?IPV6:2003:ca:b735:686c:f5c4:7858:246b:ca62?
 (p200300cab735686cf5c47858246bca62.dip0.t-ipconnect.de.
 [2003:ca:b735:686c:f5c4:7858:246b:ca62])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49e636f7fa2sm292322915e9.15.2026.09.13.23.23.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 13 Sep 2026 23:23:24 -0700 (PDT)
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
        d=suse.com; s=google; t=1789367005; x=1789971805; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fKN4h53ktpL+hbHe/If/KjkGr+4e1PqXhD/nt/CltO4=;
        b=e2ZtZxchp9cSlnniiNUcOozTOuTF5Ef0VCnwGt2NubS9NHkH21/8rNSQRzd2PhWG03
         nQbN/ELr9V6gqivVneeIkB16+wfBM+woV2Z+k1UhKBMrCYw+/OZsYDWR30O20nR2PH7u
         VbTh4fujratMx/v2Gucc34MO54LasgBtUQD9A2fSt6Z3Y64X30/5Qtt2meqfHBB2nani
         +7LV8zAUoUtPR3gwK6oApnmCkDJnH0Jx7/xI2dVrpgu6U9pZD9H2WKgYWvdYbEbaE1+A
         PNseTZABkHcTWiLuQxY7cb1jPsmWcd+KzGWkq6GbwXsvhLJArKRtNoJziQPA3851WOOB
         5r3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789367005; x=1789971805;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fKN4h53ktpL+hbHe/If/KjkGr+4e1PqXhD/nt/CltO4=;
        b=KTWoC5YmqDd/g5pxst7CR/HUpPrJfdtNo0R9kMdht5wD09R4dDPPqNruqcvWY2UtBz
         upO5/YjT4YH3STtk/JJh3+Caz60rYgkwb4QrrVK+/aMO79rl3a61wZ+rNlL5NYuzxAn2
         P72hQi8KPK3dd5emD0QF/ji3nmuh0XtmPzmHOQEvAn1HB0pE3LmzbKs9M9o8VFjvtM/1
         IuB8NhlUp9jHYuF/YBixxCp1w7GmSypDqEjv20z+BnL5+w8ppS4AiYaYskuBlrezW23/
         WbzNj+498G4e1x3p+MVdeupHe6XdP98kw3J2kkeKLq4iOzgK0BRMxJEYc+RccfTyYA8J
         Lyxw==
X-Gm-Message-State: AFuF++l0drZermoYUENuBBqOvZ1ZMf7liCqF16NCmfUl6itXMqohSxyA
	8uS7z+vsUuQHW3+M40HXlbVPKowrcocfBJkoxT7P94TfLljDBywA/ettvMJQWo2lHCeakN8iSh4
	oBew=
X-Gm-Gg: AYBFou2HOhQ2GSCf4+UF9Rh6G1ZipS6va038XQKeZskX8szN7eR5dxnGLpG5oPii7Co
	5DAtX+EcY794Lf4MTxM3fAYRlupNt6bvo3lcEWq93QNeYx2TRdp3pMbKso2Ey4flRooIVSHBb6I
	WONhCkIG7yhgr9NipzVtUkAPAuC39Dfty0xq6CneJnlKKhUp3sN0U47FPFBvqXppkgBEyBbJK7R
	WXhE8bjFtgmNXbHq1P/GWKZAVQ12jglZxhRCRjkwIm5i3CkdlOOXGGRQGuL7j7mKkfo5mz8hF6V
	XeW11rk9l6kXli3e4V8GPIMWfrm+5IXn6YSIpuWVqQWuSXHCdW/WwhRcelopJC9ieB8q9CeL54d
	w/ka+UTg88Nm0PIrKyYOxF2VRQ3kVZLm/WJH60teGD4sxKUMvBSP9RxxZDh1ExpEanEOAB7K9v9
	WP3gsCIPDyxSWVJaONb6eJLCKKXAl8O6wmPyhc7IX4XtyEtio/2tJyhWoYQNgas4Wp50s9vhxGY
	jWhxlhXA12Ji9sJrub9UR6oxf6RXxcs09PhXLbBXuyPLVU2tkQ2pXXUgyIJNg0aM4nHBfVIdtIH
	X/5j4EjfKYCcodSzz9VXEntfwHIH11WnTPN1YDxhHg==
X-Received: by 2002:a05:600c:3b9f:b0:49c:fc6c:be1b with SMTP id 5b1f17b1804b1-49e7a691b0cmr14344315e9.33.1789367004962;
        Sun, 13 Sep 2026 23:23:24 -0700 (PDT)
Message-ID: <3b6b2796-b532-4b6b-8b04-8edce203ad3d@suse.com>
Date: Mon, 14 Sep 2026 08:23:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] Eclair: relax long <-> function-pointer conversion
 deviation
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>
References: <6d212d60-5c0b-4909-996d-5d6a4906b7e1@suse.com>
 <fca27ac3-95c9-4177-a9cd-673f07230889@suse.com>
 <43e412de9e5165f33c572841bfc58dc9@bugseng.com>
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
In-Reply-To: <43e412de9e5165f33c572841bfc58dc9@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-720697/1789367005-31FD62AC-804A90E8/0/0
X-purgate-type: clean
X-purgate-size: 2229

On 12.09.2026 17:19, Nicola Vetrini wrote:
> On 2026-09-03 13:43, Jan Beulich wrote:
>> What is true for unsigned long is also true for plain/signed long, thus
>> also taking care of two instances of __x86_return_thunk() being cast to
>> long.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Reviewed-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

Thanks.

> Some nits below:
> 
>>
>> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
>> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
>> @@ -368,17 +368,17 @@ constant expressions are required.\""
>>  # Series 11
>>  #
>>
>> --doc_begin="The conversion from a function pointer to unsigned long or (void *) does not lose any information, provided that the target type has enough bits to store it."
>> +-doc_begin="The conversion from a function pointer to [unsigned] long or (void *) does not lose any information, provided that the target type has enough bits to store it."
>>  -config=MC3A2.R11.1,casts+={safe,
>>    "from(type(canonical(__function_pointer_types)))
>> -   &&to(type(canonical(builtin(unsigned long)||pointer(builtin(void)))))
>> +   &&to(type(canonical(builtin(long)||builtin(unsigned long)||pointer(builtin(void)))))
>>     &&relation(definitely_preserves_value)"
>>  }
> 
> could be canonical(builtin(long||unsigned long))||pointer(builtin(void))
> 
>>  -doc_end
>>
>> --doc_begin="Conversion from unsigned long or (void *) to a function pointer can restore full information, provided that the source type has enough bits to restore it."
>> +-doc_begin="Conversion from [unsigned] long or (void *) to a function pointer can restore full information, provided that the source type has enough bits to restore it."
>>  -config=MC3A2.R11.1,casts+={safe,
>> -  "from(type(canonical(builtin(unsigned long)||pointer(builtin(void)))))
>> +  "from(type(canonical(builtin(long)||builtin(unsigned long)||pointer(builtin(void)))))
>>     &&to(type(canonical(__function_pointer_types)))
>>     &&relation(definitely_preserves_value)"
>>  }
> 
> Same as above

Okay, I'll happily adjust. As I have no reference for the syntax, I just
have to guess when making changes.

Jan

