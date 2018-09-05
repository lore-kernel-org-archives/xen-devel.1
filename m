From: Olaf Hering <olaf@aepfle.de>
Subject: Re: [PATCH v2 1/2] x86/HVM: drop
 hvm_fetch_from_guest_linear()
Date: Wed, 5 Sep 2018 09:20:50 +0200
Message-ID: <20180905092050.2867375d.olaf@aepfle.de>
References: <5B87CF6302000078001E37A6@prv1-mh.provo.novell.com>
 <5B8D561F02000078001E4BED@prv1-mh.provo.novell.com>
 <5B8D56B102000078001E4C08@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6933701488316579961=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=domh=lt=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1fxS7d-0006iv-65
 for xen-devel@lists.xenproject.org; Wed, 05 Sep 2018 07:21:05 +0000
In-Reply-To: <5B8D56B102000078001E4C08@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Paul Durrant <paul.durrant@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org

--===============6933701488316579961==
Content-Type: multipart/signed; micalg=pgp-sha1;
 boundary="Sig_/2pvyh5cK8Lb5WJcS4Vp4LG0"; protocol="application/pgp-signature"

--Sig_/2pvyh5cK8Lb5WJcS4Vp4LG0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Mon, 03 Sep 2018 09:43:45 -0600
schrieb "Jan Beulich" <JBeulich@suse.com>:

> It can easily be expressed through hvm_copy_from_guest_linear(), and in
> two cases this even simplifies callers.
>=20
> Suggested-by: Paul Durrant <paul.durrant@citrix.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

Tested-by: Olaf Hering <olaf@aepfle.de>

Olaf

--Sig_/2pvyh5cK8Lb5WJcS4Vp4LG0
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCW4+D0gAKCRBdQqD6ppg2
fmboAJ93IHG4XH8AtJebJnzNTZjjmIZDAgCg4FNejK07oxY3T363mNGx8ab5Gi8=
=kocC
-----END PGP SIGNATURE-----

--Sig_/2pvyh5cK8Lb5WJcS4Vp4LG0--


--===============6933701488316579961==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============6933701488316579961==--
