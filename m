From: Olaf Hering <olaf@aepfle.de>
Subject: staging fails to build due to missing qemu patch for
	memfd_create
Date: Fri, 9 Mar 2018 12:05:18 +0100
Message-ID: <20180309110517.GC12975@aepfle.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2161159341660084011=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=1s9y=f7=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1euFq0-0005g7-4q
 for xen-devel@lists.xenproject.org; Fri, 09 Mar 2018 11:05:24 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: anthony.perard@citrix.com, ian.jackson@citrix.com, wei.liu2@citrix.com
Cc: xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org


--===============2161159341660084011==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="tqI+Z3u+9OQ7kwn0"
Content-Disposition: inline


--tqI+Z3u+9OQ7kwn0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Please update the qemu-xen tree to include 75e5b70e6b ("memfd: fix
configure test"). Currently xen.git#staging fails like this:

xen-staging/tools/qemu-xen-dir/util/memfd.c:40:12: error: static declaration of 'memfd_create' follows non-static declaration

Thank you.

Olaf

--tqI+Z3u+9OQ7kwn0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCWqJqawAKCRBdQqD6ppg2
fsE4AJ4siYhe0STIh3aCLrwhvFC7KZ59BwCggamPrHMvtatUlFG2kJIpRE/EJCg=
=Avm5
-----END PGP SIGNATURE-----

--tqI+Z3u+9OQ7kwn0--


--===============2161159341660084011==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============2161159341660084011==--
