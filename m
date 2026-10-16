Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C52F4CCA490
	for <xen-devel@archiver.kernel.org>; Fri, 16 Oct 2026 15:34:54 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1452237.1667073 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHjxB-0005xm-Vy; Fri, 16 Oct 2026 15:34:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1452237.1667073; Fri, 16 Oct 2026 15:34:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHjxB-0005xf-Sw; Fri, 16 Oct 2026 15:34:41 +0000
Received: by outflank-mailman (input) for mailman id 1452237;
 Fri, 16 Oct 2026 15:34:41 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xHjxA-0005vX-Sj
 for xen-devel@lists.xenproject.org; Fri, 16 Oct 2026 15:34:41 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xHjxA-003Lqz-99
 for xen-devel@lists.xenproject.org; Fri, 16 Oct 2026 17:34:40 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a14559ab900008425@swg.vates.tech>)
 id 6ad243ee-8faa-0a2a0a5109dd-0a2a4504a44a-36
 for <xen-devel@lists.xenproject.org>; Fri, 16 Oct 2026 17:34:40 +0200
Received: from [185.255.28.34] (helo=prod-mta-13-01.swg-srv.net)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a14559ab900008425@swg.vates.tech>)
 id 6ad2440f-b57f-0a2a45040019-b9ff1c22aa49-3
 for <xen-devel@lists.xenproject.org>; Fri, 16 Oct 2026 17:34:39 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-01.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a14559ab900008425.007 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 16 Oct 2026 15:34:26 +0000
Received: from leducb (lfbn-gre-1-371-96.w90-112.abo.wanadoo.fr [90.112.87.96])
 (Authenticated sender: baptiste.le-duc)
 by mail2.vates.fr (Postfix) with ESMTPSA id 3A33482190;
 Fri, 16 Oct 2026 17:34:26 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=O1iw31PjB9Hki7H+M4S0HFTKSFv8k+gHvipzgRgmyow=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:content-transfer-encoding:in-reply-to:references:feedback-id;
 b=OZmnkUWYvF3feSd5Tl5ukx2rruvo+bTBMz+L4tKmr830vPLHnr2JMqHsO2P1kM4fD736FLBn8
 SF8wa34LxnvdcbgvgCw9HfD0E14ZKWqAp3i5wo6fPrLjsZK64LBdavsGWdjwtZdioZh2mYCmBDW
 5PCw67rjBG7ZJYMwdfMQreKhQejRNhI+BJMyKr1blUfNJHgTH8+SeVSD3yFTjYVElceRV9UlJIo
 LsRCZFalT4snTSuHOMP6D2YTS1doA2kCbprdbavpuryGb7sZq6I/YkJX3DcFAONxrgcqisj60v1
 Ea2j+p9wQxEbRXm8RmYD3EzA/rgp1bUda3JoRPDPRynw==
X-Zone-Loop: a1d4275a7722689af0e917690b65b59ccd2a6b34a253
x-campaign-type: default
x-transaction-id: 048fa238-8fcd-46f7-8ed6-243c978e7730
x-swg-uid: 01-02bef059-e6b6-4d0d-afd5-79e06264249b
X-Mailer: Sweego
Message-ID:
 <1792164867.8631fc262581453bbf619ec5b2062170.1a14559ab900008425@vates.tech>
x-swg-bid: 1792164867.8631fc262581453bbf619ec5b2062170.1a14559ab900008425
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
Subject: [PATCH v7 3/4] xen/riscv: panic if the device tree advertises neither Svade nor Svadu
Date: Fri, 16 Oct 2026 17:34:19 +0200
In-Reply-To: <1792164706.8631fc262581453bbf619ec5b2062170.1a14557373c0008425@vates.tech>
References: <1792164706.8631fc262581453bbf619ec5b2062170.1a14557373c0008425@vates.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792164601; l=4855; i=baptiste.le-duc@vates.tech; s=20260810; h=from:subject:message-id; bh=eN2ifjmoqFQ0XZBkxcJg+hlp7/mIynrnz6gDFALyBmA=; b=MkRMsAyOMvDjiwpAZycWz+p6eskCQYqqDFtDc/HEJViX5gG1h2bncKqvUspeiIUAOLudnrWln AyaXVKlJ1//DZnq8UdRy7RLVoHUTGadT3ot8xkgQb/tS69QlmHji6Zm
X-Developer-Key: i=baptiste.le-duc@vates.tech; a=ed25519; pk=N+BbdvMXRzrCuX/ieh4RWodiAKcLNvI+KjflcZ0oXCo=
Content-Transfer-Encoding: 8bit
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1792164866439
X-purgate-ID: tlsNG-ebf023/1792164879-C38C1B50-C3DB94E6/10/78276251493
X-purgate-type: spam
X-purgate-size: 4857

p2m_set_pte_flags() presets the A/D bits of G-stage PTEs only when
RISCV_ISA_EXT_svade is set, which is correct only if the device tree is.

