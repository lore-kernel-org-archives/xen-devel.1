Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EE5FC982FA
	for <xen-devel@archiver.kernel.org>; Tue, 22 Sep 2026 09:18:23 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1428381.1651103 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8wdX-0003Yk-Ea; Tue, 22 Sep 2026 09:18:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1428381.1651103; Tue, 22 Sep 2026 09:18:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8wdX-0003Yd-Bt; Tue, 22 Sep 2026 09:18:03 +0000
Received: by outflank-mailman (input) for mailman id 1428381;
 Tue, 22 Sep 2026 09:18:02 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0c868594900072c4@swg.vates.tech>)
 id 1x8wdV-0003YX-LV
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2026 09:18:02 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x8wdU-003s7Y-Nb
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2026 11:18:00 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0c868594900072c4@swg.vates.tech>)
 id 6ab247bc-bab6-0a2a0a5309dd-0a2a450283c6-38
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 11:18:00 +0200
Received: from [185.255.28.18] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0c868594900072c4@swg.vates.tech>)
 id 6ab247c6-6ca4-0a2a45020019-b9ff1c128df9-3
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 11:17:58 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a0c868594900072c4.006 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 22 Sep 2026 09:17:56 +0000
Received: from [192.168.1.37] (lfbn-gre-1-371-96.w90-112.abo.wanadoo.fr
 [90.112.87.96]) (Authenticated sender: baptiste.le-duc)
 by mail2.vates.fr (Postfix) with ESMTPSA id 0DF5581B88;
 Tue, 22 Sep 2026 11:17:56 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=Ey+VyVbFYdwB/cAkjwXzT2mnm7rY6FcAP6/4dCNmN4s=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:content-transfer-encoding:in-reply-to:references:feedback-id;
 b=M4IS4VFm4+hfM1D69LgCYwCNcSXDIrsrz39AGf1vU3oY0ADUtg0zwrY5YBKNyrnjy1sjIU2Xz
 Q9WTHBk9Gmlv1WdLaQ3GfilJxlcKi+Xd19soRHSZ9du8wOvmvMI24TWaKzxRPx6lrWbApvkiyDa
 pN1CY2uZnOnXZHAQUAhnlyfV0ExmJtgm61lDjPZv/sgpStf1qNqzMSlEPj49K5gNuskP5g5sawS
 sQSTg6eV0bWEBnJKOfRk5F0X7AEwZ/Pyvfd5FlbtKDvyli1fqUweglEK8nXaKBSIxOqb0ScS8LU
 s/DcpY3YBWVkTxp9d4V09DCFuGXKzY9e179Gaes0Ia+g==
X-Zone-Loop: de9b7c4808def73ec177634e76e66c17e1798e92caea
x-campaign-type: default
x-transaction-id: e26c2122-091e-4562-8b0c-55dd9452c0e1
x-swg-uid: 01-8aeca70a-1403-475f-b1b4-8ca2649d775d
X-Mailer: Sweego
Message-ID:
 <1790068677.8631fc262581453bbf619ec5b2062170.1a0c868594900072c4@vates.tech>
x-swg-bid: 1790068677.8631fc262581453bbf619ec5b2062170.1a0c868594900072c4
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2 1/6] xen/riscv: fix Svade/Svadu A/D bit handling
From: Baptiste Le Duc <baptiste.le-duc@vates.tech>
To: Jan Beulich <jbeulich@suse.com>
Cc: Baptiste Le Duc <baptiste.le-duc@vates.tech>, 
 xen-devel@lists.xenproject.org, Alistair Francis <alistair.francis@wdc.com>, 
 Connor Davis <connojdavis@gmail.com>, 
 Oleksii Kurochko <oleksii.kurochko@gmail.com>, 
 Andrew Cooper <andrew.cooper3@citrix.com>, 
 Anthony PERARD <anthony.perard@vates.tech>, 
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>, 
 =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>, 
 Stefano Stabellini <sstabellini@kernel.org>
In-Reply-To: <e8b1257b-3b28-43d3-b692-5e79f5cae68a@suse.com>
References: <1789032657.8631fc262581453bbf619ec5b2062170.1a08aa7f23b000c4f3@vates.tech>
 <1789032897.8631fc262581453bbf619ec5b2062170.1a08aab9d76000c4f3@vates.tech>
 <450d0c5e-2101-4b1c-98fd-2f438bd0ccf3@suse.com>
 <1790010225.8631fc262581453bbf619ec5b2062170.1a0c4ec74f000072c4@vates.tech>
 <e8b1257b-3b28-43d3-b692-5e79f5cae68a@suse.com>
