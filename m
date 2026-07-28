Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C47CC53219
	for <xen-devel@archiver.kernel.org>; Tue, 28 Jul 2026 14:51:17 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1374534.1621922 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1woj96-0007hN-RL; Tue, 28 Jul 2026 14:51:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1374534.1621922; Tue, 28 Jul 2026 14:51:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1woj94-0007Yz-Mk; Tue, 28 Jul 2026 14:51:02 +0000
Received: by outflank-mailman (input) for mailman id 1374534;
 Tue, 28 Jul 2026 14:50:29 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <BATV+a16dffe8eb885fac2cd9+8374+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1woj8V-0000WW-Vy
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2026 14:50:28 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1woj8V-00BbHr-Am; Tue, 28 Jul 2026 16:50:27 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <BATV+a16dffe8eb885fac2cd9+8374+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 6a68c1a9-2eae-0a2a0a5409dd-0a2a45078656-20
 for <multiple-recipients>; Tue, 28 Jul 2026 16:50:22 +0200
Received: from [90.155.50.34] (helo=casper.infradead.org)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <BATV+a16dffe8eb885fac2cd9+8374+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 6a68c1ae-b4ea-0a2a45070019-5a9b3222b09e-3
 for <multiple-recipients>; Tue, 28 Jul 2026 16:50:22 +0200
Received: from [2001:8b0:10b:1::425] (helo=i7.infradead.org)
 by casper.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
 id 1woj80-0000000DUOw-1snW; Tue, 28 Jul 2026 14:49:57 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.99.4 #2 (Red
 Hat Linux)) id 1woj80-00000001UZZ-0zXB;
 Tue, 28 Jul 2026 15:49:56 +0100
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
	bh=T+gT8e4xECKcvamuWd/Aq+3FmqUt6jn6kCqAQ3O0W/4=; b=i8lqf2S20ph7yBPDQrb2fKRyd+
	o8LVfrfuJYUuCLUQO0xAYWEbvlaA/m24dPiT+9Xi1TcwZn9UDuIqY2laVKoX0C4FqtBRBD0x/HI+5
	Bd9tepx0jJmRUKGrnVlL0hNkgHV7GbPg6SokjPW1KlUF9Tiem2m30Bgg0vOMcxaQCWNeSuNN0Pth9
	u/EcRYZ06pkA5KjTqncLqciDYyjcszl5CnRwkWHF77hm6Hed1hn8hnfEfsd3RScNFRbVXxahMqGH1
	ZvmL7W2bPFZWSOMO0u23p55xLxFp/8PHDZHEpxj7a34XLbfo2AJk9pECVq2w9rjqEwa8e5GTg/6Zm
	VSjGeyzA==;
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
Subject: [PATCH v7 27/36] KVM: x86: Remove pvclock_gtod_data and private timekeeping code
Date: Tue, 28 Jul 2026 15:40:07 +0100
Message-ID: <20260728144954.355376-28-dwmw2@infradead.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260728144954.355376-1-dwmw2@infradead.org>
References: <20260728144954.355376-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: David Woodhouse <dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
X-purgate-ID: tlsNG-ef75cf/1785250222-36CDFAE4-BF201C33/0/0
X-purgate-type: clean
X-purgate-size: 6490

From: David Woodhouse <dwmw@amazon.co.uk>

