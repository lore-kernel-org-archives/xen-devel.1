Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC4A1606F958
	for <xen-devel@archiver.kernel.org>; Thu,  5 Nov 2026 15:50:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=Z7DS/iZd
Received: from list by lists.xenproject.org with outflank-mailman.1475000.1681874 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOzj3-0004BD-Rj; Thu, 05 Nov 2026 15:50:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1475000.1681874; Thu, 05 Nov 2026 15:50:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOzj3-00049Y-JZ; Thu, 05 Nov 2026 15:50:05 +0000
Received: by outflank-mailman (input) for mailman id 1475000;
 Thu, 05 Nov 2026 15:50:03 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <BATV+a10630623031064a0c86+8474+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1xOzj1-0003RV-KX
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 15:50:03 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOzj1-00GUtv-0S; Thu, 05 Nov 2026 16:50:03 +0100
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <BATV+a10630623031064a0c86+8474+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 6aeca5a0-8faa-0a2a0a5109dd-0a2a4508cd68-16
 for <multiple-recipients>; Thu, 05 Nov 2026 16:50:02 +0100
Received: from [90.155.50.34] (helo=casper.infradead.org)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <BATV+a10630623031064a0c86+8474+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 6aeca5aa-f659-0a2a45080019-5a9b3222a2f6-3
 for <multiple-recipients>; Thu, 05 Nov 2026 16:50:02 +0100
Received: from [2001:8b0:10b:1::425] (helo=i7.infradead.org)
 by casper.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
 id 1xOziu-00000009ap1-3QP3; Thu, 05 Nov 2026 15:49:56 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.99.5 #2 (Red
 Hat Linux)) id 1xOziu-0000000Ab0D-2TMJ;
 Thu, 05 Nov 2026 15:49:56 +0000
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
	bh=OwFdVC1DY43M8jJzrqstmWIxLmeowgW7V9g/IXt3zfQ=; b=Z7DS/iZdyXJaoXvPMN417Pc5ji
	DHKrXeNfgpKd5fcwEH9YRfJMuaRj0AmmjOBJOFcZ6Eq4x8bXdCwiKKFDMAF2JiLYXXTGqfWHBylf0
	+h2WVLI/IZ+31YkTbNNx1Opz3mKaalZntbfZ+nNI82dV6ubDw2ZKFuvl+w/NA++rluDGNdn2Dxs/g
	WkxIBmwv3VhUn0OQO4GkQWc4oKwoaHHBvzHgaStPcUEmtgr3D5JxjPHa1/maZN2geJug48K0Sxcgb
	0UTL53M1Wq92Pa+Jsy9WkD7Ncr1Rj6VGTTS5tMn3Z/M5rj3k+1HjDVbKvf9MKLkG5OI2grGdLemHC
	yzyqOGbA==;
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
Subject: [PATCH v11 21/23] KVM: selftests: Test that the first user TSC write is honoured exactly
Date: Thu,  5 Nov 2026 07:49:52 -0800
Message-ID: <20261105154955.2525419-22-dwmw2@infradead.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261105154955.2525419-1-dwmw2@infradead.org>
References: <20261105154955.2525419-1-dwmw2@infradead.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: David Woodhouse <dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
X-purgate-ID: tlsNG-c1860d/1793893802-CFED287B-519871EA/0/0
X-purgate-type: clean
X-purgate-size: 5469
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: David Woodhouse <dwmw@amazon.co.uk>

The 1-second "slop" heuristic in kvm_synchronize_tsc() is only
supposed to apply between successive userspace TSC writes, i.e. once
kvm->arch.user_set_tsc has been set by a previous write. The kernel's
own internal TSC synchronization on vCPU creation (and frequency
changes) must not arm it, otherwise the first genuine userspace write
falling within 1 second of virtual cycle time of the kernel's default
generation is "corrected" back to that generation instead of being
honoured — breaking the restore of a guest with less than one second
of runtime.

Add a test which creates a vCPU and immediately performs a first
host-initiated write of a TSC value corresponding to ~500ms of guest
runtime, then verifies the value reads back exactly (modulo elapsed
time) rather than being snapped back to the kernel's default
generation near zero.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 tools/testing/selftests/kvm/Makefile.kvm      |  1 +
 .../selftests/kvm/x86/tsc_user_set_test.c     | 86 +++++++++++++++++++
 2 files changed, 87 insertions(+)
 create mode 100644 tools/testing/selftests/kvm/x86/tsc_user_set_test.c

diff --git a/tools/testing/selftests/kvm/Makefile.kvm b/tools/testing/selftests/kvm/Makefile.kvm
index 1edc78845fd3..fd063806a7fb 100644
--- a/tools/testing/selftests/kvm/Makefile.kvm
+++ b/tools/testing/selftests/kvm/Makefile.kvm
@@ -151,6 +151,7 @@ TEST_GEN_PROGS_x86 += x86/xcr0_cpuid_test
 TEST_GEN_PROGS_x86 += x86/xss_msr_test
 TEST_GEN_PROGS_x86 += x86/debug_regs
 TEST_GEN_PROGS_x86 += x86/tsc_msrs_test
