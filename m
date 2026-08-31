Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB617C624C8
	for <xen-devel@archiver.kernel.org>; Mon, 31 Aug 2026 08:18:13 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1403819.1637780 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x0xDO-0008D9-Ov; Mon, 31 Aug 2026 08:18:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1403819.1637780; Mon, 31 Aug 2026 08:18:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x0xDO-0008D2-ML; Mon, 31 Aug 2026 08:18:02 +0000
Received: by outflank-mailman (input) for mailman id 1403819;
 Mon, 31 Aug 2026 08:18:01 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a056e571ab000c4f3@swg.vates.tech>)
 id 1x0xDM-0008Ci-C0
 for xen-devel@lists.xenproject.org; Mon, 31 Aug 2026 08:18:01 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x0xDL-00HILx-97
 for xen-devel@lists.xenproject.org; Mon, 31 Aug 2026 10:17:59 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a056e571ab000c4f3@swg.vates.tech>)
 id 6a9538a0-8faa-0a2a0a5109dd-0a2a4508bc68-38
 for <xen-devel@lists.xenproject.org>; Mon, 31 Aug 2026 10:17:59 +0200
Received: from [185.255.28.18] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a056e571ab000c4f3@swg.vates.tech>)
 id 6a9538b6-f659-0a2a45080019-b9ff1c12a955-3
 for <xen-devel@lists.xenproject.org>; Mon, 31 Aug 2026 10:17:58 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a056e571ab000c4f3.007 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 31 Aug 2026 08:17:52 +0000
Received: from [192.168.1.46] (areims-651-1-80-194.w90-18.abo.wanadoo.fr
 [90.18.187.194]) (Authenticated sender: baptiste.le-duc)
 by mail2.vates.fr (Postfix) with ESMTPSA id B186E83C6B;
 Mon, 31 Aug 2026 10:17:51 +0200 (CEST)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=vates.tech header.i="@vates.tech" header.h="From:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:References:Feedback-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech;
 q=dns/txt; s=selector1; bh=xCIrsy0vk5HdgDHKC9uXE82dHwG+Q4rrwcNwSyd1Z9s=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:content-transfer-encoding:in-reply-to:references:feedback-id;
 b=Ew76q4lZr4FgXNESdI9frQcUd5/tumyLZmdDKkIa+1V/KUGl5R2/TgI/BHQcGyOPl0EoafacH
 L6/kykHEJ7PoYQVBgx9ueUb3c2UuDP5eUB2aV22cowCrwAwhRQ1zk3c3R1a+ilUT4b8qd+iKE1S
 mFGr+7fzJVGqH5GGUnje/IetaExb3222xpjdb0eAtSP4NthHXCbU0pZ0f+33Wo0Yz5cZDIeCocs
 CI9WzO+gda1YoOeetwCRcykDUxkQ18AInWL1Nt175WN9eakM5p8uTa43/JSskNxwHc6l5oiaX2X
 +q/clXXcVwQ37wlGgXWFRv3lAmwwZULiTMUv7sBG+3nA==
X-Zone-Loop: 84ae25ab472b01e7921323f5f3eb26a8bfb44e5fa3c9
x-campaign-type: default
x-transaction-id: 8153bae4-2d92-4a7f-aa83-b213f61506fe
x-swg-uid: 01-26a1e598-47bd-44a5-b1d6-fd4e3740218a
X-Mailer: Sweego
Message-ID:
 <1788164272.8631fc262581453bbf619ec5b2062170.1a056e571ab000c4f3@vates.tech>
x-swg-bid: 1788164272.8631fc262581453bbf619ec5b2062170.1a056e571ab000c4f3
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 1/5] xen/riscv: always set A/D bits at boot time
From: Baptiste Le Duc <baptiste.le-duc@vates.tech>
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Baptiste Le Duc <baptiste.le-duc@vates.tech>, 
 xen-devel@lists.xenproject.org, zhangzheng@iscas.ac.cn, 
 Alistair Francis <alistair.francis@wdc.com>, 
 Connor Davis <connojdavis@gmail.com>, 
 Andrew Cooper <andrew.cooper3@citrix.com>, 
 Anthony PERARD <anthony.perard@vates.tech>, 
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, 
 Julien Grall <julien@xen.org>, 
 =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>, 
 Stefano Stabellini <sstabellini@kernel.org>
