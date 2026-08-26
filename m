Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A29EBC61DC2
	for <xen-devel@archiver.kernel.org>; Wed, 26 Aug 2026 04:58:34 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1399564.1635576 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wz5iT-0004iw-4W; Wed, 26 Aug 2026 04:58:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1399564.1635576; Wed, 26 Aug 2026 04:58:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wz5iT-0004in-0C; Wed, 26 Aug 2026 04:58:25 +0000
Received: by outflank-mailman (input) for mailman id 1399564;
 Wed, 26 Aug 2026 04:58:23 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <frn1furkan10@gmail.com>) id 1wz5iR-0004hi-No
 for xen-devel@lists.xenproject.org; Wed, 26 Aug 2026 04:58:23 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wz5iR-00758C-4a
 for xen-devel@lists.xenproject.org; Wed, 26 Aug 2026 06:58:23 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <frn1furkan10@gmail.com>)
 id 6a8e725f-e002-0a2a0a5209dd-0a2a450bdaf6-14
 for <xen-devel@lists.xenproject.org>; Wed, 26 Aug 2026 06:58:23 +0200
Received: from [209.85.208.43] (helo=mail-ed1-f43.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <frn1furkan10@gmail.com>)
 id 6a8e726e-b7e8-0a2a450b0019-d155d02bd0cf-3
 for <xen-devel@lists.xenproject.org>; Wed, 26 Aug 2026 06:58:23 +0200
Received: by mail-ed1-f43.google.com with SMTP id
 4fb4d7f45d1cf-6a1542cdb53so536379a12.2
 for <xen-devel@lists.xenproject.org>; Tue, 25 Aug 2026 21:58:23 -0700 (PDT)
Received: from notebook.. ([88.230.44.160]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c250a9b43a0sm278781666b.52.2026.08.25.21.58.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Aug 2026 21:58:22 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1787720302; x=1788325102; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hmp+WJMlrY3UcNmiM1sdN0nUxrpak314iM4OXbwb3nk=;
        b=hveCGDcj7mvrKOKVTeoqQx6bS+Ff2Iri2qf+c4WElaGQJw4hLZPxV79J5uVpUYqwrw
         +XyWr682bYGqI9DUWcDqyP7v75merarD4l5xVd/v+sMcwfz8REdzNz/xJFhEl30wQwL/
         RNwut8sZTztFN7aKgLC2vQUuE4fmXd9iv6u/+cpUiTwHxmLfO+cJ0KVNJ5d4RuZZsXo6
         uzqxe8XvrHgU2yqQqdQ1Iqu8aDK52zp5pdlGOGx/mLt7TbwHE/BJvigBuw5p4Pgr61Si
         J3lnWqzJWZQ7BRx2KDdF9tD7NbeMexmh9OPA8rgXq2yXZy0uVsGc6qrxLvs6zz0QHJWT
         sHHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787720302; x=1788325102;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hmp+WJMlrY3UcNmiM1sdN0nUxrpak314iM4OXbwb3nk=;
        b=aEogs4N+OrEh7MFayt1V8NFfzxrvHUmiJ8/mNFPNaiLbx/D1YfVODRpUG2Pbo0Oqsj
         NkQCi7POXV79YLsuFm8jt/XBulraB5vBPTvZCX5jwEdN7uTJB/NFAt1zuUUgp8diwMFk
         HBprxO+MptmH3zJ5TuKm3rLDq/bVbtF8MJ2YBEPBHwdQRy80cVHIaZA+wY6SjCx0ezN/
         EdYEmG2+Ovw7G1aiPnfbaefBAZHKn0zj9G5d2/0VwwCWGLOg+cvjD61qHOpP41BKyC+x
         xQvkFZVsEUDleKrVHa8XY9kRzeoMTKqMOyV8MgZV2kMyAJYeu5tCzO/shUh4hGXvmyIX
         31SA==
X-Gm-Message-State: AFuF++l5iA7T0EHiKMRstoF1SWZixAnaE2EmC2FNMGTSJOComsPeeb34
	hchss9ZrNPwLx/R7LbfNJxHddbNjny80nXCNDJPnX+1h+6VjhiZz6PPVLRgbuQ==
X-Gm-Gg: AR+sD11Yj/B5nWlTGzW2KHmV/0vSHfclmucvLqEGHTIm6rfjqm+eefpeK1ceTS2+0pT
	7lLgzCpn5WgezSc/yyepzJkgkjqsj4WFn+nq1FXdmv2L44rvRUNga99mEIwn3aH+Dob9Inm3X83
	kgxoErHoIC0PRYMcXPr664rBr2/4puZNc01qKuqOQZ/w24osDiyXXgR34Q987LDyNttDdb7aNRp
	iV24AH1vJu9rp5NBmcGEyd1cYqxhlVAuS5Awf+d7UMMleLYl/NK2FnVx/bMn+ePOkqLv4h+pNXJ
	Ik0w6pQWcQOA3XnD9lYFJp+KlBe82hSx1g2ihATJblB72yIFGkpjIPmHtaegnT7Z/tYG5D5mAMC
	+YtFof1pQC5Fcka0SGjTqD5pUGkadfvQolByzLozbKDtx0rM3hlKiZYNCTt8h2te79evNWr2/Xb
	wMRhta0RssmkYAKeiQJB9ed1S89q1SKPgmEXn1u3PQN3MMdh12ocqpO4cK2gLG
X-Received: by 2002:a17:906:9fce:b0:c1f:1520:4de5 with SMTP id a640c23a62f3a-c250bb50762mr467606766b.1.1787720302595;
        Tue, 25 Aug 2026 21:58:22 -0700 (PDT)
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
Subject: [PATCH 2/5] xen/sched: rtds: enforce admission control in xl sched-rtds
Date: Wed, 26 Aug 2026 07:57:17 +0300
Message-Id: <20260826045720.5779-3-frn1furkan10@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260826045720.5779-1-frn1furkan10@gmail.com>
References: <20260826045720.5779-1-frn1furkan10@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-42698a/1787720303-190CD9EA-E23DD40F/0/0
X-purgate-type: clean
X-purgate-size: 3238

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
rt_admission_test() directly.

Signed-off-by: Furkan Caliskan <frn1furkan10@gmail.com>
---
 xen/common/sched/rt.c | 42 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/xen/common/sched/rt.c b/xen/common/sched/rt.c
index 9126320801..9643a277fe 100644
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
+            rc = -EINVAL;
+            spin_unlock_irqrestore(&prv->lock, flags);
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
+                rc = rt_admission_test(prv, d, svc->period, svc->budget,
+                                        period, budget);
+                if ( rc )
+                {
+                    spin_unlock_irqrestore(&prv->lock, flags);
+                    break;
+                }
+
                 svc->period = period;
                 svc->budget = budget;
                 if ( local_sched.u.rtds.flags & XEN_DOMCTL_SCHEDRT_extra )
-- 
2.34.1


