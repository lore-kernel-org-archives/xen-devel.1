Return-Path: <SRS0=r5xc=HI=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E5F5C433E0
	for <xen-devel@archiver.kernel.org>; Sat,  6 Feb 2021 10:50:11 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D155A64EAD
	for <xen-devel@archiver.kernel.org>; Sat,  6 Feb 2021 10:50:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D155A64EAD
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.82123.151804 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l8LA7-0005ci-LM; Sat, 06 Feb 2021 10:49:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 82123.151804; Sat, 06 Feb 2021 10:49:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l8LA7-0005cb-Hw; Sat, 06 Feb 2021 10:49:59 +0000
Received: by outflank-mailman (input) for mailman id 82123;
 Sat, 06 Feb 2021 10:49:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gVlU=HI=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1l8LA6-0005Wo-9C
 for xen-devel@lists.xenproject.org; Sat, 06 Feb 2021 10:49:58 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 819c7b88-760f-48f6-b9e9-d19095e75ee2;
 Sat, 06 Feb 2021 10:49:47 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id DD5BDAD29;
 Sat,  6 Feb 2021 10:49:46 +0000 (UTC)
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
X-Inumbo-ID: 819c7b88-760f-48f6-b9e9-d19095e75ee2
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1612608587; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=dE46dgUQjvo/vJLSEaUtAdX4bEkarOQCB+4cTFCnP1M=;
	b=QrCfkhZ9kH6dd3p0kbDY5etXQLR7YA6fF7S4sBCvIYn3HsEhD8zDi8/nrJAkjr+5OiuNsO
	qR+sdnPHE3sVhc6pMZV3asmTaXx7t2OGH0pSGgLCV/LVP9RbwfgXXcjXrnMW/fO54ZX1ek
	UhKlmhgCima7ddr5rYrpiYWaVy5Ib8M=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-scsi@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	stable@vger.kernel.org,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Jens Axboe <axboe@kernel.dk>,
	Wei Liu <wei.liu@kernel.org>,
	Paul Durrant <paul@xen.org>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>
Subject: [PATCH 0/7] xen/events: bug fixes and some diagnostic aids
Date: Sat,  6 Feb 2021 11:49:25 +0100
Message-Id: <20210206104932.29064-1-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The first three patches are fixes for XSA-332. The avoid WARN splats
and a performance issue with interdomain events.

Patches 4 and 5 are some additions to event handling in order to add
some per pv-device statistics to sysfs and the ability to have a per
backend device spurious event delay control.

Patches 6 and 7 are minor fixes I had lying around.

Juergen Gross (7):
  xen/events: reset affinity of 2-level event initially
  xen/events: don't unmask an event channel when an eoi is pending
  xen/events: fix lateeoi irq acknowledgement
  xen/events: link interdomain events to associated xenbus device
  xen/events: add per-xenbus device event statistics and settings
  xen/evtch: use smp barriers for user event ring
  xen/evtchn: read producer index only once

 drivers/block/xen-blkback/xenbus.c  |   2 +-
 drivers/net/xen-netback/interface.c |  16 ++--
 drivers/xen/events/events_2l.c      |  20 +++++
 drivers/xen/events/events_base.c    | 133 ++++++++++++++++++++++------
 drivers/xen/evtchn.c                |   6 +-
 drivers/xen/pvcalls-back.c          |   4 +-
 drivers/xen/xen-pciback/xenbus.c    |   2 +-
 drivers/xen/xen-scsiback.c          |   2 +-
 drivers/xen/xenbus/xenbus_probe.c   |  66 ++++++++++++++
 include/xen/events.h                |   7 +-
 include/xen/xenbus.h                |   7 ++
 11 files changed, 217 insertions(+), 48 deletions(-)

-- 
2.26.2


