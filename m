Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98EE6C54FDF
	for <xen-devel@archiver.kernel.org>; Thu, 30 Jul 2026 07:43:10 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1377218.1623395 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wpLPo-0003SM-2N; Thu, 30 Jul 2026 07:42:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1377218.1623395; Thu, 30 Jul 2026 07:42:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wpLPn-0003SE-Tv; Thu, 30 Jul 2026 07:42:51 +0000
Received: by outflank-mailman (input) for mailman id 1377218;
 Thu, 30 Jul 2026 07:42:49 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wpLPl-0003S8-O7
 for xen-devel@lists.xenproject.org; Thu, 30 Jul 2026 07:42:49 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wpLPk-009upG-Il
 for xen-devel@lists.xenproject.org; Thu, 30 Jul 2026 09:42:48 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a6b0073-2eae-0a2a0a5409dd-0a2a4507ab60-2
 for <xen-devel@lists.xenproject.org>; Thu, 30 Jul 2026 09:42:48 +0200
Received: from [209.85.128.41] (helo=mail-wm1-f41.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a6b0078-b4ea-0a2a45070019-d1558029ec05-3
 for <xen-devel@lists.xenproject.org>; Thu, 30 Jul 2026 09:42:48 +0200
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-4954dff6536so10659445e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 30 Jul 2026 00:42:48 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49800f0ebfasm35537325e9.2.2026.07.30.00.42.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Jul 2026 00:42:47 -0700 (PDT)
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
        d=suse.com; s=google; t=1785397368; x=1786002168; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M+ls5KwDMuUUQW6hmqkZ101ofB2G945M+4tycLdrlT4=;
        b=KQrS+yBO887H76T2rqkMJew4dzAO7uh/LBq12HPvHkxuAXK7k0/ouYo+bQPFXhu1o/
         Q94qvTr3XwUQylh+Mh4CdmkRK9C5gnGBuq3EVKeaDgEEFJEM0vZbuFROm25V/fPTVdyJ
         Nmp8IKiZnmnHnkhSkjXmwv69aJO0ys4Y5S6QjTiOdFsSiAuKkNyMOupsWdmftwGR7Y68
         R6Muy/RTNqWBMg+ulaFz5xjKGYTrmZUInxOTQIio7RX0DzBXG/J29SBli7PhZIjnPm9V
         +VVqp9QnXvb6c0PNz8NnZwWvciLsrJ7VxYUE5L5BZyoev4e8IvnJZiURuE8XX3s6g/5L
         YjDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785397368; x=1786002168;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M+ls5KwDMuUUQW6hmqkZ101ofB2G945M+4tycLdrlT4=;
        b=R9sdVlNdABlg1OxuM6GLLcE7jzH5GPNifgD9fxtESfanSp1eRmkRb1pBPc++SCm3WB
         93dDRH9LBBuf1GYVEUNxKKpPG5/4N/QH1211sR+P8qRWlJOHGlbK9IBPmVBzzHfBR0bd
         POAzGuJVjm0HKoLVooqUfWBnCb2hk00oFGbA08e0LflNMy6XepTG3oRYJkcQmsTvNmKL
         hJ8dKZkjaElGmJkgLrnjUOHX9GQxRrHRUhpmSATiSEIs19aW7K0Q9U8T4y/glEgumU+x
         7MmHqRiOXahmGYEzKcH9DT6PZZwPl76EZK5F+Nnod8DtTNDDOxcpbadHHTyjGndtK2n+
         keEQ==
X-Forwarded-Encrypted: i=1; AHgh+RrBkqnMOPJ0WdKoMQnwvIGYPuQSPt+QG8pmnZSMyD1AlrF3vW63VEEJY9Ay2VFs0e/R7VD4UrHXfpQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxC0KCyJaZWiK0tKQCXPttsD6M6jzgVtYHre/+syru/PwwAZy7/
	arnQWE5ruH503gJC26wAdgNeuvEPBKdKNF2ijplGY5gAU3R1pHGEzfQtZGILIbYvxQ==
X-Gm-Gg: AR+sD10dv86dB9UZqWkLFbwcy2ArscnAUTOxIE4ZqO3dLc1z8Wu6yxVDgTDaM/cBmEe
	GEWZXfSmEf8JgWpexg837VHtj9uyMHAkvafORnbOpuHpxc3zoQGHjrnPemJdxExePPZHVLtcYnp
	ZULLErJA74ZbgBKkQCur6B5o9G6N7sFjc2X5h4YgCjMwKld/DITnvrbDW8coT0GbqT4x55acCCB
	prD4vnkdSaWEivlzeQvCsZ/Gj5SOFYn3oDAtTyL53TTsPXrNe9CSvj7rH/N+mscC4kvsdAEzP9g
	G0JFN2nA65XinbK4xh9NVxPgKlIwH6V6od0dg9EzBodxM4QSLTznpxCeyEalCtFBuQJPoXo5tdG
	fyIHX9EHjVuwFytKHULeQLENs1KaVTYb3Dn0gxQWn90LwY8sBn8Ge4kHwrGMaEBuMqX9obOdV/J
	kiBOMvmebULaQEcBqZ3qhs5RS8Rp+8KV1yUpiBNrBs9OdjxkEvIoLiELMjnEfQQTO7PaowQi66z
	iS/wVBg4YIUZw/L1tjTdUBNc5TbuP7hiID5Uquq66ntJFW/1R8d
X-Received: by 2002:a05:600c:4f8a:b0:495:472c:208d with SMTP id 5b1f17b1804b1-49800ebb090mr18278185e9.38.1785397367818;
        Thu, 30 Jul 2026 00:42:47 -0700 (PDT)
Message-ID: <489a1b05-4ae5-44ac-a73b-485669190b59@suse.com>
Date: Thu, 30 Jul 2026 09:42:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 02/17] xen/riscv: add basic VGEIN management for AIA
 guests
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
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
In-Reply-To: <191a9ddc-9f37-4d26-9141-7dfaf88cb26c@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ef75cf/1785397368-A66DAAE4-F16C21BE/0/0
X-purgate-type: clean
X-purgate-size: 5386

