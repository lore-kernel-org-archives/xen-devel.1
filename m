Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4D3CC5CFC1
	for <xen-devel@archiver.kernel.org>; Mon, 17 Aug 2026 08:31:42 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1392598.1631559 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wvsko-0004PV-G0; Mon, 17 Aug 2026 08:31:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1392598.1631559; Mon, 17 Aug 2026 08:31:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wvsko-0004PO-Aa; Mon, 17 Aug 2026 08:31:34 +0000
Received: by outflank-mailman (input) for mailman id 1392598;
 Mon, 17 Aug 2026 08:31:33 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wvskm-0004PG-TX
 for xen-devel@lists.xenproject.org; Mon, 17 Aug 2026 08:31:33 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wvskm-007oS7-A0
 for xen-devel@lists.xenproject.org; Mon, 17 Aug 2026 10:31:32 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a82c6e3-2eae-0a2a0a5409dd-0a2a45028de6-6
 for <xen-devel@lists.xenproject.org>; Mon, 17 Aug 2026 10:31:32 +0200
Received: from [209.85.128.54] (helo=mail-wm1-f54.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a82c6e4-6ca4-0a2a45020019-d1558036c5b8-3
 for <xen-devel@lists.xenproject.org>; Mon, 17 Aug 2026 10:31:32 +0200
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-4980dc26022so30876465e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 17 Aug 2026 01:31:32 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49987b3a6dcsm116211305e9.1.2026.08.17.01.31.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Aug 2026 01:31:31 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1786955492; x=1787560292; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=89+/G83egPDzhAja1d+D/ziiHDRVhmgqyaj/E6jrZbo=;
        b=hDaBsnN+EFo9T32cv85usg1Ps0H+6AulZ+XxbTcK4XRo6AaYQcqDkoS4ZS95g0IfUv
         FbGveqambWa5Op2rTu3j4CdiR6f2SHvLryprWHqWT1zCBWB9wOrXPZipA0yxkKMjZK8X
         B33o9J8kIrCCgPXuWnIni1UKOpm7ZpdpttFT7lgLwoEoPsqq/omXHbYjki7Jd0ld6z92
         ATMSdD8wCffxX1uEaUOw9eSgAMbw3E4dZwiwhQT+lNof8ZYQCwrMWeSUc/thos7K/Qel
         RCfADiuRplH+DkhCb8A3LzZlBJeV8TcFCa+/X7xxUOv78Js3etNUf8zmEEcuq6ESzxF4
         poHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786955492; x=1787560292;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=89+/G83egPDzhAja1d+D/ziiHDRVhmgqyaj/E6jrZbo=;
        b=kkMGKF5DA2YBJa/GSthky3XJVyf8NzXdg/flQ4UP7nxMjqTu1BrnuwrqE8mhoU1cbk
         jUKguAjRSdt2yAXc063mZA5PiCUay7j7VKAJYCT40HIVl8RrCqLtDcMP8Jq0AB/giTFx
         S9jFPVAzXPrtozFqIPM68qQoTPrrvnHnXrkkK56Www84ULhdkwKZec41UiutyIpXU3QZ
         jWmMsMB+x3SoUi8cQBPHmeB1LFozFSkF6mPrqYNE+06k1asO5oI2jcL6coMjbMhZ2eyk
         FTalMKs1Ibc9d+3EMCkVhxxgC9+RlbvXxxebmQuMW0o+/kyTdw9R8ruQFgS5eo/K96cU
         fvTQ==
X-Gm-Message-State: AOJu0YwtozhjRMHWVVSq9lc3YbXy5VTkd7qxJ/S/sLRJu7LXSmHXemso
	NWknfjEKKbMMTUgMFeMa2s427HbvMuyX4HPVa1NkPz+n8x2ukbIHdsz2
X-Gm-Gg: AR+sD1108Rjj+g5ovxYObMuIavOG5RnF94UwK50jQ/DdkJU1RVzC7TyjxRKREr9rA09
	ABGx6yzKtktnvmxYdQ9ER4zGDhG4bFyu5NKGkaXWkPycVrvUr6IyWPaU51OBo8jNKsOAk/kAzfJ
	8iL3yJ7G6JNVpTagA+cLWdxLXao7wgUKsVj16/kyngJ8OJeBDe/KJDqYFQ0X+kEJZ0ThpfKzSsw
	XHL0SCNqQDoZd2XR2MLUcXCDeQOnxuzAsCAzoZpYFt14tYyL0J08/59Tzeigouou9T+PmIq222F
	ylpz0Y0Rdm9aW5DuVzOdrW0AQjSPiPZFnFGYs88wrTVUnTO7VZkseWfCLLVTeSRgP9b5vz4uNDW
	tilI/SgdCe3LvbAmf5vxFKxjgl4qAd6zCK69LZG31yFUXSRzatWcCF+TV6WCbBBJde+4sX2TnQi
	tQ7sQaCW+jS+qut/pSypOCzxxxCngoV20CyqqyFdqj3HrpTwsXIBPFNcBLPP8Vg7FUOHZXa8G1D
	a9WjnnXSYki9DeqedGiG6bDqNv90aP2GKMD0FDVKeo=
X-Received: by 2002:a05:600c:564a:b0:498:ff3:71ed with SMTP id 5b1f17b1804b1-49987993affmr277094525e9.17.1786955491555;
        Mon, 17 Aug 2026 01:31:31 -0700 (PDT)
Message-ID: <cae4c5ef-cc4a-47a0-90fa-2f84c00ba4a6@gmail.com>
Date: Mon, 17 Aug 2026 10:31:29 +0200
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
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
References: <cover.1784560663.git.oleksii.kurochko@gmail.com>
 <e71f53f1165619fabb9f79f34cc931cd4296af67.1784560663.git.oleksii.kurochko@gmail.com>
 <1786614174.8631fc262581453bbf619ec5b2062170.19ffa80d28a000c4f3@vates.tech>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <1786614174.8631fc262581453bbf619ec5b2062170.19ffa80d28a000c4f3@vates.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-720697/1786955492-F1AAD2AC-A298BED0/10/73395122804
X-purgate-type: spam
X-purgate-size: 1398



On 8/13/26 11:42 AM, Baptiste Le Duc wrote:
>>   #endif /* ASM__RISCV__INTERRUPT_CONTOLLER_H */
>> diff --git a/xen/arch/riscv/intc.c b/xen/arch/riscv/intc.c
>> index 372c8d3a20..879d513374 100644
>> --- a/xen/arch/riscv/intc.c
>> +++ b/xen/arch/riscv/intc.c
>> @@ -163,3 +163,17 @@ bool vintc_reserve_virq(const struct domain *d, unsigned int virq)
>>   
>>       return !test_and_set_bit(virq, d->arch.vintc->used_irqs);
>>   }
>> +
>> +void vintc_state_save(struct vcpu *vcpu)
>> +{
>> +    const struct vintc_ops *ops = vcpu->domain->arch.vintc->ops;
> Is there a situation where ops could be NULL? If yes, add a check.

It is unlikely that there is nothing to do during a context switch for 
vINTC, so vINTC should provide an implementation for saving and 
restoring its context. This also ensures that a NULL pointer dereference 
will lead to a trap, allowing us to catch cases where a 
context-switch/restore handler is missing.

Even if it turns out that vINTC does not need to perform any actions 
during a context switch, it is perfectly fine to provide an empty 
implementation. However, as mentioned above, this is unlikely. 
Therefore, having a NULL pointer dereference here is intentional: it 
helps catch cases where someone adds a new interrupt controller driver 
but forgets to implement the corresponding context switch functionality.

~ Oleksii

