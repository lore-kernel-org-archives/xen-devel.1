Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81CB2CC6B38
	for <xen-devel@archiver.kernel.org>; Fri, 16 Oct 2026 15:34:54 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1452238.1667082 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHjxF-0006Ej-7O; Fri, 16 Oct 2026 15:34:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1452238.1667082; Fri, 16 Oct 2026 15:34:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHjxF-0006EX-4T; Fri, 16 Oct 2026 15:34:45 +0000
Received: by outflank-mailman (input) for mailman id 1452238;
 Fri, 16 Oct 2026 15:34:44 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a14559acd50008425@swg.vates.tech>)
 id 1xHjxD-0006CA-Rq
 for xen-devel@lists.xenproject.org; Fri, 16 Oct 2026 15:34:43 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xHjxD-001ryr-8S
 for xen-devel@lists.xenproject.org; Fri, 16 Oct 2026 17:34:43 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a14559acd50008425@swg.vates.tech>)
 id 6ad24413-e002-0a2a0a5209dd-0a2a450485b6-0
 for <xen-devel@lists.xenproject.org>; Fri, 16 Oct 2026 17:34:43 +0200
Received: from [185.255.28.34] (helo=prod-mta-13-01.swg-srv.net)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a14559acd50008425@swg.vates.tech>)
 id 6ad2440f-b57f-0a2a45040019-b9ff1c22aa49-4
 for <xen-devel@lists.xenproject.org>; Fri, 16 Oct 2026 17:34:43 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-01.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a14559acd50008425.007 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 16 Oct 2026 15:34:27 +0000
Received: from leducb (lfbn-gre-1-371-96.w90-112.abo.wanadoo.fr [90.112.87.96])
 (Authenticated sender: baptiste.le-duc)
 by mail2.vates.fr (Postfix) with ESMTPSA id 9E01F810D3;
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
 q=dns/txt; s=selector1; bh=h04Hzox3zgjbpcf+0P2EnIWZow6bWEDIHK8/hqyjTPQ=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:content-transfer-encoding:in-reply-to:references:feedback-id;
 b=RIiC+bGKoUxLYNDzQpWVyDrkkK6+9GMCXws+UuhLKgqfv/S36/sCfEbzwK539hYs8WTBmq7t5
 AmkZmx6LmIM107wR8ETFOnQTuNYapP0wpornJh9DEskQrhxGYRnPCf1RAEk5oSOt/4HmzIE53Nb
 bkTRdB1rk0sEjMiQyRp/WSp8MT+NGpUNNRkh470z/DL494YCzmmPgs19Sh0JRHcJi0Ej2cnRIfN
 S2qMThBeJZ2ilQ+/hxJ//VYzraGqHr3eaKAD2VSWyvMOCiwEfMP1rgJZ1dlFLf3x3EXzo+MYOhG
 UAPZE4qZaC6AedElNLlvUYwUafRMuGdojC7qpv7JJ9UQ==
X-Zone-Loop: ea2f99a36fef2c199ece06ad51bb652b55a3a11495b7
x-campaign-type: default
x-transaction-id: 72999b38-07ea-49ed-906f-d3ed2be33771
x-swg-uid: 01-6a4943de-9800-4414-9e3c-321f373fd043
X-Mailer: Sweego
Message-ID:
 <1792164867.8631fc262581453bbf619ec5b2062170.1a14559acd50008425@vates.tech>
x-swg-bid: 1792164867.8631fc262581453bbf619ec5b2062170.1a14559acd50008425
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
Subject: [PATCH v7 4/4] xen/riscv: rework the A/D bits comment in p2m_set_pte_flags()
Date: Fri, 16 Oct 2026 17:34:20 +0200
In-Reply-To: <1792164706.8631fc262581453bbf619ec5b2062170.1a14557373c0008425@vates.tech>
References: <1792164706.8631fc262581453bbf619ec5b2062170.1a14557373c0008425@vates.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792164601; l=4824; i=baptiste.le-duc@vates.tech; s=20260810; h=from:subject:message-id; bh=Mv+v4M/J3Q6LeDzmM1l8D/JPCMBtrswouZq8wEXvjUM=; b=dB2J+ksp8OeIPnH8RGrKdlHUqguCXe/dcIi1lrJJAdqjb0IP3u21G+LDV3hlta811pHQFJUpO TB5Uuc3hsU1Bw11DcRmcoXekV/cVVKib4oMX5upC22joaEvtuw1TLCS
X-Developer-Key: i=baptiste.le-duc@vates.tech; a=ed25519; pk=N+BbdvMXRzrCuX/ieh4RWodiAKcLNvI+KjflcZ0oXCo=
Content-Transfer-Encoding: 8bit
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1792164866841
X-purgate-ID: tlsNG-ebf023/1792164883-C0CDFB50-A8D8C7A8/0/0
X-purgate-type: clean
X-purgate-size: 4826

