From: Olaf Hering <olaf@aepfle.de>
Subject: Re: seabios regression in staging
Date: Thu, 29 Mar 2018 16:53:41 +0200
Message-ID: <20180329145341.GO30726@aepfle.de>
References: <20180329114243.GN30726@aepfle.de>
 <20180329142901.wuso5qz647kkmqhp@citrix.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============9110257948923308691=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20180329142901.wuso5qz647kkmqhp@citrix.com>
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


--===============9110257948923308691==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="MdEjg5WkSuUg8x46"
Content-Disposition: inline


--MdEjg5WkSuUg8x46
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Thu, Mar 29, Wei Liu wrote:

> Do you use a non-default seabios configuration? Osstest seems to be
> happy with the update.

Not sure how I would create a non-default seabios or toolchain build.

osstest does not use SLE11, so it can not possibly spot such compile
errors. It would certainly be cool if there would be a test with very
old and very new toolchain.

Olaf

--MdEjg5WkSuUg8x46
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCWrz98gAKCRBdQqD6ppg2
frt8AJ95m7tqDVVdJZBHKLIV+vBOzA9cYQCggDdsKVcmwU8syLPzFrT95/EIvGc=
=0kH9
-----END PGP SIGNATURE-----

--MdEjg5WkSuUg8x46--


--===============9110257948923308691==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============9110257948923308691==--
