Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F4A7C55164
	for <xen-devel@archiver.kernel.org>; Thu, 30 Jul 2026 15:19:21 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1378004.1623670 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wpSXI-000287-MY; Thu, 30 Jul 2026 15:19:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1378004.1623670; Thu, 30 Jul 2026 15:19:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wpSXI-000280-Jy; Thu, 30 Jul 2026 15:19:04 +0000
Received: by outflank-mailman (input) for mailman id 1378004;
 Thu, 30 Jul 2026 15:19:03 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wpSXG-00027u-Tw
 for xen-devel@lists.xenproject.org; Thu, 30 Jul 2026 15:19:03 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wpSXG-000PWx-AS
 for xen-devel@lists.xenproject.org; Thu, 30 Jul 2026 17:19:02 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a6b6b5a-bab6-0a2a0a5309dd-0a2a4502bd4e-28
 for <xen-devel@lists.xenproject.org>; Thu, 30 Jul 2026 17:19:02 +0200
Received: from [209.85.128.46] (helo=mail-wm1-f46.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a6b6b65-6ca4-0a2a45020019-d155802eb4a5-3
 for <xen-devel@lists.xenproject.org>; Thu, 30 Jul 2026 17:19:02 +0200
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-495635a85d2so18210135e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 30 Jul 2026 08:19:02 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-498011f2b45sm66953885e9.4.2026.07.30.08.18.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Jul 2026 08:19:00 -0700 (PDT)
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
        d=suse.com; s=google; t=1785424741; x=1786029541; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :cc:content-language:references:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DK9G7ufTPTHJ9ZGVwRcesKJc9Bel6xGMhNXZ87Rz87c=;
        b=afOlprapHTv7j+kdsy55c58XkmIKLOUjJB2q1K7mi6Lq3WjjpUzbH9L8jGE98HuV+b
         RGnszrOb8zJL1yR4GsPDDKbczewkvEkFltV4nm9CF8n13JbDr2Ju1ChgII+jUsag5ECr
         /dypDUqPDK41oq8pOrnreHHJ3MpyZL5W5BjU/hilxrYhBZyAHCT49CHr/LE086fJM+mk
         TKxHpNpGh6/5CZ59EUkwxDSVkRiSQgz0qrCnfOH1/ndkVz7yyDn0cdkwOTlrU3QhsTlt
         UiT2wyfUEdtwp0zdvaQD5/5k7cjNiiC/wCJNe0Lc3+JZQpk0eZBABI6/SQ8GOIY14Mcy
         LfoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785424741; x=1786029541;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :cc:content-language:references:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DK9G7ufTPTHJ9ZGVwRcesKJc9Bel6xGMhNXZ87Rz87c=;
        b=G6dEloWKkBNN3ykvfFDbHIwKcDKeF1MEXQ/34R2SMpudiV1XVdC7p/O7Z3QnPHje5h
         IBwVD3m8blOgUKWBniRzJSArWTREXUNAqr629dx/hjhynjjxmwfDqdRZ/j12B1NFj4GB
         dCyMGqrdwHqgr9kFQxiyaigkFK7MhSzJ/zsYOP1aslbIFXH38TuV+QyoYsSESs+4XEAc
         8e5jLOdmQvchOXP7H/MXsKpKDn33DbhYpI7+1j7NtidP7Gtyls2CdPqLzuYoyRLoWLoF
         FZfbT+lssIohzFhP1O6wgTBTU7Z4oS7dgsc3NFJ4vo0q1zJjCtQn45P2e1A+nB3budh/
         2Ecg==
X-Gm-Message-State: AOJu0YwFG95ZQikM0hLYaksbzGhuN1lIy+FsIlfB4Fp55R4BElEdBcaY
	aySSoGdL/83s5cIDCFZT+Mo8iTw0y7a/K5SbWVpLrZDy2HsSBplgOIJhq5aGip4T3bu+FT4p6xS
	XckZkaA==
X-Gm-Gg: AR+sD12l5JFX56vhOKvTnO+KOYa/PVvbCRGJVs/hnOS13CKrXGc2kOH20D9mzOgcqeE
	OQfHJpzFtrg4dhIXSz6fxsObOV7YXrgpq1cTbRADxvCDorOuGl/YCLRq9CwU20sx1+6pJ/A/WhD
	eTCc4TE8offSc24oVGc0AoQny3HIRcYJccRfkBy6QjOxDuVk6jN+pZBV/HUrLY3OB1ZWLb1VJdv
	+bF7m169AY8qBPt0OVW31mj3IPSdYNWKuQRn5Ahmee2yObqG2J5G7QpCMidBVXnBRUaD5xS+pYc
	fnX5yxbT2Vt3jxz/6/MYSc9zn6j6EtF2lN4lIla0PqwUqyEGEA7PFeQfyx1Zbg44X/pUJ+S43Wr
	PJp7YUISb+oboZ+ZWnSCeXFxmhs3wVp4/MQAdy36c9NAaQrRvZydOCtvvsF08Qfpq6hR1U1HbBv
	AQCU540H4dpxlldxQb5W9ZGZ6W21d2FqVW58uDJ7FxScVKuuyJy7YTlrI/V8rDJqyk0b5VpNFbT
	wXhp6SOBvf0CTtl6Ta2H8Lew8Z4VQ7iLhes6F82BN/ZlmmFxfZA
X-Received: by 2002:a05:600c:1c27:b0:495:5045:39e6 with SMTP id 5b1f17b1804b1-49800e9d3abmr48995155e9.17.1785424741500;
        Thu, 30 Jul 2026 08:19:01 -0700 (PDT)
Message-ID: <8030ff8e-ed83-46c4-ba69-4954ee645c38@suse.com>
Date: Thu, 30 Jul 2026 17:18:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/24] XSM: reduce redundancy in hook machinery
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
References: <758c8410-a18e-45dc-8944-5913e5832397@suse.com>
 <7487f138-e5e9-41d6-9291-f5eef42d09a1@suse.com>
 <62738b20-ef4b-47ac-832c-5c5fe353e56f@apertussolutions.com>
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
In-Reply-To: <62738b20-ef4b-47ac-832c-5c5fe353e56f@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-720697/1785424742-664B62AC-A08EA0E0/0/0
X-purgate-type: clean
X-purgate-size: 4765

