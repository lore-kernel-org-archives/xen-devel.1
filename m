Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD36EC5DF97
	for <xen-devel@archiver.kernel.org>; Wed, 26 Aug 2026 04:58:32 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1399560.1635557 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wz5iD-0004Ec-Jq; Wed, 26 Aug 2026 04:58:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1399560.1635557; Wed, 26 Aug 2026 04:58:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wz5iD-0004EK-Eq; Wed, 26 Aug 2026 04:58:09 +0000
Received: by outflank-mailman (input) for mailman id 1399560;
 Wed, 26 Aug 2026 04:58:09 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <frn1furkan10@gmail.com>) id 1wz5iC-0004EE-Un
 for xen-devel@lists.xenproject.org; Wed, 26 Aug 2026 04:58:09 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wz5iC-004T7d-87
 for xen-devel@lists.xenproject.org; Wed, 26 Aug 2026 06:58:08 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <frn1furkan10@gmail.com>)
 id 6a8e7216-8faa-0a2a0a5109dd-0a2a45059ac2-42
 for <xen-devel@lists.xenproject.org>; Wed, 26 Aug 2026 06:58:08 +0200
Received: from [209.85.218.48] (helo=mail-ej1-f48.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <frn1furkan10@gmail.com>)
 id 6a8e7260-4cb1-0a2a45050019-d155da30a9ee-3
 for <xen-devel@lists.xenproject.org>; Wed, 26 Aug 2026 06:58:08 +0200
Received: by mail-ej1-f48.google.com with SMTP id
 a640c23a62f3a-c169ae1cb26so321175366b.1
 for <xen-devel@lists.xenproject.org>; Tue, 25 Aug 2026 21:58:08 -0700 (PDT)
