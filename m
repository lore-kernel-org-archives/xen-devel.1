Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D117606A31E
	for <xen-devel@archiver.kernel.org>; Thu, 22 Oct 2026 13:38:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=vates.tech header.i=@vates.tech header.a=rsa-sha256 header.s=selector1 header.b=YTluAJyl
Received: from list by lists.xenproject.org with outflank-mailman.1458192.1670612 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xJt0C-0005mz-Kf; Thu, 22 Oct 2026 13:38:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1458192.1670612; Thu, 22 Oct 2026 13:38:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xJt0C-0005ms-G9; Thu, 22 Oct 2026 13:38:40 +0000
Received: by outflank-mailman (input) for mailman id 1458192;
 Thu, 22 Oct 2026 13:38:39 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a163d5b71c000f79f@swg.vates.tech>)
 id 1xJt0A-0005mk-TD
 for xen-devel@lists.xenproject.org; Thu, 22 Oct 2026 13:38:39 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xJt0A-00DgZE-1d
 for xen-devel@lists.xenproject.org; Thu, 22 Oct 2026 15:38:38 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a163d5b71c000f79f@swg.vates.tech>)
 id 6ada11dd-e002-0a2a0a5209dd-0a2a450abb86-0
 for <xen-devel@lists.xenproject.org>; Thu, 22 Oct 2026 15:38:37 +0200
Received: from [185.255.28.34] (helo=prod-mta-13-01.swg-srv.net)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a163d5b71c000f79f@swg.vates.tech>)
 id 6ada11dd-f2d2-0a2a450a0019-b9ff1c22866b-3
 for <xen-devel@lists.xenproject.org>; Thu, 22 Oct 2026 15:38:37 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-01.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a163d5b71c000f79f.007 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 22 Oct 2026 13:38:32 +0000
Received: from [192.168.1.52] (areims-651-1-80-194.w90-18.abo.wanadoo.fr
 [90.18.187.194]) (Authenticated sender: baptiste.le-duc)
 by mail2.vates.fr (Postfix) with ESMTPSA id 1194681F99;
 Thu, 22 Oct 2026 15:38:32 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=Dw2fRabQzezKIvf1NlRVsFOL1aPuqwy/+pE/9/FVYoY=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:content-transfer-encoding:in-reply-to:references:feedback-id;
 b=YTluAJyl4oUBmdqafQ+q5IKyH6exDQ+IXX+/qBHafyPbClpHhzIEge64N8pbPkHzYAGNMiavV
 8jhRSBJnl2kROeUuEYMoe8nzWLAirhS0XKubEv52YkfNvkItceKp31C/7n63Sn2xMfjqBdnBckA
 96dLk3+Nb5uAzWpPavGPWqX9MOEUrIRzsl1yNhYvRu1uRS/v8dLIkoEFvAsr2WgK9NZ/YWLByVD
 KPKsCrOSLuPN+tGFJL0ML2yumpMVlM0LcsD1dDNKoYBQxalyrSvqTE2WMjELCjAOawPlKuTdWD1
 BKGh1a460J4vdbvdqdItWmfLgW46i6ZMhMXOFxH0d+6A==
X-Zone-Loop: d4412244508ebb3d9c39299f20368ee0a55e8e0b7acf
x-campaign-type: default
x-transaction-id: 741cd6fe-b53b-4940-b75f-67a53c9a1e60
x-swg-uid: 01-70aeb852-b246-42ad-b9c2-b61e0734f86e
X-Mailer: Sweego
Message-ID:
 <1792676312.8631fc262581453bbf619ec5b2062170.1a163d5b71c000f79f@vates.tech>
x-swg-bid: 1792676312.8631fc262581453bbf619ec5b2062170.1a163d5b71c000f79f
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v3 28/39] xen/riscv: introduce
 vaplic_reconfigure_target()
From: Baptiste Le Duc <baptiste.le-duc@vates.tech>
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: xen-devel@lists.xenproject.org, 
 Romain Caritey <Romain.Caritey@microchip.com>, 
 Baptiste Le Duc <baptiste.le-duc@vates.tech>, 
 Zheng Zhang <zhangzheng@iscas.ac.cn>, 
 Alistair Francis <alistair.francis@wdc.com>, 
 Connor Davis <connojdavis@gmail.com>, 
 Andrew Cooper <andrew.cooper3@citrix.com>, 
 Anthony PERARD <anthony.perard@vates.tech>, 
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, 
 Julien Grall <julien@xen.org>, 
 =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>, 
 Stefano Stabellini <sstabellini@kernel.org>
In-Reply-To: <ccbe8db271e53f13bfc4bd223d546e8531108310.1790779209.git.oleksii.kurochko@gmail.com>
References: <cover.1790779209.git.oleksii.kurochko@gmail.com>
 <ccbe8db271e53f13bfc4bd223d546e8531108310.1790779209.git.oleksii.kurochko@gmail.com>
Date: Thu, 22 Oct 2026 15:38:25 +0200
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792676306; l=4924;
 i=baptiste.le-duc@vates.tech; s=20260810; h=from:subject:message-id;
 bh=PlTw2plOSyk8QEZxKYG1XQ1GcZaion0uCbPoCk5yMGM=;
 b=DPzKUZogmhcCjlkmdiSLqH0LlRY19qJWzdx73YRaDo6YgBNph6qjmzUVhuhOz2dhffQoPSvBq
 DEGx51UEPs3AcAHswoXzL3i83EBpE+M7camDL997+zosqqlB0tY6j4v