Date: Tue, 22 Sep 2026 11:17:50 +0200
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790068670; l=6981;
 i=baptiste.le-duc@vates.tech; s=20260810; h=from:subject:message-id;
 bh=UYVrUyLKG+qpxD4aojxjl9DRgwJXPjGMib3r+pnhyQg=;
 b=tpCE5owuukW7NPO9561rhcr7WHjPSTkeY/VDUSIBiuyIdppllr0kRsk3KyWerA5NbFhsP1nCG
 5uo5YcgoJbeBU7idwVcbnvRtuQhk/RNssbqDTqLUQclTQpcO2I8Wfv4
X-Developer-Key: i=baptiste.le-duc@vates.tech; a=ed25519;
 pk=N+BbdvMXRzrCuX/ieh4RWodiAKcLNvI+KjflcZ0oXCo=
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1790068676250
X-purgate-ID: tlsNG-720697/1790068678-676BF2AC-FC5D502B/0/0
X-purgate-type: clean
X-purgate-size: 6985

On 2026-09-22 08:24 +0200, Jan Beulich wrote:
> On 21.09.2026 19:03, Baptiste Le Duc wrote:
> > On 2026-09-21 17:26:47+02:00, Jan Beulich wrote:
> >> On 10.09.2026 11:34, Baptiste Le Duc wrote:
> >>> @@ -468,6 +469,62 @@ static bool __init has_isa_extensions_property(void)
> >>>      return false;
> >>>  }
> >>>  
> >>> +/*
> >>> + * Svade and Svadu extensions represent two schemes for managing the PTE A/D
> >>> + * bits. When the PTE A/D bits need to be set, the Svade extension indicates
> >>> + * that a page fault will be raised. In contrast, the Svadu extension supports
> >>> + * hardware updating of the PTE A/D bits.
> >>> + *
> >>> + * There are 4 possible combinations of these extensions in the device tree.
> >>> + * The default hardware behavior for each is:
> >>> + *
> >>> + * 1) Neither Svade nor Svadu present in DT => It is technically unknown
> >>> + *    whether the platform uses Svade or Svadu. Xen should be prepared to
> >>> + *    handle either hardware updating of the PTE A/D bits or page faults when
> >>> + *    they need updating. In that case, Xen assumes Svade because it's
> >>> + *    harmless if the platform is actually Svadu, while assuming Svadu on real
> >>> + *    Svade hardware risks an unhandled page fault.
> >>> + *
> >>> + * 2) Only Svade present in DT => Xen must assume Svade to be always enabled.
> >>> + *
> >>> + * 3) Only Svadu present in DT => Xen must assume Svadu to be always enabled.
> >>> + *
> >>> + * 4) Both Svade and Svadu present in DT => Xen must assume Svadu is turned off
> >>> + *    at boot time by setting A/D bits. To use Svadu, the supervisor must
> >>> + *    explicitly enable it using the SBI FWFT extension.
> >>> + *
> >>> + * The Svade extension is mandatory and the Svadu extension is optional in the
> >>> + * RVA23 profile. Platforms wanting to take advantage of Svadu can choose
> >>> + * option 3. Platforms aware of the profile can choose option 4, and Xen won't
> >>> + * get the benefit of Svadu until the SBI FWFT extension is available.
> >>> + *
> >>> + * In other words, hardware manages the A/D bits on its own only in case 3, in
> >>> + * all the other cases software has to preset them. Instead of open coding this
> >>> + * in every A/D bits user, RISCV_ISA_EXT_svade is used to mean "software is
> >>> + * responsible for the A/D bits" and is set here for the cases 1, 2 and 4.
> >>> + */
> >>> +static void __init riscv_resolve_ad_scheme(void)
> >>> +{
> >>> +    bool svade = riscv_isa_extension_available(NULL, RISCV_ISA_EXT_svade);
> >>> +    bool svadu = riscv_isa_extension_available(NULL, RISCV_ISA_EXT_svadu);
> >>> +
> >>> +    /* Case 3: leave the A/D bits management to hardware. */
> >>> +    if ( svadu && !svade )
> >>> +        return;
> >>> +
> >>> +    /* Case 4 */
> >>> +    if ( svadu && svade ){
> >>> +        if ( !sbi_probe_extension(SBI_EXT_FWFT) ){
> >>
> >> Nit (style): Brace placement.
> > Sorry for that. I will fix that in v3.
> >> Furthermore this is written in a way which Misra would call "dead code". I'd
> >> like to suggest (leaving out comments):
> >>
> >>     if ( svadu )
> >>     {
> >>         if ( !svade )
> >>             return;
> >>
> >>         if ( !sbi_probe_extension(SBI_EXT_FWFT) )
> >>             printk(...);
> >>     }
> > I assume you are referring to Misra C:2012 Rule 13.5 "The right operand
> > of a logical && or || operand shall not contain persistent side effect"
> > 
> > If yes, IMO, I think it doesn't apply here as `svade` is evaluated
> > before the `if` so there is no side effect that wouldn't have been
> > executed in case of svadu=false.
> 
> No, there's nothing side-effect-ish here. With "svadu && !svade" in the
> first if(), the rhs of "svadu && svade" in the second one is dead code:
> Things would function the same with it dropped.
Ok, now I understand, thanks. I'll fix it in next round.
> 
> >>> +          printk(XENLOG_WARNING "RISC-V: Both Svade and Svadu detected, but SBI FWFT is missing.\n"
> >>> +                  "RISC-V: Defaulting to software A/D updates (Svade).\n"
> >>> +                  "RISC-V: To force hardware A/D updates (Svadu), remove 'svade' from DT.\n");
> >>
> >> Nit (style): Indentation (in multiple ways). Furthermore XENLOG_* needs
> >> repeating after every newline.
> >>
> >>> +        }
> >>> +    }
> >>> +
> >>> +    /* Cases 1, 2: Xen assume Svade to be enabled */
> >>> +    __set_bit(RISCV_ISA_EXT_svade, riscv_isa);
> >>
> >> Isn't this a lie (to ourselves) then?
> > If you are talking about case 1:
> >     [1] Yes, it's technically a lie for boards shipped before
> >     the svade/svadu extension was ratified (e.g., HiFive Premier P550).
> >     These extensions merely formalized a mechanism that already existed in
> >     hardware.
> 
> Wait, how do you know this for _all_ boards anyone may ever have made?
We don't know but based on [1] and my commit message, if neither
Svade nor Svadu are present in DT then it is technically unknown whether
the platform uses Svade or Svade. Hypervisor may then assume Svade to be
present and enabled or it can discover based on mvendorid, marchid, and
mimpid. For this patch, I choose to have the Hypervisor assumed Svade.

Saying that, I agree that it doesn't make sense to manually have set
Svade extension in the isa bitfield as we could just preset A/D bits
regardless of Svade/Svadu during the p2m_set_permission(). It's what
kvm explains in kvm_riscv_gstage_map_page():

  /*
   * A RISC-V implementation can choose to either:
   * 1) Update 'A' and 'D' PTE bits in hardware
   * 2) Generate page fault when 'A' and/or 'D' bits are not set
   *    PTE so that software can update these bits.
   *
   * We support both options mentioned above. To achieve this, we
   * always set 'A' and 'D' PTE bits at time of creating G-stage
   * mapping. To support KVM dirty page logging with both options
   * mentioned above, we will write-protect G-stage PTEs to track
   * dirty pages.
   */


[1] https://lore.kernel.org/lkml/20240628093711.11716-1-yongxuan.wang@sifive.com/#t
> And for all qemu (and alike) versions which supported RISC-V?

Concerning qemu, you're right, in case when (!svade && !svadu) they use
by default Svadu (hw updating) for backward compatibility.

> 
> >     [2] For boards that do support svade, we could enforce DT
> >     declaration by adding it to `required_extension` as they are
> >     explicitly supporting it. However, doing so would cause boards
> >     without svade/svadu support (as described above) to hit a panic
> >     during boot.
> > 
> >     So in both case ([1], [2]), the svade extension exist either implicitely or
> >     explicitly. Therefore, force it doesn't compromize anything.
> 
> If, despite my comment above, this is indeed what is wanted, I think it
> requires a little more commentary.
> 
> Jan
> 
> 
> 



