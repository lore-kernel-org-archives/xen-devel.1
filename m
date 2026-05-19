Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDF7ACD4F3C
	for <xen-devel@archiver.kernel.org>; Tue, 19 May 2026 15:39:13 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1313175.1583396 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPMWz-00083Y-C5; Tue, 19 May 2026 15:38:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1313175.1583396; Tue, 19 May 2026 15:38:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPMWz-00083R-8d; Tue, 19 May 2026 15:38:53 +0000
Received: by outflank-mailman (input) for mailman id 1313175;
 Tue, 19 May 2026 15:38:51 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19e40e3b9da000f373@swg.vates.tech>)
 id 1wPMWx-00083L-Fr
 for xen-devel@lists.xenproject.org; Tue, 19 May 2026 15:38:51 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wPMWw-00CnNk-Hi
 for xen-devel@lists.xenproject.org; Tue, 19 May 2026 17:38:50 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19e40e3b9da000f373@swg.vates.tech>)
 id 6a0c83fe-e002-0a2a0a5209dd-0a2a4508951c-38
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2026 17:38:50 +0200
Received: from [185.255.28.34] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19e40e3b9da000f373@swg.vates.tech>)
 id 6a0c840a-63b5-0a2a45080019-b9ff1c22846b-3
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2026 17:38:50 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19e40e3b9da000f373.007 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 19 May 2026 15:38:46 +0000
Received: from leducb (182.136.141.83.rev.sfr.net [83.141.136.182])
 (Authenticated sender: baptiste.le-duc)
 by mail2.vates.fr (Postfix) with ESMTPSA id C84E686593;
 Tue, 19 May 2026 17:38:45 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=GYnp417w01Lf1CsqXNPWxHt3d4VocunnjUOFZTvihpY=;
 h=from:subject:date:message-id:to:cc:mime-version:content-transfer-encoding:feedback-id;
 b=Ev98y5Ck6RenwwtA5F0kV+hZ0T1tSoqhmV1DtQY5jdG4pkMtiVfS2k/p5280kUPnidcklqc6D
 SwCf0P0gK1rHQdHc5tEuwjPibDDOSM2Vku2qjOnuve0nUNotcG1QP7C5FGi9xE0GwTNTkRbGxuy
 0dDA9E3L16QGfmr2JBXKwzIQboQrzgX44dCgwF+Sfd1YFZwTsODgMLjnA4btiGEqFuhG2KxdKr1
 w3+Dju8cgAT1h9vowJtCR5AYTL1J8MPy6a/y9x9MnnwyoXV20pVreRrM3OmwKRk0zlg7Crj+m/P
 sVFWfwaTsyFpNVqalmy0r2MK3YMWOU9KAwxVA29/eGXg==
X-Zone-Loop: 637d2fec0ac3e3a6bddd82822c2ae1953e1d0d6565a9
x-campaign-type: default
x-transaction-id: 4d6c4308-c795-4aed-87af-041b82dbfe6f
x-swg-uid: 01-5e184eab-63d2-49f0-88d6-e5206b7982e5
X-Mailer: Sweego
Message-ID:
 <1779205126.8631fc262581453bbf619ec5b2062170.19e40e3b9da000f373@vates.tech>
x-swg-bid: 1779205126.8631fc262581453bbf619ec5b2062170.19e40e3b9da000f373
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
From: Baptiste Le Duc <baptiste.le-duc@vates.tech>
To: xen-devel@lists.xenproject.org
Cc: Baptiste Le Duc <baptiste.le-duc@vates.tech>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH] xen/riscv: fix sstc init to write vstimecmp instead of stimecmp
Date: Tue, 19 May 2026 17:38:22 +0200
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1779205126043
X-purgate-ID: tlsNG-c1860d/1779205130-C4C79DB1-6BDECA2D/0/0
X-purgate-type: clean
X-purgate-size: 1147

Commit <25e03273069036f5b46e14bbdf396ac79805d07e> mistakenly wrote to
CSR_STIMECMP during sstc initialization instead of CSR_VSTIMECMP.

CSR_VSTIMECMP is the VS-level timer comparator: the hardware fires a
VS-timer interrupt whenever (time + htimedelta) >= vstimecmp. Writing
to CSR_STIMECMP leaves CSR_VSTIMECMP uninitialized, so its reset value
may immediately satisfy this condition, generating spurious VS-timer
interrupts before any guest has programmed the timer.

Fix this by writing the ULONG_MAX value to CSR_VSTIMECMP as intended.

Signed-off-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>
---
 xen/arch/riscv/time.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/riscv/time.c b/xen/arch/riscv/time.c
index 8769709e52..10b7e35f13 100644
--- a/xen/arch/riscv/time.c
+++ b/xen/arch/riscv/time.c
@@ -101,6 +101,6 @@ void __init preinit_xen_time(void)
          * Thereby to avoid spurious VS-timer irqs set vstimecmp CSR to
          * ULONG_MAX.
          */
-        csr_write64(CSR_STIMECMP, ULONG_MAX);
+        csr_write64(CSR_VSTIMECMP, ULONG_MAX);
     }
 }
-- 
2.54.0


