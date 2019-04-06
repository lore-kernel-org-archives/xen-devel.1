Return-Path: <SRS0=ef4D=SI=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A124C10F06
	for <xen-devel@archiver.kernel.org>; Sat,  6 Apr 2019 21:07:32 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E3034213F2
	for <xen-devel@archiver.kernel.org>; Sat,  6 Apr 2019 21:07:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="VkKwAVnW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E3034213F2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=invisiblethingslab.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hCsWw-00084Y-25; Sat, 06 Apr 2019 21:07:14 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=lmQc=SI=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1hCsWv-00084T-8E
 for xen-devel@lists.xenproject.org; Sat, 06 Apr 2019 21:07:13 +0000
X-Inumbo-ID: f214c62c-58af-11e9-92d7-bc764e045a96
Received: from out2-smtp.messagingengine.com (unknown [66.111.4.26])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id f214c62c-58af-11e9-92d7-bc764e045a96;
 Sat, 06 Apr 2019 21:07:11 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id 59FF821BCA;
 Sat,  6 Apr 2019 17:07:11 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute7.internal (MEProxy); Sat, 06 Apr 2019 17:07:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=cc5ETP
 tu4ZcVJTYt3q7tj3VNGc95PGP+gdI3bkVD1Y4=; b=VkKwAVnWnX9uOuBlyNBjre
 RVRsJ17Qnyf2uRuWgXbGI9K64wtfj5zhb8p0TFayBY50PKjveBrNvQFiZOfsk3RN
 BIKYJPLljhZCzADZPgRn0Z815SjuzGkFlnoiZ423KQUtnfsZkINdEaHGEY4SbmZF
 B5UDSF58lSTI4E6WKmgCfEQKJhgDHBcg/5ihluQKsmbj0YvEDodvOrqdhwBxyB70
 Vxie/jgzf+YMjVOj8XUHx6VhUmVtUi/RI4ucvv3G/Y+miUUSPjFnBEtMmdhu8EEt
 ySYutbBXAS8Zicot/UWJFlm6kc0eCcFE+0JBhsSRbjqu7hHRHkq4PenzfkSLewxA
 ==
X-ME-Sender: <xms:_hSpXOGCG8sav3SEWZL3GFlmQIpfV-a0vuq8L7FewIm132jnr8GteA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrtdelgdduheehucdltddurdeguddtrddttd
 dmucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfv
 pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
 gvnhhtshculddquddttddmnecujfgurhepfffhvffukfhfgggtuggjfgesghdtreertder
 jeenucfhrhhomhepofgrrhgvkhcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuc
 eomhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecu
 ffhomhgrihhnpeigvghnrdhorhhgnecukfhppeeluddrieehrdefgedrfeefnecurfgrrh
 grmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhg
 shhlrggsrdgtohhmnecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:_hSpXAgz3DQQdmgeg3yWJZlo-sKLt4H2P8VT8VyYfhjq6vCaT_PV1w>
 <xmx:_hSpXInUtTcipJ9MPVg8wi2-RcdIx8SIZxzi0r-tpwpN3fl8rocjew>
 <xmx:_hSpXBcY9k0Oq6PzTVj7kipm92GilCaE9ucmDTVHxpLDSudm-6lI-A>
 <xmx:_xSpXGyvxk-GD_9p51BSjRnVzEFxntGXlmPNO2sa0pBz6CTnp9Q5aQ>
Received: from mail-itl (ip5b412221.dynamic.kabel-deutschland.de [91.65.34.33])
 by mail.messagingengine.com (Postfix) with ESMTPA id B5D4010380;
 Sat,  6 Apr 2019 17:07:09 -0400 (EDT)
Date: Sat, 6 Apr 2019 23:07:06 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
To: Matt Leinhos <matthew.leinhos@gmail.com>
Message-ID: <20190406210706.GA1343@mail-itl>
References: <CAFLDOk90XmXO+HF5evXqHNO48-pckHphNRpoMemx0u4L9NFMQQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFLDOk90XmXO+HF5evXqHNO48-pckHphNRpoMemx0u4L9NFMQQ@mail.gmail.com>
User-Agent: Mutt/1.11.1+94 (9b965fac) (2019-01-05)
Subject: Re: [Xen-devel] Xen 4.11.1: gdbsx fails - stable backport request
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
Cc: xen-devel@lists.xenproject.org, Ian Jackson <Ian.Jackson@eu.citrix.com>,
 Jan Beulich <jbeulich@suse.com>
Content-Type: multipart/mixed; boundary="===============7684679022757623211=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190406210706.fB910uEHdwiUXEbawj_AsmP0l7ILFQjR5PElYHpUa6A@z>


--===============7684679022757623211==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="tThc/1wpZn/ma/RB"
Content-Disposition: inline


--tThc/1wpZn/ma/RB
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 05, 2019 at 04:48:16PM -0500, Matt Leinhos wrote:
> Greetings:
>=20
> I've encountered a problem running gdb + gdbsx on Xen 4.11.1, running Lin=
ux
> kernel 4.18.0-15 on Ubuntu 18.04. Pertinent info is below.
>=20
> I've observed this behavior with gdb 8.0, 8.1.1 and 8.2. I've also seen it
> on Xen 4.9.2. In short, something is broken with my system, but I don't
> know how to investigate.

(...)

> Truncated register 26 in remote 'g' packet

This is already fixed in Xen 4.12:
https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dcommit;h=3D0c9821d5c870c35a=
a38df7bb5e2ff54da2169b5b

I'm proposing this for a backport to stable branches:
0c9821d5c8 tools/gdbsx: fix 'g' packet response for 64bit guests

It may also be reasonable to backport other gdbsx related commits.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--tThc/1wpZn/ma/RB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEyBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAlypFPgACgkQ24/THMrX
1yzsGAf1HtpgyJkMtySPhRluGYHUr4NTmHYFVIcIZ4ue1MuL34+rPWvJvMaGHmyM
HUX1fH8lbwwNbFvy61V0qhaiFuOzGIHwciVbmT97wSiMgr0qlooVXC/BTBlorFE0
4Y7w73xouOFH5Gw92+GT87QO6P0p9LGnhP0BYCSdPClg2G4JnfPKW1Um1N6pRKBY
lI0kP0PUh/bXP9qPex8o6kzv3Urn6iyBSaQ2zXvhMKypquyVsSFp2RPlqC5t8o1Z
M1F61nUyODMhvGwaPeVwOWREo//h8347JOESnOHeeXI/UTdJJB8ZXQ5PGksbpHcd
PMJ4Wg7GqZwEbEJrqssik4V0Uy+x
=Bycb
-----END PGP SIGNATURE-----

--tThc/1wpZn/ma/RB--


--===============7684679022757623211==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============7684679022757623211==--

