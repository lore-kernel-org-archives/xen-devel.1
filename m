Return-Path: <SRS0=xmOv=JR=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74AD7C43461
	for <xen-devel@archiver.kernel.org>; Tue, 20 Apr 2021 07:09:21 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2851A6135F
	for <xen-devel@archiver.kernel.org>; Tue, 20 Apr 2021 07:09:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2851A6135F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.113307.215888 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lYkVS-0006KL-6n; Tue, 20 Apr 2021 07:09:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 113307.215888; Tue, 20 Apr 2021 07:09:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lYkVS-0006K8-0q; Tue, 20 Apr 2021 07:09:10 +0000
Received: by outflank-mailman (input) for mailman id 113307;
 Tue, 20 Apr 2021 07:09:08 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8gRw=JR=arm.com=michal.orzel@srs-us1.protection.inumbo.net>)
 id 1lYkVQ-0006Ja-SC
 for xen-devel@lists.xenproject.org; Tue, 20 Apr 2021 07:09:08 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 2ebb22f9-8efc-4ea3-be65-27adb0a2ee55;
 Tue, 20 Apr 2021 07:09:05 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0C3AB1435;
 Tue, 20 Apr 2021 00:09:05 -0700 (PDT)
Received: from e123311-lin.arm.com (unknown [10.57.29.239])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EBA9B3F85F;
 Tue, 20 Apr 2021 00:09:03 -0700 (PDT)
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
X-Inumbo-ID: 2ebb22f9-8efc-4ea3-be65-27adb0a2ee55
From: Michal Orzel <michal.orzel@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	bertrand.marquis@arm.com
Subject: [PATCH 0/9] xen/arm64: Get rid of READ/WRITE_SYSREG32
Date: Tue, 20 Apr 2021 09:08:44 +0200
Message-Id: <20210420070853.8918-1-michal.orzel@arm.com>
X-Mailer: git-send-email 2.29.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The purpose of this patch series is to remove 32bit helper
macros READ/WRITE_SYSREG32 on arm64 as the idea of them is
not following the latest ARMv8 specification and mrs/msr instructions
are expecting 64bit values.
According to ARM DDI 0487G.a all the AArch64 system registers
are 64bit wide even though many of them have upper 32bit reserved.
This does not mean that in the newer versions of ARMv8 or in the next
architecture, some of the sysregs will get widen.
Also when dealing with system registers we should use register_t
type.

This patch series removes the use of READ/WRITE_SYSREG32
and replaces these calls with READ/WRITE_SYSREG. The change was
splited into several small patches to make the review proces easier.

This patch series focuses on removing READ/WRITE_SYSREG32.
There are still some AArch64 system registers defined as 32bit like cpsr
that should be changed later on. They were not changed as they did not appear
inside READ/WRITE_SYSREG32. The next thing to do is to also get rid of
vreg_emulate_sysreg32.

Michal Orzel (9):
  arm64/vfp: Get rid of READ/WRITE_SYSREG32
  arm/domain: Get rid of READ/WRITE_SYSREG32
  arm/gic: Get rid of READ/WRITE_SYSREG32
  arm/p2m: Get rid of READ/WRITE_SYSREG32
  arm/mm: Get rid of READ/WRITE_SYSREG32
  arm/page: Get rid of READ/WRITE_SYSREG32
  arm/time,vtimer: Get rid of READ/WRITE_SYSREG32
  arm: Change type of hsr to register_t
  xen/arm64: Remove READ/WRITE_SYSREG32 helper macros

 xen/arch/arm/arm64/entry.S            |  2 +-
 xen/arch/arm/arm64/traps.c            |  2 +-
 xen/arch/arm/arm64/vfp.c              | 12 ++--
 xen/arch/arm/arm64/vsysreg.c          |  3 +-
 xen/arch/arm/domain.c                 | 20 +++---
 xen/arch/arm/gic-v3-lpi.c             |  2 +-
 xen/arch/arm/gic-v3.c                 | 96 ++++++++++++++-------------
 xen/arch/arm/mm.c                     |  2 +-
 xen/arch/arm/p2m.c                    |  8 +--
 xen/arch/arm/time.c                   | 28 ++++----
 xen/arch/arm/traps.c                  | 24 ++++---
 xen/arch/arm/vcpreg.c                 | 29 ++++++--
 xen/arch/arm/vtimer.c                 | 10 +--
 xen/include/asm-arm/arm32/processor.h |  2 +-
 xen/include/asm-arm/arm64/processor.h |  5 +-
 xen/include/asm-arm/arm64/sysregs.h   |  5 --
 xen/include/asm-arm/arm64/vfp.h       |  6 +-
 xen/include/asm-arm/domain.h          |  6 +-
 xen/include/asm-arm/gic.h             |  6 +-
 xen/include/asm-arm/hsr.h             | 34 +++++++++-
 xen/include/asm-arm/page.h            |  4 +-
 21 files changed, 179 insertions(+), 127 deletions(-)

-- 
2.29.0


