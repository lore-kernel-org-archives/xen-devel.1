From: Olaf Hering <olaf@aepfle.de>
Subject: Re: [PATCH v1] libxl: fix device_model_version related
 assert
Date: Fri, 17 May 2019 10:24:45 +0200
Message-ID: <20190517102445.709835c8.olaf@aepfle.de>
References: <20190516125000.23559-1-olaf@aepfle.de>
 <20190516133013.GG2798@zion.uk.xensource.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8565585243473874945=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=fDGF=TR=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1hRYAm-0001q8-K7
 for xen-devel@lists.xenproject.org; Fri, 17 May 2019 08:25:01 +0000
In-Reply-To: <20190516133013.GG2798@zion.uk.xensource.com>
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

--===============8565585243473874945==
Content-Type: multipart/signed; micalg=pgp-sha1;
 boundary="Sig_//8c7EknW2ybWI_Gj=g4myKt"; protocol="application/pgp-signature"

--Sig_//8c7EknW2ybWI_Gj=g4myKt
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Thu, 16 May 2019 14:30:13 +0100
schrieb Wei Liu <wei.liu2@citrix.com>:

> @@ -457,6 +457,12 @@ int libxl_domain_need_memory(libxl_ctx *ctx,
> +    if (!b_info->device_model_version)
> +       b_info->device_model_version =3D LIBXL_DEVICE_MODEL_XXX;

I think this will work and should be applied to unbreak staging.

The proposed libxl_domain_config_finalyze(libxl_domain_config*) in the
other thread about the regression will most likely be ugly. Something
more elegant has to be found.

Olaf

--Sig_//8c7EknW2ybWI_Gj=g4myKt
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCXN5vzQAKCRBdQqD6ppg2
fi90AKCT0PecpQuXD8S90Kg37FUlNhKPUQCg8IQn2RHvfQeGSU5n5A2CNd9gIic=
=kGgl
-----END PGP SIGNATURE-----

--Sig_//8c7EknW2ybWI_Gj=g4myKt--


--===============8565585243473874945==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============8565585243473874945==--
