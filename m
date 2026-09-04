Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6606AC624D3
	for <xen-devel@archiver.kernel.org>; Fri,  4 Sep 2026 11:33:42 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1408307.1640938 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x2SAa-0004hv-SI; Fri, 04 Sep 2026 11:33:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1408307.1640938; Fri, 04 Sep 2026 11:33:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x2SAa-0004ho-PG; Fri, 04 Sep 2026 11:33:20 +0000
Received: by outflank-mailman (input) for mailman id 1408307;
 Fri, 04 Sep 2026 11:33:19 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1x2SAZ-0004gi-3M
 for xen-devel@lists.xenproject.org; Fri, 04 Sep 2026 11:33:19 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x2SAX-000O2A-Ux
 for xen-devel@lists.xenproject.org; Fri, 04 Sep 2026 13:33:17 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a06c31b828000c4f3@swg.vates.tech>)
 id 6a9aac71-bab6-0a2a0a5309dd-0a2a450cade0-18
 for <xen-devel@lists.xenproject.org>; Fri, 04 Sep 2026 13:33:17 +0200
Received: from [185.255.28.34] (helo=prod-mta-13-01.swg-srv.net)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a06c31b828000c4f3@swg.vates.tech>)
 id 6a9aac7d-f479-0a2a450c0019-b9ff1c22847f-3
 for <xen-devel@lists.xenproject.org>; Fri, 04 Sep 2026 13:33:17 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-01.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a06c31b828000c4f3.007 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 04 Sep 2026 11:33:12 +0000
Received: from [192.168.1.46] (areims-651-1-80-194.w90-18.abo.wanadoo.fr
 [90.18.187.194]) (Authenticated sender: baptiste.le-duc)
 by mail2.vates.fr (Postfix) with ESMTPSA id E952981E01;
 Fri,  4 Sep 2026 13:33:11 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=t9BuHE8obK9dSOMYNjEQsWnEnAKXBhY9xAbIFVOW7EE=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:content-transfer-encoding:in-reply-to:references:feedback-id;
 b=XHWY6VqyM9PPyHiriRoCwyz0id/59azo44BfxwPELGijo5j4wO+gI4kOhic7JUj30JytzgJqh
 pepErlmG+12BLeefAH9SIi63o0GmQhxTmXqMC5XzZ+JYKMch9gFEh3QUNWC7l3+UKgHKeGzXegg
 u3ctK6cwKu7WT9SS8EjWBeeUaE+tbQiGLhzaEc9gXCnAS6YJ+ANykCblzn7RBQkeni2JBLXBT+M
 oM8EHEdXnbx/LXDB1VscO2R56wC+SpOm1PsN3oCK3izOMEsgfL/2cCtvc+4czaQBxbLNYMhCHvx
 pnJu3Qz1m9co0QL/PYHc85IFarZ7qB6mehsaVZZxQr7g==
X-Zone-Loop: c1421a106663301ef218a06aa98c82b90cb2cf80646d
x-campaign-type: default
x-transaction-id: 2983af79-6a5d-445e-b1cd-36e3e0178a06
x-swg-uid: 01-db399680-487d-4c54-a8b2-3034c74d0bbb
X-Mailer: Sweego
Message-ID:
 <1788521592.8631fc262581453bbf619ec5b2062170.1a06c31b828000c4f3@vates.tech>
x-swg-bid: 1788521592.8631fc262581453bbf619ec5b2062170.1a06c31b828000c4f3
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2 15/39] xen/riscv: add IMSIC vCPU context switch
 handlers
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
In-Reply-To: <867af892784c295296cdf63e0371fa1b7ed7a1e7.1787838835.git.oleksii.kurochko@gmail.com>
References: <cover.1787838835.git.oleksii.kurochko@gmail.com>
 <867af892784c295296cdf63e0371fa1b7ed7a1e7.1787838835.git.oleksii.kurochko@gmail.com>
Date: Fri, 04 Sep 2026 13:33:04 +0200
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788521591; l=4122;
 i=baptiste.le-duc@vates.tech; s=20260810; h=from:subject:message-id;
 bh=kJkOyO+syx8smwQKel0X8vGDqkIGhKnScfznNqOrnns=;
 b=cQTPSKltBQ8XHFtji/AdOP22wZZUkOJnnb1KWruFfYoDMVbnZW0z5j7kDwQDYyIJZ1m6CD/NN
 UBwJI6X/qpEAe80isJdspzpB5sRhfQSGIzyplBxpbDzS9uUJEtlTt3k
X-Developer-Key: i=baptiste.le-duc@vates.tech; a=ed25519;
 pk=N+BbdvMXRzrCuX/ieh4RWodiAKcLNvI+KjflcZ0oXCo=
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1788521592154
X-purgate-ID: tlsNG-d25034/1788521597-50B3DA5B-3F773B20/10/73395122804
X-purgate-type: spam
X-purgate-size: 4122

