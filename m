Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1BB3C98328
	for <xen-devel@archiver.kernel.org>; Fri, 25 Sep 2026 16:32:23 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1434215.1654337 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xA8qM-0002Ra-9J; Fri, 25 Sep 2026 16:32:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1434215.1654337; Fri, 25 Sep 2026 16:32:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xA8qM-0002RP-5l; Fri, 25 Sep 2026 16:32:14 +0000
Received: by outflank-mailman (input) for mailman id 1434215;
 Fri, 25 Sep 2026 16:32:13 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger@xenproject.org>) id 1xA8qL-0002Q6-Cl
 for xen-devel@lists.xenproject.org; Fri, 25 Sep 2026 16:32:13 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <roger@xenproject.org>) id 1xA8qK-00HMcV-0T;
 Fri, 25 Sep 2026 16:32:12 +0000
Received: from 224.pool85-54-217.dynamic.orange.es ([85.54.217.224]
 helo=localhost) by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <roger@xenproject.org>) id 1xA8qK-00HOHQ-23;
 Fri, 25 Sep 2026 16:32:12 +0000
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
	bh=VkJ8mIf2NudvkCJyhJ6QlIMNIJWqXQLcqbsgpgSyxgI=; b=mRiBu/5p/+YeDVJvcC1E7V/tzN
	AGaTgP7akk0RuU7XfvGsKqim0GLjtICUX+mhXTbnEiQuK0a9yhl6W4Uafm2rLXW5slmQLzWxMLY5e
	Fe2zjNmR1NivN73K54o+BLN+ZXC0u39Rv+QnqoDKJb+xPQil686KJGd/khBWvgcW4PHk=;
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
Subject: [PATCH v2 3/3] xen/rcu: remove rcu_quiesce_{disable,enable}()
Date: Fri, 25 Sep 2026 18:30:25 +0200
Message-ID: <20260925163025.65217-4-roger@xenproject.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260925163025.65217-1-roger@xenproject.org>
References: <20260925163025.65217-1-roger@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Fold the code into its callers, having them as separate function just makes
the code harder to read.  Rename rcu_quiesce_allowed() as the RCU
implementation no longer has the concept of quiesce periods.

No functional change intended.

Signed-off-by: Roger Pau Monné <roger@xenproject.org>
---
Changes since v2:
 - New in this version.
---
 xen/common/softirq.c       |  4 ++--
 xen/include/xen/rcupdate.h | 32 +++++++++++---------------------
 2 files changed, 13 insertions(+), 23 deletions(-)

diff --git a/xen/common/softirq.c b/xen/common/softirq.c
index dc3aabce3330..39e1a9844afa 100644
--- a/xen/common/softirq.c
+++ b/xen/common/softirq.c
@@ -31,7 +31,7 @@ static void __do_softirq(unsigned long ignore_mask)
     unsigned long pending;
     bool rcu_allowed = !(ignore_mask & (1UL << RCU_SOFTIRQ));
 
-    ASSERT(!rcu_allowed || rcu_quiesce_allowed());
+    ASSERT(!rcu_allowed || rcu_processing_allowed());
 
     for ( ; ; )
     {
@@ -61,7 +61,7 @@ void process_pending_softirqs(void)
                                 (1UL << SCHED_SLAVE_SOFTIRQ);
 
     /* Block RCU processing in case of rcu_read_lock() held. */
-    if ( !rcu_quiesce_allowed() )
+    if ( !rcu_processing_allowed() )
         ignore_mask |= 1UL << RCU_SOFTIRQ;
 
     ASSERT(!in_irq() && local_irq_is_enabled());
diff --git a/xen/include/xen/rcupdate.h b/xen/include/xen/rcupdate.h
index 312551d5b089..cb16d7f79ae8 100644
--- a/xen/include/xen/rcupdate.h
+++ b/xen/include/xen/rcupdate.h
@@ -46,24 +46,7 @@ DECLARE_PER_CPU(unsigned int, rcu_lock_epoch);
 
 extern unsigned int rcu_epoch;
 
-static inline void rcu_quiesce_disable(void)
-{
-    unsigned int cpu = smp_processor_id();
-
-    preempt_disable();
-    if ( !ACCESS_ONCE(per_cpu(rcu_lock_cnt, cpu))++ )
-        ACCESS_ONCE(per_cpu(rcu_lock_epoch, cpu)) = ACCESS_ONCE(rcu_epoch);
-    smp_mb();
-}
-
-static inline void rcu_quiesce_enable(void)
-{
-    smp_mb();
-    ACCESS_ONCE(this_cpu(rcu_lock_cnt))--;
-    preempt_enable();
-}
-
-static inline bool rcu_quiesce_allowed(void)
+static inline bool rcu_processing_allowed(void)
 {
     return !this_cpu(rcu_lock_cnt);
 }
@@ -129,7 +112,12 @@ typedef struct _rcu_read_lock rcu_read_lock_t;
  */
 static inline void rcu_read_lock(rcu_read_lock_t *lock)
 {
-    rcu_quiesce_disable();
+    unsigned int cpu = smp_processor_id();
+
+    preempt_disable();
+    if ( !ACCESS_ONCE(per_cpu(rcu_lock_cnt, cpu))++ )
+        ACCESS_ONCE(per_cpu(rcu_lock_epoch, cpu)) = ACCESS_ONCE(rcu_epoch);
+    smp_mb();
 }
 
 /**
@@ -139,8 +127,10 @@ static inline void rcu_read_lock(rcu_read_lock_t *lock)
  */
 static inline void rcu_read_unlock(rcu_read_lock_t *lock)
 {
-    ASSERT(!rcu_quiesce_allowed());
-    rcu_quiesce_enable();
+    ASSERT(!rcu_processing_allowed());
+    smp_mb();
+    ACCESS_ONCE(this_cpu(rcu_lock_cnt))--;
+    preempt_enable();
 }
 
 /*
-- 
2.55.0


