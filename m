Return-Path: <SRS0=Z24W=FP=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2A85C433FE
	for <xen-devel@archiver.kernel.org>; Fri, 11 Dec 2020 08:53:23 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7D5BB23F2A
	for <xen-devel@archiver.kernel.org>; Fri, 11 Dec 2020 08:53:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7D5BB23F2A
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.50209.88789 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kneAq-0004mX-Du; Fri, 11 Dec 2020 08:53:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 50209.88789; Fri, 11 Dec 2020 08:53:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kneAq-0004mQ-A7; Fri, 11 Dec 2020 08:53:12 +0000
Received: by outflank-mailman (input) for mailman id 50209;
 Fri, 11 Dec 2020 08:53:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XUOP=FP=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kneAp-0004mK-Pv
 for xen-devel@lists.xenproject.org; Fri, 11 Dec 2020 08:53:11 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1e82309c-62e5-46ab-8ccc-55d6c4e42427;
 Fri, 11 Dec 2020 08:53:11 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 36BC8ACBD;
 Fri, 11 Dec 2020 08:53:10 +0000 (UTC)
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
X-Inumbo-ID: 1e82309c-62e5-46ab-8ccc-55d6c4e42427
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1607676790; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=W1if7SktlQyaw0k06QJfTAiDbXDHkI8vZQRt4T89FBQ=;
	b=I64aHuRUrWqVzr2kNc9mF1V9MEivQ/+7hRCyNHqCCt7QbNWKcQc5CHwWJdwu3l19JdHdZ1
	nrqyLMLMHhs4FIO7BZt8lnmKNPRGFQCnJ9pVe7q2aO1vnbuBLtfDiD09z6n1v5+2CkMa2y
	RAGw+7KCkQ5qaLQx8RfMSuTJKyQnnqA=
From: Juergen Gross <jgross@suse.com>
To: torvalds@linux-foundation.org
Cc: linux-kernel@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	boris.ostrovsky@oracle.com
Subject: [GIT PULL] xen: branch for v5.10-rc8
Date: Fri, 11 Dec 2020 09:53:09 +0100
Message-Id: <20201211085309.8128-1-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Linus,

Please git pull the following tag:

 git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-5.10c-rc8-tag

xen: branch for v5.10-rc8

It contains a short series fixing a regression introduced in 5.9 for
running as Xen dom0 on a system with NVMe backed storage.

Thanks.

Juergen

 drivers/block/xen-blkback/blkback.c |  89 +++++---------------------
 drivers/block/xen-blkback/common.h  |   4 +-
 drivers/block/xen-blkback/xenbus.c  |   6 +-
 drivers/xen/grant-table.c           | 123 ++++++++++++++++++++++++++++++++++++
 drivers/xen/unpopulated-alloc.c     |  20 +++---
 drivers/xen/xen-scsiback.c          |  60 ++++--------------
 include/xen/grant_table.h           |  17 +++++
 7 files changed, 182 insertions(+), 137 deletions(-)

Juergen Gross (2):
      xen: add helpers for caching grant mapping pages
      xen: don't use page->lru for ZONE_DEVICE memory

