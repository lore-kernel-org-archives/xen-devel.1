Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FF32C44524
	for <xen-devel@archiver.kernel.org>; Mon, 20 Jul 2026 07:56:58 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1366178.1616101 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wlirp-0007G4-Qt; Mon, 20 Jul 2026 07:56:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1366178.1616101; Mon, 20 Jul 2026 07:56:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wlirp-0007Ft-NY; Mon, 20 Jul 2026 07:56:49 +0000
Received: by outflank-mailman (input) for mailman id 1366178;
 Mon, 20 Jul 2026 07:56:48 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <marcandre.lureau@redhat.com>) id 1wlirn-0007Bm-SO
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2026 07:56:47 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wlirn-006OPL-9I
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2026 09:56:47 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <marcandre.lureau@redhat.com>)
 id 6a5dd4a2-e002-0a2a0a5209dd-0a2a450ae50a-44
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 09:56:47 +0200
Received: from [170.10.133.124] (helo=us-smtp-delivery-124.mimecast.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <marcandre.lureau@redhat.com>)
 id 6a5dd4bd-f2d2-0a2a450a0019-aa0a857cd803-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 09:56:46 +0200
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-436-mvZGYl0uNn6hoGgqO_KziA-1; Mon,
 20 Jul 2026 03:56:44 -0400
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 5B0991956062; Mon, 20 Jul 2026 07:56:42 +0000 (UTC)
Received: from localhost (unknown [10.44.22.17])
 by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 9A224300019F; Mon, 20 Jul 2026 07:56:40 +0000 (UTC)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=mimecast20190719 header.d=redhat.com header.i="@redhat.com" header.h="From:Subject:Date:Message-Id:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:References"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784534205;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xTUNd/oAznZ+5DBJcrLXPZUtAhiWELpozE94IO79kVM=;
	b=XKk+GR8AnbUtw8PmqRJ9nSJaGK5jkug+K5W1VErYd3UR8w2iXNE4euOYa754Svgzmt8agI
	r61uxwVONPyUKWClJRu3e6+hS/xLH7qgX4v0c0hyBcHWcGvBMarYMvZzNMVytDBeaCdoBy
	AlePbv8uWA3dFuci5n0sY4ZQYoMt/mg=
X-MC-Unique: mvZGYl0uNn6hoGgqO_KziA-1
X-Mimecast-MFC-AGG-ID: mvZGYl0uNn6hoGgqO_KziA_1784534202
From: =?utf-8?q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>
Date: Mon, 20 Jul 2026 11:55:36 +0400
Subject: [PATCH 7/8] hw/9pfs: annotate V9fsTransport callbacks as
 coroutine_fn
MIME-Version: 1.0
Message-Id: <20260720-co-v1-7-fabb4db3c204@redhat.com>
References: <20260720-co-v1-0-fabb4db3c204@redhat.com>
In-Reply-To: <20260720-co-v1-0-fabb4db3c204@redhat.com>
To: qemu-devel@nongnu.org
Cc: Markus Armbruster <armbru@redhat.com>, Peter Xu <peterx@redhat.com>, 
 Fabiano Rosas <farosas@suse.de>, 
 =?utf-8?q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 John Snow <jsnow@redhat.com>, 
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>, 
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>, 
 qemu-block@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>, 
 Fam Zheng <fam@euphon.net>, "Denis V. Lunev" <den@openvz.org>, 
 Christian Schoenebeck <qemu_oss@crudebyte.com>, Greg Kurz <groug@kaod.org>, 
 "Michael S. Tsirkin" <mst@redhat.com>, 
 Stefano Stabellini <sstabellini@kernel.org>, 
 Anthony PERARD <anthony@xenproject.org>, 
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, 
 xen-devel@lists.xenproject.org, Li Zhijian <lizhijian@fujitsu.com>, 
 =?utf-8?q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>
