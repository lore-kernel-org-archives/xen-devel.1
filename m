From: Olaf Hering <olaf@aepfle.de>
Subject: Re: migration regression in xen-4.11 and qemu-2.11 and
 qcow2
Date: Tue, 8 May 2018 18:40:26 +0200
Message-ID: <20180508184026.4f0af76a.olaf@aepfle.de>
References: <20180507151940.GA31926@aepfle.de>
 <20180508133143.77e209f2.olaf@aepfle.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0786139232546930344=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20180508133143.77e209f2.olaf@aepfle.de>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

--===============0786139232546930344==
Content-Type: multipart/signed; micalg=pgp-sha1;
 boundary="Sig_/B.88+wD6yi2RDw0FXoG_Bq9"; protocol="application/pgp-signature"

--Sig_/B.88+wD6yi2RDw0FXoG_Bq9
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Tue, 8 May 2018 13:31:43 +0200
schrieb Olaf Hering <olaf@aepfle.de>:

> On the sending side offset 0xc9 is unlocked on the other fd, which allows=
 F_WRLCK to succeed:
>=20
> It seems on the receiving side some code forgets to unclock offset 0xc9, =
which causes F_WRLCK to fail:

It looks like the IDE unplug is not permanent.
On the receiving side the IDE disk is reattached, and it keeps the qcow2 im=
age busy.
Does anyone happen to know how to make the unplug permanent, at least for t=
he blocklayer?

Olaf

--Sig_/B.88+wD6yi2RDw0FXoG_Bq9
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCWvHS+gAKCRBdQqD6ppg2
fu9wAKDyf3VPsrgamZFCyeKPfnBJs/VfZwCgp+tLVPW29ptVk07un4c6fpSokS4=
=0Oh+
-----END PGP SIGNATURE-----

--Sig_/B.88+wD6yi2RDw0FXoG_Bq9--


--===============0786139232546930344==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============0786139232546930344==--
