Return-Path: <SRS0=OoRj=ZL=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6589FC432C3
	for <xen-devel@archiver.kernel.org>; Tue, 19 Nov 2019 13:56:41 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2DAAA222D3
	for <xen-devel@archiver.kernel.org>; Tue, 19 Nov 2019 13:56:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="pJyIUFsx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2DAAA222D3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=invisiblethingslab.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iX3zJ-00054O-EG; Tue, 19 Nov 2019 13:56:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=BHSM=ZL=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1iX3zH-00054J-Sm
 for xen-devel@lists.xenproject.org; Tue, 19 Nov 2019 13:56:12 +0000
X-Inumbo-ID: 575bebdc-0ad4-11ea-b678-bc764e2007e4
Received: from out4-smtp.messagingengine.com (unknown [66.111.4.28])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 575bebdc-0ad4-11ea-b678-bc764e2007e4;
 Tue, 19 Nov 2019 13:56:10 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id 2D29F22304;
 Tue, 19 Nov 2019 08:56:10 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute7.internal (MEProxy); Tue, 19 Nov 2019 08:56:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=TK0Hbp
 lyE17+vUk5/jQ5pUwHy4ZziZpNDj3im0g62a4=; b=pJyIUFsxhOSBTAahhgCS+w
 0gjCtc6hyjbsDzSD4DY4LEK0wj7WejjkBd8vIrLu7ObbUwLGbo24NLERE0A0VCW+
 LleqP4HL5OxaKGSlsjEWeiXf4btduVKi77xnG86O/wxnyjsK+VvMVl/5qKNYDfnC
 x/68EKmW5fDDZ/e0GEc7j3UNkwYN5oSK52m9nq9zntZBL7qzpVDaEgwY2p7MxdBe
 tz8gS4/fnoXjO9LRgRCoUfzqDsHJQKiDPSJeSDkupSFEYV67B+pWDfIOs9/xkATh
 lQOKnyA8HEDFANMtcJgxBXxDBn9IoevbBZWwnAlRgJhk8x8/bMT7UuSlDa6blRVg
 ==
X-ME-Sender: <xms:efTTXU9MP1k1pgvpPJJBnY5YBeOtkJN5o_uzUgFiJwcS6zqu4Caycg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrudegkedgheejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghk
 ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
 hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucfkphepledurdeihedrfeegrdef
 feenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslh
 gvthhhihhnghhslhgrsgdrtghomhenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:efTTXd_rK2XjzGvGYdYpXa6PtSZ35l_oB8qqO3BzOfok9xmTkDI-Ow>
 <xmx:efTTXXElRPhdXZED5dFaIQE2ghL4Awj33mJ7rCa2H6zo2xQ7j5gEeQ>
 <xmx:efTTXXd590M5ysn_78W_E89Q_J4LDRKPiQxFeQ9PGQBpL3zo06rCyw>
 <xmx:evTTXd21SRho8x1qBuc_Lj5qfNep85Zsbq6t2WP-jyq4dzZb8juHDA>
Received: from mail-itl (ip5b412221.dynamic.kabel-deutschland.de [91.65.34.33])
 by mail.messagingengine.com (Postfix) with ESMTPA id 58ADF80062;
 Tue, 19 Nov 2019 08:56:09 -0500 (EST)
Date: Tue, 19 Nov 2019 14:56:06 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
To: Roman Shaposhnik <roman@zededa.com>
Message-ID: <20191119135606.GD4109@mail-itl>
References: <CAMmSBy9VN9fFC1M5P7OdLOiwZdgWjjWjMWppA63gnOe5wwGr4A@mail.gmail.com>
 <20191116230744.GC4109@mail-itl>
 <CAMmSBy8ZN4ihufbihSS5bxLKU-feMgfUNi2zDgcCuE9NL9pePA@mail.gmail.com>
 <20191118012711.GE5763@mail-itl>
 <CAMmSBy-DedPT7HmyD09N2-shCXmBfj83D30YUxGUtrabfJ_wQg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMmSBy-DedPT7HmyD09N2-shCXmBfj83D30YUxGUtrabfJ_wQg@mail.gmail.com>
Subject: Re: [Xen-devel] Likely regression in efi=no-rs option
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: xen-devel@lists.xenproject.org
Content-Type: multipart/mixed; boundary="===============4321461098928925338=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============4321461098928925338==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="k4f25fnPtRuIRUb3"
Content-Disposition: inline


--k4f25fnPtRuIRUb3
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Xen-devel] Likely regression in efi=no-rs option

On Mon, Nov 18, 2019 at 11:15:43PM -0800, Roman Shaposhnik wrote:
> On Sun, Nov 17, 2019 at 5:27 PM Marek Marczykowski-G=C3=B3recki
> <marmarek@invisiblethingslab.com> wrote:
> >
> > On Sun, Nov 17, 2019 at 05:06:11PM -0800, Roman Shaposhnik wrote:
> > > Rich, Marek, thanks a million for quick replies -- I'll try your
> > > suggestions tomorrow in my lab.
> >
> > To make use of the change, enable "EFI: call SetVirtualAddressMap()" in
> > menuconfig (Common Features), visible only with XEN_CONFIG_EXPERT=3Dy.
>=20
> Hm. It seems I had trouble building with your patch. Is there any chance =
I can
> simply force it from the make side?
>=20
> Or to ask it differently, if I simply do make defconfig what can I just a=
dd that
> option to the config file?

You need to enable XEN_CONFIG_EXPERT=3Dy anyway, just like this:

    export XEN_CONFIG_EXPERT=3Dy

Then, the option is CONFIG_EFI_SET_VIRTUAL_ADDRESS_MAP=3Dy

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--k4f25fnPtRuIRUb3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAl3T9HYACgkQ24/THMrX
1yywAQf/RCkaBK6Lr2KEPT6Neufxtzwn/hZQyUSLdcvLZM9CkQ+xGjQm6Foqejzx
5dN1tRH9p1C+0piDfr3IXabFwdoOK3+oDw6OikH/Y2KEZ2Ede4wCqAvcO/zs2bT8
30y9SUH6ckxowwLcu//ZHzcSQBq8UIJb7VjXpdIvV3J4EUUs7i2kUXqhMM3Uo/GB
DYbFUF1vQuaZ6sx5jCTbcdSUITHhM4+TFitsZwv6Auz/XXKKA2CjQasPxTkY39+Y
SPJb5OLGqyzS6iW1UWH5bdOUbKcrvMQOYrCryIB5cFHDAuEnFfWAXbekoVIFZmHA
xzFzOJhgYj3pAQ58/iWAFmNIE0poQQ==
=DZYw
-----END PGP SIGNATURE-----

--k4f25fnPtRuIRUb3--


--===============4321461098928925338==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============4321461098928925338==--

