Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90E5FC624D0
	for <xen-devel@archiver.kernel.org>; Wed,  2 Sep 2026 09:03:01 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1405384.1638882 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1grn-0001hk-H4; Wed, 02 Sep 2026 09:02:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1405384.1638882; Wed, 02 Sep 2026 09:02:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1grn-0001hc-Dc; Wed, 02 Sep 2026 09:02:47 +0000
Received: by outflank-mailman (input) for mailman id 1405384;
 Wed, 02 Sep 2026 09:02:46 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x1grm-0001hV-Gu
 for xen-devel@lists.xenproject.org; Wed, 02 Sep 2026 09:02:46 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x1grl-00EUJq-K0
 for xen-devel@lists.xenproject.org; Wed, 02 Sep 2026 11:02:45 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a97e62e-2eae-0a2a0a5409dd-0a2a45039c26-40
 for <xen-devel@lists.xenproject.org>; Wed, 02 Sep 2026 11:02:45 +0200
Received: from [209.85.128.49] (helo=mail-wm1-f49.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a97e635-fae8-0a2a45030019-d1558031e997-3
 for <xen-devel@lists.xenproject.org>; Wed, 02 Sep 2026 11:02:45 +0200
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-49cd77e0f95so8391575e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 02 Sep 2026 02:02:45 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49cdce44ea9sm127452685e9.14.2026.09.02.02.02.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Sep 2026 02:02:44 -0700 (PDT)
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
        d=suse.com; s=google; t=1788339765; x=1788944565; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zW5oa0KHC7eTQ+QsWj8IgZyoVT8vrQRPdx9BJfewjZI=;
        b=YWXq4XQ6PaeBFnTv1SqbqMwrYUa1Fax7566HS0YNygI3hmAVfeAyGDhAQ04I+t7Zi4
         q+mLMwFlf2++PWEfGGsFU7OKrI7drsRZnsNeq5EAoPg7TlJTe+rnuClp4fmstpQKDiBY
         LwEF7WB/WkKZleV0HXh0NYIAoEXXwQ7pFBTJUsazcK/gVLhnpsEIOW8jM/xXXkfe8iCu
         4p+Z+jhW74pOrSCPg7+mvoJpSY/OKJU41Il3kcS4JUrfoR/h4ez5276xbUxiGxHjR/yc
         e7ssZM+SJ0C+EZtS09yYByDQCX8b3IwKaGjKpC8KmDJLvIpeO0RkCjrgyTEV/Sw62623
         Zd4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788339765; x=1788944565;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zW5oa0KHC7eTQ+QsWj8IgZyoVT8vrQRPdx9BJfewjZI=;
        b=nrZgKmSq2z/1LsTMOSfroK4mFoWIXhnGorgViUQepZ04Xurg3QNiBzsbqEzwkL7oQH
         PN3uVdHD+OZDvwZwLobrkYAbg0cugp5jJ24HFBYuOn4GW8tBtdeXEaJbAcosHRGM6NGH
         QtRFoRgm65LRojkqNKdvK2/AIjHCXxfacQ9XyZywXSXrvPhSEproJzuoQJLlGESL5/h4
         hdKdfsUr5pVyN99UalSPc3Ih2yA8ok+o6tBLC5LkcRQmoCe2c9wEBICb9oG1RWevEIuH
         CsnxZc/byBKeaD5wJH2VZq/4RQjUfh/fW/fcGVPf7QwJRjFjy8MTFUq3e9E6ZzXiYxpc
         JFqQ==
X-Gm-Message-State: AFuF++mxYjobBb6kPEeKN15gGZ5RHwBVgA2U2l90oXyrKEtLZWwbnChY
	rvKsNjmY9v1tsOeOKYwK9RkvMGzcp8wuAs+Eod22M22ymCxil4zJiU495/pb+Ey8yA==
X-Gm-Gg: AR+sD13m4EEBH/u95THBVIwlkX3X0Lc4lYazIQq0d77icxMgtbs+IMrzeFsWBr/bZ1i
	XjDDr4zagVQ/Z56+1zarDeaYjrNZc2dCsPr+xFHNHd/2y7dJLmlN2XI21ugLbeepj5zdnLQ1UV3
	q1dcQ88Z7rgqGbk4pSOmPvLnMpFBR33A929c6YizKTgL0m6JWTugGLKsqg2atIH1bTuujBFImyR
	4hPERENltrrxWgQZXkpypz7GExX7D3aIloSxOOnk7bWjpE2T6xlt4LDIORIvtN014Hdn5Nfm4NC
	omreDLywDhmFADKnaNnrKkdY4yep26uTXQNhHGr3YtglsLlO5hUEwppxvzPiRCatYxScoeoEvTu
	hknaEIUKA7VtWMLQitBOoeGULKDXELh/6134jyJaILrYiT2IbwPTVeDfQF1M7k8dkS+c0Otxdvo
	9ZbDBRjS6B95Kp83hMaU+3sBDLDvg4e2Nx73G4oupxOUSfVrnxznHvXSj0dN7krJd4Pttsd2jlk
	D8PE+642LTnzXLa2C9vkgz0Wm8i1QUW8jz4aLn9WJdyyUXT1bnB
X-Received: by 2002:a05:600c:4f0b:b0:493:bd2a:93be with SMTP id 5b1f17b1804b1-49ce581316dmr46207105e9.6.1788339764623;
        Wed, 02 Sep 2026 02:02:44 -0700 (PDT)
Message-ID: <6dd4c596-aebd-4488-94da-35fb9d85d6ac@suse.com>
Date: Wed, 2 Sep 2026 11:02:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] x86/time: CMOS RTC may run in binary mode
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>
References: <79d50725-3892-4643-b854-bfec9c0c0d79@suse.com>
 <5945d8f4-aece-4572-8e89-60408dd7ac32@suse.com>
 <ami73Z1LlnWwcDy5@macbook.local> <apfYcf9zYIsEo0tk@macbook.local>
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
In-Reply-To: <apfYcf9zYIsEo0tk@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-33051d/1788339765-774F44E9-491AD829/0/0
X-purgate-type: clean
X-purgate-size: 2433

