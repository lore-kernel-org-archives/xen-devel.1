Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01374C9830B
	for <xen-devel@archiver.kernel.org>; Wed, 23 Sep 2026 16:16:31 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1431034.1653430 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9Pdn-00076d-Ex; Wed, 23 Sep 2026 16:16:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1431034.1653430; Wed, 23 Sep 2026 16:16:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9Pdn-00076W-CM; Wed, 23 Sep 2026 16:16:15 +0000
Received: by outflank-mailman (input) for mailman id 1431034;
 Wed, 23 Sep 2026 16:16:13 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1x9Pdl-00076Q-RF
 for xen-devel@lists.xenproject.org; Wed, 23 Sep 2026 16:16:13 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x9Pdl-009hFR-83
 for xen-devel@lists.xenproject.org; Wed, 23 Sep 2026 18:16:13 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0cf0d8f3d00072c4@swg.vates.tech>)
 id 6ab3fb4c-8faa-0a2a0a5109dd-0a2a4501e296-2
 for <xen-devel@lists.xenproject.org>; Wed, 23 Sep 2026 18:16:13 +0200
Received: from [185.255.28.35] (helo=prod-mta-13-02.swg-srv.net)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0cf0d8f3d00072c4@swg.vates.tech>)
 id 6ab3fb4c-5984-0a2a45010019-b9ff1c23993f-3
 for <xen-devel@lists.xenproject.org>; Wed, 23 Sep 2026 18:16:13 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-02.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a0cf0d8f3d00072c4.007 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 23 Sep 2026 16:16:07 +0000
Received: from [192.168.1.46] (areims-651-1-80-194.w90-18.abo.wanadoo.fr
 [90.18.187.194]) (Authenticated sender: baptiste.le-duc)
 by mail2.vates.fr (Postfix) with ESMTPSA id AC42D823C8;
 Wed, 23 Sep 2026 18:16:06 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=oQLDKepFC1/6fjRcI/L2o87sUQfeFA1nZIRfVNoZT78=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:content-transfer-encoding:in-reply-to:references:feedback-id;
 b=Fclsr/LBOObgvt8b8WHi/RKMgTyarqOZ1VSuLow+4WIqR/fQ7qu/u0PBi3qqUC1iuoqgc/WBu
 YB+ipP7qIjdV7IHUyUXuOM9P9UewiWBv3H/7Hn62VUF9xINVjivYzNcx4cTe7v1Fmv7YyNEZfks
 2j9NuYPwo2+0c9qus0wLFMgqQMWCYN2DdsfPhDnllvcd1Irb2QlM7jif6vVfaeSUNVsHnIvwZqR
 oewpcug1TWFP5xSjqVl67UF+Rr4uGF2rgz2zKktTuNGdgP1cdYUqB+4YyYVAeEpgBbxN5e9xoPG
 eXTwCC/G3aAAWbHEizG7HatOR9J9tvFTIsF1lErwpRyA==
X-Zone-Loop: bb80efb9a9318bf4bdf9d1e1622e77e992dd89d3a31e
x-campaign-type: default
x-transaction-id: 6c308739-af24-4265-bc3e-e33eebd8e8a2
x-swg-uid: 01-0329b717-3c87-490f-a76b-f7f39bc26e42
X-Mailer: Sweego
Message-ID:
 <1790180167.8631fc262581453bbf619ec5b2062170.1a0cf0d8f3d00072c4@vates.tech>
