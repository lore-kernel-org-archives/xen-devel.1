Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BC75606A31B
	for <xen-devel@archiver.kernel.org>; Mon, 26 Oct 2026 12:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ZFRUF1PP
Received: from list by lists.xenproject.org with outflank-mailman.1461265.1672246 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLK4m-0008MY-Ok; Mon, 26 Oct 2026 12:45:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1461265.1672246; Mon, 26 Oct 2026 12:45:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLK4m-0008MR-Lz; Mon, 26 Oct 2026 12:45:20 +0000
Received: by outflank-mailman (input) for mailman id 1461265;
 Mon, 26 Oct 2026 12:45:19 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <frn1furkan10@gmail.com>) id 1xLK4l-0008M4-BJ
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2026 12:45:19 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xLK4k-00E0Pk-Nr
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2026 13:45:18 +0100
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <frn1furkan10@gmail.com>)
 id 6adf4b3e-2eae-0a2a0a5409dd-0a2a450b8d28-46
 for <xen-devel@lists.xenproject.org>; Mon, 26 Oct 2026 13:45:18 +0100
Received: from [209.85.221.53] (helo=mail-wr1-f53.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <frn1furkan10@gmail.com>)
 id 6adf4b5e-b7e8-0a2a450b0019-d155dd35acd8-3
 for <xen-devel@lists.xenproject.org>; Mon, 26 Oct 2026 13:45:18 +0100
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-48e3b22e971so1289172f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 26 Oct 2026 05:45:18 -0700 (PDT)
Received: from [192.168.1.109] ([85.107.102.204])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e3ebd4bc5sm16141257f8f.34.2026.10.26.05.45.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Oct 2026 05:45:17 -0700 (PDT)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793018718; x=1793623518; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dfrgde6/9Gl+b3+4NAwY8dGist6ThWQHNYcUVUJ+lDc=;
        b=ZFRUF1PP4i3dGFVCEBIhHz+Tgki3ynQLiURP+dMeuO+HQeg6o3uNQDnyJ15ZjWDqd7
         7kn9sO4gZDWlbtF+2o1iuP7fzVfHgOoHeeow5+PFNEVjNCgPmzAkVC2doeSfKlQooDgr
         0MEcDXVWOPGDldyUXyRWeOZpXSBXf/xQe3+l2ul6xehejGeh3EQ0yofbzw9Dg6n61P2J
         gO66ADnBbjR0SkOtDbOqyUDhfWWebOKGccxIVqvmkf8nLSQZcO+BgFcy/UQlUTc1IqcM
         9AmcRgL1CSZXGYr1l4Vcb3ep5p10jAJFY1oMaUdmZix+V6lkd4jE43dYpxgwfZmGNSj7
         v+dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793018718; x=1793623518;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dfrgde6/9Gl+b3+4NAwY8dGist6ThWQHNYcUVUJ+lDc=;
        b=GdwHDnJKYSjBqvZEfkJqpgGz7Von2Qzu2lVxbdufJe7TjMgs8TMx3b3/D2bpYihkkL
         aoRBblGbfa+f3yaYWayZRVxLL1LcHukI0aXDoYSVGpMKfOBuBmPkgdJPYm4fZDexETHQ
         EZeM9BCxreg8L6sfIuWf7MnSK1fSqPZJLMVQFZcAfoOsvZvUKG3ZGY2lpdy7zFOw0X1m
         7o1XHPBjbdBJEnOHD4fdZzNw0gngaDe5gANkYGkhD1LMpHFevSJsl915SfHoTOlItGLz
         g0D4ROGuXaxr9YQ2YhHLbZUH+vpDvXK1dhqsbDwJn/t+cTZucFXko4gan20SxcWV3uyw
         CTTA==
X-Forwarded-Encrypted: i=1; AKwUvBzTmriNuKDyBnjM+K7HFI6z4DpNAS7QmdXG/GMIkb/h/hNhrih3h0kYktOS18JXvKNr+7DWFtmkRFg=@lists.xenproject.org
X-Gm-Message-State: AFq9FYK0+YU08NbEd9m4xV3LkDQ0D3wz7GiWo/0F88GkB+rC9ZNgjagD
	ROY4P4NieIzF8nf6Y1kRPSUCLeQkCO5gXKbjXGk6dmc0D9vGNQTO3bAR
X-Gm-Gg: AYBFou1bgluhH28xylnx2rE2XTlpU7NYFhaJYxJMC+Gv9riUAtIe1tjZLom8Dnagdot
	IlbEYFtpQC4/JqVMl779jzuPMNO2sb3qARLLsIOkbpVKz2B8JUiV9FOR3RlNxn0dmrAzvzQRuf4
	ibvmbyxz9SK9c50sPFxmpDKwEQNjEHk5W64X/4TKHfw7dG6o+nywm3Z+NbGQw6yvNggkdO70lNn
	+SmVMWtJT8YQOfe5Wi9nAUV3eE+hdAVilvGVgTAkjmJegVE8mIRHZvHKNJgNWW8y8vRlBGFTVib
	/2WJ2NAm50dtC5J/pac7eK9bMg824weY+m4uYxp9+80FcS1eO6oXvsg4w6rHo1B2/aCGrb9O31A
	2gzWLTokVmywbSu9GDUUxwLX8lbukvYAsnkjZxuc62W9LAeGMbKBj/zcon3eNHLkPobKlnpAzDR
	IjUs+ph7XGqvY/VyQa891cnvnDTIO5ERfZi8bGaz+gy8PFMVItqKtI2Jgc106n8Jy5fNO6YWqgR
	tO6InyM2vu0fip6VRg+YFAKvnc2G8Ffif6HPNgNpm9mjDfpzGNnEDOp84mSQOpZejoGmA9uP99P
	xnhM86DD
