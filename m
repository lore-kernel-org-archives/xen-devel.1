Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C62AC44529
	for <xen-devel@archiver.kernel.org>; Tue, 21 Jul 2026 07:59:23 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1367557.1617302 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wm5Nc-0007g5-IU; Tue, 21 Jul 2026 07:59:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1367557.1617302; Tue, 21 Jul 2026 07:59:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wm5Nc-0007fy-FJ; Tue, 21 Jul 2026 07:59:08 +0000
Received: by outflank-mailman (input) for mailman id 1367557;
 Tue, 21 Jul 2026 07:59:07 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <mlureau@redhat.com>) id 1wm5Nb-0007fs-Bn
 for xen-devel@lists.xenproject.org; Tue, 21 Jul 2026 07:59:07 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wm5Na-003cBn-LG
 for xen-devel@lists.xenproject.org; Tue, 21 Jul 2026 09:59:06 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <mlureau@redhat.com>)
 id 6a5f26c2-e002-0a2a0a5209dd-0a2a450bc8f8-30
 for <xen-devel@lists.xenproject.org>; Tue, 21 Jul 2026 09:59:06 +0200
Received: from [170.10.129.124] (helo=us-smtp-delivery-124.mimecast.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <mlureau@redhat.com>)
 id 6a5f26c8-b7e8-0a2a450b0019-aa0a817cbb19-3
 for <xen-devel@lists.xenproject.org>; Tue, 21 Jul 2026 09:59:06 +0200
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-439-VzjbOMH9MgKWqgM2KHrssQ-1; Tue, 21 Jul 2026 03:59:03 -0400
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-2ccbb61893fso232050805ad.0
 for <xen-devel@lists.xenproject.org>; Tue, 21 Jul 2026 00:59:02 -0700 (PDT)
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
	s=mimecast20190719; t=1784620744;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lX2v55AGr51x0YaynLTMtlaht0Z2HEPzcmY3IeqlbTk=;
	b=fYu6XDG/d2NNqYlzxVK/DZGfB6qc/C/utZ6hg3o0F5p5uv/XXa8VLOtxa9EZnYgvaFABBE
	69Rc99u8tkxL0mJg81OYr6B5S2mrIvw2vhICJj+3tDAwi4IQPBch0vfGOmUO9Gv8LUoOxB
	SdYoqvFiKpwJqg999baNmPON5NnuylI=
X-MC-Unique: VzjbOMH9MgKWqgM2KHrssQ-1
X-Mimecast-MFC-AGG-ID: VzjbOMH9MgKWqgM2KHrssQ_1784620742
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784620742; x=1785225542;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lX2v55AGr51x0YaynLTMtlaht0Z2HEPzcmY3IeqlbTk=;
        b=Tl35AQfp7MeO4po9W4X3Wjmb1Db7iPO2Lts7XDq5bRboP2X4HYc5vixfwRvwYzSXhd
         Fg9GoRaGC8UPFm35oOgx/aGemMBekZCfeiQCQdpwrq/wpxbsqXQll3M9xAkXMf1fRy9B
         9GKCMPNrTt+7KsHz1LI8eDyyN68cw80qit6IpJ1+r37p+mk2oGVekMze5UpFGgRfifyc
         OAhNid54ZViJYj4UnTNzlg9ophBuV3/YV5UyJngOQyppXn8EQNWK2SranYIphJ9P3TU3
         8rp6mIVs2aV8+kJgJ4aesoq3VXQ3l2rzE8V+JrjDVpoF/1lCs3aduPy1eVt2vL1U4zHb
         wZQA==
X-Forwarded-Encrypted: i=1; AHgh+RqmZrMyEa06ZoLb8vaWGGD22QFiDdBMdecKEZDBuLXfc4LGHxCWkcdRcR68Gs5PA6hgCiilhwsFWPM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzARdjM3B9W2f+9oMqkmb5gQCWbblZyluSEAAR+IGdD5Rz/D5M4
	uLHfaMvMnGZ0m3UyAirjaeyaRYE/eCz6dL20eFTv6OMnWGjDjRvaeZU39qxBHoNoqyeogRRcSsg
	LTqscqVaT0kvWOaHDzTMtB5X18r+LcqkEkSEGXNtXifC3rrAUlQH0DYVrL9XwIJCVhw0qz9GXev
	uNk49I5bpAfvQ32iqhBJZZGI7/ZGzjxoG3GjL3pkQN0S8=
