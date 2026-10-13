Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6DD6CC6B08
	for <xen-devel@archiver.kernel.org>; Tue, 13 Oct 2026 10:05:31 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1446880.1662989 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGZNe-0003eI-5g; Tue, 13 Oct 2026 10:05:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1446880.1662989; Tue, 13 Oct 2026 10:05:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGZNe-0003eB-2i; Tue, 13 Oct 2026 10:05:10 +0000
Received: by outflank-mailman (input) for mailman id 1446880;
 Tue, 13 Oct 2026 10:05:08 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xGZNc-0003e3-8u
 for xen-devel@lists.xenproject.org; Tue, 13 Oct 2026 10:05:08 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xGZNb-00CpY5-I6
 for xen-devel@lists.xenproject.org; Tue, 13 Oct 2026 12:05:07 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a134b909b40008425@swg.vates.tech>)
 id 6ace024a-bab6-0a2a0a5309dd-0a2a45018d68-30
 for <xen-devel@lists.xenproject.org>; Tue, 13 Oct 2026 12:05:07 +0200
Received: from [185.255.28.35] (helo=prod-mta-13-02.swg-srv.net)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a134b909b40008425@swg.vates.tech>)
 id 6ace0253-5984-0a2a45010019-b9ff1c2394d1-3
 for <xen-devel@lists.xenproject.org>; Tue, 13 Oct 2026 12:05:07 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-02.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a134b909b40008425.007 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 13 Oct 2026 10:05:04 +0000
Received: from leducb.home (lfbn-gre-1-371-96.w90-112.abo.wanadoo.fr
 [90.112.87.96]) (Authenticated sender: baptiste.le-duc)
 by mail2.vates.fr (Postfix) with ESMTPSA id 0D5E281E4A;
 Tue, 13 Oct 2026 12:05:03 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=Sscm7/evC3K0ZyjSu7Y8Q7r+/cdj7J5NOpocAaCZpEk=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:content-transfer-encoding:feedback-id;
 b=eAn0ouypFx15xgwy8pfPDaxkL7xmko1SlpPvp7JockZbo2NmM7O8HlTQOSGXftYzcGROH/ugL
 JSJl2RKe9NDjo6IKF0vYc1RvCAwNPAjIdjp4p9WDQVsP8KdxzdbbNe4pUMwKCbRqBg4q+AHiQsE
 fRJ6Wipk/SN9nKgbB9TIK0EwOrYH+AvJbKa3FpC5xlxbiI1AtSfwvpY+nYJQd5/13RE0qJCTDGw
 IP3IPbCQ4tfwxdk/CVyJnGrwMoxJoDRC9V961UCd3dpLzjo2P+RbrHi/tlC9++R7Tz2jlBQHcjr
 W+p0Ec/36a8dm4ugIUIDiulEOlbwT8VArSu2zj5IdYDw==
X-Zone-Loop: 57e8b0aa5b6422051607b787422c563ef0907dc23a26
x-campaign-type: default
x-transaction-id: d73560c8-68fe-4811-8aed-fe4d251b0ec8
x-swg-uid: 01-3e70098e-0fef-4794-8274-1f4b46c94748
X-Mailer: Sweego
Message-ID:
 <1791885904.8631fc262581453bbf619ec5b2062170.1a134b909b40008425@vates.tech>
x-swg-bid: 1791885904.8631fc262581453bbf619ec5b2062170.1a134b909b40008425
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
From: Baptiste Le Duc <baptiste.le-duc@vates.tech>
To: oleksii.kurochko@gmail.com,
	xen-devel@lists.xenproject.org
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
	Zheng Zhang <zhangzheng@iscas.ac.cn>
Subject: [PATCH v6 0/4] xen/riscv: fix boot on missing extensions and MMU setup bugs
Date: Tue, 13 Oct 2026 12:05:01 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Change-ID: 20260902-riscv-fix-boot-missing-ext-a79c23bad694
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791885856; l=4990; i=baptiste.le-duc@vates.tech; s=20260810; h=from:subject:message-id; bh=GvAJeZiKTPE3ggOba4Ik7yxCWd6qpB3S9i96kryd1Ek=; b=Lsba4xe6Qf1+RUV15s/zfNxtwDxyE1MSOBqgxJzRBvWDYnogMO0o1eFqNcVGKKnWUQjP+VRGG tgwOKbNqV7EAcIQb1T9XEm0WQ14mudVjo/6mrlO5qm5LrYFzJSw6Ewt
X-Developer-Key: i=baptiste.le-duc@vates.tech; a=ed25519; pk=N+BbdvMXRzrCuX/ieh4RWodiAKcLNvI+KjflcZ0oXCo=
Content-Transfer-Encoding: 8bit
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1791885903276
X-purgate-ID: tlsNG-d62444/1791885907-1D47D757-1C1704DC/10/78276251493
X-purgate-type: spam
X-purgate-size: 4992

This series introduces bugs fixes that were found while bringing up CI
support for the HiFive Premier P550 board with a basic smoke test. The
board-support series itself will follow separately as it depends on
PLIC/vPLIC and dom0less support that have not been upstreamed yet. This
series carries only the independent fixes found along the way, none of them
need the board-support series to apply.

This series:
    1: Probe the PTE A/D bits update scheme at boot
    2: rework the A/D bits comment in p2m_set_pte_flags()
    3: Fix A/D bits in Xen's page-table mappings
    4. Use pte_is_valid() in pte_is_mapping()

Test CI pipeline (uses the QTB framework to pexpect the console under
various machine svade/svadu configs):
https://gitlab.com/xen-project/people/baptleduc/xen/-/pipelines/2941839143

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
Cc: Zheng Zhang <zhangzheng@iscas.ac.cn>

---

---
Baptiste Le Duc (4):
      xen/riscv: probe the PTE A/D bits update scheme at boot
      xen/riscv: rework the A/D bits comment in p2m_set_pte_flags()
      xen/riscv: fix A/D bits in Xen's page-table mappings
      xen/riscv: use pte_is_valid() in pte_is_mapping()

 xen/arch/riscv/cpufeature.c             | 97 +++++++++++++++++++++++++++++++++
 xen/arch/riscv/include/asm/cpufeature.h |  1 +
 xen/arch/riscv/include/asm/page.h       | 35 ++++++------
 xen/arch/riscv/mm.c                     | 11 ++--
 xen/arch/riscv/p2m.c                    | 42 ++++++--------
 5 files changed, 137 insertions(+), 49 deletions(-)
---
base-commit: 2c40f10b9cc1864b2991612f44d2410e37d57ebe
change-id: 20260902-riscv-fix-boot-missing-ext-a79c23bad694

Best regards,
--  
Baptiste Le Duc <baptiste.le-duc@vates.tech>