x-swg-bid: 1790180167.8631fc262581453bbf619ec5b2062170.1a0cf0d8f3d00072c4
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2 33/39] xen/riscv: dump old interrupt file to memory
From: Baptiste Le Duc <baptiste.le-duc@vates.tech>
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Baptiste Le Duc <baptiste.le-duc@vates.tech>, 
 xen-devel@lists.xenproject.org, 
 Romain Caritey <Romain.Caritey@microchip.com>, 
 Zheng Zhang <zhangzheng@iscas.ac.cn>, 
 Alistair Francis <alistair.francis@wdc.com>, 
 Connor Davis <connojdavis@gmail.com>, 
 Andrew Cooper <andrew.cooper3@citrix.com>, 
 Anthony PERARD <anthony.perard@vates.tech>, 
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, 
 Julien Grall <julien@xen.org>, 
 =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>, 
 Stefano Stabellini <sstabellini@kernel.org>
In-Reply-To: <ec47ff4f-68a2-46aa-a128-4663ebd95c7e@gmail.com>
References: <cover.1787838835.git.oleksii.kurochko@gmail.com>
 <efecffa9cd7c4bb6e9ed51b7fd084328fcd4611e.1787838835.git.oleksii.kurochko@gmail.com>
 <1790176561.8631fc262581453bbf619ec5b2062170.1a0ced6896200072c4@vates.tech>
 <ec47ff4f-68a2-46aa-a128-4663ebd95c7e@gmail.com>
Date: Wed, 23 Sep 2026 18:16:01 +0200
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790180161; l=5132;
 i=baptiste.le-duc@vates.tech; s=20260810; h=from:subject:message-id;
 bh=Iybz0s5DPivkmLYMGXVMKTbxH9pgRvXaJVT7/W66QwI=;
 b=ttMi1pbP5KAjMSSAe6zAlSTxylLn9EaiiDLR1TTmAsor1SBqbO3RQf3YD1M2A3TUeRmMXHHsh
 7H1KP3uWackBR1eYsa8nm3sgRdx6XmkN66HtJTZsneE6CFPvUKdqy71
X-Developer-Key: i=baptiste.le-duc@vates.tech; a=ed25519;
 pk=N+BbdvMXRzrCuX/ieh4RWodiAKcLNvI+KjflcZ0oXCo=
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1790180166910
X-purgate-ID: tlsNG-d62444/1790180173-BE664757-A97AF55A/10/73395122804
X-purgate-type: spam
X-purgate-size: 5136

