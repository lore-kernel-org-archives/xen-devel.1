Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E22AAC54F51
	for <xen-devel@archiver.kernel.org>; Wed, 29 Jul 2026 14:55:42 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1376165.1623073 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wp5gq-0006RL-B1; Wed, 29 Jul 2026 14:55:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1376165.1623073; Wed, 29 Jul 2026 14:55:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wp5gq-0006R7-4N; Wed, 29 Jul 2026 14:55:24 +0000
Received: by outflank-mailman (input) for mailman id 1376165;
 Wed, 29 Jul 2026 14:55:22 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wp5go-0006Qg-Bk
 for xen-devel@lists.xenproject.org; Wed, 29 Jul 2026 14:55:22 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wp5gn-0081HR-LI
 for xen-devel@lists.xenproject.org; Wed, 29 Jul 2026 16:55:21 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a6a1448-5cb7-0a2a0a5109dd-0a2a450bc6a2-46
 for <xen-devel@lists.xenproject.org>; Wed, 29 Jul 2026 16:55:21 +0200
Received: from [209.85.128.49] (helo=mail-wm1-f49.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a6a1459-b7e8-0a2a450b0019-d1558031d059-3
 for <xen-devel@lists.xenproject.org>; Wed, 29 Jul 2026 16:55:21 +0200
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-495757ccbc1so9397695e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 29 Jul 2026 07:55:21 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49764d8e826sm72091585e9.8.2026.07.29.07.55.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Jul 2026 07:55:20 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1785336921; x=1785941721; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HgvdKqXyF3bMTX7gY8PgbzMsQrub0x/2x6Dt27RpWaM=;
        b=NyumVrcdXduB9zUNw1PNAGpArbOALbakinXK0xvBUa8UmhjfGu6jWd/hTHqmwz5Ce9
         9e4bpo4avTjVagc9SejyIspgSNZj3wPMV7n3PdhqLY0H0OJqT6w+lm7gnUyAdOYM1nh3
         3SVfng0QbchjyAJjFRim3TpHnu0w1HFhyLmRET9lwD8+Q+M76cnlzN/lkvzFE9FyFDvn
         Edc0OTImFg1nAwNwgDhp1KK+L0pmLwNib0c3JoJIHGBbs7dmRr35QWZkcKViGPbSezjq
         8YAj9RsS45ciP8BdJXMSz3jmhsWHUaojGCnlhw89UpaM7IP8ZZtNCzNkmbJ+/5rYXmAL
         bU2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785336921; x=1785941721;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HgvdKqXyF3bMTX7gY8PgbzMsQrub0x/2x6Dt27RpWaM=;
        b=g9ygLpg9HqxWjPz77mvCb+mPWgNUadTEiALuPGrEpUWEENEKmwGuxvKdW15kib2bWx
         VdJDvwXlS40qTAFsbHvGIeN/GrOIe+5DrvHg1/+BZpUrEuFMuSV+ZFBpH/7CGeMkimOe
         ZNA/WCcydY9pqXMiO5ZXlXVc/7EQ8lGeRxTD3O+w5PMMXLJ2FtGTrAh7vu8S1OPTz8cs
         IF826bwwWXPR+cSfSUouQ2nvjxqa1kFWq+N3tGG26qMfg58cboaQ/TGAclgGXVxo6h8p
         oBrinJqlQFDJTXiOt0OQTp1wmS6iHAtgLQX8YOl6ElSS2F7xE/9XLqFz/IUd0ljXPW26
         oIsg==
X-Forwarded-Encrypted: i=1; AHgh+Rp5WZxITdkbv4LHRW8vDaLPvoi/HwHtWundr/ZS6uQ2wgvju4yxXy/inWn1Lm5yESwnVX+D4WLbacg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxZwxGyZp7cOzmCNuQfHY/pOLyx20Js/PfIhfSB4uvexUgwCJQb
	HaXF7gmvYYL4tcjNq2OIqohP6X4bcCS9lWXYWU1TWkkU7fddZD+cQAn0
X-Gm-Gg: AR+sD11XwK1B7HHh+AAWyh779Db7y6DgzK1cmz9++wiu7j98cMdZzxarcUOLcyauehV
	7zzJeHKa5XQ8c+1OBv7CqcNnz/mBD2uak+TlRlFs4aQcpzDs84lfMgDoOrq6QQk9+gHYJtWpjJy
	3IPdYkTOy0XFX7JTLmkf5JNMBrSGlc1+Kt8IRiNlwhO+4GMi8H0MtJquK6eQfa+nMIxaoZtlrZl
	Fzn8eJkr6IO0wRIvGonopbHir5TzNyfhaKdfO66gO809drX3rQvMcW0/SayYY4olpYaJV6VItqf
	A1RZrQiQzSRY08NWPIWGkgUS9Y/uQ27VLV3XiZvwjeUyYlfgjktW/qGEAOGzkIVtPawHuGKh11B
	btrO/T6czNVmxpn0KZYssa/teo11/WME/TI+7q/GP3F8RA38pkZOUSBKdrIGVihBjrIoXzCt6im
	LfMTCUKf6/a2UqhhzFDIpNnuIglyM+O8PFjsaYhBzkBmIuWNIvNHho85F+rJXh3YXaRUhos2tBr
	O7hl7T0zhHj8v7+B6YVJu6lRK6s0Zm9yyEpaGosXW0=
X-Received: by 2002:a05:600c:4744:b0:495:4c74:6a14 with SMTP id 5b1f17b1804b1-496c6438e91mr78373775e9.14.1785336920820;
        Wed, 29 Jul 2026 07:55:20 -0700 (PDT)
Message-ID: <191a9ddc-9f37-4d26-9141-7dfaf88cb26c@gmail.com>
Date: Wed, 29 Jul 2026 16:55:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 02/17] xen/riscv: add basic VGEIN management for AIA
 guests
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
 <b141b8d976719bb9b76147cacfd5842fb7aac74e.1784560663.git.oleksii.kurochko@gmail.com>
 <6501f040-ea59-4e78-8854-030f786dbcf7@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <6501f040-ea59-4e78-8854-030f786dbcf7@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-42698a/1785336921-1BED69EA-7CF7403B/10/73395122804
