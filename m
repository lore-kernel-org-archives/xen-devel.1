Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DCD0CCF2DE
	for <xen-devel@archiver.kernel.org>; Mon, 19 Oct 2026 13:11:30 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1454330.1667876 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xIn8p-000722-TG; Mon, 19 Oct 2026 13:11:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1454330.1667876; Mon, 19 Oct 2026 13:11:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xIn8p-00071v-PT; Mon, 19 Oct 2026 13:11:03 +0000
Received: by outflank-mailman (input) for mailman id 1454330;
 Mon, 19 Oct 2026 13:11:02 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <frederic@kernel.org>) id 1xIn8o-00071m-Kc
 for xen-devel@lists.xenproject.org; Mon, 19 Oct 2026 13:11:02 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xIn8n-001ZwX-IQ
 for xen-devel@lists.xenproject.org; Mon, 19 Oct 2026 15:11:01 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <frederic@kernel.org>)
 id 6ad616d7-e002-0a2a0a5209dd-0a2a4501d4d0-36
 for <xen-devel@lists.xenproject.org>; Mon, 19 Oct 2026 15:11:01 +0200
Received: from [172.105.4.254] (helo=tor.source.kernel.org)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <frederic@kernel.org>)
 id 6ad616e4-5984-0a2a45010019-ac6904fe95aa-3
 for <xen-devel@lists.xenproject.org>; Mon, 19 Oct 2026 15:11:01 +0200
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 924046020A;
 Mon, 19 Oct 2026 13:10:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E045C1F000C7;
 Mon, 19 Oct 2026 13:10:56 +0000 (UTC)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=k20260515 header.d=kernel.org header.i="@kernel.org" header.h="From:To:Cc:Subject:Date:In-Reply-To:References"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792415459;
	bh=sQ4wV/CtE843TsaJyn8NdxjU1otXO+lUSiOR4zR4+6M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=UYYhVV8DRwSugxc4w9TTb0o/rWDNMV80kuTV12atH3lBKClROKPctzL7bZd9hdFgv
	 PfWhK+tqVWRVA7qQkMj7dT0dnWY0hXHvfIgvLn8S4zOeBl+0okkfv7UJGsT9ZK+x6J
	 U3DvNv+Ss6hZiw4sprDxO9KEs6F6axzzZ84A2hpzBy9wwYEzr/G1ANlH5AHofU6Tiz
	 Uy5kF15EDPm7FE+G0xVDrufXD7ZER+IyTbn1RCyhJvJHjP5VxCxTbulIjhEpKg1U1Q
	 KtgogEtCjb3O4RgR5JeRmDA4jgOCJgFdhH96o7W3KYEtrATjxWWPIzXGacLidHxxvZ
	 5imvBcCnwnNnQ==
From: Frederic Weisbecker <frederic@kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Frederic Weisbecker <frederic@kernel.org>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Phil Auld <pauld@redhat.com>,
	Russell King <linux@armlinux.org.uk>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Waiman Long <longman@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	xen-devel@lists.xenproject.org
Subject: [RFC PATCH 41/49] ARM: xen: Move CPUHP_AP_ARM_XEN_STARTING post stop_machine()
Date: Mon, 19 Oct 2026 15:08:48 +0200
Message-ID: <20261019130856.49711-42-frederic@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261019130856.49711-1-frederic@kernel.org>
References: <20261019130856.49711-1-frederic@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d62444/1792415461-C5146757-C2393D0D/0/0
X-purgate-type: clean
X-purgate-size: 1718

Between CPUHP_TEARDOWN_CPU and CPUHP_AP_OFFLINE, stop_machine executes
all the teardown callbacks while stopping all CPUs in the system. This
doesn't mix-up well with running RT or isolated tasks.

In order to transition smoothly from global stop_machine to finer
grained synchronization between teardown callbacks and the other CPUs,
a new stop machine post function has been introduced to be executed
after the main one with IRQs still disabled while other CPUs can exit
stop_machine().

The teardown callback here simply performs IRQ disablement, which can
run concurrently with other CPUs.

Move it to post stop_machine() accordingly.

Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
---
 kernel/cpu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/cpu.c b/kernel/cpu.c
index bc06cb1f0282..8509c6377a61 100644
--- a/kernel/cpu.c
+++ b/kernel/cpu.c
@@ -1275,7 +1275,7 @@ void clear_tasks_mm_cpumask(int cpu)
 static int take_cpu_down(void *_param)
 {
 	struct cpuhp_cpu_state *st = this_cpu_ptr(&cpuhp_state);
-	enum cpuhp_state target = max((int)st->target, CPUHP_AP_DUMMY_TIMER_STARTING);
+	enum cpuhp_state target = max((int)st->target, CPUHP_AP_ARM_XEN_STARTING);
 	int err, cpu = smp_processor_id();
 
 	/* Ensure this CPU doesn't handle any more interrupts. */
@@ -1303,7 +1303,7 @@ static int take_cpu_down_post(void *_param)
 	enum cpuhp_state target = max((int)st->target, CPUHP_AP_OFFLINE);
 	int cpu = smp_processor_id();
 
-	WARN_ON(st->state != CPUHP_AP_DUMMY_TIMER_STARTING);
+	WARN_ON(st->state != CPUHP_AP_ARM_XEN_STARTING);
 	/*
 	 * Invoke the former CPU_DYING callbacks. DYING must not fail!
 	 */
-- 
2.53.0


