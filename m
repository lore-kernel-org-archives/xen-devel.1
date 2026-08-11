Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B2E3C5CFC1
	for <xen-devel@archiver.kernel.org>; Tue, 11 Aug 2026 09:22:16 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1388052.1629262 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wtig7-0002FK-Oo; Tue, 11 Aug 2026 09:21:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1388052.1629262; Tue, 11 Aug 2026 09:21:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wtig7-0002FB-M5; Tue, 11 Aug 2026 09:21:47 +0000
Received: by outflank-mailman (input) for mailman id 1388052;
 Tue, 11 Aug 2026 09:21:46 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19ff020b5cf000c4f3@swg.vates.tech>)
 id 1wtig6-0002F4-Ba
 for xen-devel@lists.xenproject.org; Tue, 11 Aug 2026 09:21:46 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wtig5-006FrG-0I
 for xen-devel@lists.xenproject.org; Tue, 11 Aug 2026 11:21:45 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19ff020b5cf000c4f3@swg.vates.tech>)
 id 6a7ae99c-bab6-0a2a0a5309dd-0a2a4509c4bc-48
 for <xen-devel@lists.xenproject.org>; Tue, 11 Aug 2026 11:21:44 +0200
Received: from [185.255.28.18] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19ff020b5cf000c4f3@swg.vates.tech>)
 id 6a7ae9a8-be1a-0a2a45090019-b9ff1c12b6f9-3
 for <xen-devel@lists.xenproject.org>; Tue, 11 Aug 2026 11:21:44 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19ff020b5cf000c4f3.006 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 11 Aug 2026 09:21:43 +0000
Received: from [192.168.1.46] (areims-651-1-80-194.w90-18.abo.wanadoo.fr
 [90.18.187.194]) (Authenticated sender: baptiste.le-duc)
 by mail2.vates.fr (Postfix) with ESMTPSA id A6098836B8;
 Tue, 11 Aug 2026 11:21:42 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=BsDOru5B/HOalntMeTera7gCiEHVoXXf0RUzISNa0hQ=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:content-transfer-encoding:in-reply-to:references:feedback-id;
 b=p4ZTfclmQMN1CNnwb43L1fye72gokU+LmNGukYDH8eOe8IS0FHFU9By/CpNppc1gEsu1Qg9uN
 DOSl+mwEIFDfgLHvxgH3cM9L9Oy2UscnL7arsNtHTPKWJ6Gtbt8QbYMK9W5Se68sW87hV7mcDgH
 khRbYYHnc5+fgPzzjaueYKEg2YITCxSntW/8ZIlNbjtEx84520af/rrLpz52U0ygNZXJ7j9c5H+
 0/4cswQTTFwtFLvuG6nsr2Swboqr4c2Q05zWdEX70iugdr4qFGs/0WiCycuLtfPOunVep1jiHOJ
 2Z33IMo4l1qpWXV4sdQYPGAkpvfjLUHPGWsemgXJ0t4w==
X-Zone-Loop: 227c7d1a10f88bfa010aaddba4f1d9070cff629807f4
x-campaign-type: default
x-transaction-id: 13ba7e45-6832-423a-80cb-23f843b7583c
x-swg-uid: 01-314b3b3d-7f60-47e3-9ec5-06fad97b9657
X-Mailer: Sweego
Message-ID:
 <1786440103.8631fc262581453bbf619ec5b2062170.19ff020b5cf000c4f3@vates.tech>
x-swg-bid: 1786440103.8631fc262581453bbf619ec5b2062170.19ff020b5cf000c4f3
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
Cc: Jan Beulich <jbeulich@suse.com>, 
 Romain Caritey <Romain.Caritey@microchip.com>, 
 Baptiste Le Duc <baptiste.le-duc@vates.tech>, 
 Alistair Francis <alistair.francis@wdc.com>, 
 Connor Davis <connojdavis@gmail.com>, 
 Andrew Cooper <andrew.cooper3@citrix.com>, 
 Anthony PERARD <anthony.perard@vates.tech>, 
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>, 
 =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>, 
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
In-Reply-To: <4c62661a-f944-4806-824a-e74bcbaea3df@gmail.com>
References: <cover.1784560663.git.oleksii.kurochko@gmail.com>
 <5571644f1d3a4277dc95fe85099563a145d1d935.1784560663.git.oleksii.kurochko@gmail.com>
 <57793423-aadd-4786-90fd-2923925b766d@suse.com>
 <4c62661a-f944-4806-824a-e74bcbaea3df@gmail.com>
