Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3872C44515
	for <xen-devel@archiver.kernel.org>; Mon, 20 Jul 2026 14:13:25 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1366609.1616543 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wlok5-00058W-Oo; Mon, 20 Jul 2026 14:13:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1366609.1616543; Mon, 20 Jul 2026 14:13:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wlok5-00058O-Km; Mon, 20 Jul 2026 14:13:13 +0000
Received: by outflank-mailman (input) for mailman id 1366609;
 Mon, 20 Jul 2026 14:13:13 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <peterx@redhat.com>) id 1wlok5-00058G-03
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2026 14:13:13 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wlok4-00APE2-9j
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2026 16:13:12 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <peterx@redhat.com>)
 id 6a5e2ce8-2eae-0a2a0a5409dd-0a2a450ae284-34
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 16:13:12 +0200
Received: from [170.10.129.124] (helo=us-smtp-delivery-124.mimecast.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <peterx@redhat.com>)
 id 6a5e2cf6-f2d2-0a2a450a0019-aa0a817ceca9-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 16:13:11 +0200
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-457-05t8-7j2Ne62qo781CGlFw-1; Mon, 20 Jul 2026 10:13:09 -0400
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-92e5fc4c7e9so861737785a.3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 07:13:09 -0700 (PDT)
Received: from x1.local ([174.91.117.74]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-9077856348esm91631706d6.12.2026.07.20.07.13.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jul 2026 07:13:07 -0700 (PDT)
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
	s=mimecast20190719; t=1784556790;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=amn6kDIT0WP5ybt8VbJ5VW8vOOWsBH/TSBn2QO9H038=;
	b=GvIrEnx6zPicgD/bU3WPKbv5fwowcvL4VqsZ7zo0hCJaqmE62BvE3BsiroeD45S4m6MMTs
	R/g1XXqXSBKcQb04EzbEw6gVtRVz2hDwS34ntn590AVr1m0LEyMiiDVaIynreLVn81mepf
	XfQkxgtV4Q6d6YpCMxN+J/ZF/5JW/z0=
X-MC-Unique: 05t8-7j2Ne62qo781CGlFw-1
X-Mimecast-MFC-AGG-ID: 05t8-7j2Ne62qo781CGlFw_1784556789
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784556789; x=1785161589;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=amn6kDIT0WP5ybt8VbJ5VW8vOOWsBH/TSBn2QO9H038=;
        b=szTCdvZlVn6zp0zpiFuLeSpwXl8c4CXiIFOcXFpKoFwE9dnbQz5NT3Mwb1LTT7WvAE
         KNt21lcwQl9MfXj75+egPbcx9w1jtNnaHry1ZR9yJPUvUhEKvQ49fqfHiGOB59y3E8ez
         PqOf9iqPIOcduAfBhbvoGIuTrm843mhk1YbOsGvnDxeDsz4YfG5miouKKAwgspc/nlFT
         PLOVq5ulqSPh70k9Gr/KcUvVQi2gy2bbiJqWx477/3/DKHvSz8FL2wOKt5y7k9S+ILUE
         ZY/GqO1ObvZzZ8PIim3ynsoRgoydWpIUDAVaKpyFkegj7uL3W/uHOICRB7fNKyx+DTJb
         OH/Q==
X-Forwarded-Encrypted: i=1; AHgh+RpfyTWQO+gUZ++iFnHnc8Vj+arli2nXu72pzBaDpy11MCCNJGqf+ZIDzE8scgYAEFqbuS0tE5CQpzc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyHPZlaf0oFfM1PhyLSi/MylKHEqQLyk5UgZXTSi08LnFYrPbr8
	An8p1jp7ERtAn/Iu8MOG7tI23kQlA7tXFG/HsGFE2WogdQOMp6xJ7YY4A3aCBmuOhcSfYR+ynrz
	1T0pxknXhKdFn4F3OfWjS6k8CD1ZBP8nRXoGmkXUYJo155jnj2IQ6Zpha4UJ6ZB47U//5
X-Gm-Gg: AfdE7clcJjJFo6aBnxJm2nz++Z+ObexUCcz3bWhl0BDJ0RIl+AA372b32E3QwFk3bTz
	5g0MBDaCilyPX8GioV2Y47thiYLw1JBEFNjvUxklHvKx+qxXyqHdZY2KlMEfgKRE+uuuKwnkvpI
	BkVuCXiU+PJS/LVMnVcFOZSWwDs48dUI/o1KuQWyx5H4Snk8WGbYHu2lPtwj0HfRlgqX621PKOV
	cfFbRA6hVypseynSNef55lJud6cEpQyFSiq8ZqDLdEtgJYCpKPvnG7ARwIfR+wE/giQ3Wi6H5TB
	bI/oP83XfLy+6bxQXBUreCgiS4OwMCj6KONfkqB55TSWtk5OZEbraN2HUSdE51Oc/UxH
X-Received: by 2002:a05:620a:3708:b0:92e:e695:d622 with SMTP id af79cd13be357-930b3ea8f77mr1401551085a.28.1784556788500;
        Mon, 20 Jul 2026 07:13:08 -0700 (PDT)
X-Received: by 2002:a05:620a:3708:b0:92e:e695:d622 with SMTP id af79cd13be357-930b3ea8f77mr1401540785a.28.1784556787735;
        Mon, 20 Jul 2026 07:13:07 -0700 (PDT)
Date: Mon, 20 Jul 2026 10:13:03 -0400
From: Peter Xu <peterx@redhat.com>
To: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>
Cc: qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
	Fabiano Rosas <farosas@suse.de>,
	Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
	John Snow <jsnow@redhat.com>,
	Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
	Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
	qemu-block@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
	Fam Zheng <fam@euphon.net>, "Denis V. Lunev" <den@openvz.org>,
	Christian Schoenebeck <qemu_oss@crudebyte.com>,
	Greg Kurz <groug@kaod.org>, "Michael S. Tsirkin" <mst@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony@xenproject.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	xen-devel@lists.xenproject.org, Li Zhijian <lizhijian@fujitsu.com>
Subject: Re: [PATCH 8/8] migration/rdma: annotate and simplify
 wait_comp_channel()
Message-ID: <al4s77A0rlX0_PQc@x1.local>
References: <20260720-co-v1-0-fabb4db3c204@redhat.com>
 <20260720-co-v1-8-fabb4db3c204@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20260720-co-v1-8-fabb4db3c204@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: hWfficTBn7VC-TwQuYoGJNwgrJUzI6kEjPSBn-YUv4Q_1784556789
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-4011c0/1784556792-516C6CFC-58CB6993/0/0
X-purgate-type: clean
X-purgate-size: 2121

On Mon, Jul 20, 2026 at 11:55:37AM +0400, Marc-André Lureau wrote:
> The function calls yield_until_fd_readable() (coroutine_fn) when in
> coroutine context, and polls with qemu_poll_ns() otherwise.
> 
> Replace the migration-state proxy check with qemu_in_coroutine(),
> which directly tests what matters.
> 
> Fixes: 2da776db4846 ("rdma: core logic")
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>

Reviewed-by: Peter Xu <peterx@redhat.com>

Just to say we can also drop the var.  I have a patch did it already but I
didn't get chance to revisit the series:

https://lore.kernel.org/qemu-devel/20251022192612.2737648-5-peterx@redhat.com/

So we can also pick that single patch up, then this patch can be
annotation-only.  I'll leave it to you.

Thanks,

> ---
>  migration/rdma.c | 12 ++++--------
>  1 file changed, 4 insertions(+), 8 deletions(-)
> 
> diff --git a/migration/rdma.c b/migration/rdma.c
> index 3e37a1d4401..438419d1894 100644
> --- a/migration/rdma.c
> +++ b/migration/rdma.c
> @@ -1348,17 +1348,13 @@ static int qemu_rdma_poll(RDMAContext *rdma, struct ibv_cq *cq,
>  /* Wait for activity on the completion channel.
>   * Returns 0 on success, none-0 on error.
>   */
> -static int qemu_rdma_wait_comp_channel(RDMAContext *rdma,
> -                                       struct ibv_comp_channel *comp_channel)
> +static int coroutine_mixed_fn
> +qemu_rdma_wait_comp_channel(RDMAContext *rdma,
> +                            struct ibv_comp_channel *comp_channel)
>  {
>      struct rdma_cm_event *cm_event;
>  
> -    /*
> -     * Coroutine doesn't start until migration_fd_process_incoming()
> -     * so don't yield unless we know we're running inside of a coroutine.
> -     */
> -    if (rdma->migration_started_on_destination &&
> -        migration_incoming_get_current()->state == MIGRATION_STATUS_ACTIVE) {
> +    if (qemu_in_coroutine()) {
>          yield_until_fd_readable(comp_channel->fd);
>      } else {
>          /* This is the source side, we're in a separate thread
> 
> -- 
> 2.55.0
> 

-- 
Peter Xu


