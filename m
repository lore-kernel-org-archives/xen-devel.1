Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68663606A31E
	for <xen-devel@archiver.kernel.org>; Tue, 20 Oct 2026 15:00:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=vates.tech header.i=@vates.tech header.a=rsa-sha256 header.s=selector1 header.b=aXAO3BeF
Received: from list by lists.xenproject.org with outflank-mailman.1455963.1669582 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xJBJu-0001Fj-Is; Tue, 20 Oct 2026 15:00:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1455963.1669582; Tue, 20 Oct 2026 15:00:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xJBJu-0001Fb-Em; Tue, 20 Oct 2026 15:00:06 +0000
Received: by outflank-mailman (input) for mailman id 1455963;
 Tue, 20 Oct 2026 15:00:05 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xJBJs-0000xf-V2
 for xen-devel@lists.xenproject.org; Tue, 20 Oct 2026 15:00:05 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xJBJs-00DbyY-Bb
 for xen-devel@lists.xenproject.org; Tue, 20 Oct 2026 17:00:04 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a159d35ad4000f79f@swg.vates.tech>)
 id 6ad781dc-bab6-0a2a0a5309dd-0a2a4502e3c2-42
 for <xen-devel@lists.xenproject.org>; Tue, 20 Oct 2026 17:00:04 +0200
Received: from [185.255.28.34] (helo=prod-mta-13-01.swg-srv.net)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a159d35ad4000f79f@swg.vates.tech>)
 id 6ad781eb-6ca4-0a2a45020019-b9ff1c22a9f3-4
 for <xen-devel@lists.xenproject.org>; Tue, 20 Oct 2026 16:59:58 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-01.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a159d35ad4000f79f.007 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 20 Oct 2026 14:59:46 +0000
Received: from [10.235.238.14] (149.173.185.81.rev.sfr.net [81.185.173.149])
 (Authenticated sender: baptiste.le-duc)
 by mail2.vates.fr (Postfix) with ESMTPSA id 774BC82C90;
 Tue, 20 Oct 2026 16:59:44 +0200 (CEST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=vates.tech header.i="@vates.tech" header.h="From:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:References:Feedback-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech;
 q=dns/txt; s=selector1; bh=sDhhZ7pFmzaASXZhR5+nszPfCqaYsEK5PHtvzy4QOM4=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:content-transfer-encoding:in-reply-to:references:feedback-id;
 b=aXAO3BeFAoo9Uym1c/txZeb0gJaZDDPTXV+2WuoKBZoKYasdSDfqCqu07gFM9Mp+fDs/7u1V0
 U9hpnfxcnISzjGE8CFBq4raua1vYForRcLAGc17dpLlVIACk2xxw1hIlkxiHzBMtliVfw/a/NsV
 zhHPezBhwd2roATIaOsgO627X9pFb9FVL4PdLPMnVXBoJrwb4S1DwkvcoH7SU22s+Tm+oL73+FI
 AWRWnpLVQ/LKDSk8NBmSwmv6RS0L13+3L30gYwohplT8GG0PhHlR2OEuQ3g918QEN9lKApDBmfz
 o7Q2bBfLHl2KBT4Rbn5p35gNtaWtxT/yrLFt5DZJttdQ==
X-Zone-Loop: 1fd6766763a6c1dff26645eec6bcea1cf429f7a37a43
x-campaign-type: default
x-transaction-id: 706d827d-b7c1-43ae-ba1f-56376516fe72
x-swg-uid: 01-f494aace-7d69-44df-96ae-47f3484f2789
X-Mailer: Sweego
Message-ID:
 <1792508386.8631fc262581453bbf619ec5b2062170.1a159d35ad4000f79f@vates.tech>
x-swg-bid: 1792508386.8631fc262581453bbf619ec5b2062170.1a159d35ad4000f79f
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v3 17/39] xen/riscv: add guest page fault handling stub
From: Baptiste Le Duc <baptiste.le-duc@vates.tech>
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: xen-devel@lists.xenproject.org, 
 Romain Caritey <Romain.Caritey@microchip.com>, 
 Baptiste Le Duc <baptiste.le-duc@vates.tech>, 
 Zheng Zhang <zhangzheng@iscas.ac.cn>, 
 Alistair Francis <alistair.francis@wdc.com>, 
 Connor Davis <connojdavis@gmail.com>, 
 Andrew Cooper <andrew.cooper3@citrix.com>, 
 Anthony PERARD <anthony.perard@vates.tech>, 
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, 
 Julien Grall <julien@xen.org>, 
 =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>, 
 Stefano Stabellini <sstabellini@kernel.org>
