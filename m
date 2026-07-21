Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1744C44529
	for <xen-devel@archiver.kernel.org>; Tue, 21 Jul 2026 08:40:22 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1367629.1617356 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wm61M-0001E7-F2; Tue, 21 Jul 2026 08:40:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1367629.1617356; Tue, 21 Jul 2026 08:40:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wm61M-0001Cw-Bp; Tue, 21 Jul 2026 08:40:12 +0000
Received: by outflank-mailman (input) for mailman id 1367629;
 Tue, 21 Jul 2026 08:40:11 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <mlureau@redhat.com>) id 1wm61L-0001Cp-EL
 for xen-devel@lists.xenproject.org; Tue, 21 Jul 2026 08:40:11 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wm61K-00BtTe-RO
 for xen-devel@lists.xenproject.org; Tue, 21 Jul 2026 10:40:10 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <mlureau@redhat.com>)
 id 6a5f3053-e002-0a2a0a5209dd-0a2a4506acc6-46
 for <xen-devel@lists.xenproject.org>; Tue, 21 Jul 2026 10:40:10 +0200
Received: from [170.10.133.124] (helo=us-smtp-delivery-124.mimecast.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <mlureau@redhat.com>)
 id 6a5f3069-195a-0a2a45060019-aa0a857c5399-3
 for <xen-devel@lists.xenproject.org>; Tue, 21 Jul 2026 10:40:10 +0200
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-596-oQFOBqYYMiOmCNOz--1iMQ-1; Tue, 21 Jul 2026 04:40:05 -0400
Received: by mail-pg1-f200.google.com with SMTP id
 41be03b00d2f7-cb48f41343aso3410278a12.1
 for <xen-devel@lists.xenproject.org>; Tue, 21 Jul 2026 01:40:05 -0700 (PDT)
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
	s=mimecast20190719; t=1784623209;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1+3mmICKSXr7PfAtflwEbwDlN/hD/1oxnaHEUk7fiek=;
	b=HAGLBccalIdOqRCDLTPK1SNlgLGgttZLHeBnDseGUfExy/k/ocelYf8yb9a9gqBQN7DfVc
	oUatACh2jni3FIpa4uPgYIbDM3ob0yMQVWWKFbhwiA0zAI+WvhZ1sXl4f4REUEDo6aMaFT
	6UJuaROlg7fSCM2JCr8mR7dnLa6ESLo=
X-MC-Unique: oQFOBqYYMiOmCNOz--1iMQ-1
X-Mimecast-MFC-AGG-ID: oQFOBqYYMiOmCNOz--1iMQ_1784623205
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784623205; x=1785228005;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1+3mmICKSXr7PfAtflwEbwDlN/hD/1oxnaHEUk7fiek=;
        b=klE2XB4CIdZasOyxGY2GSXu0PDBZOUXeaBQvP8UHYe8EnYWeP1pkgnE3rv85ML6p0W
         UhDEsHO7CBqHFUisqPr4w1HOGmSygJjmTri+ByfnBlFZObpUJu8gmiO+FtnjdoExA7jj
         3fJ0/FR/nPzN2QblklRlW2hWVn9rPayytL7B/tgRGBOA7f1RMbFyxHTWUPqlAQeq2aJQ
         iHB+x7hecPnjgaVEJOX2MLZuul3+ha5Pv3inK5+vz8Ax+fRUFKpWL/GY3Z8X5JkozG6A
         Di3cm1jmV8POYKwkOmUUS2Hlnfd+2MfQfVKCbo+fIdTA0QCxtpu5QP6XOe2JdWEtispc
         usGw==
X-Forwarded-Encrypted: i=1; AHgh+RopTvNk+NWZjcdIpKX+om+EQm2m0NaO2CiMVdLGSIcg0efM/zxEop6kTubCTeSkUEhYjk+b+wmBNf4=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy33sccHF6yYuwyGtb5MYvLW54MPZCi8D8cBF9FtQn37azQY1by
	YhsrKAm1ts7ooRmzIK+UcUp2NOi0amg8XzgYyg4ZtKNdnFStt1+rTXs/b35Fj3vD2Dh13JHkJKY
	kNWxtBBAy9ylQocyrDrsH6dOLkjX/C8tPA4U124Vg32T3FOXeeZ5cw3bX1f2f7vzV0/u6qRH7Z3
	kp9U5RYz1uN0LgswUeyjz+61IBuBdJ8TewKKlaFQiKaoo=
X-Gm-Gg: AfdE7cnfeY2Ad5EjL+ENoxLTPbIYWyFqb9OoFoFuvS933j7Wk/Cjao1nXYv7Ad0Bm0u
	PbqUyJDjKV+dt8Ohx9FK6AJdTAg8U+3mVBKmfhjVNKnA+y+1THbuWlzs1a4yTclZwMJjftPmBlq
	wB3l0GDSaj+fXaQXcwjIUSJwSwDsAKoLcEMqYYP4dro7TMWHs3oP6ZIaA2JZlyLxcfKPGnhG3Up
	Un4disZbybREApVXn+qRFNZCsgLHSkYxV71EDIMNyPOplnfMrM8gISOZqBLd1zFysI7NEW/K7oB
	uA==
X-Received: by 2002:a05:6a21:3e02:b0:3c3:d92b:29be with SMTP id adf61e73a8af0-3c3d92b29dfmr8974196637.25.1784623204617;
        Tue, 21 Jul 2026 01:40:04 -0700 (PDT)
X-Received: by 2002:a05:6a21:3e02:b0:3c3:d92b:29be with SMTP id
 adf61e73a8af0-3c3d92b29dfmr8974154637.25.1784623204145; Tue, 21 Jul 2026
 01:40:04 -0700 (PDT)
MIME-Version: 1.0
References: <20260720-co-v1-0-fabb4db3c204@redhat.com> <CAMxuvaySONs4r=1Bmsao1f1cZdviGGwPVM8+1Q+1vdY0X-pYVw@mail.gmail.com>
 <af19f823-234c-462d-8c52-4d8cf4b93c4c@oss.qualcomm.com> <6287083.lOV4Wx5bFT@weasel>
In-Reply-To: <6287083.lOV4Wx5bFT@weasel>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Tue, 21 Jul 2026 12:39:52 +0400
X-Gm-Features: AUfX_mxRdL-DqzkjpYIAmbj-FBmtHJVc5VSImiqMsANjDJqpsxKJSZx6GWIMBMY
Message-ID: <CAMxuvay01r=EchTO=PocqPtdtZtxcJs+AJZExRA8rBao31mH7w@mail.gmail.com>
Subject: Re: [PATCH 7/8] hw/9pfs: annotate V9fsTransport callbacks as coroutine_fn
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Cc: qemu-devel@nongnu.org, =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>, 
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
X-Mimecast-MFC-PROC-ID: mNVAMIqh01VoyxJ7My4DaPzMVq_n90b2aVc1W-hpb1E_1784623205
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-16d1c6/1784623210-F647377B-8E6AD27C/0/0
X-purgate-type: clean
X-purgate-size: 1201

Hi

On Tue, Jul 21, 2026 at 12:38=E2=80=AFPM Christian Schoenebeck
<qemu_oss@crudebyte.com> wrote:
>
> On Tuesday, 21 July 2026 10:25:34 CEST Philippe Mathieu-Daud=C3=A9 wrote:
> > On 21/7/26 10:06, Marc-Andr=C3=83=C2=A9 Lureau wrote:
> > > Hi
> > >
> > > On Tue, Jul 21, 2026 at 11:58=E2=80=AFAM Marc-Andr=C3=A9 Lureau
> > >
> > > <marcandre.lureau@redhat.com> wrote:
> [...]
> > >> most of them are "return-type co_annotation fn(..)"
> > >> we even have scripts/block-coroutine-wrapper.py that relies and
> > >> produce this order..
> > >> a bit late to change the style imho...
> > >>
> > >> At least, let's not make this a requirement for this series, please
> >
> > Not a requirement on my side, but if we had to pick a style,
> > I'd vote for "attribute before return type".
>
> Yep, because that's a) the most compiler-friendly option (all compilers a=
llow
> it, including MSC) and b) it's the most diff-noise friendly solution (can=
 be
> prepended on its own line without touching any of the existing line(s) at
> all).
>

ok, what should I do? Send a preliminary patch to fix all annotation
positions? or just change the position in this patch or series?


