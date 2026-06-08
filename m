Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7207CD8C9D
	for <xen-devel@archiver.kernel.org>; Mon,  8 Jun 2026 14:55:54 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1331736.1594440 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wWbOB-0007nR-Kp; Mon, 08 Jun 2026 14:55:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1331736.1594440; Mon, 08 Jun 2026 14:55:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wWbOA-0007bY-3t; Mon, 08 Jun 2026 14:55:42 +0000
Received: by outflank-mailman (input) for mailman id 1331736;
 Mon, 08 Jun 2026 14:55:33 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <BATV+89cebe4ba06156b53a55+8324+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1wWbO0-0005bW-8v
 for xen-devel@lists.xenproject.org; Mon, 08 Jun 2026 14:55:32 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wWbNz-002m34-E0; Mon, 08 Jun 2026 16:55:31 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <BATV+89cebe4ba06156b53a55+8324+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 6a26d7d7-bab6-0a2a0a5309dd-0a2a4509a2de-22
 for <multiple-recipients>; Mon, 08 Jun 2026 16:55:31 +0200
Received: from [90.155.50.34] (helo=casper.infradead.org)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from
 <BATV+89cebe4ba06156b53a55+8324+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 6a26d7e2-2497-0a2a45090019-5a9b3222d714-3
 for <multiple-recipients>; Mon, 08 Jun 2026 16:55:31 +0200
Received: from [2001:8b0:10b:1::425] (helo=i7.infradead.org)
 by casper.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
 id 1wWbNS-0000000Dtxj-2vXt; Mon, 08 Jun 2026 14:54:59 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.99.2 #2 (Red
 Hat Linux)) id 1wWbNS-00000000NGX-3X6a;
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=casper.20170209 header.d=infradead.org header.i="@infradead.org" header.h="Sender:Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:
	From:Reply-To:Cc:Content-ID:Content-Description;
	bh=aHV9lck9iJ7HfeFHLwY/x8/L76vGmBWhEjbD8RUPDnI=; b=N9+adQEbHGyBhmT81pe1mmYYck
	LjW/bk4JiQDQVfbGbb3rZrQkZSu2DFaWqWwtmJ4aYta+6mUnOrqpsfIou57Twpu7e3mpdtOR6IaS/
	PR30FjJPheq3HC07+oHZIvW0QagIsGBCO4FGmfBYHGTO6L32PDV0Gau8jWk4WqHWk2LxHqr7BBkeg
	InjZCCPr2gDsciyXM/r+vac1yWl6d0xWHTwRNSxvzqdCOnylWOjVvDEBHh/ul2i4PBO8o+YQL6ivG
	9Y+C1B3FJ8v/gGK94o+RhO5HmgPf9ZaXmgM9mMzuTK+aM+zaoXaQmTWHqMhV9AhnL2ZQbnsjqcGaA
	wWHDSRaQ==;
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
Subject: [PATCH v5 30/34] KVM: selftests: Add Xen runstate migration test
Date: Mon,  8 Jun 2026 15:48:11 +0100
Message-ID: <20260608145455.89187-31-dwmw2@infradead.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260608145455.89187-1-dwmw2@infradead.org>
References: <20260608145455.89187-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: David Woodhouse <dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
X-purgate-ID: tlsNG-bad1c0/1780930531-42B70A53-B48BA8E3/0/0
X-purgate-type: clean
X-purgate-size: 7849

From: David Woodhouse <dwmw@amazon.co.uk>

Test that Xen runstate (steal time) is correctly accounted across a
simulated live migration using KVM_XEN_VCPU_ATTR and KVM_[GS]ET_CLOCK_GUEST.

The test simulates what a real VMM does during migration:
1. Creates a VM with Xen HVM config and runstate tracking
2. Runs the guest to accumulate some kvmclock time
3. Saves clock (KVM_GET_CLOCK_GUEST), TSC offset, and runstate
4. Marks the saved state as RUNSTATE_runnable (vCPU not running)
5. Destroys the source VM
6. Sleeps 10ms (simulating migration network transfer time)
7. Creates a new VM and restores all state precisely as saved
8. Runs the guest and verifies the migration gap appears as steal

The kernel accounts the gap because: on vcpu_load, it transitions from
RUNSTATE_runnable to RUNSTATE_running, computing delta = kvmclock_now -
state_entry_time. Since kvmclock has advanced past the saved entry time
(real time elapsed during migration), the delta is added to time_runnable.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 .../selftests/kvm/x86/xen_migration_test.c    | 194 ++++++++++++++++++
 1 file changed, 194 insertions(+)
 create mode 100644 tools/testing/selftests/kvm/x86/xen_migration_test.c

