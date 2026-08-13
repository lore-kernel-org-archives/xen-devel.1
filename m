Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD390C5CFEB
	for <xen-devel@archiver.kernel.org>; Thu, 13 Aug 2026 12:15:00 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1389927.1630516 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wuUKg-0003yE-Ca; Thu, 13 Aug 2026 12:14:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1389927.1630516; Thu, 13 Aug 2026 12:14:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wuUKg-0003y7-9D; Thu, 13 Aug 2026 12:14:50 +0000
Received: by outflank-mailman (input) for mailman id 1389927;
 Thu, 13 Aug 2026 12:14:49 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wuUKe-0003y1-W4
 for xen-devel@lists.xenproject.org; Thu, 13 Aug 2026 12:14:49 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wuUKd-00D0Us-Vh
 for xen-devel@lists.xenproject.org; Thu, 13 Aug 2026 14:14:47 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a7db531-2eae-0a2a0a5409dd-0a2a45078298-16
 for <xen-devel@lists.xenproject.org>; Thu, 13 Aug 2026 14:14:43 +0200
Received: from [209.85.128.53] (helo=mail-wm1-f53.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a7db533-b4ea-0a2a45070019-d1558035d05c-3
 for <xen-devel@lists.xenproject.org>; Thu, 13 Aug 2026 14:14:43 +0200
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-495757ccbc1so5632465e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 13 Aug 2026 05:14:43 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4815a5b6616sm6356246f8f.25.2026.08.13.05.14.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Aug 2026 05:14:42 -0700 (PDT)
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
        d=suse.com; s=google; t=1786623283; x=1787228083; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L+02jV2mSv+XtLJQcx8eh646sKwH/hfWr7h2bSp194M=;
        b=VYNlO6LMu771xOlJfb152kFqPxgxCecdvKV2TJ/rhkQQKYIRdIjmX95r7tkNtTw/s/
         DViRm62WTt9ReD6o0k8PWoiKurTj55PUkjJGOaVjLG3GPt1yQw0e4rRs4QtWSQfPE+sW
         jGplsmGbnZLMKJdIFA0H9UO0HOfzauBal9DnHRFVlfvlzZnLg7qIBOj2jz6h481kn7OM
         DUvarNL4uF0EbfzJsqbivVm5CiXoh3Dxcce/xL3nfg7bO/u/JOumXyS9InpKVuFmcQSa
         0Sl8me4F1yyE3MPKFin59YtXy45r0Q+aSj40L73TEKCYV6cWEIlLRoTW49cYV46D9OKX
         WIPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786623283; x=1787228083;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L+02jV2mSv+XtLJQcx8eh646sKwH/hfWr7h2bSp194M=;
        b=IVO5bDUd/VaQxAoRHMYnErA05LG8BA+xk4m1sADxejVNcHN9XCKXfjLQpatXhLjg0T
         RkloAN+pYK1V1f5or4h+0qe8zslNij+iHMcGhT0G5OsiWi/xUzV8tjIBVKlLczznCzdg
         5UkyXatrCfhFP72WA7pS1IobKKD0oovxYzRu/QcyCoj1tAcOj47Mt4MD8fEo88E7+kzz
         2iVavpIFdIyTJtBGOBTWmtERpASJEHcQISnKN8Ip/s06YWsGi+ypHoSreCvSROorI3d9
         wQcuWfPQi5c+gC3Bi4M3j9HDRIUGNf/EQKiUtB3Luf9Kok3OH+SARmdKtAbbVhs87FEP
         A2bg==
X-Forwarded-Encrypted: i=1; AHgh+RpPUHG4AyN+c/8h8AyeLoAcO1o0uXRatUbGU5MlJkNXhombPdNOlRg03ZverQ4UK98j0Uz5vEK4zAM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxqcRvVaYrKYu8TKQdFyElunLsFXHaUPIagrhiQBvV5BG88FhBI
	d64cwnd0GBjLWB/tt69w8Iddsrn29WlJD3To0BNlJb+UOTxkWE+5eZAVMK5yYmzjTA==
X-Gm-Gg: AR+sD12RuMTzn8We+4kYMHq5bvomofDnCxV/fkZdoeEybfH6lie1CVeh7DcnA+DmCD/
	bV9A1tlPmmIwNKWkjJBM9iA0peOUo+YFzZIBivzo6d2I2ejbT4pY1VQExn6etwrA3KrjiVyoi6P
	9Jo318nnR2XDQS82q0ocMh8KRoyjzkOqhdqjpn15Og65bDIe9Xs3W4ikU89ZZ9i61wqz2+zSkhO
	dAkeltF7AwtFXgmfdUQ8yBCE6dvoTAsdB0ju0lyOVW+WD72tJj1WyKDL+2NlTMQshikeFQcVefZ
	bRzxM31kjzGV8Or0+tdtdeM+JdnklmIsO7DQBqhf8kAvpCtBnzEMRxlgl6Gc+4x8WPb4I3zN/rL
	uJdrc10GZ0UcJgonuCkyUE8N1CXj9DksI0+S+jFOUofCcknnJHWOCYMr3DAXxjlgICUCuJs4unB
	HpjdGckR6DF+EOcyXiUmC/lbNDhGm06yZSyQt8LCx4G4vVlMGdGU8fDCz1c5oNQsxqzs8DIaEln
	Zc27OZRAM7JK+lEFK2Yeo2GEIE2ry0XJkxg3uLuwU7s7WRkOCSV
X-Received: by 2002:a05:600c:3b93:b0:498:ee7:e407 with SMTP id 5b1f17b1804b1-499821985d7mr72175245e9.17.1786623282965;
        Thu, 13 Aug 2026 05:14:42 -0700 (PDT)
Message-ID: <a83cf90c-142a-41ee-a80b-4e849cc804f3@suse.com>
Date: Thu, 13 Aug 2026 14:14:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/24] x86/mm: get_page_from_l1e() is PV-or-shadow-only
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <758c8410-a18e-45dc-8944-5913e5832397@suse.com>
 <07e90200-95b5-413f-9259-7f0481d36521@suse.com>
 <4531d02a-3a37-4c57-ba17-32034ba08cf9@apertussolutions.com>
 <b742fec6-730a-4138-b5f5-7197f24df247@suse.com>
 <e5799ee9-6a97-4ad8-b1c4-6b54e43b7a4d@apertussolutions.com>
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
In-Reply-To: <e5799ee9-6a97-4ad8-b1c4-6b54e43b7a4d@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ef75cf/1786623283-A5EC6AE4-4BD5C710/0/0
X-purgate-type: clean
X-purgate-size: 2969

