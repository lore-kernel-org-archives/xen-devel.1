Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 898C460A6F6B
	for <xen-devel@archiver.kernel.org>; Mon,  9 Nov 2026 01:21:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=Cj8rtTHR
Received: from list by lists.xenproject.org with outflank-mailman.1479226.1683288 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQE4b-00005m-Vf; Mon, 09 Nov 2026 01:21:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1479226.1683288; Mon, 09 Nov 2026 01:21:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQE4b-0008ST-KC; Mon, 09 Nov 2026 01:21:25 +0000
Received: by outflank-mailman (input) for mailman id 1479226;
 Mon, 09 Nov 2026 01:21:21 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <BATV+a92e0821319b6b3898f8+8478+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1xQE4X-0007Ln-LL
 for xen-devel@lists.xenproject.org; Mon, 09 Nov 2026 01:21:21 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xQE4X-002A54-2F; Mon, 09 Nov 2026 02:21:21 +0100
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <BATV+a92e0821319b6b3898f8+8478+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 6af11fb8-e002-0a2a0a5209dd-0a2a4508ae2c-36
 for <multiple-recipients>; Mon, 09 Nov 2026 02:21:16 +0100
Received: from [90.155.50.34] (helo=casper.infradead.org)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <BATV+a92e0821319b6b3898f8+8478+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 6af1200b-f659-0a2a45080019-5a9b3222b21a-3
 for <multiple-recipients>; Mon, 09 Nov 2026 02:21:15 +0100
Received: from [2001:8b0:10b:1::425] (helo=i7.infradead.org)
 by casper.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
 id 1xQE4P-00000007PwF-1hya; Mon, 09 Nov 2026 01:21:13 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.99.5 #2 (Red
 Hat Linux)) id 1xQE4P-0000000EKVF-0wmN;
 Mon, 09 Nov 2026 01:21:13 +0000
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
	bh=hJ5JbJtlSEtjbwYQ6y0juHUmDsZDZck0tD47UnsGUis=; b=Cj8rtTHR//T06DJdjiLuHwq70+
	yxpZlIERHdFT2OYPi6psDbHES5+6bfUqiw+movln8i6T/vqaahyh8VVFVFbpqLR88SQ01feACDEgO
	a4WedMS2Z339h4PQphKhPdlXGhWhjmtxJXcQOEV5vs6iu7XpJIr1og28sImgL2Su7zC9GNmYMdXt7
	Y4BrdK+X5NyK9Q8gseTSozNVDqFhvjUcztWpKHLYJ0WPNzbHY2xfTULRXFEKTBaEdg59Eoq9vSB5s
	OG6AzI+G7k8dx0fP+G7w0fpPo68wfYLZagQ1FpWaovIavJL9Gi75kM2UdOI9q4L8yPYOQ/Fe/4iIy
	OXHtAYoA==;
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
Subject: [PATCH v12 18/24] KVM: selftests: Add master clock offset test
Date: Sun,  8 Nov 2026 17:21:04 -0800
Message-ID: <20261109012112.3415328-19-dwmw2@infradead.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261109012112.3415328-1-dwmw2@infradead.org>
References: <20261109012112.3415328-1-dwmw2@infradead.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: David Woodhouse <dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
X-purgate-ID: tlsNG-c1860d/1794187276-D457487B-313FB595/0/0
X-purgate-type: clean
X-purgate-size: 8528
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: David Woodhouse <dwmw@amazon.co.uk>

Verify that KVM master clock mode remains active when vCPUs have
different TSC offsets but the same frequency. Creates three vCPUs,
sets one to a different TSC value, and confirms:

 - KVM_CLOCK_HOST_TSC is set (master clock active)
 - KVM_CLOCK_TSC_STABLE IS set (master clock ⇒ stable flag)
 - PVCLOCK_TSC_STABLE_BIT is NOT set (offsets differ)

