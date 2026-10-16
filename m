Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C688DCCA46C
	for <xen-devel@archiver.kernel.org>; Fri, 16 Oct 2026 15:34:41 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1452234.1667054 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHjx3-0005Rd-Gs; Fri, 16 Oct 2026 15:34:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1452234.1667054; Fri, 16 Oct 2026 15:34:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHjx3-0005RW-E0; Fri, 16 Oct 2026 15:34:33 +0000
Received: by outflank-mailman (input) for mailman id 1452234;
 Fri, 16 Oct 2026 15:34:31 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xHjx1-0005Q5-Fg
 for xen-devel@lists.xenproject.org; Fri, 16 Oct 2026 15:34:31 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xHjx0-001rv9-Sq
 for xen-devel@lists.xenproject.org; Fri, 16 Oct 2026 17:34:30 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a14559a8f00008425@swg.vates.tech>)
 id 6ad243ed-e002-0a2a0a5209dd-0a2a4509811e-40
 for <xen-devel@lists.xenproject.org>; Fri, 16 Oct 2026 17:34:30 +0200
Received: from [185.255.28.18] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a14559a8f00008425@swg.vates.tech>)
 id 6ad24405-be1a-0a2a45090019-b9ff1c12a4b1-3
 for <xen-devel@lists.xenproject.org>; Fri, 16 Oct 2026 17:34:30 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a14559a8f00008425.007 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 16 Oct 2026 15:34:26 +0000
Received: from leducb (lfbn-gre-1-371-96.w90-112.abo.wanadoo.fr [90.112.87.96])
 (Authenticated sender: baptiste.le-duc)
 by mail2.vates.fr (Postfix) with ESMTPSA id 67A2F810D3;
 Fri, 16 Oct 2026 17:34:25 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=TYkQbB24A7mbJzP5+9iAJu5opBgqk4kHWOgNAlFgWI4=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:content-transfer-encoding:in-reply-to:references:feedback-id;
 b=BYu+8xkDBEd7ga7nURxD7eStHZ5zN+M2DUDESW5Itfmz5dNOC3hv3+RQ9sg8ET5fALRy4Q0sS
 teKWAGKGbGWJYT+gSzrNfR6SHcXS390V/z3cNC3NPXNpOpN4kYn+vApeUfUF722BUYEnoUbaqx+
 xCxej3O39sHewbNvHhOVFXGIeIjE00VM6bjUpbkQQDFTofHsyoBOOpZH8lWCtIX8Dm+1+n4ulTI
 rU6ws2dNyyNrJ5/RyGAhwFXbRThU0VgqO8nPN+ENqWvwc/IxDZs1megAlN5OUJwxqkn0M1x+Qa4
 jc5Yx3yfC3H5hYq/8s1jFT1/uoH/2XsehgxyCpdGSPGg==
X-Zone-Loop: a05d7fb29ecdfa93b6ef93729b99bff15f3fea3002fe
x-campaign-type: default
x-transaction-id: 50ac1b70-a57b-47d9-9dc3-21ae62cad52b
x-swg-uid: 01-c5688111-bf24-429d-9945-ff29132c079f
X-Mailer: Sweego
Message-ID:
 <1792164866.8631fc262581453bbf619ec5b2062170.1a14559a8f00008425@vates.tech>
x-swg-bid: 1792164866.8631fc262581453bbf619ec5b2062170.1a14559a8f00008425
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
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Zheng Zhang <zhangzheng@iscas.ac.cn>
Subject: [PATCH v7 1/4] xen/riscv: use pte_is_valid() in pte_is_mapping()
Date: Fri, 16 Oct 2026 17:34:17 +0200
In-Reply-To: <1792164706.8631fc262581453bbf619ec5b2062170.1a14557373c0008425@vates.tech>
References: <1792164706.8631fc262581453bbf619ec5b2062170.1a14557373c0008425@vates.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792164601; l=1244; i=baptiste.le-duc@vates.tech; s=20260810; h=from:subject:message-id; bh=+LzNSE69Zr30dJkU84NarchViXCqICrw6WmtSLXks6Q=; b=bNTzxbYvv9vey4JFgGuBmc1YSyU9HYVbIGJ/y6Ya5nH8owyjvbOZWlcI2n85Ep+5dFkXXT1fb 3vu3h6/sCqkCBDtGMzVZ9LLo0asg3B9sL6/G+5QlnaOTe5ypgAq6fkg
X-Developer-Key: i=baptiste.le-duc@vates.tech; a=ed25519; pk=N+BbdvMXRzrCuX/ieh4RWodiAKcLNvI+KjflcZ0oXCo=
Content-Transfer-Encoding: 8bit
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1792164865623
X-purgate-ID: tlsNG-bad1c0/1792164870-3A6DA034-00595ABD/10/73395122804
X-purgate-type: spam
X-purgate-size: 1246

Use pte_is_valid() instead of open-coding the PTE_VALID check.

No functional change.

Assisted-by: Claude:claude-opus-5
Signed-off-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>
Reviewed-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes since v6:
- no changes, already reviewed and waiting to be merged.
---
Changes since v5:
- no changes, already reviewed and waiting to be merged.
---
Changes since v4:
- rebase on top of staging.
---
Changes since v3:
- no changes.
- add trailers.
---
Changes since v2:
- new patch.
---
 xen/arch/riscv/include/asm/page.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/riscv/include/asm/page.h b/xen/arch/riscv/include/asm/page.h
index b465a90325..c8bb334b85 100644
--- a/xen/arch/riscv/include/asm/page.h
+++ b/xen/arch/riscv/include/asm/page.h
@@ -187,7 +187,7 @@ static inline bool pte_is_mapping(pte_t p)
     /* See pte_is_table() */
     ASSERT(((p.pte & PAGE_HYPERVISOR_RW) != (PTE_VALID | PTE_WRITABLE)));
 
-    return (p.pte & PTE_VALID) && (p.pte & PTE_ACCESS_MASK);
+    return pte_is_valid(p) && (p.pte & PTE_ACCESS_MASK);
 }
 
 static inline bool pte_is_superpage(pte_t p, unsigned int level)

-- 
2.55.0


