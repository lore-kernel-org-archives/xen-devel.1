Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCE54C53219
	for <xen-devel@archiver.kernel.org>; Mon, 27 Jul 2026 10:51:52 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1371596.1619090 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1woIvv-0007xr-Pg; Mon, 27 Jul 2026 10:51:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1371596.1619090; Mon, 27 Jul 2026 10:51:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1woIvv-0007xk-NA; Mon, 27 Jul 2026 10:51:43 +0000
Received: by outflank-mailman (input) for mailman id 1371596;
 Mon, 27 Jul 2026 10:51:42 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <mlureau@redhat.com>) id 1woIvu-0007xa-CG
 for xen-devel@lists.xenproject.org; Mon, 27 Jul 2026 10:51:42 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1woIvt-007wXz-P1
 for xen-devel@lists.xenproject.org; Mon, 27 Jul 2026 12:51:41 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <mlureau@redhat.com>)
 id 6a673828-bab6-0a2a0a5309dd-0a2a4509869a-36
 for <xen-devel@lists.xenproject.org>; Mon, 27 Jul 2026 12:51:41 +0200
Received: from [170.10.133.124] (helo=us-smtp-delivery-124.mimecast.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <mlureau@redhat.com>)
 id 6a67383c-be1a-0a2a45090019-aa0a857cd043-3
 for <xen-devel@lists.xenproject.org>; Mon, 27 Jul 2026 12:51:41 +0200
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-138-4oIf53n_OdegldC5ZPlsoQ-1; Mon, 27 Jul 2026 06:51:34 -0400
Received: by mail-pf1-f197.google.com with SMTP id
 d2e1a72fcca58-8485b7e18b4so4411703b3a.1
 for <xen-devel@lists.xenproject.org>; Mon, 27 Jul 2026 03:51:34 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=mimecast20190719 header.d=redhat.com header.i="@redhat.com" header.h="From:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:References"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785149500;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PALmNLZ34+QkRqPoenBk1x1GsUgAG1Wa+236evQz150=;
	b=Sx9HsnPqOtWnduibt7IahnRYBOgNDV97eZsPxidPna2CO9kOXEBAonos3CrwyhSpNKn6GL
	Gn2BlzN3f9qNIeaDc9Wogn0fkywgds48YFV6N1AOBo4H3Y4Rbzrqpjs4VgW44p4BUuQ+9Z
	2q7HmCXdl5RmEb0JpUyDx8S3V4Fad8o=
X-MC-Unique: 4oIf53n_OdegldC5ZPlsoQ-1
X-Mimecast-MFC-AGG-ID: 4oIf53n_OdegldC5ZPlsoQ_1785149493
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785149493; x=1785754293;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PALmNLZ34+QkRqPoenBk1x1GsUgAG1Wa+236evQz150=;
        b=bgc5GM+Yk0RWkKQtKVUEWfLJl399ptzON3ioB3KTyA4juS1pRNMN7jroHd8AKa/I/G
         u0UkIsqtUOG0wr0Vlyh/hsprYF8HVp/dplNnK9z26D2yuuEKedZuPqBcctzKFWX+CdPK
         U2+vHW4EvyK3MrJidHacbes577kBsm9Bz7VhhIFsgr2NQFmoPce9eaQWcqOqg8Au+1B9
         HIduHxcCEIX1QyoUBxNOwCNirERp+WdvenPfCFQKPXR/fZqo/xr0+YVAuhYPtwkZTzqY
         emtygo4Z650ByBNkM+Cy9E9hVCTGKt2oq1/vb/HKUQiPkhyCVxziGpp5u26aHQPYvjle
         UH9w==
X-Forwarded-Encrypted: i=1; AHgh+RpACfp6G9KkRlHRvkbwPc6URmFh5HLmno4UqERE7PsJYcMFAy7hTC7gv7C0sNPxc8GgpEfuzRH5vW0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwGWnHkGjj1bPtzZnUFRv6JYCkFCJ0mtAQbg4cSy7HnBZErvB0S
	YLRs6jHd4UZQ9WesrCMHIcBAJpMyisAD7WCIkGXAmkJlMOBU3OfebI06I8Q8P3lZbKAoJ/Dcgfm
	YbSAlKx+bhGf15/nhHHeVuiQ0bvk02V+XzB1imfh6pmURpi5m2YcBayw6q5Fo1X+5dJRnCxwHvd
	HJaIrsnpQ9T34Z7C5FvJgFm4kHEKirNrZjfWnB9K2lZv8=
X-Gm-Gg: AR+sD12ShYqehicQGIGAEQTYC0iSD6wDnD83JK70csgbYLqBGz56V3rIJPU/BXslzL9
	gtanq/0pppMw+N10n4mTBrgowdLRB9IeVqMahe6HDpU2FIfQmrs3vE4+XZdyPtTxcBfxk8zZwXk
	KzB/DbwmTrzKjYljTom/ClzCOfeMh9KHiPoBzEsKuy2Y39m+GJM9/w3sylgbKxNZpPBZ5sUV25/
	VB5YETGnvSYVjkWo3FmvN/ZsOOAGwn3NXrtMf6sOx4xccZDMrMYArsi971W3bzH/bH01FTsXNf/
	eA==
X-Received: by 2002:a05:6a00:4648:b0:84e:244a:98e8 with SMTP id d2e1a72fcca58-84e59491059mr6368384b3a.30.1785149493067;
        Mon, 27 Jul 2026 03:51:33 -0700 (PDT)
