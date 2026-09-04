Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFD91C79F89
	for <xen-devel@archiver.kernel.org>; Fri,  4 Sep 2026 17:14:39 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1408905.1641200 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x2XUk-0003tb-Oa; Fri, 04 Sep 2026 17:14:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1408905.1641200; Fri, 04 Sep 2026 17:14:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x2XUk-0003tU-KY; Fri, 04 Sep 2026 17:14:30 +0000
Received: by outflank-mailman (input) for mailman id 1408905;
 Fri, 04 Sep 2026 17:14:29 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger@xenproject.org>) id 1x2XUj-0003f6-Bo
 for xen-devel@lists.xenproject.org; Fri, 04 Sep 2026 17:14:29 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <roger@xenproject.org>) id 1x2XUi-005Kkf-23;
 Fri, 04 Sep 2026 17:14:28 +0000
Received: from 224.pool85-54-217.dynamic.orange.es ([85.54.217.224]
 helo=localhost) by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <roger@xenproject.org>) id 1x2XUi-000Q0G-0I;
 Fri, 04 Sep 2026 17:14:28 +0000
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
	bh=LZhALLn0ovpkb2bRdZsHBI4v5WiQPyVT/P5+n0/4JSI=; b=GA0ucdRsDlYpOMJX5g+REXqjui
	8nRAl10euTpuzFxzt4cTjjUuS8m8OFybg20rxzHpraqmgkGr9mpmOvel1iHzai9WV5a1hOxtI1T9J
	+UTWil2l39Hsp0GpWpvVtB3S6RP6km2VDG3k9dIQsItoo1w5kvB7ylCI28tSkDiMEJNc=;
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
Subject: [PATCH 4/5] xen/rcu: simplify RCU implementation
Date: Fri,  4 Sep 2026 19:11:20 +0200
Message-ID: <20260904171121.65300-5-roger@xenproject.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260904171121.65300-1-roger@xenproject.org>
References: <20260904171121.65300-1-roger@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The current implementation has two shortcomings for certain Xen usages:

 * When using the null scheduler it's possible for a CPU to never enter Xen
   context.  A CPU not entering Xen context can block other CPUs from
   executing RCU callbacks, as there will be no quiescent state observed if
   the CPU doesn't enter Xen context.

 * If a certain amount of callbacks are pending, RCU will try to force a
   quiescent state, by sending an IPI to remote CPUs.  This causes unwanted
   interference.

Keep track of the RCU epoch when a callback was added, and only execute it
once all CPUs are either outside of RCU critical regions, or any CPUs
inside of RCU critical regions have entered such past the epoch when the
callback was queued.  Knowing whether a CPU is inside a RCU critical region
is done based on the CPU rcu_lock_cnt value.

There's an additional cost introduced in rcu_quiesce_{disable,enable}(), as
we now need to use a full memory barrier on the outermost critical section
entry/exit to make sure changes to rcu_lock_cnt cannot be reordered with
accesses to RCU protected objects.

This simplifies the current RCU implementation, as we get rid of
grace/quiescent periods and a fair amount of logic to manage the state
tracking.

Signed-off-by: Roger Pau Monné <roger@xenproject.org>
---
The maximum batch of callbacks processed is limited to 10, this is bit
arbitrary, but I think matches what the current logic attempts does.

There's possibly some logic missing that rate-limits the amount of
callbacks to process during a certain period.  I can add those in v2 if the
current approach is considered sane.

Possibly there's a bit more pruning to do regarding the usage of grace and
quiesce in comments or functions names - I leave that to either v2 or a
different change.
---
 xen/common/rcupdate.c      | 464 +++++++++----------------------------
 xen/include/xen/rcupdate.h |  13 +-
 2 files changed, 112 insertions(+), 365 deletions(-)

diff --git a/xen/common/rcupdate.c b/xen/common/rcupdate.c
index bd63280fd63c..d3c11f45bfa0 100644
--- a/xen/common/rcupdate.c
+++ b/xen/common/rcupdate.c
@@ -35,6 +35,7 @@
 #include <xen/cpu.h>
 #include <xen/init.h>
 #include <xen/kernel.h>
+#include <xen/list_sort.h>
 #include <xen/param.h>
 #include <xen/percpu.h>
 #include <xen/rcupdate.h>
@@ -55,74 +56,28 @@ DEFINE_PER_CPU(unsigned int, rcu_lock_epoch);
 /* Current RCU epoch, bumped every time a new callback is queued. */
 unsigned int rcu_epoch;
 