Remove the now-unused KVM-private timekeeping infrastructure:

 - struct pvclock_clock and struct pvclock_gtod_data
 - update_pvclock_gtod() and its seqcount-protected state copy
 - read_tsc() (KVM's private TSC reader with cycle_last clamping)
 - vgettsc() (KVM's private clocksource interpolation)
 - do_kvmclock_base(), do_monotonic(), do_realtime()

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
Assisted-by: Kiro:claude-opus-4.6-1m
---
 arch/x86/kvm/x86.c | 178 +--------------------------------------------
 1 file changed, 1 insertion(+), 177 deletions(-)

diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index ee992c073b6d..e8e75e47fc33 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -878,58 +878,6 @@ static inline bool kvm_vcpu_exit_request(struct kvm_vcpu *vcpu)
 	       kvm_request_pending(vcpu) || xfer_to_guest_mode_work_pending();
 }
 
-struct pvclock_clock {
-	int vclock_mode;
-	u64 cycle_last;
-	u64 mask;
-	u32 mult;
-	u32 shift;
-	u64 base_cycles;
-	u64 offset;
-};
-
-struct pvclock_gtod_data {
-	seqcount_t	seq;
-
-	struct pvclock_clock clock; /* extract of a clocksource struct */
-	struct pvclock_clock raw_clock; /* extract of a clocksource struct */
-
-	ktime_t		offs_boot;
-	u64		wall_time_sec;
-};
-
-static struct pvclock_gtod_data pvclock_gtod_data;
-
-static void update_pvclock_gtod(struct timekeeper *tk)
-{
-	struct pvclock_gtod_data *vdata = &pvclock_gtod_data;
-
-	write_seqcount_begin(&vdata->seq);
-
-	/* copy pvclock gtod data */
-	vdata->clock.vclock_mode	= tk->tkr_mono.clock->vdso_clock_mode;
-	vdata->clock.cycle_last		= tk->tkr_mono.cycle_last;
-	vdata->clock.mask		= tk->tkr_mono.mask;
-	vdata->clock.mult		= tk->tkr_mono.mult;
-	vdata->clock.shift		= tk->tkr_mono.shift;
-	vdata->clock.base_cycles	= tk->tkr_mono.xtime_nsec;
-	vdata->clock.offset		= tk->tkr_mono.base;
-
-	vdata->raw_clock.vclock_mode	= tk->tkr_raw.clock->vdso_clock_mode;
-	vdata->raw_clock.cycle_last	= tk->tkr_raw.cycle_last;
-	vdata->raw_clock.mask		= tk->tkr_raw.mask;
-	vdata->raw_clock.mult		= tk->tkr_raw.mult;
-	vdata->raw_clock.shift		= tk->tkr_raw.shift;
-	vdata->raw_clock.base_cycles	= tk->tkr_raw.xtime_nsec;
-	vdata->raw_clock.offset		= tk->tkr_raw.base;
-
-	vdata->wall_time_sec            = tk->xtime_sec;
-
-	vdata->offs_boot		= tk->offs_boot;
-
-	write_seqcount_end(&vdata->seq);
-}
-
 static s64 get_kvmclock_base_ns(void)
 {
 	/* Count up from boot time, but with the frequency of the raw clock.  */
@@ -1472,128 +1420,6 @@ void kvm_synchronize_tsc(struct kvm_vcpu *vcpu, u64 *user_value)
 
 #ifdef CONFIG_X86_64
 
-static u64 read_tsc(void)
-{
-	u64 ret = (u64)rdtsc_ordered();
-	u64 last = pvclock_gtod_data.clock.cycle_last;
-
-	if (likely(ret >= last))
-		return ret;
-
-	/*
-	 * GCC likes to generate cmov here, but this branch is extremely
-	 * predictable (it's just a function of time and the likely is
-	 * very likely) and there's a data dependence, so force GCC
-	 * to generate a branch instead.  I don't barrier() because
-	 * we don't actually need a barrier, and if this function
-	 * ever gets inlined it will generate worse code.
-	 */
-	asm volatile ("");
-	return last;
-}
-
-static inline u64 vgettsc(struct pvclock_clock *clock, u64 *tsc_timestamp,
-			  int *mode)
-{
-	u64 tsc_pg_val;
-	long v;
-
-	switch (clock->vclock_mode) {
-	case VDSO_CLOCKMODE_HVCLOCK:
-		if (hv_read_tsc_page_tsc(hv_get_tsc_page(),
-					 tsc_timestamp, &tsc_pg_val)) {
-			/* TSC page valid */
-			*mode = VDSO_CLOCKMODE_HVCLOCK;
-			v = (tsc_pg_val - clock->cycle_last) &
-				clock->mask;
-		} else {
-			/* TSC page invalid */
-			*mode = VDSO_CLOCKMODE_NONE;
-		}
-		break;
-	case VDSO_CLOCKMODE_TSC:
-		*mode = VDSO_CLOCKMODE_TSC;
-		*tsc_timestamp = read_tsc();
-		v = (*tsc_timestamp - clock->cycle_last) &
-			clock->mask;
-		break;
-	default:
-		*mode = VDSO_CLOCKMODE_NONE;
-	}
-
-	if (*mode == VDSO_CLOCKMODE_NONE)
-		*tsc_timestamp = v = 0;
-
-	return v * clock->mult;
-}
-
-/*
- * As with get_kvmclock_base_ns(), this counts from boot time, at the
- * frequency of CLOCK_MONOTONIC_RAW (hence adding gtos->offs_boot).
- */
-static int do_kvmclock_base(s64 *t, u64 *tsc_timestamp)
-{
-	struct pvclock_gtod_data *gtod = &pvclock_gtod_data;
-	unsigned long seq;
-	int mode;
-	u64 ns;
-
-	do {
-		seq = read_seqcount_begin(&gtod->seq);
-		ns = gtod->raw_clock.base_cycles;
-		ns += vgettsc(&gtod->raw_clock, tsc_timestamp, &mode);
-		ns >>= gtod->raw_clock.shift;
-		ns += ktime_to_ns(ktime_add(gtod->raw_clock.offset, gtod->offs_boot));
-	} while (unlikely(read_seqcount_retry(&gtod->seq, seq)));
-	*t = ns;
-
-	return mode;
-}
-
-/*
- * This calculates CLOCK_MONOTONIC at the time of the TSC snapshot, with
- * no boot time offset.
- */
-static int do_monotonic(s64 *t, u64 *tsc_timestamp)
-{
-	struct pvclock_gtod_data *gtod = &pvclock_gtod_data;
-	unsigned long seq;
-	int mode;
-	u64 ns;
-
-	do {
-		seq = read_seqcount_begin(&gtod->seq);
-		ns = gtod->clock.base_cycles;
-		ns += vgettsc(&gtod->clock, tsc_timestamp, &mode);
-		ns >>= gtod->clock.shift;
-		ns += ktime_to_ns(gtod->clock.offset);
-	} while (unlikely(read_seqcount_retry(&gtod->seq, seq)));
-	*t = ns;
-
-	return mode;
-}
-
-static int do_realtime(struct timespec64 *ts, u64 *tsc_timestamp)
-{
-	struct pvclock_gtod_data *gtod = &pvclock_gtod_data;
-	unsigned long seq;
-	int mode;
-	u64 ns;
-
-	do {
-		seq = read_seqcount_begin(&gtod->seq);
-		ts->tv_sec = gtod->wall_time_sec;
-		ns = gtod->clock.base_cycles;
-		ns += vgettsc(&gtod->clock, tsc_timestamp, &mode);
-		ns >>= gtod->clock.shift;
-	} while (unlikely(read_seqcount_retry(&gtod->seq, seq)));
-
-	ts->tv_sec += __iter_div_u64_rem(ns, NSEC_PER_SEC, &ns);
-	ts->tv_nsec = ns;
-
-	return mode;
-}
-
 /*
  * Calculates the kvmclock_base_ns (CLOCK_MONOTONIC_RAW + boot time) and
  * reports the TSC value from which it do so. Returns true if host is
@@ -7070,11 +6896,9 @@ static DEFINE_IRQ_WORK(pvclock_irq_work, pvclock_irq_work_fn);
 static int pvclock_gtod_notify(struct notifier_block *nb, unsigned long unused,
 			       void *priv)
 {
+#ifdef CONFIG_X86_64
 	struct timekeeper *tk = priv;
 
-	update_pvclock_gtod(tk);
-
-#ifdef CONFIG_X86_64
 	kvm_host_vclock_mode =
 		tk->tkr_mono.clock->vdso_clock_mode;
 
-- 
2.55.0