+TEST_GEN_PROGS_x86 += x86/tsc_user_set_test
 TEST_GEN_PROGS_x86 += x86/vmx_pmu_caps_test
 TEST_GEN_PROGS_x86 += x86/xen_cpuid_timing_test
 TEST_GEN_PROGS_x86 += x86/xen_migration_test
diff --git a/tools/testing/selftests/kvm/x86/tsc_user_set_test.c b/tools/testing/selftests/kvm/x86/tsc_user_set_test.c
new file mode 100644
index 000000000000..6ab76e817f9f
--- /dev/null
+++ b/tools/testing/selftests/kvm/x86/tsc_user_set_test.c
@@ -0,0 +1,86 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Test that the first userspace write to MSR_IA32_TSC takes effect
+ * precisely, and is not subjected to the 1-second "slop" heuristic
+ * which is only supposed to apply between successive *userspace*
+ * writes (kvm->arch.user_set_tsc).
+ *
+ * The kernel synchronizes the TSC internally when a vCPU is created
+ * (and when its frequency is set). If any of those kernel-internal
+ * paths incorrectly sets user_set_tsc, then the first genuine write
+ * from userspace which happens to fall within 1 second of virtual
+ * cycle time of the kernel's default generation is "corrected" to
+ * match that generation instead of being honoured exactly. That
+ * breaks the restore of a guest which has genuinely been running
+ * for less than one second.
+ *
+ * Simulate exactly that: create a vCPU (kernel establishes a default
+ * TSC generation starting near zero), then perform the first
+ * host-initiated write with a value corresponding to ~500ms of guest
+ * runtime. If the slop heuristic fires, the written value is snapped
+ * back to the kernel's generation (near zero) and the TSC reads back
+ * hundreds of milliseconds low.
+ */
+#include "kvm_util.h"
+#include "processor.h"
+
+int main(void)
+{
+	struct kvm_vcpu *vcpu;
+	struct kvm_vm *vm;
+	u64 freq_khz, t_write, t_read, slack_cycles, mono_ns;
+	struct timespec ts;
+	int r;
+
+	/*
+	 * Start the measured window before vCPU creation: a snapped-back
+	 * value tracks time since the kernel's default generation (i.e.
+	 * since creation), so the window the slack is derived from must
+	 * include everything from creation onwards.
+	 */
+	clock_gettime(CLOCK_MONOTONIC_RAW, &ts);
+	mono_ns = ts.tv_sec * 1000000000ULL + ts.tv_nsec;
+
+	vm = vm_create_with_one_vcpu(&vcpu, NULL);
+
+	r = __vcpu_ioctl(vcpu, KVM_GET_TSC_KHZ, NULL);
+	TEST_ASSERT(r > 0, "KVM_GET_TSC_KHZ failed");
+	freq_khz = r;
+
+	/*
+	 * The first user write: a guest TSC corresponding to 500ms of
+	 * runtime. This is within 1s (of virtual cycle time) of the
+	 * kernel's default generation, so it is exactly the case that
+	 * the slop heuristic would destroy if it were (incorrectly)
+	 * armed by the kernel's own internal TSC synchronization.
+	 */
+	t_write = freq_khz * 500ULL;		/* khz * ms = cycles */
+
+	vcpu_set_msr(vcpu, MSR_IA32_TSC, t_write);
+
+	t_read = vcpu_get_msr(vcpu, MSR_IA32_TSC);
+
+	clock_gettime(CLOCK_MONOTONIC_RAW, &ts);
+	mono_ns = (ts.tv_sec * 1000000000ULL + ts.tv_nsec) - mono_ns;
+
+	/*
+	 * The TSC advances between the write and the read; bound the
+	 * difference by the measured elapsed time around the two ioctls
+	 * plus 10ms of slop, so a descheduled test cannot flake. If the
+	 * write was snapped to the kernel's default generation, the
+	 * value read back is ~500ms low (i.e. below t_write), which is
+	 * unambiguous.
+	 */
+	slack_cycles = freq_khz * (mono_ns / 1000000ULL + 10);
+
+	TEST_ASSERT(t_read >= t_write,
+		    "TSC went backwards from explicit write: wrote %lu, read %lu"
+		    " (first userspace write was subjected to 1-second slop?)",
+		    t_write, t_read);
+	TEST_ASSERT(t_read - t_write < slack_cycles,
+		    "TSC read back too far from written value: wrote %lu, read %lu",
+		    t_write, t_read);
+
+	kvm_vm_free(vm);
+	return 0;
+}
-- 
2.43.0


