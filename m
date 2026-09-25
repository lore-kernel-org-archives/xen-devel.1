Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 022A8C9830E
	for <xen-devel@archiver.kernel.org>; Fri, 25 Sep 2026 21:30:01 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1434510.1654390 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xADU5-0006Xu-L8; Fri, 25 Sep 2026 21:29:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1434510.1654390; Fri, 25 Sep 2026 21:29:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xADU5-0006Xm-Hz; Fri, 25 Sep 2026 21:29:33 +0000
Received: by outflank-mailman (input) for mailman id 1434510;
 Fri, 25 Sep 2026 21:29:33 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ruslichenko.r@gmail.com>) id 1xADU4-0006Xg-Vg
 for xen-devel@lists.xenproject.org; Fri, 25 Sep 2026 21:29:33 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xADU4-00FXOq-Cb
 for xen-devel@lists.xenproject.org; Fri, 25 Sep 2026 23:29:32 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ruslichenko.r@gmail.com>)
 id 6ab6e71a-bab6-0a2a0a5309dd-0a2a4502c94c-20
 for <xen-devel@lists.xenproject.org>; Fri, 25 Sep 2026 23:29:32 +0200
Received: from [74.125.228.170] (helo=mail-ej2-f42.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <ruslichenko.r@gmail.com>)
 id 6ab6e7bc-6ca4-0a2a45020019-4a7de4aaa836-3
 for <xen-devel@lists.xenproject.org>; Fri, 25 Sep 2026 23:29:32 +0200
Received: by mail-ej2-f42.google.com with SMTP id
 a640c23a62f3a-c2da4eea067so5006566b.3
 for <xen-devel@lists.xenproject.org>; Fri, 25 Sep 2026 14:29:32 -0700 (PDT)
Received: from thinkpad-t470s.. (93-143-38-88.adsl.net.t-com.hr.
 [93.143.38.88]) by smtp.googlemail.com with ESMTPSA id
 a640c23a62f3a-c2ae757ac8dsm172582266b.25.2026.09.25.14.29.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Sep 2026 14:29:30 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790371772; x=1790976572; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7QucN9a3s6YOZ/pZqC92p6YUYcOmeCZBjPTIIo9ChcI=;
        b=oSEuzGYLBpnzogzKfgDq5IcYxNma71hoL0scWvxT//c0v79b8zyh3RPN9ypo7NlT/j
         6Dfmhv/HdWikn5DQb3vdgFKLEF6iSv9SOecBJ7pKCx4RghA+LOmeRCYdoaRJHc3LjgPj
         dvrRGaSyLm18LQHuQgIdpvLgD8t26i0IhJ+pr9uQ/Zpk40QO0MToPU7O/T5q+Mly6oSa
         VmSZmjR54AEKjWGIkOpqEOk4ljuB3UKYAt4aBU0Y0ih6zLzOt78ZowvKn88HjEfYjNLi
         i1j/DbJxc4pTSCSY4DegdZaMovxczFfLRLYDepT3lo/Eo//J5TMBfN+KO5o63161LZXy
         1YYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790371772; x=1790976572;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7QucN9a3s6YOZ/pZqC92p6YUYcOmeCZBjPTIIo9ChcI=;
        b=Y7KKxll6Et1rS79X20vyIzWGN/YWJvL2u8Dk9QvuzeXD6WPNa4Tg7377BJB4aASoGl
         x6lAB5QA+a5g2qd1LnAxplqDYG/dev3UXNW0dnpzZyUBVcsVysn34zE6BetVYQDYTYZn
         xqg7DcalZJ/M9/FwvyjchsQxS7fk7AdzJTKgzHk2/Z1p6olhumOwGrX5nXNNNRQQQc1f
         HV7L7r6RS1CtpGiCYgjuEaF595plR1wi6eWlwVR/vzDISG0oc2DEBE3OrShCsksqYh64
         f22ASVLWXjrCnOtNE0DijOBKcF/4lPPrg/l5qWZb+3uDSKKoWNGQSzLIDTUHqgR1aE5a
         9dgQ==
X-Gm-Message-State: AFuF++mKzqH+XuEsX2r6IPEPOQXft5mcoIHGU7gqMu7RMQ4EhXs+YXY5
	FWmNgPvXKheNcv5y6dQEyjkmI4Uud7X2bdIjZ5RPZtKwN65VlwyM0Ay3nIGaJdM9xIE=