In-Reply-To: <42d1a37341eadd764022a1658bebcffcee15238a.1790779209.git.oleksii.kurochko@gmail.com>
References: <cover.1790779209.git.oleksii.kurochko@gmail.com>
 <42d1a37341eadd764022a1658bebcffcee15238a.1790779209.git.oleksii.kurochko@gmail.com>
Date: Tue, 20 Oct 2026 16:59:35 +0200
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792508376; l=7620;
 i=baptiste.le-duc@vates.tech; s=20260810; h=from:subject:message-id;
 bh=Suw3T89BcxjO9wuu5jNLZD25Lxs9IE9fLqsi4tiiCLE=;
 b=MybGBe1FeJbkiUer4aLzLDjVFCD6yo43Oeta8FheSSAn8oyRFZ2v6HXtvUUAdM28mRCXmBgsk
 17S6hX0b6zEAivCZKVsVMyre2VGslb1A05N7CEOJ8/5eS6GoiWMLWCd
X-Developer-Key: i=baptiste.le-duc@vates.tech; a=ed25519;
 pk=N+BbdvMXRzrCuX/ieh4RWodiAKcLNvI+KjflcZ0oXCo=
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1792508385603
X-purgate-ID: tlsNG-720697/1792508398-F1EAB2AC-4F20F604/10/73395122804
X-purgate-type: spam
X-purgate-size: 7620
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

> Add a handler for guest page faults and hook it into the trap path,
> providing the trap-side entry point which will later feed the MMIO
> dispatch.
> 
> This will be used, for example, to trap accesses to APLIC registers so
> that a guest can initialize and drive an emulated interrupt controller.
> 
> A G-stage (stage-2) fault has one of three causes, reported via scause:
> - Fetch fault: guest tried to execute from a guest-physical address
>   that is unmapped or that G-stage marks non-executable. Never
>   emulatable (nothing to emulate a fetch into). On real hardware
>   this raises an instruction access fault, so Xen reflects the same
>   fault back to the guest. Decided here.
> 
> - Load fault / Store fault: left undecided by this patch, this is
>   where MMIO emulation will hook in later.
Nit: should drop "in later" as it would be stale in the future. I'd
suggest:
  - Load fault / Store fault: this is where MMIO emulation will hook.
    Not in scope of this patch.

> 
> Any of these three faults can instead be reported via a pseudoinstruction
> in htinst, when both:
> 
> (a) the fault occurred on an implicit access Xen made to walk a
>     VS-stage page table, and
Xen doesn't access the VS-stage page tables here: the implicit access is
done by the hardware page-table walker, while translating a guest access
through the guest's VS-stage page tables. I'd suggest to use spec's
wording. Moreover, "and" is not needed between both conditions as you said
above "when both" which already indicates that both should be true.

Here is a proposition:
```
    Any of these three faults can instead be reported via a
    pseudoinstruction in htinst, when both:
        (a) the fault is caused by an implicit memory access for VS-stage
            address translation.
        (b) htval holds a nonzero value: the guest-physical address of that
            VS-stage PTE, not of the guest's original access.
```
> 
> However, none of these paths consult the p2m first, and the future MMIO path
> won't either: RISC-V has no populate-on-demand, no paging, and no
> mem_access, so every guest mapping is established eagerly. A G-stage
> fault therefore never indicates a mapping Xen could lazily resolve to
> let the access complete.
> 
> resolve_faulting_gpa() is a stub which always fails for now, so any guest
> page fault other than one taken on an implicit access for VS-stage
> translation currently crashes the domain. That one is reflected to the
> guest through trap_redirect(), which is still a BUG_ON() placeholder
> though, and so takes the host down. This is no worse than before this
> patch, where these traps fell through to do_unexpected_trap() and die().
> 
> Cache the "trap came from the guest" test in a local, as the guest page
> fault case needs it too.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> +    default:
> +        domain_crash(current->domain, "Impossible cause (%#lx) in %s?\n",
> +                     gf->cause, __func__);
Nit: please drop __func__, the message is unique enough to find where it
comes from.

