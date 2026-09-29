Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD6E9CA5FB1
	for <xen-devel@archiver.kernel.org>; Tue, 29 Sep 2026 16:33:36 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1436565.1655255 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBalk-00077s-OA; Tue, 29 Sep 2026 16:33:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1436565.1655255; Tue, 29 Sep 2026 16:33:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBalk-00077j-Km; Tue, 29 Sep 2026 16:33:28 +0000
Received: by outflank-mailman (input) for mailman id 1436565;
 Tue, 29 Sep 2026 16:33:27 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0ee034479000b504@swg.vates.tech>)
 id 1xBalj-00075F-4D
 for xen-devel@lists.xenproject.org; Tue, 29 Sep 2026 16:33:27 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xBali-008OWV-HK
 for xen-devel@lists.xenproject.org; Tue, 29 Sep 2026 18:33:26 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0ee034479000b504@swg.vates.tech>)
 id 6abbe852-8faa-0a2a0a5109dd-0a2a450a8762-26
 for <xen-devel@lists.xenproject.org>; Tue, 29 Sep 2026 18:33:26 +0200
Received: from [185.255.28.34] (helo=prod-mta-13-01.swg-srv.net)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0ee034479000b504@swg.vates.tech>)
 id 6abbe856-f2d2-0a2a450a0019-b9ff1c2291e3-3
 for <xen-devel@lists.xenproject.org>; Tue, 29 Sep 2026 18:33:26 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-01.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a0ee034479000b504.006 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 29 Sep 2026 16:33:06 +0000
Received: from leducb.home (areims-651-1-80-194.w90-18.abo.wanadoo.fr
 [90.18.187.194]) (Authenticated sender: baptiste.le-duc)
 by mail2.vates.fr (Postfix) with ESMTPSA id 1567E823AA;
 Tue, 29 Sep 2026 18:33:06 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=QtEeReohDrT56joXV07q7UEDqQN6ir05HjrVldJ7zVk=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:content-transfer-encoding:in-reply-to:references:feedback-id;
 b=poah5Y0Xno7GuD+mJJ+E+QzlObBDT09QMM+d9hN3aFSfI73O+Ez6nYnlJPX/Z45KNHciL4Dj7
 mXTGkGD4R81uMVtlaUnRz15N7EOiCTdO4k3DEG+tJud3Ydct0bU0CmKJHtI2Ilm79AAoYGMLFCi
 Ez+EnVbXvrwO1Gou1wXklK+u3owa6NHi5o8g5k4E0NUlN0xkF6nM4Ctzmp+m+xdXaNew5YwfHEO
 pk7HPtgu1jw68GCE1xf8fE7vsyc7rKYbs086Dr37UuRVQe5sG5RSTBZGZqJRHo5UXAVLsYi/Rc1
 rH+Q1HT3uX0IrohVFSgkJxzBxh/d189oXLyT7HhvhBlw==
X-Zone-Loop: dbb0accd60713173dad082eecde8a8de48da9f86b2e2
x-campaign-type: default
x-transaction-id: f90d3643-613b-45d2-9e15-a710a23097bd
x-swg-uid: 01-b8e0be9a-a0c5-4018-a55e-6fc64cddd403
X-Mailer: Sweego
Message-ID:
 <1790699586.8631fc262581453bbf619ec5b2062170.1a0ee034479000b504@vates.tech>
x-swg-bid: 1790699586.8631fc262581453bbf619ec5b2062170.1a0ee034479000b504
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
Subject: [PATCH v3 6/6] xen/riscv: make Zihintpause no longer a required extension
Date: Tue, 29 Sep 2026 18:32:47 +0200
In-Reply-To: <1790699381.8631fc262581453bbf619ec5b2062170.1a0ee00218b000b504@vates.tech>
References: <1790699381.8631fc262581453bbf619ec5b2062170.1a0ee00218b000b504@vates.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790699289; l=3161; i=baptiste.le-duc@vates.tech; s=20260810; h=from:subject:message-id; bh=WoMBT9/xwT97Z2UudFU580yGvNMK25r/GunTeSHKnhw=; b=0VXexm4THU1RwGaj+gq/JIo/fhZilR1o5Lq0S4ESKSmCc+QuQoBj1MHsTDkpJxOM+KsGDceJw afSjJ8SHgB7ABvL9mYQiSzlP/AgEis7YfpHKyO2HoSBJIwwTT2TdVop
X-Developer-Key: i=baptiste.le-duc@vates.tech; a=ed25519; pk=N+BbdvMXRzrCuX/ieh4RWodiAKcLNvI+KjflcZ0oXCo=
Content-Transfer-Encoding: 8bit
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1790699586266
X-purgate-ID: tlsNG-4011c0/1790699606-4B4D7CFC-1D395FA0/0/0
X-purgate-type: clean
X-purgate-size: 3163

