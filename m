Return-Path: <SRS0=ZsuC=B5=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E702C433E3
	for <xen-devel@archiver.kernel.org>; Wed, 19 Aug 2020 10:52:29 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E5A052076E
	for <xen-devel@archiver.kernel.org>; Wed, 19 Aug 2020 10:52:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="N4qyO5EV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E5A052076E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=invisiblethingslab.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k8LhO-0003y0-AS; Wed, 19 Aug 2020 10:52:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tsRI=B5=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1k8LhM-0003xv-D3
 for xen-devel@lists.xenproject.org; Wed, 19 Aug 2020 10:52:04 +0000
X-Inumbo-ID: 10864455-789a-4fa5-a8d8-93fd3925181c
Received: from wout4-smtp.messagingengine.com (unknown [64.147.123.20])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 10864455-789a-4fa5-a8d8-93fd3925181c;
 Wed, 19 Aug 2020 10:52:03 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 210884D6;
 Wed, 19 Aug 2020 06:52:02 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Wed, 19 Aug 2020 06:52:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=cbw57/
 KKaayG8iK+SYPqiQPgZDltKLmJKvOXUN8KeDk=; b=N4qyO5EVZR+UUwvnFNBEyN
 rv9tnM5lpVrRXNEB7JnZh85sU+nntAY0DelogapX1oefshLPSs2TTTcjfSdIYL4w
 SkHk6YeUVghI/JcIsOxSwXSBGMP1bUQTvqclW/6lL5coFoQt/qkbXjEG7EPX3irg
 UBG/pSBuHUs78udKDzx9fVtuwzzx9xXSyc6yiz3uVqDhpOOXrWhTaZ2+gXCQLXw6
 KyEKnX1O9h6eSIJ4+F2ZslW8V3HHBcGzgmb+Izx3SP8dUCufPJgox7Qf4DMKYQU4
 V+P1krdFKAZg2pAJDwjMpRbwcYqt5/P3FZbVZSfZtKaIiRyLnp/YzIx8eyEySHVg
 ==
X-ME-Sender: <xms:UQQ9X4wEo4PvkQ-dl10tXPkp0kq0BzaJBJIe-Ex63matlephL3-1gA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedruddtkedgvdehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghk
 ucforghrtgiihihkohifshhkihdqiferrehrvggtkhhiuceomhgrrhhmrghrvghksehinh
 hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepuddv
 jeekieelgfeljefgjeelffefleduheehvdehfeehffeuveejvdevveeufeehnecukfhppe
 eluddrieegrddujedtrdekleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhep
 mhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrg
 gsrdgtohhm
X-ME-Proxy: <xmx:UQQ9X8TThGMGyGBO4GvJM0-OGggGyQO9cXMNP0XnUnan6Y_EZXS4_A>
 <xmx:UQQ9X6Wa4N2QnoZi7Onlq22dZuopczYuqIuZ-Y8UkGm6d9mlEvajQw>
 <xmx:UQQ9X2iCkS7287Fk0eHfOtLhlcoUGn3mWwSrjqGxP4PvqnxlhqkuiQ>
 <xmx:UQQ9X1qHJhc_E-uBqIU5u6aFFkCy6QVsh9fY6SW-JzW1DcuRvxJ0Ig>
Received: from mail-itl (ip5b40aa59.dynamic.kabel-deutschland.de
 [91.64.170.89])
 by mail.messagingengine.com (Postfix) with ESMTPA id BEFAD3280060;
 Wed, 19 Aug 2020 06:52:00 -0400 (EDT)
Date: Wed, 19 Aug 2020 12:51:57 +0200
From: Marek Marczykowski-G??recki <marmarek@invisiblethingslab.com>
To: Ian Jackson <ian.jackson@citrix.com>
Cc: Elliott Mitchell <ehem+xen@m5p.com>, xen-devel@lists.xenproject.org,
 Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH 2/2] libxl: fix -Werror=stringop-truncation in
 libxl__prepare_sockaddr_un
Message-ID: <20200819105157.GP1626@mail-itl>
References: <20200819020036.599065-1-marmarek@invisiblethingslab.com>
 <20200819020036.599065-2-marmarek@invisiblethingslab.com>
 <20200819034356.GA29116@mattapan.m5p.com>
 <20200819094123.GO1626@mail-itl>
 <24380.65377.44583.51170@mariner.uk.xensource.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="udOl8koJG4PSVcOF"
