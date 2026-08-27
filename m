Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21E96C61DB9
	for <xen-devel@archiver.kernel.org>; Thu, 27 Aug 2026 16:02:06 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1401243.1636999 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzcY2-0002FS-Pr; Thu, 27 Aug 2026 16:01:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1401243.1636999; Thu, 27 Aug 2026 16:01:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzcY2-0002FK-Li; Thu, 27 Aug 2026 16:01:50 +0000
Received: by outflank-mailman (input) for mailman id 1401243;
 Thu, 27 Aug 2026 16:01:50 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wzcY1-0002FE-Re
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2026 16:01:49 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wzcY0-003Tw0-74
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2026 18:01:48 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a905f67-8faa-0a2a0a5109dd-0a2a4503ab5e-14
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 18:01:48 +0200
Received: from [209.85.221.41] (helo=mail-wr1-f41.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a905f6b-fae8-0a2a45030019-d155dd29d8a3-3
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 18:01:48 +0200
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-47fecbb7000so1135944f8f.2
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 09:01:48 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-499dd56dfb8sm70974795e9.3.2026.08.27.09.01.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Aug 2026 09:01:46 -0700 (PDT)
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
        d=suse.com; s=google; t=1787846507; x=1788451307; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QcLMgCFTN25bO7TW3QA46L5cvl4mDFQlktzMwYj2fMk=;
        b=XN5ZfWi5nF6fECIuaGBcPlKfp5lVoOE06wqIy2pck7E3J/n1qoNNiWrVGX+RFVm0qj
         gPUGIvSmuFDF8D27z/awEhq5xgbjBgCKgTNlXnBIVfv0XvcIB6ZBQTrQEy3IQWwTkKOo
         S5WSdVky3LSrkej+wFzfRKbJ1zC/7j7jxrZpn4NhH83brMBfq1fSHeOyneq2UDmHbiFq
         cFlYaUAn4tcCUEWLqTce9uBaBQusFfgjZe0xaUupBU3ilh4XJt5GN6f7UCweGsn12zJe
         BMovZlaurvbs9QQcNlswhxnTXalcl61+aXy0Ed0+FQ6IJgI3e0e9FNp7KAwTCiuct/8+
         HBOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787846507; x=1788451307;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QcLMgCFTN25bO7TW3QA46L5cvl4mDFQlktzMwYj2fMk=;
        b=FSWe8gBbs7lxeWydJAzDyjITtafNHmis1DpVb/bv/cEL8GslYaXjp54Rkdx/dO26nf
         sXEedUHalJ82MYbufvuq2/lBOBxsBk7Y2BPYcSjNfAkWlQ6wYhneeNqgH6d8mIcs76mW
         q3hBj8gyGXq5QMRkht3KPqqTZgk7DSObBIm8fPcK5n354+0uEW5PtxUT3APGzrIk3jrY
         oo0dinAWNLKdDRRN6EL0XqKeYO18SV862y15M/wn8KpxgXL6jFVZvTXkeXJNOhekR9RE
         WWo97nz9pdkY/SgYijhv7COjGjyMTuZiWhZZr5cBsYHEYyRYjWI3ijLl9N9TwJc593t0
         VK4A==
X-Forwarded-Encrypted: i=1; AHgh+RpPcQiWdLaoMcFLXNVUIsMSLs1VlsgRDA5e5PyF6wCAqXeBJpOcjBjjlJnGHxNn3Hyu6XR6O0CibZE=@lists.xenproject.org
X-Gm-Message-State: AFuF++nAnxV4l7By+wKsp8Jbr9ZDluMVmHRWSErqv0smuUfw5JX9MgJ/
	a8sAy1BYz5lQ7+GdAPxn3BUWDdwIRj2xyGCPQvOMUQYPGDQz+inH779+bUOKAezKGw==
X-Gm-Gg: AR+sD11XpYCdoeWvNr6yTlw9Izi9r4RWrwz6QAtTdhSBO/U4OYPc34g9XNtWfLko2RS
	tK2RxguCa+bt2IUu0aU3wRT3uLIdBteo40uUVpTercyJzoQNRorr83zTAyVbveRUq00Czi29HgI
	Xv7uIJgAk3Pn64NtMxWsQV/u3Yp9PHtBI5HdDwQ5EjJgA++RXWatMZ5JcTEUJ/GWDc4YcReob9j
	nOYlQyXt3VQD0mRl5QTeT4/3sWgjO8J+GnQMLJk1zJv7a/dWE0FgBRJcWp9rewoiAxjD4MTv6dy
	XU0eZM1iJR6kX1XCVpYuQ39ujl6Okdw2p9wXBGijBCwciuY7VmsH186D3SSyvq7zUkkrozZ5Mm9
	1BbdsL0TDPWk+/JL53l5Gt+7MXBXG8SAuSrfqeBelVRdaWnmcS2JfebjUOrUGW34oCPUsq6CYNX
	YDZlXoR+8MkCtHX2G5c5UNT2ZCTfDIhW8+JjO7pHbTCPaf/MPLN3bNCNvkag1x8BoeA3eRW60YW
	shSteXsMBWCQmDEcWzKCNle6oqxs1C+MEWRh5YilJR9yzGfyue6
X-Received: by 2002:a05:600c:3e0b:b0:499:adb5:e7b2 with SMTP id 5b1f17b1804b1-499dc717dcbmr242919395e9.11.1787846507446;
        Thu, 27 Aug 2026 09:01:47 -0700 (PDT)
Message-ID: <15abd61a-045f-47d1-94fb-b5febf28711c@suse.com>
Date: Thu, 27 Aug 2026 18:01:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/7] RISC-V: split xen-syms linking rule
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <9a78fdea-08ba-4e04-bfa1-ba09730a300b@suse.com>
 <6f4b26ce-2797-4c17-bfdf-8effd2026a6a@suse.com>
 <f0510fd7-32fc-4fbd-834e-68bba14150b9@gmail.com>
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
In-Reply-To: <f0510fd7-32fc-4fbd-834e-68bba14150b9@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-33051d/1787846508-750864E9-DACE2AF9/0/0
X-purgate-type: clean
X-purgate-size: 4761

