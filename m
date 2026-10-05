Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6EB8CA5FFE
	for <xen-devel@archiver.kernel.org>; Mon,  5 Oct 2026 16:00:37 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1440975.1658546 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xDl71-0000xE-Gc; Mon, 05 Oct 2026 16:00:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1440975.1658546; Mon, 05 Oct 2026 16:00:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xDl71-0000x7-Dw; Mon, 05 Oct 2026 16:00:23 +0000
Received: by outflank-mailman (input) for mailman id 1440975;
 Mon, 05 Oct 2026 16:00:22 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a10ccb5ec20003f66@swg.vates.tech>)
 id 1xDl70-0000wz-6G
 for xen-devel@lists.xenproject.org; Mon, 05 Oct 2026 16:00:22 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xDl6z-00Bdwr-Fe
 for xen-devel@lists.xenproject.org; Mon, 05 Oct 2026 18:00:21 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a10ccb5ec20003f66@swg.vates.tech>)
 id 6ac3c994-2eae-0a2a0a5409dd-0a2a45029a4c-4
 for <xen-devel@lists.xenproject.org>; Mon, 05 Oct 2026 18:00:21 +0200
Received: from [185.255.28.35] (helo=prod-mta-13-02.swg-srv.net)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a10ccb5ec20003f66@swg.vates.tech>)
 id 6ac3c995-6ca4-0a2a45020019-b9ff1c239615-3
 for <xen-devel@lists.xenproject.org>; Mon, 05 Oct 2026 18:00:21 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-02.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a10ccb5ec20003f66.007 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 05 Oct 2026 16:00:17 +0000
Received: from leducb.home (areims-651-1-80-194.w90-18.abo.wanadoo.fr
 [90.18.187.194]) (Authenticated sender: baptiste.le-duc)
 by mail2.vates.fr (Postfix) with ESMTPSA id 20D948280B;
 Mon,  5 Oct 2026 18:00:16 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=43pCL2Pcw0Ag1BgM2PoJ0XDwKsUsxAQ7FbkpNgPFfic=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:content-transfer-encoding:in-reply-to:references:feedback-id;
 b=ZI6C75HUSSRnTF9uf2Ats45SPpXvsi9FaVgamtmTIJNSiR2+iVFbxL7I8NzSneP5ueFPkkA9B
 sUc7XBytAOLS/gS6BBYzspMo2S9ZVvp4j1vNWSr3V4W7F9G5eibOpmcWq4s49uRTPSNcGwvFWtV
 Bp7iadkBRPZwXn00dCiNohee6t261Yrc9tmOo/3P1ZQx3KeXhxDLTu0zDgDPSJplLXqlPPXgoxp
 6yZQvGClcDWc9DBS9j4xJ6R/zMbnYpqZgeSP+HGot+4L4CIeCHt/1ium+tYwL4J0nQ3ZATzD3LY
 sD18gkji6YNdEvOaw4v4H0/ZL1HmZXXj0t4LD2aJM1PA==
X-Zone-Loop: b6c0c72d052383083a30c635c4d132fdd0fd1d8f279c
x-campaign-type: default
x-transaction-id: 2fa68973-88e9-4adc-bd3b-e53ad72b4158
x-swg-uid: 01-f1eee119-2f8d-4f27-8568-14b990a7b00c
X-Mailer: Sweego
Message-ID:
 <1791216017.8631fc262581453bbf619ec5b2062170.1a10ccb5ec20003f66@vates.tech>
x-swg-bid: 1791216017.8631fc262581453bbf619ec5b2062170.1a10ccb5ec20003f66
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
Subject: [PATCH v5 1/3] xen/riscv: always preset A/D bits in G-stage PTEs
Date: Mon,  5 Oct 2026 18:00:14 +0200
In-Reply-To: <1791215925.8631fc262581453bbf619ec5b2062170.1a10cc9f7c20003f66@vates.tech>
References: <1791215925.8631fc262581453bbf619ec5b2062170.1a10cc9f7c20003f66@vates.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791215868; l=5258; i=baptiste.le-duc@vates.tech; s=20260810; h=from:subject:message-id; bh=+7RuCsiQXUwfROF9vIBU6i/pk2whnmvYv855VhRuUz8=; b=DmXvMoAw7Td79BJHKaVHegoLOBhKrRziema3PB5qGxeEpCHjdbr0lnJHftMAL2Lk5sh0GeSkm poHiQBofggUBrjmdZJ+TAbGfXOxVQ0S73zKn7sdYmgO1lDgkNQZ8ODs
X-Developer-Key: i=baptiste.le-duc@vates.tech; a=ed25519; pk=N+BbdvMXRzrCuX/ieh4RWodiAKcLNvI+KjflcZ0oXCo=
Content-Transfer-Encoding: 8bit
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1791216016324
X-purgate-ID: tlsNG-720697/1791216021-F06A72AC-D89A7C4B/0/0
X-purgate-type: clean
X-purgate-size: 5260

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

Drop the TODO suggesting to handle A/D faults: only Svade raises them, so
it would not work on Svadu. Dirty/access tracking can restrict the RWX
permissions of p2m entries, as x86 and Arm do.

Fixes: ff14053983b0 ("xen/riscv: Implement p2m_pte_from_mfn() and support PBMT configuration")
Assisted-by: Claude:claude-opus-5
Signed-off-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>
---
Changes since v4:
- restore svade and update the commit message accordingly.
- rebase on top of staging.
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
 xen/arch/riscv/p2m.c | 38 ++++++++------------------------------
 1 file changed, 8 insertions(+), 30 deletions(-)

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


