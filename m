Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F5A3C61DD6
	for <xen-devel@archiver.kernel.org>; Wed,  2 Sep 2026 09:59:31 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1405612.1639090 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1hkX-0004Dw-JT; Wed, 02 Sep 2026 09:59:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1405612.1639090; Wed, 02 Sep 2026 09:59:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1hkX-0004Dp-Gm; Wed, 02 Sep 2026 09:59:21 +0000
Received: by outflank-mailman (input) for mailman id 1405612;
 Wed, 02 Sep 2026 09:59:20 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1x1hkW-0004Dj-7n
 for xen-devel@lists.xenproject.org; Wed, 02 Sep 2026 09:59:20 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x1hkV-00Efam-9I
 for xen-devel@lists.xenproject.org; Wed, 02 Sep 2026 11:59:19 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a97f373-bab6-0a2a0a5309dd-0a2a4508965a-18
 for <xen-devel@lists.xenproject.org>; Wed, 02 Sep 2026 11:59:19 +0200
Received: from [209.85.221.51] (helo=mail-wr1-f51.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a97f377-f659-0a2a45080019-d155dd33e1a4-3
 for <xen-devel@lists.xenproject.org>; Wed, 02 Sep 2026 11:59:19 +0200
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-47de0093c42so947811f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 02 Sep 2026 02:59:19 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49ce4647472sm56240455e9.4.2026.09.02.02.59.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Sep 2026 02:59:18 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1788343159; x=1788947959; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/vAwC3tefb7FbixkOGmHDnNrlLQ4fDMzrHWRVQCmXpk=;
        b=BJh1sqAnKbT+FAgtamx+G8z4NLx69uITk8R2tIFq+D8zCtUqO8MWSGOrSYb9XvWmR4
         VofJjfA4fYCZNX11EoExYg1Da768uPeI2b3gKI6WEPVMZcrP+DcGjIoT0H0HzaZdSb+w
         rSp+mKzt0oxL91wHAQoF/yaNGj4Dj0/46eCB3tdf6ogu0kYQ5P26gHlfmnrUtkQLNILx
         JwzgVIOdouFq2SD3eMAZuQQmjMHwuRUL65ovLJmvmG+b3g+GYnoEiYq8DNXiubJe290j
         JCLK9kBwQituwFwHKY4aYoJyxue/BXafvMWD9ziiHa4wzpI3E0usVTROVij0jlum2YFN
         MsqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788343159; x=1788947959;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/vAwC3tefb7FbixkOGmHDnNrlLQ4fDMzrHWRVQCmXpk=;
        b=YJK4mCJpyYKVOo46s1lNIAK4jVb+T5Z5T1GMLWdYXvSvUqGk6nDddTHNR/jHp4H+PW
         5My0jgZ05nUtNir2BWjowgtx5Ry/N4JSkd8f66Ai9sQt8ewOWN83T5c+bq6w4Z63LY5v
         g/9at/KSx3DxIkV697AAC84kl64vsr8A6Ucb6gBYwk3MeFloNboeAA7pvnElMRnd81vr
         oIYWI6dXw1+qb4lbfGKyeJHJ6cLRsgL7iNjLQNcCSTlrWhK2n572jWp0dcmceX64FPIz
         heslHt2HSidc2x7unzHrpROPSr0xCf9+AeRrvchYnc5TIFO1ueC6cgRRmtDJtMZNSOix
         aPJA==
X-Forwarded-Encrypted: i=1; AHgh+RoHXOhw6ppNZ9E0ezzZ7FdIMQaW898J6jnUe+/M2WNdUTEaFXS1rAuYKoy2q6nzlzgFhpD/WONwS38=@lists.xenproject.org
X-Gm-Message-State: AFuF++mlSORBYwuphJwaybTMTUj4AYtfIIS1BCJw+cRlm0kHiQYDDiKF
	hmLoRsofxJfrRr86UMG8sNgbXG/pAKQjq9CgyKMp2GdRK7MzGq0BCJ/N
X-Gm-Gg: AR+sD12qL5gCwM1OUgpjCuPEpaOhron7f2ntvjPa1Lv5pp3NGVbm2BQStkkef88vO+n
	thC64bFQeQE0GNkQfdl6H9ZI2rjPJZedVLaOJ2B3Xy/8JeFgPBaQ9KG6etqGGfqmHQCUcGwdoGT
	edeWDG8FHr0K7VqJBrTpdYvEsTFNVgKnqMiwVH0AW6+RWFn375bDK9q8T7QuY6HJU2jyUcK6+I4
	tgORLloQAJ13KgJ04EO9OeM9Qu0F5CSG7et41UdzA548Vz01vOA5v8sio22W1q1MLsmT03p7pOt
	DLxyCuc3HTnOrvMe55W1Q8Xe0yo2SijQmpIhN629TNkHVrENjnYfomTzKQAqKuVq/yWjQUarsOM
	kb+/mAB6E7CrHk2+xrNDKJxlWzWTh2f7tt8Tqtc/rHoPDdxbPwiZ1weR+LR8LPhEzj3A0cfx8qF
	Mpgvan3O8UENklIxC/tOHdYnrYX1fx9Tjy9mxv43DOouq0OCDtMkashYGv4jlK1FQ2dWmtxbgyk
	pE/0f2jXtfxQQO1uk3KztZzodWVLB3pAw7Az3kabw==
X-Received: by 2002:a7b:ca42:0:b0:49b:92df:87be with SMTP id 5b1f17b1804b1-49ce55fbdbemr41777805e9.4.1788343158476;
        Wed, 02 Sep 2026 02:59:18 -0700 (PDT)
Message-ID: <69c29c07-c63f-433a-a7ad-85fa981c89b4@gmail.com>
Date: Wed, 2 Sep 2026 11:59:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 02/20] xen/dom0less: turn max_init_domid into a common
 variable
