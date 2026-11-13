Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8421F606A8FA
	for <xen-devel@archiver.kernel.org>; Fri, 13 Nov 2026 12:05:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=google header.b=Lpd96CDL
Received: from list by lists.xenproject.org with outflank-mailman.1487403.1689847 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRq1k-0004Dx-Fq; Fri, 13 Nov 2026 12:05:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1487403.1689847; Fri, 13 Nov 2026 12:05:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRq1k-0004Dq-CZ; Fri, 13 Nov 2026 12:05:08 +0000
Received: by outflank-mailman (input) for mailman id 1487403;
 Fri, 13 Nov 2026 12:05:07 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper3@citrix.com>) id 1xRq1j-0004Dk-NE
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2026 12:05:07 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xRq1j-0051eo-3z
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2026 13:05:07 +0100
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6af6fcd9-8faa-0a2a0a5109dd-0a2a450bac88-40
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 13:05:07 +0100
Received: from [209.85.128.47] (helo=mail-wm1-f47.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6af6fcf2-b7e8-0a2a450b0019-d155802fcd9f-3
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 13:05:07 +0100
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-4a20bdaf39cso15483195e9.1
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 04:05:06 -0800 (PST)
Received: from localhost.localdomain (host-78-146-248-75.as13285.net.
 [78.146.248.75]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb55a0ffcdsm55889195e9.0.2026.11.13.04.05.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Nov 2026 04:05:05 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=citrix.com header.i="@citrix.com" header.h="Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1794571506; x=1795176306; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KQ3E2Qf7L11ptVj3bz9Y8ujNKwQfV7Rg1joEaRM9wfI=;
        b=Lpd96CDL2JwxbZQcjW85JsHi6OKn2CVMhPuUQtByNPzl6NfcR969C6ut0hTQmsUKlv
         AUothXLtyz9UFmOgSRHWy4LMTXBKcmTJHrrzmLepnvI+OPsp1wjG9zPkwFHm7ISr/Veg
         MSCKjlT2FsInqAjC6UebIvH9fY/YOk+5IVlJU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794571506; x=1795176306;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KQ3E2Qf7L11ptVj3bz9Y8ujNKwQfV7Rg1joEaRM9wfI=;
        b=aXrFeJpqCHPIVuIxWP8/vXhCav5GXgvY7ffrXTnx2kPFNnV0yrWYMxWD0C5kZsasSc
         /f2xbKf9TrE6FNJvaBxdTshIKMkSoXcWLwh7k28c62xhib47CJ33lPaFT7HIR1/F0Jbv
         Lr4LZHuOeTq6m2mV+t2GzhcJZeAqtfRZ1gC6m8alYbXWB6gkkxxouf41KyIDqekh4eF6
         A/ul7DXTg+F4HErIsMqADK/R5RnnlbIIZp/zusWq7XhFhRDpfwV7nRtnFoBQ5yYqMD3p
         m+6Fu4z55xLwU7I2JI/60QIc8UR02uXVmqvnEDG0IzMcgVpMiirTbVMdvorvLtxy/wsF
         PSmg==
X-Gm-Message-State: APuU4Z+L0V+xy/u9hP2jXJHTT7bMX75TQAanMBsT9sNSnhWFXwuLUfQN
	ssUqMxWNrbFt5ppuG4M5OoXgkVSCBpVqeDDMzmvHaaACyXFpNwZgUvcD99/FOY/lluqPhP/7rOp
	nUd6izEA=
X-Gm-Gg: AYBFou13dC8otcH+tTHGcjNjU2xzdWTYvIzZA4Sbeya/dZgRBiFCrQNH0wm1EPaJQQy
	JBBf+ywzRI4C2J7YNhfiCp1EYE2KseiZ6xwgpDaS/QuV+UEbv0KPrRFeuKdmc58FI/7QiEYJ4QL
	NLrybtdmg7lM8qbmSdkxxtnGUS1j+b17GGi8XyOOtVzPxpyrP09dUiH9WVa2rF0Mzmo0uHHoUD8
	pWcfa7N2DSAsFGrPsm7OIdIKD+GDxTCcZZEwloKoovgztbRgZZUD5lbmkL1lVIUQAf/xm/0DAsT
	7x/8zETpVjvnnsdwewZLX3JoKLEAaLA5ZhDRD5Jp/ErM3q2fTZi4lbc2HLgAtbouDlQL3Zx1LJk
	4v4C0yLhIxU4hvLv4O+rNVN2xg4mkuTwNyeZgFH2+Kb+6BI4ZzUnJsIFoyxqEkPbbC6Zf+19Vsz
	gntTsl9jldw5KVdZAbPnpPX443wE5COUQhdAEF8IIUJsDE8EiMonel6jHefC7hFVvY9a73F+DOL
	nhao5XaX4L94z+cVlOeH8PTFoTgt4SBHNa+rgLjYptgZ/mIh6+H8iJnBpus6dQ65KNXfgDRi+5v
	TxAQRFzV21GqV8MXp0nPEkCoStjfA2bJw1A16339rGRJVCpOjWBoDJUkwAPxePNjjUg9FSiN8ny
	zcVI=
X-Received: by 2002:a05:600c:46c9:b0:4a3:d327:6ed with SMTP id 5b1f17b1804b1-4bb55a5fdf6mr45039635e9.17.1794571505961;
        Fri, 13 Nov 2026 04:05:05 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Dario Faggioli <dfaggioli@suse.com>,
	Juergen Gross <jgross@suse.com>,
	George Dunlap <gwd@xenproject.org>
Subject: [PATCH] xen/sched: Drop the *_UNIT_CHECK() macros
Date: Fri, 13 Nov 2026 12:05:04 +0000
Message-Id: <20261113120504.3407364-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-42698a/1794571507-A86CA9EA-AE11F64A/0/0
X-purgate-type: clean
X-purgate-size: 5380
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

All these do is conditionalise calling the related check function.  Compile
the function generally, and use an early exit to DCE it in release builds.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Dario Faggioli <dfaggioli@suse.com>
CC: Juergen Gross <jgross@suse.com>
CC: George Dunlap <gwd@xenproject.org>
---
 xen/common/sched/credit.c  | 14 ++++++--------
 xen/common/sched/credit2.c | 14 ++++++--------
 xen/common/sched/null.c    | 12 +++++-------
 3 files changed, 17 insertions(+), 23 deletions(-)

diff --git a/xen/common/sched/credit.c b/xen/common/sched/credit.c
index f1a9b4aed1ae..8435c2441024 100644
--- a/xen/common/sched/credit.c
+++ b/xen/common/sched/credit.c
@@ -660,13 +660,15 @@ csched_switch_sched(struct scheduler *new_ops, unsigned int cpu,
     return &sr->_lock;
 }
 
-#ifndef NDEBUG
 static inline void
-__csched_unit_check(const struct sched_unit *unit)
+csched_unit_check(const struct sched_unit *unit)
 {
     struct csched_unit * const svc = CSCHED_UNIT(unit);
     struct csched_dom * const sdom = svc->sdom;
 
+    if ( !IS_ENABLED(CONFIG_DEBUG) )
+        return;
+
     BUG_ON( svc->unit != unit );
     BUG_ON( sdom != CSCHED_DOM(unit->domain) );
     if ( sdom )
@@ -681,10 +683,6 @@ __csched_unit_check(const struct sched_unit *unit)
 
     SCHED_STAT_CRANK(unit_check);
 }
-#define CSCHED_UNIT_CHECK(unit)  (__csched_unit_check(unit))
-#else
-#define CSCHED_UNIT_CHECK(unit)
-#endif
 
 /*
  * Delay, in microseconds, between migrations of a UNIT between PCPUs.
@@ -1863,7 +1861,7 @@ static void cf_check csched_schedule(
     bool migrated = false;
 
     SCHED_STAT_CRANK(schedule);
-    CSCHED_UNIT_CHECK(unit);
+    csched_unit_check(unit);
 
     if ( unlikely(tb_init_done) )
     {
@@ -2034,7 +2032,7 @@ static void cf_check csched_schedule(
         set_timer(&spc->ticker, now + MICROSECS(prv->tick_period_us)
                                 - now % MICROSECS(prv->tick_period_us) );
 
-    CSCHED_UNIT_CHECK(unit->next_task);
+    csched_unit_check(unit->next_task);
 }
 
 static void
diff --git a/xen/common/sched/credit2.c b/xen/common/sched/credit2.c
index c32e753bb4f0..042168e531c6 100644
--- a/xen/common/sched/credit2.c
+++ b/xen/common/sched/credit2.c
@@ -2153,13 +2153,15 @@ static void cf_check replenish_domain_budget(void *data)
     set_timer(&sdom->repl_timer, sdom->next_repl);
 }
 
-#ifndef NDEBUG
 static inline void
 csched2_unit_check(const struct sched_unit *unit)
 {
     struct csched2_unit * const svc = csched2_unit(unit);
     struct csched2_dom * const sdom = svc->sdom;
 
+    if ( !IS_ENABLED(CONFIG_DEBUG) )
+        return;
+
     BUG_ON( svc->unit != unit );
     BUG_ON( sdom != csched2_dom(unit->domain) );
     if ( sdom )
@@ -2173,10 +2175,6 @@ csched2_unit_check(const struct sched_unit *unit)
     }
     SCHED_STAT_CRANK(unit_check);
 }
-#define CSCHED2_UNIT_CHECK(unit)  (csched2_unit_check(unit))
-#else
-#define CSCHED2_UNIT_CHECK(unit)
-#endif
 
 static void *cf_check
 csched2_alloc_udata(const struct scheduler *ops, struct sched_unit *unit,
@@ -3244,7 +3242,7 @@ csched2_unit_insert(const struct scheduler *ops, struct sched_unit *unit)
 
     SCHED_STAT_CRANK(unit_insert);
 
-    CSCHED2_UNIT_CHECK(unit);
+    csched2_unit_check(unit);
 }
 
 static void cf_check
@@ -3595,7 +3593,7 @@ static void cf_check csched2_schedule(
     bool migrated = false;
 
     SCHED_STAT_CRANK(schedule);
-    CSCHED2_UNIT_CHECK(currunit);
+    csched2_unit_check(currunit);
 
     BUG_ON(!cpumask_test_cpu(sched_cpu, &csched2_priv(ops)->initialized));
 
@@ -3777,7 +3775,7 @@ static void cf_check csched2_schedule(
     currunit->next_task = snext->unit;
     snext->unit->migrated = migrated;
 
-    CSCHED2_UNIT_CHECK(currunit->next_task);
+    csched2_unit_check(currunit->next_task);
 }
 
 static void
diff --git a/xen/common/sched/null.c b/xen/common/sched/null.c
index b3c6651fb1f5..1099041c130f 100644
--- a/xen/common/sched/null.c
+++ b/xen/common/sched/null.c
@@ -785,12 +785,14 @@ static void cf_check null_unit_migrate(
     sched_set_res(unit, get_sched_res(new_cpu));
 }
 
-#ifndef NDEBUG
 static inline void null_unit_check(struct sched_unit *unit)
 {
     struct null_unit * const nvc = null_unit(unit);
     struct null_dom * const ndom = unit->domain->sched_priv;
 
+    if ( !IS_ENABLED(CONFIG_DEBUG) )
+        return;
+
     BUG_ON(nvc->unit != unit);
 
     if ( ndom )
@@ -800,10 +802,6 @@ static inline void null_unit_check(struct sched_unit *unit)
 
     SCHED_STAT_CRANK(unit_check);
 }
-#define NULL_UNIT_CHECK(unit)  (null_unit_check(unit))
-#else
-#define NULL_UNIT_CHECK(unit)
-#endif
 
 
 /*
@@ -823,7 +821,7 @@ static void cf_check null_schedule(
     struct null_unit *wvc;
 
     SCHED_STAT_CRANK(schedule);
-    NULL_UNIT_CHECK(current->sched_unit);
+    null_unit_check(current->sched_unit);
 
     if ( unlikely(tb_init_done) )
     {
@@ -940,7 +938,7 @@ static void cf_check null_schedule(
                   !unit_runnable_state(prev->next_task)) )
         prev->next_task = sched_idle_unit(sched_cpu);
 
-    NULL_UNIT_CHECK(prev->next_task);
+    null_unit_check(prev->next_task);
 
     prev->next_task->migrated = false;
 }
-- 
2.39.5


