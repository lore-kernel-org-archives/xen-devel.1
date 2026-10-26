Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AC83606A31E
	for <xen-devel@archiver.kernel.org>; Mon, 26 Oct 2026 15:15:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=vates.tech header.i=@vates.tech header.a=rsa-sha256 header.s=selector1 header.b=lsvoqg+3
Received: from list by lists.xenproject.org with outflank-mailman.1461478.1672522 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLMPe-0005hI-Ql; Mon, 26 Oct 2026 15:15:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1461478.1672522; Mon, 26 Oct 2026 15:15:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLMPe-0005h9-Nd; Mon, 26 Oct 2026 15:15:02 +0000
Received: by outflank-mailman (input) for mailman id 1461478;
 Mon, 26 Oct 2026 15:15:01 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xLMPd-0005fI-Bg
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2026 15:15:01 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xLMPc-00ESEG-Oj
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2026 16:15:00 +0100
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a178c73b94000f79f@swg.vates.tech>)
 id 6adf6e6b-e002-0a2a0a5209dd-0a2a4508c308-16
 for <xen-devel@lists.xenproject.org>; Mon, 26 Oct 2026 16:15:00 +0100
Received: from [185.255.28.18] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a178c73b94000f79f@swg.vates.tech>)
 id 6adf6e74-f659-0a2a45080019-b9ff1c1288f5-3
 for <xen-devel@lists.xenproject.org>; Mon, 26 Oct 2026 16:15:00 +0100
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a178c73b94000f79f.007 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 26 Oct 2026 15:14:45 +0000
Received: from leducb.home (areims-651-1-80-194.w90-18.abo.wanadoo.fr
 [90.18.187.194]) (Authenticated sender: baptiste.le-duc)
 by mail2.vates.fr (Postfix) with ESMTPSA id A082F81E53;
 Mon, 26 Oct 2026 16:14:44 +0100 (CET)
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
 q=dns/txt; s=selector1; bh=kbx7FuSDc06ZBA43oBu6G+26e9mYroFRMBqi6Ps0vuU=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:content-transfer-encoding:in-reply-to:references:feedback-id;
 b=lsvoqg+3RjD+DEYUJ9yXQVHB4uPBYC3I+WaPrBUBrL90X4xpUixuTI29ZXzz5aFOvTgECrjTv
 +pQrgSSFfF4SxjbKyM9+UCOOGRerkAxpgP93nLtFjQRmzgHh+yAJDFcG0xonvbNHuiWtj8lVUXl
 dbYJubvg4Rzfrzf3ySCOnxBtpsrnyEl4NDZhJD6dSAQoYOwSLuEAmFDdT7twv5t5yT6FkpxO+NP
 i0HHiKwvlAXDCiUnFtxZFPWXr37rvGqqlPO+7N+Dn01FRCrKuuqD3enToKtwNif+f9DhEWjV3HM
 rA4WEk78f293yp0mQk6qnf2O450cOe+amOwCnw4DGH3w==
X-Zone-Loop: d7d220821e69ed06eedb9f2381061f70adb9e84aaf55
x-campaign-type: default
x-transaction-id: 80be7ad3-14bf-4d8b-8bbe-13ce78bfed0d
x-swg-uid: 01-03d6eaac-5398-4723-a137-2008d35b89b5
X-Mailer: Sweego
Message-ID:
 <1793027685.8631fc262581453bbf619ec5b2062170.1a178c73b94000f79f@vates.tech>
x-swg-bid: 1793027685.8631fc262581453bbf619ec5b2062170.1a178c73b94000f79f
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
Subject: [PATCH v8 5/5] xen/riscv: rework the A/D bits comment in p2m_set_pte_flags()
Date: Mon, 26 Oct 2026 16:14:37 +0100
In-Reply-To: <1793027589.8631fc262581453bbf619ec5b2062170.1a178c5c430000f79f@vates.tech>
References: <1793027589.8631fc262581453bbf619ec5b2062170.1a178c5c430000f79f@vates.tech>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793027331; l=5135; i=baptiste.le-duc@vates.tech; s=20260810; h=from:subject:message-id; bh=vuOMNvviSt4a7TWW5Qv+CGfm+79pNznRqgcCowdji6Q=; b=yptX/IkJuN/jXRyCCBnJuJO2rpZkHeGdjuNS6SNCGwnUtuiqr1yOW2HBsR/7uAgG3XzMSBCZy pdL3EVBzv8YBS5OGd78Zddmel6FVT9/GMXpOEPPmXhKwBYbQOus32xr
X-Developer-Key: i=baptiste.le-duc@vates.tech; a=ed25519; pk=N+BbdvMXRzrCuX/ieh4RWodiAKcLNvI+KjflcZ0oXCo=
Content-Transfer-Encoding: 8bit
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1793027684846
X-purgate-ID: tlsNG-c1860d/1793027700-D795A87B-6FCBA36E/10/73395122804
X-purgate-type: spam
X-purgate-size: 5137
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

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
Reviewed-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes since v7:
- collect R-by.
- move the patch last, as the previous patch now records Svade whenever
  the CPU faults on clear A/D bits, instead of riscv_fill_hwcap()
  panicking when the device tree advertises neither Svade nor Svadu.
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
2.56.0


