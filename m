Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9111AC44515
	for <xen-devel@archiver.kernel.org>; Mon, 20 Jul 2026 07:56:56 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1366170.1616092 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wlirl-0006nj-F3; Mon, 20 Jul 2026 07:56:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1366170.1616092; Mon, 20 Jul 2026 07:56:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wlirl-0006nc-9p; Mon, 20 Jul 2026 07:56:45 +0000
Received: by outflank-mailman (input) for mailman id 1366170;
 Mon, 20 Jul 2026 07:56:44 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <marcandre.lureau@redhat.com>) id 1wlirk-0006jL-0R
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2026 07:56:44 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wlirj-008bDr-DC
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2026 09:56:43 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <marcandre.lureau@redhat.com>)
 id 6a5dd4ad-bab6-0a2a0a5309dd-0a2a450bbf00-32
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 09:56:43 +0200
Received: from [170.10.133.124] (helo=us-smtp-delivery-124.mimecast.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <marcandre.lureau@redhat.com>)
 id 6a5dd4ba-b7e8-0a2a450b0019-aa0a857cbde1-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 09:56:43 +0200
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-564-ueMBmxX3NoiCR6Lyx6dC8g-1; Mon,
 20 Jul 2026 03:56:38 -0400
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 84BF6180135D; Mon, 20 Jul 2026 07:56:36 +0000 (UTC)
Received: from localhost (unknown [10.44.22.17])
 by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 7FDD818001E1; Mon, 20 Jul 2026 07:56:34 +0000 (UTC)
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
	s=mimecast20190719; t=1784534202;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7KbttnCatQH9tfMpq5G3nrwTwf9fJs3VEPqTLa4lGS4=;
	b=iVe0tUdzL3aMI9gjIFQeCj1JGi2qDlcdoKWdATxBImbqRuYFYDalkvmvJ3cpyRNf7iCWNC
	CUyjLo6lpNrrL2NNQCm7qm1PtBwbwVatdsB8KPRUlkW03UuhvxQXlCjdgCH30Q4LL48VOA
	IWMC4KGe9/dQjlHyRhNM7n80cePTqVY=
X-MC-Unique: ueMBmxX3NoiCR6Lyx6dC8g-1
X-Mimecast-MFC-AGG-ID: ueMBmxX3NoiCR6Lyx6dC8g_1784534196
From: =?utf-8?q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>
Date: Mon, 20 Jul 2026 11:55:35 +0400
Subject: [PATCH 6/8] block: add missing coroutine_fn annotations
MIME-Version: 1.0
Message-Id: <20260720-co-v1-6-fabb4db3c204@redhat.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5107;
 i=marcandre.lureau@redhat.com; h=from:subject:message-id;
 bh=MElhPudYde5N+AmBqX8hc/jkArXPzRKcda7rMFMqgZk=;
 b=owEBbQKS/ZANAwAKAdro4Ql1lpzlAcsmYgBqXdSJQZyOC7EnnGJBFtdOw9SYol+ehCZ6GIiJn
 Cq9QWoT7wWJAjMEAAEKAB0WIQSHqb2TP4fGBtJ29i3a6OEJdZac5QUCal3UiQAKCRDa6OEJdZac
 5d/3D/9H9eWiSP6C6d6WvD53puNrUJgnuw0goXTDAtzGeGO+v0k/NJRuPcV75b11nLEmePNBtdK
 CtfU7+pYuJ7IP26KuzaKT4k/oPrsL2oTXWQnmMXJBRh1qLGBqby2jLiWPs+WW3ZcYXqlBBljb/m
 BoFMAlunoJOZCh4Matysnrlgc/0TqZfYQkTzZnoAgDqQir+AjzFwxLKDOd9su+gbWibeyLCcuxv
 Ve4yev3jk4PHQZJj8SjObjDfJ1bGMapRkr/2kKtF8Hfe15lGegb/tmk2dvUe+sy+saqbQVUuBkf
 kc3tpBJSghwNTNjBRkDrab9+psFk2aj+vuzNrhQ1BJgjipZ15UxpgqyINd0xPdHI4F7yaQwXK+t
 btMjOnyrxv9kABv7xoOZeFJPzr5Wp4DRUcx4x0QP6b2lqzStrAdsnYckaVZy86JY/TP3Qrc0IlP
 e0zAWVnVONmkuQDZ8BRbOypopE/7Y83/RHkVn4ucCTHjyitVsVrwUBCUZSzhb2M5GOsBfkaUlzd
 x+5MYr8zFtcrX2Jlhf0zk+KDUsn43gm+RPr3Ot5vMlrqx7eDvUhN++G85/Dc9kdVTJCGMKlghaI
 /2fJnx4sqs+wBfbvx6mmDwbMv8lzQJg9DghaOAqEt7Iq1U2QoD4J/9tB3MB5kJBqOWCGwIrNkRw
 YfBQTcHKkoJvNig==
X-Developer-Key: i=marcandre.lureau@redhat.com; a=openpgp;
 fpr=87A9BD933F87C606D276F62DDAE8E10975969CE5
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-Mimecast-MFC-PROC-ID: vVwH-QvV6ykjHbsyTHIxPJQ6qnkiOJ4-Y3j05xdPLvA_1784534196
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-42698a/1784534203-1BCD79EA-1B41C265/0/0
X-purgate-type: clean
X-purgate-size: 5109

The functions call coroutine functions or are called by coroutine.

