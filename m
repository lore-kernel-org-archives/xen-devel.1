Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 150C8C43458
	for <xen-devel@archiver.kernel.org>; Fri,  3 Jul 2026 21:24:25 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1353952.1609763 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wflMr-0002vx-QG; Fri, 03 Jul 2026 21:24:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1353952.1609763; Fri, 03 Jul 2026 21:24:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wflMr-0002uz-GE; Fri, 03 Jul 2026 21:24:13 +0000
Received: by outflank-mailman (input) for mailman id 1353952;
 Fri, 03 Jul 2026 21:24:12 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <BATV+ac8634115322beed580f+8349+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1wflMp-0002lY-W8
 for xen-devel@lists.xenproject.org; Fri, 03 Jul 2026 21:24:11 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wflMp-00A8LG-Cn; Fri, 03 Jul 2026 23:24:11 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <BATV+ac8634115322beed580f+8349+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 6a48281d-bab6-0a2a0a5309dd-0a2a4507d556-28
 for <multiple-recipients>; Fri, 03 Jul 2026 23:24:10 +0200
Received: from [90.155.92.199] (helo=desiato.infradead.org)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <BATV+ac8634115322beed580f+8349+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 6a48287a-9c8e-0a2a45070019-5a9b5cc78b72-3
 for <multiple-recipients>; Fri, 03 Jul 2026 23:24:10 +0200
Received: from [2001:8b0:10b:1::425] (helo=i7.infradead.org)
 by desiato.infradead.org with esmtpsa (Exim 4.99.2 #2 (Red Hat Linux))
 id 1wflKe-000000059OC-0v73; Fri, 03 Jul 2026 21:23:05 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.99.2 #2 (Red
 Hat Linux)) id 1wflKX-00000001RPn-1wE5;
 Fri, 03 Jul 2026 22:21:49 +0100
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
	bh=cd7ADB+seora88pbKs2aD/tIbj9VePpwMwSL1OtTGjc=; b=apbGiZMkUWlTVRA2dMsajeQnJ0
	RhOJ6E89Pg9nZWfqc1RytnC60PxmSbLIc70g2wiX9+ooo+ZTGG+wuRG28iqP40gybMT4pWEYVKG45
	IVR/hQwGVcaV0h45HGBgtN2qd4s+8dCM8XetiqvJ905knza/omAjyD5QDeKL2kLEu5tSs9t9rUG0C
	pUge3V166Jv7ecOVz6xHEpZMkC/QA8i04z7CCvmXPW7GybxZC1kDSoXQr3x1//zaHva65YLoum3ha
	jySMWli1TzgZTW4U5jDjlS4f0GHvt/pA6S68YpOLver+gZSd/WhlFkM4AA9b5RT7qhPBtTqlM1su1
	y/Xr5sFQ==;
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
Subject: [PATCH v6 30/36] KVM: x86: Re-synchronize TSC after KVM_SET_TSC_KHZ
Date: Fri,  3 Jul 2026 22:18:09 +0100
Message-ID: <20260703212145.343527-31-dwmw2@infradead.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260703212145.343527-1-dwmw2@infradead.org>
References: <20260703212145.343527-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: David Woodhouse <dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by desiato.infradead.org. See http://www.infradead.org/rpr.html
X-purgate-ID: tlsNG-ef75cf/1783113850-145FC25E-F64A76C9/0/0
X-purgate-type: clean
X-purgate-size: 2200

From: David Woodhouse <dwmw@amazon.co.uk>

KVM_SET_TSC_KHZ changes the vCPU's TSC scaling ratio but does not
update the VM-wide cur_tsc_scaling_ratio used by get_kvmclock().
This causes get_kvmclock() to use a stale (default 1:1) ratio when
computing the KVM clock, leading to drift between the host-side
kvmclock and what the guest observes.

Fix this by calling kvm_synchronize_tsc() after changing the TSC
frequency. This:
 - Updates cur_tsc_scaling_ratio (consumed by pvclock_update_vm_gtod_copy)
 - Ensures the TSC value is continuous across the frequency change
 - Triggers kvm_track_tsc_matching() for proper masterclock handling
 - Allows subsequent vCPUs to synchronize via the 1-second slop hack

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 arch/x86/kvm/x86.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 80fe69974ded..37a768b2fe16 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -206,6 +206,7 @@ module_param(mitigate_smt_rsb, bool, 0444);
 #ifdef CONFIG_X86_64
 static bool kvm_get_time_and_clockread(s64 *kernel_ns, u64 *tsc_timestamp);
 #endif
+static void kvm_synchronize_tsc(struct kvm_vcpu *vcpu, u64 *user_value);
 #define KVM_MAX_NR_USER_RETURN_MSRS 16
 
 struct kvm_user_return_msrs {
@@ -2584,6 +2585,7 @@ static int kvm_set_tsc_khz(struct kvm_vcpu *vcpu, u32 user_tsc_khz)
 {
 	u32 thresh_lo, thresh_hi;
 	int use_scaling = 0;
+	u64 tsc;
 
 	/* tsc_khz can be zero if TSC calibration fails */
 	if (user_tsc_khz == 0) {
@@ -2611,7 +2613,17 @@ static int kvm_set_tsc_khz(struct kvm_vcpu *vcpu, u32 user_tsc_khz)
 			 user_tsc_khz, thresh_lo, thresh_hi);
 		use_scaling = 1;
 	}
-	return set_tsc_khz(vcpu, user_tsc_khz, use_scaling);
+	/*
+	 * Read the guest TSC before changing the ratio, so we can
+	 * re-synchronize to preserve continuity across the change.
+	 */
+	tsc = kvm_read_l1_tsc(vcpu, rdtsc());
+
+	if (set_tsc_khz(vcpu, user_tsc_khz, use_scaling))
+		return -1;
+
+	kvm_synchronize_tsc(vcpu, &tsc);
+	return 0;
 }
 
 static u64 compute_guest_tsc(struct kvm_vcpu *vcpu, s64 kernel_ns)
-- 
2.54.0


