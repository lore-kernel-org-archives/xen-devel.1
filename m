Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 667D6E78D6A
	for <xen-devel@archiver.kernel.org>; Mon,  9 Feb 2026 09:07:43 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1225008.1531448 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpNEz-0007QD-8c; Mon, 09 Feb 2026 09:07:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1225008.1531448; Mon, 09 Feb 2026 09:07:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpNEz-0007Q6-5Q; Mon, 09 Feb 2026 09:07:33 +0000
Received: by outflank-mailman (input) for mailman id 1225008;
 Mon, 09 Feb 2026 09:07:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bBDp=AN=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vpNEy-0007Q0-5X
 for xen-devel@lists.xenproject.org; Mon, 09 Feb 2026 09:07:32 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c2b1d286-0596-11f1-9ccf-f158ae23cfc8;
 Mon, 09 Feb 2026 10:07:29 +0100 (CET)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-43638a3330dso1162453f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 09 Feb 2026 01:07:29 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-436296bd1c9sm24901859f8f.15.2026.02.09.01.07.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Feb 2026 01:07:28 -0800 (PST)
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
X-Inumbo-ID: c2b1d286-0596-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1770628049; x=1771232849; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=JsQ2GXmQfO89ijeuq5/YBvvUKb75EA9IxDV5fq3XWB0=;
        b=cFMMOYf2Qf3pUvqCgbUOdM8UzEiTv9vKcbh7wcBZfrXXxOl3lruacG8P8Jvx2lcTfS
         nqIqopb7q1Ntwi35jnTVDKfhHnwFXOqh7aeIH+Oq0HruyDX+OBO0lZ5BPX+xwWVYtpSJ
         zELb1k+1tvIh4S4pKcEs9leI/CEpu10y5cwZU1OV75wRQ6JsI8b1jclHZsvjJ/eBEhf2
         SjLFuNnn023+2NK23vuccndkoSniKaI2DMepZeOkISRhUT+LNzAMGBcFPMB1f74qyGhd
         KLIocEiTlBsv2tJIpERiKSf0ut4pO0A1hJ/VVoEgSQVqKa14FKN6Ca9O0Xq0IHVj+e2/
         urFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770628049; x=1771232849;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JsQ2GXmQfO89ijeuq5/YBvvUKb75EA9IxDV5fq3XWB0=;
        b=PFqa071P4eQG46qJMV8EuVn7oKpG2O+1CHoKJzinWUILmzNNs9M8/1y0xYy4Ul8Xi9
         Q/vkddM7zCkihra1gEh0ANO8k4Ro2+neBYG7tgSU/WCVgOhNpUumawfeq2H1dOhT9Vnu
         W4bQOJPhzuOXvviay2nPtEIY4Sj+LsIAuh5zIVyGoY5gaTGtlCvvDWmcyiU7MmLHSHG+
         HWyXmBUtxdpb2VIUxGZqZbkUk69eb9EzDG4ijksm2vypxnXkNNvxMP9Z+Nj6UvQ+CIJ4
         ocPrFT08Ja4b7KdIMl3CUpQnnjWZq72MBqC3pCk2czBmB7Z0MWBHP7A4t+6ySv7tRH1u
         Upyw==
X-Forwarded-Encrypted: i=1; AJvYcCU37vBdX6RtU6ejwngqiZ13dXkYcwghNaLcFwIFMBI/4feU924wrSrltHJJWKUuBrWAAKY0qycMgzQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxibZmlg2WkpnJdy6ty5y7usIXBg+hzS5S1ixHm6u3ApQEGpDQl
	VEIm8nfwZw6Lqfyzq10hxiiwCj7MxBykGCYGR4pZuRINS//KIwMWuIfXxD3IXclDxw==
