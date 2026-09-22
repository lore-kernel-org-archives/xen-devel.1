Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 997D5C982FF
	for <xen-devel@archiver.kernel.org>; Tue, 22 Sep 2026 13:38:00 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1428859.1651783 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x90gx-0002rB-UK; Tue, 22 Sep 2026 13:37:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1428859.1651783; Tue, 22 Sep 2026 13:37:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x90gx-0002r4-Qe; Tue, 22 Sep 2026 13:37:51 +0000
Received: by outflank-mailman (input) for mailman id 1428859;
 Tue, 22 Sep 2026 13:37:50 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1x90gv-0002nT-W1
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2026 13:37:50 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x90gu-00Gf6s-UR
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2026 15:37:48 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6ab28493-8faa-0a2a0a5109dd-0a2a4505eb0e-38
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 15:37:48 +0200
Received: from [74.125.229.204] (helo=mail-lf2-f12.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6ab284ac-4cb1-0a2a45050019-4a7de5ccbc23-3
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 15:37:48 +0200
Received: by mail-lf2-f12.google.com with SMTP id
 2adb3069b0e04-5b5e4f13d7aso5803714e87.1
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 06:37:48 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-71-234.play-internet.pl.
 [109.243.71.234]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5b8d46ace42sm524032e87.3.2026.09.22.06.37.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Sep 2026 06:37:43 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1790084268; x=1790689068; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wZeN+u7NqTmI72DLqEMk7TXQCdL8lLz6a5VXYHbQBBI=;
        b=i6LXn03870FPVTp4FfUaqLubTL7L0vr4mE7fnLaW0LyhqiEiVTuF23QWe4suCRD1hn
         vfXjtIw0iYLuDpCpC8ERNJ6D6E3IPV37Sk5G8/JDzDBiDLFuJU61YQGELJLHm239+Wvh
         hn8Xvl8esyhFOPPV/yi+wYHXcOCQfSAOQfOD4qGmvNmn8KkUAslhA/F5AOfRxn/VRp3y
         ICnGGhQYmLAeNzKfJ+RgVFPltmOzwWPpJ2KMVKLXgQUc/zxNcHlaTP5H+umw+RGOo3Dc
         HC6/9fKuZ7CQOFMojTP3GAQgLFRFKL+uWqFIn8z4IixOFqL0G/JYEMtiTTR8Eg3GlnGL
         JKlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790084268; x=1790689068;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wZeN+u7NqTmI72DLqEMk7TXQCdL8lLz6a5VXYHbQBBI=;
        b=JLUfaOc+RnDPTiRVO3xFD9SR1mU7Cd0gLM59zOmdY/j8yD6MG1adhlwfIDQTmhK0gv
         rsTrZ+wxMY3KxUTGSGN8sDGpwhxkYGl6QiaSRT74fxeAoEKqdEr7SeWLie8Rolafms1L
         TcQtOv8KHgl/d2Z8KRY3Ar+eZH5ztYDKUVZ7WuLG/n3htOJOESlzN29O7T4kju3Z2Dwj
         hNDdIA1TOXage5yzh5nHK7/nWblDxprarQYE9M4tGHBn8vQnEQPJCF2aRZ/pOe2pd3M+
         CaIo7dh25z8Tr60s8BSDagbKlzjWT+EVD2oRr7l96uvt7bFFBT2sljBKYEYy6dFaWwQu
         50Ww==
X-Forwarded-Encrypted: i=1; AKwUvByAJ8s5Fmi02zbN2wgOGmQ2KV/k4rYua7tq3uIBJ5IeY1y7AoBHyCKOKSMxFMvVxPYLQvqb/R62Qfc=@lists.xenproject.org
X-Gm-Message-State: AFuF++lm27MRBlOFt7x5sbYPueRF6Tmej4PQExyF8Mk2p9qBzdh0Q6Gi
	OfeM8+udsfMblsirKu+DuiVOPSKtDqcnuE1QVsiXfvi+eZKN4TBzJh1L
X-Gm-Gg: AYBFou0rnDcg4L7QZWE9RMYXsPHQeLLSO2rOcBaJjSiiKWRbkyFccKd/8fKHRBYva3S
	RXP2jFHOi9kbDy0Obt+vb74omUXfOqIVOP0q9ov+nqEqz/1f80gnSgLLtfuEfI89l0sOYcnOnxT
	JZR1gGgiGHwhbvLVcnPG4dJ/bzIzsOO4tdbtbc7plkSNEkqxBYomAXxQnWKvvyN1bG64Y8sHMrq
	TZCmGHstKHlrCJBdlWet+DFtNilQ0Da7ET6ZktOTfuQUW/uUHZtQp6GRP7jae0TPXUp7eXgN0cY
	KRwYN2ATp8P5+sOp9HsWGAeTBSXswDbngJsatZtGCIjVsAy5iVLDExmlOHGKFErQ57tYSRBgZbC
	4GHDJD9R0ESr1+euinCADF/Z0HjQdfPpFT/Ch9k25Z30A3bx6PT4sOES4Qwwqcn6dzQn61cW1v2
	1B0H1ZQj87bjN5CR8PM0y3Mq5b+gYqYXRDHgI5gx5brRtXN1dJQXtbC/og8g2iyDXipgvaIwu4q
	1ll6eeVY0ydCZ6dcJdRbL4x5fLPp1o7EQB6QjLXguzs0fKeOw==
X-Received: by 2002:a05:6512:1049:b0:5b5:e8d5:7fff with SMTP id 2adb3069b0e04-5b8c17f5dafmr4645582e87.8.1790084263478;
        Tue, 22 Sep 2026 06:37:43 -0700 (PDT)
Message-ID: <b02edea0-f2ff-47c2-bc11-21f331089073@gmail.com>
Date: Tue, 22 Sep 2026 15:37:41 +0200
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
 <c95ed9c6-1c0e-40fc-9e7a-635589605194@gmail.com>
 <b63df34b-2c90-4212-a28b-c943cd580d6d@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <b63df34b-2c90-4212-a28b-c943cd580d6d@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c201ff/1790084268-253192A1-A390FC16/10/73395122804
X-purgate-type: spam
X-purgate-size: 5684



On 9/21/26 5:08 PM, Jan Beulich wrote:
> On 21.09.2026 16:01, Oleksii Kurochko wrote:
>> On 9/18/26 2:52 PM, Jan Beulich wrote:
>>> On 27.08.2026 17:21, Oleksii Kurochko wrote:
>>>> --- a/xen/arch/riscv/imsic.c
>>>> +++ b/xen/arch/riscv/imsic.c
>>>> @@ -510,12 +510,31 @@ void cf_check imsic_ctxt_switch_from(struct vcpu *v)
>>>>    
>>>>        write_lock_irqsave(&imsic_state->vsfile_lock, flags);
>>>>        imsic_state->vsfile_cpu = v->processor;
>>>> +    /*
>>>> +     * Start to observe the VS-file from HS-mode: while the vCPU isn't
>>>> +     * running an interrupt pending in its VS-file is reported through HGEIP
>>>> +     * instead of being delivered to VS-mode, which lets Xen wake the vCPU up.
>>>> +     */
>>>> +    csr_set(CSR_HGEIE, BIT(imsic_state->guest_file_id, UL));
>>>>        write_unlock_irqrestore(&imsic_state->vsfile_lock, flags);
>>>>    }
>>>
>>> It is suspicious for the HGEIE write to be the last step. How's this free
>>> of a window where an interrupt is lost. (Sorry, likely another blind spot
>>> of mine wrt RISC-V.)
>>
>> There's no window: a guest interrupt file's hgeip bit is
>> level-sensitive, i.e. it reflects whether the file currently has a
>> pending-and-enabled interrupt (the MSI itself stays latched in the
>> file's eip[] until the guest claims it), and hip.SGEIP is simply (hgeip
>> & hgeie) != 0. So an MSI arriving after the vCPU stopped running but
>> before hgeie is set raises an SGEI as soon as the bit is set, taken once
>> interrupts are re-enabled. I'll extend the comment to say so:
>>
>>       /*
>>        * Start to observe the VS-file from HS-mode: while the vCPU isn't
>>        * running an interrupt pending in its VS-file is reported through
>> HGEIP
>>        * instead of being delivered to VS-mode, which lets Xen wake the
>> vCPU up.
>>        *
>>        * HGEIP is level-sensitive, reflecting the VS-file's current state, so
>>        * an interrupt that became pending before this point raises an SGEI as
>>        * soon as the bit is set in HGEIE; nothing is lost in between.
>>        */
>>
>> Does it make sense?
> 
> I think I get what you're trying to explain, but the term "level-sensitive"
> here doesn't really help. I'm unconvinced you actually mean that, as it
> requires pins / physical signals, which don't exist with MSI. It feels like
> you may mean "sticky" instead.

