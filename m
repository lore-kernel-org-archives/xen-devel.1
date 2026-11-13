Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84EA8606A321
	for <xen-devel@archiver.kernel.org>; Fri, 13 Nov 2026 07:49:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=HFtjqymG
Received: from list by lists.xenproject.org with outflank-mailman.1486789.1689256 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRm1n-0001Y6-JB; Fri, 13 Nov 2026 07:48:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1486789.1689256; Fri, 13 Nov 2026 07:48:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRm1n-0001Xz-Gg; Fri, 13 Nov 2026 07:48:55 +0000
Received: by outflank-mailman (input) for mailman id 1486789;
 Fri, 13 Nov 2026 07:48:53 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xRm1l-0001Xt-MI
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2026 07:48:53 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xRm1k-009EmM-Rj
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2026 08:48:52 +0100
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af6c0c5-e002-0a2a0a5209dd-0a2a4509dfb0-44
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 08:48:52 +0100
Received: from [209.85.128.49] (helo=mail-wm1-f49.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af6c0e4-be1a-0a2a45090019-d1558031c8b7-3
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 08:48:52 +0100
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-4ac95761c85so3112715e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 12 Nov 2026 23:48:52 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-49c6020bb0fsm3400092f8f.34.2026.11.12.23.48.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Nov 2026 23:48:51 -0800 (PST)
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
        d=suse.com; s=google; t=1794556132; x=1795160932; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=88txdaVrMY2sC0gmKka8cTLYqSggggNMeblremqdObU=;
        b=HFtjqymGPYWC9dFD2L1z+kvaeWE5UHCgDBtcuCxfe6ZlYYr0EpPzriowrAtGGDavw2
         d7it3SN3YiQdLnzpgIwKAjWeMqG4DbrAmIDMO93iCdW8P/rlQlDTABZi0QCWCrzpnOgl
         oaLpc9xFySa6aEXo6+ERDlNFeKi4HnmmgrHYYVgPB/xdIFFF9kLfz6Mdt61Kl1zBQcHm
         Ag3w+DQ6AO/6rt1+4A6EV6/+aAd9qQRVc4mZiUha7Dk3teP1urzrbshXF72lAR6mvf62
         xWj/5JzC1D+oSx+MxrKyw6AcwBQJoM7itQYKLq1M7g6iA+DX9R56P3fMLbstA9kEJ8LC
         YQwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794556132; x=1795160932;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=88txdaVrMY2sC0gmKka8cTLYqSggggNMeblremqdObU=;
        b=0+liZSL8eq5gCgss++8OaV7oHSKYpS2XqyjqF72X7s5st6fS8NNDM3yHxRJIc43Xj0
         e4HF3q6zjWzicb7HzWZwf2QFVzTH836Xm7BeAxqJlvvytF5pG6FqqeJQ/JbaYueO84x1
         oyKcWKSGdGMud97CNwJegyz5O24ZNinFLSP22043TLKxv/xJBqzT4y3bidN6ZkgfdrMg
         1U0FOLUV0bvi0I96YLGDtwGbblJh4PmOxFo/Pbw44KrJSYcNC0tS9TOC17Oa+TOPRDXq
         X0A+Fzku5v6N0o6rynD3dKsQYuL8VJ2kn/zBrVKWWA/Re/yRpYEsyZIco6at8TtLJPGH
         IrYw==
X-Forwarded-Encrypted: i=1; AL+hErG1pUTIjUZkVUIxM11R48QcvDcfGix+qmuN6sg+Sg9I+UZvzl/j8wmNJxaGUDfBJWDjDFT0CffXmfA=@lists.xenproject.org
X-Gm-Message-State: APuU4Z8yijctrKMKxcC+XkAoOmg4COduRwewSWmf6jpGG3pJ9mB0vB96
	nHMpCZUQfJ5zS8BXTDKCt3I9RXrbkaz0cun/klPiGksy3Q016TEPWc4GPQyf+AOWLA==
X-Gm-Gg: AYBFou0r1hi2sAP8FWtlKK06uKXWJWtCTMdoFcsUGYA5Tl0f5xGB2XDP7GzX8JfgGuA
	bcv5cvJxK/DeP4YpsW3hHeuSupRh5/uOTpEy9B8Q8Slmg24QRCEBYn3dJYhf2esGc3k/zr3EtGB
	wNqzSFrL/xw/WsxqgH2QC4B8D0Kp7P8q1yGTNPolu/k21IsMAdXsQbwrq2jsdAKq0KdwPtKA8az
	juHvv/vcuoSkLywhahW0g9v/LcTy37zyavc3kT0n0Xo117UM38UUKxFuWY+hGK1F9M0UoL9UrzW
	/xt0Zho4lduL+d4PteRR0O/38GFvaWW5broE/FGMNEI3A2BBocK/D1rKmNEdGW1v+I/zn5w5A1N
	BktCGwLh1QJgE87waoICpgVC7wOS+Aw1N/gafEAABqBrahOx69C5SEczD6/VlInnpxtutadIws6
	HXVHL6umyLRbtzCh/1BEA9ctnLHqbNF1CP+BqkW/6Dwe18NqeGZMBA1zAxZ7MbFg9fMyZuSNnYW
	Z+EKbLRBLXxIYLl6LuM+6RIZ/C7EXcnuKw5NTg42H1mJkh9ExgQ47jgRYNy9542s0K/ch0ZTdig
	99CJlz86dNw/V9c82nw7rUImdXhi4ImXDmfR6GC2TDcoDudEtC1dkct87lgzXgLsD5RPtJ12mg6
	D422Meus8iw9mHkqwqw==
X-Received: by 2002:a05:600d:82e8:b0:4b3:6900:280c with SMTP id 5b1f17b1804b1-4bb55a53341mr33762295e9.19.1794556132104;
        Thu, 12 Nov 2026 23:48:52 -0800 (PST)
Message-ID: <59390ed7-102b-4cac-990d-90addd7c7376@suse.com>
Date: Fri, 13 Nov 2026 08:48:51 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/6] x86: extend do_mmu_update() to support returning
 the old PTE value
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: roger@xenproject.org, teddy.astie@vates.tech,
 xen-devel@lists.xenproject.org, Kevin Lampis <kevin.lampis@citrix.com>
