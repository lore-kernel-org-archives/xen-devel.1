Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8F3ECA9ED1
	for <xen-devel@archiver.kernel.org>; Mon, 12 Oct 2026 13:50:42 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1446385.1662517 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGGPx-0004wt-Nz; Mon, 12 Oct 2026 13:50:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1446385.1662517; Mon, 12 Oct 2026 13:50:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGGPx-0004wm-LM; Mon, 12 Oct 2026 13:50:17 +0000
Received: by outflank-mailman (input) for mailman id 1446385;
 Mon, 12 Oct 2026 13:50:16 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xGGPw-0004wg-DF
 for xen-devel@lists.xenproject.org; Mon, 12 Oct 2026 13:50:16 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xGGPv-005jto-Pn
 for xen-devel@lists.xenproject.org; Mon, 12 Oct 2026 15:50:15 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6acce58e-8faa-0a2a0a5109dd-0a2a450c90f4-36
 for <xen-devel@lists.xenproject.org>; Mon, 12 Oct 2026 15:50:15 +0200
Received: from [209.85.128.44] (helo=mail-wm1-f44.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6acce597-f479-0a2a450c0019-d155802cdcd9-3
 for <xen-devel@lists.xenproject.org>; Mon, 12 Oct 2026 15:50:15 +0200
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-4a16aaf2067so23588175e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 12 Oct 2026 06:50:15 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-71-234.play-internet.pl.
 [109.243.71.234]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48db9ade914sm18121261f8f.54.2026.10.12.06.50.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Oct 2026 06:50:14 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1791813015; x=1792417815; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ytP0QNn9MIUxZonDK/H7HrHHAAyzmi7idecn6+c9uV0=;
        b=WOIgDP5Xn8n70jYuImHxINtmtdd0rFJHG2YbP06HRrsNMo5HDO45xqAdOV/yHwvvq3
         KvkoHXH+CTKRr/8qfcfdE4ephYz/AmRIax6ah5/nWc7DYd0GoRJJHuTykH5u87bxobaq
         GXAeBpw+Ymdc9/SlEIjuIMgfWCNctpbqHfbQDslBJZGBpxX29b9cWoFkO5DXgIYal/sr
         8316fnp6yhhWhlZ1oZLlY0JurlHgkljyrxlTfBVqz93bAGo1IZ+IeRSHxmDFPMIeYD/N
         p4ap+yFif8jWPc4s1Sf892WF9ffwjtpNcyajsTaZ2Zfmf4OcEzpinX3jEvqwNwzcIxkb
         NerQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791813015; x=1792417815;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ytP0QNn9MIUxZonDK/H7HrHHAAyzmi7idecn6+c9uV0=;
        b=kgOmRJqudKx0zFx3sekaLxZIuqQ+9McqQ4DbVxaBYtbdAtwASDWR+5k89A2DznxpHN
         Fm9GgLkLGnHlLII2yuGMEa7iV33nPruC1tjCwAXf1ucHtFYG8mqtfnU3cSAzq/Yn71TI
         T+ChmVXTpjpOP4sYHWbZLNYfdSc9xoYLRPBr78IB/AQ1hg2pTyrgiQmLKE1VTLI8ygxg
         A/BLoxzntimlyrTlE0KuzNWxDroBlmUCeDPbxfkiPhPvPknN6yqmvabpWr/K68yttZ48
         lkWhYOX+NbRw1DjKCiS5xTgvKQEMe/H8GrNXkqNaCiSGqhiDIPAz4gqH9FaXNs2A2gai
         MZiQ==
X-Gm-Message-State: AFq9FYLJxH4/2HM6r3BXHgIbKBa+D0fassf7wL1ZRsBiyXfzFP4pU3k6
	fxVbstq3AFXVXdVtsgNEJoNQTdnKmp+3Y+54DJUntc+uDfEjV3W0DasI
X-Gm-Gg: AYBFou2rMptVb9wl4A0VWbKAq9An5t5jw/p9/hLc1oGmTiT3hOt0saS4Ir1lhnBl1Fd
	ipcPU/4lLKwwppKyEgyf9r03HUmWcgoC0Dayk4MrJ7aJyxuIoxez/zxPzpeKgNFTHCU1Rr1Aa3E
	S6qyiNGsh2jgHokXXtl4xmbgHVGSG+16HUUg6GzRGM8JBCJUmTyAN72SllbWW5IbGwWr79C4KMl
	5Z0JpyxD/o4mPrbiLzZeVkMneF/TC2ctCYspPwUbXHBeIMYYUJ242QTzgeNIjQEncM2jFONa5oh
	p59dM3GlHou/jzt2RZ3BBaym66HCMJHRMROhc8t2pleg0Dsg9EMsgIj00AannqeebV2CaZ9rdmj
	LtZvso49HkaDYybVp7igeDnIg6Tw/Vhc55DuDRAjxJ1xWCoXYFB52WnFZGMuBfgosxUl2SfG93k
	mxj8C2y4a40A+B8vwijTEbpzmHO2s21HqIQ8W6c7q8+lJjhd9ZGRxe+qsyM6MJXPTojChqQzbYj
	m+XMhGolooI67KGvtU0UbWOVWn/FbBuYpo9t4O6OgpPYSRFQw==
X-Received: by 2002:a05:600c:4f46:b0:49f:cbf1:e77b with SMTP id 5b1f17b1804b1-4a18e4a5355mr229518845e9.10.1791813014741;
        Mon, 12 Oct 2026 06:50:14 -0700 (PDT)
Message-ID: <1960669d-0a07-4bf5-9219-c079cb9d0081@gmail.com>
Date: Mon, 12 Oct 2026 15:50:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 06/39] xen/riscv: introduce device-agnostic MMIO
 emulation dispatch
