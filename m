From: Olaf Hering <olaf@aepfle.de>
Subject: Re: [PATCH v1] xen: creating debug info is optional
Date: Thu, 30 Aug 2018 17:59:05 +0200
Message-ID: <20180830175905.5a46e692.olaf@aepfle.de>
References: <20180830151054.30766-1-olaf@aepfle.de>
 <5B880C0302000078001E39A4@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6828192882952287801=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=ntoh=ln=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1fvPLr-0002yi-IX
 for xen-devel@lists.xenproject.org; Thu, 30 Aug 2018 15:59:20 +0000
In-Reply-To: <5B880C0302000078001E39A4@prv1-mh.provo.novell.com>
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

--===============6828192882952287801==
Content-Type: multipart/signed; micalg=pgp-sha1;
 boundary="Sig_/LIGDS_=DLOzSksSfp01w1=v"; protocol="application/pgp-signature"

--Sig_/LIGDS_=DLOzSksSfp01w1=v
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Thu, 30 Aug 2018 09:23:47 -0600
schrieb "Jan Beulich" <JBeulich@suse.com>:

> Reusing? It's been gone since 4.9, and ./INSTALL talks about it as
> a tool stack only thing.

It does not, it is in the general "make" section.
I do not see any valid reason to diverge further.

Olaf

--Sig_/LIGDS_=DLOzSksSfp01w1=v
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCW4gUSQAKCRBdQqD6ppg2
frUhAKCr/Gl7n0cYUg7tsH1M74BmuEDcVwCfacFa9uFiuTSW/9q/uD92ANE6G58=
=qulF
-----END PGP SIGNATURE-----

--Sig_/LIGDS_=DLOzSksSfp01w1=v--


--===============6828192882952287801==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============6828192882952287801==--
