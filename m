Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52479C5516F
	for <xen-devel@archiver.kernel.org>; Fri, 31 Jul 2026 14:59:28 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1379279.1624012 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wpoha-0002uH-S2; Fri, 31 Jul 2026 14:59:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1379279.1624012; Fri, 31 Jul 2026 14:59:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wpoha-0002uA-PH; Fri, 31 Jul 2026 14:59:10 +0000
Received: by outflank-mailman (input) for mailman id 1379279;
 Fri, 31 Jul 2026 14:59:08 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wpohY-0002u1-IO
 for xen-devel@lists.xenproject.org; Fri, 31 Jul 2026 14:59:08 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wpohX-00CVvR-Oa
 for xen-devel@lists.xenproject.org; Fri, 31 Jul 2026 16:59:07 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a6cb82f-bab6-0a2a0a5309dd-0a2a450b8b88-20
 for <xen-devel@lists.xenproject.org>; Fri, 31 Jul 2026 16:59:07 +0200
Received: from [209.85.218.41] (helo=mail-ej1-f41.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a6cb83b-b7e8-0a2a450b0019-d155da29cdab-3
 for <xen-devel@lists.xenproject.org>; Fri, 31 Jul 2026 16:59:07 +0200
Received: by mail-ej1-f41.google.com with SMTP id
 a640c23a62f3a-c1677c91969so133922466b.1
 for <xen-devel@lists.xenproject.org>; Fri, 31 Jul 2026 07:59:07 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c1fd455ab7dsm177614366b.58.2026.07.31.07.59.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 31 Jul 2026 07:59:06 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1785509947; x=1786114747; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vFL7IZqH065sq8iRIoOhFm50HgrVotTfZWHtBKxIz8M=;
        b=mcX/7mUouS90c8RXzA23D0Y6H0C4nSZIRlnQfbiv00WfUjX0GSkWJ2TNZvUPVi5ABA
         NvGzzm9WNBWLiRtMLZ6uw3tsqNUd3/zf2g4RjTRjqxh2O8aveGm9DBD6eUyx9JvmwJcJ
         Nf63zxfhlyxVSyXjFiPqPu74kpHF0W/02lMKmfSEJdTH6JGfTv2KimTBWCzZiszDD+0O
         mT135yhj4YbT5P5JtRqiLv1hPWtp91mtA2tIS9MeS1252x5sqtlZ6RqhS53zQRfAWlEp
         dcjgaCGIQ3gfQwGyNIpCJ+ANbnSg514Ghb/mUKMSLXwhRvmNTqvh2XV4b+Z42doXI/9S
         HgTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785509947; x=1786114747;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vFL7IZqH065sq8iRIoOhFm50HgrVotTfZWHtBKxIz8M=;
        b=AKXSxBUzvRLQU12koM0I2SroemdMa4WUy5jACDRx2iKmi5vTOXTWQUMCDeSe+RjS3/
         2mzuuuEsbsTSKmKVjQyDblyRDQcIZH8u34DyulUh1kdNDH0i4PUitcRAwv3YOUm0WSkL
         Y8hhP1YZoYyDCTTh6ULOtB6J6Za14a1wnqxXwlvwgZQKBUkhan8HbTDwJAYNeg3+1Tnx
         tWCa0jx1VTBBcsN9qJbWMAWVIiA5WP4/8NF7wNpcqN+fX6qn4fgMRMhm58A6bo8FmrU/
         0yx+22XNXQ/xjiRbhRgNnw4MoXXOFAwH4kwPX5lJoecI2HYAr5NPtC+jeH221q2B8Cyi
         v42w==
X-Forwarded-Encrypted: i=1; AHgh+RqGSZOnrSLSsVY7zO15A0UoaI+rUgPHmbt6fVhVM8zrSSCeTPtZkrG5N4lihoI9YSHuRpz7CPQgyao=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwS05vhH+ELIyUP+EsNdBpYsUts/HhqIz6CQRXh7j+syfeznUQW
	d8pkvEJ2aKiH9baewcm0Z0OTteb/8+/r9CumatTPgheDWVAJdMf9olOA
X-Gm-Gg: AR+sD12VdAiJ+o8AVMpiOpdk+aK9+vt46XonutwnxOzC8+xuO+sLLQ/gAxxBcjW7Box
	SwM8lJErc5zXaKVSqZ2me4pf5+ml6xX1ZUS575waJR3ClTTCCR036hgWSiy2Ia11GSYIf67YvQz
	ZICCdpitbdQ4vS2tRbLlXowKA1jND71tCa9F9WD56rGL6j9hDxWNgPPzNn4Y/GTw9/szRJd65as
	omAM+8F5Ja5IV6gkP/QmILxGmn8I3QQmRucP1bzsDfRp4Kl4qL8mA4eJIU60ihFqwqo+ALp1QwW
	ZCGBl6R1wBk3S4IHmotasqQu2v3bYequy4kXkEweOt7lrJuI64Lg2oUIHaPzJWDzt9piM0FoiP0
	Kre1pGTLM2MKcK7lHmYYMo+3F0lT2KpvRU+abBZswce402dMUBRlsKLFlK0fc4kay+FNXCtcyrx
	nwPMnj8QCCnhMhPmL0r2+ZE5uosRivp1QSrnvowYOT1LEPLRCeOTo9YFaKs6/nC9ALzVcDGsXSf
	528yZ0wIOcQzaDyfY7uUGol1yw1iTV/IdRAeCvHxt0=
X-Received: by 2002:a05:6938:a08f:10b0:c19:6d4a:4261 with SMTP id a640c23a62f3a-c1fd2730097mr102003866b.63.1785509946954;
        Fri, 31 Jul 2026 07:59:06 -0700 (PDT)
Message-ID: <39aa93bb-edb8-4f05-8b62-c2677d12fb0b@gmail.com>
Date: Fri, 31 Jul 2026 16:59:05 +0200
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
 <191a9ddc-9f37-4d26-9141-7dfaf88cb26c@gmail.com>
 <489a1b05-4ae5-44ac-a73b-485669190b59@suse.com>
 <aca9e72d-ff6d-49e0-b128-6675c5521493@gmail.com>
 <79ea95df-29bf-4c9e-8097-2c2b991f27bf@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <79ea95df-29bf-4c9e-8097-2c2b991f27bf@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-42698a/1785509947-A90CD9EA-CDFB0E6C/10/73395122804
X-purgate-type: spam
X-purgate-size: 5495



On 7/30/26 6:03 PM, Jan Beulich wrote:
> On 30.07.2026 17:46, Oleksii Kurochko wrote:
>> On 7/30/26 9:42 AM, Jan Beulich wrote:
>>> On 29.07.2026 16:55, Oleksii Kurochko wrote:
>>>> On 7/27/26 5:41 PM, Jan Beulich wrote:
>>>>> On 20.07.2026 18:02, Oleksii Kurochko wrote:
>>>>>> It was decided to add support for IMSIC from the start instead of having APLIC
>>>>>> operate in direct delivery mode, as it requires a trap-and-emulation approach,
>>>>>> which is not optimal from a performance standpoint.
>>>>>>
>>>>>> AIA provides a hardware-accelerated mechanism for delivering external
>>>>>> interrupts to domains via "guest interrupt files" located in IMSIC.
>>>>>> A single physical hart can implement multiple such files (up to GEILEN),
>>>>>> allowing several virtual harts to receive interrupts directly from hardware.
>>>>>>
>>>>>> Introduce per-CPU tracking of guest interrupt file identifiers (VGEIN)
>>>>>> for systems implementing AIA specification. Each CPU maintains
>>>>>> a bitmap describing which guest interrupt files are currently in use.
>>>>>>
>>>>>> Add helpers to initialize the bitmap based on the number of available
>>>>>> guest interrupt files (GEILEN), assign a VGEIN to a vCPU, and release it
>>>>>> when no longer needed. When assigning a VGEIN, the corresponding value
>>>>>> is written to the VGEIN field of the guest hstatus register so that
>>>>>> VS-level external interrupts are delivered from the selected interrupt
>>>>>> file.
>>>>>
>>>>> And when exactly is this "assignment" intended to occur? vgein_assign() and
>>>>> vgein_release() have no callers here, so this remains entirely unclear.
>>>>
>>>> [A] Agreed, I should have added that information to the commit message:
>>>>
>>>> VGEIN is assigned (via vgein_assign()) before jumping to the new vCPU
>>>> execution context (in continue_new_vcpu()) and is re-assigned during
>>>> vCPU migration from one pCPU to another.
>>>>
>>>> VGEIN is released (via vgein_release()) on the old pCPU during migration.
>>>
>>> That is, state of that vCPU is held in hardware for perhaps an extended
>>> period of time after the vCPU was last de-scheduled. That's a fair
>>> optimization (we do something similar on x86, albeit that has been
>>> increasingly under question lately). However, doesn't this then require
>>> sync_local_execstate() to become non-empty?
>>
>> IIUC, sync_local_execstate() is needed for the lazy context switch case
>> when switching from vCPUA to the idle vCPU.
> 
> Or when full state is to be obtained for a vCPU, for example.

I assume you're referring to XEN_DOMCTL_getvcpucontext, right?

In general, it seems that sync_local_execstate() is primarily an 
optimization. If lazy switching isn't supported, then every time a vCPU 
is de-scheduled, its state must be fully saved to memory. My 
understanding is that everything will still work correctly, just less 
efficiently.

I'm curious how much this optimization actually helps. How often does it 
happen that a vCPU is de-scheduled from a pCPU and then immediately 
scheduled back onto the same pCPU without any other vCPU being scheduled 
in between?

I will add to my TODO list that it is nice to use sync_local_execstate() 
in future.

>>>>>> +unsigned int vgein_assign(struct vcpu *v)
>>>>>> +{
>>>>>> +    unsigned int vgein_id;
>>>>>> +    struct vgein_ctrl *vgein = &per_cpu(vgein, v->processor);
>>>>>> +    unsigned long *bmp = &vgein->bmp;
>>>>>> +    unsigned long flags;
>>>>>> +
>>>>>> +    if ( !vgein->geilen )
>>>>>> +        return 0;
>>>>>> +
>>>>>> +    spin_lock_irqsave(&vgein->lock, flags);
>>>>>
>>>>> Because it's unclear where this is to be called from, it's also unclear whether
>>>>> a lock is needed here (and if so whether a plain spin lock is appropriate).
>>>>
>>>> Based on what I wrote in [A] above a lock is defintely needed as it
>>>> could be that vgein_release() is called for old pCPU during migration
>>>> and at the same time old pCPU could call vgein_assign() so we want to
>>>> keep vgein bitmap consistent.
>>>
>>> Can this really happen? It almost sounds as if you were suspecting
>>> context-switch-in could race with context-switch-out. Yet again - none of
>>> this can sensibly be discussed without seeing how / where the functions are
>>> to be used.
>>
>> Maybe I didn't explain it clearly, but during migration (which,
>> according to my understanding of vcpu_move_irqs(), is executed on
>> pCPU1), when vCPU0 is migrated from pCPU0 to pCPU1, its old VGEIN on
>> pCPU0 needs to be released. I don't see any reason why, at the same
>> time, pCPU0 could not try to assign that VGEIN to another vCPU. Without
>> proper protection, this could lead to race conditions.
> 
> Doesn't migration of vCPU-s between pCPU-s happen under suitable scheduler
> locks?
> 

If I am not mistaken every path that reaches arch_move_irqs() drops the 
scheduler lock first. The only thing still held at that point is 
sched_res_rculock , and that is an RCU read-side critical section, not 
mutual exclusion: it merely keeps struct sched_resource alive across 
get_sched_res() dereferences, since cpupool/hotplug frees those via 
call_rcu(&sr->rcu, sched_res_free). Any number of pCPUs can be inside it 
concurrently, and it does not disable interrupts, so it serialises 
neither the source pCPU against the destination one nor hgei_interrupt() 
mentioned above against either.

~ Oleksii