diff --git a/tools/testing/selftests/kvm/x86/xen_migration_test.c b/tools/testing/selftests/kvm/x86/xen_migration_test.c
new file mode 100644
index 000000000000..37e8ace00611
--- /dev/null
+++ b/tools/testing/selftests/kvm/x86/xen_migration_test.c
@@ -0,0 +1,194 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Test Xen runstate (steal time) preservation across simulated migration.
+ *
+ * Verifies that the kernel correctly accounts the migration gap as
+ * steal time (runnable) when runstate data is saved and restored
+ * precisely, but real time elapses during the migration.
+ *
+ * The key insight: userspace saves the runstate with state=RUNSTATE_runnable
+ * (the vCPU is not running during migration). On restore, the kernel sees
+ * that kvmclock has advanced past state_entry_time, and accounts the
+ * difference as time spent in the runnable state.
+ */
+#include <inttypes.h>
+#include <stdint.h>
+#include <stdio.h>
+#include <string.h>
+#include <unistd.h>
+
+#include "test_util.h"
+#include "kvm_util.h"
+#include "processor.h"
+
+#include <asm/pvclock-abi.h>
+
+#define SHINFO_GPA	0xc0000000ULL
+#define RUNSTATE_GPA	(SHINFO_GPA + 0x1000)
+
+#define RUNSTATE_running  0
+#define RUNSTATE_runnable 1
+#define RUNSTATE_blocked  2
+#define RUNSTATE_offline  3
+
+struct vcpu_runstate_info {
+	uint32_t state;
+	uint64_t state_entry_time;
+	uint64_t time[4];
+} __attribute__((packed));
+
+static void guest_code(void)
+{
+	volatile struct vcpu_runstate_info *rs =
+		(void *)(unsigned long)RUNSTATE_GPA;
+
+	/* Report runstate times — no need to enable kvmclock MSR,
+	 * the kernel writes runstate using its internal kvmclock. */
+	GUEST_SYNC_ARGS(0, rs->time[RUNSTATE_runnable],
+			rs->time[RUNSTATE_running], 0, 0);
+}
+
+static struct kvm_vm *create_xen_vm(struct kvm_vcpu **vcpu)
+{
+	struct kvm_vm *vm;
+	int xen_caps;
+
+	vm = vm_create_with_one_vcpu(vcpu, guest_code);
+
+	xen_caps = kvm_check_cap(KVM_CAP_XEN_HVM);
+	TEST_REQUIRE(xen_caps & KVM_XEN_HVM_CONFIG_SHARED_INFO);
+	TEST_REQUIRE(xen_caps & KVM_XEN_HVM_CONFIG_RUNSTATE);
+
+	/* Map pages */
+	vm_userspace_mem_region_add(vm, VM_MEM_SRC_ANONYMOUS,
+				    SHINFO_GPA, 1, 2, 0);
+	virt_map(vm, SHINFO_GPA, SHINFO_GPA, 2);
+
+	/* Enable Xen HVM with MSR interception (enables runstate tracking) */
+	struct kvm_xen_hvm_config cfg = {
+		.flags = KVM_XEN_HVM_CONFIG_INTERCEPT_HCALL,
+		.msr = 0x40000000,
+	};
+	vm_ioctl(vm, KVM_XEN_HVM_CONFIG, &cfg);
+
+	/* Set shared_info */
+	struct kvm_xen_hvm_attr ha = {
+		.type = KVM_XEN_ATTR_TYPE_SHARED_INFO,
+		.u.shared_info.gfn = SHINFO_GPA >> 12,
+	};
+	vm_ioctl(vm, KVM_XEN_HVM_SET_ATTR, &ha);
+
+	/* Set runstate address */
+	struct kvm_xen_vcpu_attr rs_addr = {
+		.type = KVM_XEN_VCPU_ATTR_TYPE_RUNSTATE_ADDR,
+		.u.gpa = RUNSTATE_GPA,
+	};
+	vcpu_ioctl(*vcpu, KVM_XEN_VCPU_SET_ATTR, &rs_addr);
+
+	return vm;
+}
+
+int main(void)
+{
+	struct pvclock_vcpu_time_info pvti;
+	struct kvm_xen_vcpu_attr runstate_save;
+	struct kvm_vcpu *vcpu;
+	struct kvm_vm *vm;
+	struct ucall uc;
+	uint64_t tsc_offset;
+	int ret;
+
+	/* === SOURCE SIDE === */
+	pr_info("=== Source: create VM and run guest ===\n");
+	vm = create_xen_vm(&vcpu);
+
+	/* Run guest once to accumulate some runstate time */
+	vcpu_run(vcpu);
+	TEST_ASSERT_KVM_EXIT_REASON(vcpu, KVM_EXIT_IO);
+	TEST_ASSERT_EQ(get_ucall(vcpu, &uc), UCALL_SYNC);
+
+	pr_info("  Guest sees: runnable=%" PRIu64 " running=%" PRIu64 "\n",
+		uc.args[2], uc.args[3]);
+
+	/* Save clock state */
+	ret = __vcpu_ioctl(vcpu, KVM_GET_CLOCK_GUEST, &pvti);
+	TEST_ASSERT(!ret, "KVM_GET_CLOCK_GUEST failed");
+
+	/* Save TSC offset */
+	tsc_offset = vcpu_get_msr(vcpu, MSR_IA32_TSC_ADJUST);
+
+	/* Save runstate — the vCPU is now "runnable" (not running) */
+	runstate_save.type = KVM_XEN_VCPU_ATTR_TYPE_RUNSTATE_DATA;
+	vcpu_ioctl(vcpu, KVM_XEN_VCPU_GET_ATTR, &runstate_save);
+
+	/*
+	 * Transition to runnable state before saving — the vCPU is
+	 * not running during migration.
+	 */
+	runstate_save.u.runstate.state = RUNSTATE_runnable;
+
+	pr_info("  Saved runstate: running=%" PRIu64 " runnable=%" PRIu64
+		" entry=%" PRIu64 "\n",
+		(uint64_t)runstate_save.u.runstate.time_running,
+		(uint64_t)runstate_save.u.runstate.time_runnable,
+		(uint64_t)runstate_save.u.runstate.state_entry_time);
+
+	uint64_t saved_runnable = runstate_save.u.runstate.time_runnable;
+
+	kvm_vm_release(vm);
+
+	/* === MIGRATION GAP === */
+	pr_info("=== Simulating migration (sleeping 10ms) ===\n");
+	usleep(10000);
+
+	/* === DESTINATION SIDE === */
+	pr_info("=== Destination: create new VM and restore ===\n");
+	vm = create_xen_vm(&vcpu);
+
+	/* Restore TSC offset */
+	vcpu_set_msr(vcpu, MSR_IA32_TSC_ADJUST, tsc_offset);
+
+	/* Restore clock — kvmclock will now be ~10ms ahead of the snapshot */
+	vcpu_ioctl(vcpu, KVM_SET_CLOCK_GUEST, &pvti);
+
+	/* Restore runstate exactly as saved (state=runnable) */
+	runstate_save.type = KVM_XEN_VCPU_ATTR_TYPE_RUNSTATE_DATA;
+	ret = __vcpu_ioctl(vcpu, KVM_XEN_VCPU_SET_ATTR, &runstate_save);
+	TEST_ASSERT(!ret, "Restore runstate failed: errno %d", errno);
+
+	/*
+	 * Run the guest. When the vCPU enters vcpu_run, the kernel
+	 * transitions from RUNSTATE_runnable to RUNSTATE_running.
+	 * It computes: delta = kvmclock_now - state_entry_time
+	 * This delta (which includes the migration gap) is added to
+	 * time_runnable (steal time).
+	 */
+	vcpu_run(vcpu);
+	TEST_ASSERT_KVM_EXIT_REASON(vcpu, KVM_EXIT_IO);
+	TEST_ASSERT_EQ(get_ucall(vcpu, &uc), UCALL_SYNC);
+
+	uint64_t guest_runnable = uc.args[2];
+	uint64_t guest_running = uc.args[3];
+
+	pr_info("  Guest sees: runnable=%" PRIu64 " running=%" PRIu64 "\n",
+		guest_runnable, guest_running);
+
+	uint64_t steal_increase = guest_runnable - saved_runnable;
+	pr_info("  Steal time increase: %" PRIu64 " ns (migration gap)\n",
+		steal_increase);
+
+	/*
+	 * The steal time increase should be at least 10ms (the sleep)
+	 * but not more than 5s (allowing for VM creation overhead).
+	 * The actual gap is from the source's state_entry_time to the
+	 * destination's kvmclock "now" at vcpu_load time.
+	 */
+	TEST_ASSERT(steal_increase >= 10000000ULL &&
+		    steal_increase < 5000000000ULL,
+		    "Steal time increase %" PRIu64 " ns not in expected range "
+		    "[10ms, 5s]", steal_increase);
+
+	kvm_vm_release(vm);
+	pr_info("PASS: Migration gap correctly accounted as steal time\n");
+	return 0;
+}
-- 
2.54.0


