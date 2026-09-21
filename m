Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1144EC982ED
	for <xen-devel@archiver.kernel.org>; Mon, 21 Sep 2026 15:08:50 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1427649.1650452 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8fd9-0007EW-3G; Mon, 21 Sep 2026 15:08:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1427649.1650452; Mon, 21 Sep 2026 15:08:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8fd9-0007EP-0N; Mon, 21 Sep 2026 15:08:31 +0000
Received: by outflank-mailman (input) for mailman id 1427649;
 Mon, 21 Sep 2026 15:08:30 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x8fd8-0007Ci-52
 for xen-devel@lists.xenproject.org; Mon, 21 Sep 2026 15:08:30 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x8fd7-00Cvgz-A5
 for xen-devel@lists.xenproject.org; Mon, 21 Sep 2026 17:08:29 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ab14858-bab6-0a2a0a5309dd-0a2a45088778-22
 for <xen-devel@lists.xenproject.org>; Mon, 21 Sep 2026 17:08:24 +0200
Received: from [74.125.225.140] (helo=mail-wm2-f12.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ab14868-f659-0a2a45080019-4a7de18cf104-3
 for <xen-devel@lists.xenproject.org>; Mon, 21 Sep 2026 17:08:24 +0200
Received: by mail-wm2-f12.google.com with SMTP id
 5b1f17b1804b1-49b912d822dso21681095e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 21 Sep 2026 08:08:24 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49fc6ca43edsm298240995e9.0.2026.09.21.08.08.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Sep 2026 08:08:23 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:Autocrypt:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1790003304; x=1790608104; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Mnv2QTidOl4onXRzfjp9Sqoj5ezvwg+YcGydnDzzmak=;
        b=Di4XeVwxfctXp1vbCefrpQfq9wdZUdKclYxSvGKOD3PmrLc6K1rO6Z77qttPKIawDw
         oMVMoreIw+yuBBlVB171QVTgJXLqlhVLvMm2zRbRXTg9IiD9nn9mqm/5zcpllD8nNsAN
         fcnojP2300TXFBu3sF2gdVNw+mpTtt9+0Q9O46NkIdMQ9OA06zteb/kicjIWsyP7s898
         v62vpb8VFWhcLwUsLMzTdSUKVctwmyNS86r62VY9irCgrGLHNoJHL0IotVXa3i9f6oWS
         bpvM/GpXlXQk3yZtblODVsok+XRl0ti3qBk4PxA5wtH7gmmRFUAyHHak2QwbZ0n/Jqqa
         9GnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790003304; x=1790608104;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Mnv2QTidOl4onXRzfjp9Sqoj5ezvwg+YcGydnDzzmak=;
        b=A0e/kS49F9uRpaIDNV5FdVQ/6E+hml56uNA7Jr4FLQwGUp6jUuCtJUe5u1YvqtMHxF
         zhfqsL0e2cYckU1dycLF/omBO20iD3N2BoqBbVx/p7JjNoImdWcgeU3Mz9wOkTTnXO/4
         v1mepjO7KJ2M+e98KMNuFF0ik8RMHEy3tlp29CQ29tOwI5l7lM/sYMFgBG7/g39/DL/H
         lRI1XcvWU/fJWZUfiLdJ9Y3G0F3HwWelAIrrxnGA9FPLoC2X2EvfYuTggu+QIqlmAEP2
         BtyLNPGoC7LF3E/UO/eo+ecN5OL7iACPSxquRe37RqslyYt16QtWdOYazswVl9SdzPcE
         a0IQ==
X-Forwarded-Encrypted: i=1; AKwUvBzZX16EpOQM/OyJCf7Y5CCZ5A8ybu2Hvz1NEZDR6zLjkBqz5Lmrr3HkyOJhopUKGB09lvAb/ORGgSA=@lists.xenproject.org
X-Gm-Message-State: AFuF++l+HyeKzlaKXNwXHaG6ESARi80byqglsXCy3utzAlidLTfDoHW/
	pTWtf5zZ+PjcMPXfc5gHjqwVlkIhFalqsDxiwkFMuK1cb8LQt7eISWr4bjAEMTy8Sw==
X-Gm-Gg: AYBFou2v9V3GSbJ5cH3DpFI8XPnQXl1jUsj4URA+W8oX5jwz/WU8QlfbulEtxou2W7Q
	/9absq3BU46fJFDNQ3qdZQ+Mlf2uIsk0FVoxS7BK6Ans0RzC1vKC5+KV0qOVB/cnKN+nRUaGn5j
	WjxRPKjBAnm3HRZCk3RfnE48giPTDCzAmVlVMITeJNlkhvFtukWqnDrjomYMku6n6vlPtxe3cMe
	93cpgjlEjg9l/S+VMT4Uuje8ogbM3bZFSBqbmU7f7Y2e6CavWQ2c7GJ0bFNh5hyLYDLfKS/lU9Z
	4L9IV/VWbs10/U50StjpN64gfZul+u6RHJuQ1oq0SBqb4o4IndckYFyNv60x4r4KiM6mtc6L7UN
	fsN6ExEAE4db3H2quEa4NOJjUM/7jZeYl17PsW4eVbIKpYpOE/Ut0avkqj6oOTXLNBk1GrtSBeH
	2bNMCA+SvjsFbmq/Vs7FV0nixNq1XFLtgsmkhcBmFYT4Q0XxwmlHSykAVz02lJXYBCBOmmCfzwC
	pJtPFQt6hpYIHnTOvolDUnZMPqJq0Ax53vZHHaSizdF/HJLb6TftIIo626zkU26
X-Received: by 2002:a05:600c:5254:b0:493:c47f:3c55 with SMTP id 5b1f17b1804b1-49fc56732aamr155912045e9.5.1790003304186;
        Mon, 21 Sep 2026 08:08:24 -0700 (PDT)
Message-ID: <b63df34b-2c90-4212-a28b-c943cd580d6d@suse.com>
Date: Mon, 21 Sep 2026 17:08:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 36/39] xen/riscv: wake up a descheduled vCPU on a guest
 external interrupt
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
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
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <c95ed9c6-1c0e-40fc-9e7a-635589605194@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c1860d/1790003304-DF6D687B-81384C38/0/0
X-purgate-type: clean
X-purgate-size: 5878

