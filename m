Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACECACC6B1A
	for <xen-devel@archiver.kernel.org>; Wed, 14 Oct 2026 15:21:21 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1449215.1665112 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xH0my-0006xT-V3; Wed, 14 Oct 2026 15:21:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1449215.1665112; Wed, 14 Oct 2026 15:21:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xH0my-0006xM-SH; Wed, 14 Oct 2026 15:21:08 +0000
Received: by outflank-mailman (input) for mailman id 1449215;
 Wed, 14 Oct 2026 15:21:07 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a13b00ab040008425@swg.vates.tech>)
 id 1xH0mx-0006xG-7d
 for xen-devel@lists.xenproject.org; Wed, 14 Oct 2026 15:21:07 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xH0mw-0053oM-F0
 for xen-devel@lists.xenproject.org; Wed, 14 Oct 2026 17:21:06 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a13b00ab040008425@swg.vates.tech>)
 id 6acf9ddb-bab6-0a2a0a5309dd-0a2a4502c3a0-18
 for <xen-devel@lists.xenproject.org>; Wed, 14 Oct 2026 17:21:06 +0200
Received: from [185.255.28.34] (helo=prod-mta-13-01.swg-srv.net)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a13b00ab040008425@swg.vates.tech>)
 id 6acf9de1-6ca4-0a2a45020019-b9ff1c228881-3
 for <xen-devel@lists.xenproject.org>; Wed, 14 Oct 2026 17:21:05 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-01.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a13b00ab040008425.004 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 14 Oct 2026 15:21:01 +0000
Received: from leducb.home (areims-651-1-80-194.w90-18.abo.wanadoo.fr
 [90.18.187.194]) (Authenticated sender: baptiste.le-duc)
 by mail2.vates.fr (Postfix) with ESMTPSA id 34C8581F7E;
 Wed, 14 Oct 2026 17:21:01 +0200 (CEST)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=vates.tech header.i="@vates.tech" header.h="From:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Transfer-Encoding:Feedback-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech;
 q=dns/txt; s=selector1; bh=B4GGVUAtcvymBRSmcXiX7RuyDM8/lS8Cu9lVb56h/rk=;
 h=from:subject:date:message-id:to:cc:mime-version:content-transfer-encoding:feedback-id;
 b=aihvHZY/k+i/INLZHXMkzryI7rRGr3yy5e65KABxtUipYViyMYts6A3zJmouTeov3nToTdG+G
 VjKGYIKGJ6So7J7oWFTUMPT+pxTXE3IngDswEfzTWGNZRg6qBrKOurOLdC5+aSbLtFfQq2B6I4U
 UnbBXVExtphJRpn7XTjcRsRKCfbWz5k30BcFRjE+cOtlY6WZ7odGV/gCX3UoOOE6+YO/3IBCUsk
 zIgSpDkZbmbW+Q2ax227robojuSNXm4WuGIV0LLNgX+bQZNms6EaJZI/NmM8derhJtRVr1Uag6C
 t+WJy/+mIKMpyH5PxhX5hcapk4RXT1cws5Hv6n19Gt+A==
X-Zone-Loop: 3f2c5525ebd1ae8b9d439a545c3b2be6cfd9f6dd2e46
x-campaign-type: default
x-transaction-id: 3977e284-2166-4932-a032-201fdaca1f69
x-swg-uid: 01-7c506548-2a58-48b3-8e35-7c765836d63c
X-Mailer: Sweego
Message-ID:
 <1791991262.8631fc262581453bbf619ec5b2062170.1a13b00ab040008425@vates.tech>
x-swg-bid: 1791991262.8631fc262581453bbf619ec5b2062170.1a13b00ab040008425
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
From: Baptiste Le Duc <baptiste.le-duc@vates.tech>
To: xen-devel@lists.xenproject.org
Cc: Baptiste Le Duc <baptiste.le-duc@vates.tech>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 0/1] Add myself as RISC-V reviewer
Date: Wed, 14 Oct 2026 17:20:56 +0200
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1791991261407
X-purgate-ID: tlsNG-720697/1791991266-F02992AC-0C0BB2BC/0/0
X-purgate-type: clean
X-purgate-size: 370

Hello,
I am working on Xen RISC-V and already review patches in that area, but
only see them when I happen to spot them on the list. Being listed gets
me CCed so that I don't miss any.

Thanks in advance.
Regards,
Baptiste Le Duc
---

Baptiste Le Duc (1):
  MAINTAINERS: Add myself as RISC-V reviewer

 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)


