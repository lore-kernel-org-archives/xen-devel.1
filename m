Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1DA0C55164
	for <xen-devel@archiver.kernel.org>; Thu, 30 Jul 2026 16:04:12 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1378110.1623724 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wpTEm-0004WF-1m; Thu, 30 Jul 2026 16:04:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1378110.1623724; Thu, 30 Jul 2026 16:03:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wpTEl-0004W8-UY; Thu, 30 Jul 2026 16:03:59 +0000
Received: by outflank-mailman (input) for mailman id 1378110;
 Thu, 30 Jul 2026 16:03:58 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wpTEk-0004Vg-Pb
 for xen-devel@lists.xenproject.org; Thu, 30 Jul 2026 16:03:58 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wpTEj-009aGw-Tt
 for xen-devel@lists.xenproject.org; Thu, 30 Jul 2026 18:03:57 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a6b75d0-e002-0a2a0a5209dd-0a2a450c85a8-40
 for <xen-devel@lists.xenproject.org>; Thu, 30 Jul 2026 18:03:57 +0200
Received: from [209.85.128.51] (helo=mail-wm1-f51.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a6b75ed-f479-0a2a450c0019-d1558033e418-3
 for <xen-devel@lists.xenproject.org>; Thu, 30 Jul 2026 18:03:57 +0200
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-4953de5be0aso16413625e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 30 Jul 2026 09:03:57 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-498012168e7sm76086735e9.15.2026.07.30.09.03.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Jul 2026 09:03:56 -0700 (PDT)
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
        d=suse.com; s=google; t=1785427437; x=1786032237; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AgbIwe2JSCB50DaLxUfTpH7j/QL+wV5t6V5Z+y2iRZ4=;
        b=PEOnZ9l7amuYCoZP1C/rNft6evZjeL+7G2WLOUfTCGl6s0LuWuqxRRiQbw1+CS8jav
         JAHBp3i0IT8IXSLOw3XAUwElj9fJJSM2yONYRcx5itFQyu4CzPQWz7sxAuKy6Pky6TX+
         sD6wCpyNWsEb8pkoufbUpH9JCkN7IjTpTmMZXEdQnkzx3oU1mh6WUhBS5kUCXiNSpREp
         KF0qIMKfJJoxbsy922Wz0gFlpf/erjs6jfIQBjWjIee/2XmebuUuBddTGG0TdctUQZkX
         op2zlEzevin3K2RLxoe+9bzB2fpTtrok8nHbTvcnC9Gj7iGMVVUqFGiNfzACxA/70s+0
         FSnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785427437; x=1786032237;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AgbIwe2JSCB50DaLxUfTpH7j/QL+wV5t6V5Z+y2iRZ4=;
        b=gp+megypKp1ZvYhhpK/6P2RAdawgZD+imJYLxUO0T12E4kwCHZiYCPa9iBwCqJLV/L
         jI5z03AZz8u9lojmcyGotPt3pN2V5MGSg9N9wooAshwGlpONDVcRiEgI48mp1skswShg
         FfQ+W9jQW5Q/1tWWWdXfLrbTzCBaE6T2/4c43rzWZxSDs5xdsKcH067siLRAYAy5W7I8
         5xwuCAmtzS++KIVaCuJMJbTpfAwXWUyBMcdV9OZi9CnUZhzWoBz/RpsCT38YGCw/r6MD
         b7a2wn8kj5rQMyNnfMzKYG1xr1YHEgTnIWrgOqZwGFGmXgJtmq4J/eWBPNM8nBUlnXAo
         nMog==
X-Forwarded-Encrypted: i=1; AHgh+RpERcO+81LrnTdo2frqc80/42Q/8ilYhL1zEqU1N1K1d525tuW99lEiAMYxrfcci3+VVRhjjV7yhSg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YylnjaIFSxlIbI4kLi3xSZIRR5CnAfWoxbCbfSW8lEKNWJwOjYN
	AOLUyqM+lRNz98oiVYF5s3nfSk8iOQg2Sq4t5WKbUPDW2eotb4WVPovw046nd4rdDA==
X-Gm-Gg: AR+sD127H6aqhpSCwqYVJH/V8RJ4UFU6lw5wdqPtRolodijuf7WTcgIoco3q0mYyiYK
	plRMsqy485rpR6t5MUgEbsJbPd3BGtdT/sNxJPjs9QcMg3LEXWV8R7i2qMIsQfe4sY+zadgDqZm
	d5N0q2nWufsgGkWcBFpxzLhHawF+vXcF2GEax8I0dcm13jfiHUS0C6M18w49pUMCV/j0AnDMass
	AveJ9ERJuiH8nUZZwKDsxMogUFoJ3YFWtUncVFw3WB7yf7j0OnDqeW+ZEmaPbj1Np/EuZRx06Xs
	xj9OiGojCpn9N4oIVZkn8iD1NOAQj3iZ/y8KSNWZZu+LMQucncOoB+KlBYc0OA6MKOPu2x7j8QW
	T8jt60gv9LJnS2yi0AAVblx8G8uPHCKBtMvTkUfF/oKg0r6fCoZ68L/uEXbniU0tygEJqVffFxy
	8r26B6zNVnuF/Mc1Sgeb1XG94v5qdsfK/qwZjjwmmnzJwinUMSe/vwjPS/2HZ8U2FLwjpyRwpXh
	PLzQB3y0GAX/zTGaqNsizBeEZy1CLf8ljkm7+Kk6dnz4WPk8j+O
X-Received: by 2002:a05:600c:6610:b0:495:4811:7998 with SMTP id 5b1f17b1804b1-49800e81002mr46211925e9.17.1785427437116;
        Thu, 30 Jul 2026 09:03:57 -0700 (PDT)
Message-ID: <79ea95df-29bf-4c9e-8097-2c2b991f27bf@suse.com>
Date: Thu, 30 Jul 2026 18:03:54 +0200
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
 <489a1b05-4ae5-44ac-a73b-485669190b59@suse.com>
 <aca9e72d-ff6d-49e0-b128-6675c5521493@gmail.com>
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
In-Reply-To: <aca9e72d-ff6d-49e0-b128-6675c5521493@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d25034/1785427437-5270FA5B-F2647B0F/0/0
X-purgate-type: clean
X-purgate-size: 9529

On 30.07.2026 17:46, Oleksii Kurochko wrote:
> On 7/30/26 9:42 AM, Jan Beulich wrote:
>> On 29.07.2026 16:55, Oleksii Kurochko wrote:
>>> On 7/27/26 5:41 PM, Jan Beulich wrote:
>>>> On 20.07.2026 18:02, Oleksii Kurochko wrote:
>>>>> It was decided to add support for IMSIC from the start instead of having APLIC
>>>>> operate in direct delivery mode, as it requires a trap-and-emulation approach,
>>>>> which is not optimal from a performance standpoint.
>>>>>
>>>>> AIA provides a hardware-accelerated mechanism for delivering external
>>>>> interrupts to domains via "guest interrupt files" located in IMSIC.
>>>>> A single physical hart can implement multiple such files (up to GEILEN),
>>>>> allowing several virtual harts to receive interrupts directly from hardware.
>>>>>
>>>>> Introduce per-CPU tracking of guest interrupt file identifiers (VGEIN)
>>>>> for systems implementing AIA specification. Each CPU maintains
>>>>> a bitmap describing which guest interrupt files are currently in use.
>>>>>
>>>>> Add helpers to initialize the bitmap based on the number of available
>>>>> guest interrupt files (GEILEN), assign a VGEIN to a vCPU, and release it
>>>>> when no longer needed. When assigning a VGEIN, the corresponding value
>>>>> is written to the VGEIN field of the guest hstatus register so that
>>>>> VS-level external interrupts are delivered from the selected interrupt
>>>>> file.
>>>>
>>>> And when exactly is this "assignment" intended to occur? vgein_assign() and
>>>> vgein_release() have no callers here, so this remains entirely unclear.
>>>
>>> [A] Agreed, I should have added that information to the commit message:
>>>
>>> VGEIN is assigned (via vgein_assign()) before jumping to the new vCPU
>>> execution context (in continue_new_vcpu()) and is re-assigned during
>>> vCPU migration from one pCPU to another.
>>>
>>> VGEIN is released (via vgein_release()) on the old pCPU during migration.
>>
>> That is, state of that vCPU is held in hardware for perhaps an extended
>> period of time after the vCPU was last de-scheduled. That's a fair
>> optimization (we do something similar on x86, albeit that has been
>> increasingly under question lately). However, doesn't this then require
>> sync_local_execstate() to become non-empty?
> 
> IIUC, sync_local_execstate() is needed for the lazy context switch case 
> when switching from vCPUA to the idle vCPU.

Or when full state is to be obtained for a vCPU, for example.

> The idea is that if, after 
> running the idle vCPU, the next scheduled vCPU is again vCPUA, then 
> nothing needs to be done because no real context switch has occurred yet.
> 
> IMO, this is not the case for VGEIN. It is perfectly fine for a vCPU to 
> keep its previously assigned VGEIN even if the next scheduled vCPU is 
> different. In fact, it is necessary to preserve VGEIN because it will be 
> needed later, for example, to wake up the vCPU if an interrupt for that 
> vCPU occurs.
> 
> The idea is that if a vCPU uses a hardware interrupt file, then when the 
> vCPU is descheduled, the corresponding CSR_HGEIE bit, where the bit 
> number corresponds to the VGEIN value, is set. If an IRQ_S_GEXT trap 
> then occurs, the hgei_interrupt() handler can determine which vCPU 
> should be woken up:
> 
> void hgei_interrupt(void)
> {
>      unsigned long hgei_mask, flags;
>      struct vgein_ctrl *vgein_ = &this_cpu(vgein);
> 
>      hgei_mask = csr_read(CSR_HGEIP) & csr_read(CSR_HGEIE);
>      csr_clear(CSR_HGEIE, hgei_mask);
> 
>      spin_lock_irqsave(&vgein_->lock, flags);
> 
>      for_each_set_bit ( vs_guest_file_id, hgei_mask )
>      {
>         ...
>         /* do some logic to call vcpu_kick */
>         ...
>      }
> 
>      spin_unlock_irqrestore(&vgein_->lock, flags);
> }

Ah, that's pretty helpful extra information.

>> Furthermore, rather than having vgein_assign() fail when
>> find_next_zero_bit() fails to find an available ID, shouldn't you release
>> some other vCPU's ID, making it available for re-use?
> 
> This is a good question, and it requires a separate investigation to 
> determine whether such an approach would actually be beneficial. It 
> would require not only changing the VGEIN field in vcpu->hstatus, but 
> also synchronizing at least the pending interrupts from one IMSIC 
> interrupt file to another, which would also consume time and further 
> complicate the logic.
> 
> If find_next_zero_bit() fails, the vCPU will simply receive VGEIN=0, 
> which means that the software interrupt file will be used. Therefore, 
> everything should continue to work correctly, although it will be slower 
> than using a hardware interrupt file.

Plus there may end up being subtly different behavior. Imo you want to
let the hardware do what it can do for you.

> Considering that the maximum value of GEILEN is 31 for RV32 and 63 for 
> RV64 (although there is no guarantee that an implementation will support 
> the maximum value), let's assume a GEILEN value of 31 for RV64 as well. 
> In that case, a system with 4 CPUs would cover the maximum number of 
> vCPUs supported by Xen (IIURC, it is 128).

That's a single domain. There can be many domains, totaling to far more
than 128 vCPU-s.

> Therefore, a software 
> interrupt file would not be needed at all, assuming the scheduler 
> distributes vCPUs reasonably well.
> 
> Even if GEILEN is smaller, I expect that the scheduler will migrate 
> vCPUs between pCPUs from time to time. This will free a hardware IMSIC 
> interrupt file slot on the previous pCPU, allowing another vCPU to 
> obtain a hardware IMSIC interrupt file slot.
> 
> For now, I would prefer to keep the current VGEIN allocation strategy as 
> it is definitely easier for implementation at least and consider your 
> suggestion of releasing another vCPU's VGEIN as a potential 
> optimization. I think this optimization should first be evaluated 
> through measurements and experiments.

Well, I'm not going to insist, but I expect this will need re-doing rather
sooner than later then.

>> Yet then I continue to question the presence of this array in the first place.
>> Something similar isn't needed elsewhere (afaik), and its intended use (as
>> said) doesn't become obvious here.
> 
> I can drop it for now and reintroduce it later when it is actually 
> needed. In short, it is intended to be used in hgei_interrupt(), as I 
> described above, in the following way (inside the for-loop):
> 
> ...
> for_each_set_bit(vs_guest_file_id, hgei_mask)
> {
> unsigned int owners_index = vs_guest_file_id /* - 1 */;
> 
> ```
> if ( vgein_->owners[owners_index] )
> {
>      dprintk("kick ->%pv, hgei_mask(%#lx)\n",
>              vgein_->owners[owners_index], hgei_mask);
> 
>      vcpu_kick(vgein_->owners[owners_index]);
> }
> ```
> 
> }
> ...
> 
> Alternatively, I could introduce this in this series, since it will be 
> necessary to set the HGEIE bit in imsic_state_save() anyway to allow the 
> vCPU to be woken up. It also seems like the best option, as it addresses 
> at least some of the comments you raised.

