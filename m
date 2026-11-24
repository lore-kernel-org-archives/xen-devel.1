Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11B63606A331
	for <xen-devel@archiver.kernel.org>; Tue, 24 Nov 2026 23:23:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=ByYwvkFg
Received: from list by lists.xenproject.org with outflank-mailman.1501499.1697553 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xVzqh-00081o-TC; Tue, 24 Nov 2026 23:22:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1501499.1697553; Tue, 24 Nov 2026 23:22:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xVzqh-000817-L4; Tue, 24 Nov 2026 23:22:55 +0000
Received: by outflank-mailman (input) for mailman id 1501499;
 Tue, 24 Nov 2026 23:22:53 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <BATV+7be3010b4cb4d9f5c1a9+8493+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1xVzqd-0007o9-RO
 for xen-devel@lists.xenproject.org; Tue, 24 Nov 2026 23:22:53 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xVzqd-001ulu-7y; Wed, 25 Nov 2026 00:22:51 +0100
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <BATV+7be3010b4cb4d9f5c1a9+8493+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 6b061c2b-8faa-0a2a0a5109dd-0a2a450ac630-8
 for <multiple-recipients>; Wed, 25 Nov 2026 00:22:50 +0100
Received: from [90.155.50.34] (helo=casper.infradead.org)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <BATV+7be3010b4cb4d9f5c1a9+8493+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 6b061c49-f2d2-0a2a450a0019-5a9b3222e968-3
 for <multiple-recipients>; Wed, 25 Nov 2026 00:22:49 +0100
Received: from [2001:8b0:10b:1::425] (helo=i7.infradead.org)
 by casper.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
 id 1xVzqZ-0000000Gdhz-45hv; Tue, 24 Nov 2026 23:22:49 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.99.5 #2 (Red
 Hat Linux)) id 1xVzqZ-0000000062U-2B62;
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
	bh=7Q8vcK6pp8jnVnCjyRjbmOniJ69JnrySfnqcCaHpuRg=; b=ByYwvkFgRf+NraRIKwg2fC4EDw
	CmOLguurIyG6OgQEEKm1F6mB3yG70Z8RMXbB5UsF9zwGU+4Di0mNG2JjIuOoD7RMpDzEKKpgAvxRn
	1z/ITJftIVEb3OKUXxcjYpBdrBlzT4kpDiXsbHwf+2LcESWmbnUMMDN2czKFZnVX9/zkVLZ6rZ6gM
	QWG0EmDqE6X3Fu1wgM5JXuaM3KUgJlEyhauqf0kiFxoqQzGaGfo/2htOB02X7L4eXi0BYPukwEuKK
	Hbb8xYQ3TxJ2jXbnctaD8vkMILe43Adp+suaI2YGl+aGUOxJQJb9QRjD371JRAyDGKpqsfs5UaWIL
	pkueEdZA==;
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
Subject: [PATCH v1 11/21] hw/i386/kvm/xen: Don't leak gnttab handle on reset
Date: Tue, 24 Nov 2026 23:22:37 +0000
Message-ID: <20261124232247.23169-12-dwmw2@infradead.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261124232247.23169-1-dwmw2@infradead.org>
References: <20261124232247.23169-1-dwmw2@infradead.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: David Woodhouse <dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
X-purgate-ID: tlsNG-4011c0/1795562570-506CECFC-5D53E399/0/0
X-purgate-type: clean
X-purgate-size: 1937
X-Spam-Status: No, score=-23.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: David Woodhouse <dwmw@amazon.co.uk>

xen_xenstore_reset() and xen_primary_console_reset() open a new gnttab
handle without closing the previous one, leaking it and its mappings on
each guest soft reset. Close the old handle first; closing unmaps any
remaining refs.

Fixes: d05864d23b1a ("hw/xen: Map guest XENSTORE_PFN grant in emulated Xenstore")
Fixes: a72ccc7fc449 ("hw/xen: add support for Xen primary console in emulated mode")
Reported-by: Hui Peng <benquike@gmail.com>
Closes: https://gitlab.com/qemu-project/qemu/-/work_items/4525
Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 hw/i386/kvm/xen_primary_console.c | 3 +++
 hw/i386/kvm/xen_xenstore.c        | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/hw/i386/kvm/xen_primary_console.c b/hw/i386/kvm/xen_primary_console.c
index bf61f6235be..0a2a6de3ecb 100644
--- a/hw/i386/kvm/xen_primary_console.c
+++ b/hw/i386/kvm/xen_primary_console.c
@@ -184,6 +184,9 @@ int xen_primary_console_reset(void)
 
     trace_xen_primary_console_reset(s->guest_port);
 
+    if (s->gt) {
+        qemu_xen_gnttab_close(s->gt);
+    }
     s->gt = qemu_xen_gnttab_open();
     uint32_t xs_gntref = GNTTAB_RESERVED_CONSOLE;
     s->granted_xs = qemu_xen_gnttab_map_refs(s->gt, 1, xen_domid, &xs_gntref,
diff --git a/hw/i386/kvm/xen_xenstore.c b/hw/i386/kvm/xen_xenstore.c
index 7d6d6d5cbb7..ff0dfb1bff8 100644
--- a/hw/i386/kvm/xen_xenstore.c
+++ b/hw/i386/kvm/xen_xenstore.c
@@ -1490,6 +1490,9 @@ int xen_xenstore_reset(void)
      * first place. Map the grant anyway, mostly for cosmetic purposes so
      * it *looks* like it's in use in the guest-visible grant table.
      */
+    if (s->gt) {
+        qemu_xen_gnttab_close(s->gt);
+    }
     s->gt = qemu_xen_gnttab_open();
     uint32_t xs_gntref = GNTTAB_RESERVED_XENSTORE;
     s->granted_xs = qemu_xen_gnttab_map_refs(s->gt, 1, xen_domid, &xs_gntref,
-- 
2.43.0


