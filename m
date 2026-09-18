Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6158CC982D2
	for <xen-devel@archiver.kernel.org>; Fri, 18 Sep 2026 08:10:15 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1424862.1649088 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x7TfX-0002Nw-IA; Fri, 18 Sep 2026 08:10:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1424862.1649088; Fri, 18 Sep 2026 08:10:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x7TfX-0002NW-Cd; Fri, 18 Sep 2026 08:10:03 +0000
Received: by outflank-mailman (input) for mailman id 1424862;
 Fri, 18 Sep 2026 08:10:02 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <frn1furkan10@gmail.com>) id 1x7TfW-00027S-KP
 for xen-devel@lists.xenproject.org; Fri, 18 Sep 2026 08:10:02 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x7TfV-003rgf-Hi
 for xen-devel@lists.xenproject.org; Fri, 18 Sep 2026 10:10:01 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <frn1furkan10@gmail.com>)
 id 6aacf1cb-8faa-0a2a0a5109dd-0a2a450288be-40
 for <xen-devel@lists.xenproject.org>; Fri, 18 Sep 2026 10:10:01 +0200
Received: from [74.125.225.76] (helo=mail-wr2-f12.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <frn1furkan10@gmail.com>)
 id 6aacf1d9-6ca4-0a2a45020019-4a7de14cbc85-3
 for <xen-devel@lists.xenproject.org>; Fri, 18 Sep 2026 10:10:01 +0200
Received: by mail-wr2-f12.google.com with SMTP id
 ffacd0b85a97d-482f6350faaso225108f8f.0
 for <xen-devel@lists.xenproject.org>; Fri, 18 Sep 2026 01:10:01 -0700 (PDT)
