Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8C6BC79FB7
	for <xen-devel@archiver.kernel.org>; Wed,  9 Sep 2026 15:09:34 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1413338.1643635 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4JvT-00087s-Pr; Wed, 09 Sep 2026 15:09:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1413338.1643635; Wed, 09 Sep 2026 15:09:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4JvT-00087a-Lk; Wed, 09 Sep 2026 15:09:27 +0000
Received: by outflank-mailman (input) for mailman id 1413338;
 Wed, 09 Sep 2026 15:09:26 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1x4JvS-00081n-9c
 for xen-devel@lists.xenproject.org; Wed, 09 Sep 2026 15:09:26 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x4JvR-007zGT-MU
 for xen-devel@lists.xenproject.org; Wed, 09 Sep 2026 17:09:25 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6aa1769d-bab6-0a2a0a5309dd-0a2a4505abf2-34
 for <xen-devel@lists.xenproject.org>; Wed, 09 Sep 2026 17:09:25 +0200
Received: from [74.125.228.140] (helo=mail-ej2-f12.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6aa176a5-4cb1-0a2a45050019-4a7de48c9c46-3
 for <xen-devel@lists.xenproject.org>; Wed, 09 Sep 2026 17:09:25 +0200
Received: by mail-ej2-f12.google.com with SMTP id
 a640c23a62f3a-c254f705534so63176466b.2
 for <xen-devel@lists.xenproject.org>; Wed, 09 Sep 2026 08:09:25 -0700 (PDT)
Received: from [172.19.143.248] (IW396200.net.t-com.hr. [195.29.234.54])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c260d55b306sm792717866b.36.2026.09.09.08.09.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Sep 2026 08:09:24 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1788966565; x=1789571365; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kR7V91A5R6Cs/mRRpc93dDWh4xXmrh8wNkBOBaA0yQs=;
        b=I0KOT90hWIQRGNXzHbmMQHfroBuPMc9X8UrpfhGWVDOKJxB9UkPrFOCf1QOSf71Ok2
         Ggo9bbYFgppk5o2Kd6Y8y9zHHqJ8APFIX1FbaQxqEJ6tUViEJ/yYMGUwjCLg2u27OI5P
         LN0ZOCKGLCp7eL8ZjhDCw+icRqpsjavqtusjmEBDJY6W4yBOpnsb/IsL3em7PruJjMOh
         g0DjkSM2CTlPbbJAnPM6GfyXK6S+vIvZLOrDcv+VE2ycIxbuF8J0y5k+Qs/t993u3HNM
         YzRbnQKM07ohYv+158oqMxORgFhZucjQiKt1wB1cGuKNfaP+bE161iw3ut8kjoLhMPRZ
         Fu/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788966565; x=1789571365;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kR7V91A5R6Cs/mRRpc93dDWh4xXmrh8wNkBOBaA0yQs=;
        b=fskfZMJK4ip8hjieVWhH36N2cX9LwCRc7JS+gV8ObpvPWFpkt0nATFJr+cwyMdW6aT
         GWTbOQ2SHajFlzlmEXPt2V0ybfgUwG4eBsz+1DYB59p3svfeFUAGFVkSnX2ECUz9vOGV
         d+S/JtM4SEw2ztLiH5NW4Y0223usxiPseFfR+pG17Pw2XAE1XDbl0NGnW94/xdFCnJ6k
         lw43tBhiJh44ZrvRh7UPxc553lZ7K5BUuwS314bLWfJP+l87rGCjLTp6TU+OIBz7X8KD
         mtGUAHAUQgg7jbkuNYHgVxdF07tARW8XgNjlGWdj18gy0tBGnybHoRJFgw97AUxEHdoV
         XB1g==
X-Forwarded-Encrypted: i=1; AKwUvBwrnz4LENMuahdEsGM/qK5GBssMBF4pvJUXMEHghUCn6uM4NLcdrMPAkxCpsf0DFoVENANPWV3PX94=@lists.xenproject.org
X-Gm-Message-State: AFuF++kGdstDKqCwdqGanJ+k1gKo1jsW0Yc+dVJMXyR4UCdoox2MiePJ
	Jg/GSVi/+lLz2NzNogAynHbI5slrEpBl+oE7bjbYeu45eESA+eWSJkF+
X-Gm-Gg: AYBFou0jclP4/d/JbAE6bi5VhnttqUsrmp98sHGC6Eno+E0G1uwhfk6kSJF9VGxqm/n
	zhlILSw/JMBKmixmgqE+N2ZXYxG1iu1bG2lSyh8gMvRoE3X8kcDMSNWWVRoiEWHxv0ubuva9MTZ
	qs+5HkuOuMcgsbGVpWW8cqpoEqEQ7BwJe9U52e0qWqXsHf/fW8gJQuLtP/cLgcmscam3F1N8YxF
	heCqRdKSSnse/hF1ActKcY9gL0xZTx9U69csk0g4j+aEnAt6b8uOQAk3wWqe7mMFh3u+9sJXzct
	qqr2paOFjOSESbRa0Z2hVShVIuC0nwgLgVIP51ngOJ1c7f2BN3zmTZjakP6Y1XUVzG21DP2Lv82
	ArTz5odW+Bo2HkiCghnOWqrSPwF0eEvnopzxSr3DV0mL935pQuW2dtJzCrYh5FcDAukMxrH+Uwx
	7iGPMgz/WmXpflon4mnKLg/9BparOaJMrvDvbOibOYxBGneXXwFAhYlCJssc1oFCqgos2BpzwK4
	DkidecEs5YfAw/l4dRM7bCARAIuY8Y4
X-Received: by 2002:a17:907:c244:b0:c26:1648:a076 with SMTP id a640c23a62f3a-c2941be4cc7mr64078666b.49.1788966565018;
        Wed, 09 Sep 2026 08:09:25 -0700 (PDT)
Message-ID: <19aae90d-bd5b-4637-828c-bb5164ba4191@gmail.com>
Date: Wed, 9 Sep 2026 17:09:14 +0200
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
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <35aecc68-d16e-4350-9aca-101de2b21c1f@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c201ff/1788966565-F76BD2A1-0321CD91/10/73395122804
X-purgate-type: spam
X-purgate-size: 8318



On 9/8/26 4:10 PM, Jan Beulich wrote:
> On 27.08.2026 17:21, Oleksii Kurochko wrote:
>> --- /dev/null
>> +++ b/xen/arch/riscv/emulate.c
>> @@ -0,0 +1,179 @@
>> +/* SPDX-License-Identifier: GPL-2.0-or-later */
>> +
>> +/*
>> + * RISC-V instruction emulation for trapped guest accesses
>> + */
>> +
>> +#include <xen/bug.h>
>> +#include <xen/errno.h>
>> +#include <xen/sched.h>
>> +#include <xen/types.h>
>> +
>> +#include <asm/csr.h>
>> +#include <asm/current.h>
>> +#include <asm/emulate.h>
>> +#include <asm/riscv_encoding.h>
>> +#include <asm/traps.h>
>> +
>> +/*
>> + * The hardware-reported details of a guest page fault, gathered once by
>> + * handle_guest_page_fault() and passed down to the emulation of the faulted
>> + * access.
>> + */
>> +struct guest_fault {
>> +    /* The guest register state as saved on entry to do_trap(). */
>> +    struct cpu_user_regs *regs;
> 
> If the comment was true, this could be pointer-to-const.

I think it can't be pointer-to-const as emulate_load/store functions 
wants to change PC register after MMIO access emulation is finished to 
not trap again.

Regarding the comment itself I agree that it isn't fully true right now 
because there is no trap from guest and so no guest registers 
save/restore but it will for sure be and we can't not to save/restore 
guest registers when do_trap() happens.

I will re-word it to:

/* The guest register state */

> 
>> +    /* scause: a fetch, a load or a store/AMO guest page fault. */
>> +    unsigned long cause;
>> +    /*
>> +     * htinst: the trapped instruction in its transformed form, or one of the
>> +     * special values (zero, or a pseudoinstruction).
>> +     */
>> +    unsigned long htinst;
>> +    /* htval: as written by hardware; see resolve_faulting_gpa(). */
>> +    unsigned long htval;
>> +    /* stval: the guest virtual address of the faulting access. */
>> +    unsigned long stval;
>> +    /* The faulting guest physical address, filled by resolve_faulting_gpa(). */
>> +    paddr_t gpa;
>> +};
>> +
>> +/*
>> + * Is @htinst one of the pseudoinstructions reported for a guest page fault
>> + * taken on an implicit memory access done for VS-stage address translation?
>> + *
>> + * All four values are recognized regardless of the hypervisor's XLEN: the
>> + * width they encode is that of a VS-stage PTE, i.e. it follows the guest's
>> + * paging mode (4 bytes for Sv32, 8 otherwise). On RV32 the 64-bit forms
>> + * simply never occur.
>> + */
>> +static bool htinst_is_pseudo(unsigned long htinst)
>> +{
>> +    switch ( htinst )
>> +    {
>> +    case INSN_PSEUDO_VS_LOAD32:
>> +    case INSN_PSEUDO_VS_STORE32:
>> +    case INSN_PSEUDO_VS_LOAD64:
>> +    case INSN_PSEUDO_VS_STORE64:
>> +        return true;
>> +
>> +    default:
>> +        return false;
>> +    }
>> +}
> 
> This feels fragile. New pseudo-insns can appear at any time. If the value as
> a whole is non-zero, aiui the low two bits being zero indicate a pseudo-insn.
> In which case enumerating pseudo-insns we are currently aware of isn't
> necessary.

I will write it simpler	 then:

/*
  * Is @htinst one of the special pseudoinstruction values, reported for 
a guest
  * page fault taken on an implicit memory access done for VS-stage address
  * translation?
  *
  * It is enough to check only bits[1:0] as according to the spec:
  *
  * The value is one of the special pseudoinstructions defined later, all of
  * which have bits 1:0 equal to 00.
  */
static bool htinst_is_pseudo(unsigned long htinst)
{
     return htinst && ((htinst & 3) == 0);
}

> 
>> +static void inject_access_fault(const struct guest_fault *gf)
>> +{
>> +    struct trap_info utrap = {};
>> +
>> +    switch ( gf->cause )
>> +    {
>> +    case CAUSE_FETCH_GUEST_PAGE_FAULT:
>> +        utrap.scause = CAUSE_FETCH_ACCESS;
>> +        break;
>> +
>> +    case CAUSE_LOAD_GUEST_PAGE_FAULT:
>> +        utrap.scause = CAUSE_LOAD_ACCESS;
>> +        break;
>> +
>> +    case CAUSE_STORE_GUEST_PAGE_FAULT:
>> +        utrap.scause = CAUSE_STORE_ACCESS;
>> +        break;
>> +
>> +    default:
>> +        domain_crash(current->domain, "Impossible cause (%#lx) in %s?\n",
>> +                     gf->cause, __func__);
>> +        return;
>> +    }
>> +
>> +    utrap.sepc = gf->regs->sepc;
>> +    utrap.stval = gf->stval;
> 
> Would there be anything wrong with putting these in utrap's initializer?

It could be initializers. I will use utrap's initializer.

> 
>> +    trap_redirect(&utrap);
>> +}
>> +
>> +void handle_guest_page_fault(struct cpu_user_regs *regs, unsigned long cause)
>> +{
>> +    struct guest_fault gf = {
>> +        .regs = regs,
>> +        .cause = cause,
>> +        .htinst = csr_read(CSR_HTINST),
>> +        .htval = csr_read(CSR_HTVAL),
>> +        .stval = csr_read(CSR_STVAL),
>> +        .gpa = INVALID_PADDR,
>> +    };
> 
> At some point RISC-V code will (very likely) also be scanned for Misra violations.
> The csr_read()s here violate rule 13.1 ("Initializer lists shall not contain
> persistent side effects"), and I think it would be better if such was avoided from
> the start.

I will do the following then:

struct guest_fault gf = {
     .regs = regs,
     .cause = cause,
     .gpa = INVALID_PADDR,
};
int rc;

gf.htinst = csr_read(CSR_HTINST);
gf.htval = csr_read(CSR_HTVAL);
gf.stval = csr_read(CSR_STVAL);

> 
>> +    int rc;
>> +
>> +    /*
>> +     * A guest-page fault may arise due to an implicit memory access during
>> +     * first-stage (VS-stage) address translation, in which case a guest
>> +     * physical address written to htval is that of the implicit memory
>> +     * access that faulted - for example, the address of a VS-level page
>> +     * table entry that could not be read. (The guest physical address
>> +     * corresponding to the original virtual address is unknown when
>> +     * VS-stage translation fails to complete)
>> +     *
>> +     * In such cases htinst reports one of the pseudoinstructions recognized
>> +     * by htinst_is_pseudo(), and the fault requires separate handling (since
>> +     * G-stage translation failed on an unpopulated/unmapped guest physical
>> +     * address during a hardware page-table walk). To match bare hardware
>> +     * behavior, we must inject an access fault of the ORIGINAL access type
>> +     * (Instruction, Load, or Store/AMO) that initiated the address
>> +     * translation.
>> +     */
>> +    if ( htinst_is_pseudo(gf.htinst) )
>> +    {
>> +        inject_access_fault(&gf);
>> +
>> +        return;
>> +    }
> 
> I.e. you imply that guests won't put their page tables in MMIO? That's
> fragile imo; I have seen OSes to use video frame buffers for all kinds
> of (transient) purposes, for example.

I think it is okay for now and if it will a real use case then an update 
of this code will be needed.

> 
>> +    resolve_faulting_gpa(&gf);
> 
> Since the function is only a stub right now - how is one to tell whether
> this indeed can never fail?

It can't be tell. But what is wrong if it could fail? (Actually with 
current implementation introduced in later patches you can find it can 
fail if a necessary extension or software page walk isn't introduced).

If we can't resolve faulting GPA address then we can't continue to work 
and so at least domain should be crashed.

> 
>> +    switch ( cause )
>> +    {
>> +    case CAUSE_LOAD_GUEST_PAGE_FAULT:
>> +        rc = emulate_load(&gf);
>> +        break;
>> +
>> +    case CAUSE_STORE_GUEST_PAGE_FAULT:
>> +        rc = emulate_store(&gf);
>> +        break;
>> +
>> +    case CAUSE_FETCH_GUEST_PAGE_FAULT:
>> +        /*
>> +         * Guest is trying to reach unmapped/unpopulated or G-stage PTE doesn't
>> +         * allow execution (X=0). Generate fetch fault in this case.
>> +         */
> 
> Is there perhaps a comma missing before "or", to help parsing the sentence?

I will add one.

> 
>> +        inject_access_fault(&gf);
>> +        rc = 0;
>> +        break;
> 
> Simply "return" instead of the latter two statements?

It makes sense. I will do just return.

Thanks.

~ Oleksii