On 02.09.2026 10:04, Roger Pau Monné wrote:
> On Thu, Jul 02, 2026 at 11:29:11AM +0200, Jan Beulich wrote:
>> --- a/docs/misc/xen-command-line.pandoc
>> +++ b/docs/misc/xen-command-line.pandoc
>> @@ -339,6 +339,14 @@ parameter to "stable:socket".
>>  Specify the event count threshold for raising Corrected Machine Check
>>  Interrupts.  Specifying zero disables CMCI handling.
>>  
>> +### cmos-rtc-bcd (x86)
>> +> `= <boolean>`
>> +
>> +> Default: `false`
>> +
>> +Flag to indicate the CMOS Real Time Clock uses BCD mode irrespective of
>> +control register B indicating binary mode.
>> +
> 
> Likely too late for it now, but I get the feeling we should have
> introduced a cmos option, with rtc-bcd and rtc-probe as boolean sub
> options:
> 
> cmos = [ rtc-probe, rtc-bcd ]

I was thinking the same - would be nice, but here we are.

>> @@ -1353,6 +1356,48 @@ static bool __init cmos_rtc_probe(void)
>>      return false;
>>  }
>>  
>> +static inline bool __init attr_const is_bcd(unsigned int x)
>> +{
>> +    return (x & 0xf) < 10 && (x >> 4) < 10;
>> +}
>> +
>> +static void __init cmos_rtc_probe_bcd(void)
>> +{
>> +    bool bcd;
>> +    unsigned long flags;
>> +
>> +    if ( opt_cmos_rtc_bcd )
>> +        return;
>> +
>> +    spin_lock_irqsave(&rtc_lock, flags);
>> +    bcd = !(CMOS_READ(RTC_CONTROL) & RTC_DM_BINARY);
>> +    spin_unlock_irqrestore(&rtc_lock, flags);
>> +
>> +    if ( bcd )
>> +        return;
>> +
>> +    for ( unsigned int seclo = 0; ; )
>> +    {
>> +        struct rtc_time rtc;
>> +
>> +        if ( !__get_cmos_time(&rtc) ||
>> +             !is_bcd(rtc.sec) ||
>> +             !is_bcd(rtc.min) ||
>> +             !is_bcd(rtc.hour) ||
>> +             !is_bcd(rtc.day) ||
>> +             !is_bcd(rtc.mon) )
>> +            return;
>> +
>> +        if ( seclo > (rtc.sec & 0xf) )
>> +            break;
>> +
>> +        seclo = rtc.sec & 0xf;
> 
> Is there a risk of this loop triggering the watchdog, and hence we
> should process softirqs in the loop? (or otherwise have some kind of
> hard loop stop after certain iterations / time)
> 
> Oh, I now see the mention in the commit message and also note this is
> done ahead of SMP and also ahead of the watchdog being enabled, hence
> it can't trigger the watchdog.

Right. I can't conclude whether you're asking for any change here, as
there also was no ack.

Jan

