Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7020C88E4D
	for <xen-devel@archiver.kernel.org>; Fri, 11 Sep 2026 13:42:07 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1416796.1645719 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x51Vn-0007Vv-Vb; Fri, 11 Sep 2026 13:41:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1416796.1645719; Fri, 11 Sep 2026 13:41:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x51Vn-0007Vo-Sk; Fri, 11 Sep 2026 13:41:51 +0000
Received: by outflank-mailman (input) for mailman id 1416796;
 Fri, 11 Sep 2026 13:41:50 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1x51Vl-0007Vi-OH
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2026 13:41:49 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x51Vk-00EGpm-UR
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2026 15:41:48 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6aa4051b-bab6-0a2a0a5309dd-0a2a4505c20a-4
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 15:41:48 +0200
Received: from [74.125.228.76] (helo=mail-ed2-f12.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6aa4051c-4cb1-0a2a45050019-4a7de44ca7c9-3
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 15:41:48 +0200
Received: by mail-ed2-f12.google.com with SMTP id
 4fb4d7f45d1cf-6a9ba73bee8so437979a12.0
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 06:41:48 -0700 (PDT)
Received: from [172.19.143.248] (IW396200.net.t-com.hr. [195.29.234.54])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c296605b39esm78511466b.23.2026.09.11.06.41.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Sep 2026 06:41:47 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:Content-Language:References:Cc:To:From:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789134108; x=1789738908; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=eYd047a24qXsJoz1TM5uRKmr6kWZIo7d6eX12Nqivx8=;
        b=ZDJbRzDraR00BpFUCALDbSYttQhBvyEfwNWGexkH/PIFP7RXBMO/2kjVPznk4YZfFp
         OZpghhBchg9uGLavzYBskFwDEoX320110YDtnjgISnoOi8NYunjUusv0u4C8YDrEsQx0
         /xP2cHYoVnObmk7/c8zxS/C3CH1YMtxmKjyPWNSDB2UhqBAIPhC0VrbbDRcV9Oct/PrC
         u15HLqnJUm/IudpmUtE7fGB9lpCLlOe+Jd3YdkOfug/g7YTZhb4lX5VDAEGTNHpCwMY5
         zdu0egLPM3eLfxcebxNAzgLMIvyxGniM2yqyQ5u4RCOCSLn6Qc7LivVCwqOS1mq6NcTf
         fkYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789134108; x=1789738908;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eYd047a24qXsJoz1TM5uRKmr6kWZIo7d6eX12Nqivx8=;
        b=eJ9/woImhpB3eM7dr/CgT5O1Q10qpBGkpw2ecDnShcmmbpuVHAtshto0aqLyekK3XA
         mRuvurvplKkFgJpjn2zgEH38kPsWRx0h9I64BtLK1ezK03P3ze4njCIwqzGLrpO9nb1N
         HU4eg1+oBp76UiYLR2uXWoykuNtg29F01UzsiAx42OhspXrgfo8L7TbNz6sJGfy2Si12
         3Y3d/WNgbkADmCc6YLSseO588MMmQHpi1PlGCCCoFj5XlQyEPbN/t/JGhWesiqAoEYsz
         2l7Cu+kgaw3HC2HWXKSN18lwvhYl8QZ9C+xS9MBBRTwmou3eJOKBq48f1VnghTB+D1Mh
         vUwA==
X-Gm-Message-State: AFuF++lWOYhb2p6OzjBQNvolrBIrNMSc4L9JYIofvoZn/bXGfPjuYYsy
	ZNA3y6LXOQbAr9xmiYkTcB8w0DUmyG/zeLA2rADzrXLgek660FV+HP0M
X-Gm-Gg: AYBFou0Q7F24vM8fpfNrVaEej92x+Xv8XwzXkZGHAHZLfaJHPj2kc5tk30ofCsW9gfh
	1chv0yvNN//863uDzmXG3NI5aRvt+YSEVE/Ed0j9wlrbUCP4RRDBJg15CiJi/LJElwkEhDPS3jU
	nFF+tVMcgTqJDIyrG0y8JyCurT2qIyTNIwdYI9DAOeIStB9MePSn/mAtu+eNFdIYVSjo8hjVqb/
	txbHGzwbrOyZ6wgOd7MUsd5GGZhWY8iDzf7wiob8XLVTeO+0YIM5TqLr6krqF9DPyZ6I2tlNa9c
	hCMmlztlaj/OnEStdztrBj7uhCfUi0Sen8cLjXVsDoWvUtwc99ph9urVJAPDm8dXnhZwaPgnf0d
	M17v1zy5ctOlgu7e/b8TN4Djlriy48Yf5kj4iKC2USQchSZLYCf9n2RI156d4cA4m3nBMNFwx6t
	2SWNuEX96+rM16cCAZHOqWpxXPkSek+jD1eAbhSNiI+bsVjMNWMNBte9bwZT9sot/m0LiIllmGH
	mrTFJ3KM0gqNjcdkPZAGyQ5XYiuF735uvI=
X-Received: by 2002:a17:907:72c5:b0:c24:6382:2648 with SMTP id a640c23a62f3a-c2962a6edf5mr241508766b.5.1789134108265;
        Fri, 11 Sep 2026 06:41:48 -0700 (PDT)
Message-ID: <1ce9effb-a632-4a48-aaaa-3c810ebd255d@gmail.com>
Date: Fri, 11 Sep 2026 15:41:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 22/39] xen/riscv: add guest memory read helper
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
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
References: <cover.1787838835.git.oleksii.kurochko@gmail.com>
 <b68a29b7ef5b2cb83fde405b3854c94a2f44f4d0.1787838835.git.oleksii.kurochko@gmail.com>
 <1788955499.8631fc262581453bbf619ec5b2062170.1a0860e9b57000c4f3@vates.tech>
 <7b743afb-409d-433b-86b9-7ec8be7ad860@gmail.com>