X-Developer-Key: i=baptiste.le-duc@vates.tech; a=ed25519;
 pk=N+BbdvMXRzrCuX/ieh4RWodiAKcLNvI+KjflcZ0oXCo=
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1792676312282
X-purgate-ID: tlsNG-4011c0/1792676317-59BC0CFC-CA0692D1/0/0
X-purgate-type: clean
X-purgate-size: 4924
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

> When a vCPU is migrated to a different pCPU, its IMSIC guest interrupt
> file changes. Any APLIC interrupt previously configured to deliver an
> MSI to the old interrupt file must be retargeted to the new one.
> 
Jan's first question on v2 was how this avoids losing interrupts that
are raised mid-retarget. You answered it on the list (step 3 of the AIA
VS-level migration sequence; in-flight MSIs still land in the old file's
eip and get merged into the new file later), but neither the description
nor a comment says so. Please put it in the description, since this
function is only correct as one step of that sequence.

> [ ... 43 lines skipped ... ]
> --- a/xen/arch/riscv/aplic.c
> +++ b/xen/arch/riscv/aplic.c
> @@ -128,7 +128,10 @@ static unsigned long aplic_hart_index(unsigned int cpu)
>  /*
>   * v->processor can't be used here: during a migration it names the new pCPU
>   * before the interrupt file is moved there. The caller has to hold
> - * vsfile_lock until the result is written to the h/w.
> + * vsfile_lock, so that the guest file id and the pCPU owning it are read as
> + * a consistent pair. A value built from the old file just before a migration
> + * publishes the new one isn't lost: vaplic_reconfigure_target() runs after
> + * the publication and rewrites every source targeting the vCPU.
At this point in the series nothing calls vaplic_reconfigure_target(),
so "runs after the publication" describes a caller that doesn't exist
yet. Either move this sentence to the patch that adds the call, or word
it as a requirement on that caller.

> [ ... 43 lines skipped ... ]
>
> +/* Decode the target vCPU from a TARGET snapshot (NULL if none). */
> +static struct vcpu *vaplic_target_decode_vcpu(const struct domain *d,
> +                                              uint32_t target)
> +{
> +    unsigned int hart_idx = MASK_EXTR(target, APLIC_TARGET_HART_IDX);
> +
> +    /*
> +     * Skip a source whose EIID is 0, e.g. one still holding its reset
> +     * value: interrupt identity 0 isn't valid at any IMSIC interrupt file,
> +     * so such a source delivers nothing and needs no retargeting.
> +     * The hart index range check is only a guard: the write path refuses to
> +     * record values with an out-of-range hart index.
> +     */
"Reset value" reads as if the AIA spec defined one, but it doesn't: APLIC
state other than domaincfg, the MSI address config registers and the
genmsi Busy bit is UNSPECIFIED after reset. The 0 here only comes from
xvzalloc_array() in domain_vaplic_init(). Could this be made explicit?
It may also be worth saying that this check keeps unprogrammed sources
from decoding as targeting vCPU0 (hart index 0), which would otherwise
cause pointless physical TARGET rewrites on every vCPU0 migration.

Something like:

      /*
       * Skip a source whose EIID is 0 (not yet programmed, vAPLIC state
       * is zero-initialised): identity 0 is reserved at every IMSIC, so
       * it can't fire. Otherwise it would also decode as targeting
       * vCPU0 and get rewritten on every vCPU0 migration.
       * The hart index range check is only a guard: the write path
       * refuses to record values with an out-of-range hart index.
       */

> [ ... 6 lines skipped ... ]
> +void vaplic_reconfigure_target(const struct vcpu *v)
> +{
> +    struct domain *d = v->domain;
> +    struct vaplic *vaplic = to_vaplic(d);
> +    struct vimsic_state *vimsic_state = v->arch.vimsic_state;
> +    unsigned int irqn;
> +
> +    bitmap_for_each ( irqn, d->arch.vintc->used_irqs, d->arch.vintc->nr_virqs )
> +    {
> +        struct vaplic_source *src = &vaplic->regs.sources[irqn];
> +        unsigned long flags;
> +        uint32_t target;
> +
> +        /* APLIC interrupt sources start from 1, there is no source 0. */
> +        if ( !irqn )
> +            continue;
> +
> +        spin_lock_irqsave(&src->lock, flags);
> +
> +        target = read_atomic(&src->target);
> +
> +        if ( vaplic_target_decode_vcpu(d, target) == v )
> +        {
> +            /*
> +             * IRQs are already off under src->lock so no need for *_irqsave
> +             * here.
> +             */
> +            read_lock(&vimsic_state->vsfile_lock);
> +            aplic_hw_write_reg(offsetof(struct aplic_regs, target[irqn - 1]),
> +                               aplic_msi_target_gen(v, target));
>
Doesn't this need the same vsfile_cpu != CPU_NONE check as
vaplic_emulate_store()? Because it seems that, for a vCPU on a s/w
VS-file, aplic_msi_target_gen() calls aplic_hart_index(CPU_NONE) and
indexes imsic->msi[] out of bounds; the ASSERT() in
aplic_msi_target_gen() doesn't help in release builds. Since both
callers now do the same lock/check/generate/write sequence, a helper for
it would make sense.

-- 
Baptiste Le Duc <baptiste.le-duc@vates.tech>

