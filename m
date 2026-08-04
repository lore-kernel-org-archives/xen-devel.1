Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FC3BC55822
	for <xen-devel@archiver.kernel.org>; Tue,  4 Aug 2026 05:55:03 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1381883.1625333 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wr86w-0000M4-RW; Tue, 04 Aug 2026 05:54:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1381883.1625333; Tue, 04 Aug 2026 05:54:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wr86w-0000Lv-Nl; Tue, 04 Aug 2026 05:54:46 +0000
Received: by outflank-mailman (input) for mailman id 1381883;
 Tue, 04 Aug 2026 05:54:45 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <frn1furkan10@gmail.com>) id 1wr86v-0000LU-71
 for xen-devel@lists.xenproject.org; Tue, 04 Aug 2026 05:54:45 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wr86u-00DoJM-Gc
 for xen-devel@lists.xenproject.org; Tue, 04 Aug 2026 07:54:44 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <frn1furkan10@gmail.com>)
 id 6a717e93-2eae-0a2a0a5409dd-0a2a4504e2c6-20
 for <xen-devel@lists.xenproject.org>; Tue, 04 Aug 2026 07:54:44 +0200
Received: from [209.85.128.44] (helo=mail-wm1-f44.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <frn1furkan10@gmail.com>)
 id 6a717ea4-b57f-0a2a45040019-d155802cb57b-3
 for <xen-devel@lists.xenproject.org>; Tue, 04 Aug 2026 07:54:44 +0200
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-49557167508so25172265e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 03 Aug 2026 22:54:44 -0700 (PDT)
Received: from notebook.. ([78.173.117.189]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4994a100e14sm55453775e9.14.2026.08.03.22.54.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Aug 2026 22:54:43 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785822884; x=1786427684; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8ggoOmXMwyCogxzBnBzSfIP7aGxj9wPFdRUdL5Ji3Ko=;
        b=G60Am7tK6ST+k+DGPtB7LfQROY7sRE6nvpaBiOv67VWd3KMROhxZMNVQ6dlYOY/ufm
         AqYJIWfXpIuLlljql9PNPGQkP2QIzL1o8gqa0wwCnTgBmZoLy49nA4rLbjmzvQjeb4Fl
         KcuxSG+qYL/yuadwdFgOpa1LLW/J39l8XgkbItr/Qx8QNDhpNJBL7spssCHmqbDPFNRK
         DVOx6jXRiFd2YNCr2XVvwI5UIHgClQOECpx1/aPJqCe6mbwIqyjQw3msfjd/SzVLX0j6
         1meQz0fNF0Ggwg5h4AXaZq7Vv/qvVpqR4w1gzPwg2Ml/PqSJBuH/skgfL3eq4jROm/gI
         5bRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785822884; x=1786427684;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8ggoOmXMwyCogxzBnBzSfIP7aGxj9wPFdRUdL5Ji3Ko=;
        b=UY9UZuzQpzpV2+IMrjvPme7UR8i2jHA67YRWtVgcgEmqFs9Zsmx6epWmjxcbMc2AGe
         qKF3aAmjjCvAZPwMRPZ6B9kr9LPdDTiB5tg9UM76RUjVFE7WQSF2VtU9TRmGxjfVMbjk
         V+JSXY3glQVzFd87qxMsnA+mhrWMvl/0SJH6RrfhxRoM7tTracXKHXYfCobcRNLbd9X0
         /V2s0hUS7uAVYvn5/zhNSLee0gA4j/rlTXrLBd1sbDFtzOPgPqdv8p/UyLD/jZ/gQUAv
         TH/rWgRCskyStS5AAw5OoQttoqI8O1Uw8+Fey2CccAfgoaVYfcLO2OidOLdG2Xwc4yqJ
         OEuA==
X-Gm-Message-State: AOJu0Yw+zNhkp8LJw9CfChYbnJhIZ5S7j7MpPLfu3bka3vxhTMD8Nzeb
	0LE/wRkqr+FQASy2txUEPLtryEbF06310ZjSnTnzHLoT8qZE5cQ6r0lS4H+O1g==
X-Gm-Gg: AR+sD10Tg/Z4ddVzvSDYH8ti//09EmoXLg7h0XMKPxEiBOSBoQQaD8al6GCmGxEYm5A
	3MoMkADvwqow6xrihmQhhmtLO3vAwFy1K/VEgDvx/FIVQhUMLPxSBu/pEEFOf3SQHPUgQ6xYb86
	xNs65kIi/zajKcDxXc5FLPd3L0k8dstX55eVTg1RNKRFt5Yo0ZI5l9nGiwneAVJLsi8Wmqi/KLz
	WF54RJpfcY4wVWbp7vEYBdv2ZszNx2hyfumgM0q4URvE6S0ga9pSPgu6S0HENtI2jtUJwniKOFO
	drFof1mCOHQS2r9KcWo/dX2pnvTX7pp5/wm501pzBDccmHRbAiGvbdBNHaePnEY4i+pwOM23K2c
	G9cn/jPF/XPhziPAfko5AaohXUpS+Xo3WuuMipRV3cgjqfsU07EsmCMBUu9w9gs5zDcAMNbEmhd
	gv4SrvBYC3wc/5t5/eAafAP/6Y93khyStEeOU30Mwj95GuOjJ+5rRVoqYHQVXVt9+4OHaGL2ka
X-Received: by 2002:a05:600c:4453:b0:495:6274:56c2 with SMTP id 5b1f17b1804b1-4980c649c6emr272532265e9.2.1785822883826;
        Mon, 03 Aug 2026 22:54:43 -0700 (PDT)
From: Furkan Caliskan <frn1furkan10@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com,
	jbeulich@suse.com,
	jgross@suse.com,
	gwd@xenproject.org,
	dfaggioli@suse.com,
	stewart.hildebrand@amd.com,
	nathan.studer@dornerworks.com,
	roger@xenproject.org,
	anthony.perard@vates.tech,
	julien@xen.org,
	sstabellini@kernel.org,
	michal.orzel@amd.com,
	bertrand.marquis@arm.com,
	Volodymyr_Babchuk@epam.com,
	teddy.astie@vates.tech,
	tpearson@raptorengineering.com,
	alistair.francis@wdc.com,
	connojdavis@gmail.com,
	Furkan Caliskan <frn1furkan10@gmail.com>
Subject: [PATCH v2 1/2] xen/sched: split scheduler vtable from struct scheduler
Date: Tue,  4 Aug 2026 08:53:26 +0300
Message-Id: <20260804055327.22119-2-frn1furkan10@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260804055327.22119-1-frn1furkan10@gmail.com>
References: <20260804055327.22119-1-frn1furkan10@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ebf023/1785822884-506DAB50-A98A8F2D/0/0
X-purgate-type: clean
X-purgate-size: 20100

struct scheduler currently serves two purposes: it is the static
vtable a scheduler backend defines (name, opt_name, sched_id, and
all its function pointers), and it is also the per-cpupool runtime
object scheduler_alloc() allocates. Being the same type forces
scheduler_alloc() to memcpy() the whole vtable into a fresh
allocation per cpupool, duplicating identical function pointers
across every cpupool using the same scheduler.

Split the vtable out into its own type, struct sched_ops, so it
can be shared by every cpupool using a given scheduler instead of
copied per cpupool. struct scheduler is left holding only what is
actually per-instance: a pointer to the shared sched_ops, plus
sched_data and cpupool. scheduler_alloc() now stores a pointer to
the matching sched_ops instance instead of copying its fields, and
every accessor in private.h is updated from s->field to
s->ops->field to match.

Every in-tree scheduler backend (credit, credit2, rtds, arinc653,
null) is converted from struct scheduler to struct sched_ops.

A handful of call sites elsewhere read a scheduler's name,
opt_name or sched_id directly and are updated to go through
->ops as well.

Signed-off-by: Furkan Caliskan <frn1furkan10@gmail.com>
---
 xen/common/sched/arinc653.c |  9 +---
 xen/common/sched/core.c     | 52 +++++++++++---------
 xen/common/sched/cpupool.c  |  7 +--
 xen/common/sched/credit.c   |  3 +-
 xen/common/sched/credit2.c  |  3 +-
 xen/common/sched/null.c     |  3 +-
 xen/common/sched/private.h  | 98 +++++++++++++++++++------------------
 xen/common/sched/rt.c       |  3 +-
 8 files changed, 89 insertions(+), 89 deletions(-)

diff --git a/xen/common/sched/arinc653.c b/xen/common/sched/arinc653.c
index 32c596a23c..746963806e 100644
--- a/xen/common/sched/arinc653.c
+++ b/xen/common/sched/arinc653.c
@@ -702,17 +702,10 @@ a653sched_adjust_global(const struct scheduler *ops,
 }
 #endif /* CONFIG_SYSCTL */
 
-/**
- * This structure defines our scheduler for Xen.
- * The entries tell Xen where to find our scheduler-specific
- * callback functions.
- * The symbol must be visible to the rest of Xen at link time.
- */
-static const struct scheduler sched_arinc653_def = {
+static const struct sched_ops sched_arinc653_def = {
     .name           = "ARINC 653 Scheduler",
     .opt_name       = "arinc653",
     .sched_id       = XEN_SCHEDULER_ARINC653,
-    .sched_data     = NULL,
 
     .init           = a653sched_init,
     .deinit         = a653sched_deinit,
diff --git a/xen/common/sched/core.c b/xen/common/sched/core.c
index 9ccf5811bf..5cdae0415c 100644
--- a/xen/common/sched/core.c
+++ b/xen/common/sched/core.c
@@ -87,7 +87,7 @@ DEFINE_PER_CPU(cpumask_t, cpumask_scratch);
 /* How many urgent vcpus. */
 DEFINE_PER_CPU(atomic_t, sched_urgent_count);
 
-extern const struct scheduler *__start_schedulers_array[], *__end_schedulers_array[];
+extern const struct sched_ops *__start_schedulers_array[], *__end_schedulers_array[];
 #define NUM_SCHEDULERS (__end_schedulers_array - __start_schedulers_array)
 #define schedulers __start_schedulers_array
 
@@ -127,10 +127,9 @@ static void cf_check sched_idle_schedule(
     unit->next_task = sched_idle_unit(cpu);
 }
 
-static struct scheduler sched_idle_ops = {
+static struct sched_ops sched_idle_sched_ops = {
     .name           = "Idle Scheduler",
     .opt_name       = "idle",
-    .sched_data     = NULL,
 
     .pick_resource  = sched_idle_res_pick,
     .do_schedule    = sched_idle_schedule,
@@ -139,6 +138,11 @@ static struct scheduler sched_idle_ops = {
     .free_udata     = sched_idle_free_udata,
 };
 
+static struct scheduler sched_idle_ops = {
+    .ops        = &sched_idle_sched_ops,
+    .sched_data = NULL,
+};
+
 static inline struct vcpu *unit2vcpu_cpu(const struct sched_unit *unit,
                                          unsigned int cpu)
 {
@@ -2081,7 +2085,7 @@ long do_set_timer_op(s_time_t timeout)
 /* scheduler_id - fetch ID of current scheduler */
 int scheduler_id(void)
 {
-    return operations.sched_id;
+    return operations.ops->sched_id;
 }
 #endif
 
@@ -2090,7 +2094,7 @@ long sched_adjust(struct domain *d, struct xen_domctl_scheduler_op *op)
 {
     long ret;
 
-    if ( op->sched_id != dom_scheduler(d)->sched_id )
+    if ( op->sched_id != dom_scheduler(d)->ops->sched_id )
         return -EINVAL;
 
     switch ( op->cmd )
@@ -2132,7 +2136,7 @@ long sched_adjust_global(struct xen_sysctl_scheduler_op *op)
 
     rcu_read_lock(&sched_res_rculock);
 
-    rc = ((op->sched_id == pool->sched->sched_id)
+    rc = ((op->sched_id == pool->sched->ops->sched_id)
           ? sched_adjust_cpupool(pool->sched, op) : -EINVAL);
 
     rcu_read_unlock(&sched_res_rculock);
@@ -2299,7 +2303,7 @@ static struct sched_unit *do_schedule(struct sched_unit *prev, s_time_t now,
     struct sched_unit *next;
 
     /* get policy-specific decision on scheduling... */
-    sched->do_schedule(sched, prev, now, sched_tasklet_check(cpu));
+    sched->ops->do_schedule(sched, prev, now, sched_tasklet_check(cpu));
 
     next = prev->next_task;
 
@@ -2989,10 +2993,9 @@ void scheduler_enable(void)
 }
 
 static inline
-const struct scheduler *__init sched_get_by_name(const char *sched_name)
+const struct sched_ops *__init sched_ops_get_by_name(const char* sched_name)
 {
     unsigned int i;
-
     for ( i = 0; i < NUM_SCHEDULERS; i++ )
         if ( schedulers[i] && !strcmp(schedulers[i]->opt_name, sched_name) )
             return schedulers[i];
@@ -3002,16 +3005,15 @@ const struct scheduler *__init sched_get_by_name(const char *sched_name)
 
 int __init sched_get_id_by_name(const char *sched_name)
 {
-    const struct scheduler *scheduler = sched_get_by_name(sched_name);
-
-    return scheduler ? scheduler->sched_id : -1;
+    const struct sched_ops *ops = sched_ops_get_by_name(sched_name);
+    return ops ? ops->sched_id : -1;
 }
 
 /* Initialise the data structures. */
 void __init scheduler_init(void)
 {
     struct domain *idle_domain;
-    const struct scheduler *scheduler;
+    const struct sched_ops *ops;
     int i;
 
     scheduler_enable();
@@ -3044,21 +3046,23 @@ void __init scheduler_init(void)
         }
     }
 
-    scheduler = sched_get_by_name(opt_sched);
-    if ( !scheduler )
+    ops = sched_ops_get_by_name(opt_sched);
+    if ( !ops )
     {
         printk("Could not find scheduler: %s\n", opt_sched);
-        scheduler = sched_get_by_name(CONFIG_SCHED_DEFAULT);
-        BUG_ON(!scheduler);
-        printk("Using '%s' (%s)\n", scheduler->name, scheduler->opt_name);
+        ops = sched_ops_get_by_name(CONFIG_SCHED_DEFAULT);
+        BUG_ON(!ops);
+        printk("Using '%s' (%s)\n", ops->name, ops->opt_name);
     }
-    operations = *scheduler;
+
+    operations.ops = ops;
 
     if ( cpu_schedule_up(0) )
         BUG();
     register_cpu_notifier(&cpu_schedule_nfb);
 
-    printk("Using scheduler: %s (%s)\n", operations.name, operations.opt_name);
+    printk("Using scheduler: %s (%s)\n",
+           operations.ops->name, operations.ops->opt_name);
     if ( sched_init(&operations) )
         panic("scheduler returned error on init\n");
 
@@ -3411,12 +3415,14 @@ struct scheduler *scheduler_alloc(unsigned int sched_id)
     for ( i = 0; i < NUM_SCHEDULERS; i++ )
         if ( schedulers[i] && schedulers[i]->sched_id == sched_id )
             goto found;
+
     return ERR_PTR(-ENOENT);
 
  found:
-    if ( (sched = xmalloc(struct scheduler)) == NULL )
+    if ( (sched = xzalloc(struct scheduler)) == NULL )
         return ERR_PTR(-ENOMEM);
-    memcpy(sched, schedulers[i], sizeof(*sched));
+    sched->ops = schedulers[i];
+
     if ( (ret = sched_init(sched)) != 0 )
     {
         xfree(sched);
@@ -3447,7 +3453,7 @@ void schedule_dump(struct cpupool *c)
     {
         sched = c->sched;
         cpus = c->res_valid;
-        printk("Scheduler: %s (%s)\n", sched->name, sched->opt_name);
+        printk("Scheduler: %s (%s)\n", sched->ops->name, sched->ops->opt_name);
         sched_dump_settings(sched);
     }
     else
diff --git a/xen/common/sched/cpupool.c b/xen/common/sched/cpupool.c
index 081e1053eb..640578201f 100644
--- a/xen/common/sched/cpupool.c
+++ b/xen/common/sched/cpupool.c
@@ -338,7 +338,8 @@ static struct cpupool *cpupool_create(unsigned int poolid,
     spin_unlock(&cpupool_lock);
 
     debugtrace_printk("Created cpupool %u with scheduler %s (%s)\n",
-                      c->cpupool_id, c->sched->name, c->sched->opt_name);
+                      c->cpupool_id, c->sched->ops->name,
+                      c->sched->ops->opt_name);
 
     return c;
 
@@ -862,7 +863,7 @@ int cpupool_do_sysctl(struct xen_sysctl_cpupool_op *op)
         if ( c == NULL )
             break;
         op->cpupool_id = c->cpupool_id;
-        op->sched_id = c->sched->sched_id;
+        op->sched_id = c->sched->ops->sched_id;
         op->n_dom = c->n_dom;
         ret = cpumask_to_xenctl_bitmap(&op->cpumap, c->cpu_valid);
         cpupool_put(c);
@@ -1294,7 +1295,7 @@ struct cpupool *__init cpupool_create_pool(unsigned int pool_id, int sched_id)
     struct cpupool *pool;
 
     if ( sched_id < 0 )
-        sched_id = scheduler_get_default()->sched_id;
+        sched_id = scheduler_get_default()->ops->sched_id;
 
     pool = cpupool_create(pool_id, sched_id);
 
diff --git a/xen/common/sched/credit.c b/xen/common/sched/credit.c
index 4dde2ede12..8df746bf6b 100644
--- a/xen/common/sched/credit.c
+++ b/xen/common/sched/credit.c
@@ -2277,11 +2277,10 @@ csched_deinit(struct scheduler *ops)
     }
 }
 
-static const struct scheduler sched_credit_def = {
+static const struct sched_ops sched_credit_def = {
     .name           = "SMP Credit Scheduler",
     .opt_name       = "credit",
     .sched_id       = XEN_SCHEDULER_CREDIT,
-    .sched_data     = NULL,
 
     .global_init    = csched_global_init,
 
diff --git a/xen/common/sched/credit2.c b/xen/common/sched/credit2.c
index 95946634d1..4949606881 100644
--- a/xen/common/sched/credit2.c
+++ b/xen/common/sched/credit2.c
@@ -4230,11 +4230,10 @@ csched2_deinit(struct scheduler *ops)
     xfree(prv);
 }
 
-static const struct scheduler sched_credit2_def = {
+static const struct sched_ops sched_credit2_def = {
     .name           = "SMP Credit Scheduler rev2",
     .opt_name       = "credit2",
     .sched_id       = XEN_SCHEDULER_CREDIT2,
-    .sched_data     = NULL,
 
     .global_init    = csched2_global_init,
 
diff --git a/xen/common/sched/null.c b/xen/common/sched/null.c
index 952bb47444..b3c6651fb1 100644
--- a/xen/common/sched/null.c
+++ b/xen/common/sched/null.c
@@ -1037,11 +1037,10 @@ static void cf_check null_dump(const struct scheduler *ops)
     spin_unlock_irqrestore(&prv->lock, flags);
 }
 
-static const struct scheduler sched_null_def = {
+static const struct sched_ops sched_null_def = {
     .name           = "null Scheduler",
     .opt_name       = "null",
     .sched_id       = XEN_SCHEDULER_NULL,
-    .sched_data     = NULL,
 
     .init           = null_init,
     .deinit         = null_deinit,
diff --git a/xen/common/sched/private.h b/xen/common/sched/private.h
index d6884550cd..0c5181891c 100644
--- a/xen/common/sched/private.h
+++ b/xen/common/sched/private.h
@@ -294,12 +294,10 @@ static inline spinlock_t *pcpu_schedule_trylock(unsigned int cpu)
     return NULL;
 }
 
-struct scheduler {
-    const char *name;       /* full name for this scheduler      */
-    const char *opt_name;   /* option name for this scheduler    */
-    unsigned int sched_id;  /* ID for this scheduler             */
-    void *sched_data;       /* global data pointer               */
-    struct cpupool *cpupool;/* points to this scheduler's pool   */
+struct sched_ops {
+    const char *name;       /* full name for this sched_ops      */
+    const char *opt_name;   /* option name for this sched_ops    */
+    unsigned int sched_id;  /* ID for this sched_ops             */
 
     int          (*global_init)    (void);
 
@@ -366,127 +364,133 @@ struct scheduler {
                                     struct sched_resource *sr);
 };
 
+struct scheduler {
+    const struct sched_ops *ops; /* shared, read-only dispatch table */
+    void *sched_data;            /* global data pointer               */
+    struct cpupool *cpupool;     /* points to this scheduler's pool   */
+};
+
 static inline int sched_init(struct scheduler *s)
 {
-    return s->init(s);
+    return s->ops->init(s);
 }
 
 static inline void sched_deinit(struct scheduler *s)
 {
-    s->deinit(s);
+    s->ops->deinit(s);
 }
 
 static inline spinlock_t *sched_switch_sched(struct scheduler *s,
                                              unsigned int cpu,
                                              void *pdata, void *vdata)
 {
-    return s->switch_sched(s, cpu, pdata, vdata);
+    return s->ops->switch_sched(s, cpu, pdata, vdata);
 }
 
 static inline void sched_dump_settings(const struct scheduler *s)
 {
-    if ( s->dump_settings )
-        s->dump_settings(s);
+    if ( s->ops->dump_settings )
+        s->ops->dump_settings(s);
 }
 
 static inline void sched_dump_cpu_state(const struct scheduler *s, int cpu)
 {
-    if ( s->dump_cpu_state )
-        s->dump_cpu_state(s, cpu);
+    if ( s->ops->dump_cpu_state )
+        s->ops->dump_cpu_state(s, cpu);
 }
 
 static inline void *sched_alloc_domdata(const struct scheduler *s,
                                         struct domain *d)
 {
-    return s->alloc_domdata ? s->alloc_domdata(s, d) : NULL;
+    return s->ops->alloc_domdata ? s->ops->alloc_domdata(s, d) : NULL;
 }
 
 static inline void sched_free_domdata(const struct scheduler *s,
                                       void *data)
 {
-    ASSERT(s->free_domdata || !data);
-    if ( s->free_domdata )
-        s->free_domdata(s, data);
+    ASSERT(s->ops->free_domdata || !data);
+    if ( s->ops->free_domdata )
+        s->ops->free_domdata(s, data);
 }
 
 static inline void *sched_alloc_pdata(const struct scheduler *s, int cpu)
 {
-    return s->alloc_pdata ? s->alloc_pdata(s, cpu) : NULL;
+    return s->ops->alloc_pdata ? s->ops->alloc_pdata(s, cpu) : NULL;
 }
 
 static inline void sched_free_pdata(const struct scheduler *s, void *data,
                                     int cpu)
 {
-    ASSERT(s->free_pdata || !data);
-    if ( s->free_pdata )
-        s->free_pdata(s, data, cpu);
+    ASSERT(s->ops->free_pdata || !data);
+    if ( s->ops->free_pdata )
+        s->ops->free_pdata(s, data, cpu);
 }
 
 static inline void sched_deinit_pdata(const struct scheduler *s, void *data,
                                       int cpu)
 {
-    if ( s->deinit_pdata )
-        s->deinit_pdata(s, data, cpu);
+    if ( s->ops->deinit_pdata )
+        s->ops->deinit_pdata(s, data, cpu);
 }
 
 static inline void *sched_alloc_udata(const struct scheduler *s,
                                       struct sched_unit *unit, void *dom_data)
 {
-    return s->alloc_udata(s, unit, dom_data);
+    return s->ops->alloc_udata(s, unit, dom_data);
 }
 
 static inline void sched_free_udata(const struct scheduler *s, void *data)
 {
-    s->free_udata(s, data);
+    s->ops->free_udata(s, data);
 }
 
 static inline void sched_insert_unit(const struct scheduler *s,
                                      struct sched_unit *unit)
 {
-    if ( s->insert_unit )
-        s->insert_unit(s, unit);
+    if ( s->ops->insert_unit )
+        s->ops->insert_unit(s, unit);
 }
 
 static inline void sched_remove_unit(const struct scheduler *s,
                                      struct sched_unit *unit)
 {
-    if ( s->remove_unit )
-        s->remove_unit(s, unit);
+    if ( s->ops->remove_unit )
+        s->ops->remove_unit(s, unit);
 }
 
 static inline void sched_sleep(const struct scheduler *s,
                                struct sched_unit *unit)
 {
-    if ( s->sleep )
-        s->sleep(s, unit);
+    if ( s->ops->sleep )
+        s->ops->sleep(s, unit);
 }
 
 static inline void sched_wake(const struct scheduler *s,
                               struct sched_unit *unit)
 {
-    if ( s->wake )
-        s->wake(s, unit);
+    if ( s->ops->wake )
+        s->ops->wake(s, unit);
 }
 
 static inline void sched_yield(const struct scheduler *s,
                                struct sched_unit *unit)
 {
-    if ( s->yield )
-        s->yield(s, unit);
+    if ( s->ops->yield )
+        s->ops->yield(s, unit);
 }
 
 static inline void sched_context_saved(const struct scheduler *s,
                                        struct sched_unit *unit)
 {
-    if ( s->context_saved )
-        s->context_saved(s, unit);
+    if ( s->ops->context_saved )
+        s->ops->context_saved(s, unit);
 }
 
 static inline void sched_migrate(const struct scheduler *s,
                                  struct sched_unit *unit, unsigned int cpu)
 {
-    if ( s->migrate )
-        s->migrate(s, unit, cpu);
+    if ( s->ops->migrate )
+        s->ops->migrate(s, unit, cpu);
     else
         sched_set_res(unit, get_sched_res(cpu));
 }
@@ -494,7 +498,7 @@ static inline void sched_migrate(const struct scheduler *s,
 static inline struct sched_resource *sched_pick_resource(
     const struct scheduler *s, const struct sched_unit *unit)
 {
-    return s->pick_resource(s, unit);
+    return s->ops->pick_resource(s, unit);
 }
 
 static inline void sched_adjust_affinity(const struct scheduler *s,
@@ -502,29 +506,29 @@ static inline void sched_adjust_affinity(const struct scheduler *s,
                                          const cpumask_t *hard,
                                          const cpumask_t *soft)
 {
-    if ( s->adjust_affinity )
-        s->adjust_affinity(s, unit, hard, soft);
+    if ( s->ops->adjust_affinity )
+        s->ops->adjust_affinity(s, unit, hard, soft);
 }
 
 static inline int sched_adjust_dom(const struct scheduler *s, struct domain *d,
                                    struct xen_domctl_scheduler_op *op)
 {
-    return s->adjust ? s->adjust(s, d, op) : 0;
+    return s->ops->adjust ? s->ops->adjust(s, d, op) : 0;
 }
 
 #ifdef CONFIG_SYSCTL
 static inline int sched_adjust_cpupool(const struct scheduler *s,
                                        struct xen_sysctl_scheduler_op *op)
 {
-    return s->adjust_global ? s->adjust_global(s, op) : 0;
+    return s->ops->adjust_global ? s->ops->adjust_global(s, op) : 0;
 }
 #endif
 
 static inline void sched_move_timers(const struct scheduler *s,
                                      struct sched_resource *sr)
 {
-    if ( s->move_timers )
-        s->move_timers(s, sr);
+    if ( s->ops->move_timers )
+        s->ops->move_timers(s, sr);
 }
 
 static inline void sched_unit_pause_nosync(const struct sched_unit *unit)
@@ -543,7 +547,7 @@ static inline void sched_unit_unpause(const struct sched_unit *unit)
         vcpu_unpause(v);
 }
 
-#define REGISTER_SCHEDULER(x) static const struct scheduler *x##_entry \
+#define REGISTER_SCHEDULER(x) static const struct sched_ops *x##_entry \
   __used_section(".data.schedulers") = &(x)
 
 struct cpupool
diff --git a/xen/common/sched/rt.c b/xen/common/sched/rt.c
index 744f214173..0e9f04ea72 100644
--- a/xen/common/sched/rt.c
+++ b/xen/common/sched/rt.c
@@ -1617,11 +1617,10 @@ static void cf_check repl_timer_handler(void *data)
     spin_unlock_irq(&prv->lock);
 }
 
-static const struct scheduler sched_rtds_def = {
+static const struct sched_ops sched_rtds_def = {
     .name           = "SMP RTDS Scheduler",
     .opt_name       = "rtds",
     .sched_id       = XEN_SCHEDULER_RTDS,
-    .sched_data     = NULL,
 
     .dump_cpu_state = rt_dump_pcpu,
     .dump_settings  = rt_dump,
-- 
2.34.1


