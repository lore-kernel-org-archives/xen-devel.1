From: Olaf Hering <olaf@aepfle.de>
Subject: Re: [PATCH v1] xl: free bitmaps on exit
Date: Mon, 26 Nov 2018 16:04:08 +0100
Message-ID: <20181126160408.266d6394.olaf@aepfle.de>
References: <20181126145822.2121-1-olaf@aepfle.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4053288979342952049=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=bbsm=of=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1gRIR5-0001Cb-2X
 for xen-devel@lists.xenproject.org; Mon, 26 Nov 2018 15:04:31 +0000
In-Reply-To: <20181126145822.2121-1-olaf@aepfle.de>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Wei Liu <wei.liu2@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

--===============4053288979342952049==
Content-Type: multipart/signed; micalg=pgp-sha1;
 boundary="Sig_/T7CRPvcqeXzygirF6q6K8fG"; protocol="application/pgp-signature"

--Sig_/T7CRPvcqeXzygirF6q6K8fG
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Mon, 26 Nov 2018 15:58:22 +0100
schrieb Olaf Hering <olaf@aepfle.de>:

> +++ b/tools/xl/xl.c
> @@ -229,6 +229,9 @@ static void parse_global_config(const char *configfil=
e,

Actually I think that should go to xl_ctx_free() instead. I moved it down t=
o parse_global_config() by accident.

Olaf

--Sig_/T7CRPvcqeXzygirF6q6K8fG
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCW/wLaAAKCRBdQqD6ppg2
fr5CAKD6RJW7hy1SOiHjgQqpLoOMqZw37QCg6yZd9ft0zkjYeVPYAPx2sVlfE+Y=
=i44i
-----END PGP SIGNATURE-----

--Sig_/T7CRPvcqeXzygirF6q6K8fG--


--===============4053288979342952049==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============4053288979342952049==--
