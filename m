Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D48DEC61DC6
	for <xen-devel@archiver.kernel.org>; Thu, 27 Aug 2026 15:33:55 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1401164.1636925 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzc6p-0004UM-UA; Thu, 27 Aug 2026 15:33:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1401164.1636925; Thu, 27 Aug 2026 15:33:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzc6p-0004UF-RD; Thu, 27 Aug 2026 15:33:43 +0000
Received: by outflank-mailman (input) for mailman id 1401164;
 Thu, 27 Aug 2026 15:33:42 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a043dad34e000c4f3@swg.vates.tech>)
 id 1wzc6o-0004FB-4Y
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2026 15:33:42 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wzc6l-004lPY-Ha
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2026 17:33:39 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a043dad34e000c4f3@swg.vates.tech>)
 id 6a9058cd-bab6-0a2a0a5309dd-0a2a4501bec4-12
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 17:33:39 +0200
Received: from [185.255.28.34] (helo=prod-mta-13-01.swg-srv.net)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a043dad34e000c4f3@swg.vates.tech>)
 id 6a9058cc-5984-0a2a45010019-b9ff1c22a3e9-5
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 17:33:39 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-01.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a043dad34e000c4f3.007 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 27 Aug 2026 15:33:29 +0000
Received: from leducb.home (areims-651-1-80-194.w90-18.abo.wanadoo.fr
 [90.18.187.194]) (Authenticated sender: baptiste.le-duc)
 by mail2.vates.fr (Postfix) with ESMTPSA id E6D7983BA9;
 Thu, 27 Aug 2026 17:33:28 +0200 (CEST)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=vates.tech header.i="@vates.tech" header.h="From:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Transfer-Encoding:In-Reply-To:References:Feedback-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech;
 q=dns/txt; s=selector1; bh=24Z5cEfX20FEssAKJ5JDYU2thxtQEXCNuYQwEhaCNHw=;
 h=from:subject:date:message-id:to:cc:mime-version:content-transfer-encoding:in-reply-to:references:feedback-id;
 b=QIHyA+bDeDRk/w40rfz15NeOGbIH+O8a0WAI8D6bwAMWgFadB14oCyLXs8/GPNRhM5iYxeKRO
 N0mdFG9EBvqJN0Xj53ZnQ9YZIdGLHtKQzM8+7/1XRhoujGnWWDqn4UVW7wKDeL77Z2BMpkI0QBo
 n8p9vP8G5CAhx31nhyP20pAwb4WJ6M2XZZyridtbM+vJSrC1/tK5pL7HH6lzQHO+y/hkAb/jin0
 1r+o5M6U2RCLoo4gvDT/Fl1Dmyo4lgs3qTh88ekJ7RdDR1sHL3Z9U7KdBXGaX+hjxqCS10TLdUc
 2sQkMuoNBy8z1Ho9HJYf/D2FrY2zmkY64mAPPQbHn9Fw==
X-Zone-Loop: 28b1bd41c377b658159428097b5a8916c244f407a400
x-campaign-type: default
x-transaction-id: cd31eacc-04a0-4a67-a765-dc237c755b85
x-swg-uid: 01-a44bb09f-ed3e-4cba-a115-539818405db2
X-Mailer: Sweego
Message-ID:
 <1787844809.8631fc262581453bbf619ec5b2062170.1a043dad34e000c4f3@vates.tech>
x-swg-bid: 1787844809.8631fc262581453bbf619ec5b2062170.1a043dad34e000c4f3
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
From: Baptiste Le Duc <baptiste.le-duc@vates.tech>
To: xen-devel@lists.xenproject.org
Cc: zhangzheng@iscas.ac.cn,
	Baptiste Le Duc <baptiste.le-duc@vates.tech>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 3/5] xen/riscv: make Svpbmt no longer a required extension
Date: Thu, 27 Aug 2026 17:33:17 +0200
In-Reply-To: <1787844438.8631fc262581453bbf619ec5b2062170.1a043d52a06000c4f3@vates.tech>
References: <1787844438.8631fc262581453bbf619ec5b2062170.1a043d52a06000c4f3@vates.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1787844809139
X-purgate-ID: tlsNG-d62444/1787844819-1FE68757-E279A184/0/0
X-purgate-type: clean
X-purgate-size: 2988