To: "Orzel, Michal" <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 Zheng Zhang <zhangzheng@iscas.ac.cn>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Timothy Pearson <tpearson@raptorengineering.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>, Teddy Astie <teddy.astie@vates.tech>
References: <cover.1787836900.git.oleksii.kurochko@gmail.com>
 <5a74a964b763e8444579a3c0d455e23160be8893.1787836900.git.oleksii.kurochko@gmail.com>
 <b65fcc50-b249-4505-a212-b2f60c55f86d@amd.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <b65fcc50-b249-4505-a212-b2f60c55f86d@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c1860d/1788343159-D735D87B-110DFF47/10/73395122804
X-purgate-type: spam
X-purgate-size: 6776



On 8/31/26 5:48 PM, Orzel, Michal wrote:
> 
> 
> On 27-Aug-26 17:18, Oleksii Kurochko wrote:
>> Until now every architecture carried its own notion of max_init_domid:
>> Arm defined a real variable (declared in asm/setup.h, defined in
>> setup.c), while ppc, riscv and x86 each provided a "#define
>> max_init_domid (0)" stub in their asm/setup.h. This duplicated the same
>> declaration across all arches and placed a purely dom0less concept in
>> arch setup headers.
>>
>> Now that the dom0less build code lives in common (xen/common/
>> device-tree/dom0less-build.c sets max_init_domid, and the console
>> serial-input switcher reads it), there is no reason for the symbol to be
>> per-arch. Provide a single declaration in <xen/dom0less-build.h>, with
>> the !CONFIG_DOM0LESS_BOOT stub kept there as well, so there is one source
>> of truth and the arch headers no longer need to mention it. Update
>> console.c to include <xen/dom0less-build.h> for the declaration instead
>> of relying on asm/setup.h.
>>
>> Place the definition in xen/common/domid.c rather than in dom0less-
>> build.c. The latter is built as dom0less-build.init.o, i.e. the whole
>> object is relocated into the .init.* sections and freed after boot,
>> whereas max_init_domid must outlive boot because it is read at runtime
>> by the console serial-input switcher. domid.c is always linked (obj-y)
>> and resides in regular (non-init) sections, so it is a correct home for
>> the variable. It is marked __ro_after_init since it is only updated
>> while creating boot-time domains and read-only afterwards, and guarded
>> by CONFIG_DOM0LESS_BOOT as domid.c itself is unconditional.
>>
>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>> Reviewed-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> Changes in v6-8:
>>   - Nothing changed. Only rebase.
>> ---
>> Changes in v5:
>>   - Add Reviewed-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> Changes in v4:
>>   - New patch.
>> ---
>> ---
>>   xen/arch/arm/include/asm/setup.h   | 2 --
>>   xen/arch/arm/setup.c               | 2 --
>>   xen/arch/ppc/include/asm/setup.h   | 2 --
>>   xen/arch/riscv/include/asm/setup.h | 2 --
>>   xen/arch/x86/include/asm/setup.h   | 2 --
>>   xen/common/domid.c                 | 5 +++++
>>   xen/drivers/char/console.c         | 1 +
>>   xen/include/xen/dom0less-build.h   | 7 +++++++
>>   8 files changed, 13 insertions(+), 10 deletions(-)
>>
>> diff --git a/xen/arch/arm/include/asm/setup.h b/xen/arch/arm/include/asm/setup.h
>> index 0adfa4993a8f..2af780512540 100644
>> --- a/xen/arch/arm/include/asm/setup.h
>> +++ b/xen/arch/arm/include/asm/setup.h
>> @@ -25,8 +25,6 @@ struct map_range_data
>>       struct rangeset *irq_ranges;
>>   };
>>   
>> -extern domid_t max_init_domid;
>> -
>>   void copy_from_paddr(void *dst, paddr_t paddr, unsigned long len);
>>   
>>   size_t estimate_efi_size(unsigned int mem_nr_banks);
>> diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
>> index 6310a47d68b6..86532d0a35b6 100644
>> --- a/xen/arch/arm/setup.c
>> +++ b/xen/arch/arm/setup.c
>> @@ -62,8 +62,6 @@ struct cpuinfo_arm __read_mostly system_cpuinfo;
>>   bool __read_mostly acpi_disabled;
>>   #endif
>>   
>> -domid_t __read_mostly max_init_domid;
>> -
>>   static __used void noreturn init_done(void)
>>   {
>>       /* Must be done past setting system_state. */
>> diff --git a/xen/arch/ppc/include/asm/setup.h b/xen/arch/ppc/include/asm/setup.h
>> index e4f64879b68c..956fa6985adb 100644
>> --- a/xen/arch/ppc/include/asm/setup.h
>> +++ b/xen/arch/ppc/include/asm/setup.h
>> @@ -1,6 +1,4 @@
>>   #ifndef __ASM_PPC_SETUP_H__
>>   #define __ASM_PPC_SETUP_H__
>>   
>> -#define max_init_domid (0)
>> -
>>   #endif /* __ASM_PPC_SETUP_H__ */
>> diff --git a/xen/arch/riscv/include/asm/setup.h b/xen/arch/riscv/include/asm/setup.h
>> index 2215894cfbb1..73ce2f293348 100644
>> --- a/xen/arch/riscv/include/asm/setup.h
>> +++ b/xen/arch/riscv/include/asm/setup.h
>> @@ -5,8 +5,6 @@
>>   
>>   #include <xen/types.h>
>>   
>> -#define max_init_domid (0)
>> -
>>   void setup_mm(void);
>>   
>>   void copy_from_paddr(void *dst, paddr_t paddr, unsigned long len);
>> diff --git a/xen/arch/x86/include/asm/setup.h b/xen/arch/x86/include/asm/setup.h
>> index b01e83a8ed9f..5925c5f39cff 100644
>> --- a/xen/arch/x86/include/asm/setup.h
>> +++ b/xen/arch/x86/include/asm/setup.h
>> @@ -68,6 +68,4 @@ extern bool opt_dom0_verbose;
>>   extern bool opt_dom0_cpuid_faulting;
>>   extern bool opt_dom0_msr_relaxed;
>>   
>> -#define max_init_domid (0)
>> -
>>   #endif
>> diff --git a/xen/common/domid.c b/xen/common/domid.c
>> index b0258e477c1a..cd46cf952be6 100644
>> --- a/xen/common/domid.c
>> +++ b/xen/common/domid.c
>> @@ -9,6 +9,11 @@
>>    */
>>   
>>   #include <xen/domain.h>
>> +#include <xen/dom0less-build.h>
> NIT: "dom0less" comes before "domain" when it comes to alphabetical order I think.

Agreed. With that re-ordering, <xen/types.h> also has to be added to 
<xen/dom0less-build.h>, as the latter includes <public/xen.h>, which 
uses the fixed-width types defined in <xen/types.h>. Without it, the 
build fails with "unknown type name 'uint64_t'".

I will re-order the includes and add <xen/types.h> to dom0less-build.h.

I will also added the following to commit message:

While at it, make <xen/dom0less-build.h> self-contained: it includes
<public/xen.h>, which uses the fixed-width types provided by
<xen/types.h>, so include the latter explicitly rather than relying on
the includer having pulled it in first. This becomes necessary as soon
as <xen/dom0less-build.h> comes first in an alphabetically sorted
include list, as it now does in domid.c.

> 
>> +
>> +#ifdef CONFIG_DOM0LESS_BOOT
>> +domid_t __ro_after_init max_init_domid;
>> +#endif
>>   
>>   static DEFINE_SPINLOCK(domid_lock);
>>   static DECLARE_BITMAP(domid_bitmap, DOMID_FIRST_RESERVED);
>> diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
>> index fcacf37c52f0..61e92491e40a 100644
>> --- a/xen/drivers/char/console.c
>> +++ b/xen/drivers/char/console.c
>> @@ -31,6 +31,7 @@
>>   #include <xen/warning.h>
>>   #include <xen/pv_console.h>
>>   #include <asm/setup.h>
> NIT: This can be dropped - I don't see anything relying on it in this file.

Checked that: nothing really depends on it + CI tests are passed.

I will also then add the following to commit message:

Update console.c to include <xen/dom0less-build.h> for the declaration
instead of relying on asm/setup.h, and drop the now unneeded
<asm/setup.h> include.

> 
> Other than that:
> Reviewed-by: Michal Orzel <michal.orzel@amd.com>

Thanks.

~ Oleksii

