From: Olaf Hering <olaf@aepfle.de>
Subject: Re: [PATCH v2] xl: free bitmaps on exit
Date: Tue, 27 Nov 2018 18:09:33 +0100
Message-ID: <20181127180933.5fe93cec.olaf@aepfle.de>
References: <20181127100608.4197-1-olaf@aepfle.de>
 <20181127165538.7xglqre6psla42kq@zion.uk.xensource.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3451642881170553146=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=1451=og=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1gRgrz-00007X-2A
 for xen-devel@lists.xenproject.org; Tue, 27 Nov 2018 17:09:55 +0000
In-Reply-To: <20181127165538.7xglqre6psla42kq@zion.uk.xensource.com>
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

--===============3451642881170553146==
Content-Type: multipart/signed; micalg=pgp-sha1;
 boundary="Sig_/7FlSKRbYP_Kfkx+r_a5j5fI"; protocol="application/pgp-signature"

--Sig_/7FlSKRbYP_Kfkx+r_a5j5fI
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Tue, 27 Nov 2018 16:55:38 +0000
schrieb Wei Liu <wei.liu2@citrix.com>:

> Looking more closely into this, these lines should be moved even
> earlier before the call to libxl_ctx_alloc -- there is an exit there.

Is it required to install the atexit handler before alloc()?
To me it looks like atexit(xl_ctx_free) should be done right after, or insi=
de, xl_ctx_alloc().

Olaf

--Sig_/7FlSKRbYP_Kfkx+r_a5j5fI
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCW/16TgAKCRBdQqD6ppg2
ft1dAJ0W3muL6VEEnVtz3EsgQh93xg0TbACffGroRjMDiB5RvN+Ng/4o0c3EhnY=
=KxCC
-----END PGP SIGNATURE-----

--Sig_/7FlSKRbYP_Kfkx+r_a5j5fI--


--===============3451642881170553146==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============3451642881170553146==--
