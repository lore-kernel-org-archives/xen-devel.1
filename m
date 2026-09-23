Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70409C982EA
	for <xen-devel@archiver.kernel.org>; Wed, 23 Sep 2026 10:27:20 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1430099.1652662 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9KBp-0001sw-Te; Wed, 23 Sep 2026 10:27:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1430099.1652662; Wed, 23 Sep 2026 10:27:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9KBp-0001so-QZ; Wed, 23 Sep 2026 10:27:01 +0000
Received: by outflank-mailman (input) for mailman id 1430099;
 Wed, 23 Sep 2026 10:27:00 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1x9KBo-0001sX-CE
 for xen-devel@lists.xenproject.org; Wed, 23 Sep 2026 10:27:00 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x9KBm-005rd8-SJ
 for xen-devel@lists.xenproject.org; Wed, 23 Sep 2026 12:26:58 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6ab3a96f-e002-0a2a0a5209dd-0a2a4501bed6-8
 for <xen-devel@lists.xenproject.org>; Wed, 23 Sep 2026 12:26:58 +0200
Received: from [74.125.225.140] (helo=mail-wm2-f12.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6ab3a972-5984-0a2a45010019-4a7de18cb79a-3
 for <xen-devel@lists.xenproject.org>; Wed, 23 Sep 2026 12:26:58 +0200
Received: by mail-wm2-f12.google.com with SMTP id
 5b1f17b1804b1-49b912e4b11so4254395e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 23 Sep 2026 03:26:58 -0700 (PDT)
Received: from fedora (user-109-243-71-234.play-internet.pl. [109.243.71.234])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49fe0c50da7sm32786515e9.3.2026.09.23.03.26.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Sep 2026 03:26:57 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1790159218; x=1790764018; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p0FbgLBdKZXhIzR4V4rrI9guUPzS0nIxbtBIqIXqrrM=;
        b=N8YPdsc/w8WC0E3un4QxSibcViGJ9u4QaPLw0bb4n8XckURFBL8hJtfGnutcc5T08n
         jViX1X+CJ/7JgPXvMGdnvIkzXHJWc5CMRRkBfPiiBbTQXl7iy9l12vNHiFZlasSF1+3w
         T+rwsyqAJ9ZDKQN9Y9cbbbHwbQTI4cYg5whyKgBKrdcLZvz58SEfOTmEx+QVEU0L1t8Q
         XuF7NJntN42zAjQJm/YkonhLRKit2fC5XK0IANANVjWnRChTpiVL81HtIuauUyKeif82
         LII7LqxwgWtbHcLivzkjQjzWzMuaW1ZgkDgdWY74inBjKVmyZFeKQiNHCM6g2ajfgjxY
         75SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790159218; x=1790764018;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=p0FbgLBdKZXhIzR4V4rrI9guUPzS0nIxbtBIqIXqrrM=;
        b=cC6ZnKRKSEY3DFfK7xRHSpFpe5Pv3IHOrIYP/lC69jET48f6+WeEQkd5OCkfJ0GqyS
         4EcgESW9cd9XMHl4Pjs9Utpki9Rvd13s2QNKpnFkQf2HlfYDbcoWamGkrggzpYeqzKbj
         GtmmKSH5VsPENuGF7eyPgeEgs5Q6jr8X4DT0GsrIcf6a1vSEqmQhSgGIc0GP56m/xhk3
         q5hf9J9sSNRlAjTJ54sNkzO4DhzbkWz57Rt1U9ymfwDVYeHbXAVmCaETd/bdDfkCnp0G
         CIC5k12W2287DbJ5Pd3aUAOgkQIiTr692zwW+t8c2mmb0OG3zjmNZByRL+Lekr1VbOTn
         LVxw==
X-Gm-Message-State: AFuF++lLVcHKx+gX6ddPCUagteQ6pfLK3JlnidejaYhA12oleDztuvGj
	gvJx+g6MtEAKfjMztq76T5cvVNLcj2Wiab/gcgRN64yZgHBbuC93UmSj3TKj1g==
X-Gm-Gg: AYBFou3Lg9h1dsr/uoiXtYeheEQdmTHbnrqUn8dBmxpaY1QF1PcSa8X4f3+ytD5Zlu0
	XDzoH4yEU7uGZT7vCguCko8h108bUqk9wBJ+M50fac0NJy1wVDq54mA5NETiEgKfpNiNgWqlEjW
	y9eVhjg1hE1zyT2IMGKYGR3q4RmaCV1K0Ntz/xAzC0ae2HCcqk0Pw15uWaPllOWJN35+WReqG25
	Y+4GkaylsCYkfUo5ULttb+x3BmMzOdjj6TL+Sf4eO5XChwVAL2krH08ol4OXdavyGMUoZxqd8+T
	xJyM6vOcvXo8ORsYsnn9sKbFX8CFWDLKK99n/0PdQmzdBArxS4bZBle4VBPQTj38uPgWJaCEd9b
	dPRBtofoeCkYi8eFlSMjoRfKRFejENPqwJpB+1bZ+Qa7RJ4JN8Ywyry11DrDanFNMz9kM5KaDCG
	fqTbWCGy58RjPApDpPEoNUjKx479RR8b2BCqIX003PAQK8ot2TwWR8bEpgsLePnQGsDKTNfPHxy
	Sk0zWBPrIUNCWbNAiMwKzO9UdHCa8w8+rX8pK61
X-Received: by 2002:a05:600c:354e:b0:49c:fc6e:a3d8 with SMTP id 5b1f17b1804b1-49fdf13d72cmr28320715e9.23.1790159218172;
        Wed, 23 Sep 2026 03:26:58 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
	Baptiste Le Duc <baptiste.le-duc@vates.tech>,
	Zheng Zhang <zhangzheng@iscas.ac.cn>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: [PATCH v10 0/5] Introduce enablemenant of dom0less
Date: Wed, 23 Sep 2026 12:26:44 +0200
Message-ID: <cover.1790158750.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d62444/1790159218-BE27A757-63234249/10/73395122804
X-purgate-type: spam
X-purgate-size: 3805

This patch series reprensent a bunch of patches necessary to enable common part
of Dom0less.
The stuff necessary to start/launch domains will be introduced separately.

CI tests: https://gitlab.com/xen-project/people/olkur/xen/-/pipelines/2874531386

---
Changes in v10:
 - Address the comments.
 - First 15 patches from v9 were merged to staging.
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

Oleksii Kurochko (5):
  xen/riscv: implement IRQ routing for device passthrough
  xen/riscv: implement init_intc_phandle()
  xen/riscv: initialize RCU, scheduler, and system domains in
    start_xen()
  xen/riscv: provide init_vuart()
  xen/riscv: add initial dom0less infrastructure support

 xen/arch/riscv/Kconfig                    |   2 +
 xen/arch/riscv/Makefile                   |   1 +
 xen/arch/riscv/aplic.c                    |  31 +++
 xen/arch/riscv/device.c                   | 100 +++++++++
 xen/arch/riscv/dom0less-build.c           |  32 +++
 xen/arch/riscv/domain-build.c             |  28 +++
 xen/arch/riscv/include/asm/guest-layout.h |  12 +
 xen/arch/riscv/include/asm/intc.h         |   9 +
 xen/arch/riscv/include/asm/irq.h          |   5 +
 xen/arch/riscv/intc.c                     |  60 +++++
 xen/arch/riscv/irq.c                      | 260 ++++++++++++++++++++++
 xen/arch/riscv/setup.c                    |  12 +
 xen/arch/riscv/vaplic.c                   |  10 +
 13 files changed, 562 insertions(+)
 create mode 100644 xen/arch/riscv/device.c

-- 
2.55.0


