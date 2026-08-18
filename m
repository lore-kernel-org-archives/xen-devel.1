Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2C2FC5DF67
	for <xen-devel@archiver.kernel.org>; Tue, 18 Aug 2026 07:48:10 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1393577.1632397 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwEYE-0000yB-2J; Tue, 18 Aug 2026 07:48:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1393577.1632397; Tue, 18 Aug 2026 07:48:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwEYD-0000y4-Uw; Tue, 18 Aug 2026 07:48:01 +0000
Received: by outflank-mailman (input) for mailman id 1393577;
 Tue, 18 Aug 2026 07:48:00 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wwEYC-0000xk-Js
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2026 07:48:00 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wwEYC-00EHbw-0h
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2026 09:48:00 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a840e18-e002-0a2a0a5209dd-0a2a45059300-34
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 09:47:59 +0200
Received: from [209.85.128.54] (helo=mail-wm1-f54.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a840e2f-4cb1-0a2a45050019-d1558036b5ff-3
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 09:47:59 +0200
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-49557167508so43530815e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 00:47:59 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-482a5b81715sm9961205f8f.35.2026.08.18.00.47.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Aug 2026 00:47:58 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1787039279; x=1787644079; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X73KZPwR54w6SuQCuwA1xe8PBoemaZ6s6A+rL8ZkOhI=;
        b=Mp1z/dmnTu+KZrGS6AL3d85tIw5l4xuckvmPsuTJVS+0ObVLJd+sb9/3A8Ah2yBDo1
         s1tr2wtSBD0WNOOFW3QYNNCTPeLeYIno1jQvKK+3ywi+pXNYePZwnQZnqDEXGMfI1PL0
         0erDZnv8lltR8aplFrMak11Emf9sDO3F1q6Rxj51o5g1nqdc4Ke3RzjBwbVPvG7qDKm7
         Et0HZyA/rD5WF2qQ/ATTtD/TN4EOMowd+L6RAdNvsdIIjD2TItWsN2fm61yv0JX1bbW2
         7Vo/1zUc1OqqJV0KzQfoyOpVffLVQr3NsjK+8IY+GsqhfwNdwOkgu9Hdcg4DXAspW3BF
         7r2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787039279; x=1787644079;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X73KZPwR54w6SuQCuwA1xe8PBoemaZ6s6A+rL8ZkOhI=;
        b=OcOTmxCcMM8ooAcFrMEfMn7fI7Fy+kNyn0jayeHs0hJPc35Qf3n8qLRLftvoL8+bck
         p/tJOva1El+n+S1sqdW/MlGAwOxjHBGSrsXn49hSECilVziuu2y577jB4BIUuD5DrzoC
         XCFA1qrLbMhWZ4v12xAGKg/VAcrST29DR0pdc7xy6yFdpIxIhHydBrMv8Iw5xSUDR/j/
         l/ZjhUuJgl2lA4pUdtANzUD50x5dpPplxt1fVv7F26/ngXMjGO1Aab9r3QxERTSWjglC
         +ZB6OLGsOZuT+pDcBQ6beChzj2hLEiVLk0RyV7DuLAIcXzEQXBihu3fCojtmW2PwBkQR
         VOAg==
X-Forwarded-Encrypted: i=1; AHgh+RpCUY5bAXeV+gnY8sk5fILZmwk9g2aQOLUibe3OWTKpyGUAg3E9guKFkb6Y//g5+JGKL3Y5GSPmyXU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyF63skaGomXwG4R3DFMCKVmX1nCAyLk1AlA5CMi9ZbtOK15MCz
	myhzOvLtSriEVr+P1U9gu/BiFKZ1ZqWXeldt1s8ZXfH2ri5Oee5ZWUTf
X-Gm-Gg: AR+sD12Up3ClvL3uHpe0HpZ9eE1rH9gqdH2QFyzIFH+TYD5QGRpPcgo+VTAnpdK1hxg
	q8BGzfRLSe1qF78GVUW4VvO44ffddAgrT9vC2Pq4r+hUxve9rzf2VF2BDu5iMZ/hHLmHd7fQObi
	GHUcklfKhtTCqIbjzXi8eJrLvF64NjpAj+vGL1MxXrKIkAtp8vtNAborm57KYdsS0NFrALn1zII
	H6g1PeFKiCL9vqM0JBvRs7lhK14FNj2JggX5YbpFMeO5qIHZaKtOFPDsA1+qMuVmwhKyNXK+93r
	zNkHY3I5kckID3kQMKLlpuTEDGWMApJOZ6X+M/iizZYbyQPyBed4ij3W7Rz5SdcGF0xGysWFS2g
	mn3Vn29jfZRPWkjGP/ceCRer0CLhYnR9nudvpRs9TOjqytZUnTG9GSg+/Wy3D47E5lbRXrVmPxm
	xMp/BoSMPmWTrkvo5frsMDn3Eu+hBae21WmCsoqczDs0sXn3Dl1WJdyP//LXSwTEkcR2OVkjzJy
	+bJ+mOdUJG7hTHJWnnISurJGJckRaP4Qji+56Y/Y4As
X-Received: by 2002:a05:600c:358a:b0:496:c06b:9fb4 with SMTP id 5b1f17b1804b1-4999fb940c5mr104040705e9.14.1787039278885;
        Tue, 18 Aug 2026 00:47:58 -0700 (PDT)
Message-ID: <41c9717f-6083-4669-8e60-20a023c3ae8f@gmail.com>
Date: Tue, 18 Aug 2026 09:47:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 15/17] xen/riscv: implement trap redirection to a guest
To: Jan Beulich <jbeulich@suse.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1784560663.git.oleksii.kurochko@gmail.com>
 <8b14a7926e42c7e3308dc7f730334fed56210d81.1784560663.git.oleksii.kurochko@gmail.com>
 <f3ca2cf9-49b9-4515-b634-6de4ae9614ce@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <f3ca2cf9-49b9-4515-b634-6de4ae9614ce@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c201ff/1787039279-24B1D2A1-C778888E/10/73395122804
