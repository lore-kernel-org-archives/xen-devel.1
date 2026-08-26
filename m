Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3BE7C5DF97
	for <xen-devel@archiver.kernel.org>; Wed, 26 Aug 2026 04:58:35 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1399561.1635566 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wz5iK-0004RT-Pp; Wed, 26 Aug 2026 04:58:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1399561.1635566; Wed, 26 Aug 2026 04:58:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wz5iK-0004RL-M0; Wed, 26 Aug 2026 04:58:16 +0000
Received: by outflank-mailman (input) for mailman id 1399561;
 Wed, 26 Aug 2026 04:58:15 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <frn1furkan10@gmail.com>) id 1wz5iJ-0004Qy-KG
 for xen-devel@lists.xenproject.org; Wed, 26 Aug 2026 04:58:15 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wz5iI-00758C-7i
 for xen-devel@lists.xenproject.org; Wed, 26 Aug 2026 06:58:14 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <frn1furkan10@gmail.com>)
 id 6a8e7247-e002-0a2a0a5209dd-0a2a450aa3fc-44
 for <xen-devel@lists.xenproject.org>; Wed, 26 Aug 2026 06:58:14 +0200
Received: from [209.85.208.41] (helo=mail-ed1-f41.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <frn1furkan10@gmail.com>)
 id 6a8e7266-f2d2-0a2a450a0019-d155d029f04b-3
 for <xen-devel@lists.xenproject.org>; Wed, 26 Aug 2026 06:58:14 +0200
Received: by mail-ed1-f41.google.com with SMTP id
 4fb4d7f45d1cf-69fc9f25118so508554a12.2
 for <xen-devel@lists.xenproject.org>; Tue, 25 Aug 2026 21:58:14 -0700 (PDT)
