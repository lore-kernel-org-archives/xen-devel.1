Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B161606A8AF
	for <xen-devel@archiver.kernel.org>; Wed, 11 Nov 2026 18:10:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=efTTLN+X
Received: from list by lists.xenproject.org with outflank-mailman.1484494.1687953 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRClb-0003dl-5i; Wed, 11 Nov 2026 18:09:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1484494.1687953; Wed, 11 Nov 2026 18:09:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRClZ-0003Z5-S7; Wed, 11 Nov 2026 18:09:49 +0000
Received: by outflank-mailman (input) for mailman id 1484494;
 Wed, 11 Nov 2026 18:09:34 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <BATV+6fbd95a72608138381e9+8480+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1xRClK-00006F-0F
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2026 18:09:34 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xRClJ-001L0E-Av; Wed, 11 Nov 2026 19:09:33 +0100
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <BATV+6fbd95a72608138381e9+8480+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 6af4af51-e002-0a2a0a5209dd-0a2a4508d8d8-14
 for <multiple-recipients>; Wed, 11 Nov 2026 19:09:33 +0100
Received: from [90.155.92.199] (helo=desiato.infradead.org)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <BATV+6fbd95a72608138381e9+8480+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 6af4af57-f659-0a2a45080019-5a9b5cc7c5ec-3
 for <multiple-recipients>; Wed, 11 Nov 2026 19:09:28 +0100
Received: from [2001:8b0:10b:1::425] (helo=i7.infradead.org)
 by desiato.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
 id 1xRClB-00000009PvR-3Ctb; Wed, 11 Nov 2026 18:09:25 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.99.5 #2 (Red
 Hat Linux)) id 1xRCl9-0000000HWt7-23xv;
 Wed, 11 Nov 2026 18:09:23 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=desiato.20200630 header.d=infradead.org header.i="@infradead.org" header.h="Sender:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=iIYMQDfTQ0ULEEJl8+/Ov/AE8lIxjPKWswOvOCyc1OM=; b=efTTLN+X2ESK4J6l6MZpAjrLfl
	50KBNF9qmHwoujN2WeQ7k/kQmP6ctq3v/I9AdKBS8KGTZHLpqTLJLLY2nM+fCDX0+HrjE1lelRtpQ
	EpLlMUklhPaZn5QRIFXdLhBGb68r9AmC1cFfEdJlCrVVqYfAMnkrZft2O/mcehO8w25QHh0/m9gtW
	jXCyXSOeETrwPhmBhLQ+41vazEZ0KFBlNZxE4/C27PImq/xAOPVnMBfWFi/TtUNsOZXuBqBHwsyTm
	lEEhiXf3P9BQd/B1AypeHprvMyT50vxK+SUl0o4REgHaGInx6oPsVQGTUH7Ik9ikRG+43YuGaUUGb
	RD/CEatg==;
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
Subject: [PATCH v13 17/26] KVM: selftests: Add library helpers for clock and TSC-offset ioctls
Date: Wed, 11 Nov 2026 10:09:13 -0800
Message-ID: <20261111180922.4177927-18-dwmw2@infradead.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261111180922.4177927-1-dwmw2@infradead.org>
References: <20261111180922.4177927-1-dwmw2@infradead.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: David Woodhouse <dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by desiato.infradead.org. See http://www.infradead.org/rpr.html
X-purgate-ID: tlsNG-c1860d/1794420573-CD14E87B-33B5D454/0/0
X-purgate-type: clean
X-purgate-size: 5566
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: David Woodhouse <dwmw@amazon.co.uk>

Add wrappers for KVM_[GS]ET_CLOCK_GUEST, the KVM_VCPU_TSC_OFFSET device
attribute and KVM_[GS]ET_CLOCK to the x86 library header, so that the
KVM clock selftests don't each open-code the same ioctl invocations,
and convert the existing open-coded call sites in kvm_clock_test,
hyperv_clock, xen_shinfo_test and system_counter_offset_test.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 .../selftests/kvm/include/x86/processor.h     | 50 +++++++++++++++++++
 .../kvm/system_counter_offset_test.c          |  3 +-
 .../testing/selftests/kvm/x86/hyperv_clock.c  |  2 +-
 .../selftests/kvm/x86/kvm_clock_test.c        |  6 +--
 .../selftests/kvm/x86/xen_shinfo_test.c       |  2 +-
 5 files changed, 56 insertions(+), 7 deletions(-)

diff --git a/tools/testing/selftests/kvm/include/x86/processor.h b/tools/testing/selftests/kvm/include/x86/processor.h
index 5898a277a2e0..4062bdb32716 100644
--- a/tools/testing/selftests/kvm/include/x86/processor.h
+++ b/tools/testing/selftests/kvm/include/x86/processor.h
@@ -12,6 +12,7 @@
 
 #include <asm/msr-index.h>
 #include <asm/prctl.h>
+#include <asm/pvclock-abi.h>
 
 #include <linux/kvm_para.h>
 #include <linux/stringify.h>
@@ -1029,6 +1030,55 @@ static inline void vcpu_xcrs_set(struct kvm_vcpu *vcpu, struct kvm_xcrs *xcrs)
 	vcpu_ioctl(vcpu, KVM_SET_XCRS, xcrs);
 }
 
