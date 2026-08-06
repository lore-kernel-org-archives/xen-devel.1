Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EE08C55838
	for <xen-devel@archiver.kernel.org>; Thu,  6 Aug 2026 06:44:30 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1384241.1627255 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrrpo-0000pZ-U4; Thu, 06 Aug 2026 06:44:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1384241.1627255; Thu, 06 Aug 2026 06:44:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrrpo-0000pS-QT; Thu, 06 Aug 2026 06:44:08 +0000
Received: by outflank-mailman (input) for mailman id 1384241;
 Thu, 06 Aug 2026 06:44:07 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wrrpn-0000pM-93
 for xen-devel@lists.xenproject.org; Thu, 06 Aug 2026 06:44:07 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wrrpl-0034mA-V4
 for xen-devel@lists.xenproject.org; Thu, 06 Aug 2026 08:44:05 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a742d1d-2eae-0a2a0a5409dd-0a2a4509bb38-42
 for <xen-devel@lists.xenproject.org>; Thu, 06 Aug 2026 08:44:05 +0200
Received: from [209.85.221.49] (helo=mail-wr1-f49.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a742d35-be1a-0a2a45090019-d155dd31ed9b-3
 for <xen-devel@lists.xenproject.org>; Thu, 06 Aug 2026 08:44:05 +0200
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-47ddf7b09e5so1646017f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 05 Aug 2026 23:44:05 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47ff79b529fsm4174563f8f.12.2026.08.05.23.44.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Aug 2026 23:44:04 -0700 (PDT)
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
        d=suse.com; s=google; t=1785998645; x=1786603445; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EfQIuo25alYydqJl7CsWTFV1Lp4Og1ZUqJTTMZut3GU=;
        b=gJ1wps/A3muG8mBgg2W9yZWuF8IBc9LS1Mz4NYPCB4CeuuVAHm9TR18VjR/mh2cdpX
         iT+sqXCAt45zr0yRIOWpyR7KbwNKMWquE7I4+bg0dZpkq6osnsCxSD2ffoIGr+RPpqxm
         Lif+mqhXkeML7HGAkRA3klGZ3Nfg1HzYsKBWG9jVK+w4jY1ybykRbR5Hkpq7TjLZZqp8
         WWa9bv5iASBxv1PKcr5RSAaWYv7NvkW1FA1bQy5o1qWpv8NA0+VbOUKjgSAQDCUFGkWC
         YOwvGFP0AyCnMds3xUvnWgc+k5+6JPykgKjQ2EO682p86AIcxbTCfQtrGrRXjiRgGjLM
         f82Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785998645; x=1786603445;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EfQIuo25alYydqJl7CsWTFV1Lp4Og1ZUqJTTMZut3GU=;
        b=Ie1ti86TZGrglMP3nT+kRuYl78/qBdkn42tZOCOy+j4xkMxHeluFN3NsBBIJveeAvg
         iN+Rn7rPPwvYU760HaHh4y2SHxsR1h8ofGC7fTxoN+DY4WurDTp3y75hbT/gGmSNRz9u
         mMGhdSLNOd+SvsUrp+cbR8Q3U9myusSC9HPwKHqUPEJHC8uBp/GgbC+2oNPH9grtm2LM
         Kq+Oq6Z8ZRKdKQXjO7na0RQy1xXJVPS+KDAieiEmPHcHmE4fgCv9BS7M5JX/l4xmxmvq
         La4OLZwuFc07CRnxzNnARBtVGueTLbF+AfTIexkbxvrE4JA9ki0clTydG79e6hbHGgFZ
         m+Dg==
X-Forwarded-Encrypted: i=1; AHgh+RpdiDEdH3nnSIPMpCYy7mGON2Wt5v1QRRvFi3WHIQniTraH5t/wESUE1TAW2iipZsxdp9RhPAlDnpI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxH6JWiU5wxlS68I1aKnkZ+JigukOZ1mo/Q72XNtVVnS2lPMXRW
	o823srUMcdSPU+lFx3KzWsIxjW/b/bz/YEFA1uqDDWUjtqFoNe06UdbhS3evRDs33w==
X-Gm-Gg: AR+sD13hWvLZcam+bqJ5uEJtQnIdCqRYM3R48RQmZ7bHTb3EmdoSIae+tG2d0x5++eH
	uFe1wuuWy5fw1zLO2hrjM922a8sJxYjiX9C9n2DArRDxnhbc6RkHa22eCOL1KIZcA8X24CcOtES
	wRbJ8Ebx7f8nMxVZjWHh8g+uEnf9r1IRPhOSLug9armU+kUawcbHQPf7xg57xpp7Do6/+7So8gu
	QwB9W6BZyZ+Yv8umkhHHxXmtgBErBtCuj4FFLKSf1zHLOCL4nJlBabL4iLQ7EbQ8AhKZSKVlZWO
	nDGC9st8avQRUkVQtDJhQv4+eLLnEUE7EPJBM8D8Y+lBodOHzdTRaOh8iy3C9c0F7HWUNFQ1R8Y
	oZs9XRgxOMdktNsgIDljkkfznbU5ubrpKwH4zWr5yRaPKUjSNriO/rWZFboZ3JtiwUhS3OpdPep
	Vi0z3EVTm2zkMw1RdO599dPyMJm+w8wA2wUHsizO2zvHvYzdnwtomNvBIs9TKv+GZfSyABE01Yx
	oTPm/++JounCi8uR9C7RURo4ZnRGDDClIDo/ZXl24yrsylYLRtm
X-Received: by 2002:a05:6000:18c:b0:47f:7c50:2222 with SMTP id ffacd0b85a97d-47fec53259emr17005053f8f.24.1785998645277;
        Wed, 05 Aug 2026 23:44:05 -0700 (PDT)
Message-ID: <8c2e2d27-2802-4ba5-9b91-cb6cf8a5fa1a@suse.com>
Date: Thu, 6 Aug 2026 08:44:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] x86/nmi: Watchdog fixes/improvement Part 1
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
References: <20260805124525.105457-1-andrew.cooper3@citrix.com>
 <e1e873d9-6dc0-4e08-90f5-e99ff42802a0@suse.com>
 <49738195-ad6f-4889-984d-b1eeb5372708@citrix.com>
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
In-Reply-To: <49738195-ad6f-4889-984d-b1eeb5372708@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-bad1c0/1785998645-FC212034-CF05F789/0/0
X-purgate-type: clean
X-purgate-size: 4238