Received: from notebook.. ([88.230.44.160]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c250a9b43a0sm278781666b.52.2026.08.25.21.58.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Aug 2026 21:58:13 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1787720294; x=1788325094; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7in3bnZnBsyVu6luHl4QWHPZitMbNPCAzBx2BqoAsCA=;
        b=eoGTwLymht+g5v/LFun8r9HWVMIo5a5fJb9JtOHiQha+hGNjp5QXbU9JRcb5SqtDN2
         8BQkPjfwBv2IHJr2JIDc6h2bnsv4hRoJIcuhpMLr7KPspLVLw58QtgEAKIrMhrz+i8R3
         qmHLfY1vTyaMXAhw7Z7cbUgs3Wh/E/haN3f7p95M9iI3uGGqguoYBRFhaGFegR74XVqm
         cSJsxVyBPMNjeKjGmHsbFDqP/zyX6XLpg+cxoxz5n7x6Yeq8g9KqagmvoN44bplRsdDk
         JKH8WfbGIiw8Zl72qOrB32246lXlzlhLHzYNRnpmuSfRu+mT20+iWfeq6p++3w7gEWFj
         02lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787720294; x=1788325094;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7in3bnZnBsyVu6luHl4QWHPZitMbNPCAzBx2BqoAsCA=;
        b=U40MkrIb5xhj7t/YdOF49DNclK4X283RXUKh5zCKxMgerluNBELXthkBVj2dm9LAHA
         DYHqKfLdtmB+eaTozdYlzE8QrdHC1taHNJ0UnO3JtU0QeUM3UmWe9uvdXKCmAQIZeop6
         leOBQf+baiu3LukQ6AdS52jX2COIvK/TIXYvcEVrxcrp1eX3vIGzu4l1pJHuLcNV4jPE
         /jR1BRvXnI2AvcuZMJTW5/h+GQOTi8wvMECN1HmbiNlBLrB2j8yPCUbSNRPIDmHpDFcL
         V3BUeLpO0tVGNJEG3y1ulgC29hgQqwF3hmFUozTiLJ/yAMnKTHzx7/pseziH6hBrN+bj
         KRUQ==
X-Gm-Message-State: AFuF++lurlWSsXZA5DeL9bCUqDkme/lpLx5RLPpoSIcp4WQRQgmOmiYP
	sUDzo67qZrYv85rJ7hM14Gp8Vzsqb2SLklnMZzkCdoDLp9VKAL7hzAXZJvtv9A==
X-Gm-Gg: AR+sD11s3GhVpPYA/SSRA5bVAFvoCpf/DjbxQWETRC17rwZ59etL6r44AMrGhtJOJ5z
	zVHh+G9ov30n/Qi8ZTFuQ6VnF+syQePNqFQBvSf+c+npjzd7cWTiwOBP1g5dPmw72in/QatldEf
	7ae2D7ftSixZqMKNfXjc4Q0rQPsNVmXrnCyprdI41r1o4v8drrVCpEsvsSSnoYR4hQwVmRf7cvA
	SbyKeu42c/5Gsq6Mf75tXmnw/dTQFCsrOlpEDrZIT15VfqQVo0x6yYd5Xu1XhLKh8V61woN3Mgt
	eeR+c0dwjketmU/2ezTh512OPw3I/nekYloYvEjrYT/JU/wLVc7sX1ZA8oMAfniFzejYJagTgfm
	13gilavpV27Zn4Ll93hoXLM4JfroqANiXjphcQFVJJmeyvq5/WNQ29vIIN+qzvn1MpouWkXQo3K
	4VMNsBKBPCnNrLKlaLgOVRWjeqReZ6M80kwohbVubnj/SjKWlrYqSvfHoMfTPcxg==
X-Received: by 2002:a17:907:d08f:b0:c24:adf4:5c73 with SMTP id a640c23a62f3a-c250baf7e8amr492583166b.1.1787720293656;
        Tue, 25 Aug 2026 21:58:13 -0700 (PDT)
From: Furkan Caliskan <frn1furkan10@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: jgross@suse.com,
	jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	roger@xenproject.org,
	dfaggioli@suse.com,
	anthony.perard@vates.tech,
	julien@xen.org,
	sstabellini@kernel.org,
	gwd@xenproject.org,
	enr0n@ubuntu.com,
	michal.orzel@amd.com,
	Furkan Caliskan <frn1furkan10@gmail.com>
Subject: [PATCH 1/5] xen/sched: rtds: add global-EDF utilization admission control
Date: Wed, 26 Aug 2026 07:57:16 +0300
Message-Id: <20260826045720.5779-2-frn1furkan10@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260826045720.5779-1-frn1furkan10@gmail.com>
References: <20260826045720.5779-1-frn1furkan10@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-4011c0/1787720294-5A3DCCFC-3BDAB81C/0/0
X-purgate-type: clean
X-purgate-size: 7027

RTDS has no admission control: nothing stops the sum of all admitted
units' (budget/period) reservations in a cpupool from exceeding
what its pCPUs can actually provide. Once that happens, none of the
EDF deadline guarantees this scheduler is built around still hold
for the units sharing that pool.

Introduce admission control to prevent this: reject a reservation
whenever admitting it would push a cpupool's units over its capacity.
Track a running utilization total per cpupool, and enforce it in
rt_alloc_udata()/rt_free_udata(), the paired lifecycle hooks for a
unit's creation and destruction. This catches the default
period/budget every new unit gets.

Utilization is represented as a fixed-point value: budget is
left shifted by RTDS_UTIL_SHIFT (20 bits) and divided by period.
A plain "(budget << RTDS_UTIL_SHIFT) / period" risks overflowing
the multiply for large enough budgets. Rather than widen the
arithmetic to tolerate any input, the input itself is bounded:
rt_validate_params() rejects any budget above RTDS_MAX_BUDGET,
chosen as the largest value that can be left-shifted by
RTDS_UTIL_SHIFT without overflowing 64 bits, so the shift in
rt_unit_utilization() can never overflow.

A cpupool's capacity rt_utilization_cap() scales with the number of
scheduling resources in it. It is calculated as:
(number of sched_resources * RTDS_UTIL_SCALE * RTDS_UTIL_CAP_PCT / 100),
where RTDS_UTIL_CAP_PCT controls how much of that capacity can
actually be reserved; at 100% (its current value), all of it can be.

Signed-off-by: Furkan Caliskan <frn1furkan10@gmail.com>
---
 xen/common/sched/rt.c | 105 +++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 104 insertions(+), 1 deletion(-)

diff --git a/xen/common/sched/rt.c b/xen/common/sched/rt.c
index 0e9f04ea72..9126320801 100644
--- a/xen/common/sched/rt.c
+++ b/xen/common/sched/rt.c
@@ -114,6 +114,24 @@
  */
 #define RTDS_MAX_PRIORITY_LEVEL (~0U)
 
+/*
+ * Fixed-point scale for utilization (budget/period)
+ */
+#define RTDS_UTIL_SHIFT     20
+#define RTDS_UTIL_SCALE     (1ULL << RTDS_UTIL_SHIFT)
+
+/*
+ * Largest budget safe to left-shift by RTDS_UTIL_SHIFT without
+ * overflowing 64 bits. Enforced in rt_validate_params().
+ */
+#define RTDS_MAX_BUDGET_BITS  (64 - RTDS_UTIL_SHIFT)
+#define RTDS_MAX_BUDGET       ((1ULL << RTDS_MAX_BUDGET_BITS) - 1)
+
+/*
+ * % of a cpupool's sched_resource capacity admitted units may sum up to.
+ */
+#define RTDS_UTIL_CAP_PCT   100
+
 /*
  * UPDATE_LIMIT_SHIFT: a constant used in rt_update_deadline(). When finding
  * the next deadline, performing addition could be faster if the difference
@@ -195,6 +213,9 @@ struct rt_private {
     struct list_head replq;     /* ordered list of units that need replenishment */
 
     cpumask_t tickled;          /* cpus been tickled */
+
+    /* Sum of admitted units' (budget/period), scaled by RTDS_UTIL_SCALE */
+    uint64_t utilization;
 };
 
 /*
@@ -635,6 +656,54 @@ replq_reinsert(const struct scheduler *ops, struct rt_unit *svc)
         set_timer(&rt_priv(ops)->repl_timer, rearm_svc->cur_deadline);
 }
 
+/*
+ * budget << RTDS_UTIL_SHIFT can't overflow: rt_validate_params()
+ * caps budget at RTDS_MAX_BUDGET. period == 0 means "no
+ * reservation" (a unit being removed), not an error.
+ */
+static uint64_t
+rt_unit_utilization(s_time_t period, s_time_t budget)
+{
+    if ( period <= 0 )
+        return 0;
+
+    return ((uint64_t)budget << RTDS_UTIL_SHIFT) / (uint64_t)period;
+}
+
+/*
+ * Utilization capacity of the cpupool domain d resides in.
+ */
+static uint64_t
+rt_utilization_cap(const struct domain *d)
+{
+    unsigned int cpus = cpumask_weight(cpupool_domain_master_cpumask(d));
+
+    return (uint64_t)cpus * RTDS_UTIL_SCALE * RTDS_UTIL_CAP_PCT / 100;
+}
+
+/*
+ * Replaces a unit's reservation and updates prv->utilization
+ * to match. Growth that would push utilization over the
+ * cpupool's cap is refused. Removing a unit or shrinking
+ * a unit's reservation always succeed.
+ */
+static int
+rt_admission_test(struct rt_private *prv, const struct domain *d,
+		   s_time_t old_period, s_time_t old_budget,
+		   s_time_t new_period, s_time_t new_budget)
+{
+    uint64_t old_util = rt_unit_utilization(old_period, old_budget);
+    uint64_t new_util = rt_unit_utilization(new_period, new_budget);
+    uint64_t total    = prv->utilization - old_util + new_util;
+
+    if ( new_util > old_util && total > rt_utilization_cap(d) )
+        return -EINVAL;
+
+    prv->utilization = total;
+
+    return 0;
+}
+
 /*
  * Pick a valid resource for the unit vc
  * Valid resource of an unit is intesection of unit's affinity
@@ -864,6 +933,7 @@ rt_free_domdata(const struct scheduler *ops, void *data)
 static void * cf_check
 rt_alloc_udata(const struct scheduler *ops, struct sched_unit *unit, void *dd)
 {
+    struct rt_private *prv = rt_priv(ops);
     struct rt_unit *svc;
 
     /* Allocate per-UNIT info */
