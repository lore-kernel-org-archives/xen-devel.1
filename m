Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFC97606A31A
	for <xen-devel@archiver.kernel.org>; Mon, 26 Oct 2026 15:13:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=vates.tech header.i=@vates.tech header.a=rsa-sha256 header.s=selector1 header.b=GMvy9vJU
Received: from list by lists.xenproject.org with outflank-mailman.1461466.1672476 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLMNw-00049x-E3; Mon, 26 Oct 2026 15:13:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1461466.1672476; Mon, 26 Oct 2026 15:13:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLMNw-00049q-Am; Mon, 26 Oct 2026 15:13:16 +0000
Received: by outflank-mailman (input) for mailman id 1461466;
 Mon, 26 Oct 2026 15:13:15 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a178c5c430000f79f@swg.vates.tech>)
 id 1xLMNv-00049k-Ak
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2026 15:13:15 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xLMNu-0019i9-8e
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2026 16:13:14 +0100
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a178c5c430000f79f@swg.vates.tech>)
 id 6adf6e08-e002-0a2a0a5209dd-0a2a45088cf0-4
 for <xen-devel@lists.xenproject.org>; Mon, 26 Oct 2026 16:13:14 +0100
Received: from [185.255.28.34] (helo=prod-mta-13-01.swg-srv.net)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a178c5c430000f79f@swg.vates.tech>)
 id 6adf6e09-f659-0a2a45080019-b9ff1c22aa8f-3
 for <xen-devel@lists.xenproject.org>; Mon, 26 Oct 2026 16:13:14 +0100
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-01.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a178c5c430000f79f.007 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 26 Oct 2026 15:13:09 +0000
Received: from leducb.home (areims-651-1-80-194.w90-18.abo.wanadoo.fr
 [90.18.187.194]) (Authenticated sender: baptiste.le-duc)
 by mail2.vates.fr (Postfix) with ESMTPSA id 52D2880B3A;
 Mon, 26 Oct 2026 16:13:08 +0100 (CET)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=vates.tech header.i="@vates.tech" header.h="From:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:Feedback-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech;
 q=dns/txt; s=selector1; bh=iatSUdW2mlO9nQz8JRk1LDg4FfK4DpBAe1GEKe6muPs=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:content-transfer-encoding:feedback-id;
 b=GMvy9vJUqtCxfEfakizbuJeM1xmX1leMgUmb9IiY/6ij7dbJgTRnS6jo6HluH/8QSC1e0LlsI
 3PUu4X/wRZYoqFJEhJkE3Lq4+7P3hp6i+cYzmimM32g2jqMP5tHInrdzhDzT+WQwBskcg7lkBAH
 LuGeieBbSS/A3q1P2cAip09i73ELVtvR6aXrd2aaXch7t7BR3fTAMDjVze5FWK7UO2PPqmBj3eZ
 qv50ISx27cfdyOlCL2BffC87w/vIZLO7idvsoVpIBmaZIeRQ3E7pKlrvMIOOQ0zczLrNQqwpPUh
 8R5I2kik7LQwFAf29oTkBICG5CCqhii18X+uAjilvOVA==
X-Zone-Loop: 7b922eb86e50017a5dc0b769ff6f8a83e75e26b98bf1
x-campaign-type: default
x-transaction-id: 9ee35364-d986-47ef-a1a0-5066cd8a31e8
x-swg-uid: 01-6001e8c7-95bc-46a1-b4dc-e93032f0e406
X-Mailer: Sweego
Message-ID:
 <1793027589.8631fc262581453bbf619ec5b2062170.1a178c5c430000f79f@vates.tech>
