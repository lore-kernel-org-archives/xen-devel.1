Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD6C7C982E6
	for <xen-devel@archiver.kernel.org>; Mon, 21 Sep 2026 14:01:35 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1427576.1650370 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8eaB-0002km-IO; Mon, 21 Sep 2026 14:01:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1427576.1650370; Mon, 21 Sep 2026 14:01:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8eaB-0002kf-Fk; Mon, 21 Sep 2026 14:01:23 +0000
Received: by outflank-mailman (input) for mailman id 1427576;
 Mon, 21 Sep 2026 14:01:22 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1x8eaA-0002kZ-2Q
 for xen-devel@lists.xenproject.org; Mon, 21 Sep 2026 14:01:22 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x8ea9-00Cj9K-FS
 for xen-devel@lists.xenproject.org; Mon, 21 Sep 2026 16:01:21 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6ab138b1-2eae-0a2a0a5409dd-0a2a450bd130-2
 for <xen-devel@lists.xenproject.org>; Mon, 21 Sep 2026 16:01:21 +0200
Received: from [74.125.228.76] (helo=mail-ed2-f12.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6ab138b1-b7e8-0a2a450b0019-4a7de44cee43-3
 for <xen-devel@lists.xenproject.org>; Mon, 21 Sep 2026 16:01:21 +0200
Received: by mail-ed2-f12.google.com with SMTP id
 4fb4d7f45d1cf-6a98604f6b4so4303357a12.2
 for <xen-devel@lists.xenproject.org>; Mon, 21 Sep 2026 07:01:21 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-71-234.play-internet.pl.
 [109.243.71.234]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6aa67c6f08fsm4303325a12.4.2026.09.21.07.01.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Sep 2026 07:01:20 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1789999281; x=1790604081; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j9ecClcqKW23CSOksqZ/k7uqVZyp4FeUorxA6jT1FlQ=;
        b=nLktRQF3hJTfxB549t1PtxpTUWWlPlxVOxo9zoZ2t22P6x4M4FTC+8UoF+fozOxJL8
         F/AsSN6n6HC5AdWEQ8xK4Fc8YMlNzqvWy2qoWSD1F6kaHt4PPyI1o0Hgt8f7MlCcMDSX
         QcdSRSsH5xKBcPSZp0ee1gj0nRbLauuSaxpCuBZbIbFepb5JDuO+Zpywji+nJ/Fk6OqT
         /Cr/El6imN2YNx++NGh3UdtEk8niiHKFaunY/zTcFBobJ67ixq+wajqyrpLi1L2g67RI
         QM61z+XyJSj1u3rQsys+vWoNPS8QDp09uGuqGi2CAWy9mFiFhwq1RElvJSZWOkCfpKgO
         xy9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789999281; x=1790604081;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j9ecClcqKW23CSOksqZ/k7uqVZyp4FeUorxA6jT1FlQ=;
        b=i1MGVW06RGYpsOxpmVFPE4UDym9sGzPcTGtSk9UW74eVfWBCek0bGRresXzvr3DZ2d
         ezAEppMp1B0DtrFiN6gKDE5u1dpItzPcnK8z8mNtRNxKfyIIU+nvS+oiq3YtFqaHoM+O
         8zHdmeTjVqjUnMtqR0Pouv8TgJ9bGkp/MgJ5rLZQhi41Bm/luB3og3dNh2JwZdhFiBWN
         oXA8SMd9yBJWwUW/7h2ZwyeK4SDjbPx7eXiWMDTCOyGgYKTWYZEIZbvn0/FSMUl1v7Zh
         qc29fPMpdhMaCSjcJwthgA92TnHMrl5b3gN2pPtqKOCjGskQ4C4EXp0GqWiiEqBmv25a
         0zYQ==
X-Forwarded-Encrypted: i=1; AKwUvBzbuJejHAmreIL9j0qGDWGfbJj7O8P8gUKeKvYinkb5fLMYhpaYLFEPTolLj2irpLMQzee2k5D7XPc=@lists.xenproject.org
X-Gm-Message-State: AFuF++nDTkS6u7/lWNc7rXLlhtdAZUcskxrKIGmRMys8bNvfFlrTuu2X
	xM4E8TtEUW7q/CKDN6/57TSgoxSsfNZYEWY9Rh8T12WZyMXAaPYxADWf
X-Gm-Gg: AYBFou0y40EZ/aitwqNM4kRFQaonQxKLMJbDTE9AVYN8AYWL0w209rskwiRfUAnfSA/
	hQd2oby21NFj/c38y0sN2A556KuJEjxLkzUx4UucZaQGh5xr1GNIlIiHVevSVzrsgDKhzMMPYGf
	7G7O8btVDWBpiD9TEpyEbrANGkGFAc3TN1af93qv1jwDBmTnVifaJxbxbFu/7hNXRXGMTP23EKH
	/D5EoIMLoJe9kH4NG2rjXRYNlPLJr1VaF+n+GuZQmb/lO6bMpbMDzOc4f6Bwzdhx1ghEF9dWoDL
	G338WFrAQdUtWuSn+RISlbTvNdGnosyXpeNSZk1xPbZM/3g2gNOQBu6mgthHp/gNa48isUkQZrt
	1LIsDd5IeMKwucDthrgfViAs+NiHUlq4y0OohZ3P7XeeaB9Zl9sK/e0e8/YsKXgUwyNAanuLSnu
	tzY5lzjRN5R8BH8kndYWDHbb2nmsHMdFzId6rM09UsPVTQGBL0ANOke+pdvsE2F2uXzB6+yZILy
	4BNZAAfWu/qDVphvB6K8BsyIbh0AkjxH/5qNfLdRnVKHNjMuTZzGttldi5k
X-Received: by 2002:a05:6402:1e92:b0:6aa:985c:7bae with SMTP id 4fb4d7f45d1cf-6aa985c7caemr558322a12.20.1789999280506;
        Mon, 21 Sep 2026 07:01:20 -0700 (PDT)
Message-ID: <c95ed9c6-1c0e-40fc-9e7a-635589605194@gmail.com>
Date: Mon, 21 Sep 2026 16:01:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 36/39] xen/riscv: wake up a descheduled vCPU on a guest
 external interrupt
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
 <ed5a8b4d8137d9ce2f291956d19fbeaf61cce7a9.1787838835.git.oleksii.kurochko@gmail.com>
 <9260a8cb-66f0-4eba-b630-666039bf2e72@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <9260a8cb-66f0-4eba-b630-666039bf2e72@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-42698a/1789999281-19AC09EA-8BA7ADC9/10/73395122804
