Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FC2DC79F9F
	for <xen-devel@archiver.kernel.org>; Mon,  7 Sep 2026 09:17:28 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1410721.1641514 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x3VTS-0001QA-ET; Mon, 07 Sep 2026 09:17:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1410721.1641514; Mon, 07 Sep 2026 09:17:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x3VTS-0001Q3-BI; Mon, 07 Sep 2026 09:17:10 +0000
Received: by outflank-mailman (input) for mailman id 1410721;
 Mon, 07 Sep 2026 09:17:09 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x3VTR-0001Px-8I
 for xen-devel@lists.xenproject.org; Mon, 07 Sep 2026 09:17:09 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x3VTQ-004KDP-Hl
 for xen-devel@lists.xenproject.org; Mon, 07 Sep 2026 11:17:08 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a9e8110-e002-0a2a0a5209dd-0a2a450aa8e4-2
 for <xen-devel@lists.xenproject.org>; Mon, 07 Sep 2026 11:17:08 +0200
Received: from [209.85.128.47] (helo=mail-wm1-f47.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a9e8114-f2d2-0a2a450a0019-d155802fece6-3
 for <xen-devel@lists.xenproject.org>; Mon, 07 Sep 2026 11:17:08 +0200
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-49b0d8bc2aaso42208955e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 07 Sep 2026 02:17:08 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49cee6158e9sm380041265e9.12.2026.09.07.02.17.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Sep 2026 02:17:07 -0700 (PDT)
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
        d=suse.com; s=google; t=1788772628; x=1789377428; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nPhPvdW4Ysb7735tdEwrEe38QbozZ6fosusBrH1dFJ0=;
        b=XRcD+sNxZVslPqMCE0/rw20AA9J8+K7GvYxvAXIFkuxlVmd+W6meWCzAhGcIVKZXx3
         A0Knl9hML2Q+2ipX4CpQ4SgE6bbDwRxtQYRI87qCVGgnCnvDpc6W++sKlRxZFHQpy4O7
         lyyKtAHw5S5WTX1MD7Dn7f2EdbIiHpX7JUj+wpdxDFN3/yAV+BdAu+R1+YojrmCEMeYK
         Ll6ktpsl1cZYAIaSZAap5auPsB9khD8Gz8HA7zH1f3RJ+3rhDiNeuVVTQZDKjc2m9Csx
         e6KRQtJbldxFsWnugSdGFZQe4iaSGiBE8HqaEwx9V6i3LGBHosrBVCeBynnBnIlizjXI
         pnAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788772628; x=1789377428;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nPhPvdW4Ysb7735tdEwrEe38QbozZ6fosusBrH1dFJ0=;
        b=Pyq6zaC6QZyQd1bvePeEj2ep4Ue5U4OAixjF/h75pgqladnOnQn09YTCSBHtC/L/zY
         lbmUCu3jsr8YZlWRN2/4iTPNtBOMdwtBWXF1OdDS/lRcaXNutkUlftZ3zQ9nJy9FSuLQ
         +BhBUYt3CCo165z4ekP7VfpZTNvhacJ7hT+esWctqttp+lGejyN83XAYNUIkP+sb+6hv
         VPYWe3WvQanX1M6h5HvfIKePykDDVyX/pcbqI9j/wEy700Sup+971jjWTO+F4dQ2eEYq
         4HJazUR7sly+iHnkwvRMkvs2/7c4hHZZiqxij0Y+5h8hNjxbF8Y0Td9VsPpNEbIZ059V
         +pqQ==
X-Gm-Message-State: AFuF++m8rxkINxwWyU4xpGRl/Ag1ngopDHccAcXVF5gfMLQE+vA4vfPV
	AAQolRxuh6kKpFrIwY6272Q1JLyhjYhH8tQCEPAyBRUhYNHvX30iD91IXWNltj42/w==
X-Gm-Gg: AYBFou2QFKRm1JNafMDB0s/tz50flHzEL0sMzKS0jfLAaOEEZ2axjECJ7Zzv37c3vPO
	tgWWollMMEoEODz9XNGetoBYBG2W/EJoFntYBV2BdwvbDll+pLzl/6Dv6XCVooOASApr21nHIeI
	kZGE8RMA01Pk9Atcqf1yAr8sAcNLjSNEnJa/pFCLQUCEN5jAIUNvueViv5gSCmmd4cumFnjuS9T
	KwBQcUT3zyygImYn1pNkfg92f2s1VChsh174HI7VDs0MiSY7w0eKp6M7E/14PVvOjD9F55z1qTv
	JT7kaFty2iVIUWQJ8Dgf/DGNwaWceuIk1AuLWDi3ar0kZsLp4k9mC7jxBXPiGK4I8OT/oW19QwR
	ES1A5/SVd6MO9q89hm4OZS9Q7iG0I4y0crGOILgGYowLaeVlPN0pMYtuz2fd2AKd9560+ftcnKS
	k9ZrHYZdhaiEzKDZvtUrR+95psdFFdbPBH8VbxVIVaV9gJj7dE6YDymlkIQsnQG6EpPQ1DsPDcn
	3wMp+D6YEPLFmxPYpN1gkzBDWZ0wLXiazOfXdw8c0PhFQZ6MsoH
X-Received: by 2002:a05:600c:5394:b0:49c:fc6c:be0d with SMTP id 5b1f17b1804b1-49cffdc89e4mr153062075e9.19.1788772627863;
        Mon, 07 Sep 2026 02:17:07 -0700 (PDT)
Message-ID: <ee8a3cd9-0b05-4658-8b33-801f0335b67f@suse.com>
Date: Mon, 7 Sep 2026 11:17:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/vRTC: don't overrun array when storing century field
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>
References: <7a77f613-84b9-4049-804c-c3f53d804a38@suse.com>
 <ap58LqK_m1GyrMWK@macbook.local>
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
In-Reply-To: <ap58LqK_m1GyrMWK@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-4011c0/1788772628-58FC6CFC-775A201A/0/0
X-purgate-type: clean
X-purgate-size: 2630

On 07.09.2026 10:56, Roger Pau Monné wrote:
> On Mon, Sep 07, 2026 at 10:13:10AM +0200, Jan Beulich wrote:
>> rtc_ioport_write() has two writes of the new value, yet only one was made
>> aware of the century going outside of the array. Fold both writes by
>> changing the RTC_SET short-circuiting.
>>
>> Fixes: f2ff80877f66 ("x86/vRTC: support century field")
>> Coverity ID: 1700943
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>
>> --- a/xen/arch/x86/hvm/rtc.c
>> +++ b/xen/arch/x86/hvm/rtc.c
>> @@ -521,20 +521,22 @@ static int rtc_ioport_write(RTCState *s,
>>      case RTC_MONTH:
>>      case RTC_YEAR:
>>      case RTC_CENTURY:
>> -        /* if in set mode, just write the register */
>> -        if ( (s->hw.cmos_data[RTC_REG_B] & RTC_SET) )
>> -            s->hw.cmos_data[s->hw.cmos_index] = data;
>> -        else
>> +        /* If in set mode, just write the register. */
>> +        if ( !(s->hw.cmos_data[RTC_REG_B] & RTC_SET) )
>>          {
>>              /* Fetch the current time and update just this field. */
>>              s->current_tm = gmtime(get_localtime(d));
>>              rtc_copy_date(s);
>> -            if ( s->hw.cmos_index != RTC_CENTURY )
>> -                s->hw.cmos_data[s->hw.cmos_index] = data;
>> -            else
>> -                s->hw.century = data;
>> -            rtc_set_time(s);
>>          }
>> +
>> +        if ( s->hw.cmos_index != RTC_CENTURY )
>> +            s->hw.cmos_data[s->hw.cmos_index] = data;
>> +        else
>> +            s->hw.century = data;
> 
> Might it be best to do this based on the array size?  ie:
> 
> if ( s->hw.cmos_index < ARRAY_SIZE(s->hw.cmos_data) )
>     s->hw.cmos_data[s->hw.cmos_index] = data;
> else
> {
>     ASSERT(s->hw.cmos_index == RTC_CENTURY);
>     s->hw.century = data;
> }

We could do so, but then consistently (i.e. also in rtc_ioport_read()).

> I don't think we are going to use more indexes, but otherwise we could
> use a switch.

We will want to gain further indexes, for alarm day/month (as indicated
in a remark in the original patch'es submission).

I decided (in the original patch) against switch() because they're a
little odd to have inside a case block already covering the same
(strictly speaking: a subset) of the cases. But once the other two
fields are added, I think switch() will be the form to use.

>  In any case, this is a fix so I don't intend to delay
> it any longer, with either the current code or the suggested array
> size checking (if suitable):
> 
> Acked-by: Roger Pau Monné <roger@xenproject.org>

Thanks.

Jan