-/* Global control variables for rcupdate callback mechanism. */
-static struct rcu_ctrlblk {
-    long cur;           /* Current batch number.                      */
-    long completed;     /* Number of the last completed batch         */
-    int  next_pending;  /* Is the next batch already waiting?         */
-
-    spinlock_t  lock __cacheline_aligned;
-    cpumask_t   cpumask; /* CPUs that need to switch in order ... */
-    cpumask_t   idle_cpumask; /* ... unless they are already idle */
-    /* for current batch to proceed.        */
-} __cacheline_aligned rcu_ctrlblk = {
-    .cur = -300,
-    .completed = -300,
-    .lock = SPIN_LOCK_UNLOCKED,
-};
-
-/*
- * Per-CPU data for Read-Copy Update.
- * nxtlist - new callbacks are added here
- * curlist - current batch for which quiescent cycle started if any
- */
+/* Per-CPU data for Read-Copy Update. */
 struct rcu_data {
-    /* 1) quiescent state handling : */
-    long quiescbatch;    /* Batch # for grace period */
-    int  qs_pending;     /* core waits for quiesc state */
-
-    /* 2) batch handling */
-    long            batch;            /* Batch # for current RCU batch */
-    struct rcu_head *nxtlist;
-    struct rcu_head **nxttail;
-    long            qlen;             /* # of queued callbacks */
-    struct rcu_head *curlist;
-    struct rcu_head **curtail;
-    struct rcu_head *donelist;
-    struct rcu_head **donetail;
-    long            blimit;           /* Upper limit on a processed batch */
-    int cpu;
-    long            last_rs_qlen;     /* qlen during the last resched */
-
-    /* 3) idle CPUs handling */
+    /*
+     * List of pending callbacks, sorted by ascending epoch.  Use a threshold
+     * value to raise an RCU softirq if the queue exceeds a given length.
+     */
+    struct list_head pending;
+    unsigned int nr;
+#define RCU_QUEUE_THRESHOLD 100
+
+    /* Idle CPU handling */
     struct timer idle_timer;
     bool idle_timer_active;
 
-    bool            process_callbacks;
+    /* Barrier handling. */
     bool            barrier_active;
 };
 
 /*
- * If a CPU with RCU callbacks queued goes idle, when the grace period is
- * not finished yet, how can we make sure that the callbacks will eventually
- * be executed? In Linux (2.6.21, the first "tickless idle" Linux kernel),
- * the periodic timer tick would not be stopped for such CPU. Here in Xen,
- * we (may) don't even have a periodic timer tick, so we need to use a
- * special purpose timer.
- *
- * Such timer:
- * 1) is armed only when a CPU with an RCU callback(s) queued goes idle
- *    before the end of the current grace period (_not_ for any CPUs that
- *    go idle!);
- * 2) when it fires, it is only re-armed if the grace period is still
- *    running;
- * 3) it is stopped immediately, if the CPU wakes up from idle and
- *    resumes 'normal' execution.
- *
- * About how far in the future the timer should be programmed each time,
- * it's hard to tell (guess!!). Since this mimics Linux's periodic timer
- * tick, take values used there as an indication. In Linux 2.6.21, tick
- * period can be 10ms, 4ms, 3.33ms or 1ms.
+ * If a CPU with RCU callbacks queued goes idle before the callbacks can be
+ * drained use a timer to ensure the CPU is woken up to process the remaining
+ * callback queue.
  *
  * By default, we use 10ms, to enable at least some power saving on the
  * CPU that is going idle. The user can change this, via a boot time
@@ -137,21 +92,18 @@ static s_time_t __read_mostly idle_timer_period;
 /*
  * Increment and decrement values for the idle timer handler. The algorithm
  * works as follows:
- * - if the timer actually fires, and it finds out that the grace period isn't
- *   over yet, we add IDLE_TIMER_PERIOD_INCR to the timer's period;
- * - if the timer actually fires and it finds the grace period over, we
- *   subtract IDLE_TIMER_PERIOD_DECR from the timer's period.
+ * - If the timer actually fires, and it finds out there are CPUs still in RCU
+ *   critical regions, we add IDLE_TIMER_PERIOD_INCR to the timer's period.
+ *   Note this is not very accurate, as the CPUs in those RCU critical regions
+ *   might not be holding back the execution of the local callbacks.
+ * - If the timer actually fires and it finds no CPUs in critical RCU regions,
+ *   we subtract IDLE_TIMER_PERIOD_DECR from the timer's period.
  */
 #define IDLE_TIMER_PERIOD_INCR    MILLISECS(10)
 #define IDLE_TIMER_PERIOD_DECR    MICROSECS(100)
 
 static DEFINE_PER_CPU(struct rcu_data, rcu_data);
 
