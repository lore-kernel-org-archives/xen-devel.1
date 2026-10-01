Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6B5BCA5FCF
	for <xen-devel@archiver.kernel.org>; Thu,  1 Oct 2026 09:07:47 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1438054.1656941 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xCClM-0000fw-LF; Thu, 01 Oct 2026 09:07:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1438054.1656941; Thu, 01 Oct 2026 09:07:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xCClM-0000fp-IP; Thu, 01 Oct 2026 09:07:36 +0000
Received: by outflank-mailman (input) for mailman id 1438054;
 Thu, 01 Oct 2026 09:07:36 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0f6b802ba0003f66@swg.vates.tech>)
 id 1xCClL-0000e4-Sj
 for xen-devel@lists.xenproject.org; Thu, 01 Oct 2026 09:07:35 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xCClL-007rtg-9E
 for xen-devel@lists.xenproject.org; Thu, 01 Oct 2026 11:07:35 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0f6b802ba0003f66@swg.vates.tech>)
 id 6abe22cc-e002-0a2a0a5209dd-0a2a45089f36-40
 for <xen-devel@lists.xenproject.org>; Thu, 01 Oct 2026 11:07:35 +0200
Received: from [185.255.28.18] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0f6b802ba0003f66@swg.vates.tech>)
 id 6abe22d6-f659-0a2a45080019-b9ff1c12aacb-3
 for <xen-devel@lists.xenproject.org>; Thu, 01 Oct 2026 11:07:35 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a0f6b802ba0003f66.006 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 01 Oct 2026 09:07:29 +0000
Received: from leducb.home (lfbn-gre-1-371-96.w90-112.abo.wanadoo.fr
 [90.112.87.96]) (Authenticated sender: baptiste.le-duc)
 by mail2.vates.fr (Postfix) with ESMTPSA id F228B82822;
 Thu,  1 Oct 2026 11:07:28 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=3Nu2EZlD98K/MXSzGeXg5tJpAaR1zvomAjzcgvpDzY4=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:content-transfer-encoding:in-reply-to:references:feedback-id;
 b=eHTw04akdVol0XAR6wGUTjek7i6ktEPyMdZidWij/c+XOH69qDV1oUQkQWRh/CsNYyL/m492M
 UqNurShKqyGZw2CqLn8a65Sf6WHzakClQF6+QFUa+Nxje6iGJ6Hx3HEqQ+wXqfnIc6vTbOQaZvR
 YbS6vvFK3TxLsFAox5iuhK3uJzgg8LuOyLwRIZP8PSmS22zXf2ylqP1iWySs4O2HebDwh/zzNNV
 WzfkdWHCCVC+68x6PRfmkWLofVasdWztYhvM3yHifcuK4IDmUydiBFQHVMpRyMNr9JS4x7ev/A3
 ga/Va24Rfp88rW2hVPLjpgwW/nq/hTsQZ4rOOVpl6M/A==
X-Zone-Loop: 2ce5b88c6c5600f5606676ab701878a08f6c75fa748c
x-campaign-type: default
x-transaction-id: d907646b-f0ef-45ae-a839-1062d9b67e84
x-swg-uid: 01-b9dbe8a3-e26e-4dd3-8703-f68304a03e2e
X-Mailer: Sweego
Message-ID:
 <1790845649.8631fc262581453bbf619ec5b2062170.1a0f6b802ba0003f66@vates.tech>
x-swg-bid: 1790845649.8631fc262581453bbf619ec5b2062170.1a0f6b802ba0003f66
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
Subject: [PATCH v4 2/4] xen/riscv: always preset A/D bits in G-stage PTEs
Date: Thu,  1 Oct 2026 11:07:21 +0200
In-Reply-To: <1790845467.8631fc262581453bbf619ec5b2062170.1a0f6b5397a0003f66@vates.tech>
References: <1790845467.8631fc262581453bbf619ec5b2062170.1a0f6b5397a0003f66@vates.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790845141; l=5658; i=baptiste.le-duc@vates.tech; s=20260810; h=from:subject:message-id; bh=PoPk/QVFnUoQZeUjxpShJhErKRSH6TrnENPhLu0P/bs=; b=IFSNIfvThy14TSkfMCyitW62vTTvi+Da75QiD9IOIAH6EbRluogl3jupFz+MNHNRCCfOLJv5J mSN2TilZOhTAT72YWtxXjake4w8s++yjR+QHEiwDCBqvxQAOXlJkHrX
X-Developer-Key: i=baptiste.le-duc@vates.tech; a=ed25519; pk=N+BbdvMXRzrCuX/ieh4RWodiAKcLNvI+KjflcZ0oXCo=
Content-Transfer-Encoding: 8bit
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1790845649169
X-purgate-ID: tlsNG-c1860d/1790845655-CE94287B-0F4A9DD1/0/0
X-purgate-type: clean
X-purgate-size: 5660

