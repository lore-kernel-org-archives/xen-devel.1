Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 470E8C61DFD
	for <xen-devel@archiver.kernel.org>; Wed,  2 Sep 2026 08:05:20 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1405277.1638794 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1fy4-0004fZ-DY; Wed, 02 Sep 2026 08:05:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1405277.1638794; Wed, 02 Sep 2026 08:05:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1fy4-0004fR-9k; Wed, 02 Sep 2026 08:05:12 +0000
Received: by outflank-mailman (input) for mailman id 1405277;
 Wed, 02 Sep 2026 08:05:11 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1x1fy2-0004fJ-T8
 for xen-devel@lists.xenproject.org; Wed, 02 Sep 2026 08:05:10 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x1fy2-008j2y-6P
 for xen-devel@lists.xenproject.org; Wed, 02 Sep 2026 10:05:10 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a97d8b0-8faa-0a2a0a5109dd-0a2a4507dc6e-34
 for <xen-devel@lists.xenproject.org>; Wed, 02 Sep 2026 10:05:10 +0200
Received: from [209.85.208.53] (helo=mail-ed1-f53.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a97d8b5-b4ea-0a2a45070019-d155d035bdad-3
 for <xen-devel@lists.xenproject.org>; Wed, 02 Sep 2026 10:05:10 +0200
Received: by mail-ed1-f53.google.com with SMTP id
 4fb4d7f45d1cf-6a38098734bso1430499a12.1
 for <xen-devel@lists.xenproject.org>; Wed, 02 Sep 2026 01:05:10 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-484492cf550sm4502303f8f.37.2026.09.02.01.05.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Sep 2026 01:05:08 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1788336309; x=1788941109; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8R0epzX8cULzfAhI8BmCx2YiWbLoKCsOKiSssYsgme0=;
        b=BjvyBHnWmrBDGPxaZlSyPqTXpUW2vv5WexcTKOyDeIcITDRNj0pRfpMIBmoUfMauVi
         OUsukFEZ+lYgkjDq7gr1jCsjLtTjvu0sw+/9hXkvnQ0UBYOY+Vmak3KDWyl0o/NsjJ/o
         EJpa2bJlXQvf6P2dk42f7I1wuK95ptxSX6Lk3VqRO2bOwq78zxqMwgoYA1RPJ8N8eELF
         WgCwGnugnrd+H+ocgxKu3o/aikVil4F8ufkxpRBnbqVI/VmwrO77xXdQg2FdFcZbR6YO
         Vd+u2h79tKQN9u2qCjxn55E5unCsPU8o3Z0EK+bztG/vhPo93CW8V7s2dQlCu2L8WQMO
         IiIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788336309; x=1788941109;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8R0epzX8cULzfAhI8BmCx2YiWbLoKCsOKiSssYsgme0=;
        b=kH2oHciwbFb2HNnvVMtT+A2FZTTxizyhrw8b/D99+JRU5HD1e9V5nZ6d0PWWPFV97J
         pCqBjnZFfMCqcFpLVn0UHa6w4TdDrIY2Kb3vchkgoJ1mr9WOqVVqnNJxmNwx7BZJnOTe
         AJCp7XEIzQFiGgxBYvMwF9noK67wEp9MDhiUx6t5pGOkh6SICl9l9LaXqaH8ZKlFiGzP
         kxwpuGxCkJySUoReocfH61wmC/6K1lp6DWLOGKhxcWsCY57TSOkrCglRDDxjf6+/EaKT
         czKAlZ6HRUWU82dxU1MWe9U/77qsLAvUgHIAmetyz6V+/L00AhIRCgNJQvb7jlgr+qUN
         ynsg==
X-Forwarded-Encrypted: i=1; AKwUvBwDResh74oEOJK4uWl3cm2D+77oWyzjkPQGUZkAxc3z+eSb8ealfLjcLPtLzbN00LRjbPA8sk9CjM4=@lists.xenproject.org
X-Gm-Message-State: AFuF++lWjiai+o21ui1T3wjKiGqu23E4lBXnW650PFruL58lbKuRUceU
	p+qHHiRAsPquDfvHdcffoxXtJK9nT7NJNh/ApwMXpXXzgXV0UHgh62qe
X-Gm-Gg: AYBFou3yn5LNl8nK5xwlykz+lZd/bzW6CKQsD0rkxOXrKefsb0X6N8Bnq0usJQckTm6
	H06OvbhRQiIZTorHWdkJjMRGpzH6+2Q1KkCzQH//d1mefSOTWW89FBvQd1W9n01T7Tnr8rLavQC
	m8MJy7VzeW9ZSX8qb/I6UA+eGAAjVrvW2ozD4xzdvM8Zp1aU7JBmrbydO5IcfD/Rb3dmz7kvflU
	mWnXljRmi42lnFx12HFHEE/hdDGfvU/fnsWgEpVKIlxADzBOgN8QcTbRwzGhw1TdZoCGzcboFja
	Ltcz4gqJubuv5GLCyJuk3+tsY4sN3cMUQFcra6ye69HITNTON5Qs8ihSAuOGb8w8pcbdDV8xmTs
	HjpAh2K2jX/4GaFclkMAnBRHnueCgtfV+p37iF8ffTo3QO/nS0xzOpqKqOfVMz+8ydzpZf75HRA
	yCOI7zacOtGGh0AlLBs0OPQqx6+XaaV5zM717eGfdCBix+Qt2+iMXgE8jYPYc4dqWwJIsHU1brV
	8pXGXTMfCa1MEMPI2r/gmTtTZKiGnvb0N7kdwqstw==
X-Received: by 2002:a05:6402:350c:b0:6a3:8652:a373 with SMTP id 4fb4d7f45d1cf-6a68234c4c8mr1943895a12.3.1788336309465;
        Wed, 02 Sep 2026 01:05:09 -0700 (PDT)
Message-ID: <598246be-5a0c-4969-b9a1-266739910f84@gmail.com>
Date: Wed, 2 Sep 2026 10:05:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/riscv: fix out-of-range indexing of the IMSIC per-CPU
 MSI array
To: Jan Beulich <jbeulich@suse.com>
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
References: <20260901155023.116381-1-oleksii.kurochko@gmail.com>
 <45fc41c1-7127-4e70-ba81-2a85d1bc7655@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <45fc41c1-7127-4e70-ba81-2a85d1bc7655@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ef75cf/1788336310-356C2AE4-4AD51ABF/10/73395122804
X-purgate-type: spam
X-purgate-size: 1662



On 9/1/26 5:59 PM, Jan Beulich wrote:
> On 01.09.2026 17:50, Oleksii Kurochko wrote:
>> --- a/xen/arch/riscv/imsic.c
>> +++ b/xen/arch/riscv/imsic.c
>> @@ -326,6 +326,8 @@ int __init imsic_init(const struct dt_device_node *node)
>>       unsigned int nr_parent_irqs, index, nr_handlers = 0;
>>       paddr_t base_addr;
>>       unsigned int nr_mmios;
>> +    /* imsic_cfg.msi[] is indexed by Xen CPU id, so size it accordingly. */
>> +    unsigned int nr_msi = num_possible_cpus();
> 
> The possible-CPUs-map may be sparse, so num_possible_cpus() may still yield
> too small a value to use here. The thing to use likely is nr_cpu_ids. I notice
> that variable is entirely unused so far by arch/riscv/*, though.
> 

IIUC "sparse" means we could have three CPUs with IDs 0, 1 and 12, so 
bits 0, 1 and 12 would be set in cpu_possible_map.

In that case num_possible_cpus() returns 3, which is the correct 
*number* of CPUs but msi[] is indexed by the Xen CPU ID, not by the 
CPU's ordinal position in the mask, so indexing it with ID 12 would need 
13 entries. The two only coincide when the mask is dense, so you are 
right that num_possible_cpus() is the wrong bound in principle.

That said, cpu_possible_map shouldn't be sparse by construction: the 
boot CPU is assigned ID 0 in smp_prepare_boot_cpu(), and the remaining 
IDs are handed out sequentially, so the bits are always 0..N-1 (for 
RISC-V it is done in such way in downstream). Arm, the other user of 
cpu_possible_map, fills it with Xen CPU IDs the same way.

I agree it is better not to depend on that, so I will use nr_cpu_ids for 
nr_msi instead.

~ Oleksii

