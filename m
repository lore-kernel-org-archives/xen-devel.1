Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46F35C5B572
	for <xen-devel@archiver.kernel.org>; Wed, 19 Aug 2026 05:16:35 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1394520.1633252 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwYet-0001RP-4U; Wed, 19 Aug 2026 05:16:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1394520.1633252; Wed, 19 Aug 2026 05:16:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwYet-0001RH-14; Wed, 19 Aug 2026 05:16:15 +0000
Received: by outflank-mailman (input) for mailman id 1394520;
 Wed, 19 Aug 2026 05:16:13 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <frn1furkan10@gmail.com>) id 1wwYer-0001Qq-NI
 for xen-devel@lists.xenproject.org; Wed, 19 Aug 2026 05:16:13 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wwYer-00H41C-4A
 for xen-devel@lists.xenproject.org; Wed, 19 Aug 2026 07:16:13 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <frn1furkan10@gmail.com>)
 id 6a853c0f-bab6-0a2a0a5309dd-0a2a450ca3d0-36
 for <xen-devel@lists.xenproject.org>; Wed, 19 Aug 2026 07:16:13 +0200
Received: from [209.85.221.44] (helo=mail-wr1-f44.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <frn1furkan10@gmail.com>)
 id 6a853c1c-f479-0a2a450c0019-d155dd2cec05-3
 for <xen-devel@lists.xenproject.org>; Wed, 19 Aug 2026 07:16:12 +0200
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-476a130c138so606489f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 22:16:12 -0700 (PDT)
Received: from notebook.. ([78.173.117.23]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-482b14b80a5sm2827700f8f.24.2026.08.18.22.16.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Aug 2026 22:16:12 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1787116572; x=1787721372; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=piSppthAjFb2KSi6feItTL2z0Ec385nKO3fFaIX3res=;
        b=DX098R+KTA1cBN5RFfFLCbOUZoM+nV1+01sjfgqtP4rKXmVLigBqY0U5E8zxd4TP1g
         lwMmVY/FGXhcqrjzR2F9ytZ5Q6zT7xGmJIpS27kXdmBJ6X4X2AizqlSdYbkYyhrBY427
         ZVC6Jc4l/dHTKt+MgZsxemEz9uIps05InNrVvTWtECtvq/civjYliJrJzAYrhAvCQVC8
         Dd+8A3eTBuKRMmLR4Shgnhk157X1RsHrhp3yCvcPWMzstJdITt9GnYiFYcYBT8a/bdjj
         BLPvJzPuoIqGUHjDhi4g0I4Z+/5oz47kK72foFaZCOKvtonLHNlHkpRs8qUXDbGvsoG4
         gVAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787116572; x=1787721372;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=piSppthAjFb2KSi6feItTL2z0Ec385nKO3fFaIX3res=;
        b=DbQA9m9mCLckTRiomBKcZzWwaV8QNO6kRcJ3LTGWW+xNNBjYTyv3Wc4U64Ll3xOt2k
         G5XIDAimiMeId8DEdoGLUuMaWHEUrcSFD1sRFtS1IlCLn3pm8ePSlUOAQWhztcZhtAzP
         RrDh45bASme/ZX9KLC9CdVpHPy5TCj9HRxwXbaPl25+VBkUKflaCxVjrfGpy0ZmUppJ4
         atkBo6l1lXIr9vHcjM6yp3PyWxNnrdjnZ0IRP9LpxG0kZBiZGluzkV/nh6p8Jm73/KUb
         nKSqFZnuDSkhHa0qlYfxOQQ0Knnih/ikK4rEAhovsGCzdw6nCKe42h0FBfa/a0NpPMia
         AUng==
X-Gm-Message-State: AOJu0YwN+9WZgkPfqfqEYlrc45NXqdOMYYP/PRAV9ytUaOVGu4hlKKtJ
	X6C6YRrybMXlNzMUdAodhXO9GjZTSCF681rMr0l4ba7ftv53PGIswZIMXsml8Q==
X-Gm-Gg: AR+sD13YDzbttV8aEff0g0tuIBb+WPI5qk3ZNinC8rkUhUVxR1zRdPF+3CoZ8Cj+U2p
	vrwziPhu04e6g22ZQO8iWqRyU/kkMnlVLoceXzdEDCGqNGQ3v3unNGclIj5/Pk+KRMCJogZUMnQ
	8Yjp0nMNnKyN/35zHHfmrtViox8rD3AIwP3wS7k+he7rwMAb0McGBNlTrmRi8vcTTTuRCMc2G0C
	6IDLZ8htWXB2i6g7AuKfRLv7Lxu9VGlNZPGIMAMUsNaaX2rgIrKcRJUCloqv/t4if0Y7SkZL/ot
	k6uy4QxJSQU7d0acSGxPWy2/YsAXVjW6iCK0EyrspjQLZu2+8JGMFnDkbZ3tV2ddo74VZtoRI4c
	TZJhSsNu6uacK4sLZr6PwA3hveHANnJMFL0U+yrcz+0YYpKocUp/82UWjIfRbNj0qE4KMor/Xut
	BrTyb1kHyLgVm6fvgX0rml+91uUNcLEd9yN0hfKyg/f/6RS/hYlfdPJv2bsl+o
X-Received: by 2002:a05:6000:60c:b0:47f:71a6:970e with SMTP id ffacd0b85a97d-482b1e84686mr2710317f8f.2.1787116572430;
        Tue, 18 Aug 2026 22:16:12 -0700 (PDT)
From: Furkan Caliskan <frn1furkan10@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: jgross@suse.com,
	jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	dfaggioli@suse.com,
	gwd@xenproject.org,
	Furkan Caliskan <frn1furkan10@gmail.com>
Subject: [PATCH v2 1/2] xen/sched: core: skip missing vcpu slots in sched_move_domain()
Date: Wed, 19 Aug 2026 08:15:31 +0300
Message-Id: <20260819051532.9197-2-frn1furkan10@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260819051532.9197-1-frn1furkan10@gmail.com>
References: <20260819051532.9197-1-frn1furkan10@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d25034/1787116572-02CDBA5B-B8771B32/0/0
X-purgate-type: clean
X-purgate-size: 3009

sched_move_domain() derives the number of units to rebuild from
d->max_vcpus, which is fixed at domain creation and never rolled
back if vcpu_create() fails partway through building a domain. So
d->vcpu[i] can be NULL for some i even though max_vcpus still
counts it - this happens if sched_alloc_udata() returns NULL.

The per-unit loop doesn't check for this: it sets
unit->vcpu_list = d->vcpu[unit_id] (NULL) and hands that broken
unit straight to the destination scheduler's alloc_udata(),
which assumes vcpu_list is always valid and crashes Xen when
it is not.

Reproduced by building a domain in a non-default cpupool where
vcpu creation fails partway through, then destroying it.
domain_kill() moves the domain back to the default cpupool via
sched_move_domain() before actually destroying it, crashing
inside the destination scheduler's alloc_udata() (seen in
Credit2's csched2_alloc_udata() -> is_idle_unit() -> NULL deref).

Before building a unit in sched_move_domain(), check whether all
vpcu slots belonging to that unit are populated. If any of its
vpcus is missing:
 - For a dying domain, skip the unit allocation.
 - For an active domain, abort the move and return -EINVAL to
   prevent running with dropped vCPUs.

Fixes: 70fadc41635b ("xen/cpupool: support moving domain between cpupools with different granularity")
Signed-off-by: Furkan Caliskan <frn1furkan10@gmail.com>
---
v2:
 - Fail with -EINVAL if vcpu slots are missing in an active domain.
 - Added Fixes: tag.
---
 xen/common/sched/core.c | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/xen/common/sched/core.c b/xen/common/sched/core.c
index d3a0a97e1d..a9daa42339 100644
--- a/xen/common/sched/core.c
+++ b/xen/common/sched/core.c
@@ -745,6 +745,38 @@ int sched_move_domain(struct domain *d, struct cpupool *c)
 
     for ( unit_idx = 0; unit_idx < n_units; unit_idx++ )
     {
+        /*
+         * A vcpu slot can be missing if creation failed partway
+         * through. A dying domain is being torn down regardless, so
+         * skip the unit -- but a domain that isn't dying still needs
+         * every vcpu it has schedulable, so fail instead of silently
+         * dropping some of them.
+         */
+        bool vcpu_failed = false;
+
+        for ( unsigned int i = 0;
+              i < gran && unit_idx * gran + i < d->max_vcpus; i++ )
+        {
+            if ( !d->vcpu[unit_idx * gran + i] )
+            {
+                vcpu_failed = true;
+                break;
+            }
+        }
+
+        if ( vcpu_failed )
+        {
+            if ( !d->is_dying )
+            {
+                sched_move_domain_cleanup(c->sched, new_units, domdata);
+                rcu_read_unlock(&sched_res_rculock);
+
+                return -EINVAL;
+            }
+
+            continue;
+        }
+
         unit = sched_alloc_unit_mem();
         if ( unit )
         {
-- 
2.34.1


