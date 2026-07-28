Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 738C5C53219
	for <xen-devel@archiver.kernel.org>; Tue, 28 Jul 2026 14:51:09 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1374524.1621879 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1woj8x-0005xG-KM; Tue, 28 Jul 2026 14:50:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1374524.1621879; Tue, 28 Jul 2026 14:50:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1woj8w-0005sI-G3; Tue, 28 Jul 2026 14:50:54 +0000
Received: by outflank-mailman (input) for mailman id 1374524;
 Tue, 28 Jul 2026 14:50:24 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <BATV+a16dffe8eb885fac2cd9+8374+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1woj8R-0008D4-MM
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2026 14:50:23 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1woj8R-004rVO-20; Tue, 28 Jul 2026 16:50:23 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <BATV+a16dffe8eb885fac2cd9+8374+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 6a68c182-bab6-0a2a0a5309dd-0a2a4504aa18-44
 for <multiple-recipients>; Tue, 28 Jul 2026 16:50:22 +0200
Received: from [90.155.50.34] (helo=casper.infradead.org)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <BATV+a16dffe8eb885fac2cd9+8374+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 6a68c1ae-b57f-0a2a45040019-5a9b322287a6-3
 for <multiple-recipients>; Tue, 28 Jul 2026 16:50:22 +0200
Received: from [2001:8b0:10b:1::425] (helo=i7.infradead.org)
 by casper.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
 id 1woj80-0000000DUOr-0QkL; Tue, 28 Jul 2026 14:49:59 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.99.4 #2 (Red
 Hat Linux)) id 1woj7z-00000001UYS-2Nsg;
 Tue, 28 Jul 2026 15:49:55 +0100
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
	bh=7tWCZ3O6g9mRHicwm5+/uwyfebvOB/GXlJK47aUBcYs=; b=IRn8U3JSQsqxuRBHBhPk+7VjVw
	K14km9FYw/AHhg5l66WIvxx9eEvkX+dcmIBtNDKPKbG1Luyw9ZWwJlOETDtakCZf7ZGMsyhaQhiVT
	niHXoWijNtcTKqDN5pfiQjg+8Scjxh5wGVV5P3UeAAJZdF00soXm3IENtMwPX1lpdk8315iLisVjl
	LzktSV7kfA4Vi0NVJS3+BLBRD1FlbpyRwL0EmNwSWJXIcZBuE86JWWN0Qse1g5tEVezH3VdM9nqeV
	1AnHEEaeG0GXKIPqNAPJ3i11pvRvcDAiQ3eaTshS5CWdUu1+OyBHXlNy7l0zUo44jzeT3obFpqIUJ
	Q8VwS/uQ==;
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
Subject: [PATCH v7 13/36] KVM: x86: Remove implicit rdtsc() from kvm_compute_l1_tsc_offset()
Date: Tue, 28 Jul 2026 15:39:53 +0100
Message-ID: <20260728144954.355376-14-dwmw2@infradead.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260728144954.355376-1-dwmw2@infradead.org>
References: <20260728144954.355376-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: David Woodhouse <dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
X-purgate-ID: tlsNG-ebf023/1785250222-C12DCB50-4E13AD96/0/0
X-purgate-type: clean
X-purgate-size: 3813

From: David Woodhouse <dwmw@amazon.co.uk>

Let the callers pass the host TSC value in as an explicit parameter.
This leaves some fairly obviously stupid code, which is using this
function to compare the guest TSC at some *other* time, with the
newly-minted TSC value from rdtsc(). Unless it's being used to measure
*elapsed* time, that isn't very sensible.

In this case, "obviously stupid" is an improvement over being
non-obviously so.

No functional change intended.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
Reviewed-by: Paul Durrant <paul@xen.org>
---
 arch/x86/kvm/msrs.c |  3 ++-
 arch/x86/kvm/x86.c  | 11 ++++++-----
 arch/x86/kvm/x86.h  |  3 ++-
 3 files changed, 10 insertions(+), 7 deletions(-)