x-swg-bid: 1793027589.8631fc262581453bbf619ec5b2062170.1a178c5c430000f79f
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
Subject: [PATCH v8 0/5] xen/riscv: fix boot on missing extensions and MMU setup bugs
Date: Mon, 26 Oct 2026 16:12:57 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Change-ID: 20260902-riscv-fix-boot-missing-ext-a79c23bad694
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793027331; l=6170; i=baptiste.le-duc@vates.tech; s=20260810; h=from:subject:message-id; bh=+ygeDYlhAEEZb/ne4HCijBBafqK3Z6fn8WKd2M5jn04=; b=rCTs1bTJQ+s5LttaXKZ/r3gfsb/kYswFDVmNWdNrl0HUwUo6pzOgGt3A+WzrrPP2qMZ1d/ib6 Wsv24Yx7Z08BVquMDmgTePIDNFly9VyIlkt0sr+p8CM+nDiW4HKb0mF
X-Developer-Key: i=baptiste.le-duc@vates.tech; a=ed25519; pk=N+BbdvMXRzrCuX/ieh4RWodiAKcLNvI+KjflcZ0oXCo=
Content-Transfer-Encoding: 8bit
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1793027588540
X-purgate-ID: tlsNG-c1860d/1793027594-D574B87B-78773A5A/0/0
X-purgate-type: clean
X-purgate-size: 6172
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This series introduces bug fixes that were found while bringing up CI
support for the HiFive Premier P550 board with a basic smoke test. The
board-support series itself will follow separately as it depends on
PLIC/vPLIC and dom0less support that have not been upstreamed yet. This
series carries only the independent fixes found along the way, none of them
need the board-support series to apply.

This series:
    1: Use pte_is_valid() in pte_is_mapping()
    2: Fix A/D bits in Xen's page-table mappings
    3: Look up the exception table for any trap taken in Xen context
    4: Probe the A/D update scheme if the DT advertises neither Svade nor
       Svadu
    5: Rework the A/D bits comment in p2m_set_pte_flags()

Patch 3 is a subset of "xen/riscv: look up the exception table for any
trap taken in Xen context" from Oleksii's vAPLIC/vIMSIC series, without
the parts depending on earlier patches of that series.

Test CI pipeline:
https://gitlab.com/xen-project/people/baptleduc/xen/-/pipelines/2990357496

---
Changes since v7:
- Replace the panic when the DTS advertises neither Svade nor Svadu with
  a probe of the A/D update scheme in that case only, recording the
  probed extension so that such device trees can be used as-is. The
  device tree is trusted otherwise, as discussed with Jan (patch 4).
- Add patch 3, so that the store page fault raised by the probe on Svade
  hardware is fixed up.
- Move the p2m_set_pte_flags() comment rework last (patch 5).
- Collect trailers: A-by on patches 1 and 2, T-by on patch 2 and R-by on
  patch 5.
- Link to v7:
  https://patch.msgid.link/1792164706.8631fc262581453bbf619ec5b2062170.1a14557373c0008425@vates.tech
---
Changes since v6:
- Drop the boot time probe of the A/D update scheme and trust the device
  tree. Xen now panics when the DTS advertises neither Svade nor Svadu
  (patch 3).
- Patch 4 no longer changes when A/D are preset, it only reworks the
  comment, since patch 3 guarantees the DTS advertises the scheme in
  effect.
- Reorder the series so the already reviewed patches come first.
- Patch 2: add a second Fixes tag for arch_pmap_map().
- Patch 1: rebase, as the reorder changed its context.
- Link to v6:
  https://patch.msgid.link/1791885904.8631fc262581453bbf619ec5b2062170.1a134b909b40008425@vates.tech
---
Changes since v5:
- Replace "xen/riscv: always preset A/D bits in G-stage PTEs" with a boot
  time probe of the A/D update scheme (patch 1). It checks the result
  against the Svade/Svadu DT binding and records the probed scheme when the
  DT advertises neither, instead of trusting the DT alone.
- Split the p2m_set_pte_flags() comment rework out into its own patch
  (patch 2).
