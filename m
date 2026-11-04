Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12CD7606A32C
	for <xen-devel@archiver.kernel.org>; Wed,  4 Nov 2026 11:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EImNaH9G
Received: from list by lists.xenproject.org with outflank-mailman.1471719.1679948 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOZFc-0005fJ-Io; Wed, 04 Nov 2026 11:33:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1471719.1679948; Wed, 04 Nov 2026 11:33:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOZFc-0005fC-Fj; Wed, 04 Nov 2026 11:33:56 +0000
Received: by outflank-mailman (input) for mailman id 1471719;
 Wed, 04 Nov 2026 11:33:55 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xOZFb-0005f6-42
 for xen-devel@lists.xenproject.org; Wed, 04 Nov 2026 11:33:55 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOZFa-00A62d-Gm
 for xen-devel@lists.xenproject.org; Wed, 04 Nov 2026 12:33:54 +0100
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6aeb1816-2eae-0a2a0a5409dd-0a2a4503d82e-20
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 12:33:54 +0100
Received: from [209.85.221.45] (helo=mail-wr1-f45.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6aeb1822-fae8-0a2a45030019-d155dd2dd878-3
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 12:33:54 +0100
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-490c1d337d8so23835f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 03:33:54 -0800 (PST)
Received: from [192.168.1.6] (user-109-243-146-71.play-internet.pl.
 [109.243.146.71]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48feda2007esm3354133f8f.47.2026.11.04.03.33.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Nov 2026 03:33:53 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20260707 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793792034; x=1794396834; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3zDMyA4rVT7YPhbltgk8jepE5SDB7NJpRffzDpRyBOE=;
        b=EImNaH9GjBY2udj+CD0Q/3KK/TqS2LVSGWlYpuz5TY0wIgj3+4leorkAWa6oocKghW
         Xpxf9+ZpCxDW5vT/OYnl5G5GQB2Lbz5yHKNZCX8v6cc/j4IparmQmSCz5ETEyJiusdkp
         +MGTzSfTNO389dvK7OFz+pxUesEsWIMqUcYuEg8Ct1j2QxTx4YfWN/vXiFi/523midxw
         ZrgFYxKg8VqNXBwoF3QtKEc+thhMUn5oM2rsKi9wZ7qT8dQtpJb66Cwz3aIFJIwPIABE
         k2aKO+GiWzjDvuwRxjmUxeG9tOaJLbBy/J/2DtHGhQkKLQvvIT2fEZUfEdkVIY7hpU5Y
         1vbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793792034; x=1794396834;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3zDMyA4rVT7YPhbltgk8jepE5SDB7NJpRffzDpRyBOE=;
        b=pPLkNMJeC0rvVjgVkWUmlN/PtWPL59N8vV/3SWrZZ/69UgdpnRNCyD0olHpMP5HnzF
         9FP4dEJyqg3Qk/7aGKr5Abc68y90TC16H+7FokhQw5KFQBSnPUDPpPhJDCWz/vRhVNJz
         M0OqgA/U3FV6VoCRCds/aQZlgSo+i2Tknu4LATPPYTzjIjvox7soMdsVc8dbCMGMexbQ
         6R400NYZ2ikVuiARLTOEKbBscI03un583l1fAZdV+apgJRfUkux/waxIYra/IdQCzPRX
         6FYbhklfOoyVrK9C7i2a8EGTFzzsnyH0zHiJHTxaeYMCpeZGFqqn8X/aQgjhEgsU/xln
         /TsA==
X-Gm-Message-State: APuU4Z/5bTsknG4AerXfpITWGyjtdRsc5FWe89S5i7cEdO4kfCLEgtEj
	3xeoBO35nohniC96HmGANX0fDylvvrchOHph1b/NgsffPrK80bb1R0VA
X-Gm-Gg: AYBFou1xqVzhf2aqfA3p9nJClZt97d4rLSIe/5QmETAuVKOgBGXcc4ryk86cLfNyF9D
	bTildGyiAhL6hv8mIywJE1sonSgu0+3/bnmx+u5EZHabNuv/YDRRv7iF5rGx1WIU+XqlwpC9iwj
	MHX0RiJflaSSbzCU7bUudGzlog/m3NAfdoTD3xyaF/YoGiSXfhBYNZioOIZlOqoBUc5/gL4m6lw
	OvjAT+qWJZh4HarqDjYI7mf+9vua3Oz+rX0XG3TFRcH4H0kfoxUCXjuqarDiY8TsU5cq0qirr8k
	5LM1RVO1m3FGPWvkAeM5etPSbZlDUSkNfjnwNE4wdLp8tlAt6U86IGmtzLhnJsijK3uDbyHbsK/
	o4v3zqQoVhrMx2yd5ZBV4K4UXp2cEdlof5o1uZho599tnyosvv/o8RzZjK4BqoFhqZCM0X0c+7a
	VFopWwTDOsar2v9KebNGGMGTQJnDXhLHBBQfa74chr2bhr35dqINpZB0OQ5owaDu53g7s6j7QgY
	nVyugfRcZyOnDaf8zPeD33MLdfhWxvXR6X5yCyD3TyKdgKqXY8/0j8WncEAQodGjvaPQcwuqZ97
	kDgKjVJMwAyHkuX2WShVHYD/+xWka1nGt/hkmJy45TtONLs5vDP7wxlA1LL0Fi4M0KdvYZfeTr6
	kYuc=
X-Received: by 2002:a5d:64e7:0:b0:48e:17d1:16c9 with SMTP id ffacd0b85a97d-48e6e4f5652mr33870451f8f.40.1793792033715;
        Wed, 04 Nov 2026 03:33:53 -0800 (PST)
Message-ID: <0c5c754a-e072-4c95-9adb-85ad4ce5fddf@gmail.com>
Date: Wed, 4 Nov 2026 12:33:51 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 17/39] xen/riscv: add guest page fault handling stub
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
 <42d1a37341eadd764022a1658bebcffcee15238a.1790779209.git.oleksii.kurochko@gmail.com>
 <1792508386.8631fc262581453bbf619ec5b2062170.1a159d35ad4000f79f@vates.tech>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <1792508386.8631fc262581453bbf619ec5b2062170.1a159d35ad4000f79f@vates.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-33051d/1793792034-6C8DD4E9-57397E9B/10/73395122804
X-purgate-type: spam
X-purgate-size: 8542
X-Spam-Status: No, score=-13.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FORGED_GMAIL_RCVD,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 10/20/26 4:59 PM, Baptiste Le Duc wrote:
>> Add a handler for guest page faults and hook it into the trap path,
>> providing the trap-side entry point which will later feed the MMIO
>> dispatch.

Based on your comments below I will update here to:

  Add a handler for guest page faults and hook it into the trap path,
-providing the trap-side entry point which will later feed the MMIO
-dispatch.
+providing the trap-side entry point for the MMIO dispatch.

>>
>> This will be used, for example, to trap accesses to APLIC registers so
>> that a guest can initialize and drive an emulated interrupt controller.
>>
>> A G-stage (stage-2) fault has one of three causes, reported via scause:
>> - Fetch fault: guest tried to execute from a guest-physical address
>>    that is unmapped or that G-stage marks non-executable. Never
>>    emulatable (nothing to emulate a fetch into). On real hardware
>>    this raises an instruction access fault, so Xen reflects the same
>>    fault back to the guest. Decided here.
>>
>> - Load fault / Store fault: left undecided by this patch, this is
>>    where MMIO emulation will hook in later.
> Nit: should drop "in later" as it would be stale in the future. I'd
> suggest:
>    - Load fault / Store fault: this is where MMIO emulation will hook.
>      Not in scope of this patch.

I will re-use your option with small remark:

"this is where MMIO emulation *hooks in*. Not in scope of this patch."

'hooks in' instead of 'will hook'.

> 
>>
>> Any of these three faults can instead be reported via a pseudoinstruction
>> in htinst, when both:
>>
>> (a) the fault occurred on an implicit access Xen made to walk a
>>      VS-stage page table, and
> Xen doesn't access the VS-stage page tables here: the implicit access is
> done by the hardware page-table walker, while translating a guest access
> through the guest's VS-stage page tables. I'd suggest to use spec's
> wording. Moreover, "and" is not needed between both conditions as you said
> above "when both" which already indicates that both should be true.
> 
> Here is a proposition:
> ```
>      Any of these three faults can instead be reported via a
>      pseudoinstruction in htinst, when both:
>          (a) the fault is caused by an implicit memory access for VS-stage
>              address translation.
>          (b) htval holds a nonzero value: the guest-physical address of that
>              VS-stage PTE, not of the guest's original access.
> ```
This option better. I will use it.

>>
>> However, none of these paths consult the p2m first, and the future MMIO path
>> won't either: RISC-V has no populate-on-demand, no paging, and no
>> mem_access, so every guest mapping is established eagerly. A G-stage
>> fault therefore never indicates a mapping Xen could lazily resolve to
>> let the access complete.
>>
>> resolve_faulting_gpa() is a stub which always fails for now, so any guest
>> page fault other than one taken on an implicit access for VS-stage
>> translation currently crashes the domain. That one is reflected to the
>> guest through trap_redirect(), which is still a BUG_ON() placeholder
>> though, and so takes the host down. This is no worse than before this
>> patch, where these traps fell through to do_unexpected_trap() and die().
>>
>> Cache the "trap came from the guest" test in a local, as the guest page
>> fault case needs it too.
>>
>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>> +    default:
>> +        domain_crash(current->domain, "Impossible cause (%#lx) in %s?\n",
>> +                     gf->cause, __func__);
> Nit: please drop __func__, the message is unique enough to find where it
> comes from.

Agree, not to much sense. It will be dropped.

> 
>> +        return;
>> +    }
>> +
>> +    trap_redirect(&utrap);
>> +}
>> +
>> +void handle_guest_page_fault(struct cpu_user_regs *regs, unsigned long cause)
>> +{
>> +    struct guest_fault gf = {
>> +        .regs = regs,
>> +        .cause = cause,
>> +        .gpa = INVALID_PADDR,
>> +    };
>> +    int rc;
>> +
>> +    gf.htinst = csr_read(CSR_HTINST);
>> +    gf.htval = csr_read(CSR_HTVAL);
>> +    gf.stval = csr_read(CSR_STVAL);
>> +
>> +    /*
>> +     * A guest-page fault may arise due to an implicit memory access during
>> +     * first-stage (VS-stage) address translation, in which case a guest
>> +     * physical address written to htval is that of the implicit memory
>> +     * access that faulted - for example, the address of a VS-level page
>> +     * table entry that could not be read. (The guest physical address
>> +     * corresponding to the original virtual address is unknown when
>> +     * VS-stage translation fails to complete)
> Nit: I think this paragraph could be re-written by using what you said
> in the commit message.
> ```
>      htinst reports one of the special pseudoinstruction values when both:
>        (a) the fault is caused by an implicit memory access for VS-stage
>            address translation
>        (b) htval holds a nonzero value: the guest physical address of that
>            VS-stage PTE, not of the guest's original access, which is
>            unknown as VS-stage translation didn't complete.
> 
>      No access to emulate then: to match bare hardware behavior, inject an
>      access fault of the ORIGINAL access type (Instruction, Load, or
>      Store/AMO) that initiated the address translation.
> ```

I will use then your option.

> 
>> +     *
>> +     * In such cases htinst reports one of the pseudoinstructions recognized
>> +     * by htinst_is_pseudo(), and the fault requires separate handling (since
>> +     * G-stage translation failed on an unpopulated/unmapped guest physical
>> +     * address during a hardware page-table walk). To match bare hardware
>> +     * behavior, we must inject an access fault of the ORIGINAL access type
>> +     * (Instruction, Load, or Store/AMO) that initiated the address
>> +     * translation.
>> +     *
>> +     * FIXME: This assumes that guest page tables never reside in an emulated
>> +     * MMIO region, i.e. that an implicit access faulting at G-stage always
>> +     * targets an unpopulated GPA. Guests may (even transiently) place page
>> +     * tables in MMIO-backed memory, e.g. a video frame buffer. Supporting
>> +     * that would require walking the VS-stage page tables in software,
>> +     * accessing the PTEs (including A/D updates) through the MMIO handlers,
>> +     * and then emulating the original access, instead of injecting a fault.
>> +     */
>> +    if ( htinst_is_pseudo(gf.htinst) )
>> +    {
>> +        inject_access_fault(&gf);
>> +
>> +        return;
>> +    }
>> +
>> +    rc = resolve_faulting_gpa(&gf);
>> +    if ( rc )
>> +        goto out;
>> +
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
>> +         * Guest is trying to reach unmapped/unpopulated, or G-stage PTE doesn't
>> +         * allow execution (X=0). Generate fetch fault in this case.
>> +         */
>> +        inject_access_fault(&gf);
>> +        return;
>> +
>> +    default:
>> +        ASSERT_UNREACHABLE();
>> +        rc = -EOPNOTSUPP;
>> +
>> +        break;
>> +    }
>> +
>> + out:
>> +    if ( rc )
>> +        domain_crash(current->domain,
>> +                     "%s: unable to handle guest page fault (cause=%#lx) at gpa %#"PRIpaddr"\n",
>> +                     __func__, cause, gf.gpa);
> Probably __func__ can be dropped as the message is unique enough.

Agree with dropping of __func__.

> 
>> +}
>> diff --git a/xen/arch/riscv/traps.c b/xen/arch/riscv/traps.c
>> @@ -193,6 +194,7 @@ void do_trap(struct cpu_user_regs *cpu_regs)
>>   {
>>       register_t pc = cpu_regs->sepc;
>>       unsigned long cause = csr_read(CSR_SCAUSE);
>> +    bool from_guest = cpu_regs->hstatus & HSTATUS_SPV;
>> @@ -275,3 +289,9 @@ enum mc_disposition arch_do_multicall_call(struct mc_state *state)
>> +
>> +/* Redirect trap to Guest. */
> This duplicates the comment on the prototype in traps.h, so I'd drop it
> here.
> 

Agree, it is enough to have the comment only in prototype.

Thanks!

~ Oleksii


