Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C57B6C5DF70
	for <xen-devel@archiver.kernel.org>; Tue, 18 Aug 2026 05:54:25 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1393400.1632197 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwCm4-0000aQ-0i; Tue, 18 Aug 2026 05:54:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1393400.1632197; Tue, 18 Aug 2026 05:54:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwCm3-0000aJ-UE; Tue, 18 Aug 2026 05:54:11 +0000
Received: by outflank-mailman (input) for mailman id 1393400;
 Tue, 18 Aug 2026 05:54:10 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wwCm2-0000aC-6w
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2026 05:54:10 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wwCm0-001CzV-Pn
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2026 07:54:08 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a83f364-8faa-0a2a0a5109dd-0a2a4502985e-26
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 07:54:08 +0200
Received: from [209.85.128.53] (helo=mail-wm1-f53.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a83f380-6ca4-0a2a45020019-d1558035b556-3
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 07:54:08 +0200
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-49557167508so42514895e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 17 Aug 2026 22:54:08 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-499a5684e06sm6300675e9.1.2026.08.17.22.54.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Aug 2026 22:54:07 -0700 (PDT)
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
        d=suse.com; s=google; t=1787032448; x=1787637248; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=td5FVs7/u7fTQ6+B+MfIwHKV96K7nJhHdTi0XeTAmzA=;
        b=WFiA+cCZWPijBxCl6rFc7G6LyOlXkUx7I5aq/EgezFT636sRvcmCZffBVD+hsUeIu5
         lD7Nxil+HMoqunBLcrXtaUxY6kX1cAaJa7aM2FXkPizIohspBc2ep83L52/C7rsAiSkZ
         ATvwFpulJyXMwt/zx9fYmvvT4+1i0HDKItoVATmMIsKFwEB5lBVHRz24Qzwfy/KSG/6o
         h0sEOgoHlPHb3RaQ7DNgNEZ7W7CmENXO/1deg393KytbkFORNFh6XIALNvaTw6hMVL7j
         0NVd+2QTE6ll9lUsjQjHJfAnRjfEF2h+slCiquAyMIZ76WAp+WbxfNW4afeyWH6y8I2R
         JwaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787032448; x=1787637248;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=td5FVs7/u7fTQ6+B+MfIwHKV96K7nJhHdTi0XeTAmzA=;
        b=hiaQ6eIIoaGco40jENPg5oHdvu8RCW3isUqV2Y593Os175ztDtG4XOg941T7TyeFP9
         D8ELuUGSSe8cI7+XW4w/bZt41BKPOo3jFuDVla7mfh5oGInu/UGdiRWp45N1sUWMckiX
         L7jOhuwRub9iS5HRev1seqZuW2dT1oVKaBIxrBeOIqOwBBRiw2jn+9SS0oA93ted83Kz
         9H8qJYTeiY8GlIAiov2T8o7+II3JBZIT4lqWaCfcN0CgMqfvcx5OoGfijFA+kBhUY+Ij
         UYKeuOP6kOQz7fZSaMY/7A+ZT1qZgOEpG+MJqL7bD3wv7JN0u8ghI0q8iBm5pKSof+8H
         o6YQ==
X-Forwarded-Encrypted: i=1; AHgh+RrpK+4Z9770PFIFBUYdm25+oWpTXUChRur6tqdfk8yAqj434oIwTTOPTlJpV6KRkY+0sIjSGmpcVmY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyNUAO9r8bfbMx2o8cSrNo4idQY6xzngOOeJIP7LwQnsaz26mTY
	gKuD+0CosFrz483feKxVaj0ZAA+yOwaWhDsFvOpOoQINVjRd/+eAO0aWIzAQAYt3/w==
X-Gm-Gg: AR+sD10Q0Iry79MKuOjaEETBa2CNcyrf/2pcIXzNo8W7WRVPiH9aMe48jUCs+Bs0AdY
	804P5UH4FQ9zQyspUGX3RKYEkPx2xJUNHlbJtXab/CHhwaSCQ4DxR7nx9HM7+qIb9R8j+PtloQw
	ZHHFNxCrAevjS0nZlhanpvZ6FV1vTU/ird21cgw5yLQUJSh/uJNRzY6L7pnt4/8xrmLEWaSkP3e
	hKx+yyymE4KIgv+Iow7eiqCscr1JYVTUFK/BokpK7c/LhmlZeh/DHr5Zxfhi1qK54lmmOJzNijF
	fvgNm437MYDiemvVbCKj4wOz4EiMJpC7iKl2T8N0dhq/lIO20lF8IoyHnAsm07DITPQEvZQsj7J
	Ex3zurK+5UsGwdJR2LnvtoRDyI3KN51U5Ydb3rs8xw3fJxJvTIPCdHLudyBvtZVffuEFvgqJ1OC
	2ZgFRTrKOl1zsk3KTCjwgyG+QqdwkZbAciJaYHJaJSncPgnR0lqSOCeHIrJ7lgNccJXZa/GFXe6
	kp9AsMYRAIucECCfP+J3yL1mLknEDpXCNJtYa852DQk1wTJuu2y
X-Received: by 2002:a05:600c:358a:b0:496:c06b:9fb4 with SMTP id 5b1f17b1804b1-4999fb940c5mr88707925e9.14.1787032448167;
        Mon, 17 Aug 2026 22:54:08 -0700 (PDT)
Message-ID: <d51362ab-e004-43b7-8825-d315c1cb41f9@suse.com>
Date: Tue, 18 Aug 2026 07:54:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/nmi: Fix mis-classification of watchdog NMIs
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Teddy Astie <teddy.astie@vates.tech>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20260813174319.1682009-1-andrew.cooper3@citrix.com>
 <4f58e236-c40b-4fcc-82e8-5b6f3eafe656@suse.com>
 <33aab2bd-db13-43f6-9616-5e75fd79b81d@citrix.com>
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
In-Reply-To: <33aab2bd-db13-43f6-9616-5e75fd79b81d@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-720697/1787032448-F2EB32AC-24742BF9/0/0
X-purgate-type: clean
X-purgate-size: 3335

On 17.08.2026 17:55, Andrew Cooper wrote:
> On 17/08/2026 9:30 am, Jan Beulich wrote:
>> On 13.08.2026 19:43, Andrew Cooper wrote:
>>> It used to be the case that cpu_data[] inherited the BSP's cpuid_level until
>>> the AP had calculated it itself.  Following the rework, cpuid_level has a
>>> placeholder 1 until it is caluclated propely.
>>>
>>> setup_apic_nmi_watchdog() happens to be called on the BSP after SMP bringup,
>>> meaning that the first call is on CPU1.  It is also positioned in the window
>>> where cpu_data[] is garbage.
>>>
>>> As a result, setup_p6_watchdog()'s one-time calculation of the performance
>>> counter width falls back into Pentium compatibility mode assuming 32bit
>>> counters.  This causes a watchdog NMI which is delayed a little (e.g. from an
>>> SMI), to appear as if it hadn't overflowed, and therefore be (mis)classifed as
>>> not a watchdog NMI.  On systems where unknown NMIs are treated as fatal, this
>>> results in a spurious crash.
>>>
>>> Switch setup_p6_watchdog() to use boot_cpu_data.cpuid_level, which is how this
>>> is checked almost everywhere else.
>>>
>>> core2_vpmu_init() used the same pattern to look at leaf 0xa.  Despite being
>>> init code and only running on the BSP, {boot,current}_cpu_data are different
>>> objects, so switch it over to checking boot_cpu_data.cpuid_level too.
>>>
>>> Fixes: 7126b7f806d5 ("x86/CPU: re-work populating of cpu_data[]")
>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> 
> Thanks.
> 
>>
>>> I hate this fix, but it's the only thing which I consider remotely safe to
>>> backport.  Recent attempts to alter CPUID ordering have 0 success at being
>>> bug-free.
>> How that? Collecting CPUID output should be doable almost first thing. There
>> are no (or in case of doubt: there should not be any) dependencies on about
>> anything else. Of course re-collecting may still be necessary after ucode
>> loading. Yet from what you say I must be missing something crucial.
> 
> I was referring to commits in Xen rearranging the boot sequence with
> respect to feature handling.  There have been many failures recently.
> 
>> With that in mind, I'm also questioning the Fixes: tag (without this being a
>> request to drop or change it): Using another CPU's data isn't much better
>> than using partially unset data. Unless we assumed full symmetry, at which
>> point re-obtaining of most data on the APs would be entirely useless. Hence
>> the issue was pre-existing, with one bug there hiding the issue addressed
>> here.
> 
> Copying the BSP is less bad than the current behaviour.  It's not
> necessarily ideal, but it's a damsight better default than the arbitrary
> 1 that this patch puts in place.
> 
> Even with the very old 64bit systems where mixing steppings was
> commonplace, I'm not aware of a vendor supported combination where
> max_leaf was different.
> 
> 
> The issue was not prexisting.  Prior to your rearrangement, the NMI
> watchdog setup found the counter width in CPUID and used it, without
> falling back into original Pentium compatibility mode.

FTAOD - with "pre-existing" I meant the using of the (possibly) wrong data,
not the particular issue of the NMI watchdog being affected.

Jan

