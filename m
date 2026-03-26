Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58F9410A62C9
	for <xen-devel@archiver.kernel.org>; Thu, 26 Mar 2026 13:05:40 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1264062.1555786 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5kOm-0003TM-33; Thu, 26 Mar 2026 13:05:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1264062.1555786; Thu, 26 Mar 2026 13:05:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5kOl-0003TF-VY; Thu, 26 Mar 2026 13:05:19 +0000
Received: by outflank-mailman (input) for mailman id 1264062;
 Thu, 26 Mar 2026 13:05:19 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <marmarek@invisiblethingslab.com>) id 1w5kOl-0003T9-8H
 for xen-devel@lists.xenproject.org; Thu, 26 Mar 2026 13:05:19 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w5kOk-004T1z-K2
 for xen-devel@lists.xenproject.org; Thu, 26 Mar 2026 14:05:18 +0100
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 69c52f0e-bab6-0a2a0a5309dd-0a2a4502ad28-2
 for <xen-devel@lists.xenproject.org>; Thu, 26 Mar 2026 14:05:18 +0100
Received: from [202.12.124.144] (helo=fout-b1-smtp.messagingengine.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 69c52f0d-63bb-0a2a45020019-ca0c7c908c01-3
 for <xen-devel@lists.xenproject.org>; Thu, 26 Mar 2026 14:05:18 +0100
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
 by mailfout.stl.internal (Postfix) with ESMTP id 89D131D00251;
 Thu, 26 Mar 2026 09:05:16 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
 by phl-compute-05.internal (MEProxy); Thu, 26 Mar 2026 09:05:16 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 26 Mar 2026 09:05:15 -0400 (EDT)
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
	:references:reply-to:subject:subject:to:to; s=fm1; t=1774530316;
	 x=1774616716; bh=CfmFvw8ObXq44CC8f+3G32ZkEUy+9zkHgLU1j+/oiGA=; b=
	pX6SMjB6A+lh6JVvAer4Z2PDb7xVKcTaOzu2X1deSeXQoVse1bwM+DxeVeponIcr
	aV+b4slNx+8UPz75fmWxvYcF8ia7ZzC4egL/B6hb3/pxHpH2CrAhrwpqv3Zf0vrl
	zsuHkWvN7aeh7UG7/4ECjThcL8q8oEW96pV+9lsE/PMoaw2FDLiMux1goZQU19cR
	mcDUzgkGp2LDFYNvplunz8N4xPWHzMFU505nUl7ADns59uDLzFKB9UQsfLzXNwVm
	tA5Sk4FIxU/NujUjFrsotOQo5onIPtllG+yw8Iz8r9C+ny92s09U50IUX6SOld3t
	kmwOsUcgOs4y0JSGuuRGMg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1774530316; x=1774616716; bh=CfmFvw8ObXq44CC8f+3G32ZkEUy+9zkHgLU
	1j+/oiGA=; b=kqrFfOxvaDBmx7TUe1D4oXT+4EjeDucTQH3SwxeR5l1oSDtmyAq
	NZpNFMs15414El0l3UCgECe66Oo/ifHisglADWH7lTDhU9t9UAjsuw80zZNXQ2UI
	GRjl84/8DGQwMw0W8tD/sA5mP8d55enWr1WOjqHs/SjYVjVYHY+oxjpf+HADLlCe
	Wb94MTgUaMnWT9LOZYadcROwRZAOv6E4JMppq7Z9vBBoIJGcDS8p3bjQIyyHr4s1
	YjkaNG9mPvNQGya6cndRJP3nm36LrN0xxdvPW8tZ+M+r8R273sFvTpHjBQqnHJ2Z
	9Rs7ZjldauyRO6ux8iQCnCauEWbjnOQEz+g==
X-ME-Sender: <xms:DC_Fab5gEMw8PbfoQvAv4cQ5KO7-btgf_BAZ5RTB2ZZvxSrQL-xuMg>
    <xme:DC_FaW6En2WMZFj7udVPvdNTAzHFl2pvUkBv9e-ZoFrQv0FNHrkKXcJbyFOcjkfTh
    fsLZQQO01Tl4UNDJ69kD2irLeyCCdRU9YMAaKDhM1a-EGCCFA>
X-ME-Received: <xmr:DC_FaQEtl0PhR-hoPvKEQwwXcOTie0cEEQn4w12H0ImjUGtjEWvjlImQ9W6OfcErtja7YLCOfmBjgiRP43c42Kf2yoUYdD6Pdp0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdefvdejgeeiucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesghdtroertddtjeenucfhrhhomhepofgrrhgvkhcu
    ofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvih
    hsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnheptdetvdfh
    kedutedvleffgeeutdektefhtefhfffhfeetgefhieegledvtddtkedtnecuvehluhhsth
    gvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehi
    nhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomhdpnhgspghrtghpthhtohepvddpmh
    houggvpehsmhhtphhouhhtpdhrtghpthhtohepjhgsvghulhhitghhsehsuhhsvgdrtgho
    mhdprhgtphhtthhopeigvghnqdguvghvvghlsehlihhsthhsrdigvghnphhrohhjvggtth
    drohhrgh
X-ME-Proxy: <xmx:DC_FaXRYkxykHAIs7bkYopH8UwpTrpjMs9i99xib9ILnb5qQ3povXA>
    <xmx:DC_FaRtf65iWT_aS-VEnCPZ50WmAOooj8OCQyNy8sqRW4ckftHkwvg>
    <xmx:DC_FaeyrJUhHLJlDTm3QUGnLpbR-Vh-EfrryM8sBtUhMTL41VIpqVQ>
    <xmx:DC_FaT7upJHs2WkBHLjYTy_sn4C6Bn7CZc29c14Yworz1j0NMcUpAA>
    <xmx:DC_FacN3kVXc0VsdSkvcOHq9v1bppbiiaCLvKyQviZKKksX_--thWj6a>
Feedback-ID: i1568416f:Fastmail
Date: Thu, 26 Mar 2026 14:05:13 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: Slow (higher scheduling latency?) system after S3 - regression
 4.17 -> 4.19 ?
Message-ID: <acUvCYfOBRGydNGL@mail-itl>
References: <aPzBO_eW8mQHM66u@mail-itl>
 <acQzzlXNDxNq885V@mail-itl>
 <330c25da-1f7b-4af1-b14c-1c5e732ea441@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="wmr8rh80rw3UCODT"
Content-Disposition: inline
In-Reply-To: <330c25da-1f7b-4af1-b14c-1c5e732ea441@suse.com>
X-purgate-ID: tlsNG-720697/1774530318-40497DB8-461E029F/0/0
X-purgate-type: clean
X-purgate-size: 1631


--wmr8rh80rw3UCODT
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Thu, 26 Mar 2026 14:05:13 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: Slow (higher scheduling latency?) system after S3 - regression
 4.17 -> 4.19 ?

On Thu, Mar 26, 2026 at 09:21:16AM +0100, Jan Beulich wrote:
> On 25.03.2026 20:13, Marek Marczykowski-G=C3=B3recki wrote:
> > In the "bad" case, I see this extra line:
> > (XEN) [    6.902973] Platform timer appears to have unexpectedly wrappe=
d 1 times.
> >=20
> > But in an earlier run of the same build it's not there.
>=20
> And in that earlier run, did the post-S3 delays also not occur?

Regardless of the above message, the "bad" build had the post-S3 delays.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--wmr8rh80rw3UCODT
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmnFLwkACgkQ24/THMrX
1yxPAggAi4IQWNFeDMBkERl2jU5dyB+uxKWr8aRqOsi8Cc8MesL8mD4579Qk1REs
Pyid79VVRXj3vWjZ79nOqwsrSIKRSH8p7JnpsfnVkM3a+5IevpViAPVLKf3bTfKi
nmz/sdndePgMg5MUlnDApZkbN895SY/cJbitlEQCWE3N8RJAqvl7cAx+GGxED6Bw
0UtBncefNakSrSs440Sr2PxvUsF1tDOoqdKWOeNBZ/ljlqBryx00R7vH0pPC7p47
EB7qo0cqDcK8so9EjtmwYn0HW7a+Wo+xVnqBcWvajMDzr1C6BtW5BJaCkzKej6bj
KUzvUUTwnLniu3t1niOsRcOllWhwFw==
=sU6H
-----END PGP SIGNATURE-----

--wmr8rh80rw3UCODT--

