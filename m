From: Olaf Hering <olaf@aepfle.de>
Subject: Re: [PATCH 0/2] MMIO emulation fixes
Date: Wed, 29 Aug 2018 12:36:18 +0200
Message-ID: <20180829103614.GA31376@aepfle.de>
References: <5B6D86F302000078001DCF85@prv1-mh.provo.novell.com>
 <e8cff3ca6c154b67a2a932af83719354@AMSPEX02CL03.citrite.net>
 <fdf19f7d-1b92-a9c0-3602-b1c9807bf610@citrix.com>
 <a735b4359ccc4b278330204d9790c6ac@AMSPEX02CL03.citrite.net>
 <5B6DAF9F02000078001DD040@prv1-mh.provo.novell.com>
 <e2f77af0b2394b8f859a1f2dc1a91797@AMSPEX02CL03.citrite.net>
 <5B6DB69D02000078001DD06A@prv1-mh.provo.novell.com>
 <eaab5a73-2910-7fb6-e1fc-08537e63088c@citrix.com>
 <92ca69e5-98b1-61e4-817a-3868f829471a@citrix.com>
 <5B712A3502000078001DD514@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2958389639057470432=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=ygmg=lm=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1fuxps-0007gn-JB
 for xen-devel@lists.xenproject.org; Wed, 29 Aug 2018 10:36:29 +0000
In-Reply-To: <5B712A3502000078001DD514@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul.durrant@citrix.com>, george.dunlap@citrix.com, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org


--===============2958389639057470432==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="WIyZ46R2i8wDzkSu"
Content-Disposition: inline


--WIyZ46R2i8wDzkSu
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Mon, Aug 13, Jan Beulich wrote:

> And hence the consideration of mapping in an all zeros page
> instead. This is because of the way __hvmemul_read() /
> __hvm_copy() work: The latter doesn't tell its caller how many
> bytes it was able to read, and hence the former considers the
> entire range MMIO (and forwards the request for emulation).
> Of course all of this is an issue only because
> hvmemul_virtual_to_linear() sees no need to split the request
> at the page boundary, due to the balloon driver having left in
> place the mapping of the ballooned out page.

Should perhaps __hvm_copy detect the fault and copy 0xf for the
unavailable page into 'buf', and finally return success?

Clearly something must be done at the Xen level.

Olaf

--WIyZ46R2i8wDzkSu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCW4Z3HgAKCRBdQqD6ppg2
fhfZAKDk8uHYoaNDLDyLqrD5BwIB9r2YwgCfTvEUjUqnjcV+OniGNk1WURFrkrs=
=Nac+
-----END PGP SIGNATURE-----

--WIyZ46R2i8wDzkSu--


--===============2958389639057470432==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============2958389639057470432==--
