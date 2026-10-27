Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24464606A31A
	for <xen-devel@archiver.kernel.org>; Tue, 27 Oct 2026 11:03:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=vates.tech header.i=@vates.tech header.a=rsa-sha256 header.s=selector1 header.b=DuAbWu84
Received: from list by lists.xenproject.org with outflank-mailman.1462055.1673100 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLexU-0004S1-9w; Tue, 27 Oct 2026 11:03:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1462055.1673100; Tue, 27 Oct 2026 11:03:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLexU-0004Ru-6w; Tue, 27 Oct 2026 11:03:12 +0000
Received: by outflank-mailman (input) for mailman id 1462055;
 Tue, 27 Oct 2026 11:03:11 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a17d072ce5000f79f@swg.vates.tech>)
 id 1xLexT-0004Ro-0j
 for xen-devel@lists.xenproject.org; Tue, 27 Oct 2026 11:03:11 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xLexS-002Fnu-2c
 for xen-devel@lists.xenproject.org; Tue, 27 Oct 2026 12:03:10 +0100
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a17d072ce5000f79f@swg.vates.tech>)
 id 6ae084ea-2eae-0a2a0a5409dd-0a2a4507a010-18
 for <xen-devel@lists.xenproject.org>; Tue, 27 Oct 2026 12:03:10 +0100
Received: from [185.255.28.34] (helo=prod-mta-13-01.swg-srv.net)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a17d072ce5000f79f@swg.vates.tech>)
 id 6ae084ed-b4ea-0a2a45070019-b9ff1c2296ab-3
 for <xen-devel@lists.xenproject.org>; Tue, 27 Oct 2026 12:03:09 +0100
Received: from mail2.vates.fr [37.26.189.201] (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-01.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a17d072ce5000f79f.007 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 27 Oct 2026 11:03:04 +0000
Received: from leducb.tail4c4a28.ts.net
 (lfbn-gre-1-371-96.w90-112.abo.wanadoo.fr [90.112.87.96])
 (Authenticated sender: baptiste.le-duc)
 by mail2.vates.fr (Postfix) with ESMTPSA id 0EE89820E6;
 Tue, 27 Oct 2026 12:03:02 +0100 (CET)
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
 q=dns/txt; s=selector1; bh=GHrn8JzqfFdS1QWuyOv4h1sCqJkl/0Qh3n1D3SlFHn4=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:content-transfer-encoding:feedback-id;
 b=DuAbWu84EzFl+3SvvojSeQizm7z3o5l9dpM1PhYv0zH2LQZtHWH8adQFvp6t7boQou9GqPWLD
 ogorbPoHVyvipk6lKvTJ+dYZj0dVQJ0F8YLDVo7jmdhw1tEfem1li97Y6K2OHx89NezYQ4ryX4o
 pW599xGtKAqZM2leVDeFpXRfrgoZjOcOH19ZgwEoOTTjx5TeMlx2amaidVPAMwzAmnArO1cKjxb
 Wy8lR6tVeuzRaugqPiFfUKdp/BXBnI4Nd2YFIc03dmdhcBEtyAO3oRpK+ScKx0nSklrwwobVfwX
 Mq9kTijoVKFZKarhRqu8WCP/wmlRhwIhylAmjQfI2TDg==
X-Zone-Loop: 7fbe0b3f88b2d1d113de88f0d9c6065b25976a4640c7
x-campaign-type: default
x-transaction-id: f875c0f3-3859-4a1f-9d78-49d4959c9a9f
x-swg-uid: 01-725ba01c-96cf-4410-8975-d67cb5ee57a3
X-Mailer: Sweego
Message-ID:
 <1793098984.8631fc262581453bbf619ec5b2062170.1a17d072ce5000f79f@vates.tech>
x-swg-bid: 1793098984.8631fc262581453bbf619ec5b2062170.1a17d072ce5000f79f
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
Subject: [PATCH v9 0/1] xen/riscv: fix boot on missing extensions and MMU setup bugs
Date: Tue, 27 Oct 2026 12:03:00 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Change-ID: 20260902-riscv-fix-boot-missing-ext-a79c23bad694
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793098626; l=5837; i=baptiste.le-duc@vates.tech; s=20260810; h=from:subject:message-id; bh=fbE0TlemhAO0yNoNm9JL114Ej6kVAOZ1i304EUZ6HsM=; b=8oyt/FIGYqiwdbm3VcEpcxzZhp9IF+M89dOoiAonYbsMs5oBsC2LHqyqh1h/ws6UX60IgxBKo KRmfNPXKRGXAJyDhj6xDI6Vh/Z1lbNSjMfEqPZKZrp2aarT0c0DyIyU
X-Developer-Key: i=baptiste.le-duc@vates.tech; a=ed25519; pk=N+BbdvMXRzrCuX/ieh4RWodiAKcLNvI+KjflcZ0oXCo=
Content-Transfer-Encoding: 8bit
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1793098982266
X-purgate-ID: tlsNG-ef75cf/1793098990-A46CAAE4-E0531856/0/0
X-purgate-type: clean
X-purgate-size: 5839
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
    1: Probe the A/D update scheme if the DT advertises neither Svade nor
       Svadu

Test CI pipeline:
https://gitlab.com/xen-project/people/baptleduc/xen/-/pipelines/2993878414

---
Changes since v8:
- Drop patches merged upstream:
    999c2ca1ab ("xen/riscv: use pte_is_valid() in pte_is_mapping()")
    8e34f567ef ("xen/riscv: fix A/D bits in Xen's page-table mappings")
    73b802624a ("xen/riscv: look up the exception table for any trap taken
    in Xen context")
    8a9a4bcd7c ("xen/riscv: rework the A/D bits comment in
    p2m_set_pte_flags()")
- Probe through a read-only alias of the Xen image and check the A bit,
  as A being set by a speculative access still implies Svadu.
- Link to v8:
  https://patch.msgid.link/1793027589.8631fc262581453bbf619ec5b2062170.1a178c5c430000f79f@vates.tech
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
Baptiste Le Duc (1):
      xen/riscv: probe the A/D update scheme if the DT advertises neither

 xen/arch/riscv/cpufeature.c             | 65 +++++++++++++++++++++++++++++++++
 xen/arch/riscv/include/asm/cpufeature.h | 13 ++++---
 2 files changed, 72 insertions(+), 6 deletions(-)
---
base-commit: b07838dc463c18f9ca78806d0f05164b02d1cd14
change-id: 20260902-riscv-fix-boot-missing-ext-a79c23bad694

Best regards,
--  
Baptiste Le Duc <baptiste.le-duc@vates.tech>


