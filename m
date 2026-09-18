Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29B2EC982DD
	for <xen-devel@archiver.kernel.org>; Fri, 18 Sep 2026 20:49:28 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1425877.1649582 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x7fW7-0001LN-2F; Fri, 18 Sep 2026 20:49:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1425877.1649582; Fri, 18 Sep 2026 20:49:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x7fW6-0001LG-V4; Fri, 18 Sep 2026 20:49:06 +0000
Received: by outflank-mailman (input) for mailman id 1425877;
 Fri, 18 Sep 2026 20:49:05 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <marmarek@invisiblethingslab.com>) id 1x7fW5-0001LA-Dn
 for xen-devel@lists.xenproject.org; Fri, 18 Sep 2026 20:49:05 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x7fW4-0008AX-4C
 for xen-devel@lists.xenproject.org; Fri, 18 Sep 2026 22:49:04 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 6aada36a-8faa-0a2a0a5109dd-0a2a4502db10-46
 for <xen-devel@lists.xenproject.org>; Fri, 18 Sep 2026 22:49:03 +0200
Received: from [103.168.172.151] (helo=fout-a8-smtp.messagingengine.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 6aada3be-6ca4-0a2a45020019-67a8ac9780e1-3
 for <xen-devel@lists.xenproject.org>; Fri, 18 Sep 2026 22:49:03 +0200
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
 by mailfout.phl.internal (Postfix) with ESMTP id 67CA1EC0235;
 Fri, 18 Sep 2026 16:49:02 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
 by phl-compute-03.internal (MEProxy); Fri, 18 Sep 2026 16:49:02 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 18 Sep 2026 16:49:01 -0400 (EDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=fm1 header.d=invisiblethingslab.com header.i="@invisiblethingslab.com" header.h="Cc:Content-Type:Date:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To"; dkim=pass header.s=fm1 header.d=messagingengine.com header.i="@messagingengine.com" header.h="Cc:Content-Type:Date:Feedback-ID:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To:X-ME-Proxy:X-ME-Sender"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1789764542;
	 x=1789850942; bh=p2p/4uYr0I/aihI2ELL4FmxsnHFyMYZQmjAUpbmhG+s=; b=
	hkxdaJhW3D/wak12v0LL2jsjmhoegMsPUifKezqGJDp9WDtjCDHjIaeuAXw45fBI
	6O/VimDBnwNTcZRn9XwJVffC8qoIBEj4oetV4pLwpiLqa/nEVLktSDb/ouxyUWgv
	g756A7TFW7I1FfUu6vZKis0Rdyr3j6DwGq8aBWaxgWuUs2vApyeAgqVEYjaUqBrg
	Qc8I479Sw8kZgNphCt4csQp9OYvclMtdNJRSFsTWSbC/J0WGFC92NPO/GNlcZML5
	EZ+b90f8cTy6wNIMpblVacGKIavv1KCB342zA9g5GEJg0aorweuStp4cGXa3oVFS
	REXdK8jIgYWnSuOanbTD7A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1789764542; x=1789850942; bh=p2p/4uYr0I/aihI2ELL4FmxsnHFyMYZQmjA
	UpbmhG+s=; b=rAiJfJppqfGMAz5maA+EbO6AgI/72ACaDtt+uuvbfbKr3ggOpHs
	mEiXGCVOdGBIpk3w0MWfWfUOHKZTMuyuaGuVsM0BgV3K18AHj4RlJw/yakiW1UUG
	pZ57abWBslOMriGEI19oiwXhhRZsm+K3Ysgq/P0iJT5etj03VBUHXgrZhKJlIMjc
	UER6+yeGS5et7I9enUQPzd0bCVHdVeh3JnZ+KgiWbTtMpcNA+T47m0KJY9j6Hv65
	LC3xdl/am/OUx5sFzuDC5Owj7jlih4pe2M2upaj+C0BquLTJjtB8pBg83ge7vg3f
	vT0guJ88hsNUPd8ArygfXsGgf7OeuXk2uPg==
X-ME-Sender: <xms:vqOtahOzn9q96-vuQa78Ozmc0sT-EBFwx0Vmsqip1CZZ-a1f2j_JSQ>
    <xme:vqOtarZIONI7RnHIXii2le5KGp5j6lyrBpvqKTT6YbG_4DG_9y59oKUlCuS-wgDo9
    gs8_gC7tFIFYQzePudIBia8Z87Fhmq00oVudE4nEfBhKaYb4QI>
X-ME-Received: <xmr:vqOtatqBkCMi5Fy9kutU2i5vJ-H_1fW7kkc1mBqXDDzT5CfDd_DV9Gja3-0lTRyOvY-XIsY_tfgO7Tt2kS2-jnyday3qU4rADP6hONqVY2o>
X-ME-Proxy-Cause: dmFkZTEGbZ++pOBa/piXTt+TzFEIGUtgrdG8sX0kR2cOhDstNI6INc+AGnk4gS+nnrHTJJ
    PpPIitRV/2SDd98pXqNKF9kL7IZmdNBS/ssIvhDUyP+zGz20Bc4BV//Dm9Rrf2VmjT04WE
    kwCcqxF+w5s+JtsyVs/IT/cuolZ+Av7CTevAU7XIaE4GNZGb48NaaG9CrzkXXLo1/rUxxB
    QU6niHjcV2lUolkq0UZYrVnD+Kfn0AEukOAKP8CoPW8RLY7a7wSDCiFVuhGi00gLinkFlO
    JWVd4CATC7Qhn4DvUBTS32d0Yh7A9heeYhIdjO1NZKU/7acW3v8L0VUK3/2TizQg9vk2ou
    dAI/X56+w7FJdOWfRPCgxWT+10abT9+B3tOCRHjwfYMUTYfDZIOkZ+KhfTa2WaLc3wslGw
    NgfTLdsa0vW5YnrXDl9ugS3aME9bpofOgR3gJZIbC/6ZpdWYlHS4CHUuenb2b5tJ9B5B84
    8AShVI5zK6fPXnU2EBbtCD2yOJx5P5nqukCbsq6oKDsUpvZ3XGaPseuPPtfuxAAgvhuKoL
    2LLPR45fn+IphhSEKHpLK0QP5v1pn5x9EsGYb555SiAMYIdODtx+a1r1TbOVrLg5qEa6gb
    baMal1/HanAVY05uAlQrRdMO330G48DGNSZ2PGSyHmMfD5zEJEZw2K2kA8kw
X-ME-Proxy: <xmx:vqOtanap86J8lWJlMuYUp91xrZS6WPrEgmiN-0zUzH3TH4PVJkFUEw>
    <xmx:vqOtatSmKEM5Xhz0IAfBnQVw5GwBVVy_vVYvUNhrCRWl3BuVIibD0A>
    <xmx:vqOtam4BM8ywLcKsPl20RV6UWohzGvt4DrMxDb3a7ehP_e2Sy9c79Q>
    <xmx:vqOtaqx5O-gWBs8ETxIcEbmjBDTv_l_TeA35SKxz3Jl2w7Tit3s_HQ>
    <xmx:vqOtar-WJL87AauSHG7W_eOmTToIsSEkPJIlMq2Usr7hxF68yN8pgcwS>
Feedback-ID: i1568416f:Fastmail
Date: Fri, 18 Sep 2026 22:48:58 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: dmukhin@ford.com
Cc: Denis Mukhin <dmukhin@xen.org>,
	xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: Zen5 runner access
Message-ID: <aq2jum2YNGBWnLDh@mail-itl>
References: <aq0nXDnJ5PX5uiW2@mail-itl>
 <aq2fIjkLvcDq0i9m@kraken>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="B81z5Jnaq4Cyy6lj"
Content-Disposition: inline
In-Reply-To: <aq2fIjkLvcDq0i9m@kraken>
X-purgate-ID: tlsNG-720697/1789764543-30FCE2AC-1E954742/0/0
X-purgate-type: clean
X-purgate-size: 2790

--B81z5Jnaq4Cyy6lj
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Fri, 18 Sep 2026 22:48:58 +0200
From: Marek =?utf-8?B?PT91dGYtOD9RP01hcmN6eWtvd3NraS1HPUMzPUIzcmVja2k/PQ==?= <marmarek@invisiblethingslab.com>
To: dmukhin@ford.com
Cc: Denis Mukhin <dmukhin@xen.org>,
	xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: Zen5 runner access

On Fri, Sep 18, 2026 at 01:29:22PM -0700, dmukhin@ford.com wrote:
> Hi Marek!
>=20
> Thanks for help!
>=20
> On Fri, Sep 18, 2026 at 01:58:20PM +0200, Marek Marczykowski-G=C3=B3recki=
 wrote:
> > Hi,
> >=20
> > After some debugging, the AMD Zen5 gitlab runner seems to be working
> > now. You can add it to your repo by going to
> > https://gitlab.com/xen-project/people/dmukhin/xen/-/settings/ci_cd
> > Runners -> Other available project runners and add hal9021 to your repo.
> > This relies on temporary access I granted you, so you need to click it
> > in the next two weeks.
>=20
> I have added the runner to the project, it shows up in
>=20
>   Runners -> Available project runners
>=20
> >=20
> > Then grab top commit from
> > https://gitlab.com/xen-project/people/marmarek/xen/-/commits/automation=
-hw21
> > that actually defines some jobs on it - edit it to your liking to run
> > tests you want there.
> >=20
> > And then, you can also select which jobs to run while pushing stuff to
> > gitlab, for example like this:
> >=20
> > git push gitlab -o ci.variable=3DSELECTED_JOBS_ONLY=3D"/zen5-.*|alpine-=
3.24-x86_64-gcc-debug/"
>=20
> I picked up new zen5 jobs, but looks like I need some other permissions
> as I cannot schedule on any hardware runner.
>=20
> All jobs are deployed on qemu runners only for my gitlab account.

Ah, gitlab config specifies it's enabled only on protected branches. You
can either mark relevant branch as protected (if going this way, I'd
recommend still allowing force-push), or edit
automation/gitlab-ci/test.yaml to remove
`$CI_COMMIT_REF_PROTECTED =3D=3D "true"` part.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--B81z5Jnaq4Cyy6lj
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmqto7sACgkQ24/THMrX
1yxTSwgAjUcr45hC85amHG2fmM5rw8v5RWVoLFWP8dhjKVG9ViSuA+RniGOSAsu8
N1rGFRM4CqLjRXFc4l6beDsHxfyRCnqzdnwPhU7QLYCp8eKF9vZNWMz58d7pZpa8
x0QJbWJ7GgzU0pWBqbNLG1/LyxXyct7zn5ul4Ef9MogSSEqoyytpMA5H76Hfyds5
t+ugcaTuQzLzggeXwopULmqlrLVVL+XvvZPTjyoM9Ofw50BM2w3yeiPeg7Cm3y4Z
hp9EKIBdDOZlFddrKDsGpW5N29LkXyY3F5W24LWk7rdANAGi+zRsA8efCQIR8o4O
+EzYHsmd3qrVe9QU9ej5hSNHKb9/uw==
=LQ7r
-----END PGP SIGNATURE-----

--B81z5Jnaq4Cyy6lj--