> IMSIC state currently needs to track only which physical CPU owns a vCPU's
> IMSIC guest interrupt file, as the CPU id is part of the physical address
> the file is mapped at.
> 
> Add imsic_ctxt_switch_from() to record that CPU when a vCPU is switched
> out. A vCPU running on the s/w VS-file has no h/w file bound to a CPU, so
> there is nothing to record for it. The recorded value stays unused until
> vCPU migration support, which needs it to find the file to move away from,
> is added later.
> 
> imsic_ctxt_switch_to() has nothing to do: by the time a vCPU is switched
> in, VGEIN is already assigned to it and its guest interrupt file is already
> mapped. Work is only required once a vCPU can move to a different CPU,
> which means recalculating VGEIN and remapping the file; that is handled
> separately by the vCPU migration patches.
> 
> Install both as the ctxt_switch_{from,to} hooks of struct vintc_ops. MSI
> delivery is the only mode Xen supports ( aplic_init() panics on an APLIC
> without an "msi-parent" property, and a guest's domaincfg.DM reads back as
> a fixed one) so the vAPLIC state to save and restore is always the IMSIC
> one and no vAPLIC-level forwarder is needed. Being indirect call targets,
> both handlers get cf_check.
> 
> Co-developed-by: Romain Caritey <Romain.Caritey@microchip.com>
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>
> diff --git a/xen/arch/riscv/imsic.c b/xen/arch/riscv/imsic.c
> index ad0a220eda..3787f270d8 100644
> --- a/xen/arch/riscv/imsic.c
> +++ b/xen/arch/riscv/imsic.c
> @@ -20,6 +20,7 @@
>  #include <xen/init.h>
>  #include <xen/libfdt/libfdt.h>
>  #include <xen/macros.h>
> +#include <xen/rwlock.h>
>  #include <xen/sched.h>
>  #include <xen/smp.h>
>  #include <xen/spinlock.h>
> @@ -342,6 +343,28 @@ static int __init imsic_parse_node(const struct dt_device_node *node,
>      return 0;
>  }
>  
> +void cf_check imsic_ctxt_switch_from(struct vcpu *v)
> +{
> +    struct vimsic_state *imsic_state = v->arch.vimsic_state;
> +    unsigned long flags;
> +
> +    /*
> +     * A vCPU using the s/w IMSIC VS-file (guest_file_id == 0) has no h/w
> +     * VS-file bound to a physical CPU, so there is no location to record.
> +     */
> +    if ( !vcpu_guest_file_id(v) )
> +        return;
> +
> +    write_lock_irqsave(&imsic_state->vsfile_lock, flags);
> +    imsic_state->vsfile_cpu = v->processor;
> +    write_unlock_irqrestore(&imsic_state->vsfile_lock, flags);
> +}
> +
> +void cf_check imsic_ctxt_switch_to(struct vcpu *v)
> +{
> +    /* Nothing to do */
> +}
> +
>  int cf_check vcpu_imsic_init(struct vcpu *v)
>  {
>      struct vimsic_state *imsic_state;
> diff --git a/xen/arch/riscv/include/asm/imsic.h b/xen/arch/riscv/include/asm/imsic.h
> index 93f9e44c7d..73129c3c9e 100644
> --- a/xen/arch/riscv/include/asm/imsic.h
> +++ b/xen/arch/riscv/include/asm/imsic.h
> @@ -109,4 +109,7 @@ unsigned int vcpu_guest_file_id(const struct vcpu *v);
>  
>  int vimsic_make_domu_dt_node(struct kernel_info *kinfo, unsigned int *phandle);
>  
> +void imsic_ctxt_switch_from(struct vcpu *v);
> +void imsic_ctxt_switch_to(struct vcpu *v);
> +
>  #endif /* ASM_RISCV_IMSIC_H */
> diff --git a/xen/arch/riscv/vaplic.c b/xen/arch/riscv/vaplic.c
> index 8726f7203d..6c60fe2baf 100644
> --- a/xen/arch/riscv/vaplic.c
> +++ b/xen/arch/riscv/vaplic.c
> @@ -422,6 +422,13 @@ static const struct mmio_handler_ops vaplic_mmio_ops = {
>  static const struct vintc_ops vintc_ops = {
>      .vcpu_init = vcpu_imsic_init,
>      .vcpu_deinit = vcpu_imsic_deinit,
> +    /*
> +     * MSI delivery is the only supported mode: aplic_init() panics on an
> +     * APLIC without an "msi-parent", so the vAPLIC state to save and restore
> +     * is always the IMSIC one.
> +     */
> +    .ctxt_switch_from = imsic_ctxt_switch_from,
> +    .ctxt_switch_to = imsic_ctxt_switch_to,

Maybe this patch could be merged with previous one: patch 50fe9554e1c0 ("xen/riscv: introduce vintc_ctxt_switch_{from,to}()")

-- 
Baptiste Le Duc <baptiste.le-duc@vates.tech>

