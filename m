Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30455606A334
	for <xen-devel@archiver.kernel.org>; Tue, 24 Nov 2026 23:23:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=olyREV0E
Received: from list by lists.xenproject.org with outflank-mailman.1501502.1697586 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xVzqj-0000Aa-Hd; Tue, 24 Nov 2026 23:22:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1501502.1697586; Tue, 24 Nov 2026 23:22:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xVzqj-00006v-4g; Tue, 24 Nov 2026 23:22:57 +0000
Received: by outflank-mailman (input) for mailman id 1501502;
 Tue, 24 Nov 2026 23:22:54 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <BATV+8ed7664ba4dc972f2276+8493+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1xVzqg-0007oo-4k
 for xen-devel@lists.xenproject.org; Tue, 24 Nov 2026 23:22:54 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xVzqf-009ONz-HQ; Wed, 25 Nov 2026 00:22:53 +0100
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <BATV+8ed7664ba4dc972f2276+8493+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 6b061bf9-2eae-0a2a0a5409dd-0a2a4506952e-32
 for <multiple-recipients>; Wed, 25 Nov 2026 00:22:53 +0100
Received: from [90.155.92.199] (helo=desiato.infradead.org)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <BATV+8ed7664ba4dc972f2276+8493+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 6b061c4c-195a-0a2a45060019-5a9b5cc797b0-3
 for <multiple-recipients>; Wed, 25 Nov 2026 00:22:53 +0100
Received: from [2001:8b0:10b:1::425] (helo=i7.infradead.org)
 by desiato.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
 id 1xVzqc-00000004eUz-1kfl; Tue, 24 Nov 2026 23:22:51 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.99.5 #2 (Red
 Hat Linux)) id 1xVzqZ-0000000061t-1D5p;
 Tue, 24 Nov 2026 23:22:47 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=desiato.20200630 header.d=infradead.org header.i="@infradead.org" header.h="Sender:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=fWZq+phibeUOAuCvTbIBUu8IYuUINRpE+QvToHPSryc=; b=olyREV0EM42s4OFSemiYPWrcmz
	nBl210NlEyXbsalTjLv/ZvSjQ9oY6zkhValMnTsqQ57gRPeEio/58Q3hOhBCPMob+Ion6pw7xgJDX
	HcGSqj1ow9xIy5yr4tWm4q9ItKtX5H7M8llT6LGfUdJX3mR//BoqU81QK0bHhbkPMNSVXF9rfMIaG
	HdFkc48goyA5+2S3JgsCi50vIQ/p4fRKaAIQelLGINLO1R5jKF3KUzxL4OojCMpxds+y8sevGkGQI
	GMFVYtm8Fko+PMVNXTHT3lu5luX7EWk/CmgqJKOl12szWx3+LN3wJdND7tlcIQlgFqnNFEjhCwPg2
	wxlQ/xIQ==;
From: David Woodhouse <dwmw2@infradead.org>
To: qemu-devel@nongnu.org
Cc: xen-devel@lists.xenproject.org,
	kvm@vger.kernel.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Paul Durrant <paul@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony@xenproject.org>,
	"Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
	"Michael S . Tsirkin" <mst@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Jason Wang <jasowangio@gmail.com>,
	Hui Peng <benquike@gmail.com>,
	Mark Syms <mark.syms@citrix.com>,
	Feifan Qian <bea1e@proton.me>,
	David Woodhouse <dwmw@amazon.co.uk>
Subject: [PATCH v1 02/21] i386/xen: Don't resample GSI when per-vCPU upcall vector is in use
Date: Tue, 24 Nov 2026 23:22:28 +0000
Message-ID: <20261124232247.23169-3-dwmw2@infradead.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261124232247.23169-1-dwmw2@infradead.org>
References: <20261124232247.23169-1-dwmw2@infradead.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: David Woodhouse <dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by desiato.infradead.org. See http://www.infradead.org/rpr.html
X-purgate-ID: tlsNG-16d1c6/1795562573-FD40B77B-285D270B/0/0
X-purgate-type: clean
X-purgate-size: 1674
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: David Woodhouse <dwmw@amazon.co.uk>

The callback_via GSI (or PCI INTx) and the per-vCPU upcall vector are
mutually exclusive delivery mechanisms for Xen event channel upcalls.
Xen itself will never assert the callback GSI for a vCPU which has a
per-vCPU upcall vector configured.

When the interrupt is acked, QEMU's resampling logic reasserts the
GSI if evtchn_upcall_pending is still set. If the guest has configured
a per-vCPU upcall vector, events are delivered through that vector and
the GSI is unexpected; a guest which receives both the vector upcall
and a spurious GSI interrupt for the same event can crash. This was
observed in production with Windows guests on a different VMM which
implements the same resampling logic.

If a per-vCPU upcall vector is configured, don't resample the GSI;
just deassert it.

Fixes: ddf0fd9ae1fd ("hw/xen: Support HVM_PARAM_CALLBACK_TYPE_GSI callback")
Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 target/i386/kvm/xen-emu.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/target/i386/kvm/xen-emu.c b/target/i386/kvm/xen-emu.c
index 29364a92797..7337561b159 100644
--- a/target/i386/kvm/xen-emu.c
+++ b/target/i386/kvm/xen-emu.c
@@ -435,6 +435,13 @@ void kvm_xen_maybe_deassert_callback(CPUState *cs)
         return;
     }
 
+    if (env->xen_vcpu_callback_vector) {
+        BQL_LOCK_GUARD();
+        env->xen_callback_asserted = false;
+        xen_evtchn_set_callback_level(0);
+        return;
+    }
+
     /* If the evtchn_upcall_pending flag is cleared, turn the GSI off. */
     if (!vi->evtchn_upcall_pending) {
         bql_lock();
-- 
2.43.0


