Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B716DC44524
	for <xen-devel@archiver.kernel.org>; Mon, 20 Jul 2026 07:56:34 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1366147.1616056 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wlirQ-0005EX-8p; Mon, 20 Jul 2026 07:56:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1366147.1616056; Mon, 20 Jul 2026 07:56:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wlirQ-0005EN-5I; Mon, 20 Jul 2026 07:56:24 +0000
Received: by outflank-mailman (input) for mailman id 1366147;
 Mon, 20 Jul 2026 07:56:23 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <marcandre.lureau@redhat.com>) id 1wlirP-0005DQ-4t
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2026 07:56:23 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wlirO-00FzlO-HX
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2026 09:56:22 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <marcandre.lureau@redhat.com>)
 id 6a5dd4a2-5cb7-0a2a0a5109dd-0a2a450387d4-10
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 09:56:22 +0200
Received: from [170.10.129.124] (helo=us-smtp-delivery-124.mimecast.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <marcandre.lureau@redhat.com>)
 id 6a5dd4a5-fae8-0a2a45030019-aa0a817c885b-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 09:56:22 +0200
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-329-1ephcCtmPOaVdVcRD1KrdA-1; Mon,
 20 Jul 2026 03:56:15 -0400
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id A9EA41944EAB; Mon, 20 Jul 2026 07:56:13 +0000 (UTC)
Received: from localhost (unknown [10.44.22.17])
 by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 6F35E1955F73; Mon, 20 Jul 2026 07:56:10 +0000 (UTC)
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
	s=mimecast20190719; t=1784534181;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=COHT7p/iqsTdPamcZicw3oA4ocmXtjDA5E14rv82Tas=;
	b=iKdZNprc6a6hFAXyuYjlxcFuz4Axt4BqAXs0ykU7zcfvLPrWDRFpRfCwovmXmzivlElivf
	R0SLGM8CFSqSxIb1mVBGhkcg1HM3yPDfcrggMAgGXhjAwywOgGV1MfLe5h/ucIRrZWEFt2
	nzACVtCXj6rvx89fXMIAJxPc9fSHG9M=
X-MC-Unique: 1ephcCtmPOaVdVcRD1KrdA-1
X-Mimecast-MFC-AGG-ID: 1ephcCtmPOaVdVcRD1KrdA_1784534174
From: =?utf-8?q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>
Date: Mon, 20 Jul 2026 11:55:31 +0400
Subject: [PATCH 2/8] migration: fix qemu_get_counted_string annotation
MIME-Version: 1.0
Message-Id: <20260720-co-v1-2-fabb4db3c204@redhat.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=799;
 i=marcandre.lureau@redhat.com; h=from:subject:message-id;
 bh=N6+L/HnMPoOeFVHLSkUq4poAfMYUnwCM4couCI5iOrU=;
 b=owEBbQKS/ZANAwAKAdro4Ql1lpzlAcsmYgBqXdSJlx+ej+bpFQ3bSPwwRWhu1sAyEaprMReIu
 r6EYhcqf5uJAjMEAAEKAB0WIQSHqb2TP4fGBtJ29i3a6OEJdZac5QUCal3UiQAKCRDa6OEJdZac
 5RAIEACPwUGNBa4OSzulBfcHmirufW7Q9ZWtVD8WRKl4QUwYh0x8Vw0wi8AIy8fzd4vXzHG+9SU
 iuJwNvxODCPewrohwvuzDEFNhfj/d80OL7s1wW4zuYWr3mt3I48r0HpBZrG6GFx/fh+JKh/lV9V
 yHM74KG/iXF33Qf21gOX2aw/KCFAfGjQ+YgMRf8j55j3uoZOV4rA4KEho/PctuD0xF8GPfRLBUa
 V4gpAf8InyTVps3Qj068taPoy3njqHXwytycp4WeAG5Cr3DG4QP20zkw2ufPGebXcbm9WlkW8Kj
 lANa4PkcYh8h6j6oWGX6Tp27ajZeemLSXckz0ZtPS1cVcoWquGHMHe+fBJMisXqkkRawGqShLQ0
 9aajHGOdymqfU7zpvfYOKwyhW9YuCLeZ1am7ukvgliGx0pa5mAVUARArVHBV8XY2Wg2Rao3IPFs
 a9TW6Y5biJGr3YAKMD6SkBXZzq+86hHy/LFyOw8G0iMixpfLkvb7L3yROPwHKC53pa+xUIIfEkZ
 SA6L6R04xlo7Pyt5ShqF80J3DWQjzHwmr5tgOOjiAXaP6HLGUimlycrzPfKsC0hEEGdvVzzmtSK
 qxwC2l46fIJFl/BebrwRX2f81u5r8fg9dW767+2Wb9FQ8HUHoxPKpKXBDAfBPHEhPX6Ufv1LWIi
 NwJ4kSn5fS9vNnQ==
X-Developer-Key: i=marcandre.lureau@redhat.com; a=openpgp;
 fpr=87A9BD933F87C606D276F62DDAE8E10975969CE5
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-Mimecast-MFC-PROC-ID: Ag06DzM2M9puXfuujwFa8RvHUVOg8xyS-uco_M5Sryg_1784534174
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-33051d/1784534182-754844E9-E6ED378A/0/0
X-purgate-type: clean
X-purgate-size: 801

Fixes: 394b9407e4c ("migration: mark mixed functions that can suspend")
Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 migration/qemu-file.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/migration/qemu-file.c b/migration/qemu-file.c
index d5a48115bd6..f30e13c66d7 100644
--- a/migration/qemu-file.c
+++ b/migration/qemu-file.c
@@ -830,7 +830,7 @@ uint64_t qemu_get_be64(QEMUFile *f)
  *          else 0
  *          (Note a 0 length string will return 0 either way)
  */
-size_t coroutine_fn qemu_get_counted_string(QEMUFile *f, char buf[256])
+size_t coroutine_mixed_fn qemu_get_counted_string(QEMUFile *f, char buf[256])
 {
     size_t len = qemu_get_byte(f);
     size_t res = qemu_get_buffer(f, (uint8_t *)buf, len);

-- 
2.55.0


