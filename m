Return-Path: <SRS0=1/kX=PH=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63C7FC433EF
	for <xen-devel@archiver.kernel.org>; Tue, 19 Oct 2021 16:09:13 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 23CE76103B
	for <xen-devel@archiver.kernel.org>; Tue, 19 Oct 2021 16:09:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 23CE76103B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.213371.371551 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcrfY-000714-NL; Tue, 19 Oct 2021 16:08:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 213371.371551; Tue, 19 Oct 2021 16:08:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcrfY-00070x-KK; Tue, 19 Oct 2021 16:08:52 +0000
Received: by outflank-mailman (input) for mailman id 213371;
 Tue, 19 Oct 2021 16:08:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XJzt=PH=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1mcrfX-00070r-RY
 for xen-devel@lists.xenproject.org; Tue, 19 Oct 2021 16:08:51 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id a12943d4-a8b9-4cb6-8e80-eb5c673e7b72;
 Tue, 19 Oct 2021 16:08:50 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DB7D22F;
 Tue, 19 Oct 2021 09:08:49 -0700 (PDT)
Received: from e109506.cambridge.arm.com (e109506.cambridge.arm.com
 [10.1.199.62])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6E46A3F694;
 Tue, 19 Oct 2021 09:08:48 -0700 (PDT)
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
X-Inumbo-ID: a12943d4-a8b9-4cb6-8e80-eb5c673e7b72
From: Bertrand Marquis <bertrand.marquis@arm.com>
To: xen-devel@lists.xenproject.org
Cc: iwj@xenproject.org,
	Oleksandr_Andrushchenko@epam.com,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Paul Durrant <paul@xen.org>
Subject: [PATCH v2 0/1] Fixes: PCI devices passthrough on Arm
Date: Tue, 19 Oct 2021 17:08:27 +0100
Message-Id: <cover.1634659471.git.bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch serie is a follow-up after various findings on d59168dc05
("xen/arm: Enable the existing x86 virtual PCI support for ARM") as of
agreed in [1].

It does the following:
- enable vpci_add_handlers on x86 and not only on arm
- remove __hwdom_init flag for vpci_add_handlers
- add missing vpci handler cleanup in error path during pci_device_add
  and pci_device_remove

[1] https://marc.info/?l=xen-devel&m=163455502020100&w=2

In the second version of the serie, the 3 patches have been merged into
one single patch.

Bertrand Marquis (1):
  xen/pci: Install vpci handlers on x86 and fix exit path

 xen/arch/arm/xen.lds.S        | 9 +--------
 xen/arch/x86/xen.lds.S        | 9 +--------
 xen/drivers/passthrough/pci.c | 8 ++++----
 xen/drivers/vpci/vpci.c       | 2 +-
 xen/include/xen/vpci.h        | 2 ++
 5 files changed, 9 insertions(+), 21 deletions(-)

-- 
2.25.1