Content-Language: en-US
In-Reply-To: <7b743afb-409d-433b-86b9-7ec8be7ad860@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c201ff/1789134108-714AC2A1-FC21677C/10/73395122804
X-purgate-type: spam
X-purgate-size: 3244



On 9/11/26 3:06 PM, Oleksii Kurochko wrote:
> On 9/9/26 2:04 PM, Baptiste Le Duc wrote:
>>> Introduce riscv_read_guest() to allow Xen to safely read guest memory
>>> using HLV/HLVX instructions while reliably capturing trap context.
>>
>>> This is required for instruction fetch emulation and MMIO decoding, 
>>> where
>>> Xen must inspect guest memory that may not be directly accessible and 
>>> may
>>> fault.
>>>
>>> The implementation is based on kvm_riscv_vcpu_unpriv_read() from Linux,
>>> with one deviation: the hlv/hlvx instructions translate the guest 
>>> address
>>> through the live vsatp/hgatp CSRs, i.e. through the address space of the
>>> currently running vCPU, so the function can only be called safely for
>>> current. Instead of taking a struct vcpu argument, it always operates on
>>> current directly.
>>>
>>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>>>
>>> diff --git a/xen/arch/riscv/guestcopy.c b/xen/arch/riscv/guestcopy.c
>>> index 8a89212e0b..b2327822ac 100644
>>> --- a/xen/arch/riscv/guestcopy.c
>>> +++ b/xen/arch/riscv/guestcopy.c
>>> @@ -6,6 +6,7 @@
>>>   #include <xen/string.h>
>>>   #include <asm/guest_access.h>
>>> +#include <asm/traps.h>
>>>   #define COPY_from_guest     0U
>>>   #define COPY_to_guest       BIT(0, U)
>>> @@ -114,3 +115,89 @@ unsigned long copy_to_guest_phys(struct domain 
>>> *d, paddr_t gpa, void *buf,
>>>       return copy_guest(buf, gpa, len, GPA_INFO(d),
>>>                         COPY_to_guest | COPY_gpa);
>>>   }
>>> +
>>> +/*
>>> + * Read machine word from guest memory
>>> + *
>>> + * @guest_addr: Guest address to read
>>> + * @read_insn: Flag representing whether we are reading instruction
>>> + * @trap: Output pointer to trap details if something went wrong 
>>> during read
>>> + *
>>> + * The hlv/hlvx instructions translate guest_addr through the live
>>> + * vsatp/hgatp CSRs, so the read is only meaningful for the address
>>> + * space of the currently running vCPU.
>>> + *
>>> + * At most two halfwords are fetched when @read_insn is true, i.e. 
>>> encodings
>>> + * wider than 32 bits are not supported. Such an encoding cannot be 
>>> completed
>>> + * by calling this function again at @guest_addr + 4: the length 
>>> check is
>>> + * applied to the first halfword read, which would then be a 
>>> continuation of
>>> + * the instruction rather than its opcode. It is up to the caller to 
>>> reject
>>> + * anything that is neither a 16- nor a 32-bit encoding.
>>> + */
>>> +unsigned long riscv_read_guest(unsigned long guest_addr, bool 
>>> read_insn,
>>> +                               struct trap_info *trap)
>> Nit: every other function in this file / declared in this header
>> (raw_copy_from_guest, copy_to_guest_phys, ...) has no riscv_ prefix. Why
>> does this one get it?
> 
> Agree not to much sense. I will drop it.

Probably we still want to have riscv_ prefix to show that this 
read_guest() is specific to RISC-V but others (raw_copy_from_guest, 
copy_to_guest_phys, ...) could be used in Xen common code too.

So I think we could keep riscv_ prefix.

~ Oleksii