To: Baptiste Le Duc <baptiste.le-duc@vates.tech>
Cc: xen-devel@lists.xenproject.org,
 Romain Caritey <Romain.Caritey@microchip.com>,
 Zheng Zhang <zhangzheng@iscas.ac.cn>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>
References: <cover.1790779209.git.oleksii.kurochko@gmail.com>
 <cafb356d9cc3148d74df846e08c4961da72bea0e.1790779209.git.oleksii.kurochko@gmail.com>
 <1791194531.8631fc262581453bbf619ec5b2062170.1a10b8384c50003f66@vates.tech>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <1791194531.8631fc262581453bbf619ec5b2062170.1a10b8384c50003f66@vates.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d25034/1791813015-51538A5B-646B575C/10/73395122804
X-purgate-type: spam
X-purgate-size: 3681



On 10/5/26 12:01 PM, Baptiste Le Duc wrote:

[...]

>> diff --git a/xen/arch/riscv/include/asm/mmio.h b/xen/arch/riscv/include/asm/mmio.h
>> new file mode 100644
>> index 0000000000..1bf48571a9
>> --- /dev/null
>> +++ b/xen/arch/riscv/include/asm/mmio.h
>> @@ -0,0 +1,63 @@
>> +/* SPDX-License-Identifier: GPL-2.0-or-later */
>> +#ifndef RISCV_MMIO_H
> Should be ASM__RISCV_MMIO_H instead to be consistant with other header
> files in riscv/include/asm.

According to the coding style document it should be 
<arch>_<something>_H. I understand that some headers in RISC-V looks in 
the way ASM__arch_something_H only becuase they were introduced before 
the header guard recommendations have been updated.

I think I could suggest a separate patch to rename all header guards, at 
least, for RISC-V to avoid such type of confusion in future.

>> +#define RISCV_MMIO_H
>> +
>> +#include <xen/lib.h>
>> +#include <xen/rwlock.h>
>> +
>> +struct domain;
>> +struct vcpu;
>> +
>> +#define MAX_IO_HANDLER  16
>> +
>> +typedef struct {
>> +    paddr_t gpa;
>> +    unsigned int len;  /* Access width in bytes */
>> +    bool is_write;
>> +    /* Store: value to write; load: value read (set by handler) */
>> +    register_t data;
>> +} mmio_info_t;
>> +
>> +enum io_state
>> +{
> Style: should be directly after enum io_state.

I will fix that.

>> +    IO_ABORT,       /* The IO was handled and led to an abort. */
>> +    IO_HANDLED,     /* The IO was successfully handled. */
>> +    IO_UNHANDLED,   /* No handler found for the IO. */
>> +};
>> +

[...]

>> +static enum io_state try_handle_mmio(mmio_info_t *info)
>> +{
>> +    struct vcpu *v = current;
>> +    struct mmio_handler handler = {};
>> +
>> +    if ( !find_mmio_handler(v->domain, info->gpa, &handler) )
>> +        return IO_UNHANDLED;
>> +
>> +    if ( info->is_write )
>> +        return handler.ops->write(v, info);
>> +    else
> The else is not necessary here, misra would call that "dead code".
> Here are two suggestions:
> 
>        if ( info->is_write )
>            return handler.ops->write(v, info);
> 
>        return handler.ops->read(v, info);

Sure, I'll drop the else and go with the first variant in the next
version.

I am not too much into MISRA stuff and just for my education could you 
please specify what MISRA rule has been violdated here?

I suppose it is because of Rule 2.2 (or 2.1?). I don't think Rule 2.2 
applies here. MISRA C:2012 defines dead code as "any operation that is 
executed but whose removal would not affect program behaviour" (as 
quoted in [1], Section IV). The else doesn't introduce any such 
operation: both forms have the same semantics, and the read() call under 
the else is executed whenever is_write is false, so it is neither dead 
nor unreachable (Rule 2.1).

FWIW, I also compared what gcc 16 generates for RISC-V: at -O0 and -Os
the variants with and without the else are byte-identical, and at
-O1/-O2 the only difference is which of the two calls is laid out as the
fall-through path; the instructions are otherwise the same. But probably 
this is not the best way to verify things...

Also, R2.2 is disapplied project-wide for Xen anyway (see 
docs/misra/deviations.rst).

[1] https://arxiv.org/abs/2212.13933

> or:
> 
>        return info->is_write ? handler.ops->write(v, info)
>                              : handler.ops->read(v, info);
> 

If I am not confused something above then why thos option doesn't 
violate MISRA rule abouve 'dead code' isn't ternary operation just an 
equivalent to if/else?

Thanks for review!

~ Oleksii



