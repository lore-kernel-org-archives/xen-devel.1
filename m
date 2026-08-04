Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20DFAC5518F
	for <xen-devel@archiver.kernel.org>; Tue,  4 Aug 2026 07:20:02 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1381933.1625361 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wr9R7-0007Oj-Fb; Tue, 04 Aug 2026 07:19:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1381933.1625361; Tue, 04 Aug 2026 07:19:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wr9R7-0007Oc-Ca; Tue, 04 Aug 2026 07:19:41 +0000
Received: by outflank-mailman (input) for mailman id 1381933;
 Tue, 04 Aug 2026 07:16:11 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <d@ilvokhin.com>) id 1wr9Nj-0006yt-Gn
 for xen-devel@lists.xenproject.org; Tue, 04 Aug 2026 07:16:11 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wr9Ni-007h56-TR
 for xen-devel@lists.xenproject.org; Tue, 04 Aug 2026 09:16:10 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <d@ilvokhin.com>)
 id 6a7191ba-2eae-0a2a0a5409dd-0a2a4506dbb6-2
 for <xen-devel@lists.xenproject.org>; Tue, 04 Aug 2026 09:16:10 +0200
Received: from [178.62.254.231] (helo=mail.ilvokhin.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <d@ilvokhin.com>)
 id 6a7191ba-195a-0a2a45060019-b23efee78ee2-3
 for <xen-devel@lists.xenproject.org>; Tue, 04 Aug 2026 09:16:10 +0200
Received: from localhost.localdomain (shell.ilvokhin.com [138.68.190.75])
 (Authenticated sender: d@ilvokhin.com)
 by mail.ilvokhin.com (Postfix) with ESMTPSA id 24FC1E16D4;
 Tue, 04 Aug 2026 07:16:09 +0000 (UTC)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=mail header.d=ilvokhin.com header.i="@ilvokhin.com" header.h="From:To:Cc:Subject:Date:In-Reply-To:References"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ilvokhin.com;
	s=mail; t=1785827769;
	bh=WuLqet5KqDLEqzcC11hIv1M/iVcVPFYVpjgSQGthfWs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=wuKIY1D4nBbR5uq8gfZNxdmHgxtiW+Zwfk36Z3rrQRTooGhRRML5EXyzobMw0uJxv
	 5P/K81r2u82h7iiaVnYm4EpGO+40bXq+eTassRL9b5566xMP0Fz5dav+H08KKCBg4i
	 JYRM7O6cFcYUV5X3SXyn9SghO75pg22YrPEy33FY=
From: Dmitry Ilvokhin <d@ilvokhin.com>
To: Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Will Deacon <will@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Waiman Long <longman@redhat.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	"K. Y. Srinivasan" <kys@microsoft.com>,
	Haiyang Zhang <haiyangz@microsoft.com>,
	Wei Liu <wei.liu@kernel.org>,
	Dexuan Cui <decui@microsoft.com>,
	Long Li <longli@microsoft.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Juergen Gross <jgross@suse.com>,
	Ajay Kaher <ajay.kaher@broadcom.com>,
	Alexey Makhalov <alexey.makhalov@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Vitaly Kuznetsov <vkuznets@redhat.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Jason Baron <jbaron@akamai.com>,
	Alice Ryhl <aliceryhl@google.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-hyperv@vger.kernel.org,
	virtualization@lists.linux.dev,
	kvm@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	linux-arch@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	kernel-team@meta.com,
	Dmitry Ilvokhin <d@ilvokhin.com>
Subject: [PATCH 2/5] locking: Factor out queued_spin_release()
Date: Tue,  4 Aug 2026 07:15:42 +0000
Message-ID: <b8daabae6469ad72cc784a911f6cc43a6d45df3a.1785778551.git.d@ilvokhin.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1785778551.git.d@ilvokhin.com>
References: <cover.1785778551.git.d@ilvokhin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-16d1c6/1785827770-F78CB77B-E9ACA1BD/0/0
X-purgate-type: clean
X-purgate-size: 2814

The contended_release tracepoint needs to hook queued_spin_unlock(), but
architectures with a custom unlock define queued_spin_unlock() directly,
leaving no single generic place to add the tracing.

Introduce queued_spin_release() as the arch-overridable release
primitive and make queued_spin_unlock() a generic wrapper around it.
An architecture that only customizes the release can then override
queued_spin_release() and inherit the generic wrapper.

Rename the MIPS override to queued_spin_release() accordingly. x86
paravirt overrides queued_spin_unlock() directly and is left unchanged.

No functional change intended.

Signed-off-by: Dmitry Ilvokhin <d@ilvokhin.com>
---
 arch/mips/include/asm/spinlock.h |  6 +++---
 include/asm-generic/qspinlock.h  | 17 ++++++++++++++---
 2 files changed, 17 insertions(+), 6 deletions(-)

diff --git a/arch/mips/include/asm/spinlock.h b/arch/mips/include/asm/spinlock.h
index 6ce2117e49f6..c349162f15eb 100644
--- a/arch/mips/include/asm/spinlock.h
+++ b/arch/mips/include/asm/spinlock.h
@@ -13,12 +13,12 @@
 
 #include <asm-generic/qspinlock_types.h>
 
-#define	queued_spin_unlock queued_spin_unlock
+#define	queued_spin_release queued_spin_release
 /**
- * queued_spin_unlock - release a queued spinlock
+ * queued_spin_release - release a queued spinlock
  * @lock : Pointer to queued spinlock structure
  */
-static inline void queued_spin_unlock(struct qspinlock *lock)
+static inline void queued_spin_release(struct qspinlock *lock)
 {
 	/* This could be optimised with ARCH_HAS_MMIOWB */
 	mmiowb();
diff --git a/include/asm-generic/qspinlock.h b/include/asm-generic/qspinlock.h
index bf47cca2c375..ae45289e8ec7 100644
--- a/include/asm-generic/qspinlock.h
+++ b/include/asm-generic/qspinlock.h
@@ -115,12 +115,12 @@ static __always_inline void queued_spin_lock(struct qspinlock *lock)
 }
 #endif
 
-#ifndef queued_spin_unlock
+#ifndef queued_spin_release
 /**
- * queued_spin_unlock - release a queued spinlock
+ * queued_spin_release - release a queued spinlock
  * @lock : Pointer to queued spinlock structure
  */
-static __always_inline void queued_spin_unlock(struct qspinlock *lock)
+static __always_inline void queued_spin_release(struct qspinlock *lock)
 {
 	/*
 	 * unlock() needs release semantics:
@@ -129,6 +129,17 @@ static __always_inline void queued_spin_unlock(struct qspinlock *lock)
 }
 #endif
 
+#ifndef queued_spin_unlock
+/**
+ * queued_spin_unlock - unlock a queued spinlock
+ * @lock : Pointer to queued spinlock structure
+ */
+static __always_inline void queued_spin_unlock(struct qspinlock *lock)
+{
+	queued_spin_release(lock);
+}
+#endif
+
 #ifndef virt_spin_lock
 static __always_inline bool virt_spin_lock(struct qspinlock *lock)
 {
-- 
2.53.0-Meta


