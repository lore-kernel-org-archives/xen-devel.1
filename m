Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BB59C55162
	for <xen-devel@archiver.kernel.org>; Mon,  3 Aug 2026 05:07:34 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1381100.1624655 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wqktK-0002Jr-Ue; Mon, 03 Aug 2026 05:07:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1381100.1624655; Mon, 03 Aug 2026 05:07:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wqktK-0002Jk-RP; Mon, 03 Aug 2026 05:07:10 +0000
Received: by outflank-mailman (input) for mailman id 1381100;
 Mon, 03 Aug 2026 05:07:09 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <frn1furkan10@gmail.com>) id 1wqktJ-0002Je-0J
 for xen-devel@lists.xenproject.org; Mon, 03 Aug 2026 05:07:09 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wqktI-006W4Q-9B
 for xen-devel@lists.xenproject.org; Mon, 03 Aug 2026 07:07:08 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <frn1furkan10@gmail.com>)
 id 6a7021f1-2eae-0a2a0a5409dd-0a2a450aec7a-16
 for <xen-devel@lists.xenproject.org>; Mon, 03 Aug 2026 07:07:08 +0200
Received: from [209.85.128.52] (helo=mail-wm1-f52.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <frn1furkan10@gmail.com>)
 id 6a7021f7-f2d2-0a2a450a0019-d1558034a963-3
 for <xen-devel@lists.xenproject.org>; Mon, 03 Aug 2026 07:07:03 +0200
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-4954a9e8490so12548335e9.1
 for <xen-devel@lists.xenproject.org>; Sun, 02 Aug 2026 22:07:03 -0700 (PDT)
Received: from notebook.. ([78.173.117.153]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49807b917efsm310345185e9.11.2026.08.02.22.06.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Aug 2026 22:07:02 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1785733623; x=1786338423; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=s6Me0Ii/wXFwxSrXThVMvIBe3ZtEiu+nF8ISBnVnumA=;
        b=TvvRn6N8Uu/7wT3XircOrT7N5ZR/TOSYrtP4rmx0A6Dh3t3WDZsna9qkRSD3yh/Pll
         ySrCaSjpvOryge5UBNmTF2bqQ722VduUeh+K0fJ5G18/yJMsK3q/ANW2MfagOWQAQqM7
         e6q6nJCoh7BxLlV/+4DXm8aziTg3hLOsmcV2crz5AgJFGNHEha4OB/xYOFR8B3lAYQbz
         4DkMtOT4OGXMo8+TZybU9Hwqq/iVkPIGW2KRGneaL1O2cMTmKoifX8tQZocp0IiB92O0
         QZD/JbwISVJ11HqMPo1zOxXW+3+Fm5SDanQPvoTMkpXNa9p2ZchiGU5bmjZQyojVREQG
         vHfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785733623; x=1786338423;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s6Me0Ii/wXFwxSrXThVMvIBe3ZtEiu+nF8ISBnVnumA=;
        b=FJsLRt0JWpcdGoluDVGZ+t8koiXVjZ1JdyFX0IZsvlgPwU82YHG6XtdXft0+nr/TsK
         wJCmNWbzPrhU/nkHOOlW2C/HabZo9oj4P4DFD/ESnRlDhJkT0UX6qXrbm5DIOTIvsgGu
         umxKKoOnJVXN/WSRokqNHGFKCrpfMRXJgF2dvMOib+fbY1hJwjM6ESncEUZ20kYgEt66
         iSRFZE5/XcL8LApw8tf5eqVLupEFYWVHuMIM7tTcCo193LI4hgSc+DrAln0WbRhXoOSS
         3H4X4k02G3Mp3+SLeN2/nu+XlJSLCm2YZaJfZSuZCQbTOsJzIQhZst3N0V5aIedqUAk7
         hvtA==
X-Gm-Message-State: AOJu0YyKK236k3ImJEdOyfvnL4GTtFQrRZLCpcfSt3QWU0dCpHim3xSS
	No90cRgmzc90/ERYJfdCDvOi1a/Za5v0GyTcCmhT7QhSn19G7qcNfJ/Q09eM0eDa
X-Gm-Gg: AR+sD13gATuO4maEAT1wp5B/smYPG4qx5LzQLhVR1y+oXpYrCNn8mgGiVmZubfvnkQS
	XRKoRGBIsXg7/6hyFEdLt6npa+I0peNKbHg72wk/JS+dxQgUlfvtVpby8lZy70tKVpD5gZxwxy6
	Ew8AGtFxKskJkBM05KnEJ5BMl4QNOGzePaNgAT6px9DiYsjrSrIFovftT2qIqh3qO32zG3Z5Z1p
	sO2zqUvtdrK5bYAPzt4EYZMsk8MdoI//Acociv67C1DfqTXQhBjP37vhOjkzq0vKKxWWjZ+jhAh
	T4Ap4vs1lTPDBl/ot0ch4kyaw2ITXCFRx8Y/fvf4CmwqcQzanGFVrsvIZd3A6U7YDVd/bol2fK9
	l3syFpkvxHb94XWPEeq9147g/TDlZo00Elzh75D/GrjeNpZxtGrH8yEzQMYV2kUJcHP+bfY4jkA
	O5ZUIrsZOOAGSdE0ry+SMuCoAyuFNd3V1foM2hBWuJKgvmj1eGoC8ROjvwBVcZo8I/vsaJ0Wv1k
	w==
X-Received: by 2002:a05:600c:a42:b0:495:69eb:27d3 with SMTP id 5b1f17b1804b1-4980eba0a6fmr164772565e9.8.1785733623067;
        Sun, 02 Aug 2026 22:07:03 -0700 (PDT)
From: Furkan Caliskan <frn1furkan10@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com,
	jbeulich@suse.com,
	jgross@suse.com,
	gwd@xenproject.org,
	dfaggioli@suse.com,
	stewart.hildebrand@amd.com,
	nathan.studer@dornerworks.com,
	roger@xenproject.org,
	anthony.perard@vates.tech,
	julien@xen.org,
	sstabellini@kernel.org,
	michal.orzel@amd.com,
	bertrand.marquis@arm.com,
	Volodymyr_Babchuk@epam.com,
	teddy.astie@vates.tech,
	tpearson@raptorengineering.com,
	alistair.francis@wdc.com,
	connojdavis@gmail.com,
	oleksii.kurochko@gmail.com,
	Furkan Caliskan <frn1furkan10@gmail.com>
Subject: [PATCH 0/7] xen/sched: split scheduler vtable from scheduler 
Date: Mon,  3 Aug 2026 08:06:07 +0300
Message-Id: <20260803050614.5222-1-frn1furkan10@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-4011c0/1785733623-591C5CFC-7CDF42AE/0/0
X-purgate-type: clean
X-purgate-size: 3004

Each struct scheduler currently doubles as both a scheduler 
backend's static vtable (name, opt_name, sched_id and every 
function pointer) and the per-cpupool runtime object that 
scheduler_alloc() allocates. Because these are the same type, 
scheduler_alloc() memcpy()s the entire vtable into a fresh heap 
allocation for every cpupool it creates. With N cpupools running 
the same scheduler, this duplicates N copies of identical function 
pointers and identifying fields that never differ between 
instances - the only fields that are genuinely per-cpupool are 
sched_data and cpupool.