> +        return;
> +    }
> +
> +    trap_redirect(&utrap);
> +}
> +
> +void handle_guest_page_fault(struct cpu_user_regs *regs, unsigned long cause)
> +{
> +    struct guest_fault gf = {
> +        .regs = regs,
> +        .cause = cause,
> +        .gpa = INVALID_PADDR,
> +    };
> +    int rc;
> +
> +    gf.htinst = csr_read(CSR_HTINST);
> +    gf.htval = csr_read(CSR_HTVAL);
> +    gf.stval = csr_read(CSR_STVAL);
> +
> +    /*
> +     * A guest-page fault may arise due to an implicit memory access during
> +     * first-stage (VS-stage) address translation, in which case a guest
> +     * physical address written to htval is that of the implicit memory
> +     * access that faulted - for example, the address of a VS-level page
> +     * table entry that could not be read. (The guest physical address
> +     * corresponding to the original virtual address is unknown when
> +     * VS-stage translation fails to complete)
Nit: I think this paragraph could be re-written by using what you said
in the commit message.
```
    htinst reports one of the special pseudoinstruction values when both:
      (a) the fault is caused by an implicit memory access for VS-stage
          address translation
      (b) htval holds a nonzero value: the guest physical address of that
          VS-stage PTE, not of the guest's original access, which is
          unknown as VS-stage translation didn't complete.

    No access to emulate then: to match bare hardware behavior, inject an
    access fault of the ORIGINAL access type (Instruction, Load, or
    Store/AMO) that initiated the address translation.
```

> +     *
> +     * In such cases htinst reports one of the pseudoinstructions recognized
> +     * by htinst_is_pseudo(), and the fault requires separate handling (since
> +     * G-stage translation failed on an unpopulated/unmapped guest physical
> +     * address during a hardware page-table walk). To match bare hardware
> +     * behavior, we must inject an access fault of the ORIGINAL access type
> +     * (Instruction, Load, or Store/AMO) that initiated the address
> +     * translation.
> +     *
> +     * FIXME: This assumes that guest page tables never reside in an emulated
> +     * MMIO region, i.e. that an implicit access faulting at G-stage always
> +     * targets an unpopulated GPA. Guests may (even transiently) place page
> +     * tables in MMIO-backed memory, e.g. a video frame buffer. Supporting
> +     * that would require walking the VS-stage page tables in software,
> +     * accessing the PTEs (including A/D updates) through the MMIO handlers,
> +     * and then emulating the original access, instead of injecting a fault.
> +     */
> +    if ( htinst_is_pseudo(gf.htinst) )
> +    {
> +        inject_access_fault(&gf);
> +
> +        return;
> +    }
> +
> +    rc = resolve_faulting_gpa(&gf);
> +    if ( rc )
> +        goto out;
> +
> +    switch ( cause )
> +    {
> +    case CAUSE_LOAD_GUEST_PAGE_FAULT:
> +        rc = emulate_load(&gf);
> +        break;
> +
> +    case CAUSE_STORE_GUEST_PAGE_FAULT:
> +        rc = emulate_store(&gf);
> +        break;
> +
> +    case CAUSE_FETCH_GUEST_PAGE_FAULT:
> +        /*
> +         * Guest is trying to reach unmapped/unpopulated, or G-stage PTE doesn't
> +         * allow execution (X=0). Generate fetch fault in this case.
> +         */
> +        inject_access_fault(&gf);
> +        return;
> +
> +    default:
> +        ASSERT_UNREACHABLE();
> +        rc = -EOPNOTSUPP;
> +
> +        break;
> +    }
> +
> + out:
> +    if ( rc )
> +        domain_crash(current->domain,
> +                     "%s: unable to handle guest page fault (cause=%#lx) at gpa %#"PRIpaddr"\n",
> +                     __func__, cause, gf.gpa);
Probably __func__ can be dropped as the message is unique enough.

> +}
> diff --git a/xen/arch/riscv/traps.c b/xen/arch/riscv/traps.c
> @@ -193,6 +194,7 @@ void do_trap(struct cpu_user_regs *cpu_regs)
>  {
>      register_t pc = cpu_regs->sepc;
>      unsigned long cause = csr_read(CSR_SCAUSE);
> +    bool from_guest = cpu_regs->hstatus & HSTATUS_SPV;
> @@ -275,3 +289,9 @@ enum mc_disposition arch_do_multicall_call(struct mc_state *state)
> +
> +/* Redirect trap to Guest. */
This duplicates the comment on the prototype in traps.h, so I'd drop it
here.

-- 
Baptiste Le Duc <baptiste.le-duc@vates.tech>

