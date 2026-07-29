Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB669C54F51
	for <xen-devel@archiver.kernel.org>; Wed, 29 Jul 2026 10:42:04 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1375468.1622619 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wp1jM-0006Ab-Ih; Wed, 29 Jul 2026 10:41:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1375468.1622619; Wed, 29 Jul 2026 10:41:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wp1jM-0006AU-FW; Wed, 29 Jul 2026 10:41:44 +0000
Received: by outflank-mailman (input) for mailman id 1375468;
 Wed, 29 Jul 2026 10:41:43 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wp1jL-0006AO-H0
 for xen-devel@lists.xenproject.org; Wed, 29 Jul 2026 10:41:43 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wp1jK-00E0HS-U6
 for xen-devel@lists.xenproject.org; Wed, 29 Jul 2026 12:41:42 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a69d8e2-bab6-0a2a0a5309dd-0a2a450384ae-12
 for <xen-devel@lists.xenproject.org>; Wed, 29 Jul 2026 12:41:42 +0200
Received: from [209.85.128.44] (helo=mail-wm1-f44.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a69d8e6-fae8-0a2a45030019-d155802cad0f-3
 for <xen-devel@lists.xenproject.org>; Wed, 29 Jul 2026 12:41:42 +0200
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-49558ce01afso5372475e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 29 Jul 2026 03:41:42 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-497fecfccc7sm17390895e9.12.2026.07.29.03.41.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Jul 2026 03:41:41 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1785321702; x=1785926502; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zI5fF/KZ5gecqb5PeF3jTPYTKHb1nH8BxuQH5siZpNs=;
        b=BWDTbJHVWM03Xv/hDyTmQYb62K2SGSc8tXAN7HzaVR/aAI8zlwALY8Kf1oWiTEXbNW
         EfK+634b2DedhYmN7M6jsnr1E9446nAihTk8KP3qL6FJVf/v6mQqrvK/nj7SRN2DT6Fm
         jWueDN3MnyDSJCOOhyRdO9TnLcdoHvyym/9ewlsrUKZUuNgIYee651iJayO395x+LyKH
         jQvVhmneh8Qlop7aGdfHVmWkG7BoQahZdAzHa7pZG44f1i+KHw00M4akooQ+mAgLmF2/
         Ya1pM+mV1cK1CeddY/L5RdhsqNJfeYFNwTaN4e88iE1/v4+PiSDdOjh+AXoDUMInCEqE
         95jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785321702; x=1785926502;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zI5fF/KZ5gecqb5PeF3jTPYTKHb1nH8BxuQH5siZpNs=;
        b=KDb8Uyjt0z9HBW6H6aFYYQmai/83laR42mF66ksJsiD8KU+IN1vt5LFLmeVhHbwAUt
         JvXQn905vjEU4rQ5XiYWAtde+VOz49v2wQXj55XsZI+gPbjTd6i4swKH0jiCv1C3JiS5
         ke9LRrvrfA4dhBa276idzZpXOIc2OK730BtFeSPnHK0OlZGZApx3wNDl5Itnh6SwsXd2
         m23LkkErLQ06AEfi/kPY69gIpcLuPesejn+7MKew+21s/7F9NSQ32/uZZ3W54GhJB/NI
         Gxzmion4gu1SHk4KourdRgLeqVoFO4WQoQsSbFWyEynmkUJgSmmJm7l27YBaw0u3cBFu
         zfTw==
X-Forwarded-Encrypted: i=1; AHgh+RrG0UknMrCyqnvROKyCY8n9Cdea0rWNkTpOju6Vz9elbKPqR8TVpWFSsbry1f1xTvyqMqOrlBTi0bQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwzFcTtvyJrVd0iIgl2Ev74XK1XvawtvHiaOxjz3m6dkC9ZsLei
	MI5YYJLmHfykAgKvBD5ecUwovcyEtCEmCe26kp+bLfZbCYDEbqCq0VvQ
X-Gm-Gg: AR+sD11l7CQkH/ON2DxLqUPSfAXxtzzjA0aVmBBAfo8Kpuz4nbBOb5a+g9tvVYLZbxE
	jBB2tQCCUZXj9Z2CZZkirj6IQXkVtIYt0gAmqGMreUe++GKlbDFOpSMRvikdqmGFsxNODDP1Hl/
	iew7Lc2ucnb4gLpcFSAYq0EudN6jG4qKbQmnPENL11EaA0iMhp0k+er+Nm2BZhsvocHnHmTOTYs
	W8WHnoMiVmhP20/UOMGuBhXDEQLaFTg4vBFsiIJbY+1JHeGzYJP5KCksus27KUtC3uIInDoPHA/
	J8MCRSeSJzjDqNBwOr04ni0NUwIqxsc5XQJWMisPsmd4rFmZF2Hu+37Qi0qakSVvTwWpkvei2th
	OxcEd+tuLEwM2/95IjWJqJblWWySoexGS+8/sZP/O4NVrxbfie/L2dQdBvpHuAxawbz7yPSYKsL
	RhVOoR9jOCbEXHpyA+uRdnU1PfPeN2kLoiFrDqSpr9ceTFg3BilX3sDjxEJVFcMbR/sgdUQI7Vh
	7DM8mzWiKUj9/Q0Idni+rYsylO4f08He7/TPmVjih4rGoHVZFiqo4o=
X-Received: by 2002:a05:600c:3153:b0:493:c10c:22f0 with SMTP id 5b1f17b1804b1-496c656e484mr72386725e9.20.1785321702235;
        Wed, 29 Jul 2026 03:41:42 -0700 (PDT)
Message-ID: <43cf6077-c1c1-4aab-b769-736a3912e02f@gmail.com>
Date: Wed, 29 Jul 2026 12:41:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 14/23] xen/riscv: introduce minimal virtual APLIC
 (vAPLIC) infrastructure
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
References: <cover.1784559209.git.oleksii.kurochko@gmail.com>
 <98bcad12ca4e5ee270cc1ef9db09d89a32f863f8.1784559209.git.oleksii.kurochko@gmail.com>
 <e5ac074d-c824-4fe4-a1d4-ba986236fbb1@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <e5ac074d-c824-4fe4-a1d4-ba986236fbb1@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-33051d/1785321702-6ECCB4E9-AE635AF7/10/73395122804
