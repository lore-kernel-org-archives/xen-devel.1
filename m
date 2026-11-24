Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D645606A33F
	for <xen-devel@archiver.kernel.org>; Tue, 24 Nov 2026 23:23:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=DDIp988r
Received: from list by lists.xenproject.org with outflank-mailman.1501496.1697544 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xVzqh-0007vD-GB; Tue, 24 Nov 2026 23:22:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1501496.1697544; Tue, 24 Nov 2026 23:22:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xVzqh-0007sF-CT; Tue, 24 Nov 2026 23:22:55 +0000
Received: by outflank-mailman (input) for mailman id 1501496;
 Tue, 24 Nov 2026 23:22:53 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <BATV+7be3010b4cb4d9f5c1a9+8493+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1xVzqd-0007o4-JY
 for xen-devel@lists.xenproject.org; Tue, 24 Nov 2026 23:22:53 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xVzqc-009ONz-PJ; Wed, 25 Nov 2026 00:22:50 +0100
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <BATV+7be3010b4cb4d9f5c1a9+8493+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 6b061c37-2eae-0a2a0a5409dd-0a2a4508d374-16
 for <multiple-recipients>; Wed, 25 Nov 2026 00:22:50 +0100
Received: from [90.155.50.34] (helo=casper.infradead.org)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <BATV+7be3010b4cb4d9f5c1a9+8493+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 6b061c49-f659-0a2a45080019-5a9b3222e6ee-3
 for <multiple-recipients>; Wed, 25 Nov 2026 00:22:49 +0100
Received: from [2001:8b0:10b:1::425] (helo=i7.infradead.org)
 by casper.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
 id 1xVzqZ-0000000Gdhv-3Fud; Tue, 24 Nov 2026 23:22:48 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.99.5 #2 (Red
 Hat Linux)) id 1xVzqZ-0000000061z-1Qql;
 Tue, 24 Nov 2026 23:22:47 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=casper.20170209 header.d=infradead.org header.i="@infradead.org" header.h="Sender:Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description;
	bh=omSfQRir3NOjvaxuaNmQVmaf9UjouyCVezkBBc8wqZc=; b=DDIp988rHTV7Y/YJBbUl8MtY+f
	OSqNgMp//dwiaqlE3WGUaJXxYnmYB/NT/ba1puqnp8cX9ie0PYqlb9T+KM0U6hx5GGut/gkATWMH9
	yP3Amt8TaJ3JOtwSmKg8N2zr/679L3/Rrv9kUFzfXVpbQXhGOdbkFebtVmzeorfbDYfOhvMCUYFUh
	fcFMf8pLi9VAcogUdNbm4F1RVTCi7dY7TYoqSa11A2fXVoxW/ffIOIq+B+qD13h04kIj+5Et+uxcE
	dZE11z2cqqphjDPQmPI1zJEE03phi+Dhnq5nY2/my1iWWGPTEcTWfK64JlzqroPoJHw16J1abaUHH
	RR18poDw==;
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
Subject: [PATCH v1 04/21] hw/xen: Publish backend features before setting state to InitWait
Date: Tue, 24 Nov 2026 23:22:30 +0000
Message-ID: <20261124232247.23169-5-dwmw2@infradead.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261124232247.23169-1-dwmw2@infradead.org>
References: <20261124232247.23169-1-dwmw2@infradead.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: David Woodhouse <dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
X-purgate-ID: tlsNG-c1860d/1795562570-D4B7187B-925E73E8/0/0
X-purgate-type: clean
X-purgate-size: 3765
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: David Woodhouse <dwmw@amazon.co.uk>

The XenbusStateInitWait transition tells the frontend that the
backend's parameters are readable, but xen_device_realize() set it
before calling the implementation's realize method — which is what
writes the feature nodes ('max-ring-page-order' et al. for xen-block,
'feature-rx-copy' for xen-net).

Linux blkfront reads 'max-ring-page-order' with xenbus_read_unsigned():
no wait, no retry, default 0. Lose the race and it silently negotiates
a single-page ring — 32 request slots instead of 256. A device
hot-plugged into a running guest loses essentially every time; at boot
the frontend doesn't come looking until long after realize finished.
Netfront reads its feature nodes the same way.

Commit 240cc11369fc ("hw/xen: Avoid crash when backend watch fires too
early") introduced this by moving the realize call after the block of
code which both populates the initial xenstore nodes *and* sets
InitWait. The crash it fixed was real — xen-block's realize processes
watch events via blkconf_geometry()'s aio_poll(), and the handlers fell
over when the nodes didn't yet exist — but only the node population
needed to come first.

So keep the node population and the 'online' write before realize, and
move only the InitWait transition after it. A watch event during
realize now finds the frontend in Initialising and no backend 'state'
node, which the handlers tolerate; none of the three realize
implementations reads the backend state. Verified against the original
2023 crash reproducer as well as the ring-order negotiation.

Fixes: 240cc11369fc ("hw/xen: Avoid crash when backend watch fires too early")
Reported-by: Mark Syms <mark.syms@citrix.com>
Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 hw/xen/xen-bus.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/hw/xen/xen-bus.c b/hw/xen/xen-bus.c
index 17bbbe2ea71..b75ce7f0957 100644
--- a/hw/xen/xen-bus.c
+++ b/hw/xen/xen-bus.c
@@ -1082,7 +1082,6 @@ static void xen_device_realize(DeviceState *dev, Error **errp)
     xen_device_backend_printf(xendev, "hotplug-status", "connected");
 
     xen_device_backend_set_online(xendev, true);
-    xen_device_backend_set_state(xendev, XenbusStateInitWait);
 
     if (!xen_device_frontend_exists(xendev)) {
         xen_device_frontend_printf(xendev, "backend", "%s",
@@ -1093,6 +1092,19 @@ static void xen_device_realize(DeviceState *dev, Error **errp)
         xen_device_frontend_set_state(xendev, XenbusStateInitialising, true);
     }
 
+    /*
+     * The implementation's realize method may write feature nodes to
+     * the backend area (e.g. 'max-ring-page-order' for xen-block,
+     * 'feature-rx-copy' for xen-net). It must be called after the
+     * backend and frontend areas are populated, because it can invoke
+     * aio_poll() (e.g. through blkconf_geometry()) and thus process
+     * watch events which need to read the 'state' nodes. But it must
+     * be called *before* the backend state is set to InitWait below,
+     * because InitWait is the frontend's cue that the backend's
+     * feature nodes can be read; a frontend which reads them promptly
+     * (as Linux blkfront and netfront do, without waiting or retrying)
+     * must not find them missing.
+     */
     if (xendev_class->realize) {
         xendev_class->realize(xendev, errp);
         if (*errp) {
@@ -1100,6 +1112,8 @@ static void xen_device_realize(DeviceState *dev, Error **errp)
         }
     }
 
+    xen_device_backend_set_state(xendev, XenbusStateInitWait);
+
     xendev->exit.notify = xen_device_exit;
     qemu_add_exit_notifier(&xendev->exit);
     return;
-- 
2.43.0


