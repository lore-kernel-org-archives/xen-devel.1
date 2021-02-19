Return-Path: <SRS0=5oJc=HV=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7A9AC433E9
	for <xen-devel@archiver.kernel.org>; Fri, 19 Feb 2021 15:40:56 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 60E1664E60
	for <xen-devel@archiver.kernel.org>; Fri, 19 Feb 2021 15:40:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 60E1664E60
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.86931.163547 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lD7ta-0002Fp-8W; Fri, 19 Feb 2021 15:40:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 86931.163547; Fri, 19 Feb 2021 15:40:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lD7ta-0002Fa-10; Fri, 19 Feb 2021 15:40:42 +0000
Received: by outflank-mailman (input) for mailman id 86931;
 Fri, 19 Feb 2021 15:40:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jZy7=HV=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1lD7tY-0002F6-7h
 for xen-devel@lists.xenproject.org; Fri, 19 Feb 2021 15:40:40 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fc0cb927-d5f2-4efb-9a95-43ea58351532;
 Fri, 19 Feb 2021 15:40:38 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 17FFFAED2;
 Fri, 19 Feb 2021 15:40:38 +0000 (UTC)
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
X-Inumbo-ID: fc0cb927-d5f2-4efb-9a95-43ea58351532
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1613749238; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=MHxag6mUxa0dootKy2U+lJVR2k8UiaKbpKfVyKM/EZ4=;
	b=jjsdawg1KZYf+nItuzbxyqaXeDKHiLv6YoeaErBu4tJer4zXSytLV7xk92MixdQUnvPRED
	iXUz6DrGfs47sGkqcF453+W0zBJW6WReMsknyI3WKg9iAusmhGukYAazPdCEFJ6k8mopm3
	ZGwTClr2lapCAwa2bLNQ99xzaXwou3k=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-block@vger.kernel.org,
	linux-scsi@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	stable@vger.kernel.org,
	Wei Liu <wei.liu@kernel.org>,
	Paul Durrant <paul@xen.org>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Jens Axboe <axboe@kernel.dk>
Subject: [PATCH v3 0/8] xen/events: bug fixes and some diagnostic aids
Date: Fri, 19 Feb 2021 16:40:22 +0100
Message-Id: <20210219154030.10892-1-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The first four patches are fixes for XSA-332. The avoid WARN splats
and a performance issue with interdomain events.

Patches 5 and 6 are some additions to event handling in order to add
some per pv-device statistics to sysfs and the ability to have a per
backend device spurious event delay control.

Patches 7 and 8 are minor fixes I had lying around.

Juergen Gross (8):
  xen/events: reset affinity of 2-level event when tearing it down
  xen/events: don't unmask an event channel when an eoi is pending
  xen/events: avoid handling the same event on two cpus at the same time
  xen/netback: fix spurious event detection for common event case
  xen/events: link interdomain events to associated xenbus device
  xen/events: add per-xenbus device event statistics and settings
  xen/evtchn: use smp barriers for user event ring
  xen/evtchn: use READ/WRITE_ONCE() for accessing ring indices

 .../ABI/testing/sysfs-devices-xenbus          |  41 ++++
 drivers/block/xen-blkback/xenbus.c            |   2 +-
 drivers/net/xen-netback/interface.c           |  24 ++-
 drivers/xen/events/events_2l.c                |  22 +-
 drivers/xen/events/events_base.c              | 199 +++++++++++++-----
 drivers/xen/events/events_fifo.c              |   7 -
 drivers/xen/events/events_internal.h          |  14 +-
 drivers/xen/evtchn.c                          |  29 ++-
 drivers/xen/pvcalls-back.c                    |   4 +-
 drivers/xen/xen-pciback/xenbus.c              |   2 +-
 drivers/xen/xen-scsiback.c                    |   2 +-
 drivers/xen/xenbus/xenbus_probe.c             |  66 ++++++
 include/xen/events.h                          |   7 +-
 include/xen/xenbus.h                          |   7 +
 14 files changed, 327 insertions(+), 99 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-devices-xenbus

-- 
2.26.2