-static int blimit = 10;
-static int qhimark = 10000;
-static int qlowmark = 100;
-static int rsinterval = 1000;
-
 /*
  * rcu_barrier() handling:
  * Two counters are used to synchronize rcu_barrier() work:
@@ -246,35 +198,12 @@ void rcu_barrier(void)
     put_cpu_maps();
 }
 
-/* Is batch a before batch b ? */
-static inline int rcu_batch_before(long a, long b)
-{
-    return (a - b) < 0;
-}
-
-static void force_quiescent_state(struct rcu_data *rdp,
-                                  struct rcu_ctrlblk *rcp)
-{
-    cpumask_t cpumask;
-    raise_softirq(RCU_SOFTIRQ);
-    if (unlikely(rdp->qlen - rdp->last_rs_qlen > rsinterval)) {
-        rdp->last_rs_qlen = rdp->qlen;
-        /*
-         * Don't send IPI to itself. With irqs disabled,
-         * rdp->cpu is the current cpu.
-         */
-        cpumask_andnot(&cpumask, &rcp->cpumask, cpumask_of(rdp->cpu));
-        cpumask_raise_softirq(&cpumask, RCU_SOFTIRQ);
-    }
-}
-
 /**
  * call_rcu - Queue an RCU callback for invocation after a grace period.
  * @head: structure to be used for queueing the RCU updates.
  * @func: actual update function to be invoked after the grace period
  *
- * The update function will be invoked some time after a full grace
- * period elapses, in other words after all currently executing RCU
+ * The update function will be invoked after all currently executing RCU
  * read-side critical sections have completed.  RCU read-side critical
  * sections are delimited by rcu_read_lock() and rcu_read_unlock(),
  * and may be nested.
@@ -283,205 +212,77 @@ void call_rcu(struct rcu_head *head,
               void (*func)(struct rcu_head *rcu))
 {
     unsigned long flags;
-    struct rcu_data *rdp;
+    struct rcu_data *rdp = &this_cpu(rcu_data);
 
     head->func = func;
-    head->next = NULL;
     head->added = arch_fetch_and_add(&rcu_epoch, 1);
     local_irq_save(flags);
-    rdp = &this_cpu(rcu_data);
-    *rdp->nxttail = head;
-    rdp->nxttail = &head->next;
-    if (unlikely(++rdp->qlen > qhimark)) {
-        rdp->blimit = INT_MAX;
-        force_quiescent_state(rdp, &rcu_ctrlblk);
-    }
-    local_irq_restore(flags);
-}
-
-/*
- * Invoke the completed RCU callbacks. They are expected to be in
- * a per-cpu list.
- */
-static void rcu_do_batch(struct rcu_data *rdp)
-{
-    struct rcu_head *next, *list;
-    int count = 0;
-
-    list = rdp->donelist;
-    while (list) {
-        next = rdp->donelist = list->next;
-        list->func(list);
-        list = next;
-        rdp->qlen--;
-        if (++count >= rdp->blimit)
-            break;
-    }
-    if (rdp->blimit == INT_MAX && rdp->qlen <= qlowmark)
-        rdp->blimit = blimit;
-    if (!rdp->donelist)
-        rdp->donetail = &rdp->donelist;
-    else
-    {
-        rdp->process_callbacks = true;
-        raise_softirq(RCU_SOFTIRQ);
-    }
-}
-
-/*
- * Grace period handling:
- * The grace period handling consists out of two steps:
- * - A new grace period is started.
- *   This is done by rcu_start_batch. The start is not broadcasted to
- *   all cpus, they must pick this up by comparing rcp->cur with
- *   rdp->quiescbatch. All cpus are recorded  in the
- *   rcu_ctrlblk.cpumask bitmap.
- * - All cpus must go through a quiescent state.
- *   Since the start of the grace period is not broadcasted, at least two
- *   calls to rcu_check_quiescent_state are required:
- *   The first call just notices that a new grace period is running. The
- *   following calls check if there was a quiescent state since the beginning
- *   of the grace period. If so, it updates rcu_ctrlblk.cpumask. If
- *   the bitmap is empty, then the grace period is completed.
- *   rcu_check_quiescent_state calls rcu_start_batch(0) to start the next grace
- *   period (if necessary).
- */
-/*
- * Register a new batch of callbacks, and start it up if there is currently no
- * active batch and the batch to be registered has not already occurred.
- * Caller must hold rcu_ctrlblk.lock.
- */
-static void rcu_start_batch(struct rcu_ctrlblk *rcp)
-{
-    if (rcp->next_pending &&
-        rcp->completed == rcp->cur) {
-        rcp->next_pending = 0;
+    list_add_tail(&head->list, &rdp->pending);
+    if ( ++rdp->nr > RCU_QUEUE_THRESHOLD )
         /*
-         * next_pending == 0 must be visible in
-         * __rcu_process_callbacks() before it can see new value of cur.
+         * Raise a softirq to attempt to force draining the queue, albeit
+         * there's no guarantee.
          */
-        smp_wmb();
-        rcp->cur++;
-
-       /*
-        * Make sure the increment of rcp->cur is visible so, even if a
-        * CPU that is about to go idle, is captured inside rcp->cpumask,
-        * rcu_pending() will return false, which then means cpu_quiet()
-        * will be invoked, before the CPU would actually enter idle.
-        *
-        * This barrier is paired with the one in rcu_idle_enter().
-        */
-        smp_mb();
-        cpumask_andnot(&rcp->cpumask, &cpu_online_map, &rcp->idle_cpumask);
-    }
-}
-
-/*
- * cpu went through a quiescent state since the beginning of the grace period.
- * Clear it from the cpu mask and complete the grace period if it was the last
- * cpu. Start another grace period if someone has further entries pending
- */
-static void cpu_quiet(int cpu, struct rcu_ctrlblk *rcp)
-{
-    cpumask_clear_cpu(cpu, &rcp->cpumask);
-    if (cpumask_empty(&rcp->cpumask)) {
-        /* batch completed ! */
-        rcp->completed = rcp->cur;
-        rcu_start_batch(rcp);
-    }
+        raise_softirq(RCU_SOFTIRQ);
+    local_irq_restore(flags);
 }
 