Date: Tue, 11 Aug 2026 11:21:37 +0200
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786440102; l=10687;
 i=baptiste.le-duc@vates.tech; s=20260810; h=from:subject:message-id;
 bh=gOjMgTrY5afWsvGwKc48ZSHzxOd0PUqzW8ObetQiJ0Q=;
 b=pdma3NXfM4Gv4vvmHCu9so0Xn6DhD6yjAUScqDpL2Yfr/B2KRIQvlKvZRNsNNLg8xpJy+rqQP
 Otj8RljM2++A+xoxgKSueM4FF1Z/Hz4oRJRQgmhuxgkts2LSkQklwQ8
X-Developer-Key: i=baptiste.le-duc@vates.tech; a=ed25519;
 pk=N+BbdvMXRzrCuX/ieh4RWodiAKcLNvI+KjflcZ0oXCo=
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1786440102868
X-purgate-ID: tlsNG-bad1c0/1786440104-3A4DB034-B032E409/0/0
X-purgate-type: clean
X-purgate-size: 10689

On 2026-08-07 18:08:21+02:00, Oleksii Kurochko wrote:
> On 8/6/26 4:28 PM, Jan Beulich wrote:
> 
> > On 20.07.2026 18:02, Oleksii Kurochko wrote:
> > 
> > For this tag to have any meaning, it should move ahead of the --- above;
> > the explanations ...
> > 
> > 
> > ... here rather explain the restriction on the R-b, not its odd placement.
> > 
> > 
> > As this looks to be recurring - please get versioning of your series right.
> > The series is supposedly v1, but here you give the impression of it being
> > v3. If there really was an earlier v2 posting, why isn't the entire series
> > here v3?
> 
> It is v3 before before it was a part of another patch series connected 
> to dom0less config enablement.
> 
> Would it be better to just write in "Change in v3" that it is moved from 
> another patch series + link to that patch series? Or it will be enough 
> just to drop "Changes in v2 and v1" and just start from v1?
> 
> > PLease can you, before submitting, self-review your patches? I'm really
> > getting tired of having to repeatedly point out basic style issues, like
> > the overlong line here.
> 
> Sorry for that, I will write an extra checker for such cases to not miss 
> them.
> 
> > It extends to the other local variables here, but I'll use these two to
> > try to make my point: I'm struggling to associate the names with the
> > values they are set to. Likely "hxw" is an abbreviation of hart index
> > width, but (a) what's the leading 'l' then and (b) why is there no 'g'
> > in "hhxw"? By using hard to grasp names, you make it hard to actually
> > understand the subsequent expressions, in particular ...
> 
> The names it taken directly from AIA spec:
> 
> The use of this value and fields HHXS (High Hart Index Shift), LHXS (Low 
> Hart Index Shift), HHXW (High Hart Index Width), and LHXW (Low Hart 
> Index Width) for determining target addresses for MSIs is described 
> later, in Section 4.9.1.
> 
> The AIA specification interprets the machine-level hart index as a 
> combination of the **group index** (`g`) and the **hart index within the 
> group** (`h`), according to the following formulas:
> 
> ```
> (1) g = (machine-level hart index >> LHXW) & (2^HHXW − 1)
> (2) h = machine-level hart index & (2^LHXW − 1)
> ```
> 
> (In our case, the machine-level hart index is equal to `mhartid`, i.e. 
> the hart index.)
Therefore, if I understand correclty, if we take the Hart Index as
defined in the AIA spec, we should have:
Hart Index = (g << LHXW) | h
Is it correct?
> 
> For systems that use IMSIC groups, the IMSIC address layout is defined 
> by the following parameters:
> 
> * `lhxw` (Low Hart Index Width, or *k*): the number of bits used for the 
> hart number within a group.
> * `hhxw` (High Hart Index Width, or *j*): the number of bits used for 
> the group number.
Is group number appelation equivalent to group index?

