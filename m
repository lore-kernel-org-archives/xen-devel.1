Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A226C4321E
	for <xen-devel@archiver.kernel.org>; Mon,  5 Dec 2022 02:58:30 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.453110.710760 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p21gI-0008Oh-74; Mon, 05 Dec 2022 02:58:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 453110.710760; Mon, 05 Dec 2022 02:58:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p21gI-0008OR-0C; Mon, 05 Dec 2022 02:58:10 +0000
Received: by outflank-mailman (input) for mailman id 453110;
 Mon, 05 Dec 2022 02:58:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IUlJ=4D=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1p21gG-0008OK-F9
 for xen-devel@lists.xenproject.org; Mon, 05 Dec 2022 02:58:08 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id a36f7fc6-7448-11ed-8fd2-01056ac49cbb;
 Mon, 05 Dec 2022 03:58:06 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 34FEA23A;
 Sun,  4 Dec 2022 18:58:11 -0800 (PST)
Received: from a015966.shanghai.arm.com (a015966.shanghai.arm.com
 [10.169.190.24])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 625653F73D;
 Sun,  4 Dec 2022 18:58:02 -0800 (PST)
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
X-Inumbo-ID: a36f7fc6-7448-11ed-8fd2-01056ac49cbb
From: Henry Wang <Henry.Wang@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Henry Wang <Henry.Wang@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH 0/3] Memory region overlap check in device tree
Date: Mon,  5 Dec 2022 10:57:50 +0800
Message-Id: <20221205025753.2178965-1-Henry.Wang@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As we are having more and more types of memory region defined in the
device tree, it is necessary to add the overlap check of these memory
regions in Xen, because such check will help user to identify the
misconfiguration in the device tree at the early stage of boot time.

The first patch introduces the basic memory overlap check mechanism,
and does the memory check for memory regions in bootinfo.reserved_mem.
Following patches extend the overlap check to include bootmodules and
EfiACPIReclaimMemory.

Henry Wang (3):
  xen/arm: Add memory overlap check for bootinfo.reserved_mem
  xen/arm: Extend the memory overlap check to include bootmodules
  xen/arm: Extend the memory overlap check to include
    EfiACPIReclaimMemory

 xen/arch/arm/bootfdt.c           | 13 +++--
 xen/arch/arm/efi/efi-boot.h      | 10 +++-
 xen/arch/arm/include/asm/setup.h |  2 +
 xen/arch/arm/setup.c             | 90 ++++++++++++++++++++++++++++++++
 4 files changed, 106 insertions(+), 9 deletions(-)

-- 
2.25.1


