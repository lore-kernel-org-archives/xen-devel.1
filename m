Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1254606A321
	for <xen-devel@archiver.kernel.org>; Tue, 10 Nov 2026 14:26:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=UHuP5bH5
Received: from list by lists.xenproject.org with outflank-mailman.1481877.1685768 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQmo2-00055a-W6; Tue, 10 Nov 2026 14:26:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1481877.1685768; Tue, 10 Nov 2026 14:26:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQmo2-00055T-TO; Tue, 10 Nov 2026 14:26:38 +0000
Received: by outflank-mailman (input) for mailman id 1481877;
 Tue, 10 Nov 2026 14:26:37 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xQmo1-00055N-QH
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2026 14:26:37 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xQmo1-00EwaV-6e
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2026 15:26:37 +0100
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af3299c-e002-0a2a0a5209dd-0a2a450382de-2
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2026 15:26:37 +0100
Received: from [209.85.221.49] (helo=mail-wr1-f49.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af3299c-fae8-0a2a45030019-d155dd31dd46-3
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2026 15:26:37 +0100
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-492690dd5daso1500189f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2026 06:26:37 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4983f7801bbsm5230545f8f.5.2026.11.10.06.26.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Nov 2026 06:26:35 -0800 (PST)
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
        d=suse.com; s=google; t=1794320796; x=1794925596; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zjUDzAbuSCVp+N1G8kOvDEnUDUbo/KmksWEVSPhFBpg=;
        b=UHuP5bH5sXkkBgt1rpmcNLEqaIsiPbT1Hga/WKrbLHQfEAzpyxButr/TBH0oCX08bl
         wSpyqszQtjqvJYYqrskSDdFb0wSBIp7ZFJCwHFZ3f3o0eEgkixm3ghdrd0QDrrQQ5iUh
         cquGqsq+seHVkLeLL2viyJIcNJ3WIoVTq381sWY5XgHeyLit0zAVySWqC71Z7POGMZ8y
         FRblhru++ecuppc8OeCxdw+mJnxEcXu7NEhBsvCsHTWytXHpjwMpdbgzZ1GnJODAZQWw
         b7+My/SEhKJg2zUmQ6urKRR4ZnZPMYQ0kPZnUl/JDK2ukVI8UW4AKD2n5cfm/j91np2v
         gdjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794320796; x=1794925596;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zjUDzAbuSCVp+N1G8kOvDEnUDUbo/KmksWEVSPhFBpg=;
        b=IIr9jb/2fvIs3zaDkwB3Aj3Ht0jvV4Fj5e6nNOnIHTuR9+19xOJUoj3TNWeyuWMHKR
         6qm37z1CXUHXt3wxfYNzazR8/DHK8ZZ4kKN1pE7iHIaZ6G86aRvNiK7tibpsr6bI5GYC
         VOqH3hlAFul4m0SVRZwyL6WnbiQTD0CYf442IJH3lRbdoWiWV5z/cjKxLIAbzu5Sp8/g
         SJ2dL/tcnvu2kh434XfYRlRVZVTTsplonqBlwaDiYydXe+y+WcSB1LnM88/1mi95rqkr
         30TKVA1I3tI0SgwD363T9ysZ5X1KFY72mvoltGrMVp/OKVKMeCmL78ECCWIDYwLOjDCi
         Zx0Q==
X-Forwarded-Encrypted: i=1; AL+hErF4Wv3Mz5J5Jk2CxvnWuxMbyJLjG5FGZepW3ssiD/Zb5SoqJooc+bkldbUqxTr4tj9JjtWf2bImmZ0=@lists.xenproject.org
X-Gm-Message-State: APuU4Z9iwVAkS2hEkezx4VpQ70K+4TfqsFNcWrd+0pbjo7fMuw+8d/o0
	JCOrkyW8tcvc5NAAYd1Bq5XPeluNg3sHtejX7DlYkjX9FW9wECl7ig424zk3IFWLjA==
X-Gm-Gg: AYBFou1Q+Zd0O2Hi0/pSFKg4wKUoazM6JnFvk3+VB+ZQKgfROn36au0nfb05e9w++PH
	RH9DbsgJ04IFfrHHHx1VQrlV50dfc6W99485H8LA9mORDXclv0zFrY8smbMXDOMricxXn7W1Z1e
	PqzjMsez34VHEXMdjWlK/D+ETQZIeIzhLR8DF4z1v+cqUEiP1kToOvRZl013e36YvmVesQH5hxK
	M1clCKrdEammgPHdrGja3sNOO1AAzdpd/srPlI8bUzWt+dGLEwJAKeF/SVi48PA9uWzfDp0cnZ4
	xd2qmfssY0QjMCNJ57PxC6RUyfbpLuo7L74nG4dEQB4zkLV/D6utxdX8AtnBVaN7aCcbDzpSZX5
	fTzFi/FbTKSENHVhJT84ZCQpCQP7tXO8zXH8o16z5VBacvKlUFzRAf+Lwr4lzCgsxeqYj144mHl
	MVm7CjV3+jAyC309IR3sLeGqSaF8JjKwCXqQl0qb5W4BqXMWMrmKfktxhjzgNyikjw8T4MLM96k
	Ewbal0pWfd7+fGpUQI2BB5k2BzqMvpIPzmi8SReA1ssn0MkucOax5Gt3AlLC6lts4md+dRBlTOt
	IzfbMBkEgoHL8pXHLMMZWtAoal5RXdYI9kYFZ1Q7LVMR+Wri70IzwtTJrKbjgPDYPBMH9n3LrvO
	KjzE+jVREQnTn9EB9KPm4CM9p/JsV7ZBCaM3EIw==
X-Received: by 2002:a05:6000:420d:b0:491:fd47:5e02 with SMTP id ffacd0b85a97d-4982eb0b6a7mr5557648f8f.22.1794320796297;
        Tue, 10 Nov 2026 06:26:36 -0800 (PST)
Message-ID: <9fe54c0d-a830-4543-9d81-ee546308e343@suse.com>
Date: Tue, 10 Nov 2026 15:26:35 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/bitops: Improve code generation for __scanbit()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Teddy Astie <teddy.astie@vates.tech>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20261106171204.2783260-1-andrew.cooper3@citrix.com>
 <827e9a54-cfba-4d18-b6de-fbbb7ccd7d5c@suse.com>
 <a4530648-097e-4867-848c-12c8d5ed4c43@citrix.com>
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
In-Reply-To: <a4530648-097e-4867-848c-12c8d5ed4c43@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-33051d/1794320797-6E4CF4E9-E359FD20/10/78276251493
X-purgate-type: spam
X-purgate-size: 3912
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 10.11.2026 13:14, Andrew Cooper wrote:
> On 09/11/2026 8:46 am, Jan Beulich wrote:
>> On 06.11.2026 18:12, Andrew Cooper wrote:
>>> There's no need for an alternative.  Use the same technique as arch_ffs() by
>>> pre-loading the destination register using the caller chosen "zero case"
>>> instead of -1.
>>>
>>> No functional change.
>>>
>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>> ---
>>> CC: Jan Beulich <jbeulich@suse.com>
>>> CC: Roger Pau Monné <roger@xenproject.org>
>>> CC: Teddy Astie <teddy.astie@vates.tech>
>>>
>>> Slightly RFC.  I don't particualrly like forward-declaring ffsl(), but I don't
>>> see another option while maintaining a non-tangled common/arch header split.
>> Forward-declaring isn't a problem by itself, just that imo that wants putting
>> in xen/bitops.h, not ...
>>
>>> --- a/xen/arch/x86/include/asm/bitops.h
>>> +++ b/xen/arch/x86/include/asm/bitops.h
>>> @@ -320,18 +320,35 @@ extern unsigned int __find_first_zero_bit(
>>>  extern unsigned int __find_next_zero_bit(
>>>      const unsigned long *addr, unsigned int size, unsigned int offset);
>>>  
>>> +static attr_const unsigned int ffsl(unsigned long x);
>> ... here. asm/bitops.h already isn't included at the very top of the file, so
>> putting the decl there looks clean enough to me.
>>
>> (Another alternative would be to see about doing away with __scanbit().)
> 
> I'd like to do away with it.  There are only 4 users:
> 
> xen.git/xen$ git grep __scanbit
> arch/x86/bitops.c:38:        set = __scanbit(*p >> bit, BITS_PER_LONG);
> arch/x86/bitops.c:88:        set = __scanbit(~*p >> bit, BITS_PER_LONG);
> arch/x86/include/asm/bitops.h:329:static always_inline unsigned int __scanbit(unsigned long val, unsigned int max)
> arch/x86/include/asm/bitops.h:378:        r__ = o__ + __scanbit(*a__ >> o__, s__);                            \
> arch/x86/include/asm/bitops.h:410:        r__ = o__ + __scanbit(~*a__ >> o__, s__);                           \
> 
> 
> i.e. the find_next{_zero,}bit() infrastructure.
> 
> For the two real functions, we could convert along the following lines:
> 
> diff --git a/xen/arch/x86/bitops.c b/xen/arch/x86/bitops.c
> index 22cfb6d8ec3a..009146df92b5 100644
> --- a/xen/arch/x86/bitops.c
> +++ b/xen/arch/x86/bitops.c
> @@ -35,9 +35,11 @@ unsigned int __find_next_bit(
>      if ( bit != 0 )
>      {
>          /* Look for a bit in the first word. */
> -        set = __scanbit(*p >> bit, BITS_PER_LONG);
> -        if ( set < BITS_PER_LONG )
> -            return (offset + set);
> +        set = ffsl(*p >> bit);
> +
> +        if ( set > 0 )
> +            return (offset + set - 1);
> +
>          offset += BITS_PER_LONG - bit;
>          p++;
>      }
> 
> except it has the disadvantage of turning a TZCNT into a BSR when in
> this path the "64 in the zero case" is fine.  That said, it's only older
> AMD CPUs where TZCNT vs BSR matters perf-wise, and this is a horrible
> path anyway because of the hand-rolled asm in __find_first_bit() so I'm
> most likely worrying over nothing.
> 
> What I don't see is an easy way to make the same transformation in the
> find_next{_zero,}_bit() macros.  This accounts for all the other
> invocations when expanded, which are quite a lot including behind
> bitmap_for_each().
> 
> 
> Alternatively, we could have a dedicated tzcnt(), and lean on the fact
> that "64 in the zero case" is probably fine in find_next{_zero,}_bit()
> even for the s__ < BITS_PER_LONG case.

I think this isn't just "probably", as istr us going through all
find_next{_zero,}_bit() (and derivatives) to check that they don't rely
on getting back the exact upper bound when no bit is set. IOW yes, I
think this might be a yet better way to go.

Jan

