Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 972A2606A324
	for <xen-devel@archiver.kernel.org>; Thu, 19 Nov 2026 21:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=xenproject.org header.i=@xenproject.org header.a=rsa-sha256 header.s=20200302mail header.b=KJLxeXmd
Received: from list by lists.xenproject.org with outflank-mailman.1497122.1695468 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xU9i8-000377-3A; Thu, 19 Nov 2026 21:30:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1497122.1695468; Thu, 19 Nov 2026 21:30:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xU9i7-00033f-Fa; Thu, 19 Nov 2026 21:30:27 +0000
Received: by outflank-mailman (input) for mailman id 1497122;
 Thu, 19 Nov 2026 21:30:19 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <gwd@xenproject.org>) id 1xU9hz-0001CV-7M
 for xen-devel@lists.xenproject.org; Thu, 19 Nov 2026 21:30:19 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.98.2)
 (envelope-from <gwd@xenproject.org>) id 1xU9hy-00000006tGv-37yB;
 Thu, 19 Nov 2026 21:30:19 +0000
Received: from [217.155.165.12] (helo=Georges-MacBook-Pro-2.tail87ea19.ts.net)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_CHACHA20_POLY1305_SHA256 (Exim 4.98.2)
 (envelope-from <gwd@xenproject.org>) id 1xU9N1-0000000CVBH-1aGR;
 Thu, 19 Nov 2026 21:08:39 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From;
	bh=UCjDQx67loKQbb+wlH6w8/IgKDJNeVDNbRCBwgxwHW8=; b=KJLxeXmdfb54la4raFcpwfAPjJ
	IAeDDwKzxXrnmQSuoY4t9wkSGlVUMHykM2E+dqv8LrMNpk/yZ/X6ZYcfk9vVlbDN34UiHWzZRUoat
	Xs6D7UuyIQ7NpTwzYppGDWPx6PmOer7NzplzKlsvNf5SVY7poIjjHeZhfglqnhLrR/hc=;
From: George Dunlap <gwd@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v7 50/50] xen/smp: assert that by-pointer callfunc payloads are not on the stack
Date: Thu, 19 Nov 2026 21:07:41 +0000
Message-ID: <20261119-asi-hvm-v7-50-6551b6d5c879@xenproject.org>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261119-asi-hvm-v7-0-6551b6d5c879@xenproject.org>
References: <20261119-asi-hvm-v7-0-6551b6d5c879@xenproject.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-19.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

All in-tree callers of on_selected_cpus() / smp_call_function() /
stop_machine_run() that used to pass a pointer to a stack local have
been converted: rendezvous-style payloads moved to statics, message-
and result-style payloads are passed by value.  Per-CPU stack
mappings, to come as part of Address Space Isolation, give some
contexts page-tables which map only the stack of the CPU they run on;
stack payloads are not reachable from a CPU in such a context, so the
conversion must stay complete.  Enforce the resulting contract with a
debug-build assert: a payload passed by pointer must not point into
the stack the initiator is running on.

The check is deliberately unconditional (not tied to any Address Space
Isolation option): with per-CPU mapped stacks a violating caller
faults on the remote CPU, typically in a path that boot testing never
exercises (MTRR/PSR/cpufreq/MCE inject).  Asserting on every debug
build turns a future reintroduction of the pattern into an immediate,
attributable failure at the call site, regardless of configuration.
For the same uniformity the check applies even to a self-only target
mask (where a stack payload would happen to work): the API contract is
one rule, not a per-mask case analysis.

The helper derives the current stack block from the address of a local
variable, relying on stacks being STACK_SIZE-aligned blocks, as they
are on x86, Arm and PPC, whose get_cpu_info() depends on it.  RISC-V's
vCPU stacks come from vzalloc() and are only page-aligned, but nothing
runs on them yet.  A
payload referencing a different mapping of the same stack pages (such
as a directmap alias) is not caught - inherent to any VA-comparison
scheme; a payload taken from a local variable's address names the
stack being run on, not an alias of it.

Groundwork for per-CPU stack mappings, which take away a CPU's access
to other CPUs' stacks: besides get_cpu_current(), cross-CPU rendezvous
and call-function payloads are what reads another CPU's stack at run
time.

Assisted-by: Claude Code:claude-opus-4-8, Claude Code:claude-opus-5-5
Signed-off-by: George Dunlap <gwd@xenproject.org>
---
Changes in v7:
- New in this version.
---
 xen/common/smp.c          |  6 ++++++
 xen/common/stop_machine.c |  6 ++++++
 xen/include/xen/smp.h     | 16 ++++++++++++++++
 3 files changed, 28 insertions(+)

diff --git a/xen/common/smp.c b/xen/common/smp.c
index eb419a3aeb..ef068c014e 100644
--- a/xen/common/smp.c
+++ b/xen/common/smp.c
@@ -67,6 +67,12 @@ static void _on_selected_cpus(
     ASSERT(cpumask_subset(selected, &cpu_online_map));
     BUG_ON(size > CALLFUNC_DATA_MAX);
     BUG_ON(size && !info);
+    /*
+     * By-pointer payloads must be reachable from the target CPUs, which a
+     * CPU's stack need not be: pass such payloads by value (@size != 0), or
+     * move the datum off the stack.
+     */
+    ASSERT(size || !info || !ptr_on_current_stack(info));
 
     spin_lock(&call_lock);
 
diff --git a/xen/common/stop_machine.c b/xen/common/stop_machine.c
index 398cfd507c..e7cdc4ce5a 100644
--- a/xen/common/stop_machine.c
+++ b/xen/common/stop_machine.c
@@ -81,6 +81,12 @@ int stop_machine_run(int (*fn)(void *data), void *data, unsigned int cpu)
 
     BUG_ON(!local_irq_is_enabled());
     BUG_ON(!is_idle_vcpu(current));
+    /*
+     * @data is dereferenced from other CPUs' stop-machine contexts, so it
+     * must not point into a CPU's stack, which other CPUs need not be able
+     * to reach.
+     */
+    ASSERT(!data || !ptr_on_current_stack(data));
 
     /* cpu_online_map must not change. */
     if ( !get_cpu_maps() )
diff --git a/xen/include/xen/smp.h b/xen/include/xen/smp.h
index 73bf7075d6..4b9afa18d9 100644
--- a/xen/include/xen/smp.h
+++ b/xen/include/xen/smp.h
@@ -126,6 +126,22 @@ static inline void on_each_cpu(
     on_selected_cpus(&cpu_online_map, func, info, wait);
 }
 
+/*
+ * Does @p point into the stack we are currently running on?  Stacks
+ * are STACK_SIZE-aligned blocks (on x86, Arm and PPC; RISC-V's vCPU
+ * stacks, which nothing runs on yet, are only page-aligned), so the
+ * containing block can be derived from any live stack address, such
+ * as that of a local variable.  Note that other mappings of the same
+ * stack (e.g. a directmap alias of the underlying pages) compare as
+ * not-on-stack by design.
+ */
+static inline bool ptr_on_current_stack(const void *p)
+{
+    unsigned long here = (unsigned long)&here;
+
+    return !(((unsigned long)p ^ here) & ~(STACK_SIZE - 1));
+}
+
 /*
  * Call a function on the current CPU
  */
-- 
2.56.0


