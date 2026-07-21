Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB6FEC44529
	for <xen-devel@archiver.kernel.org>; Tue, 21 Jul 2026 08:38:03 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1367617.1617346 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wm5zB-0007W1-3U; Tue, 21 Jul 2026 08:37:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1367617.1617346; Tue, 21 Jul 2026 08:37:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wm5zB-0007Vu-0c; Tue, 21 Jul 2026 08:37:57 +0000
Received: by outflank-mailman (input) for mailman id 1367617;
 Tue, 21 Jul 2026 08:37:56 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <qemu_oss@crudebyte.com>) id 1wm5zA-0007Vh-IQ
 for xen-devel@lists.xenproject.org; Tue, 21 Jul 2026 08:37:56 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wm5z9-008xI3-VG
 for xen-devel@lists.xenproject.org; Tue, 21 Jul 2026 10:37:55 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <qemu_oss@crudebyte.com>)
 id 6a5f2fdc-2eae-0a2a0a5409dd-0a2a4509dbe2-26
 for <multiple-recipients>; Tue, 21 Jul 2026 10:37:55 +0200
Received: from [5.189.157.229] (helo=kylie.crudebyte.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <qemu_oss@crudebyte.com>)
 id 6a5f2fe3-be1a-0a2a45090019-05bd9de5d7c7-3
 for <multiple-recipients>; Tue, 21 Jul 2026 10:37:55 +0200
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
	bh=xsiuMtkyvpeTAe9qRj+jiYyJl+i3WSpIPBOaH7CGOv0=; b=iFDyzzP7066gXj9h+Jgg/UenSL
	dVweXKjd0q6HclwRHAKA7c1Fnizh1PzEMdjwep+hbepA1iaG4V2kK++GJHpx6ea6Xl+YTrcMvHQQd
	jCMjt1FduAKdGZKVY48ceRaiPmbeIyZj8+ArG7gzzLUQjYGNhSamPs2WwPO96HkkjOyg0BKTNHFVZ
	zqWLpQT3og38tuJU+fKemXApIURQFoJamtJlNJzJbhCWG03OFlOxynNaH/kQHsPXhIDHT7n5XKAhU
	NW9LDijJq65qXg4etCs3ydNCoXLCejryjDtAg/xHLadW35eBoUACq7qbPpFQfSjDKAXx7PLS/+KGG
	gZ7l62z/G3SDHMubq3hDSfqMxgWxb+syS7dcyfdCXkhc9u16TBWA134cO9AKdZ6WQBDfF2BMPhiK+
	uYpjghSO7TRmhuuVpPtMXIlosrlm8EHQiYNp2TGwgkVdTycEAzhcXWpMQEtus6C1v1f17YULnKWoB
	2ePc0MtTp+kFjj/jU5RxO6aJ1Wo11zmCpoODi8p1gNO3Z6NLri4OxYCmOwaC22zmE0vCopEhcMnJq
	L9FJ8fI37pRBY099WWj+FV/b//3DPq6Cs5zcl0Q9m7aXB+amJxm4ZQKNdKrmKsODpn7Sgn0eh2uUu
	6+prLeedqUAmk3guL221Y6L+C+WuseLVFQjlhlpqI=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: =?UTF-8?B?TWFyYy1BbmRyw6k=?= Lureau <marcandre.lureau@redhat.com>,
 qemu-devel@nongnu.org,
 Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@oss.qualcomm.com>
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
Date: Tue, 21 Jul 2026 10:37:39 +0200
Message-ID: <6287083.lOV4Wx5bFT@weasel>
In-Reply-To: <af19f823-234c-462d-8c52-4d8cf4b93c4c@oss.qualcomm.com>
References:
 <20260720-co-v1-0-fabb4db3c204@redhat.com>
 <CAMxuvaySONs4r=1Bmsao1f1cZdviGGwPVM8+1Q+1vdY0X-pYVw@mail.gmail.com>
 <af19f823-234c-462d-8c52-4d8cf4b93c4c@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-purgate-ID: tlsNG-bad1c0/1784623075-BE0C5034-6357F3BF/0/0
X-purgate-type: clean
X-purgate-size: 951

On Tuesday, 21 July 2026 10:25:34 CEST Philippe Mathieu-Daud=C3=A9 wrote:
> On 21/7/26 10:06, Marc-Andr=C3=83=C2=A9 Lureau wrote:
> > Hi
> >=20
> > On Tue, Jul 21, 2026 at 11:58=E2=80=AFAM Marc-Andr=C3=A9 Lureau
> >=20
> > <marcandre.lureau@redhat.com> wrote:
[...]
> >> most of them are "return-type co_annotation fn(..)"
> >> we even have scripts/block-coroutine-wrapper.py that relies and
> >> produce this order..
> >> a bit late to change the style imho...
> >>=20
> >> At least, let's not make this a requirement for this series, please
>=20
> Not a requirement on my side, but if we had to pick a style,
> I'd vote for "attribute before return type".

Yep, because that's a) the most compiler-friendly option (all compilers all=
ow=20
it, including MSC) and b) it's the most diff-noise friendly solution (can b=
e=20
prepended on its own line without touching any of the existing line(s) at=20
all).

/Christian




