Return-Path: <SRS0=aFvL=OS=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1A69C433EF
	for <xen-devel@archiver.kernel.org>; Tue, 28 Sep 2021 16:32:43 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ADD6561213
	for <xen-devel@archiver.kernel.org>; Tue, 28 Sep 2021 16:32:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org ADD6561213
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.198138.351473 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVG1v-0007RM-Bk; Tue, 28 Sep 2021 16:32:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 198138.351473; Tue, 28 Sep 2021 16:32:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVG1v-0007RF-8g; Tue, 28 Sep 2021 16:32:31 +0000
Received: by outflank-mailman (input) for mailman id 198138;
 Tue, 28 Sep 2021 16:32:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hUli=OS=arm.com=luca.fancellu@srs-us1.protection.inumbo.net>)
 id 1mVG1t-0007R3-Oz
 for xen-devel@lists.xenproject.org; Tue, 28 Sep 2021 16:32:29 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id bdecb2e3-0929-4951-ac8f-c2a56f2aacaa;
 Tue, 28 Sep 2021 16:32:27 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7ECA1D6E;
 Tue, 28 Sep 2021 09:32:27 -0700 (PDT)
Received: from e125770.cambridge.arm.com (e125770.cambridge.arm.com
 [10.1.199.61])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E9E2E3F718;
 Tue, 28 Sep 2021 09:32:25 -0700 (PDT)
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
X-Inumbo-ID: bdecb2e3-0929-4951-ac8f-c2a56f2aacaa
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com,
	wei.chen@arm.com,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Wei Liu <wl@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v3 0/3] arm/efi: Add dom0less support to UEFI boot
Date: Tue, 28 Sep 2021 17:32:06 +0100
Message-Id: <20210928163209.49611-1-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.17.1

This serie introduces a way to start a dom0less setup when Xen is booting as EFI
application.
Using the device tree it's now possible to fetch from the disk and load in
memory all the modules needed to start any domU defined in the DT.
Dom0less for now is supported only by the arm architecture.

Luca Fancellu (3):
  arm/efi: Introduce uefi,cfg-load DT property
  arm/efi: Use dom0less configuration when using EFI boot
  arm/efi: load dom0 modules from DT using UEFI

 docs/misc/arm/device-tree/booting.txt |  37 +++
 docs/misc/efi.pandoc                  | 263 +++++++++++++++++++
 xen/arch/arm/efi/efi-boot.h           | 361 +++++++++++++++++++++++++-
 xen/arch/x86/efi/efi-boot.h           |   6 +
 xen/common/efi/boot.c                 |  54 ++--
 5 files changed, 696 insertions(+), 25 deletions(-)

-- 
2.17.1


