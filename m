Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26542606A31E
	for <xen-devel@archiver.kernel.org>; Tue, 24 Nov 2026 23:29:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=qW5Fg3iB
Received: from list by lists.xenproject.org with outflank-mailman.1501600.1697713 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xVzwb-0007BR-N0; Tue, 24 Nov 2026 23:29:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1501600.1697713; Tue, 24 Nov 2026 23:29:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xVzwb-0007AS-Cx; Tue, 24 Nov 2026 23:29:01 +0000
Received: by outflank-mailman (input) for mailman id 1501600;
 Tue, 24 Nov 2026 23:29:00 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <BATV+8ed7664ba4dc972f2276+8493+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1xVzwa-00074t-80
 for xen-devel@lists.xenproject.org; Tue, 24 Nov 2026 23:29:00 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xVzwZ-001vbg-Kg; Wed, 25 Nov 2026 00:28:59 +0100
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <BATV+8ed7664ba4dc972f2276+8493+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 6b061db9-2eae-0a2a0a5409dd-0a2a4504c95c-2
 for <multiple-recipients>; Wed, 25 Nov 2026 00:28:59 +0100
Received: from [90.155.92.199] (helo=desiato.infradead.org)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <BATV+8ed7664ba4dc972f2276+8493+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 6b061c52-b57f-0a2a45040019-5a9b5cc7a97a-3
 for <multiple-recipients>; Wed, 25 Nov 2026 00:22:59 +0100
Received: from [2001:8b0:10b:1::425] (helo=i7.infradead.org)
 by desiato.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
 id 1xVzqc-00000004eV3-1kSi; Tue, 24 Nov 2026 23:22:58 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.99.5 #2 (Red
 Hat Linux)) id 1xVzqZ-0000000062Y-2KT8;
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
	bh=g0SlkPOioN/IQzWDDzbZEsZOjV4lbvBOawbX12q9VDg=; b=qW5Fg3iBgTbI+mNkwnsFDI+gCN
	8c+8hHLNMHsUcyVv7MN5Id3OhNMrzNLKA+r7QeZPSkUOkGaplpB6EI933zhzzliR+e4aF1mhJgArF
	7QqIBoJZkVSX6zDGEfxaYFxtu2dy0lS2lknLtc5+JnLXRIDYyaic56X32akytgegVtTKU8CGgxhG3
	S+YwZE7u6iptNB4Unh61IUJx0Tk4KFarmhtrEmfHkEFK0/TsLkr/SdslUBb/yQpG54M2V1J4HQKHA
	xRk0paEhHBQ6ebGgSjdcOvGjiXHqfYVdIQHvTw9UJrFfXAejI0nTxd7N0XTMwoHXmg54XS9E50Y2u
	LmeNrUJQ==;
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
Subject: [PATCH v1 12/21] hw/i386/kvm/xen_xenstore: Apply offset before truncation in xs_append_strings()
Date: Tue, 24 Nov 2026 23:22:38 +0000
Message-ID: <20261124232247.23169-13-dwmw2@infradead.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261124232247.23169-1-dwmw2@infradead.org>
References: <20261124232247.23169-1-dwmw2@infradead.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: David Woodhouse <dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by desiato.infradead.org. See http://www.infradead.org/rpr.html
X-purgate-ID: tlsNG-ebf023/1795562579-526CAB50-0088054E/13/0
X-purgate-type: clean
X-purgate-size: 2053
X-Spam-Status: No, score=-23.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: David Woodhouse <dwmw@amazon.co.uk>

Truncating a string to the remaining payload space before applying the
requested starting offset corrupts the offset accounting, so
XS_DIRECTORY_PART returned wrong data for non-zero offsets. Skip to the
offset first, then check what fits.

Fixes: 0254c4d19df3 ("hw/xen: Add xenstore wire implementation and implementation stubs")
Reported-by: Hui Peng <benquike@gmail.com>
Closes: https://gitlab.com/qemu-project/qemu/-/work_items/4525
Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 hw/i386/kvm/xen_xenstore.c | 26 +++++++++++++++-----------
 1 file changed, 15 insertions(+), 11 deletions(-)

diff --git a/hw/i386/kvm/xen_xenstore.c b/hw/i386/kvm/xen_xenstore.c
index ff0dfb1bff8..7aa5d97e01a 100644
--- a/hw/i386/kvm/xen_xenstore.c
+++ b/hw/i386/kvm/xen_xenstore.c
@@ -614,6 +614,21 @@ static void xs_append_strings(XenXenstoreState *s, struct xsd_sockmsg *rsp,
         size_t len = strlen(l->data) + 1; /* Including the NUL termination */
         char *str = l->data;
 
+        /*
+         * Skip to the requested offset before checking what fits, so that
+         * truncation does not corrupt the offset accounting.
+         */
+        if (start) {
+            if (start >= len) {
+                start -= len;
+                continue;
+            }
+
+            str += start;
+            len -= start;
+            start = 0;
+        }
+
         if (rsp->len + len > XENSTORE_PAYLOAD_MAX) {
             if (truncate) {
                 len = XENSTORE_PAYLOAD_MAX - rsp->len;
@@ -626,17 +641,6 @@ static void xs_append_strings(XenXenstoreState *s, struct xsd_sockmsg *rsp,
             }
         }
 
-        if (start) {
-            if (start >= len) {
-                start -= len;
-                continue;
-            }
-
-            str += start;
-            len -= start;
-            start = 0;
-        }
-
         memcpy(&rsp_data[rsp->len], str, len);
         rsp->len += len;
     }
-- 
2.43.0