X-Developer-Signature: v=1; a=openpgp-sha256; l=12144;
 i=marcandre.lureau@redhat.com; h=from:subject:message-id;
 bh=VQVGJfDT80KbK+AoENxEwrM6bfEWbX5AlZ6JqJMH9mA=;
 b=owEBbQKS/ZANAwAKAdro4Ql1lpzlAcsmYgBqXdSJ6Z/QPH7kTs/Jsir+p4sjk7mKxJ2hfNQ1M
 /Fy5ozeaXyJAjMEAAEKAB0WIQSHqb2TP4fGBtJ29i3a6OEJdZac5QUCal3UiQAKCRDa6OEJdZac
 5dFEEACKxwmBieIUQRK10iarYOhSucm6MTcqL3qywn4+lGJ+NNksfanaaamPcctgBnspAtjzBHc
 seNnEj8oQVxTaRaPY/pTyTNKyGEnVhVyIy6qyrEvyz1QNeNXs0ac/kb3lkBnjEnuVD89uK8LuMv
 zd7CEVW38RWWzwUAhalsgpqYHHsoirgJzZjEL4RVWW1ENzejaP8YO3qQjkBwMGH1z5q3bWsytIC
 nF3JHbSrgeCu50zrAEzgW7Go5RmySvrjGQ1ZUrb6815X3LJp5jwOXJzftQK4JMqkcR6OXqHPS+a
 l9RAUVe9S3pPIYjIrDBKPhnOwvl+852JcQa7a4cttv5OQijV5+V1W34s2Y9yRQC0H1NwGunB489
 MXVCUbsmLtlAsrYXuPbtVELkADlfL/wkuI93Zx7ifI2rUVHkPR2oLtIEUNgSqyA3d1CTHCE4+9B
 zBfCbHrDJruj+KN6vEgePCqfdVdm//Z0RwpTfVIGiCCpv7pqCLzWOi5fJ8Y9/g+VvMhnpVZfEzm
 3tC7BGwwMK1MBQycfVamm7lA9bpt2iEGgPLPfbpkMh/x97A1rRFEdPgDbOBuptkMUu3uc4NzG1B
 xqqTQRDsN02SYrXXj6jQR0QJmIpCSszEUl7OmaHT1g+Zae2RBRdBloaqbDujHbHbm3nlZ9YE5sA
 Z8Rwyt+9qwQKv8w==
X-Developer-Key: i=marcandre.lureau@redhat.com; a=openpgp;
 fpr=87A9BD933F87C606D276F62DDAE8E10975969CE5
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Mimecast-MFC-PROC-ID: 0VF2pb0k2WT6-UNijesCY355SA8lswKj3l5O9552cV8_1784534202
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-4011c0/1784534207-5A3DCCFC-3F4119B5/0/0
X-purgate-type: clean
X-purgate-size: 12146

All V9fsTransport callbacks are invoked exclusively from coroutine
context (the v9fs_* PDU handlers). Annotate the function pointer
types in V9fsTransport and all implementations (virtio and xen
backends), as well as intermediate callers in 9p.c (pdu_marshal,
pdu_unmarshal, v9fs_init_qiov_from_pdu, etc.).

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 hw/9pfs/9p.h               | 26 +++++++++++++++-----------
 hw/9pfs/9p.c               | 31 +++++++++++++++++++------------
 hw/9pfs/virtio-9p-device.c | 24 +++++++++++++-----------
 hw/9pfs/xen-9p-backend.c   | 34 +++++++++++++++++-----------------
 4 files changed, 64 insertions(+), 51 deletions(-)

