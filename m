From: Olaf Hering <olaf@aepfle.de>
Subject: Re: [PATCH v2] xen: add DEBUG_INFO Kconfig symbol
Date: Fri, 31 Aug 2018 10:38:54 +0200
Message-ID: <20180831083854.GC20226@aepfle.de>
References: <20180831082921.11208-1-olaf@aepfle.de>
 <20180831083216.gxvhuunogisdiinx@zion.uk.xensource.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2437215842696527810=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=elmk=lo=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1fveyF-0001He-PU
 for xen-devel@lists.xenproject.org; Fri, 31 Aug 2018 08:40:00 +0000
In-Reply-To: <20180831083216.gxvhuunogisdiinx@zion.uk.xensource.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org


--===============2437215842696527810==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="1ccMZA6j1vT5UqiK"
Content-Disposition: inline


--1ccMZA6j1vT5UqiK
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Fri, Aug 31, Wei Liu wrote:

> But what is the difference between this and DEBUG anyway?

DEBUG_INFO is for gcc (-g), DEBUG is for Kconfig.
Adding a dependency to DEBUG may change behavior, not sure what the
expected outcome of always using '-g' is.

Olaf

--1ccMZA6j1vT5UqiK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCW4j+mgAKCRBdQqD6ppg2
flftAKDkdad4ptn41teT/ELadR+A0GjMFwCg31J+MZCwWLMLMEPeDy2UVmfXI6w=
=qIMp
-----END PGP SIGNATURE-----

--1ccMZA6j1vT5UqiK--


--===============2437215842696527810==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============2437215842696527810==--
