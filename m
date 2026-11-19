Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F24E606A324
	for <xen-devel@archiver.kernel.org>; Thu, 19 Nov 2026 21:30:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=xenproject.org header.i=@xenproject.org header.a=rsa-sha256 header.s=20200302mail header.b=Lq+u7PCx
Received: from list by lists.xenproject.org with outflank-mailman.1497112.1695399 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xU9i1-0001RE-IF; Thu, 19 Nov 2026 21:30:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1497112.1695399; Thu, 19 Nov 2026 21:30:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xU9i1-0001Pw-BZ; Thu, 19 Nov 2026 21:30:21 +0000
Received: by outflank-mailman (input) for mailman id 1497112;
 Thu, 19 Nov 2026 21:30:19 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <gwd@xenproject.org>) id 1xU9hy-0001Bg-UN
 for xen-devel@lists.xenproject.org; Thu, 19 Nov 2026 21:30:18 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.98.2)
 (envelope-from <gwd@xenproject.org>) id 1xU9hy-00000006tG5-1AX2;
 Thu, 19 Nov 2026 21:30:18 +0000
Received: from [217.155.165.12] (helo=Georges-MacBook-Pro-2.tail87ea19.ts.net)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_CHACHA20_POLY1305_SHA256 (Exim 4.98.2)
 (envelope-from <gwd@xenproject.org>) id 1xU9N0-0000000CVBH-0bLJ;
 Thu, 19 Nov 2026 21:08:38 +0000
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
	bh=sU58dz1V0l9Snp12bw91EngqfwnAifwGZQVIV9FmOTs=; b=Lq+u7PCxy9AD2pkPhG7Yu04K8L
	opbMVcFBd8qyN8uQ/q4PkbuYc/dg5rbnfOQHJ79U03w856ldCQ4fATdhAcxU1aTLb5lz5a3qJuVZV
	xcuVagheeYtZk/A7wh5YlgCJM9lgLbV7AXyfnge1Fd7y2tDI7i8/7nc/W6WvxOGrxR9g=;
From: George Dunlap <gwd@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: [PATCH v7 49/50] x86: pass remaining stack-allocated callfunc payloads by value
Date: Thu, 19 Nov 2026 21:07:40 +0000
Message-ID: <20261119-asi-hvm-v7-49-6551b6d5c879@xenproject.org>
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

Convert the remaining call sites that point another CPU at a local
variable via on_selected_cpus(), with on_selected_cpus_obj_inout()
where the callee writes results back (resource_access(),
l3_cache_get()) and on_selected_cpus_obj() where it only reads
(do_write_psr_msrs(), __machine_restart()):

 * XENPF_resource_op: struct resource_access on the do_platform_op()
   stack; the callee writes ra.nr_done back, and ra.entries points at
   a (heap) array the callee also writes - both keep working, the
   former via the copy-back, the latter because the array stays
   globally reachable.
 * psr do_write_psr_msrs(): struct cos_write_info, which the callee
   only reads; the embedded val pointer references a heap array.
 * machine_restart(): the hop to the boot CPU passes delay_millisecs
   with @wait == 0 and then halts this CPU forever.  This is the one
   asynchronous case: the halted caller's frame stays alive for the
   callee (correct today), but with per-CPU mapped stacks it would no
   longer be reachable.  Passing by value removes the cross-CPU
   reference altogether.
 * XEN_SYSCTL_psr_cmt_op: struct l3_cache_info, filled by the callee.

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
 xen/arch/x86/platform_hypercall.c | 2 +-
 xen/arch/x86/psr.c                | 2 +-
 xen/arch/x86/shutdown.c           | 4 ++--
 xen/arch/x86/sysctl.c             | 3 ++-
 4 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/xen/arch/x86/platform_hypercall.c b/xen/arch/x86/platform_hypercall.c
index 0f3c791fc2..5516a232e4 100644
--- a/xen/arch/x86/platform_hypercall.c
+++ b/xen/arch/x86/platform_hypercall.c
@@ -876,7 +876,7 @@ ret_t do_platform_op(
         if ( cpu == smp_processor_id() )
             resource_access(&ra);
         else
-            on_selected_cpus(cpumask_of(cpu), resource_access, &ra, 1);
+            on_selected_cpus_obj_inout(cpumask_of(cpu), resource_access, &ra);
 
         /* Copy all if succeeded or up to the failed entry. */
         if ( __copy_to_guest(guest_entries, ra.entries,
diff --git a/xen/arch/x86/psr.c b/xen/arch/x86/psr.c
index cce7020868..29b8fad96e 100644
--- a/xen/arch/x86/psr.c
+++ b/xen/arch/x86/psr.c
@@ -1337,7 +1337,7 @@ static int write_psr_msrs(unsigned int socket, unsigned int cos,
 
         if ( cpu >= nr_cpu_ids )
             return -ENOTSOCK;
-        on_selected_cpus(cpumask_of(cpu), do_write_psr_msrs, &data, 1);
+        on_selected_cpus_obj(cpumask_of(cpu), do_write_psr_msrs, &data, 1);
     }
 
     return 0;
diff --git a/xen/arch/x86/shutdown.c b/xen/arch/x86/shutdown.c
index 902076cf67..820eaa7e30 100644
--- a/xen/arch/x86/shutdown.c
+++ b/xen/arch/x86/shutdown.c
@@ -550,8 +550,8 @@ void machine_restart(unsigned int delay_millisecs)
         if ( get_apic_id() != boot_cpu_physical_apicid )
         {
             /* Send IPI to the boot CPU (logical cpu 0). */
-            on_selected_cpus(cpumask_of(0), __machine_restart,
-                             &delay_millisecs, 0);
+            on_selected_cpus_obj(cpumask_of(0), __machine_restart,
+                                 &delay_millisecs, 0);
             for ( ; ; )
                 halt();
         }
diff --git a/xen/arch/x86/sysctl.c b/xen/arch/x86/sysctl.c
index 6bd4e191a7..b1a15dce97 100644
--- a/xen/arch/x86/sysctl.c
+++ b/xen/arch/x86/sysctl.c
@@ -195,7 +195,8 @@ long arch_do_sysctl(
             if ( cpu == smp_processor_id() )
                 l3_cache_get(&info);
             else
-                on_selected_cpus(cpumask_of(cpu), l3_cache_get, &info, 1);
+                on_selected_cpus_obj_inout(cpumask_of(cpu), l3_cache_get,
+                                           &info);
 
             ret = info.ret;
             sysctl->u.psr_cmt_op.u.data = (ret ? 0 : info.size);
-- 
2.56.0