diff --git a/hw/9pfs/9p.h b/hw/9pfs/9p.h
index 1a309664f6e..0e52ffbdf38 100644
--- a/hw/9pfs/9p.h
+++ b/hw/9pfs/9p.h
@@ -472,17 +472,21 @@ void pdu_submit(V9fsPDU *pdu, P9MsgHeader *hdr);
 void v9fs_reset(V9fsState *s);
 
 struct V9fsTransport {
-    ssize_t     (*pdu_vmarshal)(V9fsPDU *pdu, size_t offset, const char *fmt,
-                                va_list ap);
-    ssize_t     (*pdu_vunmarshal)(V9fsPDU *pdu, size_t offset, const char *fmt,
-                                  va_list ap);
-    void        (*init_in_iov_from_pdu)(V9fsPDU *pdu, struct iovec **piov,
-                                        unsigned int *pniov, size_t size);
-    void        (*init_out_iov_from_pdu)(V9fsPDU *pdu, struct iovec **piov,
-                                         unsigned int *pniov, size_t size);
-    void        (*push_and_notify)(V9fsPDU *pdu);
-    size_t      (*msize_limit)(V9fsState *s);
-    size_t      (*response_buffer_size)(V9fsPDU *pdu);
+    ssize_t     coroutine_fn (*pdu_vmarshal)(V9fsPDU *pdu, size_t offset,
+                                             const char *fmt, va_list ap);
+    ssize_t     coroutine_fn (*pdu_vunmarshal)(V9fsPDU *pdu, size_t offset,
+                                               const char *fmt, va_list ap);
+    void        coroutine_fn (*init_in_iov_from_pdu)(V9fsPDU *pdu,
+                                                     struct iovec **piov,
+                                                     unsigned int *pniov,
+                                                     size_t size);
+    void        coroutine_fn (*init_out_iov_from_pdu)(V9fsPDU *pdu,
+                                                      struct iovec **piov,
+                                                      unsigned int *pniov,
+                                                      size_t size);
+    void        coroutine_fn (*push_and_notify)(V9fsPDU *pdu);
+    size_t      coroutine_fn (*msize_limit)(V9fsState *s);
+    size_t      coroutine_fn (*response_buffer_size)(V9fsPDU *pdu);
 };
 
 #endif
