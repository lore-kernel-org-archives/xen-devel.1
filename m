Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64E7CC9830E
	for <xen-devel@archiver.kernel.org>; Fri, 25 Sep 2026 16:32:22 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1434213.1654319 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xA8qH-0001zY-Oz; Fri, 25 Sep 2026 16:32:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1434213.1654319; Fri, 25 Sep 2026 16:32:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xA8qH-0001zR-M0; Fri, 25 Sep 2026 16:32:09 +0000
Received: by outflank-mailman (input) for mailman id 1434213;
 Fri, 25 Sep 2026 16:32:09 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger@xenproject.org>) id 1xA8qH-0001zL-Ej
 for xen-devel@lists.xenproject.org; Fri, 25 Sep 2026 16:32:09 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <roger@xenproject.org>) id 1xA8qG-00HMc5-0D;
 Fri, 25 Sep 2026 16:32:08 +0000
Received: from 224.pool85-54-217.dynamic.orange.es ([85.54.217.224]
 helo=localhost) by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <roger@xenproject.org>) id 1xA8qG-00HO9j-1p;
 Fri, 25 Sep 2026 16:32:08 +0000
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
	bh=3fSl0Zn3gA99zlkuSaBDz0i8XUehSOrrwfN84LQISAA=; b=jtDXBQN3krH/BsJZvQ8vpUjFR+
	8B8aN85NtNgIW8FXJAArDzunPN/D/x6ls8JgtBh9O5JjQckGprgQ4SPKYIEHLfRXlc0n68JUsuVAx
	OtiJfNwCH9hhRqU3eryj+jbkZZMzHPeoZX7CIs53PXSFHJe5Mak4gpXshwpcTlQFVu3M=;
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
Subject: [PATCH v2 1/3] xen/rcu: introduce the concept of RCU epoch
Date: Fri, 25 Sep 2026 18:30:23 +0200
Message-ID: <20260925163025.65217-2-roger@xenproject.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260925163025.65217-1-roger@xenproject.org>
References: <20260925163025.65217-1-roger@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

An RCU epoch signals the lifetime of RCU references.  Each CPU records the
epoch in force when it enters an RCU critical section.  When a callback is
queued the current epoch is stored in the callback and the global epoch is
then bumped, as a way to know when all CPUs have moved past a specific
epoch.  At that point there can be no remaining references to objects
fetched during the callback's epoch.

The compiler barrier is switched to a full memory barrier, as future uses
of rcu_lock_cnt must ensure the count is increased before taking a
reference to any RCU protected object.

Access rcu_lock_cnt, rcu_lock_epoch and rcu_epoch through ACCESS_ONCE()
to stop the compiler shattering the loads and stores.  The reordering
prevention aspect of ACCESS_ONCE() is not what we rely on here (the memory
barriers cover that); what matters is that these variables now have remote
consumers, so each access must be a single, non-torn memory operation.

Signed-off-by: Roger Pau Monné <roger@xenproject.org>
---
Can possibly be folded into the next patch, as it's lacking context on its
own to understand the need to introduce the logic.
---
Changes since v1:
 - Do the setting of head->added in the interrupt disabled section.
 - Unconditionally do a memory barrier when enter/exit RCU critical
   regions.  Attempting to do selectively is too complex.
---
 xen/common/rcupdate.c      |  6 ++++++
 xen/include/xen/rcupdate.h | 17 +++++++++++++----
 2 files changed, 19 insertions(+), 4 deletions(-)

diff --git a/xen/common/rcupdate.c b/xen/common/rcupdate.c
index c1b6b2ae768b..babaabbbeefe 100644
--- a/xen/common/rcupdate.c
+++ b/xen/common/rcupdate.c
@@ -49,6 +49,11 @@
 #include <asm/atomic.h>
 
 DEFINE_PER_CPU(unsigned int, rcu_lock_cnt);
+/* Store epoch when CPU entered the RCU critical section. */
+DEFINE_PER_CPU(unsigned int, rcu_lock_epoch);
+
+/* Current RCU epoch, bumped every time a new callback is queued. */
+unsigned int rcu_epoch;
 
 /* Global control variables for rcupdate callback mechanism. */
 static struct rcu_ctrlblk {
@@ -283,6 +288,7 @@ void call_rcu(struct rcu_head *head,
     head->func = func;
     head->next = NULL;
     local_irq_save(flags);
+    head->added = arch_fetch_and_add(&rcu_epoch, 1);
     rdp = &this_cpu(rcu_data);
     *rdp->nxttail = head;
     rdp->nxttail = &head->next;
diff --git a/xen/include/xen/rcupdate.h b/xen/include/xen/rcupdate.h
index c57f628107cf..5846e8c169d7 100644
--- a/xen/include/xen/rcupdate.h
+++ b/xen/include/xen/rcupdate.h
@@ -34,24 +34,32 @@
 #include <xen/compiler.h>
 #include <xen/spinlock.h>
 #include <xen/cpumask.h>
+#include <xen/lib.h>
 #include <xen/percpu.h>
 #include <xen/preempt.h>
 
 #define __rcu
 
 DECLARE_PER_CPU(unsigned int, rcu_lock_cnt);
+DECLARE_PER_CPU(unsigned int, rcu_lock_epoch);
+
+extern unsigned int rcu_epoch;
 
 static inline void rcu_quiesce_disable(void)
 {
+    unsigned int cpu = smp_processor_id();
+
     preempt_disable();
-    this_cpu(rcu_lock_cnt)++;
-    barrier();
+    if ( !ACCESS_ONCE(per_cpu(rcu_lock_cnt, cpu))++ )
+        ACCESS_ONCE(per_cpu(rcu_lock_epoch, cpu)) = ACCESS_ONCE(rcu_epoch);
+    smp_mb();
 }
 
 static inline void rcu_quiesce_enable(void)
 {
-    barrier();
-    this_cpu(rcu_lock_cnt)--;
+
+    smp_mb();
+    ACCESS_ONCE(this_cpu(rcu_lock_cnt))--;
     preempt_enable();
 }
 
@@ -68,6 +76,7 @@ static inline bool rcu_quiesce_allowed(void)
 struct rcu_head {
     struct rcu_head *next;
     void (*func)(struct rcu_head *head);
+    unsigned int added;
 };
 
 #define RCU_HEAD_INIT   { .next = NULL, .func = NULL }
-- 
2.55.0


