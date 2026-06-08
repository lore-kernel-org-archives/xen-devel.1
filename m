Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C2DCCD8CBE
	for <xen-devel@archiver.kernel.org>; Mon,  8 Jun 2026 14:55:34 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1331701.1594260 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wWbNi-0001QM-7A; Mon, 08 Jun 2026 14:55:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1331701.1594260; Mon, 08 Jun 2026 14:55:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wWbNh-0001Pv-UI; Mon, 08 Jun 2026 14:55:13 +0000
Received: by outflank-mailman (input) for mailman id 1331701;
 Mon, 08 Jun 2026 14:55:13 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <BATV+89cebe4ba06156b53a55+8324+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1wWbNh-0001Of-D7
 for xen-devel@lists.xenproject.org; Mon, 08 Jun 2026 14:55:13 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wWbNg-00EcHE-Q0; Mon, 08 Jun 2026 16:55:12 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <BATV+89cebe4ba06156b53a55+8324+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 6a26d7c5-5cb7-0a2a0a5109dd-0a2a4504aa90-36
 for <multiple-recipients>; Mon, 08 Jun 2026 16:55:12 +0200
Received: from [90.155.50.34] (helo=casper.infradead.org)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from
 <BATV+89cebe4ba06156b53a55+8324+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 6a26d7d0-1dec-0a2a45040019-5a9b3222a71a-3
 for <multiple-recipients>; Mon, 08 Jun 2026 16:55:12 +0200
Received: from [2001:8b0:10b:1::425] (helo=i7.infradead.org)
 by casper.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
 id 1wWbNS-0000000Dtxo-3N7M; Mon, 08 Jun 2026 14:54:59 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.99.2 #2 (Red
 Hat Linux)) id 1wWbNS-00000000NGd-3xVq;
 Mon, 08 Jun 2026 15:54:58 +0100
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=casper.20170209 header.d=infradead.org header.i="@infradead.org" header.h="Sender:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description;
	bh=s86e1eDk7JwzlpKJ6Et1TYCYwI2LU3hCrdoVI9vRngc=; b=rELP0pPshxo9UwZ5syelAnSKO6
	4cfW8H6uBn/Zf/P0TiJzkdhGO+CwQJuVJ1hnrK2PiO+YODU7eRwQQ9U0yAKSEfyEvh/5xs4UNG2kn
	+v9PB4fL/k9dKigWNx3dlMJnggVrVGZf0qAsQb8kfP3eJ8BEJA+ahjTIyHp2dRMjxWRNJSY2ptm2B
	SEp+3poR4nnttJ92rVtigJ2l024kUzYMQSO61fQrwDR86js32ZvlkN2dNVL/BcDq4LQ51TBunnw8Y
	ZCtUTxz76ATt+jri2NqK539eYVH1wZMP0lXqVNOlqeX2U5+2ij2e9cZSDy+MJzWgPGsBMFESKwxnq
	+P/Ylngg==;
From: David Woodhouse <dwmw2@infradead.org>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Sean Christopherson <seanjc@google.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Vitaly Kuznetsov <vkuznets@redhat.com>,
	Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Paul Durrant <paul@xen.org>,
	Jonathan Cameron <jic23@kernel.org>,
	Sascha Bischoff <Sascha.Bischoff@arm.com>,
	Marc Zyngier <maz@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Jack Allister <jalliste@amazon.com>,
	Dongli Zhang <dongli.zhang@oracle.com>,
	joe.jin@oracle.com,
	kvm@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH v5 31/34] KVM: x86: Use ktime_get_snapshot_id() for master clock
Date: Mon,  8 Jun 2026 15:48:12 +0100
Message-ID: <20260608145455.89187-32-dwmw2@infradead.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260608145455.89187-1-dwmw2@infradead.org>
References: <20260608145455.89187-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: David Woodhouse <dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
X-purgate-ID: tlsNG-ebf023/1780930512-433673FF-713DFB6D/0/0
X-purgate-type: clean
X-purgate-size: 3751

From: David Woodhouse <dwmw@amazon.co.uk>

Replace the KVM-private vgettsc()/do_kvmclock_base()/do_monotonic()/
do_realtime() timekeeping reimplementation with calls to the generic
ktime_get_snapshot_id() interface.

