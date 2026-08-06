Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7627C55ABF
	for <xen-devel@archiver.kernel.org>; Thu,  6 Aug 2026 07:37:20 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1384286.1627294 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrsf0-0006bx-BB; Thu, 06 Aug 2026 07:37:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1384286.1627294; Thu, 06 Aug 2026 07:37:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrsf0-0006bq-8Y; Thu, 06 Aug 2026 07:37:02 +0000
Received: by outflank-mailman (input) for mailman id 1384286;
 Thu, 06 Aug 2026 07:37:01 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wrsez-0006bk-8e
 for xen-devel@lists.xenproject.org; Thu, 06 Aug 2026 07:37:01 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wrsey-00EejD-LT
 for xen-devel@lists.xenproject.org; Thu, 06 Aug 2026 09:37:00 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a743997-e002-0a2a0a5209dd-0a2a45079c08-10
 for <xen-devel@lists.xenproject.org>; Thu, 06 Aug 2026 09:37:00 +0200
Received: from [209.85.128.54] (helo=mail-wm1-f54.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a74399c-b4ea-0a2a45070019-d1558036f1ef-3
 for <xen-devel@lists.xenproject.org>; Thu, 06 Aug 2026 09:37:00 +0200
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-49800c6a846so14946355e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 06 Aug 2026 00:37:00 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-499542135cesm42363935e9.4.2026.08.06.00.36.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Aug 2026 00:36:58 -0700 (PDT)
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
        d=suse.com; s=google; t=1786001820; x=1786606620; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ViL4VHVHnGZCDBTWYy/BbLFUaSoqso542Mz4ZuHRR0k=;
        b=KIuLmYYbHUfxRC/XsvUjm/KXzPIi4iHsP3Cr4muM2r6JdqGhVUuwfGuUF7QFGxbRTN
         NzlMaNHlHoOmeXYyZLZXdiPuIAEXgQsUwuRo4VmAsozwzniSkCP7S/1ur8H/Y8Zyv4lj
         ziaI+RDRYg4doUGW43qcOIIdh5rrsUbwKGgCxym8BngX78CV/UyGtyZNPQ9rdOW+Gmk/
         Yf0Y9oT0mBB3kvFclG8VQrSjiEe/gYXxjKGdd71U3fqJV/D+4Vb7ow5CWEGX/LkgfRs6
         aJj4caaZbqha9Kv8Gmp5wqUpJWhYwLzNKdEYV77vu98k1MOLXsSSRomyni3PpfB61zFq
         ATIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786001820; x=1786606620;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ViL4VHVHnGZCDBTWYy/BbLFUaSoqso542Mz4ZuHRR0k=;
        b=qy2eFLRbhnBhG0e+J5VU91Ho0VjmBo0y+0zZZuZmBpxSeClP1C/B/jr4O76ueT02kU
         GP3vVgOdSktseRHhpvHFhJKeNcXS0BDavmWv7p3gzD6D9Zb4i5kEKs+DoITv1G3zDfPj
         lJARkDCG+PSlMqxZYjdV19WvHb95LcpDp1PGrmbRT/wkVe36IeSzQS3oVgo8FPBgQLp7
         ObdrVv/uYGtFN/EMjStBQ6kVxx7cdOmbfom5x0LU1OLlEhBCn80RSQYoNiiT82RDglyU
         IXpHOjgswhrHhJRsj5HbhU2gMYyiuov3mfh8RI2E66wX/SAnucqViNiEmcv5gqmMOdJJ
         fP3w==
X-Forwarded-Encrypted: i=1; AHgh+RrgKAr37uK9ZkkTekM/wnXV6E2Ck1jLnI3DqAFGjQ/crIUZxTYxpet9sKBCBBXN/JWT3R822eKT0AU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwUs7VXkNHbyg6PJ0Qkfp7kINbSuJ2qMwAqvO3++gFaAmmAoVnA
	xOXyargz/McvILT1f8iMTiBV9XIGV1yrKn6IB+7Gu8A3K4J+dOtQh3WE0Rc/OzCxgg==
X-Gm-Gg: AR+sD131UxgVKAMm6L2AD5mtK0pFXYa+lfr1F4ekMWRO3bPMw4diJOp14RBMolKmqtn
	j/frcYDQ94QW9JQPIXpRvbg4UBFvxbrRXD8Kl1DGxdD8uG+Dn1S8Rq7dZp9EOzIVsTeQPT4yvy2
	y09tlFhGfsbuF/aMME6MnaLuLyA2bl3I93E/wWBwSxPvqdslGINQtrGcV8qVHehYyy7obPmUkA0
	D+vq2OLXXjfti5n6yVm5k5WgghVrE4rplU/YYSwjSNnIi1E19jSZGhxZXPD5yzmmibW6VWlfVWU
	+0vJSo8cE65FjxzIb9+kr2cB4goZPPczMY9+6gVYLwAcaYoom/UZLxqQhWe29B30HzMzb8a46hK
	WYE8lH7588ryTSvc00ZEZoJ1prbm++o3h9R8k4qhF2n9u9l1VDs0SX1NcbMMSWl4UtIfdWHwNpE
	wQq6NqG7B8Vl5yiACTUS7Tx0wzDqlUDe4AbiVtOYZ4yn2ZkgDPfiOf0kspBnMYR7+58RYM3Myg7
	6uzY6xW14IqU+8/XyRdWwNSOyowzSTXapoiTgCIWJYcemNLnB9f
X-Received: by 2002:a05:600c:348a:b0:490:c6c2:52 with SMTP id 5b1f17b1804b1-4994e79b9c0mr185355295e9.3.1786001819346;
        Thu, 06 Aug 2026 00:36:59 -0700 (PDT)
Message-ID: <274a27cb-13f0-47c3-aa73-1534925dc350@suse.com>
Date: Thu, 6 Aug 2026 09:36:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 20/24] XSM: fold xsm_{,un}map_domain_pirq() hooks
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <758c8410-a18e-45dc-8944-5913e5832397@suse.com>
 <c973c612-153d-413b-a6c8-aeacd25f28a8@suse.com>
 <f99a285e-bd3d-4d8d-94ef-997c238c7f85@apertussolutions.com>
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
In-Reply-To: <f99a285e-bd3d-4d8d-94ef-997c238c7f85@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ef75cf/1786001820-A6CDFAE4-CE4363B4/0/0
X-purgate-type: clean
X-purgate-size: 1869

