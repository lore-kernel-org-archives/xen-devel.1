Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1EADC88E75
	for <xen-devel@archiver.kernel.org>; Fri, 18 Sep 2026 08:10:20 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1424864.1649105 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x7Tfc-0003SP-Vf; Fri, 18 Sep 2026 08:10:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1424864.1649105; Fri, 18 Sep 2026 08:10:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x7Tfc-0003S0-RH; Fri, 18 Sep 2026 08:10:08 +0000
Received: by outflank-mailman (input) for mailman id 1424864;
 Fri, 18 Sep 2026 08:10:07 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <frn1furkan10@gmail.com>) id 1x7Tfb-0003I6-FI
 for xen-devel@lists.xenproject.org; Fri, 18 Sep 2026 08:10:07 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x7Tfa-00AVDl-RW
 for xen-devel@lists.xenproject.org; Fri, 18 Sep 2026 10:10:06 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <frn1furkan10@gmail.com>)
 id 6aacf1db-2eae-0a2a0a5409dd-0a2a450ae71c-36
 for <xen-devel@lists.xenproject.org>; Fri, 18 Sep 2026 10:10:06 +0200
Received: from [74.125.225.76] (helo=mail-wr2-f12.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <frn1furkan10@gmail.com>)
 id 6aacf1de-f2d2-0a2a450a0019-4a7de14cddc8-3
 for <xen-devel@lists.xenproject.org>; Fri, 18 Sep 2026 10:10:06 +0200
Received: by mail-wr2-f12.google.com with SMTP id
 ffacd0b85a97d-48583cc7ab1so183992f8f.2
 for <xen-devel@lists.xenproject.org>; Fri, 18 Sep 2026 01:10:06 -0700 (PDT)
