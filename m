Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDDB4C54FCD
	for <xen-devel@archiver.kernel.org>; Tue, 28 Jul 2026 14:50:34 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1374504.1621737 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1woj8N-0007CV-9p; Tue, 28 Jul 2026 14:50:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1374504.1621737; Tue, 28 Jul 2026 14:50:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1woj8M-00078s-FC; Tue, 28 Jul 2026 14:50:18 +0000
Received: by outflank-mailman (input) for mailman id 1374504;
 Tue, 28 Jul 2026 14:50:15 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <BATV+0bab86ec5884d1af5d78+8374+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1woj8I-0005zj-An
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2026 14:50:14 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1woj8H-00BbE3-NI; Tue, 28 Jul 2026 16:50:13 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <BATV+0bab86ec5884d1af5d78+8374+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 6a68c19e-e002-0a2a0a5209dd-0a2a45078960-32
 for <multiple-recipients>; Tue, 28 Jul 2026 16:50:13 +0200
Received: from [90.155.92.199] (helo=desiato.infradead.org)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <BATV+0bab86ec5884d1af5d78+8374+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 6a68c1a4-b4ea-0a2a45070019-5a9b5cc7c608-3
 for <multiple-recipients>; Tue, 28 Jul 2026 16:50:12 +0200
Received: from [2001:8b0:10b:1::425] (helo=i7.infradead.org)
 by desiato.infradead.org with esmtpsa (Exim 4.99.2 #2 (Red Hat Linux))
 id 1woj82-000000052Vc-34HU; Tue, 28 Jul 2026 14:49:59 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.99.4 #2 (Red
 Hat Linux)) id 1woj7z-00000001UYk-3Nx6;
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
	bh=ZqvrNTLgxi18JKJlS26csM7gdnaSdqsyE4DeULBEY64=; b=KxTOTCCjAfyOCGZkccXM7Ac4zu
	7k1iyiYMO6nvDy3VGr0NJS4ciOAudnPy1JET4yTGRG80X2tWmS5WFIYWISSqPtNzJr1vtosJwFPya
	GT9jOLz0KR04I4Fiuk0eKh3GPF1PerdJUlAoX2y6FkP4CTLrrSzVYcBuoWUwdGJpqQVSF2LnF8ZeL
	i+AOcdA/QhXFF8aX7hSCpYFEOq0/ceai9ItU+3tUSr2V0trWFf1jTACeL82n5e1/SThHoTVdxKGxJ
	qRs14OSLTdj+TVYph/ggcWtr6zEv9foueD6Qmykp9utI7Hb6J3XGsNU9+5PgzoUGK/R0V3AirMedh
	0i8m1Opg==;
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
Subject: [PATCH v7 19/36] KVM: x86: Avoid gratuitous global clock updates
Date: Tue, 28 Jul 2026 15:39:59 +0100
Message-ID: <20260728144954.355376-20-dwmw2@infradead.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260728144954.355376-1-dwmw2@infradead.org>
References: <20260728144954.355376-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: David Woodhouse <dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by desiato.infradead.org. See http://www.infradead.org/rpr.html
X-purgate-ID: tlsNG-ef75cf/1785250213-358C1AE4-E0A69A6F/0/0
X-purgate-type: clean
X-purgate-size: 2627

From: David Woodhouse <dwmw@amazon.co.uk>

Eliminate two sources of unnecessary KVM_REQ_GLOBAL_CLOCK_UPDATE:

1. kvm_write_system_time(): The global clock update was a workaround for
   ever-drifting clocks based on the host's CLOCK_MONOTONIC subject to
   NTP skew. Now that the KVM clock uses CLOCK_MONOTONIC_RAW, the clock
   does not drift with NTP corrections and there is no need to
   synchronize all vCPUs on boot or resume. Use KVM_REQ_CLOCK_UPDATE on
   the vCPU itself, and only when the clock is being enabled, not
   disabled.

2. kvm_arch_vcpu_load(): In master clock mode, migration between pCPUs
   does not require any clock update since the master clock reference is
   shared. Only request a local KVM_REQ_CLOCK_UPDATE for the vCPU's
   first-ever load (vcpu->cpu == -1) to generate initial pvclock params.
   In non-master-clock mode, keep the global update to synchronize all
   vCPUs.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 arch/x86/kvm/msrs.c | 6 +++---
 arch/x86/kvm/x86.c  | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/x86/kvm/msrs.c b/arch/x86/kvm/msrs.c
index 22ceb39d41f6..0806863fc68e 100644
--- a/arch/x86/kvm/msrs.c
+++ b/arch/x86/kvm/msrs.c
@@ -1275,13 +1275,13 @@ static void kvm_write_system_time(struct kvm_vcpu *vcpu, gpa_t system_time,
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
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index ce80ee808777..83db915ef1d4 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -2720,13 +2720,13 @@ void kvm_arch_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
 		 * On a host with synchronized TSC, there is no need to update
 		 * kvmclock on vcpu->cpu migration
 		 */
-		if (!vcpu->kvm->arch.use_master_clock || vcpu->cpu == -1) {
+		if (!vcpu->kvm->arch.use_master_clock) {
 			if (__ratelimit(&vcpu->kvm->arch.kvmclock_update_rs))
 				kvm_make_request(KVM_REQ_GLOBAL_CLOCK_UPDATE, vcpu);
 			else
 				kvm_make_request(KVM_REQ_CLOCK_UPDATE, vcpu);
-		}
-
+		} else if (vcpu->cpu == -1)
+			kvm_make_request(KVM_REQ_CLOCK_UPDATE, vcpu);
 		if (vcpu->cpu != cpu)
 			kvm_make_request(KVM_REQ_MIGRATE_TIMER, vcpu);
 		vcpu->cpu = cpu;
-- 
2.55.0


