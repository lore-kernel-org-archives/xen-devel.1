Return-Path: <SRS0=mHc1=DJ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C936C35257
	for <xen-devel@archiver.kernel.org>; Fri,  2 Oct 2020 15:42:08 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A64C620795
	for <xen-devel@archiver.kernel.org>; Fri,  2 Oct 2020 15:42:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="kO9YB7cX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A64C620795
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.2230.6590 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kONBs-0006vP-Fb; Fri, 02 Oct 2020 15:41:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 2230.6590; Fri, 02 Oct 2020 15:41:48 +0000
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
	id 1kONBs-0006vI-Cb; Fri, 02 Oct 2020 15:41:48 +0000
Received: by outflank-mailman (input) for mailman id 2230;
 Fri, 02 Oct 2020 15:41:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2E3y=DJ=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kONBq-0006v4-NJ
 for xen-devel@lists.xenproject.org; Fri, 02 Oct 2020 15:41:46 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a9cfa185-7e39-4417-9dfb-6b072cc7461f;
 Fri, 02 Oct 2020 15:41:45 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 2180AB260;
 Fri,  2 Oct 2020 15:41:45 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=2E3y=DJ=suse.com=jgross@srs-us1.protection.inumbo.net>)
	id 1kONBq-0006v4-NJ
	for xen-devel@lists.xenproject.org; Fri, 02 Oct 2020 15:41:46 +0000
X-Inumbo-ID: a9cfa185-7e39-4417-9dfb-6b072cc7461f
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id a9cfa185-7e39-4417-9dfb-6b072cc7461f;
	Fri, 02 Oct 2020 15:41:45 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1601653305;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=oIK93nxrDael7j58S693ug7pAufuwxo+3VASfk/e1JA=;
	b=kO9YB7cXFNm5J4pvSpdHHYbuW0pNHvZZGX3lrQWMOtSEe85+YlX5W5rc29lD/7Z8BVPeCQ
	oJrB0/WznV4DUGhLL+NYOGO3TVFSBbrS/0ZN1JHNrXehJJoXJeaYbNeWoOf2XwNDd8yIBY
	R9oYp0WugEp1qHPHVNGewYKn2WR2ngA=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 2180AB260;
	Fri,  2 Oct 2020 15:41:45 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: [PATCH 0/5] tools/xenstore: remove read-only socket
Date: Fri,  2 Oct 2020 17:41:36 +0200
Message-Id: <20201002154141.11677-1-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The read-only socket of Xenstore is usable for the daemon case only
and even there it is not really worth to be kept, as not all
Xesntore operations changing the state of Xenstore are blocked,
oxenstored ignoring the read-only semantics completely, and the
privileges for using the ro-socket being the same as for the normal
rw-socket.

So remove this feature with switching the related use cases to the
Xenstore-type agnostic open- and close-functions..

Juergen Gross (5):
  tools/xenstore: remove socket-only option from xenstore client
  tools/libs/store: ignore XS_OPEN_SOCKETONLY flag
  tools/libs/store: drop read-only functionality
  tools: drop all deprecated usages of xs_*_open() and friends in tools
  tools/xenstore: drop creation of read-only socket in xenstored

 docs/man/xenstore-chmod.1.pod           |  4 --
 docs/man/xenstore-ls.1.pod              |  4 --
 docs/man/xenstore-read.1.pod            |  4 --
 docs/man/xenstore-write.1.pod           |  4 --
 tools/console/client/main.c             |  2 +-
 tools/console/daemon/utils.c            |  4 +-
 tools/libs/light/libxl.c                |  6 +--
 tools/libs/light/libxl_exec.c           |  6 +--
 tools/libs/light/libxl_fork.c           |  2 +-
 tools/libs/stat/xenstat.c               |  4 +-
 tools/libs/store/include/xenstore.h     | 10 -----
 tools/libs/store/xs.c                   |  9 ++--
 tools/libs/vchan/init.c                 | 10 ++---
 tools/misc/xen-lowmemd.c                |  4 +-
 tools/python/xen/lowlevel/xs/xs.c       |  6 +--
 tools/tests/mce-test/tools/xen-mceinj.c |  4 +-
 tools/xenbackendd/xenbackendd.c         |  4 +-
 tools/xenpmd/xenpmd.c                   |  6 +--
 tools/xenstore/xenstore_client.c        |  8 +---
 tools/xenstore/xenstored_core.c         | 55 +++++--------------------
 tools/xenstore/xenstored_core.h         |  3 --
 tools/xenstore/xenstored_domain.c       |  4 +-
 tools/xenstore/xs_lib.c                 |  8 +---
 23 files changed, 46 insertions(+), 125 deletions(-)

-- 
2.26.2