X-Gm-Gg: AR+sD12tLXQZtHGo4xJQGKIlozVHuFHFAdpDf5jJA8abxrDKuDL46aYtOgKJqvvLN7D
	iErfco4+HATB2gawEExr2VtCt31D26hGJtIUr9s5WWvxjRUit/94Uu7dwdgiG2JCAXbgvN6n592
	X/IMNQa3YU0xTkaI3uy1+0mbVPctM3PAZ8b9glUgNpLszRALqemlVhpDXqJZrbtVxrEAkT4N8H4
	jIZubK4a70A2E8wSSJy8QRLvAXSeRu7P/AhZQ7ktscE6ELXJeYIGHafTdwVxt0LCk2vFpqr/pnT
	mA==
X-Received: by 2002:a17:903:26c6:b0:2cc:864b:539 with SMTP id d9443c01a7336-2cf34819447mr189668165ad.6.1784620741788;
        Tue, 21 Jul 2026 00:59:01 -0700 (PDT)
X-Received: by 2002:a17:903:26c6:b0:2cc:864b:539 with SMTP id
 d9443c01a7336-2cf34819447mr189667725ad.6.1784620741041; Tue, 21 Jul 2026
 00:59:01 -0700 (PDT)
MIME-Version: 1.0
References: <20260720-co-v1-0-fabb4db3c204@redhat.com> <20260720-co-v1-7-fabb4db3c204@redhat.com>
 <7970030.EvYhyI6sBW@weasel> <7790107e-1256-4ed8-ba49-cab980197938@oss.qualcomm.com>
 <5af0aaf1-d372-4800-9f6f-8f5dacd8c69e@oss.qualcomm.com>
In-Reply-To: <5af0aaf1-d372-4800-9f6f-8f5dacd8c69e@oss.qualcomm.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Tue, 21 Jul 2026 11:58:49 +0400
X-Gm-Features: AUfX_mwkaLQEM0pLlT2VIiuWIGldOYBZqIvCk6ao2O3sK_TvcA9Cj7tuBTxYDnE
Message-ID: <CAMxuvaxREAH4K45UYeC6PK5fnYXTZW9nitRApMdtaxOC6rPDow@mail.gmail.com>
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
X-Mimecast-MFC-PROC-ID: D7-gP3jh8rMnuaYhjHDCQAxe_yrVkG2b-tA3XTA4bzI_1784620742
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-42698a/1784620746-AB8D19EA-AE0DA44F/0/0
X-purgate-type: clean
X-purgate-size: 5282

Hi

