Return-Path: <SRS0=mA2z=H4=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A18AC433DB
	for <xen-devel@archiver.kernel.org>; Fri, 26 Feb 2021 13:17:02 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CA9766186A
	for <xen-devel@archiver.kernel.org>; Fri, 26 Feb 2021 13:17:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CA9766186A
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.90299.170872 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFcz8-00020w-0x; Fri, 26 Feb 2021 13:16:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 90299.170872; Fri, 26 Feb 2021 13:16:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFcz7-00020p-U9; Fri, 26 Feb 2021 13:16:45 +0000
Received: by outflank-mailman (input) for mailman id 90299;
 Fri, 26 Feb 2021 13:16:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ScZz=H4=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1lFcz6-00020k-JP
 for xen-devel@lists.xenproject.org; Fri, 26 Feb 2021 13:16:44 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1aa8f9a8-fdac-4ffe-9899-35469cded309;
 Fri, 26 Feb 2021 13:16:43 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 3B9DDAD74;
 Fri, 26 Feb 2021 13:16:42 +0000 (UTC)
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
X-Inumbo-ID: 1aa8f9a8-fdac-4ffe-9899-35469cded309
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1614345402; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=gPicBlvbf8VxlREpUzvDTkJ45cjDUMZKb5OA8osUY9A=;
	b=nO60bCQ37/R22NjlBvecJb14IxPqjYbIcmh0cm6ukT5HpHO/pzHFMDMwld1TrP3we9GW8d
	KSKfxxideYrGYBKl78uCdMFYrBdkJUHQkDU4SjH8jNdBuPSETwuCI1MvT9CUMOoH01pCRu
	rvtYzo5B9GvFKRG9O3y3dtBmd+bNMys=
From: Juergen Gross <jgross@suse.com>
To: torvalds@linux-foundation.org
Cc: linux-kernel@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	boris.ostrovsky@oracle.com
Subject: [GIT PULL] xen: branch for v5.12-rc1
Date: Fri, 26 Feb 2021 14:16:41 +0100
Message-Id: <20210226131641.4309-1-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Linus,

Please git pull the following tag:

 git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-5.12b-rc1-tag

xen: branch for v5.12-rc1

It contains:

- A small series for Xen event channels adding some sysfs nodes for
  per pv-device settings and statistics, and 2 fixes of theoretical
  problems.

- two minor fixes (one for an unlikely error path, one for a comment).

Thanks.

Juergen

 Documentation/ABI/testing/sysfs-devices-xenbus | 41 ++++++++++++++++
 drivers/xen/events/events_base.c               | 27 ++++++++++-
 drivers/xen/evtchn.c                           | 29 ++++++-----
 drivers/xen/xen-acpi-processor.c               |  3 +-
 drivers/xen/xen-front-pgdir-shbuf.c            | 11 ++++-
 drivers/xen/xenbus/xenbus_probe.c              | 66 ++++++++++++++++++++++++++
 include/xen/xenbus.h                           |  7 +++
 7 files changed, 168 insertions(+), 16 deletions(-)

Jan Beulich (1):
      xen-front-pgdir-shbuf: don't record wrong grant handle upon error

Juergen Gross (3):
      xen/events: add per-xenbus device event statistics and settings
      xen/evtchn: use smp barriers for user event ring
      xen/evtchn: use READ/WRITE_ONCE() for accessing ring indices

Kees Cook (1):
      xen: Replace lkml.org links with lore