Received: from notebook.. ([88.230.44.160]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c250a9b43a0sm278781666b.52.2026.08.25.21.58.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Aug 2026 21:58:07 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787720288; x=1788325088; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=v8auABwK2FVkoBZdhUexmZlVI3gSW8A7YBA8gzVO9pk=;
        b=X6bkHgPs/V1M6Zijbs6TVMvzU+0t8bNrFs1ShpbPBhbDBK6v3OeIBlUw0Sgah4NKAv
         hu9s7sBjyPsouho+2e9MJQQfuR6HEmN/P1K6AMpVl9J3y6OqsmvY2u+Vpuio3i6HmRrI
         eciO3J8J8M+sFlizikPmOB2QfLckBuNQCLusoxX73AvbWX9i1wvWWeI0rUBmh3mRN63X
         zzO+YM7yr5U774pL6yei5snQ9iIddPkQZpLd6sQ4k+ZotcrExICeSFjc/5aPwsO7Nfa3
         mcBnlD5vWdEUYFkm9nUvSHLDMlA9B8072RssC15FbZUZfNkV86wK1QAd9WmHsjUzlI5g
         KANQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787720288; x=1788325088;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v8auABwK2FVkoBZdhUexmZlVI3gSW8A7YBA8gzVO9pk=;
        b=YaPz0upNgp5YqxSD99Q30Ek71J4LKoJ2K/4Ug3Xg8d9Q0kn4+v3kO5dZfeWG4fUbp9
         pIKvICNlWnxoEj35XBXN1IOXeWhDhDAokWhFZ8SZYQWKqusal38jiwgP2488xlcnj8bk
         X+eqg50W17DIcwqxqx7CXhV3Us3T5c2p1kFZHm0i2esR/rJ6HqOiJE3/J43sDmIUUh5x
         2Gs0WBYBroq+sek85brT/6I0mF1hygiyd2eCbwDIHeJNVqhoN9hwfSoB+0149CncY9eB
         PyYbxIZYjaSkcvBhZJOyiBt0pyLp7GDC7t2YAbUetGXtXfNoI+5UAvghmzS5LOtZGmtQ
         weTQ==
X-Gm-Message-State: AFuF++lc+gvJvOniH6lWp2OU0r1VzKSZE8QDjmdPnqUbjqXiVBMvMH4Q
	3OkGqcWGSNtFLHJ1mGCrE2L7PWMJWkIvVDFgbE24Tx89p5M3WUTZAlyoGKf5Rg==
X-Gm-Gg: AR+sD10gYTQSxvJDd38O4Zq6DoFN8DEJAngPVkUDdGrqo8LV5uvgGx7hdJ061Ny2j0k
	i6qHwJABf4J2/v1JHp3D6b6YAqkWOfvNmmnISjY8d6pbVjE09fjZiP17hMgqRqgwHnlJxNUywe3
	TDDpmt7gU4iFSQWyK/GuhZyrG1RzzMjkubbalC8xbdFpLiwTHIR78a2q3ln2qNJ49KWlHy1/I2L
	xT7uHrgX7+00INYjnugfYgy72yBqLeGMWbizwqMh+nNXgj97H908PMtb8/ixNuJNLWyJyPGWp6D
	cD7xR6vOIWTcvc0LNDDydThxjzCUOPulL6cEIWFIB6EuvclmPcEvx6Q0ubYRmPqE6BEOGsjd6dM
	35x1V9f8sN+B69D3SPMWzR4WlMmxJByIUwxDmILnZO0M9CpX29DB0UP+i4Z0LEUN5xU3ebJQWdm
	jvFJLSbR5mkQTXg79bNl82HtKUpyknbOFpNWGVcg8vmDJdj7oqqR5sH4TEBVxz
X-Received: by 2002:a17:906:5147:20b0:c25:58e:8d64 with SMTP id a640c23a62f3a-c25058e9f37mr590370566b.12.1787720287647;
        Tue, 25 Aug 2026 21:58:07 -0700 (PDT)
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
Subject: [PATCH 0/5] xen/sched: rtds: add per-cpupool admission control
Date: Wed, 26 Aug 2026 07:57:15 +0300
Message-Id: <20260826045720.5779-1-frn1furkan10@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c201ff/1787720288-730B22A1-A698D853/0/0
X-purgate-type: clean
X-purgate-size: 2236

RTDS currently has no admission control: nothing stops the sum of
all admitted units' (budget/period) reservations in a cpupool from
exceeding what its pCPUs can actually provide. Once that happens,
the global-EDF deadline guarantees the scheduler is built around no
longer hold for any unit sharing that pool.

This series adds admission control to prevent that, tracks and
report utilization, and makes the check toggleable per cpupool so
an operator can disable it if they intentionally want to overcommit.

Patch 1 introduces the core mechanism: a running utilization total
per cpupool, a fixed-point representation of a unit's (budget/period),
and a capacity check enforced in rt_alloc_udata()/rt_free_udata() -
the lifecycle hooks that catch every new unit's default reservation.

Patch 2 extends the same check to domctl, so growing an existing
reservation via xl sched-rtds is checked too.

Patch 3 reports a cpupool's admitted utilization agains its capacity
via the 'r' debug key.

Patch 4 makes admission control itself toggleable per cpupool
(enabled by default) via sysctl.

Patch 5 wires that toggle through libxl and adds -s/-a to
xl sched-rtds, and documents it.

Furkan Caliskan (5):
  xen/sched: rtds: add global-EDF utilization admission control
  xen/sched: rtds: enforce admission control in xl sched-rtds
  xen/sched: rtds: report utilization and cap via debug key
  xen/sched: rtds: make admission control cpupool-wide toggleable
  tools: expose admission control toggle via xl sched-rtds

 docs/man/xl.1.pod.in                 |  20 +++
 tools/golang/xenlight/helpers.gen.go |  23 +++
 tools/golang/xenlight/types.gen.go   |   4 +
 tools/include/libxl.h                |   4 +
 tools/include/xenctrl.h              |   6 +
 tools/libs/ctrl/xc_rt.c              |  40 ++++++
 tools/libs/light/libxl_sched.c       |  46 ++++++
 tools/libs/light/libxl_types.idl     |   5 +
 tools/xl/xl_cmdtable.c               |   8 +-
 tools/xl/xl_sched.c                  | 103 +++++++++++++-
 xen/common/sched/rt.c                | 205 ++++++++++++++++++++++++++-
 xen/include/public/sysctl.h          |   5 +
 12 files changed, 463 insertions(+), 6 deletions(-)

-- 
2.34.1


