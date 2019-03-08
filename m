From: Olaf Hering <olaf@aepfle.de>
Subject: Re: [PATCH v2] libxl: prepare environment for
 domcreate_stream_done
Date: Fri, 8 Mar 2019 15:43:18 +0100
Message-ID: <20190308154318.287deb1e.olaf@aepfle.de>
References: <20190308122415.29972-1-olaf@aepfle.de>
 <23682.30538.373590.52177@mariner.uk.xensource.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6427948533002427993=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=bKkW=RL=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1h2Gif-0003DQ-Pa
 for xen-devel@lists.xenproject.org; Fri, 08 Mar 2019 14:43:30 +0000
In-Reply-To: <23682.30538.373590.52177@mariner.uk.xensource.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Ian Jackson <ian.jackson@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

--===============6427948533002427993==
Content-Type: multipart/signed; micalg=pgp-sha1;
 boundary="Sig_/Dloj=gwgUAKkGGyvPMgArDs"; protocol="application/pgp-signature"

--Sig_/Dloj=gwgUAKkGGyvPMgArDs
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Fri, 8 Mar 2019 14:08:10 +0000
schrieb Ian Jackson <ian.jackson@citrix.com>:

> In fact this is OK because domcreate_stream_done only reads srs->dcs
> and then does everything with the obtained dcs.  But there is nothing
> there to indicate that srs might be mostly uninitialised.  Maybe we
> could add a comment there, something like:
>=20
>   /* NB perhaps only srs->dcs is valid; eg in the case of an
>    * early branch to domcreate_bootloader_done's `out' block */

I'm find with that. Can this comment be adjusted at commit time?

Olaf

--Sig_/Dloj=gwgUAKkGGyvPMgArDs
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCXIJ/hgAKCRBdQqD6ppg2
fomaAKDvec1/AjXCAsdOu5UhFTOiqQ9XOACg2gXIuqvjr02gK3FMra3L0hrgLS8=
=yG3l
-----END PGP SIGNATURE-----

--Sig_/Dloj=gwgUAKkGGyvPMgArDs--


--===============6427948533002427993==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============6427948533002427993==--