X-purgate-type: spam
X-purgate-size: 6422



On 8/12/26 6:03 PM, Jan Beulich wrote:
> On 20.07.2026 18:02, Oleksii Kurochko wrote:
>> Some traps taken by Xen on behalf of a guest can't or shouldn't be
>> handled by the hypervisor and must be forwarded to the guest's own
>> S-mode exception handler instead: e.g. when riscv_vcpu_unpriv_read()
>> faults while accessing guest memory, or when emulation hits a condition
>> only the guest kernel can resolve.
> 
> Is the plan to use riscv_vcpu_unpriv_read() also for reading hypercall
> buffers?

Yes, it could also be used to read hypercall buffers, but I don't think 
it's the best option, as hypercall buffers could be larger than 8 bytes 
(which is the size supported by the `hlv` instruction on the RV64 
platform). For that case, I think it would be better to map the Xen page 
corresponding to the GVA of the hypercall buffer and then use the usual 
memcpy(). So, basically, use copy_guest() on RISC-V for that purpose.


> In that case trap redirection shouldn't come into play.

It isn't mandatory to perform a redirection in the case of 
riscv_vcpu_unpriv_read(), so if trap redirection shouldn't happen for 
hypercall buffers, then the caller of riscv_vcpu_unpriv_read() needs to 
handle that properly by checking utrap.cause. Something like:

```
     *insn = riscv_vcpu_unpriv_read(true, regs->sepc, &utrap);
     if ( utrap.scause )
     {
         ...
         utrap.sepc = regs->sepc;
         utrap.stval = utrap.sepc;

         riscv_vcpu_trap_redirect(&utrap);

         return true;
     }
```

So, if this cannot happen in the case of a hypercall buffer, then we 
need to return -EFAULT in the if ( utrap.scause ) case.

I don't think I understand why redirection shouldn't come into play. Do 
you mean that the hypercall buffer will always be available, and that it 
is impossible for the hlv instruction to fail, so there is no point in 
handling redirection at all in this case?

> 
>> Introduce riscv_vcpu_trap_redirect() for that purpose. It makes the
>> trap appear to the guest as if it had been taken directly in VS-mode:
>> the trap information is transferred to the guest's virtual supervisor
>> CSRs and the vCPU is resumed at its exception vector in supervisor
>> mode, following the trap entry rules of the RISC-V privileged
>> specification.
>>
>> The implementation is based on kvm_riscv_vcpu_trap_redirect() from
>> Linux, with a few deviations:
>>   - The function reads and writes physical VS-mode CSRs, so it is only
>>     meaningful for the currently running vCPU. Instead of taking a
>>     struct vcpu argument, it always operates on current.
>>   - The MODE field of vstvec is masked off explicitly when computing the
>>     exception target PC (exceptions always vector to BASE), rather than
>>     relying on the hardwired zero bit of sepc to drop it on VM entry.
>>   - Assertions document the preconditions: the trap must have been taken
>>     from virtualized mode (hstatus.SPV set), and only synchronous
>>     exceptions may be redirected - interrupts must be injected via hvip
>>     instead, so that the hardware performs VS-mode trap entry itself,
>>     respecting vsstatus.SIE and vectored vstvec dispatch.
> 
> For this last bullet point - how is a reviewer supposed to validate the
> assertions added when no caller of the new function exists?

My bad (again). The caller appears in "[PATCH v1 16/17] xen/riscv: add 
guest load emulation for trapped MMIO accesses" (as you already know) so 
I have to re-order patches and put this patch after PATCH v1 16/17.

> 
>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>> ---
>>   xen/arch/riscv/guestcopy.c                | 54 +++++++++++++++++++++++
>>   xen/arch/riscv/include/asm/guest_access.h |  2 +
>>   2 files changed, 56 insertions(+)
> 
> I don't understand this placement - trap redirection has nothing
> (directly) to do with accessing guest memory.

Agree, at some point. I put trap redirection there as the idea was to 
catch trap from hlv{x} instructions and redirect some of them to guest 
so I put it to guestcopy.h.

I will put inside traps.{c,h} instead.

> 
>> --- a/xen/arch/riscv/guestcopy.c
>> +++ b/xen/arch/riscv/guestcopy.c
>> @@ -205,3 +205,57 @@ unsigned long riscv_vcpu_unpriv_read(bool read_insn,
>>   
>>       return val;
>>   }
>> +
>> +/* Redirect trap to Guest. */
>> +void riscv_vcpu_trap_redirect(const struct trap_info *trap)
>> +{
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
>> +     * vstvec[1:0] is the vector MODE, not part of the address. Exceptions
>> +     * always target BASE regardless of MODE, so mask it off explicitly
>> +     * instead of relying on the hardwired zero bit of sepc to drop it.
>> +     */
>> +    regs->sepc = csr_read(CSR_VSTVEC) & ~0x3UL;
> 
> Can there be a proper constant please for this mask?

Sure, I will introduce one.

Thanks.

~ Oleksii

