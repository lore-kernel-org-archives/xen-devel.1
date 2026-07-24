Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD979C531C9
	for <xen-devel@archiver.kernel.org>; Fri, 24 Jul 2026 21:20:41 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1370244.1618481 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wnNJn-0003EC-DH; Fri, 24 Jul 2026 21:20:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1370244.1618481; Fri, 24 Jul 2026 21:20:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wnNJn-0003E4-AE; Fri, 24 Jul 2026 21:20:31 +0000
Received: by outflank-mailman (input) for mailman id 1370244;
 Fri, 24 Jul 2026 21:20:30 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <marcandre.lureau@gmail.com>) id 1wnNJm-0003Dy-0g
 for xen-devel@lists.xenproject.org; Fri, 24 Jul 2026 21:20:30 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wnNJl-005oJN-Dg
 for xen-devel@lists.xenproject.org; Fri, 24 Jul 2026 23:20:29 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <marcandre.lureau@gmail.com>)
 id 6a63d6e0-e002-0a2a0a5209dd-0a2a45058318-46
 for <xen-devel@lists.xenproject.org>; Fri, 24 Jul 2026 23:20:29 +0200
Received: from [209.85.215.181] (helo=mail-pg1-f181.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <marcandre.lureau@gmail.com>)
 id 6a63d71b-4cb1-0a2a45050019-d155d7b5d439-3
 for <xen-devel@lists.xenproject.org>; Fri, 24 Jul 2026 23:20:29 +0200
Received: by mail-pg1-f181.google.com with SMTP id
 41be03b00d2f7-ca12086c06eso749687a12.0
 for <xen-devel@lists.xenproject.org>; Fri, 24 Jul 2026 14:20:28 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=redhat.com header.i="@redhat.com" header.h="Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version"
ARC-Seal: i=1; a=rsa-sha256; t=1784928027; cv=none;
        d=google.com; s=arc-20260327;
        b=hnDhozoSoJHfBc+xyUWTKBC4HfQbEXGP6V0nAUwIS7VcZALo0yESM2LtmgbRYhT6u5
         6CEE4710kCHMNSxdDQDpXkYCr45h9cbLDECUXvYp0OMxFymPChsSmtc2q+N/aqzp1u4f
         Fbbu+w6yKTVkbeTaYDbpFciGskaRRCWWJ0+wKzqn4uGUi4IILjSCHWhuIgqyL4X655A/
         FRWqaISkPvLaDoTb2bSPTiz5wVrClDtcufcKhX4khz0JM79vvaXJ9qrkIKz/ZCJvNe3C
         guxLnpNtkMeYrWEywEdcac+1Uta+XWpoYj+125/Eo8Yl+YHLcjsLoVJJYsUtiTmFiHVx
         TyHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/2m0dqcoMneC3Zf15VEtk2J/x4FvDYNzHSWnoIQbyCM=;
        fh=SyT053ljnhqOzbbXkLLuNSP6fA0uzMsv4ECq2hzhfN4=;
        b=PcnU5ta2bJPuam8AldskWrxa7FUS9EiEoXxF7z6S59kEaughroEtpfkmIgicHk9Qju
         939At7B7FzPZJX9Z4l6Ru2dU8B9egihgxgnVIaFKxkyqcZ76WOoAFxmFdm4Y4ri039Nl
         WJOSy0jIwDHuir1aJM1qW9Ul8/QAfvfd4Q3rqqVYCdmfHDEY9OiuMS+DEmnC5CbPTaEa
         aAq++wrVKHAPKtzhxi1cLZxBjlOfaMrigp/3UpEqAeBUY3QLcyJG5zZ8kOXZwb3UOK5B
         Sq5tfAlKEj88B0YmTp8UBq/y7AKpYsitJTn8kmA0etDvQwV8oQVZrg3TASnA01kr7Qwj
         Rj+Q==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1784928027; x=1785532827; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/2m0dqcoMneC3Zf15VEtk2J/x4FvDYNzHSWnoIQbyCM=;
        b=MmytH1IcACCRHiL3a47Ua8/bLGZShiIrhCQVPHZe1/QcnJr/HR9BsTg8x3pRnsFpWy
         cGQHa4e/Y5k8KY/jtOLaiIprC9LLcXfO1qP5u2oI3OjSxJ1Pely7Gc7ihat08bvPyx6e
         ShNhW+RJvVCpFMUMqLKYPng6JGhGSkA8XUpiGVgvJSbFBIlcwh7ycPWjZaBWo2zM5oMN
         Z9L2sBiYV7bAZCdGwGddWhUPBAbNaAlNmWwf75T0zmq1hvP3dCFhc1FIKqAEJkmzsDao
         7zTebBuTnd4i9T7poPT4Ogl7xeXwEeR1QB0AW+YU2y1+P63hGSKihdBK8vGeyqHLoHIH
         CcBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784928027; x=1785532827;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/2m0dqcoMneC3Zf15VEtk2J/x4FvDYNzHSWnoIQbyCM=;
        b=epDxtpFdkIny0ukvaWk6xZJDNZIdC5nTGZnuA8WoS6pItFVPcDbSVLuX8tfH/yOnca
         hXuEjPeU/+6ZYCyXHc9RveGT75lr7a7o0awCUnlZRfbvrTRIqOTRANO9LCWibw/aWnQT
         0B/+6U2wSzURUuR2daEnGgMe3k0s00EXCoNlami/onXpUyvdID5Z+vLDGqribGqQMt+i
         nfGnOgTHFUjHKrzoCjNTIN8/Vri1MZO6flX34xqw7GDHJO/tuCWyOukdJkPShmO8WCgT
         xz326B4C4mGtT/j9vRB62hkBN15/P5SsPw836LKwE47HP9rs2uUh2ryHSUwWhreIsDBI
         Xc7A==
