Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5EFB606A33C
	for <xen-devel@archiver.kernel.org>; Tue, 24 Nov 2026 23:23:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=oKVgq/v7
Received: from list by lists.xenproject.org with outflank-mailman.1501501.1697571 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xVzqi-0008HU-Mu; Tue, 24 Nov 2026 23:22:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1501501.1697571; Tue, 24 Nov 2026 23:22:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xVzqi-0008Fj-DI; Tue, 24 Nov 2026 23:22:56 +0000
Received: by outflank-mailman (input) for mailman id 1501501;
 Tue, 24 Nov 2026 23:22:53 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <BATV+7be3010b4cb4d9f5c1a9+8493+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1xVzqd-0007o5-Ko
 for xen-devel@lists.xenproject.org; Tue, 24 Nov 2026 23:22:53 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xVzqd-005lV7-19; Wed, 25 Nov 2026 00:22:51 +0100
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <BATV+7be3010b4cb4d9f5c1a9+8493+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 6b061c4a-bab6-0a2a0a5309dd-0a2a450180b0-0
 for <multiple-recipients>; Wed, 25 Nov 2026 00:22:50 +0100
Received: from [90.155.50.34] (helo=casper.infradead.org)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <BATV+7be3010b4cb4d9f5c1a9+8493+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 6b061c49-5bcc-0a2a45010019-5a9b3222dd96-3
 for <multiple-recipients>; Wed, 25 Nov 2026 00:22:49 +0100
Received: from [2001:8b0:10b:1::425] (helo=i7.infradead.org)
 by casper.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
 id 1xVzqa-0000000Gdi0-0OiI; Tue, 24 Nov 2026 23:22:48 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.99.5 #2 (Red
 Hat Linux)) id 1xVzqZ-0000000062o-2meR;
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
	bh=5WG4S0K3NHI6X23ICM3IYdv9KdvM8ykx9fz0jk2Hl2Y=; b=oKVgq/v7xRwthHGs2qU9jbE8kY
	z2+k7lmSD1GGxaaJxhDRIhY6TqcVs5CWX/9En7iFBfdVCUfMh1oIC2iHTJAdnUm4D9lrey9pg2e7A
	4S8F+vwmzOF8Kmni8Iu9TJssNPonsfGn7qKC4NXJvMGq7n9QFMCPKfiJjY7WMxXmF2mmAcIyKBula
	5Jfu2ew+RqqvwrHV1KG/2+wTflXaPotx6zHnGt/HFz9sTR12U4cYBYDTK9B5jro6VDPUVS7wUO7gG
	Vm5hLMeZr23U85I3j5l9uBmrlx8/ATDvDB2jAG43sEysC7GM1ni5iw0RYkl28z5G6CuPTA+0Fdbgv
	nFC4yTqA==;
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
Subject: [PATCH v1 16/21] hw/9pfs/xen-9p-backend: Validate frontend-supplied connect parameters
Date: Tue, 24 Nov 2026 23:22:42 +0000
Message-ID: <20261124232247.23169-17-dwmw2@infradead.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261124232247.23169-1-dwmw2@infradead.org>
References: <20261124232247.23169-1-dwmw2@infradead.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: David Woodhouse <dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
X-purgate-ID: tlsNG-d62444/1795562570-BD0ED5FD-1FC7221D/0/0
X-purgate-type: clean
X-purgate-size: 2301
X-Spam-Status: No, score=-23.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: David Woodhouse <dwmw@amazon.co.uk>

The ring order is read from the guest-shared interface page into a
signed int, so a large value became negative and bypassed the
MAX_RING_ORDER check, leading to an undefined shift. Keep it unsigned.
Treat any negative return from the event channel bind as failure, not
just -1, and fail the connect if the frontend provides no 'tag' key
rather than passing NULL into the fsdev layer.

Fixes: b37eeb020123 ("xen/9pfs: introduce Xen 9pfs backend")
Reported-by: Hui Peng <benquike@gmail.com>
Closes: https://gitlab.com/qemu-project/qemu/-/work_items/4523
Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 hw/9pfs/xen-9p-backend.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/hw/9pfs/xen-9p-backend.c b/hw/9pfs/xen-9p-backend.c
index 430de23fadb..6e26a445a09 100644
--- a/hw/9pfs/xen-9p-backend.c
+++ b/hw/9pfs/xen-9p-backend.c
@@ -453,7 +453,7 @@ static int xen_9pfs_connect(struct XenLegacyDevice *xendev)
     xen_9pdev->rings = g_new0(Xen9pfsRing, xen_9pdev->num_rings);
     for (i = 0; i < xen_9pdev->num_rings; i++) {
         char *str;
-        int ring_order;
+        uint32_t ring_order;
 
         xen_9pdev->rings[i].priv = xen_9pdev;
         xen_9pdev->rings[i].evtchn = -1;
@@ -515,7 +515,7 @@ static int xen_9pfs_connect(struct XenLegacyDevice *xendev)
                                             (xen_9pdev->rings[i].evtchndev,
                                              xendev->dom,
                                              xen_9pdev->rings[i].evtchn);
-        if (xen_9pdev->rings[i].local_port == -1) {
+        if (xen_9pdev->rings[i].local_port < 0) {
             xen_pv_printf(xendev, 0,
                           "xenevtchn_bind_interdomain failed port=%d\n",
                           xen_9pdev->rings[i].evtchn);
@@ -531,6 +531,9 @@ static int xen_9pfs_connect(struct XenLegacyDevice *xendev)
     xen_9pdev->id = s->fsconf.fsdev_id =
         g_strdup_printf("xen9p%d", xendev->dev);
     xen_9pdev->tag = s->fsconf.tag = xenstore_read_fe_str(xendev, "tag");
+    if (!xen_9pdev->tag) {
+        goto out;
+    }
     fsdev = qemu_opts_create(qemu_find_opts("fsdev"),
             s->fsconf.tag,
             1, NULL);
-- 
2.43.0


