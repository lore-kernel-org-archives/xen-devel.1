Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E10E4C55822
	for <xen-devel@archiver.kernel.org>; Tue,  4 Aug 2026 05:55:06 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1381885.1625342 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wr873-0000dG-6H; Tue, 04 Aug 2026 05:54:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1381885.1625342; Tue, 04 Aug 2026 05:54:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wr873-0000d9-3K; Tue, 04 Aug 2026 05:54:53 +0000
Received: by outflank-mailman (input) for mailman id 1381885;
 Tue, 04 Aug 2026 05:54:51 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <frn1furkan10@gmail.com>) id 1wr871-0000bZ-Iw
 for xen-devel@lists.xenproject.org; Tue, 04 Aug 2026 05:54:51 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wr870-00DRnB-Vx
 for xen-devel@lists.xenproject.org; Tue, 04 Aug 2026 07:54:50 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <frn1furkan10@gmail.com>)
 id 6a717e95-e002-0a2a0a5209dd-0a2a4503adec-46
 for <xen-devel@lists.xenproject.org>; Tue, 04 Aug 2026 07:54:50 +0200
Received: from [209.85.128.44] (helo=mail-wm1-f44.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <frn1furkan10@gmail.com>)
 id 6a717eaa-fae8-0a2a45030019-d155802cdded-3
 for <xen-devel@lists.xenproject.org>; Tue, 04 Aug 2026 07:54:50 +0200
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-49802c418b5so23317355e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 03 Aug 2026 22:54:50 -0700 (PDT)
Received: from notebook.. ([78.173.117.189]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4994a100e14sm55453775e9.14.2026.08.03.22.54.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Aug 2026 22:54:49 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1785822890; x=1786427690; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p6vxw/6ES4G2VqIbltqaKS0hNP1qFgjai3ORZHffXN8=;
        b=JRBVpzyToFDKUCnkHaEdrbYtw2LlbHqHuWQW1LM5y+CIthEEkEEjCzBkK6ji57okMt
         KQNGM3ErzhXq4yuErKRTCtkpeozvPF1ShGjtis0vxvYq3+H8xj+ZYvh4Do0jfbWKJWjN
         BuzdQiQpzH3l1X01MBs4+/qUKjXbNEh2rLdQNFbQcrb8aVbV4AUvDXheMdb+3Dh9RARv
         LhCTNt7me8MIKwKYvxPeJb67t8papaSyNN196lS2E98/nI9Sz4ScGvfbK6ySL0tEsjM/
         NS7icNZf8qEJV/ou7vjnL80GFc1O8+zNX45LqY0e70etuOd723n7uhCQ4nCNAXJ3b5sm
         VgvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785822890; x=1786427690;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=p6vxw/6ES4G2VqIbltqaKS0hNP1qFgjai3ORZHffXN8=;
        b=n+ZvlSwGEIrF1sXYq0VRCVWYnJwTuXcq6YMB676sYVzzJ1U+ZkzDyzREEaiZ0GZJp2
         M7Eu7LZDCO0KRfryhmmU9MvphuJwziy9w0EuHkQb+5tkmt2eo9SirDE+Xh9P4n31nSU3
         RhQIhjM8coKcFb+N+i62qnDtLR+HORibcQS6m5mUWO5Ovf+IRHr+cuJjRq3CeWXvnVrL
         7hH3vsB90/nm5qgEfGfuYGE0yRy7uVTrPeB3aW9t+3AKcGjFFXSGi3xB1aVECE60WNGJ
         4L8aSLI1P7ApHZG4wMsYCabJnXqjG88W8VdGrvGhuyzdIQ6LAtwMDBOwgsUiWJArH8zm
         QdPw==
X-Gm-Message-State: AOJu0YyF4MoeD3DmTAHai04i5LGibHLZU4tYSJr34JjYvw6+KIoF+ANC
	zgvvN+x2sAZqXZVn2mGdAt5u3I1VeaDJIq6CqRIVBYBDMIORi2p1I6M7HXyoqQ==
X-Gm-Gg: AR+sD10gX4sCWXbh4QV61VrRnBSLQRH3Vk9f0yds9SCvzcy3avC3CR2E5dtS9vwpvl/
	rYt1voidGkF7wyl3+K4uMDeopUTYc0YnsRtPAxQrmWsNYeM9fGsRPnvERESCXSMRY8vhAYMfCN2
	wWbYrR6kzyaCJ+7kSu99jFKQNQNl94wJ1aGX2BRQXor4GkvH0v/Wg12KWPMDYkLGpcYtskPe/ny
	qvSyTqJe+t64YAPdwkx1l4GrGeL7yO3MN7AelRPhi6+mrWJdsokhzYcMXMgRw1rFsROUw2b/Mkz
	OTtYGbzODqw+lWDDp7mLdvbbUiVug4Mx4KHQUD5HEnJoAhyTBhphtFQVknjPSJ/fcyDMWcPKRfy
	avoHK2TVkm4W6cVIBWtBiZcHygbV8DDK/T78iLJc2D1+5x5uolEFotaOH+H5KLly/haZqOdyLT9
	8RY6drQpnreqqe6xF4Ye3PjR9G7CD2ovlksh7ZL9AUBINAbJeLnMmcTvlaLTtN2w==
X-Received: by 2002:a05:600c:840f:b0:493:c42e:5be0 with SMTP id 5b1f17b1804b1-4980c60705amr267135705e9.0.1785822890072;
        Mon, 03 Aug 2026 22:54:50 -0700 (PDT)
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
Subject: [PATCH v2 2/2] xen/sched: rename scheduler registration symbols
Date: Tue,  4 Aug 2026 08:53:27 +0300
Message-Id: <20260804055327.22119-3-frn1furkan10@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260804055327.22119-1-frn1furkan10@gmail.com>
References: <20260804055327.22119-1-frn1furkan10@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-33051d/1785822890-6E8CD4E9-A21BE1E6/0/0
X-purgate-type: clean
X-purgate-size: 8916

REGISTER_SCHEDULER(), schedulers[], NUM_SCHEDULERS, and the
per-arch SCHEDULER_ARRAY linker macro now register and hold
struct sched_ops instances rather than struct scheduler ones,
but still carry names describing the old type.

Rename them to match the current behaviour.
No functional change.

Signed-off-by: Furkan Caliskan <frn1furkan10@gmail.com>
---
 xen/arch/arm/xen.lds.S      |  2 +-
 xen/arch/ppc/xen.lds.S      |  2 +-
 xen/arch/riscv/xen.lds.S    |  2 +-
 xen/arch/x86/xen.lds.S      |  2 +-
 xen/common/sched/arinc653.c |  2 +-
 xen/common/sched/core.c     | 33 +++++++++++++++++----------------
 xen/common/sched/credit.c   |  2 +-
 xen/common/sched/credit2.c  |  2 +-
 xen/common/sched/null.c     |  2 +-
 xen/common/sched/private.h  |  4 ++--
 xen/common/sched/rt.c       |  2 +-
 xen/include/xen/xen.lds.h   | 10 +++++-----
 12 files changed, 33 insertions(+), 32 deletions(-)

diff --git a/xen/arch/arm/xen.lds.S b/xen/arch/arm/xen.lds.S
index 2d5f1c516d..07bf875599 100644
--- a/xen/arch/arm/xen.lds.S
+++ b/xen/arch/arm/xen.lds.S
@@ -93,7 +93,7 @@ SECTIONS
   .data : {                    /* Data */
        *(.data.page_aligned)
 
-       SCHEDULER_ARRAY
+       SCHED_OPS_ARRAY
        HYPFS_PARAM
 
        *(.data .data.*)
diff --git a/xen/arch/ppc/xen.lds.S b/xen/arch/ppc/xen.lds.S
index d0f2ed43f1..1f4e200693 100644
--- a/xen/arch/ppc/xen.lds.S
+++ b/xen/arch/ppc/xen.lds.S
@@ -84,7 +84,7 @@ SECTIONS
     DECL_SECTION(.data) {                    /* Data */
         *(.data.page_aligned)
 
-        SCHEDULER_ARRAY
+        SCHED_OPS_ARRAY
         HYPFS_PARAM
 
         *(.data .data.*)
diff --git a/xen/arch/riscv/xen.lds.S b/xen/arch/riscv/xen.lds.S
index 65f136dce9..97f2db1dfd 100644
--- a/xen/arch/riscv/xen.lds.S
+++ b/xen/arch/riscv/xen.lds.S
@@ -89,7 +89,7 @@ SECTIONS
     .data : {                    /* Data */
         *(.data.page_aligned)
 
-        SCHEDULER_ARRAY
+        SCHED_OPS_ARRAY
         HYPFS_PARAM
 
         *(.data .data.*)
diff --git a/xen/arch/x86/xen.lds.S b/xen/arch/x86/xen.lds.S
index b9e888e596..0f506ff1f6 100644
--- a/xen/arch/x86/xen.lds.S
+++ b/xen/arch/x86/xen.lds.S
@@ -306,7 +306,7 @@ SECTIONS
   DECL_SECTION(.data.read_mostly) {
        *(.data.read_mostly)
 
-       SCHEDULER_ARRAY
+       SCHED_OPS_ARRAY
        HYPFS_PARAM
   } PHDR(text)
 
diff --git a/xen/common/sched/arinc653.c b/xen/common/sched/arinc653.c
index 746963806e..efcaa44089 100644
--- a/xen/common/sched/arinc653.c
+++ b/xen/common/sched/arinc653.c
@@ -736,7 +736,7 @@ static const struct sched_ops sched_arinc653_def = {
     .dump_cpu_state = NULL,
 };
 
-REGISTER_SCHEDULER(sched_arinc653_def);
+REGISTER_SCHED_OPS(sched_arinc653_def);
 
 /*
  * Local variables:
diff --git a/xen/common/sched/core.c b/xen/common/sched/core.c
index 5cdae0415c..8e938a3810 100644
--- a/xen/common/sched/core.c
+++ b/xen/common/sched/core.c
@@ -87,9 +87,9 @@ DEFINE_PER_CPU(cpumask_t, cpumask_scratch);
 /* How many urgent vcpus. */
 DEFINE_PER_CPU(atomic_t, sched_urgent_count);
 
-extern const struct sched_ops *__start_schedulers_array[], *__end_schedulers_array[];
-#define NUM_SCHEDULERS (__end_schedulers_array - __start_schedulers_array)
-#define schedulers __start_schedulers_array
+extern const struct sched_ops *__start_sched_ops_array[], *__end_sched_ops_array[];
+#define NUM_SCHED_OPS (__end_sched_ops_array - __start_sched_ops_array)
+#define sched_ops_array __start_sched_ops_array
 
 static struct scheduler __read_mostly operations;
 
@@ -2996,9 +2996,9 @@ static inline
 const struct sched_ops *__init sched_ops_get_by_name(const char* sched_name)
 {
     unsigned int i;
-    for ( i = 0; i < NUM_SCHEDULERS; i++ )
-        if ( schedulers[i] && !strcmp(schedulers[i]->opt_name, sched_name) )
-            return schedulers[i];
+    for ( i = 0; i < NUM_SCHED_OPS; i++ )
+        if ( sched_ops_array[i] && !strcmp(sched_ops_array[i]->opt_name, sched_name) )
+            return sched_ops_array[i];
 
     return NULL;
 }
@@ -3018,14 +3018,14 @@ void __init scheduler_init(void)
 
     scheduler_enable();
 
-    for ( i = 0; i < NUM_SCHEDULERS; i++)
+    for ( i = 0; i < NUM_SCHED_OPS; i++)
     {
 #define sched_test_func(f)                               \
-        if ( !schedulers[i]->f )                         \
+        if ( !sched_ops_array[i]->f )                    \
         {                                                \
             printk("scheduler %s misses .%s, dropped\n", \
-                   schedulers[i]->opt_name, #f);         \
-            schedulers[i] = NULL;                        \
+                   sched_ops_array[i]->opt_name, #f);    \
+            sched_ops_array[i] = NULL;                   \
         }
 
         sched_test_func(init);
@@ -3038,11 +3038,12 @@ void __init scheduler_init(void)
 
 #undef sched_test_func
 
-        if ( schedulers[i]->global_init && schedulers[i]->global_init() < 0 )
+        if ( sched_ops_array[i]->global_init &&
+             sched_ops_array[i]->global_init() < 0 )
         {
             printk("scheduler %s failed initialization, dropped\n",
-                   schedulers[i]->opt_name);
-            schedulers[i] = NULL;
+                   sched_ops_array[i]->opt_name);
+            sched_ops_array[i] = NULL;
         }
     }
 
@@ -3412,8 +3413,8 @@ struct scheduler *scheduler_alloc(unsigned int sched_id)
     int ret;
     struct scheduler *sched;
 
-    for ( i = 0; i < NUM_SCHEDULERS; i++ )
-        if ( schedulers[i] && schedulers[i]->sched_id == sched_id )
+    for ( i = 0; i < NUM_SCHED_OPS; i++ )
+        if ( sched_ops_array[i] && sched_ops_array[i]->sched_id == sched_id )
             goto found;
 
     return ERR_PTR(-ENOENT);
@@ -3421,7 +3422,7 @@ struct scheduler *scheduler_alloc(unsigned int sched_id)
  found:
     if ( (sched = xzalloc(struct scheduler)) == NULL )
         return ERR_PTR(-ENOMEM);
-    sched->ops = schedulers[i];
+    sched->ops = sched_ops_array[i];
 
     if ( (ret = sched_init(sched)) != 0 )
     {
diff --git a/xen/common/sched/credit.c b/xen/common/sched/credit.c
index 8df746bf6b..995cf097b5 100644
--- a/xen/common/sched/credit.c
+++ b/xen/common/sched/credit.c
@@ -2315,4 +2315,4 @@ static const struct sched_ops sched_credit_def = {
     .move_timers    = csched_move_timers,
 };
 
-REGISTER_SCHEDULER(sched_credit_def);
+REGISTER_SCHED_OPS(sched_credit_def);
diff --git a/xen/common/sched/credit2.c b/xen/common/sched/credit2.c
index 4949606881..9bcc90004a 100644
--- a/xen/common/sched/credit2.c
+++ b/xen/common/sched/credit2.c
@@ -4268,4 +4268,4 @@ static const struct sched_ops sched_credit2_def = {
     .free_domdata   = csched2_free_domdata,
 };
 
-REGISTER_SCHEDULER(sched_credit2_def);
+REGISTER_SCHED_OPS(sched_credit2_def);
diff --git a/xen/common/sched/null.c b/xen/common/sched/null.c
index b3c6651fb1..5194c8216c 100644
--- a/xen/common/sched/null.c
+++ b/xen/common/sched/null.c
@@ -1067,4 +1067,4 @@ static const struct sched_ops sched_null_def = {
     .dump_settings  = null_dump,
 };
 
-REGISTER_SCHEDULER(sched_null_def);
+REGISTER_SCHED_OPS(sched_null_def);
diff --git a/xen/common/sched/private.h b/xen/common/sched/private.h
index 0c5181891c..c03063befe 100644
--- a/xen/common/sched/private.h
+++ b/xen/common/sched/private.h
@@ -547,8 +547,8 @@ static inline void sched_unit_unpause(const struct sched_unit *unit)
         vcpu_unpause(v);
 }
 
-#define REGISTER_SCHEDULER(x) static const struct sched_ops *x##_entry \
-  __used_section(".data.schedulers") = &(x)
+#define REGISTER_SCHED_OPS(x) static const struct sched_ops *x##_entry \
+  __used_section(".data.sched_ops") = &(x)
 
 struct cpupool
 {
diff --git a/xen/common/sched/rt.c b/xen/common/sched/rt.c
index 0e9f04ea72..8b4f05e2d1 100644
--- a/xen/common/sched/rt.c
+++ b/xen/common/sched/rt.c
@@ -1645,4 +1645,4 @@ static const struct sched_ops sched_rtds_def = {
     .move_timers    = rt_move_timers,
 };
 
-REGISTER_SCHEDULER(sched_rtds_def);
+REGISTER_SCHED_OPS(sched_rtds_def);
diff --git a/xen/include/xen/xen.lds.h b/xen/include/xen/xen.lds.h
index ea11e3fb62..fc44d28734 100644
--- a/xen/include/xen/xen.lds.h
+++ b/xen/include/xen/xen.lds.h
@@ -173,11 +173,11 @@
        _edevice = .;        \
   } :text
 
-#define SCHEDULER_ARRAY              \
-       . = ALIGN(POINTER_ALIGN);     \
-       __start_schedulers_array = .; \
-       *(.data.schedulers)           \
-       __end_schedulers_array = .;
+#define SCHED_OPS_ARRAY             \
+       . = ALIGN(POINTER_ALIGN);    \
+       __start_sched_ops_array = .; \
+       *(.data.sched_ops)           \
+       __end_sched_ops_array = .;
 
 #ifdef CONFIG_HYPFS
 #define HYPFS_PARAM              \
-- 
2.34.1


