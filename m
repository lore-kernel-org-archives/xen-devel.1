Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CB77C79FB7
	for <xen-devel@archiver.kernel.org>; Wed,  9 Sep 2026 15:08:47 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1413247.1643463 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4JuE-0000PB-CN; Wed, 09 Sep 2026 15:08:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1413247.1643463; Wed, 09 Sep 2026 15:08:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4JuE-0000P4-9o; Wed, 09 Sep 2026 15:08:10 +0000
Received: by outflank-mailman (input) for mailman id 1413247;
 Wed, 09 Sep 2026 15:08:08 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1x4JuC-0000Oy-M7
 for xen-devel@lists.xenproject.org; Wed, 09 Sep 2026 15:08:08 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x4JuB-003DEf-DU
 for xen-devel@lists.xenproject.org; Wed, 09 Sep 2026 17:08:07 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6aa17646-bab6-0a2a0a5309dd-0a2a4501d2c0-46
 for <xen-devel@lists.xenproject.org>; Wed, 09 Sep 2026 17:08:06 +0200
Received: from [74.125.228.140] (helo=mail-ej2-f12.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6aa17656-5984-0a2a45010019-4a7de48cb2cb-3
 for <xen-devel@lists.xenproject.org>; Wed, 09 Sep 2026 17:08:06 +0200
Received: by mail-ej2-f12.google.com with SMTP id
 a640c23a62f3a-c254fa663c1so42032566b.0
 for <xen-devel@lists.xenproject.org>; Wed, 09 Sep 2026 08:08:06 -0700 (PDT)
Received: from fedora (IW396200.net.t-com.hr. [195.29.234.54])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c261f673000sm709991666b.24.2026.09.09.08.07.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Sep 2026 08:08:05 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1788966486; x=1789571286; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Hl/WIlAfaBabbdRA8g/iLMTmzy3stlDFgCPr5maALGA=;
        b=iWOrvnFdTs074OjMcaAFzHqPgSH2gjMWRQoTZZipXiBqGeLJPjhHq8FDzjwgQBmuVN
         6bHM3VEschqk4/nR409+8vr8QcTZC2LHmETEsuc1rGbdcpUi6n5PWHAd+FTaiQzqrr0L
         iFrfmmGIEW+lpXc7sWVEiGQC6ttieoIJDjYRkskX6ewq+hzdJzU0oSAxftkZ0SNJQjOA
         RzChB7OXLuJdN36DD6isOpWGf+m21X8miYBeSIjMts86nRK8ZXc3L+7tvOElLL0wEbDP
         9w0qbj++FY722VTKY+RjFX+ntvXvGjTvFFEL9i7UA06pRj5EuEUii1lJMNsXPZnJoI+k
         FlBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788966486; x=1789571286;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Hl/WIlAfaBabbdRA8g/iLMTmzy3stlDFgCPr5maALGA=;
        b=X7pAGLLMsYcZsJ9hDf4yA3lKuDzaiuFT1jKRMIhFOZdtger0/505BYoP8DSvc/IGNd
         1dsAC1IIqfaTS97dRw758peC0lCMyWiJgGaDnLMPQW0p8rL63M3sfC4rJS8MfF9CzaS2
         5Y4wwRTbzaTSguJQWJ1vJgJfi4bc4P4mtp0ttZFsRkb1V9ZPKyYrjOEMxJhUI9BktnEo
         AHiPlpapaCGoKMvCO49mblIb8LivIFmpKb4SaklRSQrzVKj1qwZ8O+l/oY7RZ8fNhgNL
         eSGY9kfXry7LfIKZtgHelog7ZOdgJo6mHQ33O94HaDFQe/sCO/xYK0rlLsSJhBQdwxc4
         RYxw==
X-Gm-Message-State: AFuF++kiPGycd5VbL41V4fLUxoabAZigF1tGMZXhw0P3umHUJy/ubKY9
	F212jnYPMj19oYoj+RMI7MsGFlu/FwyDoLMNG7NW0uSowz4p4a7VeT9tWb4Q8b3m
X-Gm-Gg: AYBFou18GkGVMaWbaUpk3uRrVhy613rlm2RqR2Jvq0BNjU+lvQbCqDTfXmXVptAPnT3
	PA/OYap5yt04ShCa0dfHTFIiJ18RnyjYFd58FYpIM8QnyY5BMpld1r+jUgJ+6Ngylb7LOWONbun
	XGsBFmPNpsbLVkChtf9HjJvUOjAbhDl5Ot74F5OOh0KR1/dNIPjqALW2lyiR1FCQxHKEWXn7dtl
	K8E9jUWbC21YallbrK9c8cwzkbbJutGFYkSTeJNEsAsnAPImp18YvZ2vYXo4ZmQvdHLHOU3PkEy
	ru+481LSG/We0DuTIc4XLNa63gGatIq8ZJLq87KT2k9OCQCuvWKQaf1i2MCYADCKaZZ0UnVb7dT
	suxoiYiSqSxAhfvdTojH9Zkw9AIYEs47bc0tWo8zq4I8mVFICqSCqLqdobTj8cJU7yypJcC9oSB
	okXQnYsk5wTq6fPeEmREAGXTxRymdsqf5moXo/JzSQJAoBhwOTPKAb1VlvQJDkl6r5YEo57GnIg
	ljdcTZlLeXC6cd1fDg=
X-Received: by 2002:a17:907:934b:b0:c25:c67d:53cc with SMTP id a640c23a62f3a-c29419fc8f3mr123950566b.8.1788966486130;
        Wed, 09 Sep 2026 08:08:06 -0700 (PDT)
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
Subject: [PATCH v9 00/20] Introduce enablemenant of dom0less
Date: Wed,  9 Sep 2026 17:07:18 +0200
Message-ID: <cover.1788876411.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d62444/1788966486-BE664757-6894119A/10/73395122804
X-purgate-type: spam
X-purgate-size: 6614

This patch series reprensent a bunch of patches necessary to enable common part
of Dom0less.
The stuff necessary to start/launch domains will be introduced separately.

CI tests: https://gitlab.com/xen-project/people/olkur/xen/-/pipelines/2829940455

---
Changes in v9:
 - Address the comments.
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
 xen/arch/arm/irq.c                        |   2 +-
 xen/arch/arm/setup.c                      |   2 -
 xen/arch/ppc/include/asm/setup.h          |   2 -
 xen/arch/riscv/Kconfig                    |   2 +
 xen/arch/riscv/Makefile                   |   4 +
 xen/arch/riscv/aia.c                      |  23 ++
 xen/arch/riscv/aplic-priv.h               |  13 ++
 xen/arch/riscv/aplic.c                    |  41 +++-
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
 xen/arch/riscv/irq.c                      | 261 ++++++++++++++++++++++
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
 xen/drivers/char/console.c                |   2 +-
 xen/include/xen/dom0less-build.h          |   8 +
 xen/include/xen/event.h                   |   2 +-
 xen/include/xen/sched.h                   |   2 +
 xen/include/xen/shared.h                  |   6 +
 xen/include/xen/time.h                    |   5 +
 47 files changed, 1587 insertions(+), 63 deletions(-)
 create mode 100644 xen/arch/riscv/aia.c
 create mode 100644 xen/arch/riscv/device.c
 create mode 100644 xen/arch/riscv/domain-build.c
 create mode 100644 xen/arch/riscv/include/asm/aia.h
 create mode 100644 xen/arch/riscv/include/asm/vaplic.h
 create mode 100644 xen/arch/riscv/vaplic.c

-- 
2.55.0


