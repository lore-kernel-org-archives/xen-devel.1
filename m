Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 561CDC5DF97
	for <xen-devel@archiver.kernel.org>; Wed, 26 Aug 2026 04:58:43 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1399567.1635594 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wz5ic-0005M2-IB; Wed, 26 Aug 2026 04:58:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1399567.1635594; Wed, 26 Aug 2026 04:58:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wz5ic-0005Lv-Dv; Wed, 26 Aug 2026 04:58:34 +0000
Received: by outflank-mailman (input) for mailman id 1399567;
 Wed, 26 Aug 2026 04:58:32 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <frn1furkan10@gmail.com>) id 1wz5ia-0005Ga-Ob
 for xen-devel@lists.xenproject.org; Wed, 26 Aug 2026 04:58:32 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wz5ia-006gp8-5P
 for xen-devel@lists.xenproject.org; Wed, 26 Aug 2026 06:58:32 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <frn1furkan10@gmail.com>)
 id 6a8e726a-2eae-0a2a0a5409dd-0a2a450acf9c-14
 for <xen-devel@lists.xenproject.org>; Wed, 26 Aug 2026 06:58:32 +0200
Received: from [209.85.218.45] (helo=mail-ej1-f45.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <frn1furkan10@gmail.com>)
 id 6a8e7278-f2d2-0a2a450a0019-d155da2dad13-3
 for <xen-devel@lists.xenproject.org>; Wed, 26 Aug 2026 06:58:32 +0200
Received: by mail-ej1-f45.google.com with SMTP id
 a640c23a62f3a-c250c6a6a9aso50214966b.1
 for <xen-devel@lists.xenproject.org>; Tue, 25 Aug 2026 21:58:32 -0700 (PDT)
