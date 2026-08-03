Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E22FC5516F
	for <xen-devel@archiver.kernel.org>; Mon,  3 Aug 2026 05:07:57 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1381131.1624709 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wqktu-0005Mh-EJ; Mon, 03 Aug 2026 05:07:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1381131.1624709; Mon, 03 Aug 2026 05:07:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wqktu-0005Ll-BI; Mon, 03 Aug 2026 05:07:46 +0000
Received: by outflank-mailman (input) for mailman id 1381131;
 Mon, 03 Aug 2026 05:07:44 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <frn1furkan10@gmail.com>) id 1wqkts-0005Gb-Lx
 for xen-devel@lists.xenproject.org; Mon, 03 Aug 2026 05:07:44 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wqkts-003lut-2o
 for xen-devel@lists.xenproject.org; Mon, 03 Aug 2026 07:07:44 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <frn1furkan10@gmail.com>)
 id 6a702215-2eae-0a2a0a5409dd-0a2a45028d14-18
 for <xen-devel@lists.xenproject.org>; Mon, 03 Aug 2026 07:07:44 +0200
Received: from [209.85.128.52] (helo=mail-wm1-f52.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <frn1furkan10@gmail.com>)
 id 6a70221f-6ca4-0a2a45020019-d1558034ccc0-3
 for <xen-devel@lists.xenproject.org>; Mon, 03 Aug 2026 07:07:43 +0200
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-4955aa106b1so15227285e9.0
 for <xen-devel@lists.xenproject.org>; Sun, 02 Aug 2026 22:07:43 -0700 (PDT)
Received: from notebook.. ([78.173.117.153]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49807b917efsm310345185e9.11.2026.08.02.22.07.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Aug 2026 22:07:42 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1785733663; x=1786338463; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Dfo9WveiLxrAqqO79sjLeKOkwe8r7c3VXRClpdMKLaI=;
        b=WnxsgV08P7pAvLdbzi4gu2aO28A/JQqERE42GrWvurPzt1MRNFhXrWPd179i44dp39
         GP/QTO1QU2dMnO6cqsTCl+sbZnm1IW4SmwRkEXLPTDAQffANuDjMNn4DRJR/PsChQPi6
         X/ZfRbik6/ahzjhKWw7qkKeLB81KOK6Kh3mV302zJOMB1eK6c8f+ShgwPFt0+A6bqpwz
         asov8DtioNL4tH6dCN7+O8DuzfpqY89a33Ld6b9m9OgpI4c25F27uO29ygx0ffWAmJGP
         ib2o6qsSR10zdQ1OzY/bVk8AtTUuWVjLo1pv9j/O21usoLk00JTLVFUTygDrzbgUfl4h
         dyVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785733663; x=1786338463;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Dfo9WveiLxrAqqO79sjLeKOkwe8r7c3VXRClpdMKLaI=;
        b=BHB4UvxOXoezvnogpZjXoeuGBae0dyiMr9j6SjEPBe6dc4rmzm3Crk/JSxR6OWIiBD
         V560phCi7MujTWFZNdMUYeuSFJx8icu4Uzgws7p/G+nqZNDRNQhuxnnXL3eTP9zEjwl2
         sHkugO3B9EWoR0U8QZtctW8W7Aa23AKiJIaoLFOrnt1vCPsceSfjqbIgVcszhbsXU2dr
         2IAzFV2lKzvlwolFoj+LciNkKB9speTTju6Gl3VxCkFuWbwbRQZtzpsvGyfs/g78A/X1
         t2jzyQGwxvpM2lJyVRJcnZOsNjYB1TKKNNg1BHD02ljcLjoq4hSvG7yhlaarrbc78hx0
         Bi6g==
X-Gm-Message-State: AOJu0Yzpo2IBp14364b0Cy8P4uJds3/WhzqDLWaKhFMMaViHfABw+sZO
	YSHfZaZbWUVeCvftd/UgRtIquJzVtN/bpm0sw4Ef4j8yU1G6lN3shaCzmRWKkQ==
X-Gm-Gg: AR+sD1292SEmgbWgb49iGWx5xy9mfyDPIFYySsqFy6WYPYYr+gZUkNDNdmU0fMjIcEY
	0rhBqeQC4E6NmEAxFwdBGGSZjzrF/cwk22o6APdw2qnWxJ+Ofn614+Dq7ZH6p5wgY7cczliAsYg
	Nlwlun3tzKy5KlHP5g5zNQNAmF11g3I+JhLPEPpxqM21ZcXVTLOPBrkOWU6cnosDmGhRmwuNqhO
	pVHelQGsVaJLkAOxS3TopyD1TT7IAtha8yb4AnvNfs2nmAbSM/5CQx8JzMQhq5/T9Q5U9WF4n3z
	4/ElqbEaCJR8eKMMz/pI7b4I9inqff3htCZBqcd2MaivFKHsqH2WDuz8mtQNuBFh+Kfh3KOk8PV
	XT5+AxJpaG/LAs5TO5wqBZh24bcPpyAqfsK6Jq3b2U9WCl5SYh9XJ89Veb4Nu0hV7kDYuuWEIMm
	GlUxAR2Qopzo6WOY6xSIJ6dUMvxSseIVz2JxjvkZxB3ycNWrYoYE6iizjAkxWJtg==
X-Received: by 2002:a05:600c:8b14:b0:495:4cb8:42b9 with SMTP id 5b1f17b1804b1-4980c66d8cemr193280875e9.4.1785733663338;
        Sun, 02 Aug 2026 22:07:43 -0700 (PDT)
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
	oleksii.kurochko@gmail.com,
	Furkan Caliskan <frn1furkan10@gmail.com>
Subject: [PATCH 7/7] xen/sched: remove old scheduler registration, shrink struct scheduler
Date: Mon,  3 Aug 2026 08:06:14 +0300
Message-Id: <20260803050614.5222-8-frn1furkan10@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260803050614.5222-1-frn1furkan10@gmail.com>
References: <20260803050614.5222-1-frn1furkan10@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-720697/1785733664-662A92AC-64EF8C7C/0/0
X-purgate-type: clean
X-purgate-size: 25587

Every in-tree scheduler now registers through sched_ops instead of
the original struct-scheduler-as-vtable path, so schedulers[],
REGISTER_SCHEDULER() and NUM_SCHEDULERS have no remaining users.
Remove them and finish the change struct sched_ops was introduced
for: struct scheduler is shrunk down to just its per-cpupool
fields - a pointer to a shared sched_ops, plus sched_data and
cpupool.

scheduler_alloc() now stores a pointer to the matching sched_ops
instance instead of copying every field into a fresh allocation.
Cpupools sharing a scheduler type now share one dispatch table
instead of each holding a private copy of it.

Every accessor in private.h is updated from s->field to
s->ops->field to match. sched_idle_ops is split the same way
every other scheduler was.

A handful of call sites elsewhere read a scheduler's name,
opt_name or sched_id directly and are updated to go through
->ops as well.

Signed-off-by: Furkan Caliskan <frn1furkan10@gmail.com>
---
 xen/arch/arm/xen.lds.S     |   1 -
 xen/arch/ppc/xen.lds.S     |   1 -
 xen/arch/riscv/xen.lds.S   |   1 -
 xen/arch/x86/xen.lds.S     |   1 -
 xen/common/sched/core.c    | 144 +++++-----------------------------
 xen/common/sched/cpupool.c |   6 +-
 xen/common/sched/private.h | 155 ++++++++++---------------------------
 xen/include/xen/xen.lds.h  |   6 --
 8 files changed, 67 insertions(+), 248 deletions(-)

diff --git a/xen/arch/arm/xen.lds.S b/xen/arch/arm/xen.lds.S
index 9a63fa36a0..07bf875599 100644
--- a/xen/arch/arm/xen.lds.S
+++ b/xen/arch/arm/xen.lds.S
@@ -93,7 +93,6 @@ SECTIONS
   .data : {                    /* Data */
        *(.data.page_aligned)
 
-       SCHEDULER_ARRAY
        SCHED_OPS_ARRAY
        HYPFS_PARAM
 
diff --git a/xen/arch/ppc/xen.lds.S b/xen/arch/ppc/xen.lds.S
index da8f73d85b..1f4e200693 100644
--- a/xen/arch/ppc/xen.lds.S
+++ b/xen/arch/ppc/xen.lds.S
@@ -84,7 +84,6 @@ SECTIONS
     DECL_SECTION(.data) {                    /* Data */
         *(.data.page_aligned)
 
-        SCHEDULER_ARRAY
         SCHED_OPS_ARRAY
         HYPFS_PARAM
 
diff --git a/xen/arch/riscv/xen.lds.S b/xen/arch/riscv/xen.lds.S
index 01f202e504..97f2db1dfd 100644
--- a/xen/arch/riscv/xen.lds.S
+++ b/xen/arch/riscv/xen.lds.S
@@ -89,7 +89,6 @@ SECTIONS
     .data : {                    /* Data */
         *(.data.page_aligned)
 
-        SCHEDULER_ARRAY
         SCHED_OPS_ARRAY
         HYPFS_PARAM
 
diff --git a/xen/arch/x86/xen.lds.S b/xen/arch/x86/xen.lds.S
index d128a30440..0f506ff1f6 100644
--- a/xen/arch/x86/xen.lds.S
+++ b/xen/arch/x86/xen.lds.S
@@ -306,7 +306,6 @@ SECTIONS
   DECL_SECTION(.data.read_mostly) {
        *(.data.read_mostly)
 
-       SCHEDULER_ARRAY
        SCHED_OPS_ARRAY
        HYPFS_PARAM
   } PHDR(text)
diff --git a/xen/common/sched/core.c b/xen/common/sched/core.c
index fb2d1d5314..4e5f78e84d 100644
--- a/xen/common/sched/core.c
+++ b/xen/common/sched/core.c
@@ -87,10 +87,6 @@ DEFINE_PER_CPU(cpumask_t, cpumask_scratch);
 /* How many urgent vcpus. */
 DEFINE_PER_CPU(atomic_t, sched_urgent_count);
 
-extern const struct scheduler *__start_schedulers_array[], *__end_schedulers_array[];
-#define NUM_SCHEDULERS (__end_schedulers_array - __start_schedulers_array)
-#define schedulers __start_schedulers_array
-
 extern const struct sched_ops *__start_sched_ops_array[], *__end_sched_ops_array[];
 #define NUM_SCHED_OPS (__end_sched_ops_array - __start_sched_ops_array)
 #define sched_ops_array __start_sched_ops_array
@@ -103,42 +99,6 @@ static void sched_set_affinity(
     struct sched_unit *unit, const cpumask_t *hard, const cpumask_t *soft);
 
 
-static void sched_ops_to_scheduler(
-        struct scheduler *sched, const struct sched_ops *ops)
-{
-    sched->name            = ops->name;
-    sched->opt_name        = ops->opt_name;
-    sched->sched_id        = ops->sched_id;
-    sched->global_init     = ops->global_init;
-    sched->init            = ops->init;
-    sched->deinit          = ops->deinit;
-    sched->free_udata      = ops->free_udata;
-    sched->alloc_udata     = ops->alloc_udata;
-    sched->free_pdata      = ops->free_pdata;
-    sched->alloc_pdata     = ops->alloc_pdata;
-    sched->deinit_pdata    = ops->deinit_pdata;
-    sched->alloc_domdata   = ops->alloc_domdata;
-    sched->free_domdata    = ops->free_domdata;
-    sched->switch_sched    = ops->switch_sched;
-    sched->insert_unit     = ops->insert_unit;
-    sched->remove_unit     = ops->remove_unit;
-    sched->sleep           = ops->sleep;
-    sched->wake            = ops->wake;
-    sched->yield           = ops->yield;
-    sched->context_saved   = ops->context_saved;
-    sched->do_schedule     = ops->do_schedule;
-    sched->pick_resource   = ops->pick_resource;
-    sched->migrate         = ops->migrate;
-    sched->adjust          = ops->adjust;
-    sched->adjust_affinity = ops->adjust_affinity;
-#ifdef CONFIG_SYSCTL
-    sched->adjust_global   = ops->adjust_global;
-#endif
-    sched->dump_settings   = ops->dump_settings;
-    sched->dump_cpu_state  = ops->dump_cpu_state;
-    sched->move_timers     = ops->move_timers;
-}
-
 static struct sched_resource *cf_check
 sched_idle_res_pick(const struct scheduler *ops, const struct sched_unit *unit)
 {
@@ -168,10 +128,9 @@ static void cf_check sched_idle_schedule(
     unit->next_task = sched_idle_unit(cpu);
 }
 
-static struct scheduler sched_idle_ops = {
+static struct sched_ops sched_idle_sched_ops = {
     .name           = "Idle Scheduler",
     .opt_name       = "idle",
-    .sched_data     = NULL,
 
     .pick_resource  = sched_idle_res_pick,
     .do_schedule    = sched_idle_schedule,
@@ -180,6 +139,11 @@ static struct scheduler sched_idle_ops = {
     .free_udata     = sched_idle_free_udata,
 };
 
+static struct scheduler sched_idle_ops = {
+    .ops         = &sched_idle_sched_ops,
+    .sched_data = NULL,
+};
+
 static inline struct vcpu *unit2vcpu_cpu(const struct sched_unit *unit,
                                          unsigned int cpu)
 {
@@ -2122,7 +2086,7 @@ long do_set_timer_op(s_time_t timeout)
 /* scheduler_id - fetch ID of current scheduler */
 int scheduler_id(void)
 {
-    return operations.sched_id;
+    return operations.ops->sched_id;
 }
 #endif
 
@@ -2131,7 +2095,7 @@ long sched_adjust(struct domain *d, struct xen_domctl_scheduler_op *op)
 {
     long ret;
 
-    if ( op->sched_id != dom_scheduler(d)->sched_id )
+    if ( op->sched_id != dom_scheduler(d)->ops->sched_id )
         return -EINVAL;
 
     switch ( op->cmd )
@@ -2177,7 +2141,7 @@ long sched_adjust_global(struct xen_sysctl_scheduler_op *op)
 
     rcu_read_lock(&sched_res_rculock);
 
-    rc = ((op->sched_id == pool->sched->sched_id)
+    rc = ((op->sched_id == pool->sched->ops->sched_id)
           ? sched_adjust_cpupool(pool->sched, op) : -EINVAL);
 
     rcu_read_unlock(&sched_res_rculock);
@@ -2344,7 +2308,7 @@ static struct sched_unit *do_schedule(struct sched_unit *prev, s_time_t now,
     struct sched_unit *next;
 
     /* get policy-specific decision on scheduling... */
-    sched->do_schedule(sched, prev, now, sched_tasklet_check(cpu));
+    sched->ops->do_schedule(sched, prev, now, sched_tasklet_check(cpu));
 
     next = prev->next_task;
 
@@ -3033,18 +2997,6 @@ void scheduler_enable(void)
     scheduler_active = true;
 }
 
-static inline
-const struct scheduler *__init sched_get_by_name(const char *sched_name)
-{
-    unsigned int i;
-
-    for ( i = 0; i < NUM_SCHEDULERS; i++ )
-        if ( schedulers[i] && !strcmp(schedulers[i]->opt_name, sched_name) )
-            return schedulers[i];
-
-    return NULL;
-}
-
 static inline
 const struct sched_ops *__init sched_ops_get_by_name(const char* sched_name)
 {
@@ -3058,13 +3010,7 @@ const struct sched_ops *__init sched_ops_get_by_name(const char* sched_name)
 
 int __init sched_get_id_by_name(const char *sched_name)
 {
-    const struct scheduler *scheduler = sched_get_by_name(sched_name);
-    const struct sched_ops *ops;
-
-    if ( scheduler )
-        return scheduler->sched_id;
-
-    ops = sched_ops_get_by_name(sched_name);
+    const struct sched_ops *ops = sched_ops_get_by_name(sched_name);
     return ops ? ops->sched_id : -1;
 }
 
@@ -3072,40 +3018,11 @@ int __init sched_get_id_by_name(const char *sched_name)
 void __init scheduler_init(void)
 {
     struct domain *idle_domain;
-    const struct scheduler *scheduler;
     const struct sched_ops *ops;
     int i;
 
     scheduler_enable();
 
-    for ( i = 0; i < NUM_SCHEDULERS; i++)
-    {
-#define sched_test_func(f)                               \
-        if ( !schedulers[i]->f )                         \
-        {                                                \
-            printk("scheduler %s misses .%s, dropped\n", \
-                   schedulers[i]->opt_name, #f);         \
-            schedulers[i] = NULL;                        \
-        }
-
-        sched_test_func(init);
-        sched_test_func(deinit);
-        sched_test_func(pick_resource);
-        sched_test_func(alloc_udata);
-        sched_test_func(free_udata);
-        sched_test_func(switch_sched);
-        sched_test_func(do_schedule);
-
-#undef sched_test_func
-
-        if ( schedulers[i]->global_init && schedulers[i]->global_init() < 0 )
-        {
-            printk("scheduler %s failed initialization, dropped\n",
-                   schedulers[i]->opt_name);
-            schedulers[i] = NULL;
-        }
-    }
-
     for ( i = 0; i < NUM_SCHED_OPS; i++)
     {
 #define sched_test_func(f)                               \
@@ -3134,30 +3051,22 @@ void __init scheduler_init(void)
         }
     }
 
-    scheduler = sched_get_by_name(opt_sched);
-    ops = scheduler ? NULL : sched_ops_get_by_name(opt_sched);
-    if ( !scheduler && !ops )
+    ops = sched_ops_get_by_name(opt_sched);
+    if ( !ops )
     {
         printk("Could not find scheduler: %s\n", opt_sched);
-        scheduler = sched_get_by_name(CONFIG_SCHED_DEFAULT);
-        ops = scheduler ? NULL : sched_ops_get_by_name(CONFIG_SCHED_DEFAULT);
-        BUG_ON(!scheduler && !ops);
-        if ( scheduler )
-            printk("Using '%s' (%s)\n", scheduler->name, scheduler->opt_name);
-        else
-            printk("Using '%s' (%s)\n", ops->name, ops->opt_name);
+        ops = sched_ops_get_by_name(CONFIG_SCHED_DEFAULT);
+        BUG_ON(!ops);
+        printk("Using '%s' (%s)\n", ops->name, ops->opt_name);
     }
 
-    if ( scheduler )
-        operations = *scheduler;
-    else
-        sched_ops_to_scheduler(&operations, ops);
+    operations.ops = ops;
 
     if ( cpu_schedule_up(0) )
         BUG();
     register_cpu_notifier(&cpu_schedule_nfb);
 
-    printk("Using scheduler: %s (%s)\n", operations.name, operations.opt_name);
+    printk("Using scheduler: %s (%s)\n", operations.ops->name, operations.ops->opt_name);
     if ( sched_init(&operations) )
         panic("scheduler returned error on init\n");
 
@@ -3507,28 +3416,17 @@ struct scheduler *scheduler_alloc(unsigned int sched_id)
     int ret;
     struct scheduler *sched;
 
-    for ( i = 0; i < NUM_SCHEDULERS; i++ )
-        if ( schedulers[i] && schedulers[i]->sched_id == sched_id )
-            goto found;
-
     for ( i = 0; i < NUM_SCHED_OPS; i++ )
         if ( sched_ops_array[i] && sched_ops_array[i]->sched_id == sched_id )
-            goto found_new;
+            goto found;
 
     return ERR_PTR(-ENOENT);
 
  found:
-    if ( (sched = xmalloc(struct scheduler)) == NULL )
-        return ERR_PTR(-ENOMEM);
-    memcpy(sched, schedulers[i], sizeof(*sched));
-    goto init;
-
- found_new:
     if ( (sched = xzalloc(struct scheduler)) == NULL )
         return ERR_PTR(-ENOMEM);
-    sched_ops_to_scheduler(sched, sched_ops_array[i]);
+    sched->ops = sched_ops_array[i];
 
- init:
     if ( (ret = sched_init(sched)) != 0 )
     {
         xfree(sched);
@@ -3559,7 +3457,7 @@ void schedule_dump(struct cpupool *c)
     {
         sched = c->sched;
         cpus = c->res_valid;
-        printk("Scheduler: %s (%s)\n", sched->name, sched->opt_name);
+        printk("Scheduler: %s (%s)\n", sched->ops->name, sched->ops->opt_name);
         sched_dump_settings(sched);
     }
     else
diff --git a/xen/common/sched/cpupool.c b/xen/common/sched/cpupool.c
index 081e1053eb..1c70b58409 100644
--- a/xen/common/sched/cpupool.c
+++ b/xen/common/sched/cpupool.c
@@ -338,7 +338,7 @@ static struct cpupool *cpupool_create(unsigned int poolid,
     spin_unlock(&cpupool_lock);
 
     debugtrace_printk("Created cpupool %u with scheduler %s (%s)\n",
-                      c->cpupool_id, c->sched->name, c->sched->opt_name);
+                      c->cpupool_id, c->sched->ops->name, c->sched->ops->opt_name);
 
     return c;
 
@@ -862,7 +862,7 @@ int cpupool_do_sysctl(struct xen_sysctl_cpupool_op *op)
         if ( c == NULL )
             break;
         op->cpupool_id = c->cpupool_id;
-        op->sched_id = c->sched->sched_id;
+        op->sched_id = c->sched->ops->sched_id;
         op->n_dom = c->n_dom;
         ret = cpumask_to_xenctl_bitmap(&op->cpumap, c->cpu_valid);
         cpupool_put(c);
@@ -1294,7 +1294,7 @@ struct cpupool *__init cpupool_create_pool(unsigned int pool_id, int sched_id)
     struct cpupool *pool;
 
     if ( sched_id < 0 )
-        sched_id = scheduler_get_default()->sched_id;
+        sched_id = scheduler_get_default()->ops->sched_id;
 
     pool = cpupool_create(pool_id, sched_id);
 
diff --git a/xen/common/sched/private.h b/xen/common/sched/private.h
index 4dd5c99b87..c03063befe 100644
--- a/xen/common/sched/private.h
+++ b/xen/common/sched/private.h
@@ -365,198 +365,132 @@ struct sched_ops {
 };
 
 struct scheduler {
-    const char *name;       /* full name for this scheduler      */
-    const char *opt_name;   /* option name for this scheduler    */
-    unsigned int sched_id;  /* ID for this scheduler             */
-    void *sched_data;       /* global data pointer               */
-    struct cpupool *cpupool;/* points to this scheduler's pool   */
-
-    int          (*global_init)    (void);
-
-    int          (*init)           (struct scheduler *ops);
-    void         (*deinit)         (struct scheduler *ops);
-
-    void         (*free_udata)     (const struct scheduler *ops, void *priv);
-    void *       (*alloc_udata)    (const struct scheduler *ops,
-                                    struct sched_unit *unit, void *dd);
-
-    void         (*free_pdata)     (const struct scheduler *ops,
-                                    void *pcpu, int cpu);
-    void *       (*alloc_pdata)    (const struct scheduler *ops, int cpu);
-    void         (*deinit_pdata)   (const struct scheduler *ops,
-                                    void *pcpu, int cpu);
-
-    /* Returns ERR_PTR(-err) for error, NULL for 'nothing needed'. */
-    void *       (*alloc_domdata)  (const struct scheduler *ops,
-                                    struct domain *dom);
-    /* Idempotent. */
-    void         (*free_domdata)   (const struct scheduler *ops, void *data);
-
-    spinlock_t * (*switch_sched)   (struct scheduler *new_ops, unsigned int cpu,
-                                    void *pdata, void *vdata);
-
-    /* Activate / deactivate units in a cpu pool */
-    void         (*insert_unit)    (const struct scheduler *ops,
-                                    struct sched_unit *unit);
-    void         (*remove_unit)    (const struct scheduler *ops,
-                                    struct sched_unit *unit);
-
-    void         (*sleep)          (const struct scheduler *ops,
-                                    struct sched_unit *unit);
-    void         (*wake)           (const struct scheduler *ops,
-                                    struct sched_unit *unit);
-    void         (*yield)          (const struct scheduler *ops,
-                                    struct sched_unit *unit);
-    void         (*context_saved)  (const struct scheduler *ops,
-                                    struct sched_unit *unit);
-
-    void         (*do_schedule)    (const struct scheduler *ops,
-                                    struct sched_unit *currunit, s_time_t now,
-                                    bool tasklet_work_scheduled);
-
-    struct sched_resource *(*pick_resource)(const struct scheduler *ops,
-                                            const struct sched_unit *unit);
-    void         (*migrate)        (const struct scheduler *ops,
-                                    struct sched_unit *unit,
-                                    unsigned int new_cpu);
-    int          (*adjust)         (const struct scheduler *ops,
-                                    struct domain *d,
-                                    struct xen_domctl_scheduler_op *op);
-    void         (*adjust_affinity)(const struct scheduler *ops,
-                                    struct sched_unit *unit,
-                                    const struct cpumask *hard,
-                                    const struct cpumask *soft);
-#ifdef CONFIG_SYSCTL
-    int          (*adjust_global)  (const struct scheduler *ops,
-                                    struct xen_sysctl_scheduler_op *sc);
-#endif
-    void         (*dump_settings)  (const struct scheduler *ops);
-    void         (*dump_cpu_state) (const struct scheduler *ops, int cpu);
-    void         (*move_timers)    (const struct scheduler *ops,
-                                    struct sched_resource *sr);
+    const struct sched_ops *ops; /* shared, read-only dispatch table */
+    void *sched_data;            /* global data pointer               */
+    struct cpupool *cpupool;     /* points to this scheduler's pool   */
 };
 
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
@@ -564,7 +498,7 @@ static inline void sched_migrate(const struct scheduler *s,
 static inline struct sched_resource *sched_pick_resource(
     const struct scheduler *s, const struct sched_unit *unit)
 {
-    return s->pick_resource(s, unit);
+    return s->ops->pick_resource(s, unit);
 }
 
 static inline void sched_adjust_affinity(const struct scheduler *s,
@@ -572,29 +506,29 @@ static inline void sched_adjust_affinity(const struct scheduler *s,
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
@@ -613,9 +547,6 @@ static inline void sched_unit_unpause(const struct sched_unit *unit)
         vcpu_unpause(v);
 }
 
-#define REGISTER_SCHEDULER(x) static const struct scheduler *x##_entry \
-  __used_section(".data.schedulers") = &(x)
-
 #define REGISTER_SCHED_OPS(x) static const struct sched_ops *x##_entry \
   __used_section(".data.sched_ops") = &(x)
 
diff --git a/xen/include/xen/xen.lds.h b/xen/include/xen/xen.lds.h
index 157d48eabd..0005c38486 100644
--- a/xen/include/xen/xen.lds.h
+++ b/xen/include/xen/xen.lds.h
@@ -173,12 +173,6 @@
        _edevice = .;        \
   } :text
 
-#define SCHEDULER_ARRAY              \
-       . = ALIGN(POINTER_ALIGN);     \
-       __start_schedulers_array = .; \
-       *(.data.schedulers)           \
-       __end_schedulers_array = .;
-
 #define SCHED_OPS_ARRAY              \
        . = ALIGN(POINTER_ALIGN);     \
        __start_sched_ops_array = .;  \
-- 
2.34.1