- Patches 3 and 4 unchanged and are waiting to be merged.
- Link to v5:
  https://patch.msgid.link/1791215925.8631fc262581453bbf619ec5b2062170.1a10cc9f7c20003f66@vates.tech
---
Changes since v4:
- Drop patches merged upstream:
    ccf9d78c825b ("xen/riscv: rename PTE "permissions" to "pte_flags"")
- Collect trailers.
- Rebase patches on top of staging.
- Link to v4: https://patch.msgid.link/1790845467.8631fc262581453bbf619ec5b2062170.1a0f6b5397a0003f66@vates.tech
---
Changes since v3:
- Drop v3 patches 1, 6 already upstreamed:
    861e44a3ba8e ("xen/riscv: make Zihintpause no longer a required
    extension")
    469d83d42f5c ("docs/riscv: sync required ISA extensions with
    required_extensions[]")
- Add trailers (A-by and/or R-by).
- Rename patch 3 to ("xen/riscv: always preset A/D bits in G-stage PTEs")
  as it now always presets A/D bits instead of distinguish Svadu/Svade DT
  bindings cases.
- Address review comments.
- Link to v3: https://patch.msgid.link/1790699381.8631fc262581453bbf619ec5b2062170.1a0ee00218b000b504@vates.tech
---
Changes since v2:
- Drop v2 patches 5 and 6, already upstreamed:
    d8ca89f26c8a ("xen/riscv: flush speculatively cached Bare-mode TLB entries in turn_on_mmu()")
    08a898b93d21 ("xen/riscv: fix level_map_mask truncation on load_start")
- Drop "xen/riscv: make Svpbmt no longer a required extension".
  It relaxed Svpbmt so boards without it, like the HiFive P550, could boot.
  But without Svpbmt, DMA-noncoherent devices do not snoop the CPU caches
  and can read stale data from DRAM. Mainline Linux has the same problem,
  which is explained and reproducible in [1]. Fixing it needs a lot of
  machinery we do not need yet, and Svpbmt is mandatory in RVA23, so
  keeping it required is simpler and safer. An RFC will follow with a fix
  inspired by [2].
- Add three new patches:
    docs/riscv: sync required ISA extensions with required_extensions[]
    xen/riscv: rename PTE "permissions" to "pte_flags"
    xen/riscv: use pte_is_valid() in pte_is_mapping()
- Address review comments.

[1] https://github.com/davidlohr/vanilla-kernel-sifive-p550/tree/master
[2] https://lwn.net/Articles/996819/
---
Changes since v1:
- address ML comments
- rename some patchs
- add new patch-fix: 242dd1f890e4 ("xen/riscv: fix level_map_mask
  truncation on load_start") discovered when working on Spacemit K3 support

---
Baptiste Le Duc (4):
      xen/riscv: use pte_is_valid() in pte_is_mapping()
      xen/riscv: fix A/D bits in Xen's page-table mappings
      xen/riscv: probe the A/D update scheme if the DT advertises neither
      xen/riscv: rework the A/D bits comment in p2m_set_pte_flags()

Oleksii Kurochko (1):
      xen/riscv: look up the exception table for any trap taken in Xen context

 xen/arch/riscv/cpufeature.c             | 69 +++++++++++++++++++++++++++++++++
 xen/arch/riscv/include/asm/cpufeature.h | 13 ++++---
 xen/arch/riscv/include/asm/page.h       | 35 +++++++++--------
 xen/arch/riscv/mm.c                     | 11 +++---
 xen/arch/riscv/p2m.c                    | 45 +++++++++------------
 xen/arch/riscv/traps.c                  | 28 ++++++++++---
 6 files changed, 141 insertions(+), 60 deletions(-)
---
base-commit: 46678752be2d97f61317d793408a59927a429847
change-id: 20260902-riscv-fix-boot-missing-ext-a79c23bad694

Best regards,
--  
Baptiste Le Duc <baptiste.le-duc@vates.tech>


