Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65ACAC5CFC1
	for <xen-devel@archiver.kernel.org>; Tue, 11 Aug 2026 08:17:49 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1388026.1629236 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wthfy-00088p-PH; Tue, 11 Aug 2026 08:17:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1388026.1629236; Tue, 11 Aug 2026 08:17:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wthfy-00088i-Kn; Tue, 11 Aug 2026 08:17:34 +0000
Received: by outflank-mailman (input) for mailman id 1388026;
 Tue, 11 Aug 2026 08:17:33 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19fefe5dbbc000c4f3@swg.vates.tech>)
 id 1wthfx-00088c-89
 for xen-devel@lists.xenproject.org; Tue, 11 Aug 2026 08:17:33 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wthfw-00Dd5e-8I
 for xen-devel@lists.xenproject.org; Tue, 11 Aug 2026 10:17:32 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19fefe5dbbc000c4f3@swg.vates.tech>)
 id 6a7ada96-bab6-0a2a0a5309dd-0a2a4504a5ba-20
 for <xen-devel@lists.xenproject.org>; Tue, 11 Aug 2026 10:17:32 +0200
Received: from [185.255.28.34] (helo=prod-mta-13-01.swg-srv.net)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19fefe5dbbc000c4f3@swg.vates.tech>)
 id 6a7ada9b-b57f-0a2a45040019-b9ff1c229bd5-3
 for <xen-devel@lists.xenproject.org>; Tue, 11 Aug 2026 10:17:32 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-01.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19fefe5dbbc000c4f3.007 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 11 Aug 2026 08:17:26 +0000
Received: from [192.168.1.46] (areims-651-1-80-194.w90-18.abo.wanadoo.fr
 [90.18.187.194]) (Authenticated sender: baptiste.le-duc)
 by mail2.vates.fr (Postfix) with ESMTPSA id CD19680B2A;
 Tue, 11 Aug 2026 10:17:25 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=VfuExQmoNgTZXE5+VBkz/9xRzW2zILQKGMuooSznwdY=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:content-transfer-encoding:in-reply-to:references:feedback-id;
 b=HDgZ/eHyzIztICAkmrRPnX1tPLiK5fXEYrcG4aqurvYkP0nqTynam3YFbw/QJOq9kcXGpDA1t
 JSd74weaza3YiroHSqPREa+EX8RZtU2Jnc0S3p8/pzd5GFGHjMu7EaQUKyk6SWFjLN9dVn50DQt
 4NHbuFn36XzTaTS0vco4wOoSAPUgUyGtPgUpedBTdTUAutRg/tRXvluQtPFC2beou8G0pjNJyUr
 rvuSbq221HWzeH099Daz0taU+EjSiqKkhs1PNOerc7Vr1cf88VQZicXgG9cmFLmHeEzAFqdwr/6
 H/VPlZPVFkJZOIVfOsGAgTUvRp0ywgHUxmr7z2/1DVPA==
X-Zone-Loop: 1d3495b58ea3199696d3fdff1748772b67e1d5f2a59a
x-campaign-type: default
x-transaction-id: 2d9719b5-0336-4957-a9f5-3199505dc255
x-swg-uid: 01-118367d2-c25f-4560-bff3-f1d9c775db70
X-Mailer: Sweego
Message-ID:
 <1786436246.8631fc262581453bbf619ec5b2062170.19fefe5dbbc000c4f3@vates.tech>
x-swg-bid: 1786436246.8631fc262581453bbf619ec5b2062170.19fefe5dbbc000c4f3
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v1 04/17] xen/riscv: introduce device-agnostic MMIO
 emulation dispatch
From: Baptiste Le Duc <baptiste.le-duc@vates.tech>
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Baptiste Le Duc <baptiste.le-duc@vates.tech>, 
 xen-devel@lists.xenproject.org, 
 Romain Caritey <Romain.Caritey@microchip.com>, 
 Alistair Francis <alistair.francis@wdc.com>, 
 Connor Davis <connojdavis@gmail.com>, 
 Andrew Cooper <andrew.cooper3@citrix.com>, 
 Anthony PERARD <anthony.perard@vates.tech>, 
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, 
 Julien Grall <julien@xen.org>, 
 =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
 Stefano Stabellini <sstabellini@kernel.org>
