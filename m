Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBF18606A31C
	for <xen-devel@archiver.kernel.org>; Wed, 28 Oct 2026 17:25:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=vates.tech header.i=@vates.tech header.a=rsa-sha256 header.s=selector1 header.b=YuYUk+sk
Received: from list by lists.xenproject.org with outflank-mailman.1463518.1674402 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xM7Oy-0006oB-Ce; Wed, 28 Oct 2026 17:25:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1463518.1674402; Wed, 28 Oct 2026 17:25:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xM7Oy-0006o4-9W; Wed, 28 Oct 2026 17:25:28 +0000
Received: by outflank-mailman (input) for mailman id 1463518;
 Wed, 28 Oct 2026 17:25:27 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a1838b89ef000f79f@swg.vates.tech>)
 id 1xM7Ow-0006nd-Up
 for xen-devel@lists.xenproject.org; Wed, 28 Oct 2026 17:25:27 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xM7Ow-00379L-Bm
 for xen-devel@lists.xenproject.org; Wed, 28 Oct 2026 18:25:26 +0100
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a1838b89ef000f79f@swg.vates.tech>)
 id 6ae23006-2eae-0a2a0a5409dd-0a2a4502b82a-2
 for <xen-devel@lists.xenproject.org>; Wed, 28 Oct 2026 18:25:26 +0100
Received: from [185.255.28.35] (helo=prod-mta-13-02.swg-srv.net)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a1838b89ef000f79f@swg.vates.tech>)
 id 6ae23005-6ca4-0a2a45020019-b9ff1c23b11f-3
 for <xen-devel@lists.xenproject.org>; Wed, 28 Oct 2026 18:25:26 +0100
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-02.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a1838b89ef000f79f.007 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 28 Oct 2026 17:25:22 +0000
Received: from [192.168.1.37] (lfbn-gre-1-371-96.w90-112.abo.wanadoo.fr
 [90.112.87.96]) (Authenticated sender: baptiste.le-duc)
 by mail2.vates.fr (Postfix) with ESMTPSA id B3D91805F9;
 Wed, 28 Oct 2026 18:25:21 +0100 (CET)
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
 q=dns/txt; s=selector1; bh=sB4Of0MUQGjCyjXcJc7KE46pacPRIuyqQ8KXG8IOShE=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:content-transfer-encoding:in-reply-to:references:feedback-id;
 b=YuYUk+skgAuCnam0bsTX76gZgntJNU91Jr+Uf8U40gD7LPLr2zzdKKMtLuY5pi5YZ42b+/58t
 FISKF19eWZ4FymS5iq/tQtIGQ7Di5J4Q9LyrC+n+KTxP3/0OkdzW1xRylcyEeFa8lt4zw0kbqGH
 IUU4uO013G29dL/zw1EF4O582+lgjHcpy6097BwzdkqLaSkSPhTiriGunjc6UdAOfycDWeXRJvW
 wnyh+Zfa17ImBqPweuTJlKS/+rUbbvseBKSHsW04K3aqGj8CdP5uBEqZZuPAaxNa9NVmBTlErxl
 +e/RZhWffEsXCxsJYdyG3kVTTv2+fkk07+l6v5UKPC0g==
X-Zone-Loop: ff594859417a5ed8bb58a98d07930a10bcd16976d26b
x-campaign-type: default
x-transaction-id: 138f977f-de93-48c8-9f3e-85d4e8df8ed7
x-swg-uid: 01-88285f22-b3db-4527-b758-7f0be3368d89
X-Mailer: Sweego
Message-ID:
 <1793208322.8631fc262581453bbf619ec5b2062170.1a1838b89ef000f79f@vates.tech>
x-swg-bid: 1793208322.8631fc262581453bbf619ec5b2062170.1a1838b89ef000f79f
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v10 1/1] xen/riscv: probe the A/D update scheme if the
 DT advertises neither
