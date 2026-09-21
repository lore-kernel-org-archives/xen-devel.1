Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76FEDC982E1
	for <xen-devel@archiver.kernel.org>; Mon, 21 Sep 2026 08:04:28 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1427124.1649743 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8Z0H-0001tf-EK; Mon, 21 Sep 2026 08:03:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1427124.1649743; Mon, 21 Sep 2026 08:03:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8Z0H-0001tY-BA; Mon, 21 Sep 2026 08:03:57 +0000
Received: by outflank-mailman (input) for mailman id 1427124;
 Mon, 21 Sep 2026 08:03:56 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1x8Z0F-0001tQ-Qk
 for xen-devel@lists.xenproject.org; Mon, 21 Sep 2026 08:03:56 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x8Z0F-001Nyr-08
 for xen-devel@lists.xenproject.org; Mon, 21 Sep 2026 10:03:55 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6ab0e4ea-2eae-0a2a0a5409dd-0a2a4503ac00-0
 for <xen-devel@lists.xenproject.org>; Mon, 21 Sep 2026 10:03:54 +0200
Received: from [74.125.225.140] (helo=mail-wm2-f12.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6ab0e4ea-fae8-0a2a45030019-4a7de18c8dfd-3
 for <xen-devel@lists.xenproject.org>; Mon, 21 Sep 2026 10:03:54 +0200
Received: by mail-wm2-f12.google.com with SMTP id
 5b1f17b1804b1-49d097b4939so13012135e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 21 Sep 2026 01:03:54 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-71-234.play-internet.pl.
 [109.243.71.234]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49fcd068059sm221379895e9.5.2026.09.21.01.03.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Sep 2026 01:03:53 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1789977834; x=1790582634; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=28DxKa1M9r8vKCI/HR58KiCHbwp2JgT/M3PBAN4MVGg=;
        b=JtKJS91Z89WVE22L/VGA9KBg58VBRruk/kEZ0bS/QZtXcrEBoYQ+4aZcs18fShaeZB
         F581z+mm5c9lSY+Bepsz3jCZfkKXeCAH+l5g1kW+BrGuPlLuwBtl8WmHGTSDdXCVyJDL
         Mc+PC4AzIAHs2JhN+zL8DdnIBziZkDec6XVUwMYPR6RpRow58UEu0jY5w0sJce3f+gED
         dXQ3YMCScUQXiNlpFIw7hyTc/RO0S6KbDDnoAyyjz8eqALcANS4gihEa0cIAjR2h7WNo
         FQQmwwUXCaJIHQSzqN52xfXdaaA2I0ua8PFy4TlMbHde0XbA1qX8qK+jBGcGosRzhnrg
         LsGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789977834; x=1790582634;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=28DxKa1M9r8vKCI/HR58KiCHbwp2JgT/M3PBAN4MVGg=;
        b=le3dMig5cBQ9J9ZhqVOGvZqvajwbCR9ecZShJXUVNQBH6Sp5qm+AKLjpxlesOfVBPL
         UH8WMXIgMUpezfrsSQ6rgbtnKvDceuAKLkfQAr3jZDZROIyeSoQYMwfHtRQ/mZUKcQIz
         A6nFkr229uGfbOP8np7jB2sSKFUqYwcyCj9nvm+baZwZ7vfYJORAOajPikF8JUwuluwQ
         fbN17YNtXchohXLKG+t/H8fFViK54iOtd4PGtHMfpssI3mdXxViIkK6KrV35ICmr2Yqt
         F3InX3Kmuh5H0bsgDkuoAZF2KtOJ2sPKB3/DT6pcTq3pqGiZTX95ALgMQp4jGqo+uheV
         gF0A==
X-Forwarded-Encrypted: i=1; AKwUvBy6SP22r+YHVIUKYa/fC5/2IDjCianop18ijZjA1zS4C9YL8gvszAZtfFTOJE7BJre8PRVOWZnqQ/w=@lists.xenproject.org
X-Gm-Message-State: AFuF++kgyYN5n9eN9l1IQAmu+2T3sqGPyIqUk6+dhK1nPfPgwuC9hwI9
	VN0Ook5PoacB48LjyiRzj4/cLCUre9My1U5yLRcE3Lc01FduXi37FbxJ
X-Gm-Gg: AYBFou2cEpt64snD+p9Fo8jTpzyNdIDMvNHGTbf702Mk5Rz09sZHlwOiaWcXXCnEfeY
	YvFeTZShh/A3LzzeHld997Bq3S9BIlE3vM6CaWgqWsuLon0xHSakzXu/wW+1m5QyhIOvHT3oiGy
	GYlZx5j+ADTJbyPoIxp3u087Eftqy0Qyfrpc91qV0gO8n0MPRvUKcsLkamIWSkabGXW2j5IBCp1
	mS2wDcMurzBpx1tzdx2TGB68WStPE0p6FQ9AswZU3ZIl1LLpDWg8J2vgrAJfzP27B6f7skrjB0C
	Q46DELMnysIecprt/jJi/Q2/s06C5X0Zlm3PNfjTzLW8iIsbnyeTHggAOBIZOtGBFR+ZJE36IRK
	OBYDHphlT5D1fSfTRmB9TuJkJBrez6AzUoLlbCwWQ7gpFwksKZMvt0XvHvtdRaJrR7qJk99ZPSl
	UujGkQht6kstQHPfOrmdWAGYmN09wkpopDG7xA+a4D+bJbCLAHT89UPBA9pEfv329YBZbCranbx
	2uD9HMsMfllsdfd7ZurTZq1HYNTIsZ+gjw/0cVjNWnsC+qqOQ==
X-Received: by 2002:a05:600c:468d:b0:49d:1f32:c911 with SMTP id 5b1f17b1804b1-49fc5687b5fmr140359845e9.3.1789977834129;
        Mon, 21 Sep 2026 01:03:54 -0700 (PDT)
Message-ID: <9929eb6a-d7b8-4a39-b726-82290983e9f3@gmail.com>
Date: Mon, 21 Sep 2026 10:03:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 32/39] xen/riscv: remap interrupts to new IMSIC VS-file
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
 <948e94b6610586b84626c98da033d301335dc7b0.1787838835.git.oleksii.kurochko@gmail.com>
 <2394a616-16be-4657-be17-0a2dafebaeee@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <2394a616-16be-4657-be17-0a2dafebaeee@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-33051d/1789977834-756834E9-7BFA9BA2/10/73395122804
