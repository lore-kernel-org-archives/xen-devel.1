Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EA65C55838
	for <xen-devel@archiver.kernel.org>; Thu,  6 Aug 2026 07:23:20 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1384272.1627285 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrsRS-0003Uh-48; Thu, 06 Aug 2026 07:23:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1384272.1627285; Thu, 06 Aug 2026 07:23:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrsRS-0003Ua-1S; Thu, 06 Aug 2026 07:23:02 +0000
Received: by outflank-mailman (input) for mailman id 1384272;
 Thu, 06 Aug 2026 07:23:01 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wrsRR-0003UU-6P
 for xen-devel@lists.xenproject.org; Thu, 06 Aug 2026 07:23:01 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wrsRQ-003CiB-Fs
 for xen-devel@lists.xenproject.org; Thu, 06 Aug 2026 09:23:00 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a74364f-5cb7-0a2a0a5109dd-0a2a450be154-10
 for <xen-devel@lists.xenproject.org>; Thu, 06 Aug 2026 09:23:00 +0200
Received: from [209.85.128.48] (helo=mail-wm1-f48.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a743654-b7e8-0a2a450b0019-d1558030ad3c-3
 for <xen-devel@lists.xenproject.org>; Thu, 06 Aug 2026 09:23:00 +0200
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-49558ce01afso12892895e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 06 Aug 2026 00:23:00 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4995421b1e2sm48667145e9.8.2026.08.06.00.22.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Aug 2026 00:22:59 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:Autocrypt:From:Cc:Content-Language:References:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1786000980; x=1786605780; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :cc:content-language:references:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ckcvMovW0LtLyQPM832KezdfHJgVxcVYWAXZjbEPPA0=;
        b=Jspyi1LwmoRHKL3zEurc8Dyv0ohM3Ariqo2FkRhpPJNepLuU4Eedy94ewrJcxeAnOe
         5vuT/UFBA/Bk874BNB3MwMLFxpyqsvNuKjsKjm7wuueKWIn4NjC/5Jt40hNTA9U8Jzdd
         eQwyMZEOvkck6KqgN7vE4yFztQNl/sYi2DJAc7+FkHPNhSsLV4fvnsDPjGeK4sz5bSou
         KPETM99CeYqHcFClqsGAwLenjnTZho8n/Cp9vUNYhzyKs8U+8tfJ3EH0ycnweaBZD+kT
         m3ZTrL68AmIt5EYl0BKb4zOnDLj2O6MMpjTarFDSX3GLoe69wHLHakp8p8tqXbRjS/ix
         oO6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786000980; x=1786605780;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :cc:content-language:references:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ckcvMovW0LtLyQPM832KezdfHJgVxcVYWAXZjbEPPA0=;
        b=sPGFb2QqykmUgmW2WAEahINmmSdeR7Hfqj2jSru0/+/RSbJLn4s9oxVwtIajv89ZVN
         5mJZcNXMNsS4m+tDs9q0bQoAGhAuzqDpkNghcRz2JQxttJ8brrI0p3UxzHZlUuO6Dw4G
         6x6OjfR7YTy4KADX8GRjOBvzoCc1fNyeojHuJYq3TTXcfRJDBh2rYRZnNU/UtJa1Gl4U
         i5eb1ui08EPUtEk0WOALIhMHje9c9l81BOABuHvtEvZwgdJeM0rvbFx1AcCi0kPIbd3X
         7h8rmoiVQY91TIfzgSoMd6w+kUx1JpoDl36oZHWUdZzkiqbV4/7fj09l3yxvjdILuMdb
         yQnA==
X-Gm-Message-State: AOJu0YwkLtT0zLEUd8nA8INyAP/cXOxO06kB9+oK90FedZY/vtLSum+1
	ZF/BC/yemwZcMNlAqhaZrUpRxNr3QDOxmskWzBD0Sx3RP+PyRCU0CDzIdz988bdbEn6RWLLjh4u
	mtS9K7A==
X-Gm-Gg: AR+sD13mfRBaC/FeWVivKELSCl4n264IcYLj/2gx797yg9v4d89whdB/1Qy9pwCuwLx
	zwihPteap9c0eubv90YhFmyu0EZ74F7bidCqN3asR51afQKYFdyT2Y6CzYU6KfiJQIM9j3YZz2j
	hhdE/VipGBQ3jndruAbdngExDE4VdOeZ0ij6710z42AvzxEqvxLwvBuIUkxWpY3I+XOJvrJZb53
	+BD45SJ+OC01s43YBkdjt2jLwcpvynJbx0/GJyvA2TuzkRC2GEdirTY77korG8KjrmIehUL6R3e
	xvz4uz/QjKLzUCxcsMdrd+AFyeJDPc5nqpaikjAXQcDGGP5lJafZG4tYTOow5//koxwPrVYo1w9
	uf+XwC8YB7/x7woEVbtY6okq85yTbPMRC927pFpxkfxB+kGs/yhh4kzbd5TEUP1fl7LdTRkGM0s
	vMC4hiSnXM0a/J4OmtrpuWJhNaWazbKL1XSLB3iJvTSh9xDnqDdiGOfbdsdQtD9qr2MHBFFgmvJ
	QGuWczWZU9zKCY8tCvODsSI2eeAfU72s/QO8wgPkw76mnpx3dFeUMIT6mPcMGs=
X-Received: by 2002:a05:600c:c043:b0:495:7a5a:d96c with SMTP id 5b1f17b1804b1-4994e7d89cfmr131608205e9.18.1786000979800;
        Thu, 06 Aug 2026 00:22:59 -0700 (PDT)
Message-ID: <d2207507-d15a-4e3b-a057-77bea7621efa@suse.com>
Date: Thu, 6 Aug 2026 09:22:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 18/24] XSM: make XSM hooks well-formed ones
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
References: <758c8410-a18e-45dc-8944-5913e5832397@suse.com>
 <2c108d3c-eef1-4d4b-9874-b0721fd7560f@suse.com>
 <fc08fe79-cdb5-4ee3-9efc-78b02d00db15@apertussolutions.com>
