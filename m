From: Olaf Hering <olaf@aepfle.de>
Subject: Re: [PATCH v13] tolerate jitter in cpu_khz calculation
 to avoid TSC emulation
Date: Thu, 14 Mar 2019 15:27:05 +0100
Message-ID: <20190314152705.074d9cb0.olaf@aepfle.de>
References: <20190313082855.14106-1-olaf@aepfle.de>
 <5C88CAEF020000780021DFA6@prv1-mh.provo.novell.com>
 <20190314145003.36695ef4.olaf@aepfle.de>
 <5C8A632F020000780021EB58@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7005445918298324762=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=6KDy=RR=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1h4RK9-0003hg-VU
 for xen-devel@lists.xenproject.org; Thu, 14 Mar 2019 14:27:10 +0000
In-Reply-To: <5C8A632F020000780021EB58@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

--===============7005445918298324762==
Content-Type: multipart/signed; micalg=pgp-sha1;
 boundary="Sig_/O=AcZoYx2lKnH16M5QMWyDX"; protocol="application/pgp-signature"

--Sig_/O=AcZoYx2lKnH16M5QMWyDX
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Thu, 14 Mar 2019 08:20:31 -0600
schrieb "Jan Beulich" <JBeulich@suse.com>:

> And again you makie it look as if PV wasn't also going through that
> same path. Yet all that's there at the top of the function is

I missed the '&&', read it as '||'.


Olaf

--Sig_/O=AcZoYx2lKnH16M5QMWyDX
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCXIpkuQAKCRBdQqD6ppg2
fnMLAJsFg1xv4EiPlwX2lafvSX5+Ou+SlwCeLKO+OVrigIUF0K/5Wz7NxCjzcGY=
=gyax
-----END PGP SIGNATURE-----

--Sig_/O=AcZoYx2lKnH16M5QMWyDX--


--===============7005445918298324762==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============7005445918298324762==--