The snapshot provides both the system time and the raw_cycles (TSC)
atomically paired. When raw_cycles is zero, the clocksource could not
provide a raw hardware counter value, which is equivalent to the
previous vgettsc() returning VDSO_CLOCKMODE_NONE.

For kvm_get_time_and_clockread(), the kvmclock base time is
CLOCK_MONOTONIC_RAW + offs_boot. The snapshot provides the raw time
atomically paired with the TSC; offs_boot is added separately as it
only changes at suspend/resume boundaries.

This is a step towards eliminating the pvclock_gtod_data private copy
of timekeeping state and the associated notifier callback.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
Assisted-by: Kiro:claude-opus-4.6-1m
---
 arch/x86/kvm/x86.c | 46 +++++++++++++++++++++++++++++++++++-----------
 1 file changed, 35 insertions(+), 11 deletions(-)

diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 96250264d403..2713aebb96ae 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -35,6 +35,7 @@
 #include "smm.h"
 
 #include <linux/clocksource.h>
+#include <linux/timekeeping.h>
 #include <linux/interrupt.h>
 #include <linux/kvm.h>
 #include <linux/fs.h>
@@ -3162,14 +3163,32 @@ static int do_realtime(struct timespec64 *ts, u64 *tsc_timestamp)
  * reports the TSC value from which it do so. Returns true if host is
  * using TSC based clocksource.
  */
+static bool kvm_snapshot_has_tsc(struct system_time_snapshot *snap,
+				u64 *tsc_timestamp)
+{
+	if (snap->cs_id == CSID_X86_TSC) {
+		*tsc_timestamp = snap->cycles;
+		return true;
+	}
+
+	if (snap->hw_csid == CSID_X86_TSC && snap->hw_cycles) {
+		*tsc_timestamp = snap->hw_cycles;
+		return true;
+	}
+
+	return false;
+}
+
 static bool kvm_get_time_and_clockread(s64 *kernel_ns, u64 *tsc_timestamp)
 {
-	/* checked again under seqlock below */
-	if (!gtod_is_based_on_tsc(pvclock_gtod_data.clock.vclock_mode))
+	struct system_time_snapshot snap;
+
+	ktime_get_snapshot_id(CLOCK_MONOTONIC_RAW, &snap);
+	if (!kvm_snapshot_has_tsc(&snap, tsc_timestamp))
 		return false;
 
-	return gtod_is_based_on_tsc(do_kvmclock_base(kernel_ns,
-						     tsc_timestamp));
+	*kernel_ns = ktime_to_ns(ktime_mono_to_any(snap.systime, TK_OFFS_BOOT));
+	return true;
 }
 
 /*
@@ -3178,12 +3197,14 @@ static bool kvm_get_time_and_clockread(s64 *kernel_ns, u64 *tsc_timestamp)
  */
 bool kvm_get_monotonic_and_clockread(s64 *kernel_ns, u64 *tsc_timestamp)
 {
-	/* checked again under seqlock below */
-	if (!gtod_is_based_on_tsc(pvclock_gtod_data.clock.vclock_mode))
+	struct system_time_snapshot snap;
+
+	ktime_get_snapshot_id(CLOCK_MONOTONIC, &snap);
+	if (!kvm_snapshot_has_tsc(&snap, tsc_timestamp))
 		return false;
 
-	return gtod_is_based_on_tsc(do_monotonic(kernel_ns,
-						 tsc_timestamp));
+	*kernel_ns = ktime_to_ns(snap.systime);
+	return true;
 }
 
 /*
@@ -3196,11 +3217,14 @@ bool kvm_get_monotonic_and_clockread(s64 *kernel_ns, u64 *tsc_timestamp)
 static bool kvm_get_walltime_and_clockread(struct timespec64 *ts,
 					   u64 *tsc_timestamp)
 {
-	/* checked again under seqlock below */
-	if (!gtod_is_based_on_tsc(pvclock_gtod_data.clock.vclock_mode))
+	struct system_time_snapshot snap;
+
+	ktime_get_snapshot_id(CLOCK_REALTIME, &snap);
+	if (!kvm_snapshot_has_tsc(&snap, tsc_timestamp))
 		return false;
 
-	return gtod_is_based_on_tsc(do_realtime(ts, tsc_timestamp));
+	*ts = ktime_to_timespec64(snap.systime);
+	return true;
 }
 #endif
 
-- 
2.54.0