diff --git a/hw/9pfs/9p.c b/hw/9pfs/9p.c
index 3119f011173..00cfbae6dd5 100644
--- a/hw/9pfs/9p.c
+++ b/hw/9pfs/9p.c
@@ -55,7 +55,8 @@ enum {
 
 P9ARRAY_DEFINE_TYPE(V9fsPath, v9fs_path_free);
 
-static ssize_t pdu_marshal(V9fsPDU *pdu, size_t offset, const char *fmt, ...)
+static ssize_t coroutine_fn
+pdu_marshal(V9fsPDU *pdu, size_t offset, const char *fmt, ...)
 {
     ssize_t ret;
     va_list ap;
@@ -67,7 +68,8 @@ static ssize_t pdu_marshal(V9fsPDU *pdu, size_t offset, const char *fmt, ...)
     return ret;
 }
 
-static ssize_t pdu_unmarshal(V9fsPDU *pdu, size_t offset, const char *fmt, ...)
+static ssize_t coroutine_fn
+pdu_unmarshal(V9fsPDU *pdu, size_t offset, const char *fmt, ...)
 {
     ssize_t ret;
     va_list ap;
@@ -1841,7 +1843,8 @@ out_nofid:
     pdu_complete(pdu, err);
 }
 
-static int v9fs_walk_marshal(V9fsPDU *pdu, uint16_t nwnames, V9fsQID *qids)
+static int coroutine_fn
+v9fs_walk_marshal(V9fsPDU *pdu, uint16_t nwnames, V9fsQID *qids)
 {
     int i;
     ssize_t err;
@@ -2363,9 +2366,10 @@ out_nofid:
  * The resulting QEMUIOVector has heap-allocated iovecs and must be cleaned up
  * with qemu_iovec_destroy().
  */
-static void v9fs_init_qiov_from_pdu(QEMUIOVector *qiov, V9fsPDU *pdu,
-                                    size_t skip, size_t size,
-                                    bool is_write)
+static void coroutine_fn
+v9fs_init_qiov_from_pdu(QEMUIOVector *qiov, V9fsPDU *pdu,
+                        size_t skip, size_t size,
+                        bool is_write)
 {
     QEMUIOVector elem;
     struct iovec *iov;
@@ -2382,8 +2386,9 @@ static void v9fs_init_qiov_from_pdu(QEMUIOVector *qiov, V9fsPDU *pdu,
     qemu_iovec_concat(qiov, &elem, skip, size);
 }
 
-static int v9fs_xattr_read(V9fsState *s, V9fsPDU *pdu, V9fsFidState *fidp,
-                           uint64_t off, uint32_t max_count)
+static int coroutine_fn
+v9fs_xattr_read(V9fsState *s, V9fsPDU *pdu, V9fsFidState *fidp,
+                uint64_t off, uint32_t max_count)
 {
     ssize_t err;
     size_t offset = 7;
@@ -2793,9 +2798,10 @@ out_nofid:
     pdu_complete(pdu, retval);
 }
 
-static int v9fs_xattr_write(V9fsState *s, V9fsPDU *pdu, V9fsFidState *fidp,
-                            uint64_t off, uint32_t count,
-                            struct iovec *sg, int cnt)
+static int coroutine_fn
+v9fs_xattr_write(V9fsState *s, V9fsPDU *pdu, V9fsFidState *fidp,
+                 uint64_t off, uint32_t count,
+                 struct iovec *sg, int cnt)
 {
     int i, to_copy;
     ssize_t err = 0;
@@ -3729,7 +3735,8 @@ out_nofid:
     pdu_complete(pdu, err);
 }
 
-static int v9fs_fill_statfs(V9fsState *s, V9fsPDU *pdu, struct statfs *stbuf)
+static int coroutine_fn
+v9fs_fill_statfs(V9fsState *s, V9fsPDU *pdu, struct statfs *stbuf)
 {
     uint32_t f_type;
     uint32_t f_bsize;
diff --git a/hw/9pfs/virtio-9p-device.c b/hw/9pfs/virtio-9p-device.c
index 50dc93091d3..b2dd859fb56 100644
--- a/hw/9pfs/virtio-9p-device.c
+++ b/hw/9pfs/virtio-9p-device.c
@@ -28,7 +28,7 @@
 #include "qemu/module.h"
 #include "system/qtest.h"
 
-static void virtio_9p_push_and_notify(V9fsPDU *pdu)
+static void coroutine_fn virtio_9p_push_and_notify(V9fsPDU *pdu)
 {
     V9fsState *s = pdu->s;
     V9fsVirtioState *v = container_of(s, V9fsVirtioState, state);
@@ -117,8 +117,8 @@ static void virtio_9p_reset(VirtIODevice *vdev)
     v9fs_reset(&v->state);
 }
 
-static ssize_t virtio_pdu_vmarshal(V9fsPDU *pdu, size_t offset,
-                                   const char *fmt, va_list ap)
+static ssize_t coroutine_fn
+virtio_pdu_vmarshal(V9fsPDU *pdu, size_t offset, const char *fmt, va_list ap)
 {
     V9fsState *s = pdu->s;
     V9fsVirtioState *v = container_of(s, V9fsVirtioState, state);
@@ -135,8 +135,8 @@ static ssize_t virtio_pdu_vmarshal(V9fsPDU *pdu, size_t offset,
     return ret;
 }
 
-static ssize_t virtio_pdu_vunmarshal(V9fsPDU *pdu, size_t offset,
-                                     const char *fmt, va_list ap)
+static ssize_t coroutine_fn
+virtio_pdu_vunmarshal(V9fsPDU *pdu, size_t offset, const char *fmt, va_list ap)
 {
     V9fsState *s = pdu->s;
     V9fsVirtioState *v = container_of(s, V9fsVirtioState, state);
@@ -152,8 +152,9 @@ static ssize_t virtio_pdu_vunmarshal(V9fsPDU *pdu, size_t offset,
     return ret;
 }
 
-static void virtio_init_in_iov_from_pdu(V9fsPDU *pdu, struct iovec **piov,
-                                        unsigned int *pniov, size_t size)
+static void coroutine_fn
+virtio_init_in_iov_from_pdu(V9fsPDU *pdu, struct iovec **piov,
+                            unsigned int *pniov, size_t size)
 {
     V9fsState *s = pdu->s;
     V9fsVirtioState *v = container_of(s, V9fsVirtioState, state);
@@ -172,8 +173,9 @@ static void virtio_init_in_iov_from_pdu(V9fsPDU *pdu, struct iovec **piov,
     *pniov = elem->in_num;
 }
 
-static void virtio_init_out_iov_from_pdu(V9fsPDU *pdu, struct iovec **piov,
-                                         unsigned int *pniov, size_t size)
+static void coroutine_fn
+virtio_init_out_iov_from_pdu(V9fsPDU *pdu, struct iovec **piov,
+                             unsigned int *pniov, size_t size)
 {
     V9fsState *s = pdu->s;
     V9fsVirtioState *v = container_of(s, V9fsVirtioState, state);
@@ -192,13 +194,13 @@ static void virtio_init_out_iov_from_pdu(V9fsPDU *pdu, struct iovec **piov,
     *pniov = elem->out_num;
 }
 
-static size_t virtio_9p_msize_limit(V9fsState *s)
+static size_t coroutine_fn virtio_9p_msize_limit(V9fsState *s)
 {
     const size_t guestPageSize = 4096;
     return (VIRTQUEUE_MAX_SIZE - 2) * guestPageSize;
 }
 
-static size_t virtio_9p_response_buffer_size(V9fsPDU *pdu)
+static size_t coroutine_fn virtio_9p_response_buffer_size(V9fsPDU *pdu)
 {
     V9fsState *s = pdu->s;
     V9fsVirtioState *v = container_of(s, V9fsVirtioState, state);
diff --git a/hw/9pfs/xen-9p-backend.c b/hw/9pfs/xen-9p-backend.c
index 24c90d97ec9..7f674f84642 100644
--- a/hw/9pfs/xen-9p-backend.c
+++ b/hw/9pfs/xen-9p-backend.c
@@ -131,10 +131,10 @@ static void xen_9pfs_out_sg(Xen9pfsRing *ring,
     }
 }
 
-static ssize_t xen_9pfs_pdu_vmarshal(V9fsPDU *pdu,
-                                     size_t offset,
-                                     const char *fmt,
-                                     va_list ap)
+static ssize_t coroutine_fn xen_9pfs_pdu_vmarshal(V9fsPDU *pdu,
+                                                  size_t offset,
+                                                  const char *fmt,
+                                                  va_list ap)
 {
     Xen9pfsDev *xen_9pfs = container_of(pdu->s, Xen9pfsDev, state);
     struct iovec in_sg[2];
@@ -155,10 +155,10 @@ static ssize_t xen_9pfs_pdu_vmarshal(V9fsPDU *pdu,
     return ret;
 }
 
-static ssize_t xen_9pfs_pdu_vunmarshal(V9fsPDU *pdu,
-                                       size_t offset,
-                                       const char *fmt,
-                                       va_list ap)
+static ssize_t coroutine_fn xen_9pfs_pdu_vunmarshal(V9fsPDU *pdu,
+                                                    size_t offset,
+                                                    const char *fmt,
+                                                    va_list ap)
 {
     Xen9pfsDev *xen_9pfs = container_of(pdu->s, Xen9pfsDev, state);
     struct iovec out_sg[2];
@@ -178,10 +178,10 @@ static ssize_t xen_9pfs_pdu_vunmarshal(V9fsPDU *pdu,
     return ret;
 }
 
-static void xen_9pfs_init_out_iov_from_pdu(V9fsPDU *pdu,
-                                           struct iovec **piov,
-                                           unsigned int *pniov,
-                                           size_t size)
+static void coroutine_fn xen_9pfs_init_out_iov_from_pdu(V9fsPDU *pdu,
+                                                        struct iovec **piov,
+                                                        unsigned int *pniov,
+                                                        size_t size)
 {
     Xen9pfsDev *xen_9pfs = container_of(pdu->s, Xen9pfsDev, state);
     Xen9pfsRing *ring = &xen_9pfs->rings[pdu->tag % xen_9pfs->num_rings];
@@ -195,10 +195,10 @@ static void xen_9pfs_init_out_iov_from_pdu(V9fsPDU *pdu,
     *pniov = num;
 }
 
-static void xen_9pfs_init_in_iov_from_pdu(V9fsPDU *pdu,
-                                          struct iovec **piov,
-                                          unsigned int *pniov,
-                                          size_t size)
+static void coroutine_fn xen_9pfs_init_in_iov_from_pdu(V9fsPDU *pdu,
+                                                       struct iovec **piov,
+                                                       unsigned int *pniov,
+                                                       size_t size)
 {
     Xen9pfsDev *xen_9pfs = container_of(pdu->s, Xen9pfsDev, state);
     Xen9pfsRing *ring = &xen_9pfs->rings[pdu->tag % xen_9pfs->num_rings];
@@ -227,7 +227,7 @@ again:
     *pniov = num;
 }
 
-static void xen_9pfs_push_and_notify(V9fsPDU *pdu)
+static void coroutine_fn xen_9pfs_push_and_notify(V9fsPDU *pdu)
 {
     RING_IDX prod;
     Xen9pfsDev *priv = container_of(pdu->s, Xen9pfsDev, state);

-- 
2.55.0