Add an assert() in qcow2_do_close() code path which calls a
no_coroutine_fn bdrv_graph_wrlock_drained().

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 include/block/blockjob_int.h |  2 +-
 block/crypto.c               | 13 +++++++------
 block/io.c                   |  8 +++++---
 block/parallels.c            |  5 +++--
 block/qcow2.c                | 11 +++++++----
 blockjob.c                   |  3 ++-
 6 files changed, 25 insertions(+), 17 deletions(-)

diff --git a/include/block/blockjob_int.h b/include/block/blockjob_int.h
index 4c3d2e25a20..34e172874fa 100644
--- a/include/block/blockjob_int.h
+++ b/include/block/blockjob_int.h
@@ -150,7 +150,7 @@ void block_job_ratelimit_processed_bytes(BlockJob *job, uint64_t n);
  * Put the job to sleep (assuming that it wasn't canceled) to throttle it to the
  * right speed according to its rate limiting.
  */
-void block_job_ratelimit_sleep(BlockJob *job);
+void coroutine_fn block_job_ratelimit_sleep(BlockJob *job);
 
 /**
  * block_job_error_action:
diff --git a/block/crypto.c b/block/crypto.c
index 36abb7af468..8a34d92fded 100644
--- a/block/crypto.c
+++ b/block/crypto.c
@@ -56,12 +56,13 @@ static int block_crypto_probe_generic(QCryptoBlockFormat format,
 }
 
 
-static int block_crypto_read_func(QCryptoBlock *block,
-                                  size_t offset,
-                                  uint8_t *buf,
-                                  size_t buflen,
-                                  void *opaque,
-                                  Error **errp)
+static int coroutine_mixed_fn
+block_crypto_read_func(QCryptoBlock *block,
+                       size_t offset,
+                       uint8_t *buf,
+                       size_t buflen,
+                       void *opaque,
+                       Error **errp)
 {
     BlockDriverState *bs = opaque;
     BlockCrypto *crypto = bs->opaque;
diff --git a/block/io.c b/block/io.c
index a916b236c3c..99dd16864a3 100644
--- a/block/io.c
+++ b/block/io.c
@@ -346,8 +346,9 @@ static void coroutine_fn bdrv_co_yield_to_drain(BlockDriverState *bs,
     assert(data.done);
 }
 
-static void bdrv_do_drained_begin(BlockDriverState *bs, BdrvChild *parent,
-                                  bool poll)
+static void coroutine_mixed_fn
+bdrv_do_drained_begin(BlockDriverState *bs, BdrvChild *parent,
+                      bool poll)
 {
     IO_OR_GS_CODE();
 
@@ -397,7 +398,8 @@ bdrv_drained_begin(BlockDriverState *bs)
  * This function does not poll, nor must any of its recursively called
  * functions.
  */
-static void bdrv_do_drained_end(BlockDriverState *bs, BdrvChild *parent)
+static void coroutine_mixed_fn
+bdrv_do_drained_end(BlockDriverState *bs, BdrvChild *parent)
 {
     IO_OR_GS_CODE();
 
diff --git a/block/parallels.c b/block/parallels.c
index 7a90fb5220b..46a6e8f2743 100644
--- a/block/parallels.c
+++ b/block/parallels.c
@@ -142,8 +142,9 @@ static uint32_t host_cluster_index(BDRVParallelsState *s, int64_t off)
     return off / s->cluster_size;
 }
 
-static int64_t block_status(BDRVParallelsState *s, int64_t sector_num,
-                            int nb_sectors, int *pnum)
+static int64_t coroutine_fn
+block_status(BDRVParallelsState *s, int64_t sector_num,
+             int nb_sectors, int *pnum)
 {
     int64_t start_off = -2, prev_end_off = -2;
 
diff --git a/block/qcow2.c b/block/qcow2.c
index 19271b10a49..161626fa3cb 100644
--- a/block/qcow2.c
+++ b/block/qcow2.c
@@ -1287,9 +1287,10 @@ fail:
 }
 
 /* s_locked specifies whether s->lock is held or not */
-static void qcow2_update_options_commit(BlockDriverState *bs,
-                                        Qcow2ReopenState *r,
-                                        bool s_locked)
+static void coroutine_fn
+qcow2_update_options_commit(BlockDriverState *bs,
+                            Qcow2ReopenState *r,
+                            bool s_locked)
 {
     BDRVQcow2State *s = bs->opaque;
     int i;
@@ -2126,7 +2127,8 @@ fail:
     return ret;
 }
 
-static void qcow2_reopen_commit(BDRVReopenState *state)
+static void coroutine_fn
+qcow2_reopen_commit(BDRVReopenState *state)
 {
     BDRVQcow2State *s = state->bs->opaque;
 
@@ -2905,6 +2907,7 @@ qcow2_do_close(BlockDriverState *bs, bool close_data_file)
     g_free(s->image_backing_format);
 
     if (close_data_file && has_data_file(bs)) {
+        assert(!qemu_in_coroutine());
         GLOBAL_STATE_CODE();
         bdrv_graph_rdunlock_main_loop();
         bdrv_graph_wrlock_drained();
diff --git a/blockjob.c b/blockjob.c
index f3b11cc7a19..f3ad6a93125 100644
--- a/blockjob.c
+++ b/blockjob.c
@@ -338,7 +338,8 @@ void block_job_ratelimit_processed_bytes(BlockJob *job, uint64_t n)
     ratelimit_calculate_delay(&job->limit, n);
 }
 
-void block_job_ratelimit_sleep(BlockJob *job)
+void coroutine_fn
+block_job_ratelimit_sleep(BlockJob *job)
 {
     uint64_t delay_ns;
 

-- 
2.55.0


