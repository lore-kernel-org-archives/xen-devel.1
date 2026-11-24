Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5124606A31E
	for <xen-devel@archiver.kernel.org>; Tue, 24 Nov 2026 23:29:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=M+RiDqAr
Received: from list by lists.xenproject.org with outflank-mailman.1501593.1697643 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xVzwV-0005Xq-59; Tue, 24 Nov 2026 23:28:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1501593.1697643; Tue, 24 Nov 2026 23:28:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xVzwV-0005Xj-26; Tue, 24 Nov 2026 23:28:55 +0000
Received: by outflank-mailman (input) for mailman id 1501593;
 Tue, 24 Nov 2026 23:28:54 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <BATV+8ed7664ba4dc972f2276+8493+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1xVzwU-0005XA-M7
 for xen-devel@lists.xenproject.org; Tue, 24 Nov 2026 23:28:54 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xVzwT-001vbg-Ua; Wed, 25 Nov 2026 00:28:53 +0100
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <BATV+8ed7664ba4dc972f2276+8493+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 6b061d44-2eae-0a2a0a5409dd-0a2a45028604-44
 for <multiple-recipients>; Wed, 25 Nov 2026 00:28:53 +0100
Received: from [90.155.92.199] (helo=desiato.infradead.org)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <BATV+8ed7664ba4dc972f2276+8493+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 6b061c4c-4900-0a2a45020019-5a9b5cc79c44-3
 for <multiple-recipients>; Wed, 25 Nov 2026 00:22:53 +0100
Received: from [2001:8b0:10b:1::425] (helo=i7.infradead.org)
 by desiato.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
 id 1xVzqc-00000004eV6-1lWW; Tue, 24 Nov 2026 23:22:51 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.99.5 #2 (Red
 Hat Linux)) id 1xVzqZ-0000000062k-2dPl;
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
	bh=GX5FpFjvP4EEA1jVsu7PkqgqUubc1fokwnXjwzK+f/k=; b=M+RiDqArijw/ZDCdN2rh9IC72T
	AnDLGo1bE94RvoISoRLfF4+La4xY3E1zNbwK9JYkmM7kQt1oXXtriVolHzXpCxkbp6c3oCDffMEIn
	30Z06j92HhyZcixxR69c3UdU8U3zQSXxPS1RE0fg7dKmaSmGChiWPrQPt1P0e6BaFU/36MLqqmyJ9
	ryxBxSC3GDO9/cKytp2TVuLfkdT5ed6xhDOzdj+H22Lm/OcDB7tNkVlIZ9I0Uj0TUGr/rt8TAT3mJ
	RgR1JMIAUf5SXpmDaZkB7UVh8Bbn7hu2fd6hlQgz6EmYGaS8+duV/kXmHEAy350ZUNXbf66J67Af2
	t5s2cHfA==;
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
Subject: [PATCH v1 15/21] hw/9pfs/xen-9p-backend: Validate the request header size field
Date: Tue, 24 Nov 2026 23:22:41 +0000
Message-ID: <20261124232247.23169-16-dwmw2@infradead.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261124232247.23169-1-dwmw2@infradead.org>
References: <20261124232247.23169-1-dwmw2@infradead.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: David Woodhouse <dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by desiato.infradead.org. See http://www.infradead.org/rpr.html
X-purgate-ID: tlsNG-720697/1795562573-F09866C6-57FABB3E/13/0
X-purgate-type: clean
X-purgate-size: 2168
X-Spam-Status: No, score=-23.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: David Woodhouse <dwmw@amazon.co.uk>

A request whose header declares a size smaller than the header itself
was accepted, submitting a zero-length PDU and advancing nothing, to be
re-processed on every ring kick. Reject it instead. Set inprogress only
once a request is accepted, so returning early on a half-arrived or
malformed request no longer wedges the ring until disconnect.

Fixes: 40a2389207fb ("xen/9pfs: implement in/out_iov_from_pdu and vmarshal/vunmarshal")
Reported-by: Hui Peng <benquike@gmail.com>
Closes: https://gitlab.com/qemu-project/qemu/-/work_items/4523
Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 hw/9pfs/xen-9p-backend.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/hw/9pfs/xen-9p-backend.c b/hw/9pfs/xen-9p-backend.c
index 22b2190b1b6..430de23fadb 100644
--- a/hw/9pfs/xen-9p-backend.c
+++ b/hw/9pfs/xen-9p-backend.c
@@ -314,7 +314,6 @@ static int xen_9pfs_receive(Xen9pfsRing *ring)
     if (queued < sizeof(h)) {
         return 0;
     }
-    ring->inprogress = true;
 
     masked_prod = xen_9pfs_mask(prod, XEN_FLEX_RING_SIZE(ring->ring_order));
     masked_cons = xen_9pfs_mask(cons, XEN_FLEX_RING_SIZE(ring->ring_order));
@@ -322,9 +321,18 @@ static int xen_9pfs_receive(Xen9pfsRing *ring)
     xen_9pfs_read_packet((uint8_t *) &h, ring->ring.out, sizeof(h),
                          masked_prod, &masked_cons,
                          XEN_FLEX_RING_SIZE(ring->ring_order));
-    if (queued < le32_to_cpu(h.size_le)) {
+    /*
+     * A size smaller than the header itself is malformed; returning
+     * with inprogress still clear means it is simply ignored until the
+     * guest fixes up the ring contents. Do not set inprogress before
+     * the request is accepted, or a half-arrived request would wedge
+     * the ring forever.
+     */
+    if (le32_to_cpu(h.size_le) < sizeof(h) ||
+        queued < le32_to_cpu(h.size_le)) {
         return 0;
     }
+    ring->inprogress = true;
 
     /* cannot fail, because we only handle one request per ring at a time */
     pdu = pdu_alloc(&ring->priv->state);
-- 
2.43.0


