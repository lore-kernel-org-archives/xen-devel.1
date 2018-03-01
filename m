From: Olaf Hering <olaf@aepfle.de>
Subject: Re: [PATCH] tools: drop stale references to xml2-config
Date: Thu, 1 Mar 2018 15:24:46 +0100
Message-ID: <20180301152446.2510428f.olaf@aepfle.de>
References: <20180301142221.31294-1-olaf@aepfle.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7786604332967586378=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20180301142221.31294-1-olaf@aepfle.de>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

--===============7786604332967586378==
Content-Type: multipart/signed; micalg=pgp-sha1;
 boundary="Sig_/01bCUzIp0iWxOS68ww6XWQo"; protocol="application/pgp-signature"

--Sig_/01bCUzIp0iWxOS68ww6XWQo
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Thu,  1 Mar 2018 15:22:21 +0100
schrieb Olaf Hering <olaf@aepfle.de>:

> Fixes commit 185bb58be3 ("tools: drop libxen")

>  CURL_CONFIG         :=3D @CURL@
>  AC_ARG_VAR([CURL], [Path to curl-config tool])

These are stale as well. Somehow I overlooked that, will send v2.

Olaf

--Sig_/01bCUzIp0iWxOS68ww6XWQo
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCWpgNLgAKCRBdQqD6ppg2
fnqRAJ40EplW2IT9kpaKdwMVu82J5NN+BgCg8zo5QkD2xs97k4A32W2NxpBwO2g=
=n5On
-----END PGP SIGNATURE-----

--Sig_/01bCUzIp0iWxOS68ww6XWQo--


--===============7786604332967586378==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============7786604332967586378==--
