Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1BF1C982D9
	for <xen-devel@archiver.kernel.org>; Fri, 18 Sep 2026 08:10:06 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1424860.1649078 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x7TfT-0001ne-8i; Fri, 18 Sep 2026 08:09:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1424860.1649078; Fri, 18 Sep 2026 08:09:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x7TfT-0001nV-5j; Fri, 18 Sep 2026 08:09:59 +0000
Received: by outflank-mailman (input) for mailman id 1424860;
 Fri, 18 Sep 2026 08:09:58 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <frn1furkan10@gmail.com>) id 1x7TfS-0001ms-9w
 for xen-devel@lists.xenproject.org; Fri, 18 Sep 2026 08:09:58 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x7TfR-008Sfx-N5
 for xen-devel@lists.xenproject.org; Fri, 18 Sep 2026 10:09:57 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <frn1furkan10@gmail.com>)
 id 6aacf1ce-e002-0a2a0a5209dd-0a2a45048800-20
 for <xen-devel@lists.xenproject.org>; Fri, 18 Sep 2026 10:09:57 +0200
Received: from [74.125.225.140] (helo=mail-wm2-f12.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <frn1furkan10@gmail.com>)
 id 6aacf1d5-b57f-0a2a45040019-4a7de18ca119-3
 for <xen-devel@lists.xenproject.org>; Fri, 18 Sep 2026 10:09:57 +0200
Received: by mail-wm2-f12.google.com with SMTP id
 5b1f17b1804b1-49b912d3920so3128395e9.1
 for <xen-devel@lists.xenproject.org>; Fri, 18 Sep 2026 01:09:57 -0700 (PDT)