X-Gm-Gg: AYBFou0ZotyF/lrQpDPHMEpQIXmfp3rHzoQ8B7Iaj+1ghz4n39dqJeXo9WEuNQkamvK
	8N1j4eAo0CvVdVmo6ya+FWzwjreQOXgZKBUvzP+jtoiTvrxzfW4dO358ZlYUTtjNZMy/kJjoVSt
	RR4sWM7QD/iq0QBa8wi8DG6xvYN2mmA6ydc4rJ60M4rtyu7o3H6EmkAt4lx5/87W/u0SOWEQRDB
	jwQtzBji9uTfupxUim/IxKCYGKnzHgyLa+e+MNjYGdySbnY3xVUkvKlWcX2naFMqvclPPVHIkZO
	RxV9scVhHHpNnhm25Clglu3QVpYQS2jltOhH6OEjhU5Wty5vcAAC2C98GpMpsA1lB4cVncm1Un0
	i5ncalQfBWADtMDLybx182kL/zvfuLvQEj8B9gRCWivHucwfIb4b0JMI1M5zh0rvRMeQXHkE1/H
	kWad8IYtRjQvdTGEt+wLq7KmZJKOcyF5MNZJVy4Cpw5YKvqFs63U8MvvZ5x6tK7wbUhb0ctLBrM
	r6otP5z15Z2RpN+dZs1o1gOuD+jpJQx9vlBtTA=
X-Received: by 2002:a17:907:d8e:b0:c2a:f571:312f with SMTP id a640c23a62f3a-c2af571420cmr198424966b.20.1790371771687;
        Fri, 25 Sep 2026 14:29:31 -0700 (PDT)
From: Ruslan Ruslichenko <ruslichenko.r@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: dfaggioli@suse.com,
	jgross@suse.com,
	gwd@xenproject.org,
	artem_mygaiev@epam.com,
	Ruslan_Ruslichenko@epam.com
Subject: [PATCH] xen/sched: refactor urgent count update
Date: Fri, 25 Sep 2026 23:28:03 +0200
Message-ID: <20260925212803.799550-1-ruslichenko.r@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-720697/1790371772-664B62AC-64B91BAE/0/0
X-purgate-type: clean
X-purgate-size: 2311

From: Ruslan Ruslichenko <Ruslan_Ruslichenko@epam.com>

With current implementation whenever vCPU blocks on
waiting for event channel via SCHEDOP_poll hypercall,
scheduler sets 'is_urgent' flag. The flag is cleared
on vCPU runstate change, if it is no longer in
'VPF_blocked' state or its vcpu_id is not in poll_mask.

However, the only way for vCPU runstate to change in
polled state is when it's going to wakeup.

Thus when 'is_urgent' is set, inner condition will always be:

if ( unlikely(v->is_urgent) )
{
    if ( !(v->pause_flags & VPF_blocked) ||            // Always True
         !test_bit(v->vcpu_id, v->domain->poll_mask) ) // Never evaluated

This makes the second condition dead code.

Thus simplify overall code structure and remove dead code.

The patch has no functional change.

Signed-off-by: Ruslan Ruslichenko <Ruslan_Ruslichenko@epam.com>
---
 xen/common/sched/core.c | 26 +++++++++++---------------
 1 file changed, 11 insertions(+), 15 deletions(-)

diff --git a/xen/common/sched/core.c b/xen/common/sched/core.c
index 77cbfd5226..22b3cd1007 100644
--- a/xen/common/sched/core.c
+++ b/xen/common/sched/core.c
@@ -241,26 +241,22 @@ static inline void trace_continue_running(const struct vcpu *v)
 
 static inline void vcpu_urgent_count_update(struct vcpu *v)
 {
+    bool cur_urgent;
+
     if ( is_idle_vcpu(v) )
         return;
 
-    if ( unlikely(v->is_urgent) )
-    {
-        if ( !(v->pause_flags & VPF_blocked) ||
-             !test_bit(v->vcpu_id, v->domain->poll_mask) )
-        {
-            v->is_urgent = 0;
-            atomic_dec(&per_cpu(sched_urgent_count, v->processor));
-        }
-    }
-    else
+    cur_urgent = (v->pause_flags & VPF_blocked) &&
+                 test_bit(v->vcpu_id, v->domain->poll_mask);
+
+    if ( unlikely(v->is_urgent != cur_urgent) )
     {
-        if ( unlikely(v->pause_flags & VPF_blocked) &&
-             unlikely(test_bit(v->vcpu_id, v->domain->poll_mask)) )
-        {
-            v->is_urgent = 1;
+        v->is_urgent = cur_urgent;
+
+        if ( cur_urgent )
             atomic_inc(&per_cpu(sched_urgent_count, v->processor));
-        }
+        else
+            atomic_dec(&per_cpu(sched_urgent_count, v->processor));
     }
 }
 
-- 
2.43.0


