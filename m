Return-Path: <SRS0=XBwx=7A=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71F46C433DF
	for <xen-devel@archiver.kernel.org>; Mon, 18 May 2020 15:21:09 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 42B2020758
	for <xen-devel@archiver.kernel.org>; Mon, 18 May 2020 15:21:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="uD6ltweu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 42B2020758
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jahZP-0003YB-6a; Mon, 18 May 2020 15:20:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tJLm=7A=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1jahZO-0003Y6-MZ
 for xen-devel@lists.xenproject.org; Mon, 18 May 2020 15:20:46 +0000
X-Inumbo-ID: 25118742-991b-11ea-ae69-bc764e2007e4
Received: from mail-lj1-x241.google.com (unknown [2a00:1450:4864:20::241])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 25118742-991b-11ea-ae69-bc764e2007e4;
 Mon, 18 May 2020 15:20:46 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id f18so10275508lja.13
 for <xen-devel@lists.xenproject.org>; Mon, 18 May 2020 08:20:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=wWiHQi0e8L74KHAj4JXZmCf/pFA8Cj68yED+D3NeSlU=;
 b=uD6ltweur65jVLAF9t2IdoxK5L9t65GlPCc3yYB+ynPcU380gq3ZeGLw6T+BW8qMy2
 erJhrOK5g5Cy25ft4Sq7Wb/J7U6ClU6bD4v2mUgEfM3TAURf9SYHQhGcTMw00CpVu+/T
 puHDcUEyoNYgRn28B8bQ5bvwOjlCea85ZuBQhw03tHhmnTNWg/v/LN1GdjsoMYRNLmHA
 6+pNrsUxEc+iobBpvS2B7n/SB/XkVhvbWyWMF+jKKg3cId+CNp/fp5p/jQd9dsOGdE3l
 4He3iZ8xuDBlTHUEB/UAThNRey/SNolQDrYCTVePvd5udjW6SGQocRwRcF9apojNKcii
 dH3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=wWiHQi0e8L74KHAj4JXZmCf/pFA8Cj68yED+D3NeSlU=;
 b=MljNvMPNzoKIs/FuNv4CC1rPoJXGoR4rh3wlEMISkjWXTvR96xniQ9ksxc0jFdzSTg
 B8jtXqCyWbPGA08QPqIfhQFM5xpe+9LId3K3KjVffuS10VEcXUsb+KNovLXRbCEmOn3T
 3xB4P+gdu7avjPL8ThfPmkt7PAARbYhWreP8TPVrLwO37vYf2vVH12W6dXycwi7Ig/lp
 mAXfT8UPx1a5AdXBprmHZIR39/pfpoU/abD8Ll+JTXCHwB419Lf1dhwulA3NLlQcINa5
 3YaAfzQ/giTAGTYEtQFneF/C1DuGJfH1afQPO70AIPdLB/h8/F5OHWYELbe1HGJgUVG2
 PnWA==
X-Gm-Message-State: AOAM532dQ3JJNfrFxECh/QVLt5B2v11z02GGC/wO81ajhp030YuH4Wys
 /T3/tQ9Wq9ZawUs0oPUgXnP17FQFkRbsHwGGw9E=
X-Google-Smtp-Source: ABdhPJzQdtnUfUFxI4mg6gUm5vDxHpfy43carulanlXtFGZd1FwsbkOhOXW6OrCq3sn7ucCZqYRWDnuxiFdxJYGTR50=
X-Received: by 2002:a2e:9b10:: with SMTP id u16mr1805008lji.210.1589815244483; 
 Mon, 18 May 2020 08:20:44 -0700 (PDT)
MIME-Version: 1.0
References: <20200518011353.326287-1-jandryuk@gmail.com>
 <20200518011353.326287-7-jandryuk@gmail.com>
 <24258.39310.574582.176081@mariner.uk.xensource.com>
In-Reply-To: <24258.39310.574582.176081@mariner.uk.xensource.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Mon, 18 May 2020 11:20:33 -0400
Message-ID: <CAKf6xpueM5BXd0ivDHHpq2oRo_T1Uh+zMF0TrrV5u5dVR8DiLQ@mail.gmail.com>
Subject: Re: [PATCH v6 06/18] libxl: write qemu arguments into separate
 xenstore keys
To: Ian Jackson <ian.jackson@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Anthony Perard <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Wei Liu <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Mon, May 18, 2020 at 10:20 AM Ian Jackson <ian.jackson@citrix.com> wrote=
:
>
> Jason Andryuk writes ("[PATCH v6 06/18] libxl: write qemu arguments into =
separate xenstore keys"):
> > From: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.com>
> ...
> > +static int libxl__write_stub_linux_dm_argv(libxl__gc *gc,
> > +                                           int dm_domid, int guest_dom=
id,
> > +                                           char **args)
> > +{
>
> Thanks for the changes.
>
> > +    xs_transaction_t t =3D XBT_NULL;
> ...
> > +    rc =3D libxl__xs_read_mandatory(gc, XBT_NULL,
> > +                                  GCSPRINTF("/local/domain/%d/vm", gue=
st_domid),
> > +                                  &vm_path);
> > +    if (rc)
> > +        return rc;
>
> I think this should be "goto out".  That conforms to standard libxl
> error handling discipline and avoids future leak bugs etc.
> libxl__xs_transaction_abort is a no-op with t=3D=3DNULL.
>
> Also, it is not clear to me why you chose to put this outside the
> transaction loop.  Can you either put it inside the transaction loop,
> or produce an explanation as to why this approach is race-free...

I just matched the old code's transaction only around the write.  "vm"
shouldn't change during runtime, but I can make the changes as you
suggest.

-Jason

