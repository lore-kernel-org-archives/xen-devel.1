Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 143BDC88E50
	for <xen-devel@archiver.kernel.org>; Fri, 11 Sep 2026 13:06:38 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1416673.1645647 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x50xV-0005Cx-Jz; Fri, 11 Sep 2026 13:06:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1416673.1645647; Fri, 11 Sep 2026 13:06:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x50xV-0005Cq-H9; Fri, 11 Sep 2026 13:06:25 +0000
Received: by outflank-mailman (input) for mailman id 1416673;
 Fri, 11 Sep 2026 13:06:24 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1x50xU-0005CS-H6
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2026 13:06:24 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x50xT-003pAV-Tz
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2026 15:06:23 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6aa3fccc-bab6-0a2a0a5309dd-0a2a4508a9ce-8
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 15:06:23 +0200
Received: from [209.85.218.44] (helo=mail-ej1-f44.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6aa3fccf-f659-0a2a45080019-d155da2cd04d-3
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 15:06:23 +0200
Received: by mail-ej1-f44.google.com with SMTP id
 a640c23a62f3a-c2544ff970dso142230066b.2
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 06:06:23 -0700 (PDT)
Received: from [172.19.143.248] (IW396200.net.t-com.hr. [195.29.234.54])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c2966066123sm78334866b.31.2026.09.11.06.06.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Sep 2026 06:06:22 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1789131983; x=1789736783; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eP9Ej9QaQulQbe/bgKPLj+fkdL09Fd17gd2AG8+865o=;
        b=hkY8KPVIGWnKmAgH3/Vn9jh9vYFMgx/eiH14jskrk5lDGA4Fnom5s9Ih4xcRv1T+yD
         s6gNelzYzgWS6o7SemK6j2nMGJta9ymNea2bz3ecGL7f9pibSqzMw12V7n6LSBSCpzBx
         dN4LsWGvGLG1lFWOsgjEmsVetxC1ErtxOS6mfwjNoRlxesVCKMkmWmoxxlng7AIOc3fQ
         7SuqIfKOyDJpj7b5RlF9/xeWH7Z+gPuFlaGJvzEhqdBat5hS66sdfrgbVrYRQnZLDvB5
         nyC4kp6PApT/U+EmKB8MxAvS5aoUzI9XqVyWLMrWKvMN+yDceAixzHG0dGPVC5+1YlJL
         RfeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789131983; x=1789736783;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eP9Ej9QaQulQbe/bgKPLj+fkdL09Fd17gd2AG8+865o=;
        b=NXoTxyJOuXOcUbcOHtRpE+9DKR3FB+PMn4qxgz1NPZCKmeSSBNrljuv1u/cn5fgDL/
         esqLbWo1FlKFrO3by/x5INdlUV8Vl23YTZ/Pca4J3uVuxIZXgOemhvH2QeUH+M4E/ug7
         S5zJepChYL1YCED1NvVheoeLhiaZDkYBzBqIl359TgLrl/h9IxbiiPUj22URiCqQMwLK
         h46bgklY9S8WCKVCP098jSHdiyKmtYpwQAfP+9ryAI7lmMjEcGn2RIqzUV5k4V7181gp
         BRimz6hGhdRY6hESN0WuhfTc/GaBrSt+NYWCLMqCw1rD8eg4nVQ46apB6pvmjlzkqSil
         IKTw==
X-Gm-Message-State: AFuF++mLVgGL9MvWj6sk9U+HGbFPy7l3zDBeabObghN//DLd6vn7f2ry
	U9XxyUc5yBvDLNFn/OlK+/yrJjnw4B1NR+R6iNLiLOmodB3rbvebkDdw
X-Gm-Gg: AYBFou3K9l/NixWpTaXFEnQERxBh6vA6poEBe93PdwpI2j1sRdJ9DDFLbgoSTq1Uyv7
	eEGphjz60OkofnLRUFwKkxmVA2rSeG93STagd1kWj79FukvSiG4GiGuwdX3ws5QXKpZRn5xdaPK
	+JyjZKfsB96Pi+z194TYyDOOHp7NXcLIn3FZVRb62/DXVHbQ0ZOq1YaUSj2LUjGEDgIHbSOyk7X
	jFSmH/wIDcIFc743CYeuPEaE0qXOjuBpFbWAVJlrhwcvvNOkYrFoKDZEAc69K8ye2ZFxobvnK68
	9PTJH8CEOpGiRAi3V3qxjPGSYIsekRrpK/1WF0KKpvNFl/PHTNc9i29RdkkQy3MawoiSLGejVZn
	Cnj0I6qXcaoRacZCgBfV5T3snWEDhXlFT7xKRkHXM+d+bWvUSuHZsunhUMGE8ujdcjUzRHkD2Wa
	3sUOoCovnjOY0BRRjtokw7UxoNjOj2tWMGq7dOyY/jJ9hR/fRIpJFQR88G6ThBb2I2mobVyEIKp
	IgV/2uvtqRyNk01fhr4mdSYuMutanqI
X-Received: by 2002:a17:907:874f:b0:c24:6390:decf with SMTP id a640c23a62f3a-c29665b7776mr168154366b.16.1789131983141;
        Fri, 11 Sep 2026 06:06:23 -0700 (PDT)
Message-ID: <7b743afb-409d-433b-86b9-7ec8be7ad860@gmail.com>
Date: Fri, 11 Sep 2026 15:06:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 22/39] xen/riscv: add guest memory read helper
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
References: <cover.1787838835.git.oleksii.kurochko@gmail.com>
 <b68a29b7ef5b2cb83fde405b3854c94a2f44f4d0.1787838835.git.oleksii.kurochko@gmail.com>
 <1788955499.8631fc262581453bbf619ec5b2062170.1a0860e9b57000c4f3@vates.tech>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <1788955499.8631fc262581453bbf619ec5b2062170.1a0860e9b57000c4f3@vates.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c1860d/1789131983-CCD7087B-1BB3695B/10/73395122804
