Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A5DB606A321
	for <xen-devel@archiver.kernel.org>; Mon,  9 Nov 2026 08:53:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=X8Hq614D
Received: from list by lists.xenproject.org with outflank-mailman.1479683.1683600 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQL8M-0000Ra-3o; Mon, 09 Nov 2026 08:53:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1479683.1683600; Mon, 09 Nov 2026 08:53:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQL8M-0000RT-16; Mon, 09 Nov 2026 08:53:46 +0000
Received: by outflank-mailman (input) for mailman id 1479683;
 Mon, 09 Nov 2026 08:53:44 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xQL8K-0000EL-Ik
 for xen-devel@lists.xenproject.org; Mon, 09 Nov 2026 08:53:44 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xQL8J-0035jS-RA
 for xen-devel@lists.xenproject.org; Mon, 09 Nov 2026 09:53:43 +0100
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af18a11-e002-0a2a0a5209dd-0a2a4504b60c-20
 for <xen-devel@lists.xenproject.org>; Mon, 09 Nov 2026 09:53:43 +0100
Received: from [209.85.128.49] (helo=mail-wm1-f49.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af18a17-b57f-0a2a45040019-d1558031a5a2-3
 for <xen-devel@lists.xenproject.org>; Mon, 09 Nov 2026 09:53:43 +0100
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-4a9a8d6cea8so6561865e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 09 Nov 2026 00:53:43 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-49597090444sm9090594f8f.31.2026.11.09.00.53.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Nov 2026 00:53:42 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:Autocrypt:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1794214423; x=1794819223; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ef96mEyve2ssqnVIwG11spX1QDYJ+ZZtXX0BmtsqsHQ=;
        b=X8Hq614DDURicjJWghMaCIvDeVs+aDD428bCsRdhzEnfTtp/X8xiov8aW81U1UVSo+
         hdm0vvhUbq97YgPXXs1K7VoANafLYSbIyEy2aXJvWN/4/M3O/7Yi4JxQqOdmzHF7stOO
         Lpsy7CWijHvEsZObHcYTo59iQxu6CBnBE5uGe5UNqRvkBg37eupuhWM8VkQRSihndUY+
         7OUKUYH+1pIH6j2eaiCNhZ59XgdM6YCGyMPqsRUA6d5t5GTT/MzVWmjXU4suCVqVE0Ih
         tbXEPOolHGt86KPvEGE7yULr9TVI43z8c3sK5ddMg1FeVT71Dqwg51TLVQCK8muLqGXS
         wG2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794214423; x=1794819223;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ef96mEyve2ssqnVIwG11spX1QDYJ+ZZtXX0BmtsqsHQ=;
        b=ELIppmMfXAt29Fe+884QN2PeifD7AA4GaN+TNVzU2UmXpUPin0Jc8CDjL9znbw1AS2
         /qSgio0DIEJfu6rzE09NMsPqCSp4X6BNv/B8xU8Qy+1RmgvKA0Zp/gL2hX23u4nY5DrL
         opKfa4o0nj3PQCIMA2Xaz+BGv8cg+OB8bljKoLZmth/IPEVvmL2jdL+7SgoLF7VgW+VW
         Xdg9SwuZUYImQRnCiy9Yjfv/oZ0gBugiZa2ladxcOM+/Qn24E308WMPt7FLV0HZ3QWj7
         feedpJPhr647Ul9Ra2g43rpSChlwokXunD9abAzwpvQPBAIP4ESquiT87T906Bqx4ZSl
         BoSg==
X-Forwarded-Encrypted: i=1; AL+hErFznFwHlqJgyLWxlxg2EHqCRhxfR4XnQGgIGnL0LcO4ZTNbHXzMg0L08DIyc+Ca8DAgnBis3c+djHw=@lists.xenproject.org
X-Gm-Message-State: APuU4Z8biphZlPR31jJiKUCasUH4XhOHA8jl1liMKpPcsK6B+dzRfbx4
	CALw/3u41qGaz4ol4pDr3sxZ/oMiGv0lDuRG+KHmALBJWHRp2O69KCFTutkWn0JDeg==
X-Gm-Gg: AYBFou2G19XcCowfzK6S6pZ2LwAhzPIxNEU+ukfYhoRihzTcQBq2WwExmCxN8/2qLpb
	sln6it+bJI1ZLVLP7bvNQIWWx94Hi6+ME313MLNw63aOHWqf9jNTYHsPh6A5B5sH4qyA3BhIKdJ
	qN5+b0v4O8qehj+ziKUPQ+uQuUVGofmE4bzad9axSVFqRVeIdGKGAcB9rJnCS8QnKd9UYjMVQAS
	ThcwuvF5FHnLsGLn1TE7+mNz9pNeHCa/Jpjyy80/yUG5y6wCJsrS8RiNpVCVdupqwapc0TLHstA
	iuXnOHrVpXtu3Oh3ysfFaE98eaUQNecV99U0qe4gLLhEms9VvywDtktKgyn7TRPyxHF2oWgJZc7
	8f3nzO5U1XHID240EG0OQTLEEATJUeP//fldsIIrivC5YUe9YMuNUOyUMf39ExSWbH2iaAwInq4
	0iVJ0HXSGVe/XyQZRVDbb9HCja6RIHsmt5Btmx123wH8eEsoYxOkFluzdIXdPx9tVD/AgwbtMKc
	rbrqU13UznmTLyzZXAAH8iixAjVjXK6pj/0l6uwG9tHhvv6z8gqlPjzOpIO1Ec+1ss/QkBzQF0t
	h5m3bc50YmWxsJpvKcN9cSo8yJZMWjrV76ckMXLCxMnQ+ctFB3LMlHlV+pJDPFCdmTxhguu6Q1K
	5JND21CNApPvOhrQ=
X-Received: by 2002:a05:600c:4747:b0:4a1:c6f5:2450 with SMTP id 5b1f17b1804b1-4b963c7e7e1mr68417235e9.17.1794214422513;
        Mon, 09 Nov 2026 00:53:42 -0800 (PST)
Message-ID: <17b5bf66-8b37-427f-a2ab-06330c3f7265@suse.com>
Date: Mon, 9 Nov 2026 09:53:42 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/gnttab: _cache_flush refuse an owner without a grant
 table
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <stefano.stabellini@amd.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Roger Pau Monne <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20261107010623.192975-1-stefano.stabellini@amd.com>
 <c28d472a-9642-4f12-955e-893916ba98f7@citrix.com>
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
In-Reply-To: <c28d472a-9642-4f12-955e-893916ba98f7@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ebf023/1794214423-53CC7B50-73BD22F0/10/78276251493
X-purgate-type: spam
X-purgate-size: 2213
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 07.11.2026 02:37, Andrew Cooper wrote:
> On 07/11/2026 1:06 am, Stefano Stabellini wrote:
>> With CONFIG_STATIC_SHM, a shared memory region without a "role" is owned
>> by dom_io. A cache flush on such a page then reaches grant_read_lock()
>> with dom_io's NULL grant table. Reinstate the check, and give back the
>> page reference taken by page_get_owner_and_reference().
>>
>> Fixes: bec8e3c1fb91 ("xen/gnttab: Drop owner->grant_table check in _cache_flush()")
>> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
>> ---
>>  xen/common/grant_table.c | 4 +++-
>>  1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/xen/common/grant_table.c b/xen/common/grant_table.c
>> index 2285c4aee8..999b10abcf 100644
>> --- a/xen/common/grant_table.c
>> +++ b/xen/common/grant_table.c
>> @@ -3633,9 +3633,11 @@ static int _cache_flush(gnttab_cache_flush_t *cflush, grant_ref_t *cur_ref)
>>  
>>      page = mfn_to_page(mfn);
>>      owner = page_get_owner_and_reference(page);
>> -    if ( !owner )
>> +    if ( !owner || !owner->grant_table )
>>      {
>>          rcu_unlock_domain(d);
>> +        if ( owner )
>> +            put_page(page);
>>          return -EPERM;
>>      }
>>  
> 
> Seriously?
> 
> We debated this at length in the security team, even the fact that
> XSA-520 only applied to Xen 4.21 and older.
> 
> Now you're saying that claim in both the XSA-520 advisory and patch are
> wrong, and therefore the owner path was not in fact dead code and a
> MISRA violation.  This is the only reason why the patch ended up in this
> form...
> 
> Nothing in CI noticed, not even the STATIC_SHM tests.
> 
> 
> What I would like to do is a straight revert of bec8e3c1fb91, stating
> that the claim is false, then apply the XSA-520 hunk with a different
> commit message.   That way at least the logic ends up the same on all
> branches of Xen (in this patch, you're reversed with rcu_unlock_domain()
> vs the XSA-520 fix).
> 
> Thoughts?

+1, the more that we got a report for dom_xen as well. Yes, iirc it was
me to put up the false claim, yet that was clearly under the assumption
that Arm folks would double-check.

Jan

