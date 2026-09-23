Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5B6FC982FA
	for <xen-devel@archiver.kernel.org>; Wed, 23 Sep 2026 12:16:14 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1430278.1652802 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9Lsx-0004kr-EJ; Wed, 23 Sep 2026 12:15:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1430278.1652802; Wed, 23 Sep 2026 12:15:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9Lsx-0004kj-A9; Wed, 23 Sep 2026 12:15:39 +0000
Received: by outflank-mailman (input) for mailman id 1430278;
 Wed, 23 Sep 2026 12:15:38 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1x9Lsv-0004kb-JA
 for xen-devel@lists.xenproject.org; Wed, 23 Sep 2026 12:15:38 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x9Lsu-007jMO-WA
 for xen-devel@lists.xenproject.org; Wed, 23 Sep 2026 14:15:37 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0ce31488500072c4@swg.vates.tech>)
 id 6ab3c2db-e002-0a2a0a5209dd-0a2a4502ab0e-44
 for <xen-devel@lists.xenproject.org>; Wed, 23 Sep 2026 14:15:36 +0200
Received: from [185.255.28.34] (helo=prod-mta-13-01.swg-srv.net)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0ce31488500072c4@swg.vates.tech>)
 id 6ab3c2e8-6ca4-0a2a45020019-b9ff1c228bf7-3
 for <xen-devel@lists.xenproject.org>; Wed, 23 Sep 2026 14:15:36 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-01.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a0ce31488500072c4.007 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 23 Sep 2026 12:15:31 +0000
Received: from [192.168.1.46] (areims-651-1-80-194.w90-18.abo.wanadoo.fr
 [90.18.187.194]) (Authenticated sender: baptiste.le-duc)
 by mail2.vates.fr (Postfix) with ESMTPSA id 88662821D0;
 Wed, 23 Sep 2026 14:15:30 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=BXA/xZrK7qbUzj5CdTkyj0eFU/ACd0spVO4w9gv8LDI=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:content-transfer-encoding:in-reply-to:references:feedback-id;
 b=h6QTIxvdof37gUbwo8dn9ZeL5MEDHAE6DkG6dHHCRo4jOjtZ5/STYUOxyABBxJPMOCIPtzwQq
 SjL1T+mR1RjT14eyFM+/oifhqyI+vf5+Gg8xrtcEZbxj8rgjYkaEgM7WYCbsR5g0CYqX0A5Al5X
 Yru80pT1QSLdCO6vnjbLV37ZIrX8eIaDug8brh2/ZrCo6QMWAHzSCO+jqKAiIB0a0iIcxMaUh+/
 AZwxQhtb3EtPrLp4q1iE5GDFvzsSR6eFY9IOoVFzM80zdPDEvlHnJjoQUP21CjENNX1QXbvcATY
 dWHO8V1kQs+28WAE7jw1dDOgzl3ZRIJDcSN5p5wg2wsg==
X-Zone-Loop: df19d74efeea9eaa38707cb655f52ab688699ea3d9d3
x-campaign-type: default
x-transaction-id: 69b697b0-4e47-4f90-ab55-8c08355dbc31
x-swg-uid: 01-1661bd48-ee02-4300-a83e-67d03e7f4fc7
X-Mailer: Sweego
Message-ID:
 <1790165731.8631fc262581453bbf619ec5b2062170.1a0ce31488500072c4@vates.tech>
x-swg-bid: 1790165731.8631fc262581453bbf619ec5b2062170.1a0ce31488500072c4
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2 31/39] xen/riscv: implement APLIC-hart sync barrier
 for vCPU migration
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
In-Reply-To: <1cf983c9-456b-4137-b302-e60a0f5ed057@gmail.com>
References: <cover.1787838835.git.oleksii.kurochko@gmail.com>
 <3d953b6e7f221f4cf4143454076466fab38b6236.1787838835.git.oleksii.kurochko@gmail.com>
 <1790096435.8631fc262581453bbf619ec5b2062170.1a0ca0fea6500072c4@vates.tech>
 <6da5569d-8ae8-4388-a407-00b5d2a4bc27@gmail.com>
 <1cf983c9-456b-4137-b302-e60a0f5ed057@gmail.com>
Date: Wed, 23 Sep 2026 14:15:25 +0200
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790165725; l=4819;
 i=baptiste.le-duc@vates.tech; s=20260810; h=from:subject:message-id;
 bh=cR4lKVyGqbLaLxXYF/cwm1EWPPEICePCmiVQuJuVqRQ=;
 b=Q0FtZKLXNb4vPQjNyhGEMJ0LGbQQ5qgNAtVZS7iRFNlmapsf88IsaS65Frs9/Dwvd+OlYxD9O
 bGP/WVd7HbuBDF3/SqsApxAeFADrAgmWZ7h86HhANESAExu2nKegCpA
X-Developer-Key: i=baptiste.le-duc@vates.tech; a=ed25519;
 pk=N+BbdvMXRzrCuX/ieh4RWodiAKcLNvI+KjflcZ0oXCo=
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1790165730760
X-purgate-ID: tlsNG-720697/1790165736-F34BE2AC-C9FCD9B4/10/73395122804
X-purgate-type: spam
X-purgate-size: 4823

