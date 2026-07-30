Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 321A4C54FDF
	for <xen-devel@archiver.kernel.org>; Thu, 30 Jul 2026 09:26:08 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1377350.1623447 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wpN1T-0005dP-M2; Thu, 30 Jul 2026 09:25:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1377350.1623447; Thu, 30 Jul 2026 09:25:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wpN1T-0005dI-Iq; Thu, 30 Jul 2026 09:25:51 +0000
Received: by outflank-mailman (input) for mailman id 1377350;
 Thu, 30 Jul 2026 09:25:49 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <hanguidong02@gmail.com>) id 1wpN1R-0005dC-RS
 for xen-devel@lists.xenproject.org; Thu, 30 Jul 2026 09:25:49 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wpN1R-00AaeR-7I
 for xen-devel@lists.xenproject.org; Thu, 30 Jul 2026 11:25:49 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <hanguidong02@gmail.com>)
 id 6a6b188e-bab6-0a2a0a5309dd-0a2a450ab278-30
 for <xen-devel@lists.xenproject.org>; Thu, 30 Jul 2026 11:25:49 +0200
Received: from [209.85.161.42] (helo=mail-oo1-f42.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <hanguidong02@gmail.com>)
 id 6a6b189c-f2d2-0a2a450a0019-d155a12acc9a-3
 for <xen-devel@lists.xenproject.org>; Thu, 30 Jul 2026 11:25:49 +0200
Received: by mail-oo1-f42.google.com with SMTP id
 006d021491bc7-6aae384221fso1152299eaf.0
 for <xen-devel@lists.xenproject.org>; Thu, 30 Jul 2026 02:25:48 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version"
ARC-Seal: i=1; a=rsa-sha256; t=1785403547; cv=none;
        d=google.com; s=arc-20260327;
        b=gTACIrtKDLqi163KsaeRggmh2OOPKdtAoFDhmshxL4lAaNsx1I0QoKHug3EyV47/Fx
         GosWM/rNByVojGul0W+RFm8z+ACj1TtIstJFX+KVpBbRrs8eu5LSHk7bCrrh3oG7LuJT
         LgJAvZFnH8SWf+tPH3GEmQBaKQ2U+sEesnVARfeE5hoGfv2/3hBTT0IKjJ1AkCTq8bN+
         MmLZBH2x8SnRzJsn+UESSjWLMXFeOCpqivJqxlNX9ATh/AsLcMR1P6TpmE9x8TfWjwd9
         vjv+Iwz083+dnU0S8bkrJx3CE2DMUOO9nLo9nWogEDH50HkQ3GeWxuc+308cj4horQH5
         LGhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=F3tmc6Hix679VZeoNLiFv83lH5jhtiL+H1oB5qeNyiE=;
        fh=Hc+ecmrD0kO/VhFp1XRGQOpctwLI7cBucsVHf49gkT8=;
        b=C1RkLbePEBN9LioTuMJwgkRSGoO4LaMMMTZyVJjXOfp/NVrnco8Einp1014Z2U9YZN
         Flnv9tRzH0FLW4OOsRj1nEd4fWHbreoLixDX5lgzQh5IqkFaQrflMeL35EG8Srbu4V6N
         VA0xbjJwOKQcFEZpbwVz2t5GbmYjYUFNjCz8bJS5OSnadJqU6Siu4p9xbwEt1A/XAkbx
         m0iIg0PDP2Ld+UeeHEcRba8V1SffCitk+XhCpHLyAsMG/UMj+J9mqRPM8RA/vA5EKLgb
         n0wU2h/Ad1RpnylnJSgTN2w7GVXZhVXI3Odl52QvP/mpLgsfX//bXrIW845AIClHo9dC
         bG3w==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785403547; x=1786008347; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=F3tmc6Hix679VZeoNLiFv83lH5jhtiL+H1oB5qeNyiE=;
        b=HYlLu0LNhD7MiqJp1N3OojLak1G6YCMvZ+LeTc6Hl5eRxhYOlo3hyCk/sw0pB3L1ij
         UQXfZXlc1Pk/ic7lqhxf7ow7u9gTy943J49c4L/6XTRMHEUfwtdYHXhP4UQfUNqPnSu6
         DQfscXENfsI9eXDXwgiNV3swk1n9kvmg8g1KJTMEF5TPPT2bAa4BmhUcoVBzXlh9Cczw
         gJqfw7lk3TQ/1XT5YOJGOwEHMII9WxhPFwF9KW/DUkG2IOhGJJ4xm9EYnB9C5z8yOtJh
         z3H/QxfKPTycns3OeFCGW5IQHuSF0dt4qe/g2/gKQgC7YKBok+ybLgeCHC9lQPGpMHTt
         IQhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785403547; x=1786008347;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F3tmc6Hix679VZeoNLiFv83lH5jhtiL+H1oB5qeNyiE=;
        b=KZBfVEUGSn/lLf4/41s7/R4u4fNay5d2M5wCaNH+JQFzp2fg0FpRua627mV/tI3tpw
         BEF8fAxQqab8KfzXGQY0TkH6F9OmHqQekw+TulY/CwMqN8fposU8DRgSrECOAh7cjUOE
         2Q1biYKW/wCCwiMzxYWwuP8NEz0DJMWTgjn3O3y/UZ8hPxhzdTBIlgYEHnV1LRd87o4r
         mZJCxcaX43511aTnvutStRAY3esQJg4v20DzADFj2UnnkAAys6iNOz5f3oy2a0bOtgxS
         VbmXQN1WJK6RJPKZCHbcySQze1jLuN/d5aIOBsQ1PFgXlpbdFFMcto3NTo+9+G7lA4Na
         lqSQ==