-/*
- * Check if the cpu has gone through a quiescent state (say context
- * switch). If so and if it already hasn't done so in this RCU
- * quiescent cycle, then indicate that it has done so.
- */
-static void rcu_check_quiescent_state(struct rcu_ctrlblk *rcp,
-                                      struct rcu_data *rdp)
+#define RCU_MAX_BATCH 10
+static void cf_check rcu_process_callbacks(void)
 {
-    if (rdp->quiescbatch != rcp->cur) {
-        /* start new grace period: */
-        rdp->qs_pending = 1;
-        rdp->quiescbatch = rcp->cur;
-        return;
-    }
-
-    /* Grace period already completed for this cpu?
-     * qs_pending is checked instead of the actual bitmap to avoid
-     * cacheline trashing.
-     */
-    if (!rdp->qs_pending)
-        return;
-
-    rdp->qs_pending = 0;
+    static DEFINE_PER_CPU(cpumask_t, rcu_scratch);
+    cpumask_t *in_rcu = &this_cpu(rcu_scratch);
+    struct rcu_data *rdp = &this_cpu(rcu_data);
+    unsigned int queued = 0, cpu;
+    LIST_HEAD(expired);
+    struct rcu_head *rcu;
 
-    spin_lock(&rcp->lock);
     /*
-     * rdp->quiescbatch/rcp->cur and the cpu bitmap can come out of sync
-     * during cpu startup. Ignore the quiescent state.
+     * Populate a cpumask with any CPUs inside RCU critical regions.  Note that
+     * CPUs entering past this point are of no interest, they will certainly
+     * use an epoch past any queued callbacks here.
      */
-    if (likely(rdp->quiescbatch == rcp->cur))
-        cpu_quiet(rdp->cpu, rcp);
-
-    spin_unlock(&rcp->lock);
-}
-
-
-/*
- * This does the RCU processing work from softirq context. 
- */
-static void __rcu_process_callbacks(struct rcu_ctrlblk *rcp,
-                                    struct rcu_data *rdp)
-{
-    if (rdp->curlist && !rcu_batch_before(rcp->completed, rdp->batch)) {
-        *rdp->donetail = rdp->curlist;
-        rdp->donetail = rdp->curtail;
-        rdp->curlist = NULL;
-        rdp->curtail = &rdp->curlist;
-    }
-
-    local_irq_disable();
-    if (rdp->nxtlist && !rdp->curlist) {
-        rdp->curlist = rdp->nxtlist;
-        rdp->curtail = rdp->nxttail;
-        rdp->nxtlist = NULL;
-        rdp->nxttail = &rdp->nxtlist;
-        local_irq_enable();
-
+    cpumask_clear(in_rcu);
+    for_each_online_cpu ( cpu )
+        if ( ACCESS_ONCE(per_cpu(rcu_lock_cnt, cpu)) )
+            __cpumask_set_cpu(cpu, in_rcu);
+
+    while ( queued < RCU_MAX_BATCH &&
+            (rcu = list_first_entry_or_null(&rdp->pending, struct rcu_head,
+                                            list)) )
+    {
         /*
-         * start the next batch of callbacks
-         */
-
-        /* determine batch number */
-        rdp->batch = rcp->cur + 1;
-        /* see the comment and corresponding wmb() in
-         * the rcu_start_batch()
+         * Fetching rcu_lock_epoch out of order is not a concern here: in the
+         * worst case it's going to result in an older more restrictive epoch
+         * being checked against.  Note the adding of a callback issues a
+         * arch_fetch_and_add() which is a barrier on itself, and guarantees
+         * remote changes to the CPU mask to be visible here.
          */
-        smp_rmb();
-
-        if (!rcp->next_pending) {
-            /* and start it/schedule start if it's a new batch */
-            spin_lock(&rcp->lock);
-            rcp->next_pending = 1;
-            rcu_start_batch(rcp);
-            spin_unlock(&rcp->lock);
-        }
-    } else {
-        local_irq_enable();
+        for_each_cpu ( cpu, in_rcu )
+            if ( (int)(ACCESS_ONCE(per_cpu(rcu_lock_epoch, cpu)) -
+                       rcu->added) <= 0 )
+                /*
+                 * Callbacks are sorted, exit loop as soon as we find one that
+                 * can't be processed yet.
+                 */
+                goto process;
+
+        list_del(&rcu->list);
+        list_add_tail(&rcu->list, &expired);
+        ASSERT(rdp->nr);
+        rdp->nr--;
+        queued++;
     }
-    rcu_check_quiescent_state(rcp, rdp);
-    if (rdp->donelist)
-        rcu_do_batch(rdp);
-}
 
-static void cf_check rcu_process_callbacks(void)
-{
-    struct rcu_data *rdp = &this_cpu(rcu_data);
+    if ( queued == RCU_MAX_BATCH && rdp->nr )
+        /* There's more work to do, yield and raise a softirq to come back. */
+        raise_softirq(RCU_SOFTIRQ);
 
-    if ( rdp->process_callbacks )
+ process:
+    while ( (rcu = list_first_entry_or_null(&expired, struct rcu_head, list)) )
     {
-        rdp->process_callbacks = false;
-        __rcu_process_callbacks(&rcu_ctrlblk, rdp);
+        list_del(&rcu->list);
+        rcu->func(rcu);
     }
 
     if ( atomic_read(&cpu_count) && !rdp->barrier_active )
@@ -492,33 +293,9 @@ static void cf_check rcu_process_callbacks(void)
     }
 }
 
