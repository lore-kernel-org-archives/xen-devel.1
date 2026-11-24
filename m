Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5311606A323
	for <xen-devel@archiver.kernel.org>; Tue, 24 Nov 2026 23:29:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=Dc8e1wMq
Received: from list by lists.xenproject.org with outflank-mailman.1501595.1697661 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xVzwW-0005lG-1T; Tue, 24 Nov 2026 23:28:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1501595.1697661; Tue, 24 Nov 2026 23:28:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xVzwV-0005j6-R2; Tue, 24 Nov 2026 23:28:55 +0000
Received: by outflank-mailman (input) for mailman id 1501595;
 Tue, 24 Nov 2026 23:28:54 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <BATV+8ed7664ba4dc972f2276+8493+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1xVzwU-0005XD-M8
 for xen-devel@lists.xenproject.org; Tue, 24 Nov 2026 23:28:54 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xVzwU-001vbg-1Y; Wed, 25 Nov 2026 00:28:54 +0100
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <BATV+8ed7664ba4dc972f2276+8493+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 6b061d67-2eae-0a2a0a5409dd-0a2a4508c8ac-44
 for <multiple-recipients>; Wed, 25 Nov 2026 00:28:54 +0100
Received: from [90.155.92.199] (helo=desiato.infradead.org)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <BATV+8ed7664ba4dc972f2276+8493+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 6b061c4c-f659-0a2a45080019-5a9b5cc7cad0-3
 for <multiple-recipients>; Wed, 25 Nov 2026 00:22:53 +0100
Received: from [2001:8b0:10b:1::425] (helo=i7.infradead.org)
 by desiato.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
 id 1xVzqc-00000004eV0-1kl8; Tue, 24 Nov 2026 23:22:51 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.99.5 #2 (Red
 Hat Linux)) id 1xVzqZ-00000000628-1kty;
 Tue, 24 Nov 2026 23:22:47 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=desiato.20200630 header.d=infradead.org header.i="@infradead.org" header.h="Sender:Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description;
	bh=eWmMCd/JSNzWTHLZ2DwBQEQk4USo+wekbnZqkbZHiB8=; b=Dc8e1wMq+eood4AKEV1xw6kGal
	oPMghXtG3cQqdiqp74emYFfBSTIYlBUYio2t7Nko1Sy0JUnu/Zzn1v5uzRr7G5WWbLd6VUd9E1jCK
	hSkJP3i/00ZA0AoNBHkcuhsLL/JoTnDjwThDCURXb88cpCDY7nvPDgy22KL6yA/YdZVV91icp/arU
	9j9RI7AGzTeRp/IbRHWtcqtCLkb0wUjtwSv70w9jXzL/+4tyi+UP2h3W13Ljybon/JtsfDOWG90VM
	8VpwSTQiDGcRz5Di2vtlCGuLDZX3reF4sR/D9SizddoPifIJTdO29fEqspEo0SJ3h1w2BnQ60dYkN
	tFEVBbeg==;
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
Subject: [PATCH v1 07/21] hw/i386/kvm/xen_evtchn: Validate PIRQ numbers in physdev operations
Date: Tue, 24 Nov 2026 23:22:33 +0000
Message-ID: <20261124232247.23169-8-dwmw2@infradead.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261124232247.23169-1-dwmw2@infradead.org>
References: <20261124232247.23169-1-dwmw2@infradead.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: David Woodhouse <dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by desiato.infradead.org. See http://www.infradead.org/rpr.html
X-purgate-ID: tlsNG-c1860d/1795562573-CCB7187B-01AE62ED/0/0
X-purgate-type: clean
X-purgate-size: 2378
X-Spam-Status: No, score=-23.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: David Woodhouse <dwmw@amazon.co.uk>

xen_physdev_eoi_pirq() and xen_physdev_query_pirq() used the given PIRQ
number to index the PIRQ tables without checking it against nr_pirqs.
Reject out-of-range values, and reject PIRQ 0 in bind_pirq and
map_pirq. PIRQs 0-15 are reserved for the initial domain's identity
claims of the legacy ISA IRQs — the allocators, Xen's and ours alike,
never hand them out — and an HVM guest has no such claim. QEMU's
gsi_pirq[] and MSI target lookups both treat 0 as "no PIRQ", so a
guest-mapped pirq 0 could never deliver anything; better to refuse it
than to create a silently dead mapping.

Fixes: CVE-2026-123070
Fixes: 799c23548f0d ("i386/xen: Implement HYPERVISOR_physdev_op")
Reported-by: bubblehuntr <https://gitlab.com/bubblehuntr>
Reported-by: Hui Peng <benquike@gmail.com>
Closes: https://gitlab.com/qemu-project/qemu/-/work_items/4525
Closes: https://gitlab.com/qemu-project/qemu/-/work_items/3639
Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 hw/i386/kvm/xen_evtchn.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/hw/i386/kvm/xen_evtchn.c b/hw/i386/kvm/xen_evtchn.c
index 9379383e532..3aff01b5d6c 100644
--- a/hw/i386/kvm/xen_evtchn.c
+++ b/hw/i386/kvm/xen_evtchn.c
@@ -1283,7 +1283,7 @@ int xen_evtchn_bind_pirq_op(struct evtchn_bind_pirq *pirq)
         return -ENOTSUP;
     }
 
-    if (pirq->pirq >= s->nr_pirqs) {
+    if (!pirq->pirq || pirq->pirq >= s->nr_pirqs) {
         return -EINVAL;
     }
 
@@ -1877,7 +1877,7 @@ int xen_physdev_map_pirq(struct physdev_map_pirq *map)
             return pirq;
         }
         map->pirq = pirq;
-    } else if (pirq >= s->nr_pirqs) {
+    } else if (!pirq || pirq >= s->nr_pirqs) {
         return -EINVAL;
     } else {
         /*
@@ -1958,6 +1958,10 @@ int xen_physdev_eoi_pirq(struct physdev_eoi *eoi)
         return -ENOTSUP;
     }
 
+    if (pirq < 0 || pirq >= s->nr_pirqs) {
+        return -EINVAL;
+    }
+
     BQL_LOCK_GUARD();
     QEMU_LOCK_GUARD(&s->port_lock);
 
@@ -1990,6 +1994,10 @@ int xen_physdev_query_pirq(struct physdev_irq_status_query *query)
         return -ENOTSUP;
     }
 
+    if (pirq < 0 || pirq >= s->nr_pirqs) {
+        return -EINVAL;
+    }
+
     BQL_LOCK_GUARD();
     QEMU_LOCK_GUARD(&s->port_lock);
 
-- 
2.43.0


