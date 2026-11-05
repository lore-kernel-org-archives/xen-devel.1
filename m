Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4405B606F94F
	for <xen-devel@archiver.kernel.org>; Thu,  5 Nov 2026 15:50:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=Cf3duvba
Received: from list by lists.xenproject.org with outflank-mailman.1475004.1681897 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOzj6-0004lu-Ih; Thu, 05 Nov 2026 15:50:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1475004.1681897; Thu, 05 Nov 2026 15:50:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOzj6-0004k0-6y; Thu, 05 Nov 2026 15:50:08 +0000
Received: by outflank-mailman (input) for mailman id 1475004;
 Thu, 05 Nov 2026 15:50:04 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <BATV+a10630623031064a0c86+8474+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1xOzj2-0003q8-RP
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 15:50:04 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOzj2-00B7sn-7p; Thu, 05 Nov 2026 16:50:04 +0100
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <BATV+a10630623031064a0c86+8474+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 6aeca59a-2eae-0a2a0a5409dd-0a2a4505a2a0-26
 for <multiple-recipients>; Thu, 05 Nov 2026 16:50:04 +0100
Received: from [90.155.50.34] (helo=casper.infradead.org)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <BATV+a10630623031064a0c86+8474+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 6aeca5aa-4cb1-0a2a45050019-5a9b32229b34-3
 for <multiple-recipients>; Thu, 05 Nov 2026 16:50:02 +0100
Received: from [2001:8b0:10b:1::425] (helo=i7.infradead.org)
 by casper.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
 id 1xOziu-00000009ap3-3jWL; Thu, 05 Nov 2026 15:49:56 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.99.5 #2 (Red
 Hat Linux)) id 1xOziu-0000000Ab0M-2wXi;
 Thu, 05 Nov 2026 15:49:56 +0000
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
	bh=4PUyL7sZNDc2BWRiB64jpro3+lQx5Ezd+14nQXzY7IA=; b=Cf3duvbac+7rHXJGDQKcnYlCNr
	IcgIMSruZf01InZFMw3B+GOLOGUka35oR0dUYdvC+ttjra2EwODA2C86VHgppSzQhSLibltcabYDc
	8toCTdldTkhNFnZgmqBnfyh2j6+N35WPCP8LvUmt9G6bgyoHXpOr/pA8CbzEb047at4xYFgHj6tIF
	9I9UByH1H1lKoJDq9bF+ZBfiyzvzpfBoXlZEx7/vWy0zZsyyzfSSSOxJCV9R/yYfCqFgkCs4ACV1x
	xp1Mhm3S3r2Jvs38W7BWDUl5FDkIxxuyECP6cGHMQuqn39hhGR7JDfmUC7/bPEisfHSh+V3AZFCkI
	/099zKAg==;
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
Subject: [PATCH v11 23/23] KVM: x86: Use a single time snapshot in kvm_vm_ioctl_set_clock()
Date: Thu,  5 Nov 2026 07:49:54 -0800
Message-ID: <20261105154955.2525419-24-dwmw2@infradead.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261105154955.2525419-1-dwmw2@infradead.org>
References: <20261105154955.2525419-1-dwmw2@infradead.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: David Woodhouse <dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
X-purgate-ID: tlsNG-c201ff/1793893802-722AB2A1-814D9BF4/0/0
X-purgate-type: clean
X-purgate-size: 2902
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: David Woodhouse <dwmw@amazon.co.uk>

The KVM_CLOCK_REALTIME handling read CLOCK_REALTIME with
ktime_get_real_ns() and then anchored the result at a different
instant: the master clock reference point captured a few lines
earlier, or a separate get_kvmclock_base_ns() read. The time elapsed
between the two reads is added to the restored clock as error --
bounded by the interrupts-off critical section, but gratuitous now
that the timekeeping core can snapshot CLOCK_REALTIME and
CLOCK_MONOTONIC_RAW at the same instant.

Take one ktime_get_snapshot_id(CLOCK_REALTIME) snapshot and derive
both the realtime correction and the raw reference point from it. In
master clock mode, keep anchoring at master_kernel_ns -- so that
'system_time' cannot go negative for a very small data.clock, as the
existing comment explains -- by projecting the snapshot's realtime
value back to that reference point; CLOCK_REALTIME and
CLOCK_MONOTONIC_RAW tick at the same rate across the few ns in
between, give or take NTP slew.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 arch/x86/kvm/x86.c | 32 +++++++++++++++++++++++++++-----
 1 file changed, 27 insertions(+), 5 deletions(-)

diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 17544b3cc035..4db0c809d120 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -4693,19 +4693,41 @@ static int kvm_vm_ioctl_set_clock(struct kvm *kvm, void __user *argp)
 	 * 'system_time' when 'data.clock' is very small.
 	 */
 	if (data.flags & KVM_CLOCK_REALTIME) {
-		u64 now_real_ns = ktime_get_real_ns();
+		struct system_time_snapshot snap = {};
+		u64 now_real_ns;
+
+		/*
+		 * Snapshot CLOCK_REALTIME and CLOCK_MONOTONIC_RAW at the
+		 * same instant, so that the elapsed time applied to
+		 * data.clock and the reference point the result is anchored
+		 * to are coherent.
+		 */
+		ktime_get_snapshot_id(CLOCK_REALTIME, &snap);
+		now_real_ns = ktime_to_ns(snap.systime);
+		now_raw_ns = ktime_to_ns(ktime_mono_to_any(snap.monoraw,
+							   TK_OFFS_BOOT));
+
+		/*
+		 * When the master clock is in use, anchor at its reference
+		 * point instead, projecting the realtime value back to the
+		 * same instant. The two clocks tick at the same rate across
+		 * the few ns in between, give or take NTP slew.
+		 */
+		if (ka->use_master_clock) {
+			now_real_ns -= now_raw_ns - ka->master_kernel_ns;
+			now_raw_ns = ka->master_kernel_ns;
+		}
 
 		/*
 		 * Avoid stepping the kvmclock backwards.
 		 */
 		if (now_real_ns > data.realtime)
 			data.clock += now_real_ns - data.realtime;
-	}
-
-	if (ka->use_master_clock)
+	} else if (ka->use_master_clock) {
 		now_raw_ns = ka->master_kernel_ns;
-	else
+	} else {
 		now_raw_ns = get_kvmclock_base_ns();
+	}
 	ka->kvmclock_offset = data.clock - now_raw_ns;
 	kvm_end_pvclock_update(kvm);
 	return 0;
-- 
2.43.0


