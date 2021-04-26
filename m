Return-Path: <SRS0=fknR=JX=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32315C433B4
	for <xen-devel@archiver.kernel.org>; Mon, 26 Apr 2021 16:22:10 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9F02661158
	for <xen-devel@archiver.kernel.org>; Mon, 26 Apr 2021 16:22:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9F02661158
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.117768.223644 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lb3zS-0004xE-4P; Mon, 26 Apr 2021 16:21:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 117768.223644; Mon, 26 Apr 2021 16:21:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lb3zS-0004x7-1N; Mon, 26 Apr 2021 16:21:42 +0000
Received: by outflank-mailman (input) for mailman id 117768;
 Mon, 26 Apr 2021 16:21:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TQk4=JX=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
 id 1lb3zP-0004x2-UK
 for xen-devel@lists.xenproject.org; Mon, 26 Apr 2021 16:21:39 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 4a6c3450-1979-4d21-aae2-ed2e87b604ff;
 Mon, 26 Apr 2021 16:21:38 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 709661FB;
 Mon, 26 Apr 2021 09:21:37 -0700 (PDT)
Received: from e109506.cambridge.arm.com (e109506.cambridge.arm.com
 [10.1.199.1])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AF2543F73B;
 Mon, 26 Apr 2021 09:21:35 -0700 (PDT)
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
X-Inumbo-ID: 4a6c3450-1979-4d21-aae2-ed2e87b604ff
From: Rahul Singh <rahul.singh@arm.com>
To: xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com,
	rahul.singh@arm.com,
	Jan Beulich <jbeulich@suse.com>,
	Paul Durrant <paul@xen.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Daniel De Graaf <dgdegra@tycho.nsa.gov>
Subject: [PATCH v3 0/3] xen/pci: Make PCI passthrough code non-x86 specific
Date: Mon, 26 Apr 2021 17:21:24 +0100
Message-Id: <cover.1619453100.git.rahul.singh@arm.com>
X-Mailer: git-send-email 2.17.1

This patch series is preparatory work to implement the PCI passthrough support
for the ARM architecture.

Rahul Singh (3):
  xen/iommu: Move iommu_update_ire_from_msi(..) to xen/iommu.h
  xen/pci: Refactor PCI MSI intercept related code
  xen/pci: Refactor MSI code that implements MSI functionality within
    XEN

 xen/arch/x86/Kconfig                    |  1 +
 xen/drivers/passthrough/Makefile        |  1 +
 xen/drivers/passthrough/msi-intercept.c | 93 +++++++++++++++++++++++++
 xen/drivers/passthrough/pci.c           | 57 +++------------
 xen/drivers/pci/Kconfig                 |  4 ++
 xen/drivers/vpci/Makefile               |  3 +-
 xen/drivers/vpci/header.c               | 19 ++---
 xen/drivers/vpci/msix.c                 | 25 +++++++
 xen/drivers/vpci/vpci.c                 |  3 +-
 xen/include/xen/iommu.h                 | 13 +++-
 xen/include/xen/msi-intercept.h         | 55 +++++++++++++++
 xen/include/xen/pci.h                   | 11 +--
 xen/include/xen/vpci.h                  | 23 ++++++
 xen/xsm/flask/hooks.c                   |  8 +--
 14 files changed, 241 insertions(+), 75 deletions(-)
 create mode 100644 xen/drivers/passthrough/msi-intercept.c
 create mode 100644 xen/include/xen/msi-intercept.h

-- 
2.17.1


