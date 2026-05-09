Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32D25CD3447
	for <xen-devel@archiver.kernel.org>; Sat,  9 May 2026 22:53:12 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1305121.1577817 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wLqXf-0007sI-Jt; Sat, 09 May 2026 22:53:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1305121.1577817; Sat, 09 May 2026 22:53:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wLqXf-0007re-Bq; Sat, 09 May 2026 22:53:03 +0000
Received: by outflank-mailman (input) for mailman id 1305121;
 Sat, 09 May 2026 22:53:02 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <BATV+9b8b472e89b521af7d3c+8294+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1wLqXe-0007ik-0l
 for xen-devel@lists.xenproject.org; Sat, 09 May 2026 22:53:02 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wLqXd-006SzZ-Dj; Sun, 10 May 2026 00:53:01 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <BATV+9b8b472e89b521af7d3c+8294+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 69ffbac8-bab6-0a2a0a5309dd-0a2a45058fce-2
 for <multiple-recipients>; Sun, 10 May 2026 00:53:01 +0200
Received: from [90.155.92.199] (helo=desiato.infradead.org)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from
 <BATV+9b8b472e89b521af7d3c+8294+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 69ffb9dc-aaa8-0a2a45050019-5a9b5cc785ee-3
 for <multiple-recipients>; Sun, 10 May 2026 00:49:00 +0200
Received: from [2001:8b0:10b:1::425] (helo=i7.infradead.org)
 by desiato.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
 id 1wLqTD-00000008wzL-0Tzi; Sat, 09 May 2026 22:48:27 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.98.2 #2 (Red
 Hat Linux)) id 1wLqTD-0000000DhIn-0aFl;
 Sat, 09 May 2026 23:48:27 +0100
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
	bh=gfI2hlP2ghO7kkyYaxpeS6acpLBXM/Xjzeg1dOVvOBY=; b=QRXeSw9e0EZn2zrMh0ZMFdeOuH
	gWYH1Am3+0BI9z6x5jPUh85q3k5sy+S+6PCYf+8U0ulYWYrn5/9WtjOSvz+Fb4yRPvNn8wMEVq2Ee
	FqXuKANiZmVNTzEwuvyyzfQAkk5rPcDM94g8+018sWE0TCxEZYMBGG0dANDcR7FGqRlFbpFf7uuVt
	L++xNEjHUy1cqZyLQx3TVzs2EHXd6EoPsZIbj3oBDvKW5wu6DgH0+fohc1QpxXw+gtceIic+69G9B
	p1nYyIjwdlj0NMHJxzeg3E8VYyVWxIgA+QxNsssMNKPpcSi3HsTIune8KieKthZ++YCViDvVKCj83
	1riSTOmA==;
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
Subject: [PATCH v4 24/30] KVM: x86: Avoid gratuitous global clock updates
Date: Sat,  9 May 2026 23:46:50 +0100
Message-ID: <20260509224824.3264567-25-dwmw2@infradead.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260509224824.3264567-1-dwmw2@infradead.org>
References: <20260509224824.3264567-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: David Woodhouse <dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by desiato.infradead.org. See http://www.infradead.org/rpr.html
X-purgate-ID: tlsNG-c201ff/1778366940-E119B443-EB3518E7/13/0
X-purgate-type: clean
X-purgate-size: 2521

From: David Woodhouse <dwmw@amazon.co.uk>

Eliminate three sources of unnecessary KVM_REQ_GLOBAL_CLOCK_UPDATE:

1. kvm_write_system_time(): The global clock update was a workaround for
   ever-drifting clocks based on the host's CLOCK_MONOTONIC subject to
   NTP skew. On booting or resuming a guest, it just leads to running
   kvm_guest_time_update() twice for each vCPU for no good reason. Use
   KVM_REQ_CLOCK_UPDATE on the vCPU itself, and only when the clock is
   being enabled, not disabled.

2. kvm_arch_vcpu_load(): Use KVM_REQ_CLOCK_UPDATE instead of
   KVM_REQ_GLOBAL_CLOCK_UPDATE. There is no need to update all vCPUs'
   clocks when one vCPU is loaded.

3. kvm_gen_kvmclock_update(): Skip the periodic global update entirely
   when in master clock mode, since the clock is defined precisely by
   the guest TSC and doesn't drift.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
Reviewed-by: Paul Durrant <paul@xen.org>
---
 arch/x86/kvm/x86.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 0656d901fe79..7d9ec0638d28 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -2457,13 +2457,13 @@ static void kvm_write_system_time(struct kvm_vcpu *vcpu, gpa_t system_time,
 	}
 
 	vcpu->arch.time = system_time;
-	kvm_make_request(KVM_REQ_GLOBAL_CLOCK_UPDATE, vcpu);
 
 	/* we verify if the enable bit is set... */
-	if (system_time & 1)
+	if (system_time & 1) {
 		kvm_gpc_activate(&vcpu->arch.pv_time, system_time & ~1ULL,
 				 sizeof(struct pvclock_vcpu_time_info));
-	else
+		kvm_make_request(KVM_REQ_CLOCK_UPDATE, vcpu);
+	} else
 		kvm_gpc_deactivate(&vcpu->arch.pv_time);
 
 	return;
@@ -3638,6 +3638,10 @@ static void kvm_gen_kvmclock_update(struct kvm_vcpu *v)
 	struct kvm_vcpu *vcpu;
 	struct kvm *kvm = v->kvm;
 
+	/* In master clock mode, the clock doesn't need periodic updates. */
+	if (kvm->arch.use_master_clock)
+		return;
+
 	kvm_for_each_vcpu(i, vcpu, kvm) {
 		kvm_make_request(KVM_REQ_CLOCK_UPDATE, vcpu);
 		kvm_vcpu_kick(vcpu);
@@ -5339,7 +5343,7 @@ void kvm_arch_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
 		 * kvmclock on vcpu->cpu migration
 		 */
 		if (!vcpu->kvm->arch.use_master_clock || vcpu->cpu == -1)
-			kvm_make_request(KVM_REQ_GLOBAL_CLOCK_UPDATE, vcpu);
+			kvm_make_request(KVM_REQ_CLOCK_UPDATE, vcpu);
 		if (vcpu->cpu != cpu)
 			kvm_make_request(KVM_REQ_MIGRATE_TIMER, vcpu);
 		vcpu->cpu = cpu;
-- 
2.51.0


