Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A243CA5FFC
	for <xen-devel@archiver.kernel.org>; Mon,  5 Oct 2026 15:59:12 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1440963.1658505 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xDl5Z-00077V-E7; Mon, 05 Oct 2026 15:58:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1440963.1658505; Mon, 05 Oct 2026 15:58:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xDl5Z-00077O-BC; Mon, 05 Oct 2026 15:58:53 +0000
Received: by outflank-mailman (input) for mailman id 1440963;
 Mon, 05 Oct 2026 15:58:52 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xDl5X-00077I-Ri
 for xen-devel@lists.xenproject.org; Mon, 05 Oct 2026 15:58:51 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xDl5X-003Jlh-8Y
 for xen-devel@lists.xenproject.org; Mon, 05 Oct 2026 17:58:51 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a10cc9f7c20003f66@swg.vates.tech>)
 id 6ac3c938-8faa-0a2a0a5109dd-0a2a450cd4cc-10
 for <xen-devel@lists.xenproject.org>; Mon, 05 Oct 2026 17:58:51 +0200
Received: from [185.255.28.18] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a10cc9f7c20003f66@swg.vates.tech>)
 id 6ac3c93a-f479-0a2a450c0019-b9ff1c12b307-3
 for <xen-devel@lists.xenproject.org>; Mon, 05 Oct 2026 17:58:51 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a10cc9f7c20003f66.007 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 05 Oct 2026 15:58:45 +0000
Received: from leducb.home (areims-651-1-80-194.w90-18.abo.wanadoo.fr
 [90.18.187.194]) (Authenticated sender: baptiste.le-duc)
 by mail2.vates.fr (Postfix) with ESMTPSA id 297CA822A9;
 Mon,  5 Oct 2026 17:58:44 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=P+y8Uky1ULNQ8eUEjKyL1X8FAua0NmxyTivjeFsUWc0=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:content-transfer-encoding:feedback-id;
 b=MuLurpkYmKGEu/qchUr13luzCeDRPRtA+j/wZb6hhTsOT8nDpkgOrZ0dZPdkimScongPmyTUj
 68cnoUlFVxyS7FVinDrEku/TMC2tboTp/9hJA+LYYyILhzUKmHuRS5Y7+i6qNBT8YikvY29MJnQ
 8GPLsx3fOTbAQX/Hc4wegI/ZuK44lfV2HUjN+d8lKgbC+ofoxMHyUX1rlTAda090EDDtbh3/Hqi
 knIi800Gv4lNwKUvcGjxhjxsxqrHwlZVaCB2aOXkefKK1C8MsHzegu4XtBMqRM3j2cqgJ1vpa6P
 aQHB6cfdwM8Jz4L2zWkqibo0gcZcDW13CNInYPC0a6mw==
X-Zone-Loop: 2f53d3597f560924b1374965a34df0977b3465d0505b
x-campaign-type: default
x-transaction-id: e419bbea-dc3d-45c5-8151-f1063ca243fc
x-swg-uid: 01-d4f30aad-a590-43b9-988f-bd1200dc09e6
X-Mailer: Sweego
Message-ID:
 <1791215925.8631fc262581453bbf619ec5b2062170.1a10cc9f7c20003f66@vates.tech>
x-swg-bid: 1791215925.8631fc262581453bbf619ec5b2062170.1a10cc9f7c20003f66
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
Subject: [PATCH v5 0/3] xen/riscv: fix boot on missing extensions and MMU setup bugs
Date: Mon,  5 Oct 2026 17:58:40 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Change-ID: 20260902-riscv-fix-boot-missing-ext-a79c23bad694
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791215868; l=4092; i=baptiste.le-duc@vates.tech; s=20260810; h=from:subject:message-id; bh=gVX+Clx4s6m8EAocf35NeMpaQCBmbKQ2GC5detAm5Yo=; b=dAZJkhq0FP7vQbGDVw0kDituzjaNEM4zrHsNYLnyk1wwBXnq3qdxbLqcPBcCTERseLrkmczSD KEsfdP/90rtD+NbTAmx7pJgxWjo52iZdQgb+J5Q7o7dWGV51TFyj4v2
X-Developer-Key: i=baptiste.le-duc@vates.tech; a=ed25519; pk=N+BbdvMXRzrCuX/ieh4RWodiAKcLNvI+KjflcZ0oXCo=
Content-Transfer-Encoding: 8bit
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1791215924375
X-purgate-ID: tlsNG-d25034/1791215931-77CD3A5B-9B5DAA7C/10/78276251493
X-purgate-type: spam
X-purgate-size: 4094

This series introduces bugs fixes that were found while bringing up CI
support for the HiFive Premier P550 board with a basic smoke test. The
board-support series itself will follow separately as it depends on
PLIC/vPLIC and dom0less support that have not been upstreamed yet. This
series carries only the independent fixes found along the way, none of them
need the board-support series to apply.

This series:
    1: Always preset A/D bits in G-stage PTEs
    2: Fix A/D bit handling in Xen's page-table mappings
    3: Use pte_is_valid() in pte_is_mapping()

CI pipeline:
https://gitlab.com/xen-project/people/baptleduc/xen/-/pipelines/2914284702

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
Baptiste Le Duc (3):
      xen/riscv: always preset A/D bits in G-stage PTEs
      xen/riscv: fix A/D bits in Xen's page-table mappings
      xen/riscv: use pte_is_valid() in pte_is_mapping()

 xen/arch/riscv/include/asm/page.h | 35 ++++++++++++++++++-----------------
 xen/arch/riscv/mm.c               | 11 +++++------
 xen/arch/riscv/p2m.c              | 38 ++++++++------------------------------
 3 files changed, 31 insertions(+), 53 deletions(-)
---
base-commit: e4da1829737fb575133d1f79d9ad987000891649
change-id: 20260902-riscv-fix-boot-missing-ext-a79c23bad694

Best regards,
--  
Baptiste Le Duc <baptiste.le-duc@vates.tech>


