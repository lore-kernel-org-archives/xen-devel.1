Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 343076082BE6
	for <xen-devel@archiver.kernel.org>; Mon,  9 Nov 2026 01:21:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=eRTdCHqg
Received: from list by lists.xenproject.org with outflank-mailman.1479233.1683322 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQE4f-0000xv-JY; Mon, 09 Nov 2026 01:21:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1479233.1683322; Mon, 09 Nov 2026 01:21:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQE4e-0000vq-VC; Mon, 09 Nov 2026 01:21:28 +0000
Received: by outflank-mailman (input) for mailman id 1479233;
 Mon, 09 Nov 2026 01:21:24 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <BATV+eaa65bbd42d4fabe269c+8478+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1xQE4Z-000834-On
 for xen-devel@lists.xenproject.org; Mon, 09 Nov 2026 01:21:23 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xQE4Z-0096DX-5J; Mon, 09 Nov 2026 02:21:23 +0100
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <BATV+eaa65bbd42d4fabe269c+8478+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 6af11fa8-bab6-0a2a0a5309dd-0a2a450cde16-48
 for <multiple-recipients>; Mon, 09 Nov 2026 02:21:23 +0100
Received: from [90.155.92.199] (helo=desiato.infradead.org)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <BATV+eaa65bbd42d4fabe269c+8478+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 6af1200d-f479-0a2a450c0019-5a9b5cc7dd12-3
 for <multiple-recipients>; Mon, 09 Nov 2026 02:21:17 +0100
Received: from [2001:8b0:10b:1::425] (helo=i7.infradead.org)
 by desiato.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
 id 1xQE4Q-00000006AYF-29HJ; Mon, 09 Nov 2026 01:21:14 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.99.5 #2 (Red
 Hat Linux)) id 1xQE4P-0000000EKV1-0MD2;
 Mon, 09 Nov 2026 01:21:13 +0000
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
	bh=E7RyVZdQRrFYW33Mv02BmWV0i6lT0Z4tqhtPA/W0mTY=; b=eRTdCHqga3teHg35lgOR34b6cn
	q5ONSuVeHNVKKRQhXyunsALN4W0snuo3P9WVT2d7Njg81U3m3z4gQXwrbGBsR9lv2Wf8dJpU7S83M
	mS4itC92IvwcCfkkkL7fNswxRUZUXwYCmS5TPnc/VqyBmamjBnBTKFmZoaHNNQVdUDN4YMI3S+pep
	mV1q+heYNq36ool1b3tGlQYF4Z2MKkTHnYtDnzZmJtcIbWycSi/Oq5y8mCLzq28umFgdLXjmZdtaX
	d4FWYiWkFNy/jOjxliGlMuPCKiag2jMn1tEXHwGnH8sP7zJYqSBVodjBlP4DFFubP9x/c34WmO5IP
	jISvsmkg==;
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
Subject: [PATCH v12 15/24] KVM: selftests: Add library helpers for clock and TSC-offset ioctls
Date: Sun,  8 Nov 2026 17:21:01 -0800
Message-ID: <20261109012112.3415328-16-dwmw2@infradead.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261109012112.3415328-1-dwmw2@infradead.org>
References: <20261109012112.3415328-1-dwmw2@infradead.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: David Woodhouse <dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by desiato.infradead.org. See http://www.infradead.org/rpr.html
X-purgate-ID: tlsNG-d25034/1794187282-5093EA5B-12E774EE/0/0
X-purgate-type: clean
X-purgate-size: 2556
X-Spam-Status: No, score=-14.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,UNWANTED_LANGUAGE_BODY,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: David Woodhouse <dwmw@amazon.co.uk>

Add wrappers for KVM_[GS]ET_CLOCK_GUEST, the KVM_VCPU_TSC_OFFSET device
attribute and KVM_[GS]ET_CLOCK to the x86 library header, so that the
KVM clock selftests don't each open-code the same ioctl invocations.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 .../selftests/kvm/include/x86/processor.h     | 50 +++++++++++++++++++
 1 file changed, 50 insertions(+)

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
-- 
2.43.0


