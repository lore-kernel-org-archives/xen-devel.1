Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02E55606EE8F
	for <xen-devel@archiver.kernel.org>; Thu,  5 Nov 2026 15:50:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=ZcdGpA6p
Received: from list by lists.xenproject.org with outflank-mailman.1475017.1682000 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOzjO-00089F-55; Thu, 05 Nov 2026 15:50:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1475017.1682000; Thu, 05 Nov 2026 15:50:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOzjM-00087F-UF; Thu, 05 Nov 2026 15:50:24 +0000
Received: by outflank-mailman (input) for mailman id 1475017;
 Thu, 05 Nov 2026 15:50:10 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <BATV+a10630623031064a0c86+8474+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1xOzj8-0005Cp-HL
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 15:50:10 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOzj7-00GUz4-TW; Thu, 05 Nov 2026 16:50:09 +0100
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <BATV+a10630623031064a0c86+8474+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 6aeca5b1-8faa-0a2a0a5109dd-0a2a450cbe30-12
 for <multiple-recipients>; Thu, 05 Nov 2026 16:50:09 +0100
Received: from [90.155.50.34] (helo=casper.infradead.org)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <BATV+a10630623031064a0c86+8474+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 6aeca5a6-f479-0a2a450c0019-5a9b3222e880-3
 for <multiple-recipients>; Thu, 05 Nov 2026 16:49:58 +0100
Received: from [2001:8b0:10b:1::425] (helo=i7.infradead.org)
 by casper.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
 id 1xOziu-00000009aoq-0dWx; Thu, 05 Nov 2026 15:49:56 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.99.5 #2 (Red
 Hat Linux)) id 1xOzit-0000000AazM-3xHY;
 Thu, 05 Nov 2026 15:49:55 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=casper.20170209 header.d=infradead.org header.i="@infradead.org" header.h="Sender:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=+Bp/FraEPNEKgnVnaEnw6iNuhtXFkslibvECwlTvHqE=; b=ZcdGpA6p4Jpvl/hnSOPP0PjHv/
	eeUSBwF7bh55qJGD+CCING13IN7mFqESX25yk51b9VeLvgG4rbjs5xe8s0UTFKm4LqdldDD/tIZtF
	dG9+rgKGgqNn+BAiv5ZHViWGFDcT4mJofE0dNYAWQLik25Qdtkp0ppZIWLyPpyr0zLWPB/Po5fjUm
	SfkH/qeYivekcHSnsWOKZmJWKHBT/J3eS7feqBmxhrn5A22MEYZ0n23XYt2SfhqEMiY4bFLQpkXHS
	8/H/c+LfweYD+K4wNyQjIGJEe5BI/YFpAfzjG68e/WD1+lP4eOLg2hXQCYo9jfVgcSPILWa33Nuy1
	yRkQlxag==;
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
Subject: [PATCH v11 10/23] KVM: x86: Remove pvclock_gtod_data and private timekeeping code
Date: Thu,  5 Nov 2026 07:49:41 -0800
Message-ID: <20261105154955.2525419-11-dwmw2@infradead.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261105154955.2525419-1-dwmw2@infradead.org>
References: <20261105154955.2525419-1-dwmw2@infradead.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: David Woodhouse <dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
X-purgate-ID: tlsNG-d25034/1793893803-03AD4A5B-DBF46BDD/0/0
X-purgate-type: clean
X-purgate-size: 2800
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: David Woodhouse <dwmw@amazon.co.uk>

Remove the now-unused KVM-private timekeeping infrastructure:

 - struct pvclock_clock and struct pvclock_gtod_data
 - update_pvclock_gtod() and its seqcount-protected state copy
   (the private readers were already removed when their last callers
   went away)

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 arch/x86/kvm/x86.c | 56 ----------------------------------------------
 1 file changed, 56 deletions(-)

diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index e81e527e7b99..940168528721 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -889,60 +889,6 @@ static inline bool kvm_vcpu_exit_request(struct kvm_vcpu *vcpu)
 	       kvm_request_pending(vcpu) || xfer_to_guest_mode_work_pending();
 }
 
-#ifdef CONFIG_X86_64
-struct pvclock_clock {
-	int vclock_mode;
-	u64 cycle_last;
-	u64 mask;
-	u32 mult;
-	u32 shift;
-	u64 base_cycles;
-	u64 offset;
-};
-
-struct pvclock_gtod_data {
-	seqcount_t	seq;
-
-	struct pvclock_clock clock; /* extract of a clocksource struct */
-	struct pvclock_clock raw_clock; /* extract of a clocksource struct */
-
-	ktime_t		offs_boot;
-	u64		wall_time_sec;
-};
-
-static struct pvclock_gtod_data pvclock_gtod_data;
-
-static void update_pvclock_gtod(struct timekeeper *tk)
-{
-	struct pvclock_gtod_data *vdata = &pvclock_gtod_data;
-
-	write_seqcount_begin(&vdata->seq);
-
-	/* copy pvclock gtod data */
-	vdata->clock.vclock_mode	= tk->tkr_mono.clock->vdso_clock_mode;
-	vdata->clock.cycle_last		= tk->tkr_mono.cycle_last;
-	vdata->clock.mask		= tk->tkr_mono.mask;
-	vdata->clock.mult		= tk->tkr_mono.mult;
-	vdata->clock.shift		= tk->tkr_mono.shift;
-	vdata->clock.base_cycles	= tk->tkr_mono.xtime_nsec;
-	vdata->clock.offset		= tk->tkr_mono.base;
-
-	vdata->raw_clock.vclock_mode	= tk->tkr_raw.clock->vdso_clock_mode;
-	vdata->raw_clock.cycle_last	= tk->tkr_raw.cycle_last;
-	vdata->raw_clock.mask		= tk->tkr_raw.mask;
-	vdata->raw_clock.mult		= tk->tkr_raw.mult;
-	vdata->raw_clock.shift		= tk->tkr_raw.shift;
-	vdata->raw_clock.base_cycles	= tk->tkr_raw.xtime_nsec;
-	vdata->raw_clock.offset		= tk->tkr_raw.base;
-
-	vdata->wall_time_sec            = tk->xtime_sec;
-
-	vdata->offs_boot		= tk->offs_boot;
-
-	write_seqcount_end(&vdata->seq);
-}
-#endif
-
 static s64 get_kvmclock_base_ns(void)
 {
 	/* Count up from boot time, but with the frequency of the raw clock.  */
@@ -7092,8 +7038,6 @@ static int pvclock_gtod_notify(struct notifier_block *nb, unsigned long unused,
 {
 	struct timekeeper *tk = priv;
 
-	update_pvclock_gtod(tk);
-
 	/*
 	 * Pairs with the READ_ONCE() in the lockless readers; the race is
 	 * benign by design, relying on eventual consistency (the notifier
-- 
2.43.0


