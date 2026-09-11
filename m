Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 969CEC88E4D
	for <xen-devel@archiver.kernel.org>; Fri, 11 Sep 2026 11:48:07 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1416454.1645478 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4zjL-00020O-Gk; Fri, 11 Sep 2026 11:47:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1416454.1645478; Fri, 11 Sep 2026 11:47:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4zjL-00020H-DO; Fri, 11 Sep 2026 11:47:43 +0000
Received: by outflank-mailman (input) for mailman id 1416454;
 Fri, 11 Sep 2026 11:47:41 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1x4zjJ-0001z2-8A
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2026 11:47:41 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x4zjI-001AJ3-LF
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2026 13:47:40 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6aa3ea59-e002-0a2a0a5209dd-0a2a4503e7f2-16
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 13:47:40 +0200
Received: from [209.85.218.42] (helo=mail-ej1-f42.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6aa3ea5c-fae8-0a2a45030019-d155da2ad475-3
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 13:47:40 +0200
Received: by mail-ej1-f42.google.com with SMTP id
 a640c23a62f3a-c250f28f1cdso154015066b.0
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 04:47:40 -0700 (PDT)
Received: from [172.19.143.248] (IW396200.net.t-com.hr. [195.29.234.54])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c29660234f2sm70763266b.12.2026.09.11.04.47.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Sep 2026 04:47:39 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1789127260; x=1789732060; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8dT0tbCdZCM3R8vBdrpD5ah/VElX8goA0nOHkmgBr1s=;
        b=pgGvbPezW/zWrmxcPmPNczcLEgz2WaYomGdKjPrubzOLo500vDelVllw49gAfxJdWl
         /wUZhAIboKcJBdCwljJ1pJ0DGzavQxr50pDSUPshJyWsmDJ2uuPWgn/346WVG++0T8oL
         sPcXlv0ZN13t2JkjY8FuL/qB1GUgt9MG+mvsI/xvcU7/r6UJJVgTV1ADIYPZvNF0nY/D
         ruge+NIoo4FFukdURpul7jysGxm6PuWuawYOi20RafYR78w3rllCh6/QQ2Kw0Zsr1LFU
         xYLmZCBHvpw2YC3JF/ale6sw4IXWzZMjoqQvC3We/VgbegGg9WUCgn6selgWe56VTNdD
         0HHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789127260; x=1789732060;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8dT0tbCdZCM3R8vBdrpD5ah/VElX8goA0nOHkmgBr1s=;
        b=U7/z8BoC3cbSmF1JFZuSidHpDMxYYkK7iJvBRogacmKij1agKIKh74DYjbYWlCxwTm
         Dg6VgoGwSEjNJR2EpiMqJYR8yHwQq6QngTIOH5my+iHwaa0/3WjGbu2h0uaBuNOX71cQ
         YlODMOCHN/swFeFdN2oVdQ3Mtyv1LlrgnX/jmp/BC3C4Js0UUaOchrfwVRmRK8VvcQBB
         +wvZh0+Hds2qe6nxYeIadFolq9yprbCHONlvZZs7oiPE2+HG4sKDU0ayyMyL1ibI7FgQ
         jPgtxFZkTsdd4IVbcTFwo/nfk3C89oArMBMjQn1odZAaBF36V51xWP+qsQQGjEvFo8MD
         iRPw==
X-Forwarded-Encrypted: i=1; AKwUvBxeVC6Wh+vEvVPwdCDLxWr3imnvAqzzq3z+KCbHCZYG2CuNAkPGZ7WB86tFpCM0502PJH6LbX/fzQM=@lists.xenproject.org
X-Gm-Message-State: AFuF++m77jTpGa67dI6b0Qr4eWCr0PCLOORTmVgBsirD9pg1TX+oU7cV
	uml85Wh9rAJWh26XczkKWGX5MyTgkBfYumVdP6ZUGWOZtBBmfixD8v5Z
X-Gm-Gg: AYBFou1lSd3Bn9THBwkN8tqutG/zoEcgd5xFzrrr28DiOv5Z3tHv8iT7NEWvt3uBtU1
	E2guYyGm9gWLMtIuyllGyMk9IRFCna9HeD7bL83xxn/1uwtMLnALXp8/OYq43VYUID+9PokOFJY
	2hM8/ibhV6W0GiJmMWjIigVmDCDbvgfl/N8BYrfS9vCUumLR6a0MQ0FbIb70s1PrnjPxgKi5hMM
	maCTc0fIeolEzlT5koM4ibrenFf6Lgnny0XU1EJexc5S44J/v76VZTlqxhjxRDERtLreeGdaHGM
	3Y7FQcBlWPn4WuPyoAv4KckxJjwoFpZUlVQy1RTjnc5xHj3DhYvc7NTO4g3f4V2i1I40t6vuXLK
	dBydvCTqx5OqxMPo0eRDsmQtsbf6SH8pHfREUd0Z0CDHiZhfKqCmt1SKM7RFD/gM8Sq25nWzSPS
	2jlcTkj1ewWmpYy+mlfnEuxM2tRlTCY+S6zUdjUxQI7aPp9BxNgYgpccvcu40yXRuHrhpSBQ37O
	mmY4HAL/OXB6D6LycxzkgvagPp9XHjCLg==
X-Received: by 2002:a17:907:a089:b0:c29:6291:e37c with SMTP id a640c23a62f3a-c29666901b5mr152931966b.24.1789127259615;
        Fri, 11 Sep 2026 04:47:39 -0700 (PDT)
Message-ID: <f194cd83-dd52-475f-b882-3ba6d8c489ef@gmail.com>
Date: Fri, 11 Sep 2026 13:47:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 18/39] xen/riscv: add guest page fault handling stub
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
References: <cover.1787838835.git.oleksii.kurochko@gmail.com>
 <42e37df518f1eda9579264b4bae9db3521e1042a.1787838835.git.oleksii.kurochko@gmail.com>
 <35aecc68-d16e-4350-9aca-101de2b21c1f@suse.com>
 <19aae90d-bd5b-4637-828c-bb5164ba4191@gmail.com>
 <e91e5b49-b6b6-429f-a1b2-b9e555e19f92@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <e91e5b49-b6b6-429f-a1b2-b9e555e19f92@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-33051d/1789127260-774F44E9-8E162849/10/73395122804
