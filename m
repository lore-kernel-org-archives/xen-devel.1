Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 811F1C5CFC1
	for <xen-devel@archiver.kernel.org>; Tue, 11 Aug 2026 08:14:09 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1388018.1629226 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wthc9-0007Tv-8f; Tue, 11 Aug 2026 08:13:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1388018.1629226; Tue, 11 Aug 2026 08:13:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wthc9-0007To-5t; Tue, 11 Aug 2026 08:13:37 +0000
Received: by outflank-mailman (input) for mailman id 1388018;
 Tue, 11 Aug 2026 08:13:35 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19fefe239f8000c4f3@swg.vates.tech>)
 id 1wthc6-0007Tf-UY
 for xen-devel@lists.xenproject.org; Tue, 11 Aug 2026 08:13:35 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wthc4-00H3UQ-Nv
 for xen-devel@lists.xenproject.org; Tue, 11 Aug 2026 10:13:32 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19fefe239f8000c4f3@swg.vates.tech>)
 id 6a7ad9a1-8faa-0a2a0a5109dd-0a2a450a9cbe-48
 for <xen-devel@lists.xenproject.org>; Tue, 11 Aug 2026 10:13:32 +0200
Received: from [185.255.28.35] (helo=prod-mta-13-02.swg-srv.net)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19fefe239f8000c4f3@swg.vates.tech>)
 id 6a7ad9ab-f2d2-0a2a450a0019-b9ff1c2384ab-3
 for <xen-devel@lists.xenproject.org>; Tue, 11 Aug 2026 10:13:31 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-02.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19fefe239f8000c4f3.007 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 11 Aug 2026 08:13:28 +0000
Received: from [192.168.1.46] (areims-651-1-80-194.w90-18.abo.wanadoo.fr
 [90.18.187.194]) (Authenticated sender: baptiste.le-duc)
 by mail2.vates.fr (Postfix) with ESMTPSA id 8F0EE812E3;
 Tue, 11 Aug 2026 10:13:27 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=aoB1eTjT2z4wVpGDNPvLeVwtALQ/pSrK3gx3t7yGMpA=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:content-transfer-encoding:in-reply-to:references:feedback-id;
 b=OljU4eXRyYpojIIB6q47SGMzJfGOwMr+gXl8Kmx1R9e6n+Yi2K9kDubjI0wOPihqtaABybHmd
 hDMDblIpTRnKoFyFtKZ7e0kAswv+m/TC7AtqY5Cox18qKNmMj8AJNWdNg/Ez1ssr1PHDkQvpENR
 nvb48rOUAJZop/ENCSa8dZQB7e19BmUE2Tuwz5UogNUQO5Mj2jxvKBQeG0PAGl5ukg4IdXHXcGE
 8Jpry8syDQVZ7e3xhVu9R4daq3h+rpJMk9AmWekiV1qAU2b3CDH28ZdZwzsr6xd0GJrrOaD5N0k
 /jpm9YjkJmXNIkqtJ2bdymakCdeTYAXuFVn612hGHNlQ==
X-Zone-Loop: fb89ade2c7f7d53dcc4a6a88abc581905772adc757ec
x-campaign-type: default
x-transaction-id: 06423ebd-9e2c-4e67-b852-b3ec771235ee
x-swg-uid: 01-68685a54-ecb5-401f-bcd4-2dc78b2f18b6
X-Mailer: Sweego
Message-ID:
 <1786436008.8631fc262581453bbf619ec5b2062170.19fefe239f8000c4f3@vates.tech>
x-swg-bid: 1786436008.8631fc262581453bbf619ec5b2062170.19fefe239f8000c4f3
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v1 02/17] xen/riscv: add basic VGEIN management for AIA
 guests
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
In-Reply-To: <293a08d8-ff96-4726-b713-bc2d14973ca4@gmail.com>
References: <cover.1784560663.git.oleksii.kurochko@gmail.com>
 <b141b8d976719bb9b76147cacfd5842fb7aac74e.1784560663.git.oleksii.kurochko@gmail.com>
 <1786368748.8631fc262581453bbf619ec5b2062170.19febdfed5f000e099@vates.tech>
 <293a08d8-ff96-4726-b713-bc2d14973ca4@gmail.com>
