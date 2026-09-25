Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1FE6C98321
	for <xen-devel@archiver.kernel.org>; Fri, 25 Sep 2026 16:32:29 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1434212.1654309 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xA8qG-0001n9-IY; Fri, 25 Sep 2026 16:32:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1434212.1654309; Fri, 25 Sep 2026 16:32:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xA8qG-0001n2-Fn; Fri, 25 Sep 2026 16:32:08 +0000
Received: by outflank-mailman (input) for mailman id 1434212;
 Fri, 25 Sep 2026 16:32:07 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger@xenproject.org>) id 1xA8qF-0001mw-9p
 for xen-devel@lists.xenproject.org; Fri, 25 Sep 2026 16:32:07 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <roger@xenproject.org>) id 1xA8qE-00HMbv-03;
 Fri, 25 Sep 2026 16:32:06 +0000
Received: from 224.pool85-54-217.dynamic.orange.es ([85.54.217.224]
 helo=localhost) by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <roger@xenproject.org>) id 1xA8qE-00HO5h-1S;
 Fri, 25 Sep 2026 16:32:06 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From;
	bh=QtQg/jUaw7Y7+4n9JtPZn3Cx9aGmyb2w/LmpvDg9PQw=; b=iqBDLxPXMdu0eJJfaWbPd0PEEW
	3z1D+Y3Ih/8htBiiMzMOuZdzwSwGQdSTMyhGX98RHTobpmX0lox76l9GMIFvPWsZHThn8rQMJpFYJ
	ZljXgeGQmWI9SZlrbVRLXwGbL4m8Iyivp3ydi/Wdg4lXboohntA7UfuOqlbnCXW0O8iU=;
From: Roger Pau Monne <roger@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: alejandro.garciavallejo@amd.com,
	Roger Pau Monne <roger@xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2 0/3] xen/rcu: rework the RCU logic
Date: Fri, 25 Sep 2026 18:30:22 +0200
Message-ID: <20260925163025.65217-1-roger@xenproject.org>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello,

Following series aims to solve two problems we have observed with the
RCU subsystem, complete details on patch 2.

The series is basically a re-write (and IMO simplification) of the RCU
logic, patch 2 containing most of the newly introduced logic.

It's been (slightly) tested locally and on the safety CI.  Maybe I'm
being naive, but this looks much easier to reason about and maintain
than the current logic.

This "simplification" is only possible after the introduction of
rcu_read_{lock,unlock}() helpers that identify RCU critical sections.

Thanks, Roger.

Roger Pau Monne (3):
  xen/rcu: introduce the concept of RCU epoch
  xen/rcu: simplify RCU implementation
  xen/rcu: remove rcu_quiesce_{disable,enable}()

 xen/common/rcupdate.c      | 497 +++++++++++--------------------------
 xen/common/softirq.c       |   4 +-
 xen/include/xen/rcupdate.h |  45 ++--
 3 files changed, 168 insertions(+), 378 deletions(-)

-- 
2.55.0


