Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D48B606A33F
	for <xen-devel@archiver.kernel.org>; Mon, 16 Nov 2026 10:32:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=JqXwhQQ/
Received: from list by lists.xenproject.org with outflank-mailman.1490332.1691268 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xSu0S-0005pk-J3; Mon, 16 Nov 2026 10:32:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1490332.1691268; Mon, 16 Nov 2026 10:32:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xSu0S-0005pd-GU; Mon, 16 Nov 2026 10:32:12 +0000
Received: by outflank-mailman (input) for mailman id 1490332;
 Mon, 16 Nov 2026 10:32:12 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xSu0R-0005pW-W9
 for xen-devel@lists.xenproject.org; Mon, 16 Nov 2026 10:32:12 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xSu0O-00BSLV-Vw
 for xen-devel@lists.xenproject.org; Mon, 16 Nov 2026 11:32:09 +0100
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6afadba4-2eae-0a2a0a5409dd-0a2a450ae30a-20
 for <xen-devel@lists.xenproject.org>; Mon, 16 Nov 2026 11:32:08 +0100
Received: from [209.85.221.51] (helo=mail-wr1-f51.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6afadba8-f2d2-0a2a450a0019-d155dd33c4a5-3
 for <xen-devel@lists.xenproject.org>; Mon, 16 Nov 2026 11:32:08 +0100
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-4919a880834so1574195f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 16 Nov 2026 02:32:08 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-49c5f5972a7sm20364089f8f.21.2026.11.16.02.32.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Nov 2026 02:32:07 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:Autocrypt:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1794825128; x=1795429928; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+ERbUrqc2fxNZJdseoeyiv4wmhvvZOQxBqZNgnl3Zow=;
        b=JqXwhQQ/Oy2B5ce09gLbkIwEBmM/YdGa7r2n6JY6Ax11AEzLqB9Bx+FFQ1pIGeJFcG
         95Iz3x/GvcELjWcCtrXFE1hF8PAHuqLtxKSUVBNXy5ORZyv9duHoVac4sv23McEyKx1e
         paKIpwiOQwunww0n/kQTzpa2v6xnsFuRJ0tIpSyk+ZNlzcmQWMzBXLlANlW5gVWJ5NPa
         RKqFqHgJNZ+AUFVq5c3hQ8rOpu6swiNSjymelmnsUooPkGAFrR6D137lix8vH3QE0Upy
         wMJnOGUqUWXTRHQM20EhNr+HKIdfokUK5W00D2i6zLhEWIQPJKQ9cDJk6/4FF36mNOxX
         d1QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794825128; x=1795429928;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+ERbUrqc2fxNZJdseoeyiv4wmhvvZOQxBqZNgnl3Zow=;
        b=A/N809KoQ+c1/9JDNMDBgxhU+KlmMzBFwIAGHSJ1MK5tAOOqtXpo3ryJexXuvIbH0R
         tTg4v8JaeN2bsDFevtpjrmR27deuVdIy9oqXir976VPPG+QzllI1nHD8UkKN8ENN5pkY
         zM0SSmafnvi5s0cSyq/izDTwM0fQwqJU95d8WdTkc7PVW3+avfOG1ERoV4j7Ig2nEukn
         ZDTqr3LP41ZLJWXwEqODndhnfqTQ40t1ZdufVvY+FaX3F+TR2oXaentPdRHxztooC8X+
         Hw8jk9mqkDz/FuCilPlVmnqxt5J70FZKfkp6+kVWl3m7URNEqkALyXW5cTnbCdBbCAC2
         mXwQ==
X-Forwarded-Encrypted: i=1; AL+hErG3Axxe7BbzDpsV0LoFz1J7OiANyhb4sWBwS1GzbjmguC1t4N3EnXWNdgRcU0YTKycAKafICc/1S8c=@lists.xenproject.org
X-Gm-Message-State: APuU4Z9beURFp5XM2QyFRLjN05gT+OIOIHUJm4b7cTz8Zu25pC1Xrfjd
	pxRGk3hqTOK7Pd7xvLMir0gYJTn5UrzvCNYU9EgYvVNUD25lKyMvPZT127aOFqgFFQ==
X-Gm-Gg: AZFdTZeqT431HnHQ760CzrsWZvEoNNo85oPSJxOdlRlX/c5/Wf7EpH6Vj5WivqyG0of
	h/cbK6SmzMkYg+fvmOuRjXOyvPKRjIXXQ94xCOvueb2XK01wAYMox0srbdI5vVwnIbvKQiVBjAO
	Py8XpgGG/LZOlzEJmcP2TSrWPgGGhR6Gg+oqUc1plMRlKg5+Abdz4WAI/4GIS05Jo9C9PJGJvYv
	vwaBxrlaQAHMqV1JGrf3qz5SV/fj4G7WSJ14D7UOEvy/AFjYtGTMjyduks2wdtq7ua/9z567GGQ
	T1FUEg6zhcgK4I2w4embbunOv1/nlsjsx7BH/oNwvjST5DtleyFheyc3WKM7QebsiKm+T1nA4My
	N1kl93hgLeF7oM8jAuQ//NvCV9vpEN+XUfrYJ1YKapLgQIAJyKxmk1Zn3sL/vcvvH+zt1bgY2QU
	2EcmFpJZ4Eu1xmJXCbB5mQ4pGDXMSEU/35IBZbmwQDRosOyn2b82fag7iEQexyWPybRoXAQ46DE
	Puk3AHpyNhzBUCvq5qZ81/S3SqvqETewJCmyhL1IKmM+YubNq69bcxambwSJM6+c5/FvZtN/DHa
	ct2G78YqlBUWJAcvRLeYwVvYzbzZZlg2L6rAQM5kirA+Ko9B2hAmpSNxMh65FRbSURM7kIYAJ+r
	8LnKeXU/nrTHsI9CtfA==
X-Received: by 2002:a05:6000:240b:b0:490:39ba:4359 with SMTP id ffacd0b85a97d-49c714a2db3mr22566034f8f.23.1794825128157;
        Mon, 16 Nov 2026 02:32:08 -0800 (PST)
Message-ID: <699227cb-3cc3-40d4-affd-8648e71aa9a4@suse.com>
Date: Mon, 16 Nov 2026 11:32:07 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/4] x86: prefer shadow stack for producing call traces
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Teddy Astie <teddy.astie@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <d0de0425-a0fd-4ced-9768-ff102b953a22@suse.com>
 <bfec463b-a4dd-4a4a-bafb-c596f83630a1@suse.com>
 <f9ffba74-3b4a-49a7-abaf-1c062993a531@citrix.com>
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
In-Reply-To: <f9ffba74-3b4a-49a7-abaf-1c062993a531@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-4011c0/1794825128-4B4D7CFC-BED606BF/10/78276251493
X-purgate-type: spam
X-purgate-size: 9686
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 10.11.2026 14:15, Andrew Cooper wrote:
> On 09/11/2026 1:09 pm, Jan Beulich wrote:
>> Shadow stacks contain little more than return addresses, and they in
>> particular allow precise call traces also with FRAME_POINTER=n:
>>
>> (XEN) Xen call trace:
>> (XEN)    [<ffff82d04032d730>] R extable.c#search_one_extable+0x70/0x73
>> (XEN)    [<ffff82d04032d802>] C search_exception_table+0xc2/0x177
>> (XEN)    [<ffff82d040358378>] C traps.c#extable_fixup.isra.0+0x18/0x6c
>> (XEN)    [<ffff82d040358e3b>] C do_invalid_op+0xab/0x106
>> (XEN)    [<ffff82d040201d98>] C x86_64/entry.S#handle_exception_saved+0x88/0xf4
>> (XEN)    [<ffff82d07fffe044>] E ffff82d07fffe044
>> (XEN)    [<ffff82d040412db0>] C stub_selftest+0xd0/0x168
>> (XEN)    [<ffff82d0403508d6>] C setup.c#init_done+0x116/0x15a
>>
>> as opposed to this counterpart (earlier during the same boot, before CET
>> is enabled):
>>
>> (XEN) Xen call trace:
>> (XEN)    [<ffff82d04032d730>] R extable.c#search_one_extable+0x70/0x73
>> (XEN)    [<ffff82d04032d802>] S search_exception_table+0xc2/0x177
>> (XEN)    [<ffff82d040358378>] S traps.c#extable_fixup.isra.0+0x18/0x6c
>> (XEN)    [<ffff82d040358e3b>] S do_invalid_op+0xab/0x106
>> (XEN)    [<ffff82d040201d98>] S x86_64/entry.S#handle_exception_saved+0x88/0xf4
>> (XEN)    [<ffff82d040412db0>] S stub_selftest+0xd0/0x168
>> (XEN)    [<ffff82d0403d0cc9>] S do_initcalls+0x29/0x38
>> (XEN)    [<ffff82d04041adf2>] S __start_xen+0x1c72/0x2235
>> (XEN)    [<ffff82d040288a57>] S __high_start+0xb7/0xc0
>>
>> (note the entirely missing entry for the stub itself [1]; sadly there are
>> no stray entries there).
>>
>> [1] Arguably we could teach FRAME_POINTER=n traces to recognize stubs as
>>     well. But not FRAME_POINTER=y ones. In fact, what's missing there
>>     isn't the stub itself, but (of course) its immediate caller.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Sorry, but this commit message is still deceptive to read.  Please
> reformat it as:
> 
> ---8<---
> Shadow stacks contain little more than return addresses, and they in
> particular allow precise call traces also with FRAME_POINTER=n:
> 
> Compare a WARN() in stub_selftest() which runs twice on boot, first
> without Shadow Stacks:
> 
>     (XEN) Xen call trace:
>     ...
>     (XEN)    [<ffff82d040288a57>] S __high_start+0xb7/0xc0
> 
> and later with Shadow Stacks:
> 
>     (XEN) Xen call trace:
>     ...
>     (XEN)    [<ffff82d0403508d6>] C setup.c#init_done+0x116/0x15a
> 
> 
> Note that ...
> ---8<---
> 
> This way you are presenting the information in chronological order, as
> well as stating which has CET enabled and which does not.

