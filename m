Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65D89606A33F
	for <xen-devel@archiver.kernel.org>; Thu, 19 Nov 2026 21:30:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=xenproject.org header.i=@xenproject.org header.a=rsa-sha256 header.s=20200302mail header.b=S4up3/DH
Received: from list by lists.xenproject.org with outflank-mailman.1497126.1695515 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xU9iH-0004eW-1F; Thu, 19 Nov 2026 21:30:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1497126.1695515; Thu, 19 Nov 2026 21:30:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xU9iF-0004YI-C5; Thu, 19 Nov 2026 21:30:35 +0000
Received: by outflank-mailman (input) for mailman id 1497126;
 Thu, 19 Nov 2026 21:30:19 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <gwd@xenproject.org>) id 1xU9hz-0001D8-F6
 for xen-devel@lists.xenproject.org; Thu, 19 Nov 2026 21:30:19 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.98.2)
 (envelope-from <gwd@xenproject.org>) id 1xU9hy-00000006tHR-3jIy;
 Thu, 19 Nov 2026 21:30:19 +0000
Received: from [217.155.165.12] (helo=Georges-MacBook-Pro-2.tail87ea19.ts.net)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_CHACHA20_POLY1305_SHA256 (Exim 4.98.2)
 (envelope-from <gwd@xenproject.org>) id 1xU9Mx-0000000CVBH-1fqM;
 Thu, 19 Nov 2026 21:08:35 +0000
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
	bh=sTjqPTsK2pi81b/09BzAb/eLP8sEK4iy5zRkCRfHDW0=; b=S4up3/DHzCHOKIGFdVJG22hkro
	tmfg2V1atfdWR1N8wLqNJJoXuYmizxcRET+UIJRqNitqomHdRk9s0DS+UeRrBdRAQ6FNMRDj/bZfV
	Eura4W4LRw70HVNoxwVt+FikfwA3RYIBtiAf1sLpvUv86YeHwwErXyEBmPlpBXeyntPQ=;
From: George Dunlap <gwd@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: [PATCH v7 46/50] x86/cpufreq: move the CPU mask out of struct drv_cmd
Date: Thu, 19 Nov 2026 21:07:37 +0000
Message-ID: <20261119-asi-hvm-v7-46-6551b6d5c879@xenproject.org>
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

drv_read() and drv_write() take a struct drv_cmd, whose mask field
says which CPUs to run the access on.  Only the initiator uses the
mask, to route the call: do_drv_read() and do_drv_write(), which run
on the target CPUs, never read it.  It may point at the initiator's
stack (acpi_cpufreq_target()'s online_policy_cpus).

Drop the field and pass the mask to drv_read() and drv_write() as a
parameter, so that the structure handed to the target CPUs holds only
what they use.

No functional change.

Groundwork for per-CPU stack mappings, to come as part of Address
Space Isolation, which take away a CPU's access to other CPUs' stacks:
a subsequent change passes the structure to the target CPUs by value,
and a copy must carry no stack address.

Assisted-by: Claude Code:claude-opus-4-8, Claude Code:claude-opus-5-5
Signed-off-by: George Dunlap <gwd@xenproject.org>
---
Changes in v7:
- New in this version.
---
 xen/arch/x86/acpi/cpufreq/acpi.c | 28 +++++++++++++---------------
 1 file changed, 13 insertions(+), 15 deletions(-)

diff --git a/xen/arch/x86/acpi/cpufreq/acpi.c b/xen/arch/x86/acpi/cpufreq/acpi.c
index de67f1aee2..7f843bab60 100644
--- a/xen/arch/x86/acpi/cpufreq/acpi.c
+++ b/xen/arch/x86/acpi/cpufreq/acpi.c
@@ -90,7 +90,6 @@ typedef union {
 
 struct drv_cmd {
     unsigned int type;
-    const cpumask_t *mask;
     drv_addr_union addr;
     u32 val;
 };
@@ -137,25 +136,25 @@ static void cf_check do_drv_write(void *drvcmd)
     }
 }
 
-static void drv_read(struct drv_cmd *cmd)
+static void drv_read(const cpumask_t *mask, struct drv_cmd *cmd)
 {
     cmd->val = 0;
 
-    ASSERT(cpumask_weight(cmd->mask) == 1);
+    ASSERT(cpumask_weight(mask) == 1);
 
     /* to reduce IPI for the sake of performance */
-    if (likely(cpumask_test_cpu(smp_processor_id(), cmd->mask)))
+    if (likely(cpumask_test_cpu(smp_processor_id(), mask)))
         do_drv_read((void *)cmd);
     else
-        on_selected_cpus(cmd->mask, do_drv_read, cmd, 1);
+        on_selected_cpus(mask, do_drv_read, cmd, 1);
 }
 
-static void drv_write(struct drv_cmd *cmd)
+static void drv_write(const cpumask_t *mask, struct drv_cmd *cmd)
 {
-    if (cpumask_equal(cmd->mask, cpumask_of(smp_processor_id())))
+    if (cpumask_equal(mask, cpumask_of(smp_processor_id())))
         do_drv_write((void *)cmd);
     else
-        on_selected_cpus(cmd->mask, do_drv_write, cmd, 1);
+        on_selected_cpus(mask, do_drv_write, cmd, 1);
 }
 
 static u32 get_cur_val(const cpumask_t *mask)
@@ -193,9 +192,7 @@ static u32 get_cur_val(const cpumask_t *mask)
         return 0;
     }
 
-    cmd.mask = cpumask_of(cpu);
-
-    drv_read(&cmd);
+    drv_read(cpumask_of(cpu), &cmd);
     return cmd.val;
 }
 
@@ -256,6 +253,7 @@ static int cf_check acpi_cpufreq_target(
     struct processor_performance *perf;
     struct cpufreq_freqs freqs;
     cpumask_t online_policy_cpus;
+    const cpumask_t *mask;
     struct drv_cmd cmd;
     unsigned int next_state = 0; /* Index into freq_table */
     unsigned int next_perf_state = 0; /* Index into perf table */
@@ -304,16 +302,16 @@ static int cf_check acpi_cpufreq_target(
     }
 
     if (policy->shared_type != CPUFREQ_SHARED_TYPE_ANY)
-        cmd.mask = &online_policy_cpus;
+        mask = &online_policy_cpus;
     else
-        cmd.mask = cpumask_of(policy->cpu);
+        mask = cpumask_of(policy->cpu);
 
     freqs.old = perf->states[perf->state].core_frequency * 1000;
     freqs.new = data->freq_table[next_state].frequency;
 
-    drv_write(&cmd);
+    drv_write(mask, &cmd);
 
-    if (acpi_pstate_strict && !check_freqs(cmd.mask, freqs.new, data)) {
+    if (acpi_pstate_strict && !check_freqs(mask, freqs.new, data)) {
         printk(KERN_WARNING "Fail transfer to new freq %d\n", freqs.new);
         return -EAGAIN;
     }
-- 
2.56.0


