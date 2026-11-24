Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E14B606A31E
	for <xen-devel@archiver.kernel.org>; Tue, 24 Nov 2026 23:29:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=TwVely/1
Received: from list by lists.xenproject.org with outflank-mailman.1501601.1697719 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xVzwc-0007GP-AB; Tue, 24 Nov 2026 23:29:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1501601.1697719; Tue, 24 Nov 2026 23:29:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xVzwb-0007E1-O1; Tue, 24 Nov 2026 23:29:01 +0000
Received: by outflank-mailman (input) for mailman id 1501601;
 Tue, 24 Nov 2026 23:29:00 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <BATV+8ed7664ba4dc972f2276+8493+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1xVzwa-000750-9k
 for xen-devel@lists.xenproject.org; Tue, 24 Nov 2026 23:29:00 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xVzwZ-001vkU-MP; Wed, 25 Nov 2026 00:28:59 +0100
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <BATV+8ed7664ba4dc972f2276+8493+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 6b061da6-2eae-0a2a0a5409dd-0a2a4506daf4-6
 for <multiple-recipients>; Wed, 25 Nov 2026 00:28:59 +0100
Received: from [90.155.92.199] (helo=desiato.infradead.org)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <BATV+8ed7664ba4dc972f2276+8493+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 6b061c52-195a-0a2a45060019-5a9b5cc7a970-3
 for <multiple-recipients>; Wed, 25 Nov 2026 00:22:59 +0100
Received: from [2001:8b0:10b:1::425] (helo=i7.infradead.org)
 by desiato.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
 id 1xVzqc-00000004eUx-1kJG; Tue, 24 Nov 2026 23:22:58 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.99.5 #2 (Red
 Hat Linux)) id 1xVzqZ-00000000622-1Xjf;
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
	bh=CuCNOHrw3g5kpN0eJlwQJDa3PSDtkFSPqrd1YVfbUH4=; b=TwVely/1oU3dXIXs/wYs9bg3V7
	v9Nr5aM4ZZiTZw6SLi74DnVzy7ZBLWoznl+XKvXaln4y2FdYnT0A/ILwNp339CIgT4I9CXALgwjqr
	RmjtdBRxqB8aHygJAbNoXA6G/wDDL31jtfoJVbbHAXaI1pRLBnqN61POd36Gsowg6z3q8bqh1Ig2m
	sTO3i7pWZyUfcogkMXBaC7pZIGcqziE/qAUQMWr8gYJcBXXwm+1hPKpHx6TTSD3Ly12Abn0Ykl4lu
	vz/j8JhOcbDhaphlqd+SmhmMpa0l7TWz3MUd5V9g6H3d+NIIQn34Vt8a/F6vyXfAkEUOPTIzQ8kHp
	Yhgu418Q==;
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
Subject: [PATCH v1 05/21] hw/i386/kvm/xen_gnttab: Fix error handling in xen_be_gnttab_map_refs()
Date: Tue, 24 Nov 2026 23:22:31 +0000
Message-ID: <20261124232247.23169-6-dwmw2@infradead.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261124232247.23169-1-dwmw2@infradead.org>
References: <20261124232247.23169-1-dwmw2@infradead.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: David Woodhouse <dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by desiato.infradead.org. See http://www.infradead.org/rpr.html
X-purgate-ID: tlsNG-16d1c6/1795562579-1FACA77B-D5486498/13/0
X-purgate-type: clean
X-purgate-size: 2676
X-Spam-Status: No, score=-23.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: David Woodhouse <dwmw@amazon.co.uk>

When the grant's target page cannot be mapped, the failure path calls
gnt_unref(), which asserts that the map_track[] refcount is non-zero —
but the refcount was only incremented after a successful mapping. Take
the reference as soon as gnt_ref() succeeds, so the failure path stays
balanced.

Refuse writable mappings, including a write upgrade of an existing
mapping, when the underlying memory region is read-only, and set errno
when the upgrade fails.

Fixes: b08d88e30f06 ("hw/xen: Add emulated implementation of grant table operations")
Reported-by: Hui Peng <benquike@gmail.com>
Closes: https://gitlab.com/qemu-project/qemu/-/work_items/4525
Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 hw/i386/kvm/xen_gnttab.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/hw/i386/kvm/xen_gnttab.c b/hw/i386/kvm/xen_gnttab.c
index 85b324e62d0..26d1febac4d 100644
--- a/hw/i386/kvm/xen_gnttab.c
+++ b/hw/i386/kvm/xen_gnttab.c
@@ -363,7 +363,9 @@ static void *xen_be_gnttab_map_refs(struct xengntdev_handle *xgt,
     act = g_hash_table_lookup(xgt->active_maps, GINT_TO_POINTER(refs[0]));
     if (act) {
         if ((prot & PROT_WRITE) && !(act->prot & PROT_WRITE)) {
-            if (gnt_ref(s, refs[0], prot) == INVALID_GPA) {
+            if (act->mrs.readonly ||
+                gnt_ref(s, refs[0], prot) == INVALID_GPA) {
+                errno = EINVAL;
                 return NULL;
             }
             act->prot |= PROT_WRITE;
@@ -376,12 +378,19 @@ static void *xen_be_gnttab_map_refs(struct xengntdev_handle *xgt,
             return NULL;
         }
 
+        /*
+         * Keep the map_track[] count balanced with the gnt_unref() in the
+         * failure path below, which asserts that it never underflows.
+         */
+        s->map_track[refs[0]]++;
+
         act = g_new0(struct active_ref, 1);
         act->prot = prot;
         act->refcnt = 1;
         act->mrs = memory_region_find(get_system_memory(), gpa, XEN_PAGE_SIZE);
 
         if (act->mrs.mr &&
+            !(act->mrs.readonly && (prot & PROT_WRITE)) &&
             !int128_lt(act->mrs.size, int128_make64(XEN_PAGE_SIZE)) &&
             memory_region_get_ram_addr(act->mrs.mr) != RAM_ADDR_INVALID) {
             act->virtaddr = qemu_map_ram_ptr(act->mrs.mr->ram_block,
@@ -394,7 +403,6 @@ static void *xen_be_gnttab_map_refs(struct xengntdev_handle *xgt,
             return NULL;
         }
 
-        s->map_track[refs[0]]++;
         g_hash_table_insert(xgt->active_maps, GINT_TO_POINTER(refs[0]), act);
     }
 
-- 
2.43.0


