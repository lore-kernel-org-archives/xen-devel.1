From: Olaf Hering <olaf@aepfle.de>
Subject: Re: how to recognize in libxl that a domU has qemu-xen
 attached?
Date: Thu, 17 May 2018 16:54:00 +0200
Message-ID: <20180517165400.6b9b9825.olaf@aepfle.de>
References: <20180517143352.1227b39e.olaf@aepfle.de>
 <f4845c2b-d967-7b3b-b567-d83e18fb6f66@suse.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2954199439183598187=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <f4845c2b-d967-7b3b-b567-d83e18fb6f66@suse.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

--===============2954199439183598187==
Content-Type: multipart/signed; micalg=pgp-sha1;
 boundary="Sig_/d0XBgyXfhmUSISIZCsFyVRP"; protocol="application/pgp-signature"

--Sig_/d0XBgyXfhmUSISIZCsFyVRP
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Thu, 17 May 2018 14:55:10 +0200
schrieb Juergen Gross <jgross@suse.com>:

> libxl__need_xenpv_qemu() is used to determine whether a pv domain needs
> a qemu process for at least one backend.=20

Thanks. Too bad, d_config is not available in that context. It is probably =
known somewhere by the callers. I guess such caller needs to pass a bool do=
wn to suspend/resume.

Olaf

--Sig_/d0XBgyXfhmUSISIZCsFyVRP
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCWv2XiAAKCRBdQqD6ppg2
fqO6AJwO6q8MALVamphT5c4eYXZo+oV5IACfegIYxjSf3fEcgWMWsTDs0uh08jE=
=6p01
-----END PGP SIGNATURE-----

--Sig_/d0XBgyXfhmUSISIZCsFyVRP--


--===============2954199439183598187==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============2954199439183598187==--
