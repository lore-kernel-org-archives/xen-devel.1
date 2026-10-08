Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34F8CCA600E
	for <xen-devel@archiver.kernel.org>; Thu,  8 Oct 2026 09:55:10 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1443116.1660505 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xEkpx-0005P0-Va; Thu, 08 Oct 2026 09:54:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1443116.1660505; Thu, 08 Oct 2026 09:54:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xEkpx-0005Ot-Ss; Thu, 08 Oct 2026 09:54:53 +0000
Received: by outflank-mailman (input) for mailman id 1443116;
 Thu, 08 Oct 2026 09:54:53 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xEkpx-0005On-2I
 for xen-devel@lists.xenproject.org; Thu, 08 Oct 2026 09:54:53 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xEkpv-00AqCA-VC
 for xen-devel@lists.xenproject.org; Thu, 08 Oct 2026 11:54:51 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a11aefddb50003f66@swg.vates.tech>)
 id 6ac76862-2eae-0a2a0a5409dd-0a2a45089936-42
 for <xen-devel@lists.xenproject.org>; Thu, 08 Oct 2026 11:54:51 +0200
Received: from [185.255.28.18] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a11aefddb50003f66@swg.vates.tech>)
 id 6ac7686b-f659-0a2a45080019-b9ff1c12acc9-3
 for <xen-devel@lists.xenproject.org>; Thu, 08 Oct 2026 11:54:51 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a11aefddb50003f66.007 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 08 Oct 2026 09:54:49 +0000
Received: from [192.168.1.46] (areims-651-1-80-194.w90-18.abo.wanadoo.fr
 [90.18.187.194]) (Authenticated sender: baptiste.le-duc)
 by mail2.vates.fr (Postfix) with ESMTPSA id E5F9481F99;
 Thu,  8 Oct 2026 11:54:48 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=B9pQljgIBPXNu5V97rMnBqSwLr4UJebQOzSb3YSE1yY=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:content-transfer-encoding:in-reply-to:references:feedback-id;
 b=T3eRU5TA8npedaq1vKqbSC/5cmshdvrkXQc1HkK3maJzr9s6PUbyY30RqDHzF8up7c8mORqPC
 +DviYbbWocTrFByaqhCAZd3tMkALptokSxSTG/fgcBlJ47uU2nfui5BJfYiV3pBAXdiScdBktDg
 X2FeJ/9qOJx4pOmnVAmWse/4rSwiSgT/jTd1E5VMTAVMYMiq7lXUHbJoJmh9gcOlwQfp6S1IwoY
 RJqVGzh0/x8rgZl8wsGpcZhYSQc/fO62QxDzvjBRhTYfxsULAohmIlhtf1EuT1bAzo3+Pt4ojsR
 aZW+5m7vHzg8dEIp4xAc6jGjOSwElx1eY/uy4zu2BRKw==
X-Zone-Loop: 8da2d054154ff9621530021e8ac5c3c07e8a682f8cb9
x-campaign-type: default
x-transaction-id: 40e098d1-bff1-461e-a30f-a0478cf31e6a
x-swg-uid: 01-11c22fbd-4bd5-4929-a379-19289ecbcf11
X-Mailer: Sweego
Message-ID:
 <1791453289.8631fc262581453bbf619ec5b2062170.1a11aefddb50003f66@vates.tech>
x-swg-bid: 1791453289.8631fc262581453bbf619ec5b2062170.1a11aefddb50003f66
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v3 14/39] xen/riscv: add IMSIC vCPU context switch
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
In-Reply-To: <fec6ee1b53887baf99b47a10125002fdb475ffd3.1790779209.git.oleksii.kurochko@gmail.com>
References: <cover.1790779209.git.oleksii.kurochko@gmail.com>
 <fec6ee1b53887baf99b47a10125002fdb475ffd3.1790779209.git.oleksii.kurochko@gmail.com>
Date: Thu, 08 Oct 2026 11:54:42 +0200
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791453283; l=2006;
 i=baptiste.le-duc@vates.tech; s=20260810; h=from:subject:message-id;
 bh=7tlJvdarwH4nTpyDkyDBiMB+wRx2EiTODtmYWrm13pc=;
 b=XJ1/JVvx9Ns82cwZP6bAbE39T7jap8/QUGjPXYIxomh3Uvs4iVq1aFvgWYmecXryz5oLF1wxv
 KmTD1ohYN4aCnPvG9Nn5mIZ+5Bi9IhRgJAYfOvvYQLxIxvM8sUMU8/g
X-Developer-Key: i=baptiste.le-duc@vates.tech; a=ed25519;
 pk=N+BbdvMXRzrCuX/ieh4RWodiAKcLNvI+KjflcZ0oXCo=
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1791453289152
X-purgate-ID: tlsNG-c1860d/1791453291-CDF4787B-210DFFB0/10/73395122804
X-purgate-type: spam
X-purgate-size: 2006

> IMSIC state currently needs to track only which physical CPU owns a vCPU's
> IMSIC guest interrupt file, as the CPU id is part of the physical address
> the file is mapped at.
> 
> Add imsic_ctxt_switch_from() to record that CPU when a vCPU is switched
> out. A vCPU running on the s/w VS-file has no h/w file bound to a CPU, so
> there is nothing to record for it. Nothing reads the recorded value yet.
> 
> imsic_ctxt_switch_to() has nothing to do: switching a vCPU in on the CPU
> which owns its guest interrupt file needs no IMSIC update. Only a move to
> another CPU does (a new VGEIN and a remapped file), and that isn't part of
> the context switch.
Nit: I think it could make sense to mention that if a migration happen,
it would go anyway in imsic_migrate_vcpu() before
imsic_ctxt_switch_to().
> 
> Install both as the ctxt_switch_{from,to} hooks of struct vintc_ops. MSI
> delivery is the only mode Xen supports (aplic_init() panics on an APLIC
> without an "msi-parent" property) and the only one vAPLIC emulates, so the
> vAPLIC state to save and restore is always the IMSIC one and no
> vAPLIC-level forwarder is needed. Being indirect call targets, both
> handlers get cf_check.
> 
> Co-developed-by: Romain Caritey <Romain.Caritey@microchip.com>
Should add Signed-off-by Romain Caritey.
Without that, everything is ok from my side
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> --- a/xen/arch/riscv/vaplic.c
> +++ b/xen/arch/riscv/vaplic.c
> @@ -456,6 +456,12 @@ static const struct mmio_handler_ops vaplic_mmio_ops = {
>  static const struct vintc_ops vintc_ops = {
>      .vcpu_init = vcpu_imsic_init,
>      .vcpu_deinit = vcpu_imsic_deinit,
> +    /*
> +     * MSI delivery is the only supported mode, so the vAPLIC state to save
Nit: Do we want to always support only MSI delivery? If not, maybe adapt
the comment.

Reviewed-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>

-- 
Baptiste Le Duc <baptiste.le-duc@vates.tech>

