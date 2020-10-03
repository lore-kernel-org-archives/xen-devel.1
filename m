Return-Path: <SRS0=xDj+=DK=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22F85C4363D
	for <xen-devel@archiver.kernel.org>; Sat,  3 Oct 2020 07:33:28 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B9DBE206CA
	for <xen-devel@archiver.kernel.org>; Sat,  3 Oct 2020 07:33:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="GlzssYPK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B9DBE206CA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.2462.7212 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kOc2L-0001yJ-9i; Sat, 03 Oct 2020 07:32:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 2462.7212; Sat, 03 Oct 2020 07:32:57 +0000
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
	id 1kOc2L-0001yC-6P; Sat, 03 Oct 2020 07:32:57 +0000
Received: by outflank-mailman (input) for mailman id 2462;
 Sat, 03 Oct 2020 07:32:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jVkC=DK=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kOc2K-0001y7-83
 for xen-devel@lists.xenproject.org; Sat, 03 Oct 2020 07:32:56 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2a704f1e-42a7-474e-ad0f-c94eb463351d;
 Sat, 03 Oct 2020 07:32:55 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 5F068B1AC;
 Sat,  3 Oct 2020 07:32:54 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=jVkC=DK=suse.com=jgross@srs-us1.protection.inumbo.net>)
	id 1kOc2K-0001y7-83
	for xen-devel@lists.xenproject.org; Sat, 03 Oct 2020 07:32:56 +0000
X-Inumbo-ID: 2a704f1e-42a7-474e-ad0f-c94eb463351d
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 2a704f1e-42a7-474e-ad0f-c94eb463351d;
	Sat, 03 Oct 2020 07:32:55 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1601710374;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=/+WtWwRXTD0BjBTHb1/FJ6JZp3AokR9+zD+bpTXewJY=;
	b=GlzssYPKtZlr4ZpQYxu6NlxGBF78a5Xni4mwOrQB7WCX/va+IwlAEog0YjtpuFXaUDFShD
	1K0y3l2xgYbm2Xi88Wu703O+Q2nb3QNN7CKYbUFxTeX+/9LqnI9nodyev5No1P9qJovkN1
	niF1OPRlribG7yIN7bEIt5vnx/CU60s=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 5F068B1AC;
	Sat,  3 Oct 2020 07:32:54 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: torvalds@linux-foundation.org
Cc: linux-kernel@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	boris.ostrovsky@oracle.com
Subject: [GIT PULL] xen: branch for v5.9-rc8
Date: Sat,  3 Oct 2020 09:32:53 +0200
Message-Id: <20201003073253.1861-1-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Linus,

Please git pull the following tag:

 git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-5.9b-rc8-tag

xen: branch for v5.9-rc8

In contains a fix for a regression introduced with 5.9-rc3 which caused
a system running as fully virtualized guest under Xen to crash when
using legacy devices like a floppy.

Thanks.

Juergen

 drivers/xen/events/events_base.c | 29 +++++++++++++++++++++--------
 1 file changed, 21 insertions(+), 8 deletions(-)

Juergen Gross (1):
      xen/events: don't use chip_data for legacy IRQs

