Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E289C5B572
	for <xen-devel@archiver.kernel.org>; Wed, 19 Aug 2026 05:16:55 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1394532.1633262 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwYfP-000241-CM; Wed, 19 Aug 2026 05:16:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1394532.1633262; Wed, 19 Aug 2026 05:16:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwYfP-00023u-8t; Wed, 19 Aug 2026 05:16:47 +0000
Received: by outflank-mailman (input) for mailman id 1394532;
 Wed, 19 Aug 2026 05:16:45 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <frn1furkan10@gmail.com>) id 1wwYfN-00021z-Kg
 for xen-devel@lists.xenproject.org; Wed, 19 Aug 2026 05:16:45 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wwYfN-008kHn-1n
 for xen-devel@lists.xenproject.org; Wed, 19 Aug 2026 07:16:45 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <frn1furkan10@gmail.com>)
 id 6a853bff-e002-0a2a0a5209dd-0a2a45079188-32
 for <xen-devel@lists.xenproject.org>; Wed, 19 Aug 2026 07:16:45 +0200
Received: from [209.85.221.44] (helo=mail-wr1-f44.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <frn1furkan10@gmail.com>)
 id 6a853c3c-b4ea-0a2a45070019-d155dd2cdc0a-3
 for <xen-devel@lists.xenproject.org>; Wed, 19 Aug 2026 07:16:45 +0200
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-47f92e3c14bso454593f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 22:16:44 -0700 (PDT)
Received: from notebook.. ([78.173.117.23]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-482b14b80a5sm2827700f8f.24.2026.08.18.22.16.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Aug 2026 22:16:44 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1787116604; x=1787721404; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tvsq1Oa/wr/4Q3UAsjMQRqR3JBXbuIwTjFhPnZ06ijg=;
        b=Yy8E6bYQ66ihRmuo8dBoIvVYXlnbzu1vjWZ4tUQ5f9n44zbazWzuw/f6iHY4REgv9j
         MsyCObsXJisl0alXJ0eqWCAHAp56s/7Ga7SXuO1HOeWeehn9S5VL3e7bnof/9KkqjznK
         kM00QTHVyw9oMRJUoQ5qReVF9/KUXkGSjUkjRoaGdLtE7FTYUtiIuDOHTqcV0YYG29cY
         20FPhz9IOndF+q9aGXf2iGBiBsBse5rZQrs3VmpSpV++XwxkW3kt9a5yuXStDG22lRcA
         cQd0K1EDdNmdPziBSG6uHzf4tvv1PRRY6kkbjS37KT0ttn/A3Zu7oGgJrb/cdm0A5Xbk
         c8yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787116604; x=1787721404;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tvsq1Oa/wr/4Q3UAsjMQRqR3JBXbuIwTjFhPnZ06ijg=;
        b=X6PyhaYLlDGJiOBWpSVXB9CWwBFbRz7VxofGFOu4xvzmv0mvxqEowbTG49oJsLSttJ
         HUGNLGDXNkBe05tpmopU4P19squ/y63dmi9WGCrWIF6mDdquxjIVhOQt8AR3RcCssZOQ
         cqrgsGuBzFI8woewL8UlAi2QXpdfG57o0lkZqabw4pO5N+awKF5/bo88CWezD53RxJ81
         2ogtRaYfSalt78pAkF3pSvEv2wkOLQ+rTnZ3uZ+ROUs82WeFEcadhlbzUeGy5qaSdzgh
         IFShWOVbRuOzoDPHUwjgwk/wvZ5YE1Fp/D6uxFc8gHOMFsMgNlK2gGc9ICcU2ziLwn9a
         uk1g==
X-Gm-Message-State: AOJu0YzPa/VUMShDg5XyptPRYjLzkbHN/5kdo/4TdN4pdWE08wq2SlRm
	dWBmL3V5h6JqIcOOHfJ2FrlSNn8mw7D2bTy9SuStf1kqkCG8H030FOKBU9kMtA==
X-Gm-Gg: AR+sD12udQj3kqiun457qXDN5pgp+axwGSDHGTKmLBjfydXP1rx3O7+DdPMvcuxfSJA
	GeRZhd3wAn2QezuKG40uueaEHwjAjoPtwnd9htyaQm7ILfDoS5fzwR2n8Y3IN2fWL5jN2d0EKLj
	mb9HvOjziF6vAgRKWaCZwBA9hCSBUyH4dQcZx+8IVhypeG2Q427HtLs2PmZGXcMwFz3rVuTNfEg
	MuwaQp/v6AE+g43WMnOf+xFhWLWvxnQHZgG0KSb/ru0aa02T0UF2AMHmVc19cNH4KSqziGg1BuX
	nwyX1K71OXM6j2OmOcIQ7GH9T09G1bXX1Bprifvw91a2ThgYs7gR5LTwmaB3FhuUmBiXbH4NJCL
	DyBfZ/ETtEDQuLDowyFFRdLzlpC9VWU/AqUeauC7HZXNSYg50mxhH5uU6nbzgUn2i2jhqzpCAIf
	L1omeWyLR9QXd+hRQMEfQ5xYmqXCcEHOc0kVHnZLuL3vzqSPLBWultwlUR9P9F
X-Received: by 2002:a05:6000:4387:b0:482:aa2a:52f5 with SMTP id ffacd0b85a97d-482b20033dbmr2478043f8f.24.1787116604492;
        Tue, 18 Aug 2026 22:16:44 -0700 (PDT)
From: Furkan Caliskan <frn1furkan10@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: jgross@suse.com,
	jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	dfaggioli@suse.com,
	gwd@xenproject.org,
	Furkan Caliskan <frn1furkan10@gmail.com>
Subject: [PATCH v2 2/2] xen/sched: core: kill unarmed timers on sched_init_vcpu() failure
Date: Wed, 19 Aug 2026 08:15:32 +0300
Message-Id: <20260819051532.9197-3-frn1furkan10@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260819051532.9197-1-frn1furkan10@gmail.com>
References: <20260819051532.9197-1-frn1furkan10@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ef75cf/1787116605-A68D9AE4-6DC839EA/0/0
X-purgate-type: clean
X-purgate-size: 2040

sched_init_vcpu() calls init_timer() for a vcpu's periodic_timer,
singleshot_timer and poll_timer before it can fail -- these
become live, linked into their target pCPU's per-cpu timer list
regardless of what happens next. If the sched_alloc_udata() call
further down then fails, the function frees the sched_unit via
sched_free_unit() and returns 1, but never unlinks these three
timers.

The caller, vcpu_create(), makes this worse: on sched_init_vcpu()
returning nonzero it jumps to fail_wq, skipping fail_sched and
thus sched_destroy_vcpu() -- the only function on this path that
calls kill_timer() on them. vcpu_destroy() then frees the vcpu,
and the three timers embedded in it, while they are still linked
into that shared list.

This silently corrupts that list. It only shows up later, when
something else touches a neighboring timer: sched_move_domain()
crashed with "Assertion 'entry->prev->next == entry' failed" on a
completely unrelated, valid vcpu's timer.

Kill all three timers in sched_init_vcpu()'s own failure branch,
so it doesn't depend on the caller reaching sched_destroy_vcpu()
to undo what it set up itself.

Fixes: 1ad5dad74cde ("[XEN] Re-jig VCPU initialisation -- VMX init requires generic VCPU")
Signed-off-by: Furkan Caliskan <frn1furkan10@gmail.com>
Reviewed-by: Juergen Gross <jgross@suse.com>
---
v2:
 - Added Fixes: tag.
---
 xen/common/sched/core.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/xen/common/sched/core.c b/xen/common/sched/core.c
index a9daa42339..5777096592 100644
--- a/xen/common/sched/core.c
+++ b/xen/common/sched/core.c
@@ -589,6 +589,9 @@ int sched_init_vcpu(struct vcpu *v)
     unit->priv = sched_alloc_udata(dom_scheduler(d), unit, d->sched_priv);
     if ( unit->priv == NULL )
     {
+        kill_timer(&v->periodic_timer);
+        kill_timer(&v->singleshot_timer);
+        kill_timer(&v->poll_timer);
         sched_free_unit(unit, v);
         rcu_read_unlock(&sched_res_rculock);
         return 1;
-- 
2.34.1


