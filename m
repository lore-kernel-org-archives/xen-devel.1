Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04EC6606A321
	for <xen-devel@archiver.kernel.org>; Tue, 24 Nov 2026 23:29:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=QhjGViLk
Received: from list by lists.xenproject.org with outflank-mailman.1501598.1697685 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xVzwX-0006Ei-Qb; Tue, 24 Nov 2026 23:28:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1501598.1697685; Tue, 24 Nov 2026 23:28:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xVzwX-0006BL-9O; Tue, 24 Nov 2026 23:28:57 +0000
Received: by outflank-mailman (input) for mailman id 1501598;
 Tue, 24 Nov 2026 23:28:55 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <BATV+8ed7664ba4dc972f2276+8493+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1xVzwV-0005Xi-4X
 for xen-devel@lists.xenproject.org; Tue, 24 Nov 2026 23:28:55 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xVzwU-000ROO-Fp; Wed, 25 Nov 2026 00:28:54 +0100
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <BATV+8ed7664ba4dc972f2276+8493+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 6b061d53-e002-0a2a0a5209dd-0a2a450cd480-46
 for <multiple-recipients>; Wed, 25 Nov 2026 00:28:53 +0100
Received: from [90.155.92.199] (helo=desiato.infradead.org)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <BATV+8ed7664ba4dc972f2276+8493+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 6b061c4c-f479-0a2a450c0019-5a9b5cc7e468-3
 for <multiple-recipients>; Wed, 25 Nov 2026 00:22:53 +0100
Received: from [2001:8b0:10b:1::425] (helo=i7.infradead.org)
 by desiato.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
 id 1xVzqc-00000004eUw-1qfw; Tue, 24 Nov 2026 23:22:51 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.99.5 #2 (Red
 Hat Linux)) id 1xVzqZ-0000000061q-10xa;
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
	bh=ik79pPafOlsmEIxdCKJuF0t0ouBbOJcNq4lchRAKKII=; b=QhjGViLkiYG22fvjKr9HGpi46Z
	JriGCgqO0yPR36mLxKyfJnbU+UroM5TUpgI4NwZIjTz+VlEldiO0Y3ZM1fNwoqIy01kM8Lakkn6OT
	sJX2Eku6voMijBMigxGnCNR8BJO2ILMZETmcc14VVu45zzBdlztWa/75YwiJ+Ye2MmK3I2d3FKSS5
	TGfGpIhE0kisqLbFkofQTD5GPjRinpISLN8vGRNg6kC4reGg+PX7YwnKuarFmPb7EGG0Pm3+aVyQF
	MScrmGwl873ca7Xn+7Ak8sG0MswIRGto6nqAVOtYjb3LuENHZhwCHxo9x40srLEJMclod4NYjDvlY
	QyR4KRsg==;
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
Subject: [PATCH v1 01/21] hw/xen: Fix partial request header handling in emulated XenStore
Date: Tue, 24 Nov 2026 23:22:27 +0000
Message-ID: <20261124232247.23169-2-dwmw2@infradead.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261124232247.23169-1-dwmw2@infradead.org>
References: <20261124232247.23169-1-dwmw2@infradead.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: David Woodhouse <dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by desiato.infradead.org. See http://www.infradead.org/rpr.html
X-purgate-ID: tlsNG-d25034/1795562573-01AC4A5B-0AC8D43B/0/0
X-purgate-type: clean
X-purgate-size: 1144
X-Spam-Status: No, score=-23.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: David Woodhouse <dwmw@amazon.co.uk>

When a XenStore request header is only partially received, QEMU copies
XENSTORE_HEADER_SIZE bytes instead of only the remaining header bytes.

Fix the length calculation to copy only the missing part of the header.

Closes: https://gitlab.com/qemu-project/qemu/-/work_items/3644
Fixes: f3341e7b915 ("hw/xen: Add basic ring handling to xenstore")
Fixes: CVE-2026-61403
Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 hw/i386/kvm/xen_xenstore.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/i386/kvm/xen_xenstore.c b/hw/i386/kvm/xen_xenstore.c
index 0dc0edf3bfd..7d6d6d5cbb7 100644
--- a/hw/i386/kvm/xen_xenstore.c
+++ b/hw/i386/kvm/xen_xenstore.c
@@ -1218,7 +1218,7 @@ static unsigned int get_req(XenXenstoreState *s)
 
     if (s->req_offset < XENSTORE_HEADER_SIZE) {
         void *ptr = s->req_data + s->req_offset;
-        unsigned int len = XENSTORE_HEADER_SIZE;
+        unsigned int len = XENSTORE_HEADER_SIZE - s->req_offset;
         unsigned int copylen = copy_from_ring(s, ptr, len);
 
         copied += copylen;
-- 
2.43.0


