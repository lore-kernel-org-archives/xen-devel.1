Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF921C5B572
	for <xen-devel@archiver.kernel.org>; Thu, 13 Aug 2026 09:43:12 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1389674.1630317 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wuRxl-0001GN-UQ; Thu, 13 Aug 2026 09:43:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1389674.1630317; Thu, 13 Aug 2026 09:43:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wuRxl-0001GG-Rl; Thu, 13 Aug 2026 09:43:01 +0000
Received: by outflank-mailman (input) for mailman id 1389674;
 Thu, 13 Aug 2026 09:43:00 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wuRxk-0001G2-AY
 for xen-devel@lists.xenproject.org; Thu, 13 Aug 2026 09:43:00 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wuRxj-008wub-Ms
 for xen-devel@lists.xenproject.org; Thu, 13 Aug 2026 11:42:59 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19ffa80d28a000c4f3@swg.vates.tech>)
 id 6a7d9196-8faa-0a2a0a5109dd-0a2a4507b010-42
 for <xen-devel@lists.xenproject.org>; Thu, 13 Aug 2026 11:42:59 +0200
Received: from [185.255.28.35] (helo=prod-mta-13-02.swg-srv.net)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19ffa80d28a000c4f3@swg.vates.tech>)
 id 6a7d91a3-b4ea-0a2a45070019-b9ff1c239a29-3
 for <xen-devel@lists.xenproject.org>; Thu, 13 Aug 2026 11:42:59 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-02.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19ffa80d28a000c4f3.007 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 13 Aug 2026 09:42:54 +0000
Received: from [192.168.1.46] (areims-651-1-80-194.w90-18.abo.wanadoo.fr
 [90.18.187.194]) (Authenticated sender: baptiste.le-duc)
 by mail2.vates.fr (Postfix) with ESMTPSA id 836E28220A;
 Thu, 13 Aug 2026 11:42:53 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=h/ypzQ1qRuJcef4sANwVi/+OW7XxeGhQlNwQty2cXgI=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:content-transfer-encoding:in-reply-to:references:feedback-id;
 b=Wb5N1H06JLVo/+5W0op7qTtJVpzAEMLMon3RlWe3u+KYFFRoCxkCQz+tv621DLq8Rh46E4SBj
 zm2qqVKIDzKLi+oKgtLtV1qZ+ZQXHiQkySALk1ofzv2opVzSVQuQcDC67goyhn8aIbJBF+b8Tl1
 7PISXN24rWXl17RKnq6LqMirnnN/p5EXHI7caZkByOQptejrX93a5EWUQUvl3npmzAdRWqOTkWR
 qGvfNgmtI6Y6BGb/TR3a8YIKci7JB2bSq4gM5maf4rSCngLTUXEnBaKVAdSUkGsZQ1MmO7lP8z6
 FNalSDdBEZ9CUa1Cz3MGt09B/tNl+GS2rUhoxbOLDlSg==
X-Zone-Loop: fed377fdb2487f537e17ef7d1851f97f560eb6d9c239
x-campaign-type: default
x-transaction-id: 1e9f8f56-0e76-4e9a-a834-3d2d358783b8
x-swg-uid: 01-31e80262-3334-409d-98d9-4d05d87c0cad
X-Mailer: Sweego
Message-ID:
 <1786614174.8631fc262581453bbf619ec5b2062170.19ffa80d28a000c4f3@vates.tech>
x-swg-bid: 1786614174.8631fc262581453bbf619ec5b2062170.19ffa80d28a000c4f3
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v1 10/17] xen/riscv: introduce
 vintc_state_{save,restore}()
From: Baptiste Le Duc <baptiste.le-duc@vates.tech>
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: xen-devel@lists.xenproject.org, 
 Romain Caritey <Romain.Caritey@microchip.com>, 
 Baptiste Le Duc <baptiste.le-duc@vates.tech>, 
 Alistair Francis <alistair.francis@wdc.com>, 
 Connor Davis <connojdavis@gmail.com>, 
 Andrew Cooper <andrew.cooper3@citrix.com>, 
 Anthony PERARD <anthony.perard@vates.tech>, 
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, 
 Julien Grall <julien@xen.org>, 
 =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
 Stefano Stabellini <sstabellini@kernel.org>
