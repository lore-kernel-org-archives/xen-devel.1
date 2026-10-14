Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0C7ACC6B1D
	for <xen-devel@archiver.kernel.org>; Wed, 14 Oct 2026 09:54:36 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1448654.1664689 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGvgp-0002kd-39; Wed, 14 Oct 2026 09:54:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1448654.1664689; Wed, 14 Oct 2026 09:54:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGvgp-0002kW-0D; Wed, 14 Oct 2026 09:54:27 +0000
Received: by outflank-mailman (input) for mailman id 1448654;
 Wed, 14 Oct 2026 09:54:25 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xGvgn-0002kP-PK
 for xen-devel@lists.xenproject.org; Wed, 14 Oct 2026 09:54:25 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xGvgn-003Jde-66
 for xen-devel@lists.xenproject.org; Wed, 14 Oct 2026 11:54:25 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6acf513a-2eae-0a2a0a5409dd-0a2a4502cf2a-34
 for <xen-devel@lists.xenproject.org>; Wed, 14 Oct 2026 11:54:25 +0200
Received: from [209.85.128.44] (helo=mail-wm1-f44.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6acf5151-6ca4-0a2a45020019-d155802cdc3a-3
 for <xen-devel@lists.xenproject.org>; Wed, 14 Oct 2026 11:54:25 +0200
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-4a16aaf2067so9692605e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 14 Oct 2026 02:54:25 -0700 (PDT)
Received: from [172.20.10.5] (public-gprs376522.centertel.pl. [37.47.102.11])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a1b4819302sm35053245e9.3.2026.10.14.02.54.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Oct 2026 02:54:24 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1791971664; x=1792576464; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OzK/nVaKZPju4MTg1Y762hYvdX/ZiI9PRkm+3bvsvPk=;
        b=kG/8iCm2rekOTgu47Vz5gqo2BX85PWRDSxga+u1RSw4sXEQBDqwRJrzg7F+GSOe4RH
         vGSNzsTCFUmsTQgKCBa5f0GQ899mnJGdjGbI1OPPMRHyq0/W4GwPMlu5TkNgV5/6hhg/
         KDoV+8MUwUWIoBaHmEMUFjcM0IjJ9iiqMy53+ovrToK6aUiZeP/sMeoCu2aXvvIPC6j3
         tnKqDjpPJ724q5ZELKJmVcQpyWEy0/mK2db+/e1601O+VqWFjmHBb3ofoTpucwODTycJ
         ff+tq4iAB7YRnVJm928i1Z+rsREJRmTuuouq3znUg2giBspiQ6yNMUD1zO3Wf+91Sjuv
         ga4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791971664; x=1792576464;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OzK/nVaKZPju4MTg1Y762hYvdX/ZiI9PRkm+3bvsvPk=;
        b=EaTfgnVG7dTsJNIIwZHno4ONYeKEvBFl53baL/cpKb2JnzyASx2N+tz0CH+Y+j59Lt
         /1JiARCAM/ZdwiqerUxNNAtN2sDrkWOK0r2H8Y33xOV8UFBcjPti30klNHifVK/dA2M7
         vgOM+I+y+oo+Dv7lwJWReTG6WvUsUDxbDD/jDwYPwen9K1s6VRZxXcdoqErpwr5oPbH7
         1AmDfCboEpF0dOiJQF4720OcH8NBByI413oC8YxVK1uOk0/5UZ0t+Zvtz/y/kF5NV8JB
         Jmxc+23A0cBYfjfZINIIhcYjVROc3joPP0WqL4AfKXAv2k9yZd8bX1DNxxXmjtczOzm4
         +hpQ==
X-Forwarded-Encrypted: i=1; AKwUvBzYZULbFXhaMrEgKCuy1O0DCBzDHAwY5WVYpvd5jd0Juiu2abDy3YA5iKBgXvj2/vft9rBNU6iHHwM=@lists.xenproject.org
X-Gm-Message-State: AFq9FYKpTaVdSkLPAg50DtaDTlySsyyx50hPNtClRj3VxN0HUVyIjGee
	CSnFIzc2XUcuakg3i8nVGXJpUsFi+ZeNPTVTcyFVek7tK3h1fcKyS2Ou
X-Gm-Gg: AYBFou0pXVvdxbNEV8w+f5hdV1H860b/Qwi8NYT0eip7xHgadL0jeLSrWkvdc9vF0cP
	QbQf30+ymmDTAlJrCjhLcw4NakufxTGGH1ThaYDjyqezqR5w1wC/N1BtUl6KiTjscFwR1uv5YEN
	yBrBKbbacFu/K5bpvGNme6LRODGAo+E5COisnCfu7e1h7xA009VBnVjYw06+LmWPvHXzNNx4h9M
	4sbXvnY2Uv3pw5wPMx13N+oOPSZ3GZHB2wpBYUwMbwsv8I40AReqOZhFV0ceB8vI8KL+4hXGpGt
	cbiFI0wcXDV7iMGypdXnQheZ6apfscv4Xaiv15BCB2rzrAnhC3bIK5ptUVl9Y0RJCv1hvFhVibl
	pavFzKi61XtM+xQZRSaFMtD2vtKXTPB7Ae0eeB3PB7Xlx9GMTvZ9+nOcgFnINHyisXpwk3Mow1X
	7L/zWxJf8TDDH3XL2Njo5kqAZdgti7fefJy/nKjwvwRE2i55rVz1dHDBPxEhfJ8oodhk87BOTUB
	fnDR6dapgasE+kPmYWreGGSjdWY6EysaKwd5dqLPyKIANLCPX0=
X-Received: by 2002:a05:600c:3111:b0:4a0:159b:d2a2 with SMTP id 5b1f17b1804b1-4a18e4e14e8mr287529445e9.29.1791971664538;
        Wed, 14 Oct 2026 02:54:24 -0700 (PDT)
Message-ID: <3b1335dc-01ab-4bac-917e-e6b198e7f4d0@gmail.com>
Date: Wed, 14 Oct 2026 11:54:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/4] xen/riscv: probe the PTE A/D bits update scheme at
 boot
