Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACAE7C55172
	for <xen-devel@archiver.kernel.org>; Tue,  4 Aug 2026 07:20:15 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1381934.1625367 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wr9R7-0007RK-NL; Tue, 04 Aug 2026 07:19:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1381934.1625367; Tue, 04 Aug 2026 07:19:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wr9R7-0007Qr-IG; Tue, 04 Aug 2026 07:19:41 +0000
Received: by outflank-mailman (input) for mailman id 1381934;
 Tue, 04 Aug 2026 07:16:12 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <d@ilvokhin.com>) id 1wr9Nk-0006yz-1Z
 for xen-devel@lists.xenproject.org; Tue, 04 Aug 2026 07:16:12 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wr9Nj-005IZo-EK
 for xen-devel@lists.xenproject.org; Tue, 04 Aug 2026 09:16:11 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <d@ilvokhin.com>)
 id 6a7191b8-e002-0a2a0a5209dd-0a2a4509d848-18
 for <xen-devel@lists.xenproject.org>; Tue, 04 Aug 2026 09:16:11 +0200
Received: from [178.62.254.231] (helo=mail.ilvokhin.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <d@ilvokhin.com>)
 id 6a7191bb-be1a-0a2a45090019-b23efee783a0-3
 for <xen-devel@lists.xenproject.org>; Tue, 04 Aug 2026 09:16:11 +0200
Received: from localhost.localdomain (shell.ilvokhin.com [138.68.190.75])
 (Authenticated sender: d@ilvokhin.com)
 by mail.ilvokhin.com (Postfix) with ESMTPSA id 05AB4E16DC;
 Tue, 04 Aug 2026 07:16:10 +0000 (UTC)
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
	s=mail; t=1785827770;
	bh=Bz2CpdeYvHJ4wdtpHF06PqmuJczwotX2rk+VZpOkhHc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=pap3mJ3/HxJEJFDk1E9V+MfQ4ojuK31y3RhNzciiECTAVYuygUg+AAUpw8Vg2iPD9
	 bo0bIm+yzmE6QIWLIch8VLiCc2NJUocvXXQ2cbg2o8M207KKA1P5DizNPLx/31xYgC
	 RZ1Z6my1XJzOWuENeYHFx8DmI08HwyPl+3SWt/mM=
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
Subject: [PATCH 4/5] tracing/lock: Use TRACE_EVENT_FN() for contended_release
Date: Tue,  4 Aug 2026 07:15:44 +0000
Message-ID: <1c2fcccfb584c075c02890c484f22c76a1948bf1.1785778551.git.d@ilvokhin.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1785778551.git.d@ilvokhin.com>
References: <cover.1785778551.git.d@ilvokhin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-bad1c0/1785827771-3ACDF034-F8BD3241/0/0
X-purgate-type: clean
X-purgate-size: 2205

queued_spin_unlock() gates its contended_release trace call behind a
static branch, so a NOP sits on the unlock path even while the
tracepoint is disabled. Removing that requires replacing the unlock
implementation only while contended_release is enabled, which needs a
callback when the tracepoint is toggled.

Convert contended_release to TRACE_EVENT_FN() and add weak no-op
arch_contended_release_trace_reg()/arch_contended_release_trace_unreg()
hooks.

The default hooks are empty, so this is a no-op until an architecture
overrides them.

No functional change intended.

Signed-off-by: Dmitry Ilvokhin <d@ilvokhin.com>
---
 include/trace/events/lock.h | 10 ++++++++--
 kernel/locking/mutex.c      |  4 ++++
 2 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/include/trace/events/lock.h b/include/trace/events/lock.h
index 1ded869cd619..b1d5b18c4514 100644
--- a/include/trace/events/lock.h
+++ b/include/trace/events/lock.h
@@ -137,7 +137,11 @@ TRACE_EVENT(contention_end,
 	TP_printk("%p (ret=%d)", __entry->lock_addr, __entry->ret)
 );
 
-TRACE_EVENT(contended_release,
+/* kernel/locking/mutex.c */
+int arch_contended_release_trace_reg(void);
+void arch_contended_release_trace_unreg(void);
+
+TRACE_EVENT_FN(contended_release,
 
 	TP_PROTO(void *lock),
 
@@ -151,7 +155,9 @@ TRACE_EVENT(contended_release,
 		__entry->lock_addr = lock;
 	),
 
-	TP_printk("%p", __entry->lock_addr)
+	TP_printk("%p", __entry->lock_addr),
+
+	arch_contended_release_trace_reg, arch_contended_release_trace_unreg
 );
 
 #endif /* _TRACE_LOCK_H */
diff --git a/kernel/locking/mutex.c b/kernel/locking/mutex.c
index 8a85912d7ee6..942a939cee95 100644
--- a/kernel/locking/mutex.c
+++ b/kernel/locking/mutex.c
@@ -1272,6 +1272,10 @@ EXPORT_TRACEPOINT_SYMBOL_GPL(contention_begin);
 EXPORT_TRACEPOINT_SYMBOL_GPL(contention_end);
 EXPORT_TRACEPOINT_SYMBOL_GPL(contended_release);
 
+__weak int arch_contended_release_trace_reg(void) { return 0; }
+
+__weak void arch_contended_release_trace_unreg(void) { }
+
 /**
  * atomic_dec_and_mutex_lock - return holding mutex if we dec to 0
  * @cnt: the atomic which we are to dec
-- 
2.53.0-Meta


