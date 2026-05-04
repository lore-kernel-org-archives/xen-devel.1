Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B0BEFF885A
	for <xen-devel@archiver.kernel.org>; Mon,  4 May 2026 08:21:23 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1299573.1574106 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wJoY9-0001XI-4I; Mon, 04 May 2026 08:21:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1299573.1574106; Mon, 04 May 2026 08:21:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wJoY9-0001XB-1W; Mon, 04 May 2026 08:21:09 +0000
Received: by outflank-mailman (input) for mailman id 1299573;
 Mon, 04 May 2026 08:21:08 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wJoY8-0001X5-B9
 for xen-devel@lists.xenproject.org; Mon, 04 May 2026 08:21:08 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wJoY7-001Oxm-2T
 for xen-devel@lists.xenproject.org; Mon, 04 May 2026 10:21:07 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69f856e7-bab6-0a2a0a5309dd-0a2a4503e41c-44
 for <xen-devel@lists.xenproject.org>; Mon, 04 May 2026 10:21:06 +0200
Received: from [209.85.128.43] (helo=mail-wm1-f43.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 69f856f2-672d-0a2a45030019-d155802ba43c-3
 for <xen-devel@lists.xenproject.org>; Mon, 04 May 2026 10:21:06 +0200
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-4891f625344so39270975e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 04 May 2026 01:21:06 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48a822be902sm335881215e9.6.2026.05.04.01.21.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 May 2026 01:21:05 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:In-Reply-To:Autocrypt:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1777882866; x=1778487666; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=eHFVDyNDq1ujDxrMsv0Lv9h3MSVMOHBLP1wcBWvdh0U=;
        b=WEWShAUom1Rqee6X3llbBTzTGuCSdpAe0wVn4crzQW3JfkwxCAQ0a08FWVwlzhXd7o
         4F5eEimMvhMsDLAJUksu6NqBmYKWXeQGm7eJj0dUfL8LA46uYqOaK6CMS/xmWEN/ILh6
         9wYhsIBQ1BKASeW1SJmxaHwMjwJahT6AE6tEceFFVh/3w2cX+WQ4ga7OMToNbXdF8/Hy
         EVcmxRY3esrWdr1R/p8RPoJBWoXlsK4897Cyou12dNphWOqXZHGKUPPFQo2XFmq8KiLL
         DaG4Vu0zo2qAUt7D1deW6+BlUnH6L4b1/Yf1fyIFTlHq1pDRKGXLwhUqkzRerdO6tcnc
         KN+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777882866; x=1778487666;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eHFVDyNDq1ujDxrMsv0Lv9h3MSVMOHBLP1wcBWvdh0U=;
        b=SiW0brAvigcqXnTm6m+SiqDDrfXcNqZZafo5bmcs8W7913BvzDx4n0jkGYoixKXlGo
         YwTGBnJsHUwk06oEXH74Dq36kzYDddirNyC+jSnhM6hiFJmEiciJvtdJSBhPvfbCGlg0
         EhTQPulERosCqZabN+4StuujrY511a2ie37RWGtNCFvhedWqgivO1fKxOiNBWZcsgfVo
         6rruJx4XYtrHtuC6O+NYknm2OsSnasvTLg2A+V+oLTbyZWeM9QycnwwuaZnFID6WNK8P
         TULsqAKRTLa3C8JL6CJKrwXAOGmfZV1AkAMg3Q3CmJ6JfVCxEIl4j4JAF7HDcXAZxPIm
         fuKQ==
X-Gm-Message-State: AOJu0YzMMSyM68ALCdfWv1tfj2CwOpLmc+/YRNizad1+aMPUQlZhBYaq
	NQ2QiwWd+UxBWpR1t1UQjWOeCOsxuuX19PsJpPP0SBkchC59wRL56v5+C66dt1P6iowz24MkowX
	JtPs=
X-Gm-Gg: AeBDietrEk8pAeZcxUUjqku13mmx/D5d2MOkrS5gfQ2NZvHsiiV5bGoyRCp3t3z48tp
	TPt+7a4bA7XvyuCwvpqb6m062I8vT813I1tnCvD6SLK3Qo6NNKG/1QkgLXTyymY7MF6ua1F6opN
	P/3FUcQ9tKs21ycNcgrj39z+bNrXQKG1xAkkfSOMpZmOHmDEmjWuiln3DCJmusRQnf/xAARFgU6
	CjjmfF8Ip6feLZon44nSuFaR1iaRmEz12jtOnjPpBHCllRotdbEQHxBuoO9ZeSP1VkFCrg/uomj
	LwYbyJaeawqjJh0xE7YfBVVsQeZtvUK48ECPcQxrfRiSTc4PWTbtxcvRbcGuekIlM3vPdN9wSCH
	Mh8MDcH+dbAmXNpVYvZSa/mkqHBQmb8M5dBaKwl27hqXOCY9rdOlVvBmRuxKjLUc1Ld+DDbJvAG
	24GFYJQqA3Cwbgp4d1+HLR5EzG10F23YNOn+EpGYYT7FSm/u1bB/C9ULuYUv0159JkJbizNQD1p
	KypevTmb1YmKoVb/kpMYImo8Q==
X-Received: by 2002:a05:600c:2a92:b0:48d:50a:6ef4 with SMTP id 5b1f17b1804b1-48d050a6f3amr45007275e9.11.1777882866191;
        Mon, 04 May 2026 01:21:06 -0700 (PDT)
Message-ID: <f733f3a6-dc39-4b8f-8c7c-f0ed235050f0@suse.com>
Date: Mon, 4 May 2026 10:21:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] x86/shadow: unlock P2M slightly earlier in
 shadow_track_dirty_vram()
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <5149ab32-7d03-4ae5-9af0-e62dd5836329@suse.com>
 <c6aa40de-11b2-4725-b18c-8a982e43f0f0@suse.com>
 <ae8im__1Wrn420MH@macbook.local>
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
In-Reply-To: <ae8im__1Wrn420MH@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-33051d/1777882866-2A965938-2BE86944/0/0
X-purgate-type: clean
X-purgate-size: 1501

On 27.04.2026 10:47, Roger Pau Monné wrote:
> On Tue, Feb 03, 2026 at 05:49:35PM +0100, Jan Beulich wrote:
>> There's no need to call vfree() with the lock still held.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks.

>> ---
>> In fact for the purposes of the function the P2M lock could really be
>> obtained merely in read mode, and it could be dropped immediately in both
>> the main "if()" and its "else if()". If only there wasn't the error
>> handling after copy_to_guest(): Dropping the paging lock ahead of that
>> call, we rely solely on the P2M lock to also guard the changing of
>> d->arch.hvm.dirty_vram.sh and what it points to. Question is why dropping
>> the paging lock (but continuing to hold the P2M lock) is necessary there
>> in the first place.
> 
> I wouldn't spend a lot of time trying to optimize this, we already
> know HVM shadow is ATM not very optimized, and generally recommend
> HAP.
> 
> If we could turn the p2m lock into read-mode, maybe at the expense of
> expanding the paging locked region that would likely be slightly better?

I fear holding the paging lock across copy_to_guest() is a no-go, as a
pagefault there could invoke shadow code. Thinking about it, that lock
is a recursive one, so it may be possible to leverage that. Would
require making sure that all code paths potentially involved in #PF
handling would also use the recursive locking form.

Jan

