Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDA21C54F54
	for <xen-devel@archiver.kernel.org>; Fri, 31 Jul 2026 08:04:24 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1378843.1623875 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wpiDl-0005t6-HF; Fri, 31 Jul 2026 08:03:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1378843.1623875; Fri, 31 Jul 2026 08:03:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wpiDl-0005sz-Ec; Fri, 31 Jul 2026 08:03:57 +0000
Received: by outflank-mailman (input) for mailman id 1378843;
 Fri, 31 Jul 2026 08:03:56 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wpiDk-0005sq-Co
 for xen-devel@lists.xenproject.org; Fri, 31 Jul 2026 08:03:56 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wpiDj-00DYs2-6K
 for xen-devel@lists.xenproject.org; Fri, 31 Jul 2026 10:03:55 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a6c56e1-e002-0a2a0a5209dd-0a2a450ba846-44
 for <xen-devel@lists.xenproject.org>; Fri, 31 Jul 2026 10:03:55 +0200
Received: from [209.85.221.42] (helo=mail-wr1-f42.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a6c56ea-b7e8-0a2a450b0019-d155dd2ac072-3
 for <xen-devel@lists.xenproject.org>; Fri, 31 Jul 2026 10:03:54 +0200
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-47f64ca1c2dso192735f8f.2
 for <xen-devel@lists.xenproject.org>; Fri, 31 Jul 2026 01:03:54 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47fd45a1abfsm1674971f8f.37.2026.07.31.01.03.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 31 Jul 2026 01:03:53 -0700 (PDT)
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
        d=suse.com; s=google; t=1785485034; x=1786089834; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rHk5bFtiBhp6CkghRKKUYuzZFDug855GKVXyV63qCSk=;
        b=MEhxRAWASK/9c71KDKJf0iQQYku+lVcdU7lHaryYVxBndy+JaIGWM8rujayvC8M8v9
         1xXug0AA7h+aHBqq+zB0EO5BxdshpMIxRDiSNwUHPzzvxSWyO3Spid068gl/6UAFm7XL
         MnrpDkcfwyZtmoEac25a5XYbQYd6cB0B0D4itTCDBgV2HZVMIVFNlbL/nmL9uzO4airU
         8gYlhThG8RkUtyUAhOYOE5o9wDOmYZazZqaZ1FzCnREz/OlD74zJf6mi5mADh8UVeR5v
         /6ck+u+Jg8f8naVE2Hw2FjTsuxp12E5ziQ2hrp4etd3uh5FMOzMFWkSgWigvCd39YqAR
         ijNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785485034; x=1786089834;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rHk5bFtiBhp6CkghRKKUYuzZFDug855GKVXyV63qCSk=;
        b=c2N6FItwFqXj9c4WxBwO+0q8k/hkkk8gFpdez9laV+k9SDqKwc2XkM9vzVQ88JVJmS
         C+AyUryCv3l2xYzPMDelEmYsTCW+iE4/rjKRP7ZVCaVdnG0BQZ3xx2z7khcIx9nKML1n
         RAz5JmLExcdJIc0Imeex30omqWGXnFY88bsutWKasUeS/WkVmatZfnMMkztGfWfr4/6P
         DZLZK2bQuTOb0+etNEQP2+LxDqZHoYgv+F+NYPLuRShJ0qw9vyslT5A8uu7b+dGGJ32q
         Ubx31BfTzcJNIawzulkerl0QZMqqXFLMRkNqQPZMjgZ3QGFZmuc2Fm2N99E/Z/zTDCmb
         onhA==
X-Gm-Message-State: AOJu0YzOgy21hajfdpIBcbglGfha9ddhr7lPyA0MEr5qXoCY5t/KMdQG
	xehnYyaMa3CaGoS4DQ/MAfr3FwM+wYzOVD9zqZddWYrMh6uBPRb7TcNH8nOQi3B4CQ==
X-Gm-Gg: AR+sD12PNIZEDIigQAUDpe6c8mixaVZjqYKXq6bqDzmXCQdmIH2DHTOUj4XVvYQp657
	FmIIMYxzaFgjEU2kBzy79P5tN+UgRFupWD1ZZLm8h8U/Uf/vyxOA6VHtUMPKovVSSaRc1HQEaC2
	iJfLv7dG98iZzOlCZO0SPP2VEXbhenvR2S4TJpq2CERQIqX0/xgWNAnIPq5jVCyxovuuuqB887q
	GdVoB1sgalG6xgAZHFOHxWpL0jJM6AoTv/itYRDftxCdFFtBo11XLcNalNtW6Q7HGP9UN++c7km
	+jnL1lTpYFcOusU3XZEFaqXkK+YM308yXGSsyFsEXj+VRzm262jtSDteRE1h6jyG5Y9HOlISGE6
	Exp9UJ3AnFpeXSKs8GbbkSfTNEk5a3TSjD88NlCFqPR8V2gp0JK7HNQQtN3qDYmKqDP+jHyk9Gq
	ByqVI0SlkpBGQCABNTB6lqhExAuP5+OJxUXdcKq0U02Vc5JZpIDIwUkmiafsgGk823XsiXVx+4e
	53ajIlH8b5oMxY6TDcwWjYux6+xAMBjz2m9vCjYmeq8VZpmhrGz
X-Received: by 2002:a05:6000:3111:b0:47f:9c6f:8844 with SMTP id ffacd0b85a97d-47fd2abac47mr2511007f8f.9.1785485034337;
        Fri, 31 Jul 2026 01:03:54 -0700 (PDT)
Message-ID: <8b4568ef-1fe7-4a3f-b1b4-a3175ebe62d9@suse.com>
Date: Fri, 31 Jul 2026 10:03:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/24] XSM: reduce redundancy in hook machinery
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <758c8410-a18e-45dc-8944-5913e5832397@suse.com>
 <7487f138-e5e9-41d6-9291-f5eef42d09a1@suse.com>
 <62738b20-ef4b-47ac-832c-5c5fe353e56f@apertussolutions.com>
 <8030ff8e-ed83-46c4-ba69-4954ee645c38@suse.com>
 <19775f5b-e458-4336-92a3-8f8103708564@apertussolutions.com>
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
In-Reply-To: <19775f5b-e458-4336-92a3-8f8103708564@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-42698a/1785485034-A9EC69EA-A0DCE6D9/0/0
X-purgate-type: clean
X-purgate-size: 1404