I think with if what I wrote above is correct, the proper definition for
`hhxw` and `hhxs` should be:
* `hhxw` (High Hart Index Width, or *j*): the number of bits used for
the `Hart Index` field within the physical address.
> * `hhxs` (High Hart Index Shift): the bit offset of the combined 
> hart/group index field within the physical address.
* `hhxs` (High Hart Index Shift): the bit offset of the `Hart Index`
field within the physical address.
> To extract the group index, we first shift the address by `hhxs` so that 
> the group index bits are aligned, and then apply a mask derived from 
> `hhxw` to isolate those bits.
> 
> The hardware performs the same operation to extract the hart index from 
> the MSI address. However, in our case we already know which hart should 
> receive the interrupt (`hartid`), so there is no need to extract the 
> hart index from the base address. We only need to recover the group 
> index and combine it with `hartid` to construct the value expected by 
> the `target` register.

Why don't we direclty extract the Hart Index as target directly needs it
as explained in the 4.5.16.2 point of the AIA spec:
target[31:18] = Hart Index
target[17:12] = Guest Index
target[10:0] = EEID
It'd be easier as we just have to do shift from HHXS and apply HHXW.
> 
> > ... these last two. As it stands, they may be easier to understand if
> > you didn't have the local variables at all, despite them then getting
> > textually longer.
> 
> With the explanation above, do the variable names make sense?
> 
> To be closer to AIA spec I think it would be better to rename 
> group_index to g and hart_id to h. Does it make sense to you?
> 
> >> +
> > 
> > Wouldn't this applying of a mask better be done in those callers which
> > actually need it? It's not the least the asymmetry with ...
> 
> Agree, that to be in sync, I will drop mask argument and apply it on 
> caller side.
> 
> > ... this which I consider unhelpful.
> > 
> > 
> > As to the comment - this indeed looks to be a field, but ...
> > 
> > 
> > ... these look to be values of some other field which isn't described. Please
> > may I (again) ask that definitions are their commentary at the very least not
> > misguide readers?
> 
> Thanks for pointing this out. You're right, the comment is misleading as 
> written. APLIC_SOURCECFG_D is a field, whereas the APLIC_SOURCECFG_SM_* 
> definitions are values for the source mode (SM) field, and the comment 
> doesn't make that distinction.
> 
> I'll update the comments to describe the fields more accurately:
> 
> #define APLIC_SOURCECFG_BASE            0x0004
> #define APLIC_SOURCECFG_LAST            0x0ffc
> /*
>   * sourcecfg[] register fields:
>   *  - bit 10 (D) selects the layout of the remaining bits;
>   *  - D = 1: bits [9:0] hold the Child Index, i.e. the source is delegated
>   *           to a child domain (unsupported by Xen);
Just to know, what is a child domain?
>   *  - D = 0: bits [2:0] hold the source mode SM (WARL).
>   */
> #define  APLIC_SOURCECFG_D              BIT(10, U)
> /* SM field values (0x2 and 0x3 are reserved): */
> #define   APLIC_SOURCECFG_SM_INACTIVE   0x0
> #define   APLIC_SOURCECFG_SM_DETACH     0x1
> #define   APLIC_SOURCECFG_SM_EDGE_RISE  0x4
> #define   APLIC_SOURCECFG_SM_EDGE_FALL  0x5
> #define   APLIC_SOURCECFG_SM_LEVEL_HIGH 0x6
> #define   APLIC_SOURCECFG_SM_LEVEL_LOW  0x7
> 
> Does it look better? Probably there is not sense for two extra spaces 
> for APLIC_SOURCECFG_SM_*. I want to show by such identation that it is 
> values for SM field of APLIC_SOURCECFG.
> 
> > And the xxx-es in here mean what exactly? Don't care? Some other, unrelated
> > values? Yet something else?
> 
> The `x` bits denote address bits that are constant across all IMSIC 
> interrupt files. They are not used to encode the group, HART, or guest 
> index; instead, they correspond to the fixed portion of the IMSIC 
> address determined by the platform's memory map.
> 
> For example, consider the IMSIC DT binding:
> 
>      interrupt-controller@28000000 {
>        compatible = "qemu,imsics", "riscv,imsics";
>        interrupts-extended = <&cpu1_intc 9>,
>                              <&cpu2_intc 9>,
>                              <&cpu3_intc 9>,
>                              <&cpu4_intc 9>;
>        reg = <0x28000000 0x2000>, /* Group0 IMSICs */
>              <0x29000000 0x2000>; /* Group1 IMSICs */
>        interrupt-controller;
>        #interrupt-cells = <0>;
>        msi-controller;
>        #msi-cells = <0>;
>        riscv,num-ids = <127>;
>        riscv,group-index-bits = <1>;
>        riscv,group-index-shift = <24>;
>      };
> 
> 
> Here, `hart_index_bits = 2` (4 CPUs) and `guest_index_bits = 0`, so the 
> address layout becomes:
> 
> 31          25 24 23         14 13 12 11          0
> +-------------+-+-------------+-----+-------------+
> | constant    |G|  constant   |HART |    zeros    |
> +-------------+-+-------------+-----+-------------+
> 
> 
> I can update the comment to say:
> "x denotes bits that are constant across all interrupt file addresses."
> 
> or, if you think it's clearer: "x denotes bits whose values are 
> platform-defined and common to all interrupt file addresses."
> 
> Does it make sense any of suggested options?
> 
> > Nit: Indentation.
> 
> I will use the following indentation:
> 
> ... (((irqn) < (d)->arch.vintc->nr_virqs) && \
>       test_bit(irqn, (d)->arch.vintc->used_irqs))
> 
> > Is this really meant to stay?
> 
> For debug purpose it could be useful, so I prefer to have it with 
> changing it to gprintk(XENLOG_DEBUG, ...) to understand which domain is 
> trying to access something wrong.
> 
> > The U suffix is mainly (even if only slightly) obfuscating things, I think.
> 
> Agree, I will drop U.
> 
> > I don't quite understand the need for the cast.
> 
> Functionally it isn't need but it documents that it is expected that 
> translation from unsinged long  to uint32_t will happen. I will drop the 
> cast.
> 
> > Why the cf_check (also for the store counterpart)?
> 
> Missed to drop. Before vaplic_emulate_load() was used to initialize 
> vints_ops. It should be dropped here.
> 
> > You have d as a local variable.
> > 
> > 
> > Use domain_vcpu()?
> 
> It will be better, thanks.
> 
> > Instead of this goto, I think you simply want to move the label here.
> > That'll also make the function more similar to its load counterpart.
> 
> Good point. I am curious how fail label should be aligned:
> 
>      default:
>   fail:
>          gdprintk(XENLOG_WARNING,
>                   "Unhandled APLIC write at offset %#x (value %#x)\n", 
> offset,
>                   value);
> 
>          return rc;
>      }
> 
> or default:
>      fail:
> 
> ?
> 
> > You have v passed in here, but you'd log current. If passing in v is
> > necessary (i.e. here or elsewhere it may be other than current), then you
> > need to either ASSERT(v == current) at the top of the funciton or otherwise
> > handle v != current correctly.
> 
> It makes sense. I will add ASSERT(v == current) here and for 
> vaplic_mmio_write().
> 
> > If all you care about is a boolean result, why not make the function return
> > bool?
> 
> Agree, bool will be enough for vaplic_emulate_load() and 
> vaplic_emulate_save().
> 
> Thanks!
> 
> ~ Oleksii

I will try to draw some schema to make the AIA spec more explicit. Maybe
it could be part of this series, I don't know what is the xen policy
about diagram and stuff like that. Do you know more about that? In order
to not do a job with no needed at all.