diff --git a/arch/x86/kvm/msrs.c b/arch/x86/kvm/msrs.c
index 66fa7140d65d..22ceb39d41f6 100644
--- a/arch/x86/kvm/msrs.c
+++ b/arch/x86/kvm/msrs.c
@@ -1631,7 +1631,8 @@ int kvm_set_msr_common(struct kvm_vcpu *vcpu, struct msr_data *msr_info)
 		if (msr_info->host_initiated) {
 			kvm_synchronize_tsc(vcpu, &data);
 		} else if (!vcpu->arch.guest_tsc_protected) {
-			u64 adj = kvm_compute_l1_tsc_offset(vcpu, data) - vcpu->arch.l1_tsc_offset;
+			u64 adj = kvm_compute_l1_tsc_offset(vcpu, rdtsc(), data) -
+				  vcpu->arch.l1_tsc_offset;
 			adjust_tsc_offset_guest(vcpu, adj);
 			vcpu->arch.ia32_tsc_adjust_msr += adj;
 		}
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 77feed979b59..c4fd2367686c 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -1153,11 +1153,12 @@ u64 kvm_scale_tsc(u64 tsc, u64 ratio)
 	return _tsc;
 }
 
-u64 kvm_compute_l1_tsc_offset(struct kvm_vcpu *vcpu, u64 target_tsc)
+u64 kvm_compute_l1_tsc_offset(struct kvm_vcpu *vcpu, u64 host_tsc,
+			      u64 target_tsc)
 {
 	u64 tsc;
 
-	tsc = kvm_scale_tsc(rdtsc(), vcpu->arch.l1_tsc_scaling_ratio);
+	tsc = kvm_scale_tsc(host_tsc, vcpu->arch.l1_tsc_scaling_ratio);
 
 	return target_tsc - tsc;
 }
@@ -1319,7 +1320,7 @@ void kvm_synchronize_tsc(struct kvm_vcpu *vcpu, u64 *user_value)
 	bool synchronizing = false;
 
 	raw_spin_lock_irqsave(&kvm->arch.tsc_write_lock, flags);
-	offset = kvm_compute_l1_tsc_offset(vcpu, data);
+	offset = kvm_compute_l1_tsc_offset(vcpu, rdtsc(), data);
 	ns = get_kvmclock_base_ns();
 	elapsed = ns - kvm->arch.last_tsc_nsec;
 
@@ -1368,7 +1369,7 @@ void kvm_synchronize_tsc(struct kvm_vcpu *vcpu, u64 *user_value)
 		} else {
 			u64 delta = nsec_to_cycles(vcpu, elapsed);
 			data += delta;
-			offset = kvm_compute_l1_tsc_offset(vcpu, data);
+			offset = kvm_compute_l1_tsc_offset(vcpu, rdtsc(), data);
 		}
 		matched = true;
 	}
@@ -2628,7 +2629,7 @@ void kvm_arch_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
 			mark_tsc_unstable("KVM discovered backwards TSC");
 
 		if (kvm_check_tsc_unstable()) {
-			u64 offset = kvm_compute_l1_tsc_offset(vcpu,
+			u64 offset = kvm_compute_l1_tsc_offset(vcpu, rdtsc(),
 						vcpu->arch.last_guest_tsc);
 			kvm_vcpu_write_tsc_offset(vcpu, offset);
 			if (!vcpu->arch.guest_tsc_protected)
diff --git a/arch/x86/kvm/x86.h b/arch/x86/kvm/x86.h
index 0f5919b092e4..1d9a66048b01 100644
--- a/arch/x86/kvm/x86.h
+++ b/arch/x86/kvm/x86.h
@@ -335,7 +335,8 @@ u64 kvm_scale_tsc(u64 tsc, u64 ratio);
 u64 kvm_read_l1_tsc(struct kvm_vcpu *vcpu, u64 host_tsc);
 u64 kvm_calc_nested_tsc_offset(u64 l1_offset, u64 l2_offset, u64 l2_multiplier);
 u64 kvm_calc_nested_tsc_multiplier(u64 l1_multiplier, u64 l2_multiplier);
-u64 kvm_compute_l1_tsc_offset(struct kvm_vcpu *vcpu, u64 target_tsc);
+u64 kvm_compute_l1_tsc_offset(struct kvm_vcpu *vcpu, u64 host_tsc,
+			      u64 target_tsc);
 void kvm_vcpu_write_tsc_offset(struct kvm_vcpu *vcpu, u64 l1_offset);
 
 static inline void adjust_tsc_offset_guest(struct kvm_vcpu *vcpu,
-- 
2.55.0