From: Baptiste Le Duc <baptiste.le-duc@vates.tech>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Baptiste Le Duc <baptiste.le-duc@vates.tech>, 
 xen-devel@lists.xenproject.org, Anthony PERARD <anthony.perard@vates.tech>, 
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, 
 Julien Grall <julien@xen.org>, 
 =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>, 
 Stefano Stabellini <sstabellini@kernel.org>, 
 Alistair Francis <alistair.francis@wdc.com>, 
 Connor Davis <connojdavis@gmail.com>, 
 Oleksii Kurochko <oleksii.kurochko@gmail.com>, 
 Zheng Zhang <zhangzheng@iscas.ac.cn>
In-Reply-To: <35fa29d5-fafc-43da-a5a5-72df8f367e3c@citrix.com>
References: <1793192679.8631fc262581453bbf619ec5b2062170.1a1829cd6d5000f79f@vates.tech>
 <1793192757.8631fc262581453bbf619ec5b2062170.1a1829e0a63000f79f@vates.tech>
 <35fa29d5-fafc-43da-a5a5-72df8f367e3c@citrix.com>
Date: Wed, 28 Oct 2026 18:25:16 +0100
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793208316; l=5839;
 i=baptiste.le-duc@vates.tech; s=20260810; h=from:subject:message-id;
 bh=1BinobBn/f1f9ULsMCPNN+bhYZDJFVHU6GJQjxxDJYQ=;
 b=9k9/UbrSt/gVOEBGfGfogF/hIIcvcwGX2duefQ9j8+aDwcQZReRdpdDhDR7EzGX6d9V3MF2M/
 GD46gkqSuJmDV46O/SiORSorVFLL2SS8nSN0Fe9xcLoGUXwJ5saNDlI
