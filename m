Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECBC960730BB
	for <xen-devel@archiver.kernel.org>; Thu,  5 Nov 2026 15:50:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=pazvH9hx
Received: from list by lists.xenproject.org with outflank-mailman.1475011.1681951 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOzjD-0006AI-RI; Thu, 05 Nov 2026 15:50:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1475011.1681951; Thu, 05 Nov 2026 15:50:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOzjC-00064e-Jj; Thu, 05 Nov 2026 15:50:14 +0000
Received: by outflank-mailman (input) for mailman id 1475011;
 Thu, 05 Nov 2026 15:50:07 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <BATV+4c1d8b341febb4002902+8474+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1xOzj4-0004Nj-QB
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 15:50:06 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOzj4-00ErBr-6D; Thu, 05 Nov 2026 16:50:06 +0100
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <BATV+4c1d8b341febb4002902+8474+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 6aeca595-e002-0a2a0a5209dd-0a2a4501df4c-42
 for <multiple-recipients>; Thu, 05 Nov 2026 16:50:06 +0100
Received: from [90.155.92.199] (helo=desiato.infradead.org)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <BATV+4c1d8b341febb4002902+8474+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 6aeca5a8-5984-0a2a45010019-5a9b5cc7c42e-3
 for <multiple-recipients>; Thu, 05 Nov 2026 16:50:00 +0100
Received: from [2001:8b0:10b:1::425] (helo=i7.infradead.org)
 by desiato.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
 id 1xOziw-00000003BoB-28TF; Thu, 05 Nov 2026 15:49:58 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.99.5 #2 (Red
 Hat Linux)) id 1xOziu-0000000Ab0H-2luc;
 Thu, 05 Nov 2026 15:49:56 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=desiato.20200630 header.d=infradead.org header.i="@infradead.org" header.h="Sender:Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description;
	bh=H+VBL9OJwUW+IzdV5LCITp9ezCq4N+iWOV0zwHTcOS8=; b=pazvH9hxp0r4Z7x2fzidl01Hpa
	P7wfwrljfAb/Lw918WuBSOv8YJshJq6pYjO3ssKu6okTF0iVV4XBQo+hZWgnwccv2CAjUTg++/O6Y
	Jm2FJhdd0LjBfDn6z+gpiQ7ClNXBgG9Poghhm3yZCt1FB2xFVkglSXP0QcmT4kein89a6m/hOUpvk
	jk3/j6J3kuSXBe1DzWg3+zWyKqdsG0RfdrU4gcHp5P2uVquu7KgCbdQ8L0+cl8lzsmZF8PvXSLATO
	iufzdzQ/Qvg8teerPslEYc8jhRp0IoetEIfgOU3N7yYN4/Bp2VoYQUubQtE7tZqOt3eCF4K3wEAXD
	6OWPWcsw==;
From: David Woodhouse <dwmw2@infradead.org>
To: kvm@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-doc@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	x86@kernel.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>,
	Paul Durrant <paul@xen.org>,
	Vitaly Kuznetsov <vkuznets@redhat.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Sascha Bischoff <Sascha.Bischoff@arm.com>,
	Marc Zyngier <maz@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Jack Allister <jalliste@amazon.com>,
	Dongli Zhang <dongli.zhang@oracle.com>,
	joe.jin@oracle.com,
	David Woodhouse <dwmw@amazon.co.uk>
Subject: [PATCH v11 22/23] KVM: x86/xen: Drop open-coded fallback clock read in kvm_xen_start_timer()
Date: Thu,  5 Nov 2026 07:49:53 -0800
Message-ID: <20261105154955.2525419-23-dwmw2@infradead.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261105154955.2525419-1-dwmw2@infradead.org>
References: <20261105154955.2525419-1-dwmw2@infradead.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: David Woodhouse <dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by desiato.infradead.org. See http://www.infradead.org/rpr.html
X-purgate-ID: tlsNG-d62444/1793893806-C5146757-1BADBFBE/0/0
X-purgate-type: clean
X-purgate-size: 4429
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: David Woodhouse <dwmw@amazon.co.uk>

When no coherent (CLOCK_MONOTONIC, TSC) pair was available,
kvm_xen_start_timer() computed one from separate ktime_get() and
rdtsc() calls rather than using get_kvmclock_ns(), with a comment
explaining that the latter had a systemic error from scaling host TSC
directly to nanoseconds instead of scaling to the guest TSC first.