On 27.08.2026 17:56, Oleksii Kurochko wrote:
> On 8/26/26 2:01 PM, Jan Beulich wrote:
>> Doing so, besides (hopefully) adding clarity (not the least by way of
>> [re-]using pattern rules where possible), also avoids explicit recursive
>> $(MAKE) invocations.
>>
>> By re-using the generic rules introduced when the respective x86 rule was
>> split,
>> - the .map file now isn't created after the final binary anymore,
>> - --strip-debug is passed to $(LD) during early linking passes (for
>>    consistency the option is also explicitly added to the optional linking
>>    pass rule),
>> - CONFIG_{SUPPRESS_DUPLICATE_SYMBOL_WARNINGS,ENFORCE_UNIQUE_SYMBOLS} are
>>    now properly respected.
>> Orphan section checking, otoh, is getting suppressed for now, until the
>> about a dozen warnings which would result have been taken care of.
>>
>> While the 4th linking step continues to be avoided when possible, a
>> redundant invocation of $(NM) and tools/symbols (plus the assembling of
>> the resulting .S file) is hopefully deemed acceptable.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>
>> --- a/xen/arch/riscv/Makefile
>> +++ b/xen/arch/riscv/Makefile
>> @@ -31,40 +31,12 @@ obj-y += vtimer.o
>>   $(TARGET): $(TARGET)-syms
>>   	$(OBJCOPY) -O binary -S $< $@
>>   
>> -$(TARGET)-syms: $(objtree)/prelink.o $(obj)/xen.lds
>> -	$(objtree)/tools/symbols $(all_symbols) --empty > $(dot-target).0.S
>> -	$(MAKE) $(build)=$(@D) $(dot-target).0.o
>> -	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds $< $(build_id_linker) \
>> -	      $(dot-target).0.o -o $(dot-target).0
>> -	$(NM) -pa --format=sysv $(dot-target).0 \
>> -		| $(objtree)/tools/symbols $(all_symbols) --sysv --sort \
>> -		> $(dot-target).1.S
>> -	$(MAKE) $(build)=$(@D) $(dot-target).1.o
>> -	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds $< $(build_id_linker) \
>> -	    $(dot-target).1.o -o $(dot-target).1
>> -	$(NM) -pa --format=sysv $(dot-target).1 \
>> -		| $(objtree)/tools/symbols $(all_symbols) --sysv --sort \
>> -		> $(dot-target).2.S
>> -	$(MAKE) $(build)=$(@D) $(dot-target).2.o
>> -	if ! { $(call compare-symbol-tables, $(dot-target).1.o, $(dot-target).2.o) >/dev/null; }; \
>> -	then \
>> -		set -e; \
>> -		$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds $< $(build_id_linker) \
>> -		    $(dot-target).2.o -o $(dot-target).2; \
>> -		$(NM) -pa --format=sysv $(dot-target).2 \
>> -			| $(objtree)/tools/symbols $(all_symbols) --sysv --sort \
>> -			> $(dot-target).3.S; \
>> -		$(MAKE) $(build)=$(@D) $(dot-target).3.o; \
>> -		$(call compare-symbol-tables, $(dot-target).2.o, $(dot-target).3.o); \
>> -	else \
>> -		ln -sf $(dot-target).2.o $(dot-target).3.o; \
>> -	fi
>> -	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds $< $(build_id_linker) \
>> -	    $(dot-target).3.o -o $@
>> -	$(NM) -pa --format=sysv $@ \
>> -		| $(objtree)/tools/symbols --all-symbols --xensyms --sysv --sort \
>> -		> $@.map
>> -	rm -f $(dot-target).[0-9]* $(@D)/..$(@F).[0-9]*
>> +LAST_LINKING_PASS := 3
>> +
>> +include scripts/Makefile.link
>> +
>> +# Suppress orphan section checking for the time being.
>> +orphan-handling-y :=
> 
> This works, but I think it's worth reconsidering the shape of it.
> 
> It works only by virtue of deferred expansion: $(orphan-handling-y) is
> referenced solely inside the recipe of the final-pass rule in 
> Makefile.link, so the value that matters is the one in effect when that
> recipe is expanded, not when the rule was defined. Nothing states that
> requirement, and nothing enforces it.
> 
> What makes me uneasy is that the ordering is not merely undocumented,
> it's inverted with respect to the obvious reading. Makefile.link has
> 
>    orphan-handling-$(call ld-option,--orphan-handling=warn) := 
> --orphan-handling=warn
> 
> i.e. an unconditional := to orphan-handling-y whenever the linker
> supports the option. So an arch that sets orphan-handling-y *before*
> the include has its setting silently discarded and ends up with orphan
> checking enabled after all: no warning, no error, just a dozen new
> linker diagnostics appearing at some later point. And "before the
> include" is exactly where one would naturally put it: right next to
> LAST_LINKING_PASS, which is the one knob the arch Makefile does set up
> front.
> 
> I am not insisting on reworking but probably a small comment (in the 
> commit mesage at least?) somewhere about that "+orphan-handling-y :=" 
> should go after include will be useful.

I can add a comment (albeit the ordering looks very obvious to me, and
not counterintuitive at all), but the better thing would be for all
arch-es to quickly deal with getting rid of this override again: No
need for an override, no need for a comment.

Jan

