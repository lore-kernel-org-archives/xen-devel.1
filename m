Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3654C98304
	for <xen-devel@archiver.kernel.org>; Thu, 24 Sep 2026 05:02:35 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1431701.1653530 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9baq-0005FW-C6; Thu, 24 Sep 2026 05:02:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1431701.1653530; Thu, 24 Sep 2026 05:02:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9baq-0005FP-9Q; Thu, 24 Sep 2026 05:02:00 +0000
Received: by outflank-mailman (input) for mailman id 1431701;
 Thu, 24 Sep 2026 05:01:58 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <xakep.amatop@gmail.com>) id 1x9bao-0005FA-Pd
 for xen-devel@lists.xenproject.org; Thu, 24 Sep 2026 05:01:58 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x9bao-004xEB-6V
 for xen-devel@lists.xenproject.org; Thu, 24 Sep 2026 07:01:58 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6ab4aebc-e002-0a2a0a5209dd-0a2a450ab518-34
 for <xen-devel@lists.xenproject.org>; Thu, 24 Sep 2026 07:01:58 +0200
Received: from [74.125.229.205] (helo=mail-lf2-f13.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6ab4aec5-f2d2-0a2a450a0019-4a7de5cdc741-3
 for <xen-devel@lists.xenproject.org>; Thu, 24 Sep 2026 07:01:58 +0200
Received: by mail-lf2-f13.google.com with SMTP id
 2adb3069b0e04-5b8d879752fso1288247e87.2
 for <xen-devel@lists.xenproject.org>; Wed, 23 Sep 2026 22:01:58 -0700 (PDT)
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
ARC-Seal: i=1; a=rsa-sha256; t=1790226117; cv=none;
        d=google.com; s=arc-20260327;
        b=PbTKba2pxmo+y2nISFVrKCgadXftlO7bssArNA96/wLP1s4LbL2Gd20fQDwsy11Wv3
         2FFAOtX0lrQWKino/f27/0xU1vlYAb/xBIk909dql/ClERPLoCP2iX7Qtc1zLG3X+N1H
         sFRW33FAhEmRXAD0SJxKIZQE982MgyZhK6M0NXnpDC/DdspdlK6dEfLfxleExmkK1fje
         Oi8KwNoIF3+4060p/X+G9Yu2hMsE1nlVpjtmWeQCYGBQha0zF3g8GR3qYZjLJsGFRQFA
         xTMYCXjyhQY76oP39FPgu+HqpRbuP3d79Ef3WmKxsG1pI2GE8ZeOkkJmG2xqrVIgncBA
         VFbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2mnbVlKRorQRSy5N3Z5eLtpxA0WRkYE15BxZ7PKgfkk=;
        fh=0G2tH5PBgxhvCknJO5iqQp8yODac/UClzeeXE6wufUo=;
        b=GR/swS2Z65CZFqvFHlh+a1OKCjbf/zWnvebqt//PeUO6OxFQON2q1c98h3Jx+3V8Xl
         oAdfQe7oL0CIfmYN9xzZgghiRFDvQKSYr6gRlheu0YWUO44cysNkjN0FYC9KIXBqTUOa
         whJA6Kp1jUwT/+hhkSF10v+CjtJNlAVoP8JLj9werELeCigvA+5Uf0aJal11uMSgpmSm
         5qNccORfzbf4R/z1HzM/FbvkcQ75qGFGG4fDnYrjTrCWfE7FUZQaB6s93PgVa+87Fpe6
         Y2TQqB1VhhXISV/67Ei4UqukIrJb/K/mHvqUE1nslJ0mjgtKGlly/LUj1QA/rATCTcCx
         Oxkw==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790226117; x=1790830917; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2mnbVlKRorQRSy5N3Z5eLtpxA0WRkYE15BxZ7PKgfkk=;
        b=ln5gvhPWa8ChzsaPOJ1Wznn0UBM0wsgXQMYnMVMrolTWI7sR5uZkv4QCKtmRETV9rL
         v660OJAeK8gPYJJJ0Rmw8kVfqvOrA8xqyKtLQiO6k+9vt8f37OCkoKTTzxxLPp1WtAya
         s2VWu+BM27G7+io2FOh4kvK9Eh4urBjKnYE5pntO+Ka6Q+6TbAwzQTX/NdofU/ntBaKQ
         fa4r2FocVNRsOqNjD9+B8CDDoO+LS3F0XHHszjT3MxXPZJaS9cEu1faHHU52KWSMi9WQ
         t2+MtCmUT+TakwlKtU06vqiwUdBNVRU8VG648kNVx4/mmN3o4AkTrOfm+jUhM41URfMS
         M+/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790226117; x=1790830917;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2mnbVlKRorQRSy5N3Z5eLtpxA0WRkYE15BxZ7PKgfkk=;
        b=huc1tni7PBiqQ0jgulyUO+8L7t1IyaLoglfwgBoQRuUrVFQBYiadmhweR2TUZliBhZ
         Tv6cFOzsGz8CUhMfXfeeBUe7kYLQI0HRS+FoOHztI6xvPyfhwyCskuSVhxTtLT4uyJiD
         CdUY1BMAkF1FjG3lMkS1XQdwOAqX5gtkkCSrCPRkUhhdOLCRAUQ5DL5O3WcmsBvB0Mwj
         lS5xlRV/MkS9TE5jImzYcofZ5KTKNNwTix4JnM89tIPImc8pJPxNhPJLuoyQgfh1uyzs
         U1tAaOADBf7R/cMo9eT/fxTZIvK7e1vfsrZteJ73x4+Zpyk+Dl6XPA5lerL8d3qVlx/c
         7Rcw==
X-Forwarded-Encrypted: i=1; AKwUvBx1YnXO/GPsy9Lad7PYPb6NwBWEfMhNtmW8ZmE/fo8YHhlIFJFxF8Z5kV/wkoLc++Sq/Mt3iSuV9/M=@lists.xenproject.org
X-Gm-Message-State: AFuF++nLxWP2lEDzU7MHZcrV9H2UVdyA1lSkVoPV0UdYxWErInPxD8Wb
	zr3jT0tbqmS8tBA2xQd2tPQXLDTRpxP8egEo+nia6RBzMKPf/alUf4HR8ZulyF8fD45mc2Ttekb
	Ih1YlWILtLHiyPIt3PhMd6NIeHeLvtNg=
X-Gm-Gg: AYBFou0Hj4E4GIFl1vjS8et3T1S1sE0N6ljBs+NAutlf4k9w/g5pvIkqhNm3j0ud8up
	XP9rpJjD/HFYHlkSMa5eYtmFV6oBB0I+xSoapEcUSrX+UrgbOZSoYN89KXNTkpNwpXOEkjYhehc
	X46AaMD6rIGmJ4qb37lsPiIIpJWR/ntD1nVq7cfLmAtFCwxCdtXy7j8rW6CS4wPlBNe8fT8WHsD
	pCPwDTz8MuqeZ063KkCWhNlIg1SntmBvyIJo7khlrhBSUfWFL6zEpakaFUgT2mtwdksskjtxuY5
	M49Q8SHtZ53kQV5iTX1FolzqT2blPKPz6+HdEh3g6FSBY9rmRmrbpA==
X-Received: by 2002:a05:6512:3f06:b0:5b6:1a7c:27 with SMTP id
 2adb3069b0e04-5b8df06f8e1mr398950e87.42.1790226117211; Wed, 23 Sep 2026
 22:01:57 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1790089161.git.mykola_kvach@epam.com> <e93b497d55dbfeb2aaaa9ff4b55b8925f902d395.1790089161.git.mykola_kvach@epam.com>
 <8733v06dsq.fsf@epam.com>
In-Reply-To: <8733v06dsq.fsf@epam.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Thu, 24 Sep 2026 08:00:00 +0300
X-Gm-Features: AclHuK9rXx9yFmvPE8x1dn9SXmywgcknbuSLdHGbgZMoTKwO5yVFP6WYCPjIx6k
Message-ID: <CAGeoDV9fO1-snJTxez1bjiiRDmhzBrrRBy+HBLfBO51v4Xdt9A@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] xen/arm: its: initialize host LPI state before
 activating ITSes
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: Mykola Kvach <Mykola_Kvach@epam.com>, 
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-4011c0/1790226118-524DFCFC-EA00DBC3/0/0
X-purgate-type: clean
X-purgate-size: 4312

