Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4379DCC6B03
	for <xen-devel@archiver.kernel.org>; Tue, 13 Oct 2026 10:07:45 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1446889.1663026 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGZQ0-0004up-BH; Tue, 13 Oct 2026 10:07:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1446889.1663026; Tue, 13 Oct 2026 10:07:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGZQ0-0004uZ-73; Tue, 13 Oct 2026 10:07:36 +0000
Received: by outflank-mailman (input) for mailman id 1446889;
 Tue, 13 Oct 2026 10:07:35 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xGZPz-0004pp-08
 for xen-devel@lists.xenproject.org; Tue, 13 Oct 2026 10:07:35 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xGZPy-009Aep-DA
 for xen-devel@lists.xenproject.org; Tue, 13 Oct 2026 12:07:34 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a134bb1a5b0008425@swg.vates.tech>)
 id 6ace02e2-bab6-0a2a0a5309dd-0a2a4502bb5e-28
 for <xen-devel@lists.xenproject.org>; Tue, 13 Oct 2026 12:07:34 +0200
Received: from [185.255.28.35] (helo=prod-mta-13-02.swg-srv.net)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a134bb1a5b0008425@swg.vates.tech>)
 id 6ace02e2-6ca4-0a2a45020019-b9ff1c238655-4
 for <xen-devel@lists.xenproject.org>; Tue, 13 Oct 2026 12:07:34 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-02.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a134bb1a5b0008425.007 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 13 Oct 2026 10:07:19 +0000
Received: from leducb.home (lfbn-gre-1-371-96.w90-112.abo.wanadoo.fr
 [90.112.87.96]) (Authenticated sender: baptiste.le-duc)
 by mail2.vates.fr (Postfix) with ESMTPSA id 0341382990;
 Tue, 13 Oct 2026 12:07:19 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=5k7rt7koC4EV6CBmJQy3vnSMBgJHJLR/LUoGlfSBZyY=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:content-transfer-encoding:in-reply-to:references:feedback-id;
 b=jejmvJUPEDXqSCqrXPnlrfk9mPJk3KkOu4EGLjC5R8B077du9l3eKCsBS544a2sZBCUd7RH5e
 +cmfV8Xivut5t4NixJEziBOcATPnG+WRu+JV7DewkXE50WVrK+/94R5Wv8H7fxAgJQEk3DYk8I0
 /X5fx29zqwSDRtEieWprB+sgaX/+QLzYaEJXxRxDneqrrFBOQM2I9AD48kW6AIVObzOLMw+WKSU
 1CApmkupUfyKLE1mqmQZpY5FquwWlgXdrNqPpdlFYseuTKOH3z7Zi8uI+x7Dad50MWhRXmzUSKp
 8MwCF12eZAhVyYdB+Y/ksCgj0+55eER5efMiR9EbUhbg==
X-Zone-Loop: 1454c97216d3762ddaf79e6c6f693902a6d250f273eb
x-campaign-type: default
x-transaction-id: c70b2fee-9137-4e96-82b4-6ef1353cdc59
x-swg-uid: 01-65d51739-90a1-48ed-b085-48277a2b67d7
X-Mailer: Sweego
Message-ID:
 <1791886039.8631fc262581453bbf619ec5b2062170.1a134bb1a5b0008425@vates.tech>
x-swg-bid: 1791886039.8631fc262581453bbf619ec5b2062170.1a134bb1a5b0008425
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
Subject: [PATCH v6 4/4] xen/riscv: use pte_is_valid() in pte_is_mapping()
Date: Tue, 13 Oct 2026 12:07:13 +0200
In-Reply-To: <1791885904.8631fc262581453bbf619ec5b2062170.1a134b909b40008425@vates.tech>
References: <1791885904.8631fc262581453bbf619ec5b2062170.1a134b909b40008425@vates.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791885856; l=1099; i=baptiste.le-duc@vates.tech; s=20260810; h=from:subject:message-id; bh=Af/b9/pAf+eE4YvnmAH7fU3eq2R32LznKCQUe6Hiujw=; b=/uJEAa5iz79LK6RIBI68GDyEmvaDK7mfdn4I6/G2NbPF/FIZY426IdCG8Ks3wDghrVOL4Tfka VDXe0AUaihOCcirYp0uYgPX0CLzXOSG2SxCvyrQO72GaZGWwaWQBEfN
X-Developer-Key: i=baptiste.le-duc@vates.tech; a=ed25519; pk=N+BbdvMXRzrCuX/ieh4RWodiAKcLNvI+KjflcZ0oXCo=
Content-Transfer-Encoding: 8bit
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1791886039210
X-purgate-ID: tlsNG-720697/1791886054-303C42AC-1C26280A/10/73395122804
X-purgate-type: spam
X-purgate-size: 1101

Use pte_is_valid() instead of open-coding the PTE_VALID check.

No functional change.

Assisted-by: Claude:claude-opus-5
Signed-off-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>
Reviewed-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
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


