Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB21DC54F56
	for <xen-devel@archiver.kernel.org>; Tue, 28 Jul 2026 14:50:33 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1374492.1621667 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1woj8G-0005Xw-Py; Tue, 28 Jul 2026 14:50:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1374492.1621667; Tue, 28 Jul 2026 14:50:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1woj8G-0005Wx-LE; Tue, 28 Jul 2026 14:50:12 +0000
Received: by outflank-mailman (input) for mailman id 1374492;
 Tue, 28 Jul 2026 14:50:10 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <BATV+a16dffe8eb885fac2cd9+8374+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1woj8B-00052F-Ju
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2026 14:50:10 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1woj8A-0039yS-T9; Tue, 28 Jul 2026 16:50:06 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <BATV+a16dffe8eb885fac2cd9+8374+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 6a68c181-5cb7-0a2a0a5109dd-0a2a4501c902-36
 for <multiple-recipients>; Tue, 28 Jul 2026 16:50:06 +0200
Received: from [90.155.50.34] (helo=casper.infradead.org)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <BATV+a16dffe8eb885fac2cd9+8374+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 6a68c19c-5984-0a2a45010019-5a9b322291ba-3
 for <multiple-recipients>; Tue, 28 Jul 2026 16:50:05 +0200
Received: from [2001:8b0:10b:1::425] (helo=i7.infradead.org)
 by casper.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
 id 1woj80-0000000DUOu-17VB; Tue, 28 Jul 2026 14:49:58 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.99.4 #2 (Red
 Hat Linux)) id 1woj80-00000001UZI-092q;
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
	bh=Y/kXnXqoXWAwlPXvSAQg/Dr8WRfAw9Z9gfGyfdWRA9A=; b=WihKI3A4wFlL6/yozdtt+ZoGhM
	ubegBCtRDisQxeQckBvSfX0NdqVwYEzhNS7d3BsoFXJKU/7/R3lD1V4ia7lXXCfTkVKYHJNkLtMbT
	CQAWQr97L+wWoPqx/YHVAyhqU9ChkWJboU6eASXvi6gtNuYGUGEH1Jvo24uLRmGyP4WiBiTommmS7
	8Nffcgf1hQRD1mZUHCWEL/jIMcxw8z5EgT0oXUSbP8vzPQNG7PAtmCRlhhuZslEL+zMb2t7uUyM4e
	+mT1zr8BExOUf+bjqBeRY1pbtVDx8MzSvlnTN7qEeWCMYNTZXqGXTr6V/IQTfbZx74lcKW/sPKTIR
	hQ+mbBWw==;
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
Subject: [PATCH v7 23/36] KVM: x86: Re-synchronize TSC after KVM_SET_TSC_KHZ
Date: Tue, 28 Jul 2026 15:40:03 +0100
Message-ID: <20260728144954.355376-24-dwmw2@infradead.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260728144954.355376-1-dwmw2@infradead.org>
References: <20260728144954.355376-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: David Woodhouse <dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
X-purgate-ID: tlsNG-d62444/1785250205-BD341757-AB685FEC/0/0
X-purgate-type: clean
X-purgate-size: 2232

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
 arch/x86/kvm/x86.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 06f968007f1a..3e8cc8daf848 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -212,7 +212,6 @@ module_param(mitigate_smt_rsb, bool, 0444);
 #ifdef CONFIG_X86_64
 static bool kvm_get_time_and_clockread(s64 *kernel_ns, u64 *tsc_timestamp);
 #endif
-
 #define KVM_SUPPORTED_XCR0     (XFEATURE_MASK_FP | XFEATURE_MASK_SSE \
 				| XFEATURE_MASK_YMM | XFEATURE_MASK_BNDREGS \
 				| XFEATURE_MASK_BNDCSR | XFEATURE_MASK_AVX512 \
@@ -1051,6 +1050,7 @@ static int kvm_set_tsc_khz(struct kvm_vcpu *vcpu, u32 user_tsc_khz)
 {
 	u32 thresh_lo, thresh_hi;
 	int use_scaling = 0;
+	u64 tsc;
 
 	/* tsc_khz can be zero if TSC calibration fails */
 	if (user_tsc_khz == 0) {
@@ -1078,7 +1078,17 @@ static int kvm_set_tsc_khz(struct kvm_vcpu *vcpu, u32 user_tsc_khz)
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
2.55.0


