Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEDE6C79FAD
	for <xen-devel@archiver.kernel.org>; Wed,  9 Sep 2026 13:27:03 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1413095.1643348 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4IK8-0005e6-UB; Wed, 09 Sep 2026 13:26:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1413095.1643348; Wed, 09 Sep 2026 13:26:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4IK8-0005dy-R5; Wed, 09 Sep 2026 13:26:48 +0000
Received: by outflank-mailman (input) for mailman id 1413095;
 Wed, 09 Sep 2026 13:26:47 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x4IK7-0005ds-DX
 for xen-devel@lists.xenproject.org; Wed, 09 Sep 2026 13:26:47 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x4IK6-00CdEo-Mo
 for xen-devel@lists.xenproject.org; Wed, 09 Sep 2026 15:26:46 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aa15e90-8faa-0a2a0a5109dd-0a2a4503ace8-32
 for <xen-devel@lists.xenproject.org>; Wed, 09 Sep 2026 15:26:46 +0200
Received: from [74.125.225.140] (helo=mail-wm2-f12.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aa15e96-fae8-0a2a45030019-4a7de18ca237-3
 for <xen-devel@lists.xenproject.org>; Wed, 09 Sep 2026 15:26:46 +0200
Received: by mail-wm2-f12.google.com with SMTP id
 5b1f17b1804b1-49b912d37b5so6546495e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 09 Sep 2026 06:26:46 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49d20fce7a7sm121098935e9.4.2026.09.09.06.26.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Sep 2026 06:26:45 -0700 (PDT)
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
        d=suse.com; s=google; t=1788960406; x=1789565206; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VqN+bt1mKMsfmlOhfK9GOFdSVjaP+VQ5U5vmVdwoJfE=;
        b=DNfL9yXnxt1VRi0Cwmj8SVQ2rsdCDz1ynyFIfRT16ByZaSpHm0KVoORx+42gQ9Pb4z
         c97Pcy6xjbDQ25H2Ql6aDoBwSVtnExTetnda1wfp39jFPghi0yMn54kxBYIrq+QzqCrC
         lHO/f2AVvtltW4uLfqBD1ByJnC7AMP7tAC7kaoD/QC87SRNNUafv9k0wjFQPA+mD8LEq
         MO/UE5Rhzoji09vFBt7jxBdkxhIrHOASGC/5oO9dwRXPOv0wgo4aFV/NO9eM2VsCgg+i
         csU5QIers9B0xkPhNZDIer3BzzNRGkAFMGyQGGNB/nU8tSroMHScIVm54zB0aZcMTx4B
         9mQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788960406; x=1789565206;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VqN+bt1mKMsfmlOhfK9GOFdSVjaP+VQ5U5vmVdwoJfE=;
        b=edjtTodv3xOugMXFRVNnoYk+3N4dSEjNTImdttYb8EliYne0/g5cVpAmJ3gpX6fJgh
         lCBvJiAus3MjRtvfZDieCfYr0MBY3Zei8FtHUWvwYZ5f5BQ6P1JjQEHevogBQRJ3h3rf
         9nLHdOsZtiIKosdwoNH2RjaQdID7/hfjkLQ6Ud4XkWLWrS8QCz/5xERMdNfELfMy2R4f
         /K5mNlJbOO/N8r7uOO/lUudJd7F8cbctW9FAOPoZnQ1JQoYABVwRuq58STjzxz6hClw+
         fgHW/MflsVYtl0g0rCs9RYu7KvPvRTCcsVQJuym06uy1zCdRB5a7SSxCcD4mELiSEew6
         aS0g==
X-Forwarded-Encrypted: i=1; AKwUvBwzbi9qoNKno0Nyhxkot7qWfK9YrgVbyGgxdEOeit1bNaVUe6FOxf7TivfaGBcALM71nZHKpgO7XsI=@lists.xenproject.org
X-Gm-Message-State: AFuF++lDyG6K5QCI9+hwZeRlDdDC8ljJsDDXX/75yIwMA97VmLWy8DYo
	84iyMo6bnTBMV78wNSRFRMLZWx5lpJ0D63gTcZk3KKGGT+19sgkp50YYvCBXeuJE0A==
X-Gm-Gg: AYBFou3ZwxKmX74sWD4D/9RysTkdLI83/om7QDceDQ7z8rSYK89MfKYWutqT1unQtni
	fufQUMt4YgzSRKZEGTrQZVn4LgL9tTOTBab1mL5h5qIp1gMdlPe1xyZTCGjMAJeXCiOI7AayhPR
	+vnjrRt6clE5GWOvylqx7JSM/q3FLDt5GqqK6vydM6YBYiFfp4TuNzynAryZcWXBClLgDoYUHQA
	rb2q/YkyLTEzod3ryO+sOAVoBDqjJHaYOsekVY3Y+6KImOgoDnHHBf3zQkaL+fNiJTorZxTEQLs
	k0wSNLvugVHo/9yiXXlnxwvaHRBBvg4Yw5hCmwv4R6QFt27xXi5jA0f/O6ZhGvpr/3KYPgmPqmg
	9K/Eg2y2vVIAOmQhnxv7NwT6ev4rZy4D4NuuydOueILz0mdq+bFzD04f7GyUqwSsHdfp2yVlNUO
	hEPKgpXhCcwVVcffNFi5lsKJ5MxYjGwJrTJXWj5NMzmjkUsW3lc/xQ5nAYlOxKiQlQSJtj0vwtG
	QuKpvktPrf+Zi8FV+eJaeM7rM5pHLQpyykFuCDS0eTV+JRwx2ef1mMuQgMQhNF1jUNa3ACx3w==
X-Received: by 2002:a05:600c:3146:b0:49b:9105:cdaf with SMTP id 5b1f17b1804b1-49d1f32335amr104412935e9.8.1788960406113;
        Wed, 09 Sep 2026 06:26:46 -0700 (PDT)
Message-ID: <4ed55315-4eed-4c68-9af4-7d96149bcf50@suse.com>
Date: Wed, 9 Sep 2026 15:26:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/mm: limit deferred TLB flushing to PV owned pages
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20260909072451.67324-1-roger@xenproject.org>
 <1cadfc6c-efc1-4e23-b778-1df97fd0fa4d@suse.com>
 <aqFalyxQtfoKJto5@macbook.local>
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
In-Reply-To: <aqFalyxQtfoKJto5@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-33051d/1788960406-766FB4E9-A3F80E5D/0/0
X-purgate-type: clean
X-purgate-size: 2107

On 09.09.2026 15:09, Roger Pau Monné wrote:
> On Wed, Sep 09, 2026 at 11:21:51AM +0200, Jan Beulich wrote:
>> On 09.09.2026 09:24, Roger Pau Monne wrote:
>>> The current logic on x86 will mark all domain owned pages as needed a TLB
>>> flush before being re-used.  However such TLB flushing is only strictly
>>> needed for PV domain owned pages, as those can keep a reference to the page
>>> in the TLB after it has been freed.
>>
>> What about HVM-owned ones which a PV domain has grant- or foreign-mapped?
> 
> I've looked at grant pages, and that's handled correctly, a TLB flush
> is strictly done when the pages are unmapped, so there are no stale
> references in the receiver TLB one the grant is released (see
> gnttab_flush_tlb()).
> 
> However I cannot find any forced TLB flush for foreign mappings, I
> assume this is fine because foreign mappings are not controlled by the
> source domain, and hence there's no need to forcefully purge any TLB
> references.  However there isn't much that can be done here: forcing a
> flush on unmap in do_mmu_update() itself would be a high performance
> penalty.

Right, and hence ...

>>> --- a/xen/common/page_alloc.c
>>> +++ b/xen/common/page_alloc.c
>>> @@ -1501,6 +1501,7 @@ bool scrub_free_pages(void)
>>>  
>>>  static bool mark_page_free(struct page_info *pg, mfn_t mfn)
>>>  {
>>> +    const struct domain *owner = page_get_owner(pg);
>>>      bool pg_offlined = false;
>>>  
>>>      ASSERT(mfn_x(mfn) == mfn_x(page_to_mfn(pg)));
>>> @@ -1539,7 +1540,7 @@ static bool mark_page_free(struct page_info *pg, mfn_t mfn)
>>>      }
>>>  
>>>      /* If a page has no owner it will need no safety TLB flush. */
>>> -    pg->u.free.need_tlbflush = (page_get_owner(pg) != NULL);
>>> +    pg->u.free.need_tlbflush = owner && is_pv_domain(owner);
> 
> I guess I will need to adjust this to:
> 
> pg->u.free.need_tlbflush = owner && IS_ENABLED(CONFIG_PV);
> 
> As keeping track of whether a page has been ever mapped by a PV domain
> seems overly complicated, and not worth it.

... "yes" here as well.

Jan