In-Reply-To: <05283ea0-de82-4160-a3f9-5fc1292a20a5@gmail.com>
References: <cover.1784560663.git.oleksii.kurochko@gmail.com>
 <c12b69710d7b79bfc0c110f3fa043d871d8b8394.1784560663.git.oleksii.kurochko@gmail.com>
 <1786373377.8631fc262581453bbf619ec5b2062170.19fec268e07000e099@vates.tech>
 <05283ea0-de82-4160-a3f9-5fc1292a20a5@gmail.com>
Date: Tue, 11 Aug 2026 10:17:20 +0200
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786436245; l=2419;
 i=baptiste.le-duc@vates.tech; s=20260810; h=from:subject:message-id;
 bh=WABT/iU4gh03Q3pGmRICfSFFfgjHolSslfi1RQTxhmE=;
 b=nvkbCvR/W6wmC1Tt9FGxWwIQidgRA3QCJVS2t0oXC2SHJkJLOT213HNl6R2TvWyFURqcbbBb8
 2bAPhhTDeERDwuxlqYhFdP9PuIZA1+TzZau9bE7en4AlHQYexDUOYsI
X-Developer-Key: i=baptiste.le-duc@vates.tech; a=ed25519;
 pk=N+BbdvMXRzrCuX/ieh4RWodiAKcLNvI+KjflcZ0oXCo=
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1786436246032
X-purgate-ID: tlsNG-ebf023/1786436252-C12DCB50-7ACB3400/0/0
X-purgate-type: clean
X-purgate-size: 2423

On 2026-08-10 17:36:56+02:00, Oleksii Kurochko wrote:
> On 8/10/26 4:49 PM, Baptiste Le Duc wrote:
> 
> >> diff --git a/xen/arch/riscv/include/asm/mmio.h b/xen/arch/riscv/include/asm/mmio.h
> > 
> > According to coding style, it should be GPL-2.0-only.
> 
> Could you please point me to the line in the coding style document where 
> this is mentioned?
> 
> If you are referring to:
>    New files should start with a single-line SPDX comment to express the
>    license, e.g.:
> 
>    /* SPDX-License-Identifier: GPL-2.0-only */
> 
>    See LICENSES/ for a list of licenses and SPDX tags currently used.
> 
> Then my understanding is that /* SPDX-License-Identifier: GPL-2.0-only 
> */ is used only as an example, and I can choose any license from 
> LICENSES/. There, it is mentioned:
>    Valid-License-Identifier: LGPL-2.0-only
>    Valid-License-Identifier: LGPL-2.0-or-later
> 
> I am pretty sure that I am free to choose any license that does not 
> conflict with the other licenses used in the project.
> 
Oh ok I didn't know, thanks for these explanations. Could you let me
know how do you choose one instead of the other in that case? Is there a
rule from our company to follow somewhere?
> >> +#ifndef RISCV_MMIO_H
> > 
> > Nit: line too long (85)
> 
> I will apply that. Actually I've already fixed that by putting the 
> comment above:
>    /* store: value to write; load: value read (set by handler) */
>    register_t data;
> 
> >> diff --git a/xen/arch/riscv/mmio.c b/xen/arch/riscv/mmio.c
> > Should be GPL-2.0-only.
> 
> Regarding license I've wrote a comment above so lets continue discussion 
> there.
> 
> >> +/*
> > Why have you included a copyright notice here, but not in the other
> > files?
> 
> So I just decided to do that for new files as I am not using corporate 
> e-mail.
But why didn't you do it for all new files of this series?
> 
> I don’t know if you can keep it,
> 
> Good point, I have to ask then someone from our legal department...
> 
>   but I just wanted to point out
> 
> > that there are other files where this type of copyright notice includes
> > the year.
> 
> Before, I used to include the year, but someone pointed out (or perhaps 
> I misunderstood) that there isn’t much point in including it and that it 
> is enough to have just (c) <company name>.
> 
Okay thanks.
> Thanks.
> 
> ~ Oleksii