X-purgate-type: spam
X-purgate-size: 9183



On 7/27/26 5:41 PM, Jan Beulich wrote:
> On 20.07.2026 18:02, Oleksii Kurochko wrote:
>> It was decided to add support for IMSIC from the start instead of having APLIC
>> operate in direct delivery mode, as it requires a trap-and-emulation approach,
>> which is not optimal from a performance standpoint.
>>
>> AIA provides a hardware-accelerated mechanism for delivering external
>> interrupts to domains via "guest interrupt files" located in IMSIC.
>> A single physical hart can implement multiple such files (up to GEILEN),
>> allowing several virtual harts to receive interrupts directly from hardware.
>>
>> Introduce per-CPU tracking of guest interrupt file identifiers (VGEIN)
>> for systems implementing AIA specification. Each CPU maintains
>> a bitmap describing which guest interrupt files are currently in use.
>>
>> Add helpers to initialize the bitmap based on the number of available
>> guest interrupt files (GEILEN), assign a VGEIN to a vCPU, and release it
>> when no longer needed. When assigning a VGEIN, the corresponding value
>> is written to the VGEIN field of the guest hstatus register so that
>> VS-level external interrupts are delivered from the selected interrupt
>> file.
> 
> And when exactly is this "assignment" intended to occur? vgein_assign() and
> vgein_release() have no callers here, so this remains entirely unclear.

[A] Agreed, I should have added that information to the commit message:

VGEIN is assigned (via vgein_assign()) before jumping to the new vCPU 
execution context (in continue_new_vcpu()) and is re-assigned during 
vCPU migration from one pCPU to another.

VGEIN is released (via vgein_release()) on the old pCPU during migration.


