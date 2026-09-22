Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6ABFC982FA
	for <xen-devel@archiver.kernel.org>; Tue, 22 Sep 2026 17:01:09 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1429260.1652178 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x93rN-0002Af-He; Tue, 22 Sep 2026 17:00:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1429260.1652178; Tue, 22 Sep 2026 17:00:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x93rN-0002AY-Eo; Tue, 22 Sep 2026 17:00:49 +0000
Received: by outflank-mailman (input) for mailman id 1429260;
 Tue, 22 Sep 2026 17:00:48 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1x93rM-0002AI-Rs
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2026 17:00:48 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x93rM-008cvY-8U
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2026 19:00:48 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0ca0fea8600072c4@swg.vates.tech>)
 id 6ab2b439-2eae-0a2a0a5409dd-0a2a4502c390-20
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 19:00:48 +0200
Received: from [185.255.28.18] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0ca0fea8600072c4@swg.vates.tech>)
 id 6ab2b43f-6ca4-0a2a45020019-b9ff1c12b0f9-3
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 19:00:48 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a0ca0fea8600072c4.007 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 22 Sep 2026 17:00:35 +0000
Received: from [192.168.1.37] (lfbn-gre-1-371-96.w90-112.abo.wanadoo.fr
 [90.112.87.96]) (Authenticated sender: baptiste.le-duc)
 by mail2.vates.fr (Postfix) with ESMTPSA id 154BD81C7E;
 Tue, 22 Sep 2026 19:00:32 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=1dlUnqEPqELr3/b37rHCQBFuq5HiJfx0Z/ILCX05KcM=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:content-transfer-encoding:in-reply-to:references:feedback-id;
 b=et/BuBt4hGGWcEmGKxyc9YhFqMLBJ5z+pDQ9rgHyA1dDlta7YJLZ0Mzt7iDPaoGud0efYb4HM
 pksHysMCDNKtVYvuoFABcLjp26qU35f2sOtWJQ8D3Vnde1AuHNx0E0vI0SCbMhiWVs5YJJDB9ZD
 kiJkJQvSfRRWoft87dO0EfjeZzf3OLZX0jCKcSP/HY+gqKfTWVsZ2kcIGC40b7AbGM+ot4ofInr
 84aFSZn/VV9M/H2WZqVkuptbCPJhxIofgu9sMzbTM6wPl7A6ZpTwU3oEWqr7EiH0FNCDc6ZIPKJ
 eo/SmfZos/cnRp1P2js20awO35reSMs3YeFtlcL4yN/A==
X-Zone-Loop: daff011fe32f1f132ca5de1354413e918ff439400371
x-campaign-type: default
x-transaction-id: b4718b59-ecc9-4980-8db3-5c1260a4d8da
x-swg-uid: 01-7fa33e84-c785-4feb-9883-e9902c5104ac
X-Mailer: Sweego
Message-ID:
 <1790096435.8631fc262581453bbf619ec5b2062170.1a0ca0fea8600072c4@vates.tech>
x-swg-bid: 1790096435.8631fc262581453bbf619ec5b2062170.1a0ca0fea8600072c4
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2 27/39] xen/riscv: introduce arch_move_irqs()
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
In-Reply-To: <df3d3e1be48d9e46e4884c8573550b242efe26db.1787838835.git.oleksii.kurochko@gmail.com>
References: <cover.1787838835.git.oleksii.kurochko@gmail.com>
 <df3d3e1be48d9e46e4884c8573550b242efe26db.1787838835.git.oleksii.kurochko@gmail.com>
Date: Tue, 22 Sep 2026 19:00:25 +0200
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790096426; l=708;
 i=baptiste.le-duc@vates.tech; s=20260810; h=from:subject:message-id;
 bh=erI0Y9hiRzVVveCjNXTGPiL04yC2AvNDjQOzR0wgwpQ=;
 b=kwwZZByE0FTbk0miBdVPts+XPnx1Iqfr6cu0QswsJWO+vyI7ytIpVWuDn2Aq9d7gguKzf+Ddj
 5fAUb1waV3JC7QtIxTjV5qdwLx1tD+BagmuOec9QmX+R5anKBcQzUG5
X-Developer-Key: i=baptiste.le-duc@vates.tech; a=ed25519;
 pk=N+BbdvMXRzrCuX/ieh4RWodiAKcLNvI+KjflcZ0oXCo=
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1790096432317
X-purgate-ID: tlsNG-720697/1790096448-30DC12AC-0BF26DD2/10/73395122804
X-purgate-type: spam
X-purgate-size: 708

On Thu, 27 Aug 2026 17:21:11 +0200, Oleksii Kurochko <oleksii.kurochko@gmail.com> wrote:
> When migrating a vCPU between pCPUs the hypervisor must also migrate
> the associated virtual interrupt state. arch_move_irqs() is the
> per-arch hook called by generic code to trigger that.
> 
> Replace the static inline BUG_ON placeholder in asm/irq.h with a real
> implementation in intc.c dispatching through a new move_irqs vintc_ops
> callback. Wire it up in vAPLIC, which delegates to imsic_migrate_vcpu()
> which itself still a stub to be implemented in follow-up patches.
> 
> [...]

Reviewed-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>

-- 
Baptiste Le Duc <baptiste.le-duc@vates.tech>

