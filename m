Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C951606A325
	for <xen-devel@archiver.kernel.org>; Thu, 19 Nov 2026 21:31:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=xenproject.org header.i=@xenproject.org header.a=rsa-sha256 header.s=20200302mail header.b=BcvwbX+D
Received: from list by lists.xenproject.org with outflank-mailman.1497136.1695592 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xU9ia-0000G3-AG; Thu, 19 Nov 2026 21:30:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1497136.1695592; Thu, 19 Nov 2026 21:30:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xU9iY-0000AU-IX; Thu, 19 Nov 2026 21:30:54 +0000
Received: by outflank-mailman (input) for mailman id 1497136;
 Thu, 19 Nov 2026 21:30:20 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <gwd@xenproject.org>) id 1xU9hz-0001E4-Ra
 for xen-devel@lists.xenproject.org; Thu, 19 Nov 2026 21:30:19 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.98.2)
 (envelope-from <gwd@xenproject.org>) id 1xU9hz-00000006tJR-1qvb;
 Thu, 19 Nov 2026 21:30:19 +0000
Received: from [217.155.165.12] (helo=Georges-MacBook-Pro-2.tail87ea19.ts.net)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_CHACHA20_POLY1305_SHA256 (Exim 4.98.2)
 (envelope-from <gwd@xenproject.org>) id 1xU9Mt-0000000CVBH-0tCM;
 Thu, 19 Nov 2026 21:08:31 +0000
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
	bh=FImSAGTBdbDPxSFj5AW6ozzC1uAMZgaHWtEj5p+AjoI=; b=BcvwbX+DGTufA+o8BtYHkNw2Tx
	x6lVLxzScZaJqxoaB6nswgikYZAsOGnKy2m7v9DBUl4reuPTbcv5IuBJrvA4APdzkv/v+kPTudDIn
	OYtxK2mUFjg8V7ww9IJ8wdMWqYORpjUT083KSbv0K1D7GzaZWvSJNju87UChrpEUeTyA=;
From: George Dunlap <gwd@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: [PATCH v7 42/50] x86/time: move the calibration rendezvous data off the stack
Date: Thu, 19 Nov 2026 21:07:33 +0000
Message-ID: <20261119-asi-hvm-v7-42-6551b6d5c879@xenproject.org>
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
stack, so an IPI handler cannot dereference a pointer into the
initiating CPU's stack.  Payloads handed to other CPUs via
on_selected_cpus() must live somewhere globally reachable.

time_calibration() passes a pointer to a stack-allocated struct
calibration_rendezvous to all online CPUs.  The payload is a shared
rendezvous object: the handlers synchronise with each other through
r->semaphore, the CPU0 handler publishes master_stime for the others
to read, and the TSC variant additionally cmpxchg-loops on
r->max_tsc_stamp.  All of that requires every participating CPU to be
able to reach the object.

Make the rendezvous data a function-scope static, fully re-initialised
on entry.  Serialisation is already guaranteed: invocations come from
calibration_timer, which is bound to CPU0, and at boot directly from
verify_tsc_reliability(), also on CPU0, and the call uses @wait == 1
precisely so that all CPUs are done with @r before the caller returns
(the existing comment says as much), hence also before the next
invocation can re-initialise it.

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
 xen/arch/x86/time.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/time.c b/xen/arch/x86/time.c
index 0e5d06a9a8..68719a43d3 100644
--- a/xen/arch/x86/time.c
+++ b/xen/arch/x86/time.c
@@ -2390,7 +2390,14 @@ static void (*time_calibration_rendezvous_fn)(void *) =
 
 static void cf_check time_calibration(void *unused)
 {
-    struct calibration_rendezvous r = {
+    /*
+     * Shared by the calibration handlers on every CPU, so not on the stack,
+     * which other CPUs need not be able to reach.  Invocations are serialised
+     * (calibration_timer and verify_tsc_reliability(), both on CPU0).
+     */
+    static struct calibration_rendezvous r;
+
+    r = (struct calibration_rendezvous){
         .semaphore = ATOMIC_INIT(0)
     };
 
@@ -2403,7 +2410,7 @@ static void cf_check time_calibration(void *unused)
 
     cpumask_copy(&r.cpu_calibration_map, &cpu_online_map);
 
-    /* @wait=1 because we must wait for all cpus before freeing @r. */
+    /* @wait=1 because we must wait for all cpus before reusing @r. */
     on_selected_cpus(&r.cpu_calibration_map,
                      time_calibration_rendezvous_fn,
                      &r, 1);
-- 
2.56.0


