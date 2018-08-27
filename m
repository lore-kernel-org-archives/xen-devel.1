From: Olaf Hering <olaf@aepfle.de>
Subject: incompatible changes in staging break qemu
Date: Mon, 27 Aug 2018 08:43:15 +0200
Message-ID: <20180827084315.3e91117e.olaf@aepfle.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7289809697787178399=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
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

--===============7289809697787178399==
Content-Type: multipart/signed; micalg=pgp-sha1;
 boundary="Sig_/LAmg1/EV7E3l0YPwH9/4T.A"; protocol="application/pgp-signature"

--Sig_/LAmg1/EV7E3l0YPwH9/4T.A
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Since about two weeks, no released qemu can be built against xen.git#stagin=
g. The error looks like that:

qemu-20180825T130857.235c82acca/include/hw/xen/xen_common.h:677:5: error: t=
oo many arguments to function 'xc_domain_create'

It looks like staging lacks proper compat wrappers for released qemu versio=
ns.

Olaf

--Sig_/LAmg1/EV7E3l0YPwH9/4T.A
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCW4OdgwAKCRBdQqD6ppg2
fjVlAJ9Vmr50AGhMrCDMX5oDqNFbvu2rrwCgwDKUrx/QMOqZ1J4JFL1JnhdRgQ4=
=dnDt
-----END PGP SIGNATURE-----

--Sig_/LAmg1/EV7E3l0YPwH9/4T.A--


--===============7289809697787178399==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============7289809697787178399==--
