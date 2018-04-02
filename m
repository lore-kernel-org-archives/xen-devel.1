From: Olaf Hering <olaf@aepfle.de>
Subject: Re: stubdom --disable-pv-grub has not effect
Date: Mon, 2 Apr 2018 11:40:54 +0200
Message-ID: <20180402094054.GA16356@aepfle.de>
References: <20180401201909.40cfc91d.olaf@aepfle.de>
 <20180401182943.26ontghhihrmnb7k@citrix.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7682499809674265922=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20180401182943.26ontghhihrmnb7k@citrix.com>
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


--===============7682499809674265922==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="XsQoSWH+UP9D9v3l"
Content-Disposition: inline


--XsQoSWH+UP9D9v3l
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Sun, Apr 01, Wei Liu wrote:

> No. That's a bug in our build system.

Thanks. For some reason only gcc48-4.8.3.rpm from SLE_11 is affected,
not gcc43-4.3.4.rpm from SLE_11 nor gcc48-4.8.5.rpm from SLE_12.
This fixes my packages for the time being:
sed -i '/ stubdom install-grub/d' Makefile

Olaf

--XsQoSWH+UP9D9v3l
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCWsH6ogAKCRBdQqD6ppg2
fovAAKCCkjzLGft5XL52CYeUzYzA4ZRdqACdEeLbTmlBFzWrRPmPWlt97TKfnYw=
=oUVu
-----END PGP SIGNATURE-----

--XsQoSWH+UP9D9v3l--


--===============7682499809674265922==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============7682499809674265922==--
