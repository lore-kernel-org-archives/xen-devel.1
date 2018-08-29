From: Olaf Hering <olaf@aepfle.de>
Subject: Re: [PATCH 0/2] MMIO emulation fixes
Date: Wed, 29 Aug 2018 13:00:52 +0200
Message-ID: <20180829110052.GC31376@aepfle.de>
References: <fdf19f7d-1b92-a9c0-3602-b1c9807bf610@citrix.com>
 <a735b4359ccc4b278330204d9790c6ac@AMSPEX02CL03.citrite.net>
 <5B6DAF9F02000078001DD040@prv1-mh.provo.novell.com>
 <e2f77af0b2394b8f859a1f2dc1a91797@AMSPEX02CL03.citrite.net>
 <5B6DB69D02000078001DD06A@prv1-mh.provo.novell.com>
 <eaab5a73-2910-7fb6-e1fc-08537e63088c@citrix.com>
 <92ca69e5-98b1-61e4-817a-3868f829471a@citrix.com>
 <5B712A3502000078001DD514@prv1-mh.provo.novell.com>
 <20180829103614.GA31376@aepfle.de>
 <75009cae-1c9b-65d9-8269-497f94469983@citrix.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============9071230856918192320=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=ygmg=lm=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1fuyDa-0002AV-Tu
 for xen-devel@lists.xenproject.org; Wed, 29 Aug 2018 11:00:59 +0000
In-Reply-To: <75009cae-1c9b-65d9-8269-497f94469983@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Paul Durrant <paul.durrant@citrix.com>, george.dunlap@citrix.com, Jan Beulich <JBeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org


--===============9071230856918192320==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="jousvV0MzM2p6OtC"
Content-Disposition: inline


--jousvV0MzM2p6OtC
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Wed, Aug 29, Andrew Cooper wrote:

> Architecturally speaking, handing #MC back is probably the closest we
> can get to sensible behaviour, but it is still a bug that Linux is
> touching the ballooned out page in the first place.

Well, the issue is that a read crosses a page boundary. If that would be
forbidden, load_unaligned_zeropad() would not exist. It can not know
what is in the following page. And such page crossing happens also in
the unballooned case. Sadly I can not trigger the reported NFS bug
myself. But it can be enforced by ballooning enough pages so that an
allocated readdir reply eventually is right in front of a ballooned
page.

Olaf

--jousvV0MzM2p6OtC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCW4Z84QAKCRBdQqD6ppg2
fp25AJ9W9FgX9595utSXicONFLK6L88fWwCdEUnP48iIKisj450mLwRDnUKpI9o=
=IrIQ
-----END PGP SIGNATURE-----

--jousvV0MzM2p6OtC--


--===============9071230856918192320==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============9071230856918192320==--
