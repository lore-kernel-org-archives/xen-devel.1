Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6989C624DE
	for <xen-devel@archiver.kernel.org>; Fri,  4 Sep 2026 08:29:22 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1407999.1640749 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x2PIN-0003pj-3q; Fri, 04 Sep 2026 08:29:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1407999.1640749; Fri, 04 Sep 2026 08:29:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x2PIN-0003pc-0w; Fri, 04 Sep 2026 08:29:11 +0000
Received: by outflank-mailman (input) for mailman id 1407999;
 Fri, 04 Sep 2026 08:29:09 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x2PIL-0003pU-EY
 for xen-devel@lists.xenproject.org; Fri, 04 Sep 2026 08:29:09 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x2PIK-00HC8J-RZ
 for xen-devel@lists.xenproject.org; Fri, 04 Sep 2026 10:29:08 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a9a8153-e002-0a2a0a5209dd-0a2a450c871a-6
 for <xen-devel@lists.xenproject.org>; Fri, 04 Sep 2026 10:29:08 +0200
Received: from [209.85.221.50] (helo=mail-wr1-f50.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a9a8154-f479-0a2a450c0019-d155dd32cd40-3
 for <xen-devel@lists.xenproject.org>; Fri, 04 Sep 2026 10:29:08 +0200
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-48441a2ba14so632948f8f.1
 for <xen-devel@lists.xenproject.org>; Fri, 04 Sep 2026 01:29:08 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-485883acd33sm4696290f8f.18.2026.09.04.01.29.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Sep 2026 01:29:07 -0700 (PDT)
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
        d=suse.com; s=google; t=1788510548; x=1789115348; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fv1Hle5ICcjsbv9RdoU1hWsZEcqlLyhQcR0STYSRl+Q=;
        b=Gz7XOSv5FXoyXJeClB9QFhNzwvrdawBjYINGAaSIxd9YTKxUrPbGV46lDJCkU7rb7z
         gmOCSsmojNBbCvlBGZzJBghhnCpXw2zGIJQs1dKKs4brA6H3VTbXeM7eBmQn4ksOeWkP
         4FkqE+csJG93zu6DtsbKg3S7buRVRvjGdFSdfRL1qNtOwOy7fyKz84Qt0TTSciGyYd3m
         qoaNi0HnQSfdRqmqxhYKkIZ0waZzCkEy+a5Wa1uJU0epJcwIDEtMrCMh8W+vWTNDBRMf
         eUeJXzdhkGXYrfoyWWvQG8BREZ9XDz/OS7gJNO2aTcHtyHyv1gshhPn1Bb5xLM75Xyjb
         dnDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788510548; x=1789115348;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fv1Hle5ICcjsbv9RdoU1hWsZEcqlLyhQcR0STYSRl+Q=;
        b=AlOgZOvZi2hvwxE1mgovJB3Ld3ZDDOw5/vlpWHwlDbEtYShNZucaAuFC3i5xLx5rjn
         QCcRG/AAVVxKFfYfq2Yuxx2zJVMdCZ5EXSwdz48iz8UOUAS5WgFymPGIgg25MD1qFz/z
         xnvEO334CHStOgMioTRSeJSV1t/DLiAyEckBy3Ize+4+u7yuW7geedSA5oz9rm1IzqPG
         FX7WxR2ip7GTNDXyrbbiQg02Ra1rCTZR84uRJlctmbD15CaSWDGkoEllMf/ImtwC48SH
         dfzCG5ezs4AN7JHIYObPFpmvkgtiBYQaibZUJ6FWVIgJ52/75wLspwfrMyixU0XSNdaG
         mFqQ==
X-Forwarded-Encrypted: i=1; AKwUvBzFQQX3x2HAj+07scpeHscR6XWBmgmWdq7Dq9SaP1aqc/lgecYvw+j77rVRcXgWoVVxPjJaT0kLDQQ=@lists.xenproject.org
X-Gm-Message-State: AFuF++mkvwQFnUywUfBUvrli4CtDj6WDVa7ckZBVJdS/MwtArwwsEd9i
	ZIsKHF/cRXm9No6YCkpUhJZffKlTWwtd+nwTwCjmpgwqEk1Q4kGE+ZDAikFNSjWOrl7Lbct4oG3
	SLXmt2w==
X-Gm-Gg: AYBFou0mktg4HCtXYyMiHZZuFTVwP/B3eIJwji23xgkrDzZ2AWzCkBAo52OZEc6t52L
	m1SyLlkNZh4J8MoxZfxZDFVRpjKHMzggbKXYdQduLuuA0Hm5yj7T3fukflJteeIg+gVriOmk6AK
	utmZTeO0cgjnFpXuD57wbe39qE8T69kmHz0ajPQ/sLdnvhfSjxit9svONu2q4QiBvTb1aKwIeYX
	dnlh9rqQAInPDJmOaA8SXyXBVIjTKOoSkYKe3TMxEb02M/FsOk/rnEXoc8M7cg/TJ3rmZ1FD1ty
	YOoCV6ckv7WHyGIGv1FgDPYmmlEbD4uAwSjKGqFgA1a4vCedxOuc06HZG/SeokrC7od+roCJAua
	/SQExB9NBBiRflVDkmtbc06Xss9yFnUoQKQSHiFDphcDLbPq2iLpWNpu7oxkNlu236OUm04eI27
	Uf6dwLkQdMEAG55XCZdpM2celJGsKiODS+ZFGm1kbJOWynWzcKPLEFLip/6vZLqZ+MnpbRZvU5D
	PxGRq4KUYA+d8pDVJtuoYImQ5ExIXPgb0s6v/bEEz4z5hNXDFSc
X-Received: by 2002:a05:6000:2f88:b0:485:8a46:704e with SMTP id ffacd0b85a97d-4858a4671cemr2714258f8f.32.1788510548107;
        Fri, 04 Sep 2026 01:29:08 -0700 (PDT)
Message-ID: <f413cc9c-cef5-4f85-b232-15e3c64f2a45@suse.com>
Date: Fri, 4 Sep 2026 10:29:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/14] x86/pv: use populate_perdomain_mapping() to map
 the Xen GDT