X-Forwarded-Encrypted: i=1; AHgh+RrsXY2TEGHhvHIloz3WjDWswlVFZIhcPi59oWJF1Cx1QEIS1FIIbdzEx8xqpFOvGtCj48AqgluniF4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxCoCjWen1CePPb/wWMp2UfFfGB3wATQmQN1q4FOYTvJ5qVnZbz
	RRs+ZdBLGbVi5dFyPJAr43GWnYMnEzjGVXkDq6Ixzoj8tvRRGUxnfjWy+XHucJ/cM6yxdNJguRI
	TX44iV9+9jUb11JY7BZpq6jZU1rNA8MA=
X-Gm-Gg: AR+sD122yxPachoX5Mne0hkhJrgMYBc7VjvXPD8ns97U9rVTrOVJyMPyRoBAFtnFItz
	+kJPOXAEYsaMhhLSHMKQH8VWB/81DwFr7v7SYgS2akmZQ9l0TTwqcKLZLYjmQ3Xa64UXooAz9nP
	8RExhCKC07RGSnqwl4IHc44SoV8ox+iEsujj4eWmkmv+YrCSJKcWwiZEsvz6LutpSCj5klt4Qp+
	jadLlpKl57n4vx4XPFBZ4FjWSyzGse+4eb45MlzHfKXoi8lOC1EweIxKM+CT90tDBwe3FCjwAOu
	/D38NQlnsxH4WIsVYw==
X-Received: by 2002:a05:6a21:2e02:b0:3bf:8604:9a3c with SMTP id
 adf61e73a8af0-3c67da8d681mr56518637.28.1784928027076; Fri, 24 Jul 2026
 14:20:27 -0700 (PDT)
MIME-Version: 1.0
References: <20260720-co-v1-0-fabb4db3c204@redhat.com> <20260720-co-v1-6-fabb4db3c204@redhat.com>
 <amNmcTIfZT0OFpkB@redhat.com>
In-Reply-To: <amNmcTIfZT0OFpkB@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Sat, 25 Jul 2026 01:20:14 +0400
X-Gm-Features: AUfX_mxsI_64kq8171cFbZT8qZ79qBeV5buGN6-oXL7LsfnfAmcoPqSLGoAWWgs
Message-ID: <CAJ+F1CJ-fO719E=LSi6TWXC8wV6uZ-=0ereP_AgnNZQOaJZdNw@mail.gmail.com>
Subject: Re: [PATCH 6/8] block: add missing coroutine_fn annotations
To: Kevin Wolf <kwolf@redhat.com>
Cc: qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>, Peter Xu <peterx@redhat.com>, 
	Fabiano Rosas <farosas@suse.de>, =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
	John Snow <jsnow@redhat.com>, Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>, 
	Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org, 
	Stefan Hajnoczi <stefanha@redhat.com>, Fam Zheng <fam@euphon.net>, "Denis V. Lunev" <den@openvz.org>, 
	Christian Schoenebeck <qemu_oss@crudebyte.com>, Greg Kurz <groug@kaod.org>, 
	"Michael S. Tsirkin" <mst@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Anthony PERARD <anthony@xenproject.org>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, 
	xen-devel@lists.xenproject.org, Li Zhijian <lizhijian@fujitsu.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-c201ff/1784928029-716AD2A1-2D72AC7C/0/0