X-purgate-type: spam
X-purgate-size: 7773



On 9/10/26 8:38 AM, Jan Beulich wrote:
> On 09.09.2026 17:09, Oleksii Kurochko wrote:
>> On 9/8/26 4:10 PM, Jan Beulich wrote:
>>> On 27.08.2026 17:21, Oleksii Kurochko wrote:
>>>> --- /dev/null
>>>> +++ b/xen/arch/riscv/emulate.c
>>>> @@ -0,0 +1,179 @@
>>>> +/* SPDX-License-Identifier: GPL-2.0-or-later */
>>>> +
>>>> +/*
>>>> + * RISC-V instruction emulation for trapped guest accesses
>>>> + */
>>>> +
>>>> +#include <xen/bug.h>
>>>> +#include <xen/errno.h>
>>>> +#include <xen/sched.h>
>>>> +#include <xen/types.h>
>>>> +
>>>> +#include <asm/csr.h>
>>>> +#include <asm/current.h>
>>>> +#include <asm/emulate.h>
>>>> +#include <asm/riscv_encoding.h>
>>>> +#include <asm/traps.h>
>>>> +
>>>> +/*
>>>> + * The hardware-reported details of a guest page fault, gathered once by
>>>> + * handle_guest_page_fault() and passed down to the emulation of the faulted
>>>> + * access.
>>>> + */
>>>> +struct guest_fault {
>>>> +    /* The guest register state as saved on entry to do_trap(). */
>>>> +    struct cpu_user_regs *regs;
>>>
>>> If the comment was true, this could be pointer-to-const.
>>
>> I think it can't be pointer-to-const as emulate_load/store functions
>> wants to change PC register after MMIO access emulation is finished to
>> not trap again.
> 
> Of course, hence how I started the sentence.
> 
>>>> +    /* scause: a fetch, a load or a store/AMO guest page fault. */
>>>> +    unsigned long cause;
>>>> +    /*
>>>> +     * htinst: the trapped instruction in its transformed form, or one of the
>>>> +     * special values (zero, or a pseudoinstruction).
>>>> +     */
>>>> +    unsigned long htinst;
>>>> +    /* htval: as written by hardware; see resolve_faulting_gpa(). */
>>>> +    unsigned long htval;
>>>> +    /* stval: the guest virtual address of the faulting access. */
>>>> +    unsigned long stval;
>>>> +    /* The faulting guest physical address, filled by resolve_faulting_gpa(). */
>>>> +    paddr_t gpa;
>>>> +};
>>>> +
>>>> +/*
>>>> + * Is @htinst one of the pseudoinstructions reported for a guest page fault
>>>> + * taken on an implicit memory access done for VS-stage address translation?
>>>> + *
>>>> + * All four values are recognized regardless of the hypervisor's XLEN: the
>>>> + * width they encode is that of a VS-stage PTE, i.e. it follows the guest's
>>>> + * paging mode (4 bytes for Sv32, 8 otherwise). On RV32 the 64-bit forms
>>>> + * simply never occur.
>>>> + */
>>>> +static bool htinst_is_pseudo(unsigned long htinst)
>>>> +{
>>>> +    switch ( htinst )
>>>> +    {
>>>> +    case INSN_PSEUDO_VS_LOAD32:
>>>> +    case INSN_PSEUDO_VS_STORE32:
>>>> +    case INSN_PSEUDO_VS_LOAD64:
>>>> +    case INSN_PSEUDO_VS_STORE64:
>>>> +        return true;
>>>> +
>>>> +    default:
>>>> +        return false;
>>>> +    }
>>>> +}
>>>
>>> This feels fragile. New pseudo-insns can appear at any time. If the value as
>>> a whole is non-zero, aiui the low two bits being zero indicate a pseudo-insn.
>>> In which case enumerating pseudo-insns we are currently aware of isn't
>>> necessary.
>>
>> I will write it simpler	 then:
>>
>> /*
>>    * Is @htinst one of the special pseudoinstruction values, reported for
>> a guest
>>    * page fault taken on an implicit memory access done for VS-stage address
>>    * translation?
>>    *
>>    * It is enough to check only bits[1:0] as according to the spec:
>>    *
>>    * The value is one of the special pseudoinstructions defined later, all of
>>    * which have bits 1:0 equal to 00.
>>    */
>> static bool htinst_is_pseudo(unsigned long htinst)
>> {
>>       return htinst && ((htinst & 3) == 0);
>> }
> 
> And preferably
> 
>       return htinst && !(htinst & 3);
> 
> to be self-consistent.
> 

