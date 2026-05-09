Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D620DCD37B9
	for <xen-devel@archiver.kernel.org>; Sat,  9 May 2026 22:49:18 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1304991.1577601 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wLqTX-00058N-6S; Sat, 09 May 2026 22:48:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1304991.1577601; Sat, 09 May 2026 22:48:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wLqTW-000575-U7; Sat, 09 May 2026 22:48:46 +0000
Received: by outflank-mailman (input) for mailman id 1304991;
 Sat, 09 May 2026 22:48:45 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <BATV+9b8b472e89b521af7d3c+8294+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1wLqTU-0004xu-Pl
 for xen-devel@lists.xenproject.org; Sat, 09 May 2026 22:48:45 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wLqTT-00DG64-Lm; Sun, 10 May 2026 00:48:44 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <BATV+9b8b472e89b521af7d3c+8294+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 69ffb98b-e002-0a2a0a5209dd-0a2a4508e700-24
 for <multiple-recipients>; Sun, 10 May 2026 00:48:42 +0200
Received: from [90.155.92.199] (helo=desiato.infradead.org)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from
 <BATV+9b8b472e89b521af7d3c+8294+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 69ffb9c9-63b5-0a2a45080019-5a9b5cc79ec6-3
 for <multiple-recipients>; Sun, 10 May 2026 00:48:42 +0200
Received: from [2001:8b0:10b:1::425] (helo=i7.infradead.org)
 by desiato.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
 id 1wLqTD-00000008wzB-0RLs; Sat, 09 May 2026 22:48:28 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.98.2 #2 (Red
 Hat Linux)) id 1wLqTC-0000000DhHp-297o;
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
	bh=Rlefrv035dE/A4ZfqxoNxpMximz7sVxUML4oSeehurg=; b=BpdCMag+qQeRQ5HUSztZ5825NR
	CwsTyPlVzrIaUi3MD2Pgs7SkvujS/dAokWA6r0Uea/18K0TZbpMa+C1GC+RQlvY0ZYeA3V0RLgLyH
	p84QoHNsDoHOem2wktR9d4GMZ4ZXX4ztZGHkA1B2w/VbuGQwNcW4Mp0D5Gi7Vhk5jbzcpmAiPdeOu
	AxF8VicBNW8EGM7sV+t5BG+wftPQ6ysKcPuc12W/1jcsihSjGgIiHhma2EKG3q+C8LRMLwHtaGaiH
	454cyuN/RcRhYiF83g1XnCoTGkyuFg3UanYe4rklrxhs9DBPoMmVvUToHOkIEJ/RUQMiq/LdRh6py
	hcsFWZkw==;
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
Subject: [PATCH v4 09/30] KVM: x86: WARN if kvm_get_walltime_and_clockread() fails unexpectedly
Date: Sat,  9 May 2026 23:46:35 +0100
Message-ID: <20260509224824.3264567-10-dwmw2@infradead.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260509224824.3264567-1-dwmw2@infradead.org>
References: <20260509224824.3264567-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: David Woodhouse <dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by desiato.infradead.org. See http://www.infradead.org/rpr.html
X-purgate-ID: tlsNG-c1860d/1778366922-B6368DB1-AA82E900/0/0
X-purgate-type: clean
X-purgate-size: 1130

From: David Woodhouse <dwmw@amazon.co.uk>

The master clock depends on the pvclock being based on TSC, so the only
way kvm_get_walltime_and_clockread() can fail when use_master_clock is
true is if the clocksource changed and use_master_clock is stale, in
which case a seqcount retry should be pending.

Add a WARN_ON_ONCE if the seqcount has not been invalidated, to catch
any case where the failure is genuinely unexpected.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 arch/x86/kvm/x86.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 1e1834533e98..ccdfd3fa3402 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -3474,7 +3474,8 @@ uint64_t kvm_get_wall_clock_epoch(struct kvm *kvm)
 		local_tsc_khz = get_cpu_tsc_khz();
 
 		if (local_tsc_khz &&
-		    !kvm_get_walltime_and_clockread(&ts, &host_tsc))
+		    !kvm_get_walltime_and_clockread(&ts, &host_tsc) &&
+		    WARN_ON_ONCE(!read_seqcount_retry(&ka->pvclock_sc, seq)))
 			local_tsc_khz = 0; /* Fall back to old method */
 
 		put_cpu();
-- 
2.51.0


