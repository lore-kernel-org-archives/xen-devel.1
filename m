Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F4B5C982D7
	for <xen-devel@archiver.kernel.org>; Fri, 18 Sep 2026 08:10:05 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1424859.1649068 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x7TfO-0001Z6-U7; Fri, 18 Sep 2026 08:09:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1424859.1649068; Fri, 18 Sep 2026 08:09:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x7TfO-0001Yz-Ra; Fri, 18 Sep 2026 08:09:54 +0000
Received: by outflank-mailman (input) for mailman id 1424859;
 Fri, 18 Sep 2026 08:09:53 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <frn1furkan10@gmail.com>) id 1x7TfN-0001Yr-DQ
 for xen-devel@lists.xenproject.org; Fri, 18 Sep 2026 08:09:53 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x7TfM-00G22i-QD
 for xen-devel@lists.xenproject.org; Fri, 18 Sep 2026 10:09:52 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <frn1furkan10@gmail.com>)
 id 6aacf1c2-bab6-0a2a0a5309dd-0a2a450c9e2a-30
 for <xen-devel@lists.xenproject.org>; Fri, 18 Sep 2026 10:09:52 +0200
Received: from [74.125.225.141] (helo=mail-wm2-f13.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <frn1furkan10@gmail.com>)
 id 6aacf1d0-f479-0a2a450c0019-4a7de18da4e5-3
 for <xen-devel@lists.xenproject.org>; Fri, 18 Sep 2026 10:09:52 +0200
Received: by mail-wm2-f13.google.com with SMTP id
 5b1f17b1804b1-49e7bcb94d3so2928425e9.2
 for <xen-devel@lists.xenproject.org>; Fri, 18 Sep 2026 01:09:52 -0700 (PDT)
Received: from notebook.. ([88.230.43.170]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48720083c19sm2174133f8f.31.2026.09.18.01.09.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Sep 2026 01:09:51 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1789718992; x=1790323792; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ipw7wZeqiwl6i7QK6/km4eSO0T1cabNVYb1txoxoEDs=;
        b=qITzEJ+BvZHRbOIstbE6Ge9x2/6mwmsiUg+D0oZaSv64cqCU26m9vMsnYNT5UBnPd3
         pog8zycgZqKquer1oVxi8ii4NKWYkq6YcJ3yrhriKVIoHLJ3jHiE0zOwaXfWvzwQGyIM
         jsau3qt6C/VR9ZPC30JT67WIHxZnkHNR/rGVXVFypSicnVUX8eUA/sUnS3sO8a+PqOkU
         hvpRn2VJvl3mT5pJrGprvUIdZSAsXHDVDgNcdSFoZmSJ+U4k0lChHp1tqWBu+OoIDhJf
         H9CcfBOgToeytw54nUu7S1AhxPQLGeC1/Mvk+5Tj8PS0FXtL6L2cQxAvhei8PA+Wh/H7
         CpqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789718992; x=1790323792;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ipw7wZeqiwl6i7QK6/km4eSO0T1cabNVYb1txoxoEDs=;
        b=wW80J6miVGxX1zw6L//h8Faor12QIC5GCdEGCgd2G29idnOVUo2h9LMvHUiZwq0+mv
         s1lafsM3cChUy4tMuYIbX/RZEAvxzoSvbtkA1ZVLvPY0teEqtomrh3Ej8EHAIMI6m270
         aD+DkQP1zUUr1V5iMM2dy9fIe/iAzH/gfeek3NLR1NVE6RsyNJGZyDyTSirXb5ANAlPF
         3wH6Szu8P8g91D+ESIsj3S4a4sA1T7e/Cn0wpNO+oJ9P7DyUBrppKKUavmPIE8qqRHtt
         PFSGAdoC6QY3NNA14wLnuZldh8FrZrKHFyoZZGObLQyaqiN3Ary9K4tw0Ki79hmLZ5G+
         o/ag==
X-Gm-Message-State: AFuF++l+0F828qf3jzZ3L26sejmXON2pSw1HbO+MC33WH7SZ8VUh4/Rz
	H+cFGhi8aA8kKL9Ninsos1oHQro54HazNfV5FLp1WuCGKPy4C8S2xMkdv9yg5w==
X-Gm-Gg: AYBFou38lQQHOfK9+zWLOVTvVeCWmiHd9YRia4TqRk79trfyeYgCLNqUM3833t6m21L
	+XVj9j8V2ysibi2WaQtk0LiRpZZxb0Oiv66Owt2LoWbL7h9ia8a201YcM7nkmgBsP4eZb1W+GJ9
	MwGh0tL4qHJmK5z7Q3tbMQNnh3TKJy35gJ7JtqzH2FqW7HgS6j9lmnsWsX+O4NtkY7SbGt11KXr
	PRaMirL1rsedMmX8EYIkDcm0DgZRzxovnwbFIPX1pqz4DBtTF2cmBC5ocFJoJWQkeY7BNgyb3FN
	L15olEy7+uj4WnwH1up+oVVBe4ijQF4ra42gbyVAvISBxGcZujIBC3Cy5Ui/dz6kreqnV5Tm7kM
	UDkm7E15iVleP1UNItchdPex/CkRSz8VVsmI/RPqi8bCUNCPb83p6wPoPAwTEI7jzrNLrlsv+EQ
	ys+9fRvYTuPLOLEiu3q0GyTn/Vi0c2PXREWUbCvh8ayr7xnLE/WI94f5G8HNUXC1+xn57Fu/E=
X-Received: by 2002:a05:600c:4e89:b0:49d:10d6:fd55 with SMTP id 5b1f17b1804b1-49fc5681267mr19222485e9.1.1789718992015;
        Fri, 18 Sep 2026 01:09:52 -0700 (PDT)
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
Subject: [PATCH v2 0/5] xen/sched: rtds: add per-cpupool admission
Date: Fri, 18 Sep 2026 11:09:30 +0300
Message-Id: <20260918080935.35498-1-frn1furkan10@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d25034/1789718992-038D5A5B-17CF10A9/0/0
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
 xen/common/sched/rt.c                | 206 ++++++++++++++++++++++++++-
 xen/include/public/sysctl.h          |   5 +
 12 files changed, 464 insertions(+), 6 deletions(-)

-- 
2.34.1


