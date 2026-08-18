Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37489C5DF80
	for <xen-devel@archiver.kernel.org>; Tue, 18 Aug 2026 08:29:14 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1393649.1632460 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwFBj-0002BL-UY; Tue, 18 Aug 2026 08:28:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1393649.1632460; Tue, 18 Aug 2026 08:28:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwFBj-0002BA-Pr; Tue, 18 Aug 2026 08:28:51 +0000
Received: by outflank-mailman (input) for mailman id 1393649;
 Tue, 18 Aug 2026 08:28:50 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a013fcb15a000c4f3@swg.vates.tech>)
 id 1wwFBi-0002B4-He
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2026 08:28:50 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wwFBg-001fvd-VW
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2026 10:28:48 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a013fcb15a000c4f3@swg.vates.tech>)
 id 6a8417b4-bab6-0a2a0a5309dd-0a2a450bd304-18
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 10:28:48 +0200
Received: from [185.255.28.18] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a013fcb15a000c4f3@swg.vates.tech>)
 id 6a8417c0-b7e8-0a2a450b0019-b9ff1c12a333-3
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 10:28:48 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a013fcb15a000c4f3.007 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 18 Aug 2026 08:28:42 +0000
Received: from [192.168.1.17] (lfbn-gre-1-371-96.w90-112.abo.wanadoo.fr
 [90.112.87.96]) (Authenticated sender: baptiste.le-duc@vates.tech)
 by mail2.vates.fr (Postfix) with ESMTPSA id C4AAD8387F;
 Tue, 18 Aug 2026 10:28:41 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=r5WVRdBGOceVMVwcG+Gv/vWAgeYC7BhFIH6R93zEkfM=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:content-transfer-encoding:in-reply-to:references:feedback-id;
 b=HFmysp/JQhNelCAATMuwkWbhfy8k+Vwsq9JqYc73JwNImXEETsgP7SySfKzsMmIbVo9O0ADbC
 tcTaTb1OCryV1byaqIXphNIubHdvc867lcKvwzlaRv6rkBhXFZe5geznwYBHVOZCuJNOtaYRUie
 57UxyQ8ojuGhbQuV9RQ4to1yEVEhVJrXyY4g5EmCteHEjteVdi3lUR09g8oW2ZJsBPLvPUrnrDG
 +fMtLqT3SPfgk0W3l7RCyaavtVUCYsX3rzpQDq864NaugJoZfRbL/Jk/XN2Pk18PegJg+4AkeEp
 A+XiIA2mEP8Xe0xl7vkO0MHcU22VB3qgtJTV3Orr/8cA==
X-Zone-Loop: e5130db2204b6b2ca21217d42104af8bd1f5379c1045
x-campaign-type: default
x-transaction-id: f1d3bf31-b3f2-4192-9d86-8b18d64f8198
x-swg-uid: 01-80a118a5-825e-401e-b65f-a4100b62be9a
X-Mailer: Sweego
Message-ID:
 <1787041722.8631fc262581453bbf619ec5b2062170.1a013fcb15a000c4f3@vates.tech>
x-swg-bid: 1787041722.8631fc262581453bbf619ec5b2062170.1a013fcb15a000c4f3
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
In-Reply-To: <cae4c5ef-cc4a-47a0-90fa-2f84c00ba4a6@gmail.com>
References: <cover.1784560663.git.oleksii.kurochko@gmail.com>
 <e71f53f1165619fabb9f79f34cc931cd4296af67.1784560663.git.oleksii.kurochko@gmail.com>
 <1786614174.8631fc262581453bbf619ec5b2062170.19ffa80d28a000c4f3@vates.tech>
 <cae4c5ef-cc4a-47a0-90fa-2f84c00ba4a6@gmail.com>
Date: Tue, 18 Aug 2026 10:28:28 +0200
X-Developer-Signature: v=1; a=openssh-sha256; t=1787041721; l=1739;
 i=baptiste.le-duc@vates.tech; h=from:subject:message-id;
 bh=JbcJf4dkvQ7ngMpfVYGeElsA2ynqU2bI968PDCcJzdM=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgQKqDblDzOFimZyyhA+RsKnxim2EiA
 60KatQBsuueKYUAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QPbTq3r5z8P5yLkOq5ksX2PeJvmZEmlYQBcJgSDFPIz7gPAyMXC9sy3ml+eeLm1WpJa+aGQjOAp
 CzSojT2E1DwY=
X-Developer-Key: i=baptiste.le-duc@vates.tech; a=openssh;
 fpr=SHA256:YieMhmvNcCYpeUbL6HuedGp4rwSlu4mQ+D7EJoVHM+k
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1787041722146
X-purgate-ID: tlsNG-42698a/1787041728-AB6D29EA-28DBCBCA/0/0
X-purgate-type: clean
X-purgate-size: 1743

On 2026-08-17 10:31 +0200, Oleksii Kurochko wrote:
> 
> 
> On 8/13/26 11:42 AM, Baptiste Le Duc wrote:
> >>   #endif /* ASM__RISCV__INTERRUPT_CONTOLLER_H */
> >> diff --git a/xen/arch/riscv/intc.c b/xen/arch/riscv/intc.c
> >> index 372c8d3a20..879d513374 100644
> >> --- a/xen/arch/riscv/intc.c
> >> +++ b/xen/arch/riscv/intc.c
> >> @@ -163,3 +163,17 @@ bool vintc_reserve_virq(const struct domain *d, unsigned int virq)
> >>   
> >>       return !test_and_set_bit(virq, d->arch.vintc->used_irqs);
> >>   }
> >> +
> >> +void vintc_state_save(struct vcpu *vcpu)
> >> +{
> >> +    const struct vintc_ops *ops = vcpu->domain->arch.vintc->ops;
> > Is there a situation where ops could be NULL? If yes, add a check.
> 
> It is unlikely that there is nothing to do during a context switch for 
> vINTC, so vINTC should provide an implementation for saving and 
> restoring its context. This also ensures that a NULL pointer dereference 
> will lead to a trap, allowing us to catch cases where a 
> context-switch/restore handler is missing.
> 
> Even if it turns out that vINTC does not need to perform any actions 
> during a context switch, it is perfectly fine to provide an empty 
> implementation. However, as mentioned above, this is unlikely. 
> Therefore, having a NULL pointer dereference here is intentional: it 
> helps catch cases where someone adds a new interrupt controller driver 
> but forgets to implement the corresponding context switch functionality.

Thanks for these explanations. However, wouldn't it be better to have a
dedicated BUG_ON in case of NULL dereference to indicate clean call
trace to people who missed to implement context-switch functionality?

> 
> ~ Oleksii
> 
> 



