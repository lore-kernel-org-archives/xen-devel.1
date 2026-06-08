Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9FE9CD8C9D
	for <xen-devel@archiver.kernel.org>; Mon,  8 Jun 2026 14:56:12 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1331754.1594505 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wWbOR-0002xp-SU; Mon, 08 Jun 2026 14:55:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1331754.1594505; Mon, 08 Jun 2026 14:55:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wWbOQ-0002s0-Qd; Mon, 08 Jun 2026 14:55:58 +0000
Received: by outflank-mailman (input) for mailman id 1331754;
 Mon, 08 Jun 2026 14:55:41 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <BATV+614c7b1bd25833f05746+8324+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1wWbO8-0007MV-Qc
 for xen-devel@lists.xenproject.org; Mon, 08 Jun 2026 14:55:40 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wWbO8-002m34-6G; Mon, 08 Jun 2026 16:55:40 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <BATV+614c7b1bd25833f05746+8324+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 6a26d7e5-bab6-0a2a0a5309dd-0a2a450b81e4-18
 for <multiple-recipients>; Mon, 08 Jun 2026 16:55:40 +0200
Received: from [90.155.92.199] (helo=desiato.infradead.org)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from
 <BATV+614c7b1bd25833f05746+8324+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 6a26d7eb-212f-0a2a450b0019-5a9b5cc7d708-3
 for <multiple-recipients>; Mon, 08 Jun 2026 16:55:40 +0200
Received: from [2001:8b0:10b:1::425] (helo=i7.infradead.org)
 by desiato.infradead.org with esmtpsa (Exim 4.99.2 #2 (Red Hat Linux))
 id 1wWbNV-00000001AgR-3WQp; Mon, 08 Jun 2026 14:55:02 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.99.2 #2 (Red
 Hat Linux)) id 1wWbNT-00000000NGi-06LB;
 Mon, 08 Jun 2026 15:54:59 +0100
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
	bh=ssc2OYJnjVRJZfXuehVvSyJIF5UAgdCRis7RcurFUak=; b=VFXvohgLy6g/BbZF+sYaQENPUm
	yEPrtvWhoUEP7ysZ1jL03TlZvP6/mte7iIouk1LvPyagfBknLxDiPAtS0pMgyLk73UBWYMZsBhBJk
	QSxMDhNuZUb74U7gfaFlkjyOPkmD2kDZCIqJ0BGr/KqQ3cXnaY23jHOrMeNLQwiwvDnQlxEAGVPC1
	XfEeXu2OiCeBVXeGu3N7Ay+yzO3K1yXv0OlyXvOaSVBDHHfbEDttdh9ymYTwSs2+6HWSijid365+Q
	peOdhFh+s8x1IvBj/iAOV4v/3paFNbtKp+GZDFVrHvfSKdYU0WaIDXKGQiD1buYYfynh8dUtGADr8
	iUbu1u3w==;
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
Subject: [PATCH v5 32/34] KVM: x86: Compute kvmclock base without pvclock_gtod_data
Date: Mon,  8 Jun 2026 15:48:13 +0100
Message-ID: <20260608145455.89187-33-dwmw2@infradead.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260608145455.89187-1-dwmw2@infradead.org>
References: <20260608145455.89187-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: David Woodhouse <dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by desiato.infradead.org. See http://www.infradead.org/rpr.html
X-purgate-ID: tlsNG-42698a/1780930540-1B77AF3B-92CC29AE/0/0
X-purgate-type: clean
X-purgate-size: 1092

From: David Woodhouse <dwmw@amazon.co.uk>

get_kvmclock_base_ns() needs CLOCK_MONOTONIC_RAW + offs_boot. Compute
this directly rather than reading offs_boot from the pvclock_gtod_data
private copy. offs_boot only changes at suspend/resume so does not
need to be atomically paired with the raw clock read.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
Assisted-by: Kiro:claude-opus-4.6-1m
---
 arch/x86/kvm/x86.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 2713aebb96ae..c18947c5b63f 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -2402,7 +2402,7 @@ static void update_pvclock_gtod(struct timekeeper *tk)
 static s64 get_kvmclock_base_ns(void)
 {
 	/* Count up from boot time, but with the frequency of the raw clock.  */
-	return ktime_to_ns(ktime_add(ktime_get_raw(), pvclock_gtod_data.offs_boot));
+	return ktime_to_ns(ktime_mono_to_any(ktime_get_raw(), TK_OFFS_BOOT));
 }
 
 static void kvm_write_wall_clock(struct kvm *kvm, gpa_t wall_clock, int sec_hi_ofs)
-- 
2.54.0


