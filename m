Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62EDC606A321
	for <xen-devel@archiver.kernel.org>; Tue, 24 Nov 2026 23:29:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=kGl8PcHH
Received: from list by lists.xenproject.org with outflank-mailman.1501596.1697667 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xVzwW-0005qq-FO; Tue, 24 Nov 2026 23:28:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1501596.1697667; Tue, 24 Nov 2026 23:28:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xVzwW-0005ou-3n; Tue, 24 Nov 2026 23:28:56 +0000
Received: by outflank-mailman (input) for mailman id 1501596;
 Tue, 24 Nov 2026 23:28:54 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <BATV+8ed7664ba4dc972f2276+8493+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1xVzwU-0005XH-My
 for xen-devel@lists.xenproject.org; Tue, 24 Nov 2026 23:28:54 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xVzwU-0050ZB-3G; Wed, 25 Nov 2026 00:28:54 +0100
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <BATV+8ed7664ba4dc972f2276+8493+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 6b061d1a-bab6-0a2a0a5309dd-0a2a45049d76-48
 for <multiple-recipients>; Wed, 25 Nov 2026 00:28:53 +0100
Received: from [90.155.92.199] (helo=desiato.infradead.org)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <BATV+8ed7664ba4dc972f2276+8493+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 6b061c4c-b57f-0a2a45040019-5a9b5cc7e460-3
 for <multiple-recipients>; Wed, 25 Nov 2026 00:22:53 +0100
Received: from [2001:8b0:10b:1::425] (helo=i7.infradead.org)
 by desiato.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
 id 1xVzqc-00000004eV5-1kcJ; Tue, 24 Nov 2026 23:22:51 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.99.5 #2 (Red
 Hat Linux)) id 1xVzqZ-0000000062g-2Xfp;
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
	bh=DwSIl3YjsuOZ09uV3T3X5vCjJ3huKi3Xcf0yWKrN1pw=; b=kGl8PcHHViYt2K1voQ4sTXfXqn
	CpRywx944KOHnJDx5JoW02cyU+m3ejXVFJJQiHdDV8rh1F97bHkwrEtfOVkHmtdFwWlYQCMDOHjgK
	h7S9qttzUGqtl/A+WcIbXI55+v+Jk2ZPCWvBW6caH8sqPVN+Zb7q28JD1eyAP/zF/C3o+YlgK6Ifq
	o/tPtagB4ZTWDkv3QxAGZaCD2o+MdN9mnLCm3SEv5Y3lSwVZtjcxWQOKaUxcyfuJBEfzc3hWGja5Q
	BrYoI6ZBzoMR/g2m2HqYg0iI9aWeTm8icM4HbwzIyDm+axrIUc/vy9rVTdeNudlk82xRC/lFNpGyK
	V4dMRhpA==;
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
Subject: [PATCH v1 14/21] hw/9pfs/xen-9p-backend: Use validated snapshot for request iovecs
Date: Tue, 24 Nov 2026 23:22:40 +0000
Message-ID: <20261124232247.23169-15-dwmw2@infradead.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261124232247.23169-1-dwmw2@infradead.org>
References: <20261124232247.23169-1-dwmw2@infradead.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: David Woodhouse <dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by desiato.infradead.org. See http://www.infradead.org/rpr.html
X-purgate-ID: tlsNG-ebf023/1795562573-50EDEB50-862D9DBF/13/0
X-purgate-type: clean
X-purgate-size: 3255
X-Spam-Status: No, score=-23.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: David Woodhouse <dwmw@amazon.co.uk>

xen_9pfs_out_sg() re-read the consumer index from the shared ring page
when building the request iovecs, so with an index the validation in
xen_9pfs_receive() never saw, the iovecs can reach past the end of the
ring mapping. Reconstruct the index from the out_cons/out_size snapshot
taken at validation time, and split the iovecs purely against the ring
size.

Fixes: CVE-2026-123072
Fixes: 40a2389207fb ("xen/9pfs: implement in/out_iov_from_pdu and vmarshal/vunmarshal")
Reported-by: Hui Peng <benquike@gmail.com>
Closes: https://gitlab.com/qemu-project/qemu/-/work_items/4523
Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 hw/9pfs/xen-9p-backend.c | 43 ++++++++++++++++++----------------------
 1 file changed, 19 insertions(+), 24 deletions(-)

diff --git a/hw/9pfs/xen-9p-backend.c b/hw/9pfs/xen-9p-backend.c
index 06709d54084..22b2190b1b6 100644
--- a/hw/9pfs/xen-9p-backend.c
+++ b/hw/9pfs/xen-9p-backend.c
@@ -105,34 +105,29 @@ static void xen_9pfs_out_sg(Xen9pfsRing *ring,
                             int *num,
                             uint32_t idx)
 {
-    RING_IDX cons, prod, masked_prod, masked_cons;
-
-    cons = ring->intf->out_cons;
-    prod = ring->intf->out_prod;
-    xen_rmb();
-    masked_prod = xen_9pfs_mask(prod, XEN_FLEX_RING_SIZE(ring->ring_order));
-    masked_cons = xen_9pfs_mask(cons, XEN_FLEX_RING_SIZE(ring->ring_order));
-
-    if (masked_cons < masked_prod) {
+    RING_IDX cons, masked_cons;
+    RING_IDX ring_size = XEN_FLEX_RING_SIZE(ring->ring_order);
+
+    /*
+     * Use the consumer index and request size snapshotted when the
+     * request was validated in xen_9pfs_receive(). Do not re-read the
+     * index from the shared page: the guest may have changed it since
+     * validation, and out_size (bounded by the ring size at validation
+     * time) could then reach past the end of the ring mapping.
+     */
+    cons = ring->out_cons - ring->out_size;
+    masked_cons = xen_9pfs_mask(cons, ring_size);
+
+    if (ring->out_size <= ring_size - masked_cons) {
         out_sg[0].iov_base = ring->ring.out + masked_cons;
         out_sg[0].iov_len = ring->out_size;
         *num = 1;
     } else {
-        if (ring->out_size >
-            (XEN_FLEX_RING_SIZE(ring->ring_order) - masked_cons)) {
-            out_sg[0].iov_base = ring->ring.out + masked_cons;
-            out_sg[0].iov_len = XEN_FLEX_RING_SIZE(ring->ring_order) -
-                                masked_cons;
-            out_sg[1].iov_base = ring->ring.out;
-            out_sg[1].iov_len = ring->out_size -
-                                (XEN_FLEX_RING_SIZE(ring->ring_order) -
-                                 masked_cons);
-            *num = 2;
-        } else {
-            out_sg[0].iov_base = ring->ring.out + masked_cons;
-            out_sg[0].iov_len = ring->out_size;
-            *num = 1;
-        }
+        out_sg[0].iov_base = ring->ring.out + masked_cons;
+        out_sg[0].iov_len = ring_size - masked_cons;
+        out_sg[1].iov_base = ring->ring.out;
+        out_sg[1].iov_len = ring->out_size - (ring_size - masked_cons);
+        *num = 2;
     }
 }
 
-- 
2.43.0


