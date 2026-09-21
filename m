Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3840C982DE
	for <xen-devel@archiver.kernel.org>; Mon, 21 Sep 2026 08:28:56 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1427149.1649772 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8ZOC-00060O-Pv; Mon, 21 Sep 2026 08:28:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1427149.1649772; Mon, 21 Sep 2026 08:28:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8ZOC-00060H-Lt; Mon, 21 Sep 2026 08:28:40 +0000
Received: by outflank-mailman (input) for mailman id 1427149;
 Mon, 21 Sep 2026 08:28:39 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x8ZOA-00060A-Sy
 for xen-devel@lists.xenproject.org; Mon, 21 Sep 2026 08:28:39 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x8ZOA-00GI9r-5z
 for xen-devel@lists.xenproject.org; Mon, 21 Sep 2026 10:28:38 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ab0eab0-8faa-0a2a0a5109dd-0a2a4502ddae-26
 for <xen-devel@lists.xenproject.org>; Mon, 21 Sep 2026 10:28:38 +0200
Received: from [74.125.225.140] (helo=mail-wm2-f12.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ab0eab0-6ca4-0a2a45020019-4a7de18ce1b4-3
 for <xen-devel@lists.xenproject.org>; Mon, 21 Sep 2026 10:28:33 +0200
Received: by mail-wm2-f12.google.com with SMTP id
 5b1f17b1804b1-49e69b9e16aso27716865e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 21 Sep 2026 01:28:32 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49fcd0eabfcsm219672175e9.3.2026.09.21.01.28.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Sep 2026 01:28:32 -0700 (PDT)
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
        d=suse.com; s=google; t=1789979312; x=1790584112; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0+e5laBwizznHgMWVoPgYtecdciPAQTbOYaLJI6fY4Y=;
        b=IAIPzWtAW9RNSYuuDb9lqaSvnRchlEWta305KWfjf1OFQAD5zbDZVz4fy+zaOLR0RQ
         1UQmOcbvmFE8l+hry/wWKVHd8XUQossf5HqWYu5uZ2ZfXYjTiHU6wTh3ptBmJlodeNbB
         h3xuGTx57pLRSG1MGKJD/A9/x8aN9U+tlSRa+XDUWs3cj1xvHqtwxaMiMiBLyrSw4AwW
         tWRXqvmsKrU+7bnHhhEv8nY067kd/LYCmA7QT7le/LbfSRdHdazx/UtOY08OvBigARtq
         /anFQ5HEpLnTqFy66J9VWdepidxA5upB7KIBoF2y7girf98TB7FO0kzHmGCkmSKhf/Lu
         bpdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789979312; x=1790584112;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0+e5laBwizznHgMWVoPgYtecdciPAQTbOYaLJI6fY4Y=;
        b=jaLRVtu3qexiLNSVj5Y05dJouM2HD5JbUL3LgoRnynBYLqgJda/N6HLS2nK/LFu3q3
         W3Nk+zOlA3suSHl/fCQbMCPNhDqWjFM+bzSznwuOZFbc3MF0J1f4EHMmHi1ozabPz18P
         37H/Lp4wP70/xljf7Ik0jVDSbpxDMzifM8vkndn3krTDoT1YtHIVNPvoDPHpu5mk9w3n
         mGNS/4sk/Jr6CvxqyC3oKnbO6r3qIrFngQkvTSh3sIOHJ2pnzI0ZCMz0HUeqIYoBD4WQ
         2Rh365taRYhzYzCecms7HzEQgsNT8geAJpJMbug0dktBlFVenPDFLaPtbyReH8bX04df
         lhvg==
X-Forwarded-Encrypted: i=1; AKwUvBwjzId65FGtPbhpX9ONd/vm5Hq5IX6G0iMoW3ZS6TJQodtYEjm/eJ8S6+oX88+sAKc4X7wRlDkGiaY=@lists.xenproject.org
X-Gm-Message-State: AFuF++lSfQFL4FCaBgt27u1lzC35AkQ0icyotAFDEY1C00lW+tqkZXkR
	6URBoGuLaYCVvxkKjCCeOl5KyBauu8ayrKQN2RfHeRGZ6CKGquiqGOnCXTxPtsQOWQ==
X-Gm-Gg: AYBFou3e8blxc5690FKK8XA0VGKN/Z91ryXwnGBmg5yNyF9kd/u3q9ag2jPZ2yZaxCs
	NluM+M53d4+8cahBv+5zn+WjE6zpi6WsHFvnKsjZcUp9AH3kzIGhrwOX7CycREiC5cuYqFsS2CI
	XcFpFMiEDl1MEJAUJxydC4PeWH3HcngFMZSPxhkoocZdiWL/OFCG/8WGI96UOVO71GAYZtAnYas
	S37TIJvI2SayliRAYpbZTF4kWm2EZfffb0fhTPTOlCG7/d+GvAtwcqgRXm68fIMGeDqYIJYvJfF
	WefHt2lcVo76qP7Dxbuk0egOaO+FkxP049EP4TL9c/rZAahudBYm6pyiW91D362mMbM/J0NPDHn
	dDl4gV5kAoQj4YAai2Y9wQlqPlOFF7WMTgR6CuN7We4cgmSsFPqUi8ztYa42Q8NSvN8ZJ0Etqhf
	Pq5uPkCI0fJ1P0bhht1F+7H4H0DnVTG3gT250uBhWlEHqBv3JbpY7RTVRC8PewU6O8yyfHJXW1A
	GaqWHJOO5I9Nv3/92PlKYB+D8xcnH5OCB+f8K6gJD0OhcV2c6zo9X3mzhQIKQ==
X-Received: by 2002:a05:600c:a403:b0:49f:d377:ac24 with SMTP id 5b1f17b1804b1-49fd377ac55mr29928225e9.3.1789979312537;
        Mon, 21 Sep 2026 01:28:32 -0700 (PDT)
Message-ID: <815bf929-57be-4b31-b3a9-a3720f5cd88e@suse.com>
Date: Mon, 21 Sep 2026 10:28:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 32/39] xen/riscv: remap interrupts to new IMSIC VS-file
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
 <948e94b6610586b84626c98da033d301335dc7b0.1787838835.git.oleksii.kurochko@gmail.com>
 <2394a616-16be-4657-be17-0a2dafebaeee@suse.com>
 <9929eb6a-d7b8-4a39-b726-82290983e9f3@gmail.com>
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
In-Reply-To: <9929eb6a-d7b8-4a39-b726-82290983e9f3@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-720697/1789979318-666B72AC-C6E18C37/0/0
X-purgate-type: clean
X-purgate-size: 4294

