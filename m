Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 366CEC55838
	for <xen-devel@archiver.kernel.org>; Tue,  4 Aug 2026 15:48:39 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1382264.1625629 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrHNT-0007OD-8s; Tue, 04 Aug 2026 15:48:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1382264.1625629; Tue, 04 Aug 2026 15:48:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrHNT-0007Nn-3o; Tue, 04 Aug 2026 15:48:27 +0000
Received: by outflank-mailman (input) for mailman id 1382264;
 Tue, 04 Aug 2026 15:48:25 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wrHNR-0007Jx-N4
 for xen-devel@lists.xenproject.org; Tue, 04 Aug 2026 15:48:25 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wrHNR-009QIN-3r
 for xen-devel@lists.xenproject.org; Tue, 04 Aug 2026 17:48:25 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a7209be-e002-0a2a0a5209dd-0a2a45019e90-12
 for <xen-devel@lists.xenproject.org>; Tue, 04 Aug 2026 17:48:24 +0200
Received: from [209.85.128.46] (helo=mail-wm1-f46.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a7209c3-5984-0a2a45010019-d155802eb5f8-3
 for <xen-devel@lists.xenproject.org>; Tue, 04 Aug 2026 17:48:19 +0200
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-49557167508so30589855e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 04 Aug 2026 08:48:19 -0700 (PDT)
Received: from fedora (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49949fcb46esm116430355e9.5.2026.08.04.08.48.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Aug 2026 08:48:18 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1785858499; x=1786463299; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o7cNA0aHmLQVev9D/olk7PT2DhodkPFOY5f8VX+59pM=;
        b=dmWnQZo5Or7MRVLwxgJ/DupYW4q392r8kLcL0g+zRkYKBeA/WkUkZu1VcF13TLyg3D
         g5CIOvYcgXHUpgQKZPXoJgQ7VEM5nMAsIvOsBG074qIw74WEdcixztfOCaBsWXj+IYWv
         qjnaq502QKcPJ9UebV7hTwptKZj2GdII3evo1cHTdePmSaxRxUin8+E9DU4Z1Tgv/s8f
         ps9JBPczNom4ckhMXRzVrWPUSWiJUiDI4RlJxcRMxnLkDpuOJblOPND26E5zIUeN4VN7
         W44xCwVD998BcorEvVtwoG38kcQCy7yFTG6aiELDRBLg41+Cq5SDzSP6VDg4ud79L5zf
         shuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785858499; x=1786463299;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=o7cNA0aHmLQVev9D/olk7PT2DhodkPFOY5f8VX+59pM=;
        b=WLrLQlW/7QB0TiX+TE0VyfVj4x1XLVwQTxiZc3WD+F6lKMgvg0kgQMzZkQJDcDLxBG
         AEpCLfEDqTbGZwi7BPgaa4O2fVgiDdqQddLtSs7I3G8+fiTLmkW4VRWCUs/uPSKm09/H
         /2sp7e17bPOvAwB3Cg2xkz2p7DRtsjtTpu3E/brokcCxDQlLwEDex37b7E4k1KjhFV/1
         2nBqRKkTzETOj7rh9w7tHQY90IxJhwNdE7Ye3APT2f+fh07F2WEeyTmuaEi+tdXU9Ux8
         uLunV7wkIA3jF3zeeV3Pp1vWmXiszA29S6JI626WEWNn/Rfo64UBu+upyABOMeTa97xj
         HBPw==
X-Gm-Message-State: AOJu0YzMJ2q1W+qodhMz6llCNWMoYFI8AJni4Fm/dVF86vSqk6ZkSqF/
	SYbaFoGBH7WSUD/gux+iK/Bl4liV88KaYmkHBAGObG2ePXxuUa+GTUw+UN1dFw==
X-Gm-Gg: AR+sD11MA3lz9Fmicg/476+ZAqJbU4m2t/Br7vj0jnAC8heiUBBxWMuMWUf07QFfQPS
	dzYJ6CB50ZEyEP+MftDSHfM02gJjsPDx890qmXeRjioRfssBqtnfoATsVDik2sV8y6ma5oK17GA
	liW/j7ULqX9lx6MkBepla15RK+TzNhh9vcrWiIAvs+C9o8/pZ+3Lw9joMwTAhhT6wpg7nQwnjyw
	U8YW5poRvevG8v0xP0Tr/VZXc5bIEEGJw4wMl7EDogJgLOZHerh3BYRydQ8Ks4F+8zjgdZkx/5u
	hPNLys6intytTJ2rwO0VC08a46j8FBvjImPC5CQyoOQCIELSMukJcF88lMFesFWLxnXIFY/nJ80
	so4oMU1wi1Qve900QfrhShjNksadjrR9LBD7StPmBLXZhU9+j3BqgH0VxzObP4FLriNv73W49Qm
	cu9TzFhqQx37lT1ImKFRdHMwE2OXjgkcZZp4R/QNZPcicipz/21ELzh6DZWY4TM3RlHIXMv983m
	lqr3CWPLyM3Ju4pdIeUJnmFhrZf+QrrAhjEFaLlrB8q
X-Received: by 2002:a05:600c:c8c:b0:495:5045:39e6 with SMTP id 5b1f17b1804b1-4980c664d68mr287612735e9.17.1785858499102;
        Tue, 04 Aug 2026 08:48:19 -0700 (PDT)
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
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Teddy Astie <teddy.astie@vates.tech>,
	Timothy Pearson <tpearson@raptorengineering.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: [PATCH v7 00/20]  Introduce enablemenant of dom0less
Date: Tue,  4 Aug 2026 17:47:50 +0200
Message-ID: <cover.1785836421.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d62444/1785858499-1D073757-18158D8C/10/73395122804
X-purgate-type: spam
X-purgate-size: 6195

This patch series reprensent a bunch of patches necessary to enable common part
of Dom0less.
The stuff necessary to start/launch domains will be introduced separately.

CI tests: https://gitlab.com/xen-project/people/olkur/xen/-/pipelines/2729854543

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
 xen/arch/riscv/aia.c                      |  23 +++
 xen/arch/riscv/aplic-priv.h               |  13 ++
 xen/arch/riscv/aplic.c                    |  14 +-
 xen/arch/riscv/cpufeature.c               | 171 +++++++++++++---
 xen/arch/riscv/device.c                   |  94 +++++++++
 xen/arch/riscv/dom0less-build.c           |  40 ++++
 xen/arch/riscv/domain-build.c             | 192 ++++++++++++++++++
 xen/arch/riscv/domain.c                   |  16 +-
 xen/arch/riscv/imsic.c                    | 178 ++++++++++++++++-
 xen/arch/riscv/include/asm/aia.h          |  10 +
 xen/arch/riscv/include/asm/aplic.h        |  15 ++
 xen/arch/riscv/include/asm/cpufeature.h   |   5 +
 xen/arch/riscv/include/asm/domain.h       |   7 +
 xen/arch/riscv/include/asm/guest-layout.h |  24 +++
 xen/arch/riscv/include/asm/imsic.h        |  25 +++
 xen/arch/riscv/include/asm/intc.h         |  44 ++++-
 xen/arch/riscv/include/asm/irq.h          |   5 +
 xen/arch/riscv/include/asm/setup.h        |   2 -
 xen/arch/riscv/include/asm/vaplic.h       |  34 ++++
 xen/arch/riscv/intc.c                     | 102 +++++++++-
 xen/arch/riscv/irq.c                      | 226 ++++++++++++++++++++++
 xen/arch/riscv/setup.c                    |  12 ++
 xen/arch/riscv/vaplic.c                   | 148 ++++++++++++++
 xen/arch/x86/Kconfig                      |   1 +
 xen/arch/x86/include/asm/setup.h          |   2 -
 xen/common/Kconfig                        |   3 +
 xen/common/Makefile                       |   2 +-
 xen/common/domain.c                       |   6 +-
 xen/common/domctl.c                       |   4 +
 xen/common/domid.c                        |   5 +
 xen/common/event_channel.c                |  53 ++++-
 xen/common/event_channel.h                |   6 +
 xen/common/event_fifo.c                   |  19 +-
 xen/common/time.c                         |   2 +
 xen/drivers/char/console.c                |   1 +
 xen/include/xen/dom0less-build.h          |   7 +
 xen/include/xen/sched.h                   |   2 +
 xen/include/xen/shared.h                  |   8 +-
 xen/include/xen/time.h                    |   4 +
 45 files changed, 1478 insertions(+), 60 deletions(-)
 create mode 100644 xen/arch/riscv/aia.c
 create mode 100644 xen/arch/riscv/device.c
 create mode 100644 xen/arch/riscv/domain-build.c
 create mode 100644 xen/arch/riscv/include/asm/aia.h
 create mode 100644 xen/arch/riscv/include/asm/vaplic.h
 create mode 100644 xen/arch/riscv/vaplic.c

-- 
2.55.0


