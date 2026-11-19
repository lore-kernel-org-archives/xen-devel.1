Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EBB5606A325
	for <xen-devel@archiver.kernel.org>; Thu, 19 Nov 2026 21:31:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=xenproject.org header.i=@xenproject.org header.a=rsa-sha256 header.s=20200302mail header.b=f45usI23
Received: from list by lists.xenproject.org with outflank-mailman.1497148.1695710 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xU9j3-0006UI-Oa; Thu, 19 Nov 2026 21:31:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1497148.1695710; Thu, 19 Nov 2026 21:31:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xU9j2-0006NN-Er; Thu, 19 Nov 2026 21:31:24 +0000
Received: by outflank-mailman (input) for mailman id 1497148;
 Thu, 19 Nov 2026 21:30:20 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <gwd@xenproject.org>) id 1xU9i0-0001F5-9z
 for xen-devel@lists.xenproject.org; Thu, 19 Nov 2026 21:30:20 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.98.2)
 (envelope-from <gwd@xenproject.org>) id 1xU9hz-00000006tKy-3eKd;
 Thu, 19 Nov 2026 21:30:20 +0000
Received: from [217.155.165.12] (helo=Georges-MacBook-Pro-2.tail87ea19.ts.net)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_CHACHA20_POLY1305_SHA256 (Exim 4.98.2)
 (envelope-from <gwd@xenproject.org>) id 1xU9My-0000000CVBH-1JqW;
 Thu, 19 Nov 2026 21:08:36 +0000
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
	bh=UiGsh13eTDf46yW7Z6NV5/v75M5dRGpgpJvWXGlTvhQ=; b=f45usI235udj1YiYdPMynlhUXq
	58dDrrMMnRF9ZiFhuph2oeVWIoqij6F8aI/Emn1tjVODAEmANJ5qypfQCcZOB2N2VMpr7BTcqtqOL
	GI0Hnz9hI1/12pV/czb0ZEP9uBgwijgaxZEElde6zpFmsv6KpbUHmKZbTIm10ufvQpIA=;
From: George Dunlap <gwd@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: [PATCH v7 47/50] x86/acpi: pass stack-allocated callfunc payloads by value
Date: Thu, 19 Nov 2026 21:07:38 +0000
Message-ID: <20261119-asi-hvm-v7-47-6551b6d5c879@xenproject.org>
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

Per-CPU stack mappings, to come as part of Address Space Isolation,
give some contexts page-tables which map only the stack of the CPU
they run on.  A CPU in such a context cannot reach another CPU's
stack, so pointers into a caller's stack cannot be dereferenced by
call-function callees.

Several ACPI/cpufreq paths hand another CPU a pointer to a local
variable via on_selected_cpus(), for the callee to read and (in most
cases) write results back through:

 * drv_read()/drv_write(): struct drv_cmd on the caller's stack; the
   callee reads it and do_drv_read() writes cmd->val back.
 * get_measured_perf(): struct perf_pair, filled by
   read_measured_perf_ctrs() on the target CPU.
 * powernow transition_pstate(): the next P-state number.
 * powernow get_cpu_data(): struct amd_cpu_data; max_hw_pstate comes
   back, info->perf points at the (heap) processor_pminfo.
 * get_hw_residencies(): struct hw_residencies, filled by the callee.
 * arch_acpi_set_pdc_bits(): the MWAIT CPUID ecx value.

Switch these calls to pass the payload by value.  Where the callee
writes results back (do_drv_read(), read_measured_perf_ctrs(),
get_cpu_data(), do_get_hw_residencies(), get_mwait_ecx()), use
on_selected_cpus_obj_inout(), which copies them back on return; where
it only reads (do_drv_write(), transition_pstate()), use
on_selected_cpus_obj().  All the calls are synchronous (@wait == 1),
so behaviour is unchanged.  amd_cpu_data's interior pointer (perf)
references heap data, which remains globally reachable.  drv_cmd
carries no stack address: its mask, which could point at the
initiator's stack, is a parameter of drv_read() and drv_write().

No functional change.

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
 xen/arch/x86/acpi/cpu_idle.c         | 3 ++-
 xen/arch/x86/acpi/cpufreq/acpi.c     | 4 ++--
 xen/arch/x86/acpi/cpufreq/cpufreq.c  | 4 ++--
 xen/arch/x86/acpi/cpufreq/powernow.c | 6 +++---
 xen/arch/x86/acpi/lib.c              | 3 ++-
 5 files changed, 11 insertions(+), 9 deletions(-)

diff --git a/xen/arch/x86/acpi/cpu_idle.c b/xen/arch/x86/acpi/cpu_idle.c
index 874346199e..53b7e79ed7 100644
--- a/xen/arch/x86/acpi/cpu_idle.c
+++ b/xen/arch/x86/acpi/cpu_idle.c
@@ -298,7 +298,8 @@ static void get_hw_residencies(uint32_t cpu, struct hw_residencies *hw_res)
     if ( smp_processor_id() == cpu )
         do_get_hw_residencies(hw_res);
     else
