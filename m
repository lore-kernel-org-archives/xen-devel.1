Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 527BBCA5FF0
	for <xen-devel@archiver.kernel.org>; Mon,  5 Oct 2026 16:00:49 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1440978.1658565 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xDl7B-0001VN-1s; Mon, 05 Oct 2026 16:00:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1440978.1658565; Mon, 05 Oct 2026 16:00:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xDl7A-0001VB-Ud; Mon, 05 Oct 2026 16:00:32 +0000
Received: by outflank-mailman (input) for mailman id 1440978;
 Mon, 05 Oct 2026 16:00:32 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xDl79-0001UP-Ux
 for xen-devel@lists.xenproject.org; Mon, 05 Oct 2026 16:00:31 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xDl79-002951-AT
 for xen-devel@lists.xenproject.org; Mon, 05 Oct 2026 18:00:31 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a10ccb619c0003f66@swg.vates.tech>)
 id 6ac3c994-8faa-0a2a0a5109dd-0a2a450b9ed4-48
 for <xen-devel@lists.xenproject.org>; Mon, 05 Oct 2026 18:00:31 +0200
Received: from [185.255.28.18] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a10ccb619c0003f66@swg.vates.tech>)
 id 6ac3c99e-b7e8-0a2a450b0019-b9ff1c12a051-3
 for <xen-devel@lists.xenproject.org>; Mon, 05 Oct 2026 18:00:31 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a10ccb619c0003f66.007 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 05 Oct 2026 16:00:17 +0000
Received: from leducb.home (areims-651-1-80-194.w90-18.abo.wanadoo.fr
 [90.18.187.194]) (Authenticated sender: baptiste.le-duc)
 by mail2.vates.fr (Postfix) with ESMTPSA id 35CC48280B;
 Mon,  5 Oct 2026 18:00:17 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=io7ydM6wQjnb7pc+CL6LBvwBURlY1aKhFGpyl/SFLdM=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:content-transfer-encoding:in-reply-to:references:feedback-id;
 b=mkI+6kqvbHLRucn5PL5/eIQ4AnrUtMuRbe/nTSEWurvx/uW6NnBHrghbHL/wTcK0xuaohzXy4
 so+z2ETiVCzpDIsGmMtEa/JJv7glb4FRziZWWbnBZO7uLPZEIASGAA6ZcZ1GY2sRm+pMeax+f2W
 oJBbbyKZqEi7VgIjLyxj6/ubPqEwwVfkqdXGJf464Xc8lmQFlc/BxYC8siGwaUzmjPxPqgfFnHf
 zxzAU3mcgitCS1M1qjYI2/gE4kIKFzAgIeMt6QJY0+apIiccXrYwAgL4DLiv4YpOS5bZLAf+VBp
 y9bo4L9qQeUphdFJCL7NSOqFAi+UEN7oeYzMNbAVYMGQ==
X-Zone-Loop: 09b5500678aca61bee225ee4584e653f9bee47db4396
x-campaign-type: default
x-transaction-id: ee3a49bf-b669-4c54-ac39-caed46c55572
x-swg-uid: 01-8449e5a7-ca9f-4e5a-8ba3-dc873b6bf920
X-Mailer: Sweego
Message-ID:
 <1791216017.8631fc262581453bbf619ec5b2062170.1a10ccb619c0003f66@vates.tech>
x-swg-bid: 1791216017.8631fc262581453bbf619ec5b2062170.1a10ccb619c0003f66
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
Subject: [PATCH v5 3/3] xen/riscv: use pte_is_valid() in pte_is_mapping()
Date: Mon,  5 Oct 2026 18:00:16 +0200
In-Reply-To: <1791215925.8631fc262581453bbf619ec5b2062170.1a10cc9f7c20003f66@vates.tech>
References: <1791215925.8631fc262581453bbf619ec5b2062170.1a10cc9f7c20003f66@vates.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791215868; l=1017; i=baptiste.le-duc@vates.tech; s=20260810; h=from:subject:message-id; bh=mfATwIkml8XPxYLNKsPDuCuta+Y9echIFDKTb+/YvRE=; b=udBmv3YNcYm7Alk+b+2JN7o8WJ/iGv3UZs0K728bPBE4ntdExZntIv/uxnHRjuJgd0CAA2sNM 8DDrkaCdP4bCUnhuiAIKkMKCuVtTHFywlS2tyBJN05AZajuxcotYjpq
X-Developer-Key: i=baptiste.le-duc@vates.tech; a=ed25519; pk=N+BbdvMXRzrCuX/ieh4RWodiAKcLNvI+KjflcZ0oXCo=
Content-Transfer-Encoding: 8bit
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1791216017415
X-purgate-ID: tlsNG-42698a/1791216031-A9EC69EA-B54B7DDF/10/73395122804
X-purgate-type: spam
X-purgate-size: 1019

Use pte_is_valid() instead of open-coding the PTE_VALID check.

No functional change.

Assisted-by: Claude:claude-opus-5
Signed-off-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>
Reviewed-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
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


