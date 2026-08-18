Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A041C5DF80
	for <xen-devel@archiver.kernel.org>; Tue, 18 Aug 2026 08:31:45 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1393663.1632477 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwFEK-00048X-Eq; Tue, 18 Aug 2026 08:31:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1393663.1632477; Tue, 18 Aug 2026 08:31:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwFEK-00048Q-BV; Tue, 18 Aug 2026 08:31:32 +0000
Received: by outflank-mailman (input) for mailman id 1393663;
 Tue, 18 Aug 2026 08:31:30 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wwFEI-00048K-Mn
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2026 08:31:30 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wwFEH-00CYTu-Fy
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2026 10:31:29 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a84185c-bab6-0a2a0a5309dd-0a2a4502bca2-22
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 10:31:29 +0200
Received: from [209.85.128.50] (helo=mail-wm1-f50.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a841861-6ca4-0a2a45020019-d1558032b4c4-3
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 10:31:29 +0200
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-4998590d392so45385325e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 01:31:29 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49987b2a176sm334873155e9.4.2026.08.18.01.31.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Aug 2026 01:31:28 -0700 (PDT)
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
        d=suse.com; s=google; t=1787041889; x=1787646689; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lypWdWKsZ7gIDc20Ywb8XyrvrgmPbThj1oc6KcVY1Zc=;
        b=KTbw/RLTNZj3SXHOz3si/4nJcbfB4IXApBX0zZ0ensddiaD/EctahqrL4YQ3YUk0GE
         Fbl2/GGxZ+yPqI8pBhba8YDAMpYIQP+Kob9CG9C6pdWonFSPAsXPp+svdZT+wf0Q7WqJ
         OhNW6fTfZqW5J9i8e9dvwPZ835oNpgJ3tP46nGp7jfl5junpF9EAuIctN6BDg/f6JPhg
         Q8WBlgtI079OdfjiqMsN4FkTsEPtb1FB2K31aFPaXniF5uRBWphyvg8QQ58CHuHHkP5q
         bjNFu6CEjRCL11wyySA4+647v16eaSlSlLSZD4jgZQYRKH5AwIsU0PI1zm8qtHauIeDp
         P9ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787041889; x=1787646689;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lypWdWKsZ7gIDc20Ywb8XyrvrgmPbThj1oc6KcVY1Zc=;
        b=EWpDL4be5SeW/5nD/rHFZekvpYF38IlsA/x95FIsaDh3bZCXykeabCod7c7q/9mSe8
         8vi1UmsaqyHT3kvyOOjFHt96iRM7hISt6Rx2aXykU1JNSG22StykQWQaE/sjce/nQG2O
         NEsUPApCV6e7oVmovwGp9tWcb4E7CITEETr0x0DUbqOwxUBi4DJdT3C075W/wM+jH85L
         lAV/883ko5IFCaD2kh+1GNyn0OfrSG6ycPhptyVahgQFNoX5eP4UfnUKE+JR4AW5iD6Y
         DHmZVFDHighjRJZFjNwoOOdPmE+V3ZcUEDsvgEIuk026ynG0aqTlwCJ3Hg/E1HpX+WaZ
         Pvww==
X-Gm-Message-State: AOJu0Yw2xEHGra8TvaDB3QBR/fRA1ApOS0NvaLOOeQE7KZAk7a1Xiaei
	KWzF3V2wTts22fMyJQE0bhZuzyl9YwUu44AmbzAiMr6NXJp9b7SzsbgkNY6oHnXNbQ==
X-Gm-Gg: AR+sD12VgBMZU46ip164PpABgC0ZMhlOzUJQivzhbmDTucBGlPkRUyBjdmMd4lZIKJ2
	Ty4Ahfjl7nqgugN8ED+QP8usi7OZO6rZvFR6nq+p8BKzbfq97p8gKMJuQC4noGVu62TcJ/rFAIC
	l1lGkHHIwPpeMk8Fd02e5Sbk2wmzA9J6Y4YqFnLg/5nuxeuzIX1CjQcpidFZoxh/hBHYFjT9zIE
	2u/iCKz8jBMeKQF0ENbOemVZ+gaxvmgSDZsIAn24wE+yDprqj0LEDnTCAQFk9yVr4CEFKEqs6XY
	8NgTanrVGFcUnWOi2R/WqV8Md3BcUp3959FMfU5AMd5mZNtUD4YMngU0/NMXD3URx74CirpvP7U
	HPOao/zQknc+T/C++iprw4OuFTrsQC/SHSZ/9y0u7Sms0RgB+Fup0PlFM/eGn8SP1ewXKUPmRaL
	XgVo6FLwSbl++MaH00HoEPpqhZfOwptqznRVGpSvYz4G7BNo31caN15kXkUJCL8D4elwF1HHhav
	EUQLN5tlmU5zm2yFk+9HBWhZaRxVedsQeYwtlA7FAsx0gehz4Fr
X-Received: by 2002:a05:600c:8a1b:10b0:499:a685:c10 with SMTP id 5b1f17b1804b1-499a68512ccmr8915605e9.4.1787041888896;
        Tue, 18 Aug 2026 01:31:28 -0700 (PDT)
Message-ID: <ed89d5c2-43b6-45d2-a426-0affe3bfd1bd@suse.com>
Date: Tue, 18 Aug 2026 10:31:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 10/17] xen/riscv: introduce
 vintc_state_{save,restore}()