On 21.09.2026 10:03, Oleksii Kurochko wrote:
> On 9/14/26 5:02 PM, Jan Beulich wrote:
>> On 27.08.2026 17:21, Oleksii Kurochko wrote:
>>> @@ -242,6 +254,15 @@ void imsic_irq_disable(unsigned int irq)
>>>       spin_unlock(&imsic_cfg.lock);
>>>   }
>>>   
>>> +static bool imsic_local_is_pending(unsigned int id)
>>> +{
>>> +    unsigned long isel =
>>> +        (id / BITS_PER_LONG) * (BITS_PER_LONG / IMSIC_EIPx_BITS) + IMSIC_EIP0;
>>> +    unsigned long bit = BIT(id % BITS_PER_LONG, UL);
>>
>> Both can be unsigned int, can't they?
> 
> Yes, agreed. Both isel and bit fit within unsigned int. I will update 
> them in the next version.
> 
>>
>>> +    return !!(imsic_csr_read(isel) & bit);
>>> +}
>>
>> No need for !! here.
>>
>> What about endianness, btw? Does the IMSIC always match the CPU (and
>> its setting)?
> 
> No, the IMSIC does not dynamically adapt its register interfaces based 
> on the CPU's runtime endianness configuration (e.g. mstatus.SBE/MBE):
> 
> - CSR Accesses (imsic_csr_read): Indirect CSR accesses (siselect/sireg 
> or miselect/mireg) operate using standard RISC-V CSR instructions at 
> current XLEN width. Values are read and written directly into 
> architectural GPRs without byte-swapping.

