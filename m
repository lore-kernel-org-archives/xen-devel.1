Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05BE7CA5FD4
	for <xen-devel@archiver.kernel.org>; Thu,  1 Oct 2026 09:07:49 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1438056.1656959 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xCClR-0001BA-5W; Thu, 01 Oct 2026 09:07:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1438056.1656959; Thu, 01 Oct 2026 09:07:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xCClR-0001B3-2W; Thu, 01 Oct 2026 09:07:41 +0000
Received: by outflank-mailman (input) for mailman id 1438056;
 Thu, 01 Oct 2026 09:07:39 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0f6b805100003f66@swg.vates.tech>)
 id 1xCClP-0000x7-Hi
 for xen-devel@lists.xenproject.org; Thu, 01 Oct 2026 09:07:39 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xCClO-007rva-UA
 for xen-devel@lists.xenproject.org; Thu, 01 Oct 2026 11:07:38 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0f6b805100003f66@swg.vates.tech>)
 id 6abe22d4-e002-0a2a0a5209dd-0a2a450b9688-46
 for <xen-devel@lists.xenproject.org>; Thu, 01 Oct 2026 11:07:38 +0200
Received: from [185.255.28.34] (helo=prod-mta-13-01.swg-srv.net)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0f6b805100003f66@swg.vates.tech>)
 id 6abe22d4-b7e8-0a2a450b0019-b9ff1c22802d-5
 for <xen-devel@lists.xenproject.org>; Thu, 01 Oct 2026 11:07:38 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-01.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a0f6b805100003f66.006 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 01 Oct 2026 09:07:30 +0000
Received: from leducb.home (lfbn-gre-1-371-96.w90-112.abo.wanadoo.fr
 [90.112.87.96]) (Authenticated sender: baptiste.le-duc)
 by mail2.vates.fr (Postfix) with ESMTPSA id 8F6A082407;
 Thu,  1 Oct 2026 11:07:29 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=JWn/eI0mKHCbdbf7soqSHQzjnaq/nAVioq6WQKxzwjM=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:content-transfer-encoding:in-reply-to:references:feedback-id;
 b=Y4n3WwzicjQunhpiFzvVN+Nb8ldKHuzwyzaxzmzkMGodtb7I/5OJXk9QooF0p0R39/nmS/79/
 iSfkMxTc+g2k82eighvZx6poAoSXUVjWkLlSE9lZbEvAlHWT2A6aqKpgMM9J1NLAwrKw4cl3sWF
 jjspaQHsnpOeOXBq8UUNP5x43mjllXCXhA6ig6/KXxHaFPmAChnEpw6TwY8DDi8dtG14WeFlgPD
 Xoaedt1tvxXpRkvEnuwdpFG/CRAhquBhvQImCIKgkQstEa4v7f+Dlz0Ex7gVBB9w4Ja5F0b//EE
 gYad1JLxiu4nCQNnbzGhx++OL49Vo2cXUIDQAW4yNn9g==
X-Zone-Loop: f1dcd7c325d7974f7226a3cda92dff5c73f17ae59e86
x-campaign-type: default
x-transaction-id: 5baec977-908e-43d4-8d8a-e01c6b7f93b9
x-swg-uid: 01-19e111d5-7538-48b1-8894-fb956a6b61d7
X-Mailer: Sweego
Message-ID:
 <1790845650.8631fc262581453bbf619ec5b2062170.1a0f6b805100003f66@vates.tech>
x-swg-bid: 1790845650.8631fc262581453bbf619ec5b2062170.1a0f6b805100003f66
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
Subject: [PATCH v4 4/4] xen/riscv: use pte_is_valid() in pte_is_mapping()
Date: Thu,  1 Oct 2026 11:07:23 +0200
In-Reply-To: <1790845467.8631fc262581453bbf619ec5b2062170.1a0f6b5397a0003f66@vates.tech>
References: <1790845467.8631fc262581453bbf619ec5b2062170.1a0f6b5397a0003f66@vates.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790845141; l=848; i=baptiste.le-duc@vates.tech; s=20260810; h=from:subject:message-id; bh=6mGtsTHc3Gt+40Y5dU6N3fqFHHuArI6qKHg38xPBObY=; b=Xyi3ZzsPtbUEyQL676/mjJOg6U/YvdlPjuKfDZpPJL60i2OeejYfNmgUJK4IAHyyvv8Ohn+4v y6NDHp+Ai93DFzJ/ogZYo07UFOuVD9ht3wJIaQL1hSxZZAKxZMBGQoK
X-Developer-Key: i=baptiste.le-duc@vates.tech; a=ed25519; pk=N+BbdvMXRzrCuX/ieh4RWodiAKcLNvI+KjflcZ0oXCo=
Content-Transfer-Encoding: 8bit
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1790845649771
X-purgate-ID: tlsNG-42698a/1790845658-186CA9EA-E78F5941/0/0
X-purgate-type: clean
X-purgate-size: 850

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
index 8a3e3e1e66..f9e59e61de 100644
--- a/xen/arch/riscv/include/asm/page.h
+++ b/xen/arch/riscv/include/asm/page.h
@@ -188,7 +188,7 @@ static inline bool pte_is_mapping(pte_t p)
 {
     ASSERT(!pte_has_reserved_rwx(p));
 
-    return (p.pte & PTE_VALID) && (p.pte & PTE_ACCESS_MASK);
+    return pte_is_valid(p) && (p.pte & PTE_ACCESS_MASK);
 }
 
 static inline bool pte_is_superpage(pte_t p, unsigned int level)

-- 
2.55.0


