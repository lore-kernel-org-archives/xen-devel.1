Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E2E8606A31C
	for <xen-devel@archiver.kernel.org>; Tue, 17 Nov 2026 11:56:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=google header.b=VlVGkrT+
Received: from list by lists.xenproject.org with outflank-mailman.1492244.1692952 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTHnC-0006gr-B4; Tue, 17 Nov 2026 11:56:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1492244.1692952; Tue, 17 Nov 2026 11:56:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTHnC-0006gj-7d; Tue, 17 Nov 2026 11:56:06 +0000
Received: by outflank-mailman (input) for mailman id 1492244;
 Tue, 17 Nov 2026 11:56:05 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper3@citrix.com>) id 1xTHnB-0006gS-3D
 for xen-devel@lists.xenproject.org; Tue, 17 Nov 2026 11:56:05 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xTHnA-001StX-38
 for xen-devel@lists.xenproject.org; Tue, 17 Nov 2026 12:56:04 +0100
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6afc40c5-e002-0a2a0a5209dd-0a2a4505dfcc-40
 for <xen-devel@lists.xenproject.org>; Tue, 17 Nov 2026 12:56:03 +0100
Received: from [209.85.128.46] (helo=mail-wm1-f46.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6afc40d3-4cb1-0a2a45050019-d155802ea506-3
 for <xen-devel@lists.xenproject.org>; Tue, 17 Nov 2026 12:56:03 +0100
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-4a9a8d6cea8so10688245e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 17 Nov 2026 03:56:03 -0800 (PST)
Received: from localhost.localdomain (host-78-146-248-75.as13285.net.
 [78.146.248.75]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4a43d41ec2dsm3659291f8f.14.2026.11.17.03.56.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Nov 2026 03:56:02 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=citrix.com header.i="@citrix.com" header.h="Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1794916563; x=1795521363; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EJb+epoEoGbGncE1Yzh1ZoLShancL25nQQEqdjB6XZA=;
        b=VlVGkrT+Jn1DbDUQSVr7ygZ37/OadzIL1KOQlZXZtqaRVL8RtRLcaBwOLVvnUGQx1d
         BHTp/eVSuSA9t/cMmyKcy6SK2EgNMffeT/VPXSxKrQ4oc1aUCL7nR79gnhNeXg5/Omqj
         IMO67/Wc8aPL9qHUh7Xq+rQvJgpHqdHSJ3KOo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794916563; x=1795521363;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EJb+epoEoGbGncE1Yzh1ZoLShancL25nQQEqdjB6XZA=;
        b=dBU/08+C0F7yDk24cX9kbLy7v3wyjmq76D4Zr5V4bsOdSLlbRkffhHD12WH4Z6vmHk
         L+G+Vn5Uxqqk2IY9uqknYRwDtGogURWEtsSDROxAPNJDgq+NELkQWZyl//hPTKG5vbC9
         L7ffufhAOgTjBpr9S6P5R25xDeQfLNwvjoD1MpBKXycatscJ7Ts/VzpEbY8UfDY+hbMg
         4TQk2kSjjb2F05Av5s3EcsYDegzXcyQchTK8EjB6+AMOhVeI8tBiUrt0Bym9b4kN36Yt
         KnzH3SWnddkwHTNVOfCv8TFVlAUSj919laosleibJ7dp0mJO6BHacE3L7CMWTSREXh/O
         OEzw==
X-Gm-Message-State: APuU4Z9Q4rrR88vSgFz0wyHvZIiDJC3I+ssgNW6Na998jYy44xF9bMsT
	7nWIK6inOGvq5UtEVcRWQyC3x1wgV52ah6WnqpFWAQFc2+UZNbyB2uqzpRLdjXtbjrf0zxuShrF
	ipdcx
X-Gm-Gg: AYBFou1ss3RbHfEIQ318VPu8C0pg0mxYDmgpiLmpzUmJkP+s7M64vley0TxDMMqUX6d
	l2e05VhzzU0pu5Zz3+192ir4IaZxXimOmsvxq+5udoGYTZnyZtLfuKgzXdHk7mzV/+aiY3B3QLb
	NzDdk7RUXW901gzv3zeRs44VuOAVmJzyzs318ERQZX+GLzO0IA3U3882QDok9RRSPIGMsa9Rnem
	pgsFokG1qQJEkMVFFyIwvdYJ7xqZtduZL92PcQ2TQB7NSOPzEOsTaHmwEGqfbql/pud8TETEW87
	gQHgcmYswsZwX+J3HRB9X44fDJNfEFmJkOMuq2RhVChD58D5CrevTfUF1UtzXFB3KalC9C5y3vQ
	hGBblh0gCGvS/TwmrlIueRtjgolqGq/F/z4GVt9lotcENznP51D2VWoJvFgHA4PNy+76tDcoIFi
	wRBtk2kBa+LQ3ZwOHkPqNMYx7Z8LDkWrfVWXOZ8NzXVCrcrFZWyCIewoeSvpKw1UzOtGJ/QzZgq
	9gL66iKIgGllloQ+idFUAtESwD/SLAMvxZ5mGmyCnpgR5MnD3GJCWk6nbYOR9SeyQPbBIdM6sRa
	dtJy3OJMKtWHE0JUurHUBSVTBN3ESVxsA0Qy1Hsplqq56/Ek4a+mKbn6hHVycv067uQGSvGCNtx
	AKX8=
X-Received: by 2002:a05:600c:81c5:b0:4a2:18c4:61a5 with SMTP id 5b1f17b1804b1-4bb7837a43fmr52299905e9.6.1794916562829;
        Tue, 17 Nov 2026 03:56:02 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Teddy Astie <teddy.astie@vates.tech>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Baptiste Le Duc <baptiste.le-duc@vates.tech>
Subject: [PATCH 0/3] xen/treewide: Remove NDEBUG
Date: Tue, 17 Nov 2026 11:55:46 +0000
Message-Id: <20261117115549.3872611-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c201ff/1794916563-F4CA02A1-168B872C/0/0
X-purgate-type: clean
X-purgate-size: 3139
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

We have two ways of spelling debug build in Xen.  Reduce this down to just one
way.

Andrew Cooper (3):
  xen/treewide: Convert all #ifndef NDEBUG to CONFIG_DEBUG
  xen/treewide: Convert all #ifdef NDEBUG to CONFIG_DEBUG
  xen/config: Drop NDEBUG

 xen/arch/arm/gic-vgic.c                |  2 +-
 xen/arch/arm/include/asm/grant_table.h |  2 +-
 xen/arch/arm/irq.c                     |  2 +-
 xen/arch/arm/mmu/domain_page.c         |  2 +-
 xen/arch/arm/mmu/pt.c                  | 10 +++++-----
 xen/arch/arm/traps.c                   |  8 ++++----
 xen/arch/x86/acpi/cpufreq/amd-cppc.c   |  2 +-
 xen/arch/x86/domain_page.c             |  6 +++---
 xen/arch/x86/hvm/emulate.c             |  6 +++---
 xen/arch/x86/hvm/irq.c                 |  2 +-
 xen/arch/x86/hvm/svm/emulate.c         |  4 ++--
 xen/arch/x86/hvm/vmx/intr.c            |  2 +-
 xen/arch/x86/include/asm/asm_defns.h   |  4 ++--
 xen/arch/x86/include/asm/hvm/hvm.h     |  2 +-
 xen/arch/x86/include/asm/hvm/support.h |  2 +-
 xen/arch/x86/include/asm/hypercall.h   |  4 ++--
 xen/arch/x86/include/asm/mem_sharing.h |  2 +-
 xen/arch/x86/include/asm/mm.h          |  2 +-
 xen/arch/x86/include/asm/p2m.h         |  2 +-
 xen/arch/x86/include/asm/page.h        |  3 ++-
 xen/arch/x86/include/asm/setup.h       |  6 +++---
 xen/arch/x86/mm.c                      | 12 ++++++------
 xen/arch/x86/mm/p2m-pod.c              |  2 +-
 xen/arch/x86/mm/shadow/common.c        |  4 ++--
 xen/arch/x86/mm/shadow/hvm.c           |  2 +-
 xen/arch/x86/mm/shadow/multi.c         |  2 +-
 xen/arch/x86/mm/shadow/private.h       |  8 ++++----
 xen/arch/x86/pv/dom0_build.c           |  6 +++---
 xen/arch/x86/pv/emulate.c              |  2 +-
 xen/arch/x86/pv/mm.h                   |  2 +-
 xen/arch/x86/setup.c                   |  2 +-
 xen/arch/x86/traps.c                   |  6 +++---
 xen/arch/x86/x86_64/compat/entry.S     |  2 +-
 xen/arch/x86/x86_64/entry.S            |  2 +-
 xen/arch/x86/x86_emulate/decode.c      |  2 +-
 xen/arch/x86/x86_emulate/private.h     |  4 ++--
 xen/arch/x86/x86_emulate/util-xen.c    |  2 +-
 xen/arch/x86/x86_emulate/x86_emulate.c |  6 +++---
 xen/arch/x86/x86_emulate/x86_emulate.h |  4 ++--
 xen/arch/x86/xstate.c                  |  2 +-
 xen/common/event_channel.c             |  4 ++--
 xen/common/grant_table.c               |  8 ++++----
 xen/common/multicall.c                 |  2 +-
 xen/common/page_alloc.c                |  4 ++--
 xen/common/preempt.c                   |  2 +-
 xen/drivers/char/console.c             | 12 ++++++------
 xen/include/xen/bug.h                  |  2 +-
 xen/include/xen/config.h               |  4 ----
 xen/include/xen/lib.h                  | 18 +++++++++---------
 xen/include/xen/pci.h                  |  2 +-
 xen/include/xen/preempt.h              |  2 +-
 xen/include/xen/rwlock.h               |  4 ++--
 xen/include/xen/sched.h                |  2 +-
 xen/include/xen/typesafe.h             |  2 +-
 54 files changed, 106 insertions(+), 109 deletions(-)


base-commit: aa6070d2c840301bceae28763d20a32c48f0d3e4
-- 
2.39.5