On 29.07.2026 16:55, Oleksii Kurochko wrote:
> On 7/27/26 5:41 PM, Jan Beulich wrote:
>> On 20.07.2026 18:02, Oleksii Kurochko wrote:
>>> It was decided to add support for IMSIC from the start instead of having APLIC
>>> operate in direct delivery mode, as it requires a trap-and-emulation approach,
>>> which is not optimal from a performance standpoint.
>>>
>>> AIA provides a hardware-accelerated mechanism for delivering external
>>> interrupts to domains via "guest interrupt files" located in IMSIC.
>>> A single physical hart can implement multiple such files (up to GEILEN),
>>> allowing several virtual harts to receive interrupts directly from hardware.
>>>
>>> Introduce per-CPU tracking of guest interrupt file identifiers (VGEIN)
>>> for systems implementing AIA specification. Each CPU maintains
>>> a bitmap describing which guest interrupt files are currently in use.
>>>
>>> Add helpers to initialize the bitmap based on the number of available
>>> guest interrupt files (GEILEN), assign a VGEIN to a vCPU, and release it
>>> when no longer needed. When assigning a VGEIN, the corresponding value
>>> is written to the VGEIN field of the guest hstatus register so that
>>> VS-level external interrupts are delivered from the selected interrupt
>>> file.
>>
>> And when exactly is this "assignment" intended to occur? vgein_assign() and
>> vgein_release() have no callers here, so this remains entirely unclear.
> 
> [A] Agreed, I should have added that information to the commit message:
> 
> VGEIN is assigned (via vgein_assign()) before jumping to the new vCPU 
> execution context (in continue_new_vcpu()) and is re-assigned during 
> vCPU migration from one pCPU to another.
> 
> VGEIN is released (via vgein_release()) on the old pCPU during migration.