X-purgate-type: spam
X-purgate-size: 8235



On 9/18/26 2:52 PM, Jan Beulich wrote:
> On 27.08.2026 17:21, Oleksii Kurochko wrote:
>> @@ -62,23 +69,25 @@ static int cf_check cpu_callback(struct notifier_block *nfb,
>>                                    unsigned long action, void *hcpu)
>>   {
>>       unsigned int cpu = (unsigned long)hcpu;
>> -    int rc = 0;
>>   
>>       switch ( action )
>>       {
>>       case CPU_STARTING:
>> -        rc = vgein_init();
>> +    {
>> +        int rc = vgein_init();
>> +
>>           if ( rc )
>>               printk(XENLOG_ERR "AIA: failed to init vgein for CPU%u: %d\n",
>>                      cpu, rc);
>>           break;
>> +    }
>>   
>>       case CPU_DYING:
>>           vgein_deinit();
>>           break;
>>       }
>>   
>> -    return notifier_from_errno(rc);
>> +    return NOTIFY_DONE;
>>   }
> 
> What is this hunk doing in this patch? Was this meant to be merged into the
> prior one?

Yes, it was meant to be a part of prev. patch.

> But then - why?

I had a case with what rc returns but looking at my downstream branches 
I don't face this case anymore so this hunk should be just dropped.

