Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BC2D606A323
	for <xen-devel@archiver.kernel.org>; Tue, 24 Nov 2026 23:23:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=F0Nol9H4
Received: from list by lists.xenproject.org with outflank-mailman.1501497.1697558 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xVzqi-00086q-5J; Tue, 24 Nov 2026 23:22:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1501497.1697558; Tue, 24 Nov 2026 23:22:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xVzqh-00085i-Tt; Tue, 24 Nov 2026 23:22:55 +0000
Received: by outflank-mailman (input) for mailman id 1501497;
 Tue, 24 Nov 2026 23:22:53 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <BATV+7be3010b4cb4d9f5c1a9+8493+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1xVzqd-0007o6-NV
 for xen-devel@lists.xenproject.org; Tue, 24 Nov 2026 23:22:53 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xVzqd-00ABI6-47; Wed, 25 Nov 2026 00:22:51 +0100
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <BATV+7be3010b4cb4d9f5c1a9+8493+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 6b061c23-e002-0a2a0a5209dd-0a2a450297b0-18
 for <multiple-recipients>; Wed, 25 Nov 2026 00:22:51 +0100
Received: from [90.155.50.34] (helo=casper.infradead.org)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <BATV+7be3010b4cb4d9f5c1a9+8493+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 6b061c49-4900-0a2a45020019-5a9b3222ba20-3
 for <multiple-recipients>; Wed, 25 Nov 2026 00:22:49 +0100
Received: from [2001:8b0:10b:1::425] (helo=i7.infradead.org)
 by casper.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
 id 1xVzqa-0000000Gdi3-0ZNx; Tue, 24 Nov 2026 23:22:48 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.99.5 #2 (Red
 Hat Linux)) id 1xVzqZ-0000000062w-2xwb;
 Tue, 24 Nov 2026 23:22:47 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=casper.20170209 header.d=infradead.org header.i="@infradead.org" header.h="Sender:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=hdyfm7GpJ9FLtKxanRFDOcqZILwEpUm9W0rWeuqixlE=; b=F0Nol9H4CEqNAfhv45Miss1ani
	XYN56Xrq1FtjpWaI+0gypS+mw7nIwd42pCP5rcyfVh4xuGfpKPgSLOH2uZsFlXKv1tQ/F+oxOI5CK
	Kj5H0gbwqBHB7QSo1N566xQmUml0PTsrsM1rU6jCnMLrmNln1ejFCepPXGFtDoxg3iLhD/jLBqxvg
	vYhuHo5DB734c1HXV6N7p/BKnfe2M65z8yq4F0Od8T3n/kWa37KO5yWGtAXXDEPhkOjAXLFyyqrhn
	wAbc+SNxGqvJPLVYcD7ySaztLDqj7iw3PM1gqCwYQik1oHclEgkEjdcaYiZ+in+mfTTVw7w/Hnwh+
	vYlx3IGw==;
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
Subject: [PATCH v1 18/21] hw/net/xen_nic: Bound the TX and RX rings' producer index
Date: Tue, 24 Nov 2026 23:22:44 +0000
Message-ID: <20261124232247.23169-19-dwmw2@infradead.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261124232247.23169-1-dwmw2@infradead.org>
References: <20261124232247.23169-1-dwmw2@infradead.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: David Woodhouse <dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
X-purgate-ID: tlsNG-720697/1795562571-F89276C6-C849C313/0/0
X-purgate-type: clean
X-purgate-size: 1813
X-Spam-Status: No, score=-23.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: David Woodhouse <dwmw@amazon.co.uk>

net_tx_packets() consumed requests until req_cons caught up with the
raw req_prod from the shared ring. A bogus req_prod made the loop
process up to 2^32 stale slots while holding the BQL. Check
RING_REQUEST_PROD_OVERFLOW on both rings, as xen-block already does.

Fixes: e613b064a88a ("xen: add net backend driver.")
Reported-by: Hui Peng <benquike@gmail.com>
Closes: https://gitlab.com/qemu-project/qemu/-/work_items/4515
Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 hw/net/xen_nic.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/hw/net/xen_nic.c b/hw/net/xen_nic.c
index e615303da6a..4de2464376f 100644
--- a/hw/net/xen_nic.c
+++ b/hw/net/xen_nic.c
@@ -138,6 +138,12 @@ static bool net_tx_packets(struct XenNetDev *netdev)
         rp = netdev->tx_ring.sring->req_prod;
         xen_rmb(); /* Ensure we see queued requests up to 'rp'. */
 
+        if (RING_REQUEST_PROD_OVERFLOW(&netdev->tx_ring, rp)) {
+            qemu_log_mask(LOG_GUEST_ERROR, "vif%u: bad req_prod %u\n",
+                          netdev->dev, rp);
+            break;
+        }
+
         while ((rc != rp)) {
             if (RING_REQUEST_CONS_OVERFLOW(&netdev->tx_ring, rc)) {
                 break;
@@ -268,7 +274,8 @@ static ssize_t net_rx_packet(NetClientState *nc, const uint8_t *buf, size_t size
     rp = netdev->rx_ring.sring->req_prod;
     xen_rmb(); /* Ensure we see queued requests up to 'rp'. */
 
-    if (rc == rp || RING_REQUEST_CONS_OVERFLOW(&netdev->rx_ring, rc)) {
+    if (rc == rp || RING_REQUEST_PROD_OVERFLOW(&netdev->rx_ring, rp) ||
+        RING_REQUEST_CONS_OVERFLOW(&netdev->rx_ring, rc)) {
         return 0;
     }
     if (size > XEN_PAGE_SIZE - NET_IP_ALIGN) {
-- 
2.43.0