On 05.08.2026 19:56, Andrew Cooper wrote:
> On 05/08/2026 2:42 pm, Jan Beulich wrote:
>> On 05.08.2026 14:45, Andrew Cooper wrote:
>>> This is the start of a very long rabbit hole to address the
>>> mis-classification of some watchdog NMIs as non-watchdog NMIs.  For
>>> now, just some simple and hopefully non-controvertial changes.
>>>
>>> https://gitlab.com/xen-project/hardware/xen-staging/-/pipelines/2733861049
>>>
>>> Andrew Cooper (5):
>>>   x86/nmi: Drop {reserve,release}_lapic_nmi()
>>>   x86/nmi: Drop K7_NMI_EVENT
>>>   x86/nmi: Misc style fixes
>>>   x86/nmi: Check MSR_MISC_ENABLE for all Intel platforms
>>>   x86/nmi: Don't configure EvtSel repeatedly
>>>
>>>  xen/arch/x86/include/asm/apic.h |   2 -
>>>  xen/arch/x86/nmi.c              | 153 ++++++++++----------------------
>>>  2 files changed, 47 insertions(+), 108 deletions(-)
>> This series, once again, is putting me in a difficult position: Should I look
>> at it, or should I let it sit for two years or more, just like my earlier
>> fixes in this area [1], [2] are? (Of course, as always so far, I will look at
>> the patches, and I will likely also accept them going in ahead of mine. But I
>> cannot exclude that at some point I might actually stop doing so, seeing how
>> many of my patches are in that state. While at the same time none of yours
>> are, afaict, i.e. as per the track record that I keep of what still needs
>> responding to.)
>>
>> Yes, you did respond to [1], but is not being comfortable with a change really
>> a reason to block it, when it _is_ an improvement, and when the alternative
>> hasn't materialized in all the time?
>>
>> Jan
>>
>> [1] https://lists.xen.org/archives/html/xen-devel/2024-01/msg01365.html
>> [2] https://lists.xen.org/archives/html/xen-devel/2024-04/msg00194.html
> 
> I'd forgotten about these.
> 
> Patch 1, I'm (still) distinctly uneasy about, but I dispute your claim
> that it is an improvement.  You are adding complexity and not fixing
> anything AFAICT.
> 
> The watchdog counts NMIs (and counts incorrectly; this is the root issue
> I'm needing to fix).  A timeout is declared when a fixed number of NMIs
> (10, in default configuration) pass without the timer softirq having run.
> 
> The rate of NMIs varies with P states, including lower than cpu_khz, and
> differs between cores.  In some but not all hardware, we could switch
> from Unhalted Cycles to Unhalted Reference Cycles, but even that has a
> bit caveat saying that the definition changed in 12th Generation.
> 
> You are making the rate of the timer softirq dynamic, but it is an
> arbitrary fixed rate still unconnected to the rate of NMIs.

And I'm not claiming to address that (independent) issue. What the patch
does fix is a watchdog timeout occurring too early when a CPU runs in
turbo mode for perhaps an extended period of time.

> The only fix is to make it safe for the NMI handler to read real time. 
> Until that time, in a choice between your patch and saying "well don't
> set watchdog_timeout=1 then", I'd firmly favour the latter because at
> least it means there's less to revert when a real fix does come along.

As said in the description, if the ratio between max and normal is high
enough, even the default of 5 could be a problem.

> For patch 2, I had figured that bug out independently though inspection,
> and yes I do agree it's an issue.  I was debating removing
> watchdog_timeout=, and agree with that aspect of the patch.  However,
> watchdog_force needs deleting to fix the incorrect counting, and with
> your /* reset to defaults */ you're breaking the incremental property we
> have of command line parsing elsewhere; specifically "watchdog=force
> watchdog=10s" now sets force to false.
> 
> I will make sure to address this bug in my series, but I think it will
> be a fairly different patch when the other dust has settled.

Okay, we'll see if and when that arrives. With your intent to address
this differently, I don't see a reason then to try and adjust the cmdline
behavior. FTR, with watchdog= in particular I'm rather uncertain whether
the common (but unwritten) "incremental" policy is appropriate.

Jan

