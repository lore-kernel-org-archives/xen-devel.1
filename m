From: Olaf Hering <olaf@aepfle.de>
Subject: Re: [PATCH v2] xen: add DEBUG_INFO Kconfig symbol
Date: Fri, 31 Aug 2018 11:02:15 +0200
Message-ID: <20180831090215.GD20226@aepfle.de>
References: <20180831082921.11208-1-olaf@aepfle.de>
 <5B88FFBB02000078001E3CA8@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7180343696512320133=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=elmk=lo=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1fvfK1-0004Dn-RA
 for xen-devel@lists.xenproject.org; Fri, 31 Aug 2018 09:02:30 +0000
In-Reply-To: <5B88FFBB02000078001E3CA8@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org


--===============7180343696512320133==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="0/kgSOzhNoDC5T3a"
Content-Disposition: inline


--0/kgSOzhNoDC5T3a
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Fri, Aug 31, Jan Beulich wrote:

> Perhaps better move your addition into this conditional section?

Then -g would disappear when DEBUG is disabled. Is that intentional?

Olaf

--0/kgSOzhNoDC5T3a
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCW4kEEAAKCRBdQqD6ppg2
fux7AJ9bsIc/aoVvSXvhc60obXx+VNSw4wCg+JW5+eRe8D8q7Ue/vimhDMig+ds=
=3BgV
-----END PGP SIGNATURE-----

--0/kgSOzhNoDC5T3a--


--===============7180343696512320133==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============7180343696512320133==--
