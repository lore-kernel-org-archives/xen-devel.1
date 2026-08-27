Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDC1BC61DD4
	for <xen-devel@archiver.kernel.org>; Thu, 27 Aug 2026 15:19:57 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1400809.1636350 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzbt1-00031z-EA; Thu, 27 Aug 2026 15:19:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1400809.1636350; Thu, 27 Aug 2026 15:19:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzbt1-00031s-Aq; Thu, 27 Aug 2026 15:19:27 +0000
Received: by outflank-mailman (input) for mailman id 1400809;
 Thu, 27 Aug 2026 15:19:26 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wzbt0-000310-3N
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2026 15:19:26 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wzbsz-00C6fs-2M
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2026 17:19:25 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a905576-2eae-0a2a0a5409dd-0a2a4507be2c-10
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 17:19:25 +0200
Received: from [209.85.221.53] (helo=mail-wr1-f53.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a90557c-b4ea-0a2a45070019-d155dd35c85a-3
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 17:19:25 +0200
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-482e2fdf5abso1050748f8f.2
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 08:19:24 -0700 (PDT)
Received: from fedora (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-482e28f5d01sm10049148f8f.32.2026.08.27.08.19.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Aug 2026 08:19:23 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787843964; x=1788448764; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8aVeolV88DGRfxdvviYuYAivZzXMsmgnBt8LjtmKoFY=;
        b=fBRD1NbT6MATU3O2lu6mYZ//HHgP7h0sB45VVK46y3WoaPeBy4dllGYks71lIu4EQN
         VzNDlCyEAssUt6GhklYBGfnNCczA9kN4mecafnaUqp5NkxZqvvzJb/n9NBRntugl+ypj
         sY8b9SJd0t8iv+iKKe2U/J8xAwLYuqAuyGYGG6Q1OFScvpy6pOqr51Yz+0qpA+QSjc49
         dG1VOxvuVWOS2LieUTEGmeyRS48GR22BP8zHu9KgVp/CpRDupK9GLCgUUS7/BgTi8AeV
         PSvUfTt5u4Vp5FQOwZ1g3OVuDZyJTwxqSoCL1xDMJ6djbdXlQV/tiveDYx2Mp+e2LeTi
         TGsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787843964; x=1788448764;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8aVeolV88DGRfxdvviYuYAivZzXMsmgnBt8LjtmKoFY=;
        b=MCzo4V8slDcRIt1jxb3/yb1pcjn/9iNZfdPeqhJeSgZrT7zIlxN7NlqqCAnQO1mmTN
         Vtb5H/UoPqqNi9Ua8LScC1AoP4TJI5eNj6ll1cIYT5gniz3Y2sFjQDePiqX2p1gGYYkK
         FB5dMku+CmZFDpjcrkUsFhTM/MtBRGRdbzjjT47HwiYUdGrRWYMTUyKsy6i3jF949EOJ
         uGItcY7G8YHk5g6TRxUM3UZrG5grtL4kRutWQBV3/QFfXa5D2vIs3lRE2Q+zAopaPogN
         FXL1gxoOHHHE3BkX6O8G59gDfXdM0S0V11DUaV2y73Ff/yDKL/Ot2cLObLIMWHhF5ahD
         fUyQ==
X-Gm-Message-State: AFuF++kshSRdx8Wsn+LPmePD5c/7rBEb+5sF9xmFYtGpoHAdVW8G8Z+7
	yEnZsil7gOp5HjU2ASKFy5oXRzYiSMCwBm4N61Uf6iLYRz9kXJ2jMwQon+vS/A==
X-Gm-Gg: AR+sD11xiOTgirOdNMSAlzOFJa0VFc33j2WzWsrWN5OwSuDzaJBf/jSUplVFPTaSjxG
	O1nwkh7tCA2NuPaagWpKpd7M1IaG43UY6rN6+ndyGV4P8qzbfaF0V60+//Om5/A9L1b+veuwYU5
	MIYbb3JqnE852szx5rzwNXKDcIOVcqQHo2QXWIIAHC4aiU+oEn8hbarXQt9tqlaTMxcQZAuzkfl
	Dg04k38eoIq+8XpWZhr7+3tqjc8pQPt+sm9KyzPebbx79Y9apFQLg8S08hXMCKcme1tUl5Eul1S
	kRPvM1jMd2Ic3dwh4ewnqf7utxZNPT1eElY+ZlUHFifScjfMceqdEIYn9Sy2lrKMHUtNWPJyHKH
	AVSzQ+us5XwFQSQm73ArGgYRjN/iHvcGcO11yJJwrLj0yl1HgmMwqk0Aa6Etnls/w2boFB7Indc
	IPMUyWtFlwZUNZR56G01pAGER9MBz4oYqJMeIE59Ld8CPpoc63B1JFdurgqU4S8NM9tr/ykqtWF
	jf3wiJuC+SezsxMlyA131FR4/mcphP0
X-Received: by 2002:a05:600c:6206:b0:49b:90cc:3c87 with SMTP id 5b1f17b1804b1-49b90cc3d27mr32771485e9.13.1787843964147;
        Thu, 27 Aug 2026 08:19:24 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
	Baptiste Le Duc <baptiste.le-duc@vates.tech>,
	Zheng Zhang <zhangzheng@iscas.ac.cn>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Teddy Astie <teddy.astie@vates.tech>,
	Timothy Pearson <tpearson@raptorengineering.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: [PATCH v8 00/20] Introduce enablemenant of dom0less
Date: Thu, 27 Aug 2026 17:18:53 +0200
Message-ID: <cover.1787836900.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ef75cf/1787843965-A64DBAE4-7D04F02F/10/73395122804
X-purgate-type: spam
X-purgate-size: 6511

This patch series reprensent a bunch of patches necessary to enable common part
of Dom0less.
The stuff necessary to start/launch domains will be introduced separately.

CI tests: https://gitlab.com/xen-project/people/olkur/xen/-/pipelines/2796636402

---
Changes in v8:
 - Address the comments.
 - Rename some variable in [PATCH v8 11/20] xen/riscv: introduce per-vCPU IMSIC state.
 - Drop vaplic_init() and vcpu_aplic_deinit() in
   [PATCH v8 12/20] xen/riscv: introduce minimal virtual APLIC (vAPLIC) infrastructure.
---
Changes in v7:
 - Merged to upstream/staging:
   - xen/riscv: Implement ARCH_PAGING_MEMPOOL
   - xen: arm: update p2m_set_allocation() prototype
   - xen/riscv: do a 4th linking pass if necessary
 - Address the comments from ML.
---
Changes in v6:
 - Merged to upstream/staging:
   - xen: arm: move declaration of map_device_irqs_to_domain() to common header
   - xen/Kconfig: introduce HAS_STATIC_MEMORY
   - xen/riscv: rename enum intc_version to intc_variant
   - xen/riscv: implement prerequisites for domain_create()
 - Move UBSAN fix ("xen: introduce CONFIG_HAS_SHARED_INFO for archs without a shared page")
   to this patch series as it is connected to "xen/Kconfig: introduce HAS_STATIC_MEMORY".
 - Address the comments from ML.
---
Changes in v5:
 - Add new patch (xen/riscv: do a 4th linking pass if necessary) which fixes
   randconfig job issue.
 - Address comments from ML.
---
Changes in v4:
 - Address comments from ML.
---
Changes in v3:
 - Drop dependency from other patch series
   ([1] https://lore.kernel.org/xen-devel/cover.1778140240.git.oleksii.kurochko@gmail.com/T/#t)
   as it was merged.
 - Reorder patches:
   - move common patches to the start.
   - Move some patches to separate patch series (will be introduced later)
 - Address comments from ML.
---
Changes in v2:
 - Move patch "[PATCH v1 04/27] xen/riscv: rework G-stage mode handling" to
   patch series [1]
 - Address the comments from ML.
 - The following patches were folded into one:
   # xen/riscv: implement init_intc_phandle()
   # xen/riscv: call do_initcalls() in start_xen()
   # xen/riscv: setup system domains
 - The following patch were folded into one:
   # xen/riscv: add vaplic access check
   # xen/riscv: emulate guest writes to virtual APLIC MMIO
   # xen/riscv: emulate guest reads from virtual APLIC MMIO
 - Add new bug fix, not really necessary to this patch series:
   xen/riscv: manage IRQ_DISABLED flag in APLIC irq enable/disable callbacks
---

Oleksii Kurochko (20):
  xen: introduce CONFIG_HAS_SHARED_INFO for archs without a shared page
  xen/dom0less: turn max_init_domid into a common variable
  xen/riscv: Implement construct_domain()
  xen/riscv: introduce guest riscv,isa string
  xen/riscv: implement make_cpus_node()
  xen/riscv: implement make_timer_node()
  xen/riscv: implement make_arch_nodes()
  xen/riscv: introduce init interrupt controller operations
  xen/riscv: implement make_intc_domU_node()
  xen/riscv: introduce aia_init() and aia_usable()
  xen/riscv: introduce per-vCPU IMSIC state
  xen/riscv: introduce minimal virtual APLIC (vAPLIC) infrastructure
  xen/riscv: introduce (de)initialization helpers for vINTC
  xen/riscv: generate IMSIC DT node for guest domains
  xen/riscv: create APLIC DT node for guest domains
  xen/riscv: implement IRQ routing for device passthrough
  xen/riscv: implement init_intc_phandle()
  xen/riscv: initialize RCU, scheduler, and system domains in
    start_xen()
  xen/riscv: provide init_vuart()
  xen/riscv: add initial dom0less infrastructure support

 xen/arch/arm/Kconfig                      |   1 +
 xen/arch/arm/include/asm/setup.h          |   2 -
 xen/arch/arm/setup.c                      |   2 -
 xen/arch/ppc/include/asm/setup.h          |   2 -
 xen/arch/riscv/Kconfig                    |   2 +
 xen/arch/riscv/Makefile                   |   4 +
 xen/arch/riscv/aia.c                      |  23 ++
 xen/arch/riscv/aplic-priv.h               |  13 ++
 xen/arch/riscv/aplic.c                    |  14 +-
 xen/arch/riscv/cpufeature.c               | 200 +++++++++++++++--
 xen/arch/riscv/device.c                   | 100 +++++++++
 xen/arch/riscv/dom0less-build.c           |  40 ++++
 xen/arch/riscv/domain-build.c             | 192 ++++++++++++++++
 xen/arch/riscv/domain.c                   |  20 +-
 xen/arch/riscv/imsic.c                    | 178 ++++++++++++++-
 xen/arch/riscv/include/asm/aia.h          |  10 +
 xen/arch/riscv/include/asm/aplic.h        |  15 ++
 xen/arch/riscv/include/asm/cpufeature.h   |   5 +
 xen/arch/riscv/include/asm/domain.h       |   7 +
 xen/arch/riscv/include/asm/guest-layout.h |  24 ++
 xen/arch/riscv/include/asm/imsic.h        |  25 +++
 xen/arch/riscv/include/asm/intc.h         |  44 +++-
 xen/arch/riscv/include/asm/irq.h          |   5 +
 xen/arch/riscv/include/asm/setup.h        |   2 -
 xen/arch/riscv/include/asm/vaplic.h       |  34 +++
 xen/arch/riscv/intc.c                     | 117 +++++++++-
 xen/arch/riscv/irq.c                      | 255 ++++++++++++++++++++++
 xen/arch/riscv/setup.c                    |  12 +
 xen/arch/riscv/vaplic.c                   | 138 ++++++++++++
 xen/arch/x86/Kconfig                      |   1 +
 xen/arch/x86/include/asm/setup.h          |   2 -
 xen/common/Kconfig                        |   3 +
 xen/common/Makefile                       |   2 +-
 xen/common/domain.c                       |   6 +-
 xen/common/domctl.c                       |   4 +
 xen/common/domid.c                        |   5 +
 xen/common/event_channel.c                |  55 ++++-
 xen/common/event_channel.h                |   6 +
 xen/common/event_fifo.c                   |  18 +-
 xen/common/time.c                         |   2 +
 xen/drivers/char/console.c                |   1 +
 xen/include/xen/dom0less-build.h          |   7 +
 xen/include/xen/event.h                   |   2 +-
 xen/include/xen/sched.h                   |   2 +
 xen/include/xen/shared.h                  |   6 +
 xen/include/xen/time.h                    |   5 +
 46 files changed, 1552 insertions(+), 61 deletions(-)
 create mode 100644 xen/arch/riscv/aia.c
 create mode 100644 xen/arch/riscv/device.c
 create mode 100644 xen/arch/riscv/domain-build.c
 create mode 100644 xen/arch/riscv/include/asm/aia.h
 create mode 100644 xen/arch/riscv/include/asm/vaplic.h
 create mode 100644 xen/arch/riscv/vaplic.c

-- 
2.55.0