X-purgate-type: spam
X-purgate-size: 5960



On 9/14/26 5:02 PM, Jan Beulich wrote:
> On 27.08.2026 17:21, Oleksii Kurochko wrote:
>> @@ -60,6 +61,12 @@ static unsigned int __ro_after_init guest_num_msis;
>>   #define IMSIC_DISABLE_EITHRESHOLD   1
>>   #define IMSIC_ENABLE_EITHRESHOLD    0
>>   
>> +#define imsic_csr_read(c)           \
>> +({                                  \
>> +    csr_write(CSR_SISELECT, (c));   \
> 
> Nit: Excess parentheses again.

I will drop them.

> 
>> @@ -242,6 +254,15 @@ void imsic_irq_disable(unsigned int irq)
>>       spin_unlock(&imsic_cfg.lock);
>>   }
>>   
>> +static bool imsic_local_is_pending(unsigned int id)
>> +{
>> +    unsigned long isel =
>> +        (id / BITS_PER_LONG) * (BITS_PER_LONG / IMSIC_EIPx_BITS) + IMSIC_EIP0;
>> +    unsigned long bit = BIT(id % BITS_PER_LONG, UL);
> 
> Both can be unsigned int, can't they?

Yes, agreed. Both isel and bit fit within unsigned int. I will update 
them in the next version.

> 
>> +    return !!(imsic_csr_read(isel) & bit);
>> +}
> 
> No need for !! here.
> 
> What about endianness, btw? Does the IMSIC always match the CPU (and
> its setting)?

No, the IMSIC does not dynamically adapt its register interfaces based 
on the CPU's runtime endianness configuration (e.g. mstatus.SBE/MBE):

- CSR Accesses (imsic_csr_read): Indirect CSR accesses (siselect/sireg 
or miselect/mireg) operate using standard RISC-V CSR instructions at 
current XLEN width. Values are read and written directly into 
architectural GPRs without byte-swapping.

- MMIO Ports: For incoming device MSIs, IMSIC uses fixed memory-mapped 
offsets: offset 0x000 (seteipnum_le) always expects Little-Endian, while 
offset 0x004 (seteipnum_be) expects Big-Endian.

- Memory-Resident Interrupt Files (MRIF): For virtualized environments, 
MRIF structures in memory are strictly defined in Little-Endian byte 
order regardless of whether the CPU harts operate in Big-Endian or 
Little-Endian mode.

> 
> Overall, what does "local" in the function name signify? (For a static
> function, the "imsic" prefix may also be unnecessary.)

It signifies that local (on which code is executed now) hart's IMSIC 
CSRs (isel and ireg in the case of imsic_csr_read()) are touched.

> 
>> @@ -497,6 +523,27 @@ static void imsic_call_on_cpu(unsigned int cpu, void (*func)(void *),
>>           on_selected_cpus(cpumask_of(cpu), func, data, 1);
>>   }
>>   
>> +/*
>> + * Ensure that all the MSIs the APLIC has already generated for the hart this
>> + * runs on have really reached the hart's IMSIC.
>> + *
>> + * The barrier is the one described by the AIA specification in
>> + * "Synchronizing interactions between a hart and the APLIC": ask the APLIC to
>> + * send an MSI to the hart itself and wait until it shows up as pending in the
>> + * hart's own interrupt file. As it says nothing about MSIs on their way to
>> + * any other hart, it has to be executed by the pCPU owning the interrupt file
>> + * the MSIs were being sent to.
>> + */
>> +static void cf_check imsic_aplic_sync(void *data)
> 
> If the parameter isn't used, maybe best to name it "unused"?

Makes sense to me. I will do that in the next version + I will update 
the type to 'struct imsic_vsfile_data *' as it was suggested for 
imsic_call_on_cpu() in "Re: [PATCH v2 30/39] xen/riscv: prepare new 
IMSIC VS-file".

> 
>> @@ -848,8 +899,22 @@ void imsic_migrate_vcpu(struct vcpu *v)
>>       if ( v->arch.last_cpu == NR_CPUS )
>>           return;
>>   
>> +    read_lock_irqsave(&imsic_state->vsfile_lock, flags);
>> +    old_vsfile_id = imsic_state->guest_file_id;
>> +    old_vsfile_cpu = imsic_state->vsfile_cpu;
>> +    read_unlock_irqrestore(&imsic_state->vsfile_lock, flags);
>> +
>> +    /*
>> +     * We don't support SW interrupt files at the moment. Bail out before
>> +     * anything is touched, as the old file has no owning pCPU in that case
>> +     * and there is nothing to retarget the producers away from.
>> +     */
>> +    if ( old_vsfile_cpu == NR_CPUS )
>> +        panic("IMSIC SW-file isn't supported\n");
>> +
>>       /*
>>        * At this point, all interrupt producers are still using the old IMSIC
>> +     * VS-file so we first move all interrupt producers to the new IMSIC
>>        * VS-file.
>>        */
> 
> Isn't the new part of the comment premature? Moving doesn't start until ...
> 
>> @@ -870,5 +935,43 @@ void imsic_migrate_vcpu(struct vcpu *v)
>>       /* Zero-out new IMSIC VS-file */
>>       imsic_call_on_cpu(new_vsfile_cpu, imsic_vsfile_local_clear, &vsfile_data);
>>   
>> +    /* Update G-stage mapping for the new IMSIC VS-file */
>> +    if ( imsic_map_guest_file(v, new_vsfile_hgei) )
>> +    {
>> +        domain_crash(v->domain, "Migration to hw interrupt file failed\n");
>> +
>> +        return;
>> +    }
>> +
>> +    imsic_update_state(v, new_vsfile_hgei);
>> +
>> +    /*
>> +     * TODO: Modify the relevant translation tables at all IOMMUs so that MSIs
>> +     *       for this virtual interrupt file are now sent to the new physical
>> +     *       interrupt file.
>> +     */
>> +    if ( iommu_enabled )
>> +        printk_once("IMSIC: IOMMU MSI retargeting is not implemented\n");
>> +
>> +    /*
>> +     * If any interrupts at an APLIC are forwarded by MSIs to the old interrupt
>> +     * file, reconfigure the APLIC to send them to the new interrupt file.
>> +     */
>> +    aplic_reconfigure_target(v, old_vsfile_id, old_vsfile_cpu);
> 
> ... here, as it looks.

At some point I agree but the steps before are preparation of moving and 
is a part of moving process.

Then probably it make sense to reword the comment to:

    /*
      * At this point, all interrupt producers are still using the old IMSIC
      * VS-file.  Allocate and clear the new one before redirecting anything
      * to it.
      */

Would it be better?

~ Oleksii


