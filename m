Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D42E9C98304
	for <xen-devel@archiver.kernel.org>; Wed, 23 Sep 2026 16:11:56 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1431022.1653423 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9PZS-0006VQ-1f; Wed, 23 Sep 2026 16:11:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1431022.1653423; Wed, 23 Sep 2026 16:11:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9PZR-0006VI-U0; Wed, 23 Sep 2026 16:11:45 +0000
Received: by outflank-mailman (input) for mailman id 1431022;
 Wed, 23 Sep 2026 16:11:44 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0cf09703a00072c4@swg.vates.tech>)
 id 1x9PZQ-0006V6-G9
 for xen-devel@lists.xenproject.org; Wed, 23 Sep 2026 16:11:44 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x9PZP-00Dl2o-Jg
 for xen-devel@lists.xenproject.org; Wed, 23 Sep 2026 18:11:43 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0cf09703a00072c4@swg.vates.tech>)
 id 6ab3fa2d-2eae-0a2a0a5409dd-0a2a45078d06-16
 for <xen-devel@lists.xenproject.org>; Wed, 23 Sep 2026 18:11:43 +0200
Received: from [185.255.28.34] (helo=prod-mta-13-01.swg-srv.net)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0cf09703a00072c4@swg.vates.tech>)
 id 6ab3fa3f-b4ea-0a2a45070019-b9ff1c228d5f-3
 for <xen-devel@lists.xenproject.org>; Wed, 23 Sep 2026 18:11:43 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-01.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a0cf09703a00072c4.007 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 23 Sep 2026 16:11:37 +0000
Received: from [192.168.1.46] (areims-651-1-80-194.w90-18.abo.wanadoo.fr
 [90.18.187.194]) (Authenticated sender: baptiste.le-duc)
 by mail2.vates.fr (Postfix) with ESMTPSA id 8AE2A80631;
 Wed, 23 Sep 2026 18:11:36 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=2HIAdadP+KD4GDYkD9yrelDKi0UtXXzIp5jVVwwrDIk=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:content-transfer-encoding:in-reply-to:references:feedback-id;
 b=qJdU/vZjv9WXQkGqEy+t80g5Z46q7DSmDegsKlPDJHqSetU/qsX/ZEMGvxTB0sUkKCXMyPTpn
 jt5InRUYDUhCwPJXm/AjV3RSirKeLntZMezcoZH3hIKABgiCtQV3oYsslqExb1qIOuKzrW2496i
 4knkNi6lTxtStAwFJQYShVzp64vdVAGbwMuPNXZ8xDUYDqVIOkU9+1svBhx2gOZuTmpA0ahAeCh
 L9YRWYHj6PARcAJtuPeCayRNZI/f+lJg4SPHzEbOm+mI+HOhliVHHe91WS/yH/eh1WedTAcjNeS
 P14jPlzHDqeN8IbVCm/Ne/JIYIt5ng5fLOat1EpOdtpg==
X-Zone-Loop: 4072e9ffd25b814610e0999d089d040a9e756aa6b2e8
x-campaign-type: default
x-transaction-id: 360b78a8-c284-4f5c-8aec-fe9c80a480e4
x-swg-uid: 01-af3cd627-f8c3-4d07-b1bc-f9df78c75baa
X-Mailer: Sweego
Message-ID:
 <1790179897.8631fc262581453bbf619ec5b2062170.1a0cf09703a00072c4@vates.tech>
x-swg-bid: 1790179897.8631fc262581453bbf619ec5b2062170.1a0cf09703a00072c4
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2 32/39] xen/riscv: remap interrupts to new IMSIC
 VS-file
From: Baptiste Le Duc <baptiste.le-duc@vates.tech>
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Baptiste Le Duc <baptiste.le-duc@vates.tech>, 
 xen-devel@lists.xenproject.org, 
 Romain Caritey <Romain.Caritey@microchip.com>, 
 Zheng Zhang <zhangzheng@iscas.ac.cn>, 
 Alistair Francis <alistair.francis@wdc.com>, 
 Connor Davis <connojdavis@gmail.com>, 
 Andrew Cooper <andrew.cooper3@citrix.com>, 
 Anthony PERARD <anthony.perard@vates.tech>, 
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, 
 Julien Grall <julien@xen.org>, 
 =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>, 
 Stefano Stabellini <sstabellini@kernel.org>
In-Reply-To: <cfa869dd-ef82-4aa1-a86f-f0ada4d6f291@gmail.com>
References: <cover.1787838835.git.oleksii.kurochko@gmail.com>
 <948e94b6610586b84626c98da033d301335dc7b0.1787838835.git.oleksii.kurochko@gmail.com>
 <1790177111.8631fc262581453bbf619ec5b2062170.1a0cedeee2900072c4@vates.tech>
 <cfa869dd-ef82-4aa1-a86f-f0ada4d6f291@gmail.com>
Date: Wed, 23 Sep 2026 18:11:30 +0200
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790179891; l=690;
 i=baptiste.le-duc@vates.tech; s=20260810; h=from:subject:message-id;
 bh=KF919M5+CLGKZ43Zn/fPjANBWs6qZB/cLfYGpXEQjwQ=;
 b=LyFnDB2n3kFGcES3p1KF1o0uTEiEdoGAkzwG7YzhdjW7JUEpuwpWdaB2W5ABL1UCQUQ0/XHFS
 OkFNwdqA9nIDnfykxvL8ALxWeCiVbePESgYwbGmzuMTG+2ovl3sK8tY
X-Developer-Key: i=baptiste.le-duc@vates.tech; a=ed25519;
 pk=N+BbdvMXRzrCuX/ieh4RWodiAKcLNvI+KjflcZ0oXCo=
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1790179896771
X-purgate-ID: tlsNG-ef75cf/1790179903-348C9AE4-C31D9299/0/0
X-purgate-type: clean
X-purgate-size: 694

On 2026-09-23 17:48 +0200, Oleksii Kurochko wrote:
> 
> 
> On 9/23/26 5:25 PM, Baptiste Le Duc wrote:
> >  > xen/riscv: remap interrupts to new IMSIC VS-file
> > 
> > Nit: The next patch uses "restore" in its title, we might want to use
> > "save" terminology here for symmetry? e.g.:
> >      "xen/riscv: save old interrupt file state to memory"
> 
> Not only saving old interrupt file state happens here but also moving of 
> all interrupts to new IMSIC VS-file. That why remap sounds okay here to 
> me. If it is Nit: and no one else are against that I prefer to still
> have the commit subject as it is written now.
Ok lets keep the original.
> 
> ~ Oleksii
> 
> 



