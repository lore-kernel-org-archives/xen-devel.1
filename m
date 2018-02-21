From: Olaf Hering <olaf@aepfle.de>
Subject: Re: [PATCH] domctl: revert double increment of domctl
	version
Date: Wed, 21 Feb 2018 18:46:34 +0100
Message-ID: <20180221184634.1cc375eb.olaf@aepfle.de>
References: <20180221173422.10550-1-olaf@aepfle.de>
 <20180221173802.4asubsivkejs2ihy@citrix.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6215664251738882608=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20180221173802.4asubsivkejs2ihy@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

--===============6215664251738882608==
Content-Type: multipart/signed; micalg=pgp-sha1;
 boundary="Sig_/bud+lgFknB/z8BjytNkE1ca"; protocol="application/pgp-signature"

--Sig_/bud+lgFknB/z8BjytNkE1ca
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Wed, 21 Feb 2018 17:38:03 +0000
schrieb Wei Liu <wei.liu2@citrix.com>:

> The reason we bumped the number twice is because we want a dedicated
> number to denote the recent security fix.

Thanks, that was no clear from the commit messages.

Olaf

--Sig_/bud+lgFknB/z8BjytNkE1ca
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCWo2wegAKCRBdQqD6ppg2
fhL9AJ9FBqwBDhOuooOU4HEbrQ0uBFVfJgCfc3dYErRNNPhVIYLfDOuhP2UBcCg=
=sFSO
-----END PGP SIGNATURE-----

--Sig_/bud+lgFknB/z8BjytNkE1ca--


--===============6215664251738882608==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============6215664251738882608==--