On 21.09.2026 16:01, Oleksii Kurochko wrote:
> On 9/18/26 2:52 PM, Jan Beulich wrote:
>> On 27.08.2026 17:21, Oleksii Kurochko wrote:
>>> --- a/xen/arch/riscv/domain.c
>>> +++ b/xen/arch/riscv/domain.c
>>> @@ -136,6 +136,8 @@ static void vcpu_csr_init(struct vcpu *v)
>>>           v->arch.hstateen0 = (hstateen0 & csr_masks.hstateen0) |
>>>                               csr_masks.ro_one.hstateen0;
>>>       }
>>> +
>>> +    v->arch.hie = MIP_SGEIP;
>>
>> Neither part of the rhs identifier has anything to do with the CSR
>> having its default value set here. That's perhaps again a piece of
>> RISC-V I'm missing, but I can't make sense of this.
> 
> All interrupt pending/enable CSRs share one bit layout (bit N 
> corresponds to interrupt cause N), which is why MIP_SGEIP happened to be 
> numerically right. I'll use BIT(IRQ_S_GEXT, UL) instead and add a 
> comment: hie.SGEIE is what allows the SGEI raised through hgeie to be 
> taken by Xen at all, while hie's VS-level bits alias the guest's vsie 
> and are left cleared. I will apply the following change:
> 
> -    v->arch.hie = MIP_SGEIP;
> +    /*
> +     * Enable SGEIs, so that a guest interrupt file marked in HGEIE while
> +     * the vCPU is descheduled can raise an interrupt to Xen.
> +     *
> +     * The VS-level bits of hie alias the guest's vsie, which is saved and
> +     * restored separately, so they are left clear here.
> +     */
> +    v->arch.hie = BIT(IRQ_S_GEXT, UL);

It's somewhat better this way, yes. And as said - in not looking great to
me (doc-wise) is likely an issue of mine, not of yours.

