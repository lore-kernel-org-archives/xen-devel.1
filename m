Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25E4ECA5FA7
	for <xen-devel@archiver.kernel.org>; Tue, 29 Sep 2026 16:33:25 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1436558.1655211 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBalT-0005qJ-BO; Tue, 29 Sep 2026 16:33:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1436558.1655211; Tue, 29 Sep 2026 16:33:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBalT-0005qC-8L; Tue, 29 Sep 2026 16:33:11 +0000
Received: by outflank-mailman (input) for mailman id 1436558;
 Tue, 29 Sep 2026 16:33:10 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xBalS-0005q6-1h
 for xen-devel@lists.xenproject.org; Tue, 29 Sep 2026 16:33:10 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xBalR-009fcQ-Er
 for xen-devel@lists.xenproject.org; Tue, 29 Sep 2026 18:33:09 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0ee033d8d000b504@swg.vates.tech>)
 id 6abbe841-8faa-0a2a0a5109dd-0a2a450abf7c-12
 for <xen-devel@lists.xenproject.org>; Tue, 29 Sep 2026 18:33:09 +0200
Received: from [185.255.28.34] (helo=prod-mta-13-01.swg-srv.net)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0ee033d8d000b504@swg.vates.tech>)
 id 6abbe845-f2d2-0a2a450a0019-b9ff1c2295cf-3
 for <xen-devel@lists.xenproject.org>; Tue, 29 Sep 2026 18:33:09 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-01.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a0ee033d8d000b504.006 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 29 Sep 2026 16:33:04 +0000
Received: from leducb.home (areims-651-1-80-194.w90-18.abo.wanadoo.fr
 [90.18.187.194]) (Authenticated sender: baptiste.le-duc)
 by mail2.vates.fr (Postfix) with ESMTPSA id F133C81FC1;
 Tue, 29 Sep 2026 18:33:03 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=12mKu7El4VkzxXu5EH/5PCbGFN8X+TVJYBMrRAMDRcI=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:content-transfer-encoding:in-reply-to:references:feedback-id;
 b=OCgb2ehJC+ErXCa/V5Lrg/Zj5iyAHQoGWpAnytHXvVg0XBd6xh05F/vCwnuzsLDaNwqZ/nW2r
 LOKIQ2oQei7gVmXQ0/5SuMfKXb5x8DcQqPQaaOSA2sCCP73IVNiu6K7NMSMI3BKff6GxWtvkmei
 lHbEfXSUthiphkywZnckudWYojurt1Xbfr/ttWBwOBt+OmB1pCCgqDesNBIORkUVXufr7+KUnJs
 cRrE6lAis2hqKlWumbiA6qVOAxnoyn9yLwWKz6p/u7OPiRwhS3qsdEwyNUn3WaEhllfNpQv14kg
 vak0+FqHGo3ieKY1GWJZNNl6Bsdi40LXY4ykqo5uJHig==
X-Zone-Loop: fe2842a351f855fece7b6f0f02f0ba1a2a638fe53afe
x-campaign-type: default
x-transaction-id: 2f8fe3ca-19cd-402f-b3e9-f6964f43810a
x-swg-uid: 01-db512d60-8cc1-4f86-9a85-f5ebc72efa51
X-Mailer: Sweego
Message-ID:
 <1790699584.8631fc262581453bbf619ec5b2062170.1a0ee033d8d000b504@vates.tech>
x-swg-bid: 1790699584.8631fc262581453bbf619ec5b2062170.1a0ee033d8d000b504
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
Subject: [PATCH v3 1/6] docs/riscv: sync required ISA extensions with required_extensions[]
Date: Tue, 29 Sep 2026 18:32:42 +0200
In-Reply-To: <1790699381.8631fc262581453bbf619ec5b2062170.1a0ee00218b000b504@vates.tech>
References: <1790699381.8631fc262581453bbf619ec5b2062170.1a0ee00218b000b504@vates.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790699289; l=3168; i=baptiste.le-duc@vates.tech; s=20260810; h=from:subject:message-id; bh=nLzeT75EaLv5u/dZAvUywqbxINvFTyoxgtWKF0QIu8g=; b=+i19NMXJr6ygjWucFQtYsFMobjm/VjhNLEN844atyhnp5pAFWOnWBfqFON+D0vDztsLBMRd9m Odcr+6jygBNDQA9ZnXaDU+9DE2UJkQq8A7unDlMwUVihcSrdvXQmMBO
X-Developer-Key: i=baptiste.le-duc@vates.tech; a=ed25519; pk=N+BbdvMXRzrCuX/ieh4RWodiAKcLNvI+KjflcZ0oXCo=
Content-Transfer-Encoding: 8bit
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1790699584176
X-purgate-ID: tlsNG-4011c0/1790699589-58BC8CFC-06502D6B/10/73395122804
X-purgate-type: spam
X-purgate-size: 3225

