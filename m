Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C73F606A326
	for <xen-devel@archiver.kernel.org>; Fri,  6 Nov 2026 11:31:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fRcFcICh
Received: from list by lists.xenproject.org with outflank-mailman.1476495.1682568 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xPIAS-0007mp-PM; Fri, 06 Nov 2026 11:31:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1476495.1682568; Fri, 06 Nov 2026 11:31:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xPIAS-0007mi-M1; Fri, 06 Nov 2026 11:31:36 +0000
Received: by outflank-mailman (input) for mailman id 1476495;
 Fri, 06 Nov 2026 11:31:34 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xPIAQ-0007ma-RM
 for xen-devel@lists.xenproject.org; Fri, 06 Nov 2026 11:31:34 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xPIAQ-003LyL-82
 for xen-devel@lists.xenproject.org; Fri, 06 Nov 2026 12:31:34 +0100
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6aedba87-2eae-0a2a0a5409dd-0a2a450681da-18
 for <xen-devel@lists.xenproject.org>; Fri, 06 Nov 2026 12:31:34 +0100
Received: from [209.85.128.53] (helo=mail-wm1-f53.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6aedba96-195a-0a2a45060019-d1558035cdcc-3
 for <xen-devel@lists.xenproject.org>; Fri, 06 Nov 2026 12:31:34 +0100
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-4a20bdaf39cso5804235e9.1
 for <xen-devel@lists.xenproject.org>; Fri, 06 Nov 2026 03:31:34 -0800 (PST)
Received: from [192.168.1.6] (user-109-243-65-71.play-internet.pl.
 [109.243.65.71]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4b56e58fcb8sm128865385e9.1.2026.11.06.03.31.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Nov 2026 03:31:33 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20260707 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793964694; x=1794569494; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JC3DoCt3KB8/mHGxbBoSoho71Hjr4xZKqfxWcO8kEFw=;
        b=fRcFcIChiPW2e3EfeVNqmU0//pq9NtfbyLwq2EuH3B8r87Ee1gEe5qUDiZeqHqBumI
         c1u0BNWs5HoDCqrG5aua+hpCZZETGGQhyAv5HW/9kS1abzQeA226ZirjDbG4//YIn3mJ
         2J/j3/vbhYCaSeZ9MYWM7dHjw6t9R0v5dt3XsW/HpmZAnPpnQv05sdPOvjM0o9FThkEm
         cF9Z2lLapNg1YiN/SgJQNFqKS+ZPtTR/aqoDAIBIwL6XG5dXzcSTDcICZ2AI8elTcamW
         B/da9owVpmxkmOloV6/1ZPjQKIOXWKt7kYjLlR176Es5I7WA4pMfMUxEnhZb2nanBRD0
         Wb/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793964694; x=1794569494;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JC3DoCt3KB8/mHGxbBoSoho71Hjr4xZKqfxWcO8kEFw=;
        b=TrVFr0zoc7w+PB2PW2zGqwgm9C/gQ7Bjd8zPaO+HjehycuOOsVD3ta0FAU4S7/eoTW
         nBirXS8d59lI+5kdwezExRqpN4rqbfPYlGTZsvRzi8qFcwBa0Ywb/PQ/+qOk0ULrkq2k
         yoXPqsy5ELue3wJFkanniILr/d7Btf3Qlo8saRXHPZMFq5BNCJLlg1IavT0AQpyrhtQk
         a2vz95B/JcR4RvXTEX1MZYa3A6EqyF59w9v3K5uaFs0B5XUNJu5RpirZZEIvXwgrCLJ0
         Wb7u3oTSfy4rR55JL3z3pQpJYwWOcaItWlFduPMQ99oXwbcnECQngpqnnRPuj1LDL3od
         9mrw==
X-Gm-Message-State: APuU4Z88Q2c9LJ2m84lbdzA4i/LCtVUaB3A5cQorXclQEHpdtmJ7ab+2
	pudjBQ6PMlJSkrb4giPupO9d6W522gH6gF/LI79eW1A806JqlVmiJWgE
X-Gm-Gg: AYBFou1HI+JU+QhVYbCqDkLOho30jUNdl52rH+k4AJfdz1hUlPqnA2YR3LW8N4ZGDsB
	Ktzx37s/TCJ/7hvq65kWtwdFrzz1IpYosRXrdmraHZ70LL08uPxv1ZH2vGlLOAyarFaKQp6Qcm3
	CnKHAIgxS6hQxbM/C+GjBzwv52r7lIBTq+DnJ5R0wqpib21KHk+5odj65IXqOf3XJYIgACSUXim
	cNgDqwL7qNHuO5Qs2WDltR7r22MkSHzjxo4UEQHJeiBxQ3dA5tQX1yx3ZZWX8DUvmnCxbuwplR+
	tldl4muytfhkUq2i6oq9vrFdYcZ3ImzZgrm/BtaILcCzwawum0pq+qPebAHyiZsU3g1VPbkhjLc
	hfpKcpE0IKorCof2V7RG+69d1ulCGJXazXnEvOH8WZGl14DAu31iD3EeY4pUUjTOX9vwoyxPTBa
	ZPLLvA0lkvVZYS4CDWUa1WWbKq1ed1jkV1ezAUmf7kq5NAF7apxOpCLjf1IlWD3t/bz6hpOiI04
	+MiC4s0XsTUAjyI2KwX1kFjEDjH8zDAmTP5Z8jTLQTL9sfsBvMwgEtmEWYKyQEcN6ik8QRJEEAy
	WMstkB2B/uzbHLlk3upajXRGxAcYOLpkRTo8KgZfZLagfBAICxG6VJAhI9f+mbsKmtpDeLOzaPX
	V
X-Received: by 2002:a05:600c:c166:b0:4a1:e92b:ae4a with SMTP id 5b1f17b1804b1-4b6de1c6820mr33030445e9.21.1793964693522;
        Fri, 06 Nov 2026 03:31:33 -0800 (PST)
Message-ID: <0d094093-cbaa-4103-96de-c910abb24bac@gmail.com>
Date: Fri, 6 Nov 2026 12:31:32 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 37/39] xen/riscv: implement continue_new_vcpu()
To: Baptiste Le Duc <baptiste.le-duc@vates.tech>
Cc: xen-devel@lists.xenproject.org,
 Romain Caritey <Romain.Caritey@microchip.com>,
 Zheng Zhang <zhangzheng@iscas.ac.cn>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>
References: <cover.1790779209.git.oleksii.kurochko@gmail.com>
 <0d254188c7f21c88ef1982dc9c5810f7b503e38e.1790779209.git.oleksii.kurochko@gmail.com>
 <1793800859.8631fc262581453bbf619ec5b2062170.1a1a6dcf00e000403d@vates.tech>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <1793800859.8631fc262581453bbf619ec5b2062170.1a1a6dcf00e000403d@vates.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-16d1c6/1793964694-FE87577B-A286F46F/10/73395122804
X-purgate-type: spam
X-purgate-size: 2268
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 11/4/26 3:00 PM, Baptiste Le Duc wrote:
>> continue_new_vcpu() is the arch hook invoked the first time a freshly
>> created vCPU is scheduled. Implement both cases it has to cover:
>>   - for the idle vCPU, switch to its own stack and jump to idle_loop();
>>   - for a guest vCPU, enter the guest through the new
>>     return_to_new_vcpu() path in entry.S, which restores hstatus and
>>     sepc, passes the hart id in a0 and, in a1, either the DTB address
>>     (boot vCPU, as expected by the RISC-V boot protocol) or the opaque
>>     value passed to SBI HSM hart_start() (secondary vCPUs), clears the
>>     remaining GPRs, sets sstatus.SPP and sstatus.SPIE and executes sret.
>>
> Nit: the guest vCPU sentence is hard to follow in one go. Maybe split it:
> 
>    - for a guest vCPU, enter the guest through the new
>      return_to_new_vcpu() path in entry.S. It restores hstatus and
>      sepc and passes the hart id in a0. a1 holds the DTB address for
>      the boot vCPU (as expected by the RISC-V boot protocol), or the
>      opaque value passed to SBI HSM hart_start() for secondary vCPUs.
>      It then clears the remaining GPRs, sets sstatus.SPP and
>      sstatus.SPIE, and executes sret.

Thanks for the suggestion. I'll use this wording.

>> [ ... 94 lines skipped ... ]
>> --- a/xen/arch/riscv/entry.S
>> +++ b/xen/arch/riscv/entry.S
>> @@ -147,3 +147,42 @@ FUNC(__context_switch)
>>   
>>           ret
>>   END(__context_switch)
>> +
>> +/*
>> + * Enter a vCPU for the first time. Must be called with interrupts disabled,
>> + * see continue_new_vcpu().
>> + */
>> +FUNC(return_to_new_vcpu)
>> +        REG_L   t0, CPU_USER_REGS_HSTATUS(sp)
>> +        csrw    CSR_HSTATUS, t0
>> +
> At this point regs->hstatus only has SPV | SPVP (arch_vcpu_create()), so
> VSXL is written as 0, which is a reserved encoding. That only gets fixed
> by "xen/riscv: set the guest's XLEN explicitly in hstatus.VSXL", which
> comes later in the series. Wouldn't it be better to move that one ahead
> of this patch?

Agreed. I'll move "xen/riscv: set the guest's XLEN explicitly in 
hstatus.VSXL" before this patch.

> 
> Reviewed-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>
> 

Thanks!

~ Oleksii

