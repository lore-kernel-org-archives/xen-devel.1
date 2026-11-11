Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D2E9606AE22
	for <xen-devel@archiver.kernel.org>; Wed, 11 Nov 2026 18:09:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=m1HC/fXW
Received: from list by lists.xenproject.org with outflank-mailman.1484481.1687831 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRClK-00009d-CE; Wed, 11 Nov 2026 18:09:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1484481.1687831; Wed, 11 Nov 2026 18:09:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRClJ-00007h-Rk; Wed, 11 Nov 2026 18:09:33 +0000
Received: by outflank-mailman (input) for mailman id 1484481;
 Wed, 11 Nov 2026 18:09:31 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <BATV+abad5507353db368323c+8480+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1xRClH-00089M-Fv
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2026 18:09:31 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xRClG-001L0E-Sw; Wed, 11 Nov 2026 19:09:30 +0100
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <BATV+abad5507353db368323c+8480+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 6af4af58-e002-0a2a0a5209dd-0a2a450baae0-8
 for <multiple-recipients>; Wed, 11 Nov 2026 19:09:30 +0100
Received: from [90.155.50.34] (helo=casper.infradead.org)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <BATV+abad5507353db368323c+8480+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 6af4af55-b7e8-0a2a450b0019-5a9b3222b440-3
 for <multiple-recipients>; Wed, 11 Nov 2026 19:09:25 +0100
Received: from [2001:8b0:10b:1::425] (helo=i7.infradead.org)
 by casper.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
 id 1xRCl9-0000000CKvV-1Puz; Wed, 11 Nov 2026 18:09:23 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.99.5 #2 (Red
 Hat Linux)) id 1xRCl9-0000000HWsa-0a3H;
 Wed, 11 Nov 2026 18:09:23 +0000
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
	bh=CwMbftQQz760x46CNDvM8hDlvtc6TEl7MUzV2LCVoJ8=; b=m1HC/fXWMOhVcPBaVX9ACJgkhP
	iXh3emo0NGR0nWK2rwd8+E0IrGrZxZBfaiw4HEggmHieFrvcE1iFTJ0r3byuFZqxXgg3YEMPS7FOf
	eIJJGd0Fg4BqDjuNZx3szMRg0+whVz6xwejmjhGhgfBlc0ZPmCi4LM2+o62EOfOCYQ50V3OgHWH/w
	5E0bE/PoUaTZKSRAJOgjX5olCtGmil9IVoA9yDoWgBPqYJslPFpa5FWtDhqbyjsMZ+GFAfFHFkDaX
	nIVhEMQYFKCx0bcKteGqzwYhruC3nsiI5wnrAmHKfBZoS5Sjkm2GdsYEF1fP/BX7xIwd43vBWVdY7
	RmVqXlYw==;
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
Subject: [PATCH v13 09/26] KVM: x86: Stop TSC catchup when a frequency change no longer needs it
Date: Wed, 11 Nov 2026 10:09:05 -0800
Message-ID: <20261111180922.4177927-10-dwmw2@infradead.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261111180922.4177927-1-dwmw2@infradead.org>
References: <20261111180922.4177927-1-dwmw2@infradead.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: David Woodhouse <dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
X-purgate-ID: tlsNG-42698a/1794420570-ABCD79EA-99963842/0/0
X-purgate-type: clean
X-purgate-size: 2125
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: David Woodhouse <dwmw@amazon.co.uk>

On hardware without TSC scaling, KVM_SET_TSC_KHZ with a frequency above
the host's puts the vCPU into always-catchup mode. Nothing ever takes
it back out: a later KVM_SET_TSC_KHZ restoring a frequency within
tsc_tolerance_ppm of the host's, where no scaling or catchup is needed,
leaves the vCPU paying the catchup overhead on every clock update for
the rest of its life — and KVM_HC_CLOCK_PAIRING stays disabled, since
it rejects always-catchup mode.

Clear the pairing whenever set_tsc_khz() succeeds with a frequency
which does not need it. Only that pairing: tsc_catchup alone also
serves the unstable-host-TSC compensation in kvm_arch_vcpu_load(),
which must not be disturbed.

Fixes: cc578287e322 ("KVM: Infrastructure for software and hardware based TSC rate scaling")
Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 arch/x86/kvm/x86.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 0b3b04a156da..1d4b66257b35 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -1031,7 +1031,7 @@ static int set_tsc_khz(struct kvm_vcpu *vcpu, u32 user_tsc_khz, bool scale)
 	/* Guest TSC same frequency as host TSC? */
 	if (!scale) {
 		kvm_vcpu_write_tsc_multiplier(vcpu, kvm_caps.default_tsc_scaling_ratio);
-		return 0;
+		goto clear_catchup;
 	}
 
 	/* TSC scaling supported? */
@@ -1057,6 +1057,19 @@ static int set_tsc_khz(struct kvm_vcpu *vcpu, u32 user_tsc_khz, bool scale)
 	}
 
 	kvm_vcpu_write_tsc_multiplier(vcpu, ratio);
+
+clear_catchup:
+	/*
+	 * A frequency which no longer needs catchup must also stop it: a
+	 * previous above-host-rate setting on scaling-less hardware set
+	 * the always-catchup flags, and nothing else ever clears them.
+	 * Only undo that pairing — tsc_catchup alone also serves the
+	 * unstable-host-TSC compensation in kvm_arch_vcpu_load().
+	 */
+	if (vcpu->arch.tsc_always_catchup) {
+		vcpu->arch.tsc_always_catchup = 0;
+		vcpu->arch.tsc_catchup = 0;
+	}
 	return 0;
 }
 
-- 
2.43.0


