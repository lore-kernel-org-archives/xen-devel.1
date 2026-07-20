Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17E03C44524
	for <xen-devel@archiver.kernel.org>; Mon, 20 Jul 2026 07:56:32 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1366145.1616037 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wlirC-0004k2-Pq; Mon, 20 Jul 2026 07:56:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1366145.1616037; Mon, 20 Jul 2026 07:56:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wlirC-0004jv-Mm; Mon, 20 Jul 2026 07:56:10 +0000
Received: by outflank-mailman (input) for mailman id 1366145;
 Mon, 20 Jul 2026 07:56:09 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <marcandre.lureau@redhat.com>) id 1wlirB-0004jp-Al
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2026 07:56:09 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wlirA-006OD5-8j
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2026 09:56:08 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <marcandre.lureau@redhat.com>)
 id 6a5dd48b-e002-0a2a0a5209dd-0a2a4508d7e8-46
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 09:56:07 +0200
Received: from [170.10.129.124] (helo=us-smtp-delivery-124.mimecast.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <marcandre.lureau@redhat.com>)
 id 6a5dd496-f659-0a2a45080019-aa0a817c7e1f-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 09:56:07 +0200
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-193-CpgzGo4-MYukQUb9BufLvA-1; Mon,
 20 Jul 2026 03:56:03 -0400
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 96D251955F22; Mon, 20 Jul 2026 07:55:59 +0000 (UTC)
Received: from localhost (unknown [10.44.22.17])
 by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 35B0418001E0; Mon, 20 Jul 2026 07:55:56 +0000 (UTC)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=mimecast20190719 header.d=redhat.com header.i="@redhat.com" header.h="From:Subject:Date:Message-Id:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784534166;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=D6SwdudhFqpaKV0XMGXiUeT/Rco0k1hj7dJhN9XTk30=;
	b=QB6UfHIZsQxnO20/sxBTkz6JwB53hi24THZvC6E9/mzqh5xWvEe5Bm0b5zbBzmCBY90etV
	sl6f1hpV3igK+Ogg2+2KOedQYZDGBh+yb4MBO91tLRPYu+P90tT3lxbPyBKHiSsbYVUQse
	DELcUrlZfbBoQOjNOSTzIeDksnMk/Oo=
X-MC-Unique: CpgzGo4-MYukQUb9BufLvA-1
X-Mimecast-MFC-AGG-ID: CpgzGo4-MYukQUb9BufLvA_1784534161
From: =?utf-8?q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>
Subject: [PATCH 0/8] coroutine: add missing annotations
Date: Mon, 20 Jul 2026 11:55:29 +0400
Message-Id: <20260720-co-v1-0-fabb4db3c204@redhat.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDcyMD3eR8XTMj0xRLi2TzlGTTVCWgwoKi1LTMCrAh0bEQfnFpUlZqcgl
 Ip1JtLQALZewkZgAAAA==
X-Change-ID: 20260720-co-625d98c7dc5e
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1771;
 i=marcandre.lureau@redhat.com; h=from:subject:message-id;
 bh=3p+9mnh7A1Sd9gkpZEuHm2Arv0B2DJblMllOqVWD9JU=;
 b=owEBbQKS/ZANAwAKAdro4Ql1lpzlAcsmYgBqXdSJGhUyT1s/3ctymKycGnr95OA0QKInBP1Ui
 yXIJzazgUKJAjMEAAEKAB0WIQSHqb2TP4fGBtJ29i3a6OEJdZac5QUCal3UiQAKCRDa6OEJdZac
 5eMbEACq8EYoKuxQ9/nJnUX4f5S9btARbnstqg+dSMili5YH/rKseLzJI6ASS9TRCiSaLbKxCHr
 J0NH1UiF6C9zFiw2Fcpt7ZQafNIFmEAf8xLYSC0Uuf0RrO97+r+IXptsPvua0gcVAULgRrDkGZh
 aiTm8owI247yvspBOR7nty5r5jfYB6o4znP70TAd2hhGTB5YN43ajTnooWxl1joh+byoU/csVqS
 1g47AbXMZyZLxkpwayh4IcPRZaiEu9XM1JsMHOceeOkvfG68vRzNYwmFNeDyGtJeQCU+e4P3GdO
 JqGc/DDDP5CO2K88SV4AouRI0wP3xzV+IWZFXMqPPURxKomVtZMesnur2fwIZpD2ANvVLkx8IG4
 4Vvt486nrxm6rqGjCG8qqGX8bMUGwN1kwPxwcLKB+T9uUD5dut147306SNOFxE2TTecc49oEFlF
 PiL9bmKXCYgE7082Jyv8XQpnvqDo9Qjt+biA3A3IPdPghJYlFvrCDu0hkY3aqHqmZdnC1WkKFXi
 23+TLZlfkBIOOeqjLQ/er5TRHC4NIB1yTeUqYXTb/vJH2nbbrzJBchS6rmCtAdNJuePl8SIq1az
 Ay2aGD4BDqnMux3yzImPX4z0wGgcu+1/8LfK7yxA5x6n/x887t2hbwyNe/mwkZXHggL6a4TAcWh
 PAxjQOvVtrBQiZg==
X-Developer-Key: i=marcandre.lureau@redhat.com; a=openpgp;
 fpr=87A9BD933F87C606D276F62DDAE8E10975969CE5
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-Mimecast-MFC-PROC-ID: Gs2gCMUFiNtEyGmhq8tuB64h2kLNndpA9hZVegf1ffE_1784534161
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c1860d/1784534167-D594A87B-1BF89B59/0/0
X-purgate-type: clean
X-purgate-size: 1773

Hi

Add missing coroutine_fn, coroutine_mixed_fn annotations and fix
a few related issues across monitor, migration, io, block, and
9pfs subsystems.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
Marc-André Lureau (8):
      monitor: annotate monitor_qmp_dispatcher_pop_any() as coroutine
      migration: fix qemu_get_counted_string annotation
      io: add missing coroutine annotation
      block: add missing coroutine annotation
      qcow2: remove invalid qcow2_check_refcounts calls
      block: add missing coroutine_fn annotations
      hw/9pfs: annotate V9fsTransport callbacks as coroutine_fn
      migration/rdma: annotate and simplify wait_comp_channel()

 hw/9pfs/9p.h                 | 26 +++++++++++++++-----------
 include/block/blockjob_int.h |  2 +-
 include/io/channel.h         |  4 ++--
 block/commit.c               |  5 +++--
 block/crypto.c               | 13 +++++++------
 block/io.c                   |  8 +++++---
 block/parallels.c            |  5 +++--
 block/qcow2-snapshot.c       | 18 ------------------
 block/qcow2.c                | 11 +++++++----
 blockjob.c                   |  3 ++-
 hw/9pfs/9p.c                 | 31 +++++++++++++++++++------------
 hw/9pfs/virtio-9p-device.c   | 24 +++++++++++++-----------
 hw/9pfs/xen-9p-backend.c     | 34 +++++++++++++++++-----------------
 io/channel.c                 |  5 +++--
 migration/qemu-file.c        |  2 +-
 migration/rdma.c             | 12 ++++--------
 monitor/qmp.c                |  3 ++-
 17 files changed, 104 insertions(+), 102 deletions(-)
---
base-commit: 5ef0ecc5942ee07bb581cc96a97bbfc0fdf4005c
change-id: 20260720-co-625d98c7dc5e

Best regards,
--  
Marc-André Lureau <marcandre.lureau@redhat.com>


