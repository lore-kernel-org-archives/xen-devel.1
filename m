Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AED04C79FA1
	for <xen-devel@archiver.kernel.org>; Tue,  8 Sep 2026 10:56:11 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1411296.1641988 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x3tUS-0003jr-BY; Tue, 08 Sep 2026 10:55:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1411296.1641988; Tue, 08 Sep 2026 10:55:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x3tUS-0003jk-7q; Tue, 08 Sep 2026 10:55:48 +0000
Received: by outflank-mailman (input) for mailman id 1411296;
 Tue, 08 Sep 2026 10:55:46 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x3tUQ-0003je-A7
 for xen-devel@lists.xenproject.org; Tue, 08 Sep 2026 10:55:46 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x3tUP-00Goyj-Mr
 for xen-devel@lists.xenproject.org; Tue, 08 Sep 2026 12:55:45 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a9fe9b1-8faa-0a2a0a5109dd-0a2a4503b82a-2
 for <xen-devel@lists.xenproject.org>; Tue, 08 Sep 2026 12:55:45 +0200
Received: from [74.125.225.76] (helo=mail-wr2-f12.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a9fe9b1-fae8-0a2a45030019-4a7de14cafe5-3
 for <xen-devel@lists.xenproject.org>; Tue, 08 Sep 2026 12:55:45 +0200
Received: by mail-wr2-f12.google.com with SMTP id
 ffacd0b85a97d-482f6356256so439712f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 08 Sep 2026 03:55:45 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49cf7703cc7sm385441815e9.4.2026.09.08.03.55.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Sep 2026 03:55:44 -0700 (PDT)
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
        d=suse.com; s=google; t=1788864945; x=1789469745; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qNeMh7XzwyNa7ehNx2IeWsej1scrZpT0zI4y4PTC3Sk=;
        b=Iuffnznf0g+4MzaGq1BF/f+jQQuggVNZtRX9LI7qpZgMJmmyTK2qHj7nW8aHRzgiAy
         dYl4pcPYF+PUOP4AWdbY6UNimPFjAValMgry5uTg9FMYzKz495w/lrPN75q5ArbaL3Ql
         hCTh7MRUZcZQqY0SY020aoW09ezWC2nSua8Lka8z+HbYZO2CN8dHF0mRaTCa1ZfDFA/r
         tYfP5msgNdsyYVGg+dhxWqBa4aXCRr3JkYrLXCsq6nQChIdc9UChzBrGMeJ0hjoMGf2B
         lTbzi/jq2zbdb2yHuFAMhD4eaNpuMJ1wSV0TXakYbNN/3GWj1PgXXtHCFyXdpAu9RNaJ
         LqrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788864945; x=1789469745;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qNeMh7XzwyNa7ehNx2IeWsej1scrZpT0zI4y4PTC3Sk=;
        b=dexrnOyPiXbLyfumYPJadQtVo/XBrMgIhxxNNzVp2U6p2OrTOJ9GEbWoKFvecsVj2j
         w177CfzB0H/dBxvG5gkH920KzM9yU0FIGvwYsZEQPpXw4CP+O+5puMsR0SjvT8L7JxZQ
         c567Gj6uyJZkvp5MZgzgFz6i9VLZxdPPyI9NNKiFCKQqq5Q2Q8TmmtUlVxA/J8J9n4tf
         o3Jj89RVL5AcMNQzh1KATgQpUUbOE6MTZzKD4VwiYqXxdoaoDLlS7jaFHCLZorVQOwDO
         /3YFsZ0yiWFFCoiuhTh/t70jwfHXVCdUrP0VFmebYjCbl+F9kpb+nI/AlzA5f09s8T42
         MC7A==
X-Forwarded-Encrypted: i=1; AKwUvBw57o/8Xu+Y2mnM1WG+2framiTseunpIUDdcCumG6pbMZcw0fzu6Po6cLJ8Qb4w33YZaT/EW1W3KN0=@lists.xenproject.org
X-Gm-Message-State: AFuF++lcBu/OovR0Z7hdAE7h6kBKPq+naNKcbyonL34g8mtrNNUUeE7h
	kjupGGprA1PpjVJj6JHb3Mq8DjSke5sf/LqXYHdp87wmFUiT43ZP7oizyYsxJ4fm/Q==
X-Gm-Gg: AYBFou2R1qHMwWPor/lLvFSOopqJGuSzQnBJCtYpvMi16+wZtW5GahZBFdf7sgZbxfm
	P3ZaXivW1mrf+PFn4qlG0hfKoQsvSx1Vp9+gKX6bMBx/o0iyg/Vu4h6NFFzFGHxloXZZMu8Iibv
	WwInG6wYQ8Z8jI+xpWm8PFTaTp5YndVWnG7Y3uFP6qwBM8Bw0SmCoUir4fl6wOCmM6CVuoPm8Xq
	6m090Nc2qIAHXvPUu9HxXOTFgoEVye4TgAcfUEqo7hwb0Ck7w1fnCatvCEwsPGT7+4HHcKxP3zV
	V89Ge7j7PJFuxcW+RAwtmPoHsJKCcAbuxTp1ib4qBnE5m2lmaBTqEhY33E+72tUYmrR7Vwt3Av+
	1jTX2UhusjLBClv/PxInWmccd82yvQT6y0meRArrvus4ksx5EqpjvRTrZbUJZYeXW2BuJq+mwjd
	ddA0zpnyWSkbV+piV3eJX+yFzs4cuv3b+JbTVzW9jtfXVhOcWFwgPelES7LKqoLEu3GDUrOZPZ9
	Mksza2jz4SuvXI1ng+AYFf8u+xzhctFC3kOEQKjRarGR+Yq+vHMx+2L75BlKw0=
X-Received: by 2002:a05:600c:a01:b0:49d:1916:2133 with SMTP id 5b1f17b1804b1-49d1916215amr38415655e9.8.1788864944747;
        Tue, 08 Sep 2026 03:55:44 -0700 (PDT)
Message-ID: <70dd9e38-bc54-4532-b310-cb9fb3d3f2ce@suse.com>
Date: Tue, 8 Sep 2026 12:55:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] x86/ucode: Work around Granite Rapids erraturm GNR98
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Teddy Astie <teddy.astie@vates.tech>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20260907213231.3159241-1-andrew.cooper3@citrix.com>
 <a11ec239-460b-4509-beee-4f65063ef336@suse.com>
 <6a54806f-061b-4b76-b42d-6fa5b54581e4@citrix.com>
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
In-Reply-To: <6a54806f-061b-4b76-b42d-6fa5b54581e4@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-33051d/1788864945-7468B4E9-0B25B350/0/0
X-purgate-type: clean
X-purgate-size: 3748