Received: from notebook.. ([88.230.44.160]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c250a9b43a0sm278781666b.52.2026.08.25.21.58.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Aug 2026 21:58:31 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1787720311; x=1788325111; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IoJGB6t5A5yVoQBOIDHzvIHt2FzWFgHAlTPuWE7dzHM=;
        b=RhrFIf51Ymw/lrj5LwkqCSd5HO6pt4REofbWHiY3pu9crS2n0UwXkx8c5cqkV811ET
         u0+Lu7zEEwW4xIJdA7Jz1EbCShYKxIxDrN5PyrxHH10jkZyATY9l/rzxfZxqM9Igv6Qu
         sC0EM5KvxPuVx7geZDZB/n/no6AM7aMGyPFKGk/1SOSqa9IUTjC6aaJX3UlBJJT1YKrT
         UiW423v4h4/cHeWZWYF5JIJUw3/rVJazXFETnrXY6TYly4C76W2jBPIJOogYii9/EIIX
         CDVPi93clnVLSpOT36IR6uhoUGs7MSg+FFC8A8yxJ1t+gI4Bp49Wr6T8We0h6OGi0VKB
         oHEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787720311; x=1788325111;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IoJGB6t5A5yVoQBOIDHzvIHt2FzWFgHAlTPuWE7dzHM=;
        b=A7NDK674FdYjiAorHap0rTGB7dlsIUK/WvkTWRr+X8J6ngFaY/OZqKsPDMKd+79Psy
         TSM68Slf5oh6MPWnDTvxRCUoQzdf6EjxaOVZRemQXICwhj2iAKTB6rDkugyftiGy9n7H
         Z4dviOw7IBwvnZbGk+bXRXoWmRs2+E7MR6bjcUSyXLKxyFsASwN6V6+15HsWx5v8w6kl
         OtE3hwEiUl7sXKk/yRxIAXy2WowAByD4Bb5Hv6A9oE3MgclLOcoJrdvrMD9AsTkgS1bR
         3iSHGrMqfmLlHjoH9ZaP/hOZwth3P4Vf32oK+rGGe5Ki0uyX9pyI6fRNrSZswVauQeYt
         /sBQ==
X-Gm-Message-State: AFuF++nzJjRLDssXJK1vm/ICsuFdfPe/AKvwxFIQJ3U9sHhcrcYQtpJ9
	uNOPf1onPgXATZODXLOvFlhY6t65jN0ph1ucHmNoEnR/zvTR/Nd4RcOeeuSJRg==
X-Gm-Gg: AR+sD11yKTd7d0+lz3MDeP240dC4FOWhwQ9xh6dZ2SIuN8pRFN617qVI8XPZBa+RjKL
	XX9vo1KusmXjnVY+/rhh5EJ+cg5YaAx2OzN6t0VU1hWgyrNsG/ZzT6z0vQiVrefLwLky4rP8dT6
	JuPTq/IKcUlhWt2j67CY54ZHgnCOk9cgP+5v2Q981hVP0g0Ci/HsEm1VcIx2iEIFM8CctPGLGfy
	wuVFV4unjyKPw1n7VscRfGIfrvD8YuU75aNJ7m/ySamyKZIhFEiunlcWPTFjx9j64rvIeQJFFZM
	tpgIAqyafqBii6A0FC1BC+n6KT0IwTiHbuyC2nVFNy7Bb5lWuBgyDZQcZOoCqLdraqZmW0dSspH
	NDrhdOmJQI8VvDNqSN7xIyQePcqiUtOMnY0cIONswY89iKrvsZvy8O8CvnigHLuahKA8+AlgLh7
	+xj/cyi9cpbPxw2BUOY5t7ENbP1TcqJuXStb+p5blJoJzNVyj7qj4L/PIq4zSdVw==
X-Received: by 2002:a17:907:c08c:b0:c21:752f:c44e with SMTP id a640c23a62f3a-c250bc0f7e6mr524107766b.16.1787720311567;
        Tue, 25 Aug 2026 21:58:31 -0700 (PDT)
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
Subject: [PATCH 4/5] xen/sched: rtds: make admission control cpupool-wide toggleable
Date: Wed, 26 Aug 2026 07:57:19 +0300
Message-Id: <20260826045720.5779-5-frn1furkan10@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260826045720.5779-1-frn1furkan10@gmail.com>
References: <20260826045720.5779-1-frn1furkan10@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-4011c0/1787720312-520C1CFC-EA64CAE0/0/0
X-purgate-type: clean
X-purgate-size: 5736

Add a per-cpupool on/off switch for RTDS admission control via
XEN_SYSCTL_scheduler_op, enabled by default, so an operator can
disable/enable enforcement for a pool.

Signed-off-by: Furkan Caliskan <frn1furkan10@gmail.com>
---
 xen/common/sched/rt.c       | 56 ++++++++++++++++++++++++++++++++++---
 xen/include/public/sysctl.h |  5 ++++
 2 files changed, 57 insertions(+), 4 deletions(-)

diff --git a/xen/common/sched/rt.c b/xen/common/sched/rt.c
index 0582c0094d..b150f84242 100644
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
 static int
 rt_admission_test(struct rt_private *prv, const struct domain *d,
@@ -706,7 +711,8 @@ rt_admission_test(struct rt_private *prv, const struct domain *d,
     uint64_t new_util = rt_unit_utilization(new_period, new_budget);
     uint64_t total    = prv->utilization - old_util + new_util;
 
-    if ( new_util > old_util && total > rt_utilization_cap(d) )
+    if ( prv->admission_control_enabled &&
+         new_util > old_util && total > rt_utilization_cap(d) )
         return -EINVAL;
 
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
             rc = -EINVAL;
             spin_unlock_irqrestore(&prv->lock, flags);
             break;
@@ -1632,6 +1645,11 @@ rt_dom_cntl(
                                         period, budget);
                 if ( rc )
                 {
+                    printk(XENLOG_WARNING
+                           "RTDS: ADMISSION CONTROL: refusing vcpu %u of d%d,"
+                           " would exceed utilization capacity of the cpupool\n",
+                           local_sched.vcpuid, d->domain_id);
+
                     spin_unlock_irqrestore(&prv->lock, flags);
                     break;
                 }
@@ -1691,6 +1709,33 @@ rt_dom_cntl(
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
@@ -1791,6 +1836,9 @@ static const struct sched_ops sched_rtds_def = {
     .remove_unit    = rt_unit_remove,
 
     .adjust         = rt_dom_cntl,
+#ifdef CONFIG_SYSCTL
+    .adjust_global  = rt_sys_cntl,
+#endif
 
     .pick_resource  = rt_res_pick,
     .do_schedule    = rt_schedule,
diff --git a/xen/include/public/sysctl.h b/xen/include/public/sysctl.h
index c7cd9b4eb0..f1bf3293e3 100644
--- a/xen/include/public/sysctl.h
+++ b/xen/include/public/sysctl.h
@@ -814,6 +814,10 @@ struct xen_sysctl_credit2_schedule {
     uint32_t ratelimit_us;
 };
 
+struct xen_sysctl_rtds_schedule {
+    bool admission_control_enabled;
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


