Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51316CD8CAB
	for <xen-devel@archiver.kernel.org>; Mon,  8 Jun 2026 14:55:41 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1331719.1594400 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wWbNy-00058Z-6g; Mon, 08 Jun 2026 14:55:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1331719.1594400; Mon, 08 Jun 2026 14:55:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wWbNx-00051c-05; Mon, 08 Jun 2026 14:55:29 +0000
Received: by outflank-mailman (input) for mailman id 1331719;
 Mon, 08 Jun 2026 14:55:18 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <BATV+614c7b1bd25833f05746+8324+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1wWbNl-0002Y7-QD
 for xen-devel@lists.xenproject.org; Mon, 08 Jun 2026 14:55:17 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wWbNl-008Spg-6X; Mon, 08 Jun 2026 16:55:17 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <BATV+614c7b1bd25833f05746+8324+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 6a26d7d4-e002-0a2a0a5209dd-0a2a450ba1be-0
 for <multiple-recipients>; Mon, 08 Jun 2026 16:55:16 +0200
Received: from [90.155.92.199] (helo=desiato.infradead.org)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from
 <BATV+614c7b1bd25833f05746+8324+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 6a26d7d3-212f-0a2a450b0019-5a9b5cc7e1ac-3
 for <multiple-recipients>; Mon, 08 Jun 2026 16:55:16 +0200
Received: from [2001:8b0:10b:1::425] (helo=i7.infradead.org)
 by desiato.infradead.org with esmtpsa (Exim 4.99.2 #2 (Red Hat Linux))
 id 1wWbNU-00000001Ag0-2MZo; Mon, 08 Jun 2026 14:55:00 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.99.2 #2 (Red
 Hat Linux)) id 1wWbNS-00000000NFS-0ELi;
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=desiato.20200630 header.d=infradead.org header.i="@infradead.org" header.h="Sender:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description;
	bh=VBMeuRPafAbqaNcAfzTWThuHMwIVcYEzYD/qbdzYY+4=; b=MhrcM22gHWIGol+6qlbmYezfmM
	XrKrpEeMyEMARpHzL8b4zyJDZFJxeeDpbjB+S7Dc+LgeJ1x+Mx512/T8bVoFmaYFReygowb+Sg52c
	GzmiWvmwHu1vCILEQXrtONeEQzOmHbLU7ch4jsc3pW5pK6A6WcQdQWGV4pA25zkl20XN8H9AKbNvi
	Ub7WrGsoCiiil+nxsVLYUxu3bfIdsGYbEcVzuGfP900xvgv7F8uDlzuB6PahsCywZvWrmjRUlS3Co
	moN+EMVubj9V2vl3/8ECg7H8LIIOmzPdwTCkmD/WVCEjEGY7keK/EsiMNUkEDTjMdZvylfqqfvjtk
	OhEcmK9Q==;
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
Subject: [PATCH v5 15/34] KVM: x86: Restructure kvm_guest_time_update() for TSC upscaling
Date: Mon,  8 Jun 2026 15:47:56 +0100
Message-ID: <20260608145455.89187-16-dwmw2@infradead.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260608145455.89187-1-dwmw2@infradead.org>
References: <20260608145455.89187-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: David Woodhouse <dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by desiato.infradead.org. See http://www.infradead.org/rpr.html
X-purgate-ID: tlsNG-42698a/1780930516-1A573F3B-D32E948A/0/0
X-purgate-type: clean
X-purgate-size: 4471

From: David Woodhouse <dwmw@amazon.co.uk>

Restructure kvm_guest_time_update() so that kernel_ns/host_tsc are
always "now" when doing TSC catchup, then swap in the master clock
reference values afterward for the hv_clock.

This makes the TSC upscaling code considerably simpler: the catchup
adjustment is computed as the delta between what the guest TSC *should*
be at "now" and what it actually is, rather than mixing "now" and
"master clock reference" timestamps.

