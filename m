Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96F8BC55184
	for <xen-devel@archiver.kernel.org>; Mon,  3 Aug 2026 10:11:57 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1381345.1624933 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wqpdn-0005x6-I9; Mon, 03 Aug 2026 10:11:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1381345.1624933; Mon, 03 Aug 2026 10:11:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wqpdn-0005wz-FG; Mon, 03 Aug 2026 10:11:27 +0000
Received: by outflank-mailman (input) for mailman id 1381345;
 Mon, 03 Aug 2026 10:11:25 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wqpdl-0005wt-Mw
 for xen-devel@lists.xenproject.org; Mon, 03 Aug 2026 10:11:25 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wqpdk-00EdkD-4a
 for xen-devel@lists.xenproject.org; Mon, 03 Aug 2026 12:11:24 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a706948-bab6-0a2a0a5309dd-0a2a4508b0ea-18
 for <xen-devel@lists.xenproject.org>; Mon, 03 Aug 2026 12:11:24 +0200
Received: from [209.85.128.44] (helo=mail-wm1-f44.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a70694b-f659-0a2a45080019-d155802ced93-3
 for <xen-devel@lists.xenproject.org>; Mon, 03 Aug 2026 12:11:23 +0200
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-49553515a8bso30564155e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 03 Aug 2026 03:11:23 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49807b4bdc7sm130641945e9.0.2026.08.03.03.11.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Aug 2026 03:11:21 -0700 (PDT)
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
        d=suse.com; s=google; t=1785751883; x=1786356683; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gnOva0LMcogndW3IgqX95g4dwlTyOBKUvXh5mUS4hXs=;
        b=VOZmgU0D6QdELjqCTXzGwQsX9GLPRegp3YOcTZG9OcDNevvC3L5JvvMjBqxF4jTWHR
         5j9Fyf8QdyJlTiWAsWSKUKZkF0E1qwTSZlLOrUNsS5glvvx2WqHvh3lOcnKZdLL9aGoW
         bVwrp+iUeW5eYPRqc5p4U523wHxb5gEyPzUc0xqmGxLihHRrSGMtyqU2KJBe98LwARiE
         uPLdOzzEiwi3+4LDmeUx670/uKA0zQS14A7IO7cWcEDUXrzJVmMIIy7VMaQgHdw4B9gA
         DoMqEqMzO6BRw/w41SY6IXf7O8OgijoRkzZ9J05Uzm+qEWfdKRqvVapXRQwwREuhdH6S
         P9Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785751883; x=1786356683;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gnOva0LMcogndW3IgqX95g4dwlTyOBKUvXh5mUS4hXs=;
        b=g1fkTWnxdpVjgX/3nqdrWF9u3unhh3K8tv/P9+ukEAwP2DScJX9Oy6u7XQa9gmZw2Y
         7D+1aMOjt35n3kP79ckNToNexYDu1QdCU11kp/5pwAiP1SZQpa20VtQKDfhVNvhdvLvB
         0ZrpTGl9rsTMqk4dYR6EUeEvDrUkFnxheCTkew1vPqFRJC9kjyCw6sA+o7odNIrMMecW
         KeFWjMhBT9wRxgxxZ/w7nhQOTTnIR7WVZNGqJh79mbIkSENvawg0O+0h6prCBlw9oCTq
         o3f53nrTMtXqcYZDFMNaxAH3b8TKird64BHR7uyj6myuqFFp7sbX8gGApXPsZPPx5ht+
         zYXA==
X-Forwarded-Encrypted: i=1; AHgh+Rqzn1WGT/5i7heShEnhubFRJzDHpboFEzWbsr+UL6ac7DlyukozXdNP4I7G18hoWWJws5Jy/QM1glM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwCDvMRT0M6InV4iBVSKNr1PwVxbvRlOa7ukke8WBJ7KO4UOGjA
	xloEhFkz6l1RNTS0aR8xmnSFSzBQX1TPHJPcSNbi0YOvQk4QdnppwJrD1o/3bRnm6w==
X-Gm-Gg: AR+sD11VdvfprLKYaUpMLZObDFAY0ghScY6IpbjBZZ6JlPDaXpGerv9tn33zOsLONfl
	nm/TJi2eweCRjuh5H//F6j7CxaG4widF4YI3lZQct79cSdj3OQK116mOKroFb0QgQ+bMT0kOTiU
	zyAC/h6hHtINW9I5a75f5Nj9rtrbdPpBKo4DfLT29ztloQ1yM/FVYLKK+gRWhYOgDw5Q7l/2wlb
	e+gSepUjr1lyo7yHCD7FyII6iKgvwZuGIbWq4yd3vxHsxvanNV2oxSjqiCKs3Ph/11xxCBipBK2
	c2c71VPBWZbJEL7Ntm7vtnROmlDuhjCkI1DJh4uKHEze360dJPeVy1emnHimweASpGfQI2mYH3d
	ufTQkKPUDX+3BZ2SW6RnDAxPE1FZcRsRwC7snrwOtjcG1Gv4p5Yl5zQLfFbS5vtIiVjoKYOssI1
	oVpxMQ17lruaIwiLZ3luSOheuZ1x1sDPeBqb9PBTAREdodyMBcLCvoarJmwSJX+5XBQZLEm0Wk/
	XfrxGGnvpdNawV7ibRnWMqTqJRBaOSRF9Fgk/5cKb0APNam4Ka6nDYduIYkhSU=
X-Received: by 2002:a05:600d:849c:10b0:499:48bb:417e with SMTP id 5b1f17b1804b1-49948bb41d5mr5396535e9.2.1785751882919;
        Mon, 03 Aug 2026 03:11:22 -0700 (PDT)
Message-ID: <b742fec6-730a-4138-b5f5-7197f24df247@suse.com>
Date: Mon, 3 Aug 2026 12:11:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/24] x86/mm: get_page_from_l1e() is PV-or-shadow-only
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <758c8410-a18e-45dc-8944-5913e5832397@suse.com>
 <07e90200-95b5-413f-9259-7f0481d36521@suse.com>
 <4531d02a-3a37-4c57-ba17-32034ba08cf9@apertussolutions.com>
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
In-Reply-To: <4531d02a-3a37-4c57-ba17-32034ba08cf9@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c1860d/1785751883-CD34D87B-CF92F006/0/0
X-purgate-type: clean
X-purgate-size: 2352