In-Reply-To: <e71f53f1165619fabb9f79f34cc931cd4296af67.1784560663.git.oleksii.kurochko@gmail.com>
References: <cover.1784560663.git.oleksii.kurochko@gmail.com>
 <e71f53f1165619fabb9f79f34cc931cd4296af67.1784560663.git.oleksii.kurochko@gmail.com>
Date: Thu, 13 Aug 2026 11:42:46 +0200
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786614173; l=2526;
 i=baptiste.le-duc@vates.tech; s=20260810; h=from:subject:message-id;
 bh=GhgZ6vMvKdO+oq9Y1BEW1KDxH9FfRP6JyD9r8UfhwKE=;
 b=JF+Mi+akL0r5vWZGOugPSCRKxozTpmeUgqrR9X7/zfdWQjVZHpwEel0RrF/hpu2H8mUplTM0C
 hbXVg3bNjl9CC4zfZuyM0VzRwMbxUZXqvoOXUWbE9ThDGeElVW/AJyd
X-Developer-Key: i=baptiste.le-duc@vates.tech; a=ed25519;
 pk=N+BbdvMXRzrCuX/ieh4RWodiAKcLNvI+KjflcZ0oXCo=
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1786614173842
X-purgate-ID: tlsNG-ef75cf/1786614179-376D2AE4-5AD7CC58/10/73395122804
X-purgate-type: spam
X-purgate-size: 2526

> Virtual interrupt controller state must be preserved across vCPU context
> switches: for AIA, a vCPU's guest interrupt file lives in the IMSIC of
> the pCPU it runs on, so the related state has to be saved when the vCPU
> is descheduled and re-established when it is scheduled again.
> 
> Introduce vintc_state_save()/vintc_state_restore() wrappers around new
> store_state()/restore_state() hooks in struct vintc_ops, so that the
> context switch path can save/restore this state without knowing which
> vINTC variant a domain uses.


> 
> No callers are wired up yet: the vAPLIC implementation of the hooks is


> added by the follow-up patch, and the calls from the context switch path
> will be introduced together with vCPU context switch support.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>
> diff --git a/xen/arch/riscv/include/asm/intc.h b/xen/arch/riscv/include/asm/intc.h
> index 2ee5d1533c..f4f0ce365c 100644
> --- a/xen/arch/riscv/include/asm/intc.h
> +++ b/xen/arch/riscv/include/asm/intc.h
> @@ -64,6 +64,12 @@ struct vintc_ops {
>  
>      /* Deinitialize some vINTC-related stuff for a vCPU */
>      void (*vcpu_deinit)(struct vcpu *v);
> +
> +    /* Store virtual interrupt controller state */
> +    void (*store_state)(struct vcpu *v);
> +
> +    /* Restore virtual interrupt controller state */
> +    void (*restore_state)(struct vcpu *v);
>  };


>  
>  struct vintc {
> @@ -91,4 +97,7 @@ void domain_vintc_deinit(struct domain *d);
>  
>  bool vintc_reserve_virq(const struct domain *d, unsigned int virq);
>  
> +void vintc_state_save(struct vcpu *vcpu);


> +void vintc_state_restore(struct vcpu *vcpu);


> +
>  #endif /* ASM__RISCV__INTERRUPT_CONTOLLER_H */
> diff --git a/xen/arch/riscv/intc.c b/xen/arch/riscv/intc.c
> index 372c8d3a20..879d513374 100644
> --- a/xen/arch/riscv/intc.c
> +++ b/xen/arch/riscv/intc.c
> @@ -163,3 +163,17 @@ bool vintc_reserve_virq(const struct domain *d, unsigned int virq)
>  
>      return !test_and_set_bit(virq, d->arch.vintc->used_irqs);
>  }
> +
> +void vintc_state_save(struct vcpu *vcpu)
> +{
> +    const struct vintc_ops *ops = vcpu->domain->arch.vintc->ops;
Is there a situation where ops could be NULL? If yes, add a check.
> +
> +    ops->store_state(vcpu);
> +}
> +
> +void vintc_state_restore(struct vcpu *vcpu)
> +{
> +    const struct vintc_ops *ops = vcpu->domain->arch.vintc->ops;
Same as above

-- 
Baptiste Le Duc <baptiste.le-duc@vates.tech>

