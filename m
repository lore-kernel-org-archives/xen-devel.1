Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B652DE9B368
	for <xen-devel@archiver.kernel.org>; Mon,  2 Mar 2026 11:11:46 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1244144.1543604 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vx1BT-0004K1-W4; Mon, 02 Mar 2026 11:11:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1244144.1543604; Mon, 02 Mar 2026 11:11:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vx1BT-0004Ju-T9; Mon, 02 Mar 2026 11:11:31 +0000
Received: by outflank-mailman (input) for mailman id 1244144;
 Mon, 02 Mar 2026 11:11:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cp9A=BC=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1vx1BS-0004Jl-Nh
 for xen-devel@lists.xenproject.org; Mon, 02 Mar 2026 11:11:30 +0000
Received: from fout-a3-smtp.messagingengine.com
 (fout-a3-smtp.messagingengine.com [103.168.172.146])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8f42d6dc-1628-11f1-b164-2bf370ae4941;
 Mon, 02 Mar 2026 12:11:29 +0100 (CET)
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
 by mailfout.phl.internal (Postfix) with ESMTP id E9B89EC0075;
 Mon,  2 Mar 2026 06:11:27 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
 by phl-compute-06.internal (MEProxy); Mon, 02 Mar 2026 06:11:27 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 2 Mar 2026 06:11:26 -0500 (EST)
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
X-Inumbo-ID: 8f42d6dc-1628-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1772449887;
	 x=1772536287; bh=hAz78vtNmEKyYQy005oWsW/ppkghVlAM7QfBZhwbysc=; b=
	Z3j2U+05gRModrwbwn5SUEm7sD77bVZ2im1lmeUlbD0BMOChBdq4rRkW0jfFD3+v
	tqCBgZbwEJIi0w+D4ygk6/m4bPXk9E6QJKaWVEd4AZKaME0b4rRl2wLq8i4D0klM
	6l71c4RWlFUCTUtXKZDFhxMwzXJ2dE2LJNLd6qufSOsdoMC+N/ncW5gMyVHbsv/V
	4nTxIcTsgfRJTnMxd5rM8PBWE0BixHchema/LUdcYmnSSwsuluQ27gu/KasdvLtX
	j2iHCWwHNkV0iThrnLCLaVUEUm84HmohNdAtK+w2LzgLPyP6c1DZ7k/6JYojxJwl
	VQMcMiHdlj3tQdjwOveRFg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1772449887; x=1772536287; bh=hAz78vtNmEKyYQy005oWsW/ppkghVlAM7Qf
	BZhwbysc=; b=6KJj+AvK1TgeuAaY9kw+fJ9IVjsVn2+1biod24oci+PJMZlOhnT
	ucAc6iOzdwts74HmIRQGTKpBbhFNwv0+kqH3stsnOp+Rf1LiJ1qZE4u2DPloFh73
	tuaIaK0YoidrkAeNdQJ1eTsRyMO4LZ9VA20dk+OHJJe+sG+ZyeGSd1FddCPOmWie
	HKl2037gxyIrGMzgPmWRassBQuUoUYmhHcCwqbdfDngTRjZ9fZ2VxxJq0gWm78fT
	7J23HC45rYs0IjEHcl+vn06fIGPXM0PDs8SptjqAIsUPl6XqKSNpHLQxXi/8xJ5w
	TZGSHpGe8N0tLXoJ5iJkDzjp+O0c51kjaJA==
X-ME-Sender: <xms:X3ClaYKlxm_s1rTzgwnsrs5iPmn9ZtuK6XzspmJD0tJsR7yuTkOVzQ>
    <xme:X3Clab2FkFdGDLzzMKOMJovnflFG2_vLcVmJvNUAHZm6dc6xgr9gk_tcEVF7t0PSM
    OToKqRphBekQHBbljkLZO7VWlUnWNvO8e3bU09Oy4zIP_hM>
