Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 075F0C531F9
	for <xen-devel@archiver.kernel.org>; Sat, 25 Jul 2026 09:49:23 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1370559.1618657 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wnZ0G-0004Cy-Dp; Sat, 25 Jul 2026 09:49:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1370559.1618657; Sat, 25 Jul 2026 09:49:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wnZ0G-0004Cn-AB; Sat, 25 Jul 2026 09:49:08 +0000
Received: by outflank-mailman (input) for mailman id 1370559;
 Sat, 25 Jul 2026 09:49:06 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <marcandre.lureau@redhat.com>) id 1wnZ0E-00049n-QP
 for xen-devel@lists.xenproject.org; Sat, 25 Jul 2026 09:49:06 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wnZ0E-003Tyx-7N
 for xen-devel@lists.xenproject.org; Sat, 25 Jul 2026 11:49:06 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <marcandre.lureau@redhat.com>)
 id 6a648692-bab6-0a2a0a5309dd-0a2a4509bc64-0
 for <xen-devel@lists.xenproject.org>; Sat, 25 Jul 2026 11:49:06 +0200
Received: from [170.10.129.124] (helo=us-smtp-delivery-124.mimecast.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <marcandre.lureau@redhat.com>)
 id 6a648691-be1a-0a2a45090019-aa0a817c6be9-3
 for <xen-devel@lists.xenproject.org>; Sat, 25 Jul 2026 11:49:06 +0200
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-433-8qtqlocdObSmloqw3eCJ0w-1; Sat,
 25 Jul 2026 05:49:01 -0400
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 9624B1800C35; Sat, 25 Jul 2026 09:48:58 +0000 (UTC)
Received: from localhost (unknown [10.44.22.7])
 by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 0837E15AD; Sat, 25 Jul 2026 09:48:56 +0000 (UTC)
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
	s=mimecast20190719; t=1784972944;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=om5CIye3i6lrnEkPPfiq+UulgaM6eC6H/1XHPK2zRuA=;
	b=Kitw1uPwupgTTphcYwpi53xO6uRP74/xirhLgZ//Xv22tJ1Wkrxta2PzxIZxTC1nfzFFYc
	dguKspLgH5+mEPHKPArkj/lKfm/5pT9nd8XwSF4ayzcBwVPHTkHfwtiJmQVUGOXg6Tig/0
	V/aLLp0rxwXnHMCPYSMplUVpparv0J4=
X-MC-Unique: 8qtqlocdObSmloqw3eCJ0w-1
X-Mimecast-MFC-AGG-ID: 8qtqlocdObSmloqw3eCJ0w_1784972939
From: =?utf-8?q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>
Date: Sat, 25 Jul 2026 13:48:34 +0400
Subject: [PATCH v2 3/8] io: add missing coroutine annotation
MIME-Version: 1.0
Message-Id: <20260725-co-v2-3-d3552ddb3931@redhat.com>
References: <20260725-co-v2-0-d3552ddb3931@redhat.com>
In-Reply-To: <20260725-co-v2-0-d3552ddb3931@redhat.com>
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
 =?utf-8?q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>, 
 =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
X-Developer-Signature: v=1; a=openpgp-sha256; l=1443;
 i=marcandre.lureau@redhat.com; h=from:subject:message-id;
 bh=hhK3avKdImCgAXvIB7NvRmE1p7D0COK7cwqKnWNle/g=;
 b=owEBbQKS/ZANAwAKAdro4Ql1lpzlAcsmYgBqZIZzeDY3v/u02EPWgKg8h2Y9qqMbxC8tbSZol
 9UFxg2JA6uJAjMEAAEKAB0WIQSHqb2TP4fGBtJ29i3a6OEJdZac5QUCamSGcwAKCRDa6OEJdZac
 5W9FEACkxbRuybsgqPhJFHRnyhXpFxZMy1BAcH9DcOHSozjWSSJYfgx5mkUyJlAbcOTwlJaKt/P
 goJB5UinVDym73+x4ZLqQcaLfe4+Qsz9X58MyAVlc/xRwKrK/oQTONTXjBHZ0L8dlKVohTUwwlY
 NjyeKe/UZ0T/hXnLniERWlQujHe7UrBUqRTaq5166SsYU5fpF8hQ+IexJHTDEuGEPBtp1BkccU0
 Kk660LTATwk4GWKKxgie5DK6ZdmfThGclqIWhrqawLAAmAR0jvDt/ZhK3c5H+hvsOTwWoY2BbuY
 X4k2NyX/ePC45gBMuY+PaqQxflVaj27p9fjhNKMTdkVIPMv2DENrL8A/oyubDt/ovY+Dc9OT5z0
 9BwLOQITCf4RjXQ+Ipz1C18tx6WbS3rF0zepzqzi2brZbgGXgyAl+ZqEvYwqf34MryBUNxn+GDf
 z6onnYQYYWoksNmYaxC3UlO64Ix0jkZ6kNhn4C2S4cv4JRnBIG+isbEM7yuww31MgtzmP1rrAgV
 A3FUUZ4MqLqMvCRKxnz0UTdduLlZD1ugwQj2XNeS9Q+i4L579CFAE3mSocap6EvglQlxo8Aty6x
 kSmtLTyMbTMCYazOXfesBncXAAj7sXDGZSmMUs4xKEjI0dz6frEKpFUwqwjj2DKMpqVHxf8XW0K
 qlcmZvYuZkm9liQ==
X-Developer-Key: i=marcandre.lureau@redhat.com; a=openpgp;
 fpr=87A9BD933F87C606D276F62DDAE8E10975969CE5
X-Scanned-By: MIMEDefang 3.6 on 10.30.177.95
X-Mimecast-MFC-PROC-ID: 3tBt06-nx9i38aVNJ61JvYfK8iRA9yN8tGUiRWthhPo_1784972939
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-bad1c0/1784972946-BE6DA034-89A8ABFD/0/0
X-purgate-type: clean
X-purgate-size: 1445

Fixes: 1edf0df28409 ("io: Add qio_channel_wait_cond() helper")
Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 include/io/channel.h | 4 ++--
 io/channel.c         | 5 +++--
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/include/io/channel.h b/include/io/channel.h
index 98485c9280a6..c90ace20d535 100644
--- a/include/io/channel.h
+++ b/include/io/channel.h
@@ -1016,8 +1016,8 @@ void qio_channel_wait(QIOChannel *ioc,
  * This will work with/without a coroutine context, by automatically select
  * the proper API to wait.
  */
-void qio_channel_wait_cond(QIOChannel *ioc,
-                           GIOCondition condition);
+void coroutine_mixed_fn qio_channel_wait_cond(QIOChannel *ioc,
+                        GIOCondition condition);
 
 /**
  * qio_channel_set_aio_fd_handler:
diff --git a/io/channel.c b/io/channel.c
index 2853dadb684e..620256f310db 100644
--- a/io/channel.c
+++ b/io/channel.c
@@ -905,8 +905,9 @@ void qio_channel_wait(QIOChannel *ioc,
     g_main_context_unref(ctxt);
 }
 
-void qio_channel_wait_cond(QIOChannel *ioc,
-                           GIOCondition condition)
+void coroutine_mixed_fn
+qio_channel_wait_cond(QIOChannel *ioc,
+                      GIOCondition condition)
 {
     if (qemu_in_coroutine()) {
         qio_channel_yield(ioc, condition);

-- 
2.55.0


