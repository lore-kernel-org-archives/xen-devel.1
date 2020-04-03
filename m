Return-Path: <SRS0=kYra=5T=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 939A3C43331
	for <xen-devel@archiver.kernel.org>; Fri,  3 Apr 2020 15:55:17 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6B43A206F8
	for <xen-devel@archiver.kernel.org>; Fri,  3 Apr 2020 15:55:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6B43A206F8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jKOes-0005jv-PJ; Fri, 03 Apr 2020 15:55:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=6vR8=5T=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jKOer-0005jq-9l
 for xen-devel@lists.xenproject.org; Fri, 03 Apr 2020 15:55:01 +0000
X-Inumbo-ID: 78e506da-75c3-11ea-bd40-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 78e506da-75c3-11ea-bd40-12813bfff9fa;
 Fri, 03 Apr 2020 15:55:00 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 9FE77ABE9;
 Fri,  3 Apr 2020 15:54:58 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: torvalds@linux-foundation.org
Subject: [GIT PULL] xen: branch for v5.7-rc1
Date: Fri,  3 Apr 2020 17:54:57 +0200
Message-Id: <20200403155457.27562-1-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
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

 git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-5.7-rc1-tag

xen: branch for v5.7-rc1

It contains:

- a cleanup patch removing an unused function
- a small fix for the xen pciback driver
- a series for making the unwinder hyppay with the Xen PV guest idle
  task stacks

Thanks.

Juergen

 arch/x86/xen/smp_pv.c                |   3 +-
 arch/x86/xen/xen-head.S              |  18 ++++-
 drivers/xen/xen-pciback/conf_space.c |   2 +-
 drivers/xen/xen-pciback/conf_space.h |   8 +--
 drivers/xen/xenbus/xenbus_client.c   | 126 ++++++++++++-----------------------
 include/xen/xenbus.h                 |   7 --
 6 files changed, 65 insertions(+), 99 deletions(-)

Juergen Gross (1):
      xen/xenbus: remove unused xenbus_map_ring()

Marek Marczykowski-Górecki (1):
      xen-pciback: fix INTERRUPT_TYPE_* defines

Miroslav Benes (2):
      x86/xen: Make the boot CPU idle task reliable
      x86/xen: Make the secondary CPU idle tasks reliable

