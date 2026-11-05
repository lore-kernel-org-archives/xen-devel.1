Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B9CA606E542
	for <xen-devel@archiver.kernel.org>; Thu,  5 Nov 2026 15:50:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=YwnXHIWz
Received: from list by lists.xenproject.org with outflank-mailman.1474995.1681844 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOzj0-000399-O7; Thu, 05 Nov 2026 15:50:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1474995.1681844; Thu, 05 Nov 2026 15:50:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOzj0-00038b-K7; Thu, 05 Nov 2026 15:50:02 +0000
Received: by outflank-mailman (input) for mailman id 1474995;
 Thu, 05 Nov 2026 15:50:01 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <BATV+a10630623031064a0c86+8474+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1xOziy-0002t6-Qe
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 15:50:01 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOzix-00Er7K-8Y; Thu, 05 Nov 2026 16:49:59 +0100
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <BATV+a10630623031064a0c86+8474+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 6aeca595-e002-0a2a0a5209dd-0a2a4501df4c-18
 for <multiple-recipients>; Thu, 05 Nov 2026 16:49:59 +0100
Received: from [90.155.50.34] (helo=casper.infradead.org)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <BATV+a10630623031064a0c86+8474+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 6aeca5a6-5984-0a2a45010019-5a9b3222a2d8-3
 for <multiple-recipients>; Thu, 05 Nov 2026 16:49:58 +0100
Received: from [2001:8b0:10b:1::425] (helo=i7.infradead.org)
 by casper.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
 id 1xOzit-00000009aoj-3hfm; Thu, 05 Nov 2026 15:49:56 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.99.5 #2 (Red
 Hat Linux)) id 1xOzit-0000000Aaz2-2pvF;
 Thu, 05 Nov 2026 15:49:55 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=casper.20170209 header.d=infradead.org header.i="@infradead.org" header.h="Sender:Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description;
	bh=Fa5d4hF5b5g+cGGwa12UfyQs3OVoKCl+cYn2uuRhZjo=; b=YwnXHIWzvBYN9n4rVYggcXWgRc
	Z5T6VuZ6WDUaeWPsQh9E0B2YNYCK2WY0r4Np1IPStzrOa81QjNkLHVMewQVjM2g7x/zvWSN0m6hoM
	eP++2oV1qnVdrFZxAtlbOY2oK2mjdbxDEmCQwaCIC3UfqFeIHCukbZ9rQiM6dWsdpFRhVgt2T1Xhd
	QXjmq8l600NAeFYOf/G+EDpgCyR7jMu49EHj4INvehN4g4vABeQVBFk5NyPnG8s9h/L2GR570Sp1c
	YqYc+Sh6QKuEaE9Rbts9YSuwqVNXsImVewgSOK076uldTgrPQxg7g9WvZSKeqL8kXryMjpf/JhHkR
	NEWC7k4g==;
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
Subject: [PATCH v11 05/23] KVM: x86: Factor out kvm_use_master_clock()
Date: Thu,  5 Nov 2026 07:49:36 -0800
Message-ID: <20261105154955.2525419-6-dwmw2@infradead.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261105154955.2525419-1-dwmw2@infradead.org>
References: <20261105154955.2525419-1-dwmw2@infradead.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: David Woodhouse <dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
X-purgate-ID: tlsNG-d62444/1793893799-1D272757-762A7ABF/0/0
X-purgate-type: clean
X-purgate-size: 4291
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: David Woodhouse <dwmw@amazon.co.uk>

Both kvm_track_tsc_matching() and pvclock_update_vm_gtod_copy() make a
decision about whether the KVM clock should be in master clock mode.
They used *different* criteria for the decision though. This isn't
really a problem; it only has the potential to cause unnecessary
invocations of KVM_REQ_MASTERCLOCK_UPDATE if the masterclock was
disabled due to TSC going backwards, or the guest using the old MSR.
But it isn't pretty.

Factor the decision out to a single function. And document the
historical reason why it's disabled for guests that use the old
MSR_KVM_SYSTEM_TIME.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
Reviewed-by: Paul Durrant <paul@xen.org>
---
 arch/x86/kvm/x86.c | 40 ++++++++++++++++++++++++++++++----------
 1 file changed, 30 insertions(+), 10 deletions(-)

diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 38fcb1d75661..4c3fce29e2af 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -1112,11 +1112,30 @@ static inline bool gtod_is_based_on_tsc(int mode)
 {
 	return mode == VDSO_CLOCKMODE_TSC || mode == VDSO_CLOCKMODE_HVCLOCK;
 }
-#endif
+
+static bool kvm_use_master_clock(struct kvm *kvm)
+{
+	struct kvm_arch *ka = &kvm->arch;
+
+	/*
+	 * The 'old kvmclock' check is a workaround (from 2015) for a
+	 * SUSE 2.6.16 kernel that didn't boot if the system_time in
+	 * its kvmclock was too far behind the current time. So the
+	 * mode of just setting the reference point and allowing time
+	 * to proceed linearly from there makes it fail to boot.
+	 * Despite that being kind of the *point* of the way the clock
+	 * is exposed to the guest. By coincidence, the offending
+	 * kernels used the old MSR_KVM_SYSTEM_TIME, which was moved
+	 * only because it resided in the wrong number range. So the
+	 * workaround is activated for *all* guests using the old MSR.
+	 */
+	return ka->all_vcpus_matched_freq &&
+		!ka->backwards_tsc_observed &&
+		!ka->boot_vcpu_runs_old_kvmclock;
+}
 
 static void kvm_track_tsc_matching(struct kvm_vcpu *vcpu, bool update_mclock)
 {
-#ifdef CONFIG_X86_64
 	struct kvm_arch *ka = &vcpu->kvm->arch;
 	struct pvclock_gtod_data *gtod = &pvclock_gtod_data;
 	bool prev_matched_tsc = ka->all_vcpus_matched_tsc;
@@ -1162,7 +1181,7 @@ static void kvm_track_tsc_matching(struct kvm_vcpu *vcpu, bool update_mclock)
 	 * are fine — each vCPU's pvclock has its own tsc_timestamp that
 	 * accounts for its offset.
 	 */
-	bool use_master_clock = ka->all_vcpus_matched_freq &&
+	bool use_master_clock = kvm_use_master_clock(vcpu->kvm) &&
 				gtod_is_based_on_tsc(gtod->clock.vclock_mode);
 
 	/*
@@ -1177,8 +1196,11 @@ static void kvm_track_tsc_matching(struct kvm_vcpu *vcpu, bool update_mclock)
 	trace_kvm_track_tsc(vcpu->vcpu_id, ka->nr_vcpus_matched_tsc,
 			    atomic_read(&vcpu->kvm->online_vcpus),
 		            ka->use_master_clock, gtod->clock.vclock_mode);
-#endif
 }
+#else
+static inline void kvm_track_tsc_matching(struct kvm_vcpu *vcpu,
+					  bool update_mclock) {}
+#endif
 
 /*
  * Multiply tsc by a fixed point number represented by ratio.
@@ -1640,10 +1662,9 @@ static void pvclock_update_vm_gtod_copy(struct kvm *kvm)
 #ifdef CONFIG_X86_64
 	struct kvm_arch *ka = &kvm->arch;
 	int vclock_mode;
-	bool host_tsc_clocksource, vcpus_matched;
+	bool host_tsc_clocksource;
 
 	lockdep_assert_held(&kvm->arch.tsc_write_lock);
-	vcpus_matched = ka->all_vcpus_matched_freq;
 
 	/*
 	 * If the host uses TSC clock, then passthrough TSC as stable
@@ -1653,9 +1674,8 @@ static void pvclock_update_vm_gtod_copy(struct kvm *kvm)
 					&ka->master_kernel_ns,
 					&ka->master_cycle_now);
 
-	ka->use_master_clock = host_tsc_clocksource && vcpus_matched
-				&& !ka->backwards_tsc_observed
-				&& !ka->boot_vcpu_runs_old_kvmclock;
+	ka->use_master_clock = host_tsc_clocksource &&
+				kvm_use_master_clock(kvm);
 
 	if (ka->use_master_clock) {
 		u64 tsc_hz;
@@ -1683,7 +1703,7 @@ static void pvclock_update_vm_gtod_copy(struct kvm *kvm)
 
 	vclock_mode = pvclock_gtod_data.clock.vclock_mode;
 	trace_kvm_update_master_clock(ka->use_master_clock, vclock_mode,
-					vcpus_matched);
+					ka->all_vcpus_matched_freq);
 #endif
 }
 
-- 
2.43.0