Zihintpause is in required_extensions[] so Xen panics when it is missing,
while it does not strictly require hardware support for it.

The PAUSE hint (Zihintpause extension) is encoded as FENCE W, 0
(0x0100000F). In accordance with the RISC-V Unprivileged ISA, HINTs are
encoded in the space of valid standard instructions. On platforms without
Zihintpause support, executing 0x0100000F is treated as a standard FENCE
with an empty successor set, which acts as a NOP and never generates an
illegal instruction trap.

Zihintpause is therefore purely an optimization hint. Drop it from
required_extensions[] so Xen can still boot on systems that don't advertise
it, and print a warning in that case.

Assisted-by: Claude:claude-opus-5
Signed-off-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>
---
Changes since v2:
- rewrite commit message
- print a warning at boot when Zihintpause is unavailable
- drop Zihintpause requirement from booting.txt
---
Changes since v1:
- rewrite commit message.
---
 docs/misc/riscv/booting.txt |  3 ---
 xen/arch/riscv/cpufeature.c | 12 +++++++++++-
 2 files changed, 11 insertions(+), 4 deletions(-)

diff --git a/docs/misc/riscv/booting.txt b/docs/misc/riscv/booting.txt
index c99ccafa74..14212ed62f 100644
--- a/docs/misc/riscv/booting.txt
+++ b/docs/misc/riscv/booting.txt
@@ -19,9 +19,6 @@ them is missing from the riscv,isa property of the CPU nodes:
   a very simple sequence.
   The similar issue occurs with other __builtin_<bitop>, so it is needed to
   provide a generic version of bitops in RISC-V bitops.h
-- Zihintpause:
-  On a system that doesn't have this extension, cpu_relax() should be
-  implemented properly.
 - Svpbmt:
   Mandatory to enable changing the memory attributes of a page.
   For platforms that do not support Svpbmt, it is necessary to introduce a
diff --git a/xen/arch/riscv/cpufeature.c b/xen/arch/riscv/cpufeature.c
index ee35c7a17c..91404daac5 100644
--- a/xen/arch/riscv/cpufeature.c
+++ b/xen/arch/riscv/cpufeature.c
@@ -216,7 +216,6 @@ static const struct riscv_isa_ext_data __initconst required_extensions[] = {
     RISCV_ISA_EXT_DATA(h),
     RISCV_ISA_EXT_DATA(zicsr),
     RISCV_ISA_EXT_DATA(zifencei),
-    RISCV_ISA_EXT_DATA(zihintpause),
     RISCV_ISA_EXT_DATA(zbb),
     RISCV_ISA_EXT_DATA(svpbmt),
 };
@@ -707,6 +706,17 @@ void __init riscv_fill_hwcap(void)
 
     riscv_resolve_ad_scheme();
 
+    /*
+     * Zihintpause isn't mandatory: the encoding used by cpu_relax() is a
+     * HINT which executes as a no-op on hardware without the extension.
+     * Report it, as a platform may provide its own way to hint a spin-wait
+     * loop, which then has to be wired up in cpu_relax().
+     */
+    if ( !riscv_isa_extension_available(NULL, RISCV_ISA_EXT_zihintpause) )
+        printk(XENLOG_WARNING
+               "Zihintpause unavailable: cpu_relax() gives the CPU no hint; "
+               "wire up this platform's pause equivalent in cpu_relax()\n");
+
     for ( i = 0; i < req_extns_amount; i++ )
     {
         const struct riscv_isa_ext_data ext = required_extensions[i];

-- 
2.55.0


