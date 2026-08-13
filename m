Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D37AC5CFDB
	for <xen-devel@archiver.kernel.org>; Thu, 13 Aug 2026 09:30:55 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1389627.1630263 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wuRlm-0005A8-Ob; Thu, 13 Aug 2026 09:30:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1389627.1630263; Thu, 13 Aug 2026 09:30:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wuRlm-0005A1-LJ; Thu, 13 Aug 2026 09:30:38 +0000
Received: by outflank-mailman (input) for mailman id 1389627;
 Thu, 13 Aug 2026 09:30:36 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wuRlk-00059v-UE
 for xen-devel@lists.xenproject.org; Thu, 13 Aug 2026 09:30:36 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wuRlj-00FADr-PS
 for xen-devel@lists.xenproject.org; Thu, 13 Aug 2026 11:30:35 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19ffa7577c9000c4f3@swg.vates.tech>)
 id 6a7d8ebb-e002-0a2a0a5209dd-0a2a450ce42a-2
 for <xen-devel@lists.xenproject.org>; Thu, 13 Aug 2026 11:30:35 +0200
Received: from [185.255.28.34] (helo=prod-mta-13-01.swg-srv.net)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19ffa7577c9000c4f3@swg.vates.tech>)
 id 6a7d8ebb-f479-0a2a450c0019-b9ff1c229a83-3
 for <xen-devel@lists.xenproject.org>; Thu, 13 Aug 2026 11:30:35 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-01.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19ffa7577c9000c4f3.007 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 13 Aug 2026 09:30:30 +0000
Received: from [192.168.1.46] (areims-651-1-80-194.w90-18.abo.wanadoo.fr
 [90.18.187.194]) (Authenticated sender: baptiste.le-duc)
 by mail2.vates.fr (Postfix) with ESMTPSA id 617E0815F8;
 Thu, 13 Aug 2026 11:30:29 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=lA9l696Zhw5G7iBZqTE7zluJ/Dc+9NB/c0K+v0ZqFJM=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:content-transfer-encoding:in-reply-to:references:feedback-id;
 b=lkILRolV4qSvAiSbLnYShdrJUGA5/6Hr6tZb5HyKbMUxj6oL8LPlBHOd8rr7eUfgbf2OpDGkb
 DTCdXUJsfeokFRFxm0aSbuAs9QEtHFr8Om9cLv/b4WdfB8/YlW0wOIeDfm70QDhit5yloC4fgjL
 emllzKgY2FXlsAJLZnjf+EffXfHWu1Inq9te7t/Az0gYQtAE9febFNRga1R4bESYrVZR6w409yn
 neng70cP9yHWKn7KuS+UNPAn2fIZYEVsS7msaWPfPm+8swtkPYwi2WAvCTLaSOEKxhCXycmcyLV
 5VjxzQMxSur9vaT04wQeXKZzguDqvq/0mTUEhYL/eieg==
X-Zone-Loop: fb24413355519def26821c14deba7719a77926e529ab
x-campaign-type: default
x-transaction-id: f2012e9d-f77e-43bf-a633-4f32694a6d5c
x-swg-uid: 01-5fb208d5-3e36-4de2-bf09-fd2640f9efc8
X-Mailer: Sweego
Message-ID:
 <1786613430.8631fc262581453bbf619ec5b2062170.19ffa7577c9000c4f3@vates.tech>
x-swg-bid: 1786613430.8631fc262581453bbf619ec5b2062170.19ffa7577c9000c4f3
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v1 08/17] xen/riscv: add IMSIC state save/restore
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
In-Reply-To: <5e3df9ea4bafc5666d1885dfd40f534f8349879e.1784560663.git.oleksii.kurochko@gmail.com>
References: <cover.1784560663.git.oleksii.kurochko@gmail.com>
 <5e3df9ea4bafc5666d1885dfd40f534f8349879e.1784560663.git.oleksii.kurochko@gmail.com>
Date: Thu, 13 Aug 2026 11:30:22 +0200
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786613429; l=2338;
 i=baptiste.le-duc@vates.tech; s=20260810; h=from:subject:message-id;
 bh=bTaGYD/I2YNpv8P6YZhuklJ7/hph1PB1J2ttcJOAoyY=;
 b=PalooVOuQnvxJd5nR6Es0i/F/2BOcv9TJidOAe/TyjeBM/69iFFOZFuua0cJKrKCNQxBLPExs
 SQylRhvmCpYDM6kfXJSU8KginFxq9x4kfPAadYrNIfFQbghuexZ2mSB
X-Developer-Key: i=baptiste.le-duc@vates.tech; a=ed25519;
 pk=N+BbdvMXRzrCuX/ieh4RWodiAKcLNvI+KjflcZ0oXCo=
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1786613429713
X-purgate-ID: tlsNG-d25034/1786613435-52132A5B-365BB47C/10/73395122804
X-purgate-type: spam
X-purgate-size: 2338

> IMSIC state is currently needed only to track which physical CPU owns a
> vCPU's IMSIC interrupt file. This is required because the physical CPU
> ID is part of the physical address used to map the IMSIC file.
> 
> Add imsic_state_save() to record the current pCPU for a vCPU. When the
> vCPU is migrated to a different pCPU, the mapping will need to be updated.
> 
> When imsic_state_restore() is called, VGEIN is already assigned to the
> vCPU and the guest interrupt file is already mapped, and, as only h/w
> interrupt files are used for now, nothing specific needs to be done.
> Action is only required when the vCPU is moved to a different pCPU, which
> requires recalculating VGEIN and the mapping for the new guest interrupt
> file. That will be handled separately by vcpu_move_irqs(), which is
> introduced in a follow-up patch; until then this case is guarded by a
> BUG_ON(), which is fine.
> 
> Co-developed-by: Romain Caritey <Romain.Caritey@microchip.com>
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>
> diff --git a/xen/arch/riscv/imsic.c b/xen/arch/riscv/imsic.c
> index 2a792e756c..406bc68cbc 100644
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
> @@ -418,6 +419,28 @@ int imsic_map_guest_file(struct vcpu *v, unsigned int vsfile_id)
>      return res;
>  }
>  
> +void imsic_state_save(struct vcpu *v)
> +{
> +    struct vimsic_state *imsic_state = v->arch.vimsic_state;
> +    unsigned long flags;
> +
> +    /*
> +     * SW interrupt file always has ->vsfile_pcpu = NR_CPUS so nothing specific
> +     * should be done in this case.
> +     */
> +    if ( !vcpu_guest_file_id(v) )
> +        return;


> +
> +    write_lock_irqsave(&imsic_state->vsfile_lock, flags);
> +    imsic_state->vsfile_pcpu = cpuid_to_hartid(v->processor);

How will you detect a migration is needed? Don't you need to first know
if ->vsfile_pcpu is different to cpuid_to_hartid(v->processor)? (I
didn't take a look to other patchs for the moment, so the
explanations might be later.)

-- 
Baptiste Le Duc <baptiste.le-duc@vates.tech>