This last aspect is stated clearly, by the text between the two traces.
Presentation order (chronological vs what I want to emphasize) should
also be left to the taste of the author, I think. I see nothing deceptive
in there.

> We probably ought to teach the emulation stubs about
> CONFIG_FRAME_POINTER.  It should be consistent 

Maybe, yet perhaps only after (or together with) having all assembly code
also obey to FRAME_POINTER.

>> @@ -705,6 +706,13 @@ unsigned long get_stack_dump_bottom(unsi
>>      }
>>  }
>>  
>> +#ifdef CONFIG_XEN_SHSTK
>> +static bool in_stub(unsigned long addr)
>> +{
>> +    return !((this_cpu(stubs.addr) ^ addr) >> STUB_BUF_SHIFT);
>> +}
>> +#endif
> 
> static inline, or __maybe_unused.  This stub needs using elsewhere, and
> has nothing to do with XEN_SHSTK beyond the first user.

Well, no. For the purpose of this patch #ifdef is an appropriate way of
dealing with the otherwise resulting build issue. If and when further
uses appear, the situation can be re-evaluated. __maybe_unused also
isn't going to help the Misra aspect, as a deviation based on it exists
solely for rule 2.6 (concerning labels).

If you insist (which I think you shouldn't, as again this is a matter of
taste), the compromise I can offer is to move the predicate to a header,
e.g. next to the decl of "stubs". Then adding "inline" will be
appropriate (and necessary).

