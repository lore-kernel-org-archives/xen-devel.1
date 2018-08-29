From: Olaf Hering <olaf@aepfle.de>
Subject: Re: incompatible changes in staging break qemu
Date: Wed, 29 Aug 2018 14:22:05 +0200
Message-ID: <20180829122204.GE31376@aepfle.de>
References: <20180827084315.3e91117e.olaf@aepfle.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1005979266798626610=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20180827084315.3e91117e.olaf@aepfle.de>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org


--===============1005979266798626610==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="1Ow488MNN9B9o/ov"
Content-Disposition: inline


--1Ow488MNN9B9o/ov
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Mon, Aug 27, Olaf Hering wrote:

> Since about two weeks, no released qemu can be built against xen.git#staging. The error looks like that:
> qemu-20180825T130857.235c82acca/include/hw/xen/xen_common.h:677:5: error: too many arguments to function 'xc_domain_create'
> It looks like staging lacks proper compat wrappers for released qemu versions.

Passing --disable-xen-pv-domain-build instead of
--enable-xen-pv-domain-build to configure fixes/hides the build error.

What is "xen-pv-domain-build" supposed to do?


Olaf

--1Ow488MNN9B9o/ov
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCW4aP6QAKCRBdQqD6ppg2
fg8QAKCdJwi0YOvJ2/esjULPesOSYLIT3gCfaaTnZotIvdvoSOgZt64R5prik5M=
=4KkP
-----END PGP SIGNATURE-----

--1Ow488MNN9B9o/ov--


--===============1005979266798626610==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============1005979266798626610==--
