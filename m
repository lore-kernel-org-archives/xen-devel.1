Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B70C606A31B
	for <xen-devel@archiver.kernel.org>; Wed,  4 Nov 2026 12:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=n9PDK4Yc
Received: from list by lists.xenproject.org with outflank-mailman.1471851.1680001 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOaHP-00008l-Pn; Wed, 04 Nov 2026 12:39:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1471851.1680001; Wed, 04 Nov 2026 12:39:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOaHP-00008e-N6; Wed, 04 Nov 2026 12:39:51 +0000
Received: by outflank-mailman (input) for mailman id 1471851;
 Wed, 04 Nov 2026 12:39:51 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xOaHP-00008Y-0r
 for xen-devel@lists.xenproject.org; Wed, 04 Nov 2026 12:39:51 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOaHO-00AfXU-Co
 for xen-devel@lists.xenproject.org; Wed, 04 Nov 2026 13:39:50 +0100
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6aeb2794-e002-0a2a0a5209dd-0a2a4505949c-2
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 13:39:50 +0100
Received: from [209.85.128.44] (helo=mail-wm1-f44.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6aeb2796-4cb1-0a2a45050019-d155802ccc96-3
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 13:39:50 +0100
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-4a1fbd52ab6so4472695e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 04:39:50 -0800 (PST)
Received: from [192.168.1.6] (user-109-243-146-71.play-internet.pl.
 [109.243.146.71]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48fe7189883sm4008598f8f.0.2026.11.04.04.39.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Nov 2026 04:39:48 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20260707 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:From:Content-Language:References:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793795990; x=1794400790; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=T22XU2GDqyU2x8IfThojmgkKyOvo1tS1CyaQ5SiM8Uw=;
        b=n9PDK4YcKzqDs0e/bPMMUjT6so58qLFBRQGvCqMer1tf6Y0Zb1jXsfs4q+ZeF7ZPVH
         0/KvKrG/uU8DabSI3yYy5Ivx1SB7j3oSwluWPyVBVdSCyLPP1s7nv5VzIAjIj1UUaNjd
         3jE3eUtoARYj/Qj2guIDyNsW7v9UGL9M7a+/dyKmOTR2KmV4jl0QXmXx2aXkWpE1subo
         2o9Rb1AY61jgZqjP0mPKIQ6rRNayUpkHCSTjt9wFT2wXVNTS3aLIWE6C+SL0BDNj3gpz
         xf29ph0EaXvkYzCfmRKaRpR6DqH8fi/kRslRiejNoNh3W35+m8mcdWFX4uN0cPhaaG7v
         FnVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793795990; x=1794400790;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T22XU2GDqyU2x8IfThojmgkKyOvo1tS1CyaQ5SiM8Uw=;
        b=WHuHCA8c0wBuEeoH8UmB0V3JvpdbaA/Ao2dXrA9OyDh1OXzMDoVsICXvINEEmczLUs
         GXAqKttlyuXSfD5aIhY1IICFXCglBYe+AZC1ERoivR88HSOhaboqWgNx2AN+3p5LAuF5
         mzlUZ6VXd8iziSovq0RVi8L4jFUXKdro/q/1b6iM4lptsAHM07Fy9yPEYb/UHt2jBeFH
         2wUbxigeSMAh5b5OwY9mu3Ld8SnrH+ZyG1P3hsMwXIgs4JwR5T+jzp6xdTJ2eZ2cTS1c
         wCRM2nuL6AsrdL4CP+kQxs0QQ/iSrvLvVGscT9/Nl7fThTWWcdnrwdwkLudYRbrsV1ZS
         A4aQ==
X-Forwarded-Encrypted: i=1; AKwUvBwUGifRUp32nOnNp0iIvgu56IXJgUHEFQTL6EdFApjEHtxaOkz5BCp6H7usBcj1mpMPnJIVNWMyoxg=@lists.xenproject.org
X-Gm-Message-State: APuU4Z8+30ydjvkDNMCUpTAgHVHUCduK3Rff3z/yOJJVKXUvum/aRfeB
	C8J3nIbUUNYEVm9XyBhtorbxIdOb7Vk8tJ75iW5FVlPuOB5E5HGWn5m2SmOz4Q==
X-Gm-Gg: AYBFou1LSE79JjQfP6XwarqfonqbDtn5UVu2Q0R2hD+gMsh4vaBAJK/Y6UlHGcMHvEu
	PWVFXLqpw/9fol1cGzkgiPVmFQPMzfHuCJvZKo++MJSdPeChUdo1g5k7SRb02O/4NMCcEvktdOG
	mF7QvNWtpXgWzHMgncvPL4mRcAdI9YN5kcw8xMm6ckrxjetzAlCe+ctXupwU0SvfxTqhM60PS0e
	EzNCVNoQ5v4e/+pAg7XBXHIfFVBLex8Ee0ZfBXms9COTYMoEVIjLfOp1cnpE2h+7fCE7CT+fSDA
	5PIHvNnM6uLrxYsogcqRj2daKDj0gxlLF+TMM4n7omh6mupR2vwFOD/oKTP5xMXMUoxJ/11MrKB
	C37IPcDVvW3No10cy3bHYEeWKKXTXffK0pv4W1fYz18vKdiXmY4snXTN2eVqsyTaKKO+vnVYU33
	BLPEB/fIkJt3teu4EX0gsquXDYilqmdAe3NuLIlWWfb7fVV7xZ3zYU67QNuLg5oJQi8bIgZRxEm
	Dn+wzgZs8Ir6cjDn8sxR8nJaVNQXDMjFCkt0t6VEkS5kvp5AZi4Ke0fO2D1AFXn1cS9gdOIVwCp
	gr+Ryv781SZQkV8oaQTwvpMCJKfyJgjscc3WkaVh9RJqLfRUZofgv5TgHMzwDYQ9sANL3br+yBo
	R6yU=
X-Received: by 2002:a05:600c:3114:b0:4b1:32c8:27db with SMTP id 5b1f17b1804b1-4b132c8286fmr181124555e9.22.1793795988927;
        Wed, 04 Nov 2026 04:39:48 -0800 (PST)
Message-ID: <9c74569c-82a9-46b0-a013-c502c36c8d38@gmail.com>
Date: Wed, 4 Nov 2026 13:39:47 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 21/39] xen/riscv: add guest memory read helper
To: Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 xen-devel@lists.xenproject.org
References: <cover.1790779209.git.oleksii.kurochko@gmail.com>
 <c77408157f7674ad2ffc775d1267470b724fdecf.1790779209.git.oleksii.kurochko@gmail.com>
 <1792595464.8631fc262581453bbf619ec5b2062170.1a15f041119000f79f@vates.tech>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <1792595464.8631fc262581453bbf619ec5b2062170.1a15f041119000f79f@vates.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c201ff/1793795990-F5AAF2A1-51557FB1/10/73395122804
X-purgate-type: spam
X-purgate-size: 2772
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 10/21/26 5:11 PM, Baptiste Le Duc wrote:
> Sorry I forgot one thing.> +unsigned long read_guest(unsigned long 
> guest_addr, bool read_insn,
>> +                         struct trap_info *trap)
>> +{
>> +    /*
>> +     * Poison the result: if the very first access faults, the fixup 
>> skips
>> +     * over the loads without writing it. Callers must check trap- 
>> >scause.
>> +     */
>> +    unsigned long val = ~0UL, tmp;
>> +
>> +    /*
>> +     * hlv/hlvx use hstatus.SPVP for the privilege of the access, and 
>> the
>> +     * live vsatp/hgatp for the translation. Xen never installs a 
>> value of
>> +     * its own in hstatus (it is only saved on trap entry and restored
>> +     * before sret) and it doesn't reschedule before returning to the
>> +     * guest, so all three still belong to the vCPU which trapped.
>> +     */
>> +    if ( read_insn )
>> +    {
>> +        asm volatile ( "\n"
> I think this would need asm_inline instead...> +            "1: hlvx.hu 
> %[val], (%[addr])\n"
>> +            ASM_EXTABLE_TRAP_INFO(1b, 3f, %[ti])
>> +            "   andi %[tmp], %[val], 3\n"
>> +            "   addi %[tmp], %[tmp], -3\n"
>> +            "   bnez %[tmp], 3f\n"
>> +            "   addi %[addr], %[addr], 2\n"
>> +            "\n"
>> +            "2: hlvx.hu %[tmp], (%[addr])\n"
>> +            ASM_EXTABLE_TRAP_INFO(2b, 3f, %[ti])
>> +            "   slli %[tmp], %[tmp], 16\n"
>> +            "   or %[val], %[val], %[tmp]\n"
>> +            "3:\n"
>> +        : [val] "+&r" (val), [tmp] "=&r" (tmp), [addr] "+&r" 
>> (guest_addr),
>> +          "+m" (*trap)
>> +        : [ti] "r" (trap) );
>> +
>> +        /*
>> +         * Although HLVX instructions' explicit memory accesses 
>> require execute
>> +         * permissions, they still raise the same exceptions as other 
>> load
>> +         * instructions, rather than raising fetch exceptions instead.
>> +         */
>> +        if ( trap->scause == CAUSE_LOAD_PAGE_FAULT )
>> +            trap->scause = CAUSE_FETCH_PAGE_FAULT;
>> +    }
>> +    else
>> +    {
>> +        asm volatile ( "\n"
> ... same for here.

read_guest() is an out-of-line function with its only caller in another 
translation unit, so asm_inline wouldn't change any inlining decision here.

volatile is still needed, as the asm may trap and reads memory which can 
change behind the compiler's back.

~ Oleksii