>> @@ -797,6 +805,49 @@ static void show_trace(const struct cpu_
>>           !is_active_kernel_text(tos) )
>>          printk("   [<%p>] R %pS\n", _p(regs->rip), _p(regs->rip));
>>  
>> +#ifdef CONFIG_XEN_SHSTK
>> +    if ( rdssp() != SSP_NO_SHSTK )
> 
> Thinking about it, the entry condition wants to be regs->entry_ssp.
> 
> If shadow stacks where enabled at the time of taking the exception/etc,
> that's good enough.

Functionally both should be identical (so to a fair degree this again
wants leaving to the author's choice). At the same time you didn't
request the same for fixup_exception_return(), and I think we want to
keep both in sync.

>> +    {
>> +        const unsigned long *ptr = _p(regs->entry_ssp);
> 
> Something Linux is gaining might be worth using here.
> 
> +struct fred_shstk_entry_frame {
> +    u64 ssef_ssp;
> +    u64 ssef_lip;
> +    u64 ssef_cs;
> +};
> 
> (Names subject to improvement, especially as this is not actually FRED
> related, although cs does get extended with SL and WFE when FRED is
> enabled.)
> 
> The logic below will render incorrectly on the IST stacks, I think.
> 
> In those cases, we'll get an entry_ssp pointing at the IST shstk with {
> ssp, lip, cs, (maybe) sup token }, where what we want to do for
> rendering the dump is to follow ssp first to get to the outer context
> and then walk up.  This is different from rendering regs->rsp which
> starts from the outer context.

Which is what is happening ...

>> +        unsigned int n;
>> +
>> +        for ( n = 0; (unsigned long)ptr & (PAGE_SIZE - sizeof(*ptr)); ++n )
>> +        {
>> +            unsigned long val = *ptr;
>> +
>> +            if ( is_active_kernel_text(val) || in_stub(val) )
>> +            {
>> +                /* Normal return address entry.  */
>> +                printk("   [<%p>] C %pS\n", _p(val), _p(val));
>> +                ++ptr;
>> +            }
>> +            else if ( !((val ^ (unsigned long)ptr) >>
>> +                        (PAGE_SHIFT + STACK_ORDER)) )
>> +            {

... in the body of this "else if()", as in that case the initial if()
will yield "false".

>> +                if ( val & (sizeof(val) - 1) )
>> +                {
>> +                    /* Most likely a supervisor token. */
>> +                    break;
>> +                }
> 
> Supervisors tokens only exist in !opt_fred cases.  But I don't see how
> this is a valid check for one.  You're looking for non-zero in the
> bottom 3 bits, but that's potentially ambiguous with cs

Under what conditions? Entry from ring-3 doesn't push anything. And PV32
(i.e. entry from ring-1) is excluded. Are you suggesting we need to
cover the case of Xen using a ring-0 CS in the LDT?

> and fails to spot a non-busy token.
> 
> The distinguishing characteristic of a supervisor token is that it is
> it's own address, so check (val ^ ptr) >> 1.

Why would we care about a non-busy token? That's as good as random data
on an inactive (part of a) shadow stack.

>> +
>> +                /*
>> +                 * Ought to be a hypervisor interruption frame.  But don't
>> +                 * (re)log the current frame's %rip.
>> +                 */
>> +                if ( n || ptr[1] != regs->rip )
>> +                    printk("   [<%p>] E %pS\n", _p(ptr[1]), _p(ptr[1]));
> 
> Ah - this n is the thing covering the fact that you didn't move to the
> outer context originally.  Please do that and drop this.

Why would I duplicate the move-to-outer-context code (just below)? We may
need to move between contexts more than once, after all.

> If we're going to start using E here, we should make the FRAME_POINTER
> side match.

Perhaps, but not in this patch.

>  When printing something we've identified as a stub, we
> ought to say "in stub" rather than leaving it as a raw number.

Can do, albeit like you said for the use of E above this then likely wants
mirroring to normal frames as well, again not in this patch though. (At
which point the #ifdef you complained about above would simply go away.)
Will you be okay with

            if ( is_active_kernel_text(val) )
            {
                /* Normal return address entry.  */
                printk("   [<%p>] C %pS\n", _p(val), _p(val));
                ++ptr;
            }
            else if ( in_stub(val) )
            {
                /* Stub return address entry.  */
                printk("   [<%p>] C <stub>\n", _p(val));
                ++ptr;
            }
            else if ( ... )

?

> Not for this patch, but it might be nice to identify EFI ranges too,
> because that's the only other case where we commonly get raw numbers.

Might be nice, as you say.

>> +                ptr = _p(val);
>> +            }
>> +            else /* Bogus. */
>> +                break;
>> +        }
>> +
>> +        /* Fall back to legacy stack trace if nothing was logged at all. */
>> +        if ( n )
>> +            return;
> 
> This comment wants to be after the return, not before it.

Again a matter of taste. To me the present placement explains why if
if() is there. If I saw such a comment placed like you ask for, I'd
pretty likely ask for it to be moved the other direction.

Having qualified most of your requests as "a matter of taste", what I
now fear is going to happen is that we won't make progress here anymore.
I'll be happy to learn otherwise, though.

Jan