Received: from notebook.. ([88.230.43.170]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48720083c19sm2174133f8f.31.2026.09.18.01.09.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Sep 2026 01:10:00 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1789719001; x=1790323801; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iQ/UHhRs/oHG8h8cgbtjbUFCoCrSiy2F1gF60N4pmIY=;
        b=sfLLBW/R8y0at93WFhcddCN1BliksEKbbK2IkJDR8KCP8cyd8j1Jcveoa/eHfJJDGI
         EmW6nbnlbPPW72Wc0wjhO3lobxsV8KT/kUGnwFapfJx2PZn9xP8eZlw336ybqwrezYUA
         BJzl7zvroRS7g6ihfOMrP2TlvKa1xYzDhDcvLlwHUBPup1Ls7LjG9PUgfrXoDVpAAKy8
         zuZ90Qnevzbj/07rldV5bvTCho192J+CUFGanuDuaO9r1YKiJ0JRRsL+bAspr2VJp51k
         eoyw3alZiIidzjpvDzt3frG8np/ucEBMMMHvLXayReFE8skrplPOSyXDmlK2la8DJoQC
         x/dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789719001; x=1790323801;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iQ/UHhRs/oHG8h8cgbtjbUFCoCrSiy2F1gF60N4pmIY=;
        b=ddJVuKENdV1+73egEWyDtCo+u2VKk/7nC9AVozScOuzbrGRjJF0QQnM07fQDqfRosn
         JsN8e3EAn98Zfqb7yloSWqbS3uIATDlOGD9n6i9UHiMRwemv5JF5o2b3E/D9HKvkCNow
         bu6eHqqwBZOWDG3ylwFn2oWDzs4of5RHI5JfW1y4zIEAtvzzCupVLCr2+QAWaTLYl+Bk
         SsAvrH3l7oQ1mhVUzY+c85lEDApWARrdnAsJz/ps3X/QZLGyNHfIzxcrWDA/B8HdvlzR
         +k4s3KU0uRQQMoJjDp62WebfJUDtJFyd29FEyTLtkXOi+CS38ymN8xEXw5Mlhw5ppI4w
         /R7w==
X-Gm-Message-State: AFuF++kuuXDAL277wtCz4yTZH+xGU2ssGixQ/Q4oSAHcYRPpGzUZTSZm
	iwdi3Oc8IKoeYFnpAeIug/3HLNEd1VgmSNmLZ54h+qaHTM517+hPJzifUlQ6tw==
X-Gm-Gg: AYBFou0k2U3QUMYutNCsuA5VNAgFFP58lSAn2JzDU3BeT+cwQtT54Fr1+Xdg6mUYDZ5
	hAgMP3lv5NcdHILv2lEh1mliymWZn0D7MH+Zu8m7FEWAgWZH3x0BGIMwKdQwAkz0eGEj/WFKzfm
	ShTxj9Z2/HVkGYzKpjV7bHaztCtPqEVyjzLnrYd6atf2/JZYi1cojCRQf7OrWQxK3Kd13wutbVW
	xpNcj2YiNuxiEh9p/OL3sQTDbQBSEgzaf/al/wEpFyG/8jrVHNxVF2KRbye7he6vO3w8RLNJCB7
	YlNrJESkjh05+sr5I1T6qDsg1ilDG0TQlI8FvfaIfDBZgnNY6lPpQLDchJi/DG25J9/7R5/1Q2R
	EUX0TutLDI5WO9/W6xLA5eN2Oq7cboR8W0pR/qsGDxXJACkeDOYbObWpXb/Q0SN4709/69cjOsT
	BEyJqJy6+NtbDmJe230NHtEn7dsSUVl48LBu2RKcSOMyTbKDKU2RQdEPKpUEuieRuSpoXugUo=
X-Received: by 2002:a5d:64c8:0:b0:487:fb0:9ff with SMTP id ffacd0b85a97d-4871e2177a0mr2376821f8f.22.1789719000677;
        Fri, 18 Sep 2026 01:10:00 -0700 (PDT)
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
Subject: [PATCH v2 2/5] xen/sched: rtds: enforce admission control in xl sched-rtds
Date: Fri, 18 Sep 2026 11:09:32 +0300
Message-Id: <20260918080935.35498-3-frn1furkan10@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260918080935.35498-1-frn1furkan10@gmail.com>
References: <20260918080935.35498-1-frn1furkan10@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-720697/1789719001-67EBB2AC-C9E7D528/0/0
X-purgate-type: clean
X-purgate-size: 3359

Now that we have introduced admission control for new and
removed units. Extend it to XEN_DOMCTL_SCHEDOP_putinfo and
putvcpuinfo, so growing an existing reservation via
xl sched-rtds is checked too.

putinfo sets the same (period, budget) for every unit of a
domain at once, so it tests the whole domain's utilization
delta atomically, rather than unit-by-unit, which could
spuriously reject an overall-acceptable change depending on
iteration order.

putvcpuinfo changes one unit at a time, so it just calls
rt_try_set_utilization() directly.

Signed-off-by: Furkan Caliskan <frn1furkan10@gmail.com>
---
v2:
 - Use ENOSPC instead of EINVAL.
 - Unlock prv->lock before setting rc, not after.
---
 xen/common/sched/rt.c | 42 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/xen/common/sched/rt.c b/xen/common/sched/rt.c
index acebbbe57e..fbebd82c78 100644
--- a/xen/common/sched/rt.c
+++ b/xen/common/sched/rt.c
@@ -1527,11 +1527,43 @@ rt_dom_cntl(
         op->u.rtds.budget = RTDS_DEFAULT_BUDGET / MICROSECS(1);
         break;
     case XEN_DOMCTL_SCHEDOP_putinfo:
+    {
+        uint64_t dom_old_util = 0, new_util, new_total;
+        unsigned int nr_units = 0;
+
         rc = rt_validate_params(&op->u.rtds, &period, &budget);
         if ( rc )
             break;
 
+        new_util = rt_unit_utilization(period, budget);
+
         spin_lock_irqsave(&prv->lock, flags);
+
+        /*
+         * Same (period, budget) for every unit of d: test and commit
+         * the domain's whole utilization delta atomically, rather
+         * than unit-by-unit, which could spuriously reject an
+         * overall-acceptable change depending on iteration order.
+         */
+        for_each_sched_unit ( d, unit )
+        {
+            svc = rt_unit(unit);
+            dom_old_util += rt_unit_utilization(svc->period, svc->budget);
+            nr_units++;
+        }
+
+        new_total = prv->utilization - dom_old_util +
+                    (uint64_t)nr_units * new_util;
+
+        if ( new_total > prv->utilization && new_total > rt_utilization_cap(d) )
+        {
+            spin_unlock_irqrestore(&prv->lock, flags);
+            rc = -ENOSPC;
+            break;
+        }
+
+        prv->utilization = new_total;
+
         for_each_sched_unit ( d, unit )
         {
             svc = rt_unit(unit);
@@ -1540,6 +1572,7 @@ rt_dom_cntl(
         }
         spin_unlock_irqrestore(&prv->lock, flags);
         break;
+    }
     case XEN_DOMCTL_SCHEDOP_getvcpuinfo:
     case XEN_DOMCTL_SCHEDOP_putvcpuinfo:
         while ( index < op->u.v.nr_vcpus )
@@ -1584,6 +1617,15 @@ rt_dom_cntl(
 
                 spin_lock_irqsave(&prv->lock, flags);
                 svc = rt_unit(d->vcpu[local_sched.vcpuid]->sched_unit);
+
+                if ( !rt_try_set_utilization(prv, d, svc->period, svc->budget,
+                                              period, budget) )
+                {
+                    spin_unlock_irqrestore(&prv->lock, flags);
+                    rc = -ENOSPC;
+                    break;
+                }
+
                 svc->period = period;
                 svc->budget = budget;
                 if ( local_sched.u.rtds.flags & XEN_DOMCTL_SCHEDRT_extra )
-- 
2.34.1


