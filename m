Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 666CD606A333
	for <xen-devel@archiver.kernel.org>; Thu, 19 Nov 2026 21:30:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=xenproject.org header.i=@xenproject.org header.a=rsa-sha256 header.s=20200302mail header.b=NkWsHYgG
Received: from list by lists.xenproject.org with outflank-mailman.1497115.1695416 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xU9i2-0001kN-Lv; Thu, 19 Nov 2026 21:30:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1497115.1695416; Thu, 19 Nov 2026 21:30:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xU9i2-0001iV-9D; Thu, 19 Nov 2026 21:30:22 +0000
Received: by outflank-mailman (input) for mailman id 1497115;
 Thu, 19 Nov 2026 21:30:19 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <gwd@xenproject.org>) id 1xU9hz-0001C9-3w
 for xen-devel@lists.xenproject.org; Thu, 19 Nov 2026 21:30:19 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.98.2)
 (envelope-from <gwd@xenproject.org>) id 1xU9hy-00000006tGh-2qPi;
 Thu, 19 Nov 2026 21:30:19 +0000
Received: from [217.155.165.12] (helo=Georges-MacBook-Pro-2.tail87ea19.ts.net)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_CHACHA20_POLY1305_SHA256 (Exim 4.98.2)
 (envelope-from <gwd@xenproject.org>) id 1xU9Mr-0000000CVBH-1bAa;
 Thu, 19 Nov 2026 21:08:29 +0000
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
	bh=n43747u3O82/EPJ62jqYKY40YYs4o7PKgFzEzkqBCKU=; b=NkWsHYgGTBr6scTOOlPx2DpST3
	iNJ77BKAsFDJB7DfHbZX8ixAljzqg9SAmx87lypUG67GxHuAFXhlJnDGSyWKw/lVhFfr5tf7AFSl4
	mENURIyTXh020w2WYyCd8Wpvft9RKlJZf+eSQqa6zo0HvUgAYLUIpOuYeo6Z95bdBUXw=;
From: George Dunlap <gwd@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: [PATCH v7 40/50] x86/mtrr: move the set_mtrr() rendezvous data off the stack
Date: Thu, 19 Nov 2026 21:07:31 +0000
Message-ID: <20261119-asi-hvm-v7-40-6551b6d5c879@xenproject.org>
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

set_mtrr() passes a pointer to a stack-allocated struct set_mtrr_data
to all other CPUs.  The payload is a live rendezvous object: the IPI
handler decrements data->count and spins on data->gate in three
phases, while the initiating CPU re-arms count and toggles gate.  The
dispatch is asynchronous (@wait == 0), but set_mtrr() supplies its own
barrier - it spins on data->count through the entire protocol and does
not return until the rendezvous has completed - so the frame stays
alive for as long as the callees use the data.  The current code is
correct; it just relies on cross-CPU stack reachability, which is
going away.

Make the rendezvous data a function-scope static.  All fields are
(re)initialised on every invocation before the IPI is sent, so the one
new requirement is that set_mtrr() invocations be serialised: a static
shares a single object across invocations where each call previously
had its own private stack copy.  mtrr_add_page() and mtrr_del_page()
already call set_mtrr() with mtrr_mutex held; take the lock in
mtrr_aps_sync_end() as well, and assert in set_mtrr() that it is held.

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
 xen/arch/x86/cpu/mtrr/main.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/cpu/mtrr/main.c b/xen/arch/x86/cpu/mtrr/main.c
index 432d6f6761..2a7b544bb1 100644
--- a/xen/arch/x86/cpu/mtrr/main.c
+++ b/xen/arch/x86/cpu/mtrr/main.c
@@ -202,9 +202,16 @@ static void set_mtrr(unsigned int reg, unsigned long base,
 {
 	cpumask_t allbutself;
 	unsigned int nr_cpus;
-	struct set_mtrr_data data;
+	/*
+	 * Shared with the IPI handlers on the other CPUs, so not on the
+	 * stack, which other CPUs need not be able to reach.  All callers
+	 * hold mtrr_mutex, which serialises access to the shared object.
+	 */
+	static struct set_mtrr_data data;
 	unsigned long flags;
 
+	ASSERT(spin_is_locked(&mtrr_mutex));
+
 	cpumask_andnot(&allbutself, &cpu_online_map,
                       cpumask_of(smp_processor_id()));
 	nr_cpus = cpumask_weight(&allbutself);
@@ -606,9 +613,11 @@ void mtrr_aps_sync_begin(void)
 
 void mtrr_aps_sync_end(void)
 {
+	mutex_lock(&mtrr_mutex);
 	if (mtrr_if)
 		set_mtrr(~0U, 0, 0, 0);
 	hold_mtrr_updates_on_aps = false;
+	mutex_unlock(&mtrr_mutex);
 }
 
 void asmlinkage mtrr_bp_restore(void)
-- 
2.56.0


