Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B7C2CC6B03
	for <xen-devel@archiver.kernel.org>; Tue, 13 Oct 2026 11:57:16 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1447052.1663208 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGb7t-0005tv-0z; Tue, 13 Oct 2026 11:57:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1447052.1663208; Tue, 13 Oct 2026 11:57:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGb7s-0005to-Td; Tue, 13 Oct 2026 11:57:00 +0000
Received: by outflank-mailman (input) for mailman id 1447052;
 Tue, 13 Oct 2026 11:57:00 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xGb7r-0005ti-VU
 for xen-devel@lists.xenproject.org; Tue, 13 Oct 2026 11:57:00 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xGb7r-007lal-84
 for xen-devel@lists.xenproject.org; Tue, 13 Oct 2026 13:56:59 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ace1c8b-8faa-0a2a0a5109dd-0a2a450995aa-0
 for <xen-devel@lists.xenproject.org>; Tue, 13 Oct 2026 13:56:59 +0200
Received: from [209.85.128.53] (helo=mail-wm1-f53.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ace1c8a-be1a-0a2a45090019-d1558035a9aa-3
 for <xen-devel@lists.xenproject.org>; Tue, 13 Oct 2026 13:56:59 +0200
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-49e73611928so30711415e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 13 Oct 2026 04:56:59 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a18c85009csm280040665e9.2.2026.10.13.04.56.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Oct 2026 04:56:57 -0700 (PDT)
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
        d=suse.com; s=google; t=1791892618; x=1792497418; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Yo727WvnGhExRxgrLCwn3w6kydndywV/v9mdbK8SEqM=;
        b=g7RC44AvQeV+N7H32O+qXg7Z48T9v0+5i4v4y/qF40OVS0kM9+gwSYZ6eRMdZRig/M
         jf08EtoipRxcfGDwAUUrY/NPa5jD1t1Q2E3vKdrG+eWOYeaL3wn/JITPfxY69eh3ixUz
         qCjfzKXYmh6HybHXClebQsJ73dalrmQooGTcOKngTlh87yYiBFGZM0zYrYeY4Vv9eqkT
         EL+vmVTuS1I4Btq2r7unqpEcr7WRqFB2Wu7f/eBN4sHKJIVQd7aeRiE0Mg2/mdCoK1t3
         G3z3nlvYYXxbUwfsQwapRb0cNao3xKsliuVD5TbMzyATjow4XFV+aQuCpJlOsamHYypq
         hY1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791892618; x=1792497418;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Yo727WvnGhExRxgrLCwn3w6kydndywV/v9mdbK8SEqM=;
        b=NopJqWNr7vL7zfxb7wgyIBsR8PEMqEotQZSDOn+V89DgvI+sTNwGXsEoZc9lGVJN1c
         gpJzmrUbQ/lRiqAsR+Nkbh7JqVbr9ELE9oWBWwdHwVQrofETBcjcZrP4brtnYHW6Klpu
         RMgN8JSnlCmX7mr4o7vh0c0Go/8G97HYWSugaetPK+zPu21873WN53xKR+plGG0/onD0
         T51GZL9cwaOg9Bl3gRBlycYE5uz8dSz0TX4DMV8A7SBkyzcrPSaLpsFI9bd/oRFKmfi6
         cSFkMt0kuRFhX3pvB/PHhGS4J/4i6kO2WBHWoOGbcjfbj8FttYleTQz8iM5DtVQJDA81
         a22g==
X-Forwarded-Encrypted: i=1; AKwUvBywbcYXCKZXYfEWiXVq+A4COfY2OQd9cLTm70HhsuTt6ak7zkS3xeyA4xpOXTJ7SzusHgOFFXwoGGc=@lists.xenproject.org
X-Gm-Message-State: AFq9FYIlH7/umgTNiw2Z7uQBdEemAAbTT/TxC9pUserzLuB5+KDMI0yQ
	GDjVpELLN4GqNfRM2BMVSv6MTP3+nXM6NJZiFS8qYDZ+fn0QxQqhncefsgmBnoLFuA==
X-Gm-Gg: AYBFou38EpmqWfMBDWVOsE//TD89BFdUsBZpKwxrlifG5gZN/bG/er7AbY7QoCnqRUg
	5rtFRoru8v84zFDJyGbM94e2CIqf7FlnUUnfSCS1h6O79IVT/TDoI+7Uq+pwaGUjheb24rxSBN2
	8W6dcHOH/qNCbZG+poPiEr6UYoAMYQ3Ah/nesnel2RnyqHzyPxKKTcLfT1mjbSOQZWTS9Uhdesr
	4fuyc31hN/2LU0TamsbpaQp/6kHePtWgI5xH8+anSPKkYqmTZxIN8W7s78v/CIjcb71VxkRrsUT
	MWfcdr01bqOoCQpb1nb80c0lyxT6ZRLLZVVzTNn6p24VIY3NEls8AClQnFOVBKpBGyqz8eb5Q4R
	ZrkwCaYu2WeUjyqXkSpRDqbbOFkWRiBRMwcycRrNOuP+qndPU9SF4+rgJK+CZ7Hii+CoIPDmf3W
	iCTrGNGtF/lrC97UTUweVRfwJgJ2macey8ysVUuS0Crm7AV1SY/8TsyFjoOM3MBrwdrt1W7jd0P
	ClKVUkTKNH/15mh8Qr/RBM2nZ+11VEWXBeEvTzZavZ4401ypMsC6YUfSItDlA==
X-Received: by 2002:a05:600c:5254:b0:4a0:20b4:ba93 with SMTP id 5b1f17b1804b1-4a18e4aa11dmr250270595e9.16.1791892618512;
        Tue, 13 Oct 2026 04:56:58 -0700 (PDT)
Message-ID: <71f51ddc-3034-4501-b532-e76eb9f898ba@suse.com>
Date: Tue, 13 Oct 2026 13:56:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 08/18] x86/domain_page: prepare the mapcache for
 per-vCPU accounting