To: Jan Beulich <jbeulich@suse.com>,
 Baptiste Le Duc <baptiste.le-duc@vates.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>, Zheng Zhang <zhangzheng@iscas.ac.cn>,
 xen-devel@lists.xenproject.org
References: <1791885904.8631fc262581453bbf619ec5b2062170.1a134b909b40008425@vates.tech>
 <1791886038.8631fc262581453bbf619ec5b2062170.1a134bb169d0008425@vates.tech>
 <21a48f53-385b-4f36-958c-cc82bf390c89@suse.com>
 <1791901979.8631fc262581453bbf619ec5b2062170.1a135ae53690008425@vates.tech>
 <7ed5d117-80d5-4862-af60-c3e0143564ea@suse.com>
 <1791968412.8631fc262581453bbf619ec5b2062170.1a139a403a30008425@vates.tech>
 <db0d448a-ff1f-4549-84f1-c53e3e4a711e@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <db0d448a-ff1f-4549-84f1-c53e3e4a711e@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-720697/1791971665-F3EBB2AC-2A5C0300/10/73395122804
X-purgate-type: spam
X-purgate-size: 4136



On 10/14/26 11:09 AM, Jan Beulich wrote:
> On 14.10.2026 11:00, Baptiste Le Duc wrote:
>>>>>> +        "2:\n"
>>>>>> +        ASM_EXTABLE(1b, 2b)
>>>>>> +        : [tmp] "=&r" (tmp), [updated] "+r" (updated)
>>>>>> +        : [va] "r" (va)
>>>>>> +        : "memory" );
>>>>>> +
>>>>>> +    arch_pmap_unmap(slot);
>>>>>> +    free_domheap_page(pg);
>>>>>> +
>>>>>> +    return updated;
>>>>>> +}
>>>>>
>>>>> Imo you'd better check that A also was actually set in the PTE.
>>>>
>>>> If I check that A was set, can I drop the "updated" variable? The A bit
>>>> would tell us more than whether the load succeeded.
>>>
>>> Hmm, I'm inclined to suggest to check both.
>> Then I'd rather probe D than A, since D, unlike A, cannot be set
>> speculatively (spec: "updates to the D bit, resulting from an explicit store,
>> must be exact (i.e., non-speculative)"). The result would
>> then be:
>>
>>        return updated && d_set;
>>
>> with a warning (or panic()?) on updated && !d_set, which the spec
>> doesn't allow (spec: "the access must not be performed before the PTE update is
>> globally visible").
>>
>> Furthermore, if I understood your earlier suggestion correctly, you'd
>> like the A/D bits to be preset in p2m_set_pte_flags() unless Svadu is
>> in use:
>>
>>      if ( !riscv_isa_extension_available(NULL, RISCV_ISA_EXT_svadu) )
>>          e->pte |= PTE_ACCESSED | PTE_DIRTY;
>>
>> However, when both Svade and Svadu are advertised, Svade is in effect
>> until Svadu is enabled via FWFT (perfectly legit), so this condition
>> would skip the preset and the first access would fault.
> 
> In which case it would need to be
> 
>      if ( riscv_isa_extension_available(NULL, RISCV_ISA_EXT_svade) ||
>           !riscv_isa_extension_available(NULL, RISCV_ISA_EXT_svadu) )
>          e->pte |= PTE_ACCESSED | PTE_DIRTY;
> 
> albeit I have to admit that permitting two contradicting extensions to
> be exposed at the same time is irritating.
> 
>> I see two ways to address this:
>>
>> 1) Keep checking Svade:
>>
>>      if ( riscv_isa_extension_available(NULL, RISCV_ISA_EXT_svade) )
>>          e->pte |= PTE_ACCESSED | PTE_DIRTY;
>>
>>      After resolve_ad_scheme(), the Svade bit is set in every case where
>>      software has to preset the A/D bits. The only imprecise case is both
>>      extensions advertised with hardware updating already enabled by
>>      firmware, where presetting A/D is unnecessary but harmless.
>>
>> 2) Record the probe result in a global, e.g.
>>
>>      static bool __ro_after_init hw_ad_update;
>>
>>      and use:
>>
>>      if ( !hw_ad_update )
>>          e->pte |= PTE_ACCESSED | PTE_DIRTY;
>>
>>      This is exact in all cases, at the cost of a new global that mostly
>>      duplicates what resolve_ad_scheme() already records in the ISA bitmap.
>>
>> I discussed with Oleksii and we are fine with either. What do you prefer?
> 
> As to 1), see above. For 2), while maybe okay, I think we're better off
> not deriving too much from probing. Whatever can be (reliably) derived from
> what the platform description says should be preferred imo.

Option 1 looks okay to me.

Also, it seems then we could simplify resolve_ad_scheme() to:

/*
  * p2m_set_pte_flags() presets the A/D bits unless only Svadu is 
advertised,
  * as per the DT binding that is the only case in which hardware 
updating is
  * guaranteed to be enabled (by firmware, via menvcfg.ADUE). Check that it
  * really is, and fall back to presetting A/D otherwise: a hart which 
faults
  * on clear A/D bits implements Svade, whether or not it says so.
  */
static void __init resolve_ad_scheme(void)
{
     if ( !riscv_isa_extension_available(NULL, RISCV_ISA_EXT_svadu) ||
          riscv_isa_extension_available(NULL, RISCV_ISA_EXT_svade) )
         return;

     if ( !probe_hw_ad_update() )
     {
         printk(XENLOG_WARNING
                "Svadu is advertised but A/D bits aren't updated by 
hardware, presetting them\n");
         __set_bit(RISCV_ISA_EXT_svade, riscv_isa);
     }
}

~ Oleksii


