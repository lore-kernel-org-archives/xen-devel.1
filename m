Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E884CA5FA5
	for <xen-devel@archiver.kernel.org>; Thu,  1 Oct 2026 09:05:02 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1438047.1656924 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xCCiS-0008Lo-36; Thu, 01 Oct 2026 09:04:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1438047.1656924; Thu, 01 Oct 2026 09:04:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xCCiR-0008Lh-WA; Thu, 01 Oct 2026 09:04:35 +0000
Received: by outflank-mailman (input) for mailman id 1438047;
 Thu, 01 Oct 2026 09:04:34 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xCCiP-0008Lb-NX
 for xen-devel@lists.xenproject.org; Thu, 01 Oct 2026 09:04:34 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xCCiO-00DlBv-M9
 for xen-devel@lists.xenproject.org; Thu, 01 Oct 2026 11:04:32 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0f6b5397a0003f66@swg.vates.tech>)
 id 6abe221d-8faa-0a2a0a5109dd-0a2a4503dabe-24
 for <xen-devel@lists.xenproject.org>; Thu, 01 Oct 2026 11:04:32 +0200
Received: from [185.255.28.18] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0f6b5397a0003f66@swg.vates.tech>)
 id 6abe221f-fae8-0a2a45030019-b9ff1c129739-3
 for <xen-devel@lists.xenproject.org>; Thu, 01 Oct 2026 11:04:32 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a0f6b5397a0003f66.007 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 01 Oct 2026 09:04:27 +0000
Received: from leducb.home (lfbn-gre-1-371-96.w90-112.abo.wanadoo.fr
 [90.112.87.96]) (Authenticated sender: baptiste.le-duc)
 by mail2.vates.fr (Postfix) with ESMTPSA id ECD7482991;
 Thu,  1 Oct 2026 11:04:25 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=+8QBoOIKOWfF9rnN5stnQrG/hubBCM2JvyP2H7Td2yY=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:content-transfer-encoding:feedback-id;
 b=nqrKHxssMdhd7GAORWMs0Tvyc+o0ZWeko4ceHwC9M7FR6mvvLZ97NPW3jFuihpFTGcFhsdbii
 3kSMJ/QzFAmwX5l+hnQs3sFVL+szOgck1PdUxANxSKAOHgpmWP9ZYBQ8geGIiMaR9yFsNmTyPHw
 O/ii2wgondyi/RAxG2wYrbpmDt9Nf6veHmSvDyxvqsK5kmMJfkofL4fS/eZCEsBzleEGBTUPvj7
 ouYaLlK1sm7RSSyxPvR9MJPEK1ICkSZ1yAPWlD8IgNB8m/EO7aiVz9DEdwVpN2LqOwXahhevs6P
 0ef1IjQVXW2sSuLyxQdnTMiILCgexcmUmIzPJlb1RR4g==
X-Zone-Loop: 076be8fcac45071a0968a546e370431a92c87ffad0eb
x-campaign-type: default
x-transaction-id: d326a497-6f29-48f0-b832-bb067ebfdf75
x-swg-uid: 01-37574318-7091-46b3-b068-3a4851b3a831
X-Mailer: Sweego
Message-ID:
 <1790845467.8631fc262581453bbf619ec5b2062170.1a0f6b5397a0003f66@vates.tech>
x-swg-bid: 1790845467.8631fc262581453bbf619ec5b2062170.1a0f6b5397a0003f66
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
	Zheng Zhang <ZhengZhangzhangzheng@iscas.ac.cn>
Subject: [PATCH v4 0/4] xen/riscv: fix boot on missing extensions and MMU setup bugs
Date: Thu,  1 Oct 2026 11:04:15 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Change-ID: 20260902-riscv-fix-boot-missing-ext-a79c23bad694
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790845141; l=3999; i=baptiste.le-duc@vates.tech; s=20260810; h=from:subject:message-id; bh=e2CqMJBv1Bm2wnQbRMy0Yn2dXx+BC5kTAZ1V7P6Uj+I=; b=sMBDyUgr16GLJd04ICfFhZTil8DmWZT2Be6hVA3DoTygSSMqYYijSh2u2FV6QIJ29ivY1FjuC N8DMGt8NFdmClLNDJsgGSqgUStmiYCkULZDdl1I+P9gCtepYnqrt3EZ
X-Developer-Key: i=baptiste.le-duc@vates.tech; a=ed25519; pk=N+BbdvMXRzrCuX/ieh4RWodiAKcLNvI+KjflcZ0oXCo=
Content-Transfer-Encoding: 8bit
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1790845466176
X-purgate-ID: tlsNG-33051d/1790845472-6E0D14E9-AF9C9876/10/78276251493
X-purgate-type: spam
X-purgate-size: 4001

This series introduces bugs fixes that were found while bringing up CI
support for the HiFive Premier P550 board with a basic smoke test. The
board-support series itself will follow separately as it depends on
PLIC/vPLIC and dom0less support that have not been upstreamed yet. This
series carries only the independent fixes found along the way, none of them
need the board-support series to apply.

This series:
    1: Rename PTE "permissions" to "pte_flags"
    2: Always preset A/D bits in G-stage PTEs
    3: Fix A/D bit handling in Xen's page-table mappings
    4: Use pte_is_valid() in pte_is_mapping()

CI pipeline:
https://gitlab.com/xen-project/people/baptleduc/xen/-/pipelines/2900391526

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

To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>
Cc: Michal Orzel <michal.orzel@amd.com>
Cc: Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <julien@xen.org>
Cc: Roger Pau Monné <roger@xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>
Cc: Alistair Francis <alistair.francis@wdc.com>
Cc: Connor Davis <connojdavis@gmail.com>
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Zheng Zhang <Zheng Zhang <zhangzheng@iscas.ac.cn>

---
Baptiste Le Duc (4):
      xen/riscv: rename PTE "permissions" to "pte_flags"
      xen/riscv: always preset A/D bits in G-stage PTEs
      xen/riscv: fix A/D bits in Xen's page-table mappings
      xen/riscv: use pte_is_valid() in pte_is_mapping()

 xen/arch/riscv/cpufeature.c       |  1 -
 xen/arch/riscv/include/asm/mm.h   |  5 +++--
 xen/arch/riscv/include/asm/page.h | 35 ++++++++++++++++----------------
 xen/arch/riscv/mm.c               | 14 ++++++-------
 xen/arch/riscv/p2m.c              | 42 ++++++++++-----------------------------
 5 files changed, 37 insertions(+), 60 deletions(-)
---
base-commit: 4c1aba82cff95ab11f7fe4af8965a06703537288
change-id: 20260902-riscv-fix-boot-missing-ext-a79c23bad694

Best regards,
--  
Baptiste Le Duc <baptiste.le-duc@vates.tech>


