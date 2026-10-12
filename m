Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22679CA9ED0
	for <xen-devel@archiver.kernel.org>; Mon, 12 Oct 2026 11:51:44 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1446195.1662261 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGEZ0-0007hM-GN; Mon, 12 Oct 2026 11:51:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1446195.1662261; Mon, 12 Oct 2026 11:51:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGEZ0-0007hF-CM; Mon, 12 Oct 2026 11:51:30 +0000
Received: by outflank-mailman (input) for mailman id 1446195;
 Mon, 12 Oct 2026 11:51:29 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xGEYz-0007h9-9c
 for xen-devel@lists.xenproject.org; Mon, 12 Oct 2026 11:51:29 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xGEYy-005Lve-JB
 for xen-devel@lists.xenproject.org; Mon, 12 Oct 2026 13:51:28 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6accc9bf-e002-0a2a0a5209dd-0a2a4502e560-8
 for <xen-devel@lists.xenproject.org>; Mon, 12 Oct 2026 13:51:28 +0200
Received: from [209.85.128.45] (helo=mail-wm1-f45.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6accc9c0-6ca4-0a2a45020019-d155802df040-3
 for <xen-devel@lists.xenproject.org>; Mon, 12 Oct 2026 13:51:28 +0200
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-4a0286c981dso15134635e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 12 Oct 2026 04:51:28 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a18bf15691sm277547805e9.6.2026.10.12.04.51.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Oct 2026 04:51:27 -0700 (PDT)
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
        d=suse.com; s=google; t=1791805888; x=1792410688; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=irOwJY1JOjLr8/BHy410NgY+hsN7f/fx9vptjCrEGr0=;
        b=MqsfKdhPsBReH1u1kENLkh4v2VvkqxlGiWP8amJvEfrJy8NSSE0K7wW7UK2VmIMH5k
         23CHFj9jwuzx94TkPl6ChFp4iC+F8GdjiaNfoTpy2QwuRpExVadc/pR+2IyrAdcttImr
         eJB0JrJvpjLa3iX/+yImH3rXSDHwY36Rqg/Sn5rj4kqyfuuBPeep/qt8TgekfL4LX2ON
         iwJoiYzZ5x+TLBldSD7q4JlOBDG7iSQwa4+nqMBzz0eExRWtUxr8D91Fpgj6cu6TuVvU
         2ZFnqMUvAr2vT4fG9nyWQH9c7KqX9xAMrktJkaTOLQ4MLDjgoRUzs3Bq5vOiKWYFzcJF
         FuAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791805888; x=1792410688;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=irOwJY1JOjLr8/BHy410NgY+hsN7f/fx9vptjCrEGr0=;
        b=Ap1T4MdyCV4AhvbBF5ADq3RyPoAMchV1celZ8jXlqgaTCWl7q9hkNhs1rUatrHtLs8
         SV8p3mslOR5elSpaTBBiL6lX6XmpNHuzTlWcu9QstowCsrdTTHFLdqLZFgobPLdv8duj
         LIftvp23d2Gxt/W1bj0DJIrxrhUX/V7LbxsdG+fGNfdR2ay6Pcf4F6B9fdBwSlWtKzAq
         b/valAQl8qq9E9AXdpG3ZfnmL4urKCvDVI44K0w/1BxdP81Fh9qpsm+TE2i4AMD8Pyei
         5lr6/42RKOTseDnaEFwcgmW6JEIkFxuGD1WwhVSy12h5XQgKYaOByLNcELPAwh4biEaQ
         u1iQ==
X-Gm-Message-State: AFq9FYI9C5aVzm46gVci2TrZ+qmm2jGpYd/QHK8gtL2L5SmyZhNQjexJ
	2abjHcK/xT/F3LTye6xcqLE1UmL9SUduGwqoOVAQXUINadh1/gzR59IlMx8rGdOevQ==
X-Gm-Gg: AYBFou3+SFZZEXeoeuLtTEaO0I2rxeBtTXk5dpQ05UeRtUbtD1PUacyulCGRJwdvROH
	oJYnFONAA1OKImRRWHvcIIueEmRGaKd2BldOMt9DWB+hPuu2wDpDq9Sx+7TBRsxWrTbuV/ZxU3e
	fS1BcootXsffWRNMHuuA9cqFQ3eAiYNVG7idYfCPhM1LdQ8CZSNI7nfD76nKbboWynlcygH9WJg
	m+0Fs9poFBDrhBlg6RC7XQcC1UrBAef3sLb9razvf4ScM02KXSyUiEPmrC3WQUGx9D9Aa3eBLnx
	cElFS/CfcK339PvwiSTZwkXNKtEAa1JnNgM5rNxsXYBVYZspA95LRKqpQnncJBbq7KZBF251nBf
	oyC5keB6mmF3rP1+povr29GMXPK47UPor1SMt7ijwWIzsGA/e3weNedfi6WhVnbZQSkp2/9RVFL
	1qQ9ZSk8sJBWccufzFxabCJ4874WHKbWBGJBne/4W/Xkq6tBT4Pcc0iub5Bgk2hfLxWP9mBywX0
	/WRP3mMMwykKotG0lLy6cPgiKru+kQKUgkQ7oCRjUZocacpJC9ettxbKiVEbus=
X-Received: by 2002:a05:600c:a016:b0:4a1:a44d:1d5 with SMTP id 5b1f17b1804b1-4a1a44d0221mr15259925e9.9.1791805887685;
        Mon, 12 Oct 2026 04:51:27 -0700 (PDT)
Message-ID: <90fbdbb4-be0c-4916-926e-0327a73b082d@suse.com>
Date: Mon, 12 Oct 2026 13:51:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/15] x86/setup: special treatment of initrd for PVH Dom0
To: George Dunlap <gwd@xenproject.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>
References: <1b4c2bb4-118d-497c-8d7d-f3824fd61a73@suse.com>
 <125982a7-f491-4a10-98e9-d31f9f3b6444@suse.com>
 <CAFLBxZaArNWG6G-OQ7oEvHFRaZ-UjwmyjyuustuJggt48+qHpg@mail.gmail.com>
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
In-Reply-To: <CAFLBxZaArNWG6G-OQ7oEvHFRaZ-UjwmyjyuustuJggt48+qHpg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-720697/1791805888-321D72AC-914782B5/10/78276251493
X-purgate-type: spam
X-purgate-size: 5025