The privileged spec allows exactly two schemes for updating the PTE A and D
bits: hardware sets them on access and on write, or accessing a page whose
A and/or D bit is clear raises a page fault so that software can set them
(ratified as Svade). Every implementation uses one of them, but platforms
designed before Svade and Svadu were ratified, such as the HiFive Premier
P550, may advertise neither. Xen then cannot tell which scheme is in
effect, so rather than guess, panic in riscv_fill_hwcap() when the device
tree advertises neither Svade nor Svadu, so that the device tree gets
fixed.

Add Svadu to the known ISA extensions so it can be told apart from Svade.
The comment above the enum asks for new extensions to go at the bottom to
avoid shuffling, a leftover from Linux where the IDs were macros with
explicit values. Nothing depends on the enum values, so have the comment
say that multi-letter extensions follow the order of riscv_isa_ext[].

Suggested-by: Jan Beulich <jbeulich@suse.com>
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>
---
Changes since v6:
- drop the probe and trust the device tree, only panic when it advertises
  neither Svade nor Svadu.
- update the patch's title/body accordingly.
- put svadu between svade and svpbmt in riscv_isa_ext_id.
- rewrite the enum riscv_isa_ext_id comment.
---
Changes since v5:
- new patch, probe the A/D bits update scheme instead of trusting the
  device tree alone.
---
 xen/arch/riscv/cpufeature.c             | 17 +++++++++++++++++
 xen/arch/riscv/include/asm/cpufeature.h | 13 +++++++------
 2 files changed, 24 insertions(+), 6 deletions(-)

diff --git a/xen/arch/riscv/cpufeature.c b/xen/arch/riscv/cpufeature.c
index 3d5bbd2228..5406fad59b 100644
--- a/xen/arch/riscv/cpufeature.c
+++ b/xen/arch/riscv/cpufeature.c
@@ -200,6 +200,7 @@ static const struct riscv_isa_ext_entry __initconstrel riscv_isa_ext[] = {
     RISCV_ISA_EXT_ENTRY(ssaia,          ANY),
     RISCV_ISA_EXT_ENTRY(sstc,           NONE),
     RISCV_ISA_EXT_ENTRY(svade,          NONE),
+    RISCV_ISA_EXT_ENTRY(svadu,          NONE),
     RISCV_ISA_EXT_ENTRY(svpbmt,         NONE),
 };
 
@@ -674,6 +675,22 @@ void __init riscv_fill_hwcap(void)
                "Zihintpause unavailable: cpu_relax() gives the CPU no hint; "
                "wire up this platform's pause equivalent in cpu_relax()\n");
 
+    /*
+     * The privileged spec allows exactly two schemes for updating the PTE A
+     * and D bits:
+     *  1) hardware sets them on access and on write;
+     *  2) accessing a page whose A and/or D bit is clear raises a page fault,
+     *     so that software can set them (ratified as Svade).
+     *
+     * Every implementation uses one of them, but may predate the extensions
+     * and advertise neither. The device tree is then ambiguous: Xen cannot
+     * tell which scheme is in effect, so panic and have the device tree
+     * fixed.
+     */
+    if ( !riscv_isa_extension_available(NULL, RISCV_ISA_EXT_svade) &&
+         !riscv_isa_extension_available(NULL, RISCV_ISA_EXT_svadu) )
+        panic("Device tree advertises neither Svade nor Svadu, A/D bits update scheme unknown\n");
+
     for ( i = 0; i < req_extns_amount; i++ )
     {
         const struct riscv_isa_ext_data ext = required_extensions[i];
diff --git a/xen/arch/riscv/include/asm/cpufeature.h b/xen/arch/riscv/include/asm/cpufeature.h
index 2973eb13a5..b0a23be18e 100644
--- a/xen/arch/riscv/include/asm/cpufeature.h
+++ b/xen/arch/riscv/include/asm/cpufeature.h
@@ -8,13 +8,13 @@
 #include <xen/types.h>
 
 /*
- * These macros represent the logical IDs of each multi-letter RISC-V ISA
- * extension and are used in the ISA bitmap. The logical IDs start from
- * RISCV_ISA_EXT_BASE, which allows the 0-25 range to be reserved for single
- * letter extensions and are used in enum riscv_isa_ext_id.
+ * Logical IDs of RISC-V ISA extensions, used as bit positions in the ISA
+ * bitmap.
  *
- * New extensions should just be added to the bottom, rather than added
- * alphabetically, in order to avoid unnecessary shuffling.
+ * Single-letter extensions use IDs below RISCV_ISA_EXT_BASE and are sorted
+ * alphabetically. Multi-letter extensions start from RISCV_ISA_EXT_BASE and
+ * follow the same order as riscv_isa_ext[] (see the ordering rules described
+ * above it).
  */
 #define RISCV_ISA_EXT_BASE  26
 
@@ -41,6 +41,7 @@ enum riscv_isa_ext_id {
     RISCV_ISA_EXT_ssaia,
     RISCV_ISA_EXT_sstc,
     RISCV_ISA_EXT_svade,
+    RISCV_ISA_EXT_svadu,
     RISCV_ISA_EXT_svpbmt,
     RISCV_ISA_EXT_MAX
 };

-- 
2.55.0