@@ -881,9 +951,30 @@ rt_alloc_udata(const struct scheduler *ops, struct sched_unit *unit, void *dd)
     __set_bit(__RTDS_extratime, &svc->flags);
     svc->priority_level = 0;
     svc->period = RTDS_DEFAULT_PERIOD;
+
     if ( !is_idle_unit(unit) )
+    {
+        unsigned long flags;
+        int rc;
+
         svc->budget = RTDS_DEFAULT_BUDGET;
 
+        spin_lock_irqsave(&prv->lock, flags);
+        rc = rt_admission_test(prv, unit->domain, 0, 0,
+                                svc->period, svc->budget);
+        spin_unlock_irqrestore(&prv->lock, flags);
+
+        if ( rc )
+        {
+            printk(XENLOG_WARNING
+                   "RTDS: ADMISSION CONTROL: refusing unit %u of d%d,"
+                   " would exceed utilization capacity of the cpupool\n",
+                   unit->unit_id, unit->domain->domain_id);
+            xfree(svc);
+            return NULL;
+        }
+    }
+
     SCHED_STAT_CRANK(unit_alloc);
 
     return svc;
@@ -892,8 +983,19 @@ rt_alloc_udata(const struct scheduler *ops, struct sched_unit *unit, void *dd)
 static void cf_check
 rt_free_udata(const struct scheduler *ops, void *priv)
 {
+    struct rt_private *prv = rt_priv(ops);
     struct rt_unit *svc = priv;
 
+    if ( svc && !is_idle_unit(svc->unit) )
+    {
+        unsigned long flags;
+
+        spin_lock_irqsave(&prv->lock, flags);
+        rt_admission_test(prv, svc->unit->domain,
+                           svc->period, svc->budget, 0, 0);
+        spin_unlock_irqrestore(&prv->lock, flags);
+    }
+
     xfree(svc);
 }
 
@@ -1389,7 +1491,8 @@ rt_validate_params(const struct xen_domctl_sched_rtds *rtds,
     s_time_t b = MICROSECS(rtds->budget);
 
     if ( p < RTDS_MIN_PERIOD || p > RTDS_MAX_PERIOD ||
-         b < RTDS_MIN_BUDGET || b > p )
+         b < RTDS_MIN_BUDGET || b > p ||
+         b > (s_time_t)RTDS_MAX_BUDGET )
         return -EINVAL;
 
     *period = p;
-- 
2.34.1