The seqcount loop now also contains the kvm_get_time_and_clockread()
call (matching get_kvmclock's pattern), with the same WARN for
unexpected failure.

Based on a suggestion by Sean Christopherson.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 arch/x86/kvm/x86.c | 74 +++++++++++++++++++++++++++++++++-------------
 1 file changed, 53 insertions(+), 21 deletions(-)

diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 8aae22401046..92e32d720523 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -3363,46 +3363,63 @@ static void kvm_setup_guest_pvclock(struct pvclock_vcpu_time_info *ref_hv_clock,
 int kvm_guest_time_update(struct kvm_vcpu *v)
 {
 	struct pvclock_vcpu_time_info hv_clock = {};
-	unsigned long flags;
 	u64 tgt_tsc_hz;
 	unsigned seq;
 	struct kvm_vcpu_arch *vcpu = &v->arch;
 	struct kvm_arch *ka = &v->kvm->arch;
 	s64 kernel_ns;
 	u64 tsc_timestamp, host_tsc;
+	u64 master_host_tsc = 0;
+	s64 master_kernel_ns = 0;
 	bool use_master_clock;
 
-	kernel_ns = 0;
-	host_tsc = 0;
-
 	/*
 	 * If the host uses TSC clock, then passthrough TSC as stable
 	 * to the guest.
 	 */
 	do {
 		seq = read_seqcount_begin(&ka->pvclock_sc);
+
 		use_master_clock = ka->use_master_clock;
-		if (use_master_clock) {
-			host_tsc = ka->master_cycle_now;
-			kernel_ns = ka->master_kernel_ns;
-		}
+
+		/*
+		 * The TSC read and the call to get_cpu_tsc_khz() must happen
+		 * on the same CPU.
+		 */
+		get_cpu();
+
+		tgt_tsc_hz = (u64)get_cpu_tsc_khz() * 1000;
+
+#ifdef CONFIG_X86_64
+		if (use_master_clock &&
+		    !kvm_get_time_and_clockread(&kernel_ns, &host_tsc) &&
+		    !read_seqcount_retry(&ka->pvclock_sc, seq))
+			use_master_clock = false;
+#endif
+
+		put_cpu();
+
+		if (!use_master_clock)
+			break;
+
+		master_host_tsc = ka->master_cycle_now;
+		master_kernel_ns = ka->master_kernel_ns;
 	} while (read_seqcount_retry(&ka->pvclock_sc, seq));
 
-	/* Keep irq disabled to prevent changes to the clock */
-	local_irq_save(flags);
-	tgt_tsc_hz = (u64)get_cpu_tsc_khz() * 1000;
 	if (unlikely(tgt_tsc_hz == 0)) {
-		local_irq_restore(flags);
 		kvm_make_request(KVM_REQ_CLOCK_UPDATE, v);
 		return 1;
 	}
+
 	if (!use_master_clock) {
+		unsigned long flags;
+
+		local_irq_save(flags);
 		host_tsc = rdtsc();
 		kernel_ns = get_kvmclock_base_ns();
+		local_irq_restore(flags);
 	}
 
-	tsc_timestamp = kvm_read_l1_tsc(v, host_tsc);
-
 	/*
 	 * We may have to catch up the TSC to match elapsed wall clock
 	 * time for two reasons, even if kvmclock is used.
@@ -3411,17 +3428,32 @@ int kvm_guest_time_update(struct kvm_vcpu *v)
 	 *      entry to avoid unknown leaps of TSC even when running
 	 *      again on the same CPU.  This may cause apparent elapsed
 	 *      time to disappear, and the guest to stand still or run
-	 *	very slowly.
+	 *      very slowly.
 	 */
 	if (vcpu->tsc_catchup) {
-		u64 tsc = compute_guest_tsc(v, kernel_ns);
-		if (tsc > tsc_timestamp) {
-			adjust_tsc_offset_guest(v, tsc - tsc_timestamp);
-			tsc_timestamp = tsc;
-		}
+		s64 adjustment;
+
+		/*
+		 * Calculate the delta between what the guest TSC *should* be
+		 * and what it actually is according to kvm_read_l1_tsc().
+		 */
+		adjustment = compute_guest_tsc(v, kernel_ns) -
+			     kvm_read_l1_tsc(v, host_tsc);
+		if (adjustment > 0)
+			adjust_tsc_offset_guest(v, adjustment);
 	}
 
-	local_irq_restore(flags);
+	/*
+	 * Now that TSC upscaling is out of the way, the remaining calculations
+	 * are all relative to the reference time that's placed in hv_clock.
+	 * If the master clock is NOT in use, the reference time is "now".  If
+	 * master clock is in use, the reference time comes from there.
+	 */
+	if (use_master_clock) {
+		host_tsc = master_host_tsc;
+		kernel_ns = master_kernel_ns;
+	}
+	tsc_timestamp = kvm_read_l1_tsc(v, host_tsc);
 
 	/* With all the info we got, fill in the values */
 
-- 
2.54.0


