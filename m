Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 879F8606A68B
	for <xen-devel@archiver.kernel.org>; Tue, 24 Nov 2026 23:23:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=IBzxmwof
Received: from list by lists.xenproject.org with outflank-mailman.1501504.1697595 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xVzqk-0000Kw-3D; Tue, 24 Nov 2026 23:22:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1501504.1697595; Tue, 24 Nov 2026 23:22:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xVzqj-0000G2-L4; Tue, 24 Nov 2026 23:22:57 +0000
Received: by outflank-mailman (input) for mailman id 1501504;
 Tue, 24 Nov 2026 23:22:54 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <BATV+8ed7664ba4dc972f2276+8493+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1xVzqg-0007oq-4n
 for xen-devel@lists.xenproject.org; Tue, 24 Nov 2026 23:22:54 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xVzqf-001ulu-HO; Wed, 25 Nov 2026 00:22:53 +0100
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <BATV+8ed7664ba4dc972f2276+8493+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 6b061c2b-8faa-0a2a0a5109dd-0a2a450ac630-12
 for <multiple-recipients>; Wed, 25 Nov 2026 00:22:53 +0100
Received: from [90.155.92.199] (helo=desiato.infradead.org)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <BATV+8ed7664ba4dc972f2276+8493+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 6b061c4c-f2d2-0a2a450a0019-5a9b5cc7e472-3
 for <multiple-recipients>; Wed, 25 Nov 2026 00:22:53 +0100
Received: from [2001:8b0:10b:1::425] (helo=i7.infradead.org)
 by desiato.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
 id 1xVzqc-00000004eV9-1k12; Tue, 24 Nov 2026 23:22:51 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.99.5 #2 (Red
 Hat Linux)) id 1xVzqZ-00000000638-3F7z;
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
	bh=KXxedB2pK6pXvErwQ2DMjcN5CVWCsn8Q2L2nKaNMhso=; b=IBzxmwofTwZI485wtJH6dOx8RK
	O/CR8Q/7G8CvgmT675huSFzRGjm4+j5Pk3pldINu8LFSpINN3m+ANLHBINx32FID6NOvrnpGoAMOT
	j90FspoZlnbR5CYJayzDYOJ45NxXE97LS/Nd8Wstv7ANgOyP/OZZiT0iZP4s0SGFexwiYD+gQaj1+
	84SpzleCzHxHZmZtTsNkyb5Q3sTYmkFkgKxAOfMmLZ2xH9IVYnlao/ExcbX2JHWEPzj96VhMOC+PZ
	FnUkQwTEGjXt77pNf98NndWpKQHIMlixCx3bItruRQ0j1f7/regg1WNNDQCm/Cv/5e2gZbtvZzsbF
	0b8g2YMg==;
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
Subject: [PATCH v1 21/21] hw/i386/kvm/xen_evtchn: Allow unmapping an emulated MSI PIRQ
Date: Tue, 24 Nov 2026 23:22:47 +0000
Message-ID: <20261124232247.23169-22-dwmw2@infradead.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261124232247.23169-1-dwmw2@infradead.org>
References: <20261124232247.23169-1-dwmw2@infradead.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: David Woodhouse <dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by desiato.infradead.org. See http://www.infradead.org/rpr.html
X-purgate-ID: tlsNG-4011c0/1795562573-520C1CFC-868966DA/0/0
X-purgate-type: clean
X-purgate-size: 1606
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: David Woodhouse <dwmw@amazon.co.uk>

The "unmap GSI PIRQs only" check rejected every negative gsi, which
includes IRQ_MSI_EMU, so the later IRQ_MSI_EMU branch that flushes the
KVM MSI routes was unreachable and guests could never unmap an MSI
PIRQ. Xen permits it: physdev_unmap_pirq() on a domain with HVM pirqs
routes emulated-IRQ pirqs through unmap_domain_pirq_emuirq(), which
succeeds for MSI emuirqs. Let IRQ_MSI_EMU through; the existing
unreachable branch then does the route flush as originally intended.

Resolves: Coverity CID 1507603
Fixes: 6096cf7877bc ("hw/xen: Support MSI mapping to PIRQ")
Reported-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 hw/i386/kvm/xen_evtchn.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/hw/i386/kvm/xen_evtchn.c b/hw/i386/kvm/xen_evtchn.c
index cfe735219bf..5a986c1e2a4 100644
--- a/hw/i386/kvm/xen_evtchn.c
+++ b/hw/i386/kvm/xen_evtchn.c
@@ -1925,13 +1925,15 @@ int xen_physdev_unmap_pirq(struct physdev_unmap_pirq *unmap)
 
     gsi = s->pirq[pirq].gsi;
 
-    /* We can only unmap GSI PIRQs */
-    if (gsi < 0) {
+    /* We can only unmap GSI PIRQs and emulated MSIs */
+    if (gsi < 0 && gsi != IRQ_MSI_EMU) {
         qemu_mutex_unlock(&s->port_lock);
         return -EINVAL;
     }
 
-    s->gsi_pirq[gsi] = 0;
+    if (gsi >= 0) {
+        s->gsi_pirq[gsi] = 0;
+    }
     s->pirq[pirq].gsi = IRQ_UNBOUND; /* Doesn't actually matter because: */
     pirq_inuse_word(s, pirq) &= ~pirq_inuse_bit(pirq);
 
-- 
2.43.0


