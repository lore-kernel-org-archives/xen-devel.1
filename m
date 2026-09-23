Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACCD2C982FA
	for <xen-devel@archiver.kernel.org>; Wed, 23 Sep 2026 10:57:53 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1430180.1652773 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9KfD-0001VY-EL; Wed, 23 Sep 2026 10:57:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1430180.1652773; Wed, 23 Sep 2026 10:57:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9KfD-0001VR-BU; Wed, 23 Sep 2026 10:57:23 +0000
Received: by outflank-mailman (input) for mailman id 1430180;
 Wed, 23 Sep 2026 10:57:21 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1x9KfB-0001VL-FP
 for xen-devel@lists.xenproject.org; Wed, 23 Sep 2026 10:57:21 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x9KfA-001omP-NK
 for xen-devel@lists.xenproject.org; Wed, 23 Sep 2026 12:57:20 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6ab3b075-2eae-0a2a0a5409dd-0a2a4502d718-44
 for <xen-devel@lists.xenproject.org>; Wed, 23 Sep 2026 12:57:20 +0200
Received: from [74.125.225.76] (helo=mail-wr2-f12.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6ab3b090-6ca4-0a2a45020019-4a7de14cc78a-3
 for <xen-devel@lists.xenproject.org>; Wed, 23 Sep 2026 12:57:20 +0200
Received: by mail-wr2-f12.google.com with SMTP id
 ffacd0b85a97d-485b1d2874aso655013f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 23 Sep 2026 03:57:20 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-71-234.play-internet.pl.
 [109.243.71.234]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-488682668e7sm7256281f8f.4.2026.09.23.03.57.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Sep 2026 03:57:19 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:Content-Language:References:Cc:To:From:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790161040; x=1790765840; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8bx2uWKvoOnVG2P2VE9YzHLiiwahiHPtwCvtIv7FPns=;
        b=dXxLNE7qrvTCR7RonGpl0N/Y84Gpi15nkSBElsEA7CSY92qw+eJRhnyFGdSKUTmIiz
         3wFEqnIfu3HJB5/opXendnFfl6nFJyQHH2xZK/nkHZZL/mE4pY4iSeoEli00G7dQ9fx4
         NvtmzcNMCi4BfQI7rSb16eD6YUHf21B8n4mhAXW0rNPSon4MDD47t/kNwNIH1KsYwDi+
         WrZ7gkQnVUWiL6Ry43rk2uQC+/kpfDv2ntNaQYOST/pWCGHJxTNU6YtheJmfRIEU26eB
         KsM/e9jx7DdIRxqBrAJ1uloZBGXkvdGvrT+LmWaEO73cgNwzSrfouQaJLNhF5Lo6Jz6e
         6Fyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790161040; x=1790765840;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8bx2uWKvoOnVG2P2VE9YzHLiiwahiHPtwCvtIv7FPns=;
        b=Z9rt8SJle59DAOE3NoWX1ZULXr/3kOsbIUkZBjqxj35yJW5US27lsSfKZj8c+YAtsI
         XjnMWoxRdibMoIBYVHFV1rqVHDy9GXOdy39Ae8DQyw6L/7V5KxFuE3zyYRWi9GuUO6U3
         JkmoJcXQsj91nRaKHaM/xP8uJOAXjALoYFUyIxrPigyAVA7WsjYDEEIMHOvTlLjy/vBh
         58y4RqUJ2pK7B+EP7rQrJ0M1jWhs3pfrhejByzKm9PEpwh1IzYs8lF6eQbIvZJbhKv72
         /ErtL+rWxMcb7cuLDwM8YwiDnxXqxGKxwbYtY1wVJHBpW8PkSOcxjBNl36dq47juUAu2
         CDYA==
X-Gm-Message-State: AFuF++lVwWA2IxuSEhRA2CsLagageiPWvLDXZ+6T6mKZDVbfGlU8P5Hh
	1qfqZ4TyX7143wzR1GBl1tnQ2+2gcC9oGH2jJTli0Q2gKw89+hscBewD
X-Gm-Gg: AYBFou1zi4cfd3sMsoadrpuEFwUMXd8LPUBnOW8rK0RV3JTGXq6/ict0vmk+PLLqRvb
	Ce+dZsAYZiHLMEhyG0JIjuO8biZcdMqDno+gkG8ELsZ3BRR8+sIHJ/4NlsREIOhmaSBI+Ct1OFi
	ldbq9MBqzhQ8pl6YhSMf8KRHijZ5gLJrlHJzF1W88lZBeucnDnUY2Hy/UK6+BmFp/Cq8xCH6cXi
	9K9j975jQsJvQXG4GDPudOyA0l3nfkx+NVSRCKrJJ6vmttx+iDMoBY1DCVtk5QoYkV/Lad9geW+
	gb+lf0FDSjkvh/m6gSsOD1Ss1AkynxBIX3A4h/JWhZJXmwBRI2GCowR+uhTSp+bsbQV7X8B0H0o
	mL/amXjS8VR9paJDT0ZIXXNgG3r1Ra93UNBmlTtqPpoBm2bp6U2P83ayDb2sUcfGHnk+nYbWm9g
	15ukwEIe/cjxmThpo/1LBB4ueyn0rAEmw//XbNU8EihL7eQ7Ag3c7SikOPFWPlSCXD28SCviHD7
	cZBtufbm1D5DmGEqAd1zdKbgEPwcLQjeK/vW2ljQf/YElkg8nwsAEwJYIUG
X-Received: by 2002:a05:6000:26c7:b0:484:3314:eff6 with SMTP id ffacd0b85a97d-488670906bcmr3492908f8f.28.1790161040079;
        Wed, 23 Sep 2026 03:57:20 -0700 (PDT)
Message-ID: <1cf983c9-456b-4137-b302-e60a0f5ed057@gmail.com>
Date: Wed, 23 Sep 2026 12:57:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 31/39] xen/riscv: implement APLIC-hart sync barrier for
 vCPU migration
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
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
 <3d953b6e7f221f4cf4143454076466fab38b6236.1787838835.git.oleksii.kurochko@gmail.com>
 <1790096435.8631fc262581453bbf619ec5b2062170.1a0ca0fea6500072c4@vates.tech>
 <6da5569d-8ae8-4388-a407-00b5d2a4bc27@gmail.com>