X-Received: by 2002:a05:6a00:4648:b0:84e:244a:98e8 with SMTP id
 d2e1a72fcca58-84e59491059mr6368359b3a.30.1785149492674; Mon, 27 Jul 2026
 03:51:32 -0700 (PDT)
MIME-Version: 1.0
References: <20260725-co-v2-0-d3552ddb3931@redhat.com>
In-Reply-To: <20260725-co-v2-0-d3552ddb3931@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Mon, 27 Jul 2026 14:51:20 +0400
X-Gm-Features: AUfX_myf2_jNttAq9V_d7I6y5h_jwqjOgLK2HB5Guezr7Cr4sf4D7xx8j8_zEIA
Message-ID: <CAMxuvazemnngM4-J1QFPwEBaazVnTavxSEbZEe9HGSrri9CjqA@mail.gmail.com>
Subject: Re: [PATCH v2 0/8] coroutine: add missing annotations
To: qemu-devel@nongnu.org
Cc: Markus Armbruster <armbru@redhat.com>, Peter Xu <peterx@redhat.com>, 
	Fabiano Rosas <farosas@suse.de>, =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
	John Snow <jsnow@redhat.com>, Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>, 
	Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org, 
	Stefan Hajnoczi <stefanha@redhat.com>, Fam Zheng <fam@euphon.net>, "Denis V. Lunev" <den@openvz.org>, 
	Christian Schoenebeck <qemu_oss@crudebyte.com>, Greg Kurz <groug@kaod.org>, 
	"Michael S. Tsirkin" <mst@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Anthony PERARD <anthony@xenproject.org>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, 
	xen-devel@lists.xenproject.org, Li Zhijian <lizhijian@fujitsu.com>, 
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: rXTxDneZBS8EoK02ET4Jx8PxTbiYxVgJrIIJqODCbUE_1785149493
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-bad1c0/1785149501-BDAC0034-5BD7C95D/0/0
X-purgate-type: clean
X-purgate-size: 3196

Hi

On Sat, Jul 25, 2026 at 1:48=E2=80=AFPM Marc-Andr=C3=A9 Lureau
<marcandre.lureau@redhat.com> wrote:
>
> Hi
>
> Add missing coroutine_fn, coroutine_mixed_fn annotations and fix
> a few related issues across monitor, migration, io, block, and
> 9pfs subsystems.
>
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

I am queuing all except "block: add missing coroutine_fn annotations"
awaiting review

> ---
> Changes in v2:
> - fix some annotations in patch "block: add missing coroutine annotation"
> - collect trailer tags
> - Link to v1: https://lore.kernel.org/qemu-devel/20260720-co-v1-0-fabb4db=
3c204@redhat.com
>
> To: qemu-devel@nongnu.org
> Cc: Markus Armbruster <armbru@redhat.com>
> Cc: Peter Xu <peterx@redhat.com>
> Cc: Fabiano Rosas <farosas@suse.de>
> Cc: "Daniel P. Berrang=C3=A9" <berrange@redhat.com>
> Cc: John Snow <jsnow@redhat.com>
> Cc: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
> Cc: Kevin Wolf <kwolf@redhat.com>
> Cc: Hanna Reitz <hreitz@redhat.com>
> Cc: qemu-block@nongnu.org
> Cc: Stefan Hajnoczi <stefanha@redhat.com>
> Cc: Fam Zheng <fam@euphon.net>
> Cc: "Denis V. Lunev" <den@openvz.org>
> Cc: Christian Schoenebeck <qemu_oss@crudebyte.com>
> Cc: Greg Kurz <groug@kaod.org>
> Cc: "Michael S. Tsirkin" <mst@redhat.com>
> Cc: Stefano Stabellini <sstabellini@kernel.org>
> Cc: Anthony PERARD <anthony@xenproject.org>
> Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
> Cc: xen-devel@lists.xenproject.org
> Cc: Li Zhijian <lizhijian@fujitsu.com>
>
> ---
> Marc-Andr=C3=A9 Lureau (8):
>       monitor: annotate monitor_qmp_dispatcher_pop_any() as coroutine
>       migration: fix qemu_get_counted_string annotation
>       io: add missing coroutine annotation
>       block: add missing coroutine annotation
>       qcow2: remove invalid qcow2_check_refcounts calls
>       block: add missing coroutine_fn annotations
>       hw/9pfs: annotate V9fsTransport callbacks as coroutine_fn
>       migration/rdma: annotate and simplify wait_comp_channel()
>
>  hw/9pfs/9p.h                 | 26 +++++++++++++++-----------
>  include/block/blockjob_int.h |  2 +-
>  include/io/channel.h         |  4 ++--
>  block/commit.c               |  5 +++--
>  block/crypto.c               | 13 +++++++------
>  block/io.c                   |  8 +++++---
>  block/parallels.c            |  5 +++--
>  block/qcow2-snapshot.c       | 18 ------------------
>  block/qcow2.c                | 12 ++++++++----
>  blockjob.c                   |  3 ++-
>  hw/9pfs/9p.c                 | 31 +++++++++++++++++++------------
>  hw/9pfs/virtio-9p-device.c   | 24 +++++++++++++-----------
>  hw/9pfs/xen-9p-backend.c     | 34 +++++++++++++++++-----------------
>  io/channel.c                 |  5 +++--
>  migration/qemu-file.c        |  2 +-
>  migration/rdma.c             | 12 ++++--------
>  monitor/qmp.c                |  3 ++-
>  17 files changed, 105 insertions(+), 102 deletions(-)
> ---
> base-commit: 300438ffbb8d9430cac2fcc15cba6f482b2c0587
> change-id: 20260720-co-625d98c7dc5e
>
> Best regards,
> --
> Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>