X-Forwarded-Encrypted: i=1; AHgh+RqOq+4btRwgCfwU8ZZu79eNaVK9PFGXHaHEVXP7RnwQDvW/9w0RBAxZVAfBrmmycR3aCvmig6k05eA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzmAxC+JD8ZbzjRqAQRn2HcLV+yl6XlD/kxKxquatMxtCZbeRya
	B71TAZLpfM1nP7S0KhQ/ue2dpYXfgCs3FgHkf0pmrZ/J9UqwwK487zlW75zmZUNVw+5V5vpKlhs
	3knCwPsEg1pVCvvGvK99EGOqxw1QIb9E=
X-Gm-Gg: AR+sD135NG4uVEnVQjtDLRwad/W4KKr3TdZoUGKQ7EDE6f18IVlbl4iwm2+dhYhzj4C
	6T4UCyR0F1uC3QdyqTwuzGeBJW6xZwAVa3ziHe2bUlOJ4+QjnimBz7jpFkFrlBTpr/8XIsqEFgv
	n9+sL3I25YrKqdRqp3xubb5BBCcVvz0Iwr6RVognJ1rJUGpOfgGXmOsert3jU6Sot3hhGXBR86F
	8iOrp3RPSZ6w+MG3fWYHUA73hz6R1FS/hieQQpR6RumQ4/RKYvqM92vcS7HBi4q21V1bP1qnw+/
	s2bARZvDF42uo05MLoPg14qv1NAIowGd3TJdz1DRgWCFsswIshgkxnggTdsOLf8iWql7d+zqEQ+
	FteLxY0MPYWn5vX01XRoCmchAxp4ciZnon5F/jyamP/b8B5dV+PE1YTc=
X-Received: by 2002:a05:6820:2914:b0:6a3:97c6:f80f with SMTP id
 006d021491bc7-6acbc0962b2mr1103342eaf.44.1785403547526; Thu, 30 Jul 2026
 02:25:47 -0700 (PDT)
MIME-Version: 1.0
References: <20260730084000.3305702-1-hanguidong02@gmail.com> <66fc571d-4e6e-4d2e-973c-2de4789df432@suse.com>
In-Reply-To: <66fc571d-4e6e-4d2e-973c-2de4789df432@suse.com>
From: Gui-Dong Han <hanguidong02@gmail.com>
Date: Thu, 30 Jul 2026 17:25:36 +0800
X-Gm-Features: AUfX_mxfbh1F7INaUWJefxenTBaf3A5IcBk4T84hBt6KJT_lrx3p8U-Fv5F1jbE
Message-ID: <CALbr=Lb2KSqYLg+19opHZJdhTGcuZCAtskxFFyibNBjuyRGUnw@mail.gmail.com>
Subject: Re: [PATCH] xen/blkback: Prevent missed completion when draining I/O
To: Jan Beulich <jbeulich@suse.com>
Cc: axboe@kernel.dk, linux-block@vger.kernel.org, konrad.wilk@oracle.com, 
	linux-kernel@vger.kernel.org, baijiaju1990@gmail.com, roger@xenproject.org, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-4011c0/1785403549-585CBCFC-E6277AA5/0/0
X-purgate-type: clean
X-purgate-size: 1280

On Thu, Jul 30, 2026 at 4:43=E2=80=AFPM Jan Beulich <jbeulich@suse.com> wro=
te:
>
> On 30.07.2026 10:40, Gui-Dong Han wrote:
> > --- a/drivers/block/xen-blkback/blkback.c
> > +++ b/drivers/block/xen-blkback/blkback.c
> > @@ -1021,6 +1021,13 @@ static void xen_blk_drain_io(struct xen_blkif_ri=
ng *ring)
> >       struct xen_blkif *blkif =3D ring->blkif;
> >
> >       atomic_set(&blkif->drain, 1);
> > +     /*
> > +      * Publish drain before checking inflight. Otherwise,
> > +      * xen_blkbk_unmap_and_respond_callback() can decrement inflight =
with
> > +      * atomic_dec_and_test() and still see drain =3D=3D 0 after this =
path saw
> > +      * inflight > 0, missing the completion.
> > +      */
> > +     smp_mb();
> >       do {
> >               if (atomic_read(&ring->inflight) =3D=3D 0)
> >                       break;
>
> Yet then don't we also need a barrier in xen_blkbk_unmap_and_respond_call=
back()'s
> check? Barriers almost always come in pairs, after all.

The matching barrier is already provided by atomic_dec_and_test(), which
is fully ordered.  It orders the inflight decrement before the following
drain read.

Thus, an additional barrier in
xen_blkbk_unmap_and_respond_callback() would be redundant.

Thanks.

