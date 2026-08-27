Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19D43C61DB9
	for <xen-devel@archiver.kernel.org>; Thu, 27 Aug 2026 15:33:55 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1401162.1636907 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzc6h-00040S-EC; Thu, 27 Aug 2026 15:33:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1401162.1636907; Thu, 27 Aug 2026 15:33:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzc6h-00040L-BX; Thu, 27 Aug 2026 15:33:35 +0000
Received: by outflank-mailman (input) for mailman id 1401162;
 Thu, 27 Aug 2026 15:33:33 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a043dad0d3000c4f3@swg.vates.tech>)
 id 1wzc6f-0003z6-Pu
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2026 15:33:33 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wzc6f-004lPY-3F
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2026 17:33:33 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a043dad0d3000c4f3@swg.vates.tech>)
 id 6a9058cd-bab6-0a2a0a5309dd-0a2a4501bec4-0
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 17:33:33 +0200
Received: from [185.255.28.34] (helo=prod-mta-13-01.swg-srv.net)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a043dad0d3000c4f3@swg.vates.tech>)
 id 6a9058cc-5984-0a2a45010019-b9ff1c22a3e9-3
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 17:33:32 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-01.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a043dad0d3000c4f3.007 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 27 Aug 2026 15:33:28 +0000
Received: from leducb.home (areims-651-1-80-194.w90-18.abo.wanadoo.fr
 [90.18.187.194]) (Authenticated sender: baptiste.le-duc)
 by mail2.vates.fr (Postfix) with ESMTPSA id 0FDDB83B2C;
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=vates.tech header.i="@vates.tech" header.h="From:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:References:Feedback-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech;
 q=dns/txt; s=selector1; bh=lX3gKu4rOIRe3Ekaw+G/MAhrsXOHOk9RXSUMvf3lWds=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:content-transfer-encoding:in-reply-to:references:feedback-id;
 b=ZrNrmNIK4cVTEAi6nB+/edzEL1qDOO3lJF9uuU2iB5Qqp4ZiMq82hlzHofPvd36xvFTNBFHNd
 idxYifoHi8NPLfhaLsFEKgqA/eaFe6DZiqm5RrKXG6E5/7nauC2x3p3HZ1X2sszEr+0xxPJeOpc
 LvMp9OWpKLGyFyMy2NG7CZqiJR8xdaUH+J8UaMM3Sy9QrwA74y2pBZPLnXq0YIGlBFzPjTzY0De
 e4App96PGHaORFAaRI/h+ErNDRPsfcHAujnq0qr4FrjPIiBCBByIcZbvAy86lbakWuRVhyHCln0
 WvXSWaXh0unbl+EwLNBIwA/qG18bvbj54eWC73W62kTQ==
X-Zone-Loop: 10b4c05640a8da4398d9b25087e118bc2a72120cd49e
x-campaign-type: default
x-transaction-id: 69c5737c-279c-481a-ac8c-8068ba8e385f
x-swg-uid: 01-c127937a-9dcc-4a91-bc29-95335dd5ff6b
X-Mailer: Sweego
Message-ID:
 <1787844808.8631fc262581453bbf619ec5b2062170.1a043dad0d3000c4f3@vates.tech>
x-swg-bid: 1787844808.8631fc262581453bbf619ec5b2062170.1a043dad0d3000c4f3
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
Subject: [PATCH 1/5] xen/riscv: always set A/D bits at boot time
Date: Thu, 27 Aug 2026 17:33:15 +0200
In-Reply-To: <1787844438.8631fc262581453bbf619ec5b2062170.1a043d52a06000c4f3@vates.tech>
References: <1787844438.8631fc262581453bbf619ec5b2062170.1a043d52a06000c4f3@vates.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1787844808264
X-purgate-ID: tlsNG-d62444/1787844812-1DC79757-86441F54/0/0
X-purgate-type: clean
X-purgate-size: 5404

Always set the PTE A/D bits at boot time to avoid an unhandled page fault
on platforms that implement neither Svade nor Svadu, and on platforms that
declare both in the device tree.

Rewrite the comment to enumerate the four possible Svade/Svadu combinations
(inspired by [1]) and set A/D unconditionally, which is correct in all four
cases until Svadu is fully supported (full support requires the SBI FWFT
call to enable hardware updating of A/D bits).

[1] https://lwn.net/Articles/980016/

Assisted-by: Claude:claude-opus-5
Signed-off-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>
---
 xen/arch/riscv/p2m.c | 70 ++++++++++++++++++++++++++------------------
 1 file changed, 42 insertions(+), 28 deletions(-)

