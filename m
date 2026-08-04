Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EB1AC5518F
	for <xen-devel@archiver.kernel.org>; Tue,  4 Aug 2026 07:25:23 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1381968.1625398 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wr9WS-000278-Pc; Tue, 04 Aug 2026 07:25:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1381968.1625398; Tue, 04 Aug 2026 07:25:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wr9WS-000271-Mv; Tue, 04 Aug 2026 07:25:12 +0000
Received: by outflank-mailman (input) for mailman id 1381968;
 Tue, 04 Aug 2026 07:25:11 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <d@ilvokhin.com>) id 1wr9WR-00026p-4O
 for xen-devel@lists.xenproject.org; Tue, 04 Aug 2026 07:25:11 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wr9WQ-007it1-Cm
 for xen-devel@lists.xenproject.org; Tue, 04 Aug 2026 09:25:10 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <d@ilvokhin.com>)
 id 6a7193c6-2eae-0a2a0a5409dd-0a2a4501af2e-40
 for <xen-devel@lists.xenproject.org>; Tue, 04 Aug 2026 09:25:10 +0200
Received: from [178.62.254.231] (helo=mail.ilvokhin.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <d@ilvokhin.com>)
 id 6a7191b9-5984-0a2a45010019-b23efee7b86e-3
 for <xen-devel@lists.xenproject.org>; Tue, 04 Aug 2026 09:16:09 +0200
Received: from localhost.localdomain (shell.ilvokhin.com [138.68.190.75])
 (Authenticated sender: d@ilvokhin.com)
 by mail.ilvokhin.com (Postfix) with ESMTPSA id 48833E16CF;
 Tue, 04 Aug 2026 07:16:08 +0000 (UTC)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=mail header.d=ilvokhin.com header.i="@ilvokhin.com" header.h="From:To:Cc:Subject:Date"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ilvokhin.com;
	s=mail; t=1785827768;
	bh=C36dNKMErd6fEDuyOzYmXnXLzsDFA2rEQeKm0PrIEwU=;
	h=From:To:Cc:Subject:Date;
	b=zuuQlk9HFx1s4aMIaXtgkNF/m3YJ86B2QbZ83bIHeVzXGJfBm3WQ9v5qi06ycUsSA
	 y8MsnTc4o0Lw3f7cazZ6t3ZC6FpEzOcBi4/n2bvgLJMepXG/4Pg6/7hQIy/DJBPKo1
	 3AcjhlumYX+Odef7Y8fxkp0G8LLBWqmj0Tg/agbQ=
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
Subject: [PATCH 0/5] locking/qspinlock: Add contended_release tracepoint
Date: Tue,  4 Aug 2026 07:15:40 +0000
Message-ID: <cover.1785778551.git.d@ilvokhin.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d62444/1785827769-C4558757-279072D9/13/0
X-purgate-type: clean
X-purgate-size: 4019

The contended_release tracepoint landed in v7.2-rc2 for sleeping locks
(4f070ccb4dc4 "locking: Add contended_release tracepoint to sleepable
locks"). Spinlock support was dropped from that series. This one adds it
for queued spinlocks.

The existing contention_begin/contention_end tracepoints fire on the
waiter side. The holder's identity and stack can be captured at
contention_begin time (e.g. perf lock contention --lock-owner), but only
for locks with an owner field to read: mutex and rwsem. qspinlock has
none, so a contended spinlock cannot be attributed to its holder at all.
Even where the owner can be read, it reflects the holder's state when a
waiter arrives, not when the lock is released.

This series adds a contended_release tracepoint to qspinlock that fires
on the holder side when a lock with waiters is released. This provides:

- Hold time estimation: when the holder's own acquisition was
  contended, its contention_end (acquisition) and contended_release
  can be correlated to measure how long the lock was held under
  contention.

- The holder's stack at release time, which for spinlocks is not
  available by any other means.

The unlock path might be quite hot, so the tracepoint is made as cheap
as possible, to keep it usable in production:

- x86 with PARAVIRT_SPINLOCKS=y, which is what distributions ship, swaps
  the unlock implementation via static_call() when the tracepoint is
  enabled. The disabled path is byte-identical to today's: the same
  inline movb, no NOP and no call.

- Everywhere else a static-branch check is compiled into
  queued_spin_unlock(). On x86_64 that is a single NOP on the executed
  path, with the call to the traced helper emitted out of line and
  unreachable while the tracepoint is off. On other architectures a few
  more instructions to manage a stack frame land on the executed path
  too, so the generic path sits behind
  CONFIG_QUEUED_SPINLOCKS_TRACE_CONTENDED_RELEASE (default n).

Costs and measurements are in the individual changelogs. Briefly, no
throughput or latency change is measurable on either x86_64 or arm64
with QUEUED_SPINLOCKS_TRACE_CONTENDED_RELEASE=y.

Tested: x86_64 with PARAVIRT_SPINLOCKS=y and =n, arm64, tracepoint on
and off, disassembly checked in both states, locktorture with tracepoint
on and off.

Not covered: qrwlock, and architectures with fully custom qspinlock
implementations (e.g. PowerPC). The stack frame managing instructions on
arm64 should be avoidable, but that is not done in this patchset.

Patch 1 is Peter's draft from [1] and is missing his Signed-off-by.
Peter, please add it if you are happy with the patch.

[1]: https://lore.kernel.org/all/20260603120811.GW3493090@noisy.programming.kicks-ass.net/

Dmitry Ilvokhin (4):
  locking: Factor out queued_spin_release()
  locking/qspinlock: Add contended_release tracepoint
  tracing/lock: Use TRACE_EVENT_FN() for contended_release
  x86/paravirt: Trace contended_release on unlock

Peter Zijlstra (1):
  x86/paravirt: Use static_call() for the paravirt spinlock ops

 arch/mips/include/asm/spinlock.h         |  6 +--
 arch/x86/hyperv/hv_spinlock.c            |  4 +-
 arch/x86/include/asm/cpufeatures.h       |  1 -
 arch/x86/include/asm/paravirt-spinlock.h | 21 +++++---
 arch/x86/kernel/kvm.c                    |  5 +-
 arch/x86/kernel/paravirt-spinlocks.c     | 63 +++++++++++++++++++++---
 arch/x86/kernel/static_call.c            | 27 ++++++++++
 arch/x86/xen/spinlock.c                  |  5 +-
 include/asm-generic/qspinlock.h          | 38 ++++++++++++--
 include/trace/events/lock.h              | 10 +++-
 kernel/Kconfig.locks                     | 20 ++++++++
 kernel/locking/mutex.c                   |  4 ++
 kernel/locking/qspinlock.c               | 22 +++++++++
 tools/arch/x86/include/asm/cpufeatures.h |  1 -
 14 files changed, 195 insertions(+), 32 deletions(-)


base-commit: 5e601ab3615c86be7c4068ce992f94654693a032
-- 
2.53.0-Meta