>>> --- a/xen/arch/riscv/imsic.c
>>> +++ b/xen/arch/riscv/imsic.c
>>> @@ -510,12 +510,31 @@ void cf_check imsic_ctxt_switch_from(struct vcpu *v)
>>>   
>>>       write_lock_irqsave(&imsic_state->vsfile_lock, flags);
>>>       imsic_state->vsfile_cpu = v->processor;
>>> +    /*
>>> +     * Start to observe the VS-file from HS-mode: while the vCPU isn't
>>> +     * running an interrupt pending in its VS-file is reported through HGEIP
>>> +     * instead of being delivered to VS-mode, which lets Xen wake the vCPU up.
>>> +     */
>>> +    csr_set(CSR_HGEIE, BIT(imsic_state->guest_file_id, UL));
>>>       write_unlock_irqrestore(&imsic_state->vsfile_lock, flags);
>>>   }
>>
>> It is suspicious for the HGEIE write to be the last step. How's this free
>> of a window where an interrupt is lost. (Sorry, likely another blind spot
>> of mine wrt RISC-V.)
> 
> There's no window: a guest interrupt file's hgeip bit is 
> level-sensitive, i.e. it reflects whether the file currently has a 
> pending-and-enabled interrupt (the MSI itself stays latched in the 
> file's eip[] until the guest claims it), and hip.SGEIP is simply (hgeip 
> & hgeie) != 0. So an MSI arriving after the vCPU stopped running but 
> before hgeie is set raises an SGEI as soon as the bit is set, taken once 
> interrupts are re-enabled. I'll extend the comment to say so:
> 
>      /*
>       * Start to observe the VS-file from HS-mode: while the vCPU isn't
>       * running an interrupt pending in its VS-file is reported through 
> HGEIP
>       * instead of being delivered to VS-mode, which lets Xen wake the 
> vCPU up.
>       *
>       * HGEIP is level-sensitive, reflecting the VS-file's current state, so
>       * an interrupt that became pending before this point raises an SGEI as
>       * soon as the bit is set in HGEIE; nothing is lost in between.
>       */
> 
> Does it make sense?

I think I get what you're trying to explain, but the term "level-sensitive"
here doesn't really help. I'm unconvinced you actually mean that, as it
requires pins / physical signals, which don't exist with MSI. It feels like
you may mean "sticky" instead.

>>>   void cf_check imsic_ctxt_switch_to(struct vcpu *v)
>>>   {
>>> -    /* Nothing to do */
>>> +    struct vimsic_state *imsic_state = v->arch.vimsic_state;
>>> +    unsigned long flags;
>>> +
>>> +    /* A s/w VS-file is never observed through HGEIP. */
>>> +    if ( !vcpu_guest_file_id(v) )
>>> +        return;
>>> +
>>> +    /*
>>> +     * The vCPU is about to run, so hstatus.VGEIN delivers the VS-file's
>>> +     * interrupts to it directly and there is nothing left for Xen to observe.
>>> +     */
>>> +    read_lock_irqsave(&imsic_state->vsfile_lock, flags);
>>> +    csr_clear(CSR_HGEIE, BIT(imsic_state->guest_file_id, UL));
>>> +    read_unlock_irqrestore(&imsic_state->vsfile_lock, flags);
>>>   }
>>
>> How can this be a read-lock when you write a CSR?
> 
> But here is a protection of ->guest_file_id not of write to a CSR and we 
> want to not have a change of ->guest_file_id during an update of CSR_HGEIE.
> 
>> Or else - why is locking
>> here necessary in the firt place?
> 
> Strictly speaking no locking is needed with the current implementation: 
> HGEIE is local to this pCPU, and guest_file_id can't change 
> concurrently. It's updated either by this very pCPU ahead of switching 
> the vCPU in (imsic_migrate_vcpu() called from schedule(), 
> imsic_vsfile_attach() right after), or while the vCPU can't be 
> scheduled: sched_unit_migrate_finish() defers to unit_context_saved()
> while the unit is running, and sched_move_domain() pauses the domain.
> 
> (and the similar are true for imsic_ctxt_switch_from())
> 
> But IMO we should keep around ->vsfile_lock to not miss the case where 
> some case will update ->guest_file_id in parallel with 
> imsic_ctxt_switch_to().
> 
> Does it make to continue to have read_lock_irqsave(...->vsfile_lock, 
> ...) here just for potential future cases?

You get to judge. If the lock typically is uncontended, keeping things
as-is may indeed be fine. Introducing a bottleneck "just for potential
future cases" otoh wouldn't look overly nice to me.

Jan