X-ME-Received: <xmr:X3ClaSgasJkXQodAen6oAh1dYoxM8K8ku_khJJ5W4voizSbQUb2KMFCYilkiSt6BidUikkR3RcbS7ZJdOkgOQhqL5ReW79tYxRQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvheejhedvucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgvkhcu
    ofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvih
    hsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepgfduleet
    feevhfefheeiteeliefhjefhleduveetteekveettddvgeeuteefjedunecuvehluhhsth
    gvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehi
    nhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomhdpnhgspghrtghpthhtohepiedpmh
    houggvpehsmhhtphhouhhtpdhrtghpthhtohepjhgsvghulhhitghhsehsuhhsvgdrtgho
    mhdprhgtphhtthhopehjghhrohhsshesshhushgvrdgtohhmpdhrtghpthhtohepgigvnh
    dquggvvhgvlheslhhishhtshdrgigvnhhprhhojhgvtghtrdhorhhgpdhrtghpthhtohep
    sghorhhishdrohhsthhrohhvshhkhiesohhrrggtlhgvrdgtohhmpdhrtghpthhtoheprg
    hkphhmsehlihhnuhigqdhfohhunhgurghtihhonhdrohhrghdprhgtphhtthhopegurghv
    ihgusehkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:X3ClacWCSFhp3S0yMwxZaHuA3AEBoKsMi1x4jvEXnnz8WeCm8octug>
    <xmx:X3ClaRV7boaCcYF6M7vqYEwzXubTC4EU4eWeAiwSnWw9QyA__mN3Uw>
    <xmx:X3ClachkK7zs_WBLJiumbqvslf9zpjstUBaRoX7ziC355UK8wnp4kg>
    <xmx:X3ClacYPboHxpA8UgWTk_RSsyUYyTldHxcy-5yrKsigEXOX22dSbfQ>
    <xmx:X3Clafl-14sHa5K3I6ErKakxPH3bi8NYMVAIQR5vLA_17tpkx5zM4GLU>
Feedback-ID: i1568416f:Fastmail
Date: Mon, 2 Mar 2026 12:11:23 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
	xen-devel <xen-devel@lists.xenproject.org>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	"David Hildenbrand (Arm)" <david@kernel.org>
Subject: Re: Excluding init_on_free for pages for initial balloon down (Xen)
Message-ID: <aaVwXPBV-09yItPM@mail-itl>
References: <aaRVcVmtv2UBD-GF@mail-itl>
 <513e624f-35c1-4d43-ba3f-c96af613d400@suse.com>
 <224968e6-7236-4efe-bcc0-ab39ac0c6c45@kernel.org>
 <aaVuB3x3y4ROr5XA@mail-itl>
 <b7fd4685-1c46-428b-8f5d-b6eb447f0ee7@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="HjLfbADq9Cg4aQs8"
Content-Disposition: inline
In-Reply-To: <b7fd4685-1c46-428b-8f5d-b6eb447f0ee7@suse.com>


--HjLfbADq9Cg4aQs8
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Mon, 2 Mar 2026 12:11:23 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
	xen-devel <xen-devel@lists.xenproject.org>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	"David Hildenbrand (Arm)" <david@kernel.org>
Subject: Re: Excluding init_on_free for pages for initial balloon down (Xen)

On Mon, Mar 02, 2026 at 12:05:57PM +0100, Jan Beulich wrote:
> On 02.03.2026 12:01, Marek Marczykowski-G=C3=B3recki wrote:
> > It isn't just reducing double-zeroing to single zeroing. It's about
> > avoiding zeroing such pages at all. If a domU is started with
> > populate-on-demand, many (sometimes most) of its pages are populated in
> > EPT.
>=20
> ITYM "unpopulated in EPT"?

Yes...


--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--HjLfbADq9Cg4aQs8
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmmlcFwACgkQ24/THMrX
1yzqNQf/TDwbpTaA2dHntBbwtaFb8BD+V+ciJ4Bn9CsM4jA/bjqWVqOEYDdFvW+8
ZxOxWonelMsJWD6jOAVNzjV63CXrxuKC0aQ80VBC717XO2JwvVjHcGSoEY839BxM
bWOY48dSNAwG3xZT8S9H8OUgG5oc9e/UXg0nwiSugHDZaWL0mnzZyfwmQbYfxsp4
4st6ObeKWMvx8UvRI/KnN7oM1DxF1A1pUnLKrVVJEPzL/doCo7FvBFGIki0zv0vY
yLepZGyLqDaA+nwDa5OnQDPJI8t4DasiIbxznhU8g0o+HKnRjzs+q9WMSzAOh6In
l5rIM+BA7s/E8evluHaYs/oVgK+bsQ==
=lnOg
-----END PGP SIGNATURE-----

--HjLfbADq9Cg4aQs8--