On 2026-09-23 12:57 +0200, Oleksii Kurochko wrote:
> 
> 
> On 9/22/26 8:48 PM, Oleksii Kurochko wrote:
> > 
> > 
> > On 9/22/26 7:00 PM, Baptiste Le Duc wrote:
> >>> During migration of a virtual hart to a different guest interrupt file,
> >>> straggler MSIs from the APLIC could arrive at the old interrupt file
> >>> after the switch.
> >>>
> >>> genmsi is used despite not supporting guest interrupt files because the
> >>> AIA spec guarantees that all MSIs previously sent from the APLIC to the
> >>> same hart are visible at the hart's IMSIC before the extempore MSI from
> >>> genmsi becomes visible.
> >>
> >>
> >>>
> >>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> >>>
> >>> diff --git a/xen/arch/riscv/aplic.c b/xen/arch/riscv/aplic.c
> >>> index 0af13f28e4..cb11d6aeaa 100644
> >>> --- a/xen/arch/riscv/aplic.c
> >>> +++ b/xen/arch/riscv/aplic.c
> >>> @@ -27,7 +27,9 @@
> >>>   #include <asm/imsic.h>
> >>>   #include <asm/intc.h>
> >>>   #include <asm/io.h>
> >>> +#include <asm/processor.h>
> >>>   #include <asm/riscv_encoding.h>
> >>> +#include <asm/smp.h>
> >>>   static struct aplic_priv aplic = {
> >>>       .lock = SPIN_LOCK_UNLOCKED,
> >>> @@ -205,6 +207,30 @@ void aplic_hw_write_reg(unsigned int offset, 
> >>> uint32_t value)
> >>>       spin_unlock_irqrestore(&aplic.lock, flags);
> >>>   }
> >>> +/*
> >>> + * As needed, synchronize with all IOMMUs and APLICs to ensure that no
> >>> + * straggler MSIs will arrive at the old interrupt file after this 
> >>> step.
> >>> + */
> >>> +void aplic_genmsi_barrier(void)
> >>> +{
> >>> +    const struct imsic_config *imsic = imsic_get_config();
> >>> +    unsigned int cpu = smp_processor_id();
> >>> +    unsigned long flags;
> >>> +    uint32_t val;
> >>> +
> >>> +    val = MASK_INSR(aplic_hart_field(cpu), APLIC_TARGET_HART_IDX) |
> >>> +          (imsic->sync_id & APLIC_TARGET_EIID);
> >>
> >>
> >>> +
> >>> +    spin_lock_irqsave(&aplic.lock, flags);
> >>> +
> >>> +    writel(val, &aplic.regs->genmsi);
> >>> +
> >>> +    while ( readl(&aplic.regs->genmsi) & APLIC_GENMSI_BUSY )
> >>> +        cpu_relax();
> >>> +
> >>> +    spin_unlock_irqrestore(&aplic.lock, flags);
> >>> +}
> >>> +
> >> According to AIA spec §4.9.3 (Synchronizing interactions between a 
> >> hart and the APLIC), the sequence needs 6 steps; this implements only 
> >> steps 2-5:
> >>
> >> - Step 1: clear the pending bit for sync_id at the hart's IMSIC before 
> >> writing genmsi.
> >> - Step 6: after releasing the lock, poll the pending bit for sync_id 
> >> at the hart's IMSIC until it's set.
> >>
> >> Step 4 (Busy clear) only means the APLIC has accepted/sent the MSI, 
> >> not that it has arrived at the hart (the spec notes an unspecified 
> >> travel delay).
> >> Without step 6, aplic_genmsi_barrier() returns before the MSI (and 
> >> thus prior MSIs) actually reach the hart, so it doesn't achieve the 
> >> barrier it's meant to
> >> provide.
> >>
> > 
> > It is really missed but it exists in riscv-next-upstream branch 
> > (https://gitlab.com/xen-project/people/olkur/xen/-/blob/riscv-next- 
> > upstreaming/xen/arch/riscv/imsic.c#L723).
> > 
> > I will re-check why it is missed here.
> 
> Step 1 and step 6 are not missing, they are just not part of
> aplic_genmsi_barrier() itself. They are done by its caller, which is 
> added in "xen/riscv: remap interrupts to new IMSIC VS-file":
> 
>      static void cf_check imsic_aplic_sync(void *unused)
>      {
>          imsic_local_eix_update(imsic_cfg.sync_id, 1, true, false);
> 
>          aplic_genmsi_barrier();
> 
>          while ( !imsic_local_is_pending(imsic_cfg.sync_id) )
>              cpu_relax();
>      }
> 
> I did consider doing all six steps inside aplic_genmsi_barrier(), but 
> that would make aplic.c reach into IMSIC internals (the local EIx CSR 
> accessors, which are private to imsic.c), and I would rather not add 
> that dependency. Keeping the APLIC half (write genmsi, wait for Busy to 
> clear) in aplic.c and the IMSIC half (clear the pending bit of sync_id 
> before, poll it until set afterwards) in imsic.c keeps the layering clean.
> 
> You are right, though, that nothing in this patch says so, and that the
> helper on its own is not the full barrier its name suggests. I will 
> spell the split out in the commit message and in the comment above the 
> function.
> 
> Probably it will be better to introduce function imsic_aplic_sync() as a 
> part of this patch.
Yes it would make sense as function imsic_aplic_sync() is introduced in
next patch so reviewer couldn't know the existence of it when reading
this patch. Thanks for that!
> 
> ~ Oleksii
> 
> 
> 



