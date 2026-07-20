Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B2D8C44515
	for <xen-devel@archiver.kernel.org>; Mon, 20 Jul 2026 07:56:32 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1366146.1616047 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wlirL-0004xt-1K; Mon, 20 Jul 2026 07:56:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1366146.1616047; Mon, 20 Jul 2026 07:56:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wlirK-0004xl-U6; Mon, 20 Jul 2026 07:56:18 +0000
Received: by outflank-mailman (input) for mailman id 1366146;
 Mon, 20 Jul 2026 07:56:18 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <marcandre.lureau@redhat.com>) id 1wlirK-0004xK-CE
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2026 07:56:18 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wlirJ-00FzlO-GA
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2026 09:56:17 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <marcandre.lureau@redhat.com>)
 id 6a5dd498-5cb7-0a2a0a5109dd-0a2a4503bdd2-44
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 09:56:17 +0200
Received: from [170.10.133.124] (helo=us-smtp-delivery-124.mimecast.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <marcandre.lureau@redhat.com>)
 id 6a5dd49f-fae8-0a2a45030019-aa0a857cd14f-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 09:56:17 +0200
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-284-JgVuit-kMgK1jPYX8qS_FA-1; Mon,
 20 Jul 2026 03:56:09 -0400
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 2C2E5195DE19; Mon, 20 Jul 2026 07:56:07 +0000 (UTC)
Received: from localhost (unknown [10.44.22.17])
 by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id AEE44158C; Mon, 20 Jul 2026 07:56:03 +0000 (UTC)
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
	s=mimecast20190719; t=1784534175;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IjhaPEySj2ajiT+j39JgZYAcWp9YnSZM59v8er2az0s=;
	b=CsF/V7WwMgGhUn9q2Gkl5XU7ikCezj6SmlXJPJz7CBDnbbWIUyfQSYARDugWYu0OwztuPj
	Jfiy4N28MjjsN7FICfhORUivJD8sKsi8w66NXZNPHp7SWYLeZg+LdXVtuafULfE8mxay2j
	Ui5GRWR8ffZXK0iyNghE8YhAIh25uAQ=
X-MC-Unique: JgVuit-kMgK1jPYX8qS_FA-1
X-Mimecast-MFC-AGG-ID: JgVuit-kMgK1jPYX8qS_FA_1784534168
From: =?utf-8?q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>
Date: Mon, 20 Jul 2026 11:55:30 +0400
Subject: [PATCH 1/8] monitor: annotate monitor_qmp_dispatcher_pop_any() as
 coroutine
MIME-Version: 1.0
Message-Id: <20260720-co-v1-1-fabb4db3c204@redhat.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=741;
 i=marcandre.lureau@redhat.com; h=from:subject:message-id;
 bh=yCQTIOZ3vdGSd0wX9FrJ+Idz4YTHnIHGhg0Q7MfK0Pk=;
 b=owEBbQKS/ZANAwAKAdro4Ql1lpzlAcsmYgBqXdSJm3lJfJ6ohY7uz1cUw8l9YT42D+RXR3qnr
 vkvsHJbEpaJAjMEAAEKAB0WIQSHqb2TP4fGBtJ29i3a6OEJdZac5QUCal3UiQAKCRDa6OEJdZac
 5fkOD/9cRo7MNM4+pqSDsys8gDgW3GuMHh1KDecO9oSlPlFqHPZR8xKJW+UBUPeBLfzWe0SkXVM
 EgwtKvxHf2nJFxJIXoQ3RmYPXZvcu0bbwW09aoTgffW0SvZ90NvdVu5gGRJL77VN7OX13se0qrk
 Nq/FOmPbOi7mlgoQJR2E0tP3td6Pm8T1XtUwoDEDFu+jTS7UUPU7nCNtgL9R8bnpp2ZeYQ+t73l
 jBkM71m6SEkFlWlnmb/EYAedmt/GVhFMfty1Jw32BLdWR5cVsEK+PcKuPluonj2ieIUEyrSnFzc
 nx0SYxXkUVKwQLSgvhaTUREGh1tsD1mic9T97mHZXIdXUtjAPfpF07kbvHFAGGQBpRv5I+fw609
 IF9jB2Ca7v11FvsXm+u2dAservR9BMb14AIdjuPXfFdAFvqkvNoHAqyHojAjgLLFJJ8O2elle1B
 W1og6muJNAUKv7Whp4O6iogUgKaWqfyq+Cxv3v4nmywF80qu3q+gZw42NQg9q2bYR1CtlYN6e22
 +cVsnQvg4S5XHkx2WF0quyrrz/K+xm15m4e0PrLWvLm+MivthT3jm0FDbf5x58HGlcJf7/ALfV2
 2UvvhgcA6bBTr9KZj/idyZw23D4534bk/iDP1Knx34kY6MkQV3ZNsoNln8fFL63llOBZynv5swW
 M1sHhwUCyZ0bglw==
X-Developer-Key: i=marcandre.lureau@redhat.com; a=openpgp;
 fpr=87A9BD933F87C606D276F62DDAE8E10975969CE5
X-Scanned-By: MIMEDefang 3.6 on 10.30.177.95
X-Mimecast-MFC-PROC-ID: rRwGkq0iRjchcu31WImX_NQxiMKmMtPNAgQQpwPw07I_1784534168
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-33051d/1784534177-6DCD34E9-4E41D8CB/0/0
X-purgate-type: clean
X-purgate-size: 743

The function calls qemu_coroutine_yield(), and is called from
monitor_qmp_dispatcher_co().

Fixes: 60f4f62efeb ("monitor: extract request dequeuing to a new function")
Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 monitor/qmp.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/monitor/qmp.c b/monitor/qmp.c
index 223e0643c2a..338d37cb7e5 100644
--- a/monitor/qmp.c
+++ b/monitor/qmp.c
@@ -342,7 +342,8 @@ static QMPRequest *monitor_qmp_requests_pop_any_with_lock(void)
     return req_obj;
 }
 
-static QMPRequest *monitor_qmp_dispatcher_pop_any(void)
+static QMPRequest * coroutine_fn
+monitor_qmp_dispatcher_pop_any(void)
 {
     while (true) {
         /*

-- 
2.55.0