That is, state of that vCPU is held in hardware for perhaps an extended
period of time after the vCPU was last de-scheduled. That's a fair
optimization (we do something similar on x86, albeit that has been
increasingly under question lately). However, doesn't this then require
sync_local_execstate() to become non-empty?

Furthermore, rather than having vgein_assign() fail when
find_next_zero_bit() fails to find an available ID, shouldn't you release
some other vCPU's ID, making it available for re-use?

>>> +static int cf_check cpu_callback(struct notifier_block *nfb, unsigned long action,
>>> +                        void *hcpu)
>>> +{
>>> +    unsigned int cpu = (unsigned long)hcpu;
>>> +    int rc = 0;
>>> +
>>> +    switch ( action )
>>> +    {
>>> +    case CPU_STARTING:
>>> +        rc = vgein_init(cpu);
>>> +        if ( rc )
>>> +            printk("AIA: failed to init vgein for CPU%u\n", cpu);
>>> +        break;
>>> +    }
>>> +
>>> +    return notifier_from_errno(rc);
>>> +}
>>
>> Where's the freeing of the allocation vgein_init(), when CPU bringup fails
>> or a CPU was brought down?
> I'll add the following:
> 
> case CPU_UP_CANCELED:
> case CPU_DEAD:
>      vgein_free(cpu);
>      break;
> 
> and:
> 
> static void vgein_free(unsigned int cpu)
> {
>      struct vgein_ctrl *vgein = &per_cpu(vgein, cpu);
> 
>      ASSERT(!vgein->bmp);

Does this hold in all cases? What migrates vCPU-s off of a pCPU going down?
IOW aren't you introducing an ordering problem between your notifier handler
and the scheduler's?

>      vgein->geilen = 0;
>      XVFREE(vgein->owners);
> }
> 
> I'm also wondering whether vgein_init() should be moved to 
> CPU_UP_PREPARE. If vgein_init() fails in CPU_STARTING, the hypervisor 
> will stop instead of simply ignoring the CPU.
> 
> However, in CPU_UP_PREPARE we don't yet know the value of GEILEN, which 
> is needed to allocate vgein->owners. As I understand it, CPU_UP_PREPARE 
> is not executed on the CPU that is being brought up.

But there's an upper bound, isn't there? Use that for preliminary allocation,
and re-alloc (best effort) from CPU_ONLINE?

Yet then I continue to question the presence of this array in the first place.
Something similar isn't needed elsewhere (afaik), and its intended use (as
said) doesn't become obvious here.

>>> +unsigned int vgein_assign(struct vcpu *v)
>>> +{
>>> +    unsigned int vgein_id;
>>> +    struct vgein_ctrl *vgein = &per_cpu(vgein, v->processor);
>>> +    unsigned long *bmp = &vgein->bmp;
>>> +    unsigned long flags;
>>> +
>>> +    if ( !vgein->geilen )
>>> +        return 0;
>>> +
>>> +    spin_lock_irqsave(&vgein->lock, flags);
>>
>> Because it's unclear where this is to be called from, it's also unclear whether
>> a lock is needed here (and if so whether a plain spin lock is appropriate).
> 
> Based on what I wrote in [A] above a lock is defintely needed as it 
> could be that vgein_release() is called for old pCPU during migration 
> and at the same time old pCPU could call vgein_assign() so we want to 
> keep vgein bitmap consistent.

Can this really happen? It almost sounds as if you were suspecting
context-switch-in could race with context-switch-out. Yet again - none of
this can sensibly be discussed without seeing how / where the functions are
to be used.

> Regarding why _irqsave() it is mostly connected to ...

Why the mention of _irqsave? My use of "plain spinlock" was meant to contrast
to the possible use of an r/w lock.

Jan