> 
>> @@ -14,10 +36,133 @@ bool aia_usable(void)
>>       return _aia_usable;
>>   }
>>   
>> +static int vgein_init(unsigned int cpu)
>> +{
>> +    struct vgein_ctrl *vgein = &per_cpu(vgein, cpu);
>> +
>> +    csr_write(CSR_HGEIE, -1UL);
>> +    vgein->geilen = flsl(csr_read(CSR_HGEIE) >> 1);
>> +    csr_write(CSR_HGEIE, 0);
>> +
>> +    printk("cpu%u.geilen=%u\n", cpu, vgein->geilen);
> 
> At most dprintk(), I'd say. Better drop altogether.

I will drop it.

> 
>> +    if ( !vgein->geilen )
>> +        return -EOPNOTSUPP;
>> +
>> +    vgein->owners = xvzalloc_array(struct vcpu *, vgein->geilen);
>> +    if ( !vgein->owners )
>> +        return -ENOMEM;
>> +
>> +    spin_lock_init(&vgein->lock);
>> +
>> +    return 0;
>> +}
>> +
>> +static int cf_check cpu_callback(struct notifier_block *nfb, unsigned long action,
> 
> Nit: Line length.
> 
>> +                        void *hcpu)
> 
> Nit: Indentation.
> 
>> +{
>> +    unsigned int cpu = (unsigned long)hcpu;
>> +    int rc = 0;
>> +
>> +    switch ( action )
>> +    {
>> +    case CPU_STARTING:
>> +        rc = vgein_init(cpu);
>> +        if ( rc )
>> +            printk("AIA: failed to init vgein for CPU%u\n", cpu);
>> +        break;
>> +    }
>> +
>> +    return notifier_from_errno(rc);
>> +}
> 
> Where's the freeing of the allocation vgein_init(), when CPU bringup fails
> or a CPU was brought down?
I'll add the following:

case CPU_UP_CANCELED:
case CPU_DEAD:
     vgein_free(cpu);
     break;

and:

static void vgein_free(unsigned int cpu)
{
     struct vgein_ctrl *vgein = &per_cpu(vgein, cpu);

     ASSERT(!vgein->bmp);

     vgein->geilen = 0;
     XVFREE(vgein->owners);
}

I'm also wondering whether vgein_init() should be moved to 
CPU_UP_PREPARE. If vgein_init() fails in CPU_STARTING, the hypervisor 
will stop instead of simply ignoring the CPU.

However, in CPU_UP_PREPARE we don't yet know the value of GEILEN, which 
is needed to allocate vgein->owners. As I understand it, CPU_UP_PREPARE 
is not executed on the CPU that is being brought up.