Good point. I will apply your suggestion.

>>>> +    /*
>>>> +     * A guest-page fault may arise due to an implicit memory access during
>>>> +     * first-stage (VS-stage) address translation, in which case a guest
>>>> +     * physical address written to htval is that of the implicit memory
>>>> +     * access that faulted - for example, the address of a VS-level page
>>>> +     * table entry that could not be read. (The guest physical address
>>>> +     * corresponding to the original virtual address is unknown when
>>>> +     * VS-stage translation fails to complete)
>>>> +     *
>>>> +     * In such cases htinst reports one of the pseudoinstructions recognized
>>>> +     * by htinst_is_pseudo(), and the fault requires separate handling (since
>>>> +     * G-stage translation failed on an unpopulated/unmapped guest physical
>>>> +     * address during a hardware page-table walk). To match bare hardware
>>>> +     * behavior, we must inject an access fault of the ORIGINAL access type
>>>> +     * (Instruction, Load, or Store/AMO) that initiated the address
>>>> +     * translation.
>>>> +     */
>>>> +    if ( htinst_is_pseudo(gf.htinst) )
>>>> +    {
>>>> +        inject_access_fault(&gf);
>>>> +
>>>> +        return;
>>>> +    }
>>>
>>> I.e. you imply that guests won't put their page tables in MMIO? That's
>>> fragile imo; I have seen OSes to use video frame buffers for all kinds
>>> of (transient) purposes, for example.
>>
>> I think it is okay for now and if it will a real use case then an update
>> of this code will be needed.
> 
> May I then ask that you leave a remark (maybe even fixme) to this effect?

Sure, I will then add the following to the comment above if ():

      * FIXME: This assumes that guest page tables never reside in an 
emulated
      * MMIO region, i.e. that an implicit access faulting at G-stage always
      * targets an unpopulated GPA. Guests may (even transiently) place page
      * tables in MMIO-backed memory, e.g. a video frame buffer. Supporting
      * that would require walking the VS-stage page tables in software,
      * accessing the PTEs (including A/D updates) through the MMIO 
handlers,
      * and then emulating the original access, instead of injecting a 
fault.

> 
>>>> +    resolve_faulting_gpa(&gf);
>>>
>>> Since the function is only a stub right now - how is one to tell whether
>>> this indeed can never fail?
>>
>> It can't be tell. But what is wrong if it could fail? (Actually with
>> current implementation introduced in later patches you can find it can
>> fail if a necessary extension or software page walk isn't introduced).
> 
> Well, quite obviously if it can fail, its return value would need checking
> here.
> 

That what I thought about after I sent my e-mail as a possible option.

I will update the prototype to:

+static int resolve_faulting_gpa(struct guest_fault *gf)
  {
-    BUG_ON("unimplemented");
+    return -EOPNOTSUPP;
  }

And handle an error code in the following way:

@@ -136,7 +144,8 @@ void handle_guest_page_fault(struct cpu_user_regs 
*regs, unsigned long cause
)
          return;
      }

-    resolve_faulting_gpa(&gf);
+    if ( rc = resolve_faulting_gpa(&gf) )
+        goto out;

      switch ( cause )
      {
@@ -163,6 +172,7 @@ void handle_guest_page_fault(struct cpu_user_regs 
*regs, unsigned long cause
)
          break;
      }

+ out:
      if ( rc )
          domain_crash(current->domain,

and then in the next patch "[PATCH v2 21/39] xen/riscv: resolve the 
faulting guest physical address" I will do "return -EOPNOTSUPP" instead 
of panic():

  -        panic("Shtvala isn't supported by h/w; s/w VS-stage walk 
required\n");
++    {
++        printk_once(XENLOG_WARNING
++                    "Shtvala isn't supported by h/w; s/w VS-stage walk 
required\n");
++        return -EOPNOTSUPP;
++    }

~ Oleksii

