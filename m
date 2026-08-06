Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BBC4C55838
	for <xen-devel@archiver.kernel.org>; Thu,  6 Aug 2026 08:03:02 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1384333.1627316 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrt3v-000625-Vc; Thu, 06 Aug 2026 08:02:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1384333.1627316; Thu, 06 Aug 2026 08:02:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrt3v-00061y-SV; Thu, 06 Aug 2026 08:02:47 +0000
Received: by outflank-mailman (input) for mailman id 1384333;
 Thu, 06 Aug 2026 08:02:47 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wrt3v-00061s-9n
 for xen-devel@lists.xenproject.org; Thu, 06 Aug 2026 08:02:47 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wrt3u-00EmAW-Mo
 for xen-devel@lists.xenproject.org; Thu, 06 Aug 2026 10:02:46 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a743f9f-5cb7-0a2a0a5109dd-0a2a45078852-38
 for <xen-devel@lists.xenproject.org>; Thu, 06 Aug 2026 10:02:46 +0200
Received: from [209.85.221.47] (helo=mail-wr1-f47.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a743fa6-b4ea-0a2a45070019-d155dd2fd027-3
 for <xen-devel@lists.xenproject.org>; Thu, 06 Aug 2026 10:02:46 +0200
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-4799b3f7c83so1125769f8f.2
 for <xen-devel@lists.xenproject.org>; Thu, 06 Aug 2026 01:02:46 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47ff79b32cbsm4274844f8f.10.2026.08.06.01.02.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Aug 2026 01:02:44 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:Autocrypt:Content-Language:References:Cc:To:From:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1786003366; x=1786608166; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=3qC2koAO6M5d9qfd2TP0PWbB9YVhSs3GAciczfY0x2w=;
        b=I/Aq02b6ZaJEFEzXrGHHy5NCot2aiv7oKbvefORiHOwgS/Z/MrmLLkALC0JiEwYto4
         6PHpZ33slz7BEP+8Fy8i1Bm4Xf3z3coS9BYhMmXSi8WcXi2i/21O2kfnrffXfmGOHEwj
         U7muqe9kFMtbafTb21rAR9/hFTGmVBFkKdmls51QmgtI98djyuS4LfdD7BChO75q/TQA
         lRkga4Yx2lQMlItcHkVFvMOOuPLLeqWXq1vGP5P5WNnzI4qN0ST2oDRws+JrJF5r0pT+
         ux17+FsGfnmP500bp2GOMRSXeyKvVWDlcPTrtrlozsVJzNyo/69eCQmh3p16H15b0/xs
         8BIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786003366; x=1786608166;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=3qC2koAO6M5d9qfd2TP0PWbB9YVhSs3GAciczfY0x2w=;
        b=oZvZAH9AH+R+AEiprew/vYrgFPdeeXC9svokQtppmnd5ZIvWk20GUwG9DhiL/kMiHD
         E+Po6kZnLioU2885woFD1GgU6mGcUrY8PvhUP7MdTRel7mdWQsW4A4XI+pHHl7QPZkDE
         DN1buDppZws63OC6RiDm+YJeVSrM9LiXLEB9+8FFIiopHcDQRr/bJjvcddbWb/HQMEQt
         bQTokizWbxM7C3JonMunzXl4rxJW1sF/eFWZbMVQIAbrAY7iqeaEykuRuzqcv1cdFdF/
         CbutsKvfcRPFOC+1rJKTIzBUOqbkrYog4WLsH/AjZmw+r6h0AzNzgqDE6CENE+xNw+bg
         nasQ==
X-Forwarded-Encrypted: i=1; AHgh+RqE8XOo7E8R/unKLpqux5p1lAp0LTIoTQzAVZfI4VIfQXrHcVBWHK4JpHmF37wklEhLTbwfvvvxg90=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwdnIA4E/lJgpY7yryC2eB3nXnWJbDRICb/4sMvYjmvYM1jhqtS
	LV1DI5HSuQxS4hAjlMeyG2VmaYyFUEtglwxNBzqXypBCQYn6EZnQCzzo1vWVf06/RA==
X-Gm-Gg: AR+sD10N7cbtlNZwTRBQ8jHak6vPOeeO9NPp77lg4J/KHUsxZuCJ2pyljv0hvtp2nOj
	GL3ZqLs2+11aMhNFjA8WL43bacs8TxMysDgex27R0cSS0KoVKEqPcnJSkvyV19xLhhU3cKTMsnv
	Ilve9EVJAm8vTfA6I283yrAqlzVJs/DnBBU3g1rJb/aNqH3f7audGYNEgTx7z5y+pC9QfgzrmcF
	earL+QuwiTSSeb7A7begUWGj0sSlnH9XPgk59BMQI2nzF0k0nJAHudpkUp0zVmISJ7BcWS+x5j4
	fdYD/5qBMbvfc5nYAptct8gDdo3y9Ov0rrsIU0zOvdAJ4tD/5xUGfyLwaci3IE7dreAQhGi/5mE
	oZipJr0EhiWsvjqyPSGaNVb4+EB5MQK0epHE+MA6jYkS0F4eNYgrVLc36Jtu8iVa+aNmzGM/9ax
	uQrk6wrZhhyh8eLW1GpL/fzfrQ8AH44P6Zy3nU5/MA7trK0TObnoHPTwKofiog5vDgwhHQ0r3cZ
	458K35o5wjHm+QupgNQ11olUFpSa8Tk6RA+S8I5yCC2EYAhItWnJ6phYBs1KYQ=
X-Received: by 2002:a05:6000:3113:b0:47f:80f0:8d33 with SMTP id ffacd0b85a97d-47fec6457camr19128500f8f.30.1786003365298;
        Thu, 06 Aug 2026 01:02:45 -0700 (PDT)
Message-ID: <7bfe23f3-b7cc-4821-b4a8-1d1793ffaa92@suse.com>
Date: Thu, 6 Aug 2026 10:02:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 20/24] XSM: fold xsm_{,un}map_domain_pirq() hooks
From: Jan Beulich <jbeulich@suse.com>
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <758c8410-a18e-45dc-8944-5913e5832397@suse.com>
 <c973c612-153d-413b-a6c8-aeacd25f28a8@suse.com>
 <f99a285e-bd3d-4d8d-94ef-997c238c7f85@apertussolutions.com>
 <274a27cb-13f0-47c3-aa73-1534925dc350@suse.com>
