Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C6ECC5CFEB
	for <xen-devel@archiver.kernel.org>; Thu, 13 Aug 2026 13:02:27 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1390016.1630586 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wuV4V-00072V-9H; Thu, 13 Aug 2026 13:02:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1390016.1630586; Thu, 13 Aug 2026 13:02:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wuV4V-00072O-6X; Thu, 13 Aug 2026 13:02:11 +0000
Received: by outflank-mailman (input) for mailman id 1390016;
 Thu, 13 Aug 2026 13:02:10 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wuV4U-00072G-8X
 for xen-devel@lists.xenproject.org; Thu, 13 Aug 2026 13:02:10 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wuV4T-00HOjM-0K
 for xen-devel@lists.xenproject.org; Thu, 13 Aug 2026 15:02:09 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a7dc044-e002-0a2a0a5209dd-0a2a4509ae9e-14
 for <xen-devel@lists.xenproject.org>; Thu, 13 Aug 2026 15:02:08 +0200
Received: from [209.85.128.41] (helo=mail-wm1-f41.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a7dc050-be1a-0a2a45090019-d1558029a90b-3
 for <xen-devel@lists.xenproject.org>; Thu, 13 Aug 2026 15:02:08 +0200
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-4954a9e8490so5544525e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 13 Aug 2026 06:02:08 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49981b03d07sm73221975e9.2.2026.08.13.06.02.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Aug 2026 06:02:06 -0700 (PDT)
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
        d=suse.com; s=google; t=1786626128; x=1787230928; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oM3Rke40yRt7mpEL6FbNRO3FcRJa7m4vqYv1zr9ftyM=;
        b=FvT/E+2NeYtaPMDwQ3SZVXVw4Ubcv4ijrObAMhx0bdti4TcF9FpWM11bHsDFNJ7h6s
         PXsZnnpuUCNBX+gUQwpT1ElO6aDz0+alYfi36WU9Kd2QvIApOrUhEZWEewAa8QuOGfkR
         9U843KqUrD4Huml/9+XCUrtR2VwBtuOUacf3RKDMLmHBRBWpyKDb0OI1N5Tg52nDsPmR
         3bsuPdVW/7kTq9IOtVf/kTZMAUh29EZ8BSZohRJHQj6IGlLgYmf5yot3YVxs1p3FHMhx
         cS69ccO2kkzQ0j0FzREPGB31dU/7NJGyDHhgsMNkBnXNvUyZ9z4BlUhI7OoYaZCEEpvm
         gqgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786626128; x=1787230928;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oM3Rke40yRt7mpEL6FbNRO3FcRJa7m4vqYv1zr9ftyM=;
        b=MF6CsZC92+nachMR518X7mnRBMR2SU9UNzwOjSElVBDVXmKLwonhtombj7nTqz9LRg
         bIHwYiwUlEwJLDIaJ2e6oUxKw2igUcweqmHy9FFLXN4TLMT3FGfjB0FUVSHuZXHVQWn1
         QtrGRt7ZrfvtK9+BS0fZv2PTuD4+Fvj5Og31bhj/KKa4NokyPp7fJ2JY1bu2oMJQutF7
         Zb2UROO4Uuq3ywlblPhrq3kCuo5C/kjMhmoVfVtWOCH6qjBJfW21BPew3Pzueb4c5b1a
         /vdLfdPqJOb6aoiG4ImS7iFzLgsWytNX9qRCDHT75pJFd7VrZV4iE4d/ePimVz0GGbZQ
         T9GA==
X-Forwarded-Encrypted: i=1; AHgh+RpjhkdWgrVws4aoWVYPnrBhRp+Eihg45dLn/eAd6HS1ZJrZag4d2SxOzSzmYRrnYGr2L1ZueIf+Tg0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzzLHNkq9CD1poP/33P4si+S+lekjMfpej2Lm0o8aSQ3danH/lV
	Go5b2/0hI/IkgFOEyyzaBOJTvcxTxiEWyL8xOhPBdPQlw1efqyGSMY4MdelkXen3zQTwnIls+D7
	mJZ6XIA==
X-Gm-Gg: AR+sD10IWRNdkC06FEGgUOngJMi3cscYZBwYsynffTwodSpRds0b5TvzWp8BCebjVM0
	cWNRtkG/DSiWA5eFZOfjnzR26GVFdvQ3d1QRA8uBS+RjkYpHDmRNHzjnTN/6xGjDbsPZ2phkZVv
	bRIqtfl4C0NaNtoXs27qx6DnkqDD+NzWvSCNwHze2G8zs+tV3zt3kcaIvub56lRTlD1Vu+ydlqo
	QqIwNt0jjOGyoSc3ydtLE8fjlCuYbukgfuuqxjhzqS56deVDteP03qW8jr/SZaZYjrpfYblt3Ky
	fW+SI9jmLRpMIPCyfiRCayEnzHLnJ8d9SJnBv4Tf127eXjmLXZGXZxWB4UsjrsGJU9BnTMnZ/9X
	idtfBqlf4lUkEfYUASbGSGvrIDsNHqvJuCwVL0t6bIly/oxjPYLala2rdYJ3aRTuQbVSjC9x3yE
	Q/7rLbTfC7bsWa0IgadLqyqka6gDXEIihKIsEp1TnaqATVzTVuD3TO05h8JM1hfEvSV12I/GIe7
	JmZdZCT4Wv0Bqqu0nX/yfs+6fTWpIJPb08gjEmd3c60GbD49Tbi
X-Received: by 2002:a05:600c:4708:b0:499:596b:2e91 with SMTP id 5b1f17b1804b1-49982200a77mr54607905e9.3.1786626127708;
        Thu, 13 Aug 2026 06:02:07 -0700 (PDT)
Message-ID: <9e1a3252-c126-4c09-8425-feee14a1237b@suse.com>
Date: Thu, 13 Aug 2026 15:02:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 20/24] XSM: fold xsm_{,un}map_domain_pirq() hooks
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <758c8410-a18e-45dc-8944-5913e5832397@suse.com>
 <c973c612-153d-413b-a6c8-aeacd25f28a8@suse.com>
 <f99a285e-bd3d-4d8d-94ef-997c238c7f85@apertussolutions.com>
 <274a27cb-13f0-47c3-aa73-1534925dc350@suse.com>
 <7828588f-38d7-4039-95c3-8ffd386a8509@apertussolutions.com>
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
In-Reply-To: <7828588f-38d7-4039-95c3-8ffd386a8509@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-bad1c0/1786626128-BF4D3034-82BADE70/0/0
X-purgate-type: clean
X-purgate-size: 2770