Then set the KVM clock forward one hour with KVM_SET_CLOCK and verify
that all vCPUs still agree on the KVM clock computed from their own
pvclock parameters.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 tools/testing/selftests/kvm/Makefile.kvm      |   1 +
 .../kvm/x86/masterclock_offset_test.c         | 203 ++++++++++++++++++
 2 files changed, 204 insertions(+)
 create mode 100644 tools/testing/selftests/kvm/x86/masterclock_offset_test.c

diff --git a/tools/testing/selftests/kvm/Makefile.kvm b/tools/testing/selftests/kvm/Makefile.kvm
index 15a1a8f64723..4d4eff41c525 100644
--- a/tools/testing/selftests/kvm/Makefile.kvm
+++ b/tools/testing/selftests/kvm/Makefile.kvm
@@ -95,6 +95,7 @@ TEST_GEN_PROGS_x86 += x86/hyperv_tlb_flush
 TEST_GEN_PROGS_x86 += x86/kvm_clock_test
 TEST_GEN_PROGS_x86 += x86/kvm_pv_test
 TEST_GEN_PROGS_x86 += x86/kvm_buslock_test
+TEST_GEN_PROGS_x86 += x86/masterclock_offset_test
 TEST_GEN_PROGS_x86 += x86/monitor_mwait_test
 TEST_GEN_PROGS_x86 += x86/msrs_test
 TEST_GEN_PROGS_x86 += x86/nested_close_kvm_test
