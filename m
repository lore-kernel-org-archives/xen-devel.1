Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 334BBC54F5F
	for <xen-devel@archiver.kernel.org>; Tue, 28 Jul 2026 14:50:34 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1374507.1621759 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1woj8Q-0007mR-By; Tue, 28 Jul 2026 14:50:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1374507.1621759; Tue, 28 Jul 2026 14:50:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1woj8P-0007ha-6q; Tue, 28 Jul 2026 14:50:21 +0000
Received: by outflank-mailman (input) for mailman id 1374507;
 Tue, 28 Jul 2026 14:50:15 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <BATV+0bab86ec5884d1af5d78+8374+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1woj8J-0006TH-Fu
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2026 14:50:15 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1woj8I-004rRp-Sd; Tue, 28 Jul 2026 16:50:14 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <BATV+0bab86ec5884d1af5d78+8374+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 6a68c182-bab6-0a2a0a5309dd-0a2a4504aa18-30
 for <multiple-recipients>; Tue, 28 Jul 2026 16:50:14 +0200
Received: from [90.155.92.199] (helo=desiato.infradead.org)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <BATV+0bab86ec5884d1af5d78+8374+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 6a68c1a6-b57f-0a2a45040019-5a9b5cc7b922-3
 for <multiple-recipients>; Tue, 28 Jul 2026 16:50:14 +0200
Received: from [2001:8b0:10b:1::425] (helo=i7.infradead.org)
 by desiato.infradead.org with esmtpsa (Exim 4.99.2 #2 (Red Hat Linux))
 id 1woj82-000000052VV-34XV; Tue, 28 Jul 2026 14:49:59 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.99.4 #2 (Red
 Hat Linux)) id 1woj7z-00000001UYA-1Is7;
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=desiato.20200630 header.d=infradead.org header.i="@infradead.org" header.h="Sender:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description;
	bh=FIpnIbjJ0pzN59/UsQ51DXTnfaDdE7kwlCIrC+Ft09U=; b=WfxkToMz9J4yo7htdBdApQX/+3
	/j7pFQ4Azzl+R6EK8CJCB0HorJqtYgyXCI3ci14hiUBFQuc78tdSkTFpjGKD8+59AkeHldWbH1Js1
	NZsBFb6yC9rysE7YhuRtIReSOpDKn/jRZ/4IwwST0FvXqtsQ5AKcjnurjpuNvjzpv86VwWbLfmMOk
	ACy+qLDjDwFP56e4ogOZ2idEmvDx11DWacVylhKJ0224yPnVRTazNdL5I+npc4QbRMfQoQGTWkgLz
	FvXNK4kkwhRVuQWMdMdwfno0gOPchLCYETpMDrc8TpUrjd847bKq1tMhxIFWjeaPZX8TsfnaVo9g2
	6uV6Rzxg==;
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
Subject: [PATCH v7 07/36] KVM: x86: Restructure get_kvmclock()
Date: Tue, 28 Jul 2026 15:39:47 +0100
Message-ID: <20260728144954.355376-8-dwmw2@infradead.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260728144954.355376-1-dwmw2@infradead.org>
References: <20260728144954.355376-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: David Woodhouse <dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by desiato.infradead.org. See http://www.infradead.org/rpr.html
X-purgate-ID: tlsNG-ebf023/1785250214-C3AC0B50-5F7FB874/0/0
X-purgate-type: clean
X-purgate-size: 2912

From: David Woodhouse <dwmw@amazon.co.uk>

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
 arch/x86/kvm/x86.c | 36 ++++++++++++++++++++----------------
 1 file changed, 20 insertions(+), 16 deletions(-)

diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 590a7ba723f7..51908d7093ba 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -1653,34 +1653,38 @@ static unsigned long get_cpu_tsc_khz(void)
 static void get_kvmclock(struct kvm *kvm, struct kvm_clock_data *data)
 {
 	struct kvm_arch *ka = &kvm->arch;
-	struct pvclock_vcpu_time_info hv_clock;
 	unsigned int seq;
 
 	do {
 		seq = read_seqcount_begin(&ka->pvclock_sc);
 
 		data->flags = 0;
-		if (ka->use_master_clock) {
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
+
+			/*
+			 * Clock read failed (e.g. clocksource is transitioning
+			 * away from TSC). Fall back to the non-master-clock path
+			 * rather than spinning.
+			 */
 		}
+#endif
+		data->clock = get_kvmclock_base_ns() + ka->kvmclock_offset;
 	} while (read_seqcount_retry(&ka->pvclock_sc, seq));
 }
 
-- 
2.55.0


