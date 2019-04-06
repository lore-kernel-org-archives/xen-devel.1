From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Subject: Re: Xen 4.11.1: gdbsx fails - stable backport request
Date: Sat, 6 Apr 2019 23:07:06 +0200
Message-ID: <20190406210706.GA1343@mail-itl>
References: <CAFLDOk90XmXO+HF5evXqHNO48-pckHphNRpoMemx0u4L9NFMQQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7684679022757623211=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=lmQc=SI=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1hCsWv-00084T-8E
 for xen-devel@lists.xenproject.org; Sat, 06 Apr 2019 21:07:13 +0000
In-Reply-To: <CAFLDOk90XmXO+HF5evXqHNO48-pckHphNRpoMemx0u4L9NFMQQ@mail.gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Matt Leinhos <matthew.leinhos@gmail.com>
Cc: xen-devel@lists.xenproject.org, Ian Jackson <Ian.Jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org


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
