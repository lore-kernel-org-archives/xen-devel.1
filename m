Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8F04C79FB9
	for <xen-devel@archiver.kernel.org>; Thu, 10 Sep 2026 09:35:30 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1414234.1644045 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4bBe-0004Px-3z; Thu, 10 Sep 2026 09:35:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1414234.1644045; Thu, 10 Sep 2026 09:35:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4bBe-0004Pq-0y; Thu, 10 Sep 2026 09:35:18 +0000
Received: by outflank-mailman (input) for mailman id 1414234;
 Thu, 10 Sep 2026 09:35:16 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a08aaba3b8000c4f3@swg.vates.tech>)
 id 1x4bBc-0004NG-Rt
 for xen-devel@lists.xenproject.org; Thu, 10 Sep 2026 09:35:16 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x4bBc-00FAkC-8e
 for xen-devel@lists.xenproject.org; Thu, 10 Sep 2026 11:35:16 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a08aaba3b8000c4f3@swg.vates.tech>)
 id 6aa279d1-2eae-0a2a0a5409dd-0a2a45058730-18
 for <xen-devel@lists.xenproject.org>; Thu, 10 Sep 2026 11:35:16 +0200
Received: from [185.255.28.34] (helo=prod-mta-13-01.swg-srv.net)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a08aaba3b8000c4f3@swg.vates.tech>)
 id 6aa279d3-4cb1-0a2a45050019-b9ff1c228a0d-3
 for <xen-devel@lists.xenproject.org>; Thu, 10 Sep 2026 11:35:16 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-01.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a08aaba3b8000c4f3.007 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 10 Sep 2026 09:34:59 +0000
Received: from leducb.home (areims-651-1-80-194.w90-18.abo.wanadoo.fr
 [90.18.187.194]) (Authenticated sender: baptiste.le-duc)
 by mail2.vates.fr (Postfix) with ESMTPSA id CE6E281E0F;
 Thu, 10 Sep 2026 11:34:58 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=RCwI/CvQHkl5huemyVSULsoFXmRH9tLdrSmGjZIII34=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:content-transfer-encoding:in-reply-to:references:feedback-id;
 b=CJ4qTI7zUwSds4AzJvDmNfX7YW154myeoHUFQe2iaBY7fW/xrNaZmBACelc4yNhvogY61uwIJ
 8+l5baFBzH6O2K0Lcs6pR7EYUQNff6p/UTRv/JyBA+VVvyVnHKlbPPQ6yS/zwGqiyr9aNbpPLHw
 b+sM0RVkyEITuT+HyJEZj36z1fq3OKtHYWGIAx0W+nZeJAurP8tZkd5bVvZSE6VA9lJIhVr5Ied
 Wdws9cTUHRTbnTHDkLDysMLGeTRNhuTEkChqXKNE2JOBaLIUdqlVwOEMrAUpvP8GpC7y72kohNI
 5H6Z2Q1uhn2YwpnGN8p4uZFVOA7Levr2tLHwv1L51JxA==
X-Zone-Loop: 18e32e81ebd0207eee728b0687c3892bf11de8fca549
x-campaign-type: default
x-transaction-id: d4089c17-9daa-4106-9d65-11b371a56fce
x-swg-uid: 01-5b7aa16d-d323-4cb3-9789-779f9dbd7309
X-Mailer: Sweego
Message-ID:
 <1789032899.8631fc262581453bbf619ec5b2062170.1a08aaba3b8000c4f3@vates.tech>
x-swg-bid: 1789032899.8631fc262581453bbf619ec5b2062170.1a08aaba3b8000c4f3
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
From: Baptiste Le Duc <baptiste.le-duc@vates.tech>
To: Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Cc: Baptiste Le Duc <baptiste.le-duc@vates.tech>,
	xen-devel@lists.xenproject.org,
	Zheng Zhang <zhangzheng@iscas.ac.cn>
Subject: [PATCH v2 6/6] xen/riscv: fix level_map_mask truncation on load_start
Date: Thu, 10 Sep 2026 11:34:54 +0200
In-Reply-To: <1789032657.8631fc262581453bbf619ec5b2062170.1a08aa7f23b000c4f3@vates.tech>
References: <1789032657.8631fc262581453bbf619ec5b2062170.1a08aa7f23b000c4f3@vates.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789032264; l=2391; i=baptiste.le-duc@vates.tech; s=20260810; h=from:subject:message-id; bh=EukpbiTX/G19DWwnVmYEkUdIYk1+eY5cBq7NCGMGSwY=; b=5NN6pbNqsPZBOVYzXv7RM+d3wJTOBMlrqhqWaPZw16orp1hq1gxMAcUo/9v3z16gOZQIG9Mxg 4OVRQ8S/7ZlC0jdgROlf36Q0X62pXqyCXUk+qUwtjSkZZEnt+9AVnJ4
X-Developer-Key: i=baptiste.le-duc@vates.tech; a=ed25519; pk=N+BbdvMXRzrCuX/ieh4RWodiAKcLNvI+KjflcZ0oXCo=
Content-Transfer-Encoding: 8bit
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1789032899042
X-purgate-ID: tlsNG-c201ff/1789032916-F6EB12A1-6F3DD476/0/0
X-purgate-type: clean
X-purgate-size: 2393

check_pgtbl_mode_support() declares level_map_mask as bare `unsigned`, i.e.
a 32-bit type while it derives from a paddr_t which is in both RV32/RV64 a
64-bit type. Storing that value into a 32-bit local silently drops any set
bits above bit 31.

The mask is then used as:

    aligned_load_start = load_start & level_map_mask;

load_start is `unsigned long` (64-bit on riscv64) and if it requires more
than 32 bits to represent, because load_start zero-extend to 64 bits, we
would drop some load_start's bits during the AND.

Widen level_map_mask to `unsigned long`, matching the width of the physical
address.

Fixes: e66003e7be19 ("xen/riscv: introduce setup_initial_pages")
Reported-by: Zheng Zhang <zhangzheng@iscas.ac.cn>
Signed-off-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>
---
Changes since v1:
- new patch
---
Question:
I would think replacing unsigned long by paddr_t would be better in this
case but for consistency with other variables in the function I just kept
unsigned long.

However, there are many variables in mm.c which are unsigned long while
they are, in reality, physical addresses and could technically be paddr_t.
Using paddr_t would also let us bypass the compiler's decision on what
unsigned long extends to (u32 or u64, depending on the target), and
therefore be more generic. I've seen similar code in Arm using this
convention, and found nothing on the mailing list explaining the original
choice of unsigned long over paddr_t.

Replacing every such field would be a fairly large change, so I'm asking
for your opinion on whether it's worth doing.
---
 xen/arch/riscv/mm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/riscv/mm.c b/xen/arch/riscv/mm.c
index 53bebbcabf..e7f2491257 100644
--- a/xen/arch/riscv/mm.c
+++ b/xen/arch/riscv/mm.c
@@ -180,7 +180,7 @@ static bool __init check_pgtbl_mode_support(struct mmu_desc *mmu_desc,
     bool is_mode_supported = false;
     unsigned int index;
     unsigned int page_table_level = (mmu_desc->num_levels - 1);
-    unsigned level_map_mask = XEN_PT_LEVEL_MAP_MASK(page_table_level);
+    unsigned long level_map_mask = XEN_PT_LEVEL_MAP_MASK(page_table_level);
 
     unsigned long aligned_load_start = load_start & level_map_mask;
     unsigned long aligned_page_size = XEN_PT_LEVEL_SIZE(page_table_level);

-- 
2.55.0


