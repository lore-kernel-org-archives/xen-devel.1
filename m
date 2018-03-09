From: Olaf Hering <olaf@aepfle.de>
Subject: Re: [PATCH v1] x86/domctl: remove impossible condition
 in XEN_DOMCTL_getpageframeinfo3
Date: Fri, 9 Mar 2018 17:09:37 +0100
Message-ID: <20180309160937.GE12975@aepfle.de>
References: <20180309160116.16298-1-olaf@aepfle.de>
 <35524832-2900-6a73-8bf3-1d6a5d92783b@citrix.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7488301519758865888=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <35524832-2900-6a73-8bf3-1d6a5d92783b@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org


--===============7488301519758865888==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="84ND8YJRMFlzkrP4"
Content-Disposition: inline


--84ND8YJRMFlzkrP4
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 09, Andrew Cooper wrote:

> On 09/03/18 16:01, Olaf Hering wrote:
> > The value of num is always the same as domctl->u.getpageframeinfo3.num,
> > it was assigned just a few lines before.
> >
> > Signed-off-by: Olaf Hering <olaf@aepfle.de>
>=20
> This isn't dead code.=C2=A0 It is a truncation check.

How can this happen, other than num being a 32bit type?
Perhaps the type of num should match the type of i?

Olaf

--84ND8YJRMFlzkrP4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCWqKxvgAKCRBdQqD6ppg2
fvojAKDGs+nweMOn3wNP2KX9K1njsRHSiQCg7azCW09Og+7W781YNIZ0b2JSNws=
=DQ4n
-----END PGP SIGNATURE-----

--84ND8YJRMFlzkrP4--


--===============7488301519758865888==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============7488301519758865888==--
