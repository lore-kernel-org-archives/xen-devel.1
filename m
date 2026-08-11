Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BA93C5B56A
	for <xen-devel@archiver.kernel.org>; Tue, 11 Aug 2026 15:30:05 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1388323.1629524 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wtoQE-0004Hz-4y; Tue, 11 Aug 2026 15:29:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1388323.1629524; Tue, 11 Aug 2026 15:29:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wtoQD-0004Hr-VV; Tue, 11 Aug 2026 15:29:45 +0000
Received: by outflank-mailman (input) for mailman id 1388323;
 Tue, 11 Aug 2026 15:29:44 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19ff17189ea000c4f3@swg.vates.tech>)
 id 1wtoQB-0004Hk-N9
 for xen-devel@lists.xenproject.org; Tue, 11 Aug 2026 15:29:44 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wtoQ9-00EsYU-Ei
 for xen-devel@lists.xenproject.org; Tue, 11 Aug 2026 17:29:41 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19ff17189ea000c4f3@swg.vates.tech>)
 id 6a7b3fc5-bab6-0a2a0a5309dd-0a2a45028760-32
 for <xen-devel@lists.xenproject.org>; Tue, 11 Aug 2026 17:29:41 +0200
Received: from [185.255.28.18] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19ff17189ea000c4f3@swg.vates.tech>)
 id 6a7b3fe4-6ca4-0a2a45020019-b9ff1c129f15-3
 for <xen-devel@lists.xenproject.org>; Tue, 11 Aug 2026 17:29:40 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19ff17189ea000c4f3.006 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 11 Aug 2026 15:29:37 +0000
Received: from [192.168.1.46] (areims-651-1-80-194.w90-18.abo.wanadoo.fr
 [90.18.187.194]) (Authenticated sender: baptiste.le-duc)
 by mail2.vates.fr (Postfix) with ESMTPSA id ECAE6836F1;
 Tue, 11 Aug 2026 17:29:36 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=SQYRjrECz2lCt3b7FbSUi/noBU2ON3/HTV+7xPquC2E=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:content-transfer-encoding:in-reply-to:references:feedback-id;
 b=DY5yScjH0arpvSlVhn0A08tBeSSlNw3gu01+cHbeoD/nZil5Opx24/SCTVyeAlZ8wHPcEHlSr
 xOML9B8IEoQtDSHatMqyLpHnBUFx3u2i7I2xMrD+dS8HiznPibg85DZ/OLsvh8pNWYuurC+KedF
 dY3NKWmF2bkm67j4MgTdrLWT7d9fyg6HYTgdImcWX2FzaLVCopmVN9CV8SAnwuW1WCycnFLtjYr
 06Xlp2oKc06f0Nm7fthGNwK2tdHx6+bOZdbXqWjnRk9cP8PzC0DBKRB6DLRixWOD4E2+26prPHP
 dYE67OVtMqtJuQpp3ucXXqKQ8YzccxlcjOCsTUsrnvUQ==
X-Zone-Loop: 2d8c5759c7009ba8ac5e59768a39ebaa0cba67b9245b
x-campaign-type: default
x-transaction-id: ab04de0a-0762-4216-960c-05e109aa0b74
x-swg-uid: 01-f1f4f613-377d-4850-a4c2-971ca03da645
X-Mailer: Sweego
Message-ID:
 <1786462177.8631fc262581453bbf619ec5b2062170.19ff17189ea000c4f3@vates.tech>
x-swg-bid: 1786462177.8631fc262581453bbf619ec5b2062170.19ff17189ea000c4f3
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v1 05/17] xen/riscv: implement virtual APLIC MMIO
 emulation
From: Baptiste Le Duc <baptiste.le-duc@vates.tech>
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Baptiste Le Duc <baptiste.le-duc@vates.tech>, 
 Jan Beulich <jbeulich@suse.com>, 
 Romain Caritey <Romain.Caritey@microchip.com>, 
 Alistair Francis <alistair.francis@wdc.com>, 
 Connor Davis <connojdavis@gmail.com>, 
 Andrew Cooper <andrew.cooper3@citrix.com>, 
 Anthony PERARD <anthony.perard@vates.tech>, 
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>, 
 =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>, 
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
In-Reply-To: <2187839d-fef8-4d51-8b98-8c0fb26a9569@gmail.com>
References: <cover.1784560663.git.oleksii.kurochko@gmail.com>
 <5571644f1d3a4277dc95fe85099563a145d1d935.1784560663.git.oleksii.kurochko@gmail.com>
 <57793423-aadd-4786-90fd-2923925b766d@suse.com>
 <4c62661a-f944-4806-824a-e74bcbaea3df@gmail.com>
 <1786440103.8631fc262581453bbf619ec5b2062170.19ff020b5cf000c4f3@vates.tech>
 <2187839d-fef8-4d51-8b98-8c0fb26a9569@gmail.com>
