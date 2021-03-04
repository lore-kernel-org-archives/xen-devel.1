Return-Path: <SRS0=L0Gu=IC=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA38CC433E0
	for <xen-devel@archiver.kernel.org>; Thu,  4 Mar 2021 11:01:06 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 84D0764F2B
	for <xen-devel@archiver.kernel.org>; Thu,  4 Mar 2021 11:01:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 84D0764F2B
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.93189.175876 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lHliz-0001fp-E5; Thu, 04 Mar 2021 11:00:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 93189.175876; Thu, 04 Mar 2021 11:00:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lHliz-0001fi-9M; Thu, 04 Mar 2021 11:00:57 +0000
Received: by outflank-mailman (input) for mailman id 93189;
 Thu, 04 Mar 2021 11:00:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ljEZ=IC=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1lHlix-0001fX-Io
 for xen-devel@lists.xenproject.org; Thu, 04 Mar 2021 11:00:55 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id dfdf0f78-ddf7-47c3-8db2-f60b05fa3060;
 Thu, 04 Mar 2021 11:00:55 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 2F411AE1F;
 Thu,  4 Mar 2021 11:00:54 +0000 (UTC)
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
X-Inumbo-ID: dfdf0f78-ddf7-47c3-8db2-f60b05fa3060
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1614855654; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=WXqHPe+Ifnv5Vf7F0Ne6BsKMUPRrUe3g+NOcm0DY8Po=;
	b=Wb2k58m2tPyw8HJWGN4OpsnluwahwTkXLlCH83ups3omce9KolKDdUZKnr/01mnQARefe6
	zdjprHYQ/al8PYmwTYY3Rq8ttMQj/0SNMlm663huu2nT5pLiph5X/3ZaxSkSR750/lMIrJ
	7ERgKTScfUWv8MxgMKMRzBnsI93uAhQ=
From: Juergen Gross <jgross@suse.com>
To: torvalds@linux-foundation.org
Cc: linux-kernel@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	boris.ostrovsky@oracle.com
Subject: [GIT PULL] xen: branch for v5.12-rc2
Date: Thu,  4 Mar 2021 12:00:53 +0100
Message-Id: <20210304110053.8787-1-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Linus,

Please git pull the following tag:

 git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-5.12b-rc2-tag

xen: branch for v5.12-rc2

It contains fixes for 2 security issues (XSA-367 and XSA-369).


Thanks.

Juergen

 arch/arm/xen/p2m.c                | 35 ++++++++++++++++++++++---
 arch/x86/include/asm/xen/page.h   | 12 +++++++++
 arch/x86/xen/p2m.c                | 54 ++++++++++++++++++++++++++++++++++-----
 arch/x86/xen/setup.c              | 25 +++---------------
 drivers/net/xen-netback/netback.c | 12 ++++++++-
 5 files changed, 104 insertions(+), 34 deletions(-)

Jan Beulich (2):
      Xen/gnttab: handle p2m update errors on a per-slot basis
      xen-netback: respect gnttab_map_refs()'s return value

Juergen Gross (1):
      xen: fix p2m size in dom0 for disabled memory hotplug case

