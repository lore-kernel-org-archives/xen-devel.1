Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32B23C44524
	for <xen-devel@archiver.kernel.org>; Mon, 20 Jul 2026 07:56:47 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1366155.1616074 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wlirc-0005yz-Qv; Mon, 20 Jul 2026 07:56:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1366155.1616074; Mon, 20 Jul 2026 07:56:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wlirc-0005ys-NY; Mon, 20 Jul 2026 07:56:36 +0000
Received: by outflank-mailman (input) for mailman id 1366155;
 Mon, 20 Jul 2026 07:56:34 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <marcandre.lureau@redhat.com>) id 1wlira-0005v6-Qy
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2026 07:56:34 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wlira-006OJC-7B
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2026 09:56:34 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <marcandre.lureau@redhat.com>)
 id 6a5dd4b1-e002-0a2a0a5209dd-0a2a4504d9ec-2
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 09:56:34 +0200
Received: from [170.10.133.124] (helo=us-smtp-delivery-124.mimecast.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <marcandre.lureau@redhat.com>)
 id 6a5dd4b0-b57f-0a2a45040019-aa0a857ca755-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 09:56:33 +0200
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-402-jdj5FvwpPZimA4mMbZqh9A-1; Mon,
 20 Jul 2026 03:56:27 -0400
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 2731F1956095; Mon, 20 Jul 2026 07:56:25 +0000 (UTC)
Received: from localhost (unknown [10.44.22.17])
 by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 96DF31955F73; Mon, 20 Jul 2026 07:56:23 +0000 (UTC)
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
	s=mimecast20190719; t=1784534192;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ALldkh8seNA+CMYH3lEA3G+/dS0/SJeW8CIYrG9pcqg=;
	b=QUGisbldSb2V0DNiC4xld7yWenmoU6xDMmH7MILqqWSMTrOGHn4dPO55ww9quASkBe9WTm
	Sjf5vy53VQ+faTtaJPRATQlZ48AMtmYV7yWtrFCdtGll6DX96ejIV6sFuqsrY6unY3c0HS
	eHkEJiaf2oFcmC0OaEr4w16VLQWOEwg=
X-MC-Unique: jdj5FvwpPZimA4mMbZqh9A-1
X-Mimecast-MFC-AGG-ID: jdj5FvwpPZimA4mMbZqh9A_1784534186
From: =?utf-8?q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>
Date: Mon, 20 Jul 2026 11:55:33 +0400
Subject: [PATCH 4/8] block: add missing coroutine annotation
MIME-Version: 1.0
Message-Id: <20260720-co-v1-4-fabb4db3c204@redhat.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=861;
 i=marcandre.lureau@redhat.com; h=from:subject:message-id;
 bh=WmyEwYMEsZBPe16QwpjcWihXuT8+mm7P1L0OltCg6FI=;
 b=owEBbQKS/ZANAwAKAdro4Ql1lpzlAcsmYgBqXdSJA2EiDfjrLe0AmLG5DHsASaHz6NBI5jV4Q
 MGQdc/B9EmJAjMEAAEKAB0WIQSHqb2TP4fGBtJ29i3a6OEJdZac5QUCal3UiQAKCRDa6OEJdZac
 5cKFD/9P2uRbNUYrYGtaBq2O66ze0WyGYtu7Jf8KB/SPvKvaQ9PDNhMzEUwX+kb+2gUVqMYdFy4
 noa0RtH8Yjg3PrTX4HrT2rAoJe79Iro7gUKYrbrlqm+E0CCIDbNzwcQ2usPXGrXswZerkH7T+5c
 bpKsaRmkKrzTIQw1Sj8RQHchphAgo8Xsz04wt151GrNd76Tkdu4JcySLtxb6WJnrDYTPS+HLOAt
 RwgvB/9AnknYNnCwg2FoyCvf9rqsSZuEbAllihNkd+wcAa6b5JPEj5tfJijtCyq/V1ZS0v7IkTC
 pvvuKKH6+zgARuwnplV5l2tOP5jtxPfHfgZS7W6H6ZjLDxf29aObVcGVKOTau8KLNWRj+F1L6zS
 ccpIwmZSf8x+pesappkS2YxmhaN/mmU9F+YadIxSfArGlsclY8lGRmBUIkhHo/+WxfnUx4P3YAL
 VHv0okqVOEka0w+7liQOelrhh5PQP0+Wzz8CqHqDMJzhDsJThU2VcDplF4pFgpvvR/ME8AL9fe6
 8KeakmrcRBIaY6njZDrIgv/OhPQa/NpKFiYQJMPBlP8FDuOgP0EJl8eiH/WPZ76ebiutGujSb8s
 NnH3ftmtYGjbgb7EYd6nzo2JGxBM0DZnEkMcORwRfbya8vl0Ul+LxZ2Ylj8QiP4Py4pMe1xCIYx
 Y2WkjmpXIm6wH/g==
X-Developer-Key: i=marcandre.lureau@redhat.com; a=openpgp;
 fpr=87A9BD933F87C606D276F62DDAE8E10975969CE5
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-Mimecast-MFC-PROC-ID: __c8828leIr4bXvZozUpkaVdaERiCy0ZhV6m332mp0M_1784534186
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ebf023/1784534193-532CCB50-21455C39/0/0
X-purgate-type: clean
X-purgate-size: 863

The function was extracted without carrying the annotation.

Fixes: 23743ab282af ("block: move commit_run loop to separate function")
Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 block/commit.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/block/commit.c b/block/commit.c
index c5e3ef03a21..2d52c39594c 100644
--- a/block/commit.c
+++ b/block/commit.c
@@ -128,8 +128,9 @@ static void commit_clean(Job *job)
     blk_unref(s->top);
 }
 
-static int commit_iteration(CommitBlockJob *s, int64_t offset,
-                            int64_t *requested_bytes, void *buf)
+static int coroutine_fn
+commit_iteration(CommitBlockJob *s, int64_t offset,
+                 int64_t *requested_bytes, void *buf)
 {
     BlockErrorAction action;
     int64_t bytes = *requested_bytes;

-- 
2.55.0