On Tue, Jul 21, 2026 at 12:54=E2=80=AFAM Philippe Mathieu-Daud=C3=A9
<philmd@oss.qualcomm.com> wrote:
>
> On 20/7/26 22:42, Philippe Mathieu-Daud=C3=83=C2=A9 wrote:
> > On 20/7/26 16:02, Christian Schoenebeck wrote:
> >> On Monday, 20 July 2026 09:55:36 CEST Marc-Andr=C3=A9 Lureau wrote:
> >>> All V9fsTransport callbacks are invoked exclusively from coroutine
> >>> context (the v9fs_* PDU handlers). Annotate the function pointer
> >>> types in V9fsTransport and all implementations (virtio and xen
> >>> backends), as well as intermediate callers in 9p.c (pdu_marshal,
> >>> pdu_unmarshal, v9fs_init_qiov_from_pdu, etc.).
> >>>
> >>> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >>> ---
> >>>   hw/9pfs/9p.h               | 26 +++++++++++++++-----------
> >>>   hw/9pfs/9p.c               | 31 +++++++++++++++++++------------
> >>>   hw/9pfs/virtio-9p-device.c | 24 +++++++++++++-----------
> >>>   hw/9pfs/xen-9p-backend.c   | 34 +++++++++++++++++-----------------
> >>>   4 files changed, 64 insertions(+), 51 deletions(-)
> >>>
> >>> diff --git a/hw/9pfs/9p.h b/hw/9pfs/9p.h
> >>> index 1a309664f6e..0e52ffbdf38 100644
> >>> --- a/hw/9pfs/9p.h
> >>> +++ b/hw/9pfs/9p.h
> >>> @@ -472,17 +472,21 @@ void pdu_submit(V9fsPDU *pdu, P9MsgHeader *hdr)=
;
> >>>   void v9fs_reset(V9fsState *s);
> >>>
> >>>
> >>>   struct V9fsTransport {
> >>> -    ssize_t     (*pdu_vmarshal)(V9fsPDU *pdu, size_t offset, const
> >>> char *fmt,
> >>> -                                va_list ap);
> >>> -    ssize_t     (*pdu_vunmarshal)(V9fsPDU *pdu, size_t offset, const
> >>> char *fmt,
> >>> -                                  va_list ap);
> >>> -    void        (*init_in_iov_from_pdu)(V9fsPDU *pdu, struct iovec
> >>> **piov,
> >>> -                                        unsigned int *pniov, size_t
> >>> size);
> >>> -    void        (*init_out_iov_from_pdu)(V9fsPDU *pdu, struct iovec
> >>> **piov,
> >>> -                                         unsigned int *pniov, size_t
> >>> size);
> >>> -    void        (*push_and_notify)(V9fsPDU *pdu);
> >>> -    size_t      (*msize_limit)(V9fsState *s);
> >>> -    size_t      (*response_buffer_size)(V9fsPDU *pdu);
> >>> +    ssize_t     coroutine_fn (*pdu_vmarshal)(V9fsPDU *pdu, size_t
> >>> offset,
> >>> +                                             const char *fmt,
> >>> va_list ap);
> >>> +    ssize_t     coroutine_fn (*pdu_vunmarshal)(V9fsPDU *pdu, size_t
> >>> offset,
> >>> +                                               const char *fmt,
> >>> va_list ap);
> >>> +    void        coroutine_fn (*init_in_iov_from_pdu)(V9fsPDU *pdu,
> >>> +                                                     struct iovec
> >>> **piov,
> >>> +                                                     unsigned int
> >>> *pniov,
> >>> +                                                     size_t size);
> >>> +    void        coroutine_fn (*init_out_iov_from_pdu)(V9fsPDU *pdu,
> >>> +                                                      struct iovec
> >>> **piov,
> >>> +                                                      unsigned int
> >>> *pniov,
> >>> +                                                      size_t size);
> >>> +    void        coroutine_fn (*push_and_notify)(V9fsPDU *pdu);
> >>> +    size_t      coroutine_fn (*msize_limit)(V9fsState *s);
> >>> +    size_t      coroutine_fn (*response_buffer_size)(V9fsPDU *pdu);
> >>>   };
> >>
> >> I wonder whether that could be made more diff/blame-friendly.
> >> Especially as
> >> this currently only serves documentation purposes.
> >>
> >> They way you are positioning coroutine_fn it usually resolves to an
> >> attribute
> >> attached to the function's return type, not to the function itself, ev=
en
> >> though clang/gcc handling it flexible. For attaching an attribute to t=
he
> >> function itself the attribute should either be attached before the
> >> function
> >> declaration or after the function declaration.
> >
> > I tend to aggree it would be clearer to have these attributes /before/
> > the function prototype declaration.
>
> $ git grep -E '^(static )?coroutine_(mixed_)?fn' | wc -l
>        90

More like
$  git grep -rnE '\b(coroutine_fn|co_wrapper[a-z_]*)\b' | wc -l
1343

most of them are "return-type co_annotation fn(..)"
we even have scripts/block-coroutine-wrapper.py that relies and
produce this order..
a bit late to change the style imho...

At least, let's not make this a requirement for this series, please

>> block/block-copy.c:47:static coroutine_fn int
> block_copy_task_entry(AioTask *task);
> block/copy-before-write.c:106:static coroutine_fn int
> cbw_do_copy_before_write(BlockDriverState *bs,
> block/nvme.c:1351:static coroutine_fn int nvme_co_flush(BlockDriverState
> *bs)
> block/ssh.c:1223:static coroutine_fn int ssh_flush(BDRVSSHState *s,
> BlockDriverState *bs)
> nbd/server.c:3077:static coroutine_fn void nbd_trip(void *opaque)
> block/block-copy.c:581:static coroutine_fn int
> block_copy_task_entry(AioTask *task)
> ...
>
> >
> >> In both cases you could then
> >> add it to its own, separate line, avoiding a lot of noise.
> >>
> >> /Christian
> >>
> >>
> >>
> >>
> >
> >
>


