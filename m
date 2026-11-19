Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1DD3606A336
	for <xen-devel@archiver.kernel.org>; Thu, 19 Nov 2026 21:30:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=xenproject.org header.i=@xenproject.org header.a=rsa-sha256 header.s=20200302mail header.b=4HJJYeqD
Received: from list by lists.xenproject.org with outflank-mailman.1497124.1695500 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xU9iD-00043o-NN; Thu, 19 Nov 2026 21:30:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1497124.1695500; Thu, 19 Nov 2026 21:30:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xU9iC-000404-DD; Thu, 19 Nov 2026 21:30:32 +0000
Received: by outflank-mailman (input) for mailman id 1497124;
 Thu, 19 Nov 2026 21:30:19 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <gwd@xenproject.org>) id 1xU9hz-0001Cw-Bm
 for xen-devel@lists.xenproject.org; Thu, 19 Nov 2026 21:30:19 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.98.2)
 (envelope-from <gwd@xenproject.org>) id 1xU9hy-00000006tH1-3GbN;
 Thu, 19 Nov 2026 21:30:19 +0000
Received: from [217.155.165.12] (helo=Georges-MacBook-Pro-2.tail87ea19.ts.net)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_CHACHA20_POLY1305_SHA256 (Exim 4.98.2)
 (envelope-from <gwd@xenproject.org>) id 1xU9Mu-0000000CVBH-05m2;
 Thu, 19 Nov 2026 21:08:32 +0000
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
	bh=qSfxZQRzDXOcJAE4M94MtHKjLXjCQE+CWFbbOYphgpY=; b=4HJJYeqDyh87R31aBLuLEBuPS3
	E3cfL/ZsEATkBpzypBZa3e2CwCiTwWf1A4vbdX1++XE2PCACm1mYcCh5Dn/ZC+VzOlls61PTGQbXF
	mIAFQDUcwHyxp8oHRBZh/qp/gdfEnhr4o8cI+P3uI4FXhCICbLLLp2kB6O8ejnwrzokw=;
From: George Dunlap <gwd@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: [PATCH v7 43/50] x86/ucode: move the stop_machine payload off the stack
Date: Thu, 19 Nov 2026 21:07:34 +0000
Message-ID: <20261119-asi-hvm-v7-43-6551b6d5c879@xenproject.org>
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
stack, so payloads handed to other CPUs - here via stop_machine_run()
- must live somewhere globally reachable.

ucode_update_hcall_cont() passes the address of a stack-local struct
patch_with_flags to stop_machine_run(), which stashes the raw pointer
in the (static) stopmachine_data and has every online CPU dereference
it from do_microcode_update().

Make it a function-scope static, mirroring the adjacent nmi_patch.
Both fields are written on every invocation before stop_machine_run()
is called.  Serialisation is already guaranteed: the continuation is
always queued via continue_hypercall_on_cpu(0, ...), so invocations
run one at a time in CPU0 tasklet context.

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
 xen/arch/x86/cpu/microcode/core.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/cpu/microcode/core.c b/xen/arch/x86/cpu/microcode/core.c
index 9b8d1e09cb..6f27d0b885 100644
--- a/xen/arch/x86/cpu/microcode/core.c
+++ b/xen/arch/x86/cpu/microcode/core.c
@@ -492,7 +492,12 @@ static long cf_check __maybe_unused ucode_update_hcall_cont(void *data)
     int ret, result;
     struct ucode_buf *buffer = data;
     unsigned int cpu, updated;
-    struct patch_with_flags patch_with_flags;
+    /*
+     * Dereferenced by every CPU from the stop_machine context below, so not
+     * on the stack, which other CPUs need not be able to reach.  Invocations
+     * are serialised: each runs as a CPU0 tasklet.
+     */
+    static struct patch_with_flags patch_with_flags;
     bool ucode_force = buffer->flags & XENPF_UCODE_FORCE;
 
     /* cpu_online_map must not change during update */
-- 
2.56.0


