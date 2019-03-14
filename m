From: Olaf Hering <olaf@aepfle.de>
Subject: Re: [PATCH v13] tolerate jitter in cpu_khz calculation
 to avoid TSC emulation
Date: Thu, 14 Mar 2019 15:41:55 +0100
Message-ID: <20190314154155.6cfc6690.olaf@aepfle.de>
References: <20190313082855.14106-1-olaf@aepfle.de>
 <5C88CAEF020000780021DFA6@prv1-mh.provo.novell.com>
 <20190314145003.36695ef4.olaf@aepfle.de>
 <cfd355b6-da0b-7e02-a484-cc8476a36198@suse.com>
 <20190314151416.625d8cfa.olaf@aepfle.de>
 <38e61ca1-7390-a942-8b41-eacca522bcb1@suse.com>
 <20190314153322.2fcf6808.olaf@aepfle.de>
 <5C8A66E0020000780021EBD3@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2857956371759157719=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=6KDy=RR=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1h4RYW-0005yh-Cx
 for xen-devel@lists.xenproject.org; Thu, 14 Mar 2019 14:42:00 +0000
In-Reply-To: <5C8A66E0020000780021EBD3@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Juergen Gross <jgross@suse.com>, Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

--===============2857956371759157719==
Content-Type: multipart/signed; micalg=pgp-sha1;
 boundary="Sig_/PfbETla25_bN_cVxe=I6luf"; protocol="application/pgp-signature"

--Sig_/PfbETla25_bN_cVxe=I6luf
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Thu, 14 Mar 2019 08:36:16 -0600
schrieb "Jan Beulich" <JBeulich@suse.com>:

> Well, unless I'm misremembering you had dropped that functionality
> without anyone having asked to do so.

Yes, based on my view that an external clocksource has to be used if TSC
is the primary local clocksource.

I will double check what the concern was about v10.
The change for xen-tscmode(7) needs to be redone, at least.

So before I spam you guys with any more variants, I better ask if any furth=
er attempt would fly anyway.

Olaf

--Sig_/PfbETla25_bN_cVxe=I6luf
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCXIpoMwAKCRBdQqD6ppg2
fmdWAJ4++UdDv78biM87SlkqmSELRK8fNACdGldANC1JLhXgNcDCda2DVjmA3pA=
=UmGR
-----END PGP SIGNATURE-----

--Sig_/PfbETla25_bN_cVxe=I6luf--


--===============2857956371759157719==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============2857956371759157719==--
