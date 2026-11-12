Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F757606A31C
	for <xen-devel@archiver.kernel.org>; Thu, 12 Nov 2026 14:37:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=ACL53L8e
Received: from list by lists.xenproject.org with outflank-mailman.1485966.1688973 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRVvF-0003H0-Ln; Thu, 12 Nov 2026 14:37:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1485966.1688973; Thu, 12 Nov 2026 14:37:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRVvF-0003Gt-IH; Thu, 12 Nov 2026 14:37:05 +0000
Received: by outflank-mailman (input) for mailman id 1485966;
 Thu, 12 Nov 2026 14:37:04 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xRVvE-0003Gn-Mx
 for xen-devel@lists.xenproject.org; Thu, 12 Nov 2026 14:37:04 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xRVvE-000mQ3-3w
 for xen-devel@lists.xenproject.org; Thu, 12 Nov 2026 15:37:04 +0100
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af5cf07-2eae-0a2a0a5409dd-0a2a4502cd30-26
 for <xen-devel@lists.xenproject.org>; Thu, 12 Nov 2026 15:37:04 +0100
Received: from [209.85.128.51] (helo=mail-wm1-f51.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af5cf0f-6ca4-0a2a45020019-d1558033bc1f-3
 for <xen-devel@lists.xenproject.org>; Thu, 12 Nov 2026 15:37:04 +0100
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-4a5087a5348so38366065e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 12 Nov 2026 06:37:03 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4ba0950394fsm104185115e9.2.2026.11.12.06.37.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Nov 2026 06:37:03 -0800 (PST)
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
        d=suse.com; s=google; t=1794494223; x=1795099023; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=VAnX1Ol9YBg1iGfGjhmhcUONI091r4BZ1NGsR0g3yQg=;
        b=ACL53L8e8YBVrVCOsP37NZbJ/ldeRHhFmE99IGk105aOLDXwTXdCCUElnYzIK5Kr0g
         FCnWS5PdO4hhoPGE1fFM/u/eW/pYUyU1J38FPLZFnyY53xvMlDpkkAr+mr6RE6s3HAB/
         fstNpL5P0y/M4vXYN70vZafIe6W38ZxKa2ZLLT2yWRKZYNWNDrB2+ZnTjxR46yX7gUOF
         D4VMFYPtTz4p5IJNfCmQlGz+XQb61NhtKRX2kw4/BOpWXjDrLXlequ662gTfdeEjjp+a
         Rh2ZyEKB1Bs2vU3ooBgWGM67Lhl0DDWAUGodC7cnHywPzcDU66s9TaGE0RgIVQfp3Vm7
         HV2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794494223; x=1795099023;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=VAnX1Ol9YBg1iGfGjhmhcUONI091r4BZ1NGsR0g3yQg=;
        b=rg6qGxamQXBAfdqg4x+pIClZ1scB9zE/GXX3Y/RZeuV+YnzzZcMISakM+fusFXFv7M
         /hHh1URffg1al2Hxcfhh5Q9k0RSFkdupC5kQpVz8dEXLZ0q+DzCTlEZo8tpRdOHyTnSz
         iewz9n9NO7RoZPcBikoEsoIgYpsrcJD/SrLCFn5cEAAv5AjnTH29le0eZkkc/BpeLdur
         3BDZVq7ydPjoxFyATbmWdrZZNyE8yHaMQ0PDDEBN2jgF+46R7KvdKZaWDkFB6dKiPUq2
         mgAMZbKd4gdZSsDw8Fcr38DjVzMSToHx4zRDpCmkevKISQ+renjmvmZA29MXrJol5AeI
         MnIg==
X-Forwarded-Encrypted: i=1; AL+hErGPituH7Us3VFfB3vKbAPabCYg1UEcXNGTs3tu+1fKKuFIzXRjeoURrDoNwWxdNvfqOJO1JK1KUPFc=@lists.xenproject.org
X-Gm-Message-State: APuU4Z8KI65eOhqTgVn2Nplwt2BatovolYXHnHcWJDMBrKOiUp8apFB7
	Ej44nCNcndk4dcQAXP7yaTrIWv7aZ8uH8Kzzu2KXse8pBEfT5OZ+XYGtE+3xyTfXBQ==
X-Gm-Gg: AYBFou0VeHvbQXq2aC7iJjMgLIJhz6KLNNBMMCmNzuqPKl2YpkMSIMWe6J6cP5Gw+yi
	iLWVDclvHt8MdBlfehC0byJe9tAy4opHYzPohZdpezQboV+oRqxIxi1a/BJYinO0er8RRYyumHq
	OHPnSkL9ytmUF7bql55QZgw+5A4Q9bJmxlA61O5Q4lOcyCRxDjIT2LmCEbfpIVsXewC9MujBU9X
	jxD/eyS7csE+62dXRIV9qPj0DmNmi7JztOZIy0jIjQ1FA103ulwALldxs4ZqKiC6dYym0GpWdDj
	Opt+G+RMKXPzO7FHoeR9J0wvVLUkNMYv8mvyI06tBjApySh5mJr6/APuvdYCrTtPCrnq8MpmVGc
	E3Qm8MR9eludPpbjFvjxCICqq4G2z8w83zmijfJQELMU2SF42aKNhhAvH/cexKgFrSETufaq63Z
	OT4rgatBUBovE4wTPilZs+6damhZRey1A1higX5GYLL/5IZ6qHk1Epw0zuNH7i5Ko9Fby9jiMrS
	fbHTzqbA50ZTVyVbdYSkeZvCMJFA3ucEXmsuNBGB4gJPNfW/RJtldBPaAeV18areOderm10JSD5
	2OWNrW/k/+LX3+cyZjysSMl7iEL/oMSPc2aGrJyUDCy8Fnhkpbbv3DUM644zkUkYQFaG1KX9mDT
	tcf1E8E49xOHRVZxWbw==
X-Received: by 2002:a05:600c:1989:b0:4a1:e0db:8cf8 with SMTP id 5b1f17b1804b1-4ba0931beb1mr107545725e9.3.1794494223463;
        Thu, 12 Nov 2026 06:37:03 -0800 (PST)
Message-ID: <2756951f-ffff-4d1a-8795-42e9fd93518b@suse.com>
Date: Thu, 12 Nov 2026 15:37:02 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/6] x86: rearrange how mod_l*_entry() functions call
 UPDATE_ENTRY
