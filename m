Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 848EDC61DD6
	for <xen-devel@archiver.kernel.org>; Tue,  1 Sep 2026 15:36:34 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1404806.1638463 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1QWz-0007k9-NS; Tue, 01 Sep 2026 15:36:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1404806.1638463; Tue, 01 Sep 2026 15:36:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1QWz-0007k2-K7; Tue, 01 Sep 2026 15:36:13 +0000
Received: by outflank-mailman (input) for mailman id 1404806;
 Tue, 01 Sep 2026 15:36:13 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1x1QWz-0007jw-3E
 for xen-devel@lists.xenproject.org; Tue, 01 Sep 2026 15:36:13 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x1QWy-001JKi-4V
 for xen-devel@lists.xenproject.org; Tue, 01 Sep 2026 17:36:12 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a05d9d0d1d000c4f3@swg.vates.tech>)
 id 6a96f0d4-8faa-0a2a0a5109dd-0a2a450a9d7a-36
 for <xen-devel@lists.xenproject.org>; Tue, 01 Sep 2026 17:36:11 +0200
Received: from [185.255.28.34] (helo=prod-mta-13-01.swg-srv.net)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a05d9d0d1d000c4f3@swg.vates.tech>)
 id 6a96f0eb-f2d2-0a2a450a0019-b9ff1c2283f9-3
 for <xen-devel@lists.xenproject.org>; Tue, 01 Sep 2026 17:36:11 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-01.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a05d9d0d1d000c4f3.007 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 01 Sep 2026 15:36:08 +0000
Received: from [192.168.1.46] (areims-651-1-80-194.w90-18.abo.wanadoo.fr
 [90.18.187.194]) (Authenticated sender: baptiste.le-duc)
 by mail2.vates.fr (Postfix) with ESMTPSA id F27F783D14;
 Tue,  1 Sep 2026 17:36:07 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=jIYE1T6q6tRfGV5ARdEy2WRajQqMbeqlY4SEFHl62V8=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:content-transfer-encoding:in-reply-to:references:feedback-id;
 b=ZUTwLzYSqgtreAQeM3KZDA5TY3040XF/WfuFW/gfi1LZ/IO8bZuiQncYKapu/4+yNN3mIXy/5
 5r8SnzphV1qN4JtvN5Zp5AISTGQZj4FLm3+pLGQA5eFtfr6nOLzl754gRl6XJs7ykAXb48nIB1b
 c25740EeHBadRrKN2FbXu7MDjI3uxrnY94n2RU3MjbvgBVJrbNbuWXLGjw+xns5tiwBWgamEJGX
 KLPFhanNJUyDxFSyEcX651yjwLNnKd095nBULjdDbW2IIrUyMPnDUj95i7+CQkjpR0x7/xKIHH3
 chFW6VPfVAYVC0r7v9OqnMNT7wZOPvqdzvO8qUUE/RKQ==
X-Zone-Loop: ff6c067449f603021a2de3d0b7dc7695049b272be0c8
x-campaign-type: default
x-transaction-id: 1734222b-2101-4f30-9cd7-5c59bbfe0ba2
x-swg-uid: 01-cd44ca4e-d9bc-42f0-821b-bf2e69ba9a2f
X-Mailer: Sweego
Message-ID:
 <1788276968.8631fc262581453bbf619ec5b2062170.1a05d9d0d1d000c4f3@vates.tech>
x-swg-bid: 1788276968.8631fc262581453bbf619ec5b2062170.1a05d9d0d1d000c4f3
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2 07/39] xen/riscv: add missing APLIC register
 offsets, masks to asm/aplic.h
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
In-Reply-To: <b3e0c1a662403ea2aa84a1943223ad0885733d0f.1787838835.git.oleksii.kurochko@gmail.com>
References: <cover.1787838835.git.oleksii.kurochko@gmail.com>
 <b3e0c1a662403ea2aa84a1943223ad0885733d0f.1787838835.git.oleksii.kurochko@gmail.com>
Date: Tue, 01 Sep 2026 17:36:01 +0200
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788276967; l=751;
 i=baptiste.le-duc@vates.tech; s=20260810; h=from:subject:message-id;
 bh=3bdn2DGU0nTeAfG1q/uUH5AqAOJYJQulCjTHSpOz+v8=;
 b=xd7lT11wWkYeIJ7AhaFsUsGcz6V1A4fPubbk+LS7teMMoVV6kzc5btS38mSmBI2mPTJ6Y8k2p
 9l5Khb3xesTAVoT5uBWNUeBOOt5PQHG1f8M/Afd6yTUmr6iZAvDtpWe
X-Developer-Key: i=baptiste.le-duc@vates.tech; a=ed25519;
 pk=N+BbdvMXRzrCuX/ieh4RWodiAKcLNvI+KjflcZ0oXCo=
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1788276968198
X-purgate-ID: tlsNG-4011c0/1788276971-4B6D6CFC-D6089A41/10/73395122804
X-purgate-type: spam
X-purgate-size: 751

On Thu, 27 Aug 2026 17:20:51 +0200, Oleksii Kurochko <oleksii.kurochko@gmail.com> wrote:
> These definitions are required for correct decoding of APLIC MMIO
> accesses and target configuration, and will be used by both the
> physical and virtual APLIC implementations.
> 
> While adding them, rearrange the header in the style of x86's
> asm/msr-index.h: a register's offset is immediately followed by the
> definitions of that register's fields, with the blocks sorted by
> offset.  This makes the relation between a register and its fields
> obvious from the layout alone, so no comment is needed to express it.
> 
> [...]

Reviewed-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>

-- 
Baptiste Le Duc <baptiste.le-duc@vates.tech>

