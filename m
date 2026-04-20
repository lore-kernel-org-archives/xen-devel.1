Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5558F588DE
	for <xen-devel@archiver.kernel.org>; Mon, 20 Apr 2026 14:23:09 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1286045.1567159 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEpWU-00027P-Ma; Mon, 20 Apr 2026 14:22:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1286045.1567159; Mon, 20 Apr 2026 14:22:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEpWU-00027I-K5; Mon, 20 Apr 2026 14:22:50 +0000
Received: by outflank-mailman (input) for mailman id 1286045;
 Mon, 20 Apr 2026 14:22:49 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <luca.fancellu@arm.com>) id 1wEpWT-000273-28
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 14:22:49 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wEpWS-007nwH-BQ
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 16:22:48 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <luca.fancellu@arm.com>)
 id 69e636a9-5cb7-0a2a0a5109dd-0a2a4503ade2-42
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 16:22:48 +0200
Received: from [217.140.110.172] (helo=foss.arm.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTP (eXpurgate 4.56.1)
 (envelope-from <luca.fancellu@arm.com>)
 id 69e636b7-672d-0a2a45030019-d98c6eacb866-1
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 16:22:47 +0200
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3FED51516;
 Mon, 20 Apr 2026 07:22:41 -0700 (PDT)
Received: from e125770.cambridge.arm.com (e125770.arm.com [10.1.199.43])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 71F023F7B4;
 Mon, 20 Apr 2026 07:22:45 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=foss header.d=arm.com header.i="@arm.com" header.h="From:To:Cc:Subject:Date"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1776694966; bh=uEiDQ0S/JRioWm+0hL1oiuLwlrOvukDwyNsY0rQwBYU=;
	h=From:To:Cc:Subject:Date:From;
	b=RBeHS28SayxivulRAXgeGaN2phri66YlWOlzJzxr548TvJOXY6beXc8qTibRzPuJS
	 K39hakzurB8mK3AVy0PxuPKQDKzVbf2FR1g7AiH8RmMBFff1bjIgcwytQE8zIZMLNZ
	 NqSY/ppo3SYR969pRrBCN5fXLSXlGKgoSpGpneg0=
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	"Oleksii Kurochko" <oleksii.kurochko@gmail.com>
Subject: [PATCH v4 0/3] Fifth MPU Series
Date: Mon, 20 Apr 2026 15:22:21 +0100
Message-Id: <20260420142224.1802911-1-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-33051d/1776694968-2AF62938-73E8B252/0/0
X-purgate-type: clean
X-purgate-size: 2019

This series continues to further the ongoing work to introduce support
for MPU systems in Xen.

The patches in this series aim to implement MPU specific p2m functions.

This serie is based on staging 99912d346009fda1e7fb1510c9501fbab17e92a0.

Harry Ramsey (2):
  arm/mpu: Introduce `v8r_el1_msa` device tree property for domains
  arm/mpu: Implement p2m tables

Penny Zheng (1):
  arm/mpu: implement setup_virt_paging for MPU systems

 docs/misc/arm/device-tree/booting.txt       | 14 ++++
 xen/arch/arm/arm64/mpu/p2m.c                | 80 ++++++++++++++++++++-
 xen/arch/arm/dom0less-build.c               |  3 +
 xen/arch/arm/domain.c                       |  4 ++
 xen/arch/arm/include/asm/arm32/mpu.h        |  2 +
 xen/arch/arm/include/asm/arm64/mpu.h        |  2 +
 xen/arch/arm/include/asm/arm64/sysregs.h    |  4 ++
 xen/arch/arm/include/asm/cpufeature.h       | 13 +++-
 xen/arch/arm/include/asm/domain.h           |  4 ++
 xen/arch/arm/include/asm/domain_build.h     |  8 +++
 xen/arch/arm/include/asm/mmu/domain-build.h | 46 ++++++++++++
 xen/arch/arm/include/asm/mpu.h              |  5 ++
 xen/arch/arm/include/asm/mpu/domain-build.h | 27 +++++++
 xen/arch/arm/include/asm/mpu/p2m.h          | 12 ++++
 xen/arch/arm/include/asm/p2m.h              |  5 ++
 xen/arch/arm/include/asm/processor.h        |  8 +++
 xen/arch/arm/mpu/Makefile                   |  1 +
 xen/arch/arm/mpu/arm32/mm.c                 |  5 ++
 xen/arch/arm/mpu/arm64/mm.c                 |  5 ++
 xen/arch/arm/mpu/domain-build.c             | 76 ++++++++++++++++++++
 xen/arch/arm/mpu/p2m.c                      | 78 +++++++++++++++++++-
 xen/include/public/arch-arm.h               |  7 ++
 xen/include/public/domctl.h                 |  4 +-
 23 files changed, 404 insertions(+), 9 deletions(-)
 create mode 100644 xen/arch/arm/include/asm/mmu/domain-build.h
 create mode 100644 xen/arch/arm/include/asm/mpu/domain-build.h
 create mode 100644 xen/arch/arm/mpu/domain-build.c

-- 
2.34.1


