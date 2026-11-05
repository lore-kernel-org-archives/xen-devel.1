Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CE5F6070783
	for <xen-devel@archiver.kernel.org>; Thu,  5 Nov 2026 15:50:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=wJOQVik5
Received: from list by lists.xenproject.org with outflank-mailman.1475006.1681911 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOzj8-00051K-0f; Thu, 05 Nov 2026 15:50:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1475006.1681911; Thu, 05 Nov 2026 15:50:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOzj7-0004zW-ET; Thu, 05 Nov 2026 15:50:09 +0000
Received: by outflank-mailman (input) for mailman id 1475006;
 Thu, 05 Nov 2026 15:50:05 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <BATV+a10630623031064a0c86+8474+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1xOzj3-0003vk-6B
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 15:50:05 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOzj2-00B7sn-In; Thu, 05 Nov 2026 16:50:04 +0100
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <BATV+a10630623031064a0c86+8474+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 6aeca5ab-2eae-0a2a0a5409dd-0a2a4504ba48-6
 for <multiple-recipients>; Thu, 05 Nov 2026 16:50:04 +0100
Received: from [90.155.50.34] (helo=casper.infradead.org)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <BATV+a10630623031064a0c86+8474+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 6aeca5a6-b57f-0a2a45040019-5a9b3222de26-3
 for <multiple-recipients>; Thu, 05 Nov 2026 16:49:58 +0100
Received: from [2001:8b0:10b:1::425] (helo=i7.infradead.org)
 by casper.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
 id 1xOzit-00000009aog-3EQm; Thu, 05 Nov 2026 15:49:55 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.99.5 #2 (Red
 Hat Linux)) id 1xOzit-0000000Aays-2HEO;
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
	bh=h7IHIRRM4XFq6GwXgluit19dquWavUx85ZLuD079Loc=; b=wJOQVik5uP7OzAC5hZCitvfvF0
	4Thd8CLgIpOlwvCfnb6BOX4rc0TukNFuOPsOx3/UrpS3NUXN7vhvsItwvt0Xb4rXkNUC2TNWc043u
	T3eK2BL1xtTetnGeKdhOWYxTPWpTwt5iXQxe278C36OP6PNO88vmYSoUJUPdrTc6/DXtYrkXNBsnV
	RR3YzmQg+ZLuJpAXGELumrxRv3mTGdnI0JTdKCRxVgOKpeVEckfVd52Hy/PV0awnb2xCWs0pRd+bP
	OkmqqbnTzNpxquMdiwgJ5cVsywOvGE9TeLptWJMVexyFIU0ltrJdza9vVbytkS9z0OjrVR+iZV1b9
	PJDxaiVw==;
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
Subject: [PATCH v11 03/23] KVM: x86: Replace nr_vcpus_matched_tsc count with all_vcpus_matched_tsc bool
Date: Thu,  5 Nov 2026 07:49:34 -0800
Message-ID: <20261105154955.2525419-4-dwmw2@infradead.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261105154955.2525419-1-dwmw2@infradead.org>
References: <20261105154955.2525419-1-dwmw2@infradead.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: David Woodhouse <dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
X-purgate-ID: tlsNG-ebf023/1793893803-585C7B50-3F2BE8AD/0/0
X-purgate-type: clean
X-purgate-size: 4215
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: David Woodhouse <dwmw@amazon.co.uk>

Using a count and comparing with kvm->online_vcpus was always racy
because a new vCPU could be created while kvm_track_tsc_matching() was
running and comparing with kvm->online_vcpus. That variable is only
atomic with respect to itself; kvm_arch_vcpu_create() runs before
kvm->online_vcpus is incremented for the new vCPU.

Replace the count with a boolean that is set in kvm_track_tsc_matching()
after comparing the count, and cleared when a new TSC generation starts.
The boolean is consumed by pvclock_update_vm_gtod_copy() under the
tsc_write_lock, which serializes against __kvm_synchronize_tsc().

Keep the count for now as it's still used in the trace event.

Note that the explicit clear of the flag when a new generation starts
is currently overwritten by the unconditional recompute in
kvm_track_tsc_matching() under the same lock; it is preparation for
subsequent patches which consume the previous value of the flag.

