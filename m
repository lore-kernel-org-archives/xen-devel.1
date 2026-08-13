Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20532C5B572
	for <xen-devel@archiver.kernel.org>; Thu, 13 Aug 2026 09:34:54 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1389644.1630289 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wuRpm-0006cg-KD; Thu, 13 Aug 2026 09:34:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1389644.1630289; Thu, 13 Aug 2026 09:34:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wuRpm-0006cZ-HV; Thu, 13 Aug 2026 09:34:46 +0000
Received: by outflank-mailman (input) for mailman id 1389644;
 Thu, 13 Aug 2026 09:34:46 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wuRpm-0006bS-2T
 for xen-devel@lists.xenproject.org; Thu, 13 Aug 2026 09:34:46 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wuRpl-009juZ-FZ
 for xen-devel@lists.xenproject.org; Thu, 13 Aug 2026 11:34:45 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19ffa7951ae000c4f3@swg.vates.tech>)
 id 6a7d8fb5-8faa-0a2a0a5109dd-0a2a4503a7a6-0
 for <xen-devel@lists.xenproject.org>; Thu, 13 Aug 2026 11:34:45 +0200
Received: from [185.255.28.35] (helo=prod-mta-13-02.swg-srv.net)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19ffa7951ae000c4f3@swg.vates.tech>)
 id 6a7d8fb5-fae8-0a2a45030019-b9ff1c23a159-3
 for <xen-devel@lists.xenproject.org>; Thu, 13 Aug 2026 11:34:45 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-02.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19ffa7951ae000c4f3.007 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 13 Aug 2026 09:34:42 +0000
Received: from [192.168.1.46] (areims-651-1-80-194.w90-18.abo.wanadoo.fr
 [90.18.187.194]) (Authenticated sender: baptiste.le-duc)
 by mail2.vates.fr (Postfix) with ESMTPSA id CD5FD837F9;
 Thu, 13 Aug 2026 11:34:41 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=GskiaxqdkrlcdOiUXu6b1xpI2QLiQHgPglgAiJ59n8k=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:content-transfer-encoding:in-reply-to:references:feedback-id;
 b=QHJ21ilA3WoRB5qAKBZl96GlK8TpfZ+vXXaIE28/o2/iIXNEUiY8G6HUAT5K9emnr3UotLcEq
 wnJP0Z3e0+K0XtMk2bu7LJvx17wtFh36b83bBuGBrB4NWfX17NwV2klKKI/GH3HpoaEPcf7qXHe
 PLODwMX4YNAuikjuuKRPsxt7L8WdUxjFY/gH5TDqqi3Ie/usthOL7Z3udyzz3K8DGTApfI7Kvf0
 WBmVP2NHM0EaR20oWLIqYu+Zz21norSX4hW0mkFlk4JZsfXdjKIYemTsahJxhPkQyQYcn1HVJ5u
 8r/ubuzz0gkefJVzJD4F3/TmIgNx3ho4mMB6mhusxr1A==
X-Zone-Loop: 0b054c96b9c8278cfaab841e6baf246e4f097528be57
x-campaign-type: default
x-transaction-id: 40c86708-0bbc-495f-841e-fc42a0246376
x-swg-uid: 01-822a02e5-2575-49b2-9dc3-78e987e429b0
X-Mailer: Sweego
Message-ID:
 <1786613682.8631fc262581453bbf619ec5b2062170.19ffa7951ae000c4f3@vates.tech>
x-swg-bid: 1786613682.8631fc262581453bbf619ec5b2062170.19ffa7951ae000c4f3
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v1 09/17] xen/riscv: add helper to check APLIC MSI mode
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
In-Reply-To: <c6c5b05886520586041ca4f50ae554c3536ee662.1784560663.git.oleksii.kurochko@gmail.com>
References: <cover.1784560663.git.oleksii.kurochko@gmail.com>
 <c6c5b05886520586041ca4f50ae554c3536ee662.1784560663.git.oleksii.kurochko@gmail.com>
Date: Thu, 13 Aug 2026 11:34:35 +0200
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786613681; l=958;
 i=baptiste.le-duc@vates.tech; s=20260810; h=from:subject:message-id;
 bh=PVXSiJS+OyVYMIfE0rv3jMxdorfOOnHJHGgntD5zt2U=;
 b=I8965h4JAnoA3pBmQXbFhS01naEAW8hQ+pJT2MI8ITTSPmmTu205oLxxJ5TaZavk03405k8Jk
 pWXucQp4e0zC1ZTxkELMyViId9txSuRiqi4OcUDZMliXYOSkP+3hzZx
X-Developer-Key: i=baptiste.le-duc@vates.tech; a=ed25519;
 pk=N+BbdvMXRzrCuX/ieh4RWodiAKcLNvI+KjflcZ0oXCo=
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1786613682145
X-purgate-ID: tlsNG-33051d/1786613685-6ECCB4E9-5A08A62E/10/73395122804
X-purgate-type: spam
X-purgate-size: 958

> This helper can be used outside aplic.c to determine whether MSI mode
> is enabled. A follow-up patch uses it to decide whether the guest
> IMSIC state should be saved/restored.


> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>
> diff --git a/xen/arch/riscv/aplic.c b/xen/arch/riscv/aplic.c
> index 87f2134bc5..1ce844cd21 100644
> --- a/xen/arch/riscv/aplic.c
> +++ b/xen/arch/riscv/aplic.c
> @@ -93,6 +93,11 @@ void aplic_hw_write_reg(unsigned int offset, uint32_t value)
>      spin_unlock_irqrestore(&aplic.lock, flags);
>  }
>  
> +bool has_msi_support(void)

It does a readl() of the physical APLIC on every call. Patch 11 puts it on
the vCPU context switch path (vaplic_state_save/restore), so this becomes an
uncached MMIO read per switch to read a value that aplic_init_hw_interrupts()
sets once and nothing ever changes. Please cache it at init
time.

-- 
Baptiste Le Duc <baptiste.le-duc@vates.tech>

