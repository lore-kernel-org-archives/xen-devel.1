Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84DFE606A31C
	for <xen-devel@archiver.kernel.org>; Thu, 12 Nov 2026 14:10:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=OOtV/xyT
Received: from list by lists.xenproject.org with outflank-mailman.1485899.1688936 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRVVY-0006vS-1R; Thu, 12 Nov 2026 14:10:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1485899.1688936; Thu, 12 Nov 2026 14:10:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRVVX-0006vL-UR; Thu, 12 Nov 2026 14:10:31 +0000
Received: by outflank-mailman (input) for mailman id 1485899;
 Thu, 12 Nov 2026 14:10:30 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xRVVW-0006vF-N7
 for xen-devel@lists.xenproject.org; Thu, 12 Nov 2026 14:10:30 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xRVVW-007Puv-3V
 for xen-devel@lists.xenproject.org; Thu, 12 Nov 2026 15:10:30 +0100
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af5c8ce-8faa-0a2a0a5109dd-0a2a45019712-12
 for <xen-devel@lists.xenproject.org>; Thu, 12 Nov 2026 15:10:29 +0100
Received: from [209.85.128.51] (helo=mail-wm1-f51.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af5c8d4-5984-0a2a45010019-d1558033b0e1-3
 for <xen-devel@lists.xenproject.org>; Thu, 12 Nov 2026 15:10:29 +0100
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-4a35ac4475dso30516465e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 12 Nov 2026 06:10:29 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4ba08ddbe68sm222315795e9.0.2026.11.12.06.10.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Nov 2026 06:10:28 -0800 (PST)
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
        d=suse.com; s=google; t=1794492628; x=1795097428; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r0BdJ6L3J9o/WnmrFkJmyX+LAqZGJWY+1hidMzAaPaE=;
        b=OOtV/xyTOExrbTdA9g4aznJS/9dO9MiK3rpQniY2tu3EGJehc5ZCw0DeflKNacEHva
         BDz1hkPpuyh10dJCXVwGWkNgn23deC9LuGcojlqanFeryrjQsa8BOmdwIPuu7IDSrCFG
         xO6cmxKBqO/GzCgiNDKsRYnGQ4/puX9nJzlfiLTjmNDSnKTv8hRv+bhnfrLujX7TXxLi
         Z/5U8liU3lVdnVYyKyB57BbCRS0HU+NnSVtsk4D0PHtYp8RFtSa+cjKCdb5Ih+ClAvcR
         GkbowziyweokDPI3U8OH1HNPce4G/FllmNiaHTwkNYgYWlJ8oXk9i0+MetZM7GPEiMzR
         g0Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794492628; x=1795097428;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r0BdJ6L3J9o/WnmrFkJmyX+LAqZGJWY+1hidMzAaPaE=;
        b=wSMd3K1DBuWxa8fh/INGYA91T7qWik1b059Jk3GAxx1XhlB06DczpyWW7F4/eybTEd
         L0THq7rLhRh3Mdg858Hu0wFWNLpCoVUjiRjupqZxTD+3d9IXN5mUA1+nCVrgwdUFt7P5
         w8FrLgK+sab9v2hGKhISFkMBByoYXky1f4EtP+zSs7SHxnrVafaoTQaEPIL1LbCkk+nR
         78N051AbmVAFUghjyY3mkkt1oRw16VsVo6SIQ5F3bDzytEwWRv6paG7Il2j2FNEg537S
         yIH+kYmT88G+/Mg6w3n7b8IcGbkJCRetHktf6WJOw23afAyeDoQ9ByUZvi1nE3SNWZYD
         pH6w==
X-Forwarded-Encrypted: i=1; AL+hErGaRZ29vhSxDWM2vUHU8y8oBKcfLXmL9CbisUM/IDc8HJfTp5CfpUTlmbjs/38FBG30gpQlOSmM6W8=@lists.xenproject.org
X-Gm-Message-State: APuU4Z9s1PlOWf5GIdp/CJGwdIFqFRgRKJ+rZ0wSEnwgen/J/C/m4JXf
	V9D9AV1IMXMdpbpLiCUTYloOJhdKs2I0PnqPMv5/UY5utx2zkLwGKJXbRnR7KKunsahk0wJ0XCW
	heaKiLg==
X-Gm-Gg: AYBFou2RH6LL1cbFAPl0GPOxU28Drvw7HBeuqKT1C7vBCsxID3Kq4GwgEdEa+OBOA65
	bjr6lq1XZszCNjmeoA19jIu5TljnfPudDFnNSmk3JIKbWu8A8ao0Jr4qmOB8mlOKQFEfSfGfMSe
	AmsSTcAfxV9qWiyRzro9sc3/EPIV37ORAhnSwTu0BX+Rc9vN1a9yRfQ18JQdWOAbogm5Mnrw7Ru
	LhF3VYtjAtGmAl9sdZM6YT3TVIf7/tLmmd+Y3EC1ftCchKig9Szar6E62qHuSjkAUgqlqOb9PvM
	IZtkuLhShqL58hErlgy9fWxz2ZAnq1NUuGhcxbV+eVPsMEra6A9pB5S125aeV1Ewig1vgQlvwaM
	6T8pEVirMgu0K2TCWoDNz0HMG7fc6UF1p12NvTNrXWQj3DVnEU+FUUfwtpJCnbPvVwfFbHIp+4Q
	Llnsx/X6Tke/zINxiE6aFxwKdtwd3FaN535aZ7miXr/lGD3aOpSdfwL0lkwSlvhoTWbIJ7mLWMr
	l6iBQuwP5oGw4u5hq1hUeW/AhnMyQrx6njLCrvPHkBMv79lht1jtZ5kYADBAOG1WEMGT9n7zjvi
	oRTBMlbYHb/XHKvj8a6OV/G2MSUt2HTwfqijZ5S9/ZwJsJz12Km1mtzDs5Z40sSgEfloX4gXWTu
	Qxguuf0I4AmQgcKNb
X-Received: by 2002:a05:600c:5488:b0:4a2:e0c:2b0a with SMTP id 5b1f17b1804b1-4ba09376ebdmr110202655e9.16.1794492628512;
        Thu, 12 Nov 2026 06:10:28 -0800 (PST)
Message-ID: <d61b44e4-aace-4162-86b9-adc268ecdec2@suse.com>
Date: Thu, 12 Nov 2026 15:10:27 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/6] x86: rearrange how mod_l*_entry() functions call
 UPDATE_ENTRY
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: roger@xenproject.org, teddy.astie@vates.tech,
 Kevin Lampis <kevin.lampis@citrix.com>, xen-devel@lists.xenproject.org