Content-Language: en-US
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
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
In-Reply-To: <fc08fe79-cdb5-4ee3-9efc-78b02d00db15@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-42698a/1786000980-AACDF9EA-89DFB1E8/0/0
X-purgate-type: clean
X-purgate-size: 2406

On 06.08.2026 02:53, Daniel P. Smith wrote:
> On 7/28/26 9:22 AM, Jan Beulich wrote:
>> For whatever reason they didn't have an xsm_default_t first argument (to
>> cope with XSM=n mode), making it impossible to (easily) cover them in
>> xsm/hooks.h.
>>
>> flask_do_xsm_op() is also changed to return int, as all the function ever
>> returns is an int. This way no new machinery needs adding to xsm/hooks.h.
>> Instead one piece of compat machinery can then be dropped from
>> xsm/flask/flask_op.c.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> Instead of XSM_HOOK, using XSM_OTHER may also be a sensible option here.
> 
> I would say XSM_HOOK is sufficient since at this point it doesn't matter 
> what op is passed the dummy policy is just going to return the same 
> value. If the dummy policy is extended to support an op, then at that 
> point the implementer can switch it to XSM_OTHER.

Good.

>> Question is whether some/all of the other hooks still declared explicitly
>> in struct xsm_ops should follow suit.
> 
> I would say either comment these are exceptions or make them consistent, 
> though I haven't studied if there would be any consequences (doubtful) 
> changing the others.

As I've now added patches to convert the remaining hooks, this remark is
gone anyway. Hence comments there aren't going to be needed (unless those
extra patches would be rejected, once posted).

>> --- a/xen/include/xsm/dummy.h
>> +++ b/xen/include/xsm/dummy.h
>> @@ -439,7 +439,7 @@ static XSM_INLINE int xsm_hypfs_op(XSM_D
>>   
>>   #ifdef CONFIG_XSM
>>   
>> -static XSM_INLINE long xsm_do_xsm_op(XEN_GUEST_HANDLE_PARAM(void) op)
>> +static XSM_INLINE int xsm_do_xsm_op(XEN_GUEST_HANDLE_PARAM(void) op)
> 
> With this change, should there be a comment that the int is going to get 
> cast to long before return?

Not in my opinion, but if you strictly think such is needed, I can certainly
add a comment.

> Acked-by: Daniel P. Smith <dpsmith@apertussolutions.com>

Thanks, including (again) for all the others. Nevertheless a request here:
Especially when an ack is the only part of a reply, could you please trim
reply context much like (most) others do? Without that, every reader has to
scroll through the entire reply context, just to find the single line at
the bottom. That can be a lot of scrolling with larger patches.

Jan