Fair point regarding the terminology: 'level-sensitive' usually implies 
physical signal lines, whereas here MSIs are memory writes latched in 
the file's eip[] array. I meant that HGEIP dynamically reflects whether 
the VS-file currently has any pending-and-enabled interrupt latched.

I'll update the comment to clarify this without using 'level-sensitive':

/*
  * Start to observe the VS-file from HS-mode: while the vCPU isn't
  * running an interrupt pending in its VS-file is reported through HGEIP
  * instead of being delivered to VS-mode, which lets Xen wake the vCPU up.
  *
  * An MSI is recorded in the VS-file's eip[] array until the guest claims
  * it, and HGEIP isn't latched but reflects whether the file currently
  * has a pending-and-enabled interrupt. Hence an interrupt which arrived
  * before this point raises an SGEI as soon as the bit is set in HGEIE;
  * nothing is lost in between.
  */

> 
>>>>    void cf_check imsic_ctxt_switch_to(struct vcpu *v)
>>>>    {
>>>> -    /* Nothing to do */
>>>> +    struct vimsic_state *imsic_state = v->arch.vimsic_state;
>>>> +    unsigned long flags;
>>>> +
>>>> +    /* A s/w VS-file is never observed through HGEIP. */
>>>> +    if ( !vcpu_guest_file_id(v) )
>>>> +        return;
>>>> +
>>>> +    /*
>>>> +     * The vCPU is about to run, so hstatus.VGEIN delivers the VS-file's
>>>> +     * interrupts to it directly and there is nothing left for Xen to observe.
>>>> +     */
>>>> +    read_lock_irqsave(&imsic_state->vsfile_lock, flags);
>>>> +    csr_clear(CSR_HGEIE, BIT(imsic_state->guest_file_id, UL));
>>>> +    read_unlock_irqrestore(&imsic_state->vsfile_lock, flags);
>>>>    }
>>>
>>> How can this be a read-lock when you write a CSR?
>>
>> But here is a protection of ->guest_file_id not of write to a CSR and we
>> want to not have a change of ->guest_file_id during an update of CSR_HGEIE.
>>
>>> Or else - why is locking
>>> here necessary in the firt place?
>>
>> Strictly speaking no locking is needed with the current implementation:
>> HGEIE is local to this pCPU, and guest_file_id can't change
>> concurrently. It's updated either by this very pCPU ahead of switching
>> the vCPU in (imsic_migrate_vcpu() called from schedule(),
>> imsic_vsfile_attach() right after), or while the vCPU can't be
>> scheduled: sched_unit_migrate_finish() defers to unit_context_saved()
>> while the unit is running, and sched_move_domain() pauses the domain.
>>
>> (and the similar are true for imsic_ctxt_switch_from())
>>
>> But IMO we should keep around ->vsfile_lock to not miss the case where
>> some case will update ->guest_file_id in parallel with
>> imsic_ctxt_switch_to().
>>
>> Does it make to continue to have read_lock_irqsave(...->vsfile_lock,
>> ...) here just for potential future cases?
> 
> You get to judge. If the lock typically is uncontended, keeping things
> as-is may indeed be fine. Introducing a bottleneck "just for potential
> future cases" otoh wouldn't look overly nice to me.
> 
For the moment, I prefer to have a lock here as it is expected to be 
cheap. If one day it won't be true anymore it will be easier to spot all 
the places and remove it where it will be necessary.

~ Oleksii


