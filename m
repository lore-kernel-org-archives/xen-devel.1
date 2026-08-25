Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00443C61DB9
	for <xen-devel@archiver.kernel.org>; Tue, 25 Aug 2026 14:43:23 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1399293.1635448 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wysMk-0006fV-O3; Tue, 25 Aug 2026 14:43:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1399293.1635448; Tue, 25 Aug 2026 14:43:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wysMk-0006fO-LD; Tue, 25 Aug 2026 14:43:06 +0000
Received: by outflank-mailman (input) for mailman id 1399293;
 Tue, 25 Aug 2026 14:43:05 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wysMi-0006f8-Vj
 for xen-devel@lists.xenproject.org; Tue, 25 Aug 2026 14:43:05 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wysMi-000tev-Cc
 for xen-devel@lists.xenproject.org; Tue, 25 Aug 2026 16:43:04 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a8da9e9-8faa-0a2a0a5109dd-0a2a4501956c-18
 for <xen-devel@lists.xenproject.org>; Tue, 25 Aug 2026 16:43:04 +0200
Received: from [209.85.218.43] (helo=mail-ej1-f43.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a8da9f8-5984-0a2a45010019-d155da2bc58b-3
 for <xen-devel@lists.xenproject.org>; Tue, 25 Aug 2026 16:43:04 +0200
Received: by mail-ej1-f43.google.com with SMTP id
 a640c23a62f3a-c2074710751so884685866b.1
 for <xen-devel@lists.xenproject.org>; Tue, 25 Aug 2026 07:43:04 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c2496297189sm1755855566b.22.2026.08.25.07.43.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Aug 2026 07:43:01 -0700 (PDT)
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
        d=suse.com; s=google; t=1787668984; x=1788273784; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w9ohPoMvB1GBbUcpCPI8mlfQmj/aqTcFkYWbjjT18W8=;
        b=FUNxraqyS2uNS31ibQaUNmGr32JlG/BJ0z1wxnwXiYuauGzdPuAXL2/daZvVi8ED5Z
         BfoxuZdDdXk3HTdMjxRoRNgkUdyN5EU3582xvtRlXb7l35Jte6edd/euNK5thrlS/WH6
         aC80y5B6+p0XSWRx7KeBAsG6YMDyB8NDR4XqSBu7Z6+ghKgq6fXZ9z6bOPN+42lW9MRy
         HPfg1jaoTUV3ceGEZZGlPRO7Lf1ZvYKwXzBu74j2mJJR8anGRBSZ7x1KkD4SOQQ4wVeK
         0VOGQ/dN2yuQzUvr2fp6g525j6xNNDGpNTnJ9fD76DNDHs7cAZPht570EDX3U0Juc1xl
         Orxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787668984; x=1788273784;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w9ohPoMvB1GBbUcpCPI8mlfQmj/aqTcFkYWbjjT18W8=;
        b=iNhlOKMsqTZQkHv8D6MXVuI4Tvpi9bz3bPSIehov3LN03yZnlaDgn823099Sxvp1Pi
         bu0dT/UgQA6bOdsMKbukTFr5RLl2UIFK7YqbW9qF6wOnfK3TnlGNU72XI5r7x+coQG9U
         ba+qAOaLrMNY9L4XVKtfgFll+FXKWvBPcaJMPrEZ++Qge4AEO97l2HuF1MMLFhRPpDWX
         tN/ToiX0SPpD5hY07X0T7ToDUkSWuwLfrIndaIWd9aCMajc0zhtGfOOJ0VbxVsbKvmdm
         wMKaigd9cBTWt7VsYxADNYjJ6chtoxR4ek6ZbVHzx8RotOO8dTzch+t8qZ7jXPYxeUnT
         nseg==
X-Forwarded-Encrypted: i=1; AHgh+RptEVSWbzRUcap8+D50XqLsd7wZvSI7uGIRAAvJc3U8U2khvvp7/4uy5bL4XKUnxy2qKwp1P9SOtPk=@lists.xenproject.org
X-Gm-Message-State: AFuF++lcSpP4uh4dhmr9MdujeUhOBgY7TVcl058YQy5B8rGNu5jOCyZQ
	1QlXPVcVhnVLz7aoBpvjjB056KM2q/3GfODUIrJXgPMOsaxjK5BIdQfPvIoY/ww3uw==
X-Gm-Gg: AR+sD10rDBv6ggwZYSRrJExPxK5hwMwLvi1+eIvG2v2OYUzEvkNmy9BnPqh8wSl5ANq
	mPvtzI7E7ZelLJayZrRvklbNGrlMMNm5rJohkSzagYijLBPSxrsfhbggyB9LC8XSeU5QIh78RgU
	TyUymsfLwUCoselaVZXQDkT+wbgQUjbSQck2VUvXC+gjE2sbGhR4UqAbySp/F9JYkb3QptLK4vj
	ucI8kegfprqxWyxzKDOE8Ey5X0XOnh75utdK3ENFwvC/miA2Y0/lBALgfSzbkxIYqRlEElHlvJp
	FeiUWVqKQFQ+5+sT7RInTk7v+WBco2m/Dq8l76Vadh+GUMYHPG/KIPfxhAo9LHQUyUdljkrhh3d
	ox7Kw7fI4/USGW9BW95pf8wGwCsvHhkBqNBBqgp1HiBw+DK16YYdWGxuXMZA/EOBboa5xlYEPT6
	irqPd74zufX7FB4tpfNkackWfP+wW9HokhJjxQCyUscBC3IyZ6gR825eXvrWkxdw5KbJSUVSkFo
	wrW7zYw+0MnnnHwgPe0ZNO12ST522mmlNbOd7fiOuT1ftMYlbQy
X-Received: by 2002:a17:907:e009:20b0:c24:e0dc:8b66 with SMTP id a640c23a62f3a-c24e0dcd3d7mr746836466b.6.1787668983779;
        Tue, 25 Aug 2026 07:43:03 -0700 (PDT)
Message-ID: <6dff46c2-443f-4b9f-bdd9-de3017becca9@suse.com>
Date: Tue, 25 Aug 2026 16:43:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/3] ioreq: switch ioreq page allocation to vmap
To: Julian Vetter <julian.vetter@vates.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20260420093820.825969-1-julian.vetter@vates.tech>
 <20260420093820.825969-2-julian.vetter@vates.tech>
 <35a08d22-1e95-4e02-a7e9-7f392ef11722@suse.com>
 <1787667597.8631fc262581453bbf619ec5b2062170.1a0394ac7f2000c4f3@vates.tech>
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
In-Reply-To: <1787667597.8631fc262581453bbf619ec5b2062170.1a0394ac7f2000c4f3@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d62444/1787668984-BCB45757-2783207F/0/0
X-purgate-type: clean
X-purgate-size: 2812

