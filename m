Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A51A6C44515
	for <xen-devel@archiver.kernel.org>; Mon, 20 Jul 2026 07:57:08 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1366188.1616110 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wliry-0007nq-2A; Mon, 20 Jul 2026 07:56:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1366188.1616110; Mon, 20 Jul 2026 07:56:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wlirx-0007ng-VY; Mon, 20 Jul 2026 07:56:57 +0000
Received: by outflank-mailman (input) for mailman id 1366188;
 Mon, 20 Jul 2026 07:56:56 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <marcandre.lureau@redhat.com>) id 1wlirw-0007i0-6M
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2026 07:56:56 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wlirv-006OPL-Iv
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2026 09:56:55 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <marcandre.lureau@redhat.com>)
 id 6a5dd4c1-e002-0a2a0a5209dd-0a2a45098e2e-32
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 09:56:55 +0200
Received: from [170.10.133.124] (helo=us-smtp-delivery-124.mimecast.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <marcandre.lureau@redhat.com>)
 id 6a5dd4c6-be1a-0a2a45090019-aa0a857ce7cb-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 09:56:55 +0200
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-654-a-9sm84FOP-1Id4qXsae5A-1; Mon,
 20 Jul 2026 03:56:49 -0400
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 9D017195C27E; Mon, 20 Jul 2026 07:56:47 +0000 (UTC)
Received: from localhost (unknown [10.44.22.17])
 by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 906B5300019F; Mon, 20 Jul 2026 07:56:45 +0000 (UTC)
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
	s=mimecast20190719; t=1784534214;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QtMvLnVwqMzsmDla/+s5l4nRkQgIhL5LT1ivzwU06OA=;
	b=GQGuyA/m6r/R3GF4YOhItEl/FV46Ht7TnauDUY79IB2mIXKL8O7bBmdCoibt6/mj3NnI7U
	RJMXFsrFhwKGk36D3myqXlWoSy7Xl9PFRzjsoNKik6QsI8qOy2/oAGKddP0TSXWUtgH/yg
	7YCOyC+kLXQygw/zDsIrtu4hTiFRCR8=
X-MC-Unique: a-9sm84FOP-1Id4qXsae5A-1
X-Mimecast-MFC-AGG-ID: a-9sm84FOP-1Id4qXsae5A_1784534207
From: =?utf-8?q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>
Date: Mon, 20 Jul 2026 11:55:37 +0400
Subject: [PATCH 8/8] migration/rdma: annotate and simplify
 wait_comp_channel()
MIME-Version: 1.0
Message-Id: <20260720-co-v1-8-fabb4db3c204@redhat.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1578;
 i=marcandre.lureau@redhat.com; h=from:subject:message-id;
 bh=oJIZjL5v3qPuEfmBmoADXHdeUtnH1fO9aSt78aaOTQA=;
 b=owEBbQKS/ZANAwAKAdro4Ql1lpzlAcsmYgBqXdSJmwU3fDMJVOh8NuPQiJP+1ImSwWEZ2LEnz
 qyx/VYPaPuJAjMEAAEKAB0WIQSHqb2TP4fGBtJ29i3a6OEJdZac5QUCal3UiQAKCRDa6OEJdZac
 5QRXD/9BDWYERq9hLRl+MFCCSV5uIL8qHuaXkYPzavZXz7FtCWheLKyyvu7gNq789M2FyuM6L/U
 SmN25PuDKXTlF0LLOKYvy6NCVOmVtdB7O4X9Hr/527c79DSfow3UbQOHHLIPnWy9R7s6YKriGsc
 EhBrRia46wFO7TjPaDdYpX/fKWOpgm2Fushi3gMbtZcac+5WWg0SkECprjBV0b+OXThYzlzpe9o
 N/kxmJMzJOj5BSePFncuxHyN6VlkssZrgd4MhWf0PthYCSnetE1WDSMPBCv2644cXFk1EUdkBPM
 pouk07hjPvPgyI8GRY8cKNn/j3crriZPAMd9obZ3+nI34KECpH9aINhlRs7jMl1mQkq0NU3eDug
 9omDTtOEUTZYs9U4LGSptWwmVklM12krTzNUeuabXyG6EA9tcBuIo2d+GhtOvgrXRO2IfGkz1Mj
 c7+oQjf8y0ZuQYAkw0rTQQ9CXjh+qaNGv6hTHg5hHhmbEwTGSZraj1RzRNvu4s1A5qtSAQkRmGW
 frqDSIk1ncj1UZ1Cz7aWKNP11TsjvC7DqePEvURkQvZCzTLg5IZiD5Aq+XfQiJqcF7jIv7oeo6y
 z4BpSH8CNBkAYoPujDpgvdtJ4Sk3Dx4rPgNrKoXeg9mOq7ONID/yFe4vKn7XQFs3ZxaJeZ7hZ1f
 WBJ+qu9IhQiLhRA==
X-Developer-Key: i=marcandre.lureau@redhat.com; a=openpgp;
 fpr=87A9BD933F87C606D276F62DDAE8E10975969CE5
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Mimecast-MFC-PROC-ID: riYuG6eBLdHJ-1YoEq7v_NdOQR7HQYhixnx53Uqv3tA_1784534207
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-bad1c0/1784534215-BC8C9034-6191174D/0/0
X-purgate-type: clean
X-purgate-size: 1580

The function calls yield_until_fd_readable() (coroutine_fn) when in
coroutine context, and polls with qemu_poll_ns() otherwise.

Replace the migration-state proxy check with qemu_in_coroutine(),
which directly tests what matters.

Fixes: 2da776db4846 ("rdma: core logic")
Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 migration/rdma.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/migration/rdma.c b/migration/rdma.c
index 3e37a1d4401..438419d1894 100644
--- a/migration/rdma.c
+++ b/migration/rdma.c
@@ -1348,17 +1348,13 @@ static int qemu_rdma_poll(RDMAContext *rdma, struct ibv_cq *cq,
 /* Wait for activity on the completion channel.
  * Returns 0 on success, none-0 on error.
  */
-static int qemu_rdma_wait_comp_channel(RDMAContext *rdma,
-                                       struct ibv_comp_channel *comp_channel)
+static int coroutine_mixed_fn
+qemu_rdma_wait_comp_channel(RDMAContext *rdma,
+                            struct ibv_comp_channel *comp_channel)
 {
     struct rdma_cm_event *cm_event;
 
-    /*
-     * Coroutine doesn't start until migration_fd_process_incoming()
-     * so don't yield unless we know we're running inside of a coroutine.
-     */
-    if (rdma->migration_started_on_destination &&
-        migration_incoming_get_current()->state == MIGRATION_STATUS_ACTIVE) {
+    if (qemu_in_coroutine()) {
         yield_until_fd_readable(comp_channel->fd);
     } else {
         /* This is the source side, we're in a separate thread

-- 
2.55.0


