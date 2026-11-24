Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF190606A331
	for <xen-devel@archiver.kernel.org>; Tue, 24 Nov 2026 23:23:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=uMvqhYcU
Received: from list by lists.xenproject.org with outflank-mailman.1501495.1697536 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xVzqh-0007pG-1r; Tue, 24 Nov 2026 23:22:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1501495.1697536; Tue, 24 Nov 2026 23:22:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xVzqg-0007p6-T7; Tue, 24 Nov 2026 23:22:54 +0000
Received: by outflank-mailman (input) for mailman id 1501495;
 Tue, 24 Nov 2026 23:22:53 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <BATV+7be3010b4cb4d9f5c1a9+8493+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1xVzqd-0007o8-Oa
 for xen-devel@lists.xenproject.org; Tue, 24 Nov 2026 23:22:53 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xVzqd-009ONz-58; Wed, 25 Nov 2026 00:22:51 +0100
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <BATV+7be3010b4cb4d9f5c1a9+8493+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 6b061c37-2eae-0a2a0a5409dd-0a2a4508d374-18
 for <multiple-recipients>; Wed, 25 Nov 2026 00:22:51 +0100
Received: from [90.155.50.34] (helo=casper.infradead.org)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <BATV+7be3010b4cb4d9f5c1a9+8493+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 6b061c49-f659-0a2a45080019-5a9b3222dd9e-3
 for <multiple-recipients>; Wed, 25 Nov 2026 00:22:50 +0100
Received: from [2001:8b0:10b:1::425] (helo=i7.infradead.org)
 by casper.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
 id 1xVzqa-0000000Gdi2-12sA; Tue, 24 Nov 2026 23:22:49 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.99.5 #2 (Red
 Hat Linux)) id 1xVzqZ-0000000062s-2sK5;
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
	bh=mShxXaZv6TY0Zli6pFAQOFKuPFGFrSk9kLHIUrN7Ut8=; b=uMvqhYcUlLku2c+q0NhmFreiZL
	TXqO78fEulJkymZMHBv8tmwLdtaQ3Rcskf8g6WHxqeBONoGsdnS5w0MtUe02gohddf/vzkGUQhnB8
	V6URimHadQK9fN5WMBerum0CbF5wwZmBYuUbej5eCu5OJR7XYac2D+134ru0r65BHmnvunVLRcv5s
	GWYqKwmlyZYTV3RDkXA4cguPMfbkWZ8PsuPV8O5TMBsd2GABaKtJZA5li7GdyfqX6d3sp3P2FjYoV
	QbOU9l/pHVf2+6Lt9m0GCTHVjj6O7eLgfmvTg+X4UO/izy/cvY2T331EUUSh5PyOMXnJWQSQ0beph
	xPcPKP5g==;
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
Subject: [PATCH v1 17/21] hw/9pfs/xen-9p-backend: Close event channel handle on disconnect
Date: Tue, 24 Nov 2026 23:22:43 +0000
Message-ID: <20261124232247.23169-18-dwmw2@infradead.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261124232247.23169-1-dwmw2@infradead.org>
References: <20261124232247.23169-1-dwmw2@infradead.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: David Woodhouse <dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
X-purgate-ID: tlsNG-c1860d/1795562571-CC97287B-9754F265/0/0
X-purgate-type: clean
X-purgate-size: 1325
X-Spam-Status: No, score=-23.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: David Woodhouse <dwmw@amazon.co.uk>

Disconnect only unbound the port, then dropped the pointer, leaking the
handle and its file descriptor on every disconnect/reconnect cycle.
Close the handle; closing also unbinds.

Fixes: b37eeb020123 ("xen/9pfs: introduce Xen 9pfs backend")
Reported-by: Hui Peng <benquike@gmail.com>
Closes: https://gitlab.com/qemu-project/qemu/-/work_items/4523
Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 hw/9pfs/xen-9p-backend.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/hw/9pfs/xen-9p-backend.c b/hw/9pfs/xen-9p-backend.c
index 6e26a445a09..612f19c45c8 100644
--- a/hw/9pfs/xen-9p-backend.c
+++ b/hw/9pfs/xen-9p-backend.c
@@ -392,8 +392,7 @@ static void xen_9pfs_disconnect(struct XenLegacyDevice *xendev)
         if (xen_9pdev->rings[i].evtchndev != NULL) {
             qemu_set_fd_handler(qemu_xen_evtchn_fd(xen_9pdev->rings[i].evtchndev),
                                 NULL, NULL, NULL);
-            qemu_xen_evtchn_unbind(xen_9pdev->rings[i].evtchndev,
-                                   xen_9pdev->rings[i].local_port);
+            qemu_xen_evtchn_close(xen_9pdev->rings[i].evtchndev);
             xen_9pdev->rings[i].evtchndev = NULL;
         }
         if (xen_9pdev->rings[i].data != NULL) {
-- 
2.43.0


