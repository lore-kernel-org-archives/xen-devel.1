From: Olaf Hering <olaf@aepfle.de>
Subject: Re: fuzz/wrappers.c fails to build due to missing
 x86-emulate.h
Date: Thu, 29 Mar 2018 13:34:01 +0200
Message-ID: <20180329113401.GM30726@aepfle.de>
References: <20180329094605.GK30726@aepfle.de>
 <5ABCD63102000078001B71CD@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7374378408537097837=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <5ABCD63102000078001B71CD@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org


--===============7374378408537097837==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="sMkrXc3gAYLRVOjR"
Content-Disposition: inline


--sMkrXc3gAYLRVOjR
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Thu, Mar 29, Jan Beulich wrote:

> wrappers.o: $(x86_emulate.h)

Thanks. This did probably help, the build got further. Will send a patch.
But another unrelated regression appeared.

Olaf

--sMkrXc3gAYLRVOjR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCWrzPJQAKCRBdQqD6ppg2
fnYsAJ4gGUOtBNitT+Tllzd+mMrIYgxqGwCgq3pVjMOxeb9fI8VyIskeI4W+ryo=
=6DTi
-----END PGP SIGNATURE-----

--sMkrXc3gAYLRVOjR--


--===============7374378408537097837==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============7374378408537097837==--