To: George Dunlap <dunlapg@umich.edu>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Alejandro Vallejo <agarciav@amd.com>, Teddy Astie <teddy.astie@vates.tech>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org,
 =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
References: <20260901-asi-part2-0-ecc269f268b7@xenproject.org>
 <20260901-asi-part2-3-ecc269f268b7@xenproject.org>
 <554687e3-1fab-4d23-9a4e-0bdc3bc1fc60@suse.com>
 <CAFLBxZYqOWkd60As00ytcNqTZg99Gu220OMrse5MXYgOHfx0Pw@mail.gmail.com>
 <07d332a4-a5a3-44d4-95ce-fc67d86edacf@suse.com>
 <050f44ec-47e5-4754-b73b-1173458736b0@suse.com>
 <CAFLBxZZ+-GsTLDMoiBpAda6U-T-M70wHjAK9EqKZCZdK2VAknw@mail.gmail.com>
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
In-Reply-To: <CAFLBxZZ+-GsTLDMoiBpAda6U-T-M70wHjAK9EqKZCZdK2VAknw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d25034/1788510548-50D3CA5B-518E7308/0/0
X-purgate-type: clean
X-purgate-size: 6371

On 04.09.2026 10:06, George Dunlap wrote:
> On Fri, Sep 4, 2026 at 7:54 AM Jürgen Groß <jgross@suse.com> wrote:
>>
>> On 04.09.26 08:00, Jan Beulich wrote:
>>> On 04.09.2026 00:35, George Dunlap wrote:
>>>> On Thu, Sep 3, 2026 at 5:11 PM Jan Beulich <jbeulich@suse.com> wrote:
>>>>>
>>>>> On 02.09.2026 11:43, George Dunlap wrote:
>>>>>> From: Roger Pau Monné <roger.pau@citrix.com>
>>>>>>
>>>>>> Currently, update_xen_slot_in_full_gdt() uses the stashed direct-map
>>>>>> pointer in d->arch.pv.gdt_ldt_l1tab to update the incoming vcpu's
>>>>>> page tables with Xen's GDT, by writing a stashed per-cpu copy of a
>>>>>> pre-baked L1 entry (either 64-bit or compat version).
>>>>>>
>>>>>> Switch this to using populate_perdomain_mapping(), which doesn't rely
>>>>>> on the stashed address of the l1 page in the direct map.  Rather than
>>>>>> also stashing a pre-baked value for the payload, compute the mfn from
>>>>>> the per-cpu GDT pointer at use: the conversion is a handful of cycles
>>>>>> on a path costing thousands, and computing at use removes the
>>>>>> parallel {,compat_}gdt_l1e bookkeeping along with its boot-ordering
>>>>>> constraint (the cached value could only be generated after Xen's
>>>>>> physical relocation, and had to be in place before the first context
>>>>>> switch; a use-time lookup is correct by construction).  The flags on
>>>>>> the final mapping are identical.
>>>>>>
>>>>>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
>>>>>> Assisted-by: Claude Code:claude-fable-5, Claude Code:claude-opus-4-8
>>>>>> Signed-off-by: George Dunlap <gwd@xenproject.org>
>>>>>> ---
>>>>>> Changes in v2:
>>>>>> - Drop the {,compat_}gdt_mfn caching entirely (suggested by Andrew
>>>>>>     Cooper): compute virt_to_mfn() from the per-cpu GDT pointer at use.
>>>>>>     The PDX lookup behind it measures ~5-10 cycles warm against a
>>>>>>     ~1,500-cycle context switch, and this removes the double
>>>>>>     bookkeeping and the after-relocation caching constraint.  The
>>>>>>     cached-MFN assertion goes with the cache: a use-time computation
>>>>>>     from a live pointer needs no staleness check.
>>>>>
>>>>> This looks to contradict what 564d261687c0 ("x86/ctxt-switch: Document
>>>>> and improve GDT handling") used as justification to put in place the
>>>>> caching. Also Cc-ing Jürgen, who also was involved there, for possible
>>>>> further insight.
>>>>>
>>>>> Functionally the change looks okay to me, but the above will need
>>>>> sorting, at the very least by specifically discussing why effectively
>>>>> undoing that earlier change is okay.
>>>>
>>>> So looking back at the thread, Jürgen measured a 14% improvement for
>>>> something that might be described as a microbenchmark before and after
>>>> the patch (a benchmark purposely trying to set up an unusual scenario
>>>> to maximize the effect of context switch overhead, not one to
>>>> represent a typical workflow).  But are the numbers really plausible?
>>>> Even at an implausible 100k switches/s across the box, saving 100
>>>> cycles per switch is about 0.04% of eight 3 GHz cores.
>>>>
>>>> At any rate, we're already adding several map/unmap operations, and
>>>> about to add several more.  Keeping the PTE caching would require
>>>> adding a separate path that can write just PTEs, which then will
>>>> potentially further complication future paths where we need to make
>>>> sure we handle both domain-wide perdomain areas and per-vcpu areas.
>>>> If it were easy I would already have been keeping it.
>>>>
>>>> I'd be inclined to say: Since we're going to be adding more
>>>> populate_perdomain_mapping() calls anyway, let's do it the simple
>>>> correct way first; and then explore the idea of stashing mfns of
>>>> frequently-mapped L1s (rather than having to walk L3 -> L2 -> L1); and
>>>> at that time look into stashing baked l1es to avoid conversions.
>>>
>>> Perhaps; I'd like to have Jürgen's and/or Andrew's input here, though.
>>
>> At that time I implemented core scheduling in Xen. I noticed that very
>> subtle changes in the context switch path could result in unexpected large
>> performance differences. As I had the performance test for my purpose
>> already set up, I used it for Andrew's patch (which was a result of my
>> context switch path performance findings) and really did measure the
>> impressive effect of it.
>>
>> Note that you can't only count instructions, often cache effects and
>> branch predictions are dominating the performance.
> 
> Right, but:
> 
> 1. That's going to be very much hardware- and workload- dependent.
> Even on the same hardware, if you'd made a slight change in the
> workload, you might have seen a very different result; and on
> different hardware you're going to see something different again
> 
> 2. As I said, we're now adding two extra map / unmaps, which is going
> to perturb everything again.
> 
> If anything, your argument says we should wait until we've stopped
> modifying the context switch path (which won't happen until patch 49
> at least, guessing from the patch titles), and then measure things
> again to see what's actually slow.
> 
> I'm sorry Jan,

You were replying to Jürgen, though.

> your position here is really inconsistent:  You wave
> away a partial pagetable walk with three map/unmap operations on the
> context switch path as something we'll have to do in the interim, and
> can optimize later, but are now threatening to make me add in
> special-case codepaths and run tests to save a few memory reads and
> shifts.

I think you misunderstood. There was a concern raised already on v1,
and that concern wasn't covered by the patch description. In my initial
reply I said "Functionally the change looks okay to me" for a reason,
after all.

Jan

> I could put back the mfn caching that was present in v1 of the series
> (which Andy said was probably not sufficient, on balance, to make the
> duplication involved worth it).  Even that I think isn't really
> sensible, but it's not too difficult to do.  To isolate the PTE
> caching effect I'd have to write an entire duplicate codepath anyway,
> and then try to duplicate Jürgen's test.  I don't think that's really
> a reasonable ask at this point in the series.
> 
>  -George