A RISC-V implementation can manage the PTE A/D bits in one of two ways:
    1) Update the 'A' and 'D' PTE bits in hardware (ratified as Svadu).
    2) Generate a page fault when 'A' and/or 'D' is clear, so that software
       can set them (ratified as Svade).

p2m_set_pte_flags() presets A/D in G-stage PTEs only when the device tree
advertises Svade. Platforms that use scheme (2) without advertising Svade,
such as the HiFive Premier P550, then hit guest-page faults that Xen does
not handle.

Always preset A/D in G-stage PTEs so scheme (2) never faults. This is
harmless with (1): software just does what hardware would have done on
first access.

Drop the now-unused svade entry from riscv_isa_ext[], and the TODO about
handling A/D faults, since nothing uses that information yet.

Fixes: ff14053983b0 ("xen/riscv: Implement p2m_pte_from_mfn() and support PBMT configuration")
Assisted-by: Claude:claude-opus-5
Signed-off-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>
---
Changes since v3:
- always preset A/D bits in G-stage mappings instead of keying off the DT:
  it may not reflect what the hardware actually does.
- change commit title/message.
- drop svade as it is now-unused.
---
Changes since v2:
- change commit title.
- preset A/D bits in p2m_set_pte_flags() if (!svadu || svade), instead of
setting RISCV_ISA_EXT_svade in the riscv_isa bitmap for cases 1, 2 and 4.
- riscv_resolve_ad_scheme() now only warns when both Svade and Svadu are
present and SBI FWFT is missing; drop the dead 'svadu && svade' operand.
- repeat XENLOG_WARNING on each line of the warning.
- drop ASSERT(svade != svadu) from p2m_set_pte_flags().
- only add the sbi_probe_extension() declaration to sbi.h.
- rework the comment in p2m_set_pte_flags().
---
Changes since v1:
- change commit title
- expose RISCV_ISA_EXT_svadu so the two extensions can be told apart.
- move the Svade/Svadu resolution to a new riscv_resolve_ad_scheme(),
  called once from riscv_fill_hwcap().
- expose sbi_probe_extension() (was static) to probe for SBI FWFT.
- stop presetting A/D bits unconditionally in p2m_set_permission(), do it
  only when Svade is present.
---
 xen/arch/riscv/cpufeature.c |  1 -
 xen/arch/riscv/p2m.c        | 38 ++++++++------------------------------
 2 files changed, 8 insertions(+), 31 deletions(-)

diff --git a/xen/arch/riscv/cpufeature.c b/xen/arch/riscv/cpufeature.c
index aaf544d13f..6d3c15a37f 100644
--- a/xen/arch/riscv/cpufeature.c
+++ b/xen/arch/riscv/cpufeature.c
@@ -199,7 +199,6 @@ static const struct riscv_isa_ext_entry __initconstrel riscv_isa_ext[] = {
     RISCV_ISA_EXT_ENTRY(smstateen,      ANY),
     RISCV_ISA_EXT_ENTRY(ssaia,          ANY),
     RISCV_ISA_EXT_ENTRY(sstc,           NONE),
-    RISCV_ISA_EXT_ENTRY(svade,          NONE),
     RISCV_ISA_EXT_ENTRY(svpbmt,         NONE),
 };
 
diff --git a/xen/arch/riscv/p2m.c b/xen/arch/riscv/p2m.c
index f7b380b90a..14cae7dcd7 100644
--- a/xen/arch/riscv/p2m.c
+++ b/xen/arch/riscv/p2m.c
@@ -591,38 +591,16 @@ static void p2m_set_pte_flags(pte_t *e, p2m_type_t t)
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
-     *
-     *       Currently, Xen on RISC-V does not make use of the information
-     *       that could be obtained from handling such page faults, which
-     *       could otherwise be useful for several use cases such as demand
-     *       paging, cache-flushing optimizations, memory access tracking,etc.
-     *
-     *       To support the more general case and the optimizations mentioned
-     *       above, it would be better to stop setting the A/D bits here and
-     *       instead handle page faults that occur due to unset A/D bits.
+     * Xen supports both, so set 'A' and 'D' up front to avoid the faults
+     * of (2). This is harmless with (1): software just does what hardware
+     * would have done on first access.
      */
-    if ( riscv_isa_extension_available(NULL, RISCV_ISA_EXT_svade) )
-        e->pte |= PTE_ACCESSED | PTE_DIRTY;
+    e->pte |= PTE_ACCESSED | PTE_DIRTY;
 
     switch ( t )
     {

-- 
2.55.0


