Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8224C982FA
	for <xen-devel@archiver.kernel.org>; Tue, 22 Sep 2026 18:48:57 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1429432.1652304 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x95Xo-0000Oa-8Y; Tue, 22 Sep 2026 18:48:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1429432.1652304; Tue, 22 Sep 2026 18:48:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x95Xo-0000OT-60; Tue, 22 Sep 2026 18:48:44 +0000
Received: by outflank-mailman (input) for mailman id 1429432;
 Tue, 22 Sep 2026 18:48:42 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1x95Xm-0000ON-Lb
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2026 18:48:42 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x95Xl-005MWG-VA
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2026 20:48:41 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6ab2cd65-8faa-0a2a0a5109dd-0a2a4503e044-48
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 20:48:41 +0200
Received: from [74.125.225.140] (helo=mail-wm2-f12.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6ab2cd89-fae8-0a2a45030019-4a7de18ce22f-3
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 20:48:41 +0200
Received: by mail-wm2-f12.google.com with SMTP id
 5b1f17b1804b1-49cd4ba9f68so1247425e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 11:48:41 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-71-234.play-internet.pl.
 [109.243.71.234]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49fde1acb91sm10872635e9.15.2026.09.22.11.48.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Sep 2026 11:48:40 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1790102921; x=1790707721; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lIPMuq7W1Pa4X4TXu8rbTxYicHKqL6hnBXo/9p1I/dM=;
        b=dwx/kwnxIvR0NpYpc9ByzbERa7DGlJJFiIILWZpREbmoheZeQEcgknIXGWMF7peDP0
         Ak2g3YFoarVrYm9rxCNuVsqYyAyaW4r6A7VzZdEQuofvGOZ48MzJuW8AStY6gl121DPa
         /z4ZZxRqUPP0LfBTj0NiSjXLwXZZnpdQszJ4ifkchuuCK5GkfnNeK1pJcGhI0xgC2GEV
         RIqWF5427Tp0aiNIi4GW9umSgReAdP0ipKEzpcOm54XdgXspctqDr8jaJGHRkaMSU8uU
         QNvXv6R4w2a57A5/UbgtdkgVYTMJYPQ3yZbSlSaVmrxD+zfkTZK8QpVUjE/j2qLM4Q4t
         5kBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790102921; x=1790707721;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lIPMuq7W1Pa4X4TXu8rbTxYicHKqL6hnBXo/9p1I/dM=;
        b=Lt+n+wmePOyloj9/Dpv1UICFLxsKThvO7vNLf0WaELOs5GTdltcf2HUR4rRurtiDQa
         EJwOWNsPPLbPkDatfqHWdWy1XuFtawnIlKCKQEPaFOEOwTDI6O+FSSUY1LVOFxw23BGZ
         1oX9ZKaRquGENxJMQxQ+zXoB4/o+PgQgl/BrTg/bvXNNIXxY0c3Z3WRw/1BO0RtQW1EP
         B7lzSYy51QIIrC5UbOGZ4mOr2fcMAcPFJSS9GBPxKVMKdJ+cksn0D896jkehNQQbqmNK
         2WUH7vNfpvZZrYv8zAz9HCWuIhrEfGgu7OVL2fo/LiQzmEYyZT+aav8wC9n8nZIvhjpx
         BJng==
X-Gm-Message-State: AFuF++kVc15CIXULS5eWKLmRWyuqxzbmfwE+n48XE/XsT40rUXqIj7qP
	4OU4qAyLX0k6njODvbwGdEyDUBXwYKlCzJLYui9DLMpXoDGi30DmvqHP
X-Gm-Gg: AYBFou0vBm7TKbynaBYhUUFicQzq/I/zRs0tPbCkcl9izFQTIfnUoV7JYVccv02Pj6O
	1TJZs2l/2UNIGol45L+EYTQjikIP7CCLc4D5IHgThakn5hbnogtjgA4Q49AWSwkqDAMZJTb8aX9
	WecKwxd+ZhoIQTy1pY1lQs68iWpk84PqamusQXH2xNurcBFy6lE17CPAtO6mMGdrjbvu4hpQSKf
	J4a9JDVh7V9Nt1OtM5qp83Ry0kVsV7nx/HC0H1uYtS1LEurSFjmKWMYo3H6BjYizfn/n5uLE5Sj
	86zTnuzjAEa7CMe9cHTFdTw8TXOm9YoMRqCRO6rE0gN/oJBfTheUktEudMxMBOMqSgiuAuqJKWK
	PY/5cZOhxbl6Bf/5kVPM8JXrYCldWZonV+sbca5Fz5SRryIkyZ4xVw9ItLEjFCxmosYy/Ec6dzN
	aTjFMNtAHEnezuLzifAxfocYXagKpzWH8E+KXLRIEKQCC/nK6U5A8ufwpX6sGFlGBPA/PLUN5Wn
	1Zg35lUKTttOxaVV8+QgP0sCcasG+L+YDgfe8+MAe0MmPueWQk=
X-Received: by 2002:a05:600c:138d:b0:49e:73d3:78ab with SMTP id 5b1f17b1804b1-49fdec980c6mr2165765e9.0.1790102921255;
        Tue, 22 Sep 2026 11:48:41 -0700 (PDT)
Message-ID: <6da5569d-8ae8-4388-a407-00b5d2a4bc27@gmail.com>
Date: Tue, 22 Sep 2026 20:48:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 31/39] xen/riscv: implement APLIC-hart sync barrier for
 vCPU migration
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
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <1790096435.8631fc262581453bbf619ec5b2062170.1a0ca0fea6500072c4@vates.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-33051d/1790102921-6DCD34E9-452875B4/10/73395122804
X-purgate-type: spam
X-purgate-size: 2917