diff --git a/xen/arch/riscv/p2m.c b/xen/arch/riscv/p2m.c
index 1cea86512c..11dc289f0f 100644
--- a/xen/arch/riscv/p2m.c
+++ b/xen/arch/riscv/p2m.c
@@ -591,38 +591,52 @@ static void p2m_set_permission(pte_t *e, p2m_type_t t)
     e->pte |= PTE_USER;
 
     /*
-     * Two schemes to manage the A and D bits are defined:
-     *   • The Svade extension: when a virtual page is accessed and the A bit
-     *     is clear, or is written and the D bit is clear, a page-fault
-     *     exception is raised.
-     *   • When the Svade extension is not implemented, the following scheme
-     *     applies.
-     *     When a virtual page is accessed and the A bit is clear, the PTE is
-     *     updated to set the A bit. When the virtual page is written and the
-     *     D bit is clear, the PTE is updated to set the D bit. When G-stage
-     *     address translation is in use and is not Bare, the G-stage virtual
-     *     pages may be accessed or written by implicit accesses to VS-level
-     *     memory management data structures, such as page tables.
-     * Thereby to avoid a page-fault in case of Svade is available, it is
-     * necessary to set A and D bits.
+     * Svade and Svadu extensions represent two schemes for managing the PTE
+     * A/D bits. When the PTE A/D bits need to be set, the Svade extension
+     * indicates that a page fault will be raised. In contrast, the Svadu
+     * extension supports hardware updating of the PTE A/D bits.
      *
-     * TODO: For now, it’s fine to simply set the A/D bits, since OpenSBI
-     *       delegates page faults to a lower privilege mode and so OpenSBI
-     *       isn't expect to handle page-faults occured in lower modes.
-     *       By setting the A/D bits here, page faults that would otherwise
-     *       be generated due to unset A/D bits will not occur in Xen.
+     * There are 4 possible combinations of these extensions in the device
+     * tree. The default hardware behavior for each is:
      *
-     *       Currently, Xen on RISC-V does not make use of the information
-     *       that could be obtained from handling such page faults, which
-     *       could otherwise be useful for several use cases such as demand
-     *       paging, cache-flushing optimizations, memory access tracking,etc.
+     * 1) Neither Svade nor Svadu present in DT => It is technically unknown
+     *    whether the platform uses Svade or Svadu. Xen should be prepared to
+     *    handle either hardware updating of the PTE A/D bits or page faults
+     *    when they need updating. To support both, Xen always sets the 'A' and
+     *    'D' PTE bits at boot time.
      *
-     *       To support the more general case and the optimizations mentioned
-     *       above, it would be better to stop setting the A/D bits here and
-     *       instead handle page faults that occur due to unset A/D bits.
+     * 2) Only Svade present in DT => Xen must assume Svade to be always
+     *    enabled.
+     *
+     * 3) Only Svadu present in DT => Xen must assume Svadu to be always
+     *    enabled.
+     *
+     * 4) Both Svade and Svadu present in DT => Xen must assume Svadu is turned
+     *    off at boot time by setting A/D bits. To use Svadu, the supervisor
+     *    must explicitly enable it using the SBI FWFT extension.
+     *
+     * The Svade extension is mandatory and the Svadu extension is optional in
+     * the RVA23 profile. Platforms wanting to take advantage of Svadu can
+     * choose option 3. Platforms aware of the profile can choose option 4, and
+     * Linux won't get the benefit of Svadu until the SBI FWFT extension is
+     * available.
+     *
+     * Currently, Xen on RISC-V does not make use of the information that could
+     * be obtained from handling such page faults, which could otherwise be
+     * useful for several use cases such as demand paging, cache-flushing
+     * optimizations, memory access tracking, etc.
+     *
+     * To support the more general case and the optimizations mentioned above,
+     * it would be better to stop setting the A/D bits here and instead handle
+     * page faults that occur due to unset A/D bits.
+     */
+
+    /*
+     * Preset unconditionally for all 4 cases above, harmless when Svadu
+     * manages the bits (case 3). Skipping it for case 3 requires SBI FWFT
+     * which is not yet supported.
      */
-    if ( riscv_isa_extension_available(NULL, RISCV_ISA_EXT_svade) )
-        e->pte |= PTE_ACCESSED | PTE_DIRTY;
+    e->pte |= PTE_ACCESSED | PTE_DIRTY;
 
     switch ( t )
     {

