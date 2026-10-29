Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 721AA606A326
	for <xen-devel@archiver.kernel.org>; Thu, 29 Oct 2026 09:56:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=DTx7ptZp
Received: from list by lists.xenproject.org with outflank-mailman.1464335.1675032 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xMMrV-00045k-LF; Thu, 29 Oct 2026 09:55:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1464335.1675032; Thu, 29 Oct 2026 09:55:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xMMrV-00045c-Gv; Thu, 29 Oct 2026 09:55:57 +0000
Received: by outflank-mailman (input) for mailman id 1464335;
 Thu, 29 Oct 2026 09:55:55 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xMMrT-00045O-Js
 for xen-devel@lists.xenproject.org; Thu, 29 Oct 2026 09:55:55 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xMMrT-00DqTC-06
 for xen-devel@lists.xenproject.org; Thu, 29 Oct 2026 10:55:55 +0100
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ae3180e-8faa-0a2a0a5109dd-0a2a4508b5c0-36
 for <xen-devel@lists.xenproject.org>; Thu, 29 Oct 2026 10:55:54 +0100
Received: from [209.85.128.54] (helo=mail-wm1-f54.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ae3182a-f659-0a2a45080019-d1558036a54d-3
 for <xen-devel@lists.xenproject.org>; Thu, 29 Oct 2026 10:55:54 +0100
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-4a9a8d6cea8so6953085e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 29 Oct 2026 02:55:54 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a94f05e4e4sm74207055e9.3.2026.10.29.02.55.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Oct 2026 02:55:53 -0700 (PDT)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:Autocrypt:Content-Language:References:Cc:To:From:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1793267754; x=1793872554; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Y62QYoQ69kHGf0I6xAb8FiX+7PjW3kdG4Y6EN9Ch4iE=;
        b=DTx7ptZp+prfERvDqiFz2H9GiGjPCd1kehjHxRUedfuDRYR4dWHpNZkP5WBDMyjYp1
         eedGivEblZnztyQySxsNBo+/aKTYe3Q273n+BgQD6EYGhrrvA06xSoeqwQ0FL6Nb3N5Q
         P6rZ9W/X8haPFW6I3czuew/tDAPjJVeOQ/kvxbrRHce8BX7J7y682aEbQuD+bN4G18FB
         McuicBCoDCu6WjeRldtE1MkLJcKD8Ugh7dSog3nqWq7vrBO7KfTRezQeGMej5QOiCPdf
         SDx+1oQtnl+NZcoTwHc5MYCc02JN32RSLzlzu/0fxFDj2gaHPmM+FYqRQZMddnzm+9N7
         HAoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793267754; x=1793872554;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Y62QYoQ69kHGf0I6xAb8FiX+7PjW3kdG4Y6EN9Ch4iE=;
        b=wq1ovWCqeVoK6E7e90AQJj6pOWJL7fwdFsuZwugzgZl9CLtHPmLxq/Y7QkFr+SWG3q
         YfGE7+Jh3tIhF0w+xucl9zTuG/PI8FD4JIW+Z1pU+o+woI8XisXCcypkg9JAhvovKgye
         ZX6PkFKIOiHkPfrkuGyq7mULumA2RS93L/oZ/7OyUyc24schAHxpNY+HMNKW+GvS9r/s
         JwOS4g9xFlylknxxy0+EiCrnL3k9hLpuoEdX1VilL9wZtIA3ZZQzQMO/xG3ysjyS6zaU
         OmzQDNUiDt9JoGUPZin7//VtyPUQDoNX3l61nxdoHfVdndtVmjnFtViRbYLwRgiBcPe8
         j2qQ==
X-Forwarded-Encrypted: i=1; AKwUvByNQKYqMZ0b4OReTWFX3q3KLvilM/Nv29fmHEfOOBxB6W1E5RVEVQwz0c4e8kiJ60/wP4/JlUau1f8=@lists.xenproject.org
X-Gm-Message-State: AFq9FYJXh2VcAdkWz8TtqBidhDHjFJlE9/PBJW7tF3rV9/Rx2t5HISMX
	yfUmUI1nuFS0WznHZcvVwiUMlb2YbeQDrcGdmX0vRmRphWYZW+H/0YP3nMFmEODf6A==
X-Gm-Gg: AYBFou3Kbk8LhfqwVfGKPo0v4GMh96sYmKEjF4pXhVmspWxYUn7ShSaJ8etiDjDOFqT
	//OIFJwgI7ELDfpzgvQzP52aO3sD35M4hGwZU16OC0ZjhJYPBFlLMiYA5I1CtcUIT/d9IfVEpGf
	aK62htxVH7t8DHMqhVl8GdSLz2luQ/EEaVYFGzm6yr0yD7udSWhw6nvwu82l22DIU2cFqKh+e2U
	Uu+3ZLl6s3YioLKUZILvnN932/+5Ju7zp8+UO0e+Yld/XfU1+PFeEVmVPgkiH5XPETDrPgCkdYf
	SEBKTHga47S98Y678f44H6n9EI38wo92GhuR0Q5yFbGA9cKHXQTo6m9lcPPrYeaqT/ntxIRmd0T
	nbOmCdUqgg/760g5CHciFLS84tbPTiaiRIpSuwbXFGCuzIWe80wRLrrRQkrjoBWyq+09kQwYPAE
	yX42iWTk3lMOoXdBmtHD5IeoErxhnOpvyzggBvAkYRpsKLZ2XV3IlQREwT3VKyZ+73Kz/nAJAR0
	72BmOPO5NLgzwm2w16VS1fbos3enFzhxQkVqty4OZiQ3yYijk/YPdYd53Refo41jhZh/ZbiRBkL
	W2tHvNm8zFFWt3+BEvDJ0gXkCNRTKw/KbkTRrppSG+sXNBdXDGcPmS4PFrsHdjf2OjYMo9ZM9Wf
	zRt69/ThYERz4NjUHTJl2CPHEZXMYc107nW6YNiU=
X-Received: by 2002:a05:600c:621a:b0:4a2:10f9:37db with SMTP id 5b1f17b1804b1-4aa871e8be0mr50764985e9.7.1793267753583;
        Thu, 29 Oct 2026 02:55:53 -0700 (PDT)
Message-ID: <1f83eca2-09c5-470e-8326-5ec6604c6e6f@suse.com>
Date: Thu, 29 Oct 2026 10:55:52 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] gnttab: drop bogus check from _cache_flush()
From: Jan Beulich <jbeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <6d0acc68-9d07-4e0a-b27b-0095a51ebe42@suse.com>
 <8d4f9d39-f80b-43cf-91a1-033a8bca777f@citrix.com>
 <e6cfd958-874a-4d25-9c40-dfe9f1979c2f@suse.com>
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
In-Reply-To: <e6cfd958-874a-4d25-9c40-dfe9f1979c2f@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c1860d/1793267754-D614687B-9818EB44/10/78276251493
X-purgate-type: spam
X-purgate-size: 1656
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 15.10.2026 09:11, Jan Beulich wrote:
> On 14.10.2026 18:24, Andrew Cooper wrote:
>> On 14/10/2026 1:52 pm, Jan Beulich wrote:
>>> There's no such thing as an alive domain without ->grant_table, and system
>>> domains (on Arm) don't own any pages. The check should also not be left
>>> there "just in case", because if that check could legitimately yield
>>> "false", the page reference obtained would then need dropping on the
>>> subsequent error path (see XSA-520).
>>>
>>> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>> Reported-by: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>>
>>> --- a/xen/common/grant_table.c
>>> +++ b/xen/common/grant_table.c
>>> @@ -3637,7 +3637,7 @@ static int _cache_flush(gnttab_cache_flu
>>>  
>>>      page = mfn_to_page(mfn);
>>>      owner = page_get_owner_and_reference(page);
>>> -    if ( !owner || !owner->grant_table )
>>> +    if ( !owner )
>>>      {
>>>          rcu_unlock_domain(d);
>>>          return -EPERM;
>>
>> Do you remember that I already posted this patch (to the security team),
>> and you already reviewed it?
> 
> I do. That was after I had made this patch, though.
> 
>> I'm afraid that your commit message is hard to follow, despite knowing
>> the details.  I already have one prepared from 3 weeks ago which I think
>> is rather clearer to follow.
> 
> I'm happy for you to post (and commit) yours. I just didn't want this to
> fall between the cracks.

Are you going to post your patch then, for me to ack? Or are you willing to
ack mine? We should make progress here, whichever way.

Jan

