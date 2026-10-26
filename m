Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 763E4606A31A
	for <xen-devel@archiver.kernel.org>; Mon, 26 Oct 2026 15:15:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=vates.tech header.i=@vates.tech header.a=rsa-sha256 header.s=selector1 header.b=cl/AkVMm
Received: from list by lists.xenproject.org with outflank-mailman.1461473.1672485 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLMPS-0004iY-Qm; Mon, 26 Oct 2026 15:14:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1461473.1672485; Mon, 26 Oct 2026 15:14:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLMPS-0004iR-Nx; Mon, 26 Oct 2026 15:14:50 +0000
Received: by outflank-mailman (input) for mailman id 1461473;
 Mon, 26 Oct 2026 15:14:49 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xLMPR-0004iJ-NE
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2026 15:14:49 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xLMPQ-003d5Y-PF
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2026 16:14:48 +0100
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a178c7355f000f79f@swg.vates.tech>)
 id 6adf6e59-8faa-0a2a0a5109dd-0a2a4508df58-40
 for <xen-devel@lists.xenproject.org>; Mon, 26 Oct 2026 16:14:48 +0100
Received: from [185.255.28.35] (helo=prod-mta-13-02.swg-srv.net)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a178c7355f000f79f@swg.vates.tech>)
 id 6adf6e68-f659-0a2a45080019-b9ff1c238a77-3
 for <xen-devel@lists.xenproject.org>; Mon, 26 Oct 2026 16:14:48 +0100
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-02.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a178c7355f000f79f.007 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 26 Oct 2026 15:14:43 +0000
Received: from leducb.home (areims-651-1-80-194.w90-18.abo.wanadoo.fr
 [90.18.187.194]) (Authenticated sender: baptiste.le-duc)
 by mail2.vates.fr (Postfix) with ESMTPSA id B3CBE815DF;
 Mon, 26 Oct 2026 16:14:42 +0100 (CET)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=vates.tech header.i="@vates.tech" header.h="From:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:References:Feedback-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech;
 q=dns/txt; s=selector1; bh=wjEhviDbcT9pueHXVGdYgzTkA0vnOrtJ8lu8wj6hDgI=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:content-transfer-encoding:in-reply-to:references:feedback-id;
 b=cl/AkVMm6tuP7u2ff56WU60KpqsWkRBbcnUoEit04kHMoLtTV58dam7H8nYv2ApCxlYo8c9AD
 48gmf94xX+JxzLM7ewUNrLKZAqMtn0r2/b2B6Y8iIBlP0OHIjwrCGp6D9JiuIbwspghD2bXtS0G
 n30shmqAUf42cL+uqJj1te5vRwC0ifgV9SQFAFTEFpFGinkfsbmpkngYzbP8qMlt7sz4uYlm+7y
 CfRXqzDiFl9VnAn287HwTHSGtxDg9En4QcBr/GGp2qqT3HQTJhDUhA6+Ch6ZvJes1tYJdtqH33A
 zAqD0FCK5XMYbY8MV2Vj7IoYSJxDpHAvoXQbWBzhD30Q==
X-Zone-Loop: 2de933f4cb81fa1905198a0746675615d4f21e7a3708
x-campaign-type: default
x-transaction-id: ae68d5d8-619e-46d3-81b7-56caea521fbd
x-swg-uid: 01-6e1abd89-f7e5-4f1d-beea-d5ea9e4d58be
X-Mailer: Sweego
Message-ID:
 <1793027683.8631fc262581453bbf619ec5b2062170.1a178c7355f000f79f@vates.tech>
x-swg-bid: 1793027683.8631fc262581453bbf619ec5b2062170.1a178c7355f000f79f
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
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
Subject: [PATCH v8 1/5] xen/riscv: use pte_is_valid() in pte_is_mapping()
Date: Mon, 26 Oct 2026 16:14:33 +0100
In-Reply-To: <1793027589.8631fc262581453bbf619ec5b2062170.1a178c5c430000f79f@vates.tech>
References: <1793027589.8631fc262581453bbf619ec5b2062170.1a178c5c430000f79f@vates.tech>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793027331; l=1365; i=baptiste.le-duc@vates.tech; s=20260810; h=from:subject:message-id; bh=TR/botraZWIEW3mqExx0XFYiNlY/hru2IatTX7DUjvI=; b=MoZU/esrYk8YjmKuafvbQM8nrTwtLuNkSuV1hWfopxzFcgMX0fALYWkhmyHKvDcOPooNm69dj nP9pZfb44pQBaCEiuZ2AVdT7/IWkyJ0Mm/OMD6j6Ea4U/C/jYQulQhr
X-Developer-Key: i=baptiste.le-duc@vates.tech; a=ed25519; pk=N+BbdvMXRzrCuX/ieh4RWodiAKcLNvI+KjflcZ0oXCo=
Content-Transfer-Encoding: 8bit
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1793027682927
X-purgate-ID: tlsNG-c1860d/1793027688-CEF5F87B-57C29B8B/10/78276251493
X-purgate-type: spam
X-purgate-size: 1367
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Use pte_is_valid() instead of open-coding the PTE_VALID check.

No functional change.

Assisted-by: Claude:claude-opus-5
Signed-off-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>
Reviewed-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes since v7:
- collect A-by.
---
Changes since v6:
- rebase, as moving the patch ahead in the series changed its context in
  pte_is_mapping().
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
2.56.0