On 25.08.2026 16:19, Julian Vetter wrote:
> On 8/18/26 3:06 PM, Jan Beulich wrote:
>> On 20.04.2026 11:38, Julian Vetter wrote:
>>> @@ -333,7 +335,8 @@ bool is_ioreq_server_page(struct domain *d, const struct page_info *page)
>>>   
>>>       FOR_EACH_IOREQ_SERVER(d, id, s)
>>>       {
>>> -        if ( (s->ioreq.page == page) || (s->bufioreq.page == page) )
>>> +        if ( (s->ioreq.va && vmap_to_page(s->ioreq.va) == page) ||
>>> +             (s->bufioreq.va && vmap_to_page(s->bufioreq.va) == page) )
>>>           {
>>>               found = true;
>>>               break;
>>
>> You mention in the description that some extra overhead is introduced. The
>> (generally) two page walks done here are particularly concerning. Since we
>> have a valid struct page_info * available here, I wonder if we shouldn't
>> aid this lookup by recording the VA in one of struct page_info's fields.
>> Afaics vmap() doesn't use any of the fields, so it should be relatively
>> easy to determine a field to use for this purpose. The more involved part
>> would then be to make sure the field (in other struct page_info instances)
>> is also properly different from any VA vmap() may return.
> 
> Hello Jan,
> 
> Thank you again for your feedback! I will wait then for Anthony's 
> decision regarding whether the multi-page ioreq support and the ioreq_t 
> growth should be combined into a single effort, before I proceed further 
> with a v7.
> 
> I just wanted to clarify one thing regarding the overhead I mentioned in 
> the first patch's commit message ("this change has a small overhead in 
> the common case"). Here, I was referring to vmap()/vunmap() replacing 
> map_domain_page_global(). Where map_domain_page_global() has a directmap 
> fast path. I didn't mean the overhead of the added vmap_to_page(). I 
> should maybe clarify this better in my next iteration's commit message.
> 
> On your suggestion to cache the VA in struct page_info to speed up the 
> vmap_to_page() lookups in is_ioreq_server_page(): I looked through the 
> tree, and that function currently has only one caller 
> sh_remove_all_mappings() (in xen/arch/x86/mm/shadow/common.c) and is 
> only reached in a failure case. Given that, and given how widely shared 
> and size-critical struct page_info is, I'm wondering whether it's really 
> worth touching it for the gain of not having to do the 2 lookups. What 
> do you think?

Hmm, indeed. Yet how would we prevent new uses from being hit? At least
a comment may want adding somewhere (where it's not too easy to overlook).

That said, why the mention of "size-critical" when I said "determine a
field", not "add a field"? (Really in different context I've suggested
the same as a possibility to George, for his ASI work.)

Jan

