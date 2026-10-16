Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 507EDCCA464
	for <xen-devel@archiver.kernel.org>; Fri, 16 Oct 2026 09:04:32 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1451419.1666492 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHdrL-00060I-1X; Fri, 16 Oct 2026 09:04:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1451419.1666492; Fri, 16 Oct 2026 09:04:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHdrK-00060B-UB; Fri, 16 Oct 2026 09:04:14 +0000
Received: by outflank-mailman (input) for mailman id 1451419;
 Fri, 16 Oct 2026 09:04:13 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xHdrJ-000603-PE
 for xen-devel@lists.xenproject.org; Fri, 16 Oct 2026 09:04:13 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xHdrJ-00AaeA-2F
 for xen-devel@lists.xenproject.org; Fri, 16 Oct 2026 11:04:13 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ad1e886-e002-0a2a0a5209dd-0a2a450a9f96-38
 for <xen-devel@lists.xenproject.org>; Fri, 16 Oct 2026 11:04:12 +0200
Received: from [209.85.128.46] (helo=mail-wm1-f46.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ad1e88c-f2d2-0a2a450a0019-d155802ec56c-3
 for <xen-devel@lists.xenproject.org>; Fri, 16 Oct 2026 11:04:12 +0200
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-4a172eb31f0so55270575e9.1
 for <xen-devel@lists.xenproject.org>; Fri, 16 Oct 2026 02:04:12 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a1c8ad6252sm61190715e9.5.2026.10.16.02.04.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Oct 2026 02:04:12 -0700 (PDT)
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
        d=suse.com; s=google; t=1792141452; x=1792746252; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q6TUpuvrBn9Ib3+d/1jzY2oqfFrVO2WbbWZ2t+xu0Tg=;
        b=Gs/i+Nu/Y7u5fVJErlxftltFj/OpFz1LI/4XRRAUXCKZ5ZGsYs8gFfB10GYu7VuRVQ
         4mBjJ4nojMSUDMJSGJz8OXFfh5whXmoCKCgcySMPghGg7e61wV8mNhHP463oZKwmnDW1
         hRcTwvh2JjCpmRf3dZN2LhjpezvAwFMhaZFfZp5nB0rX8EubXkH9XyzOwNdv6vYoAstp
         ehmp2kq4TG5E6Dro+EX7lULL9jakwpW0xn00M78QzSKp2HFJbBpbnDkEzCQfIidBrfU8
         DMoaaMicdtSS2wbiUEcRNt7He35gFzl21QXkvQANZ1Z59Fiq7cdTRy7Y5L74JqQZH49/
         bHVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792141452; x=1792746252;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q6TUpuvrBn9Ib3+d/1jzY2oqfFrVO2WbbWZ2t+xu0Tg=;
        b=1zpRzTzQgbhxX++WeQNp0eqDpIoyWBfHpnAc5unMEgiOyYuRObLhHIk0jlL3pWKpeF
         0b0r3ohiQp/OglcSLp9ZdDpJKm+LE6SmOkqjh9/rpxOTd6U69DdweFgXQp23biY31R7S
         eDBExxRZfqdvIJCWdgKVqbPvCDOPodxTf19J8nN04iJ5NgRShtupZNhhofcpHo4wRJYx
         nxWuU7/pt1SyWjFg2+QixtGQHDsqDx9zqGe1x9ag5OfWhj6FYIbe83iO9bql7MX2innU
         SKB+kPj2Dte72f2wIiYRAa0mzob8LKkTOe4zEQgK8WsIywsDM+AhmreOxaHGrdqMTRFu
         oTyQ==
X-Gm-Message-State: AFq9FYJFtEMB0AimphQNC3Yc3jzkRRkQA10oiQLXudPrI447slCmftMA
	d/2LjssKA0iFcOn+E2KI1KZ9k8cWKvmk9KeXtbr5tMU+4JJrzEAZHwCREl1pee3sHPANd9dPIv7
	/jPgABg==
X-Gm-Gg: AYBFou1XdNCMkLVRXNPnEWrj0LEFui4c/oeIr+8qoz4bpe46JrpZb+fVd3h0Uw14DTp
	oDFhg8V4daYpnCNULqeEw/1fdcgqMWrBPFk0LEK433B0U4a228HTRXY/gQqsme4P/BDYH4ILNiu
	CJNoRxH/QB80I6kKyiwoBrV7KKq+iZNiQRp1a252h9S5JnaWJb7iIYuwNpYDabvHdxjp5tRgeLT
	9pJgOJFYy+bD/md6npSwGTSQLGJ2pbz650GoMCkgCEybaHcUdR9eV+HpN6v663av19R6tQDaWFz
	aZRN+H3V/KpkM7Dx+UwSGrLoigwxHBGcsZzyzBMzY1pnj+pIGcAOCrKE0DNWxpb8OcDMTRHd9L7
	pTLO0G8HWT5SLgN8lu53UiFEvRmRvzZ3Uu8VS4wiY8khSb+dBodFMMDjJ5upzdUAiC+cgTCzSrH
	ZEvHxzxf2wghkmbfaplxl68BdR/cqsiXwdy9f4nDsj02sdfiCBsTc2lV6dbmks6fBPkH//z5/D4
	1UK/VF6/lyljrxip2b734SXtlxLE1QYrL7U1WN4o5CdrNZt4MKd2rYOjfj3oA==
X-Received: by 2002:a05:600c:8b65:b0:49e:6683:d23c with SMTP id 5b1f17b1804b1-4a18e3ef1bdmr414743595e9.0.1792141452422;
        Fri, 16 Oct 2026 02:04:12 -0700 (PDT)
Message-ID: <0619015c-04ab-4310-af1d-430e1b028df3@suse.com>
Date: Fri, 16 Oct 2026 11:04:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 15/15] x86/PVH: simplify writing of Dom0's RSDP
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>
References: <1b4c2bb4-118d-497c-8d7d-f3824fd61a73@suse.com>
 <bcf7efcc-2648-42e0-ba0b-7f6e32e65f11@suse.com> <atHTl9du422xaY0v@Mac.lan>
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
In-Reply-To: <atHTl9du422xaY0v@Mac.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-4011c0/1792141452-58DC7CFC-5CF778E5/10/78276251493
X-purgate-type: spam
X-purgate-size: 1043

On 16.10.2026 09:34, Roger Pau Monné wrote:
> On Mon, Oct 12, 2026 at 10:26:58AM +0200, Jan Beulich wrote:
>> Now that we establish where the RSDP is to live before actually loading
>> the kernel (and writing start-info there) we can simply hand the pointer
>> there, eliminating the need for the (fragile) separate write to the field
>> out of pvh_setup_acpi().
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Acked-by: Roger Pau Monné <roger@xenproject.org>

Thanks.

> One nit below.
> 
>> @@ -1642,20 +1641,6 @@ static int __init pvh_setup_acpi(
>>          return rc;
>>      }
>>  
>> -    /* Copy RSDP address to start_info. */
>> -    BUILD_BUG_ON(sizeof(info->rsdp) !=
>> -                 sizeof_field(struct hvm_start_info, rsdp_paddr));
> 
> You add this BUILD_BUG_ON() in a previous patch and remove it here.
> Maybe it's not worth adding?

I can drop it. Imo it should have been there from the start, hence why
I added it in the earlier patch. I can drop it again from there, sure.

Jan

