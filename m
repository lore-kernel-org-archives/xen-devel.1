Return-Path: <SRS0=5pkY=5Z=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF042C2BB55
	for <xen-devel@archiver.kernel.org>; Thu,  9 Apr 2020 14:13:10 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8526720857
	for <xen-devel@archiver.kernel.org>; Thu,  9 Apr 2020 14:13:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8526720857
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jMXvD-0002nl-QN; Thu, 09 Apr 2020 14:12:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Lf15=5Z=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jMXvC-0002nf-Jx
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2020 14:12:46 +0000
X-Inumbo-ID: 2ef84fb6-7a6c-11ea-b4f4-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2ef84fb6-7a6c-11ea-b4f4-bc764e2007e4;
 Thu, 09 Apr 2020 14:12:46 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id CD799AD6C;
 Thu,  9 Apr 2020 14:12:43 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Subject: [PATCH 0/3] mini-os: fix several double frees and memory leaks
Date: Thu,  9 Apr 2020 16:12:37 +0200
Message-Id: <20200409141240.28876-1-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
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
Cc: Juergen Gross <jgross@suse.com>, samuel.thibault@ens-lyon.org, wl@xen.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

This series fixes two double free() introduced by suspend/resume
patches and several memory leaks.

Juergen Gross (3):
  mini-os: fix double free() in netfront
  mini-os: fix double free() in xenbus
  mini-os: fix several memory leaks related to xenbus

 blkfront.c       |  4 ++--
 console/xenbus.c |  2 +-
 fbfront.c        |  4 ++--
 netfront.c       |  4 +---
 pcifront.c       | 28 +++++++++++++---------------
 shutdown.c       |  2 +-
 xenbus/xenbus.c  |  8 ++++++--
 7 files changed, 26 insertions(+), 26 deletions(-)

-- 
2.16.4