In-Reply-To: <caeaf406-6280-4b72-ae94-05da70408ea4@gmail.com>
References: <1787844438.8631fc262581453bbf619ec5b2062170.1a043d52a06000c4f3@vates.tech>
 <1787844808.8631fc262581453bbf619ec5b2062170.1a043dad0d3000c4f3@vates.tech>
 <3adf6ef7-8024-420f-935b-17b142c73256@gmail.com>
 <1787925495.8631fc262581453bbf619ec5b2062170.1a048a9fec2000c4f3@vates.tech>
 <caeaf406-6280-4b72-ae94-05da70408ea4@gmail.com>
Date: Mon, 31 Aug 2026 10:17:46 +0200
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788164271; l=14758;
 i=baptiste.le-duc@vates.tech; s=20260810; h=from:subject:message-id;
 bh=vZLlpkmw7/XH6TvrzQHUULj3rLxHCAqYO56qlISD9Dc=;
 b=sye+EESJzt9vjXOggQA235oK8GG52zOmxhp1rAgaCLT3iUMNKbUZCTsbAxri62NdqDTcqs36u
 fVUfuPFDNjdCZOjQM6mRJ1kjubwjKQUkS1dVuqrMP6xiKVyN4DCIzJT
X-Developer-Key: i=baptiste.le-duc@vates.tech; a=ed25519;
 pk=N+BbdvMXRzrCuX/ieh4RWodiAKcLNvI+KjflcZ0oXCo=
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1788164271934
X-purgate-ID: tlsNG-c1860d/1788164279-CD74B87B-1B2BD176/0/0
X-purgate-type: clean
X-purgate-size: 14762