On 12.10.2026 13:23, George Dunlap wrote:
> On Mon, Oct 12, 2026 at 9:20 AM Jan Beulich <jbeulich@suse.com> wrote:
>>
>> Dealing with large initrd-s is problematic in two ways: We needlessly
>> copy around a large chunk of data, and our calculation of how much
>> memory to give Dom0 assumes the space taken by the initrd is actually
>> available at the time of populating Dom0's P2M.
>>
>> As a first step, make effort during early boot to try to place the initrd
>> in a chunk of memory that's a multiple of 1Gb (or, if not available / not
>> possibly going to fit, in a chunk a multiple of 2Mb in size). This may
>> (but generally won't) result in more copying, which we simply need to
>> accept. Record (and use) the extra space allocated in (as) headroom, which
>> then needs accouting for in pvh_load_kernel().
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> Not being able to check bm->kind is of course not very nice. The field is
>> only set quite a bit later, and that setting can - afaict - not be moved
>> ahead of the call to xsm_multiboot_init().
>>
>> The bumping of mask to L3's in __start_xen() transiently breaks booting of
>> Dom0 with overly much memory assigned to it. That'll be resolved when the
>> headroom space is properly dealt with (consumed into Dom0, or freed).
>> Therefore this patch and everything up to the one adding the consuming
>> code want committing together, or addition of that conditional wants
>> delaying until that later change.
> 
> I'm generally opposed to breaking bisection.  I'd personally prefer an
> extra conditional until then, but I'd defer to the other maintainers
> on that (don't consider that a nack).

Noted. If no-one else voices a different opinion, I'll wrap that piece of
code in "#if 0".

>> --- a/xen/arch/x86/setup.c
>> +++ b/xen/arch/x86/setup.c
>> @@ -1608,6 +1608,40 @@ void asmlinkage __init noreturn __start_
>>              struct boot_module *bm = &bi->mods[j];
>>              unsigned long size = PAGE_ALIGN(bm->arch.headroom + bm->size);
>>
>> +            /*
>> +             * For PVH Dom0 try to place the initrd in a full multi-Gb (or
>> +             * multi-2Mb) chunk, such that assigning the pages directly can
>> +             * be done while still using superpage mappings.
>> +             */
>> +            if ( opt_dom0_pvh && j == 1 /* bm->kind == BOOTMOD_RAMDISK */ )
> 
> What if there's a microcode blob or an XSM policy here instead?

Especially for the XSM policy - very good question (hence also the
respective post-commit-message remark). The ucode blob we can tell,
if necessary, but aiui the XSM policy we can't. I have absolutely no
idea how to deal with this, and it's only because of this that I
left things in this shape.

>> +            {
>> +                if ( get_dom0_size(nr_ram_pages()) >= PFN_DOWN(GB(2)) )
>> +                    mask = (1UL << L3_PAGETABLE_SHIFT) - 1;
>> +
>> +                for ( ; mask > PAGE_SIZE; mask >>= PAGETABLE_ORDER )
>> +                {
>> +                    if ( !(bm->start & mask) && bm->arch.relocated )
>> +                        break;
>> +
>> +                    size = PAGE_ALIGN(bm->size - bm->arch.headroom);
>> +                    end = e;
>> +                    do {
>> +                        end = consider_modules((s + mask) & ~mask, end & ~mask,
>> +                                               (size + mask) & ~mask, bi->mods,
>> +                                               bi->nr_modules + relocated, j);
>> +                    } while ( (end & mask) && end > s );
>> +
>> +                    if ( highmem_start && end > highmem_start )
>> +                        break;
>> +
>> +                    size = (size + mask) & ~mask;
>> +                    bm->start += bm->arch.headroom;
>> +                    bm->size  -= bm->arch.headroom;
>> +                    bm->arch.headroom = size - PAGE_ALIGN(bm->size);
>> +                    goto move_module;
>> +                }
> 
> Every path through this block either does a 'break' or a 'goto'; so
> this isn't actually a for loop at all -- the 2MiB fallback can never
> execute.
> 
> Did you forget an `if (end) { }` somewhere?

"Forget" as in "wrongly purge when purging other debugging code", as I
had temporary logic there to actually also exercise the falling back to
2M and 4k. So yes,

                    if ( end <= s )
                        continue;

is supposed to live right after the inner loop.

> Also, looks like consider_modules() takes a uint32_t for size, and we
> round up to the nearest GiB; so if the dom0 initrd is between 3GiB and
> 4GiB, won't we pass 0 as a size argument, which will always fit?

Hmm, ugly. Since imo at some point we will want to lift the 4G
restriction on initrd and kernel anyway, I think I'll slip in a prereq
patch widening the function's parameter.

Thank you very much for spotting both of these flaws.

Jan

