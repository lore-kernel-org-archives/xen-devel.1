Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 892ACC88E50
	for <xen-devel@archiver.kernel.org>; Fri, 11 Sep 2026 14:29:30 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1417010.1645909 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x52FU-0008A7-FV; Fri, 11 Sep 2026 14:29:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1417010.1645909; Fri, 11 Sep 2026 14:29:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x52FU-0008A0-Cu; Fri, 11 Sep 2026 14:29:04 +0000
Received: by outflank-mailman (input) for mailman id 1417010;
 Fri, 11 Sep 2026 14:29:03 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1x52FT-00089u-PO
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2026 14:29:03 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x52FT-00ECNC-6I
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2026 16:29:03 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6aa4102f-8faa-0a2a0a5109dd-0a2a4504cc28-0
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 16:29:03 +0200
Received: from [74.125.228.140] (helo=mail-ej2-f12.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6aa4102f-b57f-0a2a45040019-4a7de48ca8ea-3
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 16:29:03 +0200
Received: by mail-ej2-f12.google.com with SMTP id
 a640c23a62f3a-c254f9f0b1fso160762966b.2
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 07:29:03 -0700 (PDT)
Received: from [172.19.143.248] (IW396200.net.t-com.hr. [195.29.234.54])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c2965c56183sm86227066b.3.2026.09.11.07.29.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Sep 2026 07:29:02 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1789136943; x=1789741743; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G+Su9/ororVSrSvSKFxvSUCr8vqUu4bBOy683FkbG3Y=;
        b=NRcRUfI5ZMBPiiuRWG3i4AZa9awH2PTFIY5mmTD4VlREdzlH3DRreL1LkWimwLInFq
         appzzZHfTUEMxaWtYpWZ+o2EA9xmPS0u4SFAoU4SwhQRfOlDNcJPN+OP9cT7LLnjkAes
         d0t2dXZ8k8UbuV5IteEiMmQo7yAVq5LZ9t84J9Vt9pcXCWvYWBQbzI8OZtbZt9Un35Je
         i8C0q8mhnYnnGuEbTgJpL9I+9LvlZfeO0PUB442nY6PniBMgV97TjObQaXFEJFIFHzmq
         9khgvqnvpAhXsdwInbzsEkGZ1PTwTB/IW4ch0j0bXxP8gGHR/hz5Zga11jr40X9plHx6
         P2lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789136943; x=1789741743;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G+Su9/ororVSrSvSKFxvSUCr8vqUu4bBOy683FkbG3Y=;
        b=CatNtUtqDO9dqYGNZO45epdfZ50U24tuRdH0P1u9uetpc19R6b573lqWSOyJ96WMA0
         MM/mIGeT1pb7J22mjRDw8UorRYN+U2AnZ9F3oiS07SvHUuCZKuOi5u5D87JYTA9dn7N5
         fu1t7ykC1hueHhNQJi5/9kVbiT8G6thZkzoAr2m+OrS0Auw7uDJ4kdGwAfHw5Veb17zg
         UAHlxNb8b/TV0ERx6VLpZ4aXkLF7gc+61ynj7OhBccMhDmZuRgDUGeu6/7BmEXnGdKiG
         d6GV83zeivJrestIWgqAgfyFws3SSpXqOvH0jG6U7G8FdfBj/u3mEnY/spDS8xQzi8Hx
         ob0Q==
X-Forwarded-Encrypted: i=1; AKwUvBx1CGGxYo3lmCDGUCYk30gebLeQrqHtUSBPjkTaMlPUoYmnXad4Hhrf80BmLYH17GnVlUziMMDrzX8=@lists.xenproject.org
X-Gm-Message-State: AFuF++kvIqhHDThjzaElPujFPElS1LqNRGBo4uF1s2kAbb2aTJaClVqD
	F6ItQa4Jy+LcBayy2xk+x32PTbhowQR0HIs//Jsd8XiN34v7nuOwCl5q
X-Gm-Gg: AYBFou2iLsV+CqVG1yKTR+xL4syFAFIMr8S5P5x/Wn9rqK68XosZ++DMcN67ybVe/T5
	o2n7PvatzYkBgDstGat4JKX70L+5WUe91R6r4a0g2bqxkbdItrApM3eeoyx/Lv33z0wW+FJ8htz
	kmy8rHPlSb150sWVUkZaxRn0D1s4YguHuAg4GtkByshXC3zz3pPsVOcpnR6P7+Hv33FrG55HXVW
	mJi5qDTE2IuiBYma5KUV4LvVykjQm+E0l5z6WXRjFiFV3cZySNg6RcnwIHYQSI+h6MsCG7BWa/G
	KgdBFtCponeOVQTPh6OretpAS6W+ZsDruurQ/nrzMNie67dwfpokH6XxE7eLT4SbeUdNy1onG4I
	hUdgrOiN80Orgk5ZhAI8LhOuPfNa85TlauOKyE+B7AeJJLYML/7JLClQHITsEXU4sNNVHEHkX9L
	CdkaM+1sisx4JOBu3TBX7ZfENSlvWzRqEq2eP1yPa8RYEBrCojd5v4s1I5pCnzPFCPsF7T0ntT8
	abSPLcaFFQtAjsIjCZr1V60CDxgqeJ3
X-Received: by 2002:a17:906:c103:b0:c25:58e:83ff with SMTP id a640c23a62f3a-c29666203f5mr346374266b.10.1789136942481;
        Fri, 11 Sep 2026 07:29:02 -0700 (PDT)
Message-ID: <5332f8e9-e745-43e3-8928-1d2e425ea567@gmail.com>
Date: Fri, 11 Sep 2026 16:29:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 22/39] xen/riscv: add guest memory read helper
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
 <b68a29b7ef5b2cb83fde405b3854c94a2f44f4d0.1787838835.git.oleksii.kurochko@gmail.com>
 <e1b02a7a-24b4-4500-a690-313c823280f6@suse.com>
 <895ad4e5-37cd-4a1e-bc49-9a69ab00a920@gmail.com>
 <36c57293-1448-4283-ac85-5507d9cc637a@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <36c57293-1448-4283-ac85-5507d9cc637a@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ebf023/1789136943-C20D5B50-9259D9E0/10/73395122804