On 06.08.2026 03:10, Daniel P. Smith wrote:
> On 7/28/26 9:23 AM, Jan Beulich wrote:
>> --- a/xen/xsm/flask/hooks.c
>> +++ b/xen/xsm/flask/hooks.c
>> @@ -1022,14 +1022,9 @@ static char *cf_check flask_show_irq_sid
>>   
>>   #ifdef CONFIG_HAS_PIRQ
>>   
>> -static int cf_check flask_map_domain_pirq(struct domain *d)
>> +static int cf_check flask_map_domain_pirq(struct domain *d, bool access)
>>   {
>> -    return current_has_perm(d, SECCLASS_RESOURCE, RESOURCE__ADD);
>> -}
>> -
>> -static int cf_check flask_unmap_domain_pirq(struct domain *d)
>> -{
>> -    return current_has_perm(d, SECCLASS_RESOURCE, RESOURCE__REMOVE);
>> +    return current_has_perm(d, SECCLASS_RESOURCE, resource_to_perm(access));
>>   }
>>   
>>   #endif /* CONFIG_HAS_PIRQ */
>>
> 
> I am not opposed to collapsing the calls as long as the semantic is not 
> lost, which I feel the reuse of the xsm_map_domain_pirq does looses it 
> much less provides an opportunity for confusion. Something like 
> xsm_domain_pirq(..., access) makes more semantic sense to me, as it 
> would read, grant domain pirq access T/F.

In fact I was as well wondering about naming (and a possible name change)
here. I decided against it because of the other hooks (touched by patch
19), which all follow a similar model of their names really more expressing
the "positive" form than the "negative" one. Further, entirely losing "map"
from the name also doesn't look quite right, as physdev_{,un}map_pirq() is
where they're called from. To follow the naming of some of the other hook,
maybe xsm_domain_pirq_mapping(..., bool map)? Possibly even with "domain"
dropped from the name, fully fitting xsm_io{mem,port}_mapping()? Which
would then further raise the question whether patch 19 should maybe rename
the parameters of those two hooks to "map" at the same time.

Jan