X-Gm-Gg: AZuq6aLpGzyxOoKQCNToHrufWHSnUTGV8yC8EdYMAgTWdEehFcP/DFiLAtbwCuo6J0G
	lJcRAPyYiiFDpbtjWz7nGMzDsmawz4IcVRbujNrqyc7v1ssz4VMJvSMnU9uZW3eDIPTtORFTQXv
	Q/MiOEb4XkIuAWJNb1sJtdSwVWw5ubSVWQWIxcJz/CTtPjQpQXZNw7eWjErds2KOYRnKju+8T4w
	sgNDr5chxEuwiDN4oTwb7cNwwsouFwtt8Sx7jEr205gGqvjp38TAW0HjN/iciMrr/T5YgsjGVsR
	N066i/Iqo0LUi+pqD4m8HrWnR0dkta5cfgbxr9bBqQ7L/grfikrxi/S7BLZtJREkR5MiGh0Hmsn
	Zki9ZSZy3dt7iWl6ygyXsXplrX0PVmZoPba4fXle6j3CV+wFbPMlzABIij5bsN5vsMgkyeuapQJ
	j7sHYOTm8MqxLWo++hnmAcR+awAydiqp+IOjXuSWg9iv7zlIV6hWEMRODf8QDUGtg/0Ht10bkmI
	Bs=
X-Received: by 2002:a05:6000:4211:b0:436:1e6:e1d6 with SMTP id ffacd0b85a97d-4362938c3c2mr17031638f8f.46.1770628048937;
        Mon, 09 Feb 2026 01:07:28 -0800 (PST)
Message-ID: <4a12e652-5b53-40d0-b701-d1f5b749dfa7@suse.com>
Date: Mon, 9 Feb 2026 10:07:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/16] xen/riscv: introduce vcpu_kick() implementation
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Romain Caritey <Romain.Caritey@microchip.com>, xen-devel@lists.xenproject.org
References: <cover.1769099883.git.oleksii.kurochko@gmail.com>
 <0335a7db0343d81ce4256482a464e7ba5df1c204.1769099885.git.oleksii.kurochko@gmail.com>
 <14d19350-0de8-4496-99e5-0ba76e421684@gmail.com>
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
In-Reply-To: <14d19350-0de8-4496-99e5-0ba76e421684@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06.02.2026 17:36, Oleksii Kurochko wrote:
> 
> On 1/22/26 5:47 PM, Oleksii Kurochko wrote:
>> Add a RISC-V implementation of vcpu_kick(), which unblocks the target
>> vCPU and sends an event check IPI if the vCPU was running on another
>> processor. This mirrors the behavior of Arm and enables proper vCPU
>> wakeup handling on RISC-V.
>>
>> Remove the stub implementation from stubs.c, as it is now provided by
>> arch/riscv/domain.c.
>>
>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>> Acked-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> Changes in v2:
>>   - Add Acked-by: Jan Beulich <jbeulich@suse.com>.
>> ---
>>   xen/arch/riscv/domain.c | 14 ++++++++++++++
>>   xen/arch/riscv/stubs.c  |  5 -----
>>   2 files changed, 14 insertions(+), 5 deletions(-)
>>
>> diff --git a/xen/arch/riscv/domain.c b/xen/arch/riscv/domain.c
>> index e38c0db62cac..13ac384c4b76 100644
>> --- a/xen/arch/riscv/domain.c
>> +++ b/xen/arch/riscv/domain.c
>> @@ -1,8 +1,10 @@
>>   /* SPDX-License-Identifier: GPL-2.0-only */
>>   
>> +#include <xen/cpumask.h>
>>   #include <xen/init.h>
>>   #include <xen/mm.h>
>>   #include <xen/sched.h>
>> +#include <xen/smp.h>
>>   #include <xen/vmap.h>
>>   
>>   #include <asm/bitops.h>
>> @@ -240,3 +242,15 @@ void vcpu_sync_interrupts(struct vcpu *v)
>>   #   error "Update vsieh"
>>   #endif
>>   }
>> +
>> +void vcpu_kick(struct vcpu *v)
>> +{
>> +    bool running = v->is_running;
>> +
>> +    vcpu_unblock(v);
>> +    if ( running && v != current )
>> +    {
>> +        perfc_incr(vcpu_kick);
> 
> Because of this it is needed to introduce:
>    PERFCOUNTER(vcpu_kick, "vcpu: notify other vcpu")
> Otherwise randconfig build will fail when CONFIG_PERF_COUNTERS=y.
> 
> I would like to ask if it would be okay to add it xen/include/xen/perfc_defn.h
> just after PERFCOUNTER(need_flush_tlb_flush,...) or would it be better to have
> it in arch specific perfc_defn.h?

Arch-specific please - it's not used by x86 nor ppc.

Jan

