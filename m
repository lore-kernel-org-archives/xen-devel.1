Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9105ECCA46C
	for <xen-devel@archiver.kernel.org>; Fri, 16 Oct 2026 15:32:27 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1452223.1667037 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHjuR-0003h6-Rh; Fri, 16 Oct 2026 15:31:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1452223.1667037; Fri, 16 Oct 2026 15:31:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHjuR-0003gz-OK; Fri, 16 Oct 2026 15:31:51 +0000
Received: by outflank-mailman (input) for mailman id 1452223;
 Fri, 16 Oct 2026 15:31:50 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a14557373c0008425@swg.vates.tech>)
 id 1xHjuQ-0003gt-3M
 for xen-devel@lists.xenproject.org; Fri, 16 Oct 2026 15:31:50 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xHjuP-008yi6-EH
 for xen-devel@lists.xenproject.org; Fri, 16 Oct 2026 17:31:49 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a14557373c0008425@swg.vates.tech>)
 id 6ad2435e-2eae-0a2a0a5409dd-0a2a4508dbe0-12
 for <xen-devel@lists.xenproject.org>; Fri, 16 Oct 2026 17:31:49 +0200
Received: from [185.255.28.18] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a14557373c0008425@swg.vates.tech>)
 id 6ad24365-f659-0a2a45080019-b9ff1c12b075-3
 for <xen-devel@lists.xenproject.org>; Fri, 16 Oct 2026 17:31:49 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a14557373c0008425.007 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 16 Oct 2026 15:31:46 +0000
Received: from leducb (lfbn-gre-1-371-96.w90-112.abo.wanadoo.fr [90.112.87.96])
 (Authenticated sender: baptiste.le-duc)
 by mail2.vates.fr (Postfix) with ESMTPSA id 14ED281CA8;
 Fri, 16 Oct 2026 17:31:45 +0200 (CEST)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=vates.tech header.i="@vates.tech" header.h="From:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:Feedback-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech;
 q=dns/txt; s=selector1; bh=yLjdbl2lF5/FIxD1EtPVTSAUq8BcR+i5hBLnKj7X/8o=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:content-transfer-encoding:feedback-id;
 b=CwLrAySobp6k6fDR6XvxpKZPSc5+afWH8oAax/yGrB9uWxWxuP4qwe39ni2EuROEeghN3Jt/k
 umkMcLIghIhQek5JmNLTAqcJffJXIkldLACO2VvanY56qcZzHfbHWB7i3/IuyYRCEtX0RC8WZQI
 3f63XzLvZ5N/pWpQ6RMQ282WpP9Z+DKIsfY+r42GzxkIlEjEe5YcTwVy5hDFpSx/O+lXTQR6uHP
 mBL2/REhCM3we5r+oP9Tgmlkij9oT+0MXpR2mjveM3w7CPuy3oQmnqn1I4u+cicbxbDlUPZeBL3
 53meMhCZOy3NRHV0Jpu//oYSRwLeOAZvmadU9R1Lqbkg==
X-Zone-Loop: 5a6e6fced1db66d9eae9ce3328264b7914250a0a250f
x-campaign-type: default
x-transaction-id: d5447c47-8ff9-43bd-a125-f00d22aa85ad
x-swg-uid: 01-5d6425d3-a6fa-4b84-ba51-c660332a201a
X-Mailer: Sweego
Message-ID:
 <1792164706.8631fc262581453bbf619ec5b2062170.1a14557373c0008425@vates.tech>
x-swg-bid: 1792164706.8631fc262581453bbf619ec5b2062170.1a14557373c0008425
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
Subject: [PATCH v7 0/4] xen/riscv: fix boot on missing extensions and MMU setup bugs
Date: Fri, 16 Oct 2026 17:31:36 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Change-ID: 20260902-riscv-fix-boot-missing-ext-a79c23bad694
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792164601; l=5030; i=baptiste.le-duc@vates.tech; s=20260810; h=from:subject:message-id; bh=vImn9Mc2oJvx6oEn1A3ySpcvzGtSwkYrOHUzCelegws=; b=PN61G0QD9G3halRnoualJ52C/3lic8BxTb2o690S/W7CtzKXZWJWyONd50o4em24DYoV1tUsY aaEQhfo7MNAAZzWHepImbOnV3SkwWGdVzArzCNSJ8jpPq1vBPtODmX0
X-Developer-Key: i=baptiste.le-duc@vates.tech; a=ed25519; pk=N+BbdvMXRzrCuX/ieh4RWodiAKcLNvI+KjflcZ0oXCo=
Content-Transfer-Encoding: 8bit
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1792164705284
X-purgate-ID: tlsNG-c1860d/1792164709-CC97287B-8004DE7F/0/0
X-purgate-type: clean
X-purgate-size: 5025

This series introduces bug fixes that were found while bringing up CI
support for the HiFive Premier P550 board with a basic smoke test. The
board-support series itself will follow separately as it depends on
PLIC/vPLIC and dom0less support that have not been upstreamed yet. This
series carries only the independent fixes found along the way, none of them
need the board-support series to apply.

This series:
    1: Use pte_is_valid() in pte_is_mapping()
    2: Fix A/D bits in Xen's page-table mappings
    3: Panic if the DTS advertises neither Svade nor Svadu
    4: Rework the A/D bits comment in p2m_set_pte_flags()

Test CI pipeline:
https://gitlab.com/xen-project/people/baptleduc/xen/-/pipelines/2956020449

---
Changes since v6:
- Drop the boot time probe of the A/D update scheme and trust the device
  tree, as suggested by Jan. Xen now panics when the DTS advertises neither
  Svade nor Svadu (patch 3).
- Patch 4 no longer changes when A/D are preset, it only reworks the
  comment, since patch 3 guarantees the DTS advertises the scheme in
  effect.
- Reorder the series so the already reviewed patches come first.
- Patch 2: add a second Fixes tag for arch_pmap_map().
- Patch 1 unchanged.
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
      xen/riscv: panic if the device tree advertises neither Svade nor Svadu
      xen/riscv: rework the A/D bits comment in p2m_set_pte_flags()

 xen/arch/riscv/cpufeature.c             | 17 +++++++++++++
 xen/arch/riscv/include/asm/cpufeature.h | 13 +++++-----
 xen/arch/riscv/include/asm/page.h       | 35 ++++++++++++-------------
 xen/arch/riscv/mm.c                     | 11 ++++----
 xen/arch/riscv/p2m.c                    | 45 ++++++++++++++-------------------
 5 files changed, 66 insertions(+), 55 deletions(-)
---
base-commit: 7e020a4dd6ed30eb6c91a9abe2767034e2bb270a
change-id: 20260902-riscv-fix-boot-missing-ext-a79c23bad694

Best regards,
--  
Baptiste Le Duc <baptiste.le-duc@vates.tech>


