Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A74ACC43458
	for <xen-devel@archiver.kernel.org>; Fri,  3 Jul 2026 21:24:00 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1353896.1609659 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wflMY-0007At-4J; Fri, 03 Jul 2026 21:23:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1353896.1609659; Fri, 03 Jul 2026 21:23:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wflMX-00079A-Ue; Fri, 03 Jul 2026 21:23:53 +0000
Received: by outflank-mailman (input) for mailman id 1353896;
 Fri, 03 Jul 2026 21:23:52 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <BATV+ac8634115322beed580f+8349+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1wflMW-0006v5-KE
 for xen-devel@lists.xenproject.org; Fri, 03 Jul 2026 21:23:52 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wflMW-000kw0-1F; Fri, 03 Jul 2026 23:23:52 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <BATV+ac8634115322beed580f+8349+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 6a482832-2eae-0a2a0a5409dd-0a2a450b92fe-38
 for <multiple-recipients>; Fri, 03 Jul 2026 23:23:52 +0200
Received: from [90.155.92.199] (helo=desiato.infradead.org)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <BATV+ac8634115322beed580f+8349+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 6a482867-ac48-0a2a450b0019-5a9b5cc7a076-3
 for <multiple-recipients>; Fri, 03 Jul 2026 23:23:51 +0200
Received: from [2001:8b0:10b:1::425] (helo=i7.infradead.org)
 by desiato.infradead.org with esmtpsa (Exim 4.99.2 #2 (Red Hat Linux))
 id 1wflKc-000000059Ny-3C3B; Fri, 03 Jul 2026 21:23:38 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.99.2 #2 (Red
 Hat Linux)) id 1wflKW-00000001ROH-0fUc;
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
	bh=v5twNDtsGAUIy7fgp54AfjET8D0248IAEiPECDLBGtY=; b=D3raY3MtOWfOex9Yyi+xdwR0oR
	uH968+lTAMciyl5YT2WpYYHWkV4kZsN8/ZHM2GRGrwrBj9ui5GYmD9fG5F2abnWtV4WzOKBvaPhA2
	Q0QkFD8RDTCmadp3BR9IBi8DDKktdVZV77/JpgdmtpX0sSXUozU4PcguLEOrURgnnk/FD1DDwvg11
	GhxzUTCQtWepYdtdsACcCD7qQa4cSuaOUyBMo3ystxYHRyA1I0arDUTqQRtVZrp2cyUSbbXeGS0Ie
	iCh4Z9aESsuLp+Ly/0B9HNI3BAqiQTUd6lP1/mWLYFZqczT8/eBEz4K0SdSrfmyS9ogn3nh0vMR4J
	oqQGhlcA==;
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
Subject: [PATCH v6 08/36] KVM: x86: Activate master clock immediately on vCPU creation
Date: Fri,  3 Jul 2026 22:17:47 +0100
Message-ID: <20260703212145.343527-9-dwmw2@infradead.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260703212145.343527-1-dwmw2@infradead.org>
References: <20260703212145.343527-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: David Woodhouse <dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by desiato.infradead.org. See http://www.infradead.org/rpr.html
X-purgate-ID: tlsNG-42698a/1783113832-A7B30220-98314000/0/0
X-purgate-type: clean
X-purgate-size: 1254

From: David Woodhouse <dwmw@amazon.co.uk>

Previously, the master clock was only activated when the first vCPU
processed KVM_REQ_MASTERCLOCK_UPDATE during KVM_RUN. This meant that
KVM_GET_CLOCK could not return the host_tsc field until after the
first KVM_RUN, making it impossible for userspace to follow the
documented TSC migration procedure without a dummy vCPU run.

Fix this by calling kvm_update_masterclock() directly from
kvm_arch_vcpu_postcreate(), after kvm_synchronize_tsc() has already
set all_vcpus_matched_freq. This ensures the master clock is active
immediately, and KVM_GET_CLOCK returns a valid {host_tsc, realtime}
pair as soon as a vCPU exists.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 arch/x86/kvm/x86.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index ff45577ed90c..2039bd8518fb 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -13110,6 +13110,8 @@ void kvm_arch_vcpu_postcreate(struct kvm_vcpu *vcpu)
 		return;
 	vcpu_load(vcpu);
 	kvm_synchronize_tsc(vcpu, NULL);
+	if (!vcpu->kvm->arch.use_master_clock)
+		kvm_update_masterclock(vcpu->kvm);
 	vcpu_put(vcpu);
 
 	/* poll control enabled by default */
-- 
2.54.0


