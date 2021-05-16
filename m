Return-Path: <SRS0=ggTK=KL=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BACCC43460
	for <xen-devel@archiver.kernel.org>; Sun, 16 May 2021 06:30:46 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BC56660C3E
	for <xen-devel@archiver.kernel.org>; Sun, 16 May 2021 06:30:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BC56660C3E
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.127897.240261 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1liAIG-0006hf-Cf; Sun, 16 May 2021 06:30:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 127897.240261; Sun, 16 May 2021 06:30:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1liAIG-0006hY-9O; Sun, 16 May 2021 06:30:28 +0000
Received: by outflank-mailman (input) for mailman id 127897;
 Sun, 16 May 2021 06:30:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=E7ce=KL=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1liAIE-0006Qh-Re
 for xen-devel@lists.xenproject.org; Sun, 16 May 2021 06:30:26 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fd3d4ce5-ec5e-4272-b28f-c559394c2c4a;
 Sun, 16 May 2021 06:30:21 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A8183AFC8;
 Sun, 16 May 2021 06:30:20 +0000 (UTC)
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
X-Inumbo-ID: fd3d4ce5-ec5e-4272-b28f-c559394c2c4a
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1621146620; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=v8til0hEEG2JW3BLQ4jQ4a/ff0IVW6Ge5T7xlA6EHMc=;
	b=ga/I6o3hbtGVeR9bAnm8oiI+abMWn1V+1mrd0MCPjkvsQR7mVvBltKDjdXUrzkP9Hvg3nQ
	asO0As6A/ikJO4JKcLrpBSIR0yOrQ+lcCVpsAm8F6PzotWAoyLPmI2ZJ8QVprVr0uk3A0z
	MXXIt3BS4o7OrY+pEQgfLypxEi1jPYI=
From: Juergen Gross <jgross@suse.com>
To: torvalds@linux-foundation.org
Cc: linux-kernel@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	boris.ostrovsky@oracle.com
Subject: [GIT PULL] xen: branch for v5.13-rc2
Date: Sun, 16 May 2021 08:30:20 +0200
Message-Id: <20210516063020.3349-1-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Linus,

Please git pull the following tag:

 git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-5.13b-rc2-tag

xen: branch for v5.13-rc2

It contains the following patches:

- 2 patches for error path fixes
- a small series for fixing a regression with swiotlb with Xen on Arm


Thanks.

Juergen

 arch/arm/xen/mm.c               | 20 +++++++-------------
 arch/arm64/mm/init.c            |  3 ++-
 drivers/xen/gntdev.c            |  4 +++-
 drivers/xen/swiotlb-xen.c       |  5 +++++
 drivers/xen/unpopulated-alloc.c |  4 +++-
 include/xen/arm/swiotlb-xen.h   | 15 ++++++++++++++-
 6 files changed, 34 insertions(+), 17 deletions(-)

Christoph Hellwig (1):
      arm64: do not set SWIOTLB_NO_FORCE when swiotlb is required

Juergen Gross (2):
      xen/gntdev: fix gntdev_mmap() error exit path
      Merge tag 'for-linus-5.13b-rc2-tag' of gitolite.kernel.org:pub/scm/linux/kernel/git/xen/tip into __for-linus-5.13b-rc2-tag

Stefano Stabellini (2):
      xen/arm: move xen_swiotlb_detect to arm/swiotlb-xen.h
      xen/swiotlb: check if the swiotlb has already been initialized

Zhen Lei (1):
      xen/unpopulated-alloc: fix error return code in fill_list()

