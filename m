Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 531ECC88E50
	for <xen-devel@archiver.kernel.org>; Fri, 11 Sep 2026 13:57:40 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1416823.1645747 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x51kn-0001tV-Km; Fri, 11 Sep 2026 13:57:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1416823.1645747; Fri, 11 Sep 2026 13:57:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x51kn-0001tO-Hp; Fri, 11 Sep 2026 13:57:21 +0000
Received: by outflank-mailman (input) for mailman id 1416823;
 Fri, 11 Sep 2026 13:57:21 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1x51km-0001tI-TF
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2026 13:57:21 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x51km-005ywc-AF
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2026 15:57:20 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6aa408b6-e002-0a2a0a5209dd-0a2a4506d468-28
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 15:57:20 +0200
Received: from [209.85.218.42] (helo=mail-ej1-f42.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6aa408c0-195a-0a2a45060019-d155da2ae851-3
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 15:57:20 +0200
Received: by mail-ej1-f42.google.com with SMTP id
 a640c23a62f3a-c2949ed8cc3so171583166b.2
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 06:57:20 -0700 (PDT)
Received: from [172.19.143.248] (IW396200.net.t-com.hr. [195.29.234.54])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c2965c4e8a1sm82574266b.6.2026.09.11.06.57.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Sep 2026 06:57:18 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789135039; x=1789739839; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5R5D8b6GEhEM/RD6SEmaUMoO1v69d+lcdiaMdf3I9zc=;
        b=Vho4hyKC/N3fCTYWOm1fj2HoSDF8SR+mpllIqmyO3Ad/ioBn13jZEt6ahAg1QIA7/8
         E3HmTXXNpZD9N4DEKvmlYY2N5PRBAekedyOEESLrrIbgvWTPBa/Kx2goAEqTw57MIH8V
         uyxEOEhbxfgNzXLhyFxb6atty0zCDnHrcmYi3Uel/yhTd8gt2SwinjLhemImuBTCYaLL
         M1Bu8ZmMOM0Ri9qDlAccafN91ElB1MGnp/Hg5kfB1hzD0/9zIRa7Y5Swk+klGMFKHI9t
         WuNBt7rOIqY55JJUHAvdbaUvI32nLQN/fWlQ8IiDNe9VCPPpqIAbyVibOVhbshE9ScVp
         HlEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789135039; x=1789739839;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5R5D8b6GEhEM/RD6SEmaUMoO1v69d+lcdiaMdf3I9zc=;
        b=Y2ZjQJu7xbn1rjZn00/t3WxhZcwBdZt7Fm9uO7P8+BRi1UfdusFXcPW0Uli3HS6WkD
         hk7Ayt6QAusia9iXF0chuZtvvaFnWaoJexG9AFZTI4itVfg1A1OETUkkQdr6lfgSsQJS
         kLYuMpnobIAn6Fd1NB3dOe9O22/bHaeaucLkkP2YPuPmeX8WHk20AH5b3aZiCTfOZ7MJ
         u2NUfAdgTD6n6VtpLfKsXbngWXjZOCs0lQkByJEJL72W+Dtsb3Jm2+UJrCK4gjp+j6oe
         fWK5Vi7vhssGcfHYNi+GmmsEeWpKXAeSTgCPHxSOPKN9xhKCOtXmjR6QC8WlB8KV2Y2h
         oiTg==
X-Forwarded-Encrypted: i=1; AKwUvBxcWYLvrm4aY5t41vYbfJA2WQS+7kjZnO5VDk2EHc010Mt/tvjKZwZtlQ7UHLf9io2teK9HUioyXqg=@lists.xenproject.org
X-Gm-Message-State: AFuF++mSed55JYwiesJSZo9JyVeCtUHP6MXQ8/n+fU9xM5tw3CR4Gx+s
	akv/gfIN20VdauCpxc6k4Y64HSvLk0y8iqz06vMWIuHjRXKXAJS4wm3w
X-Gm-Gg: AYBFou3zIKq9qzB/5EXj7Oz70Czusy5TVXWabS1W12iOAolH1v6prz+Bw+6XP1xvPnO
	hu46+Q7QLZoK+tjibhTWOD3xdCMl12ZTi/6xaqekp/NdTf3YXX7Ni8L2Zs1uFEvNX/Pqea5h5Hb
	uRqUqcKD8Aua5SiwVMB2djeehpqIMY0zcOmjebze96wxvC8aSyx/TuS+3YYjOt5D6jRlSj1GoSc
	jkk9rTxKg1XZVtnyKdIitzxBZoDKQ6CU8Mjdb8n8jXsq1MorUW3m740Tsvx+1bLj7vm853Eya1e
	eUqJIYPi1gQtsebdUANScbyDgHAfLpApb12x+iXOCAoXv65ZTS20xei7wSjXpntxHF/C4q+a3mM
	BFWrPHhF9xYf6SkogC2BxfC78viwq1NoUWoIfxeNldpLdg3O0r31sV1KcNRUs3VbBtEFZWEsC4c
	ylETO/NZs2boshcDo3FOq02GiAnlNeex/r1BH7dgoun0maS2TEZ2PAaCd5UQaahnvGrGA0Z9my0
	s1Df8GKXpbbpTO0yorIsFM5liB1PbAx
X-Received: by 2002:a17:907:1992:b0:c29:4553:b27 with SMTP id a640c23a62f3a-c296673a4aamr204186166b.42.1789135038650;
        Fri, 11 Sep 2026 06:57:18 -0700 (PDT)
Message-ID: <895ad4e5-37cd-4a1e-bc49-9a69ab00a920@gmail.com>
Date: Fri, 11 Sep 2026 15:57:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 22/39] xen/riscv: add guest memory read helper
To: Jan Beulich <jbeulich@suse.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 Zheng Zhang <zhangzheng@iscas.ac.cn>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1787838835.git.oleksii.kurochko@gmail.com>
 <b68a29b7ef5b2cb83fde405b3854c94a2f44f4d0.1787838835.git.oleksii.kurochko@gmail.com>
 <e1b02a7a-24b4-4500-a690-313c823280f6@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <e1b02a7a-24b4-4500-a690-313c823280f6@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-16d1c6/1789135040-F4A0477B-1A562056/10/73395122804