Commit abdef42276d8 ("KVM: x86: Fix KVM clock precision in
get_kvmclock() with TSC scaling") removed that systemic error: in
master clock mode, get_kvmclock_ns() now scales the host TSC delta to
the guest TSC and converts it with the guest's own mul/shift,
computing precisely what the guest would.

The fallback is also nearly unreachable. It sits behind the
use_master_clock check, so on 32-bit (where the master clock is never
active) it is dead code, and on 64-bit kvm_get_monotonic_and_clockread()
can only fail there if the host clocksource changed after the last
master clock update, in the window before the resulting masterclock
update is processed. In exactly that window get_kvmclock_ns() takes
its raw-clock fallback path rather than the guest TSC computation,
which is continuous with the last valid snapshot and tolerable for
the one timer that can be started before the pending masterclock
update lands.

Drop it and fall back to the existing get_kvmclock_ns() path.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 arch/x86/kvm/xen.c | 40 +++++++++++++++++++---------------------
 1 file changed, 19 insertions(+), 21 deletions(-)

diff --git a/arch/x86/kvm/xen.c b/arch/x86/kvm/xen.c
index 6aa00f746cba..dbac3d2c04d7 100644
--- a/arch/x86/kvm/xen.c
+++ b/arch/x86/kvm/xen.c
@@ -230,22 +230,19 @@ static void kvm_xen_start_timer(struct kvm_vcpu *vcpu, u64 guest_abs,
 		if (r)
 			break;
 
+		/*
+		 * With use_master_clock set, the clocksource was TSC-based
+		 * when the master clock was last updated. The clockread can
+		 * only fail here if the clocksource has changed since, in
+		 * which case a masterclock update is already pending and
+		 * get_kvmclock_ns() returns the raw-clock fallback value —
+		 * continuous with the last valid snapshot, which is as good
+		 * as it gets in that transient window.
+		 */
 		if (!IS_ENABLED(CONFIG_64BIT) ||
 		    !kvm_get_monotonic_and_clockread(&kernel_now, &host_tsc)) {
-			/*
-			 * Don't fall back to get_kvmclock_ns() because it's
-			 * broken; it has a systemic error in its results
-			 * because it scales directly from host TSC to
-			 * nanoseconds, and doesn't scale first to guest TSC
-			 * and *then* to nanoseconds as the guest does.
-			 *
-			 * There is a small error introduced here because time
-			 * continues to elapse between the ktime_get() and the
-			 * subsequent rdtsc(). But not the systemic drift due
-			 * to get_kvmclock_ns().
-			 */
-			kernel_now = ktime_get(); /* This is CLOCK_MONOTONIC */
-			host_tsc = rdtsc();
+			r = -EOPNOTSUPP;
+			break;
 		}
 
 		/* Calculate the guest kvmclock as the guest would do it. */
@@ -255,18 +252,19 @@ static void kvm_xen_start_timer(struct kvm_vcpu *vcpu, u64 guest_abs,
 
 	if (r) {
 		/*
-		 * Without CONSTANT_TSC, get_kvmclock_ns() is the only option.
+		 * Without CONSTANT_TSC and the master clock,
+		 * get_kvmclock_ns() is the only option.
 		 *
 		 * Also if the guest PV clock hasn't been set up yet, as is
 		 * likely to be the case during migration when the vCPU has
 		 * not been run yet. It would be possible to calculate the
 		 * scaling factors properly in that case but there's not much
-		 * point in doing so. The get_kvmclock_ns() drift accumulates
-		 * over time, so it's OK to use it at startup. Besides, on
-		 * migration there's going to be a little bit of skew in the
-		 * precise moment at which timers fire anyway. Often they'll
-		 * be in the "past" by the time the VM is running again after
-		 * migration.
+		 * point in doing so. Without the master clock, the
+		 * get_kvmclock_ns() drift accumulates over time, so it's OK
+		 * to use it at startup. Besides, on migration there's going
+		 * to be a little bit of skew in the precise moment at which
+		 * timers fire anyway. Often they'll be in the "past" by the
+		 * time the VM is running again after migration.
 		 */
 		guest_now = get_kvmclock_ns(vcpu->kvm);
 		kernel_now = ktime_get();
-- 
2.43.0


