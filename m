Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC3F2C79FB7
	for <xen-devel@archiver.kernel.org>; Thu, 10 Sep 2026 06:34:04 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1413962.1643828 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4YLu-0004mY-TQ; Thu, 10 Sep 2026 06:33:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1413962.1643828; Thu, 10 Sep 2026 06:33:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4YLu-0004mR-P2; Thu, 10 Sep 2026 06:33:42 +0000
Received: by outflank-mailman (input) for mailman id 1413962;
 Thu, 10 Sep 2026 06:33:41 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x4YLt-0004m2-CW
 for xen-devel@lists.xenproject.org; Thu, 10 Sep 2026 06:33:41 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x4YLs-009jEA-0y
 for xen-devel@lists.xenproject.org; Thu, 10 Sep 2026 08:33:40 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aa24f30-8faa-0a2a0a5109dd-0a2a4507bada-38
 for <xen-devel@lists.xenproject.org>; Thu, 10 Sep 2026 08:33:39 +0200
Received: from [74.125.225.140] (helo=mail-wm2-f12.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aa24f43-b4ea-0a2a45070019-4a7de18cb34d-3
 for <xen-devel@lists.xenproject.org>; Thu, 10 Sep 2026 08:33:39 +0200
Received: by mail-wm2-f12.google.com with SMTP id
 5b1f17b1804b1-49b91369ef6so6988305e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 09 Sep 2026 23:33:39 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-485883a9234sm48471752f8f.14.2026.09.09.23.33.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Sep 2026 23:33:38 -0700 (PDT)
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
        d=suse.com; s=google; t=1789022019; x=1789626819; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mylF4wULlC9jyJ5OamXqxZWkcxZx6dV+aky3gJWgiUQ=;
        b=UoiJ+LK/nkjgFGyLXer6V8iOK5OBM5TFMMzK1l+pumF3ZaJ2F8JLEtWxVPjexpHSOc
         3uhIAT+VdbMIHaA5s7g8BqBGhjl96rvsaNfNPi9xroYD95Bq7nVMaICp4tCEjf1Hk5YL
         3apyOyxi9XV0g/MsvmBELAHHJ2PBL7LYcmKWkRUMdPIDnqIRScn8lqSAJab5TT7O8t00
         7fKeIwoid9zND0625qMyaUdMQSvtLWmQyjZgD//6MI5o+VaXFd0X9wO5g3Xwx95AT5y8
         9oOtEu0rgn6SfwZhaelUrMiZLNJZSsPtHmO7leR9dFSRtkicxzhwB5ii2JOkhx3Z4S2v
         1YXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789022019; x=1789626819;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mylF4wULlC9jyJ5OamXqxZWkcxZx6dV+aky3gJWgiUQ=;
        b=eFF+rWATUwCPWI3U/96edWKStzz+EUNwCwn2A56JhQ0RLFnOTBpgzt4p5LsnBkHbof
         9eI2To0SFJV6bWioigloMjO+QSlJVKKJYmArdp4AYc/mNV1nPMxrLWbaf0TTZxkckM8B
         I+nktJzhc43LqV+A6LUSQit9567yfyJVPWkwINV8VgVuTFxoernfRpIv+r2YYMEusjMV
         0cFvHEQIjgnJtXFaPuFxALWND3tfLNFKhmv+CC/7XT7HPtliE2FmrXz4ziTMc+fFnqtw
         diEgGMO+C3vbtYegbT4ulfBtPPYakjecD3bo86pa/YOxqhXlTcIUdx5H/ClGpNw/8kCz
         dfHw==
X-Forwarded-Encrypted: i=1; AKwUvByvnpI5T3r5ZPmMAPPK+1JZeJ4X25RRnpUVliglxKP723G25fmW4rB6+x82Ah4P1f7MnYltCyBR6UE=@lists.xenproject.org
X-Gm-Message-State: AFuF++nZJvP+5kqAKjmaSCDLMeOhZlXF9qaIA3Hrq5ePi2P9/gr2phJd
	N9ANSB1slIe/1rIrMvI2jkDR6+y6k+7pyWmy7tvlRDgJ2GepSliq1fph41N87abZYw==
X-Gm-Gg: AYBFou3lco6zvbzWREOEoFW977f2QoupRNOFzfEq1tBTfcibgAcQYNajDjHoUYcMKHD
	9ynBZ43NinRu2xNS/8ra+DlgEWvHGvOye8751BncrRQH//OYEVDzaMzYYcrCdmhKxwN6/BBqF6i
	30f3wrXbCsmkWLjL65N0k5QKNuKZkXYy63Zjh0PyXWxulG6EtMH/tiea2ueBusNon+mh9iXrhsi
	zDmHRWwPpFcQx/v/RATOuWjoeA+T3fnUimOewK/41B25zjBy7HLY8d16ao5IBWI4DjHzSOKkkDa
	NOLQqBQ/MXVZUwG3y/13c0CtSdjFoQCP863WfycNT/WAos3ILG6aXnB+971btp/yAEbt6gRzKT+
	6/qWeUCsWP8uFNp2p0XzcJ6CZGsCA1RiYbqfSoUM5mfe6jdDFpUKaigpJRUvYg5/024iUGgai3P
	VKDPLC/yllRGS6ShZkCrFw/nBUHG8GEyOFp8Dy3AW2i9Kx6E6sWODyDdfUywcizNjELJWgaUInW
	RA61cmKg8P+nt4dFMFxNpS4kYBLrxKCP6EbIDeB2slrDgFJGkl0hQSH7SYL+Cg=
X-Received: by 2002:a05:600c:150a:b0:499:7a15:fcec with SMTP id 5b1f17b1804b1-49d2592e85bmr65613105e9.13.1789022018668;
        Wed, 09 Sep 2026 23:33:38 -0700 (PDT)
Message-ID: <7ab4cb61-6943-49fc-9d5b-1b5d67196b23@suse.com>
Date: Thu, 10 Sep 2026 08:33:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] x86/mm: limit deferred TLB flushing to PV domain
 support
