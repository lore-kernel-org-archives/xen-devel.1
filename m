Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC90DC79F82
	for <xen-devel@archiver.kernel.org>; Tue,  8 Sep 2026 15:27:33 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1412204.1642715 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x3xjD-0001FK-N1; Tue, 08 Sep 2026 15:27:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1412204.1642715; Tue, 08 Sep 2026 15:27:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x3xjD-0001FD-JB; Tue, 08 Sep 2026 15:27:19 +0000
Received: by outflank-mailman (input) for mailman id 1412204;
 Tue, 08 Sep 2026 15:27:17 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1x3xjB-0001F7-PL
 for xen-devel@lists.xenproject.org; Tue, 08 Sep 2026 15:27:17 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x3xjA-00Dphl-Qv
 for xen-devel@lists.xenproject.org; Tue, 08 Sep 2026 17:27:16 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6aa02946-bab6-0a2a0a5309dd-0a2a4501d3a8-36
 for <xen-devel@lists.xenproject.org>; Tue, 08 Sep 2026 17:27:16 +0200
Received: from [209.85.218.53] (helo=mail-ej1-f53.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6aa02954-5984-0a2a45010019-d155da35c1e4-3
 for <xen-devel@lists.xenproject.org>; Tue, 08 Sep 2026 17:27:16 +0200
Received: by mail-ej1-f53.google.com with SMTP id
 a640c23a62f3a-c252e703fa3so736139966b.3
 for <xen-devel@lists.xenproject.org>; Tue, 08 Sep 2026 08:27:16 -0700 (PDT)
Received: from [172.19.143.248] (IW396200.net.t-com.hr. [195.29.234.54])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c260d53c37csm626637366b.32.2026.09.08.08.26.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Sep 2026 08:27:15 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1788881236; x=1789486036; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wwyha5CEvTVTebVQhfueu6paExhbIMYaOo2vqUYwd4E=;
        b=SU6YadpYL6kYCvoSoMoNCV63ZdpH7nTLfUX1IVmuNSXmJZP9KGUHTnwFnhnBcmHaHO
         DpL3vz0Cze99npXmlRBudPiGlfSQpyBx79rkKN6rsCaPIS99kJdviQu+a/s0X7ONfCH6
         VVbmb5zn8JJ9nfhJSbZrJVp/MOXvaSlaJbHrwYHtf5LPAnpcsm1YPFbAbWsD88KrRMKq
         tWlHrJSDTt6it3grTtdyFzK8yQ9rmYgWne+S/i8yB0P3FzaboU4Y2IR1v2AuGCEBoaKf
         q1WdLDZb96LI3IMer+G+NdPGZOMZtDknIlgnTjgpF1lHkVgJRefpwAuPfWKIuI9z3l+Y
         RDSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788881236; x=1789486036;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wwyha5CEvTVTebVQhfueu6paExhbIMYaOo2vqUYwd4E=;
        b=STqcZZxIKWb9hi7OGnGPhO05s6newurSxocCWOSRmPwrMMhuKUa0Ldc8O6zsmEmSW5
         Jk8UpkPBpre8o1CO5HSQ9E9NmmlNGZG4MP9MBo/SoEhC0K2w9VAYVVWydsHcAgM8x5R3
         P5GOZIs13fu86+GNiH08dGKp1VC0TQGATaHJD2zbjAoTfWEZ8WZ3a21/wbiH+V/jMvA+
         ZCKWS5WwE6M//WR6nXS8FoSDTd3AAJ4ohEb4iqDhWXmgWgYxfBAPlIo0R0OtXf3KQNby
         XVuVAxJdfG2lInYA6XMBAfwkt1Dc0ItWtaA45dk8pvh1M3NDsgAnqXYiNj+twBF5ce0s
         E1PA==
X-Forwarded-Encrypted: i=1; AKwUvBztkdDmng5+IbICrdbWif0MdGSPcnBRa83v0Wv5Ka1hLEreWtUzt1FANqi6cfsvBlsLV8+0uoVVCZA=@lists.xenproject.org
X-Gm-Message-State: AFuF++ngdph6mjFIsWk6DwY3rw1HlcmgRh51uUr0P7gWWNwnIXJbB59M
	kAj7bYzOgkrI9qBT1goBPZYDdoKZVEblh5izhQoJ8JYqChLMfGNVmMI6
X-Gm-Gg: AYBFou34KWw/WVHEbA4uHwUTn0jYmd9ETQdKSLYtA4/JqzNK1K/ZuQSVaMpM+997aWf
	2wEoDyJmJlUpWw4LD/QXcZaddLisrcr1MzFU3LUnT6jsF4DPilDIFROqow9vnBx+3hYaRuMIu7J
	0jshDOy1I8vOZ7ItEhAnPuJiU181rI8ondf0xPKS0acaahnbRrRH1GoULOv1CYICktGeFuI26eL
	aNETPDObg/eOQRSHAWEVPMz7ne795KH1VPrUqhEKFp7N9w8Z2qNtjqmJ44HGL6eheRi+L3xD+uV
	zX2RKYx24v+WAMhQfcqwElvpzT1P+ElZ2ei6JJMxvnQpfyuPPdjNMN9xUslNilWnpJVTKKTN4wd
	FqfD1cHqnP+7axD9Q7+PaViEnJFGJ65SF/fc40+CTBnPgYsbhrMVuOj8HTmFzm6ssK+p7ZqFyfY
	izPNzocFYy+2pzUwj8b33xk3MRDPWSh26doxXuUtArH6B6+PEpffccimigXPMHZ0ILzxFjobzY4
	1cbqrbhVLdfGrtRV69OQQ==
X-Received: by 2002:a17:906:ef05:b0:c26:1648:a06b with SMTP id a640c23a62f3a-c261648b772mr1079466866b.38.1788881236097;
        Tue, 08 Sep 2026 08:27:16 -0700 (PDT)
Message-ID: <fad73061-3a1f-4044-bbd4-8792ab74a83b@gmail.com>
Date: Tue, 8 Sep 2026 17:25:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 19/39] xen/riscv: implement trap redirection to a guest
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
 <583b0a190bad7121eae9bc99bd1e13dc1743efe4.1787838835.git.oleksii.kurochko@gmail.com>
 <ae5f1302-8024-44fb-bd2b-6684c90aefef@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <ae5f1302-8024-44fb-bd2b-6684c90aefef@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d62444/1788881236-BF063757-A9E9551C/10/73395122804
