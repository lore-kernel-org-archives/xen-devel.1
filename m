Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7609AC61DF0
	for <xen-devel@archiver.kernel.org>; Mon, 31 Aug 2026 05:17:34 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1403749.1637735 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x0uOa-0005xr-Ab; Mon, 31 Aug 2026 05:17:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1403749.1637735; Mon, 31 Aug 2026 05:17:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x0uOa-0005xk-7l; Mon, 31 Aug 2026 05:17:24 +0000
Received: by outflank-mailman (input) for mailman id 1403749;
 Mon, 31 Aug 2026 05:17:22 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <frn1furkan10@gmail.com>) id 1x0uOY-0005wK-P5
 for xen-devel@lists.xenproject.org; Mon, 31 Aug 2026 05:17:22 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x0uOY-008Rzn-62
 for xen-devel@lists.xenproject.org; Mon, 31 Aug 2026 07:17:22 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <frn1furkan10@gmail.com>)
 id 6a950e2c-2eae-0a2a0a5409dd-0a2a45018648-46
 for <xen-devel@lists.xenproject.org>; Mon, 31 Aug 2026 07:17:22 +0200
Received: from [209.85.221.51] (helo=mail-wr1-f51.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <frn1furkan10@gmail.com>)
 id 6a950e61-5984-0a2a45010019-d155dd33c118-3
 for <xen-devel@lists.xenproject.org>; Mon, 31 Aug 2026 07:17:22 +0200
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-47fe89fb333so1704339f8f.3
 for <xen-devel@lists.xenproject.org>; Sun, 30 Aug 2026 22:17:22 -0700 (PDT)
