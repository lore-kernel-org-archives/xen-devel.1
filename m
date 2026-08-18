Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5E5CC5DF70
	for <xen-devel@archiver.kernel.org>; Tue, 18 Aug 2026 06:33:55 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1393454.1632270 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwDON-0000vf-E7; Tue, 18 Aug 2026 06:33:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1393454.1632270; Tue, 18 Aug 2026 06:33:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwDON-0000vY-AI; Tue, 18 Aug 2026 06:33:47 +0000
Received: by outflank-mailman (input) for mailman id 1393454;
 Tue, 18 Aug 2026 06:33:46 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <frn1furkan10@gmail.com>) id 1wwDOM-0000v7-Pg
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2026 06:33:46 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wwDOM-0053YC-6i
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2026 08:33:46 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <frn1furkan10@gmail.com>)
 id 6a83fcca-bab6-0a2a0a5309dd-0a2a450c9ec2-0
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 08:33:46 +0200
Received: from [209.85.128.53] (helo=mail-wm1-f53.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <frn1furkan10@gmail.com>)
 id 6a83fcca-f479-0a2a450c0019-d1558035e8be-3
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 08:33:46 +0200
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-4954f5e8020so22039905e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 17 Aug 2026 23:33:46 -0700 (PDT)
Received: from notebook.. ([88.230.46.229]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49996188217sm490215315e9.13.2026.08.17.23.33.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Aug 2026 23:33:45 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1787034826; x=1787639626; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Kd6Uf/jaILnHhDnAFQz92ldpUytfMBZNj1lRHYK8kiA=;
        b=PZ71Li1x7JJH9i9peXHTk2FT8wZ6QzaF5aEp/XNz4rocXIlHfhn+KM3WjUZ6Tc7rY4
         9pj1CSOYvLjTD3YIN3tdFdN0NJRnBYzKeoMTdSlTh8+Y5F4sQPEz2mC4swV9sTMM4Mg/
         aaQNIafP3C7jYfK5TJ2ACbeqXhRLG9iCLeX/OjciUH62eZ6mpJ1JAhN+A5q4rYnzpgza
         9QFZW1d4qJBAkWdrJYVFu80WmmSnCd1P3XRyCRYMZ3vImj84mV4TDbedX/GrAJhV9Rnb
         gRD4NFwLQtrEfqKlOESOQ/t7feaxswP1ag/iiOt5kUe0tIkkRrpPqJxb47h+mtZI69aY
         08IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787034826; x=1787639626;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Kd6Uf/jaILnHhDnAFQz92ldpUytfMBZNj1lRHYK8kiA=;
        b=m4uPYQhLT4m0OT8k87hiBYsikegjOHlox8fMBAvVcmjNAAC2LggkV+kaZZdoN0uzyG
         uEtxoolJMi/UbkZQlZb8mrBJb5776HJzE6maztsdL3XmXJ4q3ZlBxC35V56tF7FsNSTg
         3nqzrBvlT/Peayr+Bttr43GbH1HmTtgROlKP796/tyKxYCbIoWeNC+Gj1+pSU1Rk1EOB
         J653tq0FvgfUlQg9qeo+dAdapshGIhYVe0bMPmnUusw4LWDYw4Ec/rJEU4mWYDIBP/si
         DU3zbF7kzjBUyBQez+rXFwRIyQNQ1NL2LQPZvtExJi18qoOsGk9l73eX7dB3nOsu3U5F
         sF+g==
X-Gm-Message-State: AOJu0YwgtnOJjFpDhpM1MIHuBP5gP6Rlg7ubVlgXLEBHKng81i2WQoiP
	O9BdG7k3ItWYxAW4tRCdaE3Dd12RA9jD+qpOhSFAOb8eQxcVB5+VNoVJaBCw+g==
X-Gm-Gg: AR+sD12htkfojvIScPAJ1gGo5Kcd8hqCkKyoGk68Hz2ASFNDFH9AGBnpq5Mfe34BkFo
	Xg6Iv/5ZBPZGTvucha1dLxY7aoazIJ6Wk14Ru6XAWaR2yd1QI087WG0Y0xPDus3XtAxnOupZ2Lh
	Dzaf09yUalJz1vrTeUhs04QwCQAOcf+Z1t55gRrhhzTVHIQPpr6nWgqsKrGjdBAiBjZEYG6oQZH
	IwI1v+d4YdIUByYXritVsyN5DhQT56spgZolN1qaaZwvW8QiB5XshuSHopjtLXqUMSXtNWAstVu
	5l8lihhUYWOL9gGwfxOTKzfKrwZ4ZvE4jBrHJgyvyF5+bGxLxVg1PSVvieN/6h2mjJHA2baE+0g
	6hwN7ndR1/8ByEM0nTvSXhVRoTtaaGQUAbnA6E1/v5i89bXpVsiZtjNMeUUNe7ursN8gBoY1OFz
	VD5SOlh2eBLswbs73uoqjts0+q8foygvUwFL/c9AihtrKtrhXcdcygSfy6GtmB
X-Received: by 2002:a05:600c:6287:b0:495:5fdf:2075 with SMTP id 5b1f17b1804b1-499878ccf00mr444504555e9.0.1787034825529;
        Mon, 17 Aug 2026 23:33:45 -0700 (PDT)
From: Furkan Caliskan <frn1furkan10@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: jgross@suse.com,
	jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	dfaggioli@suse.com,
	gwd@xenproject.org,
	Furkan Caliskan <frn1furkan10@gmail.com>
Subject: [PATCH 1/2] xen/sched: core: skip missing vcpu slots in sched_move_domain()
Date: Tue, 18 Aug 2026 09:32:58 +0300
Message-Id: <20260818063259.18733-2-frn1furkan10@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260818063259.18733-1-frn1furkan10@gmail.com>
References: <20260818063259.18733-1-frn1furkan10@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d25034/1787034826-012C8A5B-680D25A9/0/0
X-purgate-type: clean
X-purgate-size: 2307

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

Before building a unit in sched_move_domain(), check that all of
its vcpu slots are populated, and skip it if any are missing. The
rest of the function walks the vcpus that actually exist, via
for_each_vcpu() rather than n_units, so skipping a unit here
does not leave anything else out of sync.

Signed-off-by: Furkan Caliskan <frn1furkan10@gmail.com>
---
 xen/common/sched/core.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/xen/common/sched/core.c b/xen/common/sched/core.c
index d3a0a97e1d..d542c76543 100644
--- a/xen/common/sched/core.c
+++ b/xen/common/sched/core.c
@@ -745,6 +745,25 @@ int sched_move_domain(struct domain *d, struct cpupool *c)
 
     for ( unit_idx = 0; unit_idx < n_units; unit_idx++ )
     {
+        /*
+         * Skip this unit if any of its vcpus is missing. Bounded by
+         * max_vcpus.
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
+            continue;
+
         unit = sched_alloc_unit_mem();
         if ( unit )
         {
-- 
2.34.1


