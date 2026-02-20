Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92780C531F8
	for <xen-devel@archiver.kernel.org>; Fri, 20 Feb 2026 00:56:52 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1236780.1539313 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vtEov-0006aQ-SM; Fri, 20 Feb 2026 00:56:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1236780.1539313; Fri, 20 Feb 2026 00:56:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vtEov-0006aJ-P1; Fri, 20 Feb 2026 00:56:37 +0000
Received: by outflank-mailman (input) for mailman id 1236780;
 Fri, 20 Feb 2026 00:56:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8OLq=AY=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1vtEou-0006aD-BF
 for xen-devel@lists.xenproject.org; Fri, 20 Feb 2026 00:56:36 +0000
Received: from fhigh-a4-smtp.messagingengine.com
 (fhigh-a4-smtp.messagingengine.com [103.168.172.155])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ff66890d-0df6-11f1-9ccf-f158ae23cfc8;
 Fri, 20 Feb 2026 01:56:33 +0100 (CET)
Received: from phl-compute-07.internal (phl-compute-07.internal [10.202.2.47])
 by mailfhigh.phl.internal (Postfix) with ESMTP id B48EB1400154;
 Thu, 19 Feb 2026 19:56:31 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
 by phl-compute-07.internal (MEProxy); Thu, 19 Feb 2026 19:56:31 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 19 Feb 2026 19:56:30 -0500 (EST)
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
X-Inumbo-ID: ff66890d-0df6-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1771548991;
	 x=1771635391; bh=fZTit6niMgDMxbtxRaNJsSAbZZ1nbdomFbWqJMDncMc=; b=
	ByI/T7xKYL3Q9Ih/XJb5X2eUjp527IjQKI5O8m4Ao7PFXn2VF66mQ8Y3c1GWeicH
	2AoZ6BLou04rVe6T6G/xwx4/gjuqh+CkYE90IVFFyf5OoaNhgpNvyD9p+ghiILsr
	63qLd3woayS6s8tj6grVrpf/KZWsKwuB7lcY7LLXorQT9l+Xih2fGA0gPv5ozn9i
	9R8P5lvTL4TinCZHjllyXGg6m4P88l7AMb1dWAlfREBg7ZcZGvm6hMqlytxfa2pU
	f8EuRiPL5SGmc6bHEgmFvpxlu7J0q4P4TrixaxyPKYowXZu+nSpvosxm5gBret3E
	vPeQ3bi1LYhhj6NKn/QbxQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1771548991; x=1771635391; bh=fZTit6niMgDMxbtxRaNJsSAbZZ1nbdomFbW
	qJMDncMc=; b=qF+SFEogtHRsixd84S8q7kzYPieX8skhYO9BJhni0J4TW6/Yk+4
	mMM74SzQJe+Y1MntTst5v9Q+A7GxbpxNE2CdYWq86gDVndpBepFArYVFZOqWJJSc
	ag2yJDkeS+zNtwMQF4np0SWAAujaDXRPjSKq9orEXurpZU097wfoxIWKMNS8O38f
	RkPA1CIQxSHAb9SXNRdLDQO0iGo8TUPjZkHks3TstkbIVJlZ5lohuckC1z5mj3rH
	s5iJt86A6jbnps1cnJeJPe8pEDEZ+2OxhNh6Fu5QjiAhR4+OnnwlnnzWE3uGJ4jo
	7E8pu5PjgDQS/A1ML+2DIIM5MZnm/XU0YCA==
X-ME-Sender: <xms:P7GXabsR3eB9qi0bYdxB2XCH2bP-Fe6ot37Y4oCtWEMuOAj0uwjOcg>
    <xme:P7GXaScuBrde4BLpCbVTGqM4NKG_DEaXMz8avi9sKFySam8dJCvkhLR-VksIO3hgM
    phJqHl-ReOLNXPX7TMUQ_Saz5um50lvoa2srgqOiQ5ZnKWX>
X-ME-Received: <xmr:P7GXacamVQ2jaK-Qa1IidzkiDQW0CYaCcUjKQOy6yzfgTLXy2RQ_OSg-uzqZyw8Ww-_SdM4BwMmOI8HX6mOvlB-Gh2R8hgqU8i0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvvdejtdefucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgvkhcu
    ofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvih
    hsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepgfduleet
    feevhfefheeiteeliefhjefhleduveetteekveettddvgeeuteefjedunecuvehluhhsth
    gvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehi
    nhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomhdpnhgspghrtghpthhtohepvddpmh
    houggvpehsmhhtphhouhhtpdhrtghpthhtohepgigvnhdquggvvhgvlheslhhishhtshdr
    gigvnhhprhhojhgvtghtrdhorhhgpdhrtghpthhtoheprghnthhhohhnhidrphgvrhgrrh
    gusehvrghtvghsrdhtvggthh
X-ME-Proxy: <xmx:P7GXaVUvsDu-noytOscMEidbZKOrRTREh6ti3oMEDnKlUsBjJNJXuw>
    <xmx:P7GXaegCrfbWRZkjkx7wAr-lIDNRAqXXnkMU2yNRJmgj4sksYCM1vQ>
    <xmx:P7GXaTWYvvNUIoEANNN_EwA6Y2zcHqrktJNfcgRsOPEDekhZgWVLxw>
    <xmx:P7GXaVMfVyd37UZu9wbP7ljQ3iKYe5ZKu4SnjoFRe4BxltmjquuF3A>
    <xmx:P7GXaT81t9rSrhta_cbk9uv8wJAAIzYvHdg-YL3rdgk8xUO5ebZaXt8l>
