Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BEB3CA5FA7
	for <xen-devel@archiver.kernel.org>; Tue, 29 Sep 2026 17:26:29 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1436664.1655356 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBbaj-0002Yv-SE; Tue, 29 Sep 2026 17:26:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1436664.1655356; Tue, 29 Sep 2026 17:26:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBbaj-0002Yo-OU; Tue, 29 Sep 2026 17:26:09 +0000
Received: by outflank-mailman (input) for mailman id 1436664;
 Tue, 29 Sep 2026 17:26:08 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <xakep.amatop@gmail.com>) id 1xBbah-0002Yi-SX
 for xen-devel@lists.xenproject.org; Tue, 29 Sep 2026 17:26:08 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xBbag-002XPD-JS
 for xen-devel@lists.xenproject.org; Tue, 29 Sep 2026 19:26:06 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6abbf492-bab6-0a2a0a5309dd-0a2a4504d1bc-28
 for <xen-devel@lists.xenproject.org>; Tue, 29 Sep 2026 19:26:06 +0200
Received: from [74.125.229.205] (helo=mail-lf2-f13.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6abbf4ae-b57f-0a2a45040019-4a7de5cda8e3-3
 for <xen-devel@lists.xenproject.org>; Tue, 29 Sep 2026 19:26:06 +0200
Received: by mail-lf2-f13.google.com with SMTP id
 2adb3069b0e04-5b79784a6edso4028959e87.1
 for <xen-devel@lists.xenproject.org>; Tue, 29 Sep 2026 10:26:06 -0700 (PDT)
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
ARC-Seal: i=1; a=rsa-sha256; t=1790702766; cv=none;
        d=google.com; s=arc-20260327;
        b=h97ehG50xBZMK3Fk/v04LBXGADDzb7+m8nEm0/ReWP8tb5aQyUThj19orkvQ9t8c+8
         9Olz9WK10gfGvUPLX3k9nsHqXpS9P05TtiPkJedR8rzISxfnvoGqJQOAj9ymI2BDWSaa
         t8iPxfncgjGZRw6HBhspgLpP/9Vka8JqpUhZEJiRZr0FmvNrY+MggPP5kieT+xezMGmG
         l6eMqrq5aEPVmHucYZRsz7dbd9APRQFEuPTcDtV78OKDdLZssSzkCFaC1D/JF1gGiQ2u
         iqA8nuGzWUD1tLQAmvsAAsxYARpKvUUgxhAk+/cxNRZ+2t9zA7p9movUEj+r7zJVWZeX
         27JA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mfVEEA+zzbIlCb2K+G5OZ9TxlLWINrq0E486oYeb0gQ=;
        fh=G8YuBHyJR9q91AksxLqFWOLENLkZ3yuzyZ8UDaRz44A=;
        b=EWR8yC2p6TFmjxcx2Do6vCgTMXfCoU8rB3yfWLxzjQSsDh6h27++OfLgsPOBU6UfPD
         EVkHFqYdzXuzndRcv1HpOTP7iSLT/p58klc29l664/qpN85VgT7RX266slKuBU8YizqI
         wGultauchQlJ6WgZndSpMbCgLIiHO6X8d2f8nrY4in6tfgqEgCPFplFNnX1VNTmVmkDU
         BE0Heb0bW1d9I6gxH1cs2urrq6g5SlKZ1euxW4mNJsTqxLBkl5IPO8XLk36SrNOoaYLE
         oLS4/+lfssR2D64KhBmCKmbtVdsS8n37vXvN76SH7e7BoLvDSkPRzIY1YNYhD4HLXS6q
         Szrg==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790702766; x=1791307566; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mfVEEA+zzbIlCb2K+G5OZ9TxlLWINrq0E486oYeb0gQ=;
        b=b1ZzWsSSdjeU7JHnfwLx5s72lAVQmvg9KCqWjZ/2XWnKEpPkVNXE0McRIyCX4NPoqq
         NzD+K0ozKWKJqpK9+7WinbYX9LynGctMGPGpZyuUO3fDtaBiZ1Os41eMkddc6cfqQZqe
         l6gXMJXRHHjpahMdEoUMz2W5mYsMPUWVhjuakhnRnRxWvLZLOxc7rJ16rkj1HakBp1RF
         nm+KsEH2p5mRBcJn3Y6+NgANPDEqfHC17AJPHGYL7YwQtuuyj6VauMIrIJ52wv8iOioi
         Td/uZ+mPJdlzuHVrb5NCQmv8toFJSf2y6mB0M+E9FSpGLc5xwLgVTVZzY+vXbadZI9zJ
         E1gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790702766; x=1791307566;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mfVEEA+zzbIlCb2K+G5OZ9TxlLWINrq0E486oYeb0gQ=;
        b=obKZ1p5r9xeuvSrdfVOHkRqYOmZwIGWkbhJhZXYCiYiUZ4EMJhl/SeSUBwSrrXKzdI
         YMpbtHdtIc5Y6YyuDTegBfhVgVaY+3KaV9NdAzsUrlvTxTr4zdWxxpwIRUymlIGuG03S
         ZB90l1cvGFgHReWS3Eba3IWXakttL0HTid9oHix5cHFeHNNsvy4hepRcIPpVoeNs2z4j
         bgn2YYHtbIEqLZuDU8LKlLQkrb9Xd2MXjsWq2EvWAmf2TnI0VdF8MOMgmcVSTC+rYHUX
         GbbQH6VBf8dpWX1lIeykRR9YQX9AKqmZ5rXcSt+kqbi9qW8TNZxtUmpjCPDTIo8+zERv
         QkMw==
X-Forwarded-Encrypted: i=1; AKwUvBxXnB3Ew0d4ipuJz8LswHjv5erv6L8McFzpm+8xucLVlUYsYM0eMjbyzeRuRFwZfuF8dzw9c7oVyo8=@lists.xenproject.org
X-Gm-Message-State: AFq9FYJxJXeyoYk6zj1PsTmcKoW6ogzlLi0X5Piqx8u7H3zhIEVLGZ51
	kbHqZF31lmpOatnZ/7Cv9xMrwAPW17rUZ3lmXaIU7jAwhXwsjYD2NFr79LecPPE1nQCWtrQfp6o
	vjV8H85/ZqR6hp3vj0Lvfu46kK7emZgA=
X-Gm-Gg: AYBFou1DzE/2c9WbM2mR4xnqRez32qx4orLoOu/oONhBmi4NUUSfFkuZdNK4Ec5ipqH
	+Zf7BeQ3NXYY4dxBdZb4F/pTO06+I/TdXnd7NrpCH1KN83opkhhI/2r9xQ+g40yo46sVbbnmIqt
	zMPpwy1gbk+Xi3TP6CXUThLx4eMi/bcvIc937Kq0ccBdshKM1dDJ1CzHfP014MjT8b7nWMWRXe4
	jVmAj1REvZdHBEYlG8nC4fUmS62P6uPRozF8wcJed/6Xl/IMPZ0+MMXpmYIFYcgphs+zFJjtUqe
	XRyJBOIq4oepARcCUEXG3vi9v4KGTDnK5KcJ+IXxZy+m3i+0kmOTxA==
X-Received: by 2002:a05:6512:2210:b0:5b8:eb98:9bf8 with SMTP id
 2adb3069b0e04-5ba3bf0f4e4mr63011e87.56.1790702765508; Tue, 29 Sep 2026
 10:26:05 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1790089161.git.mykola_kvach@epam.com> <e93b497d55dbfeb2aaaa9ff4b55b8925f902d395.1790089161.git.mykola_kvach@epam.com>
 <8733v06dsq.fsf@epam.com> <CAGeoDV9fO1-snJTxez1bjiiRDmhzBrrRBy+HBLfBO51v4Xdt9A@mail.gmail.com>
 <87mrt5z0l8.fsf@epam.com>
In-Reply-To: <87mrt5z0l8.fsf@epam.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Tue, 29 Sep 2026 20:25:52 +0300
X-Gm-Features: AclHuK_2QGtTpULVrX3evEo4anBb9npMGr_CGadT9atWg-B30YYmWDU1Hk1jo8g
Message-ID: <CAGeoDV8-GXR7d=zX8ub3mWA2gt+cd88GygaiB=5azA=p609vqQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] xen/arm: its: initialize host LPI state before
 activating ITSes
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: Mykola Kvach <Mykola_Kvach@epam.com>, 
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-ebf023/1790702766-C3CC7B50-16642F6B/0/0
X-purgate-type: clean
X-purgate-size: 5273