On 13.08.2026 14:42, Daniel P. Smith wrote:
> On 8/6/26 3:36 AM, Jan Beulich wrote:
>> On 06.08.2026 03:10, Daniel P. Smith wrote:
>>> On 7/28/26 9:23 AM, Jan Beulich wrote:
>>>> --- a/xen/xsm/flask/hooks.c
>>>> +++ b/xen/xsm/flask/hooks.c
>>>> @@ -1022,14 +1022,9 @@ static char *cf_check flask_show_irq_sid
>>>>    
>>>>    #ifdef CONFIG_HAS_PIRQ
>>>>    
>>>> -static int cf_check flask_map_domain_pirq(struct domain *d)
>>>> +static int cf_check flask_map_domain_pirq(struct domain *d, bool access)
>>>>    {
>>>> -    return current_has_perm(d, SECCLASS_RESOURCE, RESOURCE__ADD);
>>>> -}
>>>> -
>>>> -static int cf_check flask_unmap_domain_pirq(struct domain *d)
>>>> -{
>>>> -    return current_has_perm(d, SECCLASS_RESOURCE, RESOURCE__REMOVE);
>>>> +    return current_has_perm(d, SECCLASS_RESOURCE, resource_to_perm(access));
>>>>    }
>>>>    
>>>>    #endif /* CONFIG_HAS_PIRQ */
>>>>
>>>
>>> I am not opposed to collapsing the calls as long as the semantic is not
>>> lost, which I feel the reuse of the xsm_map_domain_pirq does looses it
>>> much less provides an opportunity for confusion. Something like
>>> xsm_domain_pirq(..., access) makes more semantic sense to me, as it
>>> would read, grant domain pirq access T/F.
>>
>> In fact I was as well wondering about naming (and a possible name change)
>> here. I decided against it because of the other hooks (touched by patch
>> 19), which all follow a similar model of their names really more expressing
>> the "positive" form than the "negative" one. Further, entirely losing "map"
>> from the name also doesn't look quite right, as physdev_{,un}map_pirq() is
>> where they're called from. To follow the naming of some of the other hook,
>> maybe xsm_domain_pirq_mapping(..., bool map)? Possibly even with "domain"
>> dropped from the name, fully fitting xsm_io{mem,port}_mapping()? Which
>> would then further raise the question whether patch 19 should maybe rename
>> the parameters of those two hooks to "map" at the same time.
> 
> Sound like you and I were running through the same argument with 
> ourselves, except you went right and I went left.
> 
> For me, I find the false case of xsm_map_domain_pirq(..., access) reads 
> a bit weird, "Can the target map domain pirq access=false?" I do like 
> your mapping suggestion along with the parameter rename to map. It 
> changes the reading to "Is target allowed map(true)/unmap(false) for the 
> domain pirq mapping?" This could be carried through to the other cases.

Will do. As to patch 19: I'm inclined to leave the parameters as "allow"
in dummy.h, but change at least the flask_io{mem,port}_mapping() ones to
"map". Will that be okay with you? Else what scheme would you prefer?

Jan