To: Baptiste Le Duc <baptiste.le-duc@vates.tech>
Cc: xen-devel@lists.xenproject.org,
 Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <cover.1784560663.git.oleksii.kurochko@gmail.com>
 <e71f53f1165619fabb9f79f34cc931cd4296af67.1784560663.git.oleksii.kurochko@gmail.com>
 <1786614174.8631fc262581453bbf619ec5b2062170.19ffa80d28a000c4f3@vates.tech>
 <cae4c5ef-cc4a-47a0-90fa-2f84c00ba4a6@gmail.com>
 <1787041722.8631fc262581453bbf619ec5b2062170.1a013fcb15a000c4f3@vates.tech>
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
In-Reply-To: <1787041722.8631fc262581453bbf619ec5b2062170.1a013fcb15a000c4f3@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-720697/1787041889-668B42AC-E70C8A2A/0/0
X-purgate-type: clean
X-purgate-size: 1877

On 18.08.2026 10:28, Baptiste Le Duc wrote:
> On 2026-08-17 10:31 +0200, Oleksii Kurochko wrote:
>>
>>
>> On 8/13/26 11:42 AM, Baptiste Le Duc wrote:
>>>>   #endif /* ASM__RISCV__INTERRUPT_CONTOLLER_H */
>>>> diff --git a/xen/arch/riscv/intc.c b/xen/arch/riscv/intc.c
>>>> index 372c8d3a20..879d513374 100644
>>>> --- a/xen/arch/riscv/intc.c
>>>> +++ b/xen/arch/riscv/intc.c
>>>> @@ -163,3 +163,17 @@ bool vintc_reserve_virq(const struct domain *d, unsigned int virq)
>>>>   
>>>>       return !test_and_set_bit(virq, d->arch.vintc->used_irqs);
>>>>   }
>>>> +
>>>> +void vintc_state_save(struct vcpu *vcpu)
>>>> +{
>>>> +    const struct vintc_ops *ops = vcpu->domain->arch.vintc->ops;
>>> Is there a situation where ops could be NULL? If yes, add a check.
>>
>> It is unlikely that there is nothing to do during a context switch for 
>> vINTC, so vINTC should provide an implementation for saving and 
>> restoring its context. This also ensures that a NULL pointer dereference 
>> will lead to a trap, allowing us to catch cases where a 
>> context-switch/restore handler is missing.
>>
>> Even if it turns out that vINTC does not need to perform any actions 
>> during a context switch, it is perfectly fine to provide an empty 
>> implementation. However, as mentioned above, this is unlikely. 
>> Therefore, having a NULL pointer dereference here is intentional: it 
>> helps catch cases where someone adds a new interrupt controller driver 
>> but forgets to implement the corresponding context switch functionality.
> 
> Thanks for these explanations. However, wouldn't it be better to have a
> dedicated BUG_ON in case of NULL dereference to indicate clean call
> trace to people who missed to implement context-switch functionality?

How would BUG_ON() provide any better (or worse) call trace, compared to
a NULL deref?

Jan

