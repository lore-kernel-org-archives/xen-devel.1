From: Olaf Hering <olaf@aepfle.de>
Subject: Re: Command line options of dubious use
Date: Wed, 2 Jan 2019 17:56:43 +0100
Message-ID: <20190102165643.GA11513@aepfle.de>
References: <b442c221-62ff-eed6-4bbc-fc7599187c93@citrix.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2544391186892369524=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <b442c221-62ff-eed6-4bbc-fc7599187c93@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel List <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org


--===============2544391186892369524==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="4Ckj6UjgE2iN1+kY"
Content-Disposition: inline


--4Ckj6UjgE2iN1+kY
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Mon, Dec 31, Andrew Cooper wrote:

> * tbuf_size and tevt_mask
> Given that xentrace can set them at runtime, and it is debugging
> functionality, I don't see a plausible use the command line options at all.

'tbuf_size=-1 dom0_mem=N' collects events during boot.
xenalyze is (or was) unable to properly parse the result, but thats a
separate issue.

Olaf

--4Ckj6UjgE2iN1+kY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCXCztSAAKCRBdQqD6ppg2
fr6eAJ4kByshphlHH+WdW19d2LE+2ka+7QCg6BOFHnKONJBMXzO8T92HRUsC8YU=
=H2rz
-----END PGP SIGNATURE-----

--4Ckj6UjgE2iN1+kY--


--===============2544391186892369524==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============2544391186892369524==--
