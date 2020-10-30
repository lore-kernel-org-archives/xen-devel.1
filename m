Return-Path: <SRS0=Brpk=EF=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F7E6C00A89
	for <xen-devel@archiver.kernel.org>; Fri, 30 Oct 2020 14:25:26 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D8D792076E
	for <xen-devel@archiver.kernel.org>; Fri, 30 Oct 2020 14:25:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="mRVMAhOh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D8D792076E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.15898.39127 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kYVKy-0000hN-V0; Fri, 30 Oct 2020 14:25:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 15898.39127; Fri, 30 Oct 2020 14:25:04 +0000
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
	id 1kYVKy-0000hG-Ri; Fri, 30 Oct 2020 14:25:04 +0000
Received: by outflank-mailman (input) for mailman id 15898;
 Fri, 30 Oct 2020 14:25:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=y1I6=EF=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kYVKy-0000hB-4P
 for xen-devel@lists.xenproject.org; Fri, 30 Oct 2020 14:25:04 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b5c82dc8-eeee-41ff-9be8-890cc336cf59;
 Fri, 30 Oct 2020 14:25:03 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 62FFFAE78;
 Fri, 30 Oct 2020 14:25:02 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=y1I6=EF=suse.com=jgross@srs-us1.protection.inumbo.net>)
	id 1kYVKy-0000hB-4P
	for xen-devel@lists.xenproject.org; Fri, 30 Oct 2020 14:25:04 +0000
X-Inumbo-ID: b5c82dc8-eeee-41ff-9be8-890cc336cf59
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id b5c82dc8-eeee-41ff-9be8-890cc336cf59;
	Fri, 30 Oct 2020 14:25:03 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1604067902;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=79oOEVUMfaSGePfVVjQlCwA8HSZkhczazYUwIzRljN4=;
	b=mRVMAhOhFQy7OjjyW1euBEyXVzH1h8VS3qmnoKp5KuxIVqT0r7X7kHNHz7nRcIfj0mn4QG
	o8jF34/zz7dghuCbI3qC80gUCXhu+CEWvNji8bsqLBmpTkFebkrcu7V+hiuXcORs9RIl+Q
	NB09pyGkpf6r0OrkWBkoFfOoQ0gMzS4=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 62FFFAE78;
	Fri, 30 Oct 2020 14:25:02 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH 0/2] xen/locking: fix and enhance lock debugging
Date: Fri, 30 Oct 2020 15:24:58 +0100
Message-Id: <20201030142500.5464-1-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This small series fixes two issues with spinlock debug code and adds
lock debug code to rwlocks in order to catch IRQ violations.

Juergen Gross (2):
  xen/spinlocks: spin_trylock with interrupts off is always fine
  xen/rwlock: add check_lock() handling to rwlocks

 xen/common/spinlock.c      | 17 ++++++++++-------
 xen/include/xen/rwlock.h   | 14 ++++++++++++++
 xen/include/xen/spinlock.h |  2 ++
 3 files changed, 26 insertions(+), 7 deletions(-)

-- 
2.26.2