On 2026-09-23 18:02 +0200, Oleksii Kurochko wrote:
> 
> 
> On 9/23/26 5:15 PM, Baptiste Le Duc wrote:
> >> At the old interrupt file, dump to memory all the eip and eie arrays).
> > Typo `)`
> 
> Will drop `)`.
> 
> >> After this step is done, the old interrupt file is no longer in use so
> >> old intrrupt file VGEIN could be released.
> >>
> >> Restoring of old interrupt file state will be done in follow-up
> >> patch.
> >>
> > 
> > 
> >> There are cases where it is needed to specify on which cpu it is
> >> necessary to VGEIN should be released so update vgein_release() to
> > 
> > The sentence miss a verb, here is a proposal:
> > ```
> > There are cases where the cpu on which the VGEIN is released needs to
> > be specified, so update vgein_release() to deal with that.
> > ```
> 
> I think it could be dropped at all as vgein_release() stub is just 
> introduced here and not updated.
> 
> > Moreover, could you explain me the cases you are talking about? It's not
> > clear by reading the commit message in the first place.
> 
> For example, during migration of vCPU, vCPU->processor points to new CPU 
> where it will be run but we still have to free VGEIN on the prev. 
> ->processor.
> 
> > 
> > 
> >> deal with that.
> > 
> > 
> > 
> > 
> >>
> > 
> > 
> >> Keep BUG_ON("unimplemented") placeholder in imsic_migrate_vcpu() to guard
> > 
> > 
> >> against silent incorrect behaviour or unexpected panics in guest VMs until
> >> the function is fully implemented.
> >>
> > 
> > 
> >> vgein_release() is stub for now and will be introduced later.
> > 
> > 
> >>
> >> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> >>
> >> diff --git a/xen/arch/riscv/aia.c b/xen/arch/riscv/aia.c
> >> index 75c82bcfa1..be3901ec0c 100644
> >> --- a/xen/arch/riscv/aia.c
> >> +++ b/xen/arch/riscv/aia.c
> >> @@ -30,3 +30,8 @@ unsigned int vgein_assign(struct vcpu *v)
> >>   
> >>       return 0;
> >>   }
> >> +
> >> +void vgein_release(struct vcpu *v, unsigned int vgein_id, unsigned int cpu)
> >> +{
> >> +    BUG_ON("unimplemented\n");
> >> +}
> >> diff --git a/xen/arch/riscv/imsic.c b/xen/arch/riscv/imsic.c
> >> index 5e9f6995e4..3cba58e0c1 100644
> >> --- a/xen/arch/riscv/imsic.c
> >> +++ b/xen/arch/riscv/imsic.c
> >> @@ -56,6 +56,24 @@ static unsigned int __ro_after_init guest_num_msis;
> >>    */
> >>   #define GUEST_IMSIC_MAX_MSIS 255U
> >>   
> >> +/*
> >> + * The interrupt identities an IMSIC interrupt file provides are 0 (which is
> >> + * never valid, but still occupies a bit) up to IMSIC_MAX_ID inclusive, so
> >> + * IMSIC_MAX_ID + 1 bits have to be covered.
> >> + */
> >> +#define IMSIC_MAX_EIX DIV_ROUND_UP(IMSIC_MAX_ID + 1, BITS_PER_TYPE(uint64_t))
> > 
> > 
> >> +
> >> +struct imsic_mrif_eix {
> >> +    unsigned long eip[BITS_PER_TYPE(uint64_t) / BITS_PER_LONG];
> >> +    unsigned long eie[BITS_PER_TYPE(uint64_t) / BITS_PER_LONG];
> > 
> > 
> >> +};
> >> +
> >> +struct imsic_mrif {
> >> +    struct imsic_mrif_eix eix[IMSIC_MAX_EIX];
> >> +    unsigned long eithreshold;
> >> +    unsigned long eidelivery;
> >> +};
> >> +
> > Maybe I didn't get something but I couldn't find anything in the commit
> > message explaining why do we use mrif here.
> 
> It is just convenient way to temporary store h/w interrupt file. Also it 
> could be used not only for ...
> 
> > 
> > Moreover, mrif, as described in aia spec (8.3 Memory-resident interrupt
> > files), seems to be only usable with IOMMU that Xen doesn't support.
> 
> ... IOMMU but also to support more guest interrupts file implemented by 
> IMSIC (basically what I am calling as software interrupt file). Without 
> memory-resident interrupt files, the number of virtual RISC-V harts that 
> can directly receive MSIs from devices is limited by the total number of 
> guest interrupt files implemented by all IMSICs in the system, because 
> all MSIs to RISC-V harts must go through IMSICs. For a single RISC-V 
> hart, the number of guest interrupt files is the GEILEN parameter 
> defined by the Privileged Architecture, which can be at most 31 for RV32 
> and 63 for RV64.
> 
> > 
> > If you want to have something in memory that could store some interrupt
> > file info, we should take another name to not be confusing.
> 
> It seems like it is okay to use memory residential interrupt file (mrif) 
> here based on KVM's code who are using mrif for the same purpose I 
> described above.
> 
> In short, MRIF is a joint virtualization technology shared between the 
> IOMMU and the hypervisor. The IOMMU uses the MRIF as a memory target to 
> land incoming hardware MSIs, while the hypervisor manages these MRIFs in 
> RAM as software data structures to support an effectively unlimited 
> number of vCPUs that don't currently hold a physical IMSIC guest file slot.
> 
Yes, I read the spec to understand but here, mrif doesn't catch the MSIs
right? so it's not exactly the behaviour mentioned or you have in mind
to add full support when IOMMU will be supported?

> ~ Oleksii
> 
> 
> 



