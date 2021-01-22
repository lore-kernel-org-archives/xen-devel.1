Return-Path: <SRS0=o5zc=GZ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3447EC433E0
	for <xen-devel@archiver.kernel.org>; Fri, 22 Jan 2021 09:23:45 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BD402238D7
	for <xen-devel@archiver.kernel.org>; Fri, 22 Jan 2021 09:23:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BD402238D7
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.72605.130761 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2sfB-00039g-4g; Fri, 22 Jan 2021 09:23:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 72605.130761; Fri, 22 Jan 2021 09:23:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2sfB-00039Z-0b; Fri, 22 Jan 2021 09:23:29 +0000
Received: by outflank-mailman (input) for mailman id 72605;
 Fri, 22 Jan 2021 09:23:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2lNi=GZ=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1l2sf9-00039U-Pt
 for xen-devel@lists.xenproject.org; Fri, 22 Jan 2021 09:23:27 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 82943814-5e3c-4139-bf5f-fd61a6b94c15;
 Fri, 22 Jan 2021 09:23:26 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 00A36ABD6;
 Fri, 22 Jan 2021 09:23:25 +0000 (UTC)
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
X-Inumbo-ID: 82943814-5e3c-4139-bf5f-fd61a6b94c15
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1611307406; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=apd2jVHXAyYEw+npGnWOuir4wRpZrZzBEdMqJQHhVaY=;
	b=Lutk/Zgls1nD7VvZn4owlwvZMNl4W8/4hBcM+KJCJkqoB9Ixq7vxTRVf5G12Z8UbWZo5Mj
	o+do9gKL8P2tXRx2CEBZ9n/ZFEyttAYnD9TxK8gacIhlN0zh4pvd+gUFi4hVRq8eb2lCgh
	7N4yMwA5IZa1ftQ4+Kr9pyGfRctEa3o=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH RFC 0/4] tools/xenstore: start of rework of xenstored
Date: Fri, 22 Jan 2021 10:23:20 +0100
Message-Id: <20210122092324.7178-1-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is an overture of a major rework of the xenstored internals I've
had lying around for about one year now. It has been blocked by all
the XSA work and live update stuff.

This series has not seen much testing. It is rather meant as a
starting point for discussions whether the approach especially to
drop tdb is accepted or not.

The main reason to drop using tdb is to be able to have references
between nodes, which will be rather interesting for adding the
capability to do live updates even with open transactions.

Other optimizations made possible by this would be to e.g.:

- hook watches directly to nodes, dropping the need to scan all
  active watches when modifying a node

- switch transaction handling to a rather simple copy-on-write
  scheme

- avoid lots of node copying when traversing the tree

- drop the list children names by replacing it with a linked list of
  child nodes

Patches 1 and 2 are in this series basically because they are in my
todo list for xenstored and they need to wait for the tree to be opened
anyway before being able to go in.

Patch 3 is some preparation for removing tdb, but could be taken as a
cleanup patch even without dropping tdb.

In case no one is objecting to drop tdb I'll continue with some further
optimizations.

Juergen Gross (4):
  tools/xenstore: simplify xenstored main loop
  tools/xenstore: claim resources when running as daemon
  tools/xenstore: rework hashtable interfaces
  tools/xenstore: drop use of tdb

 .gitignore                             |    2 -
 tools/xenstore/Makefile                |    9 +-
 tools/xenstore/hashtable.c             |  234 ++--
 tools/xenstore/hashtable.h             |  137 +-
 tools/xenstore/hashtable_private.h     |   85 --
 tools/xenstore/tdb.c                   | 1748 ------------------------
 tools/xenstore/tdb.h                   |  134 --
 tools/xenstore/xenstored_core.c        |  313 ++---
 tools/xenstore/xenstored_core.h        |   30 +-
 tools/xenstore/xenstored_domain.c      |   11 +-
 tools/xenstore/xenstored_minios.c      |    4 +
 tools/xenstore/xenstored_posix.c       |   46 +
 tools/xenstore/xenstored_transaction.c |   71 +-
 tools/xenstore/xenstored_transaction.h |    4 +-
 tools/xenstore/xs_tdb_dump.c           |   86 --
 15 files changed, 426 insertions(+), 2488 deletions(-)
 delete mode 100644 tools/xenstore/hashtable_private.h
 delete mode 100644 tools/xenstore/tdb.c
 delete mode 100644 tools/xenstore/tdb.h
 delete mode 100644 tools/xenstore/xs_tdb_dump.c

-- 
2.26.2