This series splits the vtable out into its own type, struct 
sched_ops, so it can be shared by every cpupool using a given 
scheduler instead of copied per cpupool. struct scheduler is left 
holding only what is actually per-instance: a pointer to the 
shared sched_ops, plus sched_data and cpupool.

The series is structured as introduce/migrate/remove, so that 
every commit builds and boots on its own:

  - The first patch adds struct sched_ops, REGISTER_SCHED_OPS(), 
    and a sched_ops_array[] alongside the existing schedulers[], 
    extending every lookup path (scheduler_alloc(), 
    sched_get_by_name(), scheduler_init()) to search both arrays. 
    This is purely additive - no scheduler uses it yet. 

  - The next five patches each migrate one scheduler backend 
    (credit, credit2, rtds, arinc653, null) from struct scheduler 
    to struct sched_ops. Each is small, mechanical, and 
    independently bisectable, with no behavioral difference, since 
    scheduler_alloc() builds an identical runtime struct scheduler 
    regardless of which array a match is found in. 

  - The final patch removes the old schedulers[] and 
    REGISTER_SCHEDULER() path now that nothing uses it, shrinks 
    struct scheduler down to { ops, sched_data, cpupool }, and 
    updates every accessor in private.h accordingly.

Furkan Caliskan (7):
  xen/sched: introduce struct sched_ops as a shared scheduler vtable
  xen/sched: credit: migrate to new sched_ops
  xen/sched: credit2: migrate to new sched_ops
  xen/sched: rtds: migrate to new sched_ops
  xen/sched: arinc653: migrate to new sched_ops
  xen/sched: null: migrate to new sched_ops
  xen/sched: remove old scheduler registration, shrink struct scheduler

 xen/arch/arm/xen.lds.S      |   2 +-
 xen/arch/ppc/xen.lds.S      |   2 +-
 xen/arch/riscv/xen.lds.S    |   2 +-
 xen/arch/x86/xen.lds.S      |   2 +-
 xen/common/sched/arinc653.c |  11 +---
 xen/common/sched/core.c     |  80 ++++++++++++++++-------------
 xen/common/sched/cpupool.c  |   6 +--
 xen/common/sched/credit.c   |   5 +-
 xen/common/sched/credit2.c  |   5 +-
 xen/common/sched/null.c     |   5 +-
 xen/common/sched/private.h  | 100 +++++++++++++++++++-----------------
 xen/common/sched/rt.c       |   5 +-
 xen/include/xen/xen.lds.h   |   8 +--
 13 files changed, 116 insertions(+), 117 deletions(-)

-- 
2.34.1


