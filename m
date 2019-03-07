From: Olaf Hering <olaf@aepfle.de>
Subject: Re: [PATCH v1] libxl: prepare environment for
 domcreate_stream_done
Date: Thu, 7 Mar 2019 12:53:38 +0100
Message-ID: <20190307125338.253995f8.olaf@aepfle.de>
References: <20190307105649.8919-1-olaf@aepfle.de>
 <20190307110247.xrex66v2z4kvpqdp@zion.uk.xensource.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0514188297479611606=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=LPx7=RK=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1h1rb6-0007nc-5q
 for xen-devel@lists.xenproject.org; Thu, 07 Mar 2019 11:54:00 +0000
In-Reply-To: <20190307110247.xrex66v2z4kvpqdp@zion.uk.xensource.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: xen-devel@lists.xenproject.org, Ian Jackson <ian.jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

--===============0514188297479611606==
Content-Type: multipart/signed; micalg=pgp-sha1;
 boundary="Sig_/+fkz5BASh5AjlFX6dJhASX3"; protocol="application/pgp-signature"

--Sig_/+fkz5BASh5AjlFX6dJhASX3
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Thu, 7 Mar 2019 11:02:47 +0000
schrieb Wei Liu <wei.liu2@citrix.com>:

> Have you seen the field been set before entering this function? Or is
> the if () just a precaution?

Sorry, this is not the variant I intended to send.
The assignment was supposed to be unconditionally.

Today I browsed the code and it was not clear if that backpointer
is really required. Does anyone know if srs->dcs can ever be something
else than the dcs which contains that srs?

Olaf

--Sig_/+fkz5BASh5AjlFX6dJhASX3
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCXIEGQgAKCRBdQqD6ppg2
fjUbAKCcczmnsSr9LWklCMF4v4FWoQd3rACfbUreA/OSfkWf/htUygvfFenMhI0=
=18XK
-----END PGP SIGNATURE-----

--Sig_/+fkz5BASh5AjlFX6dJhASX3--


--===============0514188297479611606==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============0514188297479611606==--