X-purgate-type: spam
X-purgate-size: 3132



On 9/8/26 4:16 PM, Jan Beulich wrote:
> On 27.08.2026 17:21, Oleksii Kurochko wrote:
>> --- a/xen/arch/riscv/include/asm/riscv_encoding.h
>> +++ b/xen/arch/riscv/include/asm/riscv_encoding.h
>> @@ -109,6 +109,12 @@
>>   #define SIP_SSIP			MIP_SSIP
>>   #define SIP_STIP			MIP_STIP
>>   
>> +/* stvec/vstvec: MODE is bits [1:0], BASE is bits [XLEN-1:2] */
>> +#define STVEC_MODE_MASK			_UL(0x3)
>> +#define STVEC_MODE_DIRECT		_UL(0x0)
>> +#define STVEC_MODE_VECTORED		_UL(0x1)
> 
> As on earlier occasions: Do the 0x here actually add any value? There are
> none ...
> 
>> +#define STVEC_BASE_MASK			(~STVEC_MODE_MASK)
>> +
>>   #define PRV_U				_UL(0)
>>   #define PRV_S				_UL(1)
>>   #define PRV_M				_UL(3)
> 
> ... here, for example.

Agree, not too much sense.

> 
>> --- a/xen/arch/riscv/traps.c
>> +++ b/xen/arch/riscv/traps.c
>> @@ -294,5 +294,53 @@ enum mc_disposition arch_do_multicall_call(struct mc_state *state)
>>   /* Redirect trap to Guest. */
>>   void trap_redirect(const struct trap_info *trap)
>>   {
>> -    BUG_ON("unimplemented");
>> +    struct cpu_user_regs *regs = vcpu_guest_cpu_user_regs(current);
>> +    unsigned long vsstatus = csr_read(CSR_VSSTATUS);
>> +
>> +    /*
>> +     * Redirecting a trap makes sense only if the trap was taken from
>> +     * virtualized mode, i.e. sret is going to return to VS-mode.
>> +     */
>> +    ASSERT(regs->hstatus & HSTATUS_SPV);
>> +
>> +    /*
>> +     * Only synchronous exceptions can be redirected. Interrupts must be
>> +     * injected via hvip instead, so that the hardware itself performs
>> +     * VS-mode trap entry, respecting vsstatus.SIE and the vectored
>> +     * dispatch (BASE + 4 * cause) if vstvec is configured so.
>> +     */
>> +    ASSERT(!(trap->scause & CAUSE_IRQ_FLAG));
>> +
>> +    /* Change Guest SSTATUS.SPP bit */
>> +    vsstatus &= ~SSTATUS_SPP;
>> +    if ( regs->sstatus & SSTATUS_SPP )
>> +        vsstatus |= SSTATUS_SPP;
>> +
>> +    /* Change Guest SSTATUS.SPIE bit */
>> +    vsstatus &= ~SSTATUS_SPIE;
>> +    if ( vsstatus & SSTATUS_SIE )
>> +        vsstatus |= SSTATUS_SPIE;
>> +
>> +    /* Clear Guest SSTATUS.SIE bit */
>> +    vsstatus &= ~SSTATUS_SIE;
>> +
>> +    /* Update Guest SSTATUS */
>> +    csr_write(CSR_VSSTATUS, vsstatus);
>> +
>> +    /* Update Guest SCAUSE, STVAL, and SEPC */
>> +    csr_write(CSR_VSCAUSE, trap->scause);
>> +    csr_write(CSR_VSTVAL, trap->stval);
>> +    csr_write(CSR_VSEPC, trap->sepc);
>> +
>> +    /*
>> +     * Set Guest PC to Guest exception vector.
>> +     *
>> +     * vstvec's MODE field is not part of the address. Exceptions always
>> +     * target BASE regardless of MODE, so mask it off explicitly instead of
>> +     * relying on the hardwired zero bit of sepc to drop it.
>> +     */
>> +    regs->sepc = csr_read(CSR_VSTVEC) & STVEC_BASE_MASK;
> 
> Nit: Given how much the comment talks about MODE, imo using ~STVEC_MODE_MASK
> here directly (and dropping STVEC_BASE_MASK) might be better.
> 
Agree, it could be dropped. I will update that in v3.

Thanks.

~ Oleksii