X-purgate-type: spam
X-purgate-size: 4610



On 9/9/26 2:04 PM, Baptiste Le Duc wrote:
>> Introduce riscv_read_guest() to allow Xen to safely read guest memory
>> using HLV/HLVX instructions while reliably capturing trap context.
> 
>> This is required for instruction fetch emulation and MMIO decoding, where
>> Xen must inspect guest memory that may not be directly accessible and may
>> fault.
>>
>> The implementation is based on kvm_riscv_vcpu_unpriv_read() from Linux,
>> with one deviation: the hlv/hlvx instructions translate the guest address
>> through the live vsatp/hgatp CSRs, i.e. through the address space of the
>> currently running vCPU, so the function can only be called safely for
>> current. Instead of taking a struct vcpu argument, it always operates on
>> current directly.
>>
>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>>
>> diff --git a/xen/arch/riscv/guestcopy.c b/xen/arch/riscv/guestcopy.c
>> index 8a89212e0b..b2327822ac 100644
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
> Nit: every other function in this file / declared in this header
> (raw_copy_from_guest, copy_to_guest_phys, ...) has no riscv_ prefix. Why
> does this one get it?

Agree not to much sense. I will drop it.

>> +{
>> +    /*
>> +     * Poison the result: if the very first access faults, the fixup skips
>> +     * over the loads without writing it. Callers must check trap->scause.
>> +     */
>> +    unsigned long val = ~0UL, tmp;
>>
> The actual "did a trap happen" contract callers rely on is
> trap->scause == 0. If the very first access faults, fixup_exception() will
> write scause accordingly to a non-zero value, but nothing in this function
> clears trap->scause on the success path.

It is because caller is expected to zero-fill trap as it is happening 
now. I will mention that explicitly. I will do the following:

- * @trap: Output pointer to trap details if something went wrong during 
read
+ * @trap: Output pointer to trap details if something went wrong during 
read.
+ *        It must be zero-initialised by the caller: it is written only 
when
+ *        an access faults, so trap->scause == 0 on return is what 
tells the
+ *        caller that the read succeeded.


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
> Just to understand, what is the aim of this check? Is it to be sure this
> function has been called during a guest fault and not a nested HS fault?
> 

Yes.

~ Oleksii