required_extensions[] panics at boot if Svpbmt is missing, which is a
problem on hardware that doesn't implement it. Xen already checks Svpbmt at
runtime in some places (vcpu_csr_init()), but not everywhere:
p2m_pte_from_mfn() and the PAGE_HYPERVISOR_NOCACHE/WC macros still set the
raw PTE_PBMT* encoding unconditionally.

Drop Svpbmt from required_extensions, and introduce pte_pbmt(), which masks
the requested PBMT encoding down to 0 when Svpbmt is unavailable, using it
in both remaining unguarded spots.

Assisted-by: Claude:claude-opus-5
Signed-off-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>
---
 xen/arch/riscv/cpufeature.c       | 1 -
 xen/arch/riscv/include/asm/page.h | 8 ++++++--
 xen/arch/riscv/p2m.c              | 2 +-
 3 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/xen/arch/riscv/cpufeature.c b/xen/arch/riscv/cpufeature.c
index 92235fdfd5..900cb9d772 100644
--- a/xen/arch/riscv/cpufeature.c
+++ b/xen/arch/riscv/cpufeature.c
@@ -157,7 +157,6 @@ static const struct riscv_isa_ext_data __initconst required_extensions[] = {
     RISCV_ISA_EXT_DATA(zifencei),
     RISCV_ISA_EXT_DATA(zihintpause),
     RISCV_ISA_EXT_DATA(zbb),
-    RISCV_ISA_EXT_DATA(svpbmt),
 };
 
 static bool __init is_lowercase_extension_name(const char *str)
diff --git a/xen/arch/riscv/include/asm/page.h b/xen/arch/riscv/include/asm/page.h
index 5c02f64a17..6a3749526d 100644
--- a/xen/arch/riscv/include/asm/page.h
+++ b/xen/arch/riscv/include/asm/page.h
@@ -11,6 +11,7 @@
 #include <xen/types.h>
 
 #include <asm/atomic.h>
+#include <asm/cpufeature.h>
 #include <asm/page-bits.h>
 
 #define VPN_MASK                    (PAGETABLE_ENTRIES - 1UL)
@@ -54,6 +55,9 @@
 #define PAGE_HYPERVISOR_RX          (PTE_LEAF_DEFAULT | PTE_EXECUTABLE)
 
 #define PAGE_HYPERVISOR             PAGE_HYPERVISOR_RW
+
+#define pte_pbmt(pbmt) \
+    (riscv_isa_extension_available(NULL, RISCV_ISA_EXT_svpbmt) ? (pbmt) : 0UL)
 /*
  * PAGE_HYPERVISOR_NOCACHE is used for ioremap().
  *
@@ -61,8 +65,8 @@
  * is that IO is non-idempotent and strongly ordered, which makes it a good
  * candidate for mapping IOMEM.
  */
-#define PAGE_HYPERVISOR_NOCACHE     (PAGE_HYPERVISOR_RW | PTE_PBMT_IO)
-#define PAGE_HYPERVISOR_WC          (PAGE_HYPERVISOR_RW | PTE_PBMT_NOCACHE)
+#define PAGE_HYPERVISOR_NOCACHE     (PAGE_HYPERVISOR_RW | pte_pbmt(PTE_PBMT_IO))
+#define PAGE_HYPERVISOR_WC          (PAGE_HYPERVISOR_RW | pte_pbmt(PTE_PBMT_NOCACHE))
 
 /*
  * The PTE format does not contain the following bits within itself;
diff --git a/xen/arch/riscv/p2m.c b/xen/arch/riscv/p2m.c
index 11dc289f0f..f6e635ec1d 100644
--- a/xen/arch/riscv/p2m.c
+++ b/xen/arch/riscv/p2m.c
@@ -683,7 +683,7 @@ static pte_t p2m_pte_from_mfn(mfn_t mfn, p2m_type_t t,
         switch ( t )
         {
         case p2m_mmio_direct_io:
-            e.pte |= PTE_PBMT_IO;
+            e.pte |= pte_pbmt(PTE_PBMT_IO);
             break;
 
         default:

