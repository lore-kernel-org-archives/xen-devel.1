Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22B8AC55162
	for <xen-devel@archiver.kernel.org>; Mon,  3 Aug 2026 05:07:37 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1381101.1624663 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wqktP-0002Wc-4c; Mon, 03 Aug 2026 05:07:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1381101.1624663; Mon, 03 Aug 2026 05:07:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wqktP-0002WV-1X; Mon, 03 Aug 2026 05:07:15 +0000
Received: by outflank-mailman (input) for mailman id 1381101;
 Mon, 03 Aug 2026 05:07:13 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <frn1furkan10@gmail.com>) id 1wqktN-0002WF-9G
 for xen-devel@lists.xenproject.org; Mon, 03 Aug 2026 05:07:13 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wqktM-006W6b-MN
 for xen-devel@lists.xenproject.org; Mon, 03 Aug 2026 07:07:12 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <frn1furkan10@gmail.com>)
 id 6a7021f8-e002-0a2a0a5209dd-0a2a450bce68-26
 for <xen-devel@lists.xenproject.org>; Mon, 03 Aug 2026 07:07:12 +0200
Received: from [209.85.128.48] (helo=mail-wm1-f48.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <frn1furkan10@gmail.com>)
 id 6a702200-b7e8-0a2a450b0019-d1558030e5e9-3
 for <xen-devel@lists.xenproject.org>; Mon, 03 Aug 2026 07:07:12 +0200
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-4957eefd361so10928575e9.1
 for <xen-devel@lists.xenproject.org>; Sun, 02 Aug 2026 22:07:12 -0700 (PDT)
Received: from notebook.. ([78.173.117.153]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49807b917efsm310345185e9.11.2026.08.02.22.07.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Aug 2026 22:07:10 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1785733632; x=1786338432; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CvaIgsy1tiLeOz4+v4UxZSpgWz1oDHV9WwaN0mMyibY=;
        b=cc22UMfISvV5CaIzWCq7K3UvrVbWjWfqhCwBmSL2Vg+vj74LKVQiWgm4WJpaulmkPG
         7Z80AZuFhud6WEyVe7rEBIGSD50YavcpACKE4XHzr7tEcNGjcit8stY9Y2tLJ+CUXNuY
         PUGYUBGsUvCblQNxIz4Midvrig5vc0Uq9CpRACVbQhFgdnKhdp2abdMAKc6zo9y/apH4
         MYn2QP2WHzk4+wJEoyvRXQxmIJY85GPpUabJ5o/Tv8iw/Syc//+GiSQk8mxFSlYKRdKg
         BZNbzqWpYscQjoLKFjikO62uRHGSY2H1uJ0a/VmN1AqY3voZG+hO+2WLYTWz3xAGaWqi
         fjWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785733632; x=1786338432;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CvaIgsy1tiLeOz4+v4UxZSpgWz1oDHV9WwaN0mMyibY=;
        b=IDOmF5USp6N6m1dqs3//GUxOv7HIDxyNEm8/+QDuBwciyop6eexd85Rs4/aCUUsAEB
         fIMZG3QVImAtVYVB+05j/PV4TAWyog6i4R3Iy/l97gxDqvjWZxLTUN1NGqvcdyJw2eAE
         ZgGtQ74wQpbK/uroyFeAwGrVPhmvc/bwTLgM/QPsC/6UnD0j9hjXY11dbe2aGlRVb3Ox
         /pR3xITQYOZCUAGIhT61WJzdWNwRKNj+KDoj9afjom1w6Sdz49TLA+kZ8X8W4WuuL2CD
         dn9VIECZeWPB5GWrATXB6QLK1NmLaAdgOWK+H6WNM2NLiAG5J0ejK3n2X6CkCU/SIE14
         t6EA==
X-Gm-Message-State: AOJu0Yyk44rjQLsRn4poS2hlDRy7R+Csaoso/WVjCg3fSF5gFcW3Sl9C
	MLDOjmz39knM23YcxVe9ab4BVVKcLG0kvWJEuobQVZqAm2J86S2/CPqBueJysj5I
X-Gm-Gg: AR+sD126IXl6KTmLV6TU60bo2mUI9gSxXLRM366vlfbSOITgvpCx3X3//wdBiSh7jq7
	E3i1i88vBtuI9gFHmoYfAmT9A3r5fPmSuzsx7EEU2Rv8MNnFBt6ffca2lwhoh443Fi50L9C9o2W
	ucIBfbHIc/6vlbzvD3AG+5581A6C9k290ve3f9/vRVP3rNJEq6L1hcr6d28QVZRZ1nWnFFJjAFj
	JzDEDZ9kzCp6Pd52rkNKmZP8tZd7p4DNWMzr2mw2Lusk0xhwVutnQDfX9dso3umHXmqIhgmLiHJ
	3pJ/CaW++gvf+wHpmRbt4GDXkoW6cYzqVD5KxeQHetNs1z7vCq+dZHwerf9e9X3JdpZyCg3kA/t
	IrEDoKXsOzdEL5mXR0A5Xc74AUdCcQjg8JL0f/FWy7xdo7HsEYcwnPTfrFMW7wNPozQ/UX0jNxU
	44Y/BAnlZU3Io3ib+9jVNQHaoJsK0BKZiRUOLwPtv7CpxGRSHz/t93NhbeW9Fs4g==
X-Received: by 2002:a05:600c:8489:b0:495:495b:9248 with SMTP id 5b1f17b1804b1-4980c64b73emr200743855e9.4.1785733631883;
        Sun, 02 Aug 2026 22:07:11 -0700 (PDT)
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
Subject: [PATCH 1/7] xen/sched: introduce struct sched_ops as a shared scheduler vtable
Date: Mon,  3 Aug 2026 08:06:08 +0300
Message-Id: <20260803050614.5222-2-frn1furkan10@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260803050614.5222-1-frn1furkan10@gmail.com>
References: <20260803050614.5222-1-frn1furkan10@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-42698a/1785733632-1A2C49EA-B54E27DF/0/0
X-purgate-type: clean
X-purgate-size: 14848

struct scheduler currently serves two purposes: it is the static
vtable a scheduler backend defines (name, opt_name, sched_id, and
all its function pointers), and it is also the per-cpupool runtime
object scheduler_alloc() allocates. Being the same type forces
scheduler_alloc() to memcpy() the whole vtable into a fresh
allocation per cpupool, duplicating identical function pointers
across every cpupool using the same scheduler.

Introduce struct sched_ops to hold just the compile-time-constant
identity and dispatch table, with no per-cpupool state, plus
REGISTER_SCHED_OPS() and a sched_ops_array[] alongside the
existing schedulers[]. scheduler_alloc(), sched_get_by_name(), and
scheduler_init() are extended to also search sched_ops_array[],
using a new sched_ops_to_scheduler() helper to build an identical
flat struct scheduler regardless of which array a match came from.

struct scheduler itself is left untouched for now and still
duplicates every field sched_ops holds - this commit only lays the
groundwork. Once every backend registers through sched_ops, struct
scheduler will be shrunk to its genuinely per-cpupool fields (a
pointer to a shared sched_ops instance, plus instance data), and
the flattening copy, schedulers[], and REGISTER_SCHEDULER() will be
removed. That is what actually removes the duplication; this
commit does not yet change any behavior, since sched_ops_array[] is
still empty.

Signed-off-by: Furkan Caliskan <frn1furkan10@gmail.com>
---
 xen/arch/arm/xen.lds.S     |   1 +
 xen/arch/ppc/xen.lds.S     |   1 +
 xen/arch/riscv/xen.lds.S   |   1 +
 xen/arch/x86/xen.lds.S     |   1 +
 xen/common/sched/core.c    | 118 +++++++++++++++++++++++++++++++++++--
 xen/common/sched/private.h |  73 +++++++++++++++++++++++
 xen/include/xen/xen.lds.h  |   6 ++
 7 files changed, 196 insertions(+), 5 deletions(-)

diff --git a/xen/arch/arm/xen.lds.S b/xen/arch/arm/xen.lds.S
index 2d5f1c516d..9a63fa36a0 100644
--- a/xen/arch/arm/xen.lds.S
+++ b/xen/arch/arm/xen.lds.S
@@ -94,6 +94,7 @@ SECTIONS
        *(.data.page_aligned)
 
        SCHEDULER_ARRAY
+       SCHED_OPS_ARRAY
        HYPFS_PARAM
 
        *(.data .data.*)
diff --git a/xen/arch/ppc/xen.lds.S b/xen/arch/ppc/xen.lds.S
index d0f2ed43f1..da8f73d85b 100644
--- a/xen/arch/ppc/xen.lds.S
+++ b/xen/arch/ppc/xen.lds.S
@@ -85,6 +85,7 @@ SECTIONS
         *(.data.page_aligned)
 
         SCHEDULER_ARRAY
+        SCHED_OPS_ARRAY
         HYPFS_PARAM
 
         *(.data .data.*)
diff --git a/xen/arch/riscv/xen.lds.S b/xen/arch/riscv/xen.lds.S
index 65f136dce9..01f202e504 100644
--- a/xen/arch/riscv/xen.lds.S
+++ b/xen/arch/riscv/xen.lds.S
@@ -90,6 +90,7 @@ SECTIONS
         *(.data.page_aligned)
 
         SCHEDULER_ARRAY
+        SCHED_OPS_ARRAY
         HYPFS_PARAM
 
         *(.data .data.*)
diff --git a/xen/arch/x86/xen.lds.S b/xen/arch/x86/xen.lds.S
index b9e888e596..d128a30440 100644
--- a/xen/arch/x86/xen.lds.S
+++ b/xen/arch/x86/xen.lds.S
@@ -307,6 +307,7 @@ SECTIONS
        *(.data.read_mostly)
 
        SCHEDULER_ARRAY
+       SCHED_OPS_ARRAY
        HYPFS_PARAM
   } PHDR(text)
 
diff --git a/xen/common/sched/core.c b/xen/common/sched/core.c
index 3609721426..fb2d1d5314 100644
--- a/xen/common/sched/core.c
+++ b/xen/common/sched/core.c
@@ -91,6 +91,10 @@ extern const struct scheduler *__start_schedulers_array[], *__end_schedulers_arr
 #define NUM_SCHEDULERS (__end_schedulers_array - __start_schedulers_array)
 #define schedulers __start_schedulers_array
 
+extern const struct sched_ops *__start_sched_ops_array[], *__end_sched_ops_array[];
+#define NUM_SCHED_OPS (__end_sched_ops_array - __start_sched_ops_array)
+#define sched_ops_array __start_sched_ops_array
+
 static struct scheduler __read_mostly operations;
 
 static bool scheduler_active;
@@ -98,6 +102,43 @@ static bool scheduler_active;
 static void sched_set_affinity(
     struct sched_unit *unit, const cpumask_t *hard, const cpumask_t *soft);
 
+
+static void sched_ops_to_scheduler(
+        struct scheduler *sched, const struct sched_ops *ops)
+{
+    sched->name            = ops->name;
+    sched->opt_name        = ops->opt_name;
+    sched->sched_id        = ops->sched_id;
+    sched->global_init     = ops->global_init;
+    sched->init            = ops->init;
+    sched->deinit          = ops->deinit;
+    sched->free_udata      = ops->free_udata;
+    sched->alloc_udata     = ops->alloc_udata;
+    sched->free_pdata      = ops->free_pdata;
+    sched->alloc_pdata     = ops->alloc_pdata;
+    sched->deinit_pdata    = ops->deinit_pdata;
+    sched->alloc_domdata   = ops->alloc_domdata;
+    sched->free_domdata    = ops->free_domdata;
+    sched->switch_sched    = ops->switch_sched;
+    sched->insert_unit     = ops->insert_unit;
+    sched->remove_unit     = ops->remove_unit;
+    sched->sleep           = ops->sleep;
+    sched->wake            = ops->wake;
+    sched->yield           = ops->yield;
+    sched->context_saved   = ops->context_saved;
+    sched->do_schedule     = ops->do_schedule;
+    sched->pick_resource   = ops->pick_resource;
+    sched->migrate         = ops->migrate;
+    sched->adjust          = ops->adjust;
+    sched->adjust_affinity = ops->adjust_affinity;
+#ifdef CONFIG_SYSCTL
+    sched->adjust_global   = ops->adjust_global;
+#endif
+    sched->dump_settings   = ops->dump_settings;
+    sched->dump_cpu_state  = ops->dump_cpu_state;
+    sched->move_timers     = ops->move_timers;
+}
+
 static struct sched_resource *cf_check
 sched_idle_res_pick(const struct scheduler *ops, const struct sched_unit *unit)
 {
@@ -3004,11 +3045,27 @@ const struct scheduler *__init sched_get_by_name(const char *sched_name)
     return NULL;
 }
 
+static inline
+const struct sched_ops *__init sched_ops_get_by_name(const char* sched_name)
+{
+    unsigned int i;
+    for ( i = 0; i < NUM_SCHED_OPS; i++)
+        if ( sched_ops_array[i] && !strcmp(sched_ops_array[i]->opt_name, sched_name) )
+            return sched_ops_array[i];
+
+    return NULL;
+}
+
 int __init sched_get_id_by_name(const char *sched_name)
 {
     const struct scheduler *scheduler = sched_get_by_name(sched_name);
+    const struct sched_ops *ops;
+
+    if ( scheduler )
+        return scheduler->sched_id;
 
-    return scheduler ? scheduler->sched_id : -1;
+    ops = sched_ops_get_by_name(sched_name);
+    return ops ? ops->sched_id : -1;
 }
 
 /* Initialise the data structures. */
@@ -3016,6 +3073,7 @@ void __init scheduler_init(void)
 {
     struct domain *idle_domain;
     const struct scheduler *scheduler;
+    const struct sched_ops *ops;
     int i;
 
     scheduler_enable();
@@ -3048,15 +3106,52 @@ void __init scheduler_init(void)
         }
     }
 
+    for ( i = 0; i < NUM_SCHED_OPS; i++)
+    {
+#define sched_test_func(f)                               \
+        if ( !sched_ops_array[i]->f )                         \
+        {                                                \
+            printk("scheduler %s misses .%s, dropped\n", \
+                   sched_ops_array[i]->opt_name, #f);         \
+            sched_ops_array[i] = NULL;                        \
+        }
+
+        sched_test_func(init);
+        sched_test_func(deinit);
+        sched_test_func(pick_resource);
+        sched_test_func(alloc_udata);
+        sched_test_func(free_udata);
+        sched_test_func(switch_sched);
+        sched_test_func(do_schedule);
+
+#undef sched_test_func
+
+        if ( sched_ops_array[i]->global_init && sched_ops_array[i]->global_init() < 0)
+        {
+            printk("scheduler %s failed initialization, dropped\n",
+                    sched_ops_array[i]->opt_name);
+            sched_ops_array[i] = NULL;
+        }
+    }
+
     scheduler = sched_get_by_name(opt_sched);
-    if ( !scheduler )
+    ops = scheduler ? NULL : sched_ops_get_by_name(opt_sched);
+    if ( !scheduler && !ops )
     {
         printk("Could not find scheduler: %s\n", opt_sched);
         scheduler = sched_get_by_name(CONFIG_SCHED_DEFAULT);
-        BUG_ON(!scheduler);
-        printk("Using '%s' (%s)\n", scheduler->name, scheduler->opt_name);
+        ops = scheduler ? NULL : sched_ops_get_by_name(CONFIG_SCHED_DEFAULT);
+        BUG_ON(!scheduler && !ops);
+        if ( scheduler )
+            printk("Using '%s' (%s)\n", scheduler->name, scheduler->opt_name);
+        else
+            printk("Using '%s' (%s)\n", ops->name, ops->opt_name);
     }
-    operations = *scheduler;
+
+    if ( scheduler )
+        operations = *scheduler;
+    else
+        sched_ops_to_scheduler(&operations, ops);
 
     if ( cpu_schedule_up(0) )
         BUG();
@@ -3415,12 +3510,25 @@ struct scheduler *scheduler_alloc(unsigned int sched_id)
     for ( i = 0; i < NUM_SCHEDULERS; i++ )
         if ( schedulers[i] && schedulers[i]->sched_id == sched_id )
             goto found;
+
+    for ( i = 0; i < NUM_SCHED_OPS; i++ )
+        if ( sched_ops_array[i] && sched_ops_array[i]->sched_id == sched_id )
+            goto found_new;
+
     return ERR_PTR(-ENOENT);
 
  found:
     if ( (sched = xmalloc(struct scheduler)) == NULL )
         return ERR_PTR(-ENOMEM);
     memcpy(sched, schedulers[i], sizeof(*sched));
+    goto init;
+
+ found_new:
+    if ( (sched = xzalloc(struct scheduler)) == NULL )
+        return ERR_PTR(-ENOMEM);
+    sched_ops_to_scheduler(sched, sched_ops_array[i]);
+
+ init:
     if ( (ret = sched_init(sched)) != 0 )
     {
         xfree(sched);
diff --git a/xen/common/sched/private.h b/xen/common/sched/private.h
index d6884550cd..4dd5c99b87 100644
--- a/xen/common/sched/private.h
+++ b/xen/common/sched/private.h
@@ -294,6 +294,76 @@ static inline spinlock_t *pcpu_schedule_trylock(unsigned int cpu)
     return NULL;
 }
 
+struct sched_ops {
+    const char *name;       /* full name for this sched_ops      */
+    const char *opt_name;   /* option name for this sched_ops    */
+    unsigned int sched_id;  /* ID for this sched_ops             */
+
+    int          (*global_init)    (void);
+
+    int          (*init)           (struct scheduler *ops);
+    void         (*deinit)         (struct scheduler *ops);
+
+    void         (*free_udata)     (const struct scheduler *ops, void *priv);
+    void *       (*alloc_udata)    (const struct scheduler *ops,
+                                    struct sched_unit *unit, void *dd);
+
+    void         (*free_pdata)     (const struct scheduler *ops,
+                                    void *pcpu, int cpu);
+    void *       (*alloc_pdata)    (const struct scheduler *ops, int cpu);
+    void         (*deinit_pdata)   (const struct scheduler *ops,
+                                    void *pcpu, int cpu);
+
+    /* Returns ERR_PTR(-err) for error, NULL for 'nothing needed'. */
+    void *       (*alloc_domdata)  (const struct scheduler *ops,
+                                    struct domain *dom);
+    /* Idempotent. */
+    void         (*free_domdata)   (const struct scheduler *ops, void *data);
+
+    spinlock_t * (*switch_sched)   (struct scheduler *new_ops, unsigned int cpu,
+                                    void *pdata, void *vdata);
+
+    /* Activate / deactivate units in a cpu pool */
+    void         (*insert_unit)    (const struct scheduler *ops,
+                                    struct sched_unit *unit);
+    void         (*remove_unit)    (const struct scheduler *ops,
+                                    struct sched_unit *unit);
+
+    void         (*sleep)          (const struct scheduler *ops,
+                                    struct sched_unit *unit);
+    void         (*wake)           (const struct scheduler *ops,
+                                    struct sched_unit *unit);
+    void         (*yield)          (const struct scheduler *ops,
+                                    struct sched_unit *unit);
+    void         (*context_saved)  (const struct scheduler *ops,
+                                    struct sched_unit *unit);
+
+    void         (*do_schedule)    (const struct scheduler *ops,
+                                    struct sched_unit *currunit, s_time_t now,
+                                    bool tasklet_work_scheduled);
+
+    struct sched_resource *(*pick_resource)(const struct scheduler *ops,
+                                            const struct sched_unit *unit);
+    void         (*migrate)        (const struct scheduler *ops,
+                                    struct sched_unit *unit,
+                                    unsigned int new_cpu);
+    int          (*adjust)         (const struct scheduler *ops,
+                                    struct domain *d,
+                                    struct xen_domctl_scheduler_op *op);
+    void         (*adjust_affinity)(const struct scheduler *ops,
+                                    struct sched_unit *unit,
+                                    const struct cpumask *hard,
+                                    const struct cpumask *soft);
+#ifdef CONFIG_SYSCTL
+    int          (*adjust_global)  (const struct scheduler *ops,
+                                    struct xen_sysctl_scheduler_op *sc);
+#endif
+    void         (*dump_settings)  (const struct scheduler *ops);
+    void         (*dump_cpu_state) (const struct scheduler *ops, int cpu);
+    void         (*move_timers)    (const struct scheduler *ops,
+                                    struct sched_resource *sr);
+};
+
 struct scheduler {
     const char *name;       /* full name for this scheduler      */
     const char *opt_name;   /* option name for this scheduler    */
@@ -546,6 +616,9 @@ static inline void sched_unit_unpause(const struct sched_unit *unit)
 #define REGISTER_SCHEDULER(x) static const struct scheduler *x##_entry \
   __used_section(".data.schedulers") = &(x)
 
+#define REGISTER_SCHED_OPS(x) static const struct sched_ops *x##_entry \
+  __used_section(".data.sched_ops") = &(x)
+
 struct cpupool
 {
     unsigned int     cpupool_id;
diff --git a/xen/include/xen/xen.lds.h b/xen/include/xen/xen.lds.h
index ea11e3fb62..157d48eabd 100644
--- a/xen/include/xen/xen.lds.h
+++ b/xen/include/xen/xen.lds.h
@@ -179,6 +179,12 @@
        *(.data.schedulers)           \
        __end_schedulers_array = .;
 
+#define SCHED_OPS_ARRAY              \
+       . = ALIGN(POINTER_ALIGN);     \
+       __start_sched_ops_array = .;  \
+       *(.data.sched_ops)            \
+       __end_sched_ops_array = .;
+
 #ifdef CONFIG_HYPFS
 #define HYPFS_PARAM              \
        . = ALIGN(POINTER_ALIGN); \
-- 
2.34.1