I.e. you need you add endianness conversion.

>> Overall, what does "local" in the function name signify? (For a static
>> function, the "imsic" prefix may also be unnecessary.)
> 
> It signifies that local (on which code is executed now) hart's IMSIC 
> CSRs (isel and ireg in the case of imsic_csr_read()) are touched.

That's the expected thing for CSR access, though.

>>> @@ -848,8 +899,22 @@ void imsic_migrate_vcpu(struct vcpu *v)
>>>       if ( v->arch.last_cpu == NR_CPUS )
>>>           return;
>>>   
>>> +    read_lock_irqsave(&imsic_state->vsfile_lock, flags);
>>> +    old_vsfile_id = imsic_state->guest_file_id;
>>> +    old_vsfile_cpu = imsic_state->vsfile_cpu;
>>> +    read_unlock_irqrestore(&imsic_state->vsfile_lock, flags);
>>> +
>>> +    /*
>>> +     * We don't support SW interrupt files at the moment. Bail out before
>>> +     * anything is touched, as the old file has no owning pCPU in that case
>>> +     * and there is nothing to retarget the producers away from.
>>> +     */
>>> +    if ( old_vsfile_cpu == NR_CPUS )
>>> +        panic("IMSIC SW-file isn't supported\n");
>>> +
>>>       /*
>>>        * At this point, all interrupt producers are still using the old IMSIC
>>> +     * VS-file so we first move all interrupt producers to the new IMSIC
>>>        * VS-file.
>>>        */
>>
>> Isn't the new part of the comment premature? Moving doesn't start until ...
>>
>>> @@ -870,5 +935,43 @@ void imsic_migrate_vcpu(struct vcpu *v)
>>>       /* Zero-out new IMSIC VS-file */
>>>       imsic_call_on_cpu(new_vsfile_cpu, imsic_vsfile_local_clear, &vsfile_data);
>>>   
>>> +    /* Update G-stage mapping for the new IMSIC VS-file */
>>> +    if ( imsic_map_guest_file(v, new_vsfile_hgei) )
>>> +    {
>>> +        domain_crash(v->domain, "Migration to hw interrupt file failed\n");
>>> +
>>> +        return;
>>> +    }
>>> +
>>> +    imsic_update_state(v, new_vsfile_hgei);
>>> +
>>> +    /*
>>> +     * TODO: Modify the relevant translation tables at all IOMMUs so that MSIs
>>> +     *       for this virtual interrupt file are now sent to the new physical
>>> +     *       interrupt file.
>>> +     */
>>> +    if ( iommu_enabled )
>>> +        printk_once("IMSIC: IOMMU MSI retargeting is not implemented\n");
>>> +
>>> +    /*
>>> +     * If any interrupts at an APLIC are forwarded by MSIs to the old interrupt
>>> +     * file, reconfigure the APLIC to send them to the new interrupt file.
>>> +     */
>>> +    aplic_reconfigure_target(v, old_vsfile_id, old_vsfile_cpu);
>>
>> ... here, as it looks.
> 
> At some point I agree but the steps before are preparation of moving and 
> is a part of moving process.
> 
> Then probably it make sense to reword the comment to:
> 
>     /*
>       * At this point, all interrupt producers are still using the old IMSIC
>       * VS-file.  Allocate and clear the new one before redirecting anything
>       * to it.
>       */
> 
> Would it be better?

Imo yes.

Jan