X-purgate-type: spam
X-purgate-size: 4993



On 9/10/26 5:28 PM, Jan Beulich wrote:
> On 27.08.2026 17:21, Oleksii Kurochko wrote:
>> --- a/xen/arch/riscv/guestcopy.c
>> +++ b/xen/arch/riscv/guestcopy.c
>> @@ -6,6 +6,7 @@
>>   #include <xen/string.h>
>>   
>>   #include <asm/guest_access.h>
>> +#include <asm/traps.h>
>>   
>>   #define COPY_from_guest     0U
>>   #define COPY_to_guest       BIT(0, U)
>> @@ -114,3 +115,89 @@ unsigned long copy_to_guest_phys(struct domain *d, paddr_t gpa, void *buf,
>>       return copy_guest(buf, gpa, len, GPA_INFO(d),
>>                         COPY_to_guest | COPY_gpa);
>>   }
>> +
>> +/*
>> + * Read machine word from guest memory
>> + *
>> + * @guest_addr: Guest address to read
>> + * @read_insn: Flag representing whether we are reading instruction
>> + * @trap: Output pointer to trap details if something went wrong during read
>> + *
>> + * The hlv/hlvx instructions translate guest_addr through the live
>> + * vsatp/hgatp CSRs, so the read is only meaningful for the address
>> + * space of the currently running vCPU.
>> + *
>> + * At most two halfwords are fetched when @read_insn is true, i.e. encodings
>> + * wider than 32 bits are not supported. Such an encoding cannot be completed
>> + * by calling this function again at @guest_addr + 4: the length check is
>> + * applied to the first halfword read, which would then be a continuation of
>> + * the instruction rather than its opcode. It is up to the caller to reject
>> + * anything that is neither a 16- nor a 32-bit encoding.
>> + */
>> +unsigned long riscv_read_guest(unsigned long guest_addr, bool read_insn,
>> +                               struct trap_info *trap)
>> +{
>> +    /*
>> +     * Poison the result: if the very first access faults, the fixup skips
>> +     * over the loads without writing it. Callers must check trap->scause.
>> +     */
>> +    unsigned long val = ~0UL, tmp;
>> +
>> +    /*
>> +     * hlv/hlvx use hstatus.SPVP for the privilege of the access, and the
>> +     * live vsatp/hgatp for the translation. Xen never installs a value of
>> +     * its own in hstatus (it is only saved on trap entry and restored
>> +     * before sret) and it doesn't reschedule before returning to the
>> +     * guest, so all three still belong to the vCPU which trapped.
>> +     *
>> +     * Check the saved copy rather than the live CSR: a nested trap taken
>> +     * from HS-mode clears hstatus.SPV in the CSR (but leaves SPVP alone).
>> +     */
>> +    ASSERT(vcpu_guest_cpu_user_regs(current)->hstatus & HSTATUS_SPV);
> 
> The first paragraph talks of just hstatus.SPVP. The second paragraph then
> starting "Check ..." means that still refers to hstatus.SPVP, when - aiui -
> hstatus.SPV is meant.
> 
> Furthermore, instead of special casing nested faults here, but otherwise
> saying "Xen doesn't modify", wouldn't it be better to word things such
> that they remain correct if Xen ends up having a need to touch some other
> part of hstatus (including, potentially, SPV)? IOW - I think it is natural
> that the original guest value is checked.

You are right:
1. The transition between the two paragraphs was confusing regarding 
SPVP vs SPV. I will update the comment to clearly distinguish that 
hlv/hlvx rely on SPVP, whereas the ASSERT verifies SPV.

2. Re-phrasing this around the invariant that vcpu_guest_cpu_user_regs 
represents the guest state at trap entry makes much more sense and is 
future-proof against any potential changes to live hstatus manipulation 
in Xen.

3. Regarding the value of the ASSERT: yes, for any valid guest trap 
frame SPV must be set. The ASSERT serves as a sanity check to ensure 
riscv_read_guest() is never accidentally invoked outside a valid guest 
vCPU trap context.I will update the comment as follows in v3:

/*
      * hlv/hlvx instructions use the live hstatus.SPVP for access 
privilege,
      * and live vsatp/hgatp for translation. Since Xen does not reschedule
      * before returning to the guest, these CSRs still belong to current.
      *
      * Check SPV in the saved guest registers rather than the live CSR:
      * the saved copy reflects the guest virtualization mode (V=1) at 
the time
      * of trap entry, which remains invariant even if nested traps or 
HS-mode
      * execution modify the live CSR.
      */
     ASSERT(vcpu_guest_cpu_user_regs(current)->hstatus & HSTATUS_SPV);

> Question being of how much value
> that checking is: vcpu_guest_cpu_user_regs(current)->hstatus can't possibly
> have SPV clear, can it? Only nested exception frames could.

Given that vcpu_guest_cpu_user_regs(current)->hstatus will always have 
SPV set for any valid guest trap frame, the ASSERT is purely a defensive 
sanity check to ensure riscv_read_guest() is never called outside a 
guest trap context. Would you prefer to keep this defensive ASSERT (with 
the updated comment), or drop it as redundant?

Thanks.

~ Oleksii


