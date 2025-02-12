Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53BEFC02198
	for <xen-devel@archiver.kernel.org>; Wed, 12 Feb 2025 09:19:24 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.886226.1295901 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ti8tn-0001Iw-UI; Wed, 12 Feb 2025 09:19:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 886226.1295901; Wed, 12 Feb 2025 09:19:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ti8tn-0001Ip-Rl; Wed, 12 Feb 2025 09:19:15 +0000
Received: by outflank-mailman (input) for mailman id 886226;
 Wed, 12 Feb 2025 09:19:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=F151=VD=arm.com=luca.fancellu@srs-se1.protection.inumbo.net>)
 id 1ti8tn-0001Ij-9g
 for xen-devel@lists.xenproject.org; Wed, 12 Feb 2025 09:19:15 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 6c544f04-e922-11ef-b3ef-695165c68f79;
 Wed, 12 Feb 2025 10:19:13 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 85F6813D5;
 Wed, 12 Feb 2025 01:19:33 -0800 (PST)
Received: from e125770.cambridge.arm.com (e125770.arm.com [10.1.199.43])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2C41C3F58B;
 Wed, 12 Feb 2025 01:19:11 -0800 (PST)
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
X-Inumbo-ID: 6c544f04-e922-11ef-b3ef-695165c68f79
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 0/2] Prerequisite patches for Arm64 MPU build
Date: Wed, 12 Feb 2025 09:18:58 +0000
Message-Id: <20250212091900.1515563-1-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi all,

in order to build Xen for Arm64 with MPU support, there are few changes to
support the compilation of Arm code without HAS_PASSTHROUGH and some refactoring
around the start_xen for Arm.

Luca Fancellu (2):
  xen/passthrough: Provide stub functions when !HAS_PASSTHROUGH
  xen/arm: Move early mapping operations to new function

 xen/arch/arm/Kconfig                   |  2 +-
 xen/arch/arm/include/asm/grant_table.h |  8 ++++++
 xen/arch/arm/include/asm/mm.h          |  4 +--
 xen/arch/arm/mmu/setup.c               | 35 +++++++++++++++++++++-
 xen/arch/arm/setup.c                   | 30 +------------------
 xen/include/xen/iommu.h                | 40 +++++++++++++++++++++++---
 6 files changed, 82 insertions(+), 37 deletions(-)

-- 
2.34.1