-        on_selected_cpus(cpumask_of(cpu), do_get_hw_residencies, hw_res, 1);
+        on_selected_cpus_obj_inout(cpumask_of(cpu), do_get_hw_residencies,
+                                   hw_res);
 }
 
 static void print_hw_residencies(uint32_t cpu)
diff --git a/xen/arch/x86/acpi/cpufreq/acpi.c b/xen/arch/x86/acpi/cpufreq/acpi.c
index 7f843bab60..b16058201f 100644
--- a/xen/arch/x86/acpi/cpufreq/acpi.c
+++ b/xen/arch/x86/acpi/cpufreq/acpi.c
@@ -146,7 +146,7 @@ static void drv_read(const cpumask_t *mask, struct drv_cmd *cmd)
     if (likely(cpumask_test_cpu(smp_processor_id(), mask)))
         do_drv_read((void *)cmd);
     else
-        on_selected_cpus(mask, do_drv_read, cmd, 1);
+        on_selected_cpus_obj_inout(mask, do_drv_read, cmd);
 }
 
 static void drv_write(const cpumask_t *mask, struct drv_cmd *cmd)
@@ -154,7 +154,7 @@ static void drv_write(const cpumask_t *mask, struct drv_cmd *cmd)
     if (cpumask_equal(mask, cpumask_of(smp_processor_id())))
         do_drv_write((void *)cmd);
     else
-        on_selected_cpus(mask, do_drv_write, cmd, 1);
+        on_selected_cpus_obj(mask, do_drv_write, cmd, 1);
 }
 
 static u32 get_cur_val(const cpumask_t *mask)
diff --git a/xen/arch/x86/acpi/cpufreq/cpufreq.c b/xen/arch/x86/acpi/cpufreq/cpufreq.c
index 9ef62b3538..683139731f 100644
--- a/xen/arch/x86/acpi/cpufreq/cpufreq.c
+++ b/xen/arch/x86/acpi/cpufreq/cpufreq.c
@@ -100,8 +100,8 @@ unsigned int get_measured_perf(unsigned int cpu, unsigned int flag)
     if (cpu == smp_processor_id()) {
         read_measured_perf_ctrs((void *)&readin);
     } else {
-        on_selected_cpus(cpumask_of(cpu), read_measured_perf_ctrs,
-                        &readin, 1);
+        on_selected_cpus_obj_inout(cpumask_of(cpu), read_measured_perf_ctrs,
+                                   &readin);
     }
 
     cur.aperf.whole = readin.aperf.whole - saved->aperf.whole;
diff --git a/xen/arch/x86/acpi/cpufreq/powernow.c b/xen/arch/x86/acpi/cpufreq/powernow.c
index 55166eac72..4ab3d916ca 100644
--- a/xen/arch/x86/acpi/cpufreq/powernow.c
+++ b/xen/arch/x86/acpi/cpufreq/powernow.c
@@ -121,8 +121,8 @@ static int cf_check powernow_cpufreq_target(
 
         if (policy->shared_type == CPUFREQ_SHARED_TYPE_ALL ||
             unlikely(policy->cpu != smp_processor_id()))
-            on_selected_cpus(&online_policy_cpus, transition_pstate,
-                             &next_perf_state, 1);
+            on_selected_cpus_obj(&online_policy_cpus, transition_pstate,
+                                 &next_perf_state, 1);
         else
             transition_pstate(&next_perf_state);
 
@@ -252,7 +252,7 @@ static int cf_check powernow_cpufreq_cpu_init(struct cpufreq_policy *policy)
 
     policy->governor = cpufreq_opt_governor ? : CPUFREQ_DEFAULT_GOVERNOR;
 
-    on_selected_cpus(cpumask_of(cpu), get_cpu_data, &info, 1);
+    on_selected_cpus_obj_inout(cpumask_of(cpu), get_cpu_data, &info);
 
     /* table init */
     for (i = 0; i < perf->state_count && i <= info.max_hw_pstate; i++) {
diff --git a/xen/arch/x86/acpi/lib.c b/xen/arch/x86/acpi/lib.c
index 51cb082ca0..02061cdd30 100644
--- a/xen/arch/x86/acpi/lib.c
+++ b/xen/arch/x86/acpi/lib.c
@@ -137,7 +137,8 @@ int arch_acpi_set_pdc_bits(u32 acpi_id, u32 *pdc, u32 mask)
 	else if (c == &boot_cpu_data || cpu == smp_processor_id())
 		ecx = cpuid_ecx(CPUID_MWAIT_LEAF);
 	else
-		on_selected_cpus(cpumask_of(cpu), get_mwait_ecx, &ecx, 1);
+		on_selected_cpus_obj_inout(cpumask_of(cpu), get_mwait_ecx,
+					   &ecx);
 	if (!(ecx & CPUID5_ECX_EXTENSIONS_SUPPORTED) ||
 	    !(ecx & CPUID5_ECX_INTERRUPT_BREAK))
 		pdc[2] &= ~(ACPI_PDC_C_C1_FFH | ACPI_PDC_C_C2C3_FFH);
-- 
2.56.0