To: Jason Andryuk <jason.andryuk@amd.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20260909140500.73483-1-roger@xenproject.org>
 <92c9bf4b-5171-4a26-a62e-f2a7b1cb89ef@suse.com>
 <aqGJJTbVNID0Rq6w@macbook.local>
 <22028c12-2400-4131-8e5e-b2dc7a65326f@amd.com>
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
In-Reply-To: <22028c12-2400-4131-8e5e-b2dc7a65326f@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ef75cf/1789022019-34ECEAE4-D023610E/0/0
X-purgate-type: clean
X-purgate-size: 2376

On 09.09.2026 22:07, Jason Andryuk wrote:
> On 2026-09-09 12:28, Roger Pau Monné wrote:
>> On Wed, Sep 09, 2026 at 04:46:01PM +0200, Jan Beulich wrote:
>>> On 09.09.2026 16:05, Roger Pau Monne wrote:
>>>> --- a/xen/common/page_alloc.c
>>>> +++ b/xen/common/page_alloc.c
>>>> @@ -1538,8 +1538,11 @@ static bool mark_page_free(struct page_info *pg, mfn_t mfn)
>>>>           BUG();
>>>>       }
>>>>   
>>>> -    /* If a page has no owner it will need no safety TLB flush. */
>>>> -    pg->u.free.need_tlbflush = (page_get_owner(pg) != NULL);
>>>> +    /*
>>>> +     * If a page has no owner and there's no PV domain support it will need no
>>>> +     * safety TLB flush, there can be no stale TLB entries.
>>>> +     */
>>>> +    pg->u.free.need_tlbflush = IS_ENABLED(CONFIG_PV) && page_get_owner(pg);
>>>>       if ( pg->u.free.need_tlbflush )
>>>>           page_set_tlbflush_timestamp(pg);
>>>
>>> I'm okay with the code change now, but the comment is still concerning me.
>>> All by itself there is no reason why stale TLB entries couldn't also exist
>>> for HVM guests. It's just that (a) only the host TLBs are flushed by
>>> filtered_flush_tlb_mask() and (b) flushes of guest TLBs occur when pages
>>> are removed from their P2Ms (aiui; hopefully true also for Arm). IOW what
>>> the comment says looks to be correct, just that it leaves too much to be
>>> figured out by the reader. At the very least I'd suggest "..., there can
>>> be no stale (host) TLB entries." Thoughts?
>>
>> Hm, I find adding "(host)" to also be slightly confusing, as I would
>> usually associate host TLB with Xen context TLB state.  Which is also
>> made more confusing by how PV guests share the page-tables with Xen.
>>
>> "If a page has no owner and there's no PV domain support it will need
>> no safety TLB flush.  PV domains are the only domain types that can
>> keep stale entries on the TLB, as they have (limited) control over the
>> host MMU and when flushes are performed"
> I find "will need no" a little awkward.  Maybe:
> 
> "If a page has no owner and there's no PV domain support it does not 
> need a safety TLB flush."
> 
> or:
> 
> "If a page has no owner and there's no PV domain support, then a safety 
> TLB flush is not needed."

I'd be okay with any of these. Then:
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan

