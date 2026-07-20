Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBF47C4452B
	for <xen-devel@archiver.kernel.org>; Mon, 20 Jul 2026 14:03:24 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1366582.1616514 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wloaP-0002Jp-BI; Mon, 20 Jul 2026 14:03:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1366582.1616514; Mon, 20 Jul 2026 14:03:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wloaP-0002Ji-8b; Mon, 20 Jul 2026 14:03:13 +0000
Received: by outflank-mailman (input) for mailman id 1366582;
 Mon, 20 Jul 2026 14:03:11 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <qemu_oss@crudebyte.com>) id 1wloaN-0002Ja-N8
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2026 14:03:11 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wloaN-009huI-3s
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2026 16:03:11 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <qemu_oss@crudebyte.com>)
 id 6a5e2a88-bab6-0a2a0a5309dd-0a2a4501a332-46
 for <multiple-recipients>; Mon, 20 Jul 2026 16:03:10 +0200
Received: from [5.189.157.229] (helo=kylie.crudebyte.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <qemu_oss@crudebyte.com>)
 id 6a5e2a9e-5984-0a2a45010019-05bd9de5a917-3
 for <multiple-recipients>; Mon, 20 Jul 2026 16:03:10 +0200
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=kylie header.d=crudebyte.com header.i="@crudebyte.com" header.h="Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Content-ID:Content-Description;
	bh=deAIsGyaqzcj2x0SnSBtTCwTRpVH+o12cTxZxyGW6R8=; b=QAlDcnSvqzW2fsUfyEmW7V1BzL
	4b/4ygTcLe/Agh3ctzr4ClJBza+Yuo1Apd62xS7aRAT/vDM5sUp4Zzyxu/IaaE/YrIQCNXWCbTBIY
	6M5Psongq1IlSunPbN0v3zQ/yET3KSrnSDwURXmMwj4wXMue/C9CZwCj9f+N1Aj+v5W905HJ4GK9r
	w8hDHkFVTOFS0e3hw0gbGO5yEagQ8hwbeCU6C5cnRqCyIBC7TVE7iuffOnTEEykCgDwtWKAS77Z1R
	Q+fIQ1th70xhlAozDlr24L14gFYsvki4r4hC4Usb3wmzOOKFWkwn/n8RVP26u11Kh/RmthAkBVSnj
	+2kkfrpeFC+QFypRfXvtX2Z3a7KTe1nlxMSNd4DoIiBj6KAd0LSnr3iSIfl3SxaV/BXd7961QQkbH
	4Z4IjKyDGbpvx9gEL6A/J0xVbiRGhaTebs5JQPEYqqESX9WAIv46ISGEbVZOBUPQgasRsbzKRlxF0
	arMeA8/pxMPhKLR8fct4i/8nFNdx7u+39jYLKPawUPGCrX6iZUkamPbjU/M3+95Q6jr2FoYO3W0rj
	x2a7KI4GWEpLYOkleUHkBKnMqs2y5SX9dWIgk1hwsHriulHeRbi+wcGVE5e85vn6K5TrKFB1OH1eN
	zfWpl9H85+ZoNfe5UDenB6ZfD52Uye1TrmZlmfZyk=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org,
 =?UTF-8?B?TWFyYy1BbmRyw6k=?= Lureau <marcandre.lureau@redhat.com>
Cc: Markus Armbruster <armbru@redhat.com>, Peter Xu <peterx@redhat.com>,
 Fabiano Rosas <farosas@suse.de>,
 Daniel =?UTF-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 John Snow <jsnow@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 qemu-block@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 Fam Zheng <fam@euphon.net>, "Denis V. Lunev" <den@openvz.org>,
 Greg Kurz <groug@kaod.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony@xenproject.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 xen-devel@lists.xenproject.org, Li Zhijian <lizhijian@fujitsu.com>
Subject:
 Re: [PATCH 7/8] hw/9pfs: annotate V9fsTransport callbacks as coroutine_fn
Date: Mon, 20 Jul 2026 16:02:47 +0200
Message-ID: <7970030.EvYhyI6sBW@weasel>
In-Reply-To: <20260720-co-v1-7-fabb4db3c204@redhat.com>
References:
 <20260720-co-v1-0-fabb4db3c204@redhat.com>
 <20260720-co-v1-7-fabb4db3c204@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-purgate-ID: tlsNG-d62444/1784556190-BD146757-80610A7F/0/0
X-purgate-type: clean
X-purgate-size: 3580

On Monday, 20 July 2026 09:55:36 CEST Marc-Andr=C3=A9 Lureau wrote:
> All V9fsTransport callbacks are invoked exclusively from coroutine
> context (the v9fs_* PDU handlers). Annotate the function pointer
> types in V9fsTransport and all implementations (virtio and xen
> backends), as well as intermediate callers in 9p.c (pdu_marshal,
> pdu_unmarshal, v9fs_init_qiov_from_pdu, etc.).
>=20
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> ---
>  hw/9pfs/9p.h               | 26 +++++++++++++++-----------
>  hw/9pfs/9p.c               | 31 +++++++++++++++++++------------
>  hw/9pfs/virtio-9p-device.c | 24 +++++++++++++-----------
>  hw/9pfs/xen-9p-backend.c   | 34 +++++++++++++++++-----------------
>  4 files changed, 64 insertions(+), 51 deletions(-)
>=20
> diff --git a/hw/9pfs/9p.h b/hw/9pfs/9p.h
> index 1a309664f6e..0e52ffbdf38 100644
> --- a/hw/9pfs/9p.h
> +++ b/hw/9pfs/9p.h
> @@ -472,17 +472,21 @@ void pdu_submit(V9fsPDU *pdu, P9MsgHeader *hdr);
>  void v9fs_reset(V9fsState *s);
>=20
>=20
>  struct V9fsTransport {
> -    ssize_t     (*pdu_vmarshal)(V9fsPDU *pdu, size_t offset, const char =
*fmt,
> -                                va_list ap);
> -    ssize_t     (*pdu_vunmarshal)(V9fsPDU *pdu, size_t offset, const cha=
r *fmt,
> -                                  va_list ap);
> -    void        (*init_in_iov_from_pdu)(V9fsPDU *pdu, struct iovec **pio=
v,
> -                                        unsigned int *pniov, size_t size=
);
> -    void        (*init_out_iov_from_pdu)(V9fsPDU *pdu, struct iovec **pi=
ov,
> -                                         unsigned int *pniov, size_t siz=
e);
> -    void        (*push_and_notify)(V9fsPDU *pdu);
> -    size_t      (*msize_limit)(V9fsState *s);
> -    size_t      (*response_buffer_size)(V9fsPDU *pdu);
> +    ssize_t     coroutine_fn (*pdu_vmarshal)(V9fsPDU *pdu, size_t offset,
> +                                             const char *fmt, va_list ap=
);
> +    ssize_t     coroutine_fn (*pdu_vunmarshal)(V9fsPDU *pdu, size_t offs=
et,
> +                                               const char *fmt, va_list =
ap);
> +    void        coroutine_fn (*init_in_iov_from_pdu)(V9fsPDU *pdu,
> +                                                     struct iovec **piov,
> +                                                     unsigned int *pniov,
> +                                                     size_t size);
> +    void        coroutine_fn (*init_out_iov_from_pdu)(V9fsPDU *pdu,
> +                                                      struct iovec **pio=
v,
> +                                                      unsigned int *pnio=
v,
> +                                                      size_t size);
> +    void        coroutine_fn (*push_and_notify)(V9fsPDU *pdu);
> +    size_t      coroutine_fn (*msize_limit)(V9fsState *s);
> +    size_t      coroutine_fn (*response_buffer_size)(V9fsPDU *pdu);
>  };

I wonder whether that could be made more diff/blame-friendly. Especially as
this currently only serves documentation purposes.

They way you are positioning coroutine_fn it usually resolves to an attribu=
te
attached to the function's return type, not to the function itself, even
though clang/gcc handling it flexible. For attaching an attribute to the
function itself the attribute should either be attached before the function
declaration or after the function declaration. In both cases you could then
add it to its own, separate line, avoiding a lot of noise.

/Christian




