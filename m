Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A467C79F80
	for <xen-devel@archiver.kernel.org>; Fri,  4 Sep 2026 17:14:37 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1408902.1641173 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x2XUe-0003BP-UA; Fri, 04 Sep 2026 17:14:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1408902.1641173; Fri, 04 Sep 2026 17:14:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x2XUe-0003BI-RO; Fri, 04 Sep 2026 17:14:24 +0000
Received: by outflank-mailman (input) for mailman id 1408902;
 Fri, 04 Sep 2026 17:14:23 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger@xenproject.org>) id 1x2XUd-0003B4-L4
 for xen-devel@lists.xenproject.org; Fri, 04 Sep 2026 17:14:23 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <roger@xenproject.org>) id 1x2XUc-005Kk8-1v;
 Fri, 04 Sep 2026 17:14:22 +0000
Received: from 224.pool85-54-217.dynamic.orange.es ([85.54.217.224]
 helo=localhost) by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <roger@xenproject.org>) id 1x2XUc-000PXA-02;
 Fri, 04 Sep 2026 17:14:22 +0000
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
	bh=5FAZdrD/CSlhzCnqj5dZaUZDZ9GfXXAxevwlxaPWsI4=; b=uzdZ741gH0rcrN+RgRlzc39Q8t
	z6dnLjO5DoDWktcrogGnvXLbTTU/kjCv0A3dXJeQD3EIr5h8JjaeBNnpugHP33AMcCh/O9/YxUe1i
	FzYl9WJ70WuFLJL62foQJqXPRaJGZ6ocmia1T86q0LhWNQviCFLMn1BV6ijKlYPy2aBg=;
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
Subject: [PATCH 1/5] xen/rcu: fix types
Date: Fri,  4 Sep 2026 19:11:17 +0200
Message-ID: <20260904171121.65300-2-roger@xenproject.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260904171121.65300-1-roger@xenproject.org>
References: <20260904171121.65300-1-roger@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Adjust some types: int -> bool, int -> unsigned int. Also fix a couple of
typos plus trailing white space.

No functional change intended.

Signed-off-by: Roger Pau Monné <roger@xenproject.org>
---
 xen/common/rcupdate.c      | 12 ++++++------
 xen/include/xen/rcupdate.h |  8 ++++----
 2 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/xen/common/rcupdate.c b/xen/common/rcupdate.c
index fd5d3d7484a5..3b96f829c87c 100644
--- a/xen/common/rcupdate.c
+++ b/xen/common/rcupdate.c
@@ -509,18 +509,18 @@ static int __rcu_pending(struct rcu_ctrlblk *rcp, struct rcu_data *rdp)
     return 0;
 }
 
-int rcu_pending(int cpu)
+bool rcu_pending(unsigned int cpu)
 {
-    return __rcu_pending(&rcu_ctrlblk, &per_cpu(rcu_data, cpu));
+    return !!__rcu_pending(&rcu_ctrlblk, &per_cpu(rcu_data, cpu));
 }
 
 /*
  * Check to see if any future RCU-related work will need to be done
  * by the current CPU, even if none need be done immediately, returning
- * 1 if so.  This function is part of the RCU implementation; it is -not-
+ * true if so.  This function is part of the RCU implementation; it is -not-
  * an exported member of the RCU API.
  */
-int rcu_needs_cpu(int cpu)
+bool rcu_needs_cpu(unsigned int cpu)
 {
     struct rcu_data *rdp = &per_cpu(rcu_data, cpu);
 
@@ -529,7 +529,7 @@ int rcu_needs_cpu(int cpu)
 
 /*
  * Timer for making sure the CPU where a callback is queued does
- * periodically poke rcu_pedning(), so that it will invoke the callback
+ * periodically poke rcu_pending(), so that it will invoke the callback
  * not too late after the end of the grace period.
  */
 static void rcu_idle_timer_start(void)
@@ -588,7 +588,7 @@ static void cf_check rcu_idle_timer_handler(void* data)
                                 IDLE_TIMER_PERIOD_MIN);
 }
 
-void rcu_check_callbacks(int cpu)
+void rcu_check_callbacks(unsigned int cpu)
 {
     struct rcu_data *rdp = &this_cpu(rcu_data);
 
diff --git a/xen/include/xen/rcupdate.h b/xen/include/xen/rcupdate.h
index 95f4ad81c4a8..c57f628107cf 100644
--- a/xen/include/xen/rcupdate.h
+++ b/xen/include/xen/rcupdate.h
@@ -77,8 +77,8 @@ struct rcu_head {
 } while (0)
 
 
-int rcu_pending(int cpu);
-int rcu_needs_cpu(int cpu);
+bool rcu_pending(unsigned int cpu);
+bool rcu_needs_cpu(unsigned int cpu);
 
 /*
  * Dummy lock type for passing to rcu_read_{lock,unlock}. Currently exists
@@ -168,10 +168,10 @@ static inline void rcu_read_unlock(rcu_read_lock_t *lock)
 #define rcu_assign_pointer(p, v) ({ smp_wmb(); (p) = (v); })
 
 void rcu_init(void);
-void rcu_check_callbacks(int cpu);
+void rcu_check_callbacks(unsigned int cpu);
 
 /* Exported interfaces */
-void call_rcu(struct rcu_head *head, 
+void call_rcu(struct rcu_head *head,
               void (*func)(struct rcu_head *head));
 
 void rcu_barrier(void);
-- 
2.53.0