Content-Language: en-US
In-Reply-To: <6da5569d-8ae8-4388-a407-00b5d2a4bc27@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-720697/1790161040-307C22AC-A447E1E8/10/73395122804
X-purgate-type: spam
X-purgate-size: 4347



On 9/22/26 8:48 PM, Oleksii Kurochko wrote:
> 
> 
> On 9/22/26 7:00 PM, Baptiste Le Duc wrote:
>>> During migration of a virtual hart to a different guest interrupt file,
>>> straggler MSIs from the APLIC could arrive at the old interrupt file
>>> after the switch.
>>>
>>> genmsi is used despite not supporting guest interrupt files because the
>>> AIA spec guarantees that all MSIs previously sent from the APLIC to the
>>> same hart are visible at the hart's IMSIC before the extempore MSI from
>>> genmsi becomes visible.
>>
>>
>>>
>>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>>>
>>> diff --git a/xen/arch/riscv/aplic.c b/xen/arch/riscv/aplic.c
>>> index 0af13f28e4..cb11d6aeaa 100644
>>> --- a/xen/arch/riscv/aplic.c
>>> +++ b/xen/arch/riscv/aplic.c
>>> @@ -27,7 +27,9 @@
>>>   #include <asm/imsic.h>
>>>   #include <asm/intc.h>
>>>   #include <asm/io.h>
>>> +#include <asm/processor.h>
>>>   #include <asm/riscv_encoding.h>
>>> +#include <asm/smp.h>
>>>   static struct aplic_priv aplic = {
>>>       .lock = SPIN_LOCK_UNLOCKED,
>>> @@ -205,6 +207,30 @@ void aplic_hw_write_reg(unsigned int offset, 
>>> uint32_t value)
>>>       spin_unlock_irqrestore(&aplic.lock, flags);
>>>   }
>>> +/*
>>> + * As needed, synchronize with all IOMMUs and APLICs to ensure that no
>>> + * straggler MSIs will arrive at the old interrupt file after this 
>>> step.
>>> + */
>>> +void aplic_genmsi_barrier(void)
>>> +{
>>> +    const struct imsic_config *imsic = imsic_get_config();
>>> +    unsigned int cpu = smp_processor_id();
>>> +    unsigned long flags;
>>> +    uint32_t val;
>>> +
>>> +    val = MASK_INSR(aplic_hart_field(cpu), APLIC_TARGET_HART_IDX) |
>>> +          (imsic->sync_id & APLIC_TARGET_EIID);
>>
>>
>>> +
>>> +    spin_lock_irqsave(&aplic.lock, flags);
>>> +
>>> +    writel(val, &aplic.regs->genmsi);
>>> +
>>> +    while ( readl(&aplic.regs->genmsi) & APLIC_GENMSI_BUSY )
>>> +        cpu_relax();
>>> +
>>> +    spin_unlock_irqrestore(&aplic.lock, flags);
>>> +}
>>> +
>> According to AIA spec §4.9.3 (Synchronizing interactions between a 
>> hart and the APLIC), the sequence needs 6 steps; this implements only 
>> steps 2-5:
>>
>> - Step 1: clear the pending bit for sync_id at the hart's IMSIC before 
>> writing genmsi.
>> - Step 6: after releasing the lock, poll the pending bit for sync_id 
>> at the hart's IMSIC until it's set.
>>
>> Step 4 (Busy clear) only means the APLIC has accepted/sent the MSI, 
>> not that it has arrived at the hart (the spec notes an unspecified 
>> travel delay).
>> Without step 6, aplic_genmsi_barrier() returns before the MSI (and 
>> thus prior MSIs) actually reach the hart, so it doesn't achieve the 
>> barrier it's meant to
>> provide.
>>
> 
> It is really missed but it exists in riscv-next-upstream branch 
> (https://gitlab.com/xen-project/people/olkur/xen/-/blob/riscv-next- 
> upstreaming/xen/arch/riscv/imsic.c#L723).
> 
> I will re-check why it is missed here.

Step 1 and step 6 are not missing, they are just not part of
aplic_genmsi_barrier() itself. They are done by its caller, which is 
added in "xen/riscv: remap interrupts to new IMSIC VS-file":

     static void cf_check imsic_aplic_sync(void *unused)
     {
         imsic_local_eix_update(imsic_cfg.sync_id, 1, true, false);

         aplic_genmsi_barrier();

         while ( !imsic_local_is_pending(imsic_cfg.sync_id) )
             cpu_relax();
     }

I did consider doing all six steps inside aplic_genmsi_barrier(), but 
that would make aplic.c reach into IMSIC internals (the local EIx CSR 
accessors, which are private to imsic.c), and I would rather not add 
that dependency. Keeping the APLIC half (write genmsi, wait for Busy to 
clear) in aplic.c and the IMSIC half (clear the pending bit of sync_id 
before, poll it until set afterwards) in imsic.c keeps the layering clean.

You are right, though, that nothing in this patch says so, and that the
helper on its own is not the full barrier its name suggests. I will 
spell the split out in the commit message and in the comment above the 
function.

Probably it will be better to introduce function imsic_aplic_sync() as a 
part of this patch.

~ Oleksii