Hi Volodymyr,

Thank you for the review.

On Wed, Sep 23, 2026 at 2:56=E2=80=AFAM Volodymyr Babchuk
<Volodymyr_Babchuk@epam.com> wrote:
>
> Hi Mykola,
>
> Mykola Kvach <mykola_kvach@epam.com> writes:
>
> > The boot CPU pending table must use the memory attributes selected by
> > ITS quirks. gicv3_lpi_init_host_lpis() is therefore called after
> > gicv3_its_init(). However, gicv3_its_init() also programs and enables
> > each ITS before host LPI state is allocated. No ITS commands are
> > submitted at that point, but this ordering relies on that implementatio=
n
> > detail.
> >
> > Split per-ITS initialization into preparation and activation phases.
> > First map and disable every ITS and collect its quirks. Then initialize
> > host LPI state. Only after that, allocate and program the ITS tables an=
d
> > command queue, and enable each ITS.
> >
> > The subsequent gicv3_cpu_init() sequence remains unchanged: it programs
> > the Redistributor LPI tables, enables LPIs, and then submits the first
> > MAPC and SYNC commands.
> >
> > Suggested-by: Julien Grall <julien@xen.org>
> > Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
> > ---
> > Changes in v3:
> > - New patch implementing the post-4.22 initialization order discussed
> >   during review of the ordering fix.
> >
> > Link: https://patchew.org/Xen/341edd8de63dcd84ccc6e7b6c03e9e8fc7105184.=
1781847061.git.mykola._5Fkvach@epam.com/
> > ---
> >  xen/arch/arm/gic-v3-its.c             | 32 ++++++++++++++++++++++-----
> >  xen/arch/arm/gic-v3.c                 | 15 ++-----------
> >  xen/arch/arm/include/asm/gic_v3_its.h |  4 ++--
> >  3 files changed, 31 insertions(+), 20 deletions(-)
> >
> > diff --git a/xen/arch/arm/gic-v3-its.c b/xen/arch/arm/gic-v3-its.c
> > index 325835b0ad..972825bf06 100644
> > --- a/xen/arch/arm/gic-v3-its.c
> > +++ b/xen/arch/arm/gic-v3-its.c
> > @@ -11,6 +11,7 @@
> >  #include <xen/lib.h>
> >  #include <xen/delay.h>
> >  #include <xen/iocap.h>
> > +#include <xen/init.h>
> >  #include <xen/libfdt/libfdt.h>
> >  #include <xen/mm.h>
> >  #include <xen/rbtree.h>
> > @@ -549,10 +550,9 @@ static int gicv3_disable_its(struct host_its *hw_i=
ts)
> >      return -ETIMEDOUT;
> >  }
> >
> > -static int gicv3_its_init_single_its(struct host_its *hw_its)
> > +static int __init gicv3_its_prepare_single_its(struct host_its *hw_its=
)
> >  {
> > -    uint64_t reg;
> > -    int i, ret;
> > +    int ret;
> >
> >      hw_its->its_base =3D ioremap_nocache(hw_its->addr, hw_its->size);
> >      if ( !hw_its->its_base )
> > @@ -564,6 +564,14 @@ static int gicv3_its_init_single_its(struct host_i=
ts *hw_its)
> >
> >      gicv3_its_enable_quirks(hw_its);
> >
> > +    return 0;
> > +}
> > +
> > +static int __init gicv3_its_init_single_its(struct host_its *hw_its)
> > +{
> > +    uint64_t reg;
> > +    int i, ret;
> > +
> >      reg =3D readq_relaxed(hw_its->its_base + GITS_TYPER);
> >      hw_its->devid_bits =3D GITS_TYPER_DEVICE_ID_BITS(reg);
> >      hw_its->evid_bits =3D GITS_TYPER_EVENT_ID_BITS(reg);
> > @@ -1189,7 +1197,7 @@ static void gicv3_its_acpi_init(void)
> >
> >  #endif
> >
> > -int gicv3_its_init(void)
> > +int __init gicv3_its_init(unsigned int host_lpi_bits)
> >  {
> >      struct host_its *hw_its;
> >      int ret;
> > @@ -1201,13 +1209,27 @@ int gicv3_its_init(void)
> >
> >      list_for_each_entry(hw_its, &host_its_list, entry)
> >      {
> > -        ret =3D gicv3_its_init_single_its(hw_its);
> > +        ret =3D gicv3_its_prepare_single_its(hw_its);
> >          if ( ret )
> >              return ret;
> >      }
> >
> >      gicv3_its_validate_quirks();
> >
> > +    if ( list_empty(&host_its_list) )
> > +        return 0;
>
> What is the purpose of this check here? I'd expect to see it before the
> first list_for_each_entry() loop.

The check skips host LPI initialization when no host ITS is present,
preserving the existing behavior. Xen currently does not support LPIs
without an ITS.

gicv3_its_validate_quirks() already checks for an empty list, so the
current placement does not cause a functional issue. The following
patch also removes that function and its call.

Would you be OK with keeping the current placement?

Best regards,
Mykola

