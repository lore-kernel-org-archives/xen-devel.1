Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACA4CC88E50
	for <xen-devel@archiver.kernel.org>; Mon, 14 Sep 2026 11:37:54 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1420821.1647039 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x64zv-00088f-UM; Mon, 14 Sep 2026 11:37:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1420821.1647039; Mon, 14 Sep 2026 11:37:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x64zv-00088Y-RU; Mon, 14 Sep 2026 11:37:19 +0000
Received: by outflank-mailman (input) for mailman id 1420821;
 Mon, 14 Sep 2026 11:37:17 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x64zt-00088S-NR
 for xen-devel@lists.xenproject.org; Mon, 14 Sep 2026 11:37:17 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x64zt-00FYc8-3s
 for xen-devel@lists.xenproject.org; Mon, 14 Sep 2026 13:37:17 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aa7dc6b-e002-0a2a0a5209dd-0a2a450a9e0e-6
 for <xen-devel@lists.xenproject.org>; Mon, 14 Sep 2026 13:37:16 +0200
Received: from [74.125.225.141] (helo=mail-wm2-f13.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aa7dc6c-f2d2-0a2a450a0019-4a7de18da069-3
 for <xen-devel@lists.xenproject.org>; Mon, 14 Sep 2026 13:37:16 +0200
Received: by mail-wm2-f13.google.com with SMTP id
 5b1f17b1804b1-49e7acdc816so1832305e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 14 Sep 2026 04:37:16 -0700 (PDT)
Received: from [172.18.123.208] ([185.104.138.131])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49e7548d99bsm145609395e9.1.2026.09.14.04.36.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Sep 2026 04:37:15 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1789385836; x=1789990636; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NzjcLEEHu0Z2onF46QZZ6heVSjqtGQIl7AQjZEemKSU=;
        b=IJwegXYwzDHN4BdpZMsCDDhtHpbjitqr/Dil/chBknPgRLSr+6tUa4eKGBqWwmu98k
         JoMt7JGAGmAFiTankQxTqUMI9Fhyd4JOnc/A4spNPjqkXADwFc9i9orP9Ij040GSQlDb
         gpMPw0BlBRO6+q1vCe02/otnC72G1an4R5b3hZYb8Pp1ZxHWHGM9Iged/q6UF0HSfD2a
         VYV42kw/wdHD2yxal9JLuq3pt9NHcDxZjxnUMhP0Jm50nDot255BpRFinuiVLrSNAaeD
         2qXCnAYsnASLglXWToQ2PHC7WYCueCkGBWTa2wyPp7zCgpnmb3xx0Syd39s+rz2cwQjY
         EKOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789385836; x=1789990636;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NzjcLEEHu0Z2onF46QZZ6heVSjqtGQIl7AQjZEemKSU=;
        b=EMnn9Y5iO+TFBCOVar+VhZzhqbNv5q0QHr/mlWBanjd4SQnocPi0ltZJwidxu1FNcu
         Ul+nTV16eUyojIcHzCT4l5Pu4+OOqAkvyGf2hySMWThCc/pP+acN9FAaPubQAku6Ajf3
         KLBBgWMJvpnaGX31OwR/szvJl0moSi2ts/3lSCb4+P7w9UaZrSXWtBRnWPTCbchOsHUK
         ny23qWj4vk+jg7LXR+2kMZD6vtM0a1odttDGe6uZQ6eh97msobNV6AUG7wByIeWb+9ii
         taeym7iWkGGt0y4biJCWEFBbLHW0O2ctC3wupMb4xI+scDL7nkt9V+TULDS+/oKYk1eW
         ZjWA==
X-Forwarded-Encrypted: i=1; AKwUvBycKhljzxZKW7Qx6cXzacZecmQyKw/RQHfYQmBPqVoHof3tWaeGj4RnH2IoGJvhx+hl33HxVH0DxDA=@lists.xenproject.org
X-Gm-Message-State: AFuF++ngoCMWc0hPsItNlizhmhvMl6Cgpku1bDfJCmpiKO8Z9gEH/7rF
	i0XHNFhzueocVIBj+OrGMPIKD99rZvTE5INl1nJXtmA2R7hi6EEBHU/k6lJatIBiVw==
X-Gm-Gg: AYBFou0VpKRjqLMphNWxeWQir3SLLsHbhC8IiLRBQL2M1gj2X6Jh2s4+8P29nWk9uQE
	2iNWbFPLU+3GH3M6fKXhzuwx2kWAld5wa0fuIFnpkJMi4UD4kcJGSel7hW7J/tFO9stiwrgQvNg
	SglIT3fYHyykgGeDsOotMgJnd50QYpFrGHfuvBYORKc0tiebfNnY96V1MpXV9m0SZYHJYlImp8e
	KwjMpl5XD13ZbTXT2W+PniimGyn9c7Cuaz3azBhTn4IkTYpWyBejoVxPW6z+/awf+VGwxjPfF8T
	4gY3LAYzra69MP3MC71nnhyCT2s8bPMbQldAjYOJsJEZGXzApYmU5S3vH363byk9Wz0qYUSM9Qe
	n6dIi4pz/vOzWXjK75N7wcuJFSOm8t3y94aWHHGItvVBmbh0F9syPDry0URSdjlVz1qqvSRaPxB
	iLDuLA73Sp9fEwPUwwFR65OTZq09oAzTaPOLwQOfE8GFCJXNV9KKUh/FgIBYyqm1itoZUFv6uXO
	mh0851KAl6c
X-Received: by 2002:a05:600c:8705:b0:49c:f13e:e4d with SMTP id 5b1f17b1804b1-49e7a678639mr24802965e9.10.1789385835828;
        Mon, 14 Sep 2026 04:37:15 -0700 (PDT)
Message-ID: <3e05825b-9762-4fba-a064-821bd3d7f8d6@suse.com>
Date: Mon, 14 Sep 2026 13:36:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 16/20] xen/riscv: implement IRQ routing for device
 passthrough
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 Zheng Zhang <zhangzheng@iscas.ac.cn>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
References: <cover.1788876411.git.oleksii.kurochko@gmail.com>
 <afef58245a58f4084e38ea1d9880282a8e8beeef.1788876411.git.oleksii.kurochko@gmail.com>
 <e1d611bc-115d-4050-89c9-9781e9900ea1@suse.com>
 <d8f7e714-4c62-41a3-9a1b-aed30f4f586e@gmail.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <d8f7e714-4c62-41a3-9a1b-aed30f4f586e@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-4011c0/1789385836-4BCD3CFC-F442B5EF/0/0
