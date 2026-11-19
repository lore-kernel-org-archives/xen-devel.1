Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93051606A320
	for <xen-devel@archiver.kernel.org>; Thu, 19 Nov 2026 21:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=xenproject.org header.i=@xenproject.org header.a=rsa-sha256 header.s=20200302mail header.b=G6IAnD/O
Received: from list by lists.xenproject.org with outflank-mailman.1497121.1695459 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xU9i6-0002jN-NL; Thu, 19 Nov 2026 21:30:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1497121.1695459; Thu, 19 Nov 2026 21:30:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xU9i6-0002gZ-1i; Thu, 19 Nov 2026 21:30:26 +0000
Received: by outflank-mailman (input) for mailman id 1497121;
 Thu, 19 Nov 2026 21:30:19 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <gwd@xenproject.org>) id 1xU9hz-0001CZ-8L
 for xen-devel@lists.xenproject.org; Thu, 19 Nov 2026 21:30:19 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.98.2)
 (envelope-from <gwd@xenproject.org>) id 1xU9hy-00000006tH9-3Oey;
 Thu, 19 Nov 2026 21:30:19 +0000
Received: from [217.155.165.12] (helo=Georges-MacBook-Pro-2.tail87ea19.ts.net)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_CHACHA20_POLY1305_SHA256 (Exim 4.98.2)
 (envelope-from <gwd@xenproject.org>) id 1xU9Ms-0000000CVBH-1FqD;
 Thu, 19 Nov 2026 21:08:30 +0000
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
	bh=rvQ243qMZ7smOnfCgSgEld4GpfGrWULEH1ValMJu3WU=; b=G6IAnD/OnYQfXPzoiWBtWesCDI
	FN/4P/aUAqCwlcdNfGzL3dNlqylk/UWLp/9Fq3RNuRtJOKJ/ipQxwh23Df3QPgwbEIWX5Lh+1PX6b
	kf0M7QI5pD7dk1L3jSPLvidYbGLGWVj0Z+5Nj6jDboxSPh1I3MJ0wVZBnyW8MmSGo6RQ=;
From: George Dunlap <gwd@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: [PATCH v7 41/50] x86/smp: move smp_send_stop()'s AP-stop flag off the stack
Date: Thu, 19 Nov 2026 21:07:32 +0000
Message-ID: <20261119-asi-hvm-v7-41-6551b6d5c879@xenproject.org>
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
smp_call_function() must live somewhere globally reachable.

smp_send_stop() hands the address of a stack-local bool to the other
CPUs via an asynchronous (@wait == 0) smp_call_function().  The
callees then poll that bool from stop_this_cpu(), waiting for the
initiating CPU to set it - which it does further down the same
function, once the interrupt controllers have been disabled, before
waiting for the APs to go offline.  The initiator is executing
smp_send_stop() the whole time the APs poll, so the frame stays alive
and the current code is correct; but with per-CPU mapped stacks the
flag would no longer be reachable and the poll would fault.

Make the flag a function-scope static, re-initialised at function
entry.  The reset must remain an explicit statement rather than become
an initialiser: on sequential reuse a stale "true" would release the
APs before the interrupt controllers are quiesced.  The signalling
protocol is otherwise unchanged.  Concurrent invocations of
smp_send_stop() were not usefully supported before (the function
disables interrupt controllers system-wide); a static flag does not
change that.

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
 xen/arch/x86/smp.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/smp.c b/xen/arch/x86/smp.c
index ae4e5a66d7..8a26c001e0 100644
--- a/xen/arch/x86/smp.c
+++ b/xen/arch/x86/smp.c
@@ -360,7 +360,15 @@ static void noreturn cf_check stop_this_cpu(void *dummy)
 void smp_send_stop(void)
 {
     unsigned int cpu = smp_processor_id();
-    bool stop_aps = false;
+    /*
+     * Polled by the APs from the IPI handler, so not on the stack, which
+     * other CPUs need not be able to reach.  Reset on every call, not by an
+     * initialiser, so that a stale "true" cannot release the APs before the
+     * interrupt controllers below are quiesced.
+     */
+    static bool stop_aps;
+
+    stop_aps = false;
 
     /*
      * Perform AP offlining and disabling of interrupt controllers with all
-- 
2.56.0


