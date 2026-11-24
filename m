Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62E3C606A31E
	for <xen-devel@archiver.kernel.org>; Tue, 24 Nov 2026 23:29:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=VPk73umi
Received: from list by lists.xenproject.org with outflank-mailman.1501597.1697675 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xVzwX-00066F-1b; Tue, 24 Nov 2026 23:28:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1501597.1697675; Tue, 24 Nov 2026 23:28:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xVzwW-00063T-Oy; Tue, 24 Nov 2026 23:28:56 +0000
Received: by outflank-mailman (input) for mailman id 1501597;
 Tue, 24 Nov 2026 23:28:55 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <BATV+8ed7664ba4dc972f2276+8493+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1xVzwV-0005Xf-38
 for xen-devel@lists.xenproject.org; Tue, 24 Nov 2026 23:28:55 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xVzwU-005mLD-Fp; Wed, 25 Nov 2026 00:28:54 +0100
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <BATV+8ed7664ba4dc972f2276+8493+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 6b061d5f-8faa-0a2a0a5109dd-0a2a450bdf22-44
 for <multiple-recipients>; Wed, 25 Nov 2026 00:28:53 +0100
Received: from [90.155.92.199] (helo=desiato.infradead.org)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <BATV+8ed7664ba4dc972f2276+8493+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 6b061c4c-b7e8-0a2a450b0019-5a9b5cc7a08c-3
 for <multiple-recipients>; Wed, 25 Nov 2026 00:22:53 +0100
Received: from [2001:8b0:10b:1::425] (helo=i7.infradead.org)
 by desiato.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
 id 1xVzqc-00000004eV4-1kK2; Tue, 24 Nov 2026 23:22:51 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.99.5 #2 (Red
 Hat Linux)) id 1xVzqZ-0000000062c-2RFz;
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
	bh=gbvkt3Oepuml/pNsje0Ov8dVS+0VaVrs1jH1HkxnPHs=; b=VPk73umiR5GJfJ0+T5UgE0U/qR
	bxw0kmsInIOWwFvbNRbHlZrBUjf9MrApQnrjgNpwnPjQOJ0HlpL3fr8+kxCfVZFvFk0iEbzUD7+vM
	0eXgnyVzz1Kzv1qM60QzxxlM7bqKcNQZ3PqLQ4j1nkzCrFUrqkqw2LHTMWBqJf8V4aRMyHYgbkQCz
	yzEIwLngfM1EKNQJMmf6YHDg4OSGXAhg7Kh7ViV3HkKDtFLJDKrjE0q7vrlYYfwHOpe9+D4ixI4mt
	wVPTi6Wa93HNEkrA3hlJI6flMHTFaKYM7OTi6AbThyUAWX0ORQAWD4HEGDqkZVtkvxTQr9TelykRY
	wtS41DXw==;
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
Subject: [PATCH v1 13/21] hw/char/xen_console: Fix buffer trim when size exceeds twice the limit
Date: Tue, 24 Nov 2026 23:22:39 +0000
Message-ID: <20261124232247.23169-14-dwmw2@infradead.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261124232247.23169-1-dwmw2@infradead.org>
References: <20261124232247.23169-1-dwmw2@infradead.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: David Woodhouse <dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by desiato.infradead.org. See http://www.infradead.org/rpr.html
X-purgate-ID: tlsNG-42698a/1795562573-AB4D39EA-A319C9E6/13/0
X-purgate-type: clean
X-purgate-size: 2465
X-Spam-Status: No, score=-23.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: David Woodhouse <dwmw@amazon.co.uk>

In buffer_append() we handle a full buffer by discarding bytes from the
*middle*, preserving the oldest and the newest data. When the overflow
exceeded the max capacity (a limit set by the guest), the memmove()
destination was miscalculated and ended up before the start of the
buffer. In that case there is no older data worth preserving anyway;
just keep the newest max_capacity bytes.

Fixes: CVE-2026-123071
Fixes: e57dd20bb706 ("xen: add console backend driver.")
Reported-by: Giovanni Vignone <https://gitlab.com/gio24>
Reported-by: Hui Peng <benquike@gmail.com>
Closes: https://gitlab.com/qemu-project/qemu/-/work_items/4191
Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 hw/char/xen_console.c | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/hw/char/xen_console.c b/hw/char/xen_console.c
index df6a708494d..849a93a8178 100644
--- a/hw/char/xen_console.c
+++ b/hw/char/xen_console.c
@@ -89,17 +89,25 @@ static bool buffer_append(XenConsole *con)
 
     if (buffer->max_capacity &&
         buffer->size > buffer->max_capacity) {
-        /* Discard the middle of the data. */
-
+        /*
+         * Discard the middle of the data: keep the head of the buffer
+         * up to where the overflowing data will be moved down to end
+         * at max_capacity, and the newest 'keep' bytes. If the buffer
+         * has grown to more than twice max_capacity (the frontend may
+         * set an arbitrarily small 'limit'), there is no head to keep
+         * and the newest max_capacity bytes alone remain.
+         */
         size_t over = buffer->size - buffer->max_capacity;
-        uint8_t *maxpos = buffer->data + buffer->max_capacity;
+        size_t keep = MIN(over, buffer->max_capacity);
 
-        memmove(maxpos - over, maxpos, over);
+        memmove(buffer->data + buffer->max_capacity - keep,
+                buffer->data + buffer->size - keep, keep);
         buffer->data = g_realloc(buffer->data, buffer->max_capacity);
         buffer->size = buffer->capacity = buffer->max_capacity;
 
-        if (buffer->consumed > buffer->max_capacity - over)
-            buffer->consumed = buffer->max_capacity - over;
+        if (buffer->consumed > buffer->max_capacity - keep) {
+            buffer->consumed = buffer->max_capacity - keep;
+        }
     }
     return true;
 }
-- 
2.43.0


