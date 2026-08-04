Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BF8FC5518F
	for <xen-devel@archiver.kernel.org>; Tue,  4 Aug 2026 07:54:01 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1381986.1625416 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wr9y5-00082X-6Y; Tue, 04 Aug 2026 07:53:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1381986.1625416; Tue, 04 Aug 2026 07:53:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wr9y5-00082Q-3d; Tue, 04 Aug 2026 07:53:45 +0000
Received: by outflank-mailman (input) for mailman id 1381986;
 Tue, 04 Aug 2026 07:53:44 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wr9y4-00082K-GR
 for xen-devel@lists.xenproject.org; Tue, 04 Aug 2026 07:53:44 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wr9y3-007p01-Q2
 for xen-devel@lists.xenproject.org; Tue, 04 Aug 2026 09:53:43 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a719a7f-5cb7-0a2a0a5109dd-0a2a450ab1ae-28
 for <xen-devel@lists.xenproject.org>; Tue, 04 Aug 2026 09:53:43 +0200
Received: from [209.85.128.50] (helo=mail-wm1-f50.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a719a86-f2d2-0a2a450a0019-d1558032b9f6-3
 for <xen-devel@lists.xenproject.org>; Tue, 04 Aug 2026 09:53:42 +0200
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-4954a2e73a9so17436055e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 04 Aug 2026 00:53:42 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49807b8d04fsm424536895e9.3.2026.08.04.00.53.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Aug 2026 00:53:41 -0700 (PDT)
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
        d=suse.com; s=google; t=1785830022; x=1786434822; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0V9nSUKv/Tdm/jG0nL5ZJn57YHMdk7QgzcpAmuCQNyo=;
        b=K/y+m01L4Os4X++fxrQPHHrAn63rJOE/hDKd//miu/Z6Z+koPq4DKVLCEQcFCe6CAV
         LNzbG7IfSbAH0ZhheDm5rqip4kVn0Ylnq5aGDRTWT/q2J96TG3oTlpePLX4txnapWvkm
         NYqobRceDdcLIIP+aRVJS0wj7Jc99CvWfPHlkEu8Yab0YWh4iDaqsFKtdlTyI88BBuRw
         66y2gUAeKaVJuEgeegysb6MNXNwrcZ1S3N7AeQVAlYTy2V0aCd6CG6548laakxL38npq
         4qcySbVRIqZnAO33RZgzj3n0kStyApH463CjU626CgAJsVcP13ZnBKFspNUCbS5mJerU
         aDdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785830022; x=1786434822;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0V9nSUKv/Tdm/jG0nL5ZJn57YHMdk7QgzcpAmuCQNyo=;
        b=fU8rcQaqtTPiSJ3cAEBhNzaAY53pul6UxTNS8dirRU0lSQZ7r8RQTv9O1JeAPH7aCt
         towK0zs2sNfzShcdpZlWVVSf1lGTBzSHdHeIZSNrBxxfXjsk8h3/sTWVuZVw1eb/lx05
         c9nN7itkBWq2bkyVkJX4jov5TcpO7p37whP6AoCHClmjyebMIOhQtoeG9OrUKe2tdnCi
         1KPPlWnUt/fgLQKjW+6EbVU42zfP4u93vmwIvA0UQn8gbvFBNaGDGCmn6rcB5L/djnyW
         Sj6W88Rbq8Ueq7nMz3eejOXw9ekzB980CItj981Pe8mS3hl6KA71rjaTp9fmYuQxgFSL
         Y2Sg==
X-Forwarded-Encrypted: i=1; AHgh+Rp7KYS7DdjiJBP/tm/l+RnboQ9o0+ZWeljva5uJZXef1lrjLkUCCCzJdsjYhqhU1NwbpKbAF+PdH7k=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxkR7v6C4U0v/8vX7h04l9U/jtjP0OxbLCqEeR/QfgCvJ1EtEzg
	qoIUi/meaN4Sy0UoLwG7VHGXnrTNF6PGg/TTURDRKREaJZ65/jB1yrfEF4T3mcMe5I6wLv1CDM4
	RA3gR7Q==
X-Gm-Gg: AR+sD10wl9RXer50s3HmQBJxFlbDiz3p6a0fKL5BKyBF4rrK155lSYkFXUO568CknG3
	ZI1Fdtg7M5HMqTpu0dM+Zyjq4eVRhIZOyxbOa3obRNfc/8fTy6BDMOF7ULfCj5ea8TdqlIySGE7
	2ronKopNksA61ueEt+YaCFPNXp8lrQQ7rMnks8CEs4Nm9rzYm50llv/pPR5b/OMe/A/1buFVuwJ
	yXU0wkOyuq9Qow6TKbHnRjERrSFi15W/tEpVDTPE7845yBbbKWB9T8jyuldi7MXHTXD+SYJtEw9
	ZWR3/zvOJdKrESMm/w9mO71YmQVrCKs9NF2YvkMnlZmBQmGcp6mzFAWjMy/mJpwwgTiS4biYzvH
	I6a9WCUpn1qrInq2LBFLrWNgCwmn5RX0ak7++fNQGo6vZYURwSbKTvOK3jylsXPPdICSGy1KwuZ
	paqAffgAfqhpG8xQCfBN4WqV1R6teRUm5tn5Grg1rBeb/SBK1QLMcLq9NqNM0htk7a0IZyRb7ze
	udx2ct1fLv2b2O3fL+ThhGWAeCjwLUqsIamJY9a2CPrbAdPLNms
X-Received: by 2002:a05:600c:6209:b0:495:6396:8b67 with SMTP id 5b1f17b1804b1-4980c649f67mr323207235e9.4.1785830022317;
        Tue, 04 Aug 2026 00:53:42 -0700 (PDT)
Message-ID: <8097d8e8-42ec-463a-8247-56c9e4d834cd@suse.com>
Date: Tue, 4 Aug 2026 09:53:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 17/24] XSM: make Argo hooks well-formed ones
To: Jason Andryuk <jason.andryuk@amd.com>
Cc: Daniel Smith <dpsmith@apertussolutions.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <758c8410-a18e-45dc-8944-5913e5832397@suse.com>
 <4bd4e7f7-e005-45b4-a543-98597a9de707@suse.com>
 <bbc2fb48-d79e-4f00-81b4-0170dd910aaa@amd.com>
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
In-Reply-To: <bbc2fb48-d79e-4f00-81b4-0170dd910aaa@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-4011c0/1785830022-589C9CFC-5C6B7CF0/0/0
X-purgate-type: clean
X-purgate-size: 2399

