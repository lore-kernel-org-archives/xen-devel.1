Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C287C982DA
	for <xen-devel@archiver.kernel.org>; Fri, 18 Sep 2026 09:21:55 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1425038.1649202 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x7Umu-0002wV-C8; Fri, 18 Sep 2026 09:21:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1425038.1649202; Fri, 18 Sep 2026 09:21:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x7Umu-0002wO-8z; Fri, 18 Sep 2026 09:21:44 +0000
Received: by outflank-mailman (input) for mailman id 1425038;
 Fri, 18 Sep 2026 09:21:43 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0b3d2454000072c4@swg.vates.tech>)
 id 1x7Umt-0002wI-2S
 for xen-devel@lists.xenproject.org; Fri, 18 Sep 2026 09:21:43 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x7Ums-00BnNQ-FG
 for xen-devel@lists.xenproject.org; Fri, 18 Sep 2026 11:21:42 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0b3d2454000072c4@swg.vates.tech>)
 id 6aad029c-bab6-0a2a0a5309dd-0a2a45029a6c-20
 for <xen-devel@lists.xenproject.org>; Fri, 18 Sep 2026 11:21:42 +0200
Received: from [185.255.28.35] (helo=prod-mta-13-02.swg-srv.net)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0b3d2454000072c4@swg.vates.tech>)
 id 6aad02a6-6ca4-0a2a45020019-b9ff1c23b15d-3
 for <xen-devel@lists.xenproject.org>; Fri, 18 Sep 2026 11:21:42 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-02.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a0b3d2454000072c4.007 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 18 Sep 2026 09:21:37 +0000
Received: from [192.168.1.46] (areims-651-1-80-194.w90-18.abo.wanadoo.fr
 [90.18.187.194]) (Authenticated sender: baptiste.le-duc)
 by mail2.vates.fr (Postfix) with ESMTPSA id 639E2820E3;
 Fri, 18 Sep 2026 11:21:36 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=UOM25LSPPP3/4I8O84HDA4IQydPDOie/ahFidAghSHA=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:content-transfer-encoding:in-reply-to:references:feedback-id;
 b=evAIaSdHbtygyjJR06C6IYlENSP78efmOPxqBoQyvfGkUDecWuTvy6ct7Yq2ZnaYrq4zwFYIS
 Ydg5K/8z54kkcZd5K2O6auhTUYPxhMpLFKBCOo8YjD2URH6HeFWqF+TROIzYRWTa6+DI5TeJrK1
 b069z/sIFpkbeuvAgDw7E71b+8o/EwAEj8G8t2qAg2qUauKTJ3Sy6GRIA0e4oNsxhJ+zAaLiO4u
 tjHxDCDm6+RdqyJD3iEv+AVdLJx3oIP8kXCJGC6ngSM7g9EfkY+wsD46dNQcGvFpfx0BjeQvZDh
 X9pjHRIe7IbAgTiIYLAa0K5lkS/2IVbtiimrv+C8zkgw==
X-Zone-Loop: 88998e8a40861dccdab1b95f9e4f8dd18177cfef6039
x-campaign-type: default
x-transaction-id: 7424afb5-a667-4fce-ad23-2c1fba2d945e
x-swg-uid: 01-7c0b6ab0-ca17-4835-8d44-52217f678979
X-Mailer: Sweego
Message-ID:
 <1789723297.8631fc262581453bbf619ec5b2062170.1a0b3d2454000072c4@vates.tech>
x-swg-bid: 1789723297.8631fc262581453bbf619ec5b2062170.1a0b3d2454000072c4
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2 28/39] xen/riscv: handle the case when no vCPU
 migration is needed
From: Baptiste Le Duc <baptiste.le-duc@vates.tech>
To: Jan Beulich <jbeulich@suse.com>
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>, 
 Romain Caritey <Romain.Caritey@microchip.com>, 
 Baptiste Le Duc <baptiste.le-duc@vates.tech>, 
 Zheng Zhang <zhangzheng@iscas.ac.cn>, 
 Alistair Francis <alistair.francis@wdc.com>, 
 Connor Davis <connojdavis@gmail.com>, 
 Andrew Cooper <andrew.cooper3@citrix.com>, 
 Anthony PERARD <anthony.perard@vates.tech>, 
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>, 
 =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>, 
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
In-Reply-To: <63eb5954-0c34-4cec-9037-b25724b68f47@suse.com>
References: <cover.1787838835.git.oleksii.kurochko@gmail.com>
 <c4f78f50022bd7a75a4deb71199e979beafb4906.1787838835.git.oleksii.kurochko@gmail.com>
 <63eb5954-0c34-4cec-9037-b25724b68f47@suse.com>
Date: Fri, 18 Sep 2026 11:21:30 +0200
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789723291; l=1602;
 i=baptiste.le-duc@vates.tech; s=20260810; h=from:subject:message-id;
 bh=XF+DjpkZ5bbLAmRm1I58wMYZUqH/4T5AvmRWgGWvcbw=;
 b=l5Hevoostmi6RAC2nwtWCWClbj+F4AhoWRvi9NMy21Y6PejrEBC7RLV/imiDT77EEI+VmXPgb
 4ghyMjwcwLzCY6Ae+WECoX4bcp1jTscv7d7hQoR74vYFRQzxSOF8UUw
X-Developer-Key: i=baptiste.le-duc@vates.tech; a=ed25519;
 pk=N+BbdvMXRzrCuX/ieh4RWodiAKcLNvI+KjflcZ0oXCo=
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1789723296609
X-purgate-ID: tlsNG-720697/1789723302-F28B42AC-C92D6645/0/0
X-purgate-type: clean
X-purgate-size: 1606

On 2026-09-14 14:12:07+02:00, Jan Beulich wrote:
> On 27.08.2026 17:21, Oleksii Kurochko wrote:
> 
> > The IMSIC vsfile mapping is performed in continue_new_vcpu(), since the
> > target pCPU must be known at that point. It is therefore possible for
> > imsic_migrate_vcpu() to be called before continue_new_vcpu() has
> > executed, in which case v->arch.last_pcpu is NR_CPUS and there is nothing
> > to migrate.
> > 
> > Add a BUG_ON("unimplemented") placeholder in imsic_migrate_vcpu() to guard
> > against silent incorrect behaviour or unexpected panics in guest VMs until
> > the function is fully implemented.
> 
> This doesn't adequately describe the change made: The BUG_ON() was already
> there.
> 
> > --- a/xen/arch/riscv/imsic.c
> > +++ b/xen/arch/riscv/imsic.c
> > @@ -689,5 +689,15 @@ int __init vimsic_make_domu_dt_node(struct kernel_info *kinfo,
> >  
> >  void imsic_migrate_vcpu(struct vcpu *v)
> >  {
> > +    /*
> > +     * The scheduler can mark a freshly created vCPU's unit as migrated and
> > +     * invoke this before the vCPU has ever run (see the migrated branch in
> > +     * schedule()). No need to do migration for such vCPUs as they aren't fully
> > +     * initialized (for example, context_switch() will be called after
> > +     * imsic_migrate_vcpu()).
> > +     */
> > +    if ( v->arch.last_cpu == NR_CPUS )
> 
> May I suggest to use >= ? I'm still somewhat unconvinced of NR_CPUS being a
> good sentinel. If we/you decided to switch to ~0, >= here would continue to
> be correct.
I also agree that ~0 would be better.
> 
> Jan