Received: from notebook.. ([88.230.40.90]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-484322ce2a6sm14228449f8f.19.2026.08.30.22.17.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Aug 2026 22:17:21 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1788153441; x=1788758241; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RF/yfWgOJ/13R8udz3oVi9BzjnDTji2oCBYfoMLlR+k=;
        b=fx7/rgYC+OUiXWPO75j5SeZvTAEobcN8OBrq94xjVAptUgETWSjSBldufgVmc+OXK6
         8/f6npE2ZtITnBSY2SvN/A0dlffoLqMM36u6dLYJkIzs8A+hoOXgNc4VdwBuMoif4HW0
         bYrm0hzz1nOjUcvjH1AjWmU5Uer+81XHaUldQx0v2hlc+ieIlswca1h/mjj7wbPRMh8x
         /bIB2AHlHsyOgR7LmbX+oOMkSnJl7oMfuF9frmBGJ01cpXc1pMSDoKvbmQ+mWErS+0nL
         wwXtRQHtniVSwilOZyNuQDxl1XeyS06vjB5rqgmZd9shmWoDHolGtlHZpE0i/nHq5pf8
         WMAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788153441; x=1788758241;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RF/yfWgOJ/13R8udz3oVi9BzjnDTji2oCBYfoMLlR+k=;
        b=h/9SIOjFhZHOlxLGh9UUI3E341gmMHZ8vY9EAIbDt8Iz+KP4jcFYHIfT+myAfB8xOD
         rhZvTQXcJDi3n2GujRdG2lslHlDZbLXJ2SXbyEmE0m+AXo7fZTWzs0x5mkZJlVbzfnOX
         GZNSse4A0+y5KPgYpWJPbPtrpidttrLa51tOTRquVpun/fd6b/Pfqk87wpBHAMCStzm/
         qcYWGflcOTEoMwHF244w7zP2iwBwEtUXmo+6bj9khYfomsWfFICNlHtu2MUe5pMg+Onk
         7D+9nWJ8gVoxWpxQ6vL/MAl2BeG3Z4TCE/fsBIbEJ8M1yozs8SWgvDEXKl2VHoQNDchf
         vClg==
X-Gm-Message-State: AFuF++kAnJEjZzHlf3BNHwoAqx3T42luqkYtnj7838T7OpjP8SU3GSdp
	1n8Uh86BpiOaCLZvTrt5jn+CVPtk8plXcmejPkqooz1XkLNyGLeG3pL0vNod5g==
X-Gm-Gg: AYBFou0/PkaI5T6j15IGpdPX9p5jbiCodq8iUqLYRbaQkY0LRo8VLOBYk/hgNMRcPzF
	I6hLJ1PAVkiFy3J6ezca3p0n6L0pdrS5+xGvvcCwlUrbam/wE7F/2OuRPHoMu5Nujvm1ICEbVOt
	jlGE4nB4ymsnxSl8wJd0QXRXLbevstGCoVG3zXbL7K6Vylc4qnfJiDsAlmw79N9+S535gCOOCfG
	xn+D89JGZGN/x29kYzcAdrnw6oCKDJzH0PJAOWUA96sGpKGSGDkWsy6txpcRTa5+Nbm9rnmbryo
	ZXId9QUtyB3qHD6Bi+0Y1CsVk5MZVZBtn5L8zFf5nRtzd58P/LbdMEw+tllkVzB0Iv2p3TnTjaD
	RAqzuKM7B2Gup6DeEPpt2JWgKlhWgJd+7wQMlHl2NBMa8M8JvuXwc8MfgO2GJOEZEYasB+6K3fD
	VOmJU57VyjPNHJDwWPieLEmvdempnRAVf7eP0udzKFl6E/7UFvlGATseTV/rI=
X-Received: by 2002:a5d:5f03:0:b0:484:3cbf:f254 with SMTP id ffacd0b85a97d-4843cbff31cmr4195953f8f.21.1788153441502;
        Sun, 30 Aug 2026 22:17:21 -0700 (PDT)
From: Furkan Caliskan <frn1furkan10@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: jgross@suse.com,
	jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	dfaggioli@suse.com,
	gwd@xenproject.org,
	roger@xenproject.org,
	anthony.perard@vates.tech,
	julien@xen.org,
	bertrand.marquis@arm.com,
	michal.orzel@amd.com,
	Volodymyr_Babchuk@epam.com,
	teddy.astie@vates.tech,
	Furkan Caliskan <frn1furkan10@gmail.com>
Subject: [PATCH v3 2/2] xen/sched: core: kill unarmed timers on sched_init_vcpu() failure
Date: Mon, 31 Aug 2026 08:16:37 +0300
Message-Id: <20260831051637.5029-3-frn1furkan10@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260831051637.5029-1-frn1furkan10@gmail.com>
References: <20260831051637.5029-1-frn1furkan10@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d62444/1788153442-1F66C757-2DF32A77/0/0
X-purgate-type: clean
X-purgate-size: 2696

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

Call sched_destroy_vcpu() in sched_init_vcpu()'s own failure
branch instead of sched_free_unit(), so it doesn't depend
on the caller reaching sched_destroy_vcpu() to undo what it set
up itself. sched_destroy_vcpu() assumes unit->priv is set, which
is not the case here, so make it only free the udata and remove
the unit if unit->priv in non-NULL.

Fixes: d884b1077817 ("Domain creation/destruction cleanups.")
Signed-off-by: Furkan Caliskan <frn1furkan10@gmail.com>
---
v3:
 - Call sched_destroy_vcpu() from sched_init_vcpu()'s failure
   branch.
 - Made sched_destroy_vcpu() tolerate unit->priv == NULL.
---
 xen/common/sched/core.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/xen/common/sched/core.c b/xen/common/sched/core.c
index 14069eed03..b65f728e77 100644
--- a/xen/common/sched/core.c
+++ b/xen/common/sched/core.c
@@ -589,7 +589,7 @@ int sched_init_vcpu(struct vcpu *v)
     unit->priv = sched_alloc_udata(dom_scheduler(d), unit, d->sched_priv);
     if ( unit->priv == NULL )
     {
-        sched_free_unit(unit, v);
+        sched_destroy_vcpu(v);
         rcu_read_unlock(&sched_res_rculock);
         return 1;
     }
@@ -869,8 +869,11 @@ void sched_destroy_vcpu(struct vcpu *v)
     {
         rcu_read_lock(&sched_res_rculock);
 
-        sched_remove_unit(vcpu_scheduler(v), unit);
-        sched_free_udata(vcpu_scheduler(v), unit->priv);
+        if ( unit->priv )
+        {
+            sched_remove_unit(vcpu_scheduler(v), unit);
+            sched_free_udata(vcpu_scheduler(v), unit->priv);
+        }
         sched_free_unit(unit, v);
 
         rcu_read_unlock(&sched_res_rculock);
-- 
2.34.1


