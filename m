Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFDF1CD8C9F
	for <xen-devel@archiver.kernel.org>; Mon,  8 Jun 2026 14:56:08 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1331743.1594486 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wWbON-00021V-KK; Mon, 08 Jun 2026 14:55:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1331743.1594486; Mon, 08 Jun 2026 14:55:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wWbOM-0001v0-FN; Mon, 08 Jun 2026 14:55:54 +0000
Received: by outflank-mailman (input) for mailman id 1331743;
 Mon, 08 Jun 2026 14:55:37 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <BATV+89cebe4ba06156b53a55+8324+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1wWbO3-0006Gg-QH
 for xen-devel@lists.xenproject.org; Mon, 08 Jun 2026 14:55:35 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wWbO3-000k6X-4k; Mon, 08 Jun 2026 16:55:35 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <BATV+89cebe4ba06156b53a55+8324+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 6a26d7d0-5cb7-0a2a0a5109dd-0a2a45018424-36
 for <multiple-recipients>; Mon, 08 Jun 2026 16:55:34 +0200
Received: from [90.155.50.34] (helo=casper.infradead.org)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from
 <BATV+89cebe4ba06156b53a55+8324+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 6a26d7e6-c1f2-0a2a45010019-5a9b3222d8fc-3
 for <multiple-recipients>; Mon, 08 Jun 2026 16:55:34 +0200
Received: from [2001:8b0:10b:1::425] (helo=i7.infradead.org)
 by casper.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
 id 1wWbNR-0000000DtxA-32IJ; Mon, 08 Jun 2026 14:54:58 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.99.2 #2 (Red
 Hat Linux)) id 1wWbNR-00000000NEz-3a70;
 Mon, 08 Jun 2026 15:54:57 +0100
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=casper.20170209 header.d=infradead.org header.i="@infradead.org" header.h="Sender:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description;
	bh=mK9MivH4Sa09pKns/iaOBplM1ylYPC1nLBsprSjeCoQ=; b=szg0DuJaBDaAO6gJ+6si2oIAis
	T91YLENzCyD9xsWd+xbTgQw7GqijATO+tnbaTBL01eGHLbKCN5Cc3aCoQxj6HIAMG90eZjZs0Ydug
	jPIbOu8aN+jme6AwIGKke4AjYZcyV9ipCdmVuwkICFvP8Ht0pf7uBv0dj7EY00YzdrWDTlNiKh6N7
	pTg/dfcczCehCy18HLpKxo3Dhch1c3qYACouIglNEkfV4ijxAmKYsV6yx/YJ8ZfFPAQYuCyDeRHVv
	gqbeTfHqe9xZAshQmAkH2NTO9GqdT8NLIKMzSAguCJgjcAqyyI+RQVUTleE5TBh2TgG8xYP3fhq19
	TmvcWxLA==;
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
Subject: [PATCH v5 10/34] KVM: x86: Fold __get_kvmclock() into get_kvmclock()
Date: Mon,  8 Jun 2026 15:47:51 +0100
Message-ID: <20260608145455.89187-11-dwmw2@infradead.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260608145455.89187-1-dwmw2@infradead.org>
References: <20260608145455.89187-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: David Woodhouse <dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
X-purgate-ID: tlsNG-d62444/1780930534-B7F50FF4-55A7C25C/0/0
X-purgate-type: clean
X-purgate-size: 3279

From: David Woodhouse <dwmw@amazon.co.uk>

There is no need for the separate __get_kvmclock() helper; just inline
its body into get_kvmclock() within the seqcount retry loop.

No functional change.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 arch/x86/kvm/x86.c | 63 +++++++++++++++++++++-------------------------
 1 file changed, 28 insertions(+), 35 deletions(-)

diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 50bd2871b051..fce898811fe7 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -3200,50 +3200,43 @@ static unsigned long get_cpu_tsc_khz(void)
 		return __this_cpu_read(cpu_tsc_khz);
 }
 
-/* Called within read_seqcount_begin/retry for kvm->pvclock_sc.  */
-static void __get_kvmclock(struct kvm *kvm, struct kvm_clock_data *data)
+static void get_kvmclock(struct kvm *kvm, struct kvm_clock_data *data)
 {
 	struct kvm_arch *ka = &kvm->arch;
 	struct pvclock_vcpu_time_info hv_clock;
+	unsigned int seq;
 
-	/* both __this_cpu_read() and rdtsc() should be on the same cpu */
-	get_cpu();
+	do {
+		seq = read_seqcount_begin(&ka->pvclock_sc);
 
-	data->flags = 0;
-	if (ka->use_master_clock &&
-	    (static_cpu_has(X86_FEATURE_CONSTANT_TSC) || __this_cpu_read(cpu_tsc_khz))) {
+		/* both __this_cpu_read() and rdtsc() should be on the same cpu */
+		get_cpu();
+
+		data->flags = 0;
+		if (ka->use_master_clock &&
+		    (static_cpu_has(X86_FEATURE_CONSTANT_TSC) || __this_cpu_read(cpu_tsc_khz))) {
 #ifdef CONFIG_X86_64
-		struct timespec64 ts;
+			struct timespec64 ts;
 
-		if (kvm_get_walltime_and_clockread(&ts, &data->host_tsc)) {
-			data->realtime = ts.tv_nsec + NSEC_PER_SEC * ts.tv_sec;
-			data->flags |= KVM_CLOCK_REALTIME | KVM_CLOCK_HOST_TSC;
-		} else
+			if (kvm_get_walltime_and_clockread(&ts, &data->host_tsc)) {
+				data->realtime = ts.tv_nsec + NSEC_PER_SEC * ts.tv_sec;
+				data->flags |= KVM_CLOCK_REALTIME | KVM_CLOCK_HOST_TSC;
+			} else
 #endif
-		data->host_tsc = rdtsc();
-
-		data->flags |= KVM_CLOCK_TSC_STABLE;
-		hv_clock.tsc_timestamp = ka->master_cycle_now;
-		hv_clock.system_time = ka->master_kernel_ns + ka->kvmclock_offset;
-		kvm_get_time_scale(NSEC_PER_SEC, get_cpu_tsc_khz() * 1000LL,
-				   &hv_clock.tsc_shift,
-				   &hv_clock.tsc_to_system_mul);
-		data->clock = __pvclock_read_cycles(&hv_clock, data->host_tsc);
-	} else {
-		data->clock = get_kvmclock_base_ns() + ka->kvmclock_offset;
-	}
-
-	put_cpu();
-}
-
-static void get_kvmclock(struct kvm *kvm, struct kvm_clock_data *data)
-{
-	struct kvm_arch *ka = &kvm->arch;
-	unsigned seq;
+			data->host_tsc = rdtsc();
+
+			data->flags |= KVM_CLOCK_TSC_STABLE;
+			hv_clock.tsc_timestamp = ka->master_cycle_now;
+			hv_clock.system_time = ka->master_kernel_ns + ka->kvmclock_offset;
+			kvm_get_time_scale(NSEC_PER_SEC, get_cpu_tsc_khz() * 1000LL,
+					   &hv_clock.tsc_shift,
+					   &hv_clock.tsc_to_system_mul);
+			data->clock = __pvclock_read_cycles(&hv_clock, data->host_tsc);
+		} else {
+			data->clock = get_kvmclock_base_ns() + ka->kvmclock_offset;
+		}
 
-	do {
-		seq = read_seqcount_begin(&ka->pvclock_sc);
-		__get_kvmclock(kvm, data);
+		put_cpu();
 	} while (read_seqcount_retry(&ka->pvclock_sc, seq));
 }
 
-- 
2.54.0