On 08.09.2026 12:08, Andrew Cooper wrote:
> On 08/09/2026 7:26 am, Jan Beulich wrote:
>> On 07.09.2026 23:32, Andrew Cooper wrote:
>>> @@ -273,6 +274,44 @@ static bool microcode_fits_cpu(const struct microcode_patch *mc)
>>>      return false;
>>>  }
>>>  
>>> +static bool microcode_safe_to_load(const struct microcode_patch *mc)
>>> +{
>>> +    struct cpu_signature *cpu_sig = &this_cpu(cpu_sig);
>>> +
>>> +    /*
>>> +     * Treat pre-production as always safe - anyone using pre-production
>>> +     * microcode knows what they are doing, and can keep any resulting pieces.
>>> +     */
>>> +    if ( (int)cpu_sig->rev < 0 || mc->rev < 0 )
>>> +        return true;
>>> +
>>> +    /*
>>> +     * GNR98 states that Granite Rapids systems hang when loading new ucode on
>>> +     * sufficiently old firmware.  GNR101 retroactively declares that one
>>> +     * ucode had incorrect min_rev fields, in light of discovering GNR98.
>> We still have no min_rev field, so imo a reference to it wants some
>> clarification.
> 
> No, I don't think so.  The fact Xen has no min_rev field (yet) has no
> baring on the wording of GNR101.

The wording there is "Minimum Runtime Microcode Update Revision". As long
as we don't have a field of the name, how can such a comment be unambiguous?

>>> +     * Both are incomplete statements of the problem.
>>> +     *
>>> +     * At the time of writing (August 2026), the believed safe sequence is:
>>> +     *   0x01000370 -> [0x01000380...0x010003f3] -> 0x01000405 -> any later
>>> +     *
>>> +     * Disallow known-unsafe loads while permitting believed-safe loads.  For
>>> +     * GNR, this allows multi-hop loading to get up to the latest.
>>> +     */
>>> +    if ( boot_cpu_data.vfm == INTEL_GRANITERAPIDS_X &&
>>> +         boot_cpu_data.stepping == 1 && (cpu_sig->pf & 0x95) &&
>>> +         ((cpu_sig->rev < 0x01000380 && mc->rev >= 0x01000405) ||
>> This is odd: The lhs of && uses the lower bound of the inner permitted
>> range, while the rhs of the && doesn't use the upper one. If it's intended
>> that way, I think this also needs clarifying in the comment. Otherwise imo
>> lhs and rhs better would be consistent in this regard.
> 
> It is intentional.  Furthermore, it is the only coherent way of
> expressing the sequence as given.
> 
> I'm not writing a comment explaining why it's a good idea to use the
> same boundary numerals between the comment and the code.  It goes
> without saying.

But that's the problem - code and comment are not (obviously) in sync.

> I'm also not interested about pureness concerns about inner vs outer
> bounds.  I can't see a change here that won't make it worse.

So why are

         ((cpu_sig->rev <= 0x01000370 && mc->rev >= 0x01000405) ||

and

         ((cpu_sig->rev < 0x01000380 && mc->rev > 0x010003f3) ||

both worse? Both 0x01000370 ... 0x01000380 and 0x010003f3 ... 0x01000405
are discontiguous, which is bad enough. If then you pick apparently
randomly (and in any event inconsistently) from the possible boundaries,
how can that help the situation (and be "the only coherent way of
expressing the sequence as given")?

Even if it's merely a matter of us disagreeing on what "consistent" or
"coherent" would be here, doesn't me as the first reader not easily
spotting the "coherency" you claim already indicate there is a
(possible) issue? (For context: Whichever way the expressions are going
to end up, they'll make implicit statements on the gaps, i.e. on the
non-public 0x01000371 ... 0x0100037f and 0x010003f4 ... 0x01000404. You
may say that doesn't matter, because of their non-publicness, but that
won't make that implicit statement go away.)

Jan

