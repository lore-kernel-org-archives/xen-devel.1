From: Simon Gaiser <simon@invisiblethingslab.com>
Subject: Re: PVH backports to 4.9 and 4.8
Date: Tue, 23 Jan 2018 04:06:00 +0000
Message-ID: <9251050a-48ef-f8af-22da-a789a3afcbc5@invisiblethingslab.com>
References: <d06762c0-049e-0f9a-c674-e9bee70ec5c6@citrix.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6645873155136015617=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <d06762c0-049e-0f9a-c674-e9bee70ec5c6@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: George Dunlap <george.dunlap@citrix.com>, "xen-devel@lists.xen.org" <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============6645873155136015617==
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="pKuKjxoRm1xBtcj5Dq9TRZw76TeE9wUsY"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--pKuKjxoRm1xBtcj5Dq9TRZw76TeE9wUsY
Content-Type: multipart/mixed; boundary="fUUl9WHFOaBCzUk3lbqMEPX2rvKtuzfsl";
 protected-headers="v1"
From: Simon Gaiser <simon@invisiblethingslab.com>
To: George Dunlap <george.dunlap@citrix.com>,
 "xen-devel@lists.xen.org" <xen-devel@lists.xen.org>
Message-ID: <9251050a-48ef-f8af-22da-a789a3afcbc5@invisiblethingslab.com>
Subject: Re: [Xen-devel] PVH backports to 4.9 and 4.8
References: <d06762c0-049e-0f9a-c674-e9bee70ec5c6@citrix.com>
In-Reply-To: <d06762c0-049e-0f9a-c674-e9bee70ec5c6@citrix.com>

--fUUl9WHFOaBCzUk3lbqMEPX2rvKtuzfsl
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

George Dunlap:
> Part of our solution to XSA-254 SP3 (aka "Meltdown") is to backport
> the PVH mode from 4.10 to 4.9 and 4.8.  This will first allow people
> able to run PVH kernels to switch their PV guests directly to PVH
> guests; and second, eventually enable the backport of patches which
> will enable transparent changing of PV guests into PVH guests.
>=20
> All of the hypervisor support seems to have existed already in 4.8, so
> the only backports involve toolstack patches.
>=20
> I've put up two trees for a first-cut backport of the PVH
> functionality, to 4.9 and 4.8 here:
>=20
> git://xenbits.xen.org/people/gdunlap/xen.git
>=20
> Branches out/pvh-backport/4.8/v1 and out/pvh-backport/4.9/v1
>=20
> Below are the patches backported from 4.10 to 4.9 (23 patches total):
[...]

So future 4.8 releases will include the backports, right? Asking because
the AFAICS the 4.8.3-pre-shim-comet branch include them but staging-4.8
does not.

Simon


--fUUl9WHFOaBCzUk3lbqMEPX2rvKtuzfsl--

--pKuKjxoRm1xBtcj5Dq9TRZw76TeE9wUsY
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE3E8ezGzG3N1CTQ//kO9xfO/xly8FAlpmtLkACgkQkO9xfO/x
ly9RIhAAjLPGTPSq5YPrtqZIof/IbnLh4iiWcw+vMWUKAWtbpvc7sknrw6y0jQqU
5lJOA6lV7EyabagH3EugPbrJ428NKQdQhuy/YHq6sPVts8WY5HvHSMjFzKntoOuZ
+Ox2UGQaalFvaL9jlr7ETruaisvA4MQGA1VuAi3BtUKkC6fzoOEK0w74/NyeBt3U
U73htdxDY+LAq3DuEXwk39np3iUeNS+OTkaAzTQtlrNA1o5BD2ndPoIrb1BYMtI7
VsY/6fGUAWPMehhTyA5gBSvhPhKh3D3H+tmA0bzD/0+nxkLC1XuH40oQ+f/DKJaM
u/BG2+IS/NWFfeiYdqpD88GKQe+jgEOTyBmsgs6P9a/DKG6DBRlBat73OFJCzxhE
YxO0yNLPAJ9nxgrEnuJKPmJEqhD9L/cSE7ijyUgF+cMc62YOZLale7tDq2ZcQc1c
W4pfkkz2kJgPP0Dd8LaM1N8497jb1jP0kEuw4di0lwrbootz/B2PpHOb47PNzcnz
aNtqT6dCdDtnGf9hfPY/PHzFEmzlaCug7ux+XjFj35D1vqxFhKMLHWRxtfE8q1Wc
o3J4ioCJYF3ahCWGBO2GfIkyr3QxO6hpQFHV75aKWJ6JkRpZf4HEaPyCnNkvWtdA
lIoqXzPP+Q5aB8uEDUlmUB6ZPLXsLB+wPmxr3BUDwAlEArwfnhE=
=ioXX
-----END PGP SIGNATURE-----

--pKuKjxoRm1xBtcj5Dq9TRZw76TeE9wUsY--


--===============6645873155136015617==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============6645873155136015617==--
