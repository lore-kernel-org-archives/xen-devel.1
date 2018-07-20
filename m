From: Olaf Hering <olaf@aepfle.de>
Subject: Re: CPU flags disappear on Spectre enabled host
Date: Fri, 20 Jul 2018 11:58:38 +0200
Message-ID: <20180720115838.46ad7cab.olaf@aepfle.de>
References: <20180720112156.69e44899.olaf@aepfle.de>
 <10e3d9ac-eb07-ded9-8538-83a8a036a173@citrix.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7644489902241821882=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <10e3d9ac-eb07-ded9-8538-83a8a036a173@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

--===============7644489902241821882==
Content-Type: multipart/signed; micalg=pgp-sha1;
 boundary="Sig_/2ZJ0YVT26vhkB=F.Csobt2W"; protocol="application/pgp-signature"

--Sig_/2ZJ0YVT26vhkB=F.Csobt2W
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Fri, 20 Jul 2018 10:38:30 +0100
schrieb Andrew Cooper <andrew.cooper3@citrix.com>:

> On 20/07/18 10:21, Olaf Hering wrote:
> > Is the loss of cpuflags intentional? =20
> Yes, but they've got nothing to do with Spectre.

Thank you, Andrew. After a few more reboots I figured that booting without =
any cmdline option makes no difference.

=46rom the original report that I got, these additional flags disappeared:

cqm_llc
cqm_occup_llc
pln
pts

I assume a domU can not make use of them either? They are not listed in CPU=
ID in wikipedia, perhaps just not with those names.

Olaf

--Sig_/2ZJ0YVT26vhkB=F.Csobt2W
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCW1GyTgAKCRBdQqD6ppg2
fuPEAKDXPc+zreaeCyoT1VLt4N5z3fHzBACgyFaGOU61P3YFfJIGqnNt6DrcIAc=
=mMno
-----END PGP SIGNATURE-----

--Sig_/2ZJ0YVT26vhkB=F.Csobt2W--


--===============7644489902241821882==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============7644489902241821882==--