On 13.08.2026 13:51, Daniel P. Smith wrote:
> On 8/3/26 6:11 AM, Jan Beulich wrote:
>> On 02.08.2026 17:55, Daniel P. Smith wrote:
>>> On 7/28/26 9:18 AM, Jan Beulich wrote:
>>>> Otherwise the function is unreachable, violating MISRA C:2012 rule 2.1.
>>>> With the function compiled out, its dedicated XSM hook also becomes
>>>> unreachable, so it is similarly guarded.
>>>>
>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>>> ---
>>>> It feels suspicious that the .priv_mapping() check is used for HVM guests
>>>> in shadow mode, but not for ones in HAP mode.
>>>
>>> I believe a hint to it is laying in the comment,
>>>
>>>    /*
>>>     * Let privileged domains transfer the right to map their target
>>>     * domain's pages. This is used to allow stub-domain pvfb export to
>>>     * dom0, until pvfb supports granted mappings. At that time this
>>>     * minor hack can go away.
>>>     */
>>>
>>> Correct me if I am wrong, but get_page_from_l1e() is only used by PV and
>>> HVM + Shadow. When in HVM + HAP is mapping a guest page, it is done
>>> through p2m_get_foreign() which will then be covered by
>>> xsm_map_gmfn_foreign(). So only HVM + Shadow can hit TARGET_HACK check.
>>
>> Yes, sure; that wasn't the point of my comment. The point was that I'd
>> expect _the same_ hook to be used by the other path. Aiui if you make a
>> policy, you want same situations dealt with the same. Hence there shouldn't
>> be a need to express the same thing two ways.
> 
> But it's not the same, the enforcement mechanism is different. FLASK is 
> an evaluation of Subject/Object/Predicate. In this case the mechanism 
> (software enforced access) that provides the Predicate has enough risk 
> that it warranted itself a separate check to allow fine grained 
> assignment of the operation to a specific domain which was driven by a 
> specific use case.

I don't understand this. What mode a guest is run in (HAP vs shadow)
shouldn't affect what permissions it has. Two distinct hooks means the
guest might change behavior when flipped between hap=0 and hap=1. Which
absolutely shouldn't happen, imo.

>>> I think the question is how to address the TARGET_HACK situation.
>>
>> I fear I don't really know what exactly you mean here.
> 
> Is this path still needed for the pvfb or is it now in use by other use 
> cases. If the former, then close the ability otherwise TARGET_HACK 
> should be renamed to something sensible for general case. Some code 
> documentation might be necessary to help understand why/

Only after grep-ing it has become apparent that TARGET_HACK is something
in Flask. It's entirely invisible outside of Flask, e.g. at the call site
of the hook.

I think the comment is stale in referencing only pvfb, but I'm not really
sure. It is too long ago that I last saw the log message issued there,
and hence I don't recall under what (buggy guest?) conditions it could
surface.

Jan

