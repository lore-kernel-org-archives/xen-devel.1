Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9132CCA5FA7
	for <xen-devel@archiver.kernel.org>; Tue, 29 Sep 2026 16:30:07 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1436553.1655201 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBaiB-0004IY-VA; Tue, 29 Sep 2026 16:29:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1436553.1655201; Tue, 29 Sep 2026 16:29:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBaiB-0004IR-Qp; Tue, 29 Sep 2026 16:29:47 +0000
Received: by outflank-mailman (input) for mailman id 1436553;
 Tue, 29 Sep 2026 16:29:46 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xBai9-0004I2-NY
 for xen-devel@lists.xenproject.org; Tue, 29 Sep 2026 16:29:46 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xBai8-009fEY-HO
 for xen-devel@lists.xenproject.org; Tue, 29 Sep 2026 18:29:44 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0ee00218b000b504@swg.vates.tech>)
 id 6abbe76a-bab6-0a2a0a5309dd-0a2a45039604-12
 for <xen-devel@lists.xenproject.org>; Tue, 29 Sep 2026 18:29:44 +0200
Received: from [185.255.28.34] (helo=prod-mta-13-01.swg-srv.net)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0ee00218b000b504@swg.vates.tech>)
 id 6abbe777-fae8-0a2a45030019-b9ff1c22b0bf-3
 for <xen-devel@lists.xenproject.org>; Tue, 29 Sep 2026 18:29:44 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-01.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a0ee00218b000b504.007 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 29 Sep 2026 16:29:41 +0000
Received: from leducb.home (areims-651-1-80-194.w90-18.abo.wanadoo.fr
 [90.18.187.194]) (Authenticated sender: baptiste.le-duc)
 by mail2.vates.fr (Postfix) with ESMTPSA id 04ECA81FC1;
 Tue, 29 Sep 2026 18:29:40 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=IUZVcCyxyfJ6qo02HJjGtYpeg0JZwidyQJc+hlgqnnQ=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:content-transfer-encoding:feedback-id;
 b=t4OuntU6TFS+1EzzPfjtOfkwXBNIESspFNMqyWkcYQZTAYctY8VzC+OFaXykr/ixRYJ9Euuue
 5Kt8bSDWlY5Kjqn3eqw/MhrtSZ2u134nH8qbA9y29qyjAVs3KQ8922nlW4XnfF41k40Vo8qPffO
 WXq0dWkj31xGr+pAF7jxx24ZG+fO/Tn4P5Cr+HgYeOJKL4NmyqmLuwn59vBtQt1gbDdkMmiXezD
 r2KrgnOsVrOcXFfzzvbzu0bwcKgQmwbXG9YN85RSkH44YqoETQbPy+9TDrx/8GYhtOCvSJ5LL00
 /BSOLeLFYyXTkv6N0MS5CQM2yB5eVXMWU8FuKONbr3Ww==
X-Zone-Loop: 7d09e14c1a2bc00cc7a195ff6922f33dfb9556ede653
x-campaign-type: default
x-transaction-id: af1c718a-35c5-400f-bc2c-4cdb3d294bee
x-swg-uid: 01-8beab2ae-b497-43d8-a2ba-1098ef9ef75b
X-Mailer: Sweego
Message-ID:
 <1790699381.8631fc262581453bbf619ec5b2062170.1a0ee00218b000b504@vates.tech>
x-swg-bid: 1790699381.8631fc262581453bbf619ec5b2062170.1a0ee00218b000b504
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
Subject: [PATCH v3 0/6] xen/riscv: fix boot on missing extensions and MMU setup bugs
Date: Tue, 29 Sep 2026 18:29:31 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Change-ID: 20260902-riscv-fix-boot-missing-ext-a79c23bad694
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790699289; l=3890; i=baptiste.le-duc@vates.tech; s=20260810; h=from:subject:message-id; bh=LwpBexMeIsi6joph2Csw8GBLNm3rbwm71DJGexWONBQ=; b=21tpbk4KOxpkcGjUJi/86hnJb5nwoTUD1JzWDJvSIh7UW+2Y/797ss+pU/fpjDRduvHTJ4sET 6ScR0hatBOiCdnt+EkvDGUZkVayjnx1LO9ngK3jxYXJ60pWq+KV/2Xk
X-Developer-Key: i=baptiste.le-duc@vates.tech; a=ed25519; pk=N+BbdvMXRzrCuX/ieh4RWodiAKcLNvI+KjflcZ0oXCo=
Content-Transfer-Encoding: 8bit
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1790699380228
X-purgate-ID: tlsNG-33051d/1790699384-6EECA4E9-F4BF87A7/10/78276251493
X-purgate-type: spam
X-purgate-size: 3892

This series introduces bugs fixes that were found while bringing up CI
support for the HiFive Premier P550 board with a basic smoke test. The
board-support series itself will follow separately as it depends on
PLIC/vPLIC and dom0less support that have not been upstreamed yet. This
series carries only the independent fixes found along the way, none of them
need the board-support series to apply.

This series:
    1: Docs: sync required ISA extensions with required_extensions[]
    2: Rename PTE "permissions" to "pte_flags"
    3: Fix A/D bit handling in G-stage mappings
    4: Fix A/D bit handling in Xen's page-table mappings
    5: Use pte_is_valid() in pte_is_mapping()
    6: Make Zihintpause no longer a required extension

CI pipeline:
https://gitlab.com/xen-project/people/baptleduc/xen/-/pipelines/2894144143

---
Changes since v2:
- Drop v2 patches 5 and 6, already committed:
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
Baptiste Le Duc (5):
      xen/riscv: rename PTE "permissions" to "pte_flags"
      xen/riscv: fix A/D bit handling in G-stage mappings
      xen/riscv: fix A/D bits in Xen's page-table mappings
      xen/riscv: use pte_is_valid() in pte_is_mapping()
      xen/riscv: make Zihintpause no longer a required extension

Oleksii Kurochko (1):
      docs/riscv: sync required ISA extensions with required_extensions[]

 docs/misc/riscv/booting.txt             | 27 +++++++++++-----
 xen/arch/riscv/cpufeature.c             | 56 ++++++++++++++++++++++++++++++++-
 xen/arch/riscv/include/asm/cpufeature.h |  1 +
 xen/arch/riscv/include/asm/mm.h         |  5 +--
 xen/arch/riscv/include/asm/page.h       | 35 +++++++++++----------
 xen/arch/riscv/include/asm/sbi.h        |  8 +++++
 xen/arch/riscv/mm.c                     | 11 +++----
 xen/arch/riscv/p2m.c                    | 44 ++++++++------------------
 8 files changed, 123 insertions(+), 64 deletions(-)
---
base-commit: 4c1aba82cff95ab11f7fe4af8965a06703537288
change-id: 20260902-riscv-fix-boot-missing-ext-a79c23bad694

Best regards,
--  
Baptiste Le Duc <baptiste.le-duc@vates.tech>


