Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85C99C624DE
	for <xen-devel@archiver.kernel.org>; Fri,  4 Sep 2026 17:14:43 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1408906.1641208 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x2XUn-0004BB-0U; Fri, 04 Sep 2026 17:14:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1408906.1641208; Fri, 04 Sep 2026 17:14:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x2XUm-0004B4-TE; Fri, 04 Sep 2026 17:14:32 +0000
Received: by outflank-mailman (input) for mailman id 1408906;
 Fri, 04 Sep 2026 17:14:31 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger@xenproject.org>) id 1x2XUl-000469-L5
 for xen-devel@lists.xenproject.org; Fri, 04 Sep 2026 17:14:31 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <roger@xenproject.org>) id 1x2XUk-005Kkr-2N;
 Fri, 04 Sep 2026 17:14:30 +0000
Received: from 224.pool85-54-217.dynamic.orange.es ([85.54.217.224]
 helo=localhost) by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <roger@xenproject.org>) id 1x2XUk-000Q84-0Z;
 Fri, 04 Sep 2026 17:14:30 +0000
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
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From;
	bh=i3K9AqM6qwFFz7KWpD8EsWRfNCM+xPNYSDsWiwSOLiU=; b=loTAIcNBrVQJjRtRs4qxjFYDS1
	FKHo8hmBkLhMqoDzF8TXlo7qmhgLMCU94UiJqMpTQ8qubpeckKzjXYOZoFiTwqAuYWKB6HK6/NPRn
	rDcFvoeW2qgK7x2eRQQiMZ6lUd2HVjdvIGZAuwLEFzF3gmytfvVmwPe2PU/nz/2UB080=;
From: Roger Pau Monne <roger@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?J=C3=BCrgen=20Gro=C3=9F?= <jgross@suse.com>,
	Roger Pau Monne <roger@xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 5/5] xen/rcu: remove rcu_needs_cpu()
Date: Fri,  4 Sep 2026 19:11:21 +0200
Message-ID: <20260904171121.65300-6-roger@xenproject.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260904171121.65300-1-roger@xenproject.org>
References: <20260904171121.65300-1-roger@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

After the changes to the RCU logic, there's no longer a difference between
rcu_pending() and rcu_needs_cpu().  With the previous implementation
rcu_pending() signaled whether there was RCU work ready to handle, while
rcu_needs_cpu() signaled whether the CPU had queued RCU callback that could
not yet execute.

With the new logic figuring out whether callbacks can be executed requires
more work, and hence is deferred to the processing logic in
rcu_process_callbacks().  Both rcu_pending() and rcu_needs_cpu() return
whether there's any pending work, without making guarantees any callbacks
are ready to be executed.

Given this lack of difference, remove rcu_needs_cpu() and use rcu_pending()
in cpu_is_haltable().

Signed-off-by: Roger Pau Monné <roger@xenproject.org>
---
 xen/common/rcupdate.c      | 11 -----------
 xen/include/xen/rcupdate.h |  7 +++++--
 xen/include/xen/sched.h    |  2 +-
 3 files changed, 6 insertions(+), 14 deletions(-)

diff --git a/xen/common/rcupdate.c b/xen/common/rcupdate.c
index d3c11f45bfa0..c8164b0ad7e0 100644
--- a/xen/common/rcupdate.c
+++ b/xen/common/rcupdate.c
@@ -298,17 +298,6 @@ bool rcu_pending(unsigned int cpu)
     return !!per_cpu(rcu_data, cpu).nr;
 }
 
-/*
- * Check to see if any future RCU-related work will need to be done
- * by the current CPU, even if none need be done immediately, returning
- * true if so.  This function is part of the RCU implementation; it is -not-
- * an exported member of the RCU API.
- */
-bool rcu_needs_cpu(unsigned int cpu)
-{
-    return rcu_pending(cpu);
-}
-
 /*
  * Timer for making sure the CPU where a callback is queued does
  * periodically poke rcu_pending(), so that it will invoke the callback
diff --git a/xen/include/xen/rcupdate.h b/xen/include/xen/rcupdate.h
index 9c3e06bbe6e8..1700b73a6c3b 100644
--- a/xen/include/xen/rcupdate.h
+++ b/xen/include/xen/rcupdate.h
@@ -90,9 +90,12 @@ struct rcu_head {
     INIT_LIST_HEAD(&(ptr)->list); (ptr)->func = NULL; \
 } while (0)
 
-
+/*
+ * Check whether there's pending RCU work queued on this CPU.  This merely
+ * signals whether there are callbacks pending, there's no guarantee that any
+ * callbacks are ready to be executed.
+ */
 bool rcu_pending(unsigned int cpu);
-bool rcu_needs_cpu(unsigned int cpu);
 
 /*
  * Dummy lock type for passing to rcu_read_{lock,unlock}. Currently exists
diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
index e352e2b38e7d..5bccf9b748a6 100644
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -1155,7 +1155,7 @@ void scheduler_disable(void);
  * the tasklet_work_to_do() helper).
  */
 #define cpu_is_haltable(cpu)                    \
-    (!rcu_needs_cpu(cpu) &&                     \
+    (!rcu_pending(cpu) &&                       \
      !softirq_pending(cpu) &&                   \
      cpu_online(cpu) &&                         \
      !per_cpu(tasklet_work_to_do, cpu))
-- 
2.53.0


