Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BE1CC54F56
	for <xen-devel@archiver.kernel.org>; Tue, 28 Jul 2026 14:50:41 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1374511.1621800 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1woj8Z-00012n-S3; Tue, 28 Jul 2026 14:50:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1374511.1621800; Tue, 28 Jul 2026 14:50:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1woj8Y-0000vD-Lp; Tue, 28 Jul 2026 14:50:30 +0000
Received: by outflank-mailman (input) for mailman id 1374511;
 Tue, 28 Jul 2026 14:50:16 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <BATV+0bab86ec5884d1af5d78+8374+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1woj8K-0006gA-KA
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2026 14:50:16 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1woj8K-00EhwD-08; Tue, 28 Jul 2026 16:50:16 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <BATV+0bab86ec5884d1af5d78+8374+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 6a68c1a5-5cb7-0a2a0a5109dd-0a2a450cb8be-6
 for <multiple-recipients>; Tue, 28 Jul 2026 16:50:15 +0200
Received: from [90.155.92.199] (helo=desiato.infradead.org)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <BATV+0bab86ec5884d1af5d78+8374+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 6a68c1a7-f479-0a2a450c0019-5a9b5cc79a06-3
 for <multiple-recipients>; Tue, 28 Jul 2026 16:50:15 +0200
Received: from [2001:8b0:10b:1::425] (helo=i7.infradead.org)
 by desiato.infradead.org with esmtpsa (Exim 4.99.2 #2 (Red Hat Linux))
 id 1woj82-000000052VZ-34kc; Tue, 28 Jul 2026 14:49:59 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.99.4 #2 (Red
 Hat Linux)) id 1woj7z-00000001UY7-18gQ;
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
	bh=qkfTVUiMDU3wKVqEggFLaaqFoc9wZ8/CDkXcDl8wfs0=; b=EZXf/fjJb4bOv4RLTciNzKGITv
	yW5CZm7kcCdngyDq5Eqa12QMXVZh9we9s4k6WdQMnX+WVIczKVbyAnkS3W91RTszUtVKEzCBw4UL8
	VkshZUr3RNILQ1iQnos08xmZMd3rmjXrQRxTBVqSNbhZhDK59AnNSEiJ1uHmKgbDqKU2HPTUya0Q3
	wDz7oviobriZSOeV+EGQXokzr0bSE1RXIcwHLbw12rlpI6+UiExPionyLGoUJRBj3f39waio0KBtz
	Ggv5MCuUvBMMOZUcBzDe8SPB44Hj6+uR6JNFtW/AqpyaKvZXHmS8ZVgy1gjQraBTJu5fNxkrRxskV
	Dc5DUoAA==;
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
Subject: [PATCH v7 06/36] KVM: x86: Drop CPU pinning in get_kvmclock()
Date: Tue, 28 Jul 2026 15:39:46 +0100
Message-ID: <20260728144954.355376-7-dwmw2@infradead.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260728144954.355376-1-dwmw2@infradead.org>
References: <20260728144954.355376-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: David Woodhouse <dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by desiato.infradead.org. See http://www.infradead.org/rpr.html
X-purgate-ID: tlsNG-d25034/1785250215-030D9A5B-39D97A59/0/0
X-purgate-type: clean
X-purgate-size: 1693

From: David Woodhouse <dwmw@amazon.co.uk>

The master clock branch of get_kvmclock() pinned the task to a CPU so
that the rdtsc() and the __this_cpu_read(cpu_tsc_khz) would agree. But
ka->use_master_clock can only be true when the host clocksource is TSC
based, which in turn requires a stable, constant and synchronised TSC
across all CPUs.

Given that, the open-coded CONSTANT_TSC || cpu_tsc_khz check is
redundant (with CONSTANT_TSC, cpu_tsc_khz is tsc_khz on every CPU and
KVM does not even register the cpufreq notifier), and both the TSC read
and get_cpu_tsc_khz() are CPU-independent. Drop the condition and the
get_cpu()/put_cpu() pinning.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 arch/x86/kvm/x86.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 1a598e99852c..590a7ba723f7 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -1659,12 +1659,8 @@ static void get_kvmclock(struct kvm *kvm, struct kvm_clock_data *data)
 	do {
 		seq = read_seqcount_begin(&ka->pvclock_sc);
 
-		/* both __this_cpu_read() and rdtsc() should be on the same cpu */
-		get_cpu();
-
 		data->flags = 0;
-		if (ka->use_master_clock &&
-		    (static_cpu_has(X86_FEATURE_CONSTANT_TSC) || __this_cpu_read(cpu_tsc_khz))) {
+		if (ka->use_master_clock) {
 #ifdef CONFIG_X86_64
 			struct timespec64 ts;
 
@@ -1685,8 +1681,6 @@ static void get_kvmclock(struct kvm *kvm, struct kvm_clock_data *data)
 		} else {
 			data->clock = get_kvmclock_base_ns() + ka->kvmclock_offset;
 		}
-
-		put_cpu();
 	} while (read_seqcount_retry(&ka->pvclock_sc, seq));
 }
 
-- 
2.55.0