References: <20261112100005.324440-1-kevin.lampis@citrix.com>
 <20261112100005.324440-5-kevin.lampis@citrix.com>
 <e2f8d1c2-fb3d-4232-ab64-ee53d2a4d86e@suse.com>
 <31b661aa-67b6-4340-873e-f3f1ece132d5@citrix.com>
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
In-Reply-To: <31b661aa-67b6-4340-873e-f3f1ece132d5@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-bad1c0/1794556132-FCC15034-DF056EB1/10/78276251493
X-purgate-type: spam
X-purgate-size: 2633
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 12.11.2026 17:57, Andrew Cooper wrote:
> On 12/11/2026 2:06 pm, Jan Beulich wrote:
>> On 12.11.2026 11:00, Kevin Lampis wrote:
>>> --- a/xen/arch/x86/mm.c
>>> +++ b/xen/arch/x86/mm.c
>>> @@ -4123,6 +4123,7 @@ long do_mmu_update(
>>>          case MMU_NORMAL_PT_UPDATE:
>>>          case MMU_PT_UPDATE_PRESERVE_AD:
>>>          case MMU_PT_UPDATE_NO_TRANSLATE:
>>> +        case MMU_PT_UPDATE_SWAP:
>>>          {
>>>              p2m_type_t p2mt;
>>>  
>>> @@ -4184,37 +4185,79 @@ long do_mmu_update(
>>>                       update_flags = PTE_UPDATE_PRESERVE_AD;
>>>                  else if ( cmd == MMU_PT_UPDATE_NO_TRANSLATE )
>>>                       update_flags = PTE_UPDATE_NO_TRANSLATE;
>>> +                else if ( cmd == MMU_PT_UPDATE_SWAP )
>>> +                     update_flags = PTE_UPDATE_SWAP;
>>>  
>>>                  switch ( page->u.inuse.type_info & PGT_type_mask )
>>>                  {
>>>                  case PGT_l1_page_table:
>>> +                {
>>> +                    l1_pgentry_t ol1e = {};
>>>                      rc = mod_l1_entry(va, l1e_from_intpte(req.val), mfn,
>>> -                                      update_flags, v, pg_owner, NULL);
>>> -                    break;
>>> +                                      update_flags, v, pg_owner, &ol1e);
>>>  
>>> +                    if ( !rc && cmd == MMU_PT_UPDATE_SWAP )
>>> +                    {
>>> +                        req.val = ol1e.l1;
>> If you didn't open-code l1e_get_intpte() here, it would become more obvious
>> that the INTPTE -> L<n>E done in mod_l<n>_entry() is simply being reversed
>> here. If ol1e was of type intpte_t, doing the update in update_intpte() (and
>> not UPDATE_ENTRY()) would become feasible. Since intpte_t is a mere alias of
>> uint64_t, passing &req.val into mod_l<n>_entry() directly would then also
>> become possible. Less redundancy would be the result.
> 
> Perhaps, but then it would be odd to have mod_l1_entry() require nl1e in
> a typesafe way while passing back ol1e as type unsafe.

If the sole purpose of those parameters is to obtain a type-unsafe intpte_t
(for use here), I'm not convinced this oddity would be overly problematic.

> And there's still the problem of reading ol1e.  We could change the
> indirection of ol?e, but that's invasive both at the source and binary
> level.

I said "passing &req.val" though - no change in indirection.

>  While capable of being inlined, mod_l?_entry() are not due to
> their size.

Yes for mod_l1_entry(), but not for the other three afaics (debug build
with gcc16).

Jan