Initialize the flag to true at VM creation: a VM whose vCPUs never
reach kvm_track_tsc_matching() — notably with a protected guest TSC
(TDX, SNP Secure TSC), where __kvm_synchronize_tsc() returns early —
would otherwise never be eligible for PVCLOCK_TSC_STABLE_BIT, where
the old read-time computation gave 0 + 1 == 1 for a single-vCPU VM.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 arch/x86/include/asm/kvm_host.h |  1 +
 arch/x86/kvm/x86.c              | 18 ++++++++++++++----
 2 files changed, 15 insertions(+), 4 deletions(-)

diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
index ea48b1949316..1efca01647d2 100644
--- a/arch/x86/include/asm/kvm_host.h
+++ b/arch/x86/include/asm/kvm_host.h
@@ -1242,6 +1242,7 @@ struct kvm_arch {
 	u64 cur_tsc_write;
 	u64 cur_tsc_offset;
 	u64 cur_tsc_generation;
+	bool all_vcpus_matched_tsc;
 	int nr_vcpus_matched_tsc;
 
 	u32 default_tsc_khz;
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 90f9b07ef749..ec8693f4827f 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -1125,8 +1125,10 @@ static void kvm_track_tsc_matching(struct kvm_vcpu *vcpu, bool new_generation)
 	 * and all vCPUs must have matching TSCs.  Note, the count for matching
 	 * vCPUs doesn't include the reference vCPU, hence "+1".
 	 */
-	bool use_master_clock = (ka->nr_vcpus_matched_tsc + 1 ==
-				 atomic_read(&vcpu->kvm->online_vcpus)) &&
+	ka->all_vcpus_matched_tsc = (ka->nr_vcpus_matched_tsc + 1 ==
+				     atomic_read(&vcpu->kvm->online_vcpus));
+
+	bool use_master_clock = ka->all_vcpus_matched_tsc &&
 				gtod_is_based_on_tsc(gtod->clock.vclock_mode);
 
 	/*
@@ -1367,6 +1369,7 @@ static void __kvm_synchronize_tsc(struct kvm_vcpu *vcpu, u64 offset, u64 tsc,
 		kvm->arch.cur_tsc_write = tsc;
 		kvm->arch.cur_tsc_offset = offset;
 		kvm->arch.nr_vcpus_matched_tsc = 0;
+		kvm->arch.all_vcpus_matched_tsc = false;
 	} else if (vcpu->arch.this_tsc_generation != kvm->arch.cur_tsc_generation) {
 		kvm->arch.nr_vcpus_matched_tsc++;
 	}
@@ -1591,8 +1594,7 @@ static void pvclock_update_vm_gtod_copy(struct kvm *kvm)
 	bool host_tsc_clocksource, vcpus_matched;
 
 	lockdep_assert_held(&kvm->arch.tsc_write_lock);
-	vcpus_matched = (ka->nr_vcpus_matched_tsc + 1 ==
-			atomic_read(&kvm->online_vcpus));
+	vcpus_matched = ka->all_vcpus_matched_tsc;
 
 	/*
 	 * If the host uses TSC clock, then passthrough TSC as stable
@@ -10007,6 +10009,14 @@ int kvm_arch_init_vm(struct kvm *kvm, unsigned long type)
 	ratelimit_set_flags(&kvm->arch.kvmclock_update_rs, RATELIMIT_MSG_ON_RELEASE);
 	kvm->arch.kvmclock_offset = -get_kvmclock_base_ns();
 
+	/*
+	 * Start with all (zero) vCPUs considered matched, so that a VM whose
+	 * vCPUs never reach kvm_track_tsc_matching() — notably when the guest
+	 * TSC is protected (TDX, SNP Secure TSC) and __kvm_synchronize_tsc()
+	 * returns early — is still eligible for PVCLOCK_TSC_STABLE_BIT.
+	 */
+	kvm->arch.all_vcpus_matched_tsc = true;
+
 	raw_spin_lock_irqsave(&kvm->arch.tsc_write_lock, flags);
 	pvclock_update_vm_gtod_copy(kvm);
 	raw_spin_unlock_irqrestore(&kvm->arch.tsc_write_lock, flags);
-- 
2.43.0