On 30.07.2026 17:05, Daniel P. Smith wrote:
> On 7/28/26 9:13 AM, Jan Beulich wrote:
>> Hooks not taking xsm_default_t as first argument could of course be
>> adjusted to take one, at which point they could be covered here as well.
>> Question is why there is this difference in the first place.
> 
> I have a theory but I am not confident to write it down. I can see if I 
> can confirm with DDG if you really care that much to know the why. 
> Personally having a consistent hook interface convention would provide a 
> simpler pattern for people to follow if they are having to introdcue a 
> new hook.

Well, I don't really need to know the reason. If you agree that making
things uniform is a good move, I can simply stick a few more patches at
the end of this series.

>> .{alloc,free}_security_evtchns() and their dummy wrappers use struct
>> evtchn[] notation, while xsm_{alloc,free}_security_evtchns() use struct
>> evtchn *. Is there a reason for this inconsistency?
> 
> Person had one habit that was counter to Xen preference and missed one? 
> I have no justification for it. IMHO the interfaces should be kept 
> consistent to enable better grep-ability.

Which direction would you want it changed? Personally I like the []
notation better when arrays are meant, but the pointer notation will be
quite a bit easier with the new hooks.h machinery.

>> @@ -206,113 +117,57 @@ static inline void xsm_security_domainin
>>       alternative_vcall(xsm_ops.security_domaininfo, d, info);
>>   }
>>   
>> -static inline int xsm_domain_create(
>> -    xsm_default_t def, struct domain *d, uint32_t ssidref)
>> -{
>> -    return alternative_call(xsm_ops.domain_create, d, ssidref);
>> -}
>> +#define XSM_ALT_void alternative_vcall
>> +#define XSM_ALT_int  return alternative_call
>>   
>> -static inline int xsm_getdomaininfo(xsm_default_t def, struct domain *d)
>> -{
>> -    return alternative_call(xsm_ops.getdomaininfo, d);
>> +#define XSM_HOOK0(rtype, name) \
>> +static inline rtype xsm_ ## name(xsm_default_t def) \
>> +{ \
>> +    XSM_ALT_ ## rtype(xsm_ops.name); \
>>   }
>>   
>> -static inline int xsm_get_domain_state(xsm_default_t def, struct domain *d)
>> -{
>> -    return alternative_call(xsm_ops.get_domain_state, d);
>> +#define XSM_HOOK1(rtype, name, type1) \
>> +static inline rtype xsm_ ## name(xsm_default_t def, type1 arg1) \
>> +{ \
>> +    XSM_ALT_ ## rtype(xsm_ops.name, arg1); \
>>   }
>>   
>> -static inline int xsm_set_target(
>> -    xsm_default_t def, struct domain *d, struct domain *e)
>> -{
>> -    return alternative_call(xsm_ops.set_target, d, e);
>> +#define XSM_HOOK2(rtype, name, type1, type2) \
>> +static inline rtype xsm_ ## name( \
>> +    xsm_default_t def, type1 arg1, type2 arg2) \
>> +{ \
>> +    XSM_ALT_ ## rtype(xsm_ops.name, arg1, arg2); \
>>   }
>>   
>> -static inline int xsm_domctl(xsm_default_t def, struct domain *d,
>> -                             struct xen_domctl *op)
>> -{
>> -    return alternative_call(xsm_ops.domctl, d, op);
>> +#define XSM_HOOK3(rtype, name, type1, type2, type3) \
>> +static inline rtype xsm_ ## name( \
>> +    xsm_default_t def, type1 arg1, type2 arg2, type3 arg3) \
>> +{ \
>> +    XSM_ALT_ ## rtype(xsm_ops.name, arg1, arg2, arg3); \
>>   }
>>   
>> -#ifdef CONFIG_SYSCTL
>> -static inline int xsm_sysctl(xsm_default_t def, const struct xen_sysctl *op)
>> -{
>> -    return alternative_call(xsm_ops.sysctl, op);
>> +#define XSM_HOOK4(rtype, name, type1, type2, type3, type4) \
>> +static inline rtype xsm_ ## name( \
>> +    xsm_default_t def, type1 arg1, type2 arg2, type3 arg3, type4 arg4) \
>> +{ \
>> +    XSM_ALT_ ## rtype(xsm_ops.name, arg1, arg2, arg3, arg4); \
>>   }
>> -#endif
>>   
>> -static inline int xsm_evtchn_unbound(
>> -    xsm_default_t def, struct domain *d1, struct evtchn *chn, domid_t id2)
>> -{
>> -    return alternative_call(xsm_ops.evtchn_unbound, d1, chn, id2);
>> +#define XSM_HOOK5(rtype, name, type1, type2, type3, type4, type5) \
>> +static inline rtype xsm_ ## name( \
>> +    xsm_default_t def, type1 arg1, type2 arg2, type3 arg3, type4 arg4, \
>> +    type4 arg5) \
> 
> Looks like you have copy/paste typo?

Indeed. And the last two parameters of .pci_config_permission() sadly aren't
distinct enough to make the flaw apparent at build time. (That looks to be
the only hook with 5 parameters.)

Thanks much for spotting.

> I would just note there is quite a bit of churn in this patch, most of 
> it is mechanical, but makes it easy for these to slip through.

Right. Fortunately this needs doing only once.

> After fixing this typo,
> 
> Acked-by: Daniel P. Smith <dpsmith@apertussolutions.com>

Thanks.

Jan

