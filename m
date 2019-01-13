From: Olaf Hering <olaf@aepfle.de>
Subject: Re: [PATCH] tools/firmware: update OVMF Makefile
Date: Sun, 13 Jan 2019 21:17:44 +0100
Message-ID: <20190113201744.GA11328@aepfle.de>
References: <20181128174333.15672-1-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2985147748612769645=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Tk7n=PV=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1gimCj-00024X-OA
 for xen-devel@lists.xenproject.org; Sun, 13 Jan 2019 20:17:58 +0000
In-Reply-To: <20181128174333.15672-1-wei.liu2@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org, Ian Jackson <ian.jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org


--===============2985147748612769645==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="3V7upXqbjpZ4EhLz"
Content-Disposition: inline


--3V7upXqbjpZ4EhLz
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Wed, Nov 28, Wei Liu wrote:

> OVMF has become dependent on OpenSSL, which it is included as a submodule.
> Initialise submodules before building.

> +++ b/tools/firmware/ovmf-makefile
>  build:
> +	$(GIT) submodule update --init --recursive

At least ef529e6ab7c31290a33045bb1f1837447cc0eb56 seems to have no
submodules. Also the referenced qemu-xen.git has submodules, but
building xen.git works fine if none of the download-on-demand extra
sources are actually git trees. I have not checked how qemu-xen.git
would get its submodules, but today there is most likely no
"$(GIT) submodule" call in the "build" make target.

I think to fix the build breakage introduced by b16281870 this call must
be moved somewhere else.

Olaf

--3V7upXqbjpZ4EhLz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCXDuc5QAKCRBdQqD6ppg2
frvuAKDFkVb9aTQDjBWodpB4upXlP8IQgQCePR8IOvJrNLxBStWHQ8SwI7y7h6M=
=vCZN
-----END PGP SIGNATURE-----

--3V7upXqbjpZ4EhLz--


--===============2985147748612769645==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============2985147748612769645==--
