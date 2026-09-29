Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F7DFCA5FA7
	for <xen-devel@archiver.kernel.org>; Tue, 29 Sep 2026 16:33:36 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1436564.1655247 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBalh-0006qf-Ga; Tue, 29 Sep 2026 16:33:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1436564.1655247; Tue, 29 Sep 2026 16:33:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBalh-0006qW-Dc; Tue, 29 Sep 2026 16:33:25 +0000
Received: by outflank-mailman (input) for mailman id 1436564;
 Tue, 29 Sep 2026 16:33:24 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0ee034354000b504@swg.vates.tech>)
 id 1xBalg-0006lr-5z
 for xen-devel@lists.xenproject.org; Tue, 29 Sep 2026 16:33:24 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xBalf-008OVE-JH
 for xen-devel@lists.xenproject.org; Tue, 29 Sep 2026 18:33:23 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0ee034354000b504@swg.vates.tech>)
 id 6abbe850-e002-0a2a0a5209dd-0a2a4504c8a6-10
 for <xen-devel@lists.xenproject.org>; Tue, 29 Sep 2026 18:33:23 +0200
Received: from [185.255.28.18] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0ee034354000b504@swg.vates.tech>)
 id 6abbe853-b57f-0a2a45040019-b9ff1c12a885-3
 for <xen-devel@lists.xenproject.org>; Tue, 29 Sep 2026 18:33:23 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a0ee034354000b504.006 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 29 Sep 2026 16:33:06 +0000
Received: from leducb.home (areims-651-1-80-194.w90-18.abo.wanadoo.fr
 [90.18.187.194]) (Authenticated sender: baptiste.le-duc)
 by mail2.vates.fr (Postfix) with ESMTPSA id BF92682374;
 Tue, 29 Sep 2026 18:33:05 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=5CEAsoplDJgzw9TugUFPavXxRF/L1R6xlOnp8t7uKNU=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:content-transfer-encoding:in-reply-to:references:feedback-id;
 b=mxd9cUfdLwhK1Ih6OqaFH9Ge9lPWLrwCPm/ryJPwl0VaLrGtgca65nnDSkcaNkHPcX1f8Kyl9
 O4jtyjyMQfkvrkVU+YfP9jX78s3HLKp3Nz9re5KUugs4K8Io381OhsVwGMgNLDXW2VrFSbxTaOF
 5/F11NStAgs7m4awIDkNJczs0ACDTHDIKrXGwYcbW4MA7oqFSeamPBNnJHDRQ3XRKw5ZSf27nSi
 TkDEay7mXUrnGyp5EQ0wUxQtMv7zoBorDo+rUOD2C83kHYHtl7AAOB+7A6NDZ6iRlsVElGh2Wku
 G3m/YZDzr1CwRBf0egpMEKpjkguc1RPFFd5XtsfjwVRw==
X-Zone-Loop: f9efd126c182909ea9b85b11bfb621967fc369f04125
x-campaign-type: default
x-transaction-id: 0f7a875d-e69f-4be7-8542-39a003098463
x-swg-uid: 01-9314be58-17fd-4126-8fd6-f115b5cfe983
X-Mailer: Sweego
Message-ID:
 <1790699586.8631fc262581453bbf619ec5b2062170.1a0ee034354000b504@vates.tech>
x-swg-bid: 1790699586.8631fc262581453bbf619ec5b2062170.1a0ee034354000b504
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
	=?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [PATCH v3 5/6] xen/riscv: use pte_is_valid() in pte_is_mapping()
Date: Tue, 29 Sep 2026 18:32:46 +0200
In-Reply-To: <1790699381.8631fc262581453bbf619ec5b2062170.1a0ee00218b000b504@vates.tech>
References: <1790699381.8631fc262581453bbf619ec5b2062170.1a0ee00218b000b504@vates.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790699289; l=843; i=baptiste.le-duc@vates.tech; s=20260810; h=from:subject:message-id; bh=H8taBvUA6jTgZUfzPnRgv6573OR6Cs4Baa+x6yEI1jI=; b=aSXIMGId6zhCkgNdjuRKU/y+RLztke8YefXSrsIrycCSGqdF8JeeR4+67Y/EOj3AMM9rh42BE sBMVyVvQ+JUDvfwgU+GCsWVVk3PgXHETgAxDslJ0m0xacJFcqLqpzbu
X-Developer-Key: i=baptiste.le-duc@vates.tech; a=ed25519; pk=N+BbdvMXRzrCuX/ieh4RWodiAKcLNvI+KjflcZ0oXCo=
Content-Transfer-Encoding: 8bit
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1790699585967
X-purgate-ID: tlsNG-ebf023/1790699603-C20D5B50-448A3359/0/0
X-purgate-type: clean
X-purgate-size: 845

Use pte_is_valid() instead of open-coding the PTE_VALID check.

No functional change.

Assisted-by: Claude:claude-opus-5
Signed-off-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>
---
Changes since v2:
- new patch.
---
 xen/arch/riscv/include/asm/page.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/riscv/include/asm/page.h b/xen/arch/riscv/include/asm/page.h
index 7772e2f572..d357223ce2 100644
--- a/xen/arch/riscv/include/asm/page.h
+++ b/xen/arch/riscv/include/asm/page.h
@@ -188,7 +188,7 @@ static inline bool pte_is_mapping(pte_t p)
 {
     ASSERT(!pte_is_reserved(p));
 
-    return (p.pte & PTE_VALID) && (p.pte & PTE_ACCESS_MASK);
+    return pte_is_valid(p) && (p.pte & PTE_ACCESS_MASK);
 }
 
 static inline bool pte_is_superpage(pte_t p, unsigned int level)

-- 
2.55.0


