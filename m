Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C5EFCD37B6
	for <xen-devel@archiver.kernel.org>; Sat,  9 May 2026 22:49:15 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1304988.1577587 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wLqTW-0004z2-DV; Sat, 09 May 2026 22:48:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1304988.1577587; Sat, 09 May 2026 22:48:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wLqTW-0004yk-7u; Sat, 09 May 2026 22:48:46 +0000
Received: by outflank-mailman (input) for mailman id 1304988;
 Sat, 09 May 2026 22:48:45 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <BATV+9b8b472e89b521af7d3c+8294+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1wLqTV-0004xx-1k
 for xen-devel@lists.xenproject.org; Sat, 09 May 2026 22:48:45 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wLqTU-00DG64-De; Sun, 10 May 2026 00:48:44 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <BATV+9b8b472e89b521af7d3c+8294+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 69ffb8ed-e002-0a2a0a5209dd-0a2a450aedf4-32
 for <multiple-recipients>; Sun, 10 May 2026 00:48:44 +0200
Received: from [90.155.92.199] (helo=desiato.infradead.org)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from
 <BATV+9b8b472e89b521af7d3c+8294+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 69ffb9ca-56b3-0a2a450a0019-5a9b5cc7c8dc-3
 for <multiple-recipients>; Sun, 10 May 2026 00:48:43 +0200
Received: from [2001:8b0:10b:1::425] (helo=i7.infradead.org)
 by desiato.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
 id 1wLqTD-00000008wzE-0SAJ; Sat, 09 May 2026 22:48:34 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.98.2 #2 (Red
 Hat Linux)) id 1wLqTC-0000000DhI1-2gsb;
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
	bh=zKn6rM5SNp1NUsYTwVeNP1ZCWEOK4E9JR5PloHDb+Ck=; b=nkedMhJt8F9vSW46ftqs+afk74
	R2kXr8DGF/BR2ZbLetJk7cK8mb7U8wrd+BjH0SLOd2HT+EGkf+eHfiV6BHYj9S3aMKR1w+7RbmCgL
	WfZdFYRkUyitRkvhEwFbn8/RZK606OSsjn+RxBhvg4DRPETaEapIcUUaSBInJkB6+TK5nUtBNgb72
	fA3ZOT6czVLlApEuNGzRjCGH87yrxPogqqE0x+gC0ah5O5nNxLIWkSQaGtRdHx9srHNiP4bM1d0lV
	h0qnlA792499cVUurkX1eNKfWL1N3jMb9S/HMH93MHG6mUxkvvyxBtKCKH195l2JIeGXuHxtogYJU
	dinfu75Q==;
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
Subject: [PATCH v4 12/30] KVM: x86: Use get_kvmclock_base_ns() as fallback in get_kvmclock()
Date: Sat,  9 May 2026 23:46:38 +0100
Message-ID: <20260509224824.3264567-13-dwmw2@infradead.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260509224824.3264567-1-dwmw2@infradead.org>
References: <20260509224824.3264567-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: David Woodhouse <dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by desiato.infradead.org. See http://www.infradead.org/rpr.html
X-purgate-ID: tlsNG-4011c0/1778366924-725748B7-EE4BF64C/0/0
X-purgate-type: clean
X-purgate-size: 1265

From: David Woodhouse <dwmw@amazon.co.uk>

If kvm_get_walltime_and_clockread() fails unexpectedly (the WARN case),
restart the seqcount loop rather than falling back to a raw rdtsc()
which would set KVM_CLOCK_TSC_STABLE without KVM_CLOCK_REALTIME.

That code path could never actually be reached in practice: on 64-bit
hosts, use_master_clock can only be true when the clocksource is
TSC-based, and on 32-bit hosts, use_master_clock is never set. But
the fallback to raw rdtsc() was misleading and the resulting flags
combination was inconsistent.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 arch/x86/kvm/x86.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 9b395c00ccf2..f2653eaccdf8 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -3225,7 +3225,8 @@ static void get_kvmclock(struct kvm *kvm, struct kvm_clock_data *data)
 				data->realtime = ts.tv_nsec + NSEC_PER_SEC * ts.tv_sec;
 				data->flags |= KVM_CLOCK_REALTIME | KVM_CLOCK_HOST_TSC;
 			} else if (WARN_ON_ONCE(!read_seqcount_retry(&ka->pvclock_sc, seq))) {
-				data->host_tsc = rdtsc();
+				put_cpu();
+				continue;
 			}
 #else
 			data->host_tsc = rdtsc();
-- 
2.51.0


