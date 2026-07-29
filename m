Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86509C53200
	for <xen-devel@archiver.kernel.org>; Wed, 29 Jul 2026 14:15:50 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1376024.1622993 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wp54H-0005MC-TX; Wed, 29 Jul 2026 14:15:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1376024.1622993; Wed, 29 Jul 2026 14:15:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wp54H-0005M5-Qq; Wed, 29 Jul 2026 14:15:33 +0000
Received: by outflank-mailman (input) for mailman id 1376024;
 Wed, 29 Jul 2026 14:15:32 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wp54G-0005Lz-5Z
 for xen-devel@lists.xenproject.org; Wed, 29 Jul 2026 14:15:32 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wp54F-000UWr-IH
 for xen-devel@lists.xenproject.org; Wed, 29 Jul 2026 16:15:31 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a6a0afa-2eae-0a2a0a5409dd-0a2a4506e9a4-42
 for <xen-devel@lists.xenproject.org>; Wed, 29 Jul 2026 16:15:31 +0200
Received: from [209.85.221.50] (helo=mail-wr1-f50.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a6a0b03-195a-0a2a45060019-d155dd32b07c-3
 for <xen-devel@lists.xenproject.org>; Wed, 29 Jul 2026 16:15:31 +0200
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-472326ca506so757597f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 29 Jul 2026 07:15:31 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49764d777afsm73762045e9.4.2026.07.29.07.15.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Jul 2026 07:15:30 -0700 (PDT)
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
        d=suse.com; s=google; t=1785334531; x=1785939331; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G4akCB60+mc/HX+mpRkxfzDdfAqBp/K6o/9JPBYHwu0=;
        b=W7R5qcir73EsBJZeUT3AiLJp3/i6xeNYoBrSFx6kWweyYh7vuSGZ2wJvqVxmKzTz5k
         U4rxV+xQzheRVJXacW0zYarLQi61KgFlbvCewReD6kyFA5pPeuVXX+5voUlr2rwPwcsR
         2JjnYC6c/zuFut2os+h7sKbWqXCPy1AlbhHLptRNOaMfamVeuS7FBozgVxpyQs3eEn3e
         Y+W89jfBm3aA9GMegvdquwyrcyg9gf4fnR5PK02dkbHjCDzXzhwQi3SMVYueIHTkkjkn
         8NOpZq5CvxEJJRWkosqbgsyxwJdWHzHat3wLSr16CUvFpQwxU8UcQh41EtIvuEjvpwUX
         B92g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785334531; x=1785939331;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G4akCB60+mc/HX+mpRkxfzDdfAqBp/K6o/9JPBYHwu0=;
        b=UtZvOWWbqj8qt0K2yhHr3k/C7ia78TfQsfFW0tmyJrn14HpyirWYHuEszWswoLjVyf
         6KZEF7sPinVRwj9cA7xNw5hsbTKU5Ej09psRPvHTKF64jbcJcXKKKIp71zediii1qLS2
         IFVuy53WAV1eRsasz9xcbbnZVkHrI5QYq+7wkg1PTteySeur5K4PYE9iZq2/hd/QaDeq
         OSL2VDZEiE79ArUXVkgzWPgr7vPyzupf033u8tiAmPbt9egORfnJF1YYwO6qHE/Rmb0q
         HM/Yaljn23w/LlctC0c100IJeq061LDRhvOOSqNV56TN0P9rm6MHfNwJ7CpGCuUCiNTw
         fcFQ==
X-Forwarded-Encrypted: i=1; AHgh+RpW+1mW1zIBhCNiSg2kSvzB+CHlwy2W+MBtDo0epiEjmkR/kpK64btOZUiM3R/u1vTIAv+4xUoN3U4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwARXNKu4p/mdoODE8y2PC9EB5Z+CKBhzq+Fq6nOBXIp8rJBmoa
	Mz+9l9fdtFASk67OTkjpC2KL8g5Yl4Rs5hbaQTWomsowvr0K3nMcd+KGVe7TpLCotg==
X-Gm-Gg: AR+sD123HDxsuRNy9KyPucG5mMSvQ5H/hZSRifpZymKJyzCFiEPfwu2MF2M4XWl1gQG
	8KilZzUp91tHSGqoS6uPoryQx9wA+lo52TXwTB3mjKXMunJv1g6FuXNdcDEek2dFxuNyImS7oC8
	8ODWTKjkTw0N1FqpQoO1Y4EhPZQVqSJESQqJ13rluhVNSWlQbNgZOQiml8pHGX4mV2eNsJcJeAN
	DIODtBfFy7UMB74xOdmWrPksBTWU0dykTILs7uIpVg+kQ4tWG+Quggt7eWw7kTYVTtdAwIwavL8
	7VeapJ/Dpfv3LI3egvSNaRRxVFrjN5tU8M63kkqP78ZNnCIsi6aR9EwnzLdYo5ONf5PxUosGdAO
	Zy1jA346URROT809wpp5JU4UeUYhIaOrdaXbI8/cbNa9TbwD/ID5jyMH3XwPYcIVzroqpIrXJO6
	vhX7EsGrkm3CWyiadE3oYDJLCPu7tVmtG+/xc3Ag8nUYEtapjCXVnT/h5fbAq8witQcMjKyyTNA
	ZM291eKcaYFMM6UAHdsBZ0qWF14Jrj2C0HC0+UbMX6x98Q99Guy
X-Received: by 2002:a05:600c:3b10:b0:492:45a0:dcef with SMTP id 5b1f17b1804b1-496c6410257mr71202785e9.5.1785334530907;
        Wed, 29 Jul 2026 07:15:30 -0700 (PDT)
Message-ID: <534eef4c-7f5d-4565-97b8-e0cc3b3290c2@suse.com>
Date: Wed, 29 Jul 2026 16:15:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 18/23] xen/riscv: implement IRQ routing for device
 passthrough
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
References: <cover.1784559209.git.oleksii.kurochko@gmail.com>
 <c489a420b1c01c5312773c2e2b51f63d3babf855.1784559209.git.oleksii.kurochko@gmail.com>
 <c64fc958-73bb-44ed-a3b2-dc368ce675ac@suse.com>
 <6cebc63c-2f21-4ef8-ab10-e2ec62f887b7@gmail.com>
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
In-Reply-To: <6cebc63c-2f21-4ef8-ab10-e2ec62f887b7@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-16d1c6/1785334531-F607177B-3ED072EC/0/0
X-purgate-type: clean
X-purgate-size: 1325