From: Jan Beulich <jbeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: roger@xenproject.org, teddy.astie@vates.tech,
 Kevin Lampis <kevin.lampis@citrix.com>, xen-devel@lists.xenproject.org
References: <20261112100005.324440-1-kevin.lampis@citrix.com>
 <20261112100005.324440-3-kevin.lampis@citrix.com>
 <a3417b2a-11b1-4075-b4d3-fb8ad6cbe482@citrix.com>
 <d61b44e4-aace-4162-86b9-adc268ecdec2@suse.com>
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
In-Reply-To: <d61b44e4-aace-4162-86b9-adc268ecdec2@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-720697/1794494224-F1AAD2AC-D7A21F7B/10/78276251493
X-purgate-type: spam
X-purgate-size: 2421
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 12.11.2026 15:10, Jan Beulich wrote:
> On 12.11.2026 14:56, Andrew Cooper wrote:
>> On 12/11/2026 10:00 am, Kevin Lampis wrote:
>>> --- a/xen/arch/x86/mm.c
>>> +++ b/xen/arch/x86/mm.c
>>> @@ -2197,12 +2197,12 @@ static int mod_l1_entry(l1_pgentry_t *pl1e, l1_pgentry_t nl1e,
>>>  {
>>>      l1_pgentry_t ol1e = l1e_read(pl1e);
>>>      struct domain *pt_dom = pt_vcpu->domain;
>>> -    int rc = 0;
>>>  
>>>      ASSERT(!paging_mode_refcounts(pt_dom));
>>>  
>>>      if ( l1e_get_flags(nl1e) & _PAGE_PRESENT )
>>>      {
>>> +        int rc;
>>>          struct page_info *page = NULL;
>>>          uint32_t disallow = l1_disallow_mask(pt_dom);
>>>  
>>> @@ -2276,16 +2276,14 @@ static int mod_l1_entry(l1_pgentry_t *pl1e, l1_pgentry_t nl1e,
>>>          }
>>>          if ( page )
>>>              put_page(page);
>>> -
>>> -        UPDATE_ENTRY(l1, pl1e, ol1e, nl1e, gl1mfn, pt_vcpu, update_flags);
>>>      }
>>>      else if ( pv_l1tf_check_l1e(pt_dom, nl1e) )
>>>          return -ERESTART;
>>> -    else
>>> -        UPDATE_ENTRY(l1, pl1e, ol1e, nl1e, gl1mfn, pt_vcpu, update_flags);
>>> +
>>> +    UPDATE_ENTRY(l1, pl1e, ol1e, nl1e, gl1mfn, pt_vcpu, update_flags);
>>>  
>>>      put_page_from_l1e(ol1e, pt_dom);
>>> -    return rc;
>>> +    return 0;
>>>  }
>>>  
>>>  
>>> @@ -2300,7 +2298,6 @@ static int mod_l2_entry(l2_pgentry_t *pl2e,
>>>      struct domain *d = vcpu->domain;
>>>      struct page_info *l2pg = mfn_to_page(mfn);
>>>      unsigned long type = l2pg->u.inuse.type_info;
>>> -    int rc = 0;
>>>  
>>>      if ( unlikely(!is_guest_l2_slot(d, type, pgentry_ptr_to_slot(pl2e))) )
>>>      {
>>> @@ -2313,6 +2310,8 @@ static int mod_l2_entry(l2_pgentry_t *pl2e,
>>>  
>>>      if ( l2e_get_flags(nl2e) & _PAGE_PRESENT )
>>>      {
>>> +        int rc;
>>> +
>>>          if ( unlikely(l2e_get_flags(nl2e) & L2_DISALLOW_MASK) )
>>>          {
>>>              gdprintk(XENLOG_WARNING, "Bad L2 flags %x\n",
>>> @@ -2331,17 +2330,15 @@ static int mod_l2_entry(l2_pgentry_t *pl2e,
>>>  
>>>          if ( unlikely((rc = get_page_from_l2e(nl2e, mfn, d, 0)) < 0) )
>>>              return rc;
>>
>> Looking further through the call tree, I'm now confident that
>> get_page_from_l?e() can't return a positive number.
> 
> They can return L{2,4}E_RECURSIVE (i.e. 1).

Oh, sorry, these constants are still only local to my tree.

Jan