Content-Language: en-US
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
In-Reply-To: <274a27cb-13f0-47c3-aa73-1534925dc350@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ef75cf/1786003366-374D3AE4-6B3AF600/0/0
X-purgate-type: clean
X-purgate-size: 2058

On 06.08.2026 09:36, Jan Beulich wrote:
> On 06.08.2026 03:10, Daniel P. Smith wrote:
>> On 7/28/26 9:23 AM, Jan Beulich wrote:
>>> --- a/xen/xsm/flask/hooks.c
>>> +++ b/xen/xsm/flask/hooks.c
>>> @@ -1022,14 +1022,9 @@ static char *cf_check flask_show_irq_sid
>>>   
>>>   #ifdef CONFIG_HAS_PIRQ
>>>   
>>> -static int cf_check flask_map_domain_pirq(struct domain *d)
>>> +static int cf_check flask_map_domain_pirq(struct domain *d, bool access)
>>>   {
>>> -    return current_has_perm(d, SECCLASS_RESOURCE, RESOURCE__ADD);
>>> -}
>>> -
>>> -static int cf_check flask_unmap_domain_pirq(struct domain *d)
>>> -{
>>> -    return current_has_perm(d, SECCLASS_RESOURCE, RESOURCE__REMOVE);
>>> +    return current_has_perm(d, SECCLASS_RESOURCE, resource_to_perm(access));
>>>   }
>>>   
>>>   #endif /* CONFIG_HAS_PIRQ */
>>>
>>
>> I am not opposed to collapsing the calls as long as the semantic is not 
>> lost, which I feel the reuse of the xsm_map_domain_pirq does looses it 
>> much less provides an opportunity for confusion. Something like 
>> xsm_domain_pirq(..., access) makes more semantic sense to me, as it 
>> would read, grant domain pirq access T/F.
> 
> In fact I was as well wondering about naming (and a possible name change)
> here. I decided against it because of the other hooks (touched by patch
> 19), which all follow a similar model of their names really more expressing
> the "positive" form than the "negative" one. Further, entirely losing "map"
> from the name also doesn't look quite right, as physdev_{,un}map_pirq() is
> where they're called from. To follow the naming of some of the other hook,
> maybe xsm_domain_pirq_mapping(..., bool map)? Possibly even with "domain"
> dropped from the name, fully fitting xsm_io{mem,port}_mapping()?

And then xsm_irq_mapping() in patch 23 and xsm_pt_irq_binding() in patch 24?

Jan

> Which
> would then further raise the question whether patch 19 should maybe rename
> the parameters of those two hooks to "map" at the same time.
> 
> Jan


