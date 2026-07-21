Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B097C44529
	for <xen-devel@archiver.kernel.org>; Tue, 21 Jul 2026 08:06:46 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1367580.1617312 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wm5Uk-0003EV-W1; Tue, 21 Jul 2026 08:06:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1367580.1617312; Tue, 21 Jul 2026 08:06:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wm5Uk-0003EO-Ry; Tue, 21 Jul 2026 08:06:30 +0000
Received: by outflank-mailman (input) for mailman id 1367580;
 Tue, 21 Jul 2026 08:06:30 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <mlureau@redhat.com>) id 1wm5Uj-0003EI-U3
 for xen-devel@lists.xenproject.org; Tue, 21 Jul 2026 08:06:30 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wm5Uj-008qew-2d
 for xen-devel@lists.xenproject.org; Tue, 21 Jul 2026 10:06:29 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <mlureau@redhat.com>)
 id 6a5f2878-e002-0a2a0a5209dd-0a2a4503d79c-32
 for <xen-devel@lists.xenproject.org>; Tue, 21 Jul 2026 10:06:28 +0200
Received: from [170.10.133.124] (helo=us-smtp-delivery-124.mimecast.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <mlureau@redhat.com>)
 id 6a5f287f-fae8-0a2a45030019-aa0a857cb1c9-3
 for <xen-devel@lists.xenproject.org>; Tue, 21 Jul 2026 10:06:27 +0200
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-632-r4nmNiJcPNCH-m9c8fsSmQ-1; Tue, 21 Jul 2026 04:06:18 -0400
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-2cacf17c7e0so110305755ad.0
 for <xen-devel@lists.xenproject.org>; Tue, 21 Jul 2026 01:06:17 -0700 (PDT)
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
	s=mimecast20190719; t=1784621183;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MFJkTceATNhlEeBNPmDXU/6gPzuVSzu7MUPB+fQ2clM=;
	b=iC+QDanx+4GkCV27X3xHF7dlHLrbRK6ek7SHrjuecylpIFLAlFMJJIVNIaPkYiiFSTsWc2
	DNoPvsCjv/LNgJnTiexcdjvP7mBWx7T+6zIAuiFhPoWPpdGYuWK4E8BMbz2FghSdpJQ3Bb
	Dfsi0x1lDXC3SNgO8+nniA9awaJnJ6s=
X-MC-Unique: r4nmNiJcPNCH-m9c8fsSmQ-1
X-Mimecast-MFC-AGG-ID: r4nmNiJcPNCH-m9c8fsSmQ_1784621175
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784621175; x=1785225975;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MFJkTceATNhlEeBNPmDXU/6gPzuVSzu7MUPB+fQ2clM=;
        b=S3tnCJmc4zdF+G2SgN0y1NGK/WZNnARaiT/ZrdO7p5Nq8SQpqA9A95kd67a33GljsO
         pFit2BGrknjMwyfj9eOEuYVTBLyDTcizPtTjznBlb69WSOSxJGVpuct6x4XbkE5jsBuX
         6QA2CAmG/0MolMB8UAfzNm8Mc6jsWYmUdyfRCkhpilY/Dz5p8WnP1A/mUd/+T7Utd6x0
         p7uZ/BKek+ZGjv9R42owRSFwPY54aD+0Lk5OQWApm2lPKwPdWsqaczvh+m1ghaJvao4+
         hh2QeUsAwZz7fhX1Zwdb4eHjTid1frjjAeOiVSwkWG7Vi+zGkj1yRGeVsMzy9qSWdMzC
         2kLw==
X-Forwarded-Encrypted: i=1; AHgh+RoeaLzfOkb+XOF/x/6Fbb477zL0CP3RZTe52GE+B1gfjCyhjnl2Koajna2pjjkTA6PrKXl7DNpL9ts=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzPOJHLRK0aTPXQSh4HdYEh5GHA6KyP6pUseuThs2feKQRWlKzW
	+hAeFKyvgS6yQi6F+EH/BXsUKfnpdfPQ5F6DnEVbUlA98yJnbEPmIgiwmz/gEA8N+7FU4QF9a9T
	xk16erPHH0odcpOfS7VxFCSo0gw3x/yAzLOFo2f01g1ZO5DBNum+gaKZL2Ec5aU/phNbcHxRycz
	MFa4cdvkMWh3Q4oMYKI2VBkvIagVLp5CocQ5lpKOCLsHI=
X-Gm-Gg: AR+sD10arr6/9WdVG8enldBkN2qJ5FWZd9v0QprvY8PZsrhqJkWQB4PYAsK4n4kOIqs
	PL66C2QVpDBOJyvwdDSVwj/FhQ1Y7+Sv/K/NgRmNT/uhvrslqP1RCZ/jux+Fm+LWu4b57nav2D3
	Y9sIJ6C5/yhL2j+3tdkmUJ0NZKgEC81j3xS04XiywKvtj1ngYIkd2iV+LnZvYBo3xr4Zq13C3Ng
	QtOoabivUL8oUPQrsbYWgrkqDKeODuQ06SqiOQHhbXESeDZT+UGiIXQ4NAmtfdeyqPN+UrSsdGB
	YA==
X-Received: by 2002:a17:903:240e:b0:2c9:97a7:f540 with SMTP id d9443c01a7336-2cf349fe337mr199883455ad.38.1784621175014;
        Tue, 21 Jul 2026 01:06:15 -0700 (PDT)
X-Received: by 2002:a17:903:240e:b0:2c9:97a7:f540 with SMTP id
 d9443c01a7336-2cf349fe337mr199882915ad.38.1784621174504; Tue, 21 Jul 2026
 01:06:14 -0700 (PDT)
MIME-Version: 1.0
References: <20260720-co-v1-0-fabb4db3c204@redhat.com> <20260720-co-v1-7-fabb4db3c204@redhat.com>
 <7970030.EvYhyI6sBW@weasel> <7790107e-1256-4ed8-ba49-cab980197938@oss.qualcomm.com>
 <5af0aaf1-d372-4800-9f6f-8f5dacd8c69e@oss.qualcomm.com> <CAMxuvaxREAH4K45UYeC6PK5fnYXTZW9nitRApMdtaxOC6rPDow@mail.gmail.com>
In-Reply-To: <CAMxuvaxREAH4K45UYeC6PK5fnYXTZW9nitRApMdtaxOC6rPDow@mail.gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Tue, 21 Jul 2026 12:06:03 +0400
X-Gm-Features: AUfX_myozeXoOdlqc3QvGx1Q5TVqdta-D4KlWqih7qFuon5PGsySMNcqHkMbr2o
Message-ID: <CAMxuvaySONs4r=1Bmsao1f1cZdviGGwPVM8+1Q+1vdY0X-pYVw@mail.gmail.com>
Subject: Re: [PATCH 7/8] hw/9pfs: annotate V9fsTransport callbacks as coroutine_fn
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>
Cc: Christian Schoenebeck <qemu_oss@crudebyte.com>, qemu-devel@nongnu.org, 
	Markus Armbruster <armbru@redhat.com>, Peter Xu <peterx@redhat.com>, Fabiano Rosas <farosas@suse.de>, 
	=?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
	John Snow <jsnow@redhat.com>, Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>, 
	Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org, 
	Stefan Hajnoczi <stefanha@redhat.com>, Fam Zheng <fam@euphon.net>, "Denis V. Lunev" <den@openvz.org>, 
	Greg Kurz <groug@kaod.org>, "Michael S. Tsirkin" <mst@redhat.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Anthony PERARD <anthony@xenproject.org>, 
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>, xen-devel@lists.xenproject.org, 
	Li Zhijian <lizhijian@fujitsu.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: HAVJ-COYsU4dZ09bUmTjhb0y9jo__aZiwNTET1EX-ZU_1784621175
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-33051d/1784621187-77AF14E9-2FFA6114/0/0
X-purgate-type: clean
X-purgate-size: 5815

Hi

On Tue, Jul 21, 2026 at 11:58=E2=80=AFAM Marc-Andr=C3=A9 Lureau
<marcandre.lureau@redhat.com> wrote:
>
> Hi
>
> On Tue, Jul 21, 2026 at 12:54=E2=80=AFAM Philippe Mathieu-Daud=C3=A9
> <philmd@oss.qualcomm.com> wrote:
> >
> > On 20/7/26 22:42, Philippe Mathieu-Daud=C3=83=C2=A9 wrote:
> > > On 20/7/26 16:02, Christian Schoenebeck wrote:
> > >> On Monday, 20 July 2026 09:55:36 CEST Marc-Andr=C3=A9 Lureau wrote:
> > >>> All V9fsTransport callbacks are invoked exclusively from coroutine
> > >>> context (the v9fs_* PDU handlers). Annotate the function pointer
> > >>> types in V9fsTransport and all implementations (virtio and xen
> > >>> backends), as well as intermediate callers in 9p.c (pdu_marshal,
> > >>> pdu_unmarshal, v9fs_init_qiov_from_pdu, etc.).
> > >>>
> > >>> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> > >>> ---
> > >>>   hw/9pfs/9p.h               | 26 +++++++++++++++-----------
> > >>>   hw/9pfs/9p.c               | 31 +++++++++++++++++++------------
> > >>>   hw/9pfs/virtio-9p-device.c | 24 +++++++++++++-----------
> > >>>   hw/9pfs/xen-9p-backend.c   | 34 +++++++++++++++++----------------=
-
> > >>>   4 files changed, 64 insertions(+), 51 deletions(-)
> > >>>
> > >>> diff --git a/hw/9pfs/9p.h b/hw/9pfs/9p.h
> > >>> index 1a309664f6e..0e52ffbdf38 100644
> > >>> --- a/hw/9pfs/9p.h
> > >>> +++ b/hw/9pfs/9p.h
> > >>> @@ -472,17 +472,21 @@ void pdu_submit(V9fsPDU *pdu, P9MsgHeader *hd=
r);
> > >>>   void v9fs_reset(V9fsState *s);
> > >>>
> > >>>
> > >>>   struct V9fsTransport {
> > >>> -    ssize_t     (*pdu_vmarshal)(V9fsPDU *pdu, size_t offset, const
> > >>> char *fmt,
> > >>> -                                va_list ap);
> > >>> -    ssize_t     (*pdu_vunmarshal)(V9fsPDU *pdu, size_t offset, con=
st
> > >>> char *fmt,
> > >>> -                                  va_list ap);
> > >>> -    void        (*init_in_iov_from_pdu)(V9fsPDU *pdu, struct iovec
> > >>> **piov,
> > >>> -                                        unsigned int *pniov, size_=
t
> > >>> size);
> > >>> -    void        (*init_out_iov_from_pdu)(V9fsPDU *pdu, struct iove=
c
> > >>> **piov,
> > >>> -                                         unsigned int *pniov, size=
_t
> > >>> size);
> > >>> -    void        (*push_and_notify)(V9fsPDU *pdu);
> > >>> -    size_t      (*msize_limit)(V9fsState *s);
> > >>> -    size_t      (*response_buffer_size)(V9fsPDU *pdu);
> > >>> +    ssize_t     coroutine_fn (*pdu_vmarshal)(V9fsPDU *pdu, size_t
> > >>> offset,
> > >>> +                                             const char *fmt,
> > >>> va_list ap);
> > >>> +    ssize_t     coroutine_fn (*pdu_vunmarshal)(V9fsPDU *pdu, size_=
t
> > >>> offset,
> > >>> +                                               const char *fmt,
> > >>> va_list ap);
> > >>> +    void        coroutine_fn (*init_in_iov_from_pdu)(V9fsPDU *pdu,
> > >>> +                                                     struct iovec
> > >>> **piov,
> > >>> +                                                     unsigned int
> > >>> *pniov,
> > >>> +                                                     size_t size);
> > >>> +    void        coroutine_fn (*init_out_iov_from_pdu)(V9fsPDU *pdu=
,
> > >>> +                                                      struct iovec
> > >>> **piov,
> > >>> +                                                      unsigned int
> > >>> *pniov,
> > >>> +                                                      size_t size)=
;
> > >>> +    void        coroutine_fn (*push_and_notify)(V9fsPDU *pdu);
> > >>> +    size_t      coroutine_fn (*msize_limit)(V9fsState *s);
> > >>> +    size_t      coroutine_fn (*response_buffer_size)(V9fsPDU *pdu)=
;
> > >>>   };
> > >>
> > >> I wonder whether that could be made more diff/blame-friendly.
> > >> Especially as
> > >> this currently only serves documentation purposes.
> > >>
> > >> They way you are positioning coroutine_fn it usually resolves to an
> > >> attribute
> > >> attached to the function's return type, not to the function itself, =
even
> > >> though clang/gcc handling it flexible. For attaching an attribute to=
 the
> > >> function itself the attribute should either be attached before the
> > >> function
> > >> declaration or after the function declaration.
> > >
> > > I tend to aggree it would be clearer to have these attributes /before=
/
> > > the function prototype declaration.
> >
> > $ git grep -E '^(static )?coroutine_(mixed_)?fn' | wc -l
> >        90
>
> More like
> $  git grep -rnE '\b(coroutine_fn|co_wrapper[a-z_]*)\b' | wc -l
> 1343
>

That matching is not accurate, it's actually hard enough to match all
annotations instances.. but this should be a rough estimation.

> most of them are "return-type co_annotation fn(..)"
> we even have scripts/block-coroutine-wrapper.py that relies and
> produce this order..
> a bit late to change the style imho...
>
> At least, let's not make this a requirement for this series, please
>
> >> block/block-copy.c:47:static coroutine_fn int
> > block_copy_task_entry(AioTask *task);
> > block/copy-before-write.c:106:static coroutine_fn int
> > cbw_do_copy_before_write(BlockDriverState *bs,
> > block/nvme.c:1351:static coroutine_fn int nvme_co_flush(BlockDriverStat=
e
> > *bs)
> > block/ssh.c:1223:static coroutine_fn int ssh_flush(BDRVSSHState *s,
> > BlockDriverState *bs)
> > nbd/server.c:3077:static coroutine_fn void nbd_trip(void *opaque)
> > block/block-copy.c:581:static coroutine_fn int
> > block_copy_task_entry(AioTask *task)
> > ...
> >
> > >
> > >> In both cases you could then
> > >> add it to its own, separate line, avoiding a lot of noise.
> > >>
> > >> /Christian
> > >>
> > >>
> > >>
> > >>
> > >
> > >
> >