On 29.07.2026 13:59, Oleksii Kurochko wrote:
> On 7/23/26 3:30 PM, Jan Beulich wrote:
>> On 20.07.2026 17:59, Oleksii Kurochko wrote:
>>> +/* Route an IRQ to a specific guest */
>>> +int route_irq_to_guest(struct domain *d, unsigned int virq,
>>> +                       unsigned int irq, const char *devname)
>>> +{
>>> +    struct irqaction *action;
>>> +    struct irq_guest *info;
>>> +    struct irq_desc *desc;
>>> +    unsigned long flags;
>>> +    int retval = 0;
>>> +
>>> +    if ( d->is_dying )
>>> +        return -EINVAL;
>>> +
>>> +    desc = irq_to_desc(irq);
>>> +
>>> +    /*
>>> +     * release_irq() frees this action via xvfree(), relying on action
>>> +     * being the first member of struct irq_guest so that &info->action
>>> +     * coincides with info itself. Guard the layout so a future field
>>> +     * reorder can't silently turn that into a free() of a mid-allocation
>>> +     * pointer.
>>> +     */
>>> +    BUILD_BUG_ON(offsetof(struct irq_guest, action) != 0);
>>
>> Can't release_irq() simply use container_of()? One way or another it feels
>> like you're painting yourself into a particular corner ...
> 
> If it isn't the best option then it is needed to follow they way we had 
> before:

I don't understand why you think you need to go back.

Jan

