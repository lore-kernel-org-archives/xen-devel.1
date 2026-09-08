Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE8E9C79F82
	for <xen-devel@archiver.kernel.org>; Tue,  8 Sep 2026 08:19:30 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1411176.1641880 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x3r2g-0003lO-Bv; Tue, 08 Sep 2026 08:18:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1411176.1641880; Tue, 08 Sep 2026 08:18:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x3r2g-0003lG-7b; Tue, 08 Sep 2026 08:18:58 +0000
Received: by outflank-mailman (input) for mailman id 1411176;
 Tue, 08 Sep 2026 08:18:57 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a080193399000c4f3@swg.vates.tech>)
 id 1x3r2e-0003lA-VW
 for xen-devel@lists.xenproject.org; Tue, 08 Sep 2026 08:18:57 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x3r2c-009ICz-J3
 for xen-devel@lists.xenproject.org; Tue, 08 Sep 2026 10:18:54 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a080193399000c4f3@swg.vates.tech>)
 id 6a9fc4ea-2eae-0a2a0a5409dd-0a2a45088860-10
 for <xen-devel@lists.xenproject.org>; Tue, 08 Sep 2026 10:18:54 +0200
Received: from [185.255.28.34] (helo=prod-mta-13-01.swg-srv.net)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a080193399000c4f3@swg.vates.tech>)
 id 6a9fc4ed-f659-0a2a45080019-b9ff1c22b06b-3
 for <xen-devel@lists.xenproject.org>; Tue, 08 Sep 2026 10:18:54 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-01.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a080193399000c4f3.007 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 08 Sep 2026 08:18:50 +0000
Received: from [192.168.1.37] (lfbn-gre-1-371-96.w90-112.abo.wanadoo.fr
 [90.112.87.96]) (Authenticated sender: baptiste.le-duc)
 by mail2.vates.fr (Postfix) with ESMTPSA id 8211783346;
 Tue,  8 Sep 2026 10:18:49 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=+RMLBvJEtS0xTq4PcjrpT+C+Nw0tIqQWaxlAZ0yjahM=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:content-transfer-encoding:in-reply-to:references:feedback-id;
 b=IxjXqfYcKnUxKPFovh4dtgdUBYg/Q/Vfc4AmMSl7ii3CooDKeArMxgMbL0dwB8t24/8AnR+AF
 eCfgGWbYpX88I4lB9SM8fmvhZFiUz2V4uZDqFHlZm7IY9gitSWffhdGfehmvLzAnLgKhcy34GfG
 Q+/71U+gSmBfGMBOgGIxSrRNMrQYyAt2Gx2wMzlFmept0CrmEfSdY+WShKHR6d3U07USZ+s6KDA
 mDHga4I5gQG6YV4jV+jZL2G21Hn7vV3YPZGivFAHfqyJaLow4jlx1szDNLAAl61jpklG1uegG3D
 HdCiodX99q1sh/hyVhD/2m1L2QigUUlcW1x4ZjkTj+Dg==
X-Zone-Loop: 032c064d72bb20a60b4ac7d7f633bbe49f58a40450f3
x-campaign-type: default
x-transaction-id: 1473e2af-80f3-4685-bd52-00f79230cafc
x-swg-uid: 01-f8de22c1-9d47-45eb-b242-64e8b2a13fd4
X-Mailer: Sweego
Message-ID:
 <1788855530.8631fc262581453bbf619ec5b2062170.1a080193399000c4f3@vates.tech>
x-swg-bid: 1788855530.8631fc262581453bbf619ec5b2062170.1a080193399000c4f3
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2 16/39] xen/riscv: extend exception tables with type
 and data fields
From: Baptiste Le Duc <baptiste.le-duc@vates.tech>
To: Jan Beulich <jbeulich@suse.com>
Cc: Baptiste Le Duc <baptiste.le-duc@vates.tech>, 
 Oleksii Kurochko <oleksii.kurochko@gmail.com>, 
 xen-devel@lists.xenproject.org, 
 Romain Caritey <Romain.Caritey@microchip.com>, 
 Zheng Zhang <zhangzheng@iscas.ac.cn>, 
 Alistair Francis <alistair.francis@wdc.com>, 
 Connor Davis <connojdavis@gmail.com>, 
 Andrew Cooper <andrew.cooper3@citrix.com>, 
 Anthony PERARD <anthony.perard@vates.tech>, 
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>, 
 =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>, 
 Stefano Stabellini <sstabellini@kernel.org>
In-Reply-To: <9123f379-6f87-4116-95d4-982e55f27053@suse.com>
References: <cover.1787838835.git.oleksii.kurochko@gmail.com>
 <8aef9dfabe1d485abe4c48fd7499e09dbd8e0c27.1787838835.git.oleksii.kurochko@gmail.com>
 <1788796633.8631fc262581453bbf619ec5b2062170.1a07c968185000c4f3@vates.tech>
 <9123f379-6f87-4116-95d4-982e55f27053@suse.com>
Date: Tue, 08 Sep 2026 10:18:44 +0200
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788855529; l=608;
 i=baptiste.le-duc@vates.tech; s=20260810; h=from:subject:message-id;
 bh=Qwvpw+2VFvMEXbZnYB+iZbEu3Juq2tyty4Fn9wojnT4=;
 b=EephggSH6J/IX78cDXM9x4lRR9D5Qssn0AvaTY2CId69Ub8Nyg51DeIDUvx5XChnyUQNzOi5H
 T7w9JNz2LXlDXtkV91NrijWCO0D8e/8XdGZjg1YMDBuvV6pgtzUsuZT
X-Developer-Key: i=baptiste.le-duc@vates.tech; a=ed25519;
 pk=N+BbdvMXRzrCuX/ieh4RWodiAKcLNvI+KjflcZ0oXCo=
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1788855529741
X-purgate-ID: tlsNG-c1860d/1788855534-CF75B87B-718A3B73/0/0
X-purgate-type: clean
X-purgate-size: 612

On 2026-09-08 08:06:29+02:00, Jan Beulich wrote:
> On 07.09.2026 17:57, Baptiste Le Duc wrote:
> 
> >> --- a/xen/arch/riscv/include/asm/processor.h
> > Comment claims ->zero "must always read as 0" as it's hard-wired to zero
> > by the HW, but nothing enforces that, it's still a plain writable
> > unsigned long. Maybe a write-side counterpart that special-cases num==0
> > as a no-op, or with a minimum ASSERT(num != 0) / BUG_ON(num == 0) to
> > anticipate any future forbidden writes.
> 
> With polarity inverted, though.
Yes sorry, it should be ASSERT(num == 0) / BUG_ON(num != 0)
> 
> Jan



