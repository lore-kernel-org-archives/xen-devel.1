Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CAC2606A324
	for <xen-devel@archiver.kernel.org>; Thu, 19 Nov 2026 21:30:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=xenproject.org header.i=@xenproject.org header.a=rsa-sha256 header.s=20200302mail header.b=TMVMWliW
Received: from list by lists.xenproject.org with outflank-mailman.1497117.1695426 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xU9i3-0001z4-Jt; Thu, 19 Nov 2026 21:30:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1497117.1695426; Thu, 19 Nov 2026 21:30:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xU9i3-0001wr-4B; Thu, 19 Nov 2026 21:30:23 +0000
Received: by outflank-mailman (input) for mailman id 1497117;
 Thu, 19 Nov 2026 21:30:19 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <gwd@xenproject.org>) id 1xU9hz-0001CI-5f
 for xen-devel@lists.xenproject.org; Thu, 19 Nov 2026 21:30:19 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.98.2)
 (envelope-from <gwd@xenproject.org>) id 1xU9hy-00000006tGR-2Vi2;
 Thu, 19 Nov 2026 21:30:18 +0000
Received: from [217.155.165.12] (helo=Georges-MacBook-Pro-2.tail87ea19.ts.net)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_CHACHA20_POLY1305_SHA256 (Exim 4.98.2)
 (envelope-from <gwd@xenproject.org>) id 1xU9Mu-0000000CVBH-3yfc;
 Thu, 19 Nov 2026 21:08:33 +0000
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
	bh=Bw8vBiNvfe8nBemBKR33mvKmNqZxsGnzT2Dqeg/h8o8=; b=TMVMWliWxfDJAbxV+u8QfhYgCm
	FXsGLBrkSxb033O1ZTsYYaA6RUQhNvR/EgD511rYXxxBAglGeDJX5radCHhzUE/TRP98pMl1ti/hu
	Lytlhmeu8tfUT2Rt+pVnQCqJ2xlvTiLmurBgHgnYcioBg6+Fd6En+j0BBhCwe9vwsdbM=;
From: George Dunlap <gwd@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: [PATCH v7 44/50] x86/MCE: pass NULL to x86_mc_mceinject()
Date: Thu, 19 Nov 2026 21:07:35 +0000
Message-ID: <20261119-asi-hvm-v7-44-6551b6d5c879@xenproject.org>
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

x86_mc_mceinject() simulates a machine check on the CPU it runs on, and
never reads its argument.  The XEN_MC_inject_v2 calls pass it NULL, but
the two XEN_MC_mceinject calls pass a pointer to do_mca()'s copy of the
hypercall argument, which is on do_mca()'s stack.

Pass NULL there too, and name the parameter "unused".

No functional change.

Groundwork for per-CPU stack mappings, to come as part of Address
Space Isolation, which take away a CPU's access to other CPUs' stacks:
a subsequent change asserts that a call-function payload passed by
pointer does not point into the initiator's stack, and these calls
have no payload to pass.

Assisted-by: Claude Code:claude-opus-5-5
Signed-off-by: George Dunlap <gwd@xenproject.org>
---
Changes in v7:
- New in this version.
---
 xen/arch/x86/cpu/mcheck/mce.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/xen/arch/x86/cpu/mcheck/mce.c b/xen/arch/x86/cpu/mcheck/mce.c
index 1888f22d15..842a80977c 100644
--- a/xen/arch/x86/cpu/mcheck/mce.c
+++ b/xen/arch/x86/cpu/mcheck/mce.c
@@ -1247,7 +1247,7 @@ static void cf_check __maybe_unused x86_mc_msrinject(void *data)
         x86_mc_hwcr_wren_restore(hwcr);
 }
 
-static void cf_check __maybe_unused x86_mc_mceinject(void *data)
+static void cf_check __maybe_unused x86_mc_mceinject(void *unused)
 {
     printk("Simulating #MC on cpu %d\n", smp_processor_id());
     __asm__ __volatile__("int $0x12");
@@ -1556,10 +1556,9 @@ long do_mca(XEN_GUEST_HANDLE_PARAM(xen_mc_t) u_xen_mc)
         add_taint(TAINT_ERROR_INJECT);
 
         if ( mce_broadcast )
-            on_each_cpu(x86_mc_mceinject, mc_mceinject, 1);
+            on_each_cpu(x86_mc_mceinject, NULL, 1);
         else
-            on_selected_cpus(cpumask_of(target), x86_mc_mceinject,
-                             mc_mceinject, 1);
+            on_selected_cpus(cpumask_of(target), x86_mc_mceinject, NULL, 1);
         break;
 
     case XEN_MC_inject_v2:
-- 
2.56.0


