Return-Path: <SRS0=LTrL=DM=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F3D2C46466
	for <xen-devel@archiver.kernel.org>; Mon,  5 Oct 2020 16:06:05 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0F15E206CB
	for <xen-devel@archiver.kernel.org>; Mon,  5 Oct 2020 16:06:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0F15E206CB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.3052.8822 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kPSze-0004Ze-75; Mon, 05 Oct 2020 16:05:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 3052.8822; Mon, 05 Oct 2020 16:05:42 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kPSze-0004ZX-35; Mon, 05 Oct 2020 16:05:42 +0000
Received: by outflank-mailman (input) for mailman id 3052;
 Mon, 05 Oct 2020 16:05:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fzGi=DM=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1kPSzc-0004ZN-D5
 for xen-devel@lists.xenproject.org; Mon, 05 Oct 2020 16:05:40 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id e39f64f3-d2b4-4e74-a08e-109a9fa05756;
 Mon, 05 Oct 2020 16:05:39 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C443F11D4;
 Mon,  5 Oct 2020 09:05:38 -0700 (PDT)
Received: from e109506-lin.cambridge.arm.com (e109506-lin.cambridge.arm.com
 [10.1.198.23])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F0E753F66B;
 Mon,  5 Oct 2020 09:05:37 -0700 (PDT)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=fzGi=DM=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
	id 1kPSzc-0004ZN-D5
	for xen-devel@lists.xenproject.org; Mon, 05 Oct 2020 16:05:40 +0000
X-Inumbo-ID: e39f64f3-d2b4-4e74-a08e-109a9fa05756
Received: from foss.arm.com (unknown [217.140.110.172])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTP
	id e39f64f3-d2b4-4e74-a08e-109a9fa05756;
	Mon, 05 Oct 2020 16:05:39 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C443F11D4;
	Mon,  5 Oct 2020 09:05:38 -0700 (PDT)
Received: from e109506-lin.cambridge.arm.com (e109506-lin.cambridge.arm.com [10.1.198.23])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F0E753F66B;
	Mon,  5 Oct 2020 09:05:37 -0700 (PDT)
From: Bertrand Marquis <bertrand.marquis@arm.com>
To: xen-devel@lists.xenproject.org
Cc: jgross@suse.com,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH 0/2] tools: solve gcc 10 compilation issues
Date: Mon,  5 Oct 2020 17:02:47 +0100
Message-Id: <cover.1601913536.git.bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.17.1

Solve various issues in tools when compiling using a gcc version 10.0 or
greater.

Bertrand Marquis (2):
  tools: use memcpy instead of strncpy in getBridge
  tool/libx: Fix libxenlight gcc warning

 tools/libs/stat/xenstat_linux.c | 9 +++++++--
 tools/libxl/libxl_mem.c         | 2 +-
 2 files changed, 8 insertions(+), 3 deletions(-)

-- 
2.17.1