On 30.07.2026 20:21, Daniel P. Smith wrote:
> On 7/30/26 11:18 AM, Jan Beulich wrote:
>> On 30.07.2026 17:05, Daniel P. Smith wrote:
>>> On 7/28/26 9:13 AM, Jan Beulich wrote:
>>>> Hooks not taking xsm_default_t as first argument could of course be
>>>> adjusted to take one, at which point they could be covered here as well.
>>>> Question is why there is this difference in the first place.
>>>
>>> I have a theory but I am not confident to write it down. I can see if I
>>> can confirm with DDG if you really care that much to know the why.
>>> Personally having a consistent hook interface convention would provide a
>>> simpler pattern for people to follow if they are having to introdcue a
>>> new hook.
>>
>> Well, I don't really need to know the reason. If you agree that making
>> things uniform is a good move, I can simply stick a few more patches at
>> the end of this series.
> 
> Correct me if I am wrong, but we would be introducing an unused 
> parameter in exchange for uniform interfaces that can be generated with 
> machinery reducing hook maintenance overhead. IMHO I feel from a 
> security standpoint this would be a win. Would you disagree?

Definitely not. What I'm unsure is whether I'd call this a security related
win. To me it's more a win in maintainability in general. Which of course
(typically) also helps security of the resulting code.

Jan