Received: from notebook.. ([88.230.43.170]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48720083c19sm2174133f8f.31.2026.09.18.01.10.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Sep 2026 01:10:05 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1789719006; x=1790323806; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Oy/dbkoBMnHERlUH5IsXUjgHEA7CUR5ZyPf4nBEOh8U=;
        b=PSIuIZyfWVsMX8HhApYfOCQ0f4VlMMmbm6mQiQoig7p/yFbchSsWSs/vRsgD2P8BNt
         JUtbRY+Bdl7EWHCDjP5Q7XFMTYPYN6gLx1dENQUC7FBWobj5/iw8ce2bXmTQ7u5mJv9P
         xRms9f6PbJJrsRmCRfzja+wt2FhyoZk11jWTFbplWnT7pxtZn2hrj0vSFrdIjzsrZHDQ
         c6DMlqZ6vBS8b6zM1KIrG57LJAf7zrLUg1ip5+Z/8NB3EX7yh8WnoH9rE8OnaMiC+rfK
         F8+1Jb5yBhkzdzD7qElF05JGCHvJCcvFepvqsjQNOSFUw7KZRAbskFvqU9SE1147PF+J
         69tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789719006; x=1790323806;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Oy/dbkoBMnHERlUH5IsXUjgHEA7CUR5ZyPf4nBEOh8U=;
        b=U9Jb7MakEZJiv2033e6a7pPsqwgoU6Fb34SrKFRn7K/xJHImdr6wTmh84nYsOiE5tA
         nh1MkNMMAFAMdOHFTNmoX3GQ0tBxR3+F+JX7F9fOXl7NvEmk50gY9iL5EGk2cJsWV95C
         uLGhk6J2chBZZXoc/Zy3jGycPZTogAOraZQ5zYN7kpn4JIUWVwZHTEhYT9l6loQhMWrA
         i+PBLhFeqlRQnfqlHgYM6yfVt9zeskf+d7qUfT5pF8pycQcgFVKFoHkW4yexZztfCeAM
         nkVYaLH8gX0OMeeCNNqm5aDHRGVAEJB+gajFPcqw/CvlKAjA7QwT53iJqlx0hr0G8TmD
         nXfA==
X-Gm-Message-State: AFuF++nPHklu17pKmWwB3hZlP+3chrw8VsW+hwh+23thJ4NpUUUt4DiY
	1/Oq/N61CwSTnieUve15n4ZV+ZQq2Va1yrZe5rqF1TqvBPHahHxkU95xUerXew==
X-Gm-Gg: AYBFou1WpQVrPgY7LR18rPzfVCvjg9LoWm1Gsigu3iILFNfVOMY5Zz6HX6DgyBc4Ezg
	/Z4J9cw9gnzPtt7bY1mfrJGDDU4kWHMIvSejZXjQMZMmCtTQUYtfFp0SjyKrMj3Wg9L8trtW3gH
	3e92s1hDaClx2yukpJk9hzItxhYSNqDuZ3kKx2d3T2uvd9dQ+MNfPhOTTDY+P98LLKaZaUwz9/Q
	myL2hJDrbZzW4bouSuAIVON2ovkFZR+8DBt9kxpDF8g7OgSFUPuqvB4oEg+AgRbwalUH0y4mh0j
	iislvQqSl+tVTeaHt8ELhuNONi2g8W7RvPJCqenULRyn+FSOmQUpWs+NkGzwMEOHQpNb2teW7eC
	Qp5CLRngEHYV2ZmOgmO5jlXWSw66d1kMEpYhNbAzYtMQFFpU8O4xYD04uoGmnLz71swWu2UTOVD
	LwyA7TLqsu37DlCj0p3qwdETu4Wjp8cgHN2xa/1u+ijmFQ2/oi94WaypEnVq+XSxp2ruwP7O7c
X-Received: by 2002:a05:6000:2f88:b0:486:f18b:3cf8 with SMTP id ffacd0b85a97d-4871e220ad4mr1998089f8f.22.1789719006031;
        Fri, 18 Sep 2026 01:10:06 -0700 (PDT)
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
Subject: [PATCH v2 4/5] xen/sched: rtds: make admission control cpupool-wide toggleable
Date: Fri, 18 Sep 2026 11:09:34 +0300
Message-Id: <20260918080935.35498-5-frn1furkan10@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260918080935.35498-1-frn1furkan10@gmail.com>
References: <20260918080935.35498-1-frn1furkan10@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-4011c0/1789719006-536D6CFC-5B9311D6/0/0
X-purgate-type: clean
X-purgate-size: 6019

Add a per-cpupool on/off switch for RTDS admission control via
XEN_SYSCTL_scheduler_op, enabled by default, so an operator can
disable/enable enforcement for a pool

Signed-off-by: Furkan Caliskan <frn1furkan10@gmail.com>
---
v2:
 - Insert a blank line between the two non-fall-through case blocks.
 - Use uint8_t instead of bool for admission_control_enabled in the
   public xen_sysctl_rtds_schedule struct.
---
 xen/common/sched/rt.c       | 57 ++++++++++++++++++++++++++++++++++---
 xen/include/public/sysctl.h |  5 ++++
 2 files changed, 58 insertions(+), 4 deletions(-)

diff --git a/xen/common/sched/rt.c b/xen/common/sched/rt.c
index 342f9b3a51..1c317919ca 100644
--- a/xen/common/sched/rt.c
+++ b/xen/common/sched/rt.c
@@ -216,6 +216,8 @@ struct rt_private {
 
     /* Sum of admitted units' (budget/period), scaled by RTDS_UTIL_SCALE */
     uint64_t utilization;
+
+    bool admission_control_enabled; /* on/off flag for admission control. */
 };
 
 /*
@@ -409,6 +411,9 @@ rt_dump(const struct scheduler *ops)
     cap = (uint64_t)cpumask_weight(ops->cpupool->res_valid) *
           RTDS_UTIL_SCALE * RTDS_UTIL_CAP_PCT / 100;
 
+    printk("Admission control: %s\n",
+            prv->admission_control_enabled ? "enabled" : "disabled");
+
     if ( cap )
         printk("Utilization: %llu%% of capacity\n",
                (unsigned long long)(prv->utilization * 100 / cap));
@@ -694,8 +699,8 @@ rt_utilization_cap(const struct domain *d)
 /*
  * Replaces a unit's reservation and updates prv->utilization
  * to match. Growth that would push utilization over the
- * cpupool's cap is refused. Removing a unit or shrinking
- * a unit's reservation always succeed.
+ * cpupool's cap is refused if admission control is enabled.
+ * Removing a unit or shrinking a unit's reservation always succeed.
  */
 static bool
 rt_try_set_utilization(struct rt_private *prv, const struct domain *d,
@@ -706,7 +711,8 @@ rt_try_set_utilization(struct rt_private *prv, const struct domain *d,
     uint64_t new_util = rt_unit_utilization(new_period, new_budget);
     uint64_t total    = prv->utilization - old_util + new_util;
 
-    if ( new_util > old_util && total > rt_utilization_cap(d) )
+    if ( prv->admission_control_enabled &&
+         new_util > old_util && total > rt_utilization_cap(d) )
         return false;
 
     prv->utilization = total;
@@ -773,6 +779,7 @@ rt_init(struct scheduler *ops)
     INIT_LIST_HEAD(&prv->runq);
     INIT_LIST_HEAD(&prv->depletedq);
     INIT_LIST_HEAD(&prv->replq);
+    prv->admission_control_enabled = true;
 
     ops->sched_data = prv;
     rc = 0;
@@ -1565,8 +1572,14 @@ rt_dom_cntl(
         new_total = prv->utilization - dom_old_util +
                     (uint64_t)nr_units * new_util;
 
-        if ( new_total > prv->utilization && new_total > rt_utilization_cap(d) )
+        if ( prv->admission_control_enabled &&
+             new_total > prv->utilization && new_total > rt_utilization_cap(d) )
         {
+            printk(XENLOG_WARNING
+                   "RTDS: ADMISSION CONTROL: refusing d%d,"
+                   " would exceed utilization capacity of the cpupool\n",
+                   d->domain_id);
+
             spin_unlock_irqrestore(&prv->lock, flags);
             rc = -ENOSPC;
             break;
@@ -1631,6 +1644,11 @@ rt_dom_cntl(
                 if ( !rt_try_set_utilization(prv, d, svc->period, svc->budget,
                                               period, budget) )
                 {
+                    printk(XENLOG_WARNING
+                           "RTDS: ADMISSION CONTROL: refusing vcpu %u of d%d,"
+                           " would exceed utilization capacity of the cpupool\n",
+                           local_sched.vcpuid, d->domain_id);
+
                     spin_unlock_irqrestore(&prv->lock, flags);
                     rc = -ENOSPC;
                     break;
@@ -1691,6 +1709,34 @@ rt_dom_cntl(
     return rc;
 }
 
+#ifdef CONFIG_SYSCTL
+static int cf_check
+rt_sys_cntl(const struct scheduler *ops,
+             struct xen_sysctl_scheduler_op *sc)
+{
+    struct xen_sysctl_rtds_schedule *params = &sc->u.sched_rtds;
+    struct rt_private *prv = rt_priv(ops);
+    unsigned long flags;
+
+    switch ( sc->cmd )
+    {
+    case XEN_SYSCTL_SCHEDOP_putinfo:
+        spin_lock_irqsave(&prv->lock, flags);
+        prv->admission_control_enabled = params->admission_control_enabled;
+        spin_unlock_irqrestore(&prv->lock, flags);
+        break;
+
+    case XEN_SYSCTL_SCHEDOP_getinfo:
+        spin_lock_irqsave(&prv->lock, flags);
+        params->admission_control_enabled = prv->admission_control_enabled;
+        spin_unlock_irqrestore(&prv->lock, flags);
+        break;
+    }
+
+    return 0;
+}
+#endif
+
 /*
  * The replenishment timer handler picks units
  * from the replq and does the actual replenishment.
@@ -1791,6 +1837,9 @@ static const struct sched_ops sched_rtds_def = {
     .remove_unit    = rt_unit_remove,
 
     .adjust         = rt_dom_cntl,
+#ifdef CONFIG_SYSCTL
+    .adjust_global  = rt_sys_cntl,
+#endif
 
     .pick_resource  = rt_res_pick,
     .do_schedule    = rt_schedule,
diff --git a/xen/include/public/sysctl.h b/xen/include/public/sysctl.h
index c7cd9b4eb0..63d0ee062b 100644
--- a/xen/include/public/sysctl.h
+++ b/xen/include/public/sysctl.h
@@ -814,6 +814,10 @@ struct xen_sysctl_credit2_schedule {
     uint32_t ratelimit_us;
 };
 
+struct xen_sysctl_rtds_schedule {
+    uint8_t admission_control_enabled;
+};
+
 /* XEN_SYSCTL_scheduler_op */
 /* Set or get info? */
 #define XEN_SYSCTL_SCHEDOP_putinfo 0
@@ -828,6 +832,7 @@ struct xen_sysctl_scheduler_op {
         } sched_arinc653;
         struct xen_sysctl_credit_schedule sched_credit;
         struct xen_sysctl_credit2_schedule sched_credit2;
+        struct xen_sysctl_rtds_schedule sched_rtds;
     } u;
 };
 
-- 
2.34.1