+static inline int __vcpu_get_clock_guest(struct kvm_vcpu *vcpu,
+					 struct pvclock_vcpu_time_info *pvti)
+{
+	return __vcpu_ioctl(vcpu, KVM_GET_CLOCK_GUEST, pvti);
+}
+
+static inline void vcpu_get_clock_guest(struct kvm_vcpu *vcpu,
+					struct pvclock_vcpu_time_info *pvti)
+{
+	vcpu_ioctl(vcpu, KVM_GET_CLOCK_GUEST, pvti);
+}
+
+static inline int __vcpu_set_clock_guest(struct kvm_vcpu *vcpu,
+					 struct pvclock_vcpu_time_info *pvti)
+{
+	return __vcpu_ioctl(vcpu, KVM_SET_CLOCK_GUEST, pvti);
+}
+
+static inline void vcpu_set_clock_guest(struct kvm_vcpu *vcpu,
+					struct pvclock_vcpu_time_info *pvti)
+{
+	vcpu_ioctl(vcpu, KVM_SET_CLOCK_GUEST, pvti);
+}
+
+static inline u64 vcpu_get_tsc_offset(struct kvm_vcpu *vcpu)
+{
+	u64 offset;
+
+	vcpu_device_attr_get(vcpu, KVM_VCPU_TSC_CTRL, KVM_VCPU_TSC_OFFSET,
+			     &offset);
+	return offset;
+}
+
+static inline void vcpu_set_tsc_offset(struct kvm_vcpu *vcpu, u64 offset)
+{
+	vcpu_device_attr_set(vcpu, KVM_VCPU_TSC_CTRL, KVM_VCPU_TSC_OFFSET,
+			     &offset);
+}
+
+static inline void vm_get_clock(struct kvm_vm *vm, struct kvm_clock_data *data)
+{
+	vm_ioctl(vm, KVM_GET_CLOCK, data);
+}
+
+static inline void vm_set_clock(struct kvm_vm *vm, struct kvm_clock_data *data)
+{
+	vm_ioctl(vm, KVM_SET_CLOCK, data);
+}
+
 const struct kvm_cpuid_entry2 *get_cpuid_entry(const struct kvm_cpuid2 *cpuid,
 					       u32 function, u32 index);
 const struct kvm_cpuid2 *kvm_get_supported_cpuid(void);
diff --git a/tools/testing/selftests/kvm/system_counter_offset_test.c b/tools/testing/selftests/kvm/system_counter_offset_test.c
index dc5e30b7b77f..f864e66dc789 100644
--- a/tools/testing/selftests/kvm/system_counter_offset_test.c
+++ b/tools/testing/selftests/kvm/system_counter_offset_test.c
@@ -35,8 +35,7 @@ static void check_preconditions(struct kvm_vcpu *vcpu)
 
 static void setup_system_counter(struct kvm_vcpu *vcpu, struct test_case *test)
 {
-	vcpu_device_attr_set(vcpu, KVM_VCPU_TSC_CTRL, KVM_VCPU_TSC_OFFSET,
-			     &test->tsc_offset);
+	vcpu_set_tsc_offset(vcpu, test->tsc_offset);
 }
 
 static u64 guest_read_system_counter(struct test_case *test)
diff --git a/tools/testing/selftests/kvm/x86/hyperv_clock.c b/tools/testing/selftests/kvm/x86/hyperv_clock.c
index 7a1b3b5d1e62..ced3d9873f9a 100644
--- a/tools/testing/selftests/kvm/x86/hyperv_clock.c
+++ b/tools/testing/selftests/kvm/x86/hyperv_clock.c
@@ -254,7 +254,7 @@ int main(void)
 		if (stage == 7 || stage == 8 || stage == 10) {
 			struct kvm_clock_data clock = {0};
 
-			vm_ioctl(vm, KVM_SET_CLOCK, &clock);
+			vm_set_clock(vm, &clock);
 		}
 	}
 
diff --git a/tools/testing/selftests/kvm/x86/kvm_clock_test.c b/tools/testing/selftests/kvm/x86/kvm_clock_test.c
index 5ad4aeb8e373..0028a40b8a3e 100644
--- a/tools/testing/selftests/kvm/x86/kvm_clock_test.c
+++ b/tools/testing/selftests/kvm/x86/kvm_clock_test.c
@@ -99,7 +99,7 @@ static void setup_clock(struct kvm_vm *vm, struct test_case *test_case)
 		data.realtime += test_case->realtime_offset;
 	}
 
-	vm_ioctl(vm, KVM_SET_CLOCK, &data);
+	vm_set_clock(vm, &data);
 }
 
 static void enter_guest(struct kvm_vcpu *vcpu)
@@ -112,10 +112,10 @@ static void enter_guest(struct kvm_vcpu *vcpu)
 	for (i = 0; i < ARRAY_SIZE(test_cases); i++) {
 		setup_clock(vm, &test_cases[i]);
 
-		vm_ioctl(vm, KVM_GET_CLOCK, &start);
+		vm_get_clock(vm, &start);
 
 		vcpu_run(vcpu);
-		vm_ioctl(vm, KVM_GET_CLOCK, &end);
+		vm_get_clock(vm, &end);
 
 		TEST_ASSERT_KVM_EXIT_REASON(vcpu, KVM_EXIT_IO);
 
diff --git a/tools/testing/selftests/kvm/x86/xen_shinfo_test.c b/tools/testing/selftests/kvm/x86/xen_shinfo_test.c
index 9045f03cf2d3..f251f8ea29ec 100644
--- a/tools/testing/selftests/kvm/x86/xen_shinfo_test.c
+++ b/tools/testing/selftests/kvm/x86/xen_shinfo_test.c
@@ -985,7 +985,7 @@ int main(int argc, char *argv[])
 	TEST_ASSERT(wc->version && !(wc->version & 1),
 		    "Bad wallclock version %x", wc->version);
 
-	vm_ioctl(vm, KVM_GET_CLOCK, &kcdata);
+	vm_get_clock(vm, &kcdata);
 
 	if (kcdata.flags & KVM_CLOCK_REALTIME) {
 		if (verbose) {
-- 
2.43.0


