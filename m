Return-Path: <SRS0=Zy1u=L2=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEEEFC11F68
	for <xen-devel@archiver.kernel.org>; Fri,  2 Jul 2021 16:20:04 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7CE0B6140E
	for <xen-devel@archiver.kernel.org>; Fri,  2 Jul 2021 16:20:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7CE0B6140E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=invisiblethingslab.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.149219.275873 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lzLtN-00070M-K3; Fri, 02 Jul 2021 16:19:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 149219.275873; Fri, 02 Jul 2021 16:19:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lzLtN-00070F-H1; Fri, 02 Jul 2021 16:19:49 +0000
Received: by outflank-mailman (input) for mailman id 149219;
 Fri, 02 Jul 2021 16:19:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lind=L2=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1lzLtL-000709-6A
 for xen-devel@lists.xenproject.org; Fri, 02 Jul 2021 16:19:47 +0000
Received: from wout4-smtp.messagingengine.com (unknown [64.147.123.20])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 50603c45-db51-11eb-83bb-12813bfff9fa;
 Fri, 02 Jul 2021 16:19:45 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 4F51A3200939;
 Fri,  2 Jul 2021 12:19:44 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Fri, 02 Jul 2021 12:19:44 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 2 Jul 2021 12:19:42 -0400 (EDT)
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
X-Inumbo-ID: 50603c45-db51-11eb-83bb-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=YBZ4tJ
	Ng0hQZ1NvEYHvKXLF8rlfuU8r7NDnfsiqj9Ro=; b=iy34pu1U4GN3CfPS7M38hT
	VW9wqV5xo42lUIyjebAdcxpIZU0DX5U1v/4vQEVg0g7T+evI6CGmLJHNvsAbhPDM
	6HJhgjvrd42MwgjGgUascf2L5j4FEWJhGGrYjP1IoBm7hXOtE4nxY13xd/mzQMyR
	oLJwRkONmkll9Txi13eqEDsd0S0HavUv8UCYrYPb8+/9iyD0RGp8nlN8JBx5y9DM
	la85lJZUivZMAOT0EKCSz8ZckQvVyzVCGyw2ozg1NRODOFGqyLb2sU1sc9/C1loG
	c/+pLFThAzbsPLhVm7u9MVccQVKkduw3bPOGRuMXI+tcqmUENfRZnFZrF1/7n3cg
	==
X-ME-Sender: <xms:nzzfYLw524BTFM5p6bhA5DBcBLW1z5b9vNKu0UyLk9VdYScZbsJJBg>
    <xme:nzzfYDSZfFzHA15RZOnxc2SXiGe2QatpxBlxf5SHElJfsoQcaSeaPpy8brtY6Pifd
    KvIcQmBSXrCAQ>
X-ME-Received: <xmr:nzzfYFVLAp72KlprQxaNuKifDaNJpEIcqAI3U6LyI8gp67hjiPWPbngTGL0IRVBq9NAv7Ez20LIpYTLyT5uZ6AlyhW4miaC5>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfeeikedgleekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghk
    ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
    hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeetveff
    iefghfekhffggeeffffhgeevieektedthfehveeiheeiiedtudegfeetffenucevlhhush
    htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhes
    ihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:nzzfYFjd58MyAlwHDmxUmd8JlfRe7whp3rzBv_39A_Pxbg4ctOvBqw>
    <xmx:nzzfYNAS-lN3U4fjPEocLhVUcTEHwWlC_-K5zYlOR3sLW2fG_9zJSw>
    <xmx:nzzfYOJ-B6eQNj_girhEge9aybFCLThnfBnB7aa8hcJhZ47Eeh-TFw>
    <xmx:nzzfYK47bAQ9JrtzxEyosuwgMS6W770Mc8TrvYQ_ixr5iB83fKNJ-Q>
Date: Fri, 2 Jul 2021 18:19:39 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Olaf Hering <olaf@aepfle.de>
Cc: xen-devel@lists.xenproject.org, Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: Re: [PATCH v20210701 06/40] tools: fix Python3.4 TypeError in format
 string
Message-ID: <YN88m0tvHKxF7+NI@mail-itl>
References: <20210701095635.15648-1-olaf@aepfle.de>
 <20210701095635.15648-7-olaf@aepfle.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="0PxFz+rlyW/ZVH6j"
Content-Disposition: inline
In-Reply-To: <20210701095635.15648-7-olaf@aepfle.de>


--0PxFz+rlyW/ZVH6j
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Fri, 2 Jul 2021 18:19:39 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Olaf Hering <olaf@aepfle.de>
Cc: xen-devel@lists.xenproject.org, Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: Re: [PATCH v20210701 06/40] tools: fix Python3.4 TypeError in format
 string

On Thu, Jul 01, 2021 at 11:56:01AM +0200, Olaf Hering wrote:
> Using the first element of a tuple for a format specifier fails with
> python3.4 as included in SLE12:
>     b =3D b"string/%x" % (i, )
> TypeError: unsupported operand type(s) for %: 'bytes' and 'tuple'
>=20
> It happens to work with python 2.7 and 3.6.
> Use a syntax that is handled by all three variants.
>=20
> Signed-off-by: Olaf Hering <olaf@aepfle.de>
> ---
>  tools/python/scripts/convert-legacy-stream | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/tools/python/scripts/convert-legacy-stream b/tools/python/sc=
ripts/convert-legacy-stream
> index 9003ac4f6d..235b922ff5 100755
> --- a/tools/python/scripts/convert-legacy-stream
> +++ b/tools/python/scripts/convert-legacy-stream
> @@ -347,9 +347,9 @@ def read_libxl_toolstack(vm, data):
>          if nil !=3D 0:
>              raise StreamError("physmap name not NUL terminated")
> =20
> -        root =3D b"physmap/%x" % (phys, )
> -        kv =3D [root + b"/start_addr", b"%x" % (start, ),
> -              root + b"/size",       b"%x" % (size, ),
> +        root =3D bytes(("physmap/%x" % phys).encode('utf-8'))
> +        kv =3D [root + b"/start_addr", bytes(("%x" % start).encode('utf-=
8')),
> +              root + b"/size",       bytes(("%x" % size).encode('utf-8')=
),

Why bytes()? Encode does already return bytes type.

>                root + b"/name",       name]
> =20
>          for key, val in zip(kv[0::2], kv[1::2]):

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--0PxFz+rlyW/ZVH6j
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmDfPJsACgkQ24/THMrX
1yxGhggAhvkfFO/jUgXBIVvtXKv0oCbmo0tJGq/QRQz7KkyXy+ZfwaSzLD1EdOgE
hiJcUUfA1+o+vKXfYrQIuoIhQ7o8Unt8Y/qW1eJVweRMB9oHJ2JvCuwzZnFu7gyk
m1mU5xByavGhHLC+z9OYTmWTgTh/MvUF10UZDzXsJwciWSLUYKZPqI64C1cUlgBm
sCdccuaWPCrwAu3SLrlF2xMvFIPo8hKZ80YGnzpqjJfMUOkWqMo2vGWkzpX6d3Nk
urNH86r/RDs3x2kB9KRd8XxTKz28JuHS2Jt8FhFBK7HrLxTdprCfbrr9AyZMNZHh
yCdfKlpPfqXkb/mwzA/7Our3VJ8g+w==
=Vc5l
-----END PGP SIGNATURE-----

--0PxFz+rlyW/ZVH6j--