On Fri, Sep 25, 2026 at 8:45=E2=80=AFPM Volodymyr Babchuk
<Volodymyr_Babchuk@epam.com> wrote:
>
> Hi Mykola,
>
> Mykola Kvach <xakep.amatop@gmail.com> writes:
>
> > Hi Volodymyr,
> >
> > Thank you for the review.
> >
> > On Wed, Sep 23, 2026 at 2:56=E2=80=AFAM Volodymyr Babchuk
> > <Volodymyr_Babchuk@epam.com> wrote:
> >>
> >> Hi Mykola,
> >>
> >> Mykola Kvach <mykola_kvach@epam.com> writes:
> >>
> >> > The boot CPU pending table must use the memory attributes selected b=
y
> >> > ITS quirks. gicv3_lpi_init_host_lpis() is therefore called after
> >> > gicv3_its_init(). However, gicv3_its_init() also programs and enable=
s
> >> > each ITS before host LPI state is allocated. No ITS commands are
> >> > submitted at that point, but this ordering relies on that implementa=
tion
> >> > detail.
> >> >
> >> > Split per-ITS initialization into preparation and activation phases.
> >> > First map and disable every ITS and collect its quirks. Then initial=
ize
> >> > host LPI state. Only after that, allocate and program the ITS tables=
 and