Date: Tue, 11 Aug 2026 10:13:22 +0200
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786436007; l=3715;
 i=baptiste.le-duc@vates.tech; s=20260810; h=from:subject:message-id;
 bh=jGG0To3SQ8A2ektFXLw/w53WF2jrX05Bhc1JG2cnuP8=;
 b=i2l9TT7BNVWCKMxwxRhTjf0fbzGEXHJtsjLaTUQ+yP34nN06AR7wLE2jeXyjB+zNhLGK3zGUC
 vDXP4qlHbLsBWUAlnZP4TprWwXWHm8LQZVgchrXtQWHbHMv9gfmsb4F
X-Developer-Key: i=baptiste.le-duc@vates.tech; a=ed25519;
 pk=N+BbdvMXRzrCuX/ieh4RWodiAKcLNvI+KjflcZ0oXCo=
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1786436007777
X-purgate-ID: tlsNG-4011c0/1786436011-536D6CFC-E1FE3249/0/0
X-purgate-type: clean
X-purgate-size: 3719

On 2026-08-10 17:04:43+02:00, Oleksii Kurochko wrote:
> On 8/10/26 3:32 PM, Baptiste Le Duc wrote:
> 
> >> It was decided to add support for IMSIC from the start instead of having APLIC
> > 
> > Add a #include <xen/percpu.h> here instead of in aia.h.
> 
> Sorry, but I’m a little confused here. <asm/aia.h> doesn’t include 
> <xen/percpu.h>.
> 
Yes it is, in xen.git/xen/arch/riscv/asm/aia.h, you added, in this patch
    #include <xen/percpu.h>
Therefore, I think it could be included directly in the aia.c file as it
is the only place where it is used.
> > Could we call this function with a different cpu arg than the current
> > one running? If yes, we would read hgeie of not the cpu we wanted.
> 
> Considering that it touches the CSR_HGIEI register, it can only be 
> called on the currently running CPU.
> 
> That’s why I suggested in one of my replies to Jan B. that I would drop 
> the argument altogether for this function.
> 
> >> +{
> > 
> > 
> > Why `0` rather than smp_processor_id()? As described above vgein_init() reads CSR_HGEIE
> > of the current hart but stores the result into per_cpu(vgein, cpu), so the two
> > must agree.
> 
> aia_init() is executed on boot cpu only so it uses 0 as Xen boot cpu is 
> always 0. But it won't be an issue anymore as I mentioned above an 
> argument of vgein_init() will be dropped anyway so it will be guaranteed 
> that a correct CPU is used.
> 
> > What happens if v->processor change between vgein_assign() and
> > vgein_release? Because it seems in such case the release will hit a
> > different pCPU's bitmap: the original bit will leak and an unrelated
> > CPU's bit will be cleared under another vCPU's feet.
> 
> So, if v->processor changes between the calls to vgein_assign() and 
> vgein_release(), it means that migration has happened. If migration has 
> happened, then it is the responsibility of the migration code to 
> properly assign the new vgein and release the previous one.
> 
> All other cases where vgein_release() is called are when the vCPU is 
> dying, so everything is okay there as migration cannot happen.
> 
> > Potential index error, because above you did:
> > 
> >      vgein->owners = xvzalloc_array(struct vcpu*, vgein->geilen)
> > 
> > so valid index are 0...(vgein->geilen-1). Adopt either
> > one of those two options:
> >      1. vgein->owners[vgein_id-1] = v
> >      2. vgein->owners = xvzalloc_array(struct vcpu *, vgein->geilen+1) in
> >         vgein_init()
> > 
> > I think `2` could be better to have vgein->owners replicated hgeie CSR but
> > it would left the first entry read-only.
> 
> I've found that too during prepare a reply to Jan B. so fixed it already 
> in v2. I've decided to go with what you suggested in 2.
> 
> > VGEIN_DEBUG is not defined anywhere in the patch, please use
> > gdprintk(XENLOG_DEBUG, ...) directly, or drop this branch.
> 
> It is intentionally not defined. If a user needs additional VGEIN debug 
> information, they should define it themselves, as it can produce a 
> pretty large amount of logs due to, for example, the migration process, 
> where vgein_assign() and vgein_release() are used quite actively.
> 
Oh I didn't know it was a common practice, thanks for this explanation.
> > asm/aia.h needs neither <xen/percpu.h> nor <xen/spinlock.h> as struct
> > vgein_ctrl and the per-CPU variable both live in aia.c. Please drop them
> > and add <xen/percpu.h> in aia.c
> 
> Yes, it is redundant code that I missed removing. I’ve already noticed 
> it and removed it in v2.
It's what I wanted to mean in the comment above about <xen/percpu.h>
> Thanks.
Happy to help :)
> 
> ~ Oleksii