-static int __rcu_pending(struct rcu_ctrlblk *rcp, struct rcu_data *rdp)
-{
-    /* This cpu has pending rcu entries and the grace period
-     * for them has completed.
-     */
-    if (rdp->curlist && !rcu_batch_before(rcp->completed, rdp->batch))
-        return 1;
-
-    /* This cpu has no pending entries, but there are new entries */
-    if (!rdp->curlist && rdp->nxtlist)
-        return 1;
-
-    /* This cpu has finished callbacks to invoke */
-    if (rdp->donelist)
-        return 1;
-
-    /* The rcu core waits for a quiescent state from the cpu */
-    if (rdp->quiescbatch != rcp->cur || rdp->qs_pending)
-        return 1;
-
-    /* nothing to do */
-    return 0;
-}
-
 bool rcu_pending(unsigned int cpu)
 {
-    return !!__rcu_pending(&rcu_ctrlblk, &per_cpu(rcu_data, cpu));
+    return !!per_cpu(rcu_data, cpu).nr;
 }
 
 /*
@@ -529,15 +306,13 @@ bool rcu_pending(unsigned int cpu)
  */
 bool rcu_needs_cpu(unsigned int cpu)
 {
-    struct rcu_data *rdp = &per_cpu(rcu_data, cpu);
-
-    return (rdp->curlist && !rdp->idle_timer_active) || rcu_pending(cpu);
+    return rcu_pending(cpu);
 }
 
 /*
  * Timer for making sure the CPU where a callback is queued does
  * periodically poke rcu_pending(), so that it will invoke the callback
- * not too late after the end of the grace period.
+ * not too late.
  */
 static void rcu_idle_timer_start(void)
 {
@@ -545,10 +320,9 @@ static void rcu_idle_timer_start(void)
 
     /*
      * Note that we don't check rcu_pending() here. In fact, we don't want
-     * the timer armed on CPUs that are in the process of quiescing while
-     * going idle, unless they really are the ones with a queued callback.
+     * the timer armed on CPUs that don't have pending callbacks.
      */
-    if (likely(!rdp->curlist))
+    if (likely(!rdp->nr))
         return;
 
     set_timer(&rdp->idle_timer, NOW() + idle_timer_period);
@@ -587,7 +361,7 @@ static void cf_check rcu_idle_timer_handler(void* data)
 {
     perfc_incr(rcu_idle_timer);
 
-    if ( !cpumask_empty(&rcu_ctrlblk.cpumask) )
+    if ( this_cpu(rcu_data).nr )
         idle_timer_period = min(idle_timer_period + IDLE_TIMER_PERIOD_INCR,
                                 IDLE_TIMER_PERIOD_MAX);
     else
@@ -597,55 +371,43 @@ static void cf_check rcu_idle_timer_handler(void* data)
 
 void rcu_check_callbacks(unsigned int cpu)
 {
-    struct rcu_data *rdp = &this_cpu(rcu_data);
-
-    rdp->process_callbacks = true;
     raise_softirq(RCU_SOFTIRQ);
 }
 
-static void rcu_move_batch(struct rcu_data *this_rdp, struct rcu_head *list,
-                           struct rcu_head **tail)
+/* Sorting functions for RCU list concatenation when a CPU goes offline. */
+static int cmp_rcu(void *priv, struct list_head *a, struct list_head *b)
 {
-    local_irq_disable();
-    *this_rdp->nxttail = list;
-    if (list)
-        this_rdp->nxttail = tail;
-    local_irq_enable();
+    const struct rcu_head *l = container_of(a, struct rcu_head, list),
+                          *r = container_of(b, struct rcu_head, list);
+
+    return (int)(l->added - r->added);
 }
 
 static void rcu_offline_cpu(struct rcu_data *this_rdp,
-                            struct rcu_ctrlblk *rcp, struct rcu_data *rdp)
+                            struct rcu_data *rdp)
 {
     kill_timer(&rdp->idle_timer);
 
-    /* If the cpu going offline owns the grace period we can block
-     * indefinitely waiting for it, so flush it here.
-     */
-    spin_lock(&rcp->lock);
-    if (rcp->cur != rcp->completed)
-        cpu_quiet(rdp->cpu, rcp);
-    spin_unlock(&rcp->lock);
-
-    rcu_move_batch(this_rdp, rdp->donelist, rdp->donetail);
-    rcu_move_batch(this_rdp, rdp->curlist, rdp->curtail);
-    rcu_move_batch(this_rdp, rdp->nxtlist, rdp->nxttail);
+    if ( !rdp->nr )
+        return;
 
+    /*
+     * Append pending callbacks to the current CPU.  By the time this is
+     * executed the CPU going offline cannot be in any RCU critical section or
+     * queue any more RCU work.
+     */
     local_irq_disable();
-    this_rdp->qlen += rdp->qlen;
+    list_splice(&rdp->pending, &this_rdp->pending);
+    this_rdp->nr += rdp->nr;
+    INIT_LIST_HEAD(&rdp->pending);
+    list_sort(NULL, &this_rdp->pending, cmp_rcu);
     local_irq_enable();
 }
 
-static void rcu_init_percpu_data(int cpu, struct rcu_ctrlblk *rcp,
-                                 struct rcu_data *rdp)
+static void rcu_init_percpu_data(int cpu, struct rcu_data *rdp)
 {
     memset(rdp, 0, sizeof(*rdp));
-    rdp->curtail = &rdp->curlist;
-    rdp->nxttail = &rdp->nxtlist;
-    rdp->donetail = &rdp->donelist;
-    rdp->quiescbatch = rcp->completed;
-    rdp->qs_pending = 0;
-    rdp->cpu = cpu;
-    rdp->blimit = blimit;
+    INIT_LIST_HEAD(&rdp->pending);
     init_timer(&rdp->idle_timer, rcu_idle_timer_handler, rdp, cpu);
 }
 
@@ -658,11 +420,11 @@ static int cf_check cpu_callback(
     switch ( action )
     {
     case CPU_UP_PREPARE:
-        rcu_init_percpu_data(cpu, &rcu_ctrlblk, rdp);
+        rcu_init_percpu_data(cpu, rdp);
         break;
     case CPU_UP_CANCELED:
     case CPU_DEAD:
-        rcu_offline_cpu(&this_cpu(rcu_data), &rcu_ctrlblk, rdp);
+        rcu_offline_cpu(&this_cpu(rcu_data), rdp);
         break;
     default:
         break;
@@ -693,36 +455,18 @@ void __init rcu_init(void)
     }
     idle_timer_period = MILLISECS(idle_timer_period_ms);
 
-    cpumask_clear(&rcu_ctrlblk.idle_cpumask);
     cpu_callback(&cpu_nfb, CPU_UP_PREPARE, cpu);
     register_cpu_notifier(&cpu_nfb);
     open_softirq(RCU_SOFTIRQ, rcu_process_callbacks);
 }
 
-/*
- * The CPU is becoming idle, so no more read side critical
- * sections, and one more step toward grace period.
- */
+/* The CPU is becoming idle, ensure pending RCU work will get processed. */
 void rcu_idle_enter(unsigned int cpu)
 {
-    ASSERT(!cpumask_test_cpu(cpu, &rcu_ctrlblk.idle_cpumask));
-    cpumask_set_cpu(cpu, &rcu_ctrlblk.idle_cpumask);
-    /*
-     * If some other CPU is starting a new grace period, we'll notice that
-     * by seeing a new value in rcp->cur (different than our quiescbatch).
-     * That will force us all the way until cpu_quiet(), clearing our bit
-     * in rcp->cpumask, even in case we managed to get in there.
-     *
-     * Se the comment before cpumask_andnot() in  rcu_start_batch().
-     */
-    smp_mb();
-
     rcu_idle_timer_start();
 }
 
 void rcu_idle_exit(unsigned int cpu)
 {
     rcu_idle_timer_stop();
-    ASSERT(cpumask_test_cpu(cpu, &rcu_ctrlblk.idle_cpumask));
-    cpumask_clear_cpu(cpu, &rcu_ctrlblk.idle_cpumask);
 }
diff --git a/xen/include/xen/rcupdate.h b/xen/include/xen/rcupdate.h
index 6c265c672c14..9c3e06bbe6e8 100644
--- a/xen/include/xen/rcupdate.h
+++ b/xen/include/xen/rcupdate.h
@@ -35,6 +35,7 @@
 #include <xen/spinlock.h>
 #include <xen/cpumask.h>
 #include <xen/lib.h>
+#include <xen/list.h>
 #include <xen/percpu.h>
 #include <xen/preempt.h>
 
@@ -72,19 +73,21 @@ static inline bool rcu_quiesce_allowed(void)
 
 /**
  * struct rcu_head - callback structure for use with RCU
- * @next: next update requests in a list
+ * @list: list anchor.
  * @func: actual update function to call after the grace period.
+ * @added: epoch when the callback was added.
  */
 struct rcu_head {
-    struct rcu_head *next;
+    struct list_head list;
     void (*func)(struct rcu_head *head);
     unsigned int added;
 };
 
-#define RCU_HEAD_INIT   { .next = NULL, .func = NULL }
-#define RCU_HEAD(head) struct rcu_head head = RCU_HEAD_INIT
+#define RCU_HEAD_INIT(head)   { .list = LIST_HEAD_INIT((head).list), \
+                                .func = NULL }
+#define RCU_HEAD(head) struct rcu_head head = RCU_HEAD_INIT(head)
 #define INIT_RCU_HEAD(ptr) do { \
-       (ptr)->next = NULL; (ptr)->func = NULL; \
+    INIT_LIST_HEAD(&(ptr)->list); (ptr)->func = NULL; \
 } while (0)
 
 
-- 
2.53.0


