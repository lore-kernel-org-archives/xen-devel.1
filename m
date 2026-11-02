Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 159FA606A326
	for <xen-devel@archiver.kernel.org>; Mon,  2 Nov 2026 14:19:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=W9H09SwD
Received: from list by lists.xenproject.org with outflank-mailman.1468385.1677511 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xNssr-0008Bm-T2; Mon, 02 Nov 2026 14:19:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1468385.1677511; Mon, 02 Nov 2026 14:19:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xNssr-0008Bf-P5; Mon, 02 Nov 2026 14:19:37 +0000
Received: by outflank-mailman (input) for mailman id 1468385;
 Mon, 02 Nov 2026 14:19:36 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xNssq-0008BR-Gm
 for xen-devel@lists.xenproject.org; Mon, 02 Nov 2026 14:19:36 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xNssp-003ZD0-JU
 for xen-devel@lists.xenproject.org; Mon, 02 Nov 2026 15:19:35 +0100
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ae89beb-e002-0a2a0a5209dd-0a2a4508db30-16
 for <xen-devel@lists.xenproject.org>; Mon, 02 Nov 2026 15:19:35 +0100
Received: from [209.85.221.48] (helo=mail-wr1-f48.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ae89bf3-f659-0a2a45080019-d155dd30dcfd-3
 for <xen-devel@lists.xenproject.org>; Mon, 02 Nov 2026 15:19:31 +0100
Received: by mail-wr1-f48.google.com with SMTP id
 ffacd0b85a97d-48c5358fc28so2479723f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 02 Nov 2026 06:19:31 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e71b78c10sm19846924f8f.25.2026.11.02.06.19.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Nov 2026 06:19:30 -0800 (PST)
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
        d=suse.com; s=google; t=1793629171; x=1794233971; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kiNNr9oiTygfKlJvv6hc+93yAbfKtk5WborMVZWJ49Y=;
        b=W9H09SwD5bEx3lwlq6952NLjk36TSJAbtbRno8+K8WCxz7R6XnYDCMi4PBnfHFATaI
         24CAHFWwEkixOL7qO2WPMi8MN1M7OOwlbkzEuO9kB7nQEBQeG1aeGD2bMDPlttaRI3R+
         SH862UAou2LwkDSrrNXa+CvvG7i1v3BZKPBsLnlcjCDPZ60zruWeegnXQhkJDbsWgN58
         RMgPCCxhk/Xz4V00rTZke39Vl++r6xex1NkjRODlXWTyf0oZfvg5W7BAxlg6WO8dwNd1
         FxbrbS3CHlVaUyiK2Z0Z050EnAXnTqRh518sUtaYYsd4SXCpATwRFAOuB3TttilWlWhB
         Ehkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793629171; x=1794233971;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kiNNr9oiTygfKlJvv6hc+93yAbfKtk5WborMVZWJ49Y=;
        b=2uFxiOM3FfSJdLT9gHI9RTxCgB3F/qrgFR2/7MHbi1TJGFrsejVH8TDYo8yOnvPKaC
         RlQoupfFw/L8Xd99NW6X/1uINOaZ77w/W+nXcqVV4Z99h7VvKjD+0f1lyx2MnehJmpwS
         kIqf3IGntAwx6iTm1EO2ywBRA5u4GJVGYeQeQBA0qt4xfOlerrkXiXuSfItzJZztt2Nx
         krXvPVK1S7gEviJw5a1qFhNEYcod57G+qknEokWuHQDzMIlYxXY7ur4oEL+E+RcWPVT3
         RcfEAVCw93KUt8E2cdQ/nLU9iOAoiqiWilnnHR4CWalJUoSJ+tifCYrRZanlrQwtW9Rx
         y4gA==
X-Forwarded-Encrypted: i=1; AKwUvBwKuTl4D3pAYk1x2N1DwQOx2zS/mdYP1CMZWVs7J4YRPtwnXdNTnu9UyArpZ9cEVVT2L0EJKAVBMh8=@lists.xenproject.org
X-Gm-Message-State: APuU4Z+gENAp6JcnvMaXuOho+yl59mx8r+Vz4NRIigoS5QP8EQV2SehM
	Wfs9rEd848WzcGMituK+iOHGRy9uSJKM/HQQkfgeN5i2s+lrY6AtQZBXoLS5Lg7wlQ==
X-Gm-Gg: AYBFou3dKsQI3tHv8iQIbayGJBG44AWwb32VtpW4zE8Yr750fe8OFDmfUbUewEW0EXW
	7UUaYxwc/wyz7LdldXPgC1Zd2cC4FMtH76tQfduDRUHo4eIRQ1GsUj0Oz4sckBV2bzU618kdbKR
	wamdYIjPyaDihws4ug7tnk7tLy+vmYYV5IcYKodQxdgEIVG68gQH7a+8IeZU7+jJqtj3rO8xxPW
	isGUAxtuy9AzG+aydZ7G1ETjz8ibVVimEEuzwipPJ0I6+E/TWDLgRxVCxKtIkqSeqTsJUPzt0EW
	UyHMK4h+h7KWEqZxDZy2HAp52odSZwk17hNFvpHhJ0j7uB3xc2s8F632T7g9d7EVA9S4hdKTJCz
	qnEgwLR2/eCYNPLIibjYs+y/ts2IRyuGwm5X5dSWLgc8c/5wArIuEnz9FpARVT5c+nLmIIA4dYq
	pwPwHYuU7sRfJ+hbJtXO/OdhBICYCoVOqojMSCsipZE7ICIlZsyQ+loWqFRaxp2xHMaIj83Zdu8
	JkKn3Y1BJ0u0/W7dfCOgek85idjN435wTKs3v25d/NTv2QKA9ol8HSd84+RsxPfF6aEqwdTKeG0
	5NjH3gFtEfJ5J9onZzhR1Gxq9Zkadt+bNFevXenB0UW2fezC34VWYGap3EXqV3O+qQYCzWhtghP
	I7bgaNVGH0fpdWOdM
X-Received: by 2002:a05:6000:4a0a:b0:48e:2448:ea23 with SMTP id ffacd0b85a97d-48e6e307864mr23476443f8f.55.1793629170933;
        Mon, 02 Nov 2026 06:19:30 -0800 (PST)
Message-ID: <ba87ac3b-8381-4876-ae89-6ac555b55b75@suse.com>
Date: Mon, 2 Nov 2026 15:19:29 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 02/45] x86/mm: refuse to promote an L4 while the domain
 has no per-domain L3
