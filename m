Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA635C54F54
	for <xen-devel@archiver.kernel.org>; Tue, 28 Jul 2026 14:51:17 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1374549.1621936 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1woj9A-0008Sp-4X; Tue, 28 Jul 2026 14:51:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1374549.1621936; Tue, 28 Jul 2026 14:51:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1woj98-0008MR-92; Tue, 28 Jul 2026 14:51:06 +0000
Received: by outflank-mailman (input) for mailman id 1374549;
 Tue, 28 Jul 2026 14:50:33 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <BATV+a16dffe8eb885fac2cd9+8374+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1woj8a-0001Jy-JH
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2026 14:50:32 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1woj8Z-004rVO-UR; Tue, 28 Jul 2026 16:50:31 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <BATV+a16dffe8eb885fac2cd9+8374+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 6a68c1a9-bab6-0a2a0a5309dd-0a2a4502e3e6-6
 for <multiple-recipients>; Tue, 28 Jul 2026 16:50:23 +0200
Received: from [90.155.50.34] (helo=casper.infradead.org)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <BATV+a16dffe8eb885fac2cd9+8374+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 6a68c1ae-6ca4-0a2a45020019-5a9b3222b0a6-3
 for <multiple-recipients>; Tue, 28 Jul 2026 16:50:22 +0200
Received: from [2001:8b0:10b:1::425] (helo=i7.infradead.org)
 by casper.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
 id 1woj80-0000000DUP6-2hqC; Tue, 28 Jul 2026 14:49:57 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.99.4 #2 (Red
 Hat Linux)) id 1woj80-00000001UZl-1jZF;
 Tue, 28 Jul 2026 15:49:56 +0100
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
	bh=u9O6eMJWPEiCuOzOKx7hWrotGcpuvpoKHiLFSq+dRQ8=; b=osmvVwXK3BKgOGHTz3sUtx96/m
	MVqS38yzmvoisPEV4JzC8iatafIsLOvPbq2WoaXL0eyurSYWe5ZpyEbk/fKjgX1Y219V0NhLiNLjy
	sfBFcLNp+K8sW9GeErWzYSt+wDd3mUdylsDI1Xn7LH7jfI0/x6W4NIsX914Bc3mhweI6xCi2PANEg
	ZRA1YaIJytIo+pGgSqv/toZ6/5C3A0M+6a8jTklX5vbPhL7B0HDJCcIZxACI3vdi+XiIUT3fQEmUn
	OqhvYfXy+wTehcYsu2OnMeXQRIetKHLG2LEWFUwd/8tlL85xjmTwJ6uEfe+n4ac0zT5aatCCpYHSS
	Qi/4nLtA==;
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
Subject: [PATCH v7 30/36] KVM: selftests: Use UAPI pvclock-abi.h in xen_shinfo_test
Date: Tue, 28 Jul 2026 15:40:10 +0100
Message-ID: <20260728144954.355376-31-dwmw2@infradead.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260728144954.355376-1-dwmw2@infradead.org>
References: <20260728144954.355376-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: David Woodhouse <dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
X-purgate-ID: tlsNG-720697/1785250223-313CC2AC-F7E6D4E7/0/0
X-purgate-type: clean
X-purgate-size: 1138

From: David Woodhouse <dwmw@amazon.co.uk>

Now that pvclock-abi.h is a UAPI header, use it in xen_shinfo_test.c
instead of locally duplicating the struct definitions.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 .../testing/selftests/kvm/x86/xen_shinfo_test.c | 17 +----------------
 1 file changed, 1 insertion(+), 16 deletions(-)

diff --git a/tools/testing/selftests/kvm/x86/xen_shinfo_test.c b/tools/testing/selftests/kvm/x86/xen_shinfo_test.c
index 5076f6a75455..2f241ca4f096 100644
--- a/tools/testing/selftests/kvm/x86/xen_shinfo_test.c
+++ b/tools/testing/selftests/kvm/x86/xen_shinfo_test.c
@@ -98,22 +98,7 @@ struct sched_poll {
 	u64 timeout;
 };
 
-struct pvclock_vcpu_time_info {
-	u32   version;
-	u32   pad0;
-	u64   tsc_timestamp;
-	u64   system_time;
-	u32   tsc_to_system_mul;
-	s8    tsc_shift;
-	u8    flags;
-	u8    pad[2];
-} __attribute__((__packed__)); /* 32 bytes */
-
-struct pvclock_wall_clock {
-	u32   version;
-	u32   sec;
-	u32   nsec;
-} __attribute__((__packed__));
+#include <asm/pvclock-abi.h>
 
 struct vcpu_runstate_info {
 	u32 state;
-- 
2.55.0