References: <20261112100005.324440-1-kevin.lampis@citrix.com>
 <20261112100005.324440-3-kevin.lampis@citrix.com>
 <a3417b2a-11b1-4075-b4d3-fb8ad6cbe482@citrix.com>
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
In-Reply-To: <a3417b2a-11b1-4075-b4d3-fb8ad6cbe482@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d62444/1794492629-1E27A757-6BEDC542/10/78276251493
X-purgate-type: spam
X-purgate-size: 3892
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 12.11.2026 14:56, Andrew Cooper wrote:
> On 12/11/2026 10:00 am, Kevin Lampis wrote:
>> bloat-o-meter:
>> Function                                     old     new   delta
>> mod_l1_entry                                1186    1113     -73
>> do_mmu_update                               5546    5392    -154
> 
> This was only for the sample I pasted inline.  For this patch it's
> 
> add/remove: 0/0 grow/shrink: 1/5 up/down: 10/-641 (-631)
> Function                                     old     new   delta
> mod_l1_entry.cold                             56      66     +10
> mod_l1_entry                                1891    1885      -6
> mod_l4_entry.cold                             39      31      -8
> do_mmu_update.cold                           122     112     -10
> mod_l4_entry                                 917     760    -157
> do_mmu_update                               5745    5285    -460
> 
> although it's not particularly relevant to live in the commit message. 
> (I use it as a litmus test that the changes are along the expected lines.)
> 
> For the commit message, you probably want "Fold two UPDATE_ENTRY() paths
> together, in preparation for an upcoming change." or so.
> 
>>
>> Signed-off-by: Kevin Lampis <kevin.lampis@citrix.com>
>>
>> ---
>> Changes in v5:
>> - New patch
>> ---
>>  xen/arch/x86/mm.c | 45 +++++++++++++++++++--------------------------
>>  1 file changed, 19 insertions(+), 26 deletions(-)
>>
>> diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
>> index e42cd33c0d09..dc0e0d451c02 100644
>> --- a/xen/arch/x86/mm.c
>> +++ b/xen/arch/x86/mm.c
>> @@ -2197,12 +2197,12 @@ static int mod_l1_entry(l1_pgentry_t *pl1e, l1_pgentry_t nl1e,
>>  {
>>      l1_pgentry_t ol1e = l1e_read(pl1e);
>>      struct domain *pt_dom = pt_vcpu->domain;
>> -    int rc = 0;
>>  
>>      ASSERT(!paging_mode_refcounts(pt_dom));
>>  
>>      if ( l1e_get_flags(nl1e) & _PAGE_PRESENT )
>>      {
>> +        int rc;
>>          struct page_info *page = NULL;
>>          uint32_t disallow = l1_disallow_mask(pt_dom);
>>  
>> @@ -2276,16 +2276,14 @@ static int mod_l1_entry(l1_pgentry_t *pl1e, l1_pgentry_t nl1e,
>>          }
>>          if ( page )
>>              put_page(page);
>> -
>> -        UPDATE_ENTRY(l1, pl1e, ol1e, nl1e, gl1mfn, pt_vcpu, update_flags);
>>      }
>>      else if ( pv_l1tf_check_l1e(pt_dom, nl1e) )
>>          return -ERESTART;
>> -    else
>> -        UPDATE_ENTRY(l1, pl1e, ol1e, nl1e, gl1mfn, pt_vcpu, update_flags);
>> +
>> +    UPDATE_ENTRY(l1, pl1e, ol1e, nl1e, gl1mfn, pt_vcpu, update_flags);
>>  
>>      put_page_from_l1e(ol1e, pt_dom);
>> -    return rc;
>> +    return 0;
>>  }
>>  
>>  
>> @@ -2300,7 +2298,6 @@ static int mod_l2_entry(l2_pgentry_t *pl2e,
>>      struct domain *d = vcpu->domain;
>>      struct page_info *l2pg = mfn_to_page(mfn);
>>      unsigned long type = l2pg->u.inuse.type_info;
>> -    int rc = 0;
>>  
>>      if ( unlikely(!is_guest_l2_slot(d, type, pgentry_ptr_to_slot(pl2e))) )
>>      {
>> @@ -2313,6 +2310,8 @@ static int mod_l2_entry(l2_pgentry_t *pl2e,
>>  
>>      if ( l2e_get_flags(nl2e) & _PAGE_PRESENT )
>>      {
>> +        int rc;
>> +
>>          if ( unlikely(l2e_get_flags(nl2e) & L2_DISALLOW_MASK) )
>>          {
>>              gdprintk(XENLOG_WARNING, "Bad L2 flags %x\n",
>> @@ -2331,17 +2330,15 @@ static int mod_l2_entry(l2_pgentry_t *pl2e,
>>  
>>          if ( unlikely((rc = get_page_from_l2e(nl2e, mfn, d, 0)) < 0) )
>>              return rc;
> 
> Looking further through the call tree, I'm now confident that
> get_page_from_l?e() can't return a positive number.

They can return L{2,4}E_RECURSIVE (i.e. 1).

Jan