On 2026-08-28 18:12 +0200, Oleksii Kurochko wrote:
> 
> 
> On 8/28/26 3:58 PM, Baptiste Le Duc wrote:
> > On 2026-08-28 12:59 +0200, Oleksii Kurochko wrote:
> >>
> >>
> >> On 8/27/26 5:33 PM, Baptiste Le Duc wrote:
> >>> Always set the PTE A/D bits at boot time to avoid an unhandled page fault
> >>> on platforms that implement neither Svade nor Svadu, and on platforms that
> >>> declare both in the device tree.
> >>>
> >>> Rewrite the comment to enumerate the four possible Svade/Svadu combinations
> >>> (inspired by [1]) and set A/D unconditionally, which is correct in all four
> >>> cases until Svadu is fully supported (full support requires the SBI FWFT
> >>> call to enable hardware updating of A/D bits).
> >>>
> >>> [1] https://lwn.net/Articles/980016/
> >>>
> >>> Assisted-by: Claude:claude-opus-5
> >>> Signed-off-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>
> >>> ---
> >>>    xen/arch/riscv/p2m.c | 70 ++++++++++++++++++++++++++------------------
> >>>    1 file changed, 42 insertions(+), 28 deletions(-)
> >>>
> >>> diff --git a/xen/arch/riscv/p2m.c b/xen/arch/riscv/p2m.c
> >>> index 1cea86512c..11dc289f0f 100644
> >>> --- a/xen/arch/riscv/p2m.c
> >>> +++ b/xen/arch/riscv/p2m.c
> >>> @@ -591,38 +591,52 @@ static void p2m_set_permission(pte_t *e, p2m_type_t t)
> >>>        e->pte |= PTE_USER;
> >>>    
> >>>        /*
> >>> -     * Two schemes to manage the A and D bits are defined:
> >>> -     *   • The Svade extension: when a virtual page is accessed and the A bit
> >>> -     *     is clear, or is written and the D bit is clear, a page-fault
> >>> -     *     exception is raised.
> >>> -     *   • When the Svade extension is not implemented, the following scheme
> >>> -     *     applies.
> >>> -     *     When a virtual page is accessed and the A bit is clear, the PTE is
> >>> -     *     updated to set the A bit. When the virtual page is written and the
> >>> -     *     D bit is clear, the PTE is updated to set the D bit. When G-stage
> >>> -     *     address translation is in use and is not Bare, the G-stage virtual
> >>> -     *     pages may be accessed or written by implicit accesses to VS-level
> >>> -     *     memory management data structures, such as page tables.
> >>> -     * Thereby to avoid a page-fault in case of Svade is available, it is
> >>> -     * necessary to set A and D bits.
> >>> +     * Svade and Svadu extensions represent two schemes for managing the PTE
> >>> +     * A/D bits. When the PTE A/D bits need to be set, the Svade extension
> >>> +     * indicates that a page fault will be raised. In contrast, the Svadu
> >>> +     * extension supports hardware updating of the PTE A/D bits.
> >>>         *
> >>> -     * TODO: For now, it’s fine to simply set the A/D bits, since OpenSBI
> >>> -     *       delegates page faults to a lower privilege mode and so OpenSBI
> >>> -     *       isn't expect to handle page-faults occured in lower modes.
> >>> -     *       By setting the A/D bits here, page faults that would otherwise
> >>> -     *       be generated due to unset A/D bits will not occur in Xen.
> >>> +     * There are 4 possible combinations of these extensions in the device
> >>> +     * tree. The default hardware behavior for each is:
> >>>         *
> >>> -     *       Currently, Xen on RISC-V does not make use of the information
> >>> -     *       that could be obtained from handling such page faults, which
> >>> -     *       could otherwise be useful for several use cases such as demand
> >>> -     *       paging, cache-flushing optimizations, memory access tracking,etc.
> >>> +     * 1) Neither Svade nor Svadu present in DT => It is technically unknown
> >>> +     *    whether the platform uses Svade or Svadu. Xen should be prepared to
> >>> +     *    handle either hardware updating of the PTE A/D bits or page faults
> >>> +     *    when they need updating. To support both, Xen always sets the 'A' and
> >>> +     *    'D' PTE bits at boot time.
> >>>         *
> >>> -     *       To support the more general case and the optimizations mentioned
> >>> -     *       above, it would be better to stop setting the A/D bits here and
> >>> -     *       instead handle page faults that occur due to unset A/D bits.
> >>> +     * 2) Only Svade present in DT => Xen must assume Svade to be always
> >>> +     *    enabled.
> >>> +     *
> >>> +     * 3) Only Svadu present in DT => Xen must assume Svadu to be always
> >>> +     *    enabled.
> >>> +     *
> >>> +     * 4) Both Svade and Svadu present in DT => Xen must assume Svadu is turned
> >>> +     *    off at boot time by setting A/D bits. To use Svadu, the supervisor
> >>> +     *    must explicitly enable it using the SBI FWFT extension.
> >>> +     *
> >>> +     * The Svade extension is mandatory and the Svadu extension is optional in
> >>> +     * the RVA23 profile. Platforms wanting to take advantage of Svadu can
> >>> +     * choose option 3. Platforms aware of the profile can choose option 4, and
> >>> +     * Linux won't get the benefit of Svadu until the SBI FWFT extension is
> >>> +     * available.
> >>
> >> I have a feeling that the DT-binding-related comment should not be
> >> present here, as it explains when Svadu or Svade should be considered
> >> enabled or disabled. We should perform this kind of detection in
> >> riscv_fill_hwcap() [cpufeature.c]. Then, in p2m_set_permission(), we
> >> should use riscv_isa_extension_available() to determine which extension
> >> is available and, based on that, set the A and D bits.
> >>
> >> At this point, I think the original comment was better, as it simply
> >> explained what Svade and Svadu are and, therefore, provided a better
> >> explanation of why the A and D bits should or should not be set.
> >>
> >> So, my suggestion is the following:
> >>
> >> +/*
> >> + * Svade and Svadu extensions represent two schemes for managing the PTE
> >> + * A/D bits. When the PTE A/D bits need to be set, the Svade extension
> >> + * indicates that a page fault will be raised. In contrast, the Svadu
> >> + * extension supports hardware updating of the PTE A/D bits.
> >> + *
> >> + * There are 4 possible combinations of these extensions in the device
> >> tree.
> >> + * The default hardware behavior for each is:
> >> + *
> >> + * 1) Neither Svade nor Svadu present in DT => It is technically unknown
> >> + *    whether the platform uses Svade or Svadu. Xen should be prepared to
> >> + *    handle either hardware updating of the PTE A/D bits or page
> >> faults when
> >> + *    they need updating. To support both, Xen always sets the 'A' and
> >> 'D' PTE
> >> + *    bits at boot time.
> >> + *
> >> + * 2) Only Svade present in DT => Xen must assume Svade to be always
> >> enabled.
> >> + *
> >> + * 3) Only Svadu present in DT => Xen must assume Svadu to be always
> >> enabled.
> >> + *
> >> + * 4) Both Svade and Svadu present in DT => Xen must assume Svadu is turned
> >> + *    off at boot time by setting A/D bits. To use Svadu, the
> >> supervisor must
> >> + *    explicitly enable it using the SBI FWFT extension.
> >> + *
> >> + * The Svade extension is mandatory and the Svadu extension is optional
> >> in the
> >> + * RVA23 profile. Platforms wanting to take advantage of Svadu can choose
> >> + * option 3. Platforms aware of the profile can choose option 4, and
> >> Xen won't
> >> + * get the benefit of Svadu until the SBI FWFT extension is available.
> >> + *
> >> + * In other words, hardware manages the A/D bits on its own only in case 3;
> >> + * in all the other cases software has to preset them. Instead of open
> >> coding
> >> + * this in every A/D bits user, RISCV_ISA_EXT_svade is used to mean
> >> "software
> >> + * is responsible for the A/D bits" and is set here for the cases 1, 2
> >> and 4.
> >> + */
> >> +static void __init riscv_resolve_ad_scheme(void)
> >> +{
> >> +    bool svade = riscv_isa_extension_available(NULL, RISCV_ISA_EXT_svade);
> >> +    bool svadu = riscv_isa_extension_available(NULL, RISCV_ISA_EXT_svadu);
> >> +
> >> +    /* Case 3: leave the A/D bits management to hardware. */
> >> +    if ( svadu && !svade )
> >> +        return;
> >> +
> >> +    /* Cases 1, 2 and 4: Xen has to preset the A/D bits. */
> >> +    __set_bit(RISCV_ISA_EXT_svade, riscv_isa);
> >> +}
> >> +
> >>    void __init riscv_fill_hwcap(void)
> >>    {
> >>        unsigned int i;
> >> @@ -513,6 +560,8 @@ void __init riscv_fill_hwcap(void)
> >>            __set_bit(RISCV_ISA_EXT_sstc, riscv_isa);
> >>        }
> >>
> >> +    riscv_resolve_ad_scheme();
> >> +
> >>
> >> And then ...
> >>
> >>
> >>> +     *
> >>> +     * Currently, Xen on RISC-V does not make use of the information that could
> >>> +     * be obtained from handling such page faults, which could otherwise be
> >>> +     * useful for several use cases such as demand paging, cache-flushing
> >>> +     * optimizations, memory access tracking, etc.
> >>> +     *
> >>> +     * To support the more general case and the optimizations mentioned above,
> >>> +     * it would be better to stop setting the A/D bits here and instead handle
> >>> +     * page faults that occur due to unset A/D bits.
> >>> +     */
> >>> +
> >>> +    /*
> >>> +     * Preset unconditionally for all 4 cases above, harmless when Svadu
> >>> +     * manages the bits (case 3). Skipping it for case 3 requires SBI FWFT
> >>> +     * which is not yet supported.
> >>>         */
> >>> -    if ( riscv_isa_extension_available(NULL, RISCV_ISA_EXT_svade) )
> >>> -        e->pte |= PTE_ACCESSED | PTE_DIRTY;
> >>> +    e->pte |= PTE_ACCESSED | PTE_DIRTY;
> >>
> >> ... we could restore the check and the comment we originally had in
> > 
> > Yes it makes sense as we now manually force the svade extension in 1, 2
> > and 4 cases.
> > 
> >> p2m_set_permission(), but probably with some updates, something along
> >> the following lines:
> >>
> >> /*
> >>    * Xen has to preset the A/D bits unless the hardware is known to update
> >>    * them on its own. riscv_fill_hwcap() folds all the Svade/Svadu device
> >>    * tree combinations into RISCV_ISA_EXT_svade, which then means that
> >>    * software is responsible for the A/D bits" (see
> >>    * riscv_resolve_ad_scheme()).
> >>    */
> >>
> >> I have another comment regarding:
> >>
> >>   > +    /*
> >>   > +     * Preset unconditionally for all 4 cases above, harmless when Svadu
> >>   > +     * manages the bits (case 3). Skipping it for case 3 requires
> >> SBI FWFT
> >>   > +     * which is not yet supported.
> >>   >        */
> >>   > -    if ( riscv_isa_extension_available(NULL, RISCV_ISA_EXT_svade) )
> >>   > -        e->pte |= PTE_ACCESSED | PTE_DIRTY;
> >>   > +    e->pte |= PTE_ACCESSED | PTE_DIRTY;
> >>
> >> I am not sure that this comment is correct. In case 3, we should not
> >> need to use the SBI FWFT extension. Case 3 means that Xen must assume
> >> that Svadu is enabled. Therefore, it is the responsibility of OpenSBI,
> >> or the pre-bootloader that loads OpenSBI, to enable it. If it fails to
> >> do so, then OpenSBI or the pre-bootloader is not complying with the DT
> >> binding documentation and it should be fixed in first place.
> > 
> > You right, thanks
> >>
> >> As further evidence, this is what OpenSBI already does [1]:
> >> /*
> >>    * Assume only Svadu is supported when it is the only extension
> >>    * present in the ISA string. Svade is assumed when neither are
> >>    * present. When both are present we must default to Svade (see
> >>    * the zero reset value of FWFT.PTE_AD_HW_UPDATING).
> >>    */
> >> if (!sbi_hart_has_extension(scratch, SBI_HART_EXT_SVADE))
> >>       __set_menvcfg_ext(SBI_HART_EXT_SVADU, ENVCFG_ADUE);
> >>
> >> Therefore, in case 3, the original check is still valid, and there is no
> >> need for Xen to support the SBI FWFT extension for this case. I think
> >> the original check should therefore be kept as it was:
> > 
> > Yes agree, I'll change that in v2.
> > 
> >> if ( riscv_isa_extension_available(NULL, RISCV_ISA_EXT_svade) )
> >>       e->pte |= PTE_ACCESSED | PTE_DIRTY;
> >>
> >> The SBI FWFT extension is only required for case 4. If both Svade and
> >> Svadu are present in the DT, Svade is selected by default. To use Svadu
> >> instead, SBI FWFT is required to set the ADUE bit in menvcfg, which is
> >> only accessible from M-mode.
> >>
> >> Since SBI FWFT is relatively new and may not be supported by older
> >> OpenSBI versions, another option is to have OpenSBI hard-code ADUE=1.
> >> Alternatively, the DTS could specify only one of Svade or Svadu in the
> >> riscv,isa property. In that case, upstream OpenSBI can handle the
> >> configuration automatically. So specifically for our case (Svadu and
> >> Svade things) we don't need SBI FWFT at all.
> > 
> > So if I understood correclty, you want to not let the option to change
> > ADUE bits in case 4 right? Therefore, I think we should document that
> > somewhere to clearly indicates that if someone want to use Svadu, he
> > should remove `svade` in the riscv,isa DT property.
> 
> Yes, that is exactly correct. Without SBI FWFT support, Xen cannot 
> toggle menvcfg.ADUE in Case 4. Thus, the only viable workaround to use 
> Svadu is to remove 'svade' from the riscv,isa DT property (Case 3), 
> which prompts OpenSBI to enable ADUE=1 at boot time.
> 
> I agree document that somewhere will make this behavior/intention clear!
> 
> Not insisting on that:
> I also think it would be a good idea to add an early printk() warning in 
> the detection logic when both Svade and Svadu are present but SBI FWFT 
> is missing, guiding users to drop 'svade' from their DT if they want to 
> leverage Svadu. Something like:
> 
> if ( svade && svadu )
> {
>      /* Assuming sbi_fwft_is_supported() or similar probe is available */
>      if ( !sbi_probe_extension(SBI_EXT_FWFT) )
>      {
>          printk(XENLOG_WARNING
>                 "RISC-V: Both Svade and Svadu detected, but SBI FWFT is 
> missing.\n"
>                 "RISC-V: Defaulting to software A/D updates (Svade).\n"
>                 "RISC-V: To force hardware A/D updates (Svadu), remove 
> 'svade' from DT.\n");
>      }
> }
> 
> somewhere in the function (riscv_resolve_ad_scheme) I suggested above.

Agree, it'll be better. I'm going to apply that in v2
> 
> >>
> >> [1]
> >> https://github.com/riscv-software-src/opensbi/blob/master/lib/sbi/sbi_hart.c#L171
> >>
> > Thanks for this very clear review.
> 
> Welcome.
> 
> ~ Oleksii
> 
> 
> 