Right, and then preferably in an order where one won't need to peek ahead
in the series to actually understand what's going on.

>>>>> +unsigned int vgein_assign(struct vcpu *v)
>>>>> +{
>>>>> +    unsigned int vgein_id;
>>>>> +    struct vgein_ctrl *vgein = &per_cpu(vgein, v->processor);
>>>>> +    unsigned long *bmp = &vgein->bmp;
>>>>> +    unsigned long flags;
>>>>> +
>>>>> +    if ( !vgein->geilen )
>>>>> +        return 0;
>>>>> +
>>>>> +    spin_lock_irqsave(&vgein->lock, flags);
>>>>
>>>> Because it's unclear where this is to be called from, it's also unclear whether
>>>> a lock is needed here (and if so whether a plain spin lock is appropriate).
>>>
>>> Based on what I wrote in [A] above a lock is defintely needed as it
>>> could be that vgein_release() is called for old pCPU during migration
>>> and at the same time old pCPU could call vgein_assign() so we want to
>>> keep vgein bitmap consistent.
>>
>> Can this really happen? It almost sounds as if you were suspecting
>> context-switch-in could race with context-switch-out. Yet again - none of
>> this can sensibly be discussed without seeing how / where the functions are
>> to be used.
> 
> Maybe I didn't explain it clearly, but during migration (which, 
> according to my understanding of vcpu_move_irqs(), is executed on 
> pCPU1), when vCPU0 is migrated from pCPU0 to pCPU1, its old VGEIN on 
> pCPU0 needs to be released. I don't see any reason why, at the same 
> time, pCPU0 could not try to assign that VGEIN to another vCPU. Without 
> proper protection, this could lead to race conditions.

Doesn't migration of vCPU-s between pCPU-s happen under suitable scheduler
locks?

> Also, setting a bit in the VGEIN bitmap and updating the owner array 
> should be an atomic operation, at least to correctly handle the 
> hgei_interrupt() case mentioned above and vCPU migration, which calls 
> vgein_release(...,old_pcpu,...).
> 
> I agree that it would probably be easier if the migration patches were 
> included in this patch series as well. I can either post those patches 
> to this thread now or include them in the v2 series when it is ready. 
> What do you think?

Including in v2 may be helpful, again to eliminate gaps in the understanding
a reader like me needs to have.

Jan