On 03.08.2026 23:01, Jason Andryuk wrote:
> On 2026-07-28 09:22, Jan Beulich wrote:
>> --- a/xen/include/xsm/dummy.h
>> +++ b/xen/include/xsm/dummy.h
> 
>> @@ -751,27 +751,32 @@ static XSM_INLINE int xsm_dm_op(XSM_DEFA
>>   #endif
>>   
>>   #ifdef CONFIG_ARGO
>> -static XSM_INLINE int xsm_argo_enable(const struct domain *d)
>> +
>> +static XSM_INLINE int xsm_argo_enable(XSM_DEFAULT_ARG const struct domain *d)
>>   {
>> -    return 0;
>> +    XSM_ASSERT_ACTION(XSM_HOOK);
>> +    return xsm_default_action(action, current->domain, d);
> 
> This one I think should be
>      return xsm_default_action(action, d, NULL);
> 
> Usually current is passed in for the check, but for domain_create() -> 
> argo_init() it is the under-construction domain.

And in that case we want to make sure that current->domain may enable Argo
for d.

>>   }
>>   
>>   static XSM_INLINE int xsm_argo_register_single_source(
>> -    const struct domain *d, const struct domain *t)
>> +    XSM_DEFAULT_ARG const struct domain *d, const struct domain *t)
>>   {
>> -    return 0;
>> +    XSM_ASSERT_ACTION(XSM_HOOK);
>> +    return xsm_default_action(action, d, t);
>>   }
>>   
>>   static XSM_INLINE int xsm_argo_register_any_source(
>> -    const struct domain *d)
>> +    XSM_DEFAULT_ARG const struct domain *d)
>>   {
>> -    return 0;
>> +    XSM_ASSERT_ACTION(XSM_HOOK);
>> +    return xsm_default_action(action, current->domain, d);
> 
> Similarly:
>      return xsm_default_action(action, d, NULL);
> 
> The single call is:
> xsm_argo_register_any_source(currd);

There being just a single call puts this on the edge. If there was another
one not passing current->domain, I think the same argument as above would
hold here. And the general concept is what I think should matter when
writing the dummy implementations.

> These argo hooks all pass in their arguments explicitly, so I think we 
> should do that and not use current.  (The send and register hooks could 
> use current, and that could make sense as those map to hypercalls.  But 
> it is correct today with the explicit arguments.)
> 
> With the changes:
> Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

Thanks, but no - unless I misunderstand how permissions are intended to
work here, I don't think I can make the changes requested, and hence I
can't apply the R-b.

Jan

