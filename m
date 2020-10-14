Return-Path: <SRS0=XJfI=DV=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F406C433E7
	for <xen-devel@archiver.kernel.org>; Wed, 14 Oct 2020 05:39:45 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0D36321582
	for <xen-devel@archiver.kernel.org>; Wed, 14 Oct 2020 05:39:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="t7YOMgrs"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0D36321582
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.6447.17194 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kSZVQ-0000sC-Ga; Wed, 14 Oct 2020 05:39:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 6447.17194; Wed, 14 Oct 2020 05:39:20 +0000
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
	id 1kSZVQ-0000s5-BV; Wed, 14 Oct 2020 05:39:20 +0000
Received: by outflank-mailman (input) for mailman id 6447;
 Wed, 14 Oct 2020 05:39:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+Hv6=DV=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kSZVP-0000rZ-JS
 for xen-devel@lists.xenproject.org; Wed, 14 Oct 2020 05:39:19 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id aa04ba88-a413-49ee-ae1e-a18fc182d58f;
 Wed, 14 Oct 2020 05:39:18 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 9BFF4AFCC;
 Wed, 14 Oct 2020 05:39:17 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=+Hv6=DV=suse.com=jgross@srs-us1.protection.inumbo.net>)
	id 1kSZVP-0000rZ-JS
	for xen-devel@lists.xenproject.org; Wed, 14 Oct 2020 05:39:19 +0000
X-Inumbo-ID: aa04ba88-a413-49ee-ae1e-a18fc182d58f
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id aa04ba88-a413-49ee-ae1e-a18fc182d58f;
	Wed, 14 Oct 2020 05:39:18 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1602653957;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=rwKx1/PQRXwtK7KwNu38C2wugXfvHcRdY2flAxFD91w=;
	b=t7YOMgrsuNovYjNiiI0fbC0zzmSIKOSylwsD6FLibphK3Nq6v+FM3K1dkbOe4Suj/S1bBV
	1GdGihQbgiOVU7PIFd8uDj79bEPUVhfVxNIP5V/qliYP/6QXR0I3+MFiOisvMbdBY0is8z
	0qFl/BkRNtbTF4VAOdQeE8Gcjv5FW1s=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 9BFF4AFCC;
	Wed, 14 Oct 2020 05:39:17 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: torvalds@linux-foundation.org
Cc: linux-kernel@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	boris.ostrovsky@oracle.com
Subject: [GIT PULL] xen: branch for v5.10-rc1
Date: Wed, 14 Oct 2020 07:39:17 +0200
Message-Id: <20201014053917.19251-1-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Linus,

Please git pull the following tag:

 git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-5.10b-rc1-tag

xen: branch for v5.10-rc1

It contains:

- 2 small cleanup patches

- A fix for avoiding error messages when initializing MCA banks in a
  Xen dom0

- A small series for converting the Xen gntdev driver to use
  pin_user_pages*() instead of get_user_pages*()

- An intermediate fix for running as a Xen guest on Arm with KPTI
  enabled (the final solution will need a new Xen functionality)


Thanks.

Juergen

 arch/arm/include/asm/xen/page.h   |  5 +++++
 arch/arm/xen/enlighten.c          |  6 ++++--
 arch/arm64/include/asm/xen/page.h |  6 ++++++
 arch/x86/xen/enlighten_pv.c       |  9 +++++++++
 arch/x86/xen/mmu_pv.c             |  2 +-
 drivers/xen/gntdev.c              | 17 +++++++++--------
 drivers/xen/pvcalls-front.c       |  2 +-
 7 files changed, 35 insertions(+), 12 deletions(-)

Hui Su (1):
      x86/xen: Fix typo in xen_pagetable_p2m_free()

Jing Xiangfeng (1):
      xen: remove redundant initialization of variable ret

Juergen Gross (1):
      x86/xen: disable Firmware First mode for correctable memory errors

Souptick Joarder (2):
      xen/gntdev.c: Mark pages as dirty
      xen/gntdev.c: Convert get_user_pages*() to pin_user_pages*()

Stefano Stabellini (1):
      xen/arm: do not setup the runstate info page if kpti is enabled