Feedback-ID: i1568416f:Fastmail
Date: Fri, 20 Feb 2026 01:56:28 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>
Subject: Re: [PATCH v2] tools: specify C standard explicitly
Message-ID: <aZexPYiQ5UF6t5uz@mail-itl>
References: <20260220004344.1980775-1-marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="2JULg39Ab87p/qQs"
Content-Disposition: inline
In-Reply-To: <20260220004344.1980775-1-marmarek@invisiblethingslab.com>


--2JULg39Ab87p/qQs
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Fri, 20 Feb 2026 01:56:28 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>
Subject: Re: [PATCH v2] tools: specify C standard explicitly

On Fri, Feb 20, 2026 at 01:43:21AM +0100, Marek Marczykowski-G=C3=B3recki w=
rote:
> Archlinux just updated gcc to 15.2.1+r604+g0b99615a8aef-1, and that
> defaults now to GNU23 standard. This isn't what Xen codebase expects, for
> example libxl fails to build with:
>=20
>     libxl_cpuid.c: In function =E2=80=98libxl_cpuid_parse_config_xend=E2=
=80=99:
>     libxl_cpuid.c:447:16: error: assignment discards =E2=80=98const=E2=80=
=99 qualifier from pointer target type [-Werror=3Ddiscarded-qualifiers]
>       447 |         endptr =3D strchr(str, '=3D');
>           |                ^
>     libxl_cpuid.c:452:16: error: assignment discards =E2=80=98const=E2=80=
=99 qualifier from pointer target type [-Werror=3Ddiscarded-qualifiers]
>       452 |         endptr =3D strchr(str, ',');
>           |                ^
>     libxl_cpuid.c:454:20: error: assignment discards =E2=80=98const=E2=80=
=99 qualifier from pointer target type [-Werror=3Ddiscarded-qualifiers]
>       454 |             endptr =3D strchr(str, 0);
>           |                    ^
>     libxl_cpuid.c: In function =E2=80=98libxl_cpuid_parse_config_xend=E2=
=80=99:
>     libxl_cpuid.c:447:16: error: assignment discards =E2=80=98const=E2=80=
=99 qualifier from pointer target type [-Werror=3Ddiscarded-qualifiers]
>       447 |         endptr =3D strchr(str, '=3D');
>           |                ^
>     libxl_cpuid.c:452:16: error: assignment discards =E2=80=98const=E2=80=
=99 qualifier from pointer target type [-Werror=3Ddiscarded-qualifiers]
>       452 |         endptr =3D strchr(str, ',');
>           |                ^
>     libxl_cpuid.c:454:20: error: assignment discards =E2=80=98const=E2=80=
=99 qualifier from pointer target type [-Werror=3Ddiscarded-qualifiers]
>       454 |             endptr =3D strchr(str, 0);
>           |                    ^
>     cc1: all warnings being treated as errors
>=20
> Specify GNU99 explicitly (same version as in the hypervisor, but the
> GNU dialect), to fix the build, and avoid such surprises in the future.
>=20
> Signed-off-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingsl=
ab.com>

Hm, I should have tested it more precisely. This actually does not solve
the issue, it still fails to build on Arch. I did confirmed the
-std=3Dgnu99 ended up in the relevant GCC call for libxl_cpuid.c.

So, I guess iterate on v1?

> ---
> As discussed in v1, I'm changing the standard version for now. Note GCC
> 14 used to default to -std=3Dgnu17, so that should work too, but keep it
> consistent with the hypervisor.
> The v1 that adjusted libxl can be used anyway, but it's less
> backport-friendly.
>=20
> Changes in v2:
> - revert to old standard (specify it explicitly now), instead of
>   adjusting the code to the new standard - this way is more
>   backport-friendly
> ---
>  tools/Rules.mk | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/tools/Rules.mk b/tools/Rules.mk
> index d9b9c740e964..de9100eb1681 100644
> --- a/tools/Rules.mk
> +++ b/tools/Rules.mk
> @@ -38,6 +38,8 @@ ifeq ($(debug_symbols),y)
>  CFLAGS +=3D -g3
>  endif
> =20
> +CFLAGS +=3D -std=3Dgnu99
> +
>  ifneq ($(nosharedlibs),y)
>  INSTALL_SHLIB =3D $(INSTALL_PROG)
>  SYMLINK_SHLIB =3D ln -sf
> --=20
> 2.51.0
>=20

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--2JULg39Ab87p/qQs
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmmXsT0ACgkQ24/THMrX
1yxyUQgAmJb42F7Ybn6YYZxAOWhtqAhRo8ImCxo8eecg2X5LMVyaR/MplriasJdy
MhQl31MJ/soBVkqFqiPb0NHYOpFdOf3pivS+ZuxN/pO4FCVruLYICbHGA+5WSJ3n
3yDHyGpAqr89vdDsmKroxmXpnNmMwHG3Pr1nhAiORvVr1VleqTl/6kmsGtkTUxtf
HMX/qgYdUFMdV4LmPG4EyH02vsgZQU+7m5UsbCjaBGmbm3lrnRkI98btW3f8RK+0
Cj14pf9Fw226ILSTSrCJYuFKdAh0jHUaA/vfuUKyk/IfuK2vf3GW8sj3alI1RAOt
SVc3/DcMYMcnNFPXU4G7f1GdL48mZQ==
=IixQ
-----END PGP SIGNATURE-----

--2JULg39Ab87p/qQs--