X-purgate-type: clean
X-purgate-size: 3044

On 14.09.2026 12:54, Oleksii Kurochko wrote:
> On 9/10/26 2:53 PM, Jan Beulich wrote:
>> On 09.09.2026 17:07, Oleksii Kurochko wrote:
>>> --- a/xen/arch/arm/irq.c
>>> +++ b/xen/arch/arm/irq.c
>>> @@ -205,7 +205,7 @@ void __init init_IRQ(void)
>>>   static inline struct irq_guest *irq_get_guest_info(struct irq_desc *desc)
>>>   {
>>>       ASSERT(spin_is_locked(&desc->lock));
>>> -    ASSERT(test_bit(_IRQ_GUEST, &desc->status));
>>> +    ASSERT(desc->status & IRQ_GUEST);
>>>       ASSERT(desc->action != NULL);
>>>   
>>>       return desc->action->dev_id;
>>
>> Why did an Arm change slip into a RISC-V patch?
> 
> Considering that this code is executed under the spinlock it is fine to 
> not use test_bit() so it is part of dropping of bitops functions.

Perhaps, but then in a separate patch and changing all places consistently
(I didn't go check, but I'm pretty sure there are more).

>>> --- a/xen/arch/riscv/aplic.c
>>> +++ b/xen/arch/riscv/aplic.c
>>> @@ -325,9 +325,40 @@ static const hw_irq_controller aplic_xen_irq_type = {
>>>       .set_affinity = aplic_set_irq_affinity,
>>>   };
>>>   
>>> +static unsigned int cf_check aplic_guest_irq_startup(struct irq_desc *desc)
>>> +{
>>> +    BUG_ON("unimplemented");
>>> +}
>>> +
>>> +/*
>>> + * Shared by ->shutdown(), ->enable(), ->disable() and ->end(), which have
>>> + * no state.
>>> + */
>>> +static void cf_check aplic_guest_irq_stub(struct irq_desc *desc)
>>> +{
>>> +    BUG_ON("unimplemented");
>>> +}
>>> +
>>> +static void cf_check aplic_guest_set_irq_affinity(struct irq_desc *desc,
>>> +                                                  const cpumask_t *mask)
>>> +{
>>> +    BUG_ON("unimplemented");
>>> +}
>>> +
>>> +static const hw_irq_controller aplic_guest = {
>>> +    .typename     = "aplic",
>>
>> This is indistinguishable from aplic_xen_irq_type. Naming of both variables
>> also isn't consistent
> 
> I will align names properly:
> 
> --- a/xen/arch/riscv/aplic.c
> +++ b/xen/arch/riscv/aplic.c
> @@ -316,8 +316,8 @@ static void cf_check aplic_set_irq_type(struct 
> irq_desc *desc,
>       spin_unlock(&aplic.lock);
>   }
> 
> -static const hw_irq_controller aplic_xen_irq_type = {
> -    .typename     = "aplic",
> +static const hw_irq_controller aplic_host_irq_type = {
> +    .typename     = "aplic-host",
>       .startup      = aplic_irq_startup,
>       .shutdown     = aplic_irq_disable,
>       .enable       = aplic_irq_enable,

I'm not convinced this one is needed.

> @@ -345,8 +345,8 @@ static void cf_check 
> aplic_guest_set_irq_affinity(struct irq_desc *desc,
>       BUG_ON("unimplemented");
>   }
> 
> -static const hw_irq_controller aplic_guest = {
> -    .typename     = "aplic",
> +static const hw_irq_controller aplic_guest_irq_type = {
> +    .typename     = "aplic-guest",
>       .startup      = aplic_guest_irq_startup,
>       .shutdown     = aplic_guest_irq_stub,
>       .enable       = aplic_guest_irq_stub,

This one certainly is.

Jan

