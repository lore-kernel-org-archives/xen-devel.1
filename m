Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6282C44515
	for <xen-devel@archiver.kernel.org>; Mon, 20 Jul 2026 12:34:41 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1366553.1616473 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wlnCH-0007nY-RE; Mon, 20 Jul 2026 12:34:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1366553.1616473; Mon, 20 Jul 2026 12:34:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wlnCH-0007nR-OK; Mon, 20 Jul 2026 12:34:13 +0000
Received: by outflank-mailman (input) for mailman id 1366553;
 Mon, 20 Jul 2026 12:34:12 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <armbru@redhat.com>) id 1wlnCG-0007nL-I3
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2026 12:34:12 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wlnCF-007BFS-FV
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2026 14:34:11 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <armbru@redhat.com>)
 id 6a5e15bb-e002-0a2a0a5209dd-0a2a450ab90c-24
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 14:34:11 +0200
Received: from [170.10.129.124] (helo=us-smtp-delivery-124.mimecast.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <armbru@redhat.com>)
 id 6a5e15c2-f2d2-0a2a450a0019-aa0a817c8d4d-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 14:34:11 +0200
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-1-R918he7BM2GPpnMqC6aPAA-1; Mon,
 20 Jul 2026 08:34:06 -0400
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 1BD621801BD0; Mon, 20 Jul 2026 12:34:04 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.44.22.4])
 by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id B43AF18001E2; Mon, 20 Jul 2026 12:34:02 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 7262921E6920; Mon, 20 Jul 2026 14:34:00 +0200 (CEST)
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
	s=mimecast20190719; t=1784550850;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gGU6Qy8nd2q8809l6BxOtOl15iflw6AdVZLvFprQWYU=;
	b=W44GF7Kzv3r4knn3gEnHXpjWAp6w8luChBwsCa3GJ/e3/aIotmE81ZGOuX1iOUUZwO9rvs
	KhAtoibCWlchQbOxhcBZ9dc2Ojjb9YRimazHvGtZF0WigGpL5cUqhIxYL4ZuDJbYdhymLi
	02QiU0v9lJ4yqllh2neW1S8hck6PwBU=
X-MC-Unique: R918he7BM2GPpnMqC6aPAA-1
X-Mimecast-MFC-AGG-ID: R918he7BM2GPpnMqC6aPAA_1784550844
From: Markus Armbruster <armbru@redhat.com>
To: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>
Cc: qemu-devel@nongnu.org,  Peter Xu <peterx@redhat.com>,  Fabiano Rosas
 <farosas@suse.de>,  Daniel P. =?utf-8?Q?Berrang=C3=A9?=
 <berrange@redhat.com>,  John Snow
 <jsnow@redhat.com>,  Vladimir Sementsov-Ogievskiy
 <vsementsov@yandex-team.ru>,  Kevin Wolf <kwolf@redhat.com>,  Hanna Reitz
 <hreitz@redhat.com>,  qemu-block@nongnu.org,  Stefan Hajnoczi
 <stefanha@redhat.com>,  Fam Zheng <fam@euphon.net>,  "Denis V. Lunev"
 <den@openvz.org>,  Christian Schoenebeck <qemu_oss@crudebyte.com>,  Greg
 Kurz <groug@kaod.org>,  "Michael S. Tsirkin" <mst@redhat.com>,  Stefano
 Stabellini <sstabellini@kernel.org>,  Anthony PERARD
 <anthony@xenproject.org>,  "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
  xen-devel@lists.xenproject.org,  Li Zhijian <lizhijian@fujitsu.com>
Subject: Re: [PATCH 1/8] monitor: annotate monitor_qmp_dispatcher_pop_any()
 as coroutine
In-Reply-To: <20260720-co-v1-1-fabb4db3c204@redhat.com> (=?utf-8?Q?=22Marc?=
 =?utf-8?Q?-Andr=C3=A9?= Lureau"'s
	message of "Mon, 20 Jul 2026 11:55:30 +0400")
References: <20260720-co-v1-0-fabb4db3c204@redhat.com>
	<20260720-co-v1-1-fabb4db3c204@redhat.com>
Date: Mon, 20 Jul 2026 14:34:00 +0200
Message-ID: <87ecgxvo07.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-Mimecast-MFC-PROC-ID: 2J7C4RecTvCX_zAfea4xpuqrQQpCM3pK2WIpXMNC-PA_1784550844
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-4011c0/1784550851-528DDCFC-7D979A63/0/0
X-purgate-type: clean
X-purgate-size: 902

Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com> writes:

> The function calls qemu_coroutine_yield(), and is called from
> monitor_qmp_dispatcher_co().
>
> Fixes: 60f4f62efeb ("monitor: extract request dequeuing to a new function=
")
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> ---
>  monitor/qmp.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/monitor/qmp.c b/monitor/qmp.c
> index 223e0643c2a..338d37cb7e5 100644
> --- a/monitor/qmp.c
> +++ b/monitor/qmp.c
> @@ -342,7 +342,8 @@ static QMPRequest *monitor_qmp_requests_pop_any_with_=
lock(void)
>      return req_obj;
>  }
> =20
> -static QMPRequest *monitor_qmp_dispatcher_pop_any(void)
> +static QMPRequest * coroutine_fn
> +monitor_qmp_dispatcher_pop_any(void)
>  {
>      while (true) {
>          /*

Reviewed-by: Markus Armbruster <armbru@redhat.com>