Content-Disposition: inline
In-Reply-To: <24380.65377.44583.51170@mariner.uk.xensource.com>
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--udOl8koJG4PSVcOF
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 2/2] libxl: fix -Werror=stringop-truncation in
 libxl__prepare_sockaddr_un

On Wed, Aug 19, 2020 at 11:30:57AM +0100, Ian Jackson wrote:
> Marek Marczykowski-G??recki writes ("Re: [PATCH 2/2] libxl: fix -Werror=
=3Dstringop-truncation in libxl__prepare_sockaddr_un"):
> > On Tue, Aug 18, 2020 at 08:43:56PM -0700, Elliott Mitchell wrote:
> > > On Wed, Aug 19, 2020 at 04:00:36AM +0200, Marek Marczykowski-G??recki=
 wrote:
> > > > diff --git a/tools/libxl/libxl_utils.c b/tools/libxl/libxl_utils.c
> > > > index f360f5e228..b039143b8a 100644
> > > > --- a/tools/libxl/libxl_utils.c
> > > > +++ b/tools/libxl/libxl_utils.c
> > >=20
> > >=20
> > > >      }
> > > >      memset(un, 0, sizeof(struct sockaddr_un));
> > > >      un->sun_family =3D AF_UNIX;
> > > > -    strncpy(un->sun_path, path, sizeof(un->sun_path));
> > > > +    strncpy(un->sun_path, path, sizeof(un->sun_path) - 1);
> > > >      return 0;
> > > >  }
> > >=20
> > > While the earlier lines are okay, this line introduces an error. =20
> >=20
> > Why exactly? strncpy() copies up to n characters, quoting its manual
> > page:
> >=20
> >     If there is no null byte among the first n bytes of src, the string
> >     placed in dest will not be null-terminated
> >=20
> > But since the whole struct is zeroed out initially, this should still
> > result in a null terminated string, as the last byte of that buffer will
> > not be touched by the strncpy.
>=20
> Everyone here so far, including the compiler, seems to be assuming
> that sun_path must be nul-terminated.  But that is not strictly
> correct.  So the old code is not buggy and the compiler is wrong.
>
> Some systems insist on sun_path being nul-terminated, but I don't
> think that includes any we care about.  AFAICT from the manpage
> FreeBSD doesn't and uses a variable socklen for AF_UNIX.

unix(7) indeed says it varies across implementations and for example
Linux would add the nul byte itself (being 109th character there). But
it generally recommends to include the nul byte to avoid hitting some
corner cases (an example given there is getsockname() returning larger
buffer than normally, to accommodate that one extra byte).

> OTOH I don't think there is much benefit in the additional byte so I
> don't mind if we take some version of these changes.
>=20
> I think Marek is right that his patch does leave sun_path
> nul-terminated, so, for that original patch:
>=20
> Reviewed-by: Ian Jackson <ian.jackson@eu.citrix.com>
>=20
> Thanks,
> Ian.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--udOl8koJG4PSVcOF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAl89BE0ACgkQ24/THMrX
1yyzXQf+L20tpXP/dplQaiZ/uhx2NQF+K9RcT98sqP+KyR89fkDpkbzHsGNZnFK2
hbWWjZQOGpKKPXYui8QUJoyTBnOX+YjDaGJ19wLh4Xy/G8JoQlxr4tVWZhc5xOqH
IrivoUDYTDcj6nles8kBy9MXTjS8CaOeDvCU2GgAdM8+5ep6z1GrcYNIpN+n8jgH
bQwzmp62WQBVbB2BZjZOJDZf9GFEQFAJkFIPzzyiRc5VRTbPEQLcJic/kHWb3O7N
QFJeoa6Iw5fYsgb6AFErDL9cyEQBAcQSzUlawWh3a5ejV84tFaVAV9ZpegpmFPNL
eXSs5sQQwnpd+lmtTpIfoWA2/XaNMg==
=Q/Vn
-----END PGP SIGNATURE-----

--udOl8koJG4PSVcOF--

