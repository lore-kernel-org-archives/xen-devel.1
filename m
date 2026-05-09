Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 827EACD37B7
	for <xen-devel@archiver.kernel.org>; Sat,  9 May 2026 22:49:24 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1304992.1577606 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wLqTX-0005C8-BL; Sat, 09 May 2026 22:48:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1304992.1577606; Sat, 09 May 2026 22:48:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wLqTX-0005B4-4l; Sat, 09 May 2026 22:48:47 +0000
Received: by outflank-mailman (input) for mailman id 1304992;
 Sat, 09 May 2026 22:48:45 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <BATV+9b8b472e89b521af7d3c+8294+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1wLqTV-0004xy-8i
 for xen-devel@lists.xenproject.org; Sat, 09 May 2026 22:48:45 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wLqTU-008qns-Lo; Sun, 10 May 2026 00:48:44 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <BATV+9b8b472e89b521af7d3c+8294+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 69ffb87f-2eae-0a2a0a5409dd-0a2a4501d5b6-32
 for <multiple-recipients>; Sun, 10 May 2026 00:48:44 +0200
Received: from [90.155.92.199] (helo=desiato.infradead.org)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from
 <BATV+9b8b472e89b521af7d3c+8294+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 69ffb9cb-c1f2-0a2a45010019-5a9b5cc7a03e-3
 for <multiple-recipients>; Sun, 10 May 2026 00:48:43 +0200
Received: from [2001:8b0:10b:1::425] (helo=i7.infradead.org)
 by desiato.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
 id 1wLqTD-00000008wz9-0U27; Sat, 09 May 2026 22:48:28 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.98.2 #2 (Red
 Hat Linux)) id 1wLqTC-0000000DhHd-1ExZ;
 Sat, 09 May 2026 23:48:26 +0100
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
	bh=VZW3BYOsJBjCxrX0Ak3Y7mLfSYoVJvjVzeACh4h0wdA=; b=F8o2huYCyGm1b+IKEhxif0OKZe
	1/VjHOyqiLIQDr1VUqRvk7k4ZwOHLp8x2xUQoPmNubIdn/Y9PGOOKLUCPS0Bd6huZraf2VXT69Tcy
	PrYoG0wU7gMusTyFns2Sk+299Y82Z4fHtRYuTFtZd8fvUT/6x9Lu9Uqy/UPrHonTZFD7kEszHE5Es
	s0CbR3wEQ7PbLtr3p6fRXS1cxQxf/q+QIwcW3ESwiOvm2ZnZymrCuIOOmVlJ0ZsoEgLs3M07cKcok
	GwmW2q+R9tkBkUh3woXo6m/KggKAhiNjMtxICUNY9cdd96vI/ocFJGk0T4R8oFSPGI1cygwDPHqGH
	zDppAOQA==;
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
Subject: [PATCH v4 06/30] KVM: x86: Explicitly disable TSC scaling without CONSTANT_TSC
Date: Sat,  9 May 2026 23:46:32 +0100
Message-ID: <20260509224824.3264567-7-dwmw2@infradead.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260509224824.3264567-1-dwmw2@infradead.org>
References: <20260509224824.3264567-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: David Woodhouse <dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by desiato.infradead.org. See http://www.infradead.org/rpr.html
X-purgate-ID: tlsNG-d62444/1778366924-AEF58FF4-D61C0A67/0/0
X-purgate-type: clean
X-purgate-size: 1884

From: David Woodhouse <dwmw@amazon.co.uk>

KVM does make an attempt to cope with non-constant TSC, and has
notifiers to handle host TSC frequency changes. However, it *only*
adjusts the KVM clock, and doesn't adjust TSC frequency scaling when
the host changes.

This is presumably because non-constant TSCs were fixed in hardware
long before TSC scaling was implemented, so there should never be real
CPUs which have TSC scaling but *not* CONSTANT_TSC.

Such a combination could potentially happen in some odd L1 nesting
environment, but it isn't worth trying to support it. Just make the
dependency explicit.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
Reviewed-by: Paul Durrant <paul@xen.org>
---
 arch/x86/kvm/svm/svm.c | 3 ++-
 arch/x86/kvm/vmx/vmx.c | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kvm/svm/svm.c b/arch/x86/kvm/svm/svm.c
index e7fdd7a9c280..7817752533fe 100644
--- a/arch/x86/kvm/svm/svm.c
+++ b/arch/x86/kvm/svm/svm.c
@@ -5546,7 +5546,8 @@ static __init int svm_hardware_setup(void)
 				     XFEATURE_MASK_BNDCSR);
 
 	if (tsc_scaling) {
-		if (!boot_cpu_has(X86_FEATURE_TSCRATEMSR)) {
+		if (!boot_cpu_has(X86_FEATURE_TSCRATEMSR) ||
+		    !boot_cpu_has(X86_FEATURE_CONSTANT_TSC)) {
 			tsc_scaling = false;
 		} else {
 			pr_info("TSC scaling supported\n");
diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
index 5c2c33a5f7dc..4f6035d72bbe 100644
--- a/arch/x86/kvm/vmx/vmx.c
+++ b/arch/x86/kvm/vmx/vmx.c
@@ -8696,7 +8696,7 @@ __init int vmx_hardware_setup(void)
 	if (!enable_apicv || !cpu_has_vmx_ipiv())
 		enable_ipiv = false;
 
-	if (cpu_has_vmx_tsc_scaling())
+	if (cpu_has_vmx_tsc_scaling() && boot_cpu_has(X86_FEATURE_CONSTANT_TSC))
 		kvm_caps.has_tsc_control = true;
 
 	kvm_caps.max_tsc_scaling_ratio = KVM_VMX_TSC_MULTIPLIER_MAX;
-- 
2.51.0