Date: Tue, 11 Aug 2026 17:29:31 +0200
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786462176; l=8612;
 i=baptiste.le-duc@vates.tech; s=20260810; h=from:subject:message-id;
 bh=WM8w/m+gOxCBN24OL9AIoVIQqmsbVJj3MSsjvLlnUX8=;
 b=dsZMnHtAgw6lRYLsF8uEVSmOo2ETpWwZgR2AwrC2h1jMidMz7XtvdCnQODYeEvZQ3nRTjYknK
 JERa6MGgkH/DyP/NCdb3BuCtMM0wtg627+VGo6WKSzbqNos2jGzu47q
X-Developer-Key: i=baptiste.le-duc@vates.tech; a=ed25519;
 pk=N+BbdvMXRzrCuX/ieh4RWodiAKcLNvI+KjflcZ0oXCo=
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1786462177172
X-purgate-ID: tlsNG-720697/1786462181-307C22AC-00666627/0/0
X-purgate-type: clean
X-purgate-size: 8616

On 2026-08-11 16:36 +0200, Oleksii Kurochko wrote:
> 
> 
> On 8/11/26 11:21 AM, Baptiste Le Duc wrote:
> > On 2026-08-07 18:08:21+02:00, Oleksii Kurochko wrote:
> >> On 8/6/26 4:28 PM, Jan Beulich wrote:
> >>
> >>> On 20.07.2026 18:02, Oleksii Kurochko wrote:
> >>>
> >>> For this tag to have any meaning, it should move ahead of the --- above;
> >>> the explanations ...
> >>>
> >>>
> >>> ... here rather explain the restriction on the R-b, not its odd placement.
> >>>
> >>>
> >>> As this looks to be recurring - please get versioning of your series right.
> >>> The series is supposedly v1, but here you give the impression of it being
> >>> v3. If there really was an earlier v2 posting, why isn't the entire series
> >>> here v3?
> >>
> >> It is v3 before before it was a part of another patch series connected
> >> to dom0less config enablement.
> >>
> >> Would it be better to just write in "Change in v3" that it is moved from
> >> another patch series + link to that patch series? Or it will be enough
> >> just to drop "Changes in v2 and v1" and just start from v1?
> >>
> >>> PLease can you, before submitting, self-review your patches? I'm really
> >>> getting tired of having to repeatedly point out basic style issues, like
> >>> the overlong line here.
> >>
> >> Sorry for that, I will write an extra checker for such cases to not miss
> >> them.
> >>
> >>> It extends to the other local variables here, but I'll use these two to
> >>> try to make my point: I'm struggling to associate the names with the
> >>> values they are set to. Likely "hxw" is an abbreviation of hart index
> >>> width, but (a) what's the leading 'l' then and (b) why is there no 'g'
> >>> in "hhxw"? By using hard to grasp names, you make it hard to actually
> >>> understand the subsequent expressions, in particular ...
> >>
> >> The names it taken directly from AIA spec:
> >>
> >> The use of this value and fields HHXS (High Hart Index Shift), LHXS (Low
> >> Hart Index Shift), HHXW (High Hart Index Width), and LHXW (Low Hart
> >> Index Width) for determining target addresses for MSIs is described
> >> later, in Section 4.9.1.
> >>
> >> The AIA specification interprets the machine-level hart index as a
> >> combination of the **group index** (`g`) and the **hart index within the
> >> group** (`h`), according to the following formulas:
> >>
> >> ```
> >> (1) g = (machine-level hart index >> LHXW) & (2^HHXW − 1)
> >> (2) h = machine-level hart index & (2^LHXW − 1)
> >> ```
> >>
> >> (In our case, the machine-level hart index is equal to `mhartid`, i.e.
> >> the hart index.)
> > Therefore, if I understand correclty, if we take the Hart Index as
> > defined in the AIA spec, we should have:
> > Hart Index = (g << LHXW) | h
> > Is it correct?
> 
> Yes.
> 
> But note that in the current version of aplic_hart_field(), hart_id is 
> passed directly, so there is no need to extract h as described in the 
> AIA specification. We only need to concatenate it with the group index 
> that we have already extracted.
> 
> This is partly because aplic_hart_field() uses only .base_addr, which 
> does not contain hart_index.
> 
> If we want to follow the AIA specification fully, using its terminology, 
> the code should look something like:
> 
> static unsigned long aplic_hart_field(unsigned int cpu)
> {
>      const struct imsic_config *imsic = imsic_get_config();
>      const struct imsic_msi *msi = &imsic->msi[cpu];
Could you please specify how this function will be used and when? It's
hard for me to understand how imsic->msi[cpu] is filled.
>      unsigned int lhxs = imsic->guest_index_bits;
>      unsigned int lhxw = imsic->hart_index_bits;
>      unsigned int hhxw = imsic->group_index_bits;
>      unsigned int hhxs =
>          imsic->group_index_shift - APLIC_xMSICFGADDR_PPN_SHIFT * 2;
>      /*
>       * msi->base_addr is the base of the MMIO regset this CPU's interrupt
>       * files live in, and one regset can cover several harts; msi->offset
>       * selects this CPU's block inside it.  The hart index bits are part of
>       * that offset, so both indexes have to be derived from the full 
> address.
>       */
>      paddr_t target_addr = msi->base_addr + msi->offset;
>      unsigned long tppn = target_addr >> APLIC_xMSICFGADDR_PPN_SHIFT;
>      unsigned long group_index =
>          (tppn >> APLIC_xMSICFGADDR_PPN_HHX_SHIFT(hhxs)) &
>          APLIC_xMSICFGADDR_PPN_HHX_MASK(hhxw);
>      unsigned long hart_index =
>          (tppn >> APLIC_xMSICFGADDR_PPN_LHX_SHIFT(lhxs)) &
>          APLIC_xMSICFGADDR_PPN_LHX_MASK(lhxw);
> 
>      return (group_index << lhxw) | hart_index;
> }
> 
> (note that during writing that I found an issue, it should be really 
> passed Xen cpu id, not hartid as msi[] is iterated through Xen cpu id so 
> I've taken that into account when wrote an implementation mentioned above)
> 
> Generally I think I am okay with both version of how to get hart_index 
> (or pass it by an argument or extract it).
> 
> >>
> >> For systems that use IMSIC groups, the IMSIC address layout is defined
> >> by the following parameters:
> >>
> >> * `lhxw` (Low Hart Index Width, or *k*): the number of bits used for the
> >> hart number within a group.
> >> * `hhxw` (High Hart Index Width, or *j*): the number of bits used for
> >> the group number.
> > Is group number appelation equivalent to group index?
> > 
> > I think with if what I wrote above is correct, the proper definition for
> > `hhxw` and `hhxs` should be:
> > * `hhxw` (High Hart Index Width, or *j*): the number of bits used for
> > the `Hart Index` field within the physical address.
> >> * `hhxs` (High Hart Index Shift): the bit offset of the combined
> >> hart/group index field within the physical address.
> > * `hhxs` (High Hart Index Shift): the bit offset of the `Hart Index`
> > field within the physical address.
> >> To extract the group index, we first shift the address by `hhxs` so that
> >> the group index bits are aligned, and then apply a mask derived from
> >> `hhxw` to isolate those bits.
> >>
> >> The hardware performs the same operation to extract the hart index from
> >> the MSI address. However, in our case we already know which hart should
> >> receive the interrupt (`hartid`), so there is no need to extract the
> >> hart index from the base address. We only need to recover the group
> >> index and combine it with `hartid` to construct the value expected by
> >> the `target` register.
> > 
> > Why don't we direclty extract the Hart Index as target directly needs it
> > as explained in the 4.5.16.2 point of the AIA spec:
> > target[31:18] = Hart Index
> > target[17:12] = Guest Index
> > target[10:0] = EEID
> > It'd be easier as we just have to do shift from HHXS and apply HHXW.
> 
>  From IMSIC's DT-binding description we have:
> 
>    XLEN-1            > (HART Index MSB)                  12    0
>    |                  |                                  |     |
>    -------------------------------------------------------------
>    |xxxxxx|Group Index|xxxxxxxxxxx|HART Index|Guest Index|  0  |
>    -------------------------------------------------------------
> 
> If you see there is a set of "xxxxxx" between HART and Group Indexes 
I think I'm missunderstanding the spec, as I wrote before I thought that
[1] `Hart index` = group_idx << LHXW | hart_idx_within_the_group so,
does the Hart Index in the schema refer to hart_idx_within_the_group or
to [1]? The naming makes me a bit confuse.
> that is the reason why we have to extract HART and Group Index 
> separately as when h/w will work with target register it doesn't know 
> about "xxxxx" at all so from h/w point of view target's register hart 
> field looks like |Group Index|Hart Index|. In other words, h/w will do
> the following with TARGET's hart index field:
>      group_idx = hart_idx >> lhxw;
>      hart_idx &= APLIC_xMSICFGADDR_PPN_LHX_MASK(lhxw);
> 
> and then embed group_idx and hart_idx into the structure above.
> 
> Does it make sense?
> 
> > 
> > I will try to draw some schema to make the AIA spec more explicit. Maybe
> > it could be part of this series, I don't know what is the xen policy
> > about diagram and stuff like that. Do you know more about that?
> 
> Unfortunately, no, I don't.
> 
> > In order 
> > to not do a job with no needed at all.
> > 
> 
> IMO, it is enough only AIA spec here to understand. At least, it is 
> clear to me.
> 
> ~ Oleksii
> 
> 
> 