To: George Dunlap <gwd@xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
References: <20261028-asi-hvm-v5-0-13b908e0df0b@xenproject.org>
 <20261028-asi-hvm-v5-2-13b908e0df0b@xenproject.org>
 <f29b4d27-650e-4463-a0bb-785ce507c644@suse.com>
 <CAFLBxZaXHuaMuHTPKgx-vw_AH8iX+jvh2t2BGsGYFR2z5hsPiQ@mail.gmail.com>
 <eb3c6304-f8af-4b93-be20-3db914e1ac6a@suse.com>
 <CAFLBxZZ-oorO7vXHONK0b7Yq_ZwHXEpBh8jphb-GaU9C8rT11Q@mail.gmail.com>
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
In-Reply-To: <CAFLBxZZ-oorO7vXHONK0b7Yq_ZwHXEpBh8jphb-GaU9C8rT11Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c1860d/1793629171-D514E87B-C6C35BDA/10/78276251493
X-purgate-type: spam
X-purgate-size: 2426
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 02.11.2026 15:02, George Dunlap wrote:
> On Mon, Nov 2, 2026 at 9:50 AM Jan Beulich <jbeulich@suse.com> wrote:
>>
>> On 30.10.2026 18:11, George Dunlap wrote:
>>> On Thu, Oct 29, 2026 at 7:47 AM Jan Beulich <jbeulich@suse.com> wrote:
>>>> Independent of that, how about pulling hvm_domain_initialise()'s
>>>> create_perdomain_mapping() up into arch_domain_create() instead of the
>>>> code additions you do?
>>>
>>> So, let's see if we can solve it "properly".  Constraints:
>>>
>>> - Eventually, not all domains will have a domain-wide L3; some will
>>> only have per-vCPU L3s.
>>>
>>> - init_xen_l4_slots needs a domain always, but only needs a vcpu to
>>> get the L3 of vcpu_pt domains.
>>>
>>> - PV vcpu_pt domains don't need an L3 installed after
>>> init_xen_l4_slots; they need to run on a clone of the L4 anyway.
>>>
>>> So by the end of the series, we could arrange it like this:
>>>
>>> non-vcpu_pt domains always allocate d->arch.l3_perdomain in
>>> arch_domain_create.  vcpu_pt domains always allocate
>>> v->arch.l3_perdomain in arch_vcpu_create.
>>>
>>> Have __init_xen_l4_slots() take a domain and an L3; if the L3 is NULL,
>>> leave the perdomain slot empty.
>>>
>>> Have init_xen_l4_slots() take a vcpu.  BUG_ON(is_hvm_vcpu(v) &&
>>> v->arch.asi.vcpu_pt && !v->arch.l3_perdomain), then pass the
>>> appropriate l3 into __init_xen_l4_slots().
>>>
>>> Have init_xen_l4_slots_pv() take a domain, and always pass the domain
>>> and d->arch.l3_perdomain to __init_xen_l4_slots.  This will be NULL
>>> for PV vcpu_pt domains, but that's fine.
>>>
>>> Then promote_l4_table() calls init_xen_l4_slots_pv() with a domain,
>>> and loses both the checks at the top.
>>>
>>> There are corner cases to sort out, like how idle domains get an L3;
>>> but overall I think this makes everything more robust.
>>>
>>> Thoughts?
>>
>> Sounds plausible to me.
> 
> This has beeen done.  It required some refactoring of later patches.
> These have all been tested and skimmed, but haven't been over with a
> fine-tooth comb again, so there's a risk of LLM quirks.  Do you mind
> if I post what I have now, so people can look at it this week if the
> chance affords?  Otherwise I won't be able to post it until next week
> at the earliest.

Sure, feel free to go ahead. It's a long series, but still better to
have the up-to-date version on list / under review.

Jan

