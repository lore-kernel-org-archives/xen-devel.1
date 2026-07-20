Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29CACC44515
	for <xen-devel@archiver.kernel.org>; Mon, 20 Jul 2026 16:00:39 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1366946.1616730 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wlqPi-00041Z-Mt; Mon, 20 Jul 2026 16:00:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1366946.1616730; Mon, 20 Jul 2026 16:00:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wlqPi-00041S-IG; Mon, 20 Jul 2026 16:00:18 +0000
Received: by outflank-mailman (input) for mailman id 1366946;
 Mon, 20 Jul 2026 16:00:17 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wlqPh-00041G-6z
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2026 16:00:17 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wlqPg-00HTQt-GL
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2026 18:00:16 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a5e460c-e002-0a2a0a5209dd-0a2a4503e392-24
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 18:00:16 +0200
Received: from [209.85.221.53] (helo=mail-wr1-f53.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a5e4610-fae8-0a2a45030019-d155dd35a95f-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 18:00:16 +0200
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-4720f3bf164so2150119f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 09:00:16 -0700 (PDT)
Received: from fedora (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47f63edd7d3sm30084673f8f.25.2026.07.20.09.00.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jul 2026 09:00:14 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1784563215; x=1785168015; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6muAc8o+Uh8aEi5bB+cs6mTT3fDYbl5MHDoHkwXOnuE=;
        b=stS2rICz4HPJQWkFvLCp+3nxW1yfsEvVnIfeu8KJPsuSs5TDbdklkcXxYS+x2GdL/l
         VWKv0otZVjx287IjEMeVdl6hJNtE1vHEmtQ+dtK2RYYx+vcLqCHShBYl5AAUTTtLtoPP
         iCaaqLRjvCxhlNQn0DIZ3m61ms5gA9wcrBS6iqDCj1C10FGYW6js7/+0PBG9qw53XJ7+
         JR5X8FzQwWPNRS0IIDCRxGXrrkdR70FpVR5eOiHjAG3HhOWdC1vtJQ7FDCYQmHIqln1M
         Bl1mjcgT01O40eV0fwS/Pu9KosgUWhz+tQqha+5FM+NeVSIR7QUvkzy9AffTSn1BcPEG
         XYbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784563215; x=1785168015;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6muAc8o+Uh8aEi5bB+cs6mTT3fDYbl5MHDoHkwXOnuE=;
        b=HR0jEaMn5mT3u1BxcfsMGrp2RGkIYk8aiQSQRUmQnyN9uFX0FJw6RTadaT6fhvG1zS
         VAhxM1dDMq9qBiWJp0Kyds27wnEeGzb9t0ekb61a3uB1AE3QNUHFNn0heq78gamdjSSm
         61GL8VG3uMJ3aatcG4c6/IJxRbMwNZIOY1yx5UqXlDym7CQkl/cnVurj/B5/y7wDnX8m
         ycvvNh5s8wo4HDmWJvxjFohX/YW0rhVNEfqx6Y+75e/YCOZsd04GFo0kVBOfvzP5RfFV
         XnBUapKS2vlPNaTvOfJ5zlnJoAI+m6ZjIj6XBH/KySapE+1BbF0JOmhIdrirPJBUPCyA
         Ihig==
X-Gm-Message-State: AOJu0YyTRDd0BGEMd6/5uxS3kXIWaT+LXGm9kwx2TLzP5ERGytBzAyLh
	SOTOu8gjDnGbVnRgzGZ+7QGEyN31qeKmxqAVq5cM77oz31N4Q468UgXPz2RT3A==
X-Gm-Gg: AR+sD102BZYXN0+QfJ2GJ8csb4pNs0w4oOnxiKp8N8oL7fyBGW9EK/8TTKYFOJrL1/l
	x10hlRSlvolaGN5pLf13hRXta5NF9BS3zJEk2KioQwPvuBTyS+yKKRd7OO7rqFVPUEkNdxrvRHr
	xkELsmAoMWkGHAsTZhOhn2THf8xOXjSIdrCy4gTPx36Uby1cn1Vm72euj/wgXR+SMem/eN+x67O
	LCqizNaOXihhRf1L8GAUtqNnC6yYwH+7ewMrTAs6BAzMkAOC7uumBBGkCXkU537Pqe0rnfGbhTk
	RyL61a14tqR2pD7yf2Cslmpu/SwD5KRx4pe+jD38GJh0bw1rHgbiJZ9jxzWLdqoWZKdrTYAWENU
	OIR64o5y8yJy6nUg9aC808A2VVA8t77MACJ6wDBvEXwscbETzvZ9sUcRKnZGAkOZ57d34o0psBj
	pc0A7LFmBbcK7u3H3kz1eGQrysdzSQrRe3tgzQLfUa+hK6xJ1DNpJ/hSPtqQ==
X-Received: by 2002:a05:6000:4b0d:b0:47f:537b:d5d0 with SMTP id ffacd0b85a97d-47f623f2ef4mr16816381f8f.28.1784563215139;
        Mon, 20 Jul 2026 09:00:15 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
	Baptiste Le Duc <baptiste.le-duc@vates.tech>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	Timothy Pearson <tpearson@raptorengineering.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: [PATCH v6 00/23] Introduce enablemenant of dom0less
Date: Mon, 20 Jul 2026 17:59:41 +0200
Message-ID: <cover.1784559209.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-33051d/1784563216-74E874E9-6FD3FECE/10/73395122804
X-purgate-type: spam
X-purgate-size: 6417

This patch series reprensent a bunch of patches necessary to enable common part
of Dom0less.
The stuff necessary to start/launch domains will be introduced separately.

CI tests: https://gitlab.com/xen-project/people/olkur/xen/-/pipelines/2690872826

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

Oleksii Kurochko (23):
  xen: introduce CONFIG_HAS_SHARED_INFO for archs without a shared page
  xen/dom0less: turn max_init_domid into a common variable
  xen: arm: update p2m_set_allocation() prototype
  xen/riscv: Implement ARCH_PAGING_MEMPOOL
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
  xen/riscv: do a 4th linking pass if necessary

 xen/arch/arm/Kconfig                      |   1 +
 xen/arch/arm/include/asm/p2m.h            |   1 -
 xen/arch/arm/include/asm/setup.h          |   2 -
 xen/arch/arm/mmu/p2m.c                    |  24 +--
 xen/arch/arm/setup.c                      |   2 -
 xen/arch/ppc/include/asm/setup.h          |   2 -
 xen/arch/riscv/Kconfig                    |   3 +
 xen/arch/riscv/Makefile                   |  20 +-
 xen/arch/riscv/aia.c                      |  23 +++
 xen/arch/riscv/aplic-priv.h               |  14 ++
 xen/arch/riscv/aplic.c                    |  14 +-
 xen/arch/riscv/cpufeature.c               | 148 +++++++++++---
 xen/arch/riscv/device.c                   |  94 +++++++++
 xen/arch/riscv/dom0less-build.c           |  40 ++++
 xen/arch/riscv/domain-build.c             | 211 +++++++++++++++++++
 xen/arch/riscv/domain.c                   |  16 +-
 xen/arch/riscv/imsic.c                    | 178 +++++++++++++++-
 xen/arch/riscv/include/asm/aia.h          |  10 +
 xen/arch/riscv/include/asm/aplic.h        |  15 ++
 xen/arch/riscv/include/asm/cpufeature.h   |   5 +
 xen/arch/riscv/include/asm/domain.h       |   7 +
 xen/arch/riscv/include/asm/guest-layout.h |  24 +++
 xen/arch/riscv/include/asm/imsic.h        |  25 +++
 xen/arch/riscv/include/asm/intc.h         |  44 +++-
 xen/arch/riscv/include/asm/irq.h          |   5 +
 xen/arch/riscv/include/asm/paging.h       |   2 +-
 xen/arch/riscv/include/asm/setup.h        |   2 -
 xen/arch/riscv/include/asm/vaplic.h       |  34 ++++
 xen/arch/riscv/intc.c                     | 102 +++++++++-
 xen/arch/riscv/irq.c                      | 238 ++++++++++++++++++++++
 xen/arch/riscv/p2m.c                      |  33 ++-
 xen/arch/riscv/paging.c                   |   7 +-
 xen/arch/riscv/setup.c                    |  12 ++
 xen/arch/riscv/vaplic.c                   | 148 ++++++++++++++
 xen/arch/x86/Kconfig                      |   1 +
 xen/arch/x86/include/asm/setup.h          |   2 -
 xen/common/Kconfig                        |   3 +
 xen/common/Makefile                       |   2 +-
 xen/common/device-tree/dom0less-build.c   |   2 +-
 xen/common/domain.c                       |   6 +-
 xen/common/domctl.c                       |  11 +-
 xen/common/domid.c                        |   5 +
 xen/common/event_channel.c                |  53 ++++-
 xen/common/event_channel.h                |   6 +
 xen/common/event_fifo.c                   |  19 +-
 xen/common/time.c                         |   2 +
 xen/drivers/char/console.c                |   1 +
 xen/include/xen/dom0less-build.h          |   7 +
 xen/include/xen/p2m-common.h              |   8 +
 xen/include/xen/shared.h                  |   8 +-
 xen/include/xen/time.h                    |   4 +
 51 files changed, 1548 insertions(+), 98 deletions(-)
 create mode 100644 xen/arch/riscv/aia.c
 create mode 100644 xen/arch/riscv/device.c
 create mode 100644 xen/arch/riscv/domain-build.c
 create mode 100644 xen/arch/riscv/include/asm/aia.h
 create mode 100644 xen/arch/riscv/include/asm/vaplic.h
 create mode 100644 xen/arch/riscv/vaplic.c

-- 
2.54.0


