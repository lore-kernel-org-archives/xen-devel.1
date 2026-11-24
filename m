Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32972606A31E
	for <xen-devel@archiver.kernel.org>; Tue, 24 Nov 2026 23:29:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=WRHaMACr
Received: from list by lists.xenproject.org with outflank-mailman.1501594.1697653 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xVzwV-0005eh-Nb; Tue, 24 Nov 2026 23:28:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1501594.1697653; Tue, 24 Nov 2026 23:28:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xVzwV-0005cx-JF; Tue, 24 Nov 2026 23:28:55 +0000
Received: by outflank-mailman (input) for mailman id 1501594;
 Tue, 24 Nov 2026 23:28:54 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <BATV+8ed7664ba4dc972f2276+8493+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1xVzwU-0005XC-MT
 for xen-devel@lists.xenproject.org; Tue, 24 Nov 2026 23:28:54 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xVzwT-001vbg-VU; Wed, 25 Nov 2026 00:28:53 +0100
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <BATV+8ed7664ba4dc972f2276+8493+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 6b061d67-2eae-0a2a0a5409dd-0a2a4508c8ac-42
 for <multiple-recipients>; Wed, 25 Nov 2026 00:28:53 +0100
Received: from [90.155.92.199] (helo=desiato.infradead.org)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <BATV+8ed7664ba4dc972f2276+8493+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 6b061c4c-f659-0a2a45080019-5a9b5cc7ceca-3
 for <multiple-recipients>; Wed, 25 Nov 2026 00:22:53 +0100
Received: from [2001:8b0:10b:1::425] (helo=i7.infradead.org)
 by desiato.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
 id 1xVzqc-00000004eV7-1qji; Tue, 24 Nov 2026 23:22:51 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.99.5 #2 (Red
 Hat Linux)) id 1xVzqZ-00000000630-33i9;
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
	bh=ru4a8UM9O3xCvIpKu2plhw/a8+vAtA+xiCf/OELsEVY=; b=WRHaMACr7U547v9WsamrbQoawa
	fPF/kHI27grJEbdrnlIBH7N29jbWjnv+JfB7onyE9iPhQbUREJcwMWuM6vIHflMHMB1L7jIIyZs4f
	kcaFoK4GVkf7AJGpChTsP/9mne7aTYIroB4kGlo5ylsq92Id+x+cvsO13bR3/PlIiQrxjLOkvBxNW
	UMW9ANbOiPoPgglDCvH5Rl1or6RXkMCJpfVXn4EHvp3IusB5rAxM9TBvxAKuHTT77DVUiuDi1y0ue
	fiBe1ifeYtHBgOaf0NVIy8dPf0GGmyqMtxGj16/Z1LIv2CVHjWjqldYF+ps2Gyw/yNKlbNkOy+kG4
	sIt/Y2ww==;
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
Subject: [PATCH v1 19/21] hw/xen: Bound the rep count of PIO and MMIO ioreqs
Date: Tue, 24 Nov 2026 23:22:45 +0000
Message-ID: <20261124232247.23169-20-dwmw2@infradead.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261124232247.23169-1-dwmw2@infradead.org>
References: <20261124232247.23169-1-dwmw2@infradead.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: David Woodhouse <dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by desiato.infradead.org. See http://www.infradead.org/rpr.html
X-purgate-ID: tlsNG-c1860d/1795562573-D574B87B-D4A8D483/13/0
X-purgate-type: clean
X-purgate-size: 2603
X-Spam-Status: No, score=-23.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: David Woodhouse <dwmw@amazon.co.uk>

cpu_ioreq_pio() and cpu_ioreq_move() iterated req->count times with no
upper bound, so a count of UINT32_MAX kept the vCPU handler thread
spinning through four billion iterations. Xen's instruction emulator
clips a rep batch to at most 4096 repetitions (hvmemul_virtual_to_linear()
and hvmemul_linear_to_phys() both apply that bound before an ioreq is
sent), so reject larger counts as malformed, and reject a zero size, as
the other framing checks here already do.

Fixes: 9ce94e7c8a99 ("xen: Initialize event channels and io rings")
Reported-by: Feifan Qian <bea1e@proton.me>
Closes: https://gitlab.com/qemu-project/qemu/-/work_items/3756
Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 hw/xen/xen-hvm-common.c | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/hw/xen/xen-hvm-common.c b/hw/xen/xen-hvm-common.c
index 62d88804c43..48ce655448b 100644
--- a/hw/xen/xen-hvm-common.c
+++ b/hw/xen/xen-hvm-common.c
@@ -321,10 +321,20 @@ void cpu_ioreq_pio(ioreq_t *req)
     trace_cpu_ioreq_pio(req, req->dir, req->df, req->data_is_ptr, req->addr,
                          req->data, req->count, req->size);
 
-    if (req->size > sizeof(uint32_t)) {
+    if (req->size == 0 || req->size > sizeof(uint32_t)) {
         hw_error("PIO: bad size (%u)", req->size);
     }
 
+    /*
+     * Xen's instruction emulator clips a rep batch to at most 4096
+     * repetitions (hvmemul_virtual_to_linear(), hvmemul_linear_to_phys()),
+     * so the count of a well-formed ioreq is bounded. Don't spin for
+     * 2^32 iterations on a corrupted one.
+     */
+    if (req->data_is_ptr && req->count > 4096) {
+        hw_error("PIO: bad count (%u)", req->count);
+    }
+
     if (req->dir == IOREQ_READ) {
         if (!req->data_is_ptr) {
             req->data = do_inp(req->addr, req->size);
@@ -361,10 +371,15 @@ static void cpu_ioreq_move(ioreq_t *req)
     trace_cpu_ioreq_move(req, req->dir, req->df, req->data_is_ptr, req->addr,
                          req->data, req->count, req->size);
 
-    if (req->size > sizeof(req->data)) {
+    if (req->size == 0 || req->size > sizeof(req->data)) {
         hw_error("MMIO: bad size (%u)", req->size);
     }
 
+    /* As for PIO: Xen clips a rep batch to at most 4096 repetitions. */
+    if (req->count > 4096) {
+        hw_error("MMIO: bad count (%u)", req->count);
+    }
+
     if (!req->data_is_ptr) {
         if (req->dir == IOREQ_READ) {
             for (i = 0; i < req->count; i++) {
-- 
2.43.0