X-purgate-type: clean
X-purgate-size: 3541

Hi

On Fri, Jul 24, 2026 at 5:20=E2=80=AFPM Kevin Wolf <kwolf@redhat.com> wrote=
:
>
> Am 20.07.2026 um 09:55 hat Marc-Andr=C3=A9 Lureau geschrieben:
> > The functions call coroutine functions or are called by coroutine.
>
> That it's called only by coroutines isn't a reason to make a function
> coroutine_fn as long as it theoretically could be called by
> non-coroutine code and it would still work fine (i.e. it doesn't yield).
>
> > Add an assert() in qcow2_do_close() code path which calls a
> > no_coroutine_fn bdrv_graph_wrlock_drained().
> >
> > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> > diff --git a/block/parallels.c b/block/parallels.c
> > index 7a90fb5220b..46a6e8f2743 100644
> > --- a/block/parallels.c
> > +++ b/block/parallels.c
> > @@ -142,8 +142,9 @@ static uint32_t host_cluster_index(BDRVParallelsSta=
te *s, int64_t off)
> >      return off / s->cluster_size;
> >  }
> >
> > -static int64_t block_status(BDRVParallelsState *s, int64_t sector_num,
> > -                            int nb_sectors, int *pnum)
> > +static int64_t coroutine_fn
> > +block_status(BDRVParallelsState *s, int64_t sector_num,
> > +             int nb_sectors, int *pnum)
> >  {
> >      int64_t start_off =3D -2, prev_end_off =3D -2;
> >
>
> Specifically this hunk is unclear to me.
>
> As far as I can see, block_status() can't yield. Why did you add the
> coroutine_fn marker here, but not e.g. for seek_to_sector() or
> cluster_remainder(), which are only called by block_status() and
> therefore also always only in coroutine context?
>

Indeed, that's a wrong annotation I added

> I believe the right way to stay consistent is to leave all of them
> unmarked because there is no fundamental reason why they would only make
> sense in coroutine context.
>
> > diff --git a/block/qcow2.c b/block/qcow2.c
> > index 19271b10a49..161626fa3cb 100644
> > --- a/block/qcow2.c
> > +++ b/block/qcow2.c
> > @@ -1287,9 +1287,10 @@ fail:
> >  }
> >
> >  /* s_locked specifies whether s->lock is held or not */
> > -static void qcow2_update_options_commit(BlockDriverState *bs,
> > -                                        Qcow2ReopenState *r,
> > -                                        bool s_locked)
> > +static void coroutine_fn
> > +qcow2_update_options_commit(BlockDriverState *bs,
> > +                            Qcow2ReopenState *r,
> > +                            bool s_locked)
> >  {
> >      BDRVQcow2State *s =3D bs->opaque;
> >      int i;
> > @@ -2126,7 +2127,8 @@ fail:
> >      return ret;
> >  }
> >
> > -static void qcow2_reopen_commit(BDRVReopenState *state)
> > +static void coroutine_fn
> > +qcow2_reopen_commit(BDRVReopenState *state)
> >  {
> >      BDRVQcow2State *s =3D state->bs->opaque;
> >
>
> This doesn't match the declaration of the .bdrv_reopen_commit callback
> in BlockDriver, and as far as I can see, the callers are actually
> guaranteed to _not_ be in coroutine context.
>
> If this is true, qcow2_update_options_commit() should probably be marked
> coroutine_mixed_fn and this one stay unannotated or no_coroutine_fn.

it calls qcow2_update_options_commit(), which itself calls coroutine
cache_clean_timer_co_locked_del_and_wait(bs).

But since s_locked is false, the function is safe it call in non-coroutine.

Given that there are 2 callers, I suggest we move the coroutine call
outside and drop the annotation.


>
> The other parts of the patch looks correct.
>
> Kevin
>
>

