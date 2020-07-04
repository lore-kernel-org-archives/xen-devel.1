Return-Path: <SRS0=Z3FV=AP=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1248C433E0
	for <xen-devel@archiver.kernel.org>; Sat,  4 Jul 2020 06:57:39 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 89DBC207CD
	for <xen-devel@archiver.kernel.org>; Sat,  4 Jul 2020 06:57:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 89DBC207CD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jrc6j-0006uw-Sd; Sat, 04 Jul 2020 06:57:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ydgZ=AP=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jrc6i-0006ur-Hc
 for xen-devel@lists.xenproject.org; Sat, 04 Jul 2020 06:57:04 +0000
X-Inumbo-ID: 90afbfec-bdc3-11ea-b7bb-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 90afbfec-bdc3-11ea-b7bb-bc764e2007e4;
 Sat, 04 Jul 2020 06:57:03 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 0F0BAAB89;
 Sat,  4 Jul 2020 06:57:03 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: torvalds@linux-foundation.org
Subject: [GIT PULL] xen: branch for v5.8-rc4
Date: Sat,  4 Jul 2020 08:57:02 +0200
Message-Id: <20200704065702.3073-1-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com,
 linux-kernel@vger.kernel.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Linus,

Please git pull the following tag:

 git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-5.8b-rc4-tag

xen: branch for v5.8-rc4

It contains only 1 small cleanup patch for ARM and two patches for the
xenbus driver fixinf latent problems (large stack allocations and bad
return code settings).

Thanks.

Juergen

 arch/arm/xen/enlighten.c           |   1 -
 drivers/xen/xenbus/xenbus_client.c | 167 ++++++++++++++++++-------------------
 2 files changed, 81 insertions(+), 87 deletions(-)

Juergen Gross (2):
      xen/xenbus: avoid large structs and arrays on the stack
      xen/xenbus: let xenbus_map_ring_valloc() return errno values only

Xiaofei Tan (1):
      arm/xen: remove the unused macro GRANT_TABLE_PHYSADDR