> 
>> @@ -168,3 +181,36 @@ void vgein_release(struct vcpu *v, unsigned int vgein_id, unsigned int cpu)
>>               __func__, v, vgein_id, cpu, vgein->bmp);
>>   #endif
>>   }
>> +
>> +void hgei_interrupt(void)
>> +{
>> +    unsigned long hgei_mask, flags;
>> +    struct vgein_ctrl *vgein = &this_cpu(vgein);
>> +
>> +    hgei_mask = csr_read(CSR_HGEIP) & csr_read(CSR_HGEIE);
> 
> Misra, aiui, isn't going to like this. You may want to split it up.

I will write in the following way then:
     hgei_mask = csr_read(CSR_HGEIP);
     hgei_mask &= csr_read(CSR_HGEIE);

> 
>> +    csr_clear(CSR_HGEIE, hgei_mask);
>> +
>> +    spin_lock_irqsave(&vgein->lock, flags);
>> +
>> +    for_each_set_bit ( guest_file_id, hgei_mask )
>> +    {
>> +        /*
>> +         * guest_file_id shouldn't be zero, as it will indicate that no
>> +         * guest external interrupt source is selected for VS-level external
>> +         * interrupts.
>> +         */
>> +        ASSERT(guest_file_id);
> 
> While it only affects debug builds, this check still needlessly is
> done on every loop iteration, when doing it once ahead of the loop
> would suffice.

Good point. I will do in the following way then before the loop:

     /*
      * Bit 0 of HGEIP/HGEIE is read-only zero: guest interrupt file ID 0
      * means that no guest external interrupt source is selected.
      */
     ASSERT(!(hgei_mask & 1));


> 
>> +        if ( vgein->owners[guest_file_id] )
>> +        {
>> +#ifdef VGEIN_DEBUG
>> +            gprintk(XENLOG_DEBUG, "%s: kick ->%pv, hgei_mask(%#lx)\n",
>> +                    __func__, vgein->owners[guest_file_id], hgei_mask);
>> +#endif
> 
> This can ocur very frequently (when VGEIN_DEBUG is defined). A
> trace record may be a better alternative.

Agree, it would be nice but tracing isn't ready for RISC-V.

Considering that we haven't had any issue with hgei interrupt for a long 
time I will just drop gprintk() for now and use `trace record` when 
functionality will be ready.

> 
>> --- a/xen/arch/riscv/domain.c
>> +++ b/xen/arch/riscv/domain.c
>> @@ -136,6 +136,8 @@ static void vcpu_csr_init(struct vcpu *v)
>>           v->arch.hstateen0 = (hstateen0 & csr_masks.hstateen0) |
>>                               csr_masks.ro_one.hstateen0;
>>       }
>> +
>> +    v->arch.hie = MIP_SGEIP;
> 
> Neither part of the rhs identifier has anything to do with the CSR
> having its default value set here. That's perhaps again a piece of
> RISC-V I'm missing, but I can't make sense of this.

All interrupt pending/enable CSRs share one bit layout (bit N 
corresponds to interrupt cause N), which is why MIP_SGEIP happened to be 
numerically right. I'll use BIT(IRQ_S_GEXT, UL) instead and add a 
comment: hie.SGEIE is what allows the SGEI raised through hgeie to be 
taken by Xen at all, while hie's VS-level bits alias the guest's vsie 
and are left cleared. I will apply the following change:

-    v->arch.hie = MIP_SGEIP;
+    /*
+     * Enable SGEIs, so that a guest interrupt file marked in HGEIE while
+     * the vCPU is descheduled can raise an interrupt to Xen.
+     *
+     * The VS-level bits of hie alias the guest's vsie, which is saved and
+     * restored separately, so they are left clear here.
+     */
+    v->arch.hie = BIT(IRQ_S_GEXT, UL);


> 
>> --- a/xen/arch/riscv/imsic.c
>> +++ b/xen/arch/riscv/imsic.c
>> @@ -510,12 +510,31 @@ void cf_check imsic_ctxt_switch_from(struct vcpu *v)
>>   
>>       write_lock_irqsave(&imsic_state->vsfile_lock, flags);
>>       imsic_state->vsfile_cpu = v->processor;
>> +    /*
>> +     * Start to observe the VS-file from HS-mode: while the vCPU isn't
>> +     * running an interrupt pending in its VS-file is reported through HGEIP
>> +     * instead of being delivered to VS-mode, which lets Xen wake the vCPU up.
>> +     */
>> +    csr_set(CSR_HGEIE, BIT(imsic_state->guest_file_id, UL));
>>       write_unlock_irqrestore(&imsic_state->vsfile_lock, flags);
>>   }
> 
> It is suspicious for the HGEIE write to be the last step. How's this free
> of a window where an interrupt is lost. (Sorry, likely another blind spot
> of mine wrt RISC-V.)

There's no window: a guest interrupt file's hgeip bit is 
level-sensitive, i.e. it reflects whether the file currently has a 
pending-and-enabled interrupt (the MSI itself stays latched in the 
file's eip[] until the guest claims it), and hip.SGEIP is simply (hgeip 
& hgeie) != 0. So an MSI arriving after the vCPU stopped running but 
before hgeie is set raises an SGEI as soon as the bit is set, taken once 
interrupts are re-enabled. I'll extend the comment to say so:

     /*
      * Start to observe the VS-file from HS-mode: while the vCPU isn't
      * running an interrupt pending in its VS-file is reported through 
HGEIP
      * instead of being delivered to VS-mode, which lets Xen wake the 
vCPU up.
      *
      * HGEIP is level-sensitive, reflecting the VS-file's current state, so
      * an interrupt that became pending before this point raises an SGEI as
      * soon as the bit is set in HGEIE; nothing is lost in between.
      */

Does it make sense?

> 
>>   void cf_check imsic_ctxt_switch_to(struct vcpu *v)
>>   {
>> -    /* Nothing to do */
>> +    struct vimsic_state *imsic_state = v->arch.vimsic_state;
>> +    unsigned long flags;
>> +
>> +    /* A s/w VS-file is never observed through HGEIP. */
>> +    if ( !vcpu_guest_file_id(v) )
>> +        return;
>> +
>> +    /*
>> +     * The vCPU is about to run, so hstatus.VGEIN delivers the VS-file's
>> +     * interrupts to it directly and there is nothing left for Xen to observe.
>> +     */
>> +    read_lock_irqsave(&imsic_state->vsfile_lock, flags);
>> +    csr_clear(CSR_HGEIE, BIT(imsic_state->guest_file_id, UL));
>> +    read_unlock_irqrestore(&imsic_state->vsfile_lock, flags);
>>   }
> 
> How can this be a read-lock when you write a CSR?

But here is a protection of ->guest_file_id not of write to a CSR and we 
want to not have a change of ->guest_file_id during an update of CSR_HGEIE.

> Or else - why is locking
> here necessary in the firt place?

Strictly speaking no locking is needed with the current implementation: 
HGEIE is local to this pCPU, and guest_file_id can't change 
concurrently. It's updated either by this very pCPU ahead of switching 
the vCPU in (imsic_migrate_vcpu() called from schedule(), 
imsic_vsfile_attach() right after), or while the vCPU can't be 
scheduled: sched_unit_migrate_finish() defers to unit_context_saved()
while the unit is running, and sched_move_domain() pauses the domain.

(and the similar are true for imsic_ctxt_switch_from())

But IMO we should keep around ->vsfile_lock to not miss the case where 
some case will update ->guest_file_id in parallel with 
imsic_ctxt_switch_to().

Does it make to continue to have read_lock_irqsave(...->vsfile_lock, 
...) here just for potential future cases?

Thanks.

~ Oleksii


