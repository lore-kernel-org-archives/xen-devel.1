Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79A6EC61DD3
	for <xen-devel@archiver.kernel.org>; Mon, 31 Aug 2026 12:48:44 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1404015.1637942 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x11R9-0006Lj-Cm; Mon, 31 Aug 2026 12:48:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1404015.1637942; Mon, 31 Aug 2026 12:48:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x11R9-0006Lc-9Y; Mon, 31 Aug 2026 12:48:31 +0000
Received: by outflank-mailman (input) for mailman id 1404015;
 Mon, 31 Aug 2026 12:48:29 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1x11R6-0006LW-Te
 for xen-devel@lists.xenproject.org; Mon, 31 Aug 2026 12:48:29 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x11R5-000Y54-M4
 for xen-devel@lists.xenproject.org; Mon, 31 Aug 2026 14:48:27 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a057dd1d04000c4f3@swg.vates.tech>)
 id 6a957800-bab6-0a2a0a5309dd-0a2a4501e774-40
 for <xen-devel@lists.xenproject.org>; Mon, 31 Aug 2026 14:48:27 +0200
Received: from [185.255.28.34] (helo=prod-mta-13-01.swg-srv.net)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a057dd1d04000c4f3@swg.vates.tech>)
 id 6a95781b-5984-0a2a45010019-b9ff1c22a201-3
 for <xen-devel@lists.xenproject.org>; Mon, 31 Aug 2026 14:48:27 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-01.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a057dd1d04000c4f3.007 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 31 Aug 2026 12:48:23 +0000
Received: from [192.168.1.46] (areims-651-1-80-194.w90-18.abo.wanadoo.fr
 [90.18.187.194]) (Authenticated sender: baptiste.le-duc)
 by mail2.vates.fr (Postfix) with ESMTPSA id 1879483CFC;
 Mon, 31 Aug 2026 14:48:23 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=V5Za1xWUf0cdkSxUkliHIR0yyS8TVB5Whrd6KoNKmks=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:content-transfer-encoding:in-reply-to:references:feedback-id;
 b=Q7auUekvl/kZVW0MzCtV4m/XMa/KHC3Nja76vEQYlR0DispAYHqyhZs6LqCcsfdFoY+WTguzD
 prwQJjppFn9qIsfwbdY42J+KcvIRavFOfAxzinrEdqseP6mgJJSKRqdQgMj4DGkQdnU5ZXFO9Ab
 1R60pryildNSiAyYMNExNGBswFSB7y8I6N5/6QzcIgasqRL9XmS6deTY//vvHddfjJIv7wf3ePA
 iKmtCdMq2qSYpesmc0c5wd7I9BMZswILhGGKKuxOFNpFsPZ/bE78AEneU/Ma3b86c0BUTM+rlCl
 C1nf7ZPCwEzn+66XDPvpSnkZXEwx2+Z8I7N0OTk09Pxg==
X-Zone-Loop: 5a8287f85aa438c60bd38cbe7cdfa01743963bad75c8
x-campaign-type: default
x-transaction-id: b4e6dea1-4e34-4ff4-a5ba-5a56d5bc14e8
x-swg-uid: 01-337b4cb0-7e91-482d-8693-744fdb3432b3
X-Mailer: Sweego
Message-ID:
 <1788180503.8631fc262581453bbf619ec5b2062170.1a057dd1d04000c4f3@vates.tech>
x-swg-bid: 1788180503.8631fc262581453bbf619ec5b2062170.1a057dd1d04000c4f3
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2 01/39] xen/riscv: drop pregs from struct
 cpu_user_regs
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
In-Reply-To: <0dc967fc4bba2dfd97a9c9ea6e60e4d5be3538ff.1787838835.git.oleksii.kurochko@gmail.com>
References: <cover.1787838835.git.oleksii.kurochko@gmail.com>
 <0dc967fc4bba2dfd97a9c9ea6e60e4d5be3538ff.1787838835.git.oleksii.kurochko@gmail.com>
Date: Mon, 31 Aug 2026 14:48:15 +0200
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788180503; l=363;
 i=baptiste.le-duc@vates.tech; s=20260810; h=from:subject:message-id;
 bh=ubqMEZth2wl+G+/1uOQKmwEsmIs0qRITxz91xImt5co=;
 b=oWjiZmfOwrtpNkviXFGKB6QddxwJ65MjPKdKCUwID/WTLAQeI6ElBBCXP++A4C9XyF0ZDlJP0
 a+Fo6NqDFc2DCrhkbaPGnmkfvINYeycg+G7JkSwNDL/C3OHHPntw3mR
X-Developer-Key: i=baptiste.le-duc@vates.tech; a=ed25519;
 pk=N+BbdvMXRzrCuX/ieh4RWodiAKcLNvI+KjflcZ0oXCo=
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1788180503307
X-purgate-ID: tlsNG-d62444/1788180507-BE27A757-7FAE865E/10/73395122804
X-purgate-type: spam
X-purgate-size: 363

On Thu, 27 Aug 2026 17:20:45 +0200, Oleksii Kurochko <oleksii.kurochko@gmail.com> wrote:
> As nothing is using pregs in upstream or downstream ports of RISC-V drop
> it from struct cpu_user_regs. Once it will really be needed re-introduce
> it.

Reviewed-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>

-- 
Baptiste Le Duc <baptiste.le-duc@vates.tech>