X-Received: by 2002:a05:6000:40ca:b0:48d:faa6:cedf with SMTP id ffacd0b85a97d-48e3eb9c0e9mr11904889f8f.56.1793018717694;
        Mon, 26 Oct 2026 05:45:17 -0700 (PDT)
Message-ID: <e8248ebd-334f-402e-92dc-ccc42e20f4d9@gmail.com>
Date: Mon, 26 Oct 2026 15:45:12 +0300
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/desc: build boot GDT descriptors with a macro
To: Jan Beulich <jbeulich@suse.com>
Cc: andrew.cooper3@citrix.com, roger@xenproject.org, teddy.astie@vates.tech,
 xen-devel@lists.xenproject.org
References: <20261020135722.45714-1-frn1furkan10@gmail.com>
 <84fee7e4-ee15-4e56-8db3-f5d2db5ec2e2@suse.com>
Content-Language: en-US
From: =?UTF-8?B?RnVya2FuIMOHYWzEscWfa2Fu?= <frn1furkan10@gmail.com>
In-Reply-To: <84fee7e4-ee15-4e56-8db3-f5d2db5ec2e2@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-42698a/1793018718-AAAD89EA-123EF7BC/0/0
X-purgate-type: clean
X-purgate-size: 3717
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On 10/26/26 15:15, Jan Beulich wrote:
> On 20.10.2026 15:57, Furkan Caliskan wrote:
>> The raw 64-bit constants in boot_gdt[] and boot_compat_gdt[] hide what
>> each descriptor actually is.  Replace them with a GDTE() macro, modelled
>> on Linux's GDT_ENTRY_INIT(), plus named GDTE_FLAGS_* constants and a
>> GDTE_FLAT() helper for flat segments.
>>
>> No functional change.
> 
> Can this be "upgraded" to "No change in generated code" or some such? Else:
> Are there changes in generated code?

I compared the generated code before and after, and it is identical.
I'll state that in v2.

> 
>> --- a/xen/arch/x86/desc.c
>> +++ b/xen/arch/x86/desc.c
>> @@ -27,32 +27,67 @@
>>  
>>  #define SEL2GDT(sel) (((sel) >> 3) - FIRST_RESERVED_GDT_ENTRY)
>>  
>> +/*
>> + * Expands to a brace-enclosed initializer for seg_desc_t; only use it
>> + * inside an initializer list.
>> + *
>> + * flags: bit layout matches its position in the descriptor's high dword
>> + *   bits 0-3   : type
>> + *   bit  4     : s     (0 = system, 1 = code/data)
>> + *   bits 5-6   : dpl
>> + *   bit  7     : p     (present)
>> + *   bit  12    : avl
>> + *   bit  13    : l     (64-bit code segment)
>> + *   bit  14    : d/b
>> + *   bit  15    : g     (granularity: 0 = byte, 1 = 4KiB)
>> + */
>> +#define GDTE(flags, base, limit)                                        \
>> +    { (((uint64_t)(limit) & 0x0ffffULL)            |                    \
>> +       (((uint64_t)(base)  & 0x0ffffffULL)  << 16) |                    \
>> +       (((uint64_t)(flags) & 0x0ffULL)      << 40) |                    \
>> +       (((uint64_t)(limit) & 0xf0000ULL)    << 32) |                    \
>> +       (((uint64_t)(flags) & 0xf000ULL)     << 40) |                    \
>> +       (((uint64_t)(base)  & 0xff000000ULL) << 32)) }
> 
> As you only ever use this for GDTs, the macro name here is okay. However, ...
> 
>> +/* Common flag combinations (same values Linux uses for equivalent segments) */
>> +#define GDTE_FLAGS_RING0_CS64   0xa09b   /* P DPL0 S code  RX A, L, G */
>> +#define GDTE_FLAGS_RING0_DS32   0xc093   /* P DPL0 S data  RW A,    G */
>> +#define GDTE_FLAGS_RING1_CS32   0xc0bb   /* P DPL1 S code  RX A,    G */
>> +#define GDTE_FLAGS_RING1_DS32   0xc0b3   /* P DPL1 S data  RW A,    G */
>> +#define GDTE_FLAGS_RING3_CS32   0xc0fb   /* P DPL3 S code  RX A,    G */
>> +#define GDTE_FLAGS_RING3_DS32   0xc0f3   /* P DPL3 S data  RW A,    G */
>> +#define GDTE_FLAGS_RING3_CS64   0xa0fb   /* P DPL3 S code  RX A, L, G */
>> +#define GDTE_FLAGS_PERCPU       0x0091   /* P DPL0 S data  RO A       */
>> +
>> +/* Xen maps every flat segment across all of memory. */
>> +#define GDTE_FLAT(flags) GDTE(flags, 0, 0xfffff)
> 
> ... nothing in any of these constants is GDT-specific, and the FLAGS infix
> isn't very useful there either (albeit I probably also wouldn't outright
> insist on its dropping).

Agreed.  Following Andrew's feedback as well, v2 will drop the packed
flag words and the GDTE_FLAGS_* names altogether, and instead spell out
each descriptor's attributes symbolically at the use site.
> 
> As to the GDTE_FLAGS_* constants' comments: The P and S bits (which are only
> ever set) are mentioned, while the D/B bit (which varies) isn't. For the
> constants themselves, there's clearly redundancy with asm/desc.h's _SEGMENT_*
> constants. Possibly those could be used here, perhaps eliminating the need
> for those comments.

I'll look at reusing the _SEGMENT_* constants from asm/desc.h for the
attribute bits rather than introducing new ones, and make sure D/B is
covered, since it varies between the entries.
> 
> Jan

Thanks,
Furkan


