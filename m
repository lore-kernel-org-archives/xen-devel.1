Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9235FC982FA
	for <xen-devel@archiver.kernel.org>; Tue, 22 Sep 2026 17:01:06 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1429259.1652171 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x93rI-0001wg-Cm; Tue, 22 Sep 2026 17:00:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1429259.1652171; Tue, 22 Sep 2026 17:00:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x93rI-0001wY-7w; Tue, 22 Sep 2026 17:00:44 +0000
Received: by outflank-mailman (input) for mailman id 1429259;
 Tue, 22 Sep 2026 17:00:43 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1x93rH-0001wN-17
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2026 17:00:43 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x93rF-005Abk-Rw
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2026 19:00:41 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0ca0fea6500072c4@swg.vates.tech>)
 id 6ab2b436-8faa-0a2a0a5109dd-0a2a450bd270-6
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 19:00:41 +0200
Received: from [185.255.28.18] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0ca0fea6500072c4@swg.vates.tech>)
 id 6ab2b439-b7e8-0a2a450b0019-b9ff1c12aa23-3
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 19:00:41 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a0ca0fea6500072c4.007 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 22 Sep 2026 17:00:35 +0000
Received: from [192.168.1.37] (lfbn-gre-1-371-96.w90-112.abo.wanadoo.fr
 [90.112.87.96]) (Authenticated sender: baptiste.le-duc)
 by mail2.vates.fr (Postfix) with ESMTPSA id 41B87829F2;
 Tue, 22 Sep 2026 19:00:33 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=IJPNXCUDrfDKlMgB/AMVKPZxO7W/NFwVwi45Sl/Gnp0=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:content-transfer-encoding:in-reply-to:references:feedback-id;
 b=m6J5RWEMm0XTH+JS8P8m92JX6px5HI/JLLeGLfpvmPOPz2v3TPhVhAUNllCUHXGQAanobZcs6
 17Luf7u3dZ2z0FBUwz9z59i3NE9pUzjaEjmfT46V1jmQFmZ96bUpUOcadhJlq6RXCp9484V+yBy
 kwR6HcRwyFzN2V1gc7/xBlSk4Ib9mNIDTu0zPm5c19QExiWHSzNshTT1kX2z0vXMpyP8JNR/hDa
 CG5tZLOG57LoN4J/jm7vNhAjlRGd+AbawW/N/LGtSYWbEzxILptP+UtMjGBD+ug3o3YmElxcEzO
 Iw94RMqBlj4vUKxBemM/VokjjhjXzLKrcW8MDaPit0Sg==
X-Zone-Loop: 3a345c1d85a50e16936e6a62e8c5239bd87b3fa8c707
x-campaign-type: default
x-transaction-id: 7d2ea33e-c4a2-44bd-ad4e-d79f0b644c24
x-swg-uid: 01-7f2fd41b-88ed-417b-9668-d77d1932586a
X-Mailer: Sweego
Message-ID:
 <1790096435.8631fc262581453bbf619ec5b2062170.1a0ca0fea6500072c4@vates.tech>
x-swg-bid: 1790096435.8631fc262581453bbf619ec5b2062170.1a0ca0fea6500072c4
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
In-Reply-To: <3d953b6e7f221f4cf4143454076466fab38b6236.1787838835.git.oleksii.kurochko@gmail.com>
References: <cover.1787838835.git.oleksii.kurochko@gmail.com>
 <3d953b6e7f221f4cf4143454076466fab38b6236.1787838835.git.oleksii.kurochko@gmail.com>
Date: Tue, 22 Sep 2026 19:00:25 +0200
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790096426; l=2569;
 i=baptiste.le-duc@vates.tech; s=20260810; h=from:subject:message-id;
 bh=ZFi8w6UqcqG8mh9D4ewNYr+ZjJ9zbC25lwsecYfIAJY=;
 b=6bVI7Om3f5WdZZ2iBb0dTpZzG6k1uZJ84HhvbHe3Tc2ggYfdXGXS50Eqse6pdOwFmQRM8PrvG
 lQhonuz2QNRBbjVlIXZQ+JDwrVR54l1Roc3b3bqoOxzm48uflZ/yavn
X-Developer-Key: i=baptiste.le-duc@vates.tech; a=ed25519;
 pk=N+BbdvMXRzrCuX/ieh4RWodiAKcLNvI+KjflcZ0oXCo=
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1790096433486
X-purgate-ID: tlsNG-42698a/1790096441-192CC9EA-F65EC26E/10/73395122804
X-purgate-type: spam
X-purgate-size: 2569

> During migration of a virtual hart to a different guest interrupt file,
> straggler MSIs from the APLIC could arrive at the old interrupt file
> after the switch.
> 
> genmsi is used despite not supporting guest interrupt files because the
> AIA spec guarantees that all MSIs previously sent from the APLIC to the
> same hart are visible at the hart's IMSIC before the extempore MSI from
> genmsi becomes visible.


> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>
> diff --git a/xen/arch/riscv/aplic.c b/xen/arch/riscv/aplic.c
> index 0af13f28e4..cb11d6aeaa 100644
> --- a/xen/arch/riscv/aplic.c
> +++ b/xen/arch/riscv/aplic.c
> @@ -27,7 +27,9 @@
>  #include <asm/imsic.h>
>  #include <asm/intc.h>
>  #include <asm/io.h>
> +#include <asm/processor.h>
>  #include <asm/riscv_encoding.h>
> +#include <asm/smp.h>
>  
>  static struct aplic_priv aplic = {
>      .lock = SPIN_LOCK_UNLOCKED,
> @@ -205,6 +207,30 @@ void aplic_hw_write_reg(unsigned int offset, uint32_t value)
>      spin_unlock_irqrestore(&aplic.lock, flags);
>  }
>  
> +/*
> + * As needed, synchronize with all IOMMUs and APLICs to ensure that no
> + * straggler MSIs will arrive at the old interrupt file after this step.
> + */
> +void aplic_genmsi_barrier(void)
> +{
> +    const struct imsic_config *imsic = imsic_get_config();
> +    unsigned int cpu = smp_processor_id();
> +    unsigned long flags;
> +    uint32_t val;
> +
> +    val = MASK_INSR(aplic_hart_field(cpu), APLIC_TARGET_HART_IDX) |
> +          (imsic->sync_id & APLIC_TARGET_EIID);


> +
> +    spin_lock_irqsave(&aplic.lock, flags);
> +
> +    writel(val, &aplic.regs->genmsi);
> +
> +    while ( readl(&aplic.regs->genmsi) & APLIC_GENMSI_BUSY )
> +        cpu_relax();
> +
> +    spin_unlock_irqrestore(&aplic.lock, flags);
> +}
> +
According to AIA spec §4.9.3 (Synchronizing interactions between a hart and the APLIC), the sequence needs 6 steps; this implements only steps 2-5:

- Step 1: clear the pending bit for sync_id at the hart's IMSIC before writing genmsi.
- Step 6: after releasing the lock, poll the pending bit for sync_id at the hart's IMSIC until it's set.

Step 4 (Busy clear) only means the APLIC has accepted/sent the MSI, not that it has arrived at the hart (the spec notes an unspecified travel delay).
Without step 6, aplic_genmsi_barrier() returns before the MSI (and thus prior MSIs) actually reach the hart, so it doesn't achieve the barrier it's meant to
provide.

-- 
Baptiste Le Duc <baptiste.le-duc@vates.tech>

