Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BE23606A326
	for <xen-devel@archiver.kernel.org>; Thu, 19 Nov 2026 21:30:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=xenproject.org header.i=@xenproject.org header.a=rsa-sha256 header.s=20200302mail header.b=OFiOTva0
Received: from list by lists.xenproject.org with outflank-mailman.1497125.1695488 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xU9iB-0003fk-BQ; Thu, 19 Nov 2026 21:30:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1497125.1695488; Thu, 19 Nov 2026 21:30:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xU9iA-0003cF-El; Thu, 19 Nov 2026 21:30:30 +0000
Received: by outflank-mailman (input) for mailman id 1497125;
 Thu, 19 Nov 2026 21:30:19 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <gwd@xenproject.org>) id 1xU9hz-0001D3-D7
 for xen-devel@lists.xenproject.org; Thu, 19 Nov 2026 21:30:19 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.98.2)
 (envelope-from <gwd@xenproject.org>) id 1xU9hz-00000006tI5-00kd;
 Thu, 19 Nov 2026 21:30:19 +0000
Received: from [217.155.165.12] (helo=Georges-MacBook-Pro-2.tail87ea19.ts.net)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_CHACHA20_POLY1305_SHA256 (Exim 4.98.2)
 (envelope-from <gwd@xenproject.org>) id 1xU9Mz-0000000CVBH-0xMS;
 Thu, 19 Nov 2026 21:08:37 +0000
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
	bh=tAygwFUjAXnlmyhTw8QJTNzxArPZrorABohzNVZLFdg=; b=OFiOTva0ztPL9l4fQ/8zuTixTy
	4tjgsgWqybsLeQtLNIj8Aa7jCjuuqJ9W5ZR6sD8+p+1Opq9wPmCZaDI4qHu0jOQHzvjVNMKDbNbrk
	xv7fstmp6YHGqM96OnRC1ifQggI3e7yOw3t1XwmUC3NCo1vS6bqwSPMUbliX+wJWbnes=;
From: George Dunlap <gwd@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: [PATCH v7 48/50] x86/mce: pass the error-injection callfunc payload by value
Date: Thu, 19 Nov 2026 21:07:39 +0000
Message-ID: <20261119-asi-hvm-v7-48-6551b6d5c879@xenproject.org>
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

do_mca() copies the hypercall argument into a stack local and then,
for XEN_MC_msrinject, points another CPU at its embedded struct
xen_mc_msrinject (144 bytes, the largest by-value payload in the
tree) via on_selected_cpus().  The XEN_MC_mceinject calls pass no
payload.

Switch to on_selected_cpus_obj(), passing the structure by value.
The call is synchronous (@wait == 1) and x86_mc_msrinject() only
reads the payload, so behaviour is unchanged.

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
 xen/arch/x86/cpu/mcheck/mce.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/cpu/mcheck/mce.c b/xen/arch/x86/cpu/mcheck/mce.c
index 842a80977c..e435e13ad7 100644
--- a/xen/arch/x86/cpu/mcheck/mce.c
+++ b/xen/arch/x86/cpu/mcheck/mce.c
@@ -1532,8 +1532,8 @@ long do_mca(XEN_GUEST_HANDLE_PARAM(xen_mc_t) u_xen_mc)
 
         add_taint(TAINT_ERROR_INJECT);
 
-        on_selected_cpus(cpumask_of(target), x86_mc_msrinject,
-                         mc_msrinject, 1);
+        on_selected_cpus_obj(cpumask_of(target), x86_mc_msrinject,
+                             mc_msrinject, 1);
 
         break;
 
-- 
2.56.0


