From: Olaf Hering <olaf@aepfle.de>
Subject: Re: stubdom --disable-pv-grub has not effect
Date: Mon, 2 Apr 2018 11:50:31 +0200
Message-ID: <20180402115031.543fe0db.olaf@aepfle.de>
References: <20180401201909.40cfc91d.olaf@aepfle.de>
 <20180401182943.26ontghhihrmnb7k@citrix.com>
 <20180402094054.GA16356@aepfle.de>
 <20180402094423.rrvovcg2fflxdgn4@citrix.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0700959261893077269=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20180402094423.rrvovcg2fflxdgn4@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

--===============0700959261893077269==
Content-Type: multipart/signed; micalg=pgp-sha1;
 boundary="Sig_/CJjll.aIhflxlS4n0txpsiF"; protocol="application/pgp-signature"

--Sig_/CJjll.aIhflxlS4n0txpsiF
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Mon, 2 Apr 2018 10:44:23 +0100
schrieb Wei Liu <wei.liu2@citrix.com>:

> I suppose you hit some sort of compile error because pv-grub has rotten?

A post-build check scans the build log for warnings. Some of them are seen =
as fatal, and the otherwise successful build is marked as FAIL, no rpm pack=
age is provided. Since I have no need for pvgrub, disabling it seems like t=
he obvious choice.

Olaf

--Sig_/CJjll.aIhflxlS4n0txpsiF
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCWsH85wAKCRBdQqD6ppg2
fsXmAJ9xdMGs/UoIULukKcDqJiAzkngXGwCeOECf5PA8mT0CZcV5NXmCP4Ezh0U=
=U/kS
-----END PGP SIGNATURE-----

--Sig_/CJjll.aIhflxlS4n0txpsiF--


--===============0700959261893077269==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============0700959261893077269==--