> >> > command queue, and enable each ITS.
> >> >
> >> > The subsequent gicv3_cpu_init() sequence remains unchanged: it progr=
ams
> >> > the Redistributor LPI tables, enables LPIs, and then submits the fir=
st
> >> > MAPC and SYNC commands.
> >> >
> >> > Suggested-by: Julien Grall <julien@xen.org>
> >> > Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
> >> > ---
> >> > Changes in v3:
> >> > - New patch implementing the post-4.22 initialization order discusse=
d
> >> >   during review of the ordering fix.
> >> >
> >> > Link: https://patchew.org/Xen/341edd8de63dcd84ccc6e7b6c03e9e8fc71051=
84.1781847061.git.mykola._5Fkvach@epam.com/
> >> > ---
> >> >  xen/arch/arm/gic-v3-its.c             | 32 ++++++++++++++++++++++--=
---
> >> >  xen/arch/arm/gic-v3.c                 | 15 ++-----------
> >> >  xen/arch/arm/include/asm/gic_v3_its.h |  4 ++--
> >> >  3 files changed, 31 insertions(+), 20 deletions(-)
> >> >
> >> > diff --git a/xen/arch/arm/gic-v3-its.c b/xen/arch/arm/gic-v3-its.c
> >> > index 325835b0ad..972825bf06 100644
> >> > --- a/xen/arch/arm/gic-v3-its.c
> >> > +++ b/xen/arch/arm/gic-v3-its.c
> >> > @@ -11,6 +11,7 @@
> >> >  #include <xen/lib.h>
> >> >  #include <xen/delay.h>
> >> >  #include <xen/iocap.h>
> >> > +#include <xen/init.h>
> >> >  #include <xen/libfdt/libfdt.h>
> >> >  #include <xen/mm.h>
> >> >  #include <xen/rbtree.h>
> >> > @@ -549,10 +550,9 @@ static int gicv3_disable_its(struct host_its *h=
w_its)
> >> >      return -ETIMEDOUT;
> >> >  }
> >> >
> >> > -static int gicv3_its_init_single_its(struct host_its *hw_its)
> >> > +static int __init gicv3_its_prepare_single_its(struct host_its *hw_=
its)
> >> >  {
> >> > -    uint64_t reg;
> >> > -    int i, ret;
> >> > +    int ret;
> >> >
> >> >      hw_its->its_base =3D ioremap_nocache(hw_its->addr, hw_its->size=
);
> >> >      if ( !hw_its->its_base )
> >> > @@ -564,6 +564,14 @@ static int gicv3_its_init_single_its(struct hos=
t_its *hw_its)
> >> >
> >> >      gicv3_its_enable_quirks(hw_its);
> >> >
> >> > +    return 0;
> >> > +}
> >> > +
> >> > +static int __init gicv3_its_init_single_its(struct host_its *hw_its=
)
> >> > +{
> >> > +    uint64_t reg;
> >> > +    int i, ret;
> >> > +
> >> >      reg =3D readq_relaxed(hw_its->its_base + GITS_TYPER);
> >> >      hw_its->devid_bits =3D GITS_TYPER_DEVICE_ID_BITS(reg);
> >> >      hw_its->evid_bits =3D GITS_TYPER_EVENT_ID_BITS(reg);
> >> > @@ -1189,7 +1197,7 @@ static void gicv3_its_acpi_init(void)
> >> >
> >> >  #endif
> >> >
> >> > -int gicv3_its_init(void)
> >> > +int __init gicv3_its_init(unsigned int host_lpi_bits)
> >> >  {
> >> >      struct host_its *hw_its;
> >> >      int ret;
> >> > @@ -1201,13 +1209,27 @@ int gicv3_its_init(void)
> >> >
> >> >      list_for_each_entry(hw_its, &host_its_list, entry)
> >> >      {
> >> > -        ret =3D gicv3_its_init_single_its(hw_its);
> >> > +        ret =3D gicv3_its_prepare_single_its(hw_its);
> >> >          if ( ret )
> >> >              return ret;
> >> >      }
> >> >
> >> >      gicv3_its_validate_quirks();
> >> >
> >> > +    if ( list_empty(&host_its_list) )
> >> > +        return 0;
> >>
> >> What is the purpose of this check here? I'd expect to see it before th=
e
> >> first list_for_each_entry() loop.
> >
> > The check skips host LPI initialization when no host ITS is present,
> > preserving the existing behavior. Xen currently does not support LPIs
> > without an ITS.
>
> This does not answer why you need to run list_for_each_entry() loop. I
> understand that it will not loop and then you will just call
> gicv3_its_validate_quirks(), which also will do nothing. This is why I
> am asking, why not move this if() check right before the loop?
>
> > gicv3_its_validate_quirks() already checks for an empty list, so the
> > current placement does not cause a functional issue. The following
> > patch also removes that function and its call.
> >
> > Would you be OK with keeping the current placement?
>
> I think it will be more sensible to have this check before the
> loop. Unless I miss something, of course.

Ack.

Best regards,
Mykola