On 02.08.2026 17:55, Daniel P. Smith wrote:
> On 7/28/26 9:18 AM, Jan Beulich wrote:
>> Otherwise the function is unreachable, violating MISRA C:2012 rule 2.1.
>> With the function compiled out, its dedicated XSM hook also becomes
>> unreachable, so it is similarly guarded.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> It feels suspicious that the .priv_mapping() check is used for HVM guests
>> in shadow mode, but not for ones in HAP mode.
> 
> I believe a hint to it is laying in the comment,
> 
>   /*
>    * Let privileged domains transfer the right to map their target
>    * domain's pages. This is used to allow stub-domain pvfb export to
>    * dom0, until pvfb supports granted mappings. At that time this
>    * minor hack can go away.
>    */
> 
> Correct me if I am wrong, but get_page_from_l1e() is only used by PV and 
> HVM + Shadow. When in HVM + HAP is mapping a guest page, it is done 
> through p2m_get_foreign() which will then be covered by 
> xsm_map_gmfn_foreign(). So only HVM + Shadow can hit TARGET_HACK check.

Yes, sure; that wasn't the point of my comment. The point was that I'd
expect _the same_ hook to be used by the other path. Aiui if you make a
policy, you want same situations dealt with the same. Hence there shouldn't
be a need to express the same thing two ways.

> I think the question is how to address the TARGET_HACK situation.

I fear I don't really know what exactly you mean here.

>> --- a/xen/arch/x86/mm.c
>> +++ b/xen/arch/x86/mm.c
>> @@ -837,6 +837,8 @@ static int cf_check print_mmio_emul_rang
>>   }
>>   #endif
>>   
>> +#if defined(CONFIG_PV) || defined(CONFIG_SHADOW_PAGING)
>> +
>>   /*
>>    * get_page_from_l1e returns:
>>    *   0  => success (page not present also counts as such)
>> @@ -1038,6 +1040,8 @@ get_page_from_l1e(
>>       return -EBUSY;
>>   }
>>   
>> +#endif /* CONFIG_PV || CONFIG_SHADOW_PAGING */
>> +
> 
> Would it also not be prudent to #ifdef out the declaration in asm/mm.h?

Ah, yes, this looks possible for this function - the decl isn't needed for any
DCE-ing by the compiler.

> I think it would be a good defensive approach to condition out the 
> header declaration. Otherwise,
> 
> Acked-by: Daniel P. Smith <dpsmith@apertussolutions.com>

Thanks, also for all the others.

Jan