On 9/22/26 7:00 PM, Baptiste Le Duc wrote:
>> During migration of a virtual hart to a different guest interrupt file,
>> straggler MSIs from the APLIC could arrive at the old interrupt file
>> after the switch.
>>
>> genmsi is used despite not supporting guest interrupt files because the
>> AIA spec guarantees that all MSIs previously sent from the APLIC to the
>> same hart are visible at the hart's IMSIC before the extempore MSI from
>> genmsi becomes visible.
> 
> 
>>
>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>>
>> diff --git a/xen/arch/riscv/aplic.c b/xen/arch/riscv/aplic.c
>> index 0af13f28e4..cb11d6aeaa 100644
>> --- a/xen/arch/riscv/aplic.c
>> +++ b/xen/arch/riscv/aplic.c
>> @@ -27,7 +27,9 @@
>>   #include <asm/imsic.h>
>>   #include <asm/intc.h>
>>   #include <asm/io.h>
>> +#include <asm/processor.h>
>>   #include <asm/riscv_encoding.h>
>> +#include <asm/smp.h>
>>   
>>   static struct aplic_priv aplic = {
>>       .lock = SPIN_LOCK_UNLOCKED,
>> @@ -205,6 +207,30 @@ void aplic_hw_write_reg(unsigned int offset, uint32_t value)
>>       spin_unlock_irqrestore(&aplic.lock, flags);
>>   }
>>   
>> +/*
>> + * As needed, synchronize with all IOMMUs and APLICs to ensure that no
>> + * straggler MSIs will arrive at the old interrupt file after this step.
>> + */
>> +void aplic_genmsi_barrier(void)
>> +{
>> +    const struct imsic_config *imsic = imsic_get_config();
>> +    unsigned int cpu = smp_processor_id();
>> +    unsigned long flags;
>> +    uint32_t val;
>> +
>> +    val = MASK_INSR(aplic_hart_field(cpu), APLIC_TARGET_HART_IDX) |
>> +          (imsic->sync_id & APLIC_TARGET_EIID);
> 
> 
>> +
>> +    spin_lock_irqsave(&aplic.lock, flags);
>> +
>> +    writel(val, &aplic.regs->genmsi);
>> +
>> +    while ( readl(&aplic.regs->genmsi) & APLIC_GENMSI_BUSY )
>> +        cpu_relax();
>> +
>> +    spin_unlock_irqrestore(&aplic.lock, flags);
>> +}
>> +
> According to AIA spec §4.9.3 (Synchronizing interactions between a hart and the APLIC), the sequence needs 6 steps; this implements only steps 2-5:
> 
> - Step 1: clear the pending bit for sync_id at the hart's IMSIC before writing genmsi.
> - Step 6: after releasing the lock, poll the pending bit for sync_id at the hart's IMSIC until it's set.
> 
> Step 4 (Busy clear) only means the APLIC has accepted/sent the MSI, not that it has arrived at the hart (the spec notes an unspecified travel delay).
> Without step 6, aplic_genmsi_barrier() returns before the MSI (and thus prior MSIs) actually reach the hart, so it doesn't achieve the barrier it's meant to
> provide.
> 

It is really missed but it exists in riscv-next-upstream branch 
(https://gitlab.com/xen-project/people/olkur/xen/-/blob/riscv-next-upstreaming/xen/arch/riscv/imsic.c#L723).

I will re-check why it is missed here.

Thanks for noticing that.

~ Oleksii