> 
>> +static struct notifier_block cpu_nfb = {
>> +    .notifier_call = cpu_callback,
>> +};
>> +
>>   void __init aia_init(void)
>>   {
>> +    int rc;
>> +
>>       if ( !riscv_isa_extension_available(NULL, RISCV_ISA_EXT_ssaia) )
>> +    {
>> +        dprintk(XENLOG_WARNING, "SSAIA isn't present in riscv,isa\n");
>>           return;
>> +    }
>> +
>> +    if ( (rc = vgein_init(0)) )
>> +    {
>> +        dprintk(XENLOG_ERR, "vgein_init() failed: %d\n", rc);
>> +        return;
>> +    }
>>   
>>       _aia_usable = true;
>> +
>> +    register_cpu_notifier(&cpu_nfb);
>> +}
>> +
>> +unsigned int vgein_assign(struct vcpu *v)
>> +{
>> +    unsigned int vgein_id;
>> +    struct vgein_ctrl *vgein = &per_cpu(vgein, v->processor);
>> +    unsigned long *bmp = &vgein->bmp;
>> +    unsigned long flags;
>> +
>> +    if ( !vgein->geilen )
>> +        return 0;
>> +
>> +    spin_lock_irqsave(&vgein->lock, flags);
> 
> Because it's unclear where this is to be called from, it's also unclear whether
> a lock is needed here (and if so whether a plain spin lock is appropriate).

Based on what I wrote in [A] above a lock is defintely needed as it 
could be that vgein_release() is called for old pCPU during migration 
and at the same time old pCPU could call vgein_assign() so we want to 
keep vgein bitmap consistent.

Regarding why _irqsave() it is mostly connected to ...

> 
>> +    /*
>> +     * The vgein_id shouldn't be zero, as it will indicate that no guest
>> +     * external interrupt source is selected for VS-level external interrupts
>> +     * according to RISC-V privileged spec:
>> +     *   Hypervisor Status Register (hstatus) in RISC-V privileged spec:
>> +     *
>> +     *   The VGEIN (Virtual Guest External Interrupt Number) field selects
>> +     *   a guest external interrupt source for VS-level external interrupts.
>> +     *   VGEIN is a WLRL field that must be able to hold values between zero
>> +     *   and the maximum guest external interrupt number (known as GEILEN),
>> +     *   inclusive.
>> +     *   When VGEIN=0, no guest external interrupt source is selected for
>> +     *   VS-level external interrupts.
>> +     *
>> +     * So start to search from bit number 1.
>> +     */
>> +    vgein_id = find_next_zero_bit(bmp, vgein->geilen + 1, 1);
>> +
>> +    if ( vgein_id > vgein->geilen )
>> +        vgein_id = 0;
>> +    else
>> +    {
>> +        __set_bit(vgein_id, bmp);
>> +        vgein->owners[vgein_id] = v;
> 
> Again somewhat related to is being unclear how the function is going to be used,
> it also remains unclear what ->owners[] is going to be needed for. Right now the
> array is only ever written to.

->owners[] is used in IRQ context to wake up a vCPU. For example, if a 
vCPU has been descheduled, we need to set the corresponding CSR_HGEIE[] 
bit so that when an interrupt associated with that vCPU occurs, it traps 
into the hgei_interrupt() handler, which then wakes the vCPU. (all of 
that isn't introduced now but I thought it would be useful to track 
->owners[] just from the start).

Since ->owners[] is accessed from both IRQ-safe (hgei_interrupt()) and 
IRQ-unsafe (vCPU migration) contexts, we specifically need the 
_irqsave() variant of the lock.

To make this clearer, I'll add the following to the commit message (if 
that helps):
```
Along with the bitmap, track which vCPU owns each guest interrupt file
id. Nothing consumes this yet, but it is filled in from the start as
the owner is what a guest external interrupt handler needs: a guest
interrupt file stays enabled in hgeie while its vCPU is descheduled, so
an interrupt targeting that file traps to Xen, which then has to find
the vCPU it belongs to in order to wake it up.

While the tracking is per-CPU data, it isn't accessed only locally: a
guest interrupt file belongs to the pCPU a vCPU is going to run on, so
it is allocated and released by whichever CPU is handling the vCPU at
the time: the release side is even passed the target CPU explicitly.
Hence a lock is needed. It has to be the IRQ-safe variant, as the
tracking is also going to be read from interrupt context on the CPU
owning it.
```
> 
>> +    }
>> +
>> +    spin_unlock_irqrestore(&vgein->lock, flags);
>> +
>> +#ifdef VGEIN_DEBUG
>> +    gprintk(XENLOG_DEBUG, "%s: %pv: vgein_id(%u), xen_cpu%u_bmp=%#lx\n",
>> +           __func__, v, vgein_id, v->processor, *bmp);
>> +#endif
>> +
>> +    return vgein_id;
>> +}
>> +
>> +void vgein_release(struct vcpu *v, unsigned int vgein_id)
>> +{
>> +    unsigned long flags;
>> +    struct vgein_ctrl *vgein = &per_cpu(vgein, v->processor);
>> +
>> +    if ( !vgein_id )
>> +        return;
>> +
>> +    spin_lock_irqsave(&vgein->lock, flags);
>> +    __clear_bit(vgein_id, &vgein->bmp);
>> +    vgein->owners[vgein_id] = NULL;
> 
> If already you track the vCPU, also assert that prior to clearing the array
> slot it has the expected value? For the bit being cleared, maybe also
> 
>      if ( !__test_and_clear_bit(vgein_id, &vgein->bmp) )
>          ASSERT_UNREACHABLE();
> 
> ? Yet as said - much remains unclear without knowing how all of this is
> meant to be used.

It makes sense. I will add that.

Thanks.

~ Oleksii