X-Developer-Key: i=baptiste.le-duc@vates.tech; a=ed25519;
 pk=N+BbdvMXRzrCuX/ieh4RWodiAKcLNvI+KjflcZ0oXCo=
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1793208321930
X-purgate-ID: tlsNG-720697/1793208326-30DC12AC-745F2266/0/0
X-purgate-type: clean
X-purgate-size: 5839
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 2026-10-28 14:24 +0000, Andrew Cooper wrote:
> On 28/10/2026 1:05 pm, Baptiste Le Duc wrote:
> > diff --git a/xen/arch/riscv/cpufeature.c b/xen/arch/riscv/cpufeature.c
> > index 3d5bbd2228..83d3bc5ddc 100644
> > --- a/xen/arch/riscv/cpufeature.c
> > +++ b/xen/arch/riscv/cpufeature.c
> > @@ -630,6 +632,53 @@ const char *get_guest_isa_str(void)
> >      return guest_isa_str;
> >  }
> >  
> > +/*
> > + * Probe whether hardware updates the PTE A/D bits by reading through an alias
> > + * mapping whose A and D bits are clear. Observing A set, even by a speculative
> > + * access, implies Svadu, as Svade only allows A to be set by software.
> > + *
> > + * Under Svade, the read raises a page fault instead, so use the extable to
> > + * handle it.
> 
> This is an internal detail, which can be covered by an internal comment.
> 
> > + */
> > +static bool __init probe_hw_ad_update(void)
> > +{
> > +    vaddr_t va = FIXMAP_ADDR(FIX_MISC);
> > +    pte_t *entry = &xen_fixmap[FIX_MISC];
> > +    bool a_set = false;
> > +
> > +    ASSERT(!pte_is_valid(*entry));
> > +
> > +    /*
> > +     * set_fixmap() can't be used, as pt_update_entry() always sets A and D.
> > +     *
> > +     * A and D belong to the PTE, not to the page, so a new PTE with A and D
> > +     * clear can point to any RAM page, whatever its other mappings. Use the
> > +     * first page of the Xen image, and map it read-only so that Xen can't be
> > +     * corrupted through this alias.
> 
> The function comment is mostly ok, but this one is misleading, not least
> because it talks about corruption despite this being a read operation. 
> All you need to say here is:
> 
> /* Opencode set_fixmap() to intentionally leave A/D clear. */
> 
> 
> > +     */
> > +    write_pte(entry, pte_from_mfn(maddr_to_mfn(virt_to_maddr(_start)),
> 
> pte_from_mfn(virt_to_mfn(_start))
I didn't use that, as it would require adding
```
    /* Override macros from asm/page.h to make them work with mfn_t */
    #undef virt_to_mfn
    #define virt_to_mfn(v) _mfn(__virt_to_mfn(v))
```
as other archs do. But if you think it's worth it for a single usage, then
I could do it.

> 
> > +                                  PTE_VALID | PTE_READABLE));
> > +    flush_tlb_one_local(va);
> > +
> 
> /* Read from the alias, handling pagefault */
Will apply that in v11.
> 
> > +    asm_inline goto (
> > +        "1: lw zero, 0(%[va])\n"
> > +        ASM_EXTABLE(1b, %l[out])
> > +        :
> > +        : [va] "r" (va)
> > +        : "memory"
> > +        : out );
> > +
> > +    /* Order the load, and so its A bit update, before reading the PTE */
> 
> /* Check to see if hardware set A. */
It doesn't explain the fence, but mine doesn't either. If you think it
doesn't matter, then I will use what you propose in v11.
> 
> > +    RISCV_FENCE(r, r);
> > +    a_set = read_pte(entry).pte & PTE_ACCESSED;
> > +
> > + out:
> 
> It's better to name this label 'fault' because that's what happened to
> use it.
> 
> What happens if you neither fault, and A doesn't get set?  Right now
> you'll report Svade despite there being no fault.
I don't know if such a case is allowed by the spec, but afaiu, and we
talked a lot about that with Jan B and Oleksii, if we don't fault then
we should report Svade.
> 
> You might or might not care to cover this case; that's up to the RISC-V
> maintainers as to how likely it is to encounter in real life.
I'm waiting for Jan B's and Oleksii's opinion on that point.
> 
> But, if you do want to handle it, then you want something like
> 
>     asm goto (...);
> 
>     if ( 0 )
>     {
>     fault:
>         got_fault = true;
>     }
> 
>     ...
> 
>     if ( !got_fault && !a_set )
>         panic("Neither Svade nor Svadu !?!\n");
> 
> 
> The if (0) is a bit ugly but it's the only way to avoid needing a second
> label.  
> 
> > +    write_pte(entry, (pte_t){});
> > +    flush_tlb_one_local(va);
> > +
> > +    return a_set;
> > +}
> > +
> >  void __init riscv_fill_hwcap(void)
> >  {
> >      unsigned int i;
> > @@ -674,6 +723,28 @@ void __init riscv_fill_hwcap(void)
> >                 "Zihintpause unavailable: cpu_relax() gives the CPU no hint; "
> >                 "wire up this platform's pause equivalent in cpu_relax()\n");
> >  
> > +    /*
> > +     * The privileged spec allows exactly two schemes for updating the PTE A
> > +     * and D bits:
> > +     *  1) hardware sets them on access and on write;
> > +     *  2) accessing a page whose A and/or D bit is clear raises a page fault,
> > +     *     so that software can set them (ratified as Svade).
> > +     *
> > +     * Every implementation uses one of them, but may predate the extensions
> > +     * and advertise neither. In that case, trust the hardware probe.
> > +     */
> > +    if ( !riscv_isa_extension_available(NULL, RISCV_ISA_EXT_svade) &&
> > +         !riscv_isa_extension_available(NULL, RISCV_ISA_EXT_svadu) )
> > +    {
> > +        bool hw_update = probe_hw_ad_update();
> > +
> > +        __set_bit(hw_update ? RISCV_ISA_EXT_svadu : RISCV_ISA_EXT_svade,
> > +                  riscv_isa);
> > +        printk(XENLOG_WARNING
> > +               "Device tree advertises neither Svade nor Svadu, probed %s: add it to \"riscv,isa\"\n",
> > +               hw_update ? "svadu" : "svade");
> 
> This is overly verbose, including details that absolutely shouldn't be
> the boot log.
> 
> "Neither Svade nor Svadu in Device Tree - probed as %s\n"
I agree with Jan on the point that it doesn't give any hint to the user.
What do you think of this shorter version:
"Svade/Svadu missing from \"riscv,isa\" - probed as %s\n"

-- 
Baptiste Le Duc <baptiste.le-duc@vates.tech>