Received: from notebook.. ([88.230.43.170]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48720083c19sm2174133f8f.31.2026.09.18.01.09.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Sep 2026 01:09:56 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1789718997; x=1790323797; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+D5EjjhGdVeYfpgBtQwACc7NrGO8erRw97egY4pDHIA=;
        b=MdnVsE9jDsItahxS0hAy6S6ILGz7hm2Sv8F+uFBZQaCGk3b7KFwETLGeldGlCzHCu7
         0I/LsSYJRQ8SDzmExPDvPlHxDF0/sPKwTSZcCbjSP+bLDEDoI8EmbwBK0qNYlrv9oM3X
         rjw8h1IxCUv2X58+1k7LN825omub+rATNR9kTs9jL334sz3+dhwOraErjW3PoIWIBxd5
         9gu8VDPsuULe+IxQBWlfXFr1ZMDcgt8QfRFpcbQhfCdzs+0LF4qfb/Jr1pA73rUugar6
         qCa7Loz0bpLNRyTwbjU+WNWwkQ1qs8S/+H4evFMPQnZEEaRZXMXqB/rFmaVjkNwAvGVI
         rP/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789718997; x=1790323797;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+D5EjjhGdVeYfpgBtQwACc7NrGO8erRw97egY4pDHIA=;
        b=UJ5BYTEP/bFbnqGANGMP18qaMd7WYfdD8R2k4lG0KhJGSjV/prAeQudh4/6pIjR1ch
         DWq74eQA+wj9oDm9L2E6xbgiiwj+IJiNaRsgPEbJecCa7O1M+e/bLgAhpipPFihvrX4r
         OrDoTXzrEw9m3wy8CaYrA3j1gCFBC3MOxbglhKmord9VkQZ13roJBBOWDeZPBgoO/FYp
         DoJIUNvp/FXrmOBvLrX1JTn8tWPXIUeIoBHv1bNCy7stHKbee0QDfJibPdudCCMaRYOS
         qY6jdytPcUHgplONNO+kspbnzymI6P7NnK6LzK4+P571XrjlKucksPTN+ZNzXjO94Sx5
         u6YA==
X-Gm-Message-State: AFuF++mRJMFjFJmcFCKIhOnAcZqtaQ6BhgH89OmEreao8PDU4F9Lnnp4
	10mFAeItQmPHsxJZdeX+X4XrcF35exIabdhYjN88c7OPdzxbJBUcF5VJ5RvIjA==
X-Gm-Gg: AYBFou2Tj1JGCiU88njb7LqLWphqd36treL4iasEjAt0OCTWb+8DufXY8S2lLRLHAgO
	zyfDX6IWMeKJ/uQKLLMNcybID3HJcKKhSScbJY1s1J16cTjoAuOTHiEu+ffo/P+TXAP8k1wqApZ
	N8ZhrczZAdgR28KvrFNNSuA+N6cQpwagZ6qs+vsDdVWGyTkyRFDWel0l6ChNubERHOjJev1yIX2
	ruzEwvlMh5U2KQaum4aPRkXYvlj9twScvYJdwu3iyE5NkkKFUzCtxwwgBHlbDtEszKWj7zkoco6
	Z6kWIYYqKhzX9MWgLUI6YF9gFoHG6L66mXB7X1AcOeGnm0PiiNur9xZ84aYYBbfwbPwrFgOwSlI
	EiecgJ69FKFbXIsJU3llLHxmNc37RzdJCkc5BQCpGJtAivbQl++ebdIP76/TYQzG5SDjisFFZPv
	0YIERdzIw2G93dYnYU5mDPTKCjTAxSJmt5qBMwT4uWl/MtXMHEU3614qIlDpsby7Dv/BQ/K6y08
	MwU3AXsWw==
X-Received: by 2002:a05:600c:138c:b0:49e:799a:8969 with SMTP id 5b1f17b1804b1-49fc574af20mr17055175e9.30.1789718996990;
        Fri, 18 Sep 2026 01:09:56 -0700 (PDT)
From: Furkan Caliskan <frn1furkan10@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: jgross@suse.com,
	jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	roger@xenproject.org,
	dfaggioli@suse.com,
	anthony.perard@vates.tech,
	julien@xen.org,
	Furkan Caliskan <frn1furkan10@gmail.com>
Subject: [PATCH v2 1/5] xen/sched: rtds: add global-EDF utilization admission control
Date: Fri, 18 Sep 2026 11:09:31 +0300
Message-Id: <20260918080935.35498-2-frn1furkan10@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260918080935.35498-1-frn1furkan10@gmail.com>
References: <20260918080935.35498-1-frn1furkan10@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ebf023/1789718997-C2AC8B50-8B09FF18/0/0
X-purgate-type: clean
X-purgate-size: 7316

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
v2:
 - Renamed rt_admission_test() to rt_try_set_utilization() and changed
   its return type from int to bool, since it doesn't just test but
   also commits the new utilization on success.
---
 xen/common/sched/rt.c | 105 +++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 104 insertions(+), 1 deletion(-)

diff --git a/xen/common/sched/rt.c b/xen/common/sched/rt.c
index 0e9f04ea72..acebbbe57e 100644
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
+static bool
+rt_try_set_utilization(struct rt_private *prv, const struct domain *d,
+                       s_time_t old_period, s_time_t old_budget,
+                       s_time_t new_period, s_time_t new_budget)
+{
+    uint64_t old_util = rt_unit_utilization(old_period, old_budget);
+    uint64_t new_util = rt_unit_utilization(new_period, new_budget);
+    uint64_t total    = prv->utilization - old_util + new_util;
+
+    if ( new_util > old_util && total > rt_utilization_cap(d) )
+        return false;
+
+    prv->utilization = total;
+
+    return true;
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
+        bool admitted;
+
         svc->budget = RTDS_DEFAULT_BUDGET;
 
+        spin_lock_irqsave(&prv->lock, flags);
+        admitted = rt_try_set_utilization(prv, unit->domain, 0, 0,
+                                           svc->period, svc->budget);
+        spin_unlock_irqrestore(&prv->lock, flags);
+
+        if ( !admitted )
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
+        rt_try_set_utilization(prv, svc->unit->domain,
+                                svc->period, svc->budget, 0, 0);
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


