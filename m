Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF288C43458
	for <xen-devel@archiver.kernel.org>; Fri, 26 Jun 2026 15:07:48 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1346243.1604700 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wd89O-0002Ud-KF; Fri, 26 Jun 2026 15:07:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1346243.1604700; Fri, 26 Jun 2026 15:07:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wd89O-0002UW-H8; Fri, 26 Jun 2026 15:07:26 +0000
Received: by outflank-mailman (input) for mailman id 1346243;
 Fri, 26 Jun 2026 15:07:25 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <freddy77@gmail.com>) id 1wd89N-0002UQ-9V
 for xen-devel@lists.xenproject.org; Fri, 26 Jun 2026 15:07:25 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wd89M-00Gbcd-Ca
 for xen-devel@lists.xenproject.org; Fri, 26 Jun 2026 17:07:24 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a3e959f-e002-0a2a0a5209dd-0a2a4506df80-22
 for <xen-devel@lists.xenproject.org>; Fri, 26 Jun 2026 17:07:24 +0200
Received: from [74.125.224.47] (helo=mail-yx1-f47.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a3e95ab-08de-0a2a45060019-4a7de02fd4f6-3
 for <xen-devel@lists.xenproject.org>; Fri, 26 Jun 2026 17:07:24 +0200
Received: by mail-yx1-f47.google.com with SMTP id
 956f58d0204a3-662fa4a4470so1262079d50.0
 for <xen-devel@lists.xenproject.org>; Fri, 26 Jun 2026 08:07:23 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version"
ARC-Seal: i=1; a=rsa-sha256; t=1782486443; cv=none;
        d=google.com; s=arc-20260327;
        b=c3MLzg6ffOYX+Fz/oZ7Ls+QZDho6gkTonRbR591GVkj4BKUTMqN6w7X9k+Mi52uxaC
         QOIpuJlJ726b29cDi4GMitjC/pOjOszJ7JrgY7WWNCLqtp04AdzLuPmgT2UT2fJiNZcb
         VyDMHADPBv0KIEPTlH2nnrJw6YhDPHGSQ2KyOLz+YeoWesTcADjp49YL6ongRoXFNE0s
         izAU45S8zDEhz+hNljvRiJbcplIuGGMCT+m30PYUAKtQNvsAAjXOI4RtQr9xA79g9zXw
         Si1m0vdj+5+IbI0TAm1og+PpR7XUaLzpWpwoM0huIL4LQyThlL2xJw2Q8zESH34JJUxU
         TQkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Kk8iyG32hvChxbpiDFLzLYzsZZHXYFo2LAI2DSu4lnw=;
        fh=QI3tLj5CQG0QL/Oi+zkPuYY3Kh/8qf0tAE5qJavUS+U=;
        b=KjqZvU89Chkemm/E4F9LZoOCZzQSqyahZJQYaB7RRD2XBJFacQVErKZRgwW12DtYAy
         P2n5u02o8AghMG1VX1nUnS+YGOf6gA7qDix/Sh9mXl5ekMW4vS2qA32VqeHJY+9hMvCo
         /0MlttITW7a0Ni6J+sU0SMV/SNr4kRc4GFAaZleyRJwHNRCJtv6rNzKQX3e+yfld0DoY
         fgghW9uZw3Kv8z2syZkplm/cqfwwwqXDol1OxQhLvMHkNnMYsZDRBCQ+/DBGYCXndwoh
         OWLsN3vlHw6cCCqIbPY/Vz1Jf6G3nm6ZXuZBGPN9XwA9moNLImE7CpjaSRPCLQb2SitU
         oUIQ==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782486443; x=1783091243; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kk8iyG32hvChxbpiDFLzLYzsZZHXYFo2LAI2DSu4lnw=;
        b=ApFINtRRJzWsIOCQGLbn7vQaFzf7b11Ib0QCkwwj4IPC500M2M46PGREFk0KowsFar
         Cuu5CgC8V+oQ56TQDYi/0N3T7zR8RQd9xc16YpJXCYzC+U5RZDt0ut7dlSoXQRaNiM5C
         YwyN2wa0DAJcqmrEOLzzLcvwPSZJLS7tqwtust4F1ekPDqU6+DBia7pV8p7l033j8iWA
         +8868DVjZQ2z8hwpTmBmgaTb8geyC5plrpk8doWzEOA+MK9dY7j/7atfrBZ/EfeOJDhq
         KPNdIDNHpUwMKfVFtu7MLkA+GFYEv3QLfVij0uVKRS5Acs6nBsKi46F42geOFCgfWZTN
         5JEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782486443; x=1783091243;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Kk8iyG32hvChxbpiDFLzLYzsZZHXYFo2LAI2DSu4lnw=;
        b=JCxrDf2Vs10wYs35vZwCTit2HiJlIZmjkwrsPQJK0F9Kfu7i1JNEKPFAueHBy7uAnb
         2ntLzQXcdxa40qhBjJ7nPgbMs4ruCgfH5B+r0VK1SuHoAZ38SzF3OBjqaf+F0gXdcrHT
         LmsnwrrFXiV3BvpuYqhCj0SPLuo5MeaAP/vM4nMt3t48sbZpHIAg2DePBT/Cw2QSGP01
         GMC9UQRC6w/zii1GWVMh2pwDN9n4ZJHVB3xR50a8SNKiQq1IEvZa4p79cHhaIix1a9zF
         oGHdA3K7hLH1sc2AKTksTh+pmvY2U8PRtxHIoKXGK5nLH8c4xUQKEFv4deTcIV2sojRg
         O2TQ==
X-Forwarded-Encrypted: i=1; AHgh+RpMXL5YqbcAVeF0HItUQjZyLdfNFTzMs+ws95Nd5/DMFfL3dhv4hQ9Y3yJDAp2or1grR/xdF6ZNFK8=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx6Q9pmBc5So8+C6uwqlnzfMidi9eUsSwOxBsGetjoxcaFf/U95
	P7d6W0SxBIL6QMCjjW56fWMNbVKnO740bo9Kd77+Mh0yQcCKbQgbx2qBIipKzYZjJU+p49e2c51
	rVE2m+Nr1ljyrFOc2R/Pec2/1ApsO/cY=
X-Gm-Gg: AfdE7cncxrkzx7MN4+DmwbTXnInAS66TSs4j725pj2L8+bnTDcXJ6Z3HulgP+3nQUNJ
	u7kyXwZQCBScd9lNK2NI2aEiP9AJmBmsW6peqQHaMmZ1qknoBLsHD8gh24sw4Ggf52zfxOIPS6N
	64tsX+BSI0My5ukWd/WhAl7gi6ylEhJSkk7mg3P6RYWzTAFvUC5HtAS8uJqV7x+zXro7AnKle/W
	WnP0tbU5gr3LQ5vOTBkDiLTuhldmn9A2yHfrpB2iwHPEjy0j/pNZE3hdowCR55+y0GBoA709vw/
	GBo6IcFuqjMDwf+k/MfhlVt70iknZozTtA==
X-Received: by 2002:a05:690e:bce:b0:664:9306:fc52 with SMTP id
 956f58d0204a3-66493070da9mr4553246d50.4.1782486442655; Fri, 26 Jun 2026
 08:07:22 -0700 (PDT)
MIME-Version: 1.0
References: <20260430095521.8399-1-frediano.ziglio@cloud.com> <afMzlcrP7phSirsw@macbook.local>
In-Reply-To: <afMzlcrP7phSirsw@macbook.local>
From: Frediano Ziglio <freddy77@gmail.com>
Date: Fri, 26 Jun 2026 16:07:11 +0100
X-Gm-Features: AVVi8CccLeG3Jn8WdzOQq6NE_dGwtUWvus-WtAhOUVTsCF80eyqKuFuxYnCSIhI
Message-ID: <CAHt6W4cwh3tx4nZNmqe9TS8TFsQDsL4pYBEBz3qqX032Jmqf5g@mail.gmail.com>
Subject: Re: [PATCH] tools: Use posix_memalign instead of valloc for NetBSD
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: bouyer@antioche.eu.org, xen-devel@lists.xenproject.org, 
	Frediano Ziglio <frediano.ziglio@cloud.com>, Anthony PERARD <anthony.perard@vates.tech>, 
	Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-16d1c6/1782486444-4213F68D-6EF1956C/0/0
X-purgate-type: clean
X-purgate-size: 2015

On Thu, 30 Apr 2026 at 11:48, Roger Pau Monn=C3=A9 <roger.pau@citrix.com> w=
rote:
>
> Adding Manuel that maintains the NetBSD xen-tools package.
>
> On Thu, Apr 30, 2026 at 10:55:21AM +0100, Frediano Ziglio wrote:
> > More similar to other implementation.
> > posix_memalign was adde in NetBSD 8.0, released on July 17, 2018
> > and went out of support on May 4, 2024.
> >
> > Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
> > ---
> >  tools/include/xenctrl.h     | 5 +++++
> >  tools/libs/ctrl/xc_netbsd.c | 9 ++++++++-
> >  2 files changed, 13 insertions(+), 1 deletion(-)
> >
> > diff --git a/tools/include/xenctrl.h b/tools/include/xenctrl.h
> > index d5dbf69c89..f4316089e7 100644
> > --- a/tools/include/xenctrl.h
> > +++ b/tools/include/xenctrl.h
> > @@ -1390,6 +1390,11 @@ int xc_lockprof_query(xc_interface *xch,
> >                        uint64_t *time,
> >                        xc_hypercall_buffer_t *data);
> >
> > +/**
> > + * Allocate memory with a given alignment.
> > + * The alignment must be a power of 2 and at least sizeof(void*).
> > + * It returns NULL on error, errno is not set.
> > + */
> >  void *xc_memalign(xc_interface *xch, size_t alignment, size_t size);
> >
> >  /**
> > diff --git a/tools/libs/ctrl/xc_netbsd.c b/tools/libs/ctrl/xc_netbsd.c
> > index 1318d4d906..d27154dce9 100644
> > --- a/tools/libs/ctrl/xc_netbsd.c
> > +++ b/tools/libs/ctrl/xc_netbsd.c
> > @@ -60,7 +60,14 @@ void discard_file_cache(xc_interface *xch, int fd, i=
nt flush)
> >
> >  void *xc_memalign(xc_interface *xch, size_t alignment, size_t size)
> >  {
> > -    return valloc(size);
> > +    int ret;
> > +    void *ptr;
> > +
> > +    ret =3D posix_memalign(&ptr, alignment, size);
> > +    if (ret !=3D 0 || !ptr)
> > +        return NULL;
> > +
> > +    return ptr;
> >  }
> >
> >  int xc_pcidev_get_gsi(xc_interface *xch, uint32_t sbdf)
> > --
> > 2.43.0
> >

I saw Manuel reply almost 2 months ago.
Still pending.

Frediano

