Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 616B7CC6B2F
	for <xen-devel@archiver.kernel.org>; Thu, 15 Oct 2026 07:11:33 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1449931.1665444 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHFcT-0005Gv-Ke; Thu, 15 Oct 2026 07:11:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1449931.1665444; Thu, 15 Oct 2026 07:11:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHFcT-0005Go-Hi; Thu, 15 Oct 2026 07:11:17 +0000
Received: by outflank-mailman (input) for mailman id 1449931;
 Thu, 15 Oct 2026 07:11:16 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xHFcR-0005Gc-SW
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2026 07:11:16 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xHFcR-00EXaL-2D
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2026 09:11:15 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ad07c7e-e002-0a2a0a5209dd-0a2a4501a3ea-22
 for <xen-devel@lists.xenproject.org>; Thu, 15 Oct 2026 09:11:14 +0200
Received: from [209.85.221.42] (helo=mail-wr1-f42.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ad07c92-5984-0a2a45010019-d155dd2ae40f-3
 for <xen-devel@lists.xenproject.org>; Thu, 15 Oct 2026 09:11:14 +0200
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-48df54150dfso163871f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 15 Oct 2026 00:11:14 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48df0f99f0bsm5045190f8f.21.2026.10.15.00.11.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Oct 2026 00:11:13 -0700 (PDT)
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
        d=suse.com; s=google; t=1792048274; x=1792653074; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xE+iqyFAzYCLjuj8rbiRjYNJkTNSStBwiqBAIkW4BTc=;
        b=F9L30NGUIMbxWNqUJ+WjUieV9ysSBfaQB1Tg0wi233oQut6knyGsOQ0GugadJB86aG
         HOU4GXaw5TVzsJtdOIrVSY6GhFiPWDH+IwhrFuwMhjAdXyYUTJ5AsEWxlnmSWVAZh/l8
         3uYnce3HJ252ASgcx9SdhzABlhAJmgTQ1xf85yr+WnD0vUST4Qgw6b1ceUDz0HPdCRPa
         Le2H2VJgTzrKcbdyyISYfhH5LTOTNIFpIZo/XECyV2IiQtWpH+qLBKSidqi+b8tyOEfu
         CwEJRA/oC54g+ji+xpu6nVM7gOgpehQq/eBGGBFa8EjJHWYgb473q3WY9odSCWL7VamX
         L1bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792048274; x=1792653074;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xE+iqyFAzYCLjuj8rbiRjYNJkTNSStBwiqBAIkW4BTc=;
        b=eYaYfX0gSIPttjrSZTnqBjJYfgyndEYJ2zCwvs5LJ2kMZ8aDHCF/Xo78RiLfiaGWhX
         ZeL3d+97dIhpThYinTDPb4euBWC6riZqxkAPxXYOihepxZSHh8pPfQ7/oImUoNVFp20m
         RokovWucy+g7QsGsi3VE1BBsCsHQd0eTioPM5/YaIgnzKfF/mLdVDuiQ/BnSSj2eqzh+
         dGsLMZCB0yj4NMHeLozWQbQ5eKwKdu9XwhIxs6d/bx/WS2V3HrMJhqMO/uMCLbqpBRuv
         uEHMsLfFGwQDwByy1U8P4m/nE5BBXBVf5ofOxAjDzwn1U6xsc0aQt5LizDWCbKs+9zA8
         bCCQ==
X-Forwarded-Encrypted: i=1; AKwUvBwuM6C/pXDz+VKc6vA8/WwcNk4Urh5P5BlT7FFb1xWMzRsJwwWHjrJALj/6Kn7xflpfddye6E+nzJs=@lists.xenproject.org
X-Gm-Message-State: AFq9FYJbuzjuipsLiPpnGReQw3g08iZqBuUGfMkJA9SHKx7oJt5Z7boJ
	09itKAjeL2pS4V5oj34PL9rw5MfVdEAXRzOmI89s8DD1wa3yBpO11PaAIJvEfeKYQw==
X-Gm-Gg: AYBFou3gtg6npyLXib18R1xBhxcEVtfwh/hgTCKn57/KCCcfi6bYO+oDeYdbWx0lAzH
	18I2UtggRfgKfkQTduh/vlMFfIO0Hh/ZhMzbHLZawUKeRbkTqPCJgxPpFFE6Y5LUwZpLZ80KBR/
	pOtOade8C1BHhWOxhumQUJUUGslXuJLDVFd2ai4LCJfTnSQ841Nz6Ui1KMu2SU9Hqlr8mPBnfP2
	u2oUbT47+kdms/xsjbPBKttoiN6SB7/zkFilQ6ow/dxQE9ito72b55Y90+cle0XbjeZHmGeT80V
	+YkHcF+NsoezbaGZ3XylEAvBifKnXF5bEomg+25hx46Pp3cE0UnjLYSI3WKeil6mZgarHgEFBvY
	0OPujEgA+BOY07woblHVSJGpS81k1v/qEOrvdddTSY0aaDNwFAPtB+NXlcF+AF1ozA08370wTIC
	ydZIjxsHY7oFg7XWVUnyiUfeuAI4LzxSev1i3xGMau4pjp//tQHE6a+yvgpYk42HxS3YapATSxF
	OG3cltce6x0bG/zIeu9itVqWbnhYniux2qXhk1DP1i7b+X5QXI/OLmhpbXeyQ==
X-Received: by 2002:a05:6000:4810:b0:488:7bdc:f7f8 with SMTP id ffacd0b85a97d-48dba9d2c0bmr34400894f8f.29.1792048274319;
        Thu, 15 Oct 2026 00:11:14 -0700 (PDT)
Message-ID: <e6cfd958-874a-4d25-9c40-dfe9f1979c2f@suse.com>
Date: Thu, 15 Oct 2026 09:11:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] gnttab: drop bogus check from _cache_flush()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <6d0acc68-9d07-4e0a-b27b-0095a51ebe42@suse.com>
 <8d4f9d39-f80b-43cf-91a1-033a8bca777f@citrix.com>
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
In-Reply-To: <8d4f9d39-f80b-43cf-91a1-033a8bca777f@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d62444/1792048274-BFA6E757-5819B90D/10/78276251493
X-purgate-type: spam
X-purgate-size: 1439

On 14.10.2026 18:24, Andrew Cooper wrote:
> On 14/10/2026 1:52 pm, Jan Beulich wrote:
>> There's no such thing as an alive domain without ->grant_table, and system
>> domains (on Arm) don't own any pages. The check should also not be left
>> there "just in case", because if that check could legitimately yield
>> "false", the page reference obtained would then need dropping on the
>> subsequent error path (see XSA-520).
>>
>> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> Reported-by: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>
>> --- a/xen/common/grant_table.c
>> +++ b/xen/common/grant_table.c
>> @@ -3637,7 +3637,7 @@ static int _cache_flush(gnttab_cache_flu
>>  
>>      page = mfn_to_page(mfn);
>>      owner = page_get_owner_and_reference(page);
>> -    if ( !owner || !owner->grant_table )
>> +    if ( !owner )
>>      {
>>          rcu_unlock_domain(d);
>>          return -EPERM;
> 
> Do you remember that I already posted this patch (to the security team),
> and you already reviewed it?

I do. That was after I had made this patch, though.

> I'm afraid that your commit message is hard to follow, despite knowing
> the details.  I already have one prepared from 3 weeks ago which I think
> is rather clearer to follow.

I'm happy for you to post (and commit) yours. I just didn't want this to
fall between the cracks.

Jan