To: George Dunlap <gwd@xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
References: <20261007104051.48841-1-gwd@xenproject.org>
 <20261007104051.48841-9-gwd@xenproject.org>
 <8514b7b6-cf1c-44d9-827c-675fd5a6708e@suse.com>
 <CAFLBxZYOHGDbp_=rBP0aRd9J3LJ-B79zpt4B9LQyjKQiWjb6ig@mail.gmail.com>
 <43f7a948-669f-48cb-8e1f-9d1a8a98a8f5@suse.com>
 <CAFLBxZbQrLzDy8cguzwQr9e1c+s9OnP47rqFN+-5Pzv=r35Sig@mail.gmail.com>
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
In-Reply-To: <CAFLBxZbQrLzDy8cguzwQr9e1c+s9OnP47rqFN+-5Pzv=r35Sig@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-bad1c0/1791892619-FCE14034-97A8858A/10/78276251493
X-purgate-type: spam
X-purgate-size: 4062

On 13.10.2026 11:53, George Dunlap wrote:
> On Tue, Oct 13, 2026 at 7:26 AM Jan Beulich <jbeulich@suse.com> wrote:
>>
>> On 12.10.2026 18:07, George Dunlap wrote:
>>> On Mon, Oct 12, 2026 at 2:48 PM Jan Beulich <jbeulich@suse.com> wrote:
>>>>> @@ -74,12 +130,12 @@ void *map_domain_page(mfn_t mfn)
>>>>>  #endif
>>>>>
>>>>>      v = mapcache_current_vcpu();
>>>>> -    if ( !v || !is_pv_vcpu(v) )
>>>>> +    if ( !v )
>>>>>          return mfn_to_virt(mfn_x(mfn));
>>>>
>>>> I don't quite understand why this is_pv_vcpu() is okay to drop. What
>>>> mapcache_current_vcpu() returns isn't what it ran is_pv_vcpu() on. (Same
>>>> in unmap_domain_page() then, obviously.)
>>>
>>> So mapcache_current_vcpu() is a bit weird; the actual invariant is,
>>> "Return the vcpu whose cache structure we should use if present; or
>>> NULL if there's no cache structure to check and no need to sync."  So
>>> if pgtable_vcpu is HVM, return NULL and just use the raw address,
>>
>> I was going to say "But there's no returning of NULL there if
>> pgtable_vcpu is HVM, at least not at this point of the series." Only
>> then I realized that I was being confused by there being both v and
>> curr, and neither of them being pointer-to-const (i.e. both being
>> equal in terms of which of the two might be returned from the function,
>> yet as a result of earlier changes neither is being returned anymore).
>>
>>> because at this point in the series, both HVM and the idle domain have
>>> full directmaps; if pgtable_vcpu is PV, then maybe sync, and then
>>> return the result of the sync.  That may be a PV domain with a
>>> mapcache, or an idle domain with no mapcache, but in either case you
>>> can then read cache.inuse to see if there's something there.
>>>
>>> So yes, it's a different vCPU; but it's still defined in such a way to
>>> be safe to check cache.inuse.  The only possible value *change* after
>>> a sync is the idle domain; I don't think we need to do another check
>>> to make sure it's still a PV domain.
>>
>> Yet then - aren't the is_pv_vcpu() you drop here redundant already
>> before this patch/series? In which case (since it's not entirely
>> straightforward to reason about and beneficial in its own right),
>> might it make sense to have this be a separate change, with (in
>> particular) dedicated justification? (ISTR having thought about
>> making a patch to this effect a little while ago - perhaps around when
>> Roger last touched this logic -, but then deciding that something was
>> wrong about my reasoning. That may have been a mistake, as it looks
>> now.)
>>
>>> In fact, there's an argument that we should modify
>>> mapcache_current_vcpu() to take pointers to dcache, and vcache, and
>>> return just cache; that gets rid of v as a local variable of
>>> map_domain_page entirely, and makes the logic ("get the cache we
>>> should use") more clean, and gets rid of one mfn_to_virt() instance.
>>> That would require some non-trivial changes, so I'd rather avoid that,
>>> but I can do it if you want.
>>
>> Sounds entirely plausible, but can as well be done as cleanup later.
> 
> I'm a bit confused about what, if any, change you're requesting here.
> Are you requesting a preparatory patch just removing the is_pv_vcpu(),
> with an argument as to why it's redundant?  Or are you OK with having
> this cleanup work be put until later?  Or do you want me to put the
> is_pv_vcpu() back until we feel like cleaning it up properly?

Now the confusion is on my side: Aren't what you suggested as further
cleanup and the dropping of the is_pv_vcpu() independent? If it had
been just your first question, I would have said "yes, if possible".
But the following question starting with "Or" is irritating. Yes,
that _other_ cleanup work can (as I thought you also suggested) be
deferred.

Putting back the is_pv_vcpu() isn't really necessary, as long as
their removal can be properly justified. (Hence why I think that would
be better as a separate change.)

Jan