From: Oleksii Kurochko <oleksii.kurochko@gmail.com>

booting.txt listed only H, Zbb, Zihintpause and Svpbmt as required, while
required_extensions[] in cpufeature.c also checks for I, M, A, Zicsr,
Zifencei and, with CONFIG_RISCV_ISA_C=y, C. As the panic message printed
for a missing extension points to booting.txt, document the missing ones.

Also add a section pointing to riscv_isa_ext[] for the optional extensions
Xen recognises, and a comment above required_extensions[] to keep it in
sync with the document.

No functional change.

Suggested-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>
Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Signed-off-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>
---
Changes since v2:
- new patch
---
 docs/misc/riscv/booting.txt | 24 ++++++++++++++++++++----
 xen/arch/riscv/cpufeature.c |  1 +
 2 files changed, 21 insertions(+), 4 deletions(-)

diff --git a/docs/misc/riscv/booting.txt b/docs/misc/riscv/booting.txt
index e100bde575..c99ccafa74 100644
--- a/docs/misc/riscv/booting.txt
+++ b/docs/misc/riscv/booting.txt
@@ -1,8 +1,12 @@
 System requirements
 ===================
 
-The following extensions are expected to be supported by a system on which
-Xen is run:
+The following extensions are required by Xen. Xen panics at boot if any of
+them is missing from the riscv,isa property of the CPU nodes:
+- I, M, A, Zicsr, Zifencei:
+  Base ISA Xen is compiled for.
+- C:
+  Required only when Xen is built with CONFIG_RISCV_ISA_C=y.
 - H:
   Provides additional instructions and CSRs that control the new stage of
   address translation and support hosting a guest OS in virtual S-mode
@@ -18,7 +22,19 @@ Xen is run:
 - Zihintpause:
   On a system that doesn't have this extension, cpu_relax() should be
   implemented properly.
-- SVPBMT is mandatory to enable changing the memory attributes of a page.
-  For platforms that do not support SVPBMT, it is necessary to introduce a
+- Svpbmt:
+  Mandatory to enable changing the memory attributes of a page.
+  For platforms that do not support Svpbmt, it is necessary to introduce a
   similar mechanism as described in:
   https://lore.kernel.org/all/20241102000843.1301099-1-samuel.holland@sifive.com/
+
+Note: this list must be kept in sync with required_extensions[] in
+      xen/arch/riscv/cpufeature.c.
+
+Optional extensions
+===================
+
+Other extensions recognised by Xen are listed in riscv_isa_ext[] in
+xen/arch/riscv/cpufeature.c. Xen uses them when present, but they are not
+needed to boot. The second column of that table says whether the extension
+is also exposed to guests.
diff --git a/xen/arch/riscv/cpufeature.c b/xen/arch/riscv/cpufeature.c
index aaf544d13f..2d12dffae7 100644
--- a/xen/arch/riscv/cpufeature.c
+++ b/xen/arch/riscv/cpufeature.c
@@ -203,6 +203,7 @@ static const struct riscv_isa_ext_entry __initconstrel riscv_isa_ext[] = {
     RISCV_ISA_EXT_ENTRY(svpbmt,         NONE),
 };
 
+/* Keep in sync with docs/misc/riscv/booting.txt. */
 static const struct riscv_isa_ext_data __initconst required_extensions[] = {
     RISCV_ISA_EXT_DATA(i),
     RISCV_ISA_EXT_DATA(m),

-- 
2.55.0