X-purgate-type: spam
X-purgate-size: 2820



On 7/22/26 9:40 AM, Jan Beulich wrote:
> On 20.07.2026 17:59, Oleksii Kurochko wrote:
>> At the current development stage, only domain vINTC init and deinit
>> operations are required, so implement those first.
>>
>> Initialize vAPLIC's domaincfg to with the interrupt-enable bit set and
>> MSI delivery mode selected as the current solution is exepcted to have
>> always IMSIC, and initialize vintc->ops.
>>
>> Other operations such as emulate_load(), emulate_store(), and is_access()
>> will be needed once guests are running and MMIO accesses to APLIC MMIO
>> range must be handled. These will be introduced separately later.
>>
>> Introduce a structure to describe a virtual interrupt controller (vINTC)
>> and a vintc_ops structure, which provides operations to emulate load and
>> store accesses to interrupt controller MMIOs and to check whether a given
>> address falls within the MMIO range of a specific virtual interrupt
>> controller.
>> Note that already existed init_ops field in struct vintc will be init-ed
>> for APLIC in the follow up patch.
>>
>> The vAPLIC implementation of these operations will be provided later
>> once guests can be run and these operations are actually needed.
>>
>> Introduce these structures here as they are required for the implementation
>> of domain_vaplic_init() and domain_vaplic_alloc(). Also, introduce
>> vaplic_init() and init vintc_ops->vcpu_init() with it.
>>
>> Co-developed-by: Romain Caritey <Romain.Caritey@microchip.com>
>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> 
> Acked-by: Jan Beulich <jbeulich@suse.com>

Thanks.

> albeit I (continue to) think that ...
> 
>> --- a/xen/arch/riscv/include/asm/intc.h
>> +++ b/xen/arch/riscv/include/asm/intc.h
>> @@ -17,6 +17,7 @@ enum intc_variant {
>>   struct cpu_user_regs;
>>   struct irq_desc;
>>   struct kernel_info;
>> +struct vcpu;
>>   
>>   struct intc_info {
>>       enum intc_variant hw_variant;
>> @@ -53,8 +54,19 @@ struct vintc_init_ops {
>>       int (*make_domu_dt_node)(struct kernel_info *kinfo);
>>   };
>>   
>> +struct vintc_ops {
>> +    /* Initialize some vINTC-related stuff for a vCPU */
>> +    int (*vcpu_init)(struct vcpu *v);
>> +
>> +    /* Deinitialize some vINTC-related stuff for a vCPU */
>> +    void (*vcpu_deinit)(struct vcpu *v);
>> +};
>> +
>>   struct vintc {
>> +    /* Used during domain build only; dropped afterwards. */
>>       const struct vintc_init_ops *init_ops;
> 
> ... "dropped" in the comment is misleading - there's nothing being dropped
> here, as that's technically impossible. Iirc you don't even poison the
> field once domain build is finished.

I will rephrase that in the following way:

/* Callbacks invoked during domain construction only. */

~ Oleksii

