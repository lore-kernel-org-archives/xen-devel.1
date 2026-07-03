Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCBA1C43602
	for <xen-devel@archiver.kernel.org>; Fri,  3 Jul 2026 21:23:37 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1353877.1609609 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wflMA-0004wX-VH; Fri, 03 Jul 2026 21:23:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1353877.1609609; Fri, 03 Jul 2026 21:23:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wflMA-0004wM-Rv; Fri, 03 Jul 2026 21:23:30 +0000
Received: by outflank-mailman (input) for mailman id 1353877;
 Fri, 03 Jul 2026 21:23:29 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <BATV+ac8634115322beed580f+8349+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1wflM9-0004uV-E8
 for xen-devel@lists.xenproject.org; Fri, 03 Jul 2026 21:23:29 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wflM8-00BXKf-RK; Fri, 03 Jul 2026 23:23:28 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <BATV+ac8634115322beed580f+8349+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 6a482832-2eae-0a2a0a5409dd-0a2a450b92fe-22
 for <multiple-recipients>; Fri, 03 Jul 2026 23:23:28 +0200
Received: from [90.155.92.199] (helo=desiato.infradead.org)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <BATV+ac8634115322beed580f+8349+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 6a482850-ac48-0a2a450b0019-5a9b5cc7b0d2-3
 for <multiple-recipients>; Fri, 03 Jul 2026 23:23:28 +0200
Received: from [2001:8b0:10b:1::425] (helo=i7.infradead.org)
 by desiato.infradead.org with esmtpsa (Exim 4.99.2 #2 (Red Hat Linux))
 id 1wflKY-000000059O0-1xLJ; Fri, 03 Jul 2026 21:22:53 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.99.2 #2 (Red
 Hat Linux)) id 1wflKW-00000001ROY-1YDI;
 Fri, 03 Jul 2026 22:21:48 +0100
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
	bh=tXL7aPo/yAWhlGILCeEnNw76Lh3seTcvuCYSfmK7zhI=; b=LK2l6nQjgd7DLaXcp7LIMUlNxA
	epcMuonePcQII23FEgetXgqFD+AaZXALFS9ajZIDA0hOhsfpISgZHAO8WzmAlWco0rLd/8BVw/en/
	jU+YYEMLC4dz5fOSsczVKgQ5CxhKFAMTcfj/NRJEX6CND9xVsdtvLUQfOoACz0uz+cc3LS3pPW2In
	TTff6EzdA3x8+ljSoDSNP7+bzp9Xyl6SHQtIw/3pX7snHqV6H52FeGGVgfEkScDfUMCZeqkL+myG/
	88kadjllLlyrTpys0ZML5ORFoQ4EuiwHCVQpvfEWOALEIblsTSGQ1eFvv0cZpOrGRfIFSE/87cT82
	lURSRZaA==;
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
Subject: [PATCH v6 12/36] KVM: x86: Restructure get_kvmclock()
Date: Fri,  3 Jul 2026 22:17:51 +0100
Message-ID: <20260703212145.343527-13-dwmw2@infradead.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260703212145.343527-1-dwmw2@infradead.org>
References: <20260703212145.343527-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: David Woodhouse <dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by desiato.infradead.org. See http://www.infradead.org/rpr.html
X-purgate-ID: tlsNG-42698a/1783113808-3AB38220-0F7362C9/0/0
X-purgate-type: clean
X-purgate-size: 3563

From: David Woodhouse <dwmw@amazon.co.uk>

Simplify the use_master_clock condition: the open-coded CONSTANT_TSC ||
cpu_tsc_khz check is unnecessary since use_master_clock can only be true
when the host clocksource is TSC based, which in turn requires a stable,
constant and synchronised TSC across all CPUs.

Given that, the get_cpu()/put_cpu() pinning is not needed either: both
the TSC read and get_cpu_tsc_khz() are CPU-independent when the master
clock is in use, so drop them.

Wrap the entire use_master_clock block in #ifdef CONFIG_X86_64, since
use_master_clock is never true on 32-bit (host_tsc_clocksource is only
set under CONFIG_X86_64), and declare hv_clock inside the block so it is
not left as an unused variable on 32-bit.

Use 'continue' on the master-clock success path so the non-master-clock
computation becomes the common tail, avoiding a goto and label. When the
clock read fails (e.g. clocksource transitioning away from TSC), fall
back to that path rather than proceeding with uninitialised data or
spinning in the seqcount loop.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 arch/x86/kvm/x86.c | 42 ++++++++++++++++++++----------------------
 1 file changed, 20 insertions(+), 22 deletions(-)

diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 50f088570dab..37b1f8192842 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -3203,40 +3203,38 @@ static unsigned long get_cpu_tsc_khz(void)
 static void get_kvmclock(struct kvm *kvm, struct kvm_clock_data *data)
 {
 	struct kvm_arch *ka = &kvm->arch;
-	struct pvclock_vcpu_time_info hv_clock;
 	unsigned int seq;
 
 	do {
 		seq = read_seqcount_begin(&ka->pvclock_sc);
 
-		/* both __this_cpu_read() and rdtsc() should be on the same cpu */
-		get_cpu();
-
 		data->flags = 0;
-		if (ka->use_master_clock &&
-		    (static_cpu_has(X86_FEATURE_CONSTANT_TSC) || __this_cpu_read(cpu_tsc_khz))) {
 #ifdef CONFIG_X86_64
+		if (ka->use_master_clock) {
+			struct pvclock_vcpu_time_info hv_clock;
 			struct timespec64 ts;
 
 			if (kvm_get_walltime_and_clockread(&ts, &data->host_tsc)) {
 				data->realtime = ts.tv_nsec + NSEC_PER_SEC * ts.tv_sec;
-				data->flags |= KVM_CLOCK_REALTIME | KVM_CLOCK_HOST_TSC;
-			} else
-#endif
-			data->host_tsc = rdtsc();
-
-			data->flags |= KVM_CLOCK_TSC_STABLE;
-			hv_clock.tsc_timestamp = ka->master_cycle_now;
-			hv_clock.system_time = ka->master_kernel_ns + ka->kvmclock_offset;
-			kvm_get_time_scale(NSEC_PER_SEC, get_cpu_tsc_khz() * 1000LL,
-					   &hv_clock.tsc_shift,
-					   &hv_clock.tsc_to_system_mul);
-			data->clock = __pvclock_read_cycles(&hv_clock, data->host_tsc);
-		} else {
-			data->clock = get_kvmclock_base_ns() + ka->kvmclock_offset;
-		}
+				data->flags |= KVM_CLOCK_REALTIME | KVM_CLOCK_HOST_TSC | KVM_CLOCK_TSC_STABLE;
+
+				hv_clock.tsc_timestamp = ka->master_cycle_now;
+				hv_clock.system_time = ka->master_kernel_ns + ka->kvmclock_offset;
+				kvm_get_time_scale(NSEC_PER_SEC, get_cpu_tsc_khz() * 1000LL,
+						   &hv_clock.tsc_shift,
+						   &hv_clock.tsc_to_system_mul);
+				data->clock = __pvclock_read_cycles(&hv_clock, data->host_tsc);
+				continue;
+			}
 
-		put_cpu();
+			/*
+			 * Clock read failed (e.g. clocksource is transitioning
+			 * away from TSC). Fall back to the non-master-clock path
+			 * rather than spinning.
+			 */
+		}
+#endif
+		data->clock = get_kvmclock_base_ns() + ka->kvmclock_offset;
 	} while (read_seqcount_retry(&ka->pvclock_sc, seq));
 }
 
-- 
2.54.0