The comment in p2m_set_pte_flags() quotes the spec at length to describe
the two A/D bits schemes, and its TODO mixes two things: why A/D are preset
today (OpenSBI delegates the resulting page faults to a lower privilege
mode, so Xen would take them with no handler) and what remains to be done.

Summarize the two schemes as a short list. The reason for presetting A/D is
not future work, so move it out of the TODO, next to the schemes. The TODO
now keeps only the later work, handling these page faults instead of
presetting A/D, which only concerns Svade as A/D page faults cannot happen
otherwise.

Also note that presetting the A/D bits is harmless when the device
tree advertises both Svade and Svadu and the platform uses hardware
A/D updating.

No functional change.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>
---
Changes since v6:
- drop the change to preset A/D unless only Svadu is advertised, as
  riscv_fill_hwcap() now panics if the device tree advertises neither
  Svade nor Svadu. The patch only reworks the comment.
- update the patch's title accordingly.
---
Changes since v5:
- new patch, split out of "xen/riscv: always preset A/D bits in G-stage
  PTEs".
---
 xen/arch/riscv/p2m.c | 45 +++++++++++++++++++--------------------------
 1 file changed, 19 insertions(+), 26 deletions(-)

diff --git a/xen/arch/riscv/p2m.c b/xen/arch/riscv/p2m.c
index 3d195294d5..a2d81a9c8a 100644
--- a/xen/arch/riscv/p2m.c
+++ b/xen/arch/riscv/p2m.c
@@ -591,35 +591,28 @@ static void p2m_set_pte_flags(pte_t *e, p2m_type_t t)
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
+     * A RISC-V implementation can either:
+     * 1) Update the 'A' and 'D' PTE bits in hardware.
+     * 2) Generate a page fault when 'A' and/or 'D' is clear, so that
+     *    software can set them.
      *
-     * TODO: For now, it’s fine to simply set the A/D bits, since OpenSBI
-     *       delegates page faults to a lower privilege mode and so OpenSBI
-     *       isn't expect to handle page-faults occured in lower modes.
-     *       By setting the A/D bits here, page faults that would otherwise
-     *       be generated due to unset A/D bits will not occur in Xen.
+     * (1) needs nothing more as it is handled by hardware. For (2), set 'A'
+     * and 'D' up front: OpenSBI delegates such page faults to a lower
+     * privilege mode, so they would be raised in Xen, which has no handler
+     * for them.
      *
-     *       Currently, Xen on RISC-V does not make use of the information
-     *       that could be obtained from handling such page faults, which
-     *       could otherwise be useful for several use cases such as demand
-     *       paging, cache-flushing optimizations, memory access tracking,etc.
+     * If both Svade and Svadu are advertised and the CPU updates A/D in
+     * hardware, presetting them is harmless.
      *
-     *       To support the more general case and the optimizations mentioned
-     *       above, it would be better to stop setting the A/D bits here and
-     *       instead handle page faults that occur due to unset A/D bits.
+     * TODO: Xen on RISC-V currently makes no use of the information that
+     *       handling such page faults could provide, which would be useful
+     *       for several use cases such as demand paging, cache-flushing
+     *       optimizations, memory access tracking, etc.
+     *
+     *       To support the more general case and the optimizations
+     *       mentioned above, it would be better to stop setting the A/D
+     *       bits here and instead handle the page faults that occur due to
+     *       unset A/D bits.
      */
     if ( riscv_isa_extension_available(NULL, RISCV_ISA_EXT_svade) )
         e->pte |= PTE_ACCESSED | PTE_DIRTY;

-- 
2.55.0