diff --git a/tools/testing/selftests/kvm/x86/masterclock_offset_test.c b/tools/testing/selftests/kvm/x86/masterclock_offset_test.c
new file mode 100644
index 000000000000..faf81872538e
--- /dev/null
+++ b/tools/testing/selftests/kvm/x86/masterclock_offset_test.c
@@ -0,0 +1,203 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Test that KVM master clock mode works with different TSC offsets
+ * as long as all vCPUs have the same TSC frequency.
+ */
+#include <string.h>
+
+#include "test_util.h"
+#include "kvm_util.h"
+#include "processor.h"
+
+#include <asm/pvclock.h>
+#include <asm/pvclock-abi.h>
+
+#define KVMCLOCK_GPA	0xc0000000ull
+#define TSC_OFFSET	(1000000000ULL)
+
+#define NR_VCPUS	3
+
+/* Read the per-vCPU pvclocks in an order other than creation order. */
+static const int vcpu_order[NR_VCPUS] = {0, 2, 1};
+
+static void guest_code(u64 pvti_gpa)
+{
+	wrmsr(MSR_KVM_SYSTEM_TIME_NEW, pvti_gpa | KVM_MSR_ENABLED);
+	for (;;)
+		GUEST_SYNC(0);
+}
+
+static void get_pvtis(struct kvm_vcpu **vcpus,
+		      struct pvclock_vcpu_time_info *pvti)
+{
+	int i;
+
+	for (i = 0; i < NR_VCPUS; i++) {
+		int idx = vcpu_order[i];
+
+		vcpu_get_clock_guest(vcpus[idx], &pvti[idx]);
+		pr_info("vCPU %d: tsc_timestamp=%lu system_time=%lu "
+			"mul=%u shift=%d flags=0x%x\n",
+			idx, (unsigned long)pvti[idx].tsc_timestamp,
+			(unsigned long)pvti[idx].system_time,
+			pvti[idx].tsc_to_system_mul, pvti[idx].tsc_shift,
+			pvti[idx].flags);
+	}
+}
+
+/*
+ * Read the host TSC once and feed it through each vCPU's pvclock
+ * (adding each vCPU's TSC offset). All must compute exactly the same
+ * kvmclock value.
+ */
+static void assert_pvclocks_match(struct pvclock_vcpu_time_info *pvti,
+				  u64 offset0, const char *what)
+{
+	u64 host_tsc, clk0, clk1, clk2;
+
+	host_tsc = rdtsc();
+	clk0 = __pvclock_read_cycles(&pvti[0], host_tsc + offset0);
+	clk1 = __pvclock_read_cycles(&pvti[1], host_tsc + offset0);
+	clk2 = __pvclock_read_cycles(&pvti[2], host_tsc + offset0 + TSC_OFFSET);
+
+	pr_info("%s: kvmclock via vCPU 0: %lu ns, vCPU 1: %lu ns, vCPU 2: %lu ns\n",
+		what, (unsigned long)clk0, (unsigned long)clk1,
+		(unsigned long)clk2);
+	TEST_ASSERT(clk0 == clk1 && clk0 == clk2,
+		    "%s: kvmclock from all vCPUs should match exactly "
+		    "(0: %lu, 1: %lu, 2: %lu)", what, (unsigned long)clk0,
+		    (unsigned long)clk1, (unsigned long)clk2);
+}
+
+static void test_masterclock_active(struct kvm_vm *vm,
+				    struct kvm_clock_data *clock)
+{
+	memset(clock, 0, sizeof(*clock));
+	vm_get_clock(vm, clock);
+	pr_info("KVM_GET_CLOCK flags: 0x%x\n", clock->flags);
+	TEST_ASSERT(clock->flags & KVM_CLOCK_HOST_TSC,
+		    "Master clock should be active, flags=0x%x", clock->flags);
+	TEST_ASSERT(clock->flags & KVM_CLOCK_TSC_STABLE,
+		    "KVM_CLOCK_TSC_STABLE should be set, flags=0x%x",
+		    clock->flags);
+}
+
+static void test_offset_consistency(struct kvm_vcpu **vcpus,
+				    struct pvclock_vcpu_time_info *pvti,
+				    u64 offset0)
+{
+	u64 gtsc0, gtsc1, gtsc2;
+
+	get_pvtis(vcpus, pvti);
+
+	/* Read guest TSCs: should see (0+OFF) < 2 < (1+OFF) */
+	gtsc0 = vcpu_get_msr(vcpus[0], MSR_IA32_TSC);
+	gtsc2 = vcpu_get_msr(vcpus[2], MSR_IA32_TSC);
+	gtsc1 = vcpu_get_msr(vcpus[1], MSR_IA32_TSC);
+	pr_info("Guest TSCs: vcpu0=%lu vcpu2=%lu vcpu1=%lu\n",
+		(unsigned long)gtsc0, (unsigned long)gtsc2,
+		(unsigned long)gtsc1);
+	TEST_ASSERT(gtsc0 + TSC_OFFSET < gtsc2 && gtsc2 < gtsc1 + TSC_OFFSET,
+		    "Expected (vcpu0+OFF) < vcpu2 < (vcpu1+OFF)");
+
+	/* PVCLOCK_TSC_STABLE_BIT should NOT be set (offsets differ) */
+	TEST_ASSERT(!(pvti[2].flags & PVCLOCK_TSC_STABLE_BIT),
+		    "PVCLOCK_TSC_STABLE_BIT should NOT be set, flags=0x%x",
+		    pvti[2].flags);
+
+	/* Same mul/shift */
+	TEST_ASSERT(pvti[0].tsc_to_system_mul == pvti[1].tsc_to_system_mul &&
+		    pvti[0].tsc_to_system_mul == pvti[2].tsc_to_system_mul &&
+		    pvti[0].tsc_shift == pvti[1].tsc_shift &&
+		    pvti[0].tsc_shift == pvti[2].tsc_shift,
+		    "All vCPUs should have same mul/shift");
+
+	assert_pvclocks_match(pvti, offset0, "Initial");
+}
+
+#define ONE_HOUR_NS (3600ULL * NSEC_PER_SEC)
+
+static void test_set_clock_consistency(struct kvm_vm *vm,
+				       struct kvm_vcpu **vcpus,
+				       struct pvclock_vcpu_time_info *pvti,
+				       struct kvm_clock_data *clock,
+				       u64 offset0)
+{
+	struct kvm_clock_data setclk = { .clock = clock->clock + ONE_HOUR_NS };
+	u64 clk0;
+	int i;
+
+	/*
+	 * Add an hour to the VM kvmclock via KVM_SET_CLOCK, run each
+	 * vCPU to pick up the update, and check they're still in sync.
+	 */
+	vm_set_clock(vm, &setclk);
+
+	/* Guest code does GUEST_SYNC then exits — run each to see update */
+	for (i = 0; i < NR_VCPUS; i++) {
+		vcpu_run(vcpus[vcpu_order[i]]);
+		TEST_ASSERT_KVM_EXIT_REASON(vcpus[vcpu_order[i]], KVM_EXIT_IO);
+	}
+
+	get_pvtis(vcpus, pvti);
+
+	TEST_ASSERT(pvti[0].system_time == pvti[1].system_time &&
+		    pvti[0].system_time == pvti[2].system_time,
+		    "system_time should still match after KVM_SET_CLOCK");
+
+	assert_pvclocks_match(pvti, offset0, "After +1h");
+
+	/* Verify the clock actually moved by ~1 hour */
+	clk0 = __pvclock_read_cycles(&pvti[0], rdtsc() + offset0);
+	TEST_ASSERT(clk0 > ONE_HOUR_NS,
+		    "Clock should be > 1 hour after set, got %lu ns",
+		    (unsigned long)clk0);
+}
+
+int main(void)
+{
+	struct pvclock_vcpu_time_info pvti[NR_VCPUS];
+	struct kvm_vcpu *vcpus[NR_VCPUS];
+	struct kvm_clock_data clock;
+	struct kvm_vm *vm;
+	u64 offset0;
+	int nr_pages;
+	int i;
+
+	TEST_REQUIRE(sys_clocksource_is_based_on_tsc());
+	TEST_REQUIRE(kvm_has_cap(KVM_CAP_CLOCK_GUEST));
+
+	vm = vm_create_with_vcpus(NR_VCPUS, guest_code, vcpus);
+
+	TEST_REQUIRE(!__vcpu_has_device_attr(vcpus[0], KVM_VCPU_TSC_CTRL,
+					     KVM_VCPU_TSC_OFFSET));
+
+	nr_pages = vm_calc_num_guest_pages(VM_MODE_DEFAULT, getpagesize());
+	vm_userspace_mem_region_add(vm, VM_MEM_SRC_ANONYMOUS,
+				    KVMCLOCK_GPA, 1, nr_pages, 0);
+
+	/* Give each vCPU its own pvclock structure within the page */
+	for (i = 0; i < NR_VCPUS; i++)
+		vcpu_args_set(vcpus[i], 1, KVMCLOCK_GPA +
+			      i * sizeof(struct pvclock_vcpu_time_info) * 2);
+
+	/* Get vCPU 0's default offset and set vCPU 2's offset higher */
+	offset0 = vcpu_get_tsc_offset(vcpus[0]);
+	vcpu_set_tsc_offset(vcpus[2], offset0 + TSC_OFFSET);
+
+	/* Run each vCPU to enable kvmclock (with offset already set) */
+	for (i = 0; i < NR_VCPUS; i++) {
+		vcpu_run(vcpus[i]);
+		TEST_ASSERT_KVM_EXIT_REASON(vcpus[i], KVM_EXIT_IO);
+	}
+
+	test_masterclock_active(vm, &clock);
+	test_offset_consistency(vcpus, pvti, offset0);
+	pr_info("PASSED: pvclock consistent across offset vCPUs\n");
+
+	test_set_clock_consistency(vm, vcpus, pvti, &clock, offset0);
+	pr_info("PASSED: pvclock still consistent after KVM_SET_CLOCK +1h\n");
+
+	kvm_vm_free(vm);
+	return 0;
+}
-- 
2.43.0