X-purgate-type: spam
X-purgate-size: 4093



On 9/11/26 4:00 PM, Jan Beulich wrote:
> On 11.09.2026 15:57, Oleksii Kurochko wrote:
>>
>>
>> On 9/10/26 5:28 PM, Jan Beulich wrote:
>>> On 27.08.2026 17:21, Oleksii Kurochko wrote:
>>>> @@ -114,3 +115,89 @@ unsigned long copy_to_guest_phys(struct domain *d, paddr_t gpa, void *buf,
>>>>        return copy_guest(buf, gpa, len, GPA_INFO(d),
>>>>                          COPY_to_guest | COPY_gpa);
>>>>    }
>>>> +
>>>> +/*
>>>> + * Read machine word from guest memory
>>>> + *
>>>> + * @guest_addr: Guest address to read
>>>> + * @read_insn: Flag representing whether we are reading instruction
>>>> + * @trap: Output pointer to trap details if something went wrong during read
>>>> + *
>>>> + * The hlv/hlvx instructions translate guest_addr through the live
>>>> + * vsatp/hgatp CSRs, so the read is only meaningful for the address
>>>> + * space of the currently running vCPU.
>>>> + *
>>>> + * At most two halfwords are fetched when @read_insn is true, i.e. encodings
>>>> + * wider than 32 bits are not supported. Such an encoding cannot be completed
>>>> + * by calling this function again at @guest_addr + 4: the length check is
>>>> + * applied to the first halfword read, which would then be a continuation of
>>>> + * the instruction rather than its opcode. It is up to the caller to reject
>>>> + * anything that is neither a 16- nor a 32-bit encoding.
>>>> + */
>>>> +unsigned long riscv_read_guest(unsigned long guest_addr, bool read_insn,
>>>> +                               struct trap_info *trap)
>>>> +{
>>>> +    /*
>>>> +     * Poison the result: if the very first access faults, the fixup skips
>>>> +     * over the loads without writing it. Callers must check trap->scause.
>>>> +     */
>>>> +    unsigned long val = ~0UL, tmp;
>>>> +
>>>> +    /*
>>>> +     * hlv/hlvx use hstatus.SPVP for the privilege of the access, and the
>>>> +     * live vsatp/hgatp for the translation. Xen never installs a value of
>>>> +     * its own in hstatus (it is only saved on trap entry and restored
>>>> +     * before sret) and it doesn't reschedule before returning to the
>>>> +     * guest, so all three still belong to the vCPU which trapped.
>>>> +     *
>>>> +     * Check the saved copy rather than the live CSR: a nested trap taken
>>>> +     * from HS-mode clears hstatus.SPV in the CSR (but leaves SPVP alone).
>>>> +     */
>>>> +    ASSERT(vcpu_guest_cpu_user_regs(current)->hstatus & HSTATUS_SPV);
>>> [...]
>>> Question being of how much value
>>> that checking is: vcpu_guest_cpu_user_regs(current)->hstatus can't possibly
>>> have SPV clear, can it? Only nested exception frames could.
>>
>> Given that vcpu_guest_cpu_user_regs(current)->hstatus will always have
>> SPV set for any valid guest trap frame, the ASSERT is purely a defensive
>> sanity check to ensure riscv_read_guest() is never called outside a
>> guest trap context.
> 
> It is not, afaict: vcpu_guest_cpu_user_regs(current) will give you the guest
> frame no matter what context you're in. For what you want, you'd need to
> pass struct cpu_user_regs * into here.

Agree, struct cpu_user_regs * will be required.

But I am looking at how read_guest() is used and it shouldn't be used 
when nested HS trap happen never and it seems like it is too much to 
pass struct cpu_user_regs * just to check that.

I think it is enough just to have:

     case CAUSE_FETCH_GUEST_PAGE_FAULT:
     case CAUSE_LOAD_GUEST_PAGE_FAULT:
     case CAUSE_STORE_GUEST_PAGE_FAULT:
         /*
          * A guest page fault taken in Xen context comes from an hlv/hlvx
          * access made on a vCPU's behalf and is dealt with by the
          * fixup_exception() above, so only a guest can get here.
          */
         BUG_ON(!from_guest);

where we already checked that when riscv_read_guest() is used then it 
isn't nested HS trap.

So it looks like we could just drop the ASSERT() and probably update the 
comment above function and mention that riscv_read_guest() shouldn't be 
called in nested HS trap.

~ Oleksii

